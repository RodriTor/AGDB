/*¨1. Devuelve un listado con el código de oficina y la ciudad donde hay oficinas. */

select codigo_oficina, ciudad from oficina;
+----------------+----------------------+
| codigo_oficina | ciudad               |
+----------------+----------------------+
| BCN-ES         | Barcelona            |
| BOS-USA        | Boston               |
| LON-UK         | Londres              |
| MAD-ES         | Madrid               |
| PAR-FR         | Paris                |
| SFC-USA        | San Francisco        |
| SYD-AU         | Sydney               |
| TAL-ES         | Talavera de la Reina |
| TOK-JP         | Tokyo                |
+----------------+----------------------+
9 rows in set (0.000 sec)

/* 2. Devuelve un listado con la ciudad y el teléfono de las oficinas de España. */

select ciudad, telefono from oficina where pais = 'Espa?a';
+----------------------+----------------+
| ciudad               | telefono       |
+----------------------+----------------+
| Barcelona            | +34 93 3561182 |
| Madrid               | +34 91 7514487 |
| Talavera de la Reina | +34 925 867231 |
+----------------------+----------------+
3 rows in set (0.000 sec)

/* 3. Devuelve un listado con el email, nombre, apellidos completos (Por ej. Fernandez Alonso, Mario Alfredo) 
de los empleados cuyo jefe tiene un código de jefe igual a 7. */

 select email, concat(nombre,' ',apellido1,' ',apellido2) as Nombre_Completo, codigo_jefe from empleado where codigo_jefe = '7';
+--------------------------+---------------------------+-------------+
| email                    | Nombre_Completo           | codigo_jefe |
+--------------------------+---------------------------+-------------+
| mlopez@jardineria.es     | Mariano L?pez Murcia      |           7 |
| lcampoamor@jardineria.es | Lucio Campoamor Mart?n    |           7 |
| hrodriguez@jardineria.es | Hilario Rodriguez Huertas |           7 |
+--------------------------+---------------------------+-------------+
3 rows in set (0.000 sec)

/* 4. Devuelve el nombre del puesto, nombre, apellidos y email del jefe de la empresa. */

select puesto, concat(nombre,' ',apellido1,' ',apellido2) as Nombre_Completo, email from empleado where codigo_jefe is null;
+------------------+---------------------+----------------------+
| puesto           | Nombre_Completo     | email                |
+------------------+---------------------+----------------------+
| Director General | Marcos Maga?a Perez | marcos@jardineria.es |
+------------------+---------------------+----------------------+
1 row in set (0.007 sec)


/* 5. Devuelve un listado con el nombre, apellidos y puesto de aquellos empleados que no sean representantes de ventas. */

select puesto, concat(nombre,' ',apellido1,' ',apellido2) as Nombre_Completo from empleado where puesto <> 'Representante Ventas';
+-----------------------+------------------------+
| puesto                | Nombre_Completo        |
+-----------------------+------------------------+
| Director General      | Marcos Maga?a Perez    |
| Subdirector Marketing | Ruben L?pez Martinez   |
| Subdirector Ventas    | Alberto Soria Carrasco |
| Secretaria            | Maria Sol?s Jerez      |
| Director Oficina      | Carlos Soria Jimenez   |
| Director Oficina      | Emmanuel Maga?a Perez  |
| Director Oficina      | Francois Fignon        |
| Director Oficina      | Michael Bolton         |
| Director Oficina      | Hilary Washington      |
| Director Oficina      | Nei Nishikori          |
| Director Oficina      | Amy Johnson            |
| Director Oficina      | Kevin Fallmer          |
+-----------------------+------------------------+
12 rows in set (0.000 sec)

/* 6. Devuelve un listado con el nombre de todos los clientes españoles. */ 

select nombre_cliente, ciudad, pais from cliente where pais = 'Spain';
+--------------------------------+--------------------------+-------+
| nombre_cliente                 | ciudad                   | pais  |
+--------------------------------+--------------------------+-------+
| Lasas S.A.                     | Fuenlabrada              | Spain |
| Beragua                        | Madrid                   | Spain |
| Club Golf Puerta del hierro    | Madrid                   | Spain |
| Naturagua                      | Madrid                   | Spain |
| DaraDistribuciones             | Madrid                   | Spain |
| Madrile?a de riegos            | Madrid                   | Spain |
| Lasas S.A.                     | Fuenlabrada              | Spain |
| Camunas Jardines S.L.          | San Lorenzo del Escorial | Spain |
| Dardena S.A.                   | Madrid                   | Spain |
| Jardin de Flores               | Madrid                   | Spain |
| Flores Marivi                  | Fuenlabrada              | Spain |
| Flowers, S.A                   | Montornes del valles     | Spain |
| Naturajardin                   | Madrid                   | Spain |
| Golf S.A.                      | Santa cruz de Tenerife   | Spain |
| Americh Golf Management SL     | Barcelona                | Spain |
| Aloha                          | Canarias                 | Spain |
| El Prat                        | Barcelona                | Spain |
| Sotogrande                     | Sotogrande               | Spain |
| Vivero Humanes                 | Humanes                  | Spain |
| Fuenla City                    | Fuenlabrada              | Spain |
| Jardines y Mansiones Cactus SL | Madrid                   | Spain |
| Jardiner?as Mat?as SL          | Madrid                   | Spain |
| Agrojardin                     | Getafe                   | Spain |
| Top Campo                      | Humanes                  | Spain |
| Jardineria Sara                | Fuenlabrada              | Spain |
| Campohermoso                   | Fuenlabrada              | Spain |
| Flores S.L.                    | Madrid                   | Spain |
+--------------------------------+--------------------------+-------+
27 rows in set (0.000 sec)

/* 7. Devuelve un listado con los distintos estados por los que puede pasar un pedido. */

 select distinct estado from pedido;
+-----------+
| estado    |
+-----------+
| Entregado |
| Rechazado |
| Pendiente |
+-----------+
3 rows in set (0.001 sec)

/* 8. Devuelve un listado con el código de cliente de aquellos clientes que realizaron algún pago en
2008. Tenga en cuenta que deberá eliminar aquellos códigos de cliente que aparezcan
repetidos. Resuelva la consulta:
 Utilizando la función YEAR
 Utilizando DATE_FORMAT
 Sin utilizar ninguna de las funciones anteriores. */

select distinct codigo_cliente, fecha_pago, total from pago where YEAR(fecha_pago) = 2008;
+----------------+------------+----------+
| codigo_cliente | fecha_pago | total    |
+----------------+------------+----------+
|              1 | 2008-11-10 |  2000.00 |
|              1 | 2008-12-10 |  2000.00 |
|             13 | 2008-08-04 |  2246.00 |
|             14 | 2008-07-15 |  4160.00 |
|             26 | 2008-03-18 | 18846.00 |
+----------------+------------+----------+
5 rows in set (0.001 sec)

select distinct codigo_cliente, fecha_pago, total from pago where date_format(fecha_pago, '%Y') = 2008;
+----------------+------------+----------+
| codigo_cliente | fecha_pago | total    |
+----------------+------------+----------+
|              1 | 2008-11-10 |  2000.00 |
|              1 | 2008-12-10 |  2000.00 |
|             13 | 2008-08-04 |  2246.00 |
|             14 | 2008-07-15 |  4160.00 |
|             26 | 2008-03-18 | 18846.00 |
+----------------+------------+----------+
5 rows in set (0.007 sec)

select codigo_cliente, fecha_pago, total from pago where fecha_pago between '2008-01-01' and '2008-12-31';
+----------------+------------+----------+
| codigo_cliente | fecha_pago | total    |
+----------------+------------+----------+
|              1 | 2008-11-10 |  2000.00 |
|              1 | 2008-12-10 |  2000.00 |
|             13 | 2008-08-04 |  2246.00 |
|             14 | 2008-07-15 |  4160.00 |
|             26 | 2008-03-18 | 18846.00 |
+----------------+------------+----------+
5 rows in set (0.000 sec)



/* 9. Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de
entrega de los pedidos que no han sido entregados a tiempo. */

 select codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega from pedido where fecha_entrega > fecha_esperada;
+---------------+----------------+----------------+---------------+
| codigo_pedido | codigo_cliente | fecha_esperada | fecha_entrega |
+---------------+----------------+----------------+---------------+
|             9 |              1 | 2008-12-27     | 2008-12-28    |
|            13 |              7 | 2009-01-14     | 2009-01-15    |
|            16 |              7 | 2009-01-07     | 2009-01-15    |
|            17 |              7 | 2009-01-09     | 2009-01-11    |
|            18 |              9 | 2009-01-06     | 2009-01-07    |
|            22 |              9 | 2009-01-11     | 2009-01-13    |
|            28 |              3 | 2009-02-17     | 2009-02-20    |
|            31 |             13 | 2008-09-30     | 2008-10-04    |
|            32 |              4 | 2007-01-19     | 2007-01-27    |
|            38 |             19 | 2009-03-06     | 2009-03-07    |
|            39 |             19 | 2009-03-07     | 2009-03-09    |
|            40 |             19 | 2009-03-10     | 2009-03-13    |
|            42 |             19 | 2009-03-23     | 2009-03-27    |
|            43 |             23 | 2009-03-26     | 2009-03-28    |
|            44 |             23 | 2009-03-27     | 2009-03-30    |
|            45 |             23 | 2009-03-04     | 2009-03-07    |
|            46 |             23 | 2009-03-04     | 2009-03-05    |
|            49 |             26 | 2008-07-22     | 2008-07-30    |
|            55 |             14 | 2009-01-10     | 2009-01-11    |
|            60 |              1 | 2008-12-27     | 2008-12-28    |
|            68 |              3 | 2009-02-17     | 2009-02-20    |
|            92 |             27 | 2009-04-30     | 2009-05-03    |
|            96 |             35 | 2008-04-12     | 2008-04-13    |
|           103 |             30 | 2009-01-20     | 2009-01-24    |
|           106 |             30 | 2009-05-15     | 2009-05-20    |
|           112 |             36 | 2009-04-06     | 2009-05-07    |
|           113 |             36 | 2008-11-09     | 2009-01-09    |
|           114 |             36 | 2009-01-29     | 2009-01-31    |
|           115 |             36 | 2009-01-26     | 2009-02-27    |
|           123 |             30 | 2009-01-20     | 2009-01-24    |
|           126 |             30 | 2009-05-15     | 2009-05-20    |
|           128 |             38 | 2008-12-10     | 2008-12-29    |
+---------------+----------------+----------------+---------------+
32 rows in set (0.007 sec)

/* 10. Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de
entrega de los pedidos cuya fecha de entrega ha sido al menos dos días antes de la fecha
esperada. 
 Utilizando la función ADDDATE
 Utilizando la función DATEDIFF */ 

/* 11. Devuelve un listado de todos los pedidos que fueron rechazados en 2009. */

select codigo_pedido, codigo_cliente, estado, fecha_pedido from pedido where estado = 'Rechazado' and year(fecha_pedido) = '2009';
+---------------+----------------+-----------+--------------+
| codigo_pedido | codigo_cliente | estado    | fecha_pedido |
+---------------+----------------+-----------+--------------+
|            14 |              7 | Rechazado | 2009-01-02   |
|            21 |              9 | Rechazado | 2009-01-09   |
|            25 |              1 | Rechazado | 2009-02-02   |
|            26 |              3 | Rechazado | 2009-02-06   |
|            40 |             19 | Rechazado | 2009-03-09   |
|            46 |             23 | Rechazado | 2009-04-03   |
|            65 |              1 | Rechazado | 2009-02-02   |
|            66 |              3 | Rechazado | 2009-02-06   |
|            74 |             15 | Rechazado | 2009-01-14   |
|            81 |             28 | Rechazado | 2009-01-18   |
|           101 |             16 | Rechazado | 2009-03-07   |
|           105 |             30 | Rechazado | 2009-02-14   |
|           120 |             16 | Rechazado | 2009-03-07   |
|           125 |             30 | Rechazado | 2009-02-14   |
+---------------+----------------+-----------+--------------+
14 rows in set (0.000 sec)

/* 12. Devuelve un listado de todos los pedidos que han sido entregados en el mes de enero de cualquier año */

select codigo_pedido, codigo_cliente, (fecha_pedido) as Pedidos_En_Enero from pedido where month(fecha_pedido) = '01';
+---------------+----------------+------------------+
| codigo_pedido | codigo_cliente | Pedidos_En_Enero |
+---------------+----------------+------------------+
|             1 |              5 | 2006-01-17       |
|             4 |              5 | 2009-01-20       |
|            10 |              3 | 2009-01-15       |
|            11 |              1 | 2009-01-20       |
|            12 |              1 | 2009-01-22       |
|            13 |              7 | 2009-01-12       |
|            14 |              7 | 2009-01-02       |
|            15 |              7 | 2009-01-09       |
|            16 |              7 | 2009-01-06       |
|            17 |              7 | 2009-01-08       |
|            18 |              9 | 2009-01-05       |
|            19 |              9 | 2009-01-18       |
|            20 |              9 | 2009-01-20       |
|            21 |              9 | 2009-01-09       |
|            22 |              9 | 2009-01-11       |
|            32 |              4 | 2007-01-07       |
|            54 |             14 | 2009-01-11       |
|            57 |             13 | 2009-01-05       |
|            58 |              3 | 2009-01-24       |
|            61 |              3 | 2009-01-15       |
|            62 |              1 | 2009-01-20       |
|            63 |              1 | 2009-01-22       |
|            64 |              1 | 2009-01-24       |
|            74 |             15 | 2009-01-14       |
|            75 |             15 | 2009-01-11       |
|            77 |             15 | 2009-01-03       |
|            79 |             28 | 2009-01-12       |
|            80 |             28 | 2009-01-25       |
|            81 |             28 | 2009-01-18       |
|            82 |             28 | 2009-01-20       |
|            83 |             28 | 2009-01-24       |
|            95 |             35 | 2008-01-04       |
|            98 |             35 | 2009-01-08       |
|           100 |             16 | 2009-01-10       |
|           103 |             30 | 2009-01-15       |
|           114 |             36 | 2009-01-15       |
|           119 |             16 | 2009-01-10       |
|           123 |             30 | 2009-01-15       |
+---------------+----------------+------------------+
38 rows in set (0.007 sec)

/* 13. Devuelve un listado con todos los pagos que se realizaron en el año 2008 mediante Paypal.
Ordene el resultado de mayor a menor */

 select codigo_cliente, forma_pago, fecha_pago from pago where forma_pago = 'PayPal' and year(fecha_pago) = '2008';
+----------------+------------+------------+
| codigo_cliente | forma_pago | fecha_pago |
+----------------+------------+------------+
|              1 | PayPal     | 2008-11-10 |
|              1 | PayPal     | 2008-12-10 |
|             13 | PayPal     | 2008-08-04 |
|             14 | PayPal     | 2008-07-15 |
|             26 | PayPal     | 2008-03-18 |
+----------------+------------+------------+
5 rows in set (0.000 sec)

/* 14. Devuelve un listado con todas las formas de pago que aparecen en la tabla pago. Tenga en
cuenta que no deben aparecer formas de pago repetidas. */ 

select distinct forma_pago from pago;
+---------------+
| forma_pago    |
+---------------+
| PayPal        |
| Transferencia |
| Cheque        |
+---------------+
3 rows in set (0.001 sec)

/* 15. Devuelve un listado con todos los productos que pertenecen a la gama Ornamentales y que
tienen más de 100 unidades en stock. El listado deberá estar ordenado por su precio de venta,
mostrando en primer lugar los de mayor precio */

select nombre, gama, cantidad_en_stock, precio_venta from producto where gama = 'Ornamentales' 
and cantidad_en_stock > 100 order by precio_venta desc;

+--------------------------------------------+--------------+-------------------+--------------+
| nombre                                     | gama         | cantidad_en_stock | precio_venta |
+--------------------------------------------+--------------+-------------------+--------------+
| Forsytia Intermedia "Lynwood"              | Ornamentales |               120 |         7.00 |
| Hibiscus Syriacus  "Diana" -Blanco Puro    | Ornamentales |               120 |         7.00 |
| Hibiscus Syriacus  "Helene" -Blanco-C.rojo | Ornamentales |               120 |         7.00 |
| Hibiscus Syriacus "Pink Giant" Rosa        | Ornamentales |               120 |         7.00 |
| Escallonia (Mix)                           | Ornamentales |               120 |         5.00 |
| Viburnum Tinus "Eve Price"                 | Ornamentales |               120 |         5.00 |
| Prunus pisardii                            | Ornamentales |               120 |         5.00 |
| Philadelphus "Virginal"                    | Ornamentales |               120 |         5.00 |
| Lonicera Pileata                           | Ornamentales |               120 |         5.00 |
| Lonicera Nitida "Maigrum"                  | Ornamentales |               120 |         5.00 |
| Lonicera Nitida                            | Ornamentales |               120 |         5.00 |
| Laurus Nobilis Arbusto - Ramificado Bajo   | Ornamentales |               120 |         5.00 |
| Evonimus Pulchellus                        | Ornamentales |               120 |         5.00 |
| Evonimus Emerald Gayeti                    | Ornamentales |               120 |         5.00 |
| Weigelia "Bristol Ruby"                    | Ornamentales |               120 |         5.00 |
+--------------------------------------------+--------------+-------------------+--------------+
15 rows in set (0.001 sec)

/* 16. Devuelve un listado con todos los clientes que sean de la ciudad de Madrid y cuyo
representante de ventas tenga el código de empleado 11 o 30. */

select c.codigo_cliente, c.nombre_cliente, c.ciudad, e.codigo_empleado from cliente c join empleado e
    -> on c.codigo_empleado_rep_ventas = e.codigo_empleado
    -> where c.ciudad = 'Madrid' and e.codigo_empleado in (11,30); 

+----------------+-----------------------------+--------+-----------------+
| codigo_cliente | nombre_cliente              | ciudad | codigo_empleado |
+----------------+-----------------------------+--------+-----------------+
|              7 | Beragua                     | Madrid |              11 |
|              8 | Club Golf Puerta del hierro | Madrid |              11 |
|              9 | Naturagua                   | Madrid |              11 |
|             10 | DaraDistribuciones          | Madrid |              11 |
|             11 | Madrileña de riegos         | Madrid |              11 |
|             15 | Jardin de Flores            | Madrid |              30 |
|             18 | Naturajardin                | Madrid |              30 |
+----------------+-----------------------------+--------+-----------------+
7 rows in set (0.036 sec)

/* 17. Obtén un listado con el nombre de cada cliente y el nombre y apellido de su representante de ventas.  */

select c.nombre_cliente, concat(e.nombre,' ', e.apellido1,' ', e.apellido2) as Representante_Ventas from cliente c join empleado e
on c.codigo_empleado_rep_ventas = e.codigo_empleado;

+--------------------------------+--------------------------------+
| nombre_cliente                 | Representante_Ventas           |
+--------------------------------+--------------------------------+
| GoldFish Garden                | Walter Santiago Sanchez Lopez  |
| Gardening Associates           | Walter Santiago Sanchez Lopez  |
| Gerudo Valley                  | Lorena Paxton                  |
| Tendo Garden                   | Lorena Paxton                  |
| Lasas S.A.                     | Mariano López Murcia           |
| Beragua                        | Emmanuel Magaña Perez          |
| Club Golf Puerta del hierro    | Emmanuel Magaña Perez          |
| Naturagua                      | Emmanuel Magaña Perez          |
| DaraDistribuciones             | Emmanuel Magaña Perez          |
| Madrileña de riegos            | Emmanuel Magaña Perez          |
| Lasas S.A.                     | Mariano López Murcia           |
| Camunas Jardines S.L.          | Mariano López Murcia           |
| Dardena S.A.                   | Mariano López Murcia           |
| Jardin de Flores               | Julian Bellinelli              |
| Flores Marivi                  | Felipe Rosas Marquez           |
| Flowers, S.A                   | Felipe Rosas Marquez           |
| Naturajardin                   | Julian Bellinelli              |
| Golf S.A.                      | José Manuel Martinez De la Osa |
| Americh Golf Management SL     | José Manuel Martinez De la Osa |
| Aloha                          | José Manuel Martinez De la Osa |
| El Prat                        | José Manuel Martinez De la Osa |
| Sotogrande                     | José Manuel Martinez De la Osa |
| Vivero Humanes                 | Julian Bellinelli              |
| Fuenla City                    | Felipe Rosas Marquez           |
| Jardines y Mansiones Cactus SL | Lucio Campoamor Martín         |
| Jardinerías Matías SL          | Lucio Campoamor Martín         |
| Agrojardin                     | Julian Bellinelli              |
| Top Campo                      | Felipe Rosas Marquez           |
| Jardineria Sara                | Felipe Rosas Marquez           |
| Campohermoso                   | Julian Bellinelli              |
| france telecom                 | Lionel Narvaez                 |
| Musée du Louvre                | Lionel Narvaez                 |
| Tutifruti S.A                  | Mariko Kishi                   |
| Flores S.L.                    | Michael Bolton                 |
| The Magic Garden               | Michael Bolton                 |
| El Jardin Viviente S.L         | Mariko Kishi                   |
+--------------------------------+--------------------------------+
36 rows in set (0.001 sec)

/* 18. Muestra el nombre de los clientes que hayan realizado pagos junto con el nombre de sus
representantes de ventas. */ 

select c.nombre_cliente, concat(e.nombre,' ', e.apellido1,' ', e.apellido2) as Representante_Ventas, (p.fecha_pago) as Pago_Realizado from cliente c 
join empleado e on c.codigo_empleado_rep_ventas = e.codigo_empleado 
join pago p on p.codigo_cliente = c.codigo_cliente;

+--------------------------------+--------------------------------+----------------+
| nombre_cliente                 | Representante_Ventas           | Pago_Realizado |
+--------------------------------+--------------------------------+----------------+
| GoldFish Garden                | Walter Santiago Sanchez Lopez  | 2008-11-10     |
| GoldFish Garden                | Walter Santiago Sanchez Lopez  | 2008-12-10     |
| Gardening Associates           | Walter Santiago Sanchez Lopez  | 2009-01-16     |
| Gardening Associates           | Walter Santiago Sanchez Lopez  | 2009-02-16     |
| Gardening Associates           | Walter Santiago Sanchez Lopez  | 2009-02-19     |
| Gerudo Valley                  | Lorena Paxton                  | 2007-01-08     |
| Gerudo Valley                  | Lorena Paxton                  | 2007-01-08     |
| Gerudo Valley                  | Lorena Paxton                  | 2007-01-08     |
| Gerudo Valley                  | Lorena Paxton                  | 2007-01-08     |
| Gerudo Valley                  | Lorena Paxton                  | 2007-01-08     |
| Tendo Garden                   | Lorena Paxton                  | 2006-01-18     |
| Beragua                        | Emmanuel Magaña Perez          | 2009-01-13     |
| Naturagua                      | Emmanuel Magaña Perez          | 2009-01-06     |
| Camunas Jardines S.L.          | Mariano López Murcia           | 2008-08-04     |
| Dardena S.A.                   | Mariano López Murcia           | 2008-07-15     |
| Jardin de Flores               | Julian Bellinelli              | 2009-01-15     |
| Jardin de Flores               | Julian Bellinelli              | 2009-02-15     |
| Flores Marivi                  | Felipe Rosas Marquez           | 2009-02-16     |
| Golf S.A.                      | José Manuel Martinez De la Osa | 2009-03-06     |
| Sotogrande                     | José Manuel Martinez De la Osa | 2009-03-26     |
| Jardines y Mansiones Cactus SL | Lucio Campoamor Martín         | 2008-03-18     |
| Jardinerías Matías SL          | Lucio Campoamor Martín         | 2009-02-08     |
| Agrojardin                     | Julian Bellinelli              | 2009-01-13     |
| Jardineria Sara                | Felipe Rosas Marquez           | 2009-01-16     |
| Tutifruti S.A                  | Mariko Kishi                   | 2007-10-06     |
| El Jardin Viviente S.L         | Mariko Kishi                   | 2006-05-26     |
+--------------------------------+--------------------------------+----------------+
26 rows in set (0.003 sec)

/* 19. Muestra el nombre de los clientes que no hayan realizado pagos junto con el nombre de sus representantes de ventas. */

select c.nombre_cliente, concat(e.nombre,' ', e.apellido1,' ', e.apellido2) as Representante_Ventas from cliente c 
join empleado e on c.codigo_empleado_rep_ventas = e.codigo_empleado 
left join pago p on p.codigo_cliente = c.codigo_cliente
WHERE p.codigo_cliente IS NULL;

+-----------------------------+--------------------------------+
| nombre_cliente              | Representante_Ventas           |
+-----------------------------+--------------------------------+
| Lasas S.A.                  | Mariano López Murcia           |
| Club Golf Puerta del hierro | Emmanuel Magaña Perez          |
| DaraDistribuciones          | Emmanuel Magaña Perez          |
| Madrileña de riegos         | Emmanuel Magaña Perez          |
| Lasas S.A.                  | Mariano López Murcia           |
| Flowers, S.A                | Felipe Rosas Marquez           |
| Naturajardin                | Julian Bellinelli              |
| Americh Golf Management SL  | José Manuel Martinez De la Osa |
| Aloha                       | José Manuel Martinez De la Osa |
| El Prat                     | José Manuel Martinez De la Osa |
| Vivero Humanes              | Julian Bellinelli              |
| Fuenla City                 | Felipe Rosas Marquez           |
| Top Campo                   | Felipe Rosas Marquez           |
| Campohermoso                | Julian Bellinelli              |
| france telecom              | Lionel Narvaez                 |
| Musée du Louvre             | Lionel Narvaez                 |
| Flores S.L.                 | Michael Bolton                 |
| The Magic Garden            | Michael Bolton                 |
+-----------------------------+--------------------------------+
18 rows in set (0.001 sec)

/* 20. Devuelve el nombre de los clientes que han hecho pagos y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante. */

select c.nombre_cliente, concat(e.nombre,' ', e.apellido1,' ', e.apellido2) as Representante_Ventas, (p.fecha_pago) as Pago_Realizado, (o.ciudad) as Ciudad_Oficina from cliente c 
join empleado e on c.codigo_empleado_rep_ventas = e.codigo_empleado 
join pago p on p.codigo_cliente = c.codigo_cliente
join oficina o on e.codigo_oficina = o.codigo_oficina;

+--------------------------------+--------------------------------+----------------+----------------------+
| nombre_cliente                 | Representante_Ventas           | Pago_Realizado | Ciudad_Oficina       |
+--------------------------------+--------------------------------+----------------+----------------------+
| Beragua                        | Emmanuel Magaña Perez          | 2009-01-13     | Barcelona            |
| Naturagua                      | Emmanuel Magaña Perez          | 2009-01-06     | Barcelona            |
| Golf S.A.                      | José Manuel Martinez De la Osa | 2009-03-06     | Barcelona            |
| Sotogrande                     | José Manuel Martinez De la Osa | 2009-03-26     | Barcelona            |
| Gerudo Valley                  | Lorena Paxton                  | 2007-01-08     | Boston               |
| Gerudo Valley                  | Lorena Paxton                  | 2007-01-08     | Boston               |
| Gerudo Valley                  | Lorena Paxton                  | 2007-01-08     | Boston               |
| Gerudo Valley                  | Lorena Paxton                  | 2007-01-08     | Boston               |
| Gerudo Valley                  | Lorena Paxton                  | 2007-01-08     | Boston               |
| Tendo Garden                   | Lorena Paxton                  | 2006-01-18     | Boston               |
| Camunas Jardines S.L.          | Mariano López Murcia           | 2008-08-04     | Madrid               |
| Dardena S.A.                   | Mariano López Murcia           | 2008-07-15     | Madrid               |
| Jardines y Mansiones Cactus SL | Lucio Campoamor Martín         | 2008-03-18     | Madrid               |
| Jardinerías Matías SL          | Lucio Campoamor Martín         | 2009-02-08     | Madrid               |
| GoldFish Garden                | Walter Santiago Sanchez Lopez  | 2008-11-10     | San Francisco        |
| GoldFish Garden                | Walter Santiago Sanchez Lopez  | 2008-12-10     | San Francisco        |
| Gardening Associates           | Walter Santiago Sanchez Lopez  | 2009-01-16     | San Francisco        |
| Gardening Associates           | Walter Santiago Sanchez Lopez  | 2009-02-16     | San Francisco        |
| Gardening Associates           | Walter Santiago Sanchez Lopez  | 2009-02-19     | San Francisco        |
| Jardin de Flores               | Julian Bellinelli              | 2009-01-15     | Sydney               |
| Jardin de Flores               | Julian Bellinelli              | 2009-02-15     | Sydney               |
| Agrojardin                     | Julian Bellinelli              | 2009-01-13     | Sydney               |
| Tutifruti S.A                  | Mariko Kishi                   | 2007-10-06     | Sydney               |
| El Jardin Viviente S.L         | Mariko Kishi                   | 2006-05-26     | Sydney               |
| Flores Marivi                  | Felipe Rosas Marquez           | 2009-02-16     | Talavera de la Reina |
| Jardineria Sara                | Felipe Rosas Marquez           | 2009-01-16     | Talavera de la Reina |
+--------------------------------+--------------------------------+----------------+----------------------+
26 rows in set (0.006 sec)
