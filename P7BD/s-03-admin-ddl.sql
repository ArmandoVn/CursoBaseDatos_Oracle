prompt Conectandose con el usuario AVN_P0701_ADMIN
connect AVN_P0701_ADMIN

CREATE SEQUENCE seq_estudiante
	start with 10
	increment by 3
	nomaxvalue 
	cache 5
	nocycle;

prompt Creando los modelos necesarios para el caso de estudio:

CREATE TABLE ASIGNATURA(
	asignatura_id numeric(10,0) not null constraint asignatura_pk primary key,
	nombre varchar2(40) not null,
	clave numeric(4,0) not null constraint asignatura_uk unique,
	asignatura_requerida_id numeric(10,0)
		constraint asignatura_requerida_id_fk references ASIGNATURA(asignatura_id)
);

CREATE INDEX asi_asignatura_requerida_ix on ASIGNATURA(asignatura_requerida_id);

CREATE TABLE ESTUDIANTE(
	estudiante_id numeric(10,0) constraint estudiante_pk primary key,
	nombre varchar2(40) not null,
	ap_paterno varchar2(40) not null,
	ap_materno varchar2(40),
	tipo char(1) not null 
		constraint tipo_estudiante_chk check(tipo in ('O','R'))
);

CREATE INDEX est_nombre_ix on ESTUDIANTE(lower(nombre));
-- Recordemos que para hacer uso de querys con este indice, debemos hacer uso de la funcion
-- lower del mismo modo que lo hicimos cuando realizamos la declaracion del index.
CREATE TABLE OYENTE(
	estudiante_id numeric(10,0) constraint oyente_pk primary key,
	num_extraordinarios numeric(2,0) not null,
	constraint oyente_pk_fk foreign key (estudiante_id) references ESTUDIANTE(estudiante_id)
);

CREATE TABLE REGULAR(
	estudiante_id numeric(10,0) constraint regular_pk primary key,
	semestre numeric(2,0) not null,
	constraint regular_pk_fk foreign key (estudiante_id) references ESTUDIANTE(estudiante_id)
);

CREATE TABLE OYENTE_ASIGNATURA(
	estudiante_id numeric(10,0) not null constraint estudiante_fk_pk references OYENTE(estudiante_id),
	asignatura_id numeric(10,0) not null constraint asignatura_fk_pk references ASIGNATURA(asignatura_id),
	fecha_aprobacion date not null,
	constraint oyente_asignatura_pk_fk primary key(asignatura_id, estudiante_id)
);

CREATE OR REPLACE VIEW V_ESTUDIANTE(
	estudiante_id, nombre, semestre)
	AS SELECT e.estudiante_id, nombre, semestre
	FROM ESTUDIANTE e, REGULAR r
	WHERE e.estudiante_id=r.estudiante_id;