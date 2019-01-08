whenever sqlerror exit rollback
set serveroutput on
set verify off
accept p_usuario  prompt 'Proporcionar el nombre de usuario: '
accept p_usuario_pass  prompt 'Proporcionar el password del usuario &p_usuario: ' hide
accept p_archivo_sql default 's-04-fx-respuestas.sql' Prompt 'Indicar el nombre del archivo de respuestas [s-04-fx-respuestas.sql]: ' 
Prompt conectando como &p_usuario
connect &p_usuario/&p_usuario_pass
Prompt creando tablas de respuesta
create or replace procedure p_elimina_tablas wrapped 
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
fa 103
5y6Y7TKteDKIwVsgOsqMPSyv3xMwgwFK2ssVfC+iJhAYecja0Y+XUt9w7q5d0A4DrFrzPmc2
ia16n2fyNQ2MkELaBXvVS0rLOPJzV2hAEpwZVQGKh8oAL6bzkMTiX44wY3yI4rMXghKmHJQY
pgoDfv0XKqLQJF39AKR8xNihaZvjZwIqIuXd66dlCe6H7PFIwGMd3vkjjQ3NwMtyFuBnyKML
YkIr0pLPWWlBuzf/AwU7dtXn7COviPoYeSJeFObc

/
show errors
exec p_elimina_tablas;
Prompt cargando archivo de respuestas
@&p_archivo_sql
create or replace procedure p_crea_tablas_respuesta wrapped 
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
5b9 23f
TwQwyazD0Ti44lh6k0DKc0obqa0wgw2JLq7hfy9A7bn5GBlx08uY46zuGsJ/duTn8gY7iIP7
E4phEz8vqrxifRVgnOfbBZ9BuUcFKQVCQSJVQ4YxIUmUAas3o3UfcE1gXq0hb4VdbLzXu0nQ
Uo6AOro/eBLX+l3uqCyuSOSxQs76Zr2dqDjyq+pUDnsMBhbA1DdvGJ7cGtXBTbdWzeiQ4oAJ
jcfwkUTs7da5bJwTfMOgmymgw7qJYyrVBbThc+zycFGOFjsnFEqM/zp9fDrtyppnrz3EmzXE
xOKgy5IzuGyt5tcdBhF1mT0m8/HA0uAOZ04NhueUHzVEH/lvFLa4z0H5ZJwtnSDt9aqGWgw7
2TyjyhCRsHenygdV8HQalCKivqaE+biK32LqoRCicDw1CGog/VO4PN7OjBeD7Hpa3KWW1XAN
TqvRJQuOdLXprzgrmMurSzbMITuO8jB4dy35+eQ7C2wAQ18rkxYWHc1VqUU/WPvXlfEVnlZ9
QNSMQIBhHD9RUT8pgKaBNiRG8ZikMUfTcafuPpG6ZX7xP9bPKlaqdtD/IvtBNzSI

/
show errors
exec p_crea_tablas_respuesta
Prompt cargando datos de validacion
create or  replace procedure p_carga_datos_validacion wrapped 
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
b03 5c8
6q+GFjdS+WWC9sZSJ/smfBjWAX0wg5ArmiAGVy+8sV1kBIGVof2DRuG/6sPeLuDdCQa43CVV
EhjC3Yf3zi3hRYPyc4YgijZaxGcKQ2vCAIZYuxOIqila1CKZZfqPEiLRPLWUOhq04t860OAi
E46GMSe9en/wBzRy5KgCqejYCmE/bvSOom+BdaB6xg2YydCyU3yy649mOGVE0SUE3dDp8QI+
12MXq72ZWE/mp5HDm1fBN+8GTUlYhIA654QM8woBw2Iu7/DHWdVikAAfd8HzFwSxqHLO9lZv
8Po2QGrJHkh/mAV+47IhNw+QLoyWhhGcDZmLZMooBBMSX72y1rT79HodCmgwe0WHwfFELed1
Dpf6IaaSOHbZJQgl7TODec12S9tyjkB67mYoBOZRqAyH72XwcoRApFCcLWjK4FyDfIpBNSOY
gKM15IDoPBb5X81puGW7exo+rgPKgKpHGKS2ipnQ6e/2QWWtLv3id81lShjzba/6ykl+BJWf
yLyeGvLdt4meT+uxGvNrx1R4vyrdbgcpqfhvYGtmZweDCBD4cTijxtRZ1q0AWbcGiLjI0Rvr
mVTYpwWADW4PqatlUxZwh37Rjwgt38mUvr9gzXRHM8x15y0jXsFJT7QjNE3dEioFOC87XZqi
ACsRNK8RmmiflymR+7Inv/9xzBkilD7G/ULd3sBfEZWADNYy3pxf1Sa0+IJYsKAHBzjCHq25
hEAxZjn+ZzNs/MjC/n3s6eAgli3MJNcRWsPgGZpsNQOZKchrnojxm0ZD9SGevtDrHG1uofQU
/S6xMgCReQQUVnC6z5AffIdieK5Oefe/cNoT0bBLcWK84rD9dVmz36qjVpl1Yg0b4t+xZ3fN
nB/h7icDv6RkPB4pBA223xbsMomlcXn4k+yh8qaVJXCFX/7zJI/QEDg/QI3BzNtLRVNmks+C
kAtatOKJxa47IOsIC/cfhs1ef7+5vCSLTVoDQ59EJzvwDmQQumRvKtyRsfQJaoKJUfvI+l3J
LVOztocTip5pqTuijkUXB1jN9Q3Mta0iPaR5Eg441NNL0slk7lw/waLJBULNvE4H1aYKQut+
MepQ9SDYyR7ChlEVbp6MjLSU0F5ku3JzoBy1m6b60zHK/Hk0NIovPRzFKYBXYHVZ2siQF9+r
7usuwofx8gpvMYQuVgDLYUzlyPQ1e9iQtLJkz1U/Wiy0xpRDljAHiealEjSPdn/4ddAw5x4U
9J5FjCNHM5gatRnHyfNDa14MDxzIAQi9XhLLGSTJyk/nqwCND2PBr8bHErmYRCQhxGUF6lv0
6lQZnywezCYSq7AhRxDFzGBpSbZVZ/pgqIFY6SwR8mOEg7lyYQx2rMIzAybFJkgzzsqWpKBF
qoly7iQhIiNOXLFPekS+xQjznEz30HWFgbxH5e6U/0ayZoEQCG7+1p22kjy8e6tFgehPTX8/
dul6zewWFVUk+VtIXRm9

/
show errors
exec p_carga_datos_validacion
create or replace procedure p_valida_respuestas wrapped 
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
dde 4d4
uwwrR3mGklvz6t0NAUdZMWJ9Ptkwg80reSATWi+8cjqUTnlS5laGXSU8PJCgQC7WntRMp6D5
RjN0ec/C8JlXCa46CKRvS6//bZRcc7jF8tg9/3pyNIqKR9xTF2XVj3Q87u1xR++I6FJhGduT
0YKy3KadoQTO+0NhW8SJE3iJ/tpw+BYVnQVpUPeEhCcYqXu6RM1RsYjf20dPfNxiRWQOwyI5
X66E2bwZoZYS7ezd0qwtaSVSj0oEsV9Bh4WrabkQm0+vxQj7VFlJdH6OXv8pjh3FBLhjiGBb
NIOj+l4md5dD6CxToCWsrw9Q1b9kf7YcIIoPw0KlNouwJstJ7zMZHGqhajaeYSshjGQPcSnq
INK/QD8xsfiq/NS6c5dQmu09soS7/tlX4rODeRHQYjOILXD1mED7SsEudzE9QPdTh0F5196U
3AFt8GJE2qzDOjsrjfTJvQ5s4CMLJLg2svpqhOmCelCaPKKZrxPIOehSJQI/b5YGk8sDkQOX
DevLR+pC4daBTE2fjwzsVjdnNT31SME2+EdHZ3D7U9EDfhgKp716NmRcJNDOCYld2eLIYstQ
pFF66zN4awZXO3Yg9P7TNChM/+oTijJGgb2gr6TOych5NICR2Fqi1ThTf2gHjNz45gaUplJq
1LKGPIWBhJYvt2f1CCT1in/rhTrVJCWIvIXXhn4DhQGJkS+w3sIYUi2nJkYC2x1MPqjIc2V7
rLT3yNmqyGwYqHkEr2Ge/sDfnFULaPiIa4LGlnv2jND5c53/eoRhjl3h60pOiiRYp1/ZrM/f
ritVhjSYTxdsjtBWVUebskUzpG99ARROBnhgOCscwENCjsEwwS+UlsNZKaZKLWzLHpGl5YUT
okM2gMGxUsXvMWbYZHNk1Wc8fMOy3CrId/yKs1LSrBdisnaLh1R0tew1SbFIZIB7EqMoKNoA
KpmuHkJM4RwCzq+FH3GGfgZpt94Fxsjc5lG2on0NzIYvfhm4zS672MuKZ9xFXaEscyYgOBM9
+r/k/5zZThasmJj5Q3CtLJEx70HTV0lyonEUmPOltu5mvXdqzq1hxXKuuEfxIWK55pxnDINW
mc8gjscGGhyWGxPnBQUyY660Ud1qYJVzms38v5h76ExYoSG17HR32Sjk0Eopk4rndf1kZTog
NGp//1WcUieCL2ELbd4fD0fRlKhmABxKTTo1uH4fnQ6VBgCrSA+jmIDPLXPGKObsz6s=

/
show errors
Prompt =============================================
Prompt Iniciando proceso de validación de respuestas.
Prompt Incluir en el reporte a partir de este punto
Prompt =============================================
set serveroutput on
set linesize 200
col host format A20
col os_user format A20
col db_user format A20
select to_char(sysdate,'dd/mm/yyyy HH24:mi:ss') session_time, 
SYS_CONTEXT('USERENV','HOST') host,SYS_CONTEXT('USERENV','OS_USER') os_user,
username db_user
from user_users;
Prompt Validando respuestas
exec p_valida_respuestas('&p_usuario')
Prompt Listo!
