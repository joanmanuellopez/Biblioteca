ALTER PROCEDURE Presta_Libro
(
	@socio smallint,
	@libro smallint
)
AS
	-- Verfica la existencia del socio
	IF NOT EXISTS (SELECT TOP 1 Socio_PK FROM Socios WHERE Socio_PK = @socio)
	BEGIN
		PRINT 'El socio n�mero ' + @socio + ' no est� registrado.';
		RETURN;
	END
	-- Verifica la existencia del libro
	IF NOT EXISTS (SELECT TOP 1 Libro_PK FROM Libros WHERE Libro_PK = @libro)
	BEGIN
		PRINT 'El libro con ID ' + @libro + ' no existe.';
		RETURN;
	END
	-- Verifica la disponibilidad del libro, si el �ltimo retiro no ha sido devuelto
	IF (SELECT TOP 1 FechaDevolucion
	    FROM Prestamos
		WHERE Libro_FK = @libro
		ORDER BY Prestamo_ID DESC) IS NULL
	BEGIN
		PRINT 'El libro con ID ' + @libro + ' no est� disponible.';
		RETURN;
	END
	

	-- Asigna el pr�stamo del libro al socio en la tabla de pr�stamos
	INSERT INTO Prestamos(Libro_FK,Socio_FK,FechaRetiro)
	VALUES
		(@libro,@socio,GETDATE());