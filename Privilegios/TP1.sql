1- Crear dos usuarios, uno con clave y otro sin su clave.

MariaDB [(none)]> create user Rodri1003@localhost;  /* Se puede en localhost */
Query OK, 0 rows affected (0.001 sec)

MariaDB [(none)]> create user 'RodrigoTorresGemelas' identified by 'skibidi';  /* Host remoto */
Query OK, 0 rows affected (0.001 sec)

MariaDB [(none)]> select user from mysql.user;
+----------------------+
| User                 |
+----------------------+
| root                 |
| root                 |
| Rodri1003            |
| RodrigoTorresGemelas |
| pma                  |
| root                 |
+----------------------+
6 rows in set (0.001 sec)

/* estado */
SELECT User, Host FROM mysql.user;
+----------------------+-----------+
| User                 | Host      |
+----------------------+-----------+
| RodrigoTorresGemelas | %         |
| root                 | ::1       |
| Rodri1003            | localhost |
| pma                  | localhost |
| root                 | localhost |
+----------------------+-----------+
6 rows in set (0.001 sec)

/* 4- Otorgar permisos de select, update a la tabla clientes de la  base de datos ventas. */

MariaDB [(none)]> GRANT SELECT, UPDATE ON ventas.clientes TO 'RodrigoTorresGemelas';
Query OK, 0 rows affected (0.193 sec)

MariaDB [(none)]> GRANT SELECT, UPDATE ON ventas.clientes TO Rodri1003@localhost;
Query OK, 0 rows affected (0.101 sec)

/* 5- Mostrar que solo tiene esos permisos  */

MariaDB [(none)]> SHOW GRANTS FOR 'RodrigoTorresGemelas';
+---------------------------------------------------------------------------------------------------------------------+
| Grants for RodrigoTorresGemelas@%                                                                                   |
+---------------------------------------------------------------------------------------------------------------------+
| GRANT USAGE ON *.* TO `RodrigoTorresGemelas`@`%` IDENTIFIED BY PASSWORD '*3173CF21E827B424227B3213E6A6243036BD7B08' |
| GRANT SELECT, UPDATE ON `ventas`.`clientes` TO `RodrigoTorresGemelas`@`%`                                           |
+---------------------------------------------------------------------------------------------------------------------+
2 rows in set (0.000 sec)

MariaDB [(none)]> SHOW GRANTS FOR Rodri1003@localhost;
+------------------------------------------------------------------------+
| Grants for Rodri1003@localhost                                         |
+------------------------------------------------------------------------+
| GRANT USAGE ON *.* TO `Rodri1003`@`localhost`                          |
| GRANT SELECT, UPDATE ON `ventas`.`clientes` TO `Rodri1003`@`localhost` |
+------------------------------------------------------------------------+
2 rows in set (0.000 sec)


/* 6. Intentar hacer un delete mostrar que mensaje les da.  */

# mysql -u Rodri1003 -p
Enter password:
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 9
Server version: 10.4.32-MariaDB mariadb.org binary distribution

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> use ventas;
Database changed
MariaDB [ventas]> delete from clientes;
ERROR 1142 (42000): DELETE command denied to user 'Rodri1003'@'localhost' for table `ventas`.`clientes`

/* 7- Otorgarle el privilegio de delete  realizarlo. Mostrar lo que se obtiene. */

MariaDB [(none)]> grant delete on ventas.clientes to Rodri1003@localhost;
Query OK, 0 rows affected (0.023 sec)

MariaDB [(none)]> SHOW GRANTS FOR Rodri1003@localhost;
+--------------------------------------------------------------------------------+
| Grants for Rodri1003@localhost                                                 |
+--------------------------------------------------------------------------------+
| GRANT USAGE ON *.* TO `Rodri1003`@`localhost`                                  |
| GRANT SELECT, UPDATE, DELETE ON `ventas`.`clientes` TO `Rodri1003`@`localhost` |
+--------------------------------------------------------------------------------+
2 rows in set (0.000 sec)

MariaDB [(none)]> grant delete on ventas.clientes to 'RodrigoTorresGemelas';
Query OK, 0 rows affected (0.003 sec)

MariaDB [(none)]> SHOW GRANTS FOR 'RodrigoTorresGemelas';
+---------------------------------------------------------------------------------------------------------------------+
| Grants for RodrigoTorresGemelas@%                                                                                   |
+---------------------------------------------------------------------------------------------------------------------+
| GRANT USAGE ON *.* TO `RodrigoTorresGemelas`@`%` IDENTIFIED BY PASSWORD '*3173CF21E827B424227B3213E6A6243036BD7B08' |
| GRANT SELECT, UPDATE, DELETE ON `ventas`.`clientes` TO `RodrigoTorresGemelas`@`%`                                   |
+---------------------------------------------------------------------------------------------------------------------+
2 rows in set (0.000 sec)


/* 8- Revocar los permisos de ambos usuarios. */

MariaDB [(none)]> revoke select, update, delete on ventas.clientes from 'RodrigoTorresGemelas';
Query OK, 0 rows affected (0.001 sec)

MariaDB [(none)]> SHOW GRANTS FOR 'RodrigoTorresGemelas';
+---------------------------------------------------------------------------------------------------------------------+
| Grants for RodrigoTorresGemelas@%                                                                                   |
+---------------------------------------------------------------------------------------------------------------------+
| GRANT USAGE ON *.* TO `RodrigoTorresGemelas`@`%` IDENTIFIED BY PASSWORD '*3173CF21E827B424227B3213E6A6243036BD7B08' |
+---------------------------------------------------------------------------------------------------------------------+
1 row in set (0.000 sec)

MariaDB [(none)]> revoke select, update, delete on ventas.clientes from Rodri1003@localhost;
Query OK, 0 rows affected (0.001 sec)

MariaDB [(none)]> SHOW GRANTS FOR Rodri1003@localhost;
+-----------------------------------------------+
| Grants for Rodri1003@localhost                |
+-----------------------------------------------+
| GRANT USAGE ON *.* TO `Rodri1003`@`localhost` |
+-----------------------------------------------+

/* 9- Borrar los  usuarios. */

MariaDB [(none)]> drop user Rodri1003@localhost;
Query OK, 0 rows affected (0.001 sec)

MariaDB [(none)]> drop user 'RodrigoTorresGemelas';
Query OK, 0 rows affected (0.001 sec)

MariaDB [(none)]> select user from mysql.user;
+------+
| User |
+------+
| root |
| root |
| pma  |
| root |
+------+
4 rows in set (0.001 sec)



