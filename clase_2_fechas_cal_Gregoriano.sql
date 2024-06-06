rem ejemplo de fechas y formatos 
rem Sergio Salinas Lugo
rem ***********************************

--diccionario de datos
select *from nls_session_parameters;

select sysdate from dual; --fecha actual
select dump (sysdate) from dual; --devuelve una representación en cadena del valor interno de esa expresión
select systimestamp from dual;--fecha actual y hora con milesimas de segundo y horas de diferencia con greenwich
select dump (systimestamp) from dual;--representación de cada dato 

rem calendario Gregoriano modificado papa Gregorio XIII el 5 de oct de 1582

select      to_char(TO_DATE('24-Feb-2024 12:00 pm','dd-Mon-yyyy hh:mi am'), 'DL') FECHA  from dual;
--CON NOMBRE EN LA COLUMNA DE LA FECHA, DL ES FECHA EN FORMATO LARGO
SELECT TO_CHAR(TO_DATE('05-06-2024', 'DD-MM-YYYY'), 'DL') "FECHA" FROM DUAL;

select      to_char(TO_DATE('05-Jun-2024 10:32 pm','dd-Mon-yyyy hh:mi am'), 'DL') FECHA  from dual;


--solo muestra la fecha en numeritos
select      TO_DATE('24-Feb-2024 12:00 pm','dd-Mon-yyyy hh:mi am') FECHA  from dual; 

--cambiar idioma a español
alter session set nls_date_language = 'SPANISH';

--Juliano empieza el 1 de enero de 4712 a.C
select      to_char(TO_DATE('24-Feb-2024 7:00 Am','dd-Mon-yyyy hh:mi am'), 'J') FECHA
			from dual;
--fecha larga de 1582
select      to_char(TO_DATE('4-Oct-1582 7:00 Am','dd-Mon-yyyy hh:mi am'), 'DL') FECHA
			from dual;

--fecha de 1582 en juliano		
select      to_char(TO_DATE('4-Oct-1582 7:00 Am','dd-Mon-yyyy hh:mi am'), 'J') FECHA
			from dual;
			
select      to_char(TO_DATE('5-Oct-1582 7:00 Am','dd-Mon-yyyy hh:mi am'), 'DL') FECHA
			from dual;
			
select      to_char(TO_DATE('5-Oct-1582 7:00 Am','dd-Mon-yyyy hh:mi am'), 'J') FECHA
			from dual;
			
select      to_char(TO_DATE('6-Oct-1582 7:00 Am','dd-Mon-yyyy hh:mi am'), 'J') FECHA
			from dual;
select      to_char(TO_DATE('7-Oct-1582 7:00 Am','dd-Mon-yyyy hh:mi am'), 'J') FECHA
			from dual;
select      to_char(TO_DATE('8-Oct-1582 7:00 Am','dd-Mon-yyyy hh:mi am'), 'J') FECHA
			from dual;
select      to_char(TO_DATE('9-Oct-1582 7:00 Am','dd-Mon-yyyy hh:mi am'), 'J') FECHA
			from dual;
select      to_char(TO_DATE('10-Oct-1582 7:00 Am','dd-Mon-yyyy hh:mi am'), 'J') FECHA
			from dual;
select      to_char(TO_DATE('11-Oct-1582 7:00 Am','dd-Mon-yyyy hh:mi am'), 'J') FECHA
			from dual;
select      to_char(TO_DATE('12-Oct-1582 7:00 Am','dd-Mon-yyyy hh:mi am'), 'J') FECHA
			from dual;
select      to_char(TO_DATE('13-Oct-1582 7:00 Am','dd-Mon-yyyy hh:mi am'), 'J') FECHA
			from dual;
select      to_char(TO_DATE('14-Oct-1582 7:00 Am','dd-Mon-yyyy hh:mi am'), 'J') FECHA
			from dual;
select      to_char(TO_DATE('15-Oct-1582 7:00 Am','dd-Mon-yyyy hh:mi am'), 'J') FECHA
			from dual;
select      to_char(TO_DATE('16-Oct-1582 7:00 Am','dd-Mon-yyyy hh:mi am'), 'J') FECHANU
			from dual;
			
select      to_char(TO_DATE('16-Oct-1582 7:00 Am','dd-Mon-yyyy hh:mi am'), 'DL') FECHANU
			from dual;
			
REM FECHA EN ORACLE DEL 1 DE ENERO DE 4712 AC
--signo negativo para fechas antes de cristo
select      to_char(TO_DATE('01-Ene--4711 7:00 Am','dd-Mon-sYYYY hh:mi am'), 'J') FECHANU
			from dual;
--ANTES DE CRISTO CON FORMATO LARGO
select to_char(to_date('21-Sep--4712 7:00 Am', 'dd-Mon-syyyy hh:mi am'), 'DL') FECHA from dual;
-- SE PUEDE DE 4712 HACIA ABAJO EN LAS FECHAS A.C
select      to_char(TO_DATE('31-Dic--4713 7:00 Am','dd-Mon-sYYYY hh:mi am'), 'J') FECHANU
			from dual;
			
rem     debemos modificar el idioma 

alter session set nls_date_language = 'ENGLISH';

select      to_char(TO_DATE('01-Jan--4712 7:00 Am','dd-Mon-sYYYY  hh:mi am'), 'DL') FECHANU
			from dual;			

--la "s" antes de YYYY es para que maneje correctamente el año negativo 
select      to_char(TO_DATE('21-Sep--4700 7:00 Am','dd-Mon-sYYYY  hh:mi am'), 'DL') FECHANU
			from dual;

select      to_char(TO_DATE('01-Jan-1 7:00 Am','dd-Mon-sYYYY hh:mi am'), 'J') FECHANU
			from dual;
select      to_char(TO_DATE('21-Jan-2021 7:00 Am','dd-Mon-sYYYY hh:mi am'), 'J') FECHANU
			from dual;
			
select      to_char(TO_DATE('21-Ene-2021 7:00 Am','dd-Mon-sYYYY hh:mi am'), 'J') FECHANU
			from dual;
select      to_char(TO_DATE('8-Sep-2023 7:00 Am','dd-Mon-sYYYY hh:mi am'), 'J') FECHANU
			from dual;
select      to_char(TO_DATE('21-Jan-2021 7:00 Am','dd-Mon-sYYYY hh:mi am'), 'J') FECHANU
			from dual;
--EN ESTE AÑO YA POSITIVO HACE REDUNDANCIA LA S PERO NO AFECTA
select to_char(to_date('21-sep-1 01:15 pm', 'dd-mm-Syyyy hh:mi am'), 'DL') FECHA from dual;

----------------------------------------------------------
REM 
REM EJEMPLO DE GENERAR FECHA AL AZAR DENTRO DE UN PERIODO ESPECIFICO

SELECT TO_CHAR(TO_DATE('01/01/2020','mm/dd/yyyy'),'J') FROM DUAL;

SELECT TO_CHAR(TO_DATE('01/01/2020','mm/dd/yyyy'),'DL') FROM DUAL;

SELECT TO_CHAR(TO_DATE('01/01/2020','mm/dd/yyyy'),'DY') FROM DUAL;

SELECT TO_CHAR(TO_DATE('01/21/2021','mm/dd/yyyy'),'J') FROM DUAL;

SELECT TO_CHAR(TO_DATE('10/26/2023','mm/dd/yyyy'),'J') FROM DUAL;

SELECT TO_CHAR(TO_DATE('02/24/2024','mm/dd/yyyy'),'J') FROM DUAL;

--RANDOM EN UN INTERVALO DE TIEMPO
SELECT TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2458850,2458850+364)),'J') fecha  FROM DUAL;

--fecha random en cierto intervalo dado en fechas normales
SELECT TO_DATE(
           TRUNC(DBMS_RANDOM.VALUE(
               TO_NUMBER(TO_CHAR(TO_DATE('01-OCT-2001', 'DD-MON-YYYY'), 'J')),
               TO_NUMBER(TO_CHAR(TO_DATE('21-SEP-2003', 'DD-MON-YYYY'), 'J'))
           )),
           'J'
       ) AS fecha
FROM DUAL;

SELECT TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2460365,2460365+364)),'J') fecha  FROM DUAL;


col fecha format a29
SELECT TO_CHAR(TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2458870,2458870+364)),'J')
              ,'DD/fmMonth/YYYY') fecha  FROM DUAL;

------------------------------------------------------------------------			
REM FECHA 			
column fecha format a40 just center;	
--el sysdate lo revele en cadena junto que tiene todas las partes y hora		
select to_char(sysdate, 'dd-Mon-yyyy hh:mi am') fecha
from dual;
select to_char(sysdate, 'dd-mon-yyyy hh:mi am') fecha
from dual;
select to_char(sysdate, 'fmdd-Month-yyyy hh:mi am') fecha 
from dual;
--pondrá el día competo
select to_char(sysdate, 'fmday dd-Mon-yyyy hh:mi am') fecha
from dual;

-- da la fecha del sysdate pero en frances por medio del segundo parámetro de to_char para cambairlo a francés
select to_char(sysdate, 'fmday dd-Mon-yyyy hh:mi am', 'NLS_DATE_LANGUAGE=FRENCH') 
   fecha FROM DUAL;
   
select to_char(sysdate, 'fmday dd-Mon-yyyy hh:mi am', 'NLS_DATE_LANGUAGE=GERMAN') 
   fecha FROM DUAL;
select to_char(sysdate, 'fmday dd-Month-yyyy hh:mi am', 'NLS_DATE_LANGUAGE=GERMAN') 
   fecha FROM DUAL;
select to_char(sysdate, 'fmDay dd-Month-yyyy hh:mi am', 'NLS_DATE_LANGUAGE=ITALIAN') 
   fecha FROM DUAL;
select to_char(sysdate, 'fmDay dd-Month-yyyy hh:mi am', 'NLS_DATE_LANGUAGE=PORTUGUESE') 
   fecha FROM DUAL;
select to_char(sysdate, 'fmDL dd-Month-yyyy hh:mi am', 'NLS_DATE_LANGUAGE=PORTUGUESE') 
   fecha FROM DUAL;
REM FECHA EN FORMATO LARGO     DL y en diferentes idiomas pero la misma fecha por el sysdate
select to_char(sysdate, 'DL','NLS_DATE_LANGUAGE = FRENCH') FROM DUAL;
select to_char(sysdate, 'DL','NLS_DATE_LANGUAGE = ENGLISH') FECHA FROM DUAL;
select to_char(sysdate, 'DL','NLS_DATE_LANGUAGE = FRENCH') FECHA FROM DUAL;
select to_char(sysdate, 'DL','NLS_DATE_LANGUAGE = CATALAN') FECHA FROM DUAL;
select to_char(sysdate, 'DL','NLS_DATE_LANGUAGE = PORTUGUESE') FECHA FROM DUAL;
select to_char(sysdate, 'DL','NLS_DATE_LANGUAGE = ENGLISH') FECHA FROM DUAL;
select to_char(sysdate, 'DL','NLS_DATE_LANGUAGE = SPANISH') FECHA FROM DUAL;
REM FECHA EN FORMATO CORTO     DS date_short, puro numerito

select to_char(sysdate, 'DS','NLS_DATE_LANGUAGE = FRENCH') FECHA FROM DUAL;
select to_char(sysdate, 'DS','NLS_DATE_LANGUAGE = SPANISH') FECHA FROM DUAL;   
alter session set nls_date_language = 'ENGLISH';
