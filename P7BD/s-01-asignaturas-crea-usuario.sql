--@Autor: Armando Valderrama Navarro
--@Fecha creación: 15/10/18
--@Descripción: Creación de Usuarios

create user avn_p07_previo identified by 123 quota unlimited on users;
grant create table, create session to avn_p07_previo;