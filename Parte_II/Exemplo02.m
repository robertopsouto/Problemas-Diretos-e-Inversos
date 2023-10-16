% Problemas Diretos e Inversos em Geofísica - Conceitos Básicos e Aplicações
% Prof. Giuliano Marotta - SIS/IG/UnB - marotta@unb.br
% Parte II: Exemplo 02
% ---------------------------------------------------------------------
% Modelo: 2m^3= 16
clear; clc;
figure % Cria figura
hold on % habilita plotar na mesma figura
d =[16]; % Vetor dos valores observados
m0 = [1]; % Vetor dos parametros aproximados
N = length(d(:,1)); % Numero de Observacoes
M = length(m0(1,:)); % Numero de parametros
it = 10; % Numero de iteracoes
for i=1:it
    G =[3*2.*m0.^2]; % Matriz das derivadas parciais
    d0 = 2.*m0.^3; % Vetor dos valores calculados
    dc = d-d0; % Vetor das diferencas
    dm = (G'*G)^-1*(G'*dc); % Vetor das correções
    m = m0+dm % Vetor dos parametros ajustados
    e = d-2.*m.^3; % Vetor dos residuos
    m0=m;% vetor dos parâmetros ajustados
    plot(i,m,'.r') % plota valor do parametro por iteracao
end

xlabel('iteracao')
ylabel('parametro')


