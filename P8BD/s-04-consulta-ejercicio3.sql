--@Autor(es): Valderrama Navarro Armando.
--@Fecha creación: 22/10/2018
--@Descripción: Validaciones ejercicio 3
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
	v_num_estatus number(2,0);
	v_num_pasajeros number(2,0);

	v_t_aereo number(2,0);
	v_t_terrestre number(2,0);
	v_total_medio_transporte number(2,0);
	
	v_num_lugares number(2,0);
	v_total_lugares number(2,0);

	v_num_viajes number(2,0);
	v_total_viajes number(2,0);

	v_num_historico number(2,0);
	v_total_historico number(2,0);


begin
	
	v_num_estatus := fx_count('ESTATUS_VIAJE');
	
	v_num_pasajeros := fx_count('PASAJERO');

	select count(*) into v_t_aereo
	from medio_transporte t, medio_aereo a
	where t.medio_transporte_id = a.medio_transporte_id
	and upper(t.tipo_medio_transporte) = 'A'
	and a.numero_avion='CIOP34'
	and t.medio_transporte_id = 1;

	select count(*) into v_t_terrestre
	from medio_transporte t, medio_terrestre te
	where t.medio_transporte_id = te.medio_transporte_id
	and upper(t.tipo_medio_transporte) = 'T'
	and t.medio_transporte_id = 24;

	v_total_medio_transporte := fx_count('MEDIO_TRANSPORTE');
	
	select count(*) into v_num_lugares
	from lugar where lugar_id in(2,16);

	v_total_lugares:= fx_count('LUGAR');

	select count(*) into v_num_viajes
	from viaje
	where origen_id = 2
	and destino_id = 16
	and medio_transporte_id = 1;

	v_total_viajes :=fx_count('VIAJE');

	select count(*) into v_num_historico
	from historico_estatus_viaje
	where estatus_viaje_id = 1;

	v_total_historico :=fx_count('HISTORICO_ESTATUS_VIAJE');

	dbms_output.put_line('------- Resultados -----');
	dbms_output.put_line('total estatus           '||v_num_estatus);
	dbms_output.put_line('total pasajeros         '||v_num_pasajeros);

	dbms_output.put_line('registros t_aereo       '||v_t_aereo);
	dbms_output.put_line('registros t_terrestre   '||v_t_terrestre);
	dbms_output.put_line('total medio_transporte  '||v_total_medio_transporte);
	
	dbms_output.put_line('registros lugar         '||v_num_lugares);
	dbms_output.put_line('total lugar             '||v_total_lugares);

	dbms_output.put_line('registros viaje         '||v_num_viajes);
	dbms_output.put_line('total viale             '||v_total_viajes);

	dbms_output.put_line('registros historico     '||v_num_historico);
	dbms_output.put_line('total historico         '||v_total_historico);
	dbms_output.put_line('total ----------------- '||(v_num_estatus + 
		v_num_pasajeros+v_total_medio_transporte+v_total_lugares + 
		v_total_viajes+v_total_historico));

	
	if v_num_estatus <> 4 or v_num_pasajeros <> 2 or v_total_medio_transporte <> 2
	   or v_total_lugares <> 2 or v_total_viajes <> 1 or v_total_historico <> 1 then

	   raise_application_error(-20002,'Numero de registros invalidos.'||
	   		' Secuencia valida 4,2,1,1,2,2,2,0,1,1,1');
	 end if;

end;
/