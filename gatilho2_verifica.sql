.mode columns
.header on
.nullvalue NULL

PRAGMA foreign_keys = ON;

.print ''
.print 'Belgica eliminada na fase de grupos, tentar inserir Belgica num jogo dos quartos de final'
.print ''

insert into jogo values (100, 1, '03-12-2022', 27, 1, 3, 1, 1);

.print ''
.print 'Inserir novo jogo de Portugal nos quartos de final, uma vez que Portugal passou os oitavos de final'
.print ''

insert into jogo values (100, 2, '03-12-2022', 1, 3, 3, 1, 1);

.print ''
select * from Jogo where idEquipaVisitada = (select id from Equipa
where nome = 'Portugal') and idTipoJogo = 3;
.print ''

.print 'Inserir jogo de Portugal nas meias finais, sendo que foi eliminado nos quartos de final'
.print ''

insert into jogo values (101, 3, '10-12-2022', 1, 3, 4, 1, 2);
