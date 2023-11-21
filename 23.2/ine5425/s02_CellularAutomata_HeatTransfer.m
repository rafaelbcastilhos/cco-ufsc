
tmax = 300;  % seconds
global dt = 0.01; % seconds
global dimX = 10; % cm
global dimY = 10; % cm

tempMin = 10; %ºC
tempMax = 50; %ºC
T = tempMax;
global Tr = tempMin
global heatTranfeferRate = -0.02;

lattice =zeros(dimX, dimY) + tempMax;

function nextState = applyLocalRule(lattice, x,y)
  global Tr;
  global dt;
  global heatTranfeferRate;

  T = lattice(x,y);

  diffT = heatTranfeferRate*(T - Tr)*dt;
  T = T + diffT;

  nextState = T;
endfunction

clf;
colormap ("default");

for t = 0:dt:tmax
  %t
  if (mod(t,1)==0)
    [Fx,Fy] = gradient(lattice);
    handler = surf (lattice, Fx+Fy);
    title(strcat("Time: ", num2str(t)));
    %shading interp;
    refresh;
    pause;
  endif
  for x = 1:dimX
    for y= 1:dimY
      nextState = applyLocalRule(lattice, x,y);
      nextLattice(x,y) = nextState;
    endfor
  endfor
  lattice = nextLattice;
endfor


