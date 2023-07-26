--Quem foram os jogadores que marcaram nos jogos em que houve cartoes vermelhos?
--Ordene decrescentemente pelo minuto em que foram marcados


.mode columns
.headers on
.nullvalue NULL

select distinct jogador.nome
from cartao, jogo, jogador, golo
where cartao.cor = 'Vermelho'
and golo.idjogador = jogador.id and
cartao.idjogo = jogo.id and golo.idjogo = jogo.id
order by golo.minuto desc;