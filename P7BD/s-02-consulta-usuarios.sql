--@Autor: Armando Valderrama
--@Fecha creación: 17/10/2018
--@Descripción: Creacion de un archivo

prompt Proporcionar el password del usuario sys:
connect sys as sysdba

prompt 1. == Mostrando datos de los usuarios.
set linesize 200
col username format A20
col last_login format A20
col tablespace_name format A10
col account_status format A15

select u.username,u.account_status,
to_char(u.created,'dd/mm/yyyy hh24:mi:ss') as created,
to_char(u.expiry_date,'dd/mm/yyyy hh24:mi:ss') as expiry_date,
to_char(u.last_login,'dd/mm/yyyy hh24:mi:ss') as last_login,
q.tablespace_name,q.max_bytes/(1024*1024*1024) as "QUOTA (GB)"
	from dba_users u , dba_ts_quotas q
	where q.username(+) = u.username
	and u.username in('AVN_P0701_ADMIN','AVN_P0701_INVITADO');

prompt 2. == Mostrando los roles asignados a los usuarios.
col grantee format A20
col granted_role format A20
select grantee,granted_role
	from dba_role_privs
	where grantee in ('AVN_P0701_ADMIN','AVN_P0701_INVITADO');

prompt 3.== mostrando los privilegios asignados a los roles
col privilege format A20
select privilege
	from role_sys_privs
	where role='P0701_ADMIN_ROL'
	order by 1;

prompt Listo
disconnect