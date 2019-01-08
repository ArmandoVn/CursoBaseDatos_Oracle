create table consulta_1 as
select usuario_id, nombre, ap_paterno, ap_materno,
to_char(fecha_nacimiento, 'yyyy-mm-dd HH24:MI:SS') as fecha_nacimiento
from usuario;

select * from consulta_1;

create table consulta_2 as
select saldo, round(saldo, 1) as saldo_redondeado,
floor(saldo * 0.155) as descuento_sin_decimales
from usuario
where saldo is not null;

select * from consulta_2;

create table consulta_3 as
select (round(sqrt(power((select e5.latitud_ultima_conexion from usuario e5 where e5.usuario_id = 5)
- (select e4.latitud_ultima_conexion from usuario e4 where e4.usuario_id = 4),2)
+ power((select e5.longitud_ultima_conexion from usuario e5 where e5.usuario_id = 5)
- (select e4.longitud_ultima_conexion from usuario e4 where e4.usuario_id = 4),2)),5))
as distancia from usuario where usuario_id = 4;

select * from consulta_3;

create table consulta_4 as
select usuario_id, to_char(fecha_nacimiento, 'day DD ') ||
'de ' || to_char(fecha_nacimiento, 'month ') || 'del ' ||
to_char(fecha_nacimiento, 'YYYY ') || 'a las ' ||
to_char(fecha_nacimiento, 'hh24:mi:ss') as fecha_nacimiento
from usuario;

select * from consulta_4;

create table consulta_5 as
select usuario_id, to_number(to_char(fecha_nacimiento, 'yyyy')) anio_nacimiento, to_number(trunc((sysdate-fecha_nacimiento)/365))edad,
to_number(trunc(sysdate-fecha_nacimiento)) cantidad_dias
from usuario;

select * from CONSULTA_5;

create table consulta_6 as
select to_char(sysdate, 'dd/mm/yyyy hh:mi:ss')"FECHA_ACTUAL",
to_char(sysdate + 2/24+20/(24*60), 'dd/mm/yyyy hh:mi:ss')"FECHA_FUTURA"
from dual;

select * from CONSULTA_6;

create table consulta_7 as
select ap_paterno, ap_materno, upper('USR-00' || usuario_id || '-' || substr(ap_paterno, 1, 2) ||
substr(ap_materno, length(ap_materno)-1, 2)) as clave
from usuario;

select * from consulta_7;

create table consulta_8 as
select ap_paterno, ap_materno, upper('USR-00' || usuario_id || '-' || substr(ap_paterno,1,2) ||
nvl(substr(ap_materno, length(ap_materno)-1,2),'00')) as clave
from usuario;

select * from consulta_8;

create table consulta_9 as
select email, nvl(substr(email, 0, instr(email, '@')-1), 'na') as id
from usuario;

select * from consulta_9;

create table consulta_10 as
select ap_paterno AP_PATERNO, ap_materno AP_MATERNO, length(ap_paterno) + to_number(nvl(length(ap_materno),'00')) 
TOTAL_CARACTERES, substr(avatar, 1, instr(avatar, '50x50')-1) || '200x200' ||
substr(avatar, instr(avatar, '50x50')+5, length(avatar)) BIG_AVATAR
from usuario;

select * from consulta_10;

create table consulta_11 as
select nvl(ip_ultima_conexion, null) IP_ULTIMA_CONEXION,
nvl(substr(ip_ultima_conexion,1,instr(ip_ultima_conexion, '.')-1),'000') SEGMENTO1,
nvl(substr(ip_ultima_conexion, instr(ip_ultima_conexion, '.',1,3)+1, length(ip_ultima_conexion)), '000')SEGMENTO4
from usuario;

select * from consulta_11;