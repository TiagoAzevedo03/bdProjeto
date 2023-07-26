--Quantas substituicoes fez Portugal em jogos da fase de grupos?


.mode columns
.headers on
.nullvalue NULL

select count(*) as Substituicoes from Substituicao where idJogadorEntra in
(select id from jogador where idEquipa = 
(select id from equipa where nome like 'Portugal'))
and (select idTipoJogo from jogo where id = idjogo) = 1;