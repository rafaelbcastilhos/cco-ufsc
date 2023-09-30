/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   Smart_Dummy.cpp
 * Author: rlcancian
 * 
 * Created on 3 de Setembro de 2019, 18:34
 */

#include "Smart_Dummy.h"

// you have to included need libs

// GEnSyS Simulator
#include "../../../../kernel/simulator/Simulator.h"

// Model Components
#include "../../../../plugins/components/Create.h"
#include "../../../../plugins/components/Clone.h"
#include "../../../../plugins/components/Wait.h"
#include "../../../../plugins/components/Dispose.h"
#include "../../../TraitsApp.h"

Smart_Dummy::Smart_Dummy() {
}

/**
 * This is the main function of the application. 
 * It instanciates the simulator, builds a simulation model and then simulate that model.
 */
int Smart_Dummy::main(int argc, char** argv) {
	Simulator* genesys = new Simulator();
	genesys->getTracer()->setTraceLevel(TraitsApp<GenesysApplication_if>::traceLevel);
	setDefaultTraceHandlers(genesys->getTracer());
	PluginManager* plugins = genesys->getPlugins();
	plugins->autoInsertPlugins("autoloadplugins.txt");
	Model* model = genesys->getModels()->newModel();
	// create model
	Create* create1 = plugins->newInstance<Create>(model);
    create1->setTimeBetweenCreationsExpression("1", Util::TimeUnit::hour);
    Clone* clone1 = plugins->newInstance<Clone>(model);
    clone1->setNumClonesExpression("1");
    create1->getConnections()->insert(clone1);

    Wait* wait1 = plugins->newInstance<Wait>(model);
    wait1->setWaitType(Wait::WaitType::WaitForSignal);

    SignalData* signalData1 = plugins->newInstance<SignalData>(model);
    Queue* queue1 = plugins->newInstance<Queue>(model, "filaDoBuffer");
    wait1->setSignalData(signalData1);
    wait1->setQueue(queue1);

    clone1->getConnections()->insert(wait1);
    Variable* var1 = plugins->newInstance<Variable>(model, "tamBuffer");
    var1->setInitialValue(5);
    Decide* decide1 = plugins->newInstance<Decide>(model);
    decide1->getConditions()->insert("nq(filaDoBuffer) == tamBuffer");

    clone1->getConnections()->insert(decide1);

    Signal* signal1 = plugins->newInstance<Signal>(model);
    signal1->setLimitExpression("1");
    signal1->setSignalData(signalData1);
    decide1->getConditions()->insert(signal1);
    Dispose* dispose1 = plugins->newInstance<Dispose>(model);
    dispose1->setReportStatistics(true);
    wait1->getConnections()->insert(dispose1);

    Dispose* dispose2 = plugins->newInstance<Dispose>(model);
    dispose2->setReportStatistics(false);
    signal1->getConnections()->insert(dispose2);

    ModelSimulation *simulation = model->getSimulation();
    simulation->setNumberOfReplications(5);
    simulation->setReplicationLength("30", Util::TimeUnit::hour);
    simulation->setReplicationReportBaseTimeUnit(Util::TimeUnit::hour);
    model->save("buffer.json");
    model->getSimulation()->start();
	delete genesys;
	return 0;
};

