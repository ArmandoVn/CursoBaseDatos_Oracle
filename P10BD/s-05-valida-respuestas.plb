whenever sqlerror exit rollback
set serveroutput on
set verify off
accept p_usuario  prompt 'Proporcionar el nombre de usuario: '
accept p_usuario_pass  prompt 'Proporcionar el password del usuario &p_usuario: ' hide
accept p_archivo_sql default 's-04-respuestas.sql' Prompt 'Indicar el nombre del archivo de respuestas [s-04-respuestas.sql]: ' 
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
ea8 2e2
j3COgoNoOZYtTGrIXfozQGrWmXYwg80rLUgFfC/No6pExHxnObNhJW9Yg1QWehRiJTl9YG5j
A2qsZkQY0lBklgHpDQVap9sbWkB+4YFavBL+uUoPILxxG20FE0aOeirnaBXy5vqypwJqJeGT
PxPP8iKWZEkgSbbm8Sz6Q83+RlZk4vGVm4y1ewgKPdxtGoNtFD3l9SXheF+SqkYWkGR08WJ1
0stHidyGzneWo1FuiTZcDR7Ye+kVb60E1QlJgRxyyVWlAMVKHA7lBa6u0WBOQQnC7xlp7mZO
xovVIYnpF8zVE0nnZYn5XyKI+BVwxeT08hrhXa8t6wulYsUgGjlHe90rjiOWWZXWwitwKSuP
kPq1bNdRM488fbWxbir6xZUcoX2tVWzDzqV8okNTpDlE8j5l15mqJswjzkDPjzmujvAzDUg/
UXJHh69OuUd6pnJ7hU3FhuDWl7pd3cw7j3bZNbRQdJVcQEG+X4BCErAZpFq9nd9FONq7yvhU
PVQKDNTZEtwP8Qp/W6j4XrBe6qkf5oG/StyGB5IIVX8knzpkxiAA3LQyWZk8jTQeBlARGdA7
4vdcgqAEEhX4u3sdAZXUODnXvmusEA7vUat3guZYS+P5WF/2WjuCUHurHejppCydT22WDpZf
IwJfiiZYVIwmxuqyAGmP+ZCbz2oa+kb/mfQrtVW7Sis12fgjHBlJBBIqBQoxrEeLLGz6gQYG
1yC46t2z

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
f69 5f0
u6elkt7s+90wfzQ4juJ7jtGZ+jwwgz3qmtAF33QZHkNkjww4sMfwTg2/Lve+pu/ZrQ1hQwOK
jh5t86BqL8oeslVpDrVzTYXA5NW8M1L7rKLT6bcs+tD1h1rUjOWPpb9z3rWBchBzQrW7hiSB
xHMIpUK1KaXOREajcc38dQMSRucMvId+ziuRmanVkhhZCFEaTwnht1jl8dMeZqYOgpW2//Jn
JLcp6I8cklavpGQtFkQK0yk+A2sBhubocCimgTzaPmVpbKeNJ2SpJUll72PWt6Oia+y0Ritc
mIgLxZQAFGFF4J0KRJjVYqyTGgFfHyq33kGlCUD/B2oIMLS1RP74ZJr5zrnYH7AXLu/A64Rd
2Jr2SynvHSSyoWOiYTLGuZYpVozX4bf7nvdHfPE7PHYCrGh9++pk0nkQ5O5BXj8hLZ6kQY1E
miVcxuC3+PPq2C+ttmWZkLKuYazuehyWlu6zyQyHuCXqbVl8N/RMuX0IfY1mnMEhZuka5b5b
TWdc/RQW/GC3m64x9sP6b6PVMgm9nLjhoOctosgUWzwGskgDsaZ5FQt3nxXh4hCJ84KpwtSP
UKEtL19JtOGXz0dC8eNaPK1ccfeh55B2OsY+9KCNWg3Xk4DliSo6TFMQpnrB2hBubEZ4sa+B
fomHMozb5APEQQ0Z/QX88PCCqKzxSFw+lpFM4AhKXsqBPD51VbJH9Q6VpxeOQtDfCeKDDfCH
/bLQ0uzZDVXVkxPE0gUN/RXCxH6pwA0QRm+TxO4C2qA4vZ03tjZJcTVvj0rYFNLNQh3kk1yx
IwqhsK/Ab5IFIgKfDJFAzLL/ff6ZNixfDf51FM5SDP35DkV3/7tvtHUQYBQYlYSVAWYmdynO
a2NDHLci9ZwU96VTNpPM3NInYz41DQOjI/7mZeJk1I5QUNdQNcbCgd2dxAr2c5OWiy+dHkn4
cot4TkIYZmte+uV2Kh9KJf0bwr8bQsEJsXMyQhvWM/RGr2CrwEG/M4FD0kVuTIagWBFThmgI
6LqnUlLl94TntzvkCfVqeLClJVLFwvJzIKQDTsiFaNwTgXbF0Fpu+QhhyW5Dz6nqx/scvprh
gt//wJfIhP9VQ79jweYFK4d0bPoNCX7VHO4URpwEYx2RLK/zCnVudXVbqAQyFUl+EJmvzbYh
CIsVfgWGUSY6OxOr19jx4/52bheKCM7OQ0skIsdw1KRlNmjdmEJmpa8ysd11Ku0kYOiw/SBR
W7riHdruq/F/N7V/+f3S0FI1WIg7loHgFmMXxFrbNrMmTpZZltpyMvAQLkRZQwjbcFdBaADb
ONHBYI3wox0r2foIFK4SpKsgGBoMstYZiy40qXTisvKpenZ0HlrXnYh3BZFR5yhZA9fg4AWn
hJ0t0pJZBcMj045FLew/CzxjrTr8d0+9I5a6d5XoY1Es8RU3w/iFhSAZcBVo+R520CfK9Ui7
K6/ZscQKE+oKmNqShnrMka++20F4Yu1eNyPCmFH1DOm+hy9CZKo6KIWqzgE=

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
3yP1q2Nbk3d0uUBwesXUBpMbLkQwg80reSATWi+8cjqUTnlS5la3U77UPJBGOMc1RIbRDKOq
5hJA3yIx1FtXCQrkzsuZtG2QH9V7gWomFi0r2k56TsIDgto4vOnNyMxUgCjgf9DpiWw6I7dd
AoUqV/vkG8wERhvHz1OCWDL2wm3LV/sYpbvRBouFKu/rBmspSJSg2YcXTePefGtHoNcQRCab
fxp+qzH/19yDu4Gr4dkoxnHyxmt4UVmCIyM+Xg5HtY40qY0GHXxP3BZXFt+IgrAEafqp1dd8
e494PMVBo2PM4t/WUIL2YgTk++0n/jmC7oIBtcL/1nJ/JOV7bl99D/8E3I62FrSjs9F0c/wJ
tXPyeOKB2bz5ueZ4GR7Ujfn5o528PPhzxUr9oJ8frQsTP2BWBFXiOKke+LZCn/A4FEinF7rH
o/C3MVELuhVKyo0/2Vx55mL7oKJWqnZG0Xjvm85U63Qo0sQqs+Z8lFFwibfRgU6R90eedWMT
XGuQn3C8xQkE2Lvvvh0PwvW9NvLFPb6QttKCDeZKRI9Cd59ZcQ1Zj6jOO5JCFZzCFA+/An5S
qbkvKVhhnb0qxt7NMAw0nI8QfcC8g10g737cDrK53Z05MdQSotSXoqDTQP1qEFf8oJYUh/uP
xPXYBMSAhy86qE9GNG219x5fJmD/ms73/6VcSKddE+moBiEHFNklXKxtDYU2VjYcffKeN4qc
s/Pb4qnm5PBWUuFY4DYFxXrjMXH10FK7neeQRTUxk40iksG1e06OMWUvmVna/wO7ZgoEnGw6
fkHiRcZC/nxy1RYck2FYlP31zf1WUNlUjkMgrBU0e12DTlc+pf+oxZOFdcL7dgttLDz6jy73
CqI9NoDBsaEb4LNmfuJzctVn5QTlW7B2WsAyM11XI5UDpznLxyTFB6pqDrf9ZLHvkAA7xsaQ
QW4CsNc04qau5qy4jrjof3tSLm0nBcbI3GZRtqJ98MyGL35VZc3lqjw2n8pJTJvY0K8hSy3X
/F39P8HZQ0J2anNz6apLbiib5L2uvW63H2bRtzs25FlTWuHXfD/0O/9OgnYDIdmXmFBsUPHl
ATe78MDcbiGGlVG2uc6Y4tK9uo7OtE1UpQpMcyfqxqDV1fDBD+s3zzo1pbMNzxMc+07xXNH5
oZ9Xl3X+e9xIQGhSpCLNBm0xgkJGWk/p7+uS3YhhbU9Q4AgcssSWO1XvvGj5zVuue89l

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
