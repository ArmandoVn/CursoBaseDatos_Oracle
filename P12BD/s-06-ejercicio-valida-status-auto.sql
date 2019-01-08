--@Autor: Armando Valderrama
--@Fecha Creación: 14/11/2018
--@Descripción: Script encargado de definir un trigger.

set serveroutput on

create or replace trigger tr_valida_status_auto
	before insert or update of status_auto_id on auto 
	for each row 

	declare
	v_id number;
	v_status_id number;
	v_status_id_a number;
	v_pago_total number;
	v_precio number;
	v_num_pago number;
	v_status_id number;

begin

	select num_pago,status_auto_id into v_num_pago,v_status_id
	from auto a,pago_auto pa
  	where a.auto_id = pa.auto_id
  	and pa.auto_id = v_id;

  	select sum(importe) as pago_auto, a.precio into v_pago_total, v_precio
	from auto a,pago_auto pa
  	where a.auto_id = pa.auto_id
  	and pa.auto_id = v_id
  	group by pa.auto_id,a.precio; 

	if v_status_id = 4 and (v_pago_total <> v_precio) then
			raise_application_error(-20003,'Aun no se cubre el pago total');
	elsif  v_status_id = 3 then
		if v_num_pago <> 1 then
			raise_application_error(-20002,'Debe existir pago regitsrado');
		else
			:new.descuento = 0.5*v_importe_pago;
		end if;
	elsif  v_status_id = 6 and (v_status_id_a <> 4) then
			raise_application_error(-20003,'El auto no ha sido vendido');
	elsif  v_status_id in (1,2,5) and (v_num_pago > 0 )  then
		raise_application_error(-20001,'Un auto con el estatus ingresado no puede contar con pagos registrados.');	
	end if;
end tr_valida_status_auto;
/
show errors;