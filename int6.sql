--Que jogadores argentinos marcaram no Mundial? Ordene por ordem em que foi marcado o primeiro golo de cada jogador

.mode columns
.headers on
.nullvalue NULL

select distinct jogador.nome as Nome from jogador, golo, equipa
where jogador.id = golo.idJogador and equipa.nome = 'Argentina'
and jogador.idEquipa = equipa.id
order by idJogo, minuto;