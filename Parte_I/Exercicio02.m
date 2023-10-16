% Problemas Diretos e Inversos em Geofísica - Conceitos Básicos e Aplicações
% Prof. Giuliano Marotta - SIS/IG/UnB - marotta@unb.br
% Parte I: Exercicio 02
% ---------------------------------------------------------------------
clear
clc
% Modelo: T = a*1+b*z+c*z^2
% Abrir arquivo de dados
Dados = load('DadosEx01.txt');
% Vetor dos dados de profundidade
z = Dados(:,1);
% Vetor dos dados observados de Temperarura
d = Dados(:,2);
% Vetor das incertezas dos dados observados
Var_d = Dados(:,3).^2;
% Numero de parametros
M = 3; %'a', 'b' e 'c'
% Numero de Observacoes
N = length(d(:,1));
% Matriz dos coeficientes
G = [ones(N,1) z z.^2];
% Matris Peso
W = (Var_d.*eye(N,N))^-1;
% Vetor dos parametros
m = (G'*W*G)^-1*(G'*W*d)
% Vetor dos erros
e = d-G*m
% Variancia a posteriori
Var_pos = (e'*W*e)/(N-M)
% Matrix covariancia dos parametros
Cov_m = Var_pos*(G'*W*G)^-1
% Vetor dos desvios Padrao dos Parametros
Dp_m = diag(Cov_m).^0.5

% Plotar dados observados
figure
plot(z,d,'.b')
xlabel('Profundidade')
ylabel('Temperatura')
% Plotar dados calculados
hold on
plot(z,G*m,'.r')

% plotar erro
figure
plot(e,'.r')

