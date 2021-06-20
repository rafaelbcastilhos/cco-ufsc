library ieee;
use ieee.std_logic_1164.all;

entity temporizacao is
    port(
        Total_logic_elements: out integer;
        Total_registers: out integer;
        Device: out string;
        Input_port: out string;
        Output_port: out string;
        Max_Propagation_delay: out real;
        a_65ns: out integer;
        b_65ns: out integer;
        soma_65ns: out integer;
        cout_65ns: out std_logic
    );
end entity;

architecture res of temporizacao is
begin
    -- TROQUE OS VALORES ABAIXO COM AQUELES QUE APARECEM NO SUMARIO DO RELATORIO DE SINTESE DO QUARTUS
    Total_logic_elements <= 9;
    Total_registers <= 0;
    Device <= "EP4CE6E22C6";
    -- TROQUE OS VALORES ABAIXO COM AQUELES QUE APARECEM NO RELATORIO 'DATASHEET" -> "REPORT DATASHEET" DO "TIMING ANALYZER"
    -- NAQUELE RELATORIO, ORDENE AS COLUNAS RR, RF, ETC ATEH ENCONTRAR O VALOR DA MAIOR LATENCIA, ENTAO COPIE OS VALORES DAQUELA LINHA ABAIXO
    Input_port <= "b[1]";
    Output_port <= "soma[5]";
    Max_Propagation_delay <= 9.910;
    -- TROQUE OS VALORES ABAIXO COM OS QUE APARECEM NO DIAGRAMA DE FORMAS DE ONDA DO MODELSIM APOS SIMULACO DO SOMADOR (MESMO CODIGO COMPILADO NO QUARTUS)
    -- AO ABRIR O MODELSIM, ESCOLHA TIMING MODEL "SLOW -6 1.2V 85 MODEL" (USE O MESMO AO SELECIONAR O ARQUIVO .SDO NA ABA SDF)
    -- SIMULE USANDO O ARQUIVO TCL APRESENTADO EM AULA E COPIE OS VALORES DOS SINAIS ABAIXO NO INSTANTE 65 NS NA SIMULACAO
    a_65ns <= 255;
    b_65ns <= 1;
    soma_65ns <= 255;
    cout_65ns<= 1;
end architecture;
