# inputs = [ velocity , angule ]
# state = [ pos x, pos y, direction ]
# output = [ pos x, pos y ]
tmax = 100;
dt = 0.5;

function [nextState, outputs] = veiculo(inputs, currentState)
  k1 = 1;
  k2 = 0.1;
  dt = 0.5;
  # nextState logic
  nextState(1) = currentState(1) + k1*inputs(1)*dt * k2*sin(currentState(3));
  nextState(2) = currentState(2) + k1*inputs(1)*dt * k2*cos(currentState(3));
  nextState(3) = currentState(3) + k2*inputs(2)*dt;
  # output logic
  outputs = currentState;
endfunction

function xdot = veiculoODE(x, t)
  k1 = 1;
  k2 = 0.1;
  inputs = [1, 0.5];
  # ODEs
  xdot(1) = k1*inputs(1) * k2*sin(x(3));
  xdot(2) = k1*inputs(1) * k2*cos(x(3));
  xdot(3) = k2*inputs(2);
endfunction

inputs = [1, 0.5];
initialState = [1, 1, 0];
currentState = initialState;
outputs = initialState;
results = zeros(1,3);

t = 0;
while t < tmax
  #inputs = motorista(inputs, t);
  [nextState, nextOutputs] = veiculo(inputs, currentState);
  results(end+1,:) = outputs;
  t = t + dt;
  currentState = nextState;
  outputs = nextOutputs;
endwhile

t = linspace (0, tmax, tmax/dt);
x=lsode("veiculoODE", initialState, t);#
#m = [t', results(3:end,1), results(3:end,2), results(3:end,3), x(:,1), x(:,2), x(:,3)]

plot(results(2:end,1) , results(2:end,2), "-b", x(2:end,1) , x(2:end,2), "-r");
xlabel ("x");;
ylabel ("y");
#axis([-5 5 0 20])


