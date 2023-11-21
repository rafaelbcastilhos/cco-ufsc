
tmax = 300;  % seconds
global dt = 0.01; % seconds
global dimX = 10; % cm
global dimY = 10; % cm

tempMin = 10; %ºC
tempMax = 50; %ºC
global heatTranfeferRate = 0.02;

lattice = rand(dimX, dimY)*(tempMax-tempMin) + tempMin;

%global state = struct(\
%        "temperature", 30.0,
%        "transferRate", 0.1,
%        "xVelocity", 0.0,
%        "yVelocity", 0.0
%      );
%global lattice(1:dimX, 1:dimY) = state;

function [xneig, yneig] = getNeighboor(lattice, x,y, dimX, dimY)
  global dimX;
  global dimY;
  %adiabatic
  if (x<1)
    xneig=1;
  else
    if (x>dimX)
      xneig = dimX;
    else
      xneig = x;
    endif
  endif
  if (y<1)
    yneig=1;
  else
    if (y>dimY)
      yneig = dimY;
    else
      yneig = y;
    endif
  endif
endfunction

function nextState = applyLocalRule(lattice, x,y)
  global dimX;
  global dimY;
  global heatTranfeferRate;
  global dt;
  % moore r=1
  sumTemp = 0;
  numNeigs = 9;
  for xx = x-1:x+1
    for yy = y-1:y+1
        [xneig, yneig] = getNeighboor(lattice, xx,yy);
        sumTemp += lattice(xneig,yneig);
    endfor
  endfor
  neigTemp = sumTemp / numNeigs;
  diff = (neigTemp-lattice(x,y)) * heatTranfeferRate * dt;
  nextState = lattice(x,y) + diff;
  %x,y,lattice(x,y), neigTemp, diff, nextState
endfunction

clf;
colormap ("default");

for t = 0:dt:tmax
  %t
  if (mod(t,0.1)==0)
    [Fx,Fy] = gradient(lattice);
    handler = surf (lattice, Fx+Fy);
    title(strcat("Time: ", num2str(t)));
    %shading interp;
    refresh;
  endif
  for x = 1:dimX
    for y= 1:dimY
      nextState = applyLocalRule(lattice, x,y);
      nextLattice(x,y) = nextState;
    endfor
  endfor
  lattice = nextLattice;
endfor


