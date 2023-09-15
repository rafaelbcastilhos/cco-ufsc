# Rafael B. Castilhos (20205642)
clc;
clear;

tmax = 100; # Tempo máximo em décimos de segundo
dt = 1;     # Incremento de tempo em décimos de segundo

global inputs;
global inputs = [0, 0];  # Aceleração em m/(s^2), ângulo em π.rad

function xdot = veiculoODE(x, t)
  k1 = 10;   # Ajuste da constante k1 para unidades em m/s^2
  k2 = 0.1;  # Ajuste da constante k2 para unidades em m/(s^2 * π.rad)
  global inputs;

  # Equações diferenciais ordinárias (ODEs)
  xdot(1) = x(3) * cos(x(4));  # Derivada da posição x (m/s)
  xdot(2) = x(3) * sin(x(4));  # Derivada da posição y (m/s)
  xdot(3) = inputs(1);         # Aceleração em m/(s^2)
  xdot(4) = k2 * inputs(2);    # Taxa de mudança de ângulo em rad/s
endfunction

function [timeNextEvent, nextEvent] = motorista(t, v)
  disp(v);
  v_max = 100 * 1000 / 3600;  # 100 Km/h convertido para m/s
  max_acceleration = v_max / 15;  # Maior aceleração possível para atingir 100 Km/h em 15 s
  max_steering_angle = pi/6;  # 30 graus à esquerda ou à direita

  # Lógica para determinar o próximo evento com base no tempo e na velocidade atual
  if t < 10
    timeNextEvent = 10;
    nextEvent = [max_acceleration / 2, 0];  # Aceleração em m/(s^2), ângulo em π.rad
  elseif t < 15
    timeNextEvent = 15;
    nextEvent = [0, -pi / 6];  # Aceleração em m/(s^2), ângulo em π.rad (30 graus à esquerda)
  elseif t < 20
    timeNextEvent = 20;
    nextEvent = [0, 0];  # Aceleração em m/(s^2), ângulo em π.rad (Posição neutra)
  elseif t < 25
    timeNextEvent = 25;
    nextEvent = [max_acceleration, pi / 9];  # Aceleração em m/(s^2), ângulo em π.rad (25 graus à direita)
  elseif t < 40
    timeNextEvent = 40;
    nextEvent = [0, 0];  # Aceleração em m/(s^2), ângulo em π.rad (Posição neutra)
  elseif v >= 33.33  # 120 Km/h convertido para m/s
    timeNextEvent = t + 1;  # Aguarde 1 segundo antes de mudar a direção e começar a desacelerar
    nextEvent = [0, 0];  # Aceleração em m/(s^2), ângulo em π.rad (Posição neutra)
  else
    timeNextEvent = 100;
    nextEvent = [0, 0];  # Aceleração em m/(s^2), ângulo em π.rad (Posição neutra)
  endif
endfunction

function valid = validate_inputs(acceleration, angle)
  v_max = 100 * 1000 / 3600;  # 100 Km/h convertido para m/s
  max_acceleration = v_max / 15;  # Maior aceleração possível para atingir 100 Km/h em 15 s
  max_steering_angle = pi / 6;  # 30 graus à esquerda ou à direita

  # Verifica se as entradas (aceleração e ângulo) estão dentro dos limites válidos
  valid = (acceleration >= 0) && (acceleration <= max_acceleration) && (angle >= -max_steering_angle) && (angle <= max_steering_angle);
endfunction

# 100, 100 é a posição inicial
initialState = [100, 100, 0, 0];  # [pos x (m), pos y (m), velocidade (m/s), direção (π.rad)]
results = [0, initialState, inputs(1), inputs(2)];  # Tempo, Estado, Aceleração, Ângulo

t = 0;
do
  [timeNextEvent, nextEvent] = motorista(t, initialState(3));

  # Verifica se as entradas do motorista são válidas antes de continuar
  if validate_inputs(nextEvent(1), nextEvent(2))
    tcont = linspace(t, timeNextEvent, (timeNextEvent - t) / dt);
    x = lsode("veiculoODE", initialState, tcont);

    # Coleta de resultados
    partial = [tcont'(2:end), x(2:end,:), inputs(1) * ones(size(x, 1) - 1, 1), inputs(2) * ones(size(x, 1) - 1, 1)];
    results = [results; partial];

    # Avanço no tempo de simulação
    t = timeNextEvent;
    inputs = nextEvent;
    initialState = x(end,:);
  else
    t = tmax;  # Termina a simulação se as entradas não forem válidas
  endif
until t >= tmax;

disp("RESULTS:"), disp(results)

# Gráfico dos estados ao longo do tempo
subplot(2, 1, 1);
plot(results(:,1), results(:,2), "-b", results(:,1), results(:,3), "-r")
legend("Posição x (m)", "Posição y (m)")
title("Posição do Veículo")

# Gráfico das entradas e saídas do modelo do veículo
subplot(2, 1, 2);
plot(results(:,1), results(:,4), "-b", results(:,1), results(:,5) * 100, "-r")
legend("Aceleração (m/s^2)", "Ângulo (π.rad)")
title("Entradas e Saídas do Modelo do Veículo")

subplot(2, 1, 3);
plot(results(:,1), results(:,2), "-b", results(:,1), results(:,3), "-r", results(:,1), results(:,4), "-g", results(:,1), results(:,5) * 100, "-c")

