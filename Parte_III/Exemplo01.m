% Problemas Diretos e Inversos em Geofísica - Conceitos Básicos e Aplicações
% Prof. Giuliano Marotta - SIS/IG/UnB - marotta@unb.br
% Parte III: Exemplo 01
% ---------------------------------------------------------------------
% Numero de observacoes = numero de parametros
clear
clc

d = [1;2]; % Vetor dos dados observados
G = [1 0; 5 -1]; % Matriz dos coeficientes
m = (G'*G)^-1*(G'*d) % Vetor dos parametros
e = d-G*m % Vetor dos erros


