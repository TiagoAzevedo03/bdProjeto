.mode columns
.header on
.nullvalue NULL

PRAGMA foreign_keys = ON;

.print ''
.print ''

insert into jogador values (1000, 'Teste', 30, 30, 1);

select * from golo where idJogador = 1000;

.print 'Jogo 31 - Jogador 1000 participa'
.print ''
.print ''

insert into golo values (200, 31, 1000, 31, 0);

select * from golo where idJogador = 1000;

.print ''
.print ''

.print 'Jogo 30 - Jogador 1000 nao participa'

.print ''
.print ''

insert into golo values (201, 30, 1000, 30, 0);

.print ''
.print ''

.print 'Jogo 31 - Jogador 1000 participa'
.print ''

insert into Cartao values (300, 'Vermelho', 60, 1000, 31);

.print ''

select * from cartao where idJogador = 1000;
.print ''
.print 'Jogo 30 - Jogador 1000 nao participa'
.print ''

insert into Cartao values (301, 'Vermelho', 61, 1000, 30);

.print ''
.print 'Criar novo jogador com mesmo o numero do jogador teste'
.print ''
insert into jogador values (1001, 'Teste2', 25, 30, 1);