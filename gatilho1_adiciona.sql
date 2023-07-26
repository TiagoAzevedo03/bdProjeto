PRAGMA foreign_keys = ON;

CREATE TRIGGER IF NOT EXISTS check_golo
BEFORE INSERT ON Golo
WHEN new.idJogador not in 
(select id from jogador where idEquipa = 
(select idEquipaVisitante from jogo where id = new.idJogo)
or idEquipa = (select idEquipaVisitada from jogo where id = new.idJogo))
BEGIN 
    SELECT raise (ABORT, "Jogador nao jogou esse jogo");
END;



CREATE TRIGGER IF NOT EXISTS check_cartao
BEFORE INSERT ON Cartao
WHEN new.idJogador not in 
(select id from jogador where idEquipa = 
(select idEquipaVisitante from jogo where id = new.idJogo)
or idEquipa = (select idEquipaVisitada from jogo where id = new.idJogo))
BEGIN 
    SELECT raise (ABORT, "Jogador nao jogou esse jogo");
END;



CREATE TRIGGER IF NOT EXISTS check_sub
BEFORE INSERT ON Substituicao
WHEN new.idJogadorEntra not in 
(select id from jogador where idEquipa = 
(select idEquipaVisitante from jogo where id = new.idJogo)
or idEquipa = (select idEquipaVisitada from jogo where id = new.idJogo))
or new.idJogadorSai not in 
(select id from jogador where idEquipa = 
(select idEquipaVisitante from jogo where id = new.idJogo)
or idEquipa = (select idEquipaVisitada from jogo where id = new.idJogo))
BEGIN 
    SELECT raise (ABORT, "Jogador nao jogou esse jogo");
END;



CREATE TRIGGER IF NOT EXISTS check_num
BEFORE INSERT ON Jogador
WHEN new.numero in (select numero from jogador where
idEquipa = new.idEquipa)
BEGIN 
    SELECT raise (ABORT, "Numero ja utilizado");
END;