% Problemas Diretos e Inversos em Geofísica - Conceitos Básicos e Aplicações
% Prof. Giuliano Marotta - SIS/IG/UnB - marotta@unb.br
% Parte III: Exemplo 02
% ---------------------------------------------------------------------
% Numero de observacoes < numero de parametros
clear
clc

d = [1]; % Vetor dos dados observados
G = [2 1]; % Matriz dos coeficientes
m = G'*(G*G')^-1*d % Vetor dos parametros
e = d-G*m % Vetor dos erros

