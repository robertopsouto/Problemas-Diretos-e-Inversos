% Curso de Inverno do Observatorio Sismologico
% Curso: Ajustamento de Observacoes pelo Metodo dos Minimos Quadrados
% Periodo: 15/08/2019 a 16/08/2019
% Prof.: Giuliano Sant'Anna Marotta
% Observatorio Sismologico - SIS
% Instituto de Geociencias - IG
% Universidade de Brasilia - UnB
%
% Contato: marotta@unb.br
%----------------------------------
%%
% Exercicio 04 - Parte 3 Curso MMQ SIS/UnB
%
clear
clc
% Modelo: T = a*1+b*z
% Abrir arquivo de dados
Dados = load('DadosExercicio03.txt');
% Vetor dos dados de profundidade
z = Dados(:,1);
% Vetor dos dados observados de Temperarura
d = Dados(:,2);
% Vetor das incertezas dos dados observados
Var_d = Dados(:,3).^2;
% Numero de parametros
M = 2; %'a' e 'b'
% Numero de Observacoes
N = length(d(:,1));
% Matriz dos coeficientes
G = [ones(N,1) z];
% Matris Peso
W = (Var_d.*eye(N,N))^-1;
%-------------------------------------------------
% Inserir dados do modelo para injuncao (T = 110)
Ti=100;
h = Ti; 
% Inserir coeficientes do modelo para injuncao (z = 2km)
zi = 2;
F = [1 zi]; 
%-------------------------------------------------
% Vetor dos parametros
MM = zeros(M+1,M+1);
MM(1:M,1:M)=(G'*W*G);
MM(M+1,1:M) = F;
MM(1:M,M+1) = F';
NN = [(G'*W*d);h];
m = (MM)^-1*(NN)
% multiplicador de lagrange
lgr = m(M+1,1);
% Vetor dos parametros
m = m(1:M,1);
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
plot(d,z,'.b')
xlabel('Temperatura')
ylabel('Profundidade')
% Plotar dados calculados
hold on
plot(G*m,z,'.r')
plot(h,2,'or')

% plotar erro
figure
plot(e,'.r')

