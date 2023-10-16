% Problemas Diretos e Inversos em Geofísica - Conceitos Basicos e Aplicacoes
% Prof. Giuliano Marotta - SIS/IG/UnB - marotta@unb.br
% Parte V: Exercicio 03
% ---------------------------------------------------------------------
% Sismica de reflexao de 2 camadas horizontais
% Condicao: V1<V2

% Metodo t^2 - x^2

close all
clear all
clc

% Funcao para solucao do problema inverso
function [ti, S] = invV(d, G)
    m = (G'*G)^-1*(G'*d);
    ti = m(1,1);
    S = m(2,1);
end

% Abrir arquivo de dados
Dados = importdata('DadosReflexao.txt','\t');
x = Dados.data(:,2); % distância dos receptores, em metros
t = Dados.data(:,3)/1000; % Tempo registrado para a onda refletida na segunda camada, em segundos

% Plota dados
figure()
plot(x,t,'k')
xlabel('distancia (m)')
ylabel('tempo (s)')

% Plota dados no formato t^2 - x^2
figure()
plot(x.^2,t.^2,'k')
xlabel('x^2')
ylabel('t^2')

% Inversao
% funcao: t^2 = (x^2+4h^2)/V^2
% t^2 = x^2/V^2 + 4h^2/V^2
% y = a+bx
% t = t^2; a = t0 = 4h^2/V^2; b = 1/V^2; x = X^2

% Estimativa de t0 e S1 envolvendo onda refletida
d = t.^2;
x = x.^2;
G = [ones(length(x),1) x];
[t0, S1] = invV(d, G);

% Estimativa de V e h envolvendo onda refletida
V1 = 1/S1^0.5
h = ((t0*V1^2)/4)^0.5




