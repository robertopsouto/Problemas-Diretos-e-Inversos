% Problemas Diretos e Inversos em Geofísica - Conceitos Básicos e Aplicações
% Prof. Giuliano Marotta - SIS/IG/UnB - marotta@unb.br
% Parte III: Exercicio 01
% ---------------------------------------------------------------------
% Baseado no conceito de topografia, considerar 4 observacoes de tempo de
% percurso (t) para estimar 4 parametros. h eh a espessura da camada, vi sao
% as velocidades e si as vagarozidades. Dados: h=1 e t1=t3=1 e t2=t4=2

% |-----|-----|
% |  1  |  2  | t1
% |-----|-----|
% |  3  |  4  | t2
% |-----|-----|
%    t3    t4

% Modelos:
% t1 = h(s1+s2)
% t2 = h(s3+s4)
% t3 = h(s1+s3)
% t4 = h(s2+s4)

clear
clc
t = [1;2;1;2]; % Vetor contendo tempos de percurso
h = 1; % Espessura da camada
d = t; % Vetor de dados
G = [h h 0 0;...
     0 0 h h;...
     h 0 h 0;...
     0 h 0 h]; % Matriz dos coeficientes

lrg=0.001; % Vetor dos parametros de regularizacao
I = eye(length(G),length(G)); % Matriz identidade
m = (G'*G+lrg.*I)^-1*(G'*d) % Parametros estimados
e = d-G*m % Erro

