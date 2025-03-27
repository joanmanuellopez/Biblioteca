USE [Biblioteca];

-- Listado de los libros de la biblioteca
SELECT a.Autor, l.Titulo, l.AnyoEd FROM Libros l
INNER JOIN Autores AS a ON l.Autor_FK = a.Autor_PK
ORDER BY a.Autor, l.AnyoEd;