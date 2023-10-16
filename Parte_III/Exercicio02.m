% Problemas Diretos e Inversos em Geofísica - Conceitos Básicos e Aplicações
% Prof. Giuliano Marotta - SIS/IG/UnB - marotta@unb.br
% Parte III: Exercicio 02
% ---------------------------------------------------------------------
% Baseado no conceito de topografia, considerar 4 observacoes de tempo de
% percurso (t) para estimar 4 parametros. h eh a espessura da camada, vi sao
% as velocidades e si as vagarozidades.
% Dados: h=1; t1=t2=t4=t5=t6=t8=2 e t3=t7=1

% |----|----|----|----|
% | 1  | 2  | 3  | 4  | t1
% |----|----|----|----|
% | 5  | 6  | 7  | 8  | t2
% |----|----|----|----|
% | 9  | 10 | 11 | 12 | t3
% |----|----|----|----|
% | 13 | 14 | 15 | 16 | t4
% |----|----|----|----|
%   t5   t6   t7   t8

% Modelos:
% t1=h(s1+s2+s3+s4)
% t2=h(s5+s6+s7+s8)
% t3=h(s9+s10+s11+s12)
% t4=h(s13+s14+s15+s16)
% t5=h(s1+s5+s9+s13)
% t6=h(s2+s6+s10+s14)
% t7=h(s3+s7+s11+s15)
% t8=h(s4+s8+s12+s16)

clear
clc
t = [2;2;1;2;2;2;1;2]; % Vetor contendo tempos de percurso
h = 1; % Espessura da camada
d = t; % Vetor de dados
G = h.*[1 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0;...
        0 0 0 0 1 1 1 1 0 0 0 0 0 0 0 0;...
        0 0 0 0 0 0 0 0 1 1 1 1 0 0 0 0;...
        0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1;...
        1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0;...
        0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0;...
        0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0;...
        0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1]; % Matriz dos coeficientes
lamb = 0.001; % Vetor dos parametros de regularizacao
I = eye(length(G),length(G)); % Matriz identidade
m = (G'*G+lamb.*I)^-1*(G'*d) % Parametros estimados
e = d-G*m % Erro
v = 1./m
