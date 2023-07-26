--Qual foi a media de cartoes por jogo no Mundial?

.mode columns
.headers on
.nullvalue NULL

select round(count(*)/64.0, 2) as "Media de Cartoes"
from jogo, cartao where idjogo = jogo.id;