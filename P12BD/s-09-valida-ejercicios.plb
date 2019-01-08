
whenever sqlerror exit rollback
set serveroutput on
set verify off

accept p_usuario  prompt 'Proporcionar el nombre de usuario: '
accept p_usuario_pass  prompt 'Proporcionar el password del usuario &p_usuario: ' hide

Prompt conectando como &p_usuario
connect &p_usuario/&p_usuario_pass

create or replace function  sec_number_hsh wrapped 
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
137 124
GS1N8wrIe0P0rth3lLU8HbSle2kwgzLILZ7WfC9AmMXOyzHg3TXynAaOhpNE7WfTY5DhYqwM
2sNFOqXwLWICJXTuufj5/bmXywImbPHeU7QFhiMcuZ9u1BZ0jnXcqCm+05Tqugn2WxIK8JJL
MJzoPtlRfAeE8Nz2EWcEZpTElLFcimmPncSTHrdh5lE3jPTesDX7MyFrjXdAwiplcss05SRS
Js0laTOCZ29KNEQJXSKGQiaRHvCA2WX7DDP5fwmM95FM/70sYnsZkQ+/VJGLVnD3eUE2d6Ec


/
show errors

create or replace procedure pv_elimina_objetos wrapped 
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
471 2ea
9mM4xqSAuZPhaw11O2Zipok37GMwgztes0gTfI5V1Y2SKP5iJnfpKTyhXrAiV7i3MB1HX96c
SdlEGHVlX3T0RZ1PN6LXUZEFahxfZHIA/nBP9oBuvn1sdmsZl89M+RbVbIHr/jQ9slDOmxXz
Cueob3HT//qX4KVQgIYo6t2LVRVM0/lIz4KQhxDC5AekCA1dufkyfxwBYLFp/ZCLMdRdadnD
/V5vvthcaxOzDY243MhZ4hqDoJLIUINFZnifp7oN0YJsEysNE4ss4+U+bfJjY+IaxZvFYj2o
tUJeYzvXNfkJ9uvFWD4egJbV68nVTw9gVZOWlslTDms7Tsk1VpNmUaJZisgislJ6Fa9yxetQ
mWenhAqCPd2DSisAMSYfwHrSzMpHrZmpFKz647g1VdtJ5JGDbM81SoIMq5nUJtmRVuNa4DHM
0KHzk0u39F51yuSCnmZMT+AWpVcQOflqmvrhhJzxGZidE99xpphH1R4ZMppvBY00N0/4p7nk
E4LLjhHneLf6ueHcz6tp+yIL9+syn5rFxq8gfRufgCHnUIzbYJjxf82VVq+VWmnfUCycBOG2
DF1/tLume/XLCOqaARwVADSQGdwgmtZV27u0xik1lVhOIsVejVxSW9iqMmneS/7M6jvMkESX
FrTtDIJugdjDKBusksPYGzz3qef0boLRF9tzZldSUpapP1+1oZfuRtRTsbIADk6v21Aei8sp
I3CGy0JOmcHOehQ=

/
show errors

Prompt 1. ==> Eliminando objetos
exec pv_elimina_objetos

Prompt 2. ==> Cargando datos
set feedback off
@s-03-agencia.sql
@s-03-cliente.sql
@s-03-tarjeta-cliente.sql
@s-03-status-auto.sql
@s-03-auto.sql
@s-03-auto-carga.sql
@s-03-auto-particular.sql
@s-03-historico-status-auto.sql
@s-03-pago-auto.sql
set feedback on

Prompt =============================================
Prompt Iniciando proceso de validación de respuestas.
Prompt Incluir en el reporte a partir de este punto
Prompt =============================================

set serveroutput on
set linesize 200
col host format A20
col os_user format A20
col db_user format A20
col sec_hsh format A6
select to_char(sysdate,'dd/mm/yyyy HH24:mi:ss') session_time,
sec_number_hsh as sec_hsh, SYS_CONTEXT('USERENV','HOST') host,
SYS_CONTEXT('USERENV','OS_USER') os_user,
username db_user
from user_users;

Prompt 3. ==> Creando procedimiento en s-04-ejercicio-pago-autos.sql
@s-04-ejercicio-pago-autos.sql
Prompt 4. ===> Validando procedimiento en s-04-ejercicio-prueba-pago-autos.sql
@s-04-ejercicio-prueba-pago-autos.plb

Prompt 5. ===> Creando procedimiento en s-05-ejercicio-crea-auto.sql
@s-05-ejercicio-crea-auto.sql
Prompt 6. ===> Validando procedimiento en s-05-ejercicio-prueba-crea-auto.sql
@s-05-ejercicio-prueba-crea-auto.plb

Prompt 7. ===> Creando trigger en s-06-ejercicio-valida-status-auto.sql
@s-06-ejercicio-valida-status-auto.sql
Prompt 8. ===> Validando trigger en s-06-ejercicio-prueba-valida-status-auto.sql
@s-06-ejercicio-prueba-valida-status-auto.plb

Prompt 8. ===> Creando trigger s-07-ejercicio-valida-asignacion-agencia.sql
@s-07-ejercicio-valida-asignacion-agencia.sql
Prompt 9. ===> Validando trigger s-07-ejercicio-prueba-valida-asignacion-agencia.sql
@s-07-ejercicio-prueba-valida-asignacion-agencia.plb

Prompt 10. ===> Creando funcion en s-08-ejercicio-exporta-datos-csv.sql
@s-08-ejercicio-exporta-datos-csv.sql
Prompt 11. ===> Validando funcion en s-08-ejercicio-valida-exporta-datos-csv.sql
@s-08-ejercicio-prueba-exporta-datos-csv.plb


Prompt Listo!
