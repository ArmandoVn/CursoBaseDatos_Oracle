--@Autor(es): Valderrama Navarro Armando.
--@Fecha creación: 22/10/2018
--@Descripción: Validaciones ejercicio 4

whenever sqlerror exit rollback;

--cambiar el valor del nombre de usuario
prompt conectando como vald_p0801_viajes
connect vald_p0801_viajes

set linesize 200
col host format A20
col os_user format A20
col db_user format A20
select to_char(sysdate,'dd/mm/yyyy HH24:mi_ss') session_time, 
SYS_CONTEXT('USERENV','HOST') host,SYS_CONTEXT('USERENV','OS_USER') os_user,
username db_user
from user_users;

set serveroutput on
create or replace function fx_count(table_name in varchar2) return number is
	v_table_name varchar2(30);
	v_count number(2,0) := 0;
begin
	v_table_name := dbms_assert.simple_sql_name(table_name); 
	execute immediate 'select count(*) into :ph_count from '||v_table_name into v_count;

	if v_count = 0 then
		raise_application_error(-20001,'No se encontraron registros en '|| v_table_name);
	end if;	
	return v_count;
end;
/
show errors

declare
	v_num_pasajeros number(2,0);
	v_total_pasajeros number(2,0);

	v_t_aereo number(2,0);
	v_total_medio_transporte number(2,0);
	
	v_num_lugares number(2,0);
	v_total_lugares number(2,0);

	v_num_viajes number(2,0);
	v_total_viajes number(2,0);

	v_num_historico number(2,0);
	v_total_historico number(2,0);

	v_count_update_avion number(2,0);
	v_count_update_viaje number(2,0);

	v_num_viaje_detalle number(2,0);
	v_total_viaje_detalle number(2,0);

	v_num_delete_transporte number(2,0);


begin
	
	--lugares
	select count(*) into v_num_lugares
	from lugar where lugar_id in(15,8,3,1);
	v_total_lugares:= fx_count('LUGAR');

	--medio transporte aereo
	select count(*) into v_t_aereo
	from medio_transporte t, medio_aereo a
	where t.medio_transporte_id = a.medio_transporte_id
	and upper(t.tipo_medio_transporte) = 'A'
	and t.medio_transporte_id in(3, 14);  --el 3 es del inciso D
	v_total_medio_transporte := fx_count('MEDIO_TRANSPORTE');
	
	--viaje
	select count(*) into v_num_viajes
	from viaje
	where origen_id = 15
	and destino_id = 18
	and medio_transporte_id = 1;
	v_total_viajes :=fx_count('VIAJE');

	--historico
	v_num_historico := 1;
	v_total_historico :=fx_count('HISTORICO_ESTATUS_VIAJE');

	--update datos avion
	select count(*) into v_count_update_avion
	from medio_transporte
	where capacidad = 220
	and clase = 'L'
	and medio_transporte_id = (
		select medio_transporte_id 
		from medio_aereo 
		where numero_avion='CIOP34'
	); 
 
	--update del viaje al medio transporte 3
	select count(*) into v_count_update_viaje
	from viaje where medio_transporte_id = 3;

	select count(*) into v_num_pasajeros
	from pasajero
	where  pasajero_id in(3,4);
	v_total_pasajeros := fx_count('PASAJERO');

	--detalle del viaje
	select count(*) into v_num_viaje_detalle
	from viaje_detalle
	where pasajero_id in (2,3,4)
	and viaje_id = 1001;
	v_total_viaje_detalle := fx_count('VIAJE_DETALLE');

	--delete
	select count(*) into v_num_delete_transporte
	from medio_transporte
	where medio_transporte_id = 14;

	dbms_output.put_line('------- Resultados -----');
	dbms_output.put_line('num pasajeros           '||v_num_pasajeros);
	dbms_output.put_line('total pasajeros         '||v_total_pasajeros);

	dbms_output.put_line('registros t_aereo       '||v_t_aereo);
	dbms_output.put_line('total medio_transporte  '||v_total_medio_transporte);
	
	dbms_output.put_line('registros lugar         '||v_num_lugares);
	dbms_output.put_line('total lugar             '||v_total_lugares);

	dbms_output.put_line('registros viaje         '||v_num_viajes);
	dbms_output.put_line('total viaje             '||v_total_viajes);

	dbms_output.put_line('registros historico     '||v_num_historico);
	dbms_output.put_line('total historico         '||v_total_historico);

	dbms_output.put_line('update datos avion      '||v_count_update_avion);
	dbms_output.put_line('update datos viaje      '||v_count_update_viaje);

	dbms_output.put_line('registros detalle viaje '||v_num_viaje_detalle);
	dbms_output.put_line('total detalle viaje     '||v_total_viaje_detalle);

	dbms_output.put_line('delete transporte       '||v_num_delete_transporte);


	dbms_output.put_line('total ----------------- '||(v_total_pasajeros + 
		v_total_medio_transporte + v_total_lugares + v_total_viajes + 
		v_total_historico + v_count_update_viaje + v_count_update_avion + 
		v_num_viaje_detalle + v_total_viaje_detalle + v_num_delete_transporte));

	
	if v_total_pasajeros <> 4 or v_total_medio_transporte <> 3 or v_total_lugares <> 6
		or v_total_viajes <>2 or v_total_historico <> 2 or v_count_update_avion <> 1
		or v_count_update_viaje <> 1 or v_total_viaje_detalle <> 3 
		or v_num_delete_transporte <> 0 then

	   raise_application_error(-20002,'Numero de registros invalidos.'||
	   		' Secuencia valida 2,4,1,3,4,6,0,2,1,2,1,1,3,3,0 Total 25');
	end if;

end;
/