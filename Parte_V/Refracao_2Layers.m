% Problemas Diretos e Inversos em Geofísica - Conceitos Basicos e Aplicacoes
% Prof. Giuliano Marotta - SIS/IG/UnB - marotta@unb.br
% Parte V: Exercicio 01
% ---------------------------------------------------------------------
% Sismica de refracao de 2 camadas horizontais
% Condicao: V1<V2

%% Equacao do tempo de percurso
% t = ((2*h1*(V2^2-V1^2)^0.5)/(V2*V1))+(x/V2)

%% Estimativa de espessura (h1)
% ti = intercept time axis
% if x = 0 m
% ti = 2*h1*((V2^2-V1^2)^0.5/(V2*V1))
% h1 = (ti/2)*((V2*V1)/(V2^2-V1^2)^0.5)

%% Estimativa da distancia critica (xcr)
% xcr = (2*h1)*((V2/V1)^2-1)^0.5

%% ---------------------------------------------------------------------
close all
clear all
clc

% Funcao para solucao do problema inverso
function [ti, S, dpti, dpS] = invV(d, G, W)
    m = (G'*W*G)^-1*(G'*W*d);
    e = G*m-d;
    M = length(G(:,1));
    N = length(G(1,:));
    VarPos = e'*W*e/(M-N);
    Varm = VarPos.*(G'*W*G)^-1;
    dpm = diag(Varm).^0.5;
    ti = m(1,1);
    dpti = dpm(1,1);
    S = m(2,1);
    dpS =dpm(2,1);
end

% Abrir arquivo de dados
Dados = importdata('DadosRefracao2V.txt');
x = Dados.data(:,1); % Distância dos receptores, em metros
td = Dados.data(:,2)/1000; % Tempo registrado para a onda direta, em segundos
tr = Dados.data(:,3)/1000; % Tempo registrado para a onda refratada, em segundos

% Plota dados
figure()
plot(x,td,'k')
hold on
plot(x,tr,'r')
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
W = eye(length(d),length(d));
[tid, S1, dptid, dpS1] = invV(d, G, W);

% Estimativa de ti e S2 envolvendo onda refratada
G = [ones(length(x),1) x];
d = tr;
[tir, S2, dptir, dpS2] = invV(d, G, W);

% Calculo das velocidades das camadas 1 e 2
V1 = 1/S1;
V2 = 1/S2;

 % Propagacao de variancias
VarV1 = ((-1/S1^2)*dpS1)^2;
dpV1 = VarV1^0.5
VarV2 = ((-1/S2^2)*dpS2)^2;
dpV2 = VarV2^0.5

% h1 = (ti/2)*((V2*V1)/(V2^2-V1^2)^0.5)
% Jacobiana J1 = (dh1/dti) J2 = (dh1/dV1) J3 = (dh1/dV2)
J1 =  (V1*V2)/(2*sqrt(V2^2-V1^2));
J2 = ((V1^2*V2*tir)/(2*(V2^2-V1^2)^(3/2)))+(V2*tir/(2*sqrt(V2^2-V1^2)));
J3 =-((V1*V2^2*tir)/(2*(V2^2-V1^2)^(3/2)))+(V1*tir/(2*sqrt(V2^2-V1^2)));
% Varh1 = (dh1/dti)^2*varti+(dh1/dV1)^2*varV1+(dh1/dV2)^2*varV2
Varh1 = J1^2*dptir^2 + J2^2*dpV1^2 + J3^2*dpV2^2;
dph1 = Varh1^0.5
dptir

% Calculo da espessura da primeira camada
h1 = (tir/2)*((V2*V1)/(V2^2-V1^2)^0.5)

% Calculo da distancia critica
xcr1 = (2*h1)/((V2/V1)^2-1)^0.5;

% plota resultados
figure()
xc1 = [0,0;xcr1,-h1;x(end)-xcr1,-h1; x(end) 0];
plot(x(:,1), zeros(length(x),1),'ob')
hold on
plot(xc1(:,1),xc1(:,2))
xlabel('distancia (m)')
ylabel('profundidade (m)')


