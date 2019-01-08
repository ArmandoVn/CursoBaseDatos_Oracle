set serveroutput on;

declare
    v_id plan_estudios.plan_estudios_id%type;
    v_clave plan_estudios.clave%type;
    v_fecha plan_estudios.fecha_inicio%type;
begin
    select plan_estudios_id,clave,fecha_inicio
    into v_id,v_clave,v_fecha
    from plan_estudios
    where plan_estudios_id=1;
    dbms_output.put_line('id: '||v_id);
    dbms_output.put_line('clave: '||v_clave);
    dbms_output.put_line('fecha: '||v_fecha);
end;
/