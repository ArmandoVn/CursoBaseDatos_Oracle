--@Autor: Armando Valderrama
--@Fecha creación: 13/11/2018
--@Descripción: Carga de datos al modelo autos.

--si ocurre un error, se hace rollback de los datos y
--se sale de SQL *Plus
whenever sqlerror exit rollback
Prompt 1.- Creando usuario avn_p1201_autos
@s-01-creacion-usuario.sql

Prompt 2.- Conectando como usuario avn_p1201_autos
connect avn_p1201_autos

Prompt 3.- Creando objetos
@s-02-autos-ddl.sql

Prompt 4.- Realizando la carga de datos
@s-03-agencia.sql
@s-03-cliente.sql
@s-03-tarjeta-cliente.sql
@s-03-status-auto.sql
@s-03-auto.sql
@s-03-auto-carga.sql
@s-03-auto-particular.sql
@s-03-historico-status-auto.sql
@s-03-pago-auto.sql

Prompt 5.- Confirmando cambios
commit;
--Si se encuentra un error, no se sale de SQL *Plus
--no se hace commit ni rollback, es decir, se
--regresa al estado original.
whenever sqlerror continue none

Prompt Listo!