USE [Biblioteca];

CREATE TABLE Autores
(
	PRIMARY KEY (Autor_PK),
	Autor_PK tinyint NOT NULL IDENTITY(1,1),  --Primer ID de autor 1, incremento de 1 en 1
	Autor varchar(50)
);