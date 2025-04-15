Consultas 21-40

/* 1. Devuelve el nombre de los clientes que no hayan hecho pagos y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante. */

 select c.nombre_cliente, (e.nombre) as Nombre_Representante, (o.ciudad) as Ciudad_Representante from cliente c
    -> join empleado e on c.codigo_empleado_rep_ventas = e.codigo_empleado
    -> join oficina o on e.codigo_oficina = o.codigo_oficina
    -> left join pago p on p.codigo_cliente = c.codigo_cliente
    -> where p.codigo_cliente is null;
+-----------------------------+----------------------+----------------------+
| nombre_cliente              | Nombre_Representante | Ciudad_Representante |
+-----------------------------+----------------------+----------------------+
| Club Golf Puerta del hierro | Emmanuel             | Barcelona            |
| DaraDistribuciones          | Emmanuel             | Barcelona            |
| Madrileña de riegos         | Emmanuel             | Barcelona            |
| Americh Golf Management SL  | José Manuel          | Barcelona            |
| Aloha                       | José Manuel          | Barcelona            |
| El Prat                     | José Manuel          | Barcelona            |
| Lasas S.A.                  | Mariano              | Madrid               |
| Lasas S.A.                  | Mariano              | Madrid               |
| france telecom              | Lionel               | Paris                |
| Musée du Louvre             | Lionel               | Paris                |
| Flores S.L.                 | Michael              | San Francisco        |
| The Magic Garden            | Michael              | San Francisco        |
| Naturajardin                | Julian               | Sydney               |
| Vivero Humanes              | Julian               | Sydney               |
| Campohermoso                | Julian               | Sydney               |
| Flowers, S.A                | Felipe               | Talavera de la Reina |
| Fuenla City                 | Felipe               | Talavera de la Reina |
| Top Campo                   | Felipe               | Talavera de la Reina |
+-----------------------------+----------------------+----------------------+
18 rows in set (0.047 sec)

/* 2. Lista la dirección de las oficinas que tengan clientes en Fuenlabrada. */

 select o.codigo_oficina, o.linea_direccion1, o.linea_direccion2, c.nombre_cliente, c.ciudad from oficina o
    -> join empleado e on e.codigo_oficina = o.codigo_oficina
    -> join cliente c on c.codigo_empleado_rep_ventas = e.codigo_empleado
    -> where c.ciudad = 'Fuenlabrada';
+----------------+------------------------------+--------------------+-----------------+-------------+
| codigo_oficina | linea_direccion1             | linea_direccion2   | nombre_cliente  | ciudad      |
+----------------+------------------------------+--------------------+-----------------+-------------+
| MAD-ES         | Bulevar Indalecio Prieto, 32 |                    | Lasas S.A.      | Fuenlabrada |
| MAD-ES         | Bulevar Indalecio Prieto, 32 |                    | Lasas S.A.      | Fuenlabrada |
| SYD-AU         | 5-11 Wentworth Avenue        | Floor #2           | Campohermoso    | Fuenlabrada |
| TAL-ES         | Francisco Aguirre, 32        | 5º piso (exterior) | Flores Marivi   | Fuenlabrada |
| TAL-ES         | Francisco Aguirre, 32        | 5º piso (exterior) | Fuenla City     | Fuenlabrada |
| TAL-ES         | Francisco Aguirre, 32        | 5º piso (exterior) | Jardineria Sara | Fuenlabrada |
+----------------+------------------------------+--------------------+-----------------+-------------+
6 rows in set (0.001 sec)

/* 3. Devuelve el nombre de los clientes y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante. */

 select c.nombre_cliente, (e.nombre) as Nombre_Representante, (o.ciudad) as Ciudad_Representante from cliente c
join empleado e on c.codigo_empleado_rep_ventas = e.codigo_empleado
join oficina o on e.codigo_oficina = o.codigo_oficina;

+--------------------------------+----------------------+----------------------+
| nombre_cliente                 | Nombre_Representante | Ciudad_Representante |
+--------------------------------+----------------------+----------------------+
| Beragua                        | Emmanuel             | Barcelona            |
| Club Golf Puerta del hierro    | Emmanuel             | Barcelona            |
| Naturagua                      | Emmanuel             | Barcelona            |
| DaraDistribuciones             | Emmanuel             | Barcelona            |
| Madrileña de riegos            | Emmanuel             | Barcelona            |
| Golf S.A.                      | José Manuel          | Barcelona            |
| Americh Golf Management SL     | José Manuel          | Barcelona            |
| Aloha                          | José Manuel          | Barcelona            |
| El Prat                        | José Manuel          | Barcelona            |
| Sotogrande                     | José Manuel          | Barcelona            |
| Gerudo Valley                  | Lorena               | Boston               |
| Tendo Garden                   | Lorena               | Boston               |
| Lasas S.A.                     | Mariano              | Madrid               |
| Lasas S.A.                     | Mariano              | Madrid               |
| Camunas Jardines S.L.          | Mariano              | Madrid               |
| Dardena S.A.                   | Mariano              | Madrid               |
| Jardines y Mansiones Cactus SL | Lucio                | Madrid               |
| Jardinerías Matías SL          | Lucio                | Madrid               |
| france telecom                 | Lionel               | Paris                |
| Musée du Louvre                | Lionel               | Paris                |
| Flores S.L.                    | Michael              | San Francisco        |
| The Magic Garden               | Michael              | San Francisco        |
| GoldFish Garden                | Walter Santiago      | San Francisco        |
| Gardening Associates           | Walter Santiago      | San Francisco        |
| Jardin de Flores               | Julian               | Sydney               |
| Naturajardin                   | Julian               | Sydney               |
| Vivero Humanes                 | Julian               | Sydney               |
| Agrojardin                     | Julian               | Sydney               |
| Campohermoso                   | Julian               | Sydney               |
| Tutifruti S.A                  | Mariko               | Sydney               |
| El Jardin Viviente S.L         | Mariko               | Sydney               |
| Flores Marivi                  | Felipe               | Talavera de la Reina |
| Flowers, S.A                   | Felipe               | Talavera de la Reina |
| Fuenla City                    | Felipe               | Talavera de la Reina |
| Top Campo                      | Felipe               | Talavera de la Reina |
| Jardineria Sara                | Felipe               | Talavera de la Reina |
+--------------------------------+----------------------+----------------------+
36 rows in set (0.001 sec)

/* 4. Devuelve un listado con el nombre de los empleados junto con el nombre de sus jefes. */ 

SELECT e.nombre AS Empleado, j.nombre AS Jefe FROM empleado e JOIN empleado j ON e.codigo_jefe = j.codigo_empleado;

+-----------------+----------+
| Empleado        | Jefe     |
+-----------------+----------+
| Ruben           | Marcos   |
| Alberto         | Ruben    |
| Maria           | Ruben    |
| Felipe          | Alberto  |
| Juan Carlos     | Alberto  |
| Carlos          | Alberto  |
| Mariano         | Carlos   |
| Lucio           | Carlos   |
| Hilario         | Carlos   |
| Emmanuel        | Alberto  |
| José Manuel     | Emmanuel |
| David           | Emmanuel |
| Oscar           | Emmanuel |
| Francois        | Alberto  |
| Lionel          | Francois |
| Laurent         | Francois |
| Michael         | Alberto  |
| Walter Santiago | Michael  |
| Hilary          | Alberto  |
| Marcus          | Hilary   |
| Lorena          | Hilary   |
| Nei             | Alberto  |
| Narumi          | Nei      |
| Takuma          | Nei      |
| Amy             | Alberto  |
| Larry           | Amy      |
| John            | Amy      |
| Kevin           | Alberto  |
| Julian          | Kevin    |
| Mariko          | Kevin    |
+-----------------+----------+
30 rows in set (0.000 sec)

/* 5. Devuelve el nombre de los clientes a los que no se les ha entregado a tiempo un pedido. */

 select c.nombre_cliente, p.fecha_esperada, p.fecha_entrega from cliente c join pedido p
    -> on c.codigo_cliente = p.codigo_cliente
    -> where p.fecha_esperada < p.fecha_entrega;
+--------------------------------+----------------+---------------+
| nombre_cliente                 | fecha_esperada | fecha_entrega |
+--------------------------------+----------------+---------------+
| GoldFish Garden                | 2008-12-27     | 2008-12-28    |
| Beragua                        | 2009-01-14     | 2009-01-15    |
| Beragua                        | 2009-01-07     | 2009-01-15    |
| Beragua                        | 2009-01-09     | 2009-01-11    |
| Naturagua                      | 2009-01-06     | 2009-01-07    |
| Naturagua                      | 2009-01-11     | 2009-01-13    |
| Gardening Associates           | 2009-02-17     | 2009-02-20    |
| Camunas Jardines S.L.          | 2008-09-30     | 2008-10-04    |
| Gerudo Valley                  | 2007-01-19     | 2007-01-27    |
| Golf S.A.                      | 2009-03-06     | 2009-03-07    |
| Golf S.A.                      | 2009-03-07     | 2009-03-09    |
| Golf S.A.                      | 2009-03-10     | 2009-03-13    |
| Golf S.A.                      | 2009-03-23     | 2009-03-27    |
| Sotogrande                     | 2009-03-26     | 2009-03-28    |
| Sotogrande                     | 2009-03-27     | 2009-03-30    |
| Sotogrande                     | 2009-03-04     | 2009-03-07    |
| Sotogrande                     | 2009-03-04     | 2009-03-05    |
| Jardines y Mansiones Cactus SL | 2008-07-22     | 2008-07-30    |
| Dardena S.A.                   | 2009-01-10     | 2009-01-11    |
| GoldFish Garden                | 2008-12-27     | 2008-12-28    |
| Gardening Associates           | 2009-02-17     | 2009-02-20    |
| Jardinerías Matías SL          | 2009-04-30     | 2009-05-03    |
| Tutifruti S.A                  | 2008-04-12     | 2008-04-13    |
| Jardineria Sara                | 2009-01-20     | 2009-01-24    |
| Jardineria Sara                | 2009-05-15     | 2009-05-20    |
| Flores S.L.                    | 2009-04-06     | 2009-05-07    |
| Flores S.L.                    | 2008-11-09     | 2009-01-09    |
| Flores S.L.                    | 2009-01-29     | 2009-01-31    |
| Flores S.L.                    | 2009-01-26     | 2009-02-27    |
| Jardineria Sara                | 2009-01-20     | 2009-01-24    |
| Jardineria Sara                | 2009-05-15     | 2009-05-20    |
| El Jardin Viviente S.L         | 2008-12-10     | 2008-12-29    |
+--------------------------------+----------------+---------------+
32 rows in set (0.002 sec)

/* 6. Devuelve un listado de las diferentes gamas de producto que ha comprado cada cliente. */ 

select distinct c.nombre_cliente, gp.gama from cliente c
    join pedido p on c.codigo_cliente = p.codigo_cliente
    join detalle_pedido dp on p.codigo_pedido = dp.codigo_pedido
    join producto pr on pr.codigo_producto = dp.codigo_producto
    join gama_producto gp on pr.gama = gp.gama;

+--------------------------------+--------------+
| nombre_cliente                 | gama         |
+--------------------------------+--------------+
| GoldFish Garden                | Frutales     |
| GoldFish Garden                | Aromáticas   |
| GoldFish Garden                | Ornamentales |
| Gardening Associates           | Frutales     |
| Gardening Associates           | Ornamentales |
| Gerudo Valley                  | Herramientas |
| Gerudo Valley                  | Ornamentales |
| Gerudo Valley                  | Frutales     |
| Tendo Garden                   | Frutales     |
| Tendo Garden                   | Ornamentales |
| Tendo Garden                   | Aromáticas   |
| Beragua                        | Herramientas |
| Beragua                        | Frutales     |
| Beragua                        | Ornamentales |
| Naturagua                      | Herramientas |
| Naturagua                      | Frutales     |
| Naturagua                      | Ornamentales |
| Camunas Jardines S.L.          | Aromáticas   |
| Camunas Jardines S.L.          | Frutales     |
| Camunas Jardines S.L.          | Ornamentales |
| Dardena S.A.                   | Herramientas |
| Dardena S.A.                   | Frutales     |
| Dardena S.A.                   | Ornamentales |
| Jardin de Flores               | Frutales     |
| Jardin de Flores               | Ornamentales |
| Jardin de Flores               | Aromáticas   |
| Jardin de Flores               | Herramientas |
| Flores Marivi                  | Ornamentales |
| Flores Marivi                  | Frutales     |
| Flores Marivi                  | Aromáticas   |
| Flores Marivi                  | Herramientas |
| Golf S.A.                      | Herramientas |
| Golf S.A.                      | Aromáticas   |
| Sotogrande                     | Aromáticas   |
| Sotogrande                     | Frutales     |
| Jardines y Mansiones Cactus SL | Frutales     |
| Jardines y Mansiones Cactus SL | Ornamentales |
| Jardinerías Matías SL          | Aromáticas   |
| Jardinerías Matías SL          | Frutales     |
| Jardinerías Matías SL          | Herramientas |
| Agrojardin                     | Ornamentales |
| Agrojardin                     | Frutales     |
| Jardineria Sara                | Frutales     |
| Jardineria Sara                | Ornamentales |
| Jardineria Sara                | Aromáticas   |
| Jardineria Sara                | Herramientas |
| Tutifruti S.A                  | Frutales     |
| Tutifruti S.A                  | Ornamentales |
| Flores S.L.                    | Frutales     |
| El Jardin Viviente S.L         | Frutales     |
| El Jardin Viviente S.L         | Ornamentales |
| El Jardin Viviente S.L         | Aromáticas   |
| El Jardin Viviente S.L         | Herramientas |
+--------------------------------+--------------+
53 rows in set (0.001 sec)

SELECT c.nombre_cliente, GROUP_CONCAT(DISTINCT gp.gama ORDER BY gp.gama) AS gamas_compradas
FROM cliente c
JOIN pedido p ON c.codigo_cliente = p.codigo_cliente
JOIN detalle_pedido dp ON p.codigo_pedido = dp.codigo_pedido
JOIN producto pr ON pr.codigo_producto = dp.codigo_producto
JOIN gama_producto gp ON pr.gama = gp.gama
GROUP BY c.nombre_cliente;

+--------------------------------+-----------------------------------------------+
| nombre_cliente                 | gamas_compradas                               |
+--------------------------------+-----------------------------------------------+
| Agrojardin                     | Frutales,Ornamentales                         |
| Beragua                        | Frutales,Herramientas,Ornamentales            |
| Camunas Jardines S.L.          | Aromáticas,Frutales,Ornamentales              |
| Dardena S.A.                   | Frutales,Herramientas,Ornamentales            |
| El Jardin Viviente S.L         | Aromáticas,Frutales,Herramientas,Ornamentales |
| Flores Marivi                  | Aromáticas,Frutales,Herramientas,Ornamentales |
| Flores S.L.                    | Frutales                                      |
| Gardening Associates           | Frutales,Ornamentales                         |
| Gerudo Valley                  | Frutales,Herramientas,Ornamentales            |
| GoldFish Garden                | Aromáticas,Frutales,Ornamentales              |
| Golf S.A.                      | Aromáticas,Herramientas                       |
| Jardin de Flores               | Aromáticas,Frutales,Herramientas,Ornamentales |
| Jardineria Sara                | Aromáticas,Frutales,Herramientas,Ornamentales |
| Jardinerías Matías SL          | Aromáticas,Frutales,Herramientas              |
| Jardines y Mansiones Cactus SL | Frutales,Ornamentales                         |
| Naturagua                      | Frutales,Herramientas,Ornamentales            |
| Sotogrande                     | Aromáticas,Frutales                           |
| Tendo Garden                   | Aromáticas,Frutales,Ornamentales              |
| Tutifruti S.A                  | Frutales,Ornamentales                         |
+--------------------------------+-----------------------------------------------+
19 rows in set (0.001 sec)


/* 7. Devuelve un listado que muestre solamente a los clientes que no han realizado ningún pago.  */

select c.codigo_cliente, c.nombre_cliente from cliente c left join pago p on c.codigo_cliente = p.codigo_cliente where p.codigo_cliente is null; 

+----------------+-----------------------------+
| codigo_cliente | nombre_cliente              |
+----------------+-----------------------------+
|              6 | Lasas S.A.                  |
|              8 | Club Golf Puerta del hierro |
|             10 | DaraDistribuciones          |
|             11 | Madrileña de riegos         |
|             12 | Lasas S.A.                  |
|             17 | Flowers, S.A                |
|             18 | Naturajardin                |
|             20 | Americh Golf Management SL  |
|             21 | Aloha                       |
|             22 | El Prat                     |
|             24 | Vivero Humanes              |
|             25 | Fuenla City                 |
|             29 | Top Campo                   |
|             31 | Campohermoso                |
|             32 | france telecom              |
|             33 | Musée du Louvre             |
|             36 | Flores S.L.                 |
|             37 | The Magic Garden            |
+----------------+-----------------------------+
18 rows in set (0.000 sec)

/* 8. Devuelve un listado que muestre solamente los clientes que no han realizado ningún pedido. */ 

select c.codigo_cliente, c.nombre_cliente from cliente c left join pedido p on c.codigo_cliente = p.codigo_cliente where p.codigo_cliente is null; 

+----------------+-----------------------------+
| codigo_cliente | nombre_cliente              |
+----------------+-----------------------------+
|              6 | Lasas S.A.                  |
|              8 | Club Golf Puerta del hierro |
|             10 | DaraDistribuciones          |
|             11 | Madrileña de riegos         |
|             12 | Lasas S.A.                  |
|             17 | Flowers, S.A                |
|             18 | Naturajardin                |
|             20 | Americh Golf Management SL  |
|             21 | Aloha                       |
|             22 | El Prat                     |
|             24 | Vivero Humanes              |
|             25 | Fuenla City                 |
|             29 | Top Campo                   |
|             31 | Campohermoso                |
|             32 | france telecom              |
|             33 | Musée du Louvre             |
|             37 | The Magic Garden            |
+----------------+-----------------------------+
17 rows in set (0.000 sec)
 /* 9. Devuelve un listado que muestre los clientes que no han realizado ningún pago y los que no han realizado ningún pedido. */

select c.codigo_cliente, c.nombre_cliente from cliente c left join pago pa on c.codigo_cliente = pa.codigo_cliente
 left join pedido pe on c.codigo_cliente = pe.codigo_cliente
 where pe.codigo_cliente is null and pa.codigo_cliente is null;

+----------------+-----------------------------+
| codigo_cliente | nombre_cliente              |
+----------------+-----------------------------+
|              6 | Lasas S.A.                  |
|              8 | Club Golf Puerta del hierro |
|             10 | DaraDistribuciones          |
|             11 | Madrileña de riegos         |
|             12 | Lasas S.A.                  |
|             17 | Flowers, S.A                |
|             18 | Naturajardin                |
|             20 | Americh Golf Management SL  |
|             21 | Aloha                       |
|             22 | El Prat                     |
|             24 | Vivero Humanes              |
|             25 | Fuenla City                 |
|             29 | Top Campo                   |
|             31 | Campohermoso                |
|             32 | france telecom              |
|             33 | Musée du Louvre             |
|             37 | The Magic Garden            |
+----------------+-----------------------------+
17 rows in set (0.000 sec)

/* 10. Devuelve un listado que muestre solamente los empleados que no tienen una oficina asociada. */

select concat(e.nombre,' ', e.apellido1,' ', e.apellido2) as Empleado_Sin_Oficina from empleado e left join oficina o on e.codigo_oficina = o.codigo_oficina
where e.codigo_oficina is null;

TODOS TIENEN Oficina 

/* 11. Devuelve un listado que muestre solamente los empleados que no tienen un cliente asociado. */

select distinct concat(e.nombre,' ', e.apellido1,' ', e.apellido2) as Empleado_Sin_Clientes from empleado e left join cliente c on e.codigo_empleado = c.codigo_empleado_rep_ventas
where c.codigo_empleado_rep_ventas is null;
+---------------------------+
| Empleado_Sin_Clientes     |
+---------------------------+
| Marcos Magaña Perez       |
| Ruben López Martinez      |
| Alberto Soria Carrasco    |
| Maria Solís Jerez         |
| Juan Carlos Ortiz Serrano |
| Carlos Soria Jimenez      |
| Hilario Rodriguez Huertas |
| David Palma Aceituno      |
| Oscar Palma Aceituno      |
| Francois Fignon           |
| Laurent Serra             |
| Hilary Washington         |
| Marcus Paxton             |
| Nei Nishikori             |
| Narumi Riko               |
| Takuma Nomura             |
| Amy Johnson               |
| Larry Westfalls           |
| John Walton               |
| Kevin Fallmer             |
+---------------------------+
20 rows in set (0.000 sec)

/* 12. Devuelve un listado que muestre los empleados que no tienen una oficina asociada y los que no
tienen un cliente asociado. */ 

select distinct concat(e.nombre,' ', e.apellido1,' ', e.apellido2) as Empleado_Sin_Clientes_Sin_Oficinas from empleado e 
left join cliente c on e.codigo_empleado = c.codigo_empleado_rep_ventas
left join oficina o on e.codigo_oficina = o.codigo_oficina
where e.codigo_oficina is null or c.codigo_cliente is null;

+------------------------------------+
| Empleado_Sin_Clientes_o_Sin_Oficinas |
+------------------------------------+
| Marcos Magaña Perez                |
| Ruben López Martinez               |
| Alberto Soria Carrasco             |
| Maria Solís Jerez                  |
| Juan Carlos Ortiz Serrano          |
| Carlos Soria Jimenez               |
| Hilario Rodriguez Huertas          |
| David Palma Aceituno               |
| Oscar Palma Aceituno               |
| Francois Fignon                    |
| Laurent Serra                      |
| Hilary Washington                  |
| Marcus Paxton                      |
| Nei Nishikori                      |
| Narumi Riko                        |
| Takuma Nomura                      |
| Amy Johnson                        |
| Larry Westfalls                    |
| John Walton                        |
| Kevin Fallmer                      |
+------------------------------------+
20 rows in set (0.000 sec)

/* 13. Devuelve un listado de los productos que nunca han aparecido en un pedido. */ 

select distinct (p.nombre) as Producto_Sin_Pedido from producto p left join detalle_pedido dp on p.codigo_producto = dp.codigo_producto where dp.codigo_producto is null;
+-------------------------------------------------------------+
| Producto_Sin_Pedido                                         |
+-------------------------------------------------------------+
| Olea-Olivos                                                 |
| Calamondin Mini                                             |
| Camelia Blanco, Chrysler Rojo, Soraya Naranja,              |
| Landora Amarillo, Rose Gaujard bicolor blanco-rojo          |
| Kordes Perfect bicolor rojo-amarillo, Roundelay rojo fuerte |
| Albaricoquero Corbato                                       |
| Albaricoquero Moniqui                                       |
| Albaricoquero Kurrot                                        |
| Cerezo Burlat                                               |
| Cerezo Picota                                               |
| Ciruelo R. Claudia Verde                                    |
| Ciruelo Golden Japan                                        |
| Ciruelo Claudia Negra                                       |
| Higuera Verdal                                              |
| Higuera Breva                                               |
| Melocotonero Spring Crest                                   |
| Melocotonero Federica                                       |
| Parra Uva de Mesa                                           |
| Mandarino -Plantón joven                                    |
| Peral Castell                                               |
| Peral Williams                                              |
| Peral Conference                                            |
| Olivo Cipresino                                             |
| Albaricoquero                                               |
| Cerezo                                                      |
| Ciruelo                                                     |
| Granado                                                     |
| Higuera                                                     |
| Manzano                                                     |
| Melocotonero                                                |
| Membrillero                                                 |
| Arbustos Mix Maceta                                         |
| Mimosa Injerto CLASICA Dealbata                             |
| Mimosa Semilla Bayleyana                                    |
| Mimosa Semilla Espectabilis                                 |
| Mimosa Semilla Longifolia                                   |
| Mimosa Semilla Floribunda 4 estaciones                      |
| Abelia Floribunda                                           |
| Callistemom (Mix)                                           |
| Corylus Avellana "Contorta"                                 |
| Escallonia (Mix)                                            |
| Evonimus Emerald Gayeti                                     |
| Evonimus Pulchellus                                         |
| Hibiscus Syriacus  "Helene" -Blanco-C.rojo                  |
| Hibiscus Syriacus "Pink Giant" Rosa                         |
| Lonicera Nitida "Maigrum"                                   |
| Prunus pisardii                                             |
| Weigelia "Bristol Ruby"                                     |
| Leptospermum formado PIRAMIDE                               |
| Leptospermum COPA                                           |
| Nerium oleander-CALIDAD "GARDEN"                            |
| Nerium Oleander Arbusto GRANDE                              |
| Nerium oleander COPA  Calibre 6/8                           |
| ROSAL TREPADOR                                              |
| Solanum Jazminoide                                          |
| Wisteria Sinensis  azul, rosa, blanca                       |
| Wisteria Sinensis INJERTADAS DECÃ                           |
| Bougamvillea Sanderiana Tutor                               |
| Bougamvillea Sanderiana Espaldera                           |
| Bougamvillea Sanderiana, 3 tut. piramide                    |
| Expositor Árboles clima mediterráneo                        |
| Expositor Árboles borde del mar                             |
| Brachychiton Acerifolius                                    |
| Cassia Corimbosa                                            |
| Chitalpa Summer Bells                                       |
| Erytrina Kafra                                              |
| Eucalyptus Citriodora                                       |
| Eucalyptus Ficifolia                                        |
| Hibiscus Syriacus  Var. Injertadas 1 Tallo                  |
| Lagunaria Patersonii                                        |
| Morus Alba                                                  |
| Platanus Acerifolia                                         |
| Salix Babylonica  Pendula                                   |
| Tamarix  Ramosissima Pink Cascade                           |
| Tecoma Stands                                               |
| Tipuana Tipu                                                |
| Pleioblastus distichus-Bambú enano                          |
| Sasa palmata                                                |
| Phylostachys aurea                                          |
| Phylostachys Bambusa Spectabilis                            |
| Phylostachys biseti                                         |
| Pseudosasa japonica (Metake)                                |
| Cedrus Deodara "Feeling Blue" Novedad                       |
| Juniperus chinensis "Blue Alps"                             |
| Juniperus Chinensis Stricta                                 |
| Juniperus squamata "Blue Star"                              |
| Juniperus x media Phitzeriana verde                         |
| Bismarckia Nobilis                                          |
| Brahea Armata                                               |
| Brahea Edulis                                               |
| Butia Capitata                                              |
| Chamaerops Humilis                                          |
| Chamaerops Humilis "Cerifera"                               |
| Chrysalidocarpus Lutescens -ARECA                           |
| Cordyline Australis -DRACAENA                               |
| Cycas Revoluta                                              |
| Dracaena Drago                                              |
| Livistonia Decipiens                                        |
| Rhaphis Excelsa                                             |
| Sabal Minor                                                 |
| Trachycarpus Fortunei                                       |
| Washingtonia Robusta                                        |
| Zamia Furfuracaea                                           |
+-------------------------------------------------------------+
103 rows in set (0.001 sec)

/* 14. Devuelve las oficinas donde no trabajan ninguno de los empleados que hayan sido los
representantes de ventas de algún cliente que haya realizado la compra de algún producto de la gama Frutales. */ 

select * from oficina where codigo_oficina not in (
 select codigo_oficina from empleado where codigo_empleado in (
 select c.codigo_empleado_rep_ventas from cliente c join pedido pe 
 on c.codigo_cliente = pe.codigo_cliente 
 join detalle_pedido dp on pe.codigo_pedido = dp.codigo_pedido
 join producto p on p.codigo_producto = dp.codigo_producto
 where gama = 'Frutales'));

+----------------+---------+------------+------------+---------------+-----------------+--------------------------+------------------+
| codigo_oficina | ciudad  | pais       | region     | codigo_postal | telefono        | linea_direccion1         | linea_direccion2 |
+----------------+---------+------------+------------+---------------+-----------------+--------------------------+------------------+
| LON-UK         | Londres | Inglaterra | EMEA       | EC2N 1HN      | +44 20 78772041 | 52 Old Broad Street      | Ground Floor     |
| PAR-FR         | Paris   | Francia    | EMEA       | 75017         | +33 14 723 4404 | 29 Rue Jouffroy dabbans |                  |
| TOK-JP         | Tokyo   | Jap?n      | Chiyoda-Ku | 102-8578      | +81 33 224 5000 | 4-1 Kioicho              |                  |
+----------------+---------+------------+------------+---------------+-----------------+--------------------------+------------------+
 
3 rows in set (0.001 sec)
/* 15. Devuelve un listado con los clientes que han realizado algún pedido pero no han realizado
ningún pago.*/ 

SELECT DISTINCT c.codigo_cliente, c.nombre_cliente
FROM cliente c
JOIN pedido p ON c.codigo_cliente = p.codigo_cliente
LEFT JOIN pago pa ON c.codigo_cliente = pa.codigo_cliente
WHERE pa.codigo_cliente IS NULL;

+----------------+----------------+
| codigo_cliente | nombre_cliente |
+----------------+----------------+
|             36 | Flores S.L.    |
+----------------+----------------+
1 row in set (0.001 sec)

/* 16. Devuelve un listado con los datos de los empleados que no tienen clientes asociados y el nombre de su jefe asociado. */

SELECT e.codigo_empleado, e.nombre AS empleado, j.nombre AS jefe
FROM empleado e
LEFT JOIN cliente c ON e.codigo_empleado = c.codigo_empleado_rep_ventas
JOIN empleado j ON e.codigo_jefe = j.codigo_empleado
WHERE c.codigo_empleado_rep_ventas IS NULL;

+-----------------+-------------+----------+
| codigo_empleado | empleado    | jefe     |
+-----------------+-------------+----------+
|               2 | Ruben       | Marcos   |
|               3 | Alberto     | Ruben    |
|               4 | Maria       | Ruben    |
|               6 | Juan Carlos | Alberto  |
|               7 | Carlos      | Alberto  |
|              10 | Hilario     | Carlos   |
|              13 | David       | Emmanuel |
|              14 | Oscar       | Emmanuel |
|              15 | Francois    | Alberto  |
|              17 | Laurent     | Francois |
|              20 | Hilary      | Alberto  |
|              21 | Marcus      | Hilary   |
|              23 | Nei         | Alberto  |
|              24 | Narumi      | Nei      |
|              25 | Takuma      | Nei      |
|              26 | Amy         | Alberto  |
|              27 | Larry       | Amy      |
|              28 | John        | Amy      |
|              29 | Kevin       | Alberto  |
+-----------------+-------------+----------+
19 rows in set (0.000 sec)

/* 17. ¿Cuántos empleados hay en la compañía? */

select count(*) as Empleados_Totales from empleados;

+-------------------+
| Empleados_Totales |
+-------------------+
|                31 |
+-------------------+
1 row in set (0.001 sec)

/* 18. ¿Cuántos clientes tiene cada país? */

select count(*) as Clientes, pais from cliente group by pais;

+----------+----------------+
| Clientes | pais           |
+----------+----------------+
|        2 | Australia      |
|        2 | France         |
|       27 | Spain          |
|        1 | United Kingdom |
|        4 | USA            |
+----------+----------------+
5 rows in set (0.000 sec)


19. ¿Cuál fue el pago medio en 2009?

select avg(total) as Promedio_De_2009 from pago where year(fecha_pago) = '2009';

+------------------+
| Promedio_De_2009 |
+------------------+
|      4504.076923 |
+------------------+
1 row in set (0.000 sec)

/* 20. ¿Cuántos pedidos hay en cada estado? Ordena el resultado de forma descendente por el número de pedidos. */

select count(*) as Pedidos, estado from pedido group by estado order by Pedidos asc;
+---------+-----------+
| Pedidos | estado    |
+---------+-----------+
|      24 | Rechazado |
|      30 | Pendiente |
|      61 | Entregado |
+---------+-----------+
3 rows in set (0.000 sec)
