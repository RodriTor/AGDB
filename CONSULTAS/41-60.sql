/* 1. Calcula el precio de venta del producto más caro y más barato en una misma consulta. Ç*/

 SELECT MAX(precio_venta) AS precio_mas_caro, MIN(precio_venta) AS precio_mas_barato FROM producto;
+-----------------+-------------------+
| precio_mas_caro | precio_mas_barato |
+-----------------+-------------------+
|          462.00 |              1.00 |
+-----------------+-------------------+
1 row in set (0.042 sec)

/* 2. Calcula el número de clientes que tiene la empresa. */

SELECT COUNT(*) AS total_clientes FROM cliente;
+----------------+
| total_clientes |
+----------------+
|             36 |
+----------------+
1 row in set (0.007 sec)
  
/* 3. ¿Cuántos clientes tiene la ciudad de Madrid? */

select count(*) as Clientes_Madrid from cliente where ciudad = 'Madrid';
+-----------------+
| Clientes_Madrid |
+-----------------+
|              11 |
+-----------------+
1 row in set (0.000 sec)
  
/* 4. ¿Calcula cuántos clientes tiene cada una de las ciudades que empiezan por M? */

select count(*) as Clientes_De_Ciudades_M, ciudad from cliente where ciudad like 'M%' group by ciudad;

+------------------------+----------------------+
| Clientes_De_Ciudades_M | ciudad               |
+------------------------+----------------------+
|                     11 | Madrid               |
|                      2 | Miami                |
|                      1 | Montornes del valles |
+------------------------+----------------------+
3 rows in set (0.000 sec)

/* 5. Devuelve el nombre de los representantes de ventas y el número de clientes al que atiende cada uno. */

select concat(e.nombre,' ',e.apellido1,' ',e.apellido2) as Nombre_Representante, count(c.codigo_cliente) as Clientes_Atendidos from empleado e join cliente c
  on e.codigo_empleado = c.codigo_empleado_rep_ventas
  group by Nombre_Representante;

+--------------------------------+--------------------+
| Nombre_Representante           | Clientes_Atendidos |
+--------------------------------+--------------------+
| Emmanuel Magaña Perez          |                  5 |
| Felipe Rosas Marquez           |                  5 |
| José Manuel Martinez De la Osa |                  5 |
| Julian Bellinelli              |                  5 |
| Lionel Narvaez                 |                  2 |
| Lorena Paxton                  |                  2 |
| Lucio Campoamor Martín         |                  2 |
| Mariano López Murcia           |                  4 |
| Mariko Kishi                   |                  2 |
| Michael Bolton                 |                  2 |
| Walter Santiago Sanchez Lopez  |                  2 |
+--------------------------------+--------------------+
11 rows in set (0.000 sec)
  
/* 6. Calcula el número de clientes que no tiene asignado representante de ventas.   */

SELECT COUNT(*) AS clientes_sin_representante FROM cliente WHERE codigo_empleado_rep_ventas IS NULL;
+----------------------------+
| clientes_sin_representante |
+----------------------------+
|                          0 |
+----------------------------+
1 row in set (0.000 sec)
  
/* 7. Calcula la fecha del primer y último pago realizado por cada uno de los clientes. El listado deberá mostrar el nombre y los apellidos de cada cliente. */

SELECT c.nombre_cliente, MIN(p.fecha_pago) AS primer_pago, MAX(p.fecha_pago) AS ultimo_pago FROM cliente c
JOIN pago p ON c.codigo_cliente = p.codigo_cliente
GROUP BY c.codigo_cliente, c.nombre_cliente;
+--------------------------------+-------------+-------------+
| nombre_cliente                 | primer_pago | ultimo_pago |
+--------------------------------+-------------+-------------+
| GoldFish Garden                | 2008-11-10  | 2008-12-10  |
| Gardening Associates           | 2009-01-16  | 2009-02-19  |
| Gerudo Valley                  | 2007-01-08  | 2007-01-08  |
| Tendo Garden                   | 2006-01-18  | 2006-01-18  |
| Beragua                        | 2009-01-13  | 2009-01-13  |
| Naturagua                      | 2009-01-06  | 2009-01-06  |
| Camunas Jardines S.L.          | 2008-08-04  | 2008-08-04  |
| Dardena S.A.                   | 2008-07-15  | 2008-07-15  |
| Jardin de Flores               | 2009-01-15  | 2009-02-15  |
| Flores Marivi                  | 2009-02-16  | 2009-02-16  |
| Golf S.A.                      | 2009-03-06  | 2009-03-06  |
| Sotogrande                     | 2009-03-26  | 2009-03-26  |
| Jardines y Mansiones Cactus SL | 2008-03-18  | 2008-03-18  |
| Jardinerías Matías SL          | 2009-02-08  | 2009-02-08  |
| Agrojardin                     | 2009-01-13  | 2009-01-13  |
| Jardineria Sara                | 2009-01-16  | 2009-01-16  |
| Tutifruti S.A                  | 2007-10-06  | 2007-10-06  |
| El Jardin Viviente S.L         | 2006-05-26  | 2006-05-26  |
+--------------------------------+-------------+-------------+
18 rows in set (0.002 sec)

/* 8. Calcula el número de productos diferentes que hay en cada uno de los pedidos. */

MariaDB [jardineria]> select codigo_pedido, count(distinct codigo_producto) as Productos_Diferentes from detalle_pedido group by codigo_pedido;
+---------------+----------------------+
| codigo_pedido | Productos_Diferentes |
+---------------+----------------------+
|             1 |                    5 |
|             2 |                    6 |
|             3 |                    6 |
|             4 |                    8 |
|             8 |                    3 |
|             9 |                    4 |
|            10 |                    3 |
|            11 |                    2 |
|            12 |                    1 |
|            13 |                    3 |
|            14 |                    2 |
|            15 |                    4 |
|            16 |                    2 |
|            17 |                    5 |
|            18 |                    3 |
|            19 |                    5 |
|            20 |                    2 |
|            21 |                    3 |
|            22 |                    1 |
|            23 |                    4 |
|            24 |                    4 |
|            25 |                    3 |
|            26 |                    3 |
|            27 |                    3 |
|            28 |                    3 |
|            29 |                    5 |
|            30 |                    6 |
|            31 |                    2 |
|            32 |                    5 |
|            33 |                    4 |
|            34 |                    3 |
|            35 |                    5 |
|            36 |                    5 |
|            37 |                    3 |
|            38 |                    2 |
|            39 |                    2 |
|            40 |                    2 |
|            41 |                    2 |
|            42 |                    2 |
|            43 |                    1 |
|            44 |                    1 |
|            45 |                    2 |
|            46 |                    2 |
|            47 |                    2 |
|            48 |                    5 |
|            49 |                    3 |
|            50 |                    3 |
|            51 |                    3 |
|            52 |                    1 |
|            53 |                    3 |
|            54 |                    7 |
|            55 |                    5 |
|            56 |                    6 |
|            57 |                    4 |
|            58 |                    4 |
|            59 |                    1 |
|            60 |                    1 |
|            61 |                    1 |
|            62 |                    1 |
|            63 |                    1 |
|            64 |                    1 |
|            65 |                    1 |
|            66 |                    1 |
|            67 |                    1 |
|            68 |                    1 |
|            74 |                    3 |
|            75 |                    3 |
|            76 |                    5 |
|            77 |                    2 |
|            78 |                    4 |
|            79 |                    1 |
|            80 |                    3 |
|            81 |                    1 |
|            82 |                    1 |
|            83 |                    1 |
|            89 |                    5 |
|            90 |                    3 |
|            91 |                    3 |
|            92 |                    3 |
|            93 |                    3 |
|            94 |                    2 |
|            95 |                    3 |
|            96 |                    4 |
|            97 |                    3 |
|            98 |                    5 |
|            99 |                    2 |
|           100 |                    2 |
|           101 |                    2 |
|           102 |                    2 |
|           103 |                    2 |
|           104 |                    2 |
|           105 |                    2 |
|           106 |                    2 |
|           107 |                    2 |
|           108 |                    2 |
|           109 |                    7 |
|           110 |                    3 |
|           111 |                    1 |
|           112 |                    1 |
|           113 |                    1 |
|           114 |                    1 |
|           115 |                    1 |
|           116 |                    5 |
|           117 |                    4 |
|           118 |                    1 |
|           119 |                    1 |
|           120 |                    1 |
|           121 |                    1 |
|           122 |                    1 |
|           123 |                    1 |
|           124 |                    1 |
|           125 |                    1 |
|           126 |                    1 |
|           127 |                    1 |
|           128 |                    2 |
+---------------+----------------------+
115 rows in set (0.001 sec)
  
/* 9. Calcula la suma de la cantidad total de todos los productos que aparecen en cada uno de los pedidos. */

 SELECT codigo_pedido, SUM(cantidad) AS total_productos FROM detalle_pedido GROUP BY codigo_pedido;
+---------------+-----------------+
| codigo_pedido | total_productos |
+---------------+-----------------+
|             1 |             113 |
|             2 |             161 |
|             3 |             232 |
|             4 |             179 |
|             8 |              14 |
|             9 |             625 |
|            10 |              40 |
|            11 |             260 |
|            12 |             290 |
|            13 |              22 |
|            14 |              21 |
|            15 |              21 |
|            16 |              22 |
|            17 |              25 |
|            18 |              16 |
|            19 |              41 |
|            20 |              22 |
|            21 |              30 |
|            22 |               1 |
|            23 |             194 |
|            24 |              19 |
|            25 |              29 |
|            26 |              27 |
|            27 |              84 |
|            28 |              12 |
|            29 |              40 |
|            30 |              33 |
|            31 |              26 |
|            32 |              40 |
|            33 |             905 |
|            34 |              56 |
|            35 |             178 |
|            36 |              28 |
|            37 |             245 |
|            38 |               7 |
|            39 |               9 |
|            40 |              12 |
|            41 |              10 |
|            42 |               4 |
|            43 |               9 |
|            44 |               5 |
|            45 |              10 |
|            46 |              12 |
|            47 |              14 |
|            48 |             147 |
|            49 |              65 |
|            50 |              71 |
|            51 |             200 |
|            52 |              10 |
|            53 |               9 |
|            54 |              69 |
|            55 |              20 |
|            56 |              22 |
|            57 |              17 |
|            58 |             364 |
|            59 |              10 |
|            60 |              10 |
|            61 |              10 |
|            62 |              10 |
|            63 |              10 |
|            64 |              10 |
|            65 |              10 |
|            66 |              10 |
|            67 |              10 |
|            68 |              10 |
|            74 |              91 |
|            75 |             130 |
|            76 |             374 |
|            77 |              49 |
|            78 |             153 |
|            79 |              50 |
|            80 |             162 |
|            81 |              30 |
|            82 |              34 |
|            83 |              30 |
|            89 |              32 |
|            90 |              41 |
|            91 |             101 |
|            92 |              62 |
|            93 |              79 |
|            94 |              45 |
|            95 |              20 |
|            96 |              36 |
|            97 |              36 |
|            98 |              62 |
|            99 |              45 |
|           100 |              60 |
|           101 |             209 |
|           102 |              55 |
|           103 |              64 |
|           104 |             122 |
|           105 |              48 |
|           106 |             278 |
|           107 |             158 |
|           108 |             112 |
|           109 |              69 |
|           110 |              21 |
|           111 |              10 |
|           112 |              10 |
|           113 |              10 |
|           114 |              10 |
|           115 |              10 |
|           116 |              78 |
|           117 |              24 |
|           118 |              10 |
|           119 |              10 |
|           120 |              10 |
|           121 |              10 |
|           122 |              10 |
|           123 |              10 |
|           124 |              10 |
|           125 |              10 |
|           126 |              10 |
|           127 |              10 |
|           128 |              33 |
+---------------+-----------------+
115 rows in set (0.000 sec)
  
/*10. Devuelve un listado de los 20 productos más vendidos y el número total de unidades que se han vendido de cada uno. El listado deberá estar ordenado por el número total de unidades vendidas. */

SELECT p.nombre, SUM(dp.cantidad) AS total_vendido FROM producto p
    JOIN detalle_pedido dp ON p.codigo_producto = dp.codigo_producto GROUP BY p.codigo_producto, p.nombre ORDER BY total_vendido DESC LIMIT 20;
+--------------------------------------------+---------------+
| nombre                                     | total_vendido |
+--------------------------------------------+---------------+
| Thymus Vulgaris                            |           961 |
| Thymus Citriodra (Tomillo limón)           |           455 |
| Rosal bajo 1Âª -En maceta-inicio brotación |           423 |
| Petrosilium Hortense (Peregil)             |           291 |
| Cerezo                                     |           285 |
| Trachycarpus Fortunei                      |           279 |
| Acer Pseudoplatanus                        |           262 |
| Chamaerops Humilis                         |           236 |
| Tuja orientalis "Aurea nana"               |           221 |
| Azadón                                     |           220 |
| Brahea Armata                              |           212 |
| Kaki Rojo Brillante                        |           203 |
| Robinia Pseudoacacia Casque Rouge          |           150 |
| Ajedrea                                    |           135 |
| Limonero 30/40                             |           131 |
| Lavándula Dentata                          |           128 |
| Nerium oleander ARBOL Calibre 8/10         |           127 |
| Nogal Común                                |           120 |
| Cerezo Napoleón                            |           120 |
| Nectarina                                  |           114 |
+--------------------------------------------+---------------+
20 rows in set (0.001 sec)
  
11. La facturación que ha tenido la empresa en toda la historia, indicando la base imponible, el IVA
y el total facturado. La base imponible se calcula sumando el coste del producto por el número
de unidades vendidas de la tabla detalle_pedido. El IVA es el 21 % de la base imponible, y el
total la suma de los dos campos anteriores.
12. La misma información que en la pregunta anterior, pero agrupada por código de producto.
13. La misma información que en la pregunta anterior, pero agrupada por código de producto
filtrada por los códigos que empiecen por OR.
14. Lista las ventas totales de los productos que hayan facturado más de 3000 euros. Se mostrará
el nombre, unidades vendidas, total facturado y total facturado con impuestos (21% IVA).
15. Devuelve el nombre del cliente con mayor límite de crédito.

select nombre_cliente, limite_credito from cliente order by limite_credito DESC limit 1;
+----------------+----------------+
| nombre_cliente | limite_credito |
+----------------+----------------+
| Tendo Garden   |      600000.00 |
+----------------+----------------+
1 row in set (0.000 sec)
 
16. Devuelve el nombre del producto que tenga el precio de venta más caro.
17. Devuelve el nombre del producto del que se han vendido más unidades. (Tenga en cuenta que
tendrá que calcular cuál es el número total de unidades que se han vendido de cada producto a
partir de los datos de la tabla detalle_pedido. Una vez que sepa cuál es el código del producto,
puede obtener su nombre fácilmente.)
18. Los clientes cuyo límite de crédito sea mayor que los pagos que haya realizado. (Sin
utilizar INNER JOIN).

 
19. Devuelve el producto que más unidades tiene en stock.

SELECT codigo_producto, nombre, cantidad_en_stock FROM producto
    -> WHERE cantidad_en_stock = (
    ->   SELECT MAX(cantidad_en_stock)
    ->   FROM producto
    -> );
+-----------------+---------------------------------+-------------------+
| codigo_producto | nombre                          | cantidad_en_stock |
+-----------------+---------------------------------+-------------------+
| FR-23           | Rosal copa                      |               400 |
| FR-24           | Albaricoquero Corbato           |               400 |
| FR-25           | Albaricoquero Moniqui           |               400 |
| FR-26           | Albaricoquero Kurrot            |               400 |
| FR-27           | Cerezo Burlat                   |               400 |
| FR-28           | Cerezo Picota                   |               400 |
| FR-29           | Cerezo Napole?n                 |               400 |
| FR-30           | Ciruelo R. Claudia Verde        |               400 |
| FR-31           | Ciruelo Santa Rosa              |               400 |
| FR-32           | Ciruelo Golden Japan            |               400 |
| FR-33           | Ciruelo Friar                   |               400 |
| FR-34           | Ciruelo Reina C. De Ollins      |               400 |
| FR-35           | Ciruelo Claudia Negra           |               400 |
| FR-36           | Granado Mollar de Elche         |               400 |
| FR-37           | Higuera Napolitana              |               400 |
| FR-38           | Higuera Verdal                  |               400 |
| FR-39           | Higuera Breva                   |               400 |
| FR-40           | Manzano Starking Delicious      |               400 |
| FR-41           | Manzano Reineta                 |               400 |
| FR-42           | Manzano Golden Delicious        |               400 |
| FR-43           | Membrillero Gigante de Wranja   |               400 |
| FR-44           | Melocotonero Spring Crest       |               400 |
| FR-45           | Melocotonero Amarillo de Agosto |               400 |
| FR-46           | Melocotonero Federica           |               400 |
| FR-47           | Melocotonero Paraguayo          |               400 |
| FR-48           | Nogal Com?n                     |               400 |
| FR-49           | Parra Uva de Mesa               |               400 |
| FR-50           | Peral Castell                   |               400 |
| FR-51           | Peral Williams                  |               400 |
| FR-52           | Peral Conference                |               400 |
| FR-53           | Peral Blanq. de Aranjuez        |               400 |
| FR-54           | N?spero Tanaca                  |               400 |
| FR-55           | Olivo Cipresino                 |               400 |
| FR-56           | Nectarina                       |               400 |
| FR-57           | Kaki Rojo Brillante             |               400 |
+-----------------+---------------------------------+-------------------+
35 rows in set (0.001 sec)
 
20. Devuelve el producto que menos unidades tiene en stock.

  SELECT codigo_producto, nombre, cantidad_en_stock FROM producto
    -> WHERE cantidad_en_stock = ( SELECT MIN (cantidad_en_stock) FROM producto );
+-----------------+---------------+-------------------+
| codigo_producto | nombre        | cantidad_en_stock |
+-----------------+---------------+-------------------+
| OR-214          | Brahea Armata |                 0 |
+-----------------+---------------+-------------------+
1 row in set (0.001 sec)
