% Problemas Diretos e Inversos em Geofísica - Conceitos Básicos e Aplicações
% Prof. Giuliano Marotta - SIS/IG/UnB - marotta@unb.br
% Parte II: Exemplo 01
% ---------------------------------------------------------------------
% Modelo: 2m= 4
clear; clc;
figure; % Cria Figura
hold on; % Habilita plotar na mesma figura
d = [4]; % Vetor dos dados conhecidos
m0 = [1]; % Vetor dos parametros aproximados
it = 10; % Numero de iteracoes
for i=1:it
  G = [2]; % Matriz das derivadas parciais
  d0 = 2.*m0; % Vetor dos valores calculados
  dc = d-d0; % Vetor das diferencas
  dm = (G'*G)^-1*(G'*dc) % Vetor das correcoes
  m = m0+dm; % Vetor dos parametros ajustados
  e = d-2.*m; % Vetor dos residuos
  m0 = m; % Vetor dos parametros aproximados igual aos ajustados
  plot(i,m0,'.r'); % Plota valor do parametro estimado a cada iteracao
end
xlabel('iteracao')
ylabel('parametro')


