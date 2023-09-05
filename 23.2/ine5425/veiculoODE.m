# Definir constantes

min_velocity = 0;  % m/s
max_velocity = 33.33;  % m/s
max_steering_angle = deg2rad(30);  % Máximo ângulo de direção em radianos

# Função do modelo do veículo
function xdot = veiculoODE(x, t)
  k1 = 1;  % m/s
  k2 = 1;  % rad/m
  global inputs;

  acceleration = inputs(1);  % Aceleração fornecida pelo motorista (m/s²)

  # ODEs
  xdot(1) = k1 * (x(4) * k2 * sin(x(3)));  % Taxa de variação da velocidade em x (m/s)
  xdot(2) = k1 * (x(4) * k2 * cos(x(3)));  % Taxa de variação da velocidade em y (m/s)
  xdot(3) = k2 * x(5);  % Taxa de variação da direção (radianos/décimo de segundo)
  xdot(4) = acceleration;  % Taxa de variação da velocidade (m/s²)
  xdot(5) = 0;  % Taxa de variação da aceleração (zero, pois a aceleração é controlada pelo motorista)
endfunction

# Função do modelo lógico do motorista
function [timeNextEvent, nextEvent] = motorista(t)
max_acceleration = 27.78 / 15;  % m/s²
  if t < 1
    timeNextEvent = 1;
    acceleration = max_acceleration / 2;  % Metade da maior aceleração possível
    steering_angle = 0;  % Mantém a direção reta
  elseif t < 6
    timeNextEvent = 6;
    acceleration = 0;  % Para de acelerar
    steering_angle = deg2rad(-30);  % Gira o volante à esquerda (30 graus)
  elseif t < 11
    timeNextEvent = 11;
    acceleration = 0;  % Mantém a aceleração zero
    steering_angle = 0;  % Volta a direção à posição neutra (reta para frente)
  elseif t < 16
    timeNextEvent = 16;
    acceleration = max_acceleration;  % Acelera com a maior aceleração possível
    steering_angle = deg2rad(25);  % Gira o volante à direita (25 graus)
  elseif t < 20
    timeNextEvent = 20;
    acceleration = 0;  % Para de acelerar
    steering_angle = 0;  % Volta a direção à posição neutra (reta para frente)
  else
    timeNextEvent = 30;  % Simulação termina quando o veículo para
    acceleration = -max_acceleration / 4;  % Desaceleração a 1/4 da maior aceleração possível
    steering_angle = 0;  % Mantém a direção reta
  endif

  nextEvent = [acceleration, steering_angle];
endfunction

# Definir as condições iniciais
initialState = [100, 100, 0, 0, 0];  % Posição x, Posição y, Direção, Velocidade, Aceleração
currentState = initialState;
outputs = initialState;
results = [0, initialState, 0, 0];  % Tempo, Posição x, Posição y, Aceleração, Ângulo de Direção

# Inicializar variáveis globais
global inputs;
inputs = [0, 0];  % Aceleração e Ângulo de Direção

# Definir parâmetros de simulação
tmax = 100;
dt = 1;  % Décimos de segundo

# Simulação
t = 0;
do
  [timeNextEvent, nextEvent] = motorista(t);
  tcont = linspace(t, timeNextEvent, (timeNextEvent - t) / dt);
  x = lsode("veiculoODE", initialState, tcont);

  # Coletar resultados
  part = [tcont(2:end)', x(2:end, :), inputs(1) * ones(size(x, 1) - 1, 1), rad2deg(inputs(2)) * ones(size(x, 1) - 1, 1)];
  results = [results; part];

  # Avançar o tempo simulado
  t = timeNextEvent;
  inputs = nextEvent;
  initialState = x(end, :);
until t >= tmax;

# Gráfico da trajetória do veículo (Posição x vs. Posição y)
figure;
plot(results(:, 2), results(:, 3), "-b")
xlabel("Posição X (metros)")
ylabel("Posição Y (metros)")
title("Trajetória do Veículo")

# Gráfico das entradas e saídas ao longo do tempo
figure;
subplot(2, 1, 1);
plot(results(:, 1), results(:, 7), "-b", results(:, 1), rad2deg(results(:, 8)), "-r");
xlabel("Tempo (segundos)")
ylabel("Aceleração (m/s²) / Ângulo de Direção (graus)")
legend("Aceleração", "Ângulo de Direção");

subplot(2, 1, 2);
plot(results(:, 1), results(:, 2), "-g", results(:, 1), results(:, 3), "-c");
xlabel("Tempo (segundos)")
ylabel("Posição X (metros) / Posição Y (metros)")
legend("Posição X", "Posição Y");

