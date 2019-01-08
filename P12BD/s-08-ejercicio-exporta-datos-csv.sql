--@Autor: Armando Valderrama
--@Fecha Creación: 14/11/2018
--@Descripción: Script encargado de generar un cadena con formato.

set serveroutput on

create or replace function exporta_datos_auto_csv_fx(id_auto numeric)
	return varchar2
is
	v_cadena varchar2(32000);
	v_auto_id auto.auto_id%TYPE;
	v_num_serie auto.num_serie%TYPE;
	v_tipo auto.tipo%TYPE;
	v_precio auto.precio%TYPE;
	v_num_cilindros auto_particular.num_cilindros%TYPE;
	v_peso_maximo  auto_carga.peso_maximo%TYPE;
	v_num_pago pago_auto.num_pago%TYPE;
	v_importe pago_auto.importe%TYPE;
	v_email cliente.email%TYPE;

begin 
	select a.auto_id, a.num_serie, a.tipo, a.precio, pa.num_pago, pa.importe, c.email, ac.peso_maximo, ap.num_cilindros
		into v_auto_id, v_num_serie,v_tipo, v_precio,v_num_pago, v_importe,v_email, v_peso_maximo, v_num_cilindros
	from auto a,  cliente c, pago_auto pa, auto_carga ac, auto_particular ap
	where a.auto_id = id_auto
	and a.cliente_id=c.cliente_id
	and a.auto_id = pa.auto_id
	and ac.auto_id = a.auto_id(+)
	and ap.auto_id = a.auto_id(+);

	v_cadena:= v_auto_id||','||v_num_serie||','||v_tipo||','|| v_precio||v_num_cilindros||v_peso_maximo||','||
	v_num_pago||','||','||v_importe||','||v_email;
	return v_cadena;
end;
/
show errors 