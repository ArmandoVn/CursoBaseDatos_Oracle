--@Autor(es): Armando Valderrama
--@Fecha creación: 22/10/2018
--@Descripción: Consulta de restricciones

prompt Práctica Complementaria 7. Bases de datos.

connect avn_p0701_admin

prompt 1.== Consultando resumen de restricciones

col table_name format A20
col constraint_type format A10
set pagesize 100
select row_number() over (order by table_name) num, table_name, constraint_type,
count(*) as num_constraints
from user_constraints
group by table_name,constraint_type
order by 1;

prompt 2.== Consultando total de restricciones

select count(*) as total_restricciones
from user_constraints;

prompt 3.== Consultando el detalle de una tabla

col table_name format A20
col constraint_type format A10
col constraint_name format A30
select table_name,constraint_type,constraint_name
from user_constraints
where table_name ='ESTUDIANTE'
order by 1,2;

prompt Listo!
disconnect