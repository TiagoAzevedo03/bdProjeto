--Quem foi o jogador mais velho a marcar num jogo a eliminar?

.mode columns
.headers on
.nullvalue NULL

select distinct jogador.nome as Nome from jogador, golo, jogo
where idTipoJogo > 1 and idJogador = jogador.id
and idJogo = jogo.id
order by jogador.idade desc
limit 1;