--A sentencia 1
insert into LUGAR(LUGAR_ID, NOMBRE, DESCRIPCION) values(15, 'BARRANCA DEL COBRE', 'BARRANCA DEL COBRE MEXICO');

--A sentencia 2
insert into LUGAR(LUGAR_ID, NOMBRE, DESCRIPCION) values(8, 'TEOTIHUACAN', 'TEOTIHUACAN MEXICO');

--A sentencia 3
insert into VIAJE(VIAJE_ID, FECHA_SALIDA, FECHA_ESTATUS, ORIGEN_ID, DESTINO_ID, MEDIO_TRANSPORTE_ID, ESTATUS_VIAJE_ID)
	values(1002, to_date("05/09/2010 08:00","dd/mm/yyyy mi/hh"), to_date("12/12/2010 00:00","dd/mm/yyyy mi/hh") ,2 ,16, 1 ,1);

--A sentencia 4
insert into HISTORICO_ESTATUS_VIAJE(HISTORICO_ESTATUS_VIAJE_ID, FECHA_ESTATUS, VIAJE_ID, ESTATUS_VIAJE_ID)
	values(HISTORICO_ESTATUS_VIAJE_SEQ.nextval, to_date("12/12/2010 00:00","dd/mm/yyyy mi/hh"), 1001, 1);

--B sentencia 1
insert into LUGAR(LUGAR_ID, NOMBRE, DESCRIPCION) values(3, 'CHICHEN ITZA', 'CHICHEN ITZA MEXICO');

--B sentencia 2
insert into LUGAR(LUGAR_ID, NOMBRE, DESCRIPCION) values(1, 'CANCUN', 'CANCUN MEX.');

--B setencia 3
insert into MEDIO_TRANSPORTE(MEDIO_TRANSPORTE_ID, TIPO_MEDIO_TRANSPORTE, CAPACIDAD, CLASE)
	values(14, 'A', 200, 'L');

--B sentencia 4
insert into MEDIO_AEREO(MEDIO_TRANSPORTE_ID, AEROLINEA, NUMERO_AVION) values(14, 'AEREOMEXICO', 'MXA903');

--B sentencia 5
insert into VIAJE(VIAJE_ID, FECHA_SALIDA, FECHA_ESTATUS, ORIGEN_ID, DESTINO_ID, MEDIO_TRANSPORTE_ID, ESTATUS_VIAJE_ID)
	values(1003, to_date("01/05/2011 07:50","dd/mm/yyyy mi/hh"), to_date("01/05/2011 07:50","dd/mm/yyyy mi/hh") ,2 ,16, 14 ,1);

--B sentencia 6
insert into VIAJE_DETALLE(VIAJE_DETALLE_ID, NUMERO_ASIENTO, VIAJE_ID, PASAJERO_ID)
	values(1, '32F', 1003, 1);

--B sentencia 7
insert into HISTORICO_ESTATUS_VIAJE(HISTORICO_ESTATUS_VIAJE_ID, FECHA_ESTATUS, VIAJE_ID, ESTATUS_VIAJE_ID)
	values(HISTORICO_ESTATUS_VIAJE_SEQ.nextval, to_date("01/05/2011 07:50","dd/mm/yyyy mi/hh"), 1003, 1);

--C sentencia 1 (Falta implementar la subquery)
update table MEDIO_TRANSPORTE set CLASE='L', CAPACIDAD=220 where MEDIO_TRANSPORTE=14;

--D sentencia 1
insert into MEDIO_TRANSPORTE(MEDIO_TRANSPORTE_ID, TIPO_MEDIO_TRANSPORTE, CAPACIDAD, CLASE)
	values(3, 'A', 250, 'T');

--D sentencia 2
insert into MEDIO_AEREO(MEDIO_TRANSPORTE_ID, AEROLINEA, NUMERO_AVION) values(3, 'MEXICANA DE AVIACIÓN', 'MX0056');

--D sentencia 3
update table VIAJE set MEDIO_TRANSPORTE_ID=3 where VIAJE_ID=1001;

--D sentencia 4
select * from VIAJE where VIAJE_ID=1001;

--E sentencia 1
insert into PASAJERO(PASAJERO_ID, NOMBRE, APELLIDO_PATERNO, NUM_IDENTIFICACION)
	values(3, 'Pasajero', '3', '313156354');

--E sentencia 2
insert into PASAJERO(PASAJERO_ID, NOMBRE, APELLIDO_PATERNO, NUM_IDENTIFICACION)
	values(4, 'Pasajero', '4', '313156354');

--E sentencia 3
insert into VIAJE_DETALLE(VIAJE_DETALLE_ID, NUMERO_ASIENTO, VIAJE_ID, PASAJERO_ID)
	values(2, '22A', 1001, 2);

--E sentencia 4
insert into VIAJE_DETALLE(VIAJE_DETALLE_ID, NUMERO_ASIENTO, VIAJE_ID, PASAJERO_ID)
	values(3, '42F', 1001, 3);

--E sentencia 5
insert into VIAJE_DETALLE(VIAJE_DETALLE_ID, NUMERO_ASIENTO, VIAJE_ID, PASAJERO_ID)
	values(4, '11C', 1001, 4);

--F sentencia 1
delete from VIAJE where MEDIO_TRANSPORTE_ID=14 AND ESTATUS_VIAJE_ID=1;