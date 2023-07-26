--Quem sao os 10 melhores marcadores? Em caso de igualdade, ordene por idade por ordem crescente


.mode columns
.headers on
.nullvalue NULL


select jogador.nome as Nome, count(*) as Golos, idade as Idade from jogador, golo
where jogador.id = golo.idJogador and golo.autogolo = 0
group by 1
order by 2 desc, idade asc
limit 10;