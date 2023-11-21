
tmax = 300;  % seconds
tempMin = 10; %�0�2C
tempMax = 50; %�0�2C
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

