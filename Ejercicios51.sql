spool C:\Users\yayit\Documents\BD\ej_5.1_.txt
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

REM EJ 1 MOSTRAR DATOS DE SECCIONES IMPARTIDAS EN TAL fechas
select course_no, section_id, TO_CHAR(start_date_time, 'dd-mon-yyyy hh24:mi')
from section
where start_date_time >= DATE '2007-05-04'
and start_date_time < DATE '2007-05-05';

REM EJ 2 MOSTRAR DATOS DE ANTES O DURANTE TAL FECHA
select first_name||' '||last_name fullname, TO_CHAR(modified_date, 'DD-MM-YYYY HH:MI PM') as "modificacion"
 from student 
 where modified_date <= DATE '2007-01-22';

 REM EJ 3 MOSTRAR DATOS PARA SECCIONES QUE EMPIEZAN EN DOMINGO
 select course_no, section_id, TO_CHAR(start_date_time, 'DD-MM-YYYY HH:MI AM')
"resultados"
from section 
where TO_CHAR(start_date_time, 'DY')= 'SUN';

REM 4 MOSTRAR SECCIONES QUE TERMINAN EN TAL FECHA
select section_id, TO_CHAR(start_date_time, 'DD-MM-YYYY HH:MI AM')"CAMBIOS"
from section
where start_date_time between 
TO_DATE('07/01/2007', 'MM/DD/YYYY')
and TO_DATE('07/31/2007', 'MM/DD/YYYY');

REM EJ 5 DETERMINAR EL DIA DE UNA FECHA X
select to_char(to_date('31/12/1899', 'DD/MM/YYYY'), 'DY')
from dual;

REM EJ 6 EJECUTAR SENTENCIA
 SELECT 'Section '||section_id||' begins on '||
 TO_CHAR(start_date_time, 'fmDay')||'.' AS "Start"
 FROM section
 WHERE section_id IN (146, 127, 121, 155, 110, 85, 148)
 ORDER BY TO_CHAR(start_date_time, 'D');

spool off