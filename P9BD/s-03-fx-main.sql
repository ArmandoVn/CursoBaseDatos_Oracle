--@Autor(es): Armando Valderrama
--@Fecha creación: 04/11/2018
--@Descripción: Creacion de usuario y diseño de la base de datos.

promp Creando el usuario avn_p0902_fx
Create user avn_p0902_fx identified by 123
	quota 1g on users;

grant create session, create table, create procedure to avn_p0902_fx;

promp Conectando con el usuario avn_p0902_fx
connect avn_p0902_fx

@@s-01-fx-ddl.sql
set define off
@@s-02-fx-carga-inicial.sql
set define on