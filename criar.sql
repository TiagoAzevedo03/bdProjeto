PRAGMA FOREIGN_KEYS = ON;
.mode columns
.headers on

DROP TABLE IF EXISTS Golo;
DROP TABLE IF EXISTS Substituicao;
DROP TABLE IF EXISTS Cartao;
DROP TABLE IF EXISTS Jogo;
DROP TABLE IF EXISTS Jogador;
DROP TABLE IF EXISTS TipoJogo;
DROP TABLE IF EXISTS Equipa;
DROP TABLE IF EXISTS Estadio;
DROP TABLE IF EXISTS Competicao;

CREATE TABLE Competicao(
	id INT,
	nome TEXT,
	ano INT,
	PRIMARY KEY (id)
);

CREATE TABLE Estadio(
	id INT,
	nome TEXT,
	ano INT,
	PRIMARY KEY (id)
);

CREATE TABLE Equipa(
	id INT,
	nome TEXT,
	grupo TEXT NOT NULL,
	continente TEXT,
	idCompeticao INT,
	CONSTRAINT continente_check CHECK (continente = 'Europa' OR continente = 'Asia'
		OR continente = 'America do Norte' OR continente = 'America Central'
		OR continente = 'America do Sul' OR continente = 'Africa' OR
		continente = 'Oceania'),
	PRIMARY KEY (id),
	FOREIGN KEY (idCompeticao) REFERENCES Competicao (id)
);

CREATE TABLE Jogador(
	id INT,
	nome TEXT,
	idade INT CHECK (idade > 0),
	numero INT CHECK (numero > 0 AND numero < 100),
	idEquipa INT,
	PRIMARY KEY (id),
	FOREIGN KEY (idEquipa) REFERENCES Equipa (id)
);

CREATE TABLE TipoJogo(
	id INT,
	designacao TEXT NOT NULL,
	PRIMARY KEY (id),
	CONSTRAINT designacao_check CHECK (designacao = 'Grupos' 
		OR designacao = 'Oitavos' OR designacao = 'Quartos' 
		OR designacao = 'Meias' OR designacao = 'Terceiro'
		OR designacao = 'Final')
);

CREATE TABLE Jogo(
	id INT,
	idEstadio INT, 
	dataJogo TEXT,
	idEquipaVisitada INT, 
	idEquipaVisitante INT, 
	idTipoJogo INT NOT NULL, 
	PRIMARY KEY (id),
	FOREIGN KEY (idEstadio) REFERENCES Estadio(id),
	FOREIGN KEY (idEquipaVisitada) REFERENCES Equipa(id),
	FOREIGN KEY (idEquipaVisitante) REFERENCES Equipa(id),
	FOREIGN KEY (idTipoJogo) REFERENCES TipoJogo(id)
);


CREATE TABLE Substituicao(
	id INT,
	minuto INT CHECK (minuto > 0),
	idJogadorEntra INT,
	idJogadorSai INT,
	idJogo INT,
	PRIMARY KEY (id),
	FOREIGN KEY (idJogadorEntra) REFERENCES Jogador(id),
	FOREIGN KEY (idJogadorSai) REFERENCES Jogador(id),
	FOREIGN KEY (idJogo) REFERENCES Jogo(id)
);

CREATE TABLE Cartao(
	id INT,
	cor TEXT,
	minuto INT CHECK (minuto > 0),
	idJogador INT,
	idJogo INT,
	PRIMARY KEY (id),
	FOREIGN KEY (idJogador) REFERENCES Jogador(id),
	FOREIGN KEY (idJogo) REFERENCES Jogo(id),
	CONSTRAINT cor_check CHECK (cor = "Amarelo" OR cor = "Vermelho")
);

CREATE TABLE Golo(
	id INT,
	minuto INT CHECK (minuto > 0),
	idJogador INT NOT NULL,
	idJogo INT NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (idJogador) REFERENCES Jogador(id),
	FOREIGN KEY (idJogo) REFERENCES Jogo(id)
);
