spool C:\Users\yayit\Documents\BD\CAP_5.4_.txt

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

rem usando intervalos cuando un intervalo de un año y seis meses es añadido a una fecha
rem se agrega como una suma, poniendo los años que deseas agregar, seguido de los meses
rem 01 -> años y 06 -> meses
SELECT student_id, registration_date,
 registration_date+TO_YMINTERVAL('01-06') "Grad. Date"
 FROM student
 WHERE student_id = 123;

 rem extraer e intervalos, se extraen los minutos de ese intervalo (hora)
 SELECT EXTRACT(MINUTE FROM INTERVAL '12:51' HOUR TO MINUTE)
 FROM dual;

 SELECT EXTRACT(HOUR FROM INTERVAL '12:51' HOUR TO MINUTE)
 FROM dual;

 SELECT EXTRACT(SECOND FROM INTERVAL '12:51:32' HOUR TO SECOND)
 FROM dual;

REM LA diferencia de tiempo con las columnas created_date y start_date_time
rem primero da la diferencia en Decimal
rem despues da la diferencia en dias, horas, minutos y segundos
SELECT DISTINCT TO_CHAR(created_date, 'DD-MON-YY HH24:MI') 
"CREATED_DATE",
 TO_CHAR(start_date_time, 'DD-MON-YY HH24:MI')
 "START_DATE_TIME",
 start_date_time-created_date "Decimal",
 NUMTODSINTERVAL(start_date_time-created_date,'DAY')
 "Interval"
 FROM section
 ORDER BY 3;


rem diferencia de systimestamp con el col_timestamp y de ahí se tiene el intervalo day to second
 SELECT col_timestamp,
 (SYSTIMESTAMP- col_timestamp) DAY(4) TO SECOND
 "Interval Day to Second"
 FROM date_example;

 select to_date('24-ABR-2003 21:41:33','DD-MON-YYYY HH24:MI:SS')-TO_DATE('12-MAR-2003 12:33:56','DD-MON-YYYY HH24:MI:SS') DAY(4) TO SECOND
  FROM DUAL;

rem overlaps-traslapos hayr conflictos de citas con unos pendientes
rem aqui solo se muestran las fechas de start y las de end
  SELECT meeting_id,
 TO_CHAR(meeting_start, 'DD-MON-YYYY HH:MI PM') "Start",
 TO_CHAR(meeting_end, 'DD-MON-YYYY HH:MI PM') "End"
 FROM meeting;

 
spool off