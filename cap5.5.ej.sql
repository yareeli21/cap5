spool C:\Users\yayit\Documents\BD\cap_5.5_.txt

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

rem convertir de un tipo de fecha a otro

rem data type conversion compara un texto contra el numero de course_no, convierte el caracter en un tipo de dato numero
 SELECT course_no, description
 FROM course
 WHERE course_no = '350';

rem esto convierte el parametro dado en caracter a un tipo de dato
 SELECT *
 FROM conversion_example
 WHERE course_no = TO_CHAR(123);

rem the cast function convierten desde un tipo de dato a otro 
rem syntax CAST(expression AS data type)

SELECT CAST('29-MAR-09' AS DATE) DT,
 CAST('29-MAR-09' AS TIMESTAMP WITH LOCAL TIME ZONE) TZ
 FROM dual;

 REM CAST tambien se puede usar con la clausula WHERE
 SELECT section_id,
 TO_CHAR(start_date_time, 'DD-MON-YYYY HH24:MI:SS')
 FROM section
 WHERE start_date_time >= CAST('01-JUL-2007' AS DATE)
 AND start_date_time <  CAST('01-AUG-2007' AS DATE);

 REM esa fecha la cambia a la zona horaria de Los Angeles
SELECT FROM_TZ(CAST(TO_DATE('04-JUL-2007 10:00:00 AM', 'DD-MON-YYYY HH:MI:SS AM') AS TIMESTAMP),
  'America/New_York') AT TIME ZONE 'America/Los_Angeles'
  "FROM_TZ Example"
FROM dual;

REM cambio con uso de intervalos
SELECT CAST('1-6' AS INTERVAL YEAR TO MONTH) "CAST",
 TO_YMINTERVAL('1-6') "TO_YMINTERVAL",
 NUMTOYMINTERVAL(1.5, 'YEAR') "NUMTOYMINTERVAL"
 FROM dual;

REM CONVERSION BINARIA CON DOS OPCIONES, CON CAST Y CON BINARY_FLOAT
  SELECT CAST(cost AS BINARY_FLOAT) AS cast,
 TO_BINARY_FLOAT(cost) AS to_binary_float
 FROM course
 WHERE course_no < 80;

 REM formato de dato
 SELECT course_no, cost,
 TO_CHAR(cost, '999,999') formatted
 FROM course
 WHERE course_no < 25;

  COL "SQL*PLUS" FORMAT 999,999
 SELECT course_no, cost "SQL*PLUS",
 TO_CHAR(cost, '999,999') "CHAR"
 FROM course
 WHERE course_no < 25;



spool off