--Quais foram os 3 estadios menos utilizados no mundial? Ordene por ano de criacao crescente

.mode columns
.headers on
.nullvalue NULL

select nome, ano, count(*) as NumeroJogos from jogo, estadio
where idEstadio = estadio.id
group by 1
order by 3, 2
limit 3;