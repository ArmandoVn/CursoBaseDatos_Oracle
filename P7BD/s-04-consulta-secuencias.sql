--@Autor(es): Armando Valderrama
--@Fecha creación: 22/10/2018
--@Descripción: Consulta de secuencias

prompt Práctica Complementaria 7. Bases de datos.

connect avn_p0701_admin

prompt 1.== Consultando valores de la secuencia

select seq_estudiante.nextval from dual;
select seq_estudiante.nextval from dual;

prompt 2. == Consultando el detalle de las secuencias

set linesize 200
col sequence_name format A20
select sequence_name,min_value,max_value,increment_by,
cycle_flag,order_flag,cache_size,last_number
from user_sequences;

prompt Listo
disconnect