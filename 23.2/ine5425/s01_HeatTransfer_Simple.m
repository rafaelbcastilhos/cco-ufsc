
tmax = 300;  % seconds
tempMin = 10; %ºC
tempMax = 50; %ºC
T = tempMax;
dt = 0.01; % seconds
Tr = tempMin
heatTranfeferRate = -0.02;

tempPlot = linspace(0, tmax, tmax/dt);
i=1;
for t = 0:dt:tmax
  diffT = heatTranfeferRate*(T - Tr)*dt;
  T = T + diffT;
  tempPlot(i) = T;
  i++;
  %if (mod(t,1)==0)
  %  t, T
  %endif
endfor
plot(tempPlot);

