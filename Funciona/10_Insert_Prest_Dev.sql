-- 6 execs para prestar
--EXEC Presta_Libro 303, 1202;

-- 2 execs para devolver -> resultara 4 prestados y 2 devueltos

-- 3 updates para las alertas de cortesia ('2025-02-28')

INSERT INTO Prestamos (Libro_FK,Socio_FK,FechaRetiro)
VALUES
	(1203,305,'2025-02-27'),
	(1205,307,'2025-02-27'),
	(1213,302,'2025-02-28'),
	(1234,315,'2025-03-15'),
	(1236,310,'2025-03-20'),
	(1249,308,'2025-03-24');

UPDATE Prestamos
SET FechaDevolucion = '2025-03-27'
WHERE Prestamo_ID = 4;

UPDATE Prestamos
SET FechaDevolucion = '2025-03-27'
WHERE Prestamo_ID = 6;
