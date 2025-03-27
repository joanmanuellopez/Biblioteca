USE [Biblioteca];

CREATE TABLE Socios
(
	PRIMARY KEY (Socio_PK),
	Socio_PK smallint NOT NULL IDENTITY(301,1),  --Primer ID de socio 301, incremento de 1 en 1
	Nombre varchar(50),	
	Direccion varchar(100),
	Telefono char(9), -- Telefono es un campo descriptivo a pesar de ser caracteres numéricos
	Mail varchar(30) CONSTRAINT Mail_format CHECK (Mail LIKE '%@%.%'),
	FechaAlta date CONSTRAINT FechaAlta_range CHECK (FechaAlta > '2025-01-01' )  -- Comprueba alta sea a partir de 2025
);