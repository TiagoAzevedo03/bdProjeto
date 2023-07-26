PRAGMA foreign_keys = ON;

CREATE TRIGGER IF NOT EXISTS addPontos
AFTER INSERT ON Jogo
WHEN new.idTipoJogo = 1

BEGIN


   UPDATE Equipa SET pontos = pontos + 3 
    WHERE  Equipa.id= NEW.idEquipaVisitada
      AND New.golosCasa > New.golosFora;
    
    UPDATE Equipa SET pontos = pontos + 3 
     WHERE Equipa.id = NEW.idEquipaVisitante
       AND New.golosCasa < New.golosFora; 

    UPDATE Equipa SET pontos= pontos + 1 
     WHERE Equipa.id = NEW.idEquipaVisitante
       AND New.golosCasa = New.golosFora;

    UPDATE Equipa SET pontos= pontos + 1 
     WHERE Equipa.id = NEW.idEquipaVisitada
       AND New.golosCasa = New.golosFora;
    

END;


CREATE TRIGGER IF NOT EXISTS addGolos
AFTER INSERT ON Jogo
WHEN new.idTipoJogo = 1

BEGIN

    UPDATE Equipa SET golosMarcados = golosMarcados + new.golosCasa
      WHERE Equipa.id= NEW.idEquipaVisitada;
    
    UPDATE Equipa SET golosSofridos = golosSofridos + new.golosFora
      WHERE Equipa.id= NEW.idEquipaVisitada;

    UPDATE Equipa SET golosMarcados = golosMarcados + new.golosFora
      WHERE Equipa.id= NEW.idEquipaVisitante;

    UPDATE Equipa SET golosSofridos = golosSofridos + new.golosCasa
      WHERE Equipa.id= NEW.idEquipaVisitante;

    UPDATE Equipa set diferencaGolos = diferencaGolos + new.golosCasa - new.golosFora
      WHERE Equipa.id = New.idEquipaVisitada;

    UPDATE Equipa set diferencaGolos = diferencaGolos - new.golosCasa + new.golosFora
      WHERE Equipa.id = New.idEquipaVisitante;

END;