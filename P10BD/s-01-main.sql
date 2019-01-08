--@Autor(es): Valderrama Navarro Armando
--@Fecha creación: 08/11/2018
--@Descripción: Creacion de usuarios

prompt Proporcionar el password del usuario sys:
connect sys as sysdba

prompt 1.- Creando el usario avn_p1001_subastas
create user avn_p1001_subastas identified by 123
quota unlimited on users;

prompt 2.- Asignando privelegios necesarios.
grant create session, create table, create view, create synonym, create sequence, create trigger, create procedure to avn_p1001_subastas;

prompt 3.- Conectando con el usuario avn_p1001_subastas...
connect avn_p1001_subastas

prompt 3.- Creacion del modelo fisico de la base de datos.
@@s-02-ddl.sql
@@s-03-carga-inicial.sql