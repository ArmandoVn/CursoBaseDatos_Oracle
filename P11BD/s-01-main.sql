promp 1.- Creando el usuario arvn_p1101_subastas
create user arvn_p1101_subastas identified by 123
	quota unlimited on users;

promp 2.- Asignando permisos al usuario arvn_p1101_subastas
grant create session, create table, create procedure, create synonym to arvn_p1101_subastas;

Prompt 3.- Otorgando permisos a arvn_p1101_subastas para leer tablas de avn_p1001_subastas
connect sys as sysdba
grant select on avn_p1001_subastas.articulo to arvn_p1101_subastas;
grant select on avn_p1001_subastas.articulo_arqueologico to arvn_p1101_subastas;
grant select on avn_p1001_subastas.articulo_donado to arvn_p1101_subastas;
grant select on avn_p1001_subastas.articulo_famoso to arvn_p1101_subastas;
grant select on avn_p1001_subastas.cliente to arvn_p1101_subastas;
grant select on avn_p1001_subastas.entidad to arvn_p1101_subastas;
grant select on avn_p1001_subastas.factura_cliente to arvn_p1101_subastas;
grant select on avn_p1001_subastas.historico_status_articulo to arvn_p1101_subastas;
grant select on avn_p1001_subastas.pais to arvn_p1101_subastas;
grant select on avn_p1001_subastas.status_articulo to arvn_p1101_subastas;
grant select on avn_p1001_subastas.subasta to arvn_p1101_subastas;
grant select on avn_p1001_subastas.subasta_venta to arvn_p1101_subastas;
grant select on avn_p1001_subastas.tarjeta_cliente to arvn_p1101_subastas;

Prompt conectando como arvn_p1101_subastas
connect arvn_p1101_subastas
Prompt creando sinonimos
create or replace synonym articulo for avn_p1001_subastas.articulo;
create or replace synonym articulo_arqueologico for avn_p1001_subastas.articulo_arqueologico;
create or replace synonym articulo_donado for avn_p1001_subastas.articulo_donado;
create or replace synonym articulo_famoso for avn_p1001_subastas.articulo_famoso;
create or replace synonym cliente for avn_p1001_subastas.cliente;
create or replace synonym entidad for avn_p1001_subastas.entidad;
create or replace synonym factura_cliente for avn_p1001_subastas.factura_cliente;
create or replace synonym historico_status_articulo for avn_p1001_subastas.historico_status_articulo;
create or replace synonym pais for avn_p1001_subastas.pais;
create or replace synonym status_articulo for avn_p1001_subastas.status_articulo;
create or replace synonym subasta for avn_p1001_subastas.subasta;
create or replace synonym subasta_venta for avn_p1001_subastas.subasta_venta;
create or replace synonym tarjeta_cliente for avn_p1001_subastas.tarjeta_cliente;