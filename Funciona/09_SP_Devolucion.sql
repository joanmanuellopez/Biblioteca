CREATE PROCEDURE Devuelve_Libro
(
	@libro smallint
)
AS
	-- Verifica la existencia del libro
	IF NOT EXISTS (SELECT TOP 1 Libro_PK FROM Libros WHERE Libro_PK = @libro)
	BEGIN
		PRINT 'El libro con ID ' + @libro + ' no existe.';
		RETURN;
	END
	-- Verifica que el libro est� en pr�stamo, si consta fecha prestado y no fecha devuelto
	IF NOT EXISTS (SELECT TOP 1 * FROM Prestamos
		           WHERE Libro_FK = @libro
			       AND FechaRetiro IS NOT NULL
			       AND FechaDevolucion IS NULL
		           ORDER BY Prestamo_ID DESC)
	BEGIN
		PRINT 'El libro con ID ' + @libro + ' no est� en pr�stamo.';
		RETURN;
	END
	
	-- Obtencion del ID del �ltimo pr�stamo
	DECLARE @prestamo smallint
	SELECT @prestamo = Prestamo_ID FROM Prestamos 
	                   WHERE Prestamo_ID IN (
							SELECT TOP 1 Prestamo_ID FROM Prestamos
							WHERE Libro_FK = @libro
							ORDER BY Prestamo_ID DESC)

	-- Asigna la fecha de devoluci�n del libro en la tabla de pr�stamos
	UPDATE Prestamos 
	SET FechaDevolucion = GETDATE()
	WHERE Prestamo_ID = @prestamo;
