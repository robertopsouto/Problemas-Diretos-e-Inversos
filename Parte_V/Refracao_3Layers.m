% Problemas Diretos e Inversos em Geofísica - Conceitos Basicos e Aplicacoes
% Prof. Giuliano Marotta - SIS/IG/UnB - marotta@unb.br
% Parte V: Exercicio 01
% ---------------------------------------------------------------------
% Sismica de refracao de 3 camadas horizontais
% Condicao: V1<V2<V3

%% Equacao do tempo de percurso
% t = (x/V3)+((2*h1*(V3^2-V1^2)^0.5)/(V3*V1))+((2*h2*(V3^2-V2^2)^0.5)/(V3*V2))

%% Estimativa de espessuras (h1 e h2)
% ti = intercept time axis
% if x = 0 m
% ti = 2*h1*((V2^2-V1^2)^0.5/(V2*V1))
% h1 = (ti/2)*((V2*V1)/(V2^2-V1^2)^0.5)
% h2 = (ti2-((2*h1*(V3^2-V1^2)^0.5)/(V3*V1)))*((V3*V2)/(2*(V3^2-V2^2)^0.5))

%% Estimativa da distancia critica (xcr)
% xcr = (2*h1)/((V2/V1)^2-1)^0.5
% xcr = 2*(h1*(V1/(V3^2-V1^2)^0.5)+h2*(V2/(V3^2-V2^2)^0.5))

%% ---------------------------------------------------------------------
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
Dados = importdata('DadosRefracao3V.txt');
x = Dados.data(:,1); % distância dos receptores, em metros
td = Dados.data(:,2); % Tempo registrado para a onda direta, em segundos
tr1 = Dados.data(:,3); % Tempo registrado para a onda refratada na segunda camada, em segundos
tr2 = Dados.data(:,4); % % Tempo registrado para a onda refratada na terceira camada, em segundos

% Plota dados
figure()
plot(x,td,'k')
hold on
plot(x,tr1,'r')
plot(x,tr2,'m')
xlabel('distancia (m)')
ylabel('tempo (s)')

% Inversao
% funcao: t = ti+Sx
% t = d; G = [1 x0; ...] m = [ti, S]
% ti = tempo de interceptacao da onda retratada em x = 0;
% S = 1/V = vagarosidade

% Estimativa de ti e S1 envolvendo onda direta
G = [ones(length(x),1) x];
d = td;
[tid, S1] = invV(d, G);

% Estimativa de ti e S2 envolvendo onda refratada na segunda camada
G = [ones(length(x),1) x];
d = tr1;
[tir1, S2] = invV(d, G);

% Estimativa de ti e S3 envolvendo onda refratada na terceira camada
G = [ones(length(x),1) x];
d = tr2;
[tir2, S3] = invV(d, G);

% Calculo das velocidades das camadas 1, 2 e 3
V1 = 1/S1;
V2 = 1/S2;
V3 = 1/S3;

% Calculo da espessura das camadas 1 e 2
h1 = (tir1/2)*((V2*V1)/(V2^2-V1^2)^0.5)
h2 = (tir2-((2*h1*(V3^2-V1^2)^0.5)/(V3*V1)))*((V3*V2)/(2*(V3^2-V2^2)^0.5))

% Calculo da distancia critica considerando as camadas 2 e 3
xcr1 = (2*h1)/((V2/V1)^2-1)^0.5
xcr2 = 2*(h1*(V1/(V3^2-V1^2)^0.5)+h2*(V2/(V3^2-V2^2)^0.5))

% plota resultados
figure()
xc1 = [0,0;xcr1,-h1;x(end)-xcr1,-h1; x(end) 0];
xc2 = [0,0;xcr2,-h2;x(end)-xcr2,-h2; x(end) 0];
plot(x(:,1), zeros(length(x),1),'ob')
hold on
plot(xc1(:,1),xc1(:,2))
plot(xc2(:,1),xc2(:,2))
xlabel('distancia (m)')
ylabel('profundidade (m)')




