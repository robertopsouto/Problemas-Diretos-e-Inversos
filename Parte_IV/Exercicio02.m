% Problemas Diretos e Inversos em Geofísica - Conceitos Básicos e Aplicações
% Prof. Giuliano Marotta - SIS/IG/UnB - marotta@unb.br
% Parte IV: Exercicio 02
% ---------------------------------------------------------------------
clear
clc
% Modelo: T = a*1+b*z
Dados = load('DadosEx.txt'); % Abrir arquivo de dados
z = Dados(:,1); % Vetor dos dados de profundidade
d = Dados(:,2); % Vetor dos dados observados de Temperarura
Var_d = Dados(:,3).^2; % Vetor das incertezas dos dados observados
M = 2; %'a' e 'b‘% Numero de parametros
N = length(d(:,1)); % Numero de Observacoes
G = [ones(N,1) z]; % Matriz dos coeficientes
W = (Var_d.*eye(N,N))^-1; % Matris Peso
%-------------------------------------------------
Ti=100; % Inserir dados do modelo para injuncao (T = 110)
h = Ti;
zi = 2; % Inserir coeficientes do modelo para injuncao (z = 2km)
F = [1 zi];
%-------------------------------------------------
MM = zeros(M+1,M+1); % Vetor dos parametros
MM(1:M,1:M)=(G'*W*G); MM(M+1,1:M)=F; MM(1:M,M+1)=F'; NN=[(G'*W*d);h]; m = (MM)^-1*(NN)
lgr = m(M+1,1); % multiplicador de Lagrange
m = m(1:M,1); % Vetor dos parametros
e = d-G*m % Vetor dos erros
Var_pos = (e'*W*e)/(N-M); % Variancia a posteriori
Cov_m = Var_pos*(G'*W*G)^-1; % Matrix covariancia dos parametros
Dp_m = diag(Cov_m).^0.5 % Vetor dos desvios Padrao dos Parametros
figure % Plotar dados observados
plot(d,z,'.b'); xlabel('Temperatura'); ylabel('Profundidade')
% Plotar dados calculados
hold on
plot(G*m,z,'.r'); plot(h,2,'or')
 figure % plotar erro
plot(e,'.r')


