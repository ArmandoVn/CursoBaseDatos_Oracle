--@Autor(es): Armando Valderrama
--@Fecha creación: 22/10/2018
--@Descripción: Ejercicio 5.

promp Conectando con el usuario vald_p0801_viajes
connect vald_p0801_viajes

create table PASAJERO_TEMP as
	select * from PASAJERO;

insert into PASAJERO_TEMP (pasajero_id, nombre, apellido_paterno, apellido_materno, edad, num_identificacion)
	values(3, 'MARIANA', 'JIMENEZ', 'LOPEZ', 20, 'J4U58IWSLFNEIRX8R4');

merge into PASAJERO_TEMP pt using PASAJERO p on 
	(pt.PASAJERO_ID = p.PASAJERO_ID)
	when not matched then insert
		(pt.PASAJERO_ID, pt.NOMBRE, pt.APELLIDO_PATERNO, pt.APELLIDO_MATERNO, pt.EDAD, pt.TELEFONO, pt.NUM_IDENTIFICACION) values
		(p.PASAJERO_ID, p.NOMBRE, p.APELLIDO_PATERNO, p.APELLIDO_MATERNO, p.EDAD, p.TELEFONO, p.NUM_IDENTIFICACION);

commit;