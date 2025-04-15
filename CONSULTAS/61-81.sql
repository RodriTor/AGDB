Consultas de 60 a 80

/* 1. Listar los nombres de los clientes que tienen asignado el representante Lorena Pauxton (suponiendo que no puede haber representantes con el mismo nombre). */

select nombre_cliente from cliente where codigo_empleado_rep_ventas = (select codigo_empleado from empleado where nombre = 'Lorena' AND apellido1 = 'Pauxton');
Empty set (0.000 sec)
  
/* 2. Devuelve un listado indicando todas las ciudades donde hay oficinas y el número de empleados que tiene. */ 

SELECT o.ciudad, COUNT(e.codigo_empleado) AS num_empleados FROM oficina o
JOIN empleado e ON o.codigo_oficina = e.codigo_oficina
GROUP BY o.ciudad;

+----------------------+---------------+
| ciudad               | num_empleados |
+----------------------+---------------+
| Barcelona            |             4 |
| Boston               |             3 |
| Londres              |             3 |
| Madrid               |             4 |
| Paris                |             3 |
| San Francisco        |             2 |
| Sydney               |             3 |
| Talavera de la Reina |             6 |
| Tokyo                |             3 |
+----------------------+---------------+
9 rows in set (0.006 sec)

/* 3. Listar a los vendedores que no trabajan en oficinas dirigidas por el empleado 108. */ 

select concat(nombre,' ',apellido1,' ', apellido2) as Vendedor from empleado where puesto = 'Representante Ventas' and codigo_empleado not in (select codigo_empleado from empleado where codigo_jefe = '15'); 

+--------------------------------+
| Vendedor                       |
+--------------------------------+
| Felipe Rosas Marquez           |
| Juan Carlos Ortiz Serrano      |
| Mariano López Murcia           |
| Lucio Campoamor Martín         |
| Hilario Rodriguez Huertas      |
| José Manuel Martinez De la Osa |
| David Palma Aceituno           |
| Oscar Palma Aceituno           |
| Lionel Narvaez                 |
| Laurent Serra                  |
| Marcus Paxton                  |
| Lorena Paxton                  |
| Narumi Riko                    |
| Takuma Nomura                  |
| Larry Westfalls                |
| John Walton                    |
| Julian Bellinelli              |
| Mariko Kishi                   |
+--------------------------------+
18 rows in set (0.000 sec)

/* 4. Listar los productos (idfab, idproducto y descripción) para los cuales no se ha recibido ningún pedido de 25000 o más. */ 


/* 5. Listar los clientes asignados a Ana Bustamante que no han remitido un pedido superior a 3000 pts. */ 
/* 6. Devuelve el nombre del cliente, el nombre y primer apellido de su representante de ventas y el
número de teléfono de la oficina del representante de ventas, de aquellos clientes que no hayan realizado ningún pago. */ 
/* 7. Devuelve el listado de clientes donde aparezca el nombre del cliente, el nombre y primer apellido de su representante de ventas y la ciudad donde está su oficina. */ 
/* 8. Devuelve el nombre, apellidos, puesto y teléfono de la oficina de aquellos empleados que no sean representante de ventas de ningún cliente. */ 
select concat(e.nombre,' ', e.apellido1,' ', e.apellido2) as Empleados, (o.telefono) as Telefono_Oficina from empleado e join oficina o on e.codigo_oficina = o.codigo_oficina where codigo_empleado not in (select codigo_empleado_rep_ventas from cliente);
+---------------------------+------------------+
| Empleados                 | Telefono_Oficina |
+---------------------------+------------------+
| David Palma Aceituno      | +34 93 3561182   |
| Oscar Palma Aceituno      | +34 93 3561182   |
| Hilary Washington         | +1 215 837 0825  |
| Marcus Paxton             | +1 215 837 0825  |
| Amy Johnson               | +44 20 78772041  |
| Larry Westfalls           | +44 20 78772041  |
| John Walton               | +44 20 78772041  |
| Carlos Soria Jimenez      | +34 91 7514487   |
| Hilario Rodriguez Huertas | +34 91 7514487   |
| Francois Fignon           | +33 14 723 4404  |
| Laurent Serra             | +33 14 723 4404  |
| Kevin Fallmer             | +61 2 9264 2451  |
| Marcos Magaña Perez       | +34 925 867231   |
| Ruben López Martinez      | +34 925 867231   |
| Alberto Soria Carrasco    | +34 925 867231   |
| Maria Solís Jerez         | +34 925 867231   |
| Juan Carlos Ortiz Serrano | +34 925 867231   |
| Nei Nishikori             | +81 33 224 5000  |
| Narumi Riko               | +81 33 224 5000  |
| Takuma Nomura             | +81 33 224 5000  |
+---------------------------+------------------+
20 rows in set (0.001 sec)

/*9. Devuelve el nombre, los apellidos y el email de los empleados que están a cargo de Alberto Soria. */ 
select concat(nombre,' ', apellido1,' ', apellido2) as Empleado, email from empleado where codigo_jefe = (select codigo_empleado from empleado where nombre = 'Alberto' AND apellido1 = 'Soria');

+---------------------------+---------------------------+
| Empleado                  | email                     |
+---------------------------+---------------------------+
| Felipe Rosas Marquez      | frosas@jardineria.es      |
| Juan Carlos Ortiz Serrano | cortiz@jardineria.es      |
| Carlos Soria Jimenez      | csoria@jardineria.es      |
| Emmanuel Magaña Perez     | manu@jardineria.es        |
| Francois Fignon           | ffignon@gardening.com     |
| Michael Bolton            | mbolton@gardening.com     |
| Hilary Washington         | hwashington@gardening.com |
| Nei Nishikori             | nnishikori@gardening.com  |
| Amy Johnson               | ajohnson@gardening.com    |
| Kevin Fallmer             | kfalmer@gardening.com     |
+---------------------------+---------------------------+
10 rows in set (0.000 sec)

/* 10. Devuelve el nombre del cliente con mayor límite de crédito. (utilizar ALL, ANY) */
/* 11. Devuelve el nombre del producto que tenga el precio de venta más caro. (utilizar ALL, ANY) */
/* 12. Devuelve el producto que menos unidades tiene en stock. (utilizar ALL, ANY) */ 

/* 13. Devuelve el nombre, apellido1 y cargo de los empleados que no representan a ningún cliente. (Utilizar IN, NOT IN) */

select concat(nombre,' ',apellido1,' ',apellido2) as Empleado_Nombre from empleado where codigo_empleado not in (select codigo_empleado_rep_ventas from cliente); 
+---------------------------+
| Empleado_Nombre           |
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
20 rows in set (0.007 sec)

/* 14. Devuelve un listado que muestre solamente a los clientes que no han realizado ningún pago. (Utilizar IN, NOT IN) */

select codigo_cliente, nombre_cliente from cliente where codigo_cliente not in (select codigo_cliente from pago);
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
18 rows in set (0.018 sec)

/* 15. Devuelve un listado que muestre solamente a los clientes que sí han realizado algún pago. (Utilizar IN, NOT IN) */

select codigo_cliente, nombre_cliente from cliente where codigo_cliente in (select codigo_cliente from pago);

+----------------+--------------------------------+
| codigo_cliente | nombre_cliente                 |
+----------------+--------------------------------+
|              1 | GoldFish Garden                |
|              3 | Gardening Associates           |
|              4 | Gerudo Valley                  |
|              5 | Tendo Garden                   |
|              7 | Beragua                        |
|              9 | Naturagua                      |
|             13 | Camunas Jardines S.L.          |
|             14 | Dardena S.A.                   |
|             15 | Jardin de Flores               |
|             16 | Flores Marivi                  |
|             19 | Golf S.A.                      |
|             23 | Sotogrande                     |
|             26 | Jardines y Mansiones Cactus SL |
|             27 | Jardinerías Matías SL          |
|             28 | Agrojardin                     |
|             30 | Jardineria Sara                |
|             35 | Tutifruti S.A                  |
|             38 | El Jardin Viviente S.L         |
+----------------+--------------------------------+
18 rows in set (0.002 sec)

/* 16. Devuelve un listado de los productos que nunca han aparecido en un pedido. (Utilizar IN, NOT IN) */

select codigo_producto, nombre from producto where codigo_producto not in (select codigo_producto from detalle_pedido);
+-----------------+-------------------------------------------------------------+
| codigo_producto | nombre                                                      |
+-----------------+-------------------------------------------------------------+
| FR-104          | Olea-Olivos                                                 |
| FR-14           | Calamondin Mini                                             |
| FR-19           | Camelia Blanco, Chrysler Rojo, Soraya Naranja,              |
| FR-20           | Landora Amarillo, Rose Gaujard bicolor blanco-rojo          |
| FR-21           | Kordes Perfect bicolor rojo-amarillo, Roundelay rojo fuerte |
| FR-24           | Albaricoquero Corbato                                       |
| FR-25           | Albaricoquero Moniqui                                       |
| FR-26           | Albaricoquero Kurrot                                        |
| FR-27           | Cerezo Burlat                                               |
| FR-28           | Cerezo Picota                                               |
| FR-30           | Ciruelo R. Claudia Verde                                    |
| FR-32           | Ciruelo Golden Japan                                        |
| FR-35           | Ciruelo Claudia Negra                                       |
| FR-38           | Higuera Verdal                                              |
| FR-39           | Higuera Breva                                               |
| FR-44           | Melocotonero Spring Crest                                   |
| FR-46           | Melocotonero Federica                                       |
| FR-49           | Parra Uva de Mesa                                           |
| FR-5            | Mandarino -Plantón joven                                    |
| FR-50           | Peral Castell                                               |
| FR-51           | Peral Williams                                              |
| FR-52           | Peral Conference                                            |
| FR-55           | Olivo Cipresino                                             |
| FR-59           | Albaricoquero                                               |
| FR-61           | Albaricoquero                                               |
| FR-62           | Albaricoquero                                               |
| FR-63           | Cerezo                                                      |
| FR-65           | Cerezo                                                      |
| FR-68           | Cerezo                                                      |
| FR-70           | Ciruelo                                                     |
| FR-73           | Granado                                                     |
| FR-74           | Granado                                                     |
| FR-76           | Granado                                                     |
| FR-83           | Higuera                                                     |
| FR-88           | Manzano                                                     |
| FR-92           | Melocotonero                                                |
| FR-93           | Melocotonero                                                |
| FR-95           | Melocotonero                                                |
| FR-96           | Membrillero                                                 |
| FR-97           | Membrillero                                                 |
| FR-98           | Membrillero                                                 |
| FR-99           | Membrillero                                                 |
| OR-001          | Arbustos Mix Maceta                                         |
| OR-100          | Mimosa Injerto CLASICA Dealbata                             |
| OR-103          | Mimosa Semilla Bayleyana                                    |
| OR-105          | Mimosa Semilla Espectabilis                                 |
| OR-106          | Mimosa Semilla Longifolia                                   |
| OR-107          | Mimosa Semilla Floribunda 4 estaciones                      |
| OR-108          | Abelia Floribunda                                           |
| OR-109          | Callistemom (Mix)                                           |
| OR-110          | Callistemom (Mix)                                           |
| OR-111          | Corylus Avellana "Contorta"                                 |
| OR-112          | Escallonia (Mix)                                            |
| OR-113          | Evonimus Emerald Gayeti                                     |
| OR-114          | Evonimus Pulchellus                                         |
| OR-117          | Hibiscus Syriacus  "Helene" -Blanco-C.rojo                  |
| OR-118          | Hibiscus Syriacus "Pink Giant" Rosa                         |
| OR-121          | Lonicera Nitida "Maigrum"                                   |
| OR-124          | Prunus pisardii                                             |
| OR-126          | Weigelia "Bristol Ruby"                                     |
| OR-131          | Leptospermum formado PIRAMIDE                               |
| OR-132          | Leptospermum COPA                                           |
| OR-133          | Nerium oleander-CALIDAD "GARDEN"                            |
| OR-134          | Nerium Oleander Arbusto GRANDE                              |
| OR-135          | Nerium oleander COPA  Calibre 6/8                           |
| OR-137          | ROSAL TREPADOR                                              |
| OR-138          | Camelia Blanco, Chrysler Rojo, Soraya Naranja,              |
| OR-142          | Solanum Jazminoide                                          |
| OR-143          | Wisteria Sinensis  azul, rosa, blanca                       |
| OR-144          | Wisteria Sinensis INJERTADAS DECÃ                      |
| OR-145          | Bougamvillea Sanderiana Tutor                               |
| OR-148          | Bougamvillea Sanderiana Espaldera                           |
| OR-149          | Bougamvillea Sanderiana Espaldera                           |
| OR-151          | Bougamvillea Sanderiana, 3 tut. piramide                    |
| OR-153          | Expositor Árboles clima mediterráneo                        |
| OR-154          | Expositor Árboles borde del mar                             |
| OR-158          | Brachychiton Acerifolius                                    |
| OR-161          | Cassia Corimbosa                                            |
| OR-162          | Cassia Corimbosa                                            |
| OR-163          | Chitalpa Summer Bells                                       |
| OR-164          | Erytrina Kafra                                              |
| OR-166          | Eucalyptus Citriodora                                       |
| OR-167          | Eucalyptus Ficifolia                                        |
| OR-169          | Hibiscus Syriacus  Var. Injertadas 1 Tallo                  |
| OR-170          | Lagunaria Patersonii                                        |
| OR-171          | Lagunaria Patersonii                                        |
| OR-173          | Morus Alba                                                  |
| OR-175          | Platanus Acerifolia                                         |
| OR-178          | Salix Babylonica  Pendula                                   |
| OR-180          | Tamarix  Ramosissima Pink Cascade                           |
| OR-182          | Tecoma Stands                                               |
| OR-183          | Tecoma Stands                                               |
| OR-184          | Tipuana Tipu                                                |
| OR-185          | Pleioblastus distichus-Bambú enano                          |
| OR-187          | Sasa palmata                                                |
| OR-189          | Phylostachys aurea                                          |
| OR-190          | Phylostachys aurea                                          |
| OR-191          | Phylostachys Bambusa Spectabilis                            |
| OR-192          | Phylostachys biseti                                         |
| OR-194          | Pseudosasa japonica (Metake)                                |
| OR-195          | Pseudosasa japonica (Metake)                                |
| OR-197          | Cedrus Deodara "Feeling Blue" Novedad                       |
| OR-198          | Juniperus chinensis "Blue Alps"                             |
| OR-199          | Juniperus Chinensis Stricta                                 |
| OR-201          | Juniperus squamata "Blue Star"                              |
| OR-202          | Juniperus x media Phitzeriana verde                         |
| OR-212          | Bismarckia Nobilis                                          |
| OR-215          | Brahea Armata                                               |
| OR-216          | Brahea Edulis                                               |
| OR-219          | Butia Capitata                                              |
| OR-220          | Butia Capitata                                              |
| OR-221          | Butia Capitata                                              |
| OR-223          | Chamaerops Humilis                                          |
| OR-224          | Chamaerops Humilis                                          |
| OR-228          | Chamaerops Humilis "Cerifera"                               |
| OR-229          | Chrysalidocarpus Lutescens -ARECA                           |
| OR-230          | Cordyline Australis -DRACAENA                               |
| OR-231          | Cycas Revoluta                                              |
| OR-232          | Cycas Revoluta                                              |
| OR-233          | Dracaena Drago                                              |
| OR-235          | Dracaena Drago                                              |
| OR-238          | Livistonia Decipiens                                        |
| OR-239          | Livistonia Decipiens                                        |
| OR-242          | Rhaphis Excelsa                                             |
| OR-244          | Sabal Minor                                                 |
| OR-245          | Sabal Minor                                                 |
| OR-246          | Trachycarpus Fortunei                                       |
| OR-248          | Washingtonia Robusta                                        |
| OR-251          | Zamia Furfuracaea                                           |
+-----------------+-------------------------------------------------------------+
129 rows in set (0.001 sec)

/* 17. Devuelve el nombre, apellidos, puesto y teléfono de la oficina de aquellos empleados que no sean representante de ventas de ningún cliente.(Utilizar IN, NOT IN) */

select 

/* 18. Devuelve un listado que muestre solamente a los clientes que no han realizado ningún pago. (Utilizar EXISTS y NOT EXISTS) */
/* 19. Devuelve un listado que muestre solamente a los clientes que sí han realizado algún pago. (Utilizar EXISTS y NOT EXISTS) */
/*20. Devuelve un listado de los productos que nunca han aparecido en un pedido. (Utilizar EXISTS y NOT EXISTS) */
/* 21. Devuelve el nombre de los clientes que hayan hecho pedidos en 2008 ordenados alfabéticamente de menor a mayor. */
