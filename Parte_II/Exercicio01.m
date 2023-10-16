% Problemas Diretos e Inversos em Geofísica - Conceitos Básicos e Aplicações
% Prof. Giuliano Marotta - SIS/IG/UnB - marotta@unb.br
% Parte II: Exercicio 01
% ---------------------------------------------------------------------
% Problema linear: t=var.S

clear; clc;


S = [150;155;160;153];
d = [5.0; 5.1; 5.3; 5.0]; % Vetor dos valores observados
% Matriz dos coeficientes
% Numero de parametros
M = 1; %vagarosidade - var'
% Numero de Observacoes
N = length(d(:,1));
% Matriz dos coeficientes
G = [S];
% Matriz Peso
W = eye(N,N);
% Vetor dos parametros
m = (G'*W*G)^-1*(G'*W*d)
% Velocidade
v = 1/m
% Vetor dos erros
e = d-G*m
% Variancia a posteriori
Var_pos = (e'*W*e)/(N-M)
% Matrix covariancia dos parametros
Cov_m = Var_pos*(G'*W*G)^-1
% Vetor dos desvios Padrao dos Parametros
Dp_m = diag(Cov_m).^0.5





















