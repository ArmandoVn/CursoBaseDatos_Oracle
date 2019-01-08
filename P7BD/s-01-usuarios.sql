--@Autor: Armando Valderrama
--@Fecha creación: 17/10/2018
--@Descripción: Creacion de un archivo
--@/home/armandovn/Documentos/Practicas_BD/s-01-usuarios.sql

prompt Proporcionar el password del usuario sys:
connect sys as sysdba

prompt creando usuario avn_p0701_admin
create user AVN_P0701_ADMIN identified by 123
	quota 1g on users
	password expire;
grant create session to AVN_P0701_ADMIN;

prompt creando al usuario avn_p0701_invitado
create user AVN_P0701_INVITADO identified by invitado;
grant create session to AVN_P0701_INVITADO;

prompt creando roles
create role p0701_admin_rol;
grant create table, create view, create synonym, create trigger, create sequence, create procedure to p0701_admin_rol;

prompt Asignar el rol p0701_admin_rol a avn_p0701_admin
grant p0701_admin_rol to AVN_P0701_ADMIN;

Prompt Listo!
disconnect;