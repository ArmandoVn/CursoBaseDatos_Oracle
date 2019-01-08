-- Query 1
select *
from HORARIO
where DIA_SEMANA = 1
union
select *
from HORARIO
where DIA_SEMANA = 3;

-- Query 2
select * 
from PLAN_ESTUDIOS
where FECHA_FIN is null;

-- Query 3
select distinct apellido_paterno
from PROFESOR
ORDER BY APELLIDO_PATERNO;

-- Query 4
select extract(year from sysdate) - extract(year from FECHA_NACIMIENTO) as "Edad profesor"
from PROFESOR
where nombre = 'FELIPE'
and APELLIDO_PATERNO = 'LIMA'
and APELLIDO_MATERNO = 'RODRIGUEZ';

-- Query 5
select sysdate as "Dias faltantes del año"
from dual;