# inputs = [ velocity , angule ]
# state = [ pos x, pos y, direction ]
# output = [ pos x, pos y ]
tmax = 100;
dt = 1;

global inputs;
global inputs = [0, 0];

function xdot = veiculoODE(x, t)
  k1 = 1;
  k2 = 0.1;
  global inputs;
  # ODEs
  xdot(1) = x(4) * cos(x(3)); % Derivada da posição x
  xdot(2) = x(4) * sin(x(3)); % Derivada da posição y
  xdot(3) = k2 * inputs(2); % Derivada do ângulo de direção
  xdot(4) = k1 * inputs(1); % Derivada da velocidade
endfunction

function [timeNextEvent, nextEvent] = motorista(t)
  if t<3
    timeNextEvent = 3;
    nextEvent = [1,0];
  elseif t<20
    timeNextEvent = 20;
    nextEvent = [1,2];
  elseif t<35
    timeNextEvent = 35;
    nextEvent = [0.5, 0];
  elseif t<60
    timeNextEvent = 60;
    nextEvent = [1 ,-2];
  elseif t<80
    timeNextEvent = 80;
    nextEvent = [2,0.2];
  elseif t<100
    timeNextEvent = 100;
    nextEvent = [0,0];
  endif
endfunction

initialState = [1, 2, 0.5];
currentState = initialState;
outputs = initialState;
results = [0, initialState, inputs];

t = 0;
do
  [timeNextEvent, nextEvent] = motorista(t);
  tcont = linspace (t, timeNextEvent, (timeNextEvent-t)/dt);
  x=lsode("veiculoODE", initialState, tcont);
  # collect
  part = [tcont'(2:end), x(2:end,:), inputs(1)*ones(size(x,1)-1,1), inputs(2)*ones(size(x,1)-1,1)];
  results = [results; part];  #; [tcont(end),0,0,0,0,0]
  #advance simulated time
  t = timeNextEvent;
  #disp("Is global"), isglobal("inputs")
  inputs = nextEvent;
  initialState = x(end,:);
#  disp("PART:"),disp(part)
 until t>=tmax;
  disp("RESULTS:"),disp(results)

# plot states over time
plot(results(:,1), results(:,2), "-b", results(:,1), results(:,3), "-r", results(:,1), results(:,5), "-k", results(:,1), results(:,6), "-c")
legend("x pos", "y pos", "velocity", "angle");
# plot coordinates
#plot(results(:,2), results(:,3))
