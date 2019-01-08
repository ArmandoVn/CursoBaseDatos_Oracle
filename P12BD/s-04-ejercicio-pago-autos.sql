--@Autor: Armando Vaderrama
--@Fecha Creación: 13/11/2018
--@Descripción: Script encargado de validar e insertar pagos

--Habilita la salida de mensajes dbms_output.put_line
set serveroutput on

create or replace procedure p_corrige_pagos is
	v_importe number;
	v_fecha_pago date;
	v_numpago number;
	v_total number;
	v_numreg number;
	v_pago_faltante number;
	v_indice number;

begin
	v_numreg := 0;
	for v_indice in 1..100 loop
		select count(*) into v_pago_faltante
		from pago_auto
		where auto_id = v_indice
		and num_pago = 1;
		if v_pago_faltante = 0 then
			v_fecha_pago := sysdate;
			v_importe := 2500;
			v_numpago := 1;
			insert into pago_auto(num_pago, auto_id, fecha_pago, importe)
				values(v_numpago, v_indice, v_fecha_pago, v_importe);
			v_numreg := v_numreg + 1;
		end if;
	end loop;

	v_total := v_numreg * 2500;

	dbms_output.put_line('Numero de pagos faltantes: '|| v_numreg);
	dbms_output.put_line('Importe total: '|| v_total);

end;
/
show errors