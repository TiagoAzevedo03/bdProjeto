--Quais foram as equipas que a Coreia do Sul defrontou durante o mundial? Ordene por golos marcados a essa equipa


.mode columns
.headers on
.nullvalue NULL


select distinct nome as Nome from equipa, jogo where equipa.id in
(select idEquipaVisitada from jogo where idEquipaVisitante = (select id from equipa where nome like '%Sul') )
or equipa.id in (select idEquipaVisitante from jogo where idEquipaVisitada = (select id from equipa where nome like '%Sul'))
order by 
case
when idEquipaVisitada = (select id from equipa where nome like '%Sul') then golosCasa
when idEquipaVisitante = (select id from equipa where nome like '%Sul') then golosFora 
end;