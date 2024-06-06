spool C:\Users\yayit\Documents\BD\cap_5.3_.txt

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

rem the local timestamp fucntion que devuelve la hora y tiempo de ahora mismo incluyendo fracciones de segundo
SELECT LOCALTIMESTAMP
 FROM dual;

 rem the systimestamp fucntion incluye fracciones de segundo con 9 digitos de precision 
 rem dice a cuantas horas de diferencia estamos de greenwich
  SELECT SYSTIMESTAMP
 FROM dual;


REM el current y el localtime
 rem the current timestamp function da la fecha y hora con segundos y las hpras de diferencia
SELECT CURRENT_TIMESTAMP, LOCALTIMESTAMP
 FROM dual

rem regresa la fecha y hora de la sesion del tiempo de zona 
 SELECT TO_CHAR(CURRENT_DATE, 'DD-MON-YYYY HH:MI:SS PM') 
FROM dual;

rem the sessiontimezone función determina las horas en desplazamiento que está nuestro país
SELECT sessiontimezone
FROM DUAL;
 
REM se pueden cambiar las zonas horarias con ALTER SESSION 
 ALTER SESSION SET TIME_ZONE = 'America/New_York'
 ALTER SESSION SET TIME_ZONE = dbtimezone
 ALTER SESSION SET TIME_ZONE = local

 rem the dbtimezone funcion, apaprece si ya se ha configurado antes
 SELECT DBTIMEZONE
 FROM dual;

 rem extracción, the sys_extract_utc función, extrae el utc de una fecha pasada
 SELECT SYS_EXTRACT_UTC(TIMESTAMP '2009-02-11 7:00:00 -8:00')
 "West coast to UTC",
 SYS_EXTRACT_UTC(TIMESTAMP '2009-02-11 10:00:00 -5:00')
 "East coast to UTC"
 FROM dual;

 rem para extraer horas, minutos, segundos, año, mes o día de algunas fechas dadas
  SELECT EXTRACT(HOUR FROM TIMESTAMP '2009-02-11 15:48:01.123') hour,
 EXTRACT(MINUTE FROM TIMESTAMP '2009-02-11 15:48:01.123') minute,
 EXTRACT(SECOND FROM TIMESTAMP '2009-02-11 15:48:01.123') second,
 EXTRACT(YEAR FROM TIMESTAMP '2009-02-11 15:48:01.123') year,
 EXTRACT(MONTH FROM TIMESTAMP '2009-02-11 15:48:01.123') month,
 EXTRACT(DAY FROM TIMESTAMP '2009-02-11 15:48:01.123') day
 FROM dual;

 rem extraer los mismos datos pero ahora de. timestamp con zona horaria, que está en una columna
  rem solo si ya se configuró el utc
  SELECT col_timestamp_w_tz,
 EXTRACT(YEAR FROM col_timestamp_w_tz) year,
 EXTRACT(MONTH FROM col_timestamp_w_tz) month,
 EXTRACT(DAY FROM col_timestamp_w_tz) day,
 EXTRACT(HOUR FROM col_timestamp_w_tz) hour,
 EXTRACT(MINUTE FROM col_timestamp_w_tz) min,
 EXTRACT(SECOND FROM col_timestamp_w_tz) sec
 FROM date_example;

rem otra vez extraer pero ahora directamente de la zona horaria
rem hora, minutos, region
SELECT col_timestamp_w_tz,
 EXTRACT(TIMEZONE_HOUR FROM col_timestamp_w_tz) tz_hour,
 EXTRACT(TIMEZONE_MINUTE FROM col_timestamp_w_tz) tz_min,
 EXTRACT(TIMEZONE_REGION FROM col_timestamp_w_tz) tz_region,
 EXTRACT(TIMEZONE_ABBR FROM col_timestamp_w_tz) tz_abbr
 FROM date_example;

 rem para describir los parametros de alguna tabla de la base de datos
 describe student;

 rem funciones de conversión
 rem convierte un texto en una timestamp with time zone para que se pueda comparar con la columna col_timestamp_w_tz
rem esta tabla no esta en la base de datos
 SELECT col_timestamp_w_tz
 FROM date_example
 WHERE col_timestamp_w_tz = TO_TIMESTAMP_TZ
 ('24-FEB-09 04.25.32.000000 PM -05:00',
 'DD-MON-RR HH.MI.SS.FF AM TZH:TZM');

 rem despliega la fecha, la hora, pm o am, zona horaria
  SELECT col_timestamp_w_tz AT TIME ZONE 'America/Los_Angeles'
 FROM date_example;

 rem con las horas de diferencia
 SELECT col_timestamp_w_tz AT TIME ZONE DBTIMEZONE
 FROM date_example;

 rem regresa los nombre de la region de la zona
SELECT *
 FROM v$timezone_names;


rem tz_offset function encuentra la diferencia de horas entre UTC y cada zona individual
SELECT TZ_OFFSET('Europe/London') "London",
 TZ_OFFSET('America/New_York') "NY",
 TZ_OFFSET('America/Chicago') "Chicago",
 TZ_OFFSET('America/Denver') "Denver",
 TZ_OFFSET('America/Los_Angeles') "LA",
 TZ_OFFSET('America/Mexico_City')"Mexico"
 FROM dual;

 rem 
 SELECT SESSIONTIMEZONE
 FROM dual;

spool off