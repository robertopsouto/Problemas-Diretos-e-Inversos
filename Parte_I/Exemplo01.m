% Problemas Diretos e Inversos em Geofísica - Conceitos Básicos e Aplicações
% Prof. Giuliano Marotta - SIS/IG/UnB - marotta@unb.br
% Parte I: Exemplo 01
% ---------------------------------------------------------------------

clear
clc

d = [1;2;1]; % vetor dos dados observados
G = [1 0; 5 -1; -3 1]; % matriz dos coeficientes
m = (G'*G)^-1*(G'*d) %Vetor dos parametrios
dcalc = G*m; % Vetor dos dados calculados
e = dcalc-d; % Vetor dos erros

d
m
dcalc
e
