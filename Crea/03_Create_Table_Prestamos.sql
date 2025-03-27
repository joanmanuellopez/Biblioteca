USE [Biblioteca];

CREATE TABLE Prestamos
(
	PRIMARY KEY (Prestamo_ID),
	Prestamo_ID smallint NOT NULL IDENTITY(1,1),  --Primer ID 1, incremento de 1 en 1
	Libro_FK smallint NOT NULL CONSTRAINT FK_prestamo_libro FOREIGN KEY (Libro_FK) REFERENCES Libros(Libro_PK),
	Socio_FK smallint NOT NULL CONSTRAINT FK_prestamo_socio FOREIGN KEY (Socio_FK) REFERENCES Socios(Socio_PK),
	FechaRetiro date NOT NULL,
	FechaDevolucion date   --Puede ser nulo si aun no se ha devuelto
);
