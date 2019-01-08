--@Autor: Armando Valderrama
--@Fecha Creación: 14/11/2018
--@Descripción: Script encargado de registrar un nuevo auto.

set serveroutput on

create or replace procedure p_crea_auto (
	p_auto_id in out number, 
	p_marca in varchar2,
	p_modelo in varchar2,
	p_anio in varchar2,
	p_num_serie in varchar2,
	p_tipo in char, 
	p_precio in NUMERIC,
	p_agencia_id in NUMERIC,
	p_num_cilindros in number, 
	p_num_pasajeros in number,
	p_clase in char,
	p_peso_maximo in number,
	p_volumen in number,
	p_tipo_combustible in char)
is
	v_foto auto.foto%TYPE;
	v_fecha_status auto.fecha_status%TYPE;
	v_status_auto_id auto.status_auto_id%TYPE;
	v_cliente_id auto.cliente_id%TYPE;
	v_historico_status historico_status_auto.historico_status_id%TYPE;
	v_fecha_status_historico historico_status_auto.fecha_status%TYPE;
begin
	select auto_seq.nextval into p_auto_id from dual;

	v_cliente_id:= NULL;
	v_status_auto_id:= 2;
	v_fecha_status:= SYSDATE;
	v_foto:= empty_blob();
	v_fecha_status_historico:= SYSDATE;

	insert into auto (auto_id,marca,modelo,anio,num_serie,tipo,precio,descuento,
					foto,fecha_status,status_auto_id,agencia_id,cliente_id)
	values(p_auto_id,p_marca,p_modelo, p_anio,p_num_serie,p_tipo,p_precio,p_agencia_id,
			v_foto,v_fecha_status,v_status_auto_id,p_agencia_id,v_cliente_id);

	if p_tipo = 'P' then 
		insert into auto_particular values(p_auto_id,p_num_cilindros,p_num_pasajeros,p_clase);
	elsif p_tipo ='C' then
		insert into auto_carga values(p_auto_id,p_peso_maximo,p_volumen,p_tipo_combustible);	
	else
		raise_application_error(-20010,'Error tipo de auto.');
	end if;

	select historico_status_auto_seq.nextval INTO v_historico_status from dual;
	insert into historico_status_auto 
		values(v_historico_status,v_fecha_status_historico,v_status_auto_id,p_auto_id);
end p_crea_auto;
/