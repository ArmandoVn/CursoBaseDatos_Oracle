--@Autor(es): Armando Valderrama
--@Fecha creación: 22/10/2018
--@Descripción: Creacion de sinonimos.

connect / as sysdba

grant create synonym to avn_p0701_invitado;

prompt Conectando con el usuario avn_p0701_admin
connect avn_p0701_admin

grant read on estudiante to avn_p0701_invitado;

prompt Conectando con el usuario avn_p0701_invitado
connect avn_p0701_invitado

create synonym s_alumno for avn_p0701_admin.estudiante;

select * from s_alumno;

4e25c0b6e6589545f43b1f9499fb86e41d48ab22