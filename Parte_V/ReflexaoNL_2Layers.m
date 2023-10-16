% Problemas Diretos e Inversos em Geofísica - Conceitos Basicos e Aplicacoes
% Prof. Giuliano Marotta - SIS/IG/UnB - marotta@unb.br
% Parte V: Exercicio 03
% ---------------------------------------------------------------------
% Sismica de reflexao de 2 camadas horizontais
% Condicao: V1<V2

% metodo: modelo não linear

close all
clear all
clc

% Abrir arquivo de dados
Dados = importdata('DadosReflexao.txt','\t');
x = Dados.data(:,2); % distância dos receptores, em metros
t = Dados.data(:,3)/1000; % Tempo registrado para a onda refletida na segunda camada, em segundos

figure()
plot(x,t,'k')
xlabel('distancia (m)')
ylabel('tempo (s)')

% Inversao
% tab = (x^2+4h^2)^0.5/V = (x^2+4*h^2)^0.5*S
% parametros: t0 e V

d = t; % Vetor dos dados observados
V = 1000; % parametros iniciais
h= 3; % parametros iniciais
S = 1/V; % Varagosidade
m0= [h; S]; % Vetor dos parametros aproximados
N = length(d(:,1)); % Numeto de observacoes
M = length(m0(:,1)); % Numero de parametros


it =20; % Numero de iteracoes
figure()

% Estimativa de h e S envolvendo onda refletida
for i=1:it

    G = [(4*m0(2)*m0(1))./(4*m0(1)^2+x.^2).^0.5, (4*m0(1)^2+x.^2).^0.5]; % Matriz das derivadas parciais
    d0 = (x.^2+4*m0(1).^2).^0.5*m0(2); % Vetor dos valores calculados
    dc = d-d0; % Vetor das diferencas
    dm = (G'*G)^-1*(G'*dc); % Vetor das correcoes
    m = m0+dm; % Vetor dos parametros ajustados
    e = d-(x.^2+4*m(1).^2).^0.5*m(2); % Vetor das diferencas
    m0=m; % Vetor dos parametros ajustados
    plot(i,dm,'.r') % plota valor do parametro por iteracao
    hold on

end

h = m(1)
V = 1/m(2)
