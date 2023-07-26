.mode columns
.header on
.nullvalue NULL

PRAGMA foreign_keys = ON;

.print ''
.print 'Pontos e golos atuais'
.print ''

select pontos, golosMarcados, golosSofridos, diferencaGolos from Equipa
where id = 2;

.print ''
.print 'Inserir vitoria por 3-1'

insert into jogo values (100, 1, '10-12-2022', 2, 3, 1, 3, 1);

.print ''

select pontos, golosMarcados, golosSofridos, diferencaGolos from Equipa
where id = 2;

.print ''
.print 'Inserir empate 0-0'
.print ''

insert into jogo values (101, 2, '11-12-2022', 2, 4, 1, 0, 0);


select pontos, golosMarcados, golosSofridos, diferencaGolos from Equipa
where id = 2;