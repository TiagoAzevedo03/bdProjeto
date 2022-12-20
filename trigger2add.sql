PRAGMA foreign_keys = ON;

CREATE TRIGGER IF NOT EXISTS check_meias1
BEFORE INSERT ON Jogo
WHEN new.idTipoJogo = 4 and (new.idEquipaVisitada not in 
    (select idEquipaVisitada from Jogo where idTipoJogo = 3)
    and new.idEquipaVisitada not in 
    (select idEquipaVisitante from Jogo where idTipoJogo = 3))
BEGIN 
    SELECT RAISE (ABORT, "Equipa 1 nao passou para esta fase");
END;


CREATE TRIGGER IF NOT EXISTS check_meias2
BEFORE INSERT ON Jogo
WHEN new.idTipoJogo = 4 and (new.idEquipaVisitante not in 
    (select idEquipaVisitada from Jogo where idTipoJogo = 3)
    and new.idEquipaVisitante not in 
    (select idEquipaVisitante from Jogo where idTipoJogo = 3))
BEGIN 
    SELECT RAISE (ABORT, "Equipa 2 nao passou para esta fase");
END;


CREATE TRIGGER IF NOT EXISTS check_quartos1
BEFORE INSERT ON Jogo
WHEN new.idTipoJogo = 3 and (new.idEquipaVisitada not in 
    (select idEquipaVisitada from Jogo where idTipoJogo = 2)
    and new.idEquipaVisitada not in 
    (select idEquipaVisitante from Jogo where idTipoJogo = 2))
BEGIN 
    SELECT RAISE (ABORT, "Equipa 1 nao passou para esta fase");
END;


CREATE TRIGGER IF NOT EXISTS check_quartos2
BEFORE INSERT ON Jogo
WHEN new.idTipoJogo = 3 and (new.idEquipaVisitante not in 
    (select idEquipaVisitada from Jogo where idTipoJogo = 2)
    and new.idEquipaVisitante not in 
    (select idEquipaVisitante from Jogo where idTipoJogo = 2))
BEGIN 
    SELECT RAISE (ABORT, "Equipa 2 nao passou para esta fase");
END;


CREATE TRIGGER IF NOT EXISTS check_final1
BEFORE INSERT ON Jogo
WHEN (new.idTipoJogo = 5 or new.idTipoJogo = 6) 
    and (new.idEquipaVisitada not in 
    (select idEquipaVisitada from Jogo where idTipoJogo = 4)
    and new.idEquipaVisitada not in 
    (select idEquipaVisitante from Jogo where idTipoJogo = 4))
BEGIN 
    SELECT RAISE (ABORT, "Equipa 1 nao passou para esta fase");
END;


CREATE TRIGGER IF NOT EXISTS check_final2
BEFORE INSERT ON Jogo
WHEN (new.idTipoJogo = 5 or new.idTipoJogo = 6) 
    and (new.idEquipaVisitante not in 
    (select idEquipaVisitada from Jogo where idTipoJogo = 4)
    and new.idEquipaVisitante not in 
    (select idEquipaVisitante from Jogo where idTipoJogo = 4))
BEGIN 
    SELECT RAISE (ABORT, "Equipa 2 nao passou para esta fase");
END;