--@Autor(es): Armando Valderrama
--@Fecha creación: 22/10/2018
--@Descripción: Consulta de indices

connect avn_p0701_admin
prompt 1.== Consultando indices por tabla.

col table_name format A20
col constraint_type format A10
set pagesize 100
select count(*) as num_indices, table_name
from user_indexes
group by table_name
order by table_name;

prompt 2.== Consultando el total de indices del modelo por su tipo

select
(select count(*) from user_indexes where index_type='NORMAL' and uniqueness ='NONUNIQUE') as non_unique,
(select count(*) from user_indexes where index_type='FUNCTION-BASED NORMAL')as basados_funciones,
(select count(*)
from user_indexes ix, user_constraints uc
where ix.index_name = uc.index_name
and uc.constraint_type='P'
and ix.uniqueness ='UNIQUE'
and ix.index_type='NORMAL'
) as PKs,
(select count(*)
from user_indexes ix, user_constraints uc
where ix.index_name = uc.index_name
and uc.constraint_type='U'
and ix.uniqueness ='UNIQUE'
and ix.index_type='NORMAL'
) as unique_no_pks
from dual;

prompt 3.== Consultando el total de indices del modelo

select count(*) as total_indices
from user_indexes;

prompt Listo!
disconnect