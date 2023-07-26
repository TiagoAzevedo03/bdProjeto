PRAGMA foreign_keys = ON;

CREATE TRIGGER IF NOT EXISTS check_meias1
BEFORE INSERT ON Jogo
WHEN new.idTipoJogo = 4 and ((new.idEquipaVisitada not in 
    (select idEquipaVisitada from Jogo where idTipoJogo = 3)
    and new.idEquipaVisitada not in 
    (select idEquipaVisitante from Jogo where idTipoJogo = 3)) or
    (select golosFora from jogo where idTipoJogo = 3 and idEquipaVisitada = new.idEquipaVisitada)
    > (select golosCasa from jogo where idTipoJogo = 3 and idEquipaVisitada = new.idEquipaVisitada)
    or (select golosCasa from jogo where idTipoJogo = 3 and idEquipaVisitante = new.idEquipaVisitada)
    > (select golosFora from jogo where idTipoJogo = 3 and idEquipaVisitante = new.idEquipaVisitada))
BEGIN 
    SELECT RAISE (ABORT, "Equipa 1 nao passou para esta fase");
END;


CREATE TRIGGER IF NOT EXISTS check_meias2
BEFORE INSERT ON Jogo
WHEN new.idTipoJogo = 4 and ((new.idEquipaVisitante not in 
    (select idEquipaVisitada from Jogo where idTipoJogo = 3)
    and new.idEquipaVisitante not in 
    (select idEquipaVisitante from Jogo where idTipoJogo = 3)) or
    (select golosFora from jogo where idTipoJogo = 3 and idEquipaVisitada = new.idEquipaVisitante)
    > (select golosCasa from jogo where idTipoJogo = 3 and idEquipaVisitada = new.idEquipaVisitante)
    or (select golosCasa from jogo where idTipoJogo = 3 and idEquipaVisitante = new.idEquipaVisitante)
    > (select golosFora from jogo where idTipoJogo = 3 and idEquipaVisitante = new.idEquipaVisitante))
BEGIN 
    SELECT RAISE (ABORT, "Equipa 2 nao passou para esta fase");
END;


CREATE TRIGGER IF NOT EXISTS check_quartos1
BEFORE INSERT ON Jogo
WHEN new.idTipoJogo = 3 and ((new.idEquipaVisitada not in 
    (select idEquipaVisitada from Jogo where idTipoJogo = 2)
    and new.idEquipaVisitada not in 
    (select idEquipaVisitante from Jogo where idTipoJogo = 2)) or
    (select golosFora from jogo where idTipoJogo = 2 and idEquipaVisitada = new.idEquipaVisitante)
    > (select golosCasa from jogo where idTipoJogo = 2 and idEquipaVisitada = new.idEquipaVisitante)
    or (select golosCasa from jogo where idTipoJogo = 2 and idEquipaVisitante = new.idEquipaVisitante)
    > (select golosFora from jogo where idTipoJogo = 2 and idEquipaVisitante = new.idEquipaVisitante))
BEGIN 
    SELECT RAISE (ABORT, "Equipa 1 nao passou para esta fase");
END;


CREATE TRIGGER IF NOT EXISTS check_quartos2
BEFORE INSERT ON Jogo
WHEN new.idTipoJogo = 3 and ((new.idEquipaVisitante not in 
    (select idEquipaVisitada from Jogo where idTipoJogo = 2)
    and new.idEquipaVisitante not in 
    (select idEquipaVisitante from Jogo where idTipoJogo = 2)) or
    (select golosFora from jogo where idTipoJogo = 2 and idEquipaVisitada = new.idEquipaVisitada)
    > (select golosCasa from jogo where idTipoJogo = 2 and idEquipaVisitada = new.idEquipaVisitada)
    or (select golosCasa from jogo where idTipoJogo = 2 and idEquipaVisitante = new.idEquipaVisitada)
    > (select golosFora from jogo where idTipoJogo = 2 and idEquipaVisitante = new.idEquipaVisitada))
BEGIN 
    SELECT RAISE (ABORT, "Equipa 2 nao passou para esta fase");
END;


CREATE TRIGGER IF NOT EXISTS check_final1
BEFORE INSERT ON Jogo
WHEN new.idTipoJogo = 6
    and ((new.idEquipaVisitada not in 
    (select idEquipaVisitada from Jogo where idTipoJogo = 4)
    and new.idEquipaVisitada not in 
    (select idEquipaVisitante from Jogo where idTipoJogo = 4)) or
    (select golosFora from jogo where idTipoJogo = 4 and idEquipaVisitada = new.idEquipaVisitada)
    > (select golosCasa from jogo where idTipoJogo = 4 and idEquipaVisitada = new.idEquipaVisitada)
    or (select golosCasa from jogo where idTipoJogo = 4 and idEquipaVisitante = new.idEquipaVisitada)
    > (select golosFora from jogo where idTipoJogo = 4 and idEquipaVisitante = new.idEquipaVisitada))
BEGIN 
    SELECT RAISE (ABORT, "Equipa 1 nao passou para esta fase");
END;


CREATE TRIGGER IF NOT EXISTS check_final2
BEFORE INSERT ON Jogo
WHEN new.idTipoJogo = 6
    and ((new.idEquipaVisitante not in 
    (select idEquipaVisitada from Jogo where idTipoJogo = 4)
    and new.idEquipaVisitante not in 
    (select idEquipaVisitante from Jogo where idTipoJogo = 4)) or
    (select golosFora from jogo where idTipoJogo = 4 and idEquipaVisitada = new.idEquipaVisitante)
    > (select golosCasa from jogo where idTipoJogo = 4 and idEquipaVisitada = new.idEquipaVisitante)
    or (select golosCasa from jogo where idTipoJogo = 4 and idEquipaVisitante = new.idEquipaVisitante)
    > (select golosFora from jogo where idTipoJogo = 4 and idEquipaVisitante = new.idEquipaVisitante))
BEGIN 
    SELECT RAISE (ABORT, "Equipa 2 nao passou para esta fase");
END;


CREATE TRIGGER IF NOT EXISTS check_terceiro1
BEFORE INSERT ON Jogo
WHEN new.idTipoJogo = 5
    and ((new.idEquipaVisitada not in 
    (select idEquipaVisitada from Jogo where idTipoJogo = 4)
    and new.idEquipaVisitada not in 
    (select idEquipaVisitante from Jogo where idTipoJogo = 4)) or
    (select golosFora from jogo where idTipoJogo = 4 and idEquipaVisitada = new.idEquipaVisitada)
    < (select golosCasa from jogo where idTipoJogo = 4 and idEquipaVisitada = new.idEquipaVisitada)
    or (select golosCasa from jogo where idTipoJogo = 4 and idEquipaVisitante = new.idEquipaVisitada)
    < (select golosFora from jogo where idTipoJogo = 4 and idEquipaVisitante = new.idEquipaVisitada))
BEGIN 
    SELECT RAISE (ABORT, "Equipa 1 nao pode jogar este jogo");
END;


CREATE TRIGGER IF NOT EXISTS check_terceiro2
BEFORE INSERT ON Jogo
WHEN new.idTipoJogo = 5
    and ((new.idEquipaVisitante not in 
    (select idEquipaVisitada from Jogo where idTipoJogo = 4)
    and new.idEquipaVisitante not in 
    (select idEquipaVisitante from Jogo where idTipoJogo = 4)) or
    (select golosFora from jogo where idTipoJogo = 4 and idEquipaVisitada = new.idEquipaVisitante)
    < (select golosCasa from jogo where idTipoJogo = 4 and idEquipaVisitada = new.idEquipaVisitante)
    or (select golosCasa from jogo where idTipoJogo = 4 and idEquipaVisitante = new.idEquipaVisitante)
    < (select golosFora from jogo where idTipoJogo = 4 and idEquipaVisitante = new.idEquipaVisitante))
BEGIN 
    SELECT RAISE (ABORT, "Equipa 2 nao pode jogar este jogo");
END;


