--@Autor(es): Valderrama Navarro Armando.
--@Fecha creación: 22/10/2018
--@Descripción: Solución ejercicio 3


--A sentencia 1
insert into estatus_viaje (estatus_viaje_id, clave, activo) values (1, 'PROGRAMADO', 1);
--A sentencia 2
insert into estatus_viaje (estatus_viaje_id, clave, activo) values (2, 'EN CURSO', 1);
--A sentencia 3
insert into estatus_viaje (estatus_viaje_id, clave, activo) values (3, 'CANCELADO', 1);
--A sentencia 4
insert into estatus_viaje (estatus_viaje_id, clave, activo) values (4, 'REALIZADO', 1);

--B sentencia 1
insert into pasajero (pasajero_id, nombre, apellido_paterno, apellido_materno, edad, telefono, num_identificacion)
	values(1, 'Armando', 'Valderrama', 'Navarro', 21, '5556534519', '313156353');
--B sentencia 2
insert into pasajero (pasajero_id, nombre, apellido_paterno, apellido_materno, edad, telefono, num_identificacion)
	values(2, 'Roberto', 'Valderrama', 'Peréz', 18, '555456719', '313156543');

--C sentencia 1
insert into MEDIO_TRANSPORTE(MEDIO_TRANSPORTE_ID, TIPO_MEDIO_TRANSPORTE, CAPACIDAD, CLASE)
	values(1, 'A', 200, 'T');

--C sentencia 2
insert into MEDIO_AEREO (MEDIO_TRANSPORTE_ID, AEROLINEA, NUMERO_AVION) values(1, 'AIR FRANCE', 'CIOP34');

--D sentencia 1
insert into MEDIO_TRANSPORTE(MEDIO_TRANSPORTE_ID, TIPO_MEDIO_TRANSPORTE, CAPACIDAD, CLASE)
	values(24, 'T', 34, 'L');

--D sentencia 2
insert into MEDIO_TERRESTRE(MEDIO_TRANSPORTE_ID, MATRICULA, LINEA_TERRESTRE) values(24, 12893, 'PRIMERA PLUS');

--E sentencia 1
insert into LUGAR(LUGAR_ID, NOMBRE, DESCRIPCION) values(2, 'MACHU PICHU', 'MACHU PICHU PERÚ');

--E sentencia 2
insert into LUGAR(LUGAR_ID, NOMBRE, DESCRIPCION) values(16, 'CRISTO REY', 'CRISTO REY BRASIL');

--E sentencia 3
insert into VIAJE(VIAJE_ID, FECHA_SALIDA, FECHA_ESTATUS, ORIGEN_ID, DESTINO_ID, ESTATUS_VIAJE_ID)
	values(1001, to_date("12/12/2010 00:00","dd/mm/yyyy mi/hh"), to_date("12/12/2010 00:00","dd/mm/yyyy mi/hh") ,2 ,16 ,1);

--E sentencia 4
insert into HISTORICO_ESTATUS_VIAJE(HISTORICO_ESTATUS_VIAJE_ID, FECHA_ESTATUS, VIAJE_ID, ESTATUS_VIAJE_ID)
	values(HISTORICO_ESTATUS_VIAJE_SEQ.nextval, to_date("12/12/2010 00:00","dd/mm/yyyy mi/hh"), 1001, 1);

commit;