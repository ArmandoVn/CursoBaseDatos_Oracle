--@Autor(es): Armando Valderrama
--@Fecha creación: 22/10/2018
--@Descripción: Verificando vistas.

prompt conectando como avn_p0701_admin
connect avn_p0701_admin

prompt insertando a un nuevo estudiante
delete from estudiante;
insert into estudiante(estudiante_id,nombre,ap_paterno,ap_materno,tipo)
values(2,'Armando','Valderrama','Navarro','R');
insert into regular(estudiante_id, semestre)
values(2,10);
commit;

prompt mostrando los datos de la vista.
select * from v_estudiante;

prompt Listo!
disconnect