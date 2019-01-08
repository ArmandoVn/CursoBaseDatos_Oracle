--@Autor(es): Armando Valderrama
--@Fecha creación: 22/10/2018
--@Descripción: Creacion de usuarios.

connect / as sysbda

prompt Creando el usuario vald_p0801_viajes

create user vald_p0801_viajes indentify by 123
	quota 1g on users;

grant create session, create table, create view, create synonym, create trigger, create sequence, create procedure
	to vald_p0801_viajes;