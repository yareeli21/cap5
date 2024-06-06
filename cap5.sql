spool C:\Users\yayit\Documents\BD\cap_5.1_.txt
REM CAP 4 CHARACTER, NUMBER, AND MISCELLANEOUS FUNCTIONS

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

SELECT last_name, registration_date
 FROM student
 WHERE student_id IN (123, 161, 190);

REM cambia el formato de fecha en como se vera, y ese nuevo formato estara en la columna Formatted
REM TO_CHAR cambia el tipo de fecha, su formato
  SELECT last_name, registration_date,
 TO_CHAR(registration_date, 'MM/DD/YYYY')
 AS "Formatted"
 FROM student
 WHERE student_id IN (123, 161, 190);

REM se usan los elementos de DY, Dy, Month, DD, YYYY, HH, MI PM para que muestre distintos formatos
 SELECT last_name,
 TO_CHAR(registration_date, 'Dy') AS "1.Day",
 TO_CHAR(registration_date, 'DY') AS "2.Day",
 TO_CHAR(registration_date, 'Month, DD, YYYY')
 AS "Look at the Month",
 TO_CHAR(registration_date, 'HH:MI PM') AS "Time"
 FROM student
 WHERE student_id IN (123, 161, 190);

REM se agrega th para desplegar las fechas (numeros) 
REM Ddspth es para desplegar el dia en trigesimos y se pone el "of" en doble comilla
 SELECT last_name,
 TO_CHAR(registration_date, 'fmMonth ddth, YYYY')
 AS "Eliminating Spaces",
 TO_CHAR(registration_date, 'Ddspth "of" fmMonth')
 AS "Spelled out"
 FROM student
 WHERE student_id IN (123, 161, 190);

REM se usa to_date para buscar esa fecha en especifico y cómo se mostrara
 SELECT last_name, registration_date
 FROM student
 WHERE registration_date = TO_DATE('22-JAN-2007', 'DD-MON-YYYY');

 REM lanza un error porque el texto no es congruente con el format mask que nosotros damos
 REM ya que pone 01 y no JAN como espera el formato 
  SELECT last_name, registration_date
 FROM student
 WHERE registration_date = TO_DATE('22/01/2007', 'DD-MON-YYYY');

REM fecha dada con el formato predeterminado
 SELECT last_name, registration_date
 FROM student
 WHERE registration_date = '22-JAN-07';
 REM tambien funciona dando el año completo
  SELECT last_name, registration_date
 FROM student
 WHERE registration_date = '22-JAN-2007'

 REM uso de RR como los ultimos dos digitos del año
  SELECT grade_type_code, description, created_date
 FROM grade_type
 WHERE created_date = '31-DEC-98';

REM primero convierte a fecha, después a texto nuevamente pero con el año en 4 digitos
  SELECT TO_CHAR(TO_DATE('17-OCT-67','DD-MON-RR'),'YYYY') "1900",
 TO_CHAR(TO_DATE('17-OCT-17','DD-MON-RR'),'YYYY') "2000"
 FROM dual;
REM aqui algo parecido pero ahora con el mes
   SELECT TO_CHAR(TO_DATE('17-OCT-67','DD-MON-RR'),'Month') "1900",
 TO_CHAR(TO_DATE('17-OCT-17','DD-MON-RR'),'Month') "2000"
 FROM dual;

REM para consultar la hora
 SELECT last_name,
 TO_CHAR(registration_date, 'DD-MON-YYYY HH24:MI:SS')
 FROM student
 WHERE registration_date = TO_DATE('22-JAN-2007', 'DD-MON-YYYY');

 SELECT student_id, TO_CHAR(enroll_date, 'DD-MON-YYYY HH24:MI:SS')
 FROM enrollment
 WHERE TRUNC(enroll_date) = TO_DATE('07-FEB-2007', 'DD-MON-YYYY');

REM para evitar usar TO_CHAR o TO_DATE con un formato específico

  SELECT student_id, TO_CHAR(enroll_date, 'DD-MON-YYYY HH24:MI:SS')
 FROM enrollment
 WHERE enroll_date >= DATE '2007-02-07'
 AND enroll_date <  DATE '2007-02-08';

 SELECT student_id, TO_CHAR(enroll_date, 'DD-MON-YYYY HH24:MI:SS')
 FROM enrollment
 WHERE enroll_date >= TIMESTAMP '2007-02-07 00:00:00'
 AND enroll_date <  TIMESTAMP '2007-02-08 00:00:00';

 spool off

