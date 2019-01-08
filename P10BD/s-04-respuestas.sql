create table consulta_1 as
select a.nombre, a.clave_articulo, sa.clave
from articulo a, articulo_famoso af, status_articulo sa
where a.articulo_id=af.articulo_id
and a.status_articulo_id=sa.status_articulo_id
and lower(af.nombre_completo)='william harvey';

select * from consulta_1;

create table consulta_2 as
select articulo_id, nombre, a.clave_articulo
from articulo a
join status_articulo sa
using (status_articulo_id)
join articulo_donado ad
using(articulo_id)
join pais p
using(pais_id)
where p.descripcion='BELGICA' and sa.clave='ENTREGADO';

select * from consulta_2;

create table consulta_3 as
select articulo_id, a.nombre, a.precio_inicial, sv.precio_venta, a.tipo_articulo,
 s.nombre as subasta_nombre, s.fecha_inicio
from articulo a
natural join subasta_venta sv
join cliente c
using (cliente_id)
join subasta s
using(subasta_id)
where upper(c.nombre)='MARICELA'
and upper(c.apellido_paterno)='PAEZ'
and upper(c.apellido_materno)='MARTINEZ'
and (s.fecha_inicio>=to_date('01/01/2010','DD/MM/YYYY')
and s.fecha_fin<=to_date('31/12/2010','DD/MM/YYYY'));

select * from consulta_3;

create table consulta_4 as
select c.cliente_id, c.nombre, c.apellido_paterno, c.apellido_materno, 
tc.numero_tarjeta, tc.tipo_tarjeta, tc.anio_vigencia, tc.mes_vigencia
from cliente c, tarjeta_cliente tc
where c.cliente_id=tc.cliente_id
and TO_DATE(mes_vigencia||anio_vigencia,'MM/YY')<='01/11/11';

select * from consulta_4;

create table consulta_5 as
select a.articulo_id, a.nombre, a.clave_articulo, a.tipo_articulo, 
aa.anio_hallazgo, a.precio_inicial, sv.precio_venta
from articulo a
join articulo_arqueologico aa
on a.articulo_id=aa.articulo_id
left outer join subasta_venta sv
on a.articulo_id=sv.articulo_id
where a.precio_inicial>800000;

select * from consulta_5;

create table consulta_6 as
select c.nombre, c.apellido_paterno, c.apellido_materno, 
c.email, c.ocupacion, tc.tipo_tarjeta
from cliente c, tarjeta_cliente tc
where c.cliente_id=tc.cliente_id(+)
and c.ocupacion='ABOGADO';

select * from consulta_6;

create table consulta_7 as
select articulo_id, nombre, clave_articulo, precio_inicial, status_articulo_id
from articulo
where precio_inicial>900000
minus
select articulo_id, nombre, clave_articulo, precio_inicial, status_articulo_id
from articulo
where status_articulo_id=2
minus
select articulo_id, nombre, clave_articulo, precio_inicial, status_articulo_id
from articulo
where status_articulo_id=3
minus
select articulo_id, nombre, clave_articulo, precio_inicial, status_articulo_id
from articulo
where status_articulo_id=4;

select * from consulta_7;

create table consulta_8 as
select a.articulo_id, a.clave_articulo, a.nombre, a.status_articulo_id, aa.anio_hallazgo, to_char(sysdate,'YYYY')-(aa.anio_hallazgo) as antiguedad
from articulo a, articulo_arqueologico aa
where a.articulo_id=aa.articulo_id
and to_char(sysdate,'YYYY')-(aa.anio_hallazgo)>150
and a.status_articulo_id=1;

select * from consulta_8;

create table consulta_9 as
select a.nombre, a.tipo_articulo
from articulo a, status_articulo sa
where (lower(a.descripcion) like '%colonial%'
or lower(a.nombre) like '%colonial%')
and sa.clave='EN SUBASTA';

select * from consulta_9;

create table consulta_10 as
select fc.fecha_factura, tc.numero_tarjeta, c.nombre, c.apellido_paterno,
c.apellido_materno, sv.precio_venta, a.precio_inicial,
sv.precio_venta-a.precio_inicial as diferencia, a.nombre as nombre_subasta,
a.clave_articulo,
a.tipo_articulo, af.nombre_completo, aa.anio_hallazgo, p.clave
from tarjeta_cliente tc
join factura_cliente fc
on tc.tarjeta_cliente_id=fc.tarjeta_cliente_id
join cliente c
on tc.cliente_id=c.cliente_id
join subasta_venta sv
on c.cliente_id=sv.cliente_id
join articulo a
on sv.articulo_id=a.articulo_id
left outer join articulo_famoso af
on a.articulo_id=af.articulo_id
left outer join articulo_arqueologico aa
on a.articulo_id=aa.articulo_id
left outer join articulo_donado ad
on a.articulo_id=ad.articulo_id
left outer join pais p
on ad.pais_id=p.pais_id
where tc.numero_tarjeta='5681375824866375';

select * from consulta_10;

create table consulta_11 as
select fc.fecha_factura, tc.numero_tarjeta, c.nombre,
c.apellido_paterno, c.apellido_materno, sv.precio_venta, 
a.precio_inicial, sv.precio_venta-a.precio_inicial as diferencia,
a.nombre as nombre_subasta, a.clave_articulo,a.tipo_articulo,
af.nombre_completo, aa.anio_hallazgo, p.clave
from tarjeta_cliente tc, factura_cliente fc,  cliente c, subasta_venta sv, articulo a, articulo_famoso af, articulo_arqueologico aa, articulo_donado ad, pais p
where tc.tarjeta_cliente_id=fc.tarjeta_cliente_id
and tc.cliente_id=c.cliente_id
and c.cliente_id=sv.cliente_id
and sv.articulo_id=a.articulo_id
and a.articulo_id=af.articulo_id(+)
and a.articulo_id=aa.articulo_id(+)
and a.articulo_id=ad.articulo_id(+)
and ad.pais_id=p.pais_id(+)
and tc.numero_tarjeta='5681375824866375';

select * from consulta_11;