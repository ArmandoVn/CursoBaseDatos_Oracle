--@Autor: Armando Valderrama
--@Fecha creación: 13/11/2018
--@Descripción: Creación de usuario Practica 12

1.- Creando el usario avn_p1201_autos...

Prompt Contraseña del usuaria sys:
connect sys as sysdba
--permite la salida de mensajes a consula empleabo dbms_output.put_line
set serveroutput on
--este bloque anómimo valida la existencia del usuario, si existe lo elimina.
declare
v_count number(1,0);
begin
	select count(*) into v_count
	from dba_users
	where username = 'avn_p1201_autos';
		if v_count > 0 then
			dbms_output.put_line('Eliminando usuario existente');
			execute immediate 'drop user avn_p1201_autos';
		end if;
end;
/

create user avn_p1201_autos identified by 123
	quota unlimited on users;

grant create session, create table, create sequence, create procedure, create trigger to avn_p1201_autos;