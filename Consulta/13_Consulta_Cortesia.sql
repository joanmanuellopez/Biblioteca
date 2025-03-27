USE [Biblioteca];

-- nombre socio, la direcci�n de mail y el titulo del libro.
-- socios con pr�stamos a vencer dentro de cinco d�as.
SELECT s.Nombre, s.Mail, l.Titulo FROM Prestamos AS p
INNER JOIN Libros AS l ON p.Libro_FK = l.Libro_PK
INNER JOIN Socios AS s ON p.Socio_FK = s.Socio_PK
--WHERE diferencia entre hoy y la fecha de prestamo es mayor a 25 y no consta devolucion
WHERE p.FechaRetiro IS NOT NULL
AND p.FechaDevolucion IS null
AND DATEDIFF(DAY,p.FechaRetiro,GETDATE()) > 25;

