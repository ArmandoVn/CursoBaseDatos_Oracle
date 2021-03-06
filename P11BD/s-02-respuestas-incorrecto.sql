-- Query 1
select count(*) as num_articulos, sum(sv.precio_venta) as ingresos
from articulo a
join subasta s
on a.SUBASTA_ID = s.SUBASTA_ID
left join SUBASTA_VENTA sv
on sv.ARTICULO_ID = a.ARTICULO_ID
where s.FECHA_INICIO >= to_date('01-01-2010','dd-mm-yyyy')
and s.FECHA_FIN <= to_date('31-12-2010','dd-mm-yyyy');

select * from status_articulo;

--Query 2
select count(*) as articulos_no_vendidos
from articulo a
join subasta s
on a.SUBASTA_ID = s.SUBASTA_ID
where a.status_articulo_id != 3
and a.STATUS_ARTICULO_ID != 4
and s.FECHA_INICIO >= to_date('01-01-2010','dd-mm-yyyy')
and s.FECHA_FIN <= to_date('31-12-2010','dd-mm-yyyy');

-- Query 3
select min(a.precio_inicial) as menor_precio_compra, max(a.precio_inicial) as mayor_precio_compra,
  min(sv.precio_venta) as menor_precio_venta, max(sv.precio_venta) as mayor_precio_venta
from articulo a
join subasta s
on a.subasta_id = s.subasta_id
join subasta_venta sv
on sv.ARTICULO_ID = a.articulo_id
where s.nombre = 'EXPO-MAZATLAN';

-- Query 4
select c.CLIENTE_ID, c.email, tc.numero_tarjeta
from cliente c
join tarjeta_cliente tc
on c.CLIENTE_ID = tc.CLIENTE_ID
join subasta_venta sv
on sv.CLIENTE_ID = c.CLIENTE_ID
where c.FECHA_NACIMIENTO 
between to_date('01-01-1970','dd-mm-yyyy')
and to_date('31-12-1975','dd-mm-yyyy');

-- Query 5
select count(*) as numero_articulos, tipo_articulo, status_articulo_id
from articulo
where status_articulo_id = 3
or STATUS_ARTICULO_ID = 1
group by tipo_articulo, STATUS_ARTICULO_ID;

-- Query 6
select s.nombre, s.fecha_inicio, s.lugar, a.tipo_articulo, sum(sv.precio_venta) as monto_recaudado
from subasta s
join articulo a
on a.subasta_id = s.subasta_id
join subasta_venta sv
on a.ARTICULO_ID = sv.ARTICULO_ID
where s.FECHA_INICIO >= to_date('01-01-2009','dd-mm-yyyy')
and s.FECHA_FIN <= to_date('31-12-2009','dd-mm-yyyy')
group by s.NOMBRE, s.FECHA_INICIO, a.TIPO_ARTICULO, s.LUGAR
order by sum(sv.PRECIO_VENTA);

-- Query 7
select c.CLIENTE_ID , c.nombre, c.apellido_paterno, sv.cuenta, sv.total
from cliente c,(
  select sve.cliente_id, count(sve.ARTICULO_ID) as cuenta, sum(sve.PRECIO_VENTA) as total
  from SUBASTA_VENTA sve
  group by sve.cliente_id) sv
where c.cliente_id = sv.CLIENTE_ID
and sv.total > 3000000
and sv.cuenta >= 5;

-- Query 8
select s.subasta_id, s.nombre, s.fecha_inicio, a.nombre, a.clave_articulo
from subasta s
join articulo a
on a.subasta_id = s.subasta_id
where s.FECHA_INICIO >= to_date('01-01-2010','dd-mm-yyyy')
and s.FECHA_FIN <= to_date('31-01-2010','dd-mm-yyyy');

-- Query 9
select c.cliente_id, sum(sv.precio_venta) as total, fc.FECHA_FACTURA
from subasta_venta sv
join cliente c
on sv.cliente_id = c.cliente_id
join factura_cliente fc
on fc.FACTURA_CLIENTE_ID = sv.FACTURA_CLIENTE_ID
where c.nombre = 'GALILEA'
and c.apellido_paterno = 'GOMEZ'
and c.apellido_materno = 'GONZALEZ'
group by c.cliente_id, fc.FECHA_FACTURA;

-- Query 10
select s.subasta_id, sv.
;

-- Query 11

-- Query 12

-- Query 13

-- Query 14

-- Query 15







-- Practica con sintaxis correcta.
-- 1
create table consulta_1 as
select count(*) as num_articulo,sum(sv.precio_venta) as ingresos
from articulo a,subasta s,subasta_venta sv
where a.subasta_id=s.subasta_id
  and sv.articulo_id(+)=a.articulo_id
  and to_number(to_char(s.fecha_inicio,'YYYY'))=2010;

select * from consulta_1;
-- 2
create table consulta_2 as
select count(*) as Total_vendidos
from articulo a, subasta_venta sv, subasta s
where a.articulo_id=sv.articulo_id(+)
  and a.subasta_id=s.subasta_id
  and to_number(to_char(s.fecha_inicio,'YYYY'))=2010
  and sv.articulo_id is null;

select * from consulta_2;

-- 3
create table consulta_3 as
select min(precio_inicial) as Mas_barato_compra, max(precio_inicial) as Mas_caro_compra,
  min(precio_venta) as Mas_barato_venta, max(precio_venta) as Mas_caro_venta
from subasta s, articulo a, subasta_venta sv
where s.subasta_id = a.subasta_id
and a.articulo_id = sv.articulo_id
and s.nombre = 'EXPO-MAZATLAN';

select * from consulta_3;

-- 4
create table consulta_4 as
select distinct c.cliente_id, c.email, tc.numero_tarjeta
from cliente c, subasta_venta sv, tarjeta_cliente tc
where c.cliente_id in(
select c.cliente_id
from cliente c
minus
select sv.cliente_id
from subasta_venta sv)
  and tc.cliente_id=c.cliente_id
  and to_number(to_char(c.fecha_nacimiento,'YYYY'))
  between 1970 and 1975;

select * from consulta_4;

-- 5
create table consulta_5 as
select count(a.articulo_id) as num_articulos, a.tipo_articulo, s.clave
from articulo a, status_articulo s
where a.status_articulo_id=s.status_articulo_id
group by a.tipo_articulo, s.clave
having s.clave='VENDIDO'
or s.clave='ENTREGADO';

select * from consulta_5;

-- 6
create table consulta_6 as
select s.nombre, s.fecha_inicio, s.lugar, a.tipo_articulo,sum(sv.precio_venta) as suma
from articulo a
join subasta_venta sv
on a.articulo_id=sv.articulo_id
join subasta s
on s.subasta_id=a.subasta_id
group by s.nombre, s.fecha_inicio, s.lugar, a.tipo_articulo
having to_number(to_char(s.fecha_inicio,'YYYY')) = 2009;

select * from consulta_6;

-- 7
create table consulta_7 as 
select c.cliente_id,c.nombre,c.apellido_paterno,c.apellido_materno, count(*) as num_articulos,
sum(precio_venta) as total
from cliente c
join subasta_venta sv
on c.cliente_id=sv.cliente_id
group by c.cliente_id,c.nombre,c.apellido_paterno,c.apellido_materno
having count(*)>5
union
select c.cliente_id,c.nombre,c.apellido_paterno,c.apellido_materno,count(*) as num_articulos,
sum(precio_venta) as total
from cliente c
join subasta_venta sv
on c.cliente_id=sv.cliente_id
group by c.cliente_id,c.nombre,c.apellido_paterno,c.apellido_materno
having sum(sv.precio_venta)>3000000;

select * from consulta_7;

-- 8
create table consulta_8 as
select q1.subasta_id, q1.nombre as nombre_subastas, q1.fecha_inicio, a.nombre as nombre_articulo,
a.clave_articulo,max(sv.precio_venta) as precio_maximo
from articulo a, subasta_venta sv,(
select subasta_id, nombre, fecha_inicio
from subasta
where to_number(to_char(fecha_inicio,'MM')) in (1,3,6)
) q1
where q1.subasta_id=a.subasta_id
and a.articulo_id=sv.articulo_id
and a.status_articulo_id=(
select a.status_articulo_id
from status_articulo
where clave='VENDIDO')
and a.status_articulo_id=(
select a.status_articulo_id from status_articulo
where clave='ENTREGADO')
group by a.nombre, q1.subasta_id, q1.nombre, q1.fecha_inicio, a.clave_articulo
having max(sv.precio_venta)=
(
select max(maximo)
from (
select max(sv1.precio_venta) as maximo
from subasta_venta sv1, articulo a1, subasta s1
where sv1.articulo_id=a1.articulo_id
and a1.subasta_id=s1.subasta_id
and a1.subasta_id=q1.subasta_id
group by s1.subasta_id, s1.nombre
)
);

select * from consulta_8;

-- 9
create table consulta_9 as
select sum(sv.precio_venta) as total
from tarjeta_cliente tc, factura_cliente fc, cliente c, subasta_venta sv
where c.cliente_id=tc.cliente_id
and sv.factura_cliente_id=fc.factura_cliente_id
and tc.tarjeta_cliente_id=fc.tarjeta_cliente_id
and c.nombre='GALILEA'
and c.apellido_paterno='GOMEZ'
and c.apellido_materno='GONZALEZ'
and fecha_factura=(
select max(fc.fecha_factura)
from tarjeta_cliente tc, factura_cliente fc, cliente c, subasta_venta sv
where c.cliente_id=tc.cliente_id
and sv.factura_cliente_id=fc.factura_cliente_id
and tc.tarjeta_cliente_id=fc.tarjeta_cliente_id
and c.nombre='GALILEA' and c.apellido_paterno='GOMEZ'
and c.apellido_materno='GONZALEZ')
group by c.nombre,tc.tarjeta_cliente_id, fc.factura_cliente_id, fc.fecha_factura;

select * from consulta_9;

-- 10
create table consulta_10 as
select s.subasta_id, s.nombre,count(sv.precio_venta) as vendidos
from subasta s
join articulo a
on a.subasta_id=s.subasta_id
join subasta_venta sv
on a.articulo_id=sv.articulo_id
where to_char(s.fecha_inicio,'YYYY')=2010
group by s.subasta_id, s.nombre
having count(sv.precio_venta) >= 4;

select * from consulta_10;

-- 11
create table consulta_11 as
select s.subasta_id, s.fecha_inicio, a.articulo_id, a.nombre, a.precio_inicial, (
select avg(a.precio_inicial)
from articulo a, subasta s
where s.subasta_id=a.subasta_id
and to_char(s.fecha_inicio,'YYYY')=2010
and lower(a.nombre) like '%motocicleta%'
) as promedio
from subasta s
join articulo a
on a.subasta_id=s.subasta_id
where to_char(s.fecha_inicio,'YYYY/MM')='2010/07'
and lower(a.nombre) like '%motocicleta%'
and a.status_articulo_id in (
select status_articulo_id
from status_articulo
where clave='VENDIDO'
or clave='ENTREGADO');


select * from consulta_11;

-- 12
create table consulta_12 as
select p.pais_id, p.clave, p.descripcion
from articulo a, articulo_donado ad, pais p
where a.articulo_id=ad.articulo_id
and ad.pais_id=p.pais_id
and a.precio_inicial>300000
and a.tipo_articulo='D'
group by p.pais_id, p.clave, p.descripcion
having count(*)>=3;

select * from consulta_12;

-- 13
create table consulta_13 as
select s.subasta_id, s.nombre, s.fecha_inicio, sum(sv.precio_venta) as total_ventas
from subasta s
join articulo a
on a.subasta_id=s.subasta_id
join subasta_venta sv
on a.articulo_id=sv.articulo_id
where to_char(s.fecha_inicio,'YYYY')=2010
group by s.subasta_id, s.nombre, s.fecha_inicio
having sum(sv.precio_venta)>3000000;

select * from consulta_13;

-- 14
create table consulta_14 as
select c.nombre, c.apellido_paterno, c.apellido_materno, sum(precio_venta) as Total_venta
from factura_cliente fc, subasta_venta sv, cliente c
where fc.factura_cliente_id(+)=sv.factura_cliente_id
and c.cliente_id=sv.cliente_id
and sv.factura_cliente_id is null
group by c.cliente_id, c.nombre, c.apellido_paterno, c.apellido_materno
having sum(precio_venta)>1000000;

select * from consulta_14;

-- 15
create table consulta_15 as
select s.subasta_id, s.nombre, s.fecha_inicio, s.fecha_fin, s.lugar, s.cupo
from subasta s
join articulo a
on s.subasta_id=a.subasta_id
join subasta_venta sv
on a.articulo_id=sv.articulo_id
group by s.subasta_id, s.nombre, s.fecha_inicio, s.fecha_fin, s.lugar, s.cupo
having count(a.articulo_id)=(
select max(count(a.articulo_id))
from subasta s, articulo a, subasta_venta sv
where s.subasta_id=a.subasta_id
and sv.articulo_id=a.articulo_id
group by s.subasta_id, s.nombre, s.fecha_inicio, s.fecha_fin, s.lugar, s.cupo
);

select * from consulta_15;