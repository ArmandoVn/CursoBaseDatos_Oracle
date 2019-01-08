--@Autor(es): Armando Valderrama
--@Fecha creación: 22/10/2018
--@Descripción: Modificacion de la estrcutura de objetos.

prompt Conectando con avn_p0701_admin
connect avn_p0701_admin

--1
alter table estudiante add num_cuenta varchar2(13);
--2
alter table oyente modify num_extraordinarios check(num_extraordinarios < 10);
--3
alter table estudiante drop constraint tipo_estudiante_chk;
--4
alter table ASIGNATURA rename column clave to clave_asignatura;
--5
alter table oyente_asignatura rename to oyente_adeudo;
--6
alter table oyente_adeudo drop constraint oyente_asignatura_pk_fk;
alter table oyente_adeudo add oyente_adeudo_id numeric(10,0) constraint oyente_adeudo_pk primary key;
--7
alter table oyente modify num_extraordinarios numeric(3,0);
--8
CREATE OR REPLACE VIEW V_ESTUDIANTE(
	estudiante_id, nombre, apellido_paterno, semestre)
	AS SELECT e.estudiante_id, nombre, ap_paterno, semestre
	FROM ESTUDIANTE e, REGULAR r
	WHERE e.estudiante_id=r.estudiante_id;
--9
alter sequence seq_estudiante minvalue 5 maxvalue 60000 cycle;
--10
alter index est_nombre_ix rename to EST_BUSQUEDA_NOMBRES_IX;