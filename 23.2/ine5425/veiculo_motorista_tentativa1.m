tmax = 150; % Aumentando o tempo máximo para garantir que o veículo pare
dt = 0.1; % Tempo em décimos de segundo

global inputs;
global inputs = [0, 0];

function xdot = veiculoODE(x, t)
    % Constantes ajustadas para as unidades desejadas
    k1 = 4.4; % m/s^2
    k2 = 0.1; % rad/s
    global inputs;
    % ODEs
    xdot(1) = x(4) * cos(x(3)); % Derivada da posição x
    xdot(2) = x(4) * sin(x(3)); % Derivada da posição y
    xdot(3) = k2 * inputs(2); % Derivada do ângulo de direção
    xdot(4) = k1 * inputs(1); % Derivada da velocidade
endfunction

function [timeNextEvent, nextEvent] = motorista(t)
    global tmax;
    if t < 1
        timeNextEvent = 1;
        nextEvent = [2.2, 0]; % Metade da maior aceleração e direção reta
    elseif t < 6
        timeNextEvent = 6;
        nextEvent = [2.2, -0.4]; % Metade da maior aceleração e direção à esquerda (30 graus)
    elseif t < 11
        timeNextEvent = 11;
        nextEvent = [2.2, 0]; % Metade da maior aceleração e direção reta
    elseif t < 26
        timeNextEvent = 26;
        nextEvent = [4.4, 0.44]; % Maior aceleração e direção à direita (25 graus)
    elseif t < 33.3
        timeNextEvent = 33.3;
        nextEvent = [4.4, 0]; % Maior aceleração e direção reta
    elseif t < 41.3
        timeNextEvent = 41.3;
        nextEvent = [-1.1, 0]; % Desaceleração (1/4 da maior) e direção reta
    else
        timeNextEvent = 150; % Encerrando a simulação
        nextEvent = [0, 0]; % Aceleração zero e direção reta
    endif
endfunction

initialState = [100, 100, 0, 0]; % Posição inicial (x, y), ângulo inicial e velocidade inicial
currentState = initialState;
outputs = [initialState(1), initialState(2)];
results = [0, initialState, inputs];

t = 0;
do
    [timeNextEvent, nextEvent] = motorista(t);
    tcont = linspace(t, timeNextEvent, (timeNextEvent - t) / dt);
    x = lsode("veiculoODE", initialState, tcont);
    % Coletando os resultados
    part = [tcont'(2:end), x(2:end, :), inputs(1) * ones(size(x, 1) - 1, 1), inputs(2) * ones(size(x, 1) - 1, 1)];
    results = [results; part];
    % Avançando o tempo simulado
    t = timeNextEvent;
    global inputs;
    inputs = nextEvent;
    initialState = x(end, :);
until t >= tmax;

plot(results(:,1), results(:,2), "-b", results(:,1), results(:,3), "-r", results(:,1), results(:,5), "-k", results(:,1), results(:,6), "-c")
legend("x pos", "y pos", "velocity", "angle");

% Plotando os resultados
#subplot(2, 1, 1);
#plot(results(:, 1), results(:, 2), "-b");
#xlabel('Tempo (s)');
#ylabel('Posição X (m)');
#title('Posição X do Veículo ao Longo do Tempo');

#subplot(2, 1, 2);
#plot(results(:, 1), results(:, 3), "-r");
#xlabel('Tempo (s)');
#ylabel('Posição Y (m)');
#title('Posição Y do Veículo ao Longo do Tempo');

