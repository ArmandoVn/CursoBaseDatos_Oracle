--@Autor(es): Armando Valderrama
--@Fecha creación: 22/10/2018
--@Descripción: Validacion cambios objetos.

Prompt conectando  avn_p0701_admin
connect avn_p0701_admin

set serveroutput on;
whenever sqlerror exit rollback

delete from regular;
delete from estudiante;

--cambio 1
begin
	insert into estudiante(estudiante_id,nombre,ap_paterno,ap_materno,tipo,num_cuenta)
	values(3,'Armando','Valderrama','Navarro','R','1234567890123');
	dbms_output.put_line('Cambio 1 OK, campo num_cuenta');
end;
/
--cambio 2
declare
begin
	insert into oyente(estudiante_id,num_extraordinarios)
	values(3,11);
	raise_application_error(-20001,
		'La BD permitió registrar un estudiante con mas de 10 extras');
exception
	
	when others then 
		-- ORA-02290: restriccion de control (JRC_P701_ADMIN.OYENTE_NUM_EXTRAS)
		if sqlcode = -2290 then
			dbms_output.put_line('Cambio 2 OK, restriccion Check');
		else
			raise;
		end if;
end;
/
--cambio 3
begin
	insert into estudiante(estudiante_id,nombre,ap_paterno,ap_materno,tipo,num_cuenta)
	values(4,'Juan','Rodriguez','Campos','X','1234567890123');
	dbms_output.put_line('Cambio 3 OK, estudiante tipo X fue permitido');
exception
	when others then 
		dbms_output.put_line('Error al insertar a un estudiante tipo X, la BD lo debe dejar.');
		raise;
end;
/
--cambio 4
declare
	v_column varchar2(30);
	v_count number;
begin
	select v_column into v_count
	from  user_tab_cols
	where table_name ='ASIGNATURA'
	and  column_name = 'CLAVE_ASIGNATURA';
	
	select count(*) into v_count
	from user_tab_cols
	where table_name = 'ASIGNATURA'
	and column_name = 'CLAVE';

	if v_count > 0 then
		raise_application_error(-20002,
		'Se encontró la columna CLAVE en ASIGNATURA');
	end if;
	dbms_output.put_line('Cambio 4 OK, columna CLAVE_ASIGNATURA');
end;
/
--cambio 5
declare
v_table varchar2(30);
begin
	select table_name into v_table
	from user_tables
	where table_name='OYENTE_ADEUDO';
	dbms_output.put_line('Cambio 5 OK, columna OYENTE_ADEUDO');
end;
/
--cambio 6
declare
v_column varchar2(30);
begin
	select column_name into v_column
	from user_tab_cols
	where table_name='OYENTE_ADEUDO'
	and column_name = 'OYENTE_ADEUDO_ID';
	dbms_output.put_line('Cambio 6 OK, columna OYENTE_ADEUDO_ID');
end;
/
--cambio 7
begin
	update oyente set num_extraordinarios=999;
	dbms_output.put_line('Cambio 7 OK, columna num_extraordinarios acepta 3 digitos');	
end;
/
--cambio 8
declare 
	v_ap_pat varchar2(30);
begin
	insert into regular(estudiante_id,semestre)
	values(4,10);
	select apellido_paterno into v_ap_pat from v_estudiante;
	dbms_output.put_line('Cambio 8 OK, vista con atributo apellido_paterno');	
end;
/
--cambio 10
declare
	v_index varchar2(30);
begin
	select index_name into v_index
	from user_indexes
	where index_name='EST_BUSQUEDA_NOMBRES_IX';
	dbms_output.put_line('Cambio 10 OK, indice renombrado');	
end;
/
--cambio 9
declare
	v_seq varchar2(30);
begin
	select sequence_name into v_seq
	from user_sequences
	where sequence_name = 'SEQ_ESTUDIANTE'
	and max_value = 60000
	and min_value = 5
	and CYCLE_FLAG ='Y'; 
	dbms_output.put_line('Cambio 9 OK, secuencia actualizada correctamente');	
end;
/
prompt Listo!, haciendo rollback para dejar la BD en su edo original.
rollback;
disconnect;