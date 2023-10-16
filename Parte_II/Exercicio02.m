% Problemas Diretos e Inversos em Geofísica - Conceitos Básicos e Aplicações
% Prof. Giuliano Marotta - SIS/IG/UnB - marotta@unb.br
% Parte II: Exercicio 02
% ---------------------------------------------------------------------
% Problema nao linear

clear; clc;
figure; % Cria figura
hold on % habilita plotar na mesma figura

S = [150;155;160;153];
d = [5.0; 5.1; 5.3; 5.0]; % Vetor dos valores observados
m0= [0.1]; % Vetor dos parametros aproximados
N = length(d(:,1)); % Numeto de observacoes
M = length(m0(:,1)); % Numero de parametros
it = 100; % Numero de iteracoes

for i=1:it
    G = [-S./m0.^2]; % Matriz das derivadas parciais
    d0 = S./m0; % Vetor dos valores calculados
    dc = d-d0; % Vetor das diferencas
    dm = (G'*G)^-1*(G'*dc); % Vetor das correcoes
    m = m0+dm; % Vetor dos parametros ajustados
    e = d-S./m; % Vetor das diferencas
    m0=m; % Vetor dos parametros ajustados
   plot(i,m,'or') % plota valor do parametro por iteracao
end

xlabel('Interacao')
ylabel('Velocidade')






















