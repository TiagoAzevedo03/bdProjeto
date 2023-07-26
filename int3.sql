--Qual a classificacao do grupo A
--Necessario adicionar o gatilho 3 antes do povoar para atualizar pontos

.mode columns
.headers on
.nullvalue NULL

select nome, pontos, diferencaGolos, golosMarcados, golosSofridos
from Equipa where grupo = 'A'
order by 2 desc, diferencaGolos desc, golosMarcados desc;