--@Autor(es): Armando Valderrama
--@Fecha creación: 22/10/2018
--@Descripción: Verificando sinonimos.

prompt conectando como usuario admin
connect avn_p0701_admin

prompt insertando a un estudiante
delete from estudiante;
insert into estudiante(estudiante_id,nombre,ap_paterno,ap_materno,tipo)
values(2,'Armando','Valderrama','Navarro','R');
commit;

prompt conectando como usuario invitado
connect avn_p0701_invitado
set pagesize 150
col nombre format A20
col ap_paterno format A20
col ap_materno format A20
select estudiante_id,nombre,ap_paterno,ap_materno,tipo
from s_alumno;

prompt Listo!
disconnect;