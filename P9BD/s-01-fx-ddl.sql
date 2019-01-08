--@Autor(es):       Valderrama Navarro Armando
--@Fecha creación:  2/11/2018
--@Descripción:     Creación de tabla 
create table usuario(
    usuario_id                  number(10, 0)    not null,
    nombre                      varchar2(50)     not null,
    ap_paterno                  varchar2(100)    not null,
    ap_materno                  varchar2(50),
    profesion                   varchar2(100)    not null,
    ip_ultima_conexion          varchar2(20),
    latitud_ultima_conexion     number(15, 5),
    longitud_ultima_conexion    number(15, 5),
    telefono                    varchar2(50),
    email                       varchar2(100)    not null,
    fecha_nacimiento            date             not null,
    avatar                      varchar2(500)    not null,
    saldo                       number(7, 2),
    constraint usuario_pk primary key (usuario_id)
);
