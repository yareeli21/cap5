spool C:\Users\yayit\Documents\BD\cap_5.2_.txt

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

REM arroja la fecha y hora de ese preciso momento
SELECT SYSDATE, TO_CHAR(SYSDATE, 'DD-MON-YYYY HH24:MI')
 FROM dual;

REM DETERMINAR EL NUMERO DE DIAS DESDE 2015
 SELECT TO_DATE('01-JAN-2015','DD-MON-YYYY')-TRUNC(SYSDATE) int, 
TO_DATE('01-JAN-2015','DD-MON-YYYY')-SYSDATE dec
 FROM dual;

REM AGREGAR HORAS PARA SABER QUE HORA ES DESPUES DE 3 HORAS, MAÑANA A LA MISMA HORA Y MAÑANA CON 12 HORAS Mas
SELECT TO_CHAR(SYSDATE, 'MM/DD HH24:MI:SS') now,
 TO_CHAR(SYSDATE+3/24, 'MM/DD HH24:MI:SS')
 AS now_plus_3hrs,
 TO_CHAR(SYSDATE+1, 'MM/DD HH24:MI:SS') tomorrow,
 TO_CHAR(SYSDATE+1.5, 'MM/DD HH24:MI:SS') AS
 "36Hrs from now"
 FROM dual;

REM DADA UNA FECHA A PARTIR DE ESTA SE BUCARA EL PRIMER DOMINGO
  SELECT TO_CHAR(TO_DATE('12/31/1999','MM/DD/YYYY'),
 'MM/DD/YYYY DY') "New Year's Eve",
 TO_CHAR(NEXT_DAY(TO_DATE('12/31/1999',
 'MM/DD/YYYY'),
 'SUNDAY'),'MM/DD/YYYY DY')
 "First Sunday"
 FROM dual

 REM REDONDEA HASTA LAS 12 Y HASTA EL SIGUIENTE MES PORQUE SE USA MM
 SELECT TO_CHAR(SYSDATE,'DD-MON-YYYY HH24:MI') now,
 TO_CHAR(ROUND(SYSDATE),'DD-MON-YYYY HH24:MI') day,
 TO_CHAR(ROUND(SYSDATE,'MM'),'DD-MON-YYYY HH24:MI')
 mon
 FROM dual;

 REM EXTRACT, esta extrae el año, el mes o el dia de una columna de alguna fecha
 rem extrae el mes, el año y el dia en cada extract
 SELECT TO_CHAR(start_date_time, 'DD-MON-YYYY') "Start Date",
 EXTRACT(MONTH FROM start_date_time) "Month",
 EXTRACT(YEAR FROM start_date_time) "Year",
 EXTRACT(DAY FROM start_date_time) "Day"
 FROM section
 WHERE EXTRACT(MONTH FROM start_date_time) = 4
 ORDER BY start_date_time;

 rem hace uso del ANSI DATE para extrar año, mes y día de una fecha dada

SELECT EXTRACT(YEAR FROM DATE '2010-03-11') year, 
EXTRACT(MONTH FROM DATE '2010-03-11') month,
EXTRACT(DAY FROM DATE '2010-03-11') day
 FROM dual;


spool off