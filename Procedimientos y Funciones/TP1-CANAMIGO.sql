/* TP - CANAMIGO */

/* 1) Una vez por mes se le entrega a los dueños de los perros la rutina, la frecuencia semanal y el adiestrador que tendrá su mascota. Para ello debe construir un
procedimiento que dado el nombre del dueño muestre la información mencionada de cada uno de sus perros. */

DELIMITER //
create procedure información_de_perros (
    in nombre_duenio varchar(50) 
)
begin
select P.P_nombre as 'NombrePerro', AD.RutinaEjercicios, AD.FrecuenciaSemanal, A.A_nombre as 'NombreAdiestrador' from duenio D
join perro P on D.D_DNI = P.D_DNI
join adiestramiento AD on P.P_codigo = AD.P_codigo
join adiestrador A on AD.A_nroLegajo = A.A_nroLegajo 
where D.D_nombre = nombre_duenio;

END//
DELIMITER ;

call información_de_perros ('Rossi Martin');

+-------------+-------------------------+-------------------+-------------------+
| NombrePerro | RutinaEjercicios        | FrecuenciaSemanal | NombreAdiestrador |
+-------------+-------------------------+-------------------+-------------------+
| Firfi       | Esconder y buscar       |                 2 | ORTEGA EZEQUIEL   |
| Emir        | natacion o hidroterapia |                 2 | MARTINEZ JOSE     |
+-------------+-------------------------+-------------------+-------------------+
2 rows in set (0.001 sec)



/* 2) La veterinaria cuenta con adiestradores especializados en cada raza. Por esa razón necesita saber cuántos adiestradores y cuantos perros tiene según sea la raza Para
ello debe crear una Función que permita ingresar una raza e informe lo solicitado y en el caso de no contar con perros de esa raza le muestre un mensaje al usuario
“No hay perros de la raza xxxxxx.” */


DELIMITER //

create function cantidad(raza varchar(20))
returns varchar(255)

begin
    declare cantidad_adiestradores int;
    declare cantidad_perros int;
    declare mensaje varchar(255);

select count(*) into cantidad_perros from perro where P_raza = raza;

if cantidad_perros = 0 then 
SET mensaje = 'No hay perros de esa raza';

else  
select count(distinct A.A_nroLegajo) INTO cantidad_adiestradores FROM Adiestramiento AD
JOIN Perro P ON AD.P_codigo = P.P_codigo
JOIN Adiestrador A ON AD.A_nroLegajo = A.A_nroLegajo
WHERE P.P_raza = raza;

set mensaje = CONCAT('Para la raza ', raza, ' hay ', cantidad_perros, ' perros y ', cantidad_adiestradores, ' adiestradores.');

END IF;

return mensaje;

END//
DELIMITER ;

select cantidad('BOXER') as 'Cantidades';
+----------------------------------------------------+
| Cantidades                                         |
+----------------------------------------------------+
| Para la raza BOXER hay 4 perros y 3 adiestradores. |
+----------------------------------------------------+
1 row in set (0.001 sec)


/* 3) En los próximos meses cada perro que ingrese a la veterinaria se le asignará al adiestrador que tenga menos perros a su cargo para que adquiera práctica. Para ello
debe construir un procedimiento que permita ingresar código, nombre, raza, peso y Dni del dueño en la estructura perros, y la tupla correspondiente de adiestramiento
sabiendo que la PK de adiestramiento debe ser el correlativo al último ingresado. Los datos que no se cuenta con información deben ser nulos. Se debe controlar que
el Dni del dueño sea válido para realizar el insert en la estructura. En caso de NO existir el Dni en la estructura “Dueño” se debe CANCELAR la operación de alta
hasta que se solucione el problema, obviamente se debe informar de dicha situación al usuario mediante un mensaje.*/


DELIMITER //

create procedure Asignaciones (
    in codigo_perro varchar(8),
    in nombre_perro varchar(30),
    in raza_perro varchar(20),
    in peso_perro decimal(5,2),
    in dni_duenio varchar(10)
)

begin 

declare duenio_valido int;
declare adiestrador_minimo int;

select count(*) into duenio_valido from duenio where D_DNI = dni_duenio;

if duenio_valido = 0 then
select 'Error, el dni no es valido.' AS Mensaje;
else 

select A_nroLegajo into adiestrador_minimo from Adiestramiento group by A_nroLegajo order by COUNT(*) ASC LIMIT 1;

insert into Perro (P_codigo, P_nombre, P_raza, P_peso, P_historialMedico, D_DNI)
values (codigo_perro, nombre_perro, raza_perro, peso_perro, null, dni_duenio);

insert into Adiestramiento (A_nroLegajo, P_codigo, RutinaEjercicios, FrecuenciaSemanal)
values (adiestrador_minimo, codigo_perro, null, null);

select 'Exito, se asigno correctamente el nuevo perro' as Mensaje;

END IF;

END//
DELIMITER ;


call Asignaciones ('COD0001', 'Boby', 'CHIHUAHUA', 3.5, '27951386');
+-----------------------------------------------+
| Mensaje                                       |
+-----------------------------------------------+
| Exito, se asigno correctamente el nuevo perro |
+-----------------------------------------------+
1 row in set (0.716 sec)

call Asignaciones ('COD0002', 'Lila', 'POINTER', 25.0, '99999999');

+-----------------------------+
| Mensaje                     |
+-----------------------------+
| Error, el dni no es valido. |
+-----------------------------+
1 row in set (0.000 sec)



/* 4) La veterinaria cuenta con un Club de perros abandonados. Esta situación fue comentada a todos los clientes de la veterinaria y decidieron adoptarlos entre ellos.
Los perros abandonados están en la estructura “Abandono” y a medida que son adoptados se eliminan de dicha estructura. Para asegurarle una buena atención solo
podrán adoptar aquellos que tengan UN solo perro. Debe crear un procedimiento que permita la adopción de los perros. Informar si fueron adoptados todos, en caso
contrario cuantos quedaron sin adoptar. → La estructura está en un script aparte de la base Canamigo */

DELIMITER //

create procedure Adoptacion (
    in dni_duenio varchar(10)
)

begin 

declare duenio_valido int;
declare duenio_con_perro int;
declare codigo_perro_abandono varchar(8);
declare nombre_perro_abandono varchar(30);
declare raza_perro_abandono varchar(20);
declare adopcion int;

select count(*) into duenio_valido from duenio where D_DNI = dni_duenio;

if duenio_valido = 0 then
select 'Error, el dni no es valido' as Mensaje;
else 
select count(*) into duenio_con_perro from perro where D_DNI = dni_duenio;

if duenio_con_perro <> 1 then
select 'No tiene un perro adoptado minimo.' as Mensaje;
else 
select codigo, nombre, raza into codigo_perro_abandono, nombre_perro_abandono, raza_perro_abandono from abandono limit 1;

insert into Perro (P_codigo, P_nombre, P_raza, P_historialMedico, D_DNI)
values (codigo_perro_abandono, nombre_perro_abandono, raza_perro_abandono, null, dni_duenio);

delete from Abandono where codigo = codigo_perro_abandono;

select concat('Adopcion exitosa, el perro ', nombre_perro_abandono, ' ha sido adoptado por el dueño con dni ', dni_duenio) as Mensaje;

END IF;
END IF;

select count(*) into adopcion from abandono;
if adopcion = 0 then
select 'Todo los perros fueron adoptados' as MensajeFinal;
else 
select concat('Quedaron por adoptar ', adopcion, ' perros') as MensajeFinal;

END IF;


END//
DELIMITER ;


CALL Adoptacion('27951386');
+------------------------------------+
| Mensaje                            |
+------------------------------------+
| No tiene un perro adoptado minimo. |
+------------------------------------+
1 row in set (0.004 sec)

+-------------------------------+
| MensajeFinal                  |
+-------------------------------+
| Quedaron por adoptar 4 perros |
+-------------------------------+
1 row in set (0.007 sec)


call Adoptacion ('19753486');
+----------------------------------------------------------------------------------+
| Mensaje                                                                          |
+----------------------------------------------------------------------------------+
| Adopcion exitosa, el perro Pelusa ha sido adoptado por el dueño con dni 19753486 |
+----------------------------------------------------------------------------------+
1 row in set (0.005 sec)

+-------------------------------+
| MensajeFinal                  |
+-------------------------------+
| Quedaron por adoptar 3 perros |
+-------------------------------+
1 row in set (0.010 sec)
