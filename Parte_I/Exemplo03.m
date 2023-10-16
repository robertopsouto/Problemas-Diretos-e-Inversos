% Problemas Diretos e Inversos em Geofísica - Conceitos Básicos e Aplicações
% Prof. Giuliano Marotta - SIS/IG/UnB - marotta@unb.br
% Parte I: Exemplo 03
% ---------------------------------------------------------------------
clear
clc
d = [1;2;1]; % vetor dos dados observados
Var_d = [0.01^2 0 0; 0 0.02^2 0;0 0 0.01^2]; % Covariancia dos dados observados
Var_pri = 1; % Varancia a priori
W = Var_pri.*(Var_d)^-1; % Matriz peso
G = [1 0; 5 -1; -3 1]; % matriz dos coeficientes
m = (G'*W*G)^-1*(G'*W*d); %Vetor dos parametros
dcalc = G*m; % Vetor dos dados calculados
e = dcalc-d; % Vetor dos erros
N = length(d(:,1)); % Numero de observacoes
M = length(G(1,:)); % Numero de parametros
VarPos = (e'*W*e)/(N-M); % Variancia a posteriori
Var_m = VarPos*(G'*W*G)^-1; % Variancia dos parametros estimados
Dp_m = diag(Var_m).^0.5; % Desvio-padrao dos parametros estimados

m
e
VarPos
Var_m
Dp_m
