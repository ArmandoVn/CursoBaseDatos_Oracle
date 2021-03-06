--@Autor: Armando Valderrama
--@Fecha creación: 13/11/2018
--@Descripción: Creación del modelo autos

prompt 1.- Contraseña del usuario avn_p1201_autos
connect avn_p1201_autos

-- 
-- sequence: auto_seq 
--

create sequence auto_seq
    start with 101
    increment by 1
    nominvalue
    nomaxvalue
    cache 20
    noorder
;

-- 
-- sequence: historico_status_auto_seq 
--

create sequence historico_status_auto_seq
    start with 1001
    increment by 1
    nominvalue
    nomaxvalue
    cache 20
    noorder
;

-- 
-- table: agencia 
--

create table agencia(
    agencia_id          number(10, 0)    not null,
    nombre              varchar2(40)     not null,
    clave               varchar2(8)      not null,
    agencia_anexa_id    number(10, 0),
    constraint pk1 primary key (agencia_id), 
    constraint agencia_anexa_id_fk foreign key (agencia_anexa_id)
    references agencia(agencia_id)
)
;



-- 
-- table: cliente 
--

create table cliente(
    cliente_id            number(10, 0)    not null,
    nombre                varchar2(40)     not null,
    ap_paterno            varchar2(40)     not null,
    ap_materno            varchar2(40),
    num_identificacion    varchar2(18)     not null,
    email                 varchar2(500)    not null,
    constraint pk9 primary key (cliente_id)
)
;



-- 
-- table: status_auto 
--

create table status_auto(
    status_auto_id    number(2, 0)    not null,
    clave             varchar2(20)    not null,
    descripcion       varchar2(40)    not null,
    constraint pk8 primary key (status_auto_id)
)
;



-- 
-- table: auto 
--

create table auto(
    auto_id           number(10, 0)    not null,
    marca             varchar2(40)     not null,
    modelo            varchar2(40)     not null,
    anio              number(4, 0)     not null,
    num_serie         varchar2(20)     not null,
    tipo              char(1)          not null,
    precio            number(9, 2)     not null,
    descuento         number(9, 2),
    foto              blob             not null,
    fecha_status      timestamp(6)     not null,
    status_auto_id    number(2, 0)     not null,
    agencia_id        number(10, 0)    not null,
    cliente_id        number(10, 0),
    constraint pk6 primary key (auto_id), 
    constraint auto_agencia_id_fk foreign key (agencia_id)
    references agencia(agencia_id),
    constraint auto_cliente_id_fk foreign key (cliente_id)
    references cliente(cliente_id),
    constraint auto_status_id_fk foreign key (status_auto_id)
    references status_auto(status_auto_id)
)
;



-- 
-- table: auto_carga 
--

create table auto_carga(
    auto_id             number(10, 0)    not null,
    peso_maximo         number(10, 2)    not null,
    volumen             number(10, 2)    not null,
    tipo_combustible    char(1)          not null,
    constraint pk12 primary key (auto_id), 
    constraint refauto21 foreign key (auto_id)
    references auto(auto_id)
)
;



-- 
-- table: auto_particular 
--

create table auto_particular(
    auto_id          number(10, 0)    not null,
    num_cilindros    number(1, 0)     not null,
    num_pasajeros    number(2, 0)     not null,
    clase            char(1)          not null,
    constraint pk11 primary key (auto_id), 
    constraint refauto11 foreign key (auto_id)
    references auto(auto_id)
)
;



-- 
-- table: historico_status_auto 
--

create table historico_status_auto(
    historico_status_id    number(10, 0)    not null,
    fecha_status           timestamp(6)     not null,
    status_auto_id         number(2, 0)     not null,
    auto_id                number(10, 0)    not null,
    constraint pk7 primary key (historico_status_id), 
    constraint historico_status_auto_id_fk foreign key (auto_id)
    references auto(auto_id),
    constraint historico_status_id_fk foreign key (status_auto_id)
    references status_auto(status_auto_id)
)
;



-- 
-- table: pago_auto 
--

create table pago_auto(
    num_pago              number(3, 0)     not null,
    auto_id               number(10, 0)    not null,
    fecha_pago            timestamp(6)     not null,
    importe               number(8, 2)     not null,
    importe_devolucion    number(8, 2),
    constraint pk13 primary key (num_pago, auto_id), 
    constraint pago_auto_id_fk foreign key (auto_id)
    references auto(auto_id)
)
;



-- 
-- table: tarjeta_cliente 
--

create table tarjeta_cliente(
    cliente_id          number(10, 0)    not null,
    num_tarjeta         varchar2(16)     not null,
    anio_expira         varchar2(2)      not null,
    mes_expira          varchar2(2)      not null,
    codigo_seguridad    number(3, 0)     not null,
    tipo                char(1)          not null,
    constraint pk10 primary key (cliente_id), 
    constraint tarjeta_cliente_id_fk foreign key (cliente_id)
    references cliente(cliente_id)
)
;



