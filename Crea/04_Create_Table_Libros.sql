USE [Biblioteca];

CREATE TABLE Libros
(
	PRIMARY KEY (Libro_PK),
	Libro_PK smallint NOT NULL IDENTITY(1101,1),  --Primer ID de libro 1101, incremento de 1 en 1
	Titulo varchar(75),	
	Autor_FK tinyint NOT NULL DEFAULT 0 CONSTRAINT FK_autor FOREIGN KEY (Autor_FK) REFERENCES Autores(Autor_PK),
	AnyoEd smallint CONSTRAINT AnyoEd_range CHECK (AnyoEd between 1900 and 1940 )  -- Comprueba que el año esté entre 1900 y 1940
);

/*
-- Primera version de la query de creacion de la tabla, sin tener en cuenta la tabla de autores
CREATE TABLE Libros
(
	PRIMARY KEY (Libro_PK),
	Libro_PK smallint NOT NULL IDENTITY(1101,1),  --Primer ID de libro 1101, incremento de 1 en 1
	Titulo varchar(75),	
	Autor varchar(50),
	AnyoEd smallint CONSTRAINT AnyoEd_range CHECK (AnyoEd between 1900 and 1940 )  -- Comprueba que el año esté entre 1900 y 1940
);

-- Rectificacion de la tabla original para añadir la tabla de autores
ALTER TABLE Libros
ADD Autor_FK tinyint NOT NULL DEFAULT 0;

ALTER TABLE Libros
ADD CONSTRAINT FK_autor FOREIGN KEY (Autor_FK) REFERENCES Autores(Autor_PK);

ALTER TABLE Libros
DROP COLUMN Autor
*/
