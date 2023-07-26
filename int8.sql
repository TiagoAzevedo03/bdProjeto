--Em que estadios foram marcados golos no prolongamento, quem marcou os golos e em que minuto? Ordene por minuto em que foram marcados

.mode columns
.headers on
.nullvalue NULL

select estadio.nome as Estadio, jogador.nome as Jogador, minuto as Minuto 
from jogador, estadio, golo, jogo
where minuto > 90 and idjogador = jogador.id
and idjogo = jogo.id and idEstadio = estadio.id
order by 3;