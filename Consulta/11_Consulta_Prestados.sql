USE [Biblioteca];

SELECT l.Titulo AS Prestados FROM Prestamos AS p
INNER JOIN Libros AS l ON p.Libro_FK = l.Libro_PK
WHERE p.FechaRetiro IS NOT NULL
AND p.FechaDevolucion IS NULL
ORDER BY l.Titulo;