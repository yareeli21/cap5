spool C:\Users\yayit\Documents\BD\ej_5.5_.txt

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

REM 1 reescribe la consulta usando TO_CHAR en la clausula WHERE
SELECT zip, city
 FROM zipcode
 WHERE zip = TO_CHAR(10025);

REM 2 reescribe la consulta usando TO_NUMBER con la clausula WHERE
SELECT zip, city
 FROM zipcode
 WHERE zip = TO_CHAR(10025);

REM 3 REESCRIBE LA CONSULTA USANDO CAST CON LA CLAUSULA WHERE
 SELECT zip, city
 FROM zipcode
 WHERE CAST(zip AS NUMBER) = 10025;

  SELECT zip, city
 FROM zipcode
 WHERE zip = CAST(10025 AS VARCHAR2(5));

 REM SALE errors
  SELECT zip, city
 FROM; zipcode
 WHERE zip = CAST(10025 AS VARCHAR2(3));

REM SALE BIEN
 SELECT zip, TO_NUMBER(zip) "TO_NUMBER",
 CAST(zip AS NUMBER) "CAST", city
 FROM zipcode
 WHERE zip = '10025';

 REM 4 ESCRIBE LA SENTENCIA QUE DESPLIEGUE LO SIGUIENTE
  SELECT course_no, cost,
 TO_CHAR(cost, '$999,999.99') Formatted
 FROM course
 WHERE course_no = 330;

 REM 5 LISTA COURSE_NO Y COST para costos mayores a 1500, la tercera, cuarta y quinta columna crececn por 15%
 SELECT course_no, cost oldcost,
 cost*1.15 newcost,
 TO_CHAR(cost*1.15, '$999,999.99') formatted,
 TO_CHAR(ROUND(cost*1.15), '$999,999.99') rounded
 FROM course
 WHERE cost > 1500;

 rem otra forma
  SELECT course_no, TO_CHAR(ROUND(cost*1.15), '$999,999.99') rounded,
 TO_CHAR(cost*1.15, '$999,999') "No Cents"
 FROM course
 WHERE cost > 1500;

REM 6 basado en el ejercicio anterior, escribe una consulta que alcance este resultado
SELECT 'The price for course# '||course_no||' has been increased to
 ➥'||
 TO_CHAR(cost*1.15, 'fm$999,999.99')||'.'
 "Increase"
 FROM course
 WHERE cost > 1500;

spool off;