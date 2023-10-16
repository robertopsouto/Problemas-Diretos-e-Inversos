% Problemas Diretos e Inversos em Geofísica - Conceitos Básicos e Aplicações
% Prof. Giuliano Marotta - SIS/IG/UnB - marotta@unb.br
% Parte III: Exemplo 04
% ---------------------------------------------------------------------
% Numero de observacoes < numero de parametros
% Numero de observacoes > numero de parametros
clear
clc
d = [1; 2; 3; 4]; % Vetor dos dados observados
G = [1 0 0; 1 0 0; 0 1 1; 0 2 2]; % Matriz dos coeficientes
M = length(G(1,:)); % Numero de parametros
I = eye(M,M); % Matriz identidade
lamb(1:M,1) = 0.00001; % Vetor dos parametros de regularizacao
m = (G'*G + lamb.*I)^-1*(G'*d) % Vetor dos parametros
e = d-G*m % Vetor dos erros




