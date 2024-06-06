spool C:\Users\yayit\Documents\BD\ej_5.4_.txt

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

rem ejercicio 1, encuentra 4 columnas, el intervalo expresa la diferencia entre start_date_time y created_date con NUMTODSINTERVAL desde dias

SELECT section_id "ID",
 TO_CHAR(created_date, 'MM/DD/YY HH24:MI')
 "CREATED_DATE",
 TO_CHAR(start_date_time, 'MM/DD/YY HH24:MI')
 "START_DATE_TIME",
 NUMTODSINTERVAL(start_date_time-created_date, 'DAY')
 "Interval"
 FROM section
 WHERE NUMTODSINTERVAL(start_date_time-created_date, 'DAY')
 BETWEEN INTERVAL '100' DAY(3) AND INTERVAL '120' DAY(3)
 ORDER BY 3;

 rem 2 ilustra como un numero literal es traducido a un intervalo usando NUMTODSINTERVAL
 rem primer columna a segundos y la segunda a minutos
  SELECT NUMTODSINTERVAL(360, 'SECOND'),
 NUMTODSINTERVAL(360, 'MINUTE')
 FROM dual;

rem ahora con horas y dias
  SELECT NUMTODSINTERVAL(360, 'HOUR'),
 NUMTODSINTERVAL(360, 'DAY')
 FROM dual;

rem si es valido o no day to second
select INTERVAL '5 10:30:10.00' DAY TO SECOND
 from dual;

spool off