% clear global variables
clear all

%% PARAMETERS TO SET

% space
% total: 8m x 8m
dimX = 8 * 100 % cm (8m)
dimY = 8 * 100 % cm (8m)
% space discreization
cellDimX = 10 % cm
cellDimY = 10 % cm

% time
totalTime = 60 * 60 % s (60min)
deltaTime = 1 % s
showConfigurationEvery = 10 % s;

% physical constants
	% dimensions:
	% 1: material (int 1=air , 2=wall, 3=air conditioner, 4=...
	% 2: tempetrature (double form 0ºC to 50ºC)
	% 3: x component for air flow velocity (double from -10cm/s to 10cm/s)
	% 4: y component for air flow velocity (double from -10cm/s to 10cm/s)

	% materials 1=air , 2=wall, 3=air conditioner, ...
global heatTransferRate = [0.4, 0.04, 1.0] % heat transfer rate for materials [ 1=air , 2=wall, 3=air conditioner, 4=...  ]
global externalTemperature = 40 % ºC
global airConditionerTemperature = 15  % ºC
global maxAirFlowComponent = 10 % cm/s

function setParameters()
	global MATERIAL;
	global TEMPERATURE;
	global XFLOWCOMPONENT;
	global YFLOWCOMPONENT;

	% OTHER PARAMETERS TO SET
	global dimensionToShow = TEMPERATURE
	global pauseWhenShow = 0
endfunction;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

global extremeValues = [1, 3;
						airConditionerTemperature, externalTemperature;
						-maxAirFlowComponent, maxAirFlowComponent;
						-maxAirFlowComponent, maxAirFlowComponent];

function setConstants()
	% dimension constants
	global MATERIAL = 1;
	global TEMPERATURE = 2;
	global XFLOWCOMPONENT = 3;
	global YFLOWCOMPONENT = 4;
	% material constants
	global AIR = 1;
	global WALL = 2;
	global AIRCONDITIONER = 3;
	% extreme constants
	global MINIMUM = 1;
	global MAXIMUM = 2;
endfunction


function currentLattice = createInitialConfiguration(numCellsX, numCellsY, cellDimX)
	% dimension constants
	global MATERIAL;
	global TEMPERATURE;
	global XFLOWCOMPONENT;
	global YFLOWCOMPONENT;
	% material constants
	global AIR;
	global WALL;
	global AIRCONDITIONER;
	% extreme constants
	global MINIMUM;
	global MAXIMUM;
	global extremeValues;

	global airConditionerTemperature;

	% lattice dimensions: (x, y, physicalQuantities),
	% where physicalQuantities are:
	% 1: material (int 1=air , 2=wall, 3=air conditioner, 4=...
	% 2: tempetrature (double form 0ºC to 50ºC)
	% 3: x component for air flow velocity (double from -10cm/s to 10cm/s)
	% 4: y component for air flow velocity (double from -10cm/s to 10cm/s)

	% Create the lattice for all dimensions filled with zeros
	currentLattice = zeros(numCellsX+1, numCellsY, 4);

	% lattice itself is is range ( 2:numCellsX-1 , 2:numCellsY-1)  (assuming radius 1 neighboorhood is used!)
	% cells at (1,..) , (numCellsX,..) , (..,1) , (..,numCellsY) are incompleted neighboor cells surrounding lattice

	% here it cames the odd stuff:
	% the weird "+1" in "(numCellsX+1, ",Now comes the weird thing: The "" that creates an entire column in dimension X,
	% plus the additional column itself to complete any radius 1 neighborhood, has the following function:
	% The color gradient of the lattice depends on the current values of the cells, not on a fixed threshold.
	% Thus, if the smallest value of a cell is 0 and the largest is 100, the color scale is distributed to values from 0 to 100.
	% However, if the values are changing and at a given moment the smallest value is and the highest value is 55,
	% the entire color scale will be distributed only in this range of 45 to 55, and this is not visually cool.
	% So in this additional column that we don't use for anything in the simulation (because it's beyond the edge of the lattice)
	% we put extreme fixed values to keep fixed the range of values in which the colors will be distributed. :-)

	% Probabily only temperature will be show, but I defined fixed extreme valoues for all dimensions
	currentLattice(numCellsX+1, MINIMUM, MATERIAL) = AIR;            % fixed minimum material
	currentLattice(numCellsX+1, MAXIMUM:numCellsY, MATERIAL) = AIRCONDITIONER; % fixed maximum material
	global extremeValues;
	for dimension = 1:4
		currentLattice(numCellsX+1, MINIMUM, dimension) = extremeValues(dimension,1);
		currentLattice(numCellsX+1, MAXIMUM:numCellsY, dimension) = extremeValues(dimension,2);
	endfor

	%
	% MATERIAL
	%

	% Finally init the lattice for all dimensions
	% fill space with material AIR
	currentLattice(1:numCellsX, :, MATERIAL) = AIR;
	% draw house walls
	houseSpacingFromExterior = 20; % cm (20cm)
	houseSpacingFromExterior = ceil(houseSpacingFromExterior / cellDimX); % convert fixed space to cells
	houseXleft = 2+houseSpacingFromExterior;
	houseXright = numCellsX-2-houseSpacingFromExterior;
	houseYtop = 2+houseSpacingFromExterior;
	houseYbottom = numCellsY-2-houseSpacingFromExterior;
	% exterior walls
	for x = houseXleft : houseXright
		if (x<11 || x>19) % open door/windows
			currentLattice(x,houseYtop, MATERIAL) = WALL;
		endif
		if ((x<21 || x>29) && (x<41 || x>49) && (x<71 || x>75)) % open door/windows
			currentLattice(x,houseYbottom, MATERIAL) = WALL;
		endif
	endfor
	for y = houseYtop : houseYbottom
		currentLattice(houseXleft,y, MATERIAL) = WALL;
		if (y<21 || y>29)
			currentLattice(houseXright,y, MATERIAL) = WALL;
		endif
	endfor
	% internal vertical walls
	for x = houseXleft : houseXright
		if ((x<11 || x>19) && (x<41 || x>49)) % open door/windows
			currentLattice(x,49, MATERIAL) = WALL;
		endif;
		if ((x<31 || x>39) && (x<61 || x>69)) % open door/windows
			currentLattice(x,41, MATERIAL) = WALL;
		endif;
	endfor
	% internal horizontal walls
	for y = houseYtop : houseYbottom
		if (y>49)
			currentLattice(31,y, MATERIAL) = WALL;
			if (y<52 || y>60)
				currentLattice(61,y, MATERIAL) = WALL;
			endif
		endif
		if (y<42)
			currentLattice(43,y, MATERIAL) = WALL;
		endif
	endfor

	%
	% TEMPERATURE
	%

	global externalTemperature;
	for x = 1:numCellsX
		for y = 1:numCellsY
			if (x==1 || x==numCellsX || y==1 || y==numCellsY) % boundary: fixed bound with state = externalTemperature
				currentLattice(x,y, TEMPERATURE) = externalTemperature;
			elseif (x<=houseXleft || x>=houseXright || y<=houseYtop || y>=houseYbottom) % outside the house the temperature is close to the externalTemperature
				currentLattice(x,y, TEMPERATURE) = externalTemperature - rand()*3;
			else % inside the house is hot, but not as much as the exterior
				currentLattice(x,y, TEMPERATURE) = externalTemperature - 9 + rand()*3;
			endif
			if (currentLattice(x,y, MATERIAL) == WALL)
				currentLattice(x,y, TEMPERATURE) = externalTemperature - 5 + rand()*2;
			endif
		endfor
	endfor

	%
	% AIR FLOW
	%
	for x = 1:numCellsX
		for y = 1:numCellsY
			if (currentLattice(x,y, MATERIAL) == WALL)
				currentLattice(x,y, XFLOWCOMPONENT) = 0;
				currentLattice(x,y, YFLOWCOMPONENT) = 0;
			else
				% X componet
				valueX = (extremeValues(XFLOWCOMPONENT,MINIMUM)-extremeValues(XFLOWCOMPONENT,MAXIMUM)) * ( (x-1)/(numCellsX-1)) + extremeValues(XFLOWCOMPONENT,MAXIMUM);
				currentLattice(x,y, XFLOWCOMPONENT) = valueX;
				% Y componet
				valueY = (extremeValues(YFLOWCOMPONENT,MINIMUM)-extremeValues(YFLOWCOMPONENT,MAXIMUM)) * ( (y-1)/(numCellsY-1)) + extremeValues(YFLOWCOMPONENT,MAXIMUM);
				currentLattice(x,y, YFLOWCOMPONENT) = valueY;
			endif
		endfor
	endfor

	% And now I will add the blessing air conditioner (wich will overrite all other dimensions, since it is a magic portal to the multiverse)

	% position 1: at corridor, on the houseXleft position
	for y = 43:47
		currentLattice(houseXleft,y, MATERIAL) = AIRCONDITIONER;
		currentLattice(houseXleft,y, TEMPERATURE) = airConditionerTemperature; % always turned on
		% the air flow depends on the air conditioner orientation
		% in this case it is suposed to cold the east side (<x)
		currentLattice(houseXleft,y, XFLOWCOMPONENT) = extremeValues(XFLOWCOMPONENT,MAXIMUM);
		currentLattice(houseXleft,y, YFLOWCOMPONENT) = 0;
	endfor

	% position 2: at corridor, on the houseXright position
	for y = 43:47
		currentLattice(houseXright,y, MATERIAL) = AIRCONDITIONER;
		currentLattice(houseXright,y, TEMPERATURE) = airConditionerTemperature; % always turned on
		% the air flow depends on the air conditioner orientation
		% in this case it is suposed to cold the east side (>x)
		currentLattice(houseXright,y, XFLOWCOMPONENT) = extremeValues(XFLOWCOMPONENT,MINIMUM);
		currentLattice(houseXright,y, YFLOWCOMPONENT) = 0;
	endfor

endfunction

function [xneig, yneig] = getNeighboor(x,y)
  global dimX;
  global dimY;
  global cellDimX;
  global cellDimY;
  numCellsX = ceil(dimX / cellDimX) + 2; % +2 = add extra boundary cells
	numCellsY = ceil(dimY / cellDimY) + 2;
  %adiabatic
  if (x<1)
    xneig=1;
  else
    if (x>numCellsX)
      xneig = numCellsX;
    else
      xneig = x;
    endif
  endif
  if (y<1)
    yneig=1;
  else
    if (y>numCellsY)
      yneig = numCellsY;
    else
      yneig = y;
    endif
  endif
endfunction

function nextCellState = applyLocalRule(simulatedTime, deltaTime, currentLattice, x, y)
  global MATERIAL;
	global TEMPERATURE;
	global XFLOWCOMPONENT;
	global YFLOWCOMPONENT;
	global AIR;
	global WALL;
	global AIRCONDITIONER;

	global heatTransferRate

	currentCellState = currentLattice(x,y, :);
	nextCellState = currentCellState;

	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	% THIS IS THE MAIN FUNCTION TO BE IMPLEMENTED.  %
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

	%
	% MATERIAL
	%
	% Well, materials remains constant in this universe. Walls will be walls, air will be air and son on
	thisMaterial = currentLattice(x,y, MATERIAL);

	%
	% TEMPERATURE
	%
  sumTemp = 0;
  numNeigs = 9;
  for xx = x-1:x+1
    for yy = y-1:y+1
        [xneig, yneig] = getNeighboor(xx,yy);
        sumTemp += currentLattice(xneig,yneig,TEMPERATURE);
    endfor
  endfor
  neigTemp = sumTemp / numNeigs;

	if (thisMaterial == AIR)
		% COMPLETE HERE !!
    diff = (neigTemp-currentCellState(TEMPERATURE)) * heatTransferRate(AIR) * deltaTime;
	elseif (thisMaterial == WALL)
		% COMPLETE HERE !!
    diff = (neigTemp-currentCellState(TEMPERATURE)) * heatTransferRate(WALL) * deltaTime;
	elseif (thisMaterial == AIRCONDITIONER)
		% COMPLETE HERE !!
    diff = 0;
	%elseif (thisMaterial == DOOR)
		% COMPLETE HERE !!
	endif
  nextCellState(TEMPERATURE) = currentCellState(TEMPERATURE) + diff;

	%
	% AIR FLOW
	%
  sumFlowX = 0;
  sumFlowY = 0;
	if (thisMaterial == AIR)
		% COMPLETE HERE !!
    for xx = x-1:x+1
        for yy = y-1:y+1
          [xneig, yneig] = getNeighboor(xx,yy);
          sumFlowX += currentLattice(xneig,yneig,XFLOWCOMPONENT);
          sumFlowY += currentLattice(xneig,yneig,YFLOWCOMPONENT);
        endfor
    endfor
    neigFlowX = sumFlowX / numNeigs;
    neigFlowY = sumFlowY / numNeigs;
    nextCellState(XFLOWCOMPONENT) = neigFlowX;
    nextCellState(YFLOWCOMPONENT) = neigFlowY;
	elseif (thisMaterial == WALL)
		% COMPLETE HERE !!
    nextCellState(XFLOWCOMPONENT) = 0;
    nextCellState(YFLOWCOMPONENT) = 0;
	elseif (thisMaterial == AIRCONDITIONER)
		% COMPLETE HERE !!
    for xx = x-1:x+1
        for yy = y-1:y+1
          [xneig, yneig] = getNeighboor(xx,yy);
          sumFlowX += currentLattice(xneig,yneig,XFLOWCOMPONENT);
          sumFlowY += currentLattice(xneig,yneig,YFLOWCOMPONENT);
        endfor
    endfor
    neigFlowX = sumFlowX / numNeigs;
    neigFlowY = sumFlowY / numNeigs;
    nextCellState(XFLOWCOMPONENT) = neigFlowX;
    nextCellState(YFLOWCOMPONENT) = neigFlowY;
	%elseif (thisMaterial == DOOR)
		% COMPLETE HERE !!
	endif

endfunction


function nextLattice = applyGlobalRule(simulatedTime, deltaTime, currentLattice, numCellsX, numCellsY)
	nextLattice = currentLattice;
	for x = 2:numCellsX-1
		for y = 2:numCellsY-1
			nextCellState = applyLocalRule(simulatedTime, deltaTime, currentLattice, x, y);
			nextLattice(x,y,:) = nextCellState;
		endfor
	endfor
endfunction

function showCurrentConfiguration(simulatedTime, currentLattice, numCellsX, numCellsY, myColorMap)
  global MATERIAL;
	global TEMPERATURE;
	global XFLOWCOMPONENT;
	global YFLOWCOMPONENT;
	% extreme constants
	global MINIMUM;
	global MAXIMUM;

	% create image
	global extremeValues;
	global dimensionToShow;
	colormap(myColorMap);
	if (dimensionToShow==XFLOWCOMPONENT)
		transparency = 0.25;
	else
		transparency = 0.5;
	endif
    handler = surf (currentLattice(1:numCellsX+1, 1:numCellsY, dimensionToShow), 'facealpha', transparency,'edgealpha', 1);
	if (dimensionToShow==XFLOWCOMPONENT)
	%	hold on
	%	handler = surf (currentLattice(1:numCellsX+1, 1:numCellsY, YFLOWCOMPONENT), 'facealpha', transparency/2,'edgealpha', 1);
	endif
	hold on
	surf (currentLattice(1:numCellsX+1, 1:numCellsY, TEMPERATURE),'facealpha', 0.5);%, 'edgealpha', 1);

	% define title and axis
    title(strcat("Simulated Time : ", num2str(simulatedTime))); %  SumVel ",num2str(sumVel)));
    xlabel("Y");
    ylabel("X");
    axis([1 numCellsX 1 numCellsY extremeValues(dimensionToShow,MINIMUM) extremeValues(dimensionToShow,MAXIMUM)]);  % 1 to numCellsX shows the boundary cells
    %axis([2 numCellsX-1 2 numCellsY-1 extremeValues(TEMPERATURE,1) extremeValues(TEMPERATURE,2)]); % 2 to numCellsX-1 hides the boundary cells

	% define grids
	grid on;
    set(gca, 'xtick', 1:1:numCellsX);
    set(gca, 'ytick', 1:1:numCellsY);
    set(gca, 'ztick', extremeValues(dimensionToShow,MINIMUM):1:extremeValues(dimensionToShow,MAXIMUM));
	% last image adjustments
	shading("flat"); % "flat" "faceted" "interp"
	view(2);
	refresh;
	%%%%
	% save current configuration
	% ... you students please do that if you want, ... and load it automatically if simulation crashes
	% saving and loading configurations (current state of the model) is very usefull for looonnnggg simulations
	%
	global pauseWhenShow;
	if (pauseWhenShow != 0)
		disp("Paused. Press enter to continue.");
		pause;
	endif;
endfunction


function myColorMap = createColorMap()
	gradients = 20;
	step = 1/gradients;
	lastValue = [0.0, 0.0, 1.0]; % pure blue as minimum
	myColorMap = repmat(lastValue,3*gradients,1);
	index = 1;
	for i=1:gradients; % transition from blue to green
		myColorMap(index,:) = lastValue;
		lastValue(2) = lastValue(2) + step;
		lastValue(3) = abs(lastValue(3) - step);
		index += 1;
	endfor
	lastValue = [0.0, 1.0, 0.0];
	for i=1:gradients; % transition from green to yellow
		myColorMap(index,:) = lastValue;
		lastValue(1) = lastValue(1) + step;
		index += 1;
	endfor
	lastValue = [1.0, 1.0, 0.0];
	for i=1:gradients; % transition from yellow to pure red (as maximum)
		myColorMap(index,:) = lastValue;
		lastValue(2) = abs(lastValue(2) - step);
		index += 1;
	endfor
endfunction


function simulate(totalTime, deltaTime, dimX, dimY, cellDimX, cellDimY, showConfigurationEvery)
	display("\nRUNNING SIMULATION\n");
	% cell discretization
	numCellsX = ceil(dimX / cellDimX) + 2; % +2 = add extra boundary cells
	numCellsY = ceil(dimY / cellDimY) + 2;
	%
	setConstants();
	setParameters();
	%
	clf;
	myColorMap = createColorMap();
	% setup inicial configuration
	currentLattice = createInitialConfiguration(numCellsX, numCellsY, cellDimX);
	% main simulation loop
	for simulatedTime = 0:deltaTime:totalTime
		if (mod(simulatedTime, showConfigurationEvery)==0)
			showCurrentConfiguration(simulatedTime, currentLattice, numCellsX, numCellsY, myColorMap);
		endif
		nextLattice = applyGlobalRule(simulatedTime, deltaTime, currentLattice, numCellsX, numCellsY);
		currentLattice = nextLattice;
  endfor
endfunction


simulate(totalTime, deltaTime, dimX, dimY, cellDimX, cellDimY, showConfigurationEvery)
