/* 1)*/
create view vista_libros_mas_prestados as select l.titulo, l.autor from Libro l join Prestamo p on l.id_libro = p.id_libro group by l.id_libro having count(p.id_prestamo) > 3;
Query OK, 0 rows affected (0.004 sec)
 select * from vista_libros_mas_prestados;
+---------+----------------+
| titulo  | autor          |
+---------+----------------+
| 1984    | George Orwell  |
| Rayuela | Julio Cort?zar |
+---------+----------------+
2 rows in set (0.003 sec)

/* 2) */

create view vista_socios_frecuentes as select s.id_socio, s.nombre from Socio s join Prestamo p on s.id_socio = p.id_socio group by s.id_socio having count(p.id_prestamo) > 5;
Query OK, 0 rows affected (0.010 sec)

MariaDB [Biblioteca]> select * from vista_socios_frecuentes;
+----------+------------+
| id_socio | nombre     |
+----------+------------+
|        1 | Ana Torres |
+----------+------------+
1 row in set (0.001 sec)

/* 3) */

create view vista_libros_no_prestados as select l.id_libro, l.titulo, l.autor from Libro l left join Prestamo p on l.id_libro = p.id_libro where p.id_libro is null;
Query OK, 0 rows affected (0.011 sec)

MariaDB [Biblioteca]> select * from vista_libros_no_prestados;
+----------+---------------------------------+------------------------+
| id_libro | titulo                          | autor                  |
+----------+---------------------------------+------------------------+
|        6 | La Sombra del Viento            | Carlos Ruiz Zaf?n      |
|        7 | Cr?nica de una muerte anunciada | Gabriel Garc?a M?rquez |
+----------+---------------------------------+------------------------+
2 rows in set (0.007 sec)

/* 4) */

create view vista_genero_popular as select  l.genero, count(p.id_prestamo) AS cantidad_prestamos from Libro l join Prestamo p on l.id_libro = p.id_libro group by l.genero order by cantidad_prestamos desc limit 1; 

select * from vista_genero_popular;
+-----------+--------------------+
| genero    | cantidad_prestamos |
+-----------+--------------------+
| Narrativa |                  5 |
+-----------+--------------------+
1 row in set (0.001 sec)

/* 5) */
create view vista_ultimos_prestamos as select s.nombre, l.titulo, p.fecha_prestamo from socio s join prestamo p on p.id_socio = s.id_socio join libro l on p.id_libro = l.id_libro where p.fecha_prestamo =
 (select max(fecha_prestamo) from prestamo pr where pr.id_socio = p.id_socio); 

select * from vista_ultimos_prestamos;
+----------------+--------------------------+----------------+
| nombre         | titulo                   | fecha_prestamo |
+----------------+--------------------------+----------------+
| Ana Torres     | Rayuela                  | 2024-05-17     |
| Juan Pérez     | Don Quijote de la Mancha | 2024-04-10     |
| Laura Díaz     | 1984                     | 2024-03-10     |
| Carlos Ramírez | 1984                     | 2024-04-01     |
| María Gómez    | El Principito            | 2024-03-05     |
+----------------+--------------------------+----------------+
5 rows in set (0.001 sec)
