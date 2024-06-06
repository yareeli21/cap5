spool C:\Users\yayit\Documents\BD\cap5.2eje.txt

SET PAGESIZE 99
SET LINESIZE 250
rem 176 en ascii
SET COLSEP ' ░ '
SET NULL s/Datos

col parameter format A30
col value     format a35 
REM solo obtiene algunas fechas de tales columnas

alter session set nls_date_language = 'ENGLISH';
alter session set NLS_DATE_FORMAT = 'DD/MON/RR';

REM determina el numero de dias entre tales fechas y el ultimo dia de ese mes
select last_day(to_date('13-FEB-1964','DD-MON-YYYY')) lastday,
       last_day(to_date('13-FEB-1964','DD-MON-YYYY'))
       - TO_DATE('13-FEB-1964','DD-MON-YYYY') days
       from dual;

rem compila el numero de meses entre 29 de septiembre de 1999 y 17 de agosto de 2007
select months_between(to_date('17-AUG-2007','DD-MON-YYYY'),
                     TO_DATE('29-SEP-1999','DD-MON-YYYY')) months
            from dual;

rem añade tres dias a la fecha de ahora mismo
select to_char(SYSDATE, 'DD-MON-YYYY HH24:MI:SS') "Ahora_mismo",
       to_char(SYSDATE+3, 'DD-MON-YYYY HH24:MI:SS')"Respuesta"
       from dual;

spool off