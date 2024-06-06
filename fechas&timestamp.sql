
rem (rischert, 2003,237)

set pagesize 99
set linesize 250
set colsep '|=|'

--esta obteniendo el día pero también el mes, día y año
SELECT last_name,
	TO_CHAR(registration_date, 'Dy') AS "1.Day",
	TO_CHAR(registration_date, 'DY') AS "2.Day",
	TO_CHAR(registration_date, 'Month DD, YYYY')
				AS "Look at the Month",
	TO_CHAR(registration_date, 'HH:MI PM') AS "Time"
	FROM student
	WHERE student_id IN (123, 161, 190);
	
ALTER SESSION SET NLS_DATE_LANGUAGE='ENGLISH';

COL "Look at the Month" FORMAT A20;
COL "Time" FORMAT A30;
COL "2.Day" FORMAT A30;
COL last_name FORMAT A12; 
SELECT last_name,
	TO_CHAR(registration_date, 'DDD') AS "1.Day",
	TO_CHAR(registration_date, 'DL') AS "2.Day",
	TO_CHAR(registration_date, 'MONTH DD, YYYY')
				AS "Look at the Month",
	TO_CHAR(registration_date, 'DL') AS "Time"
	FROM student
	WHERE student_id IN (123, 161, 190);
	
ALTER SESSION SET NLS_DATE_LANGUAGE='ITALIAN';


--se muestra la hora de 24hrs del sysdate con to_number, de la cadena se convierte en número para agarrar la hora
select to_number(to_char(sysdate, 'HH24')) FROM DUAL;

--el systimestamp tiene la fecha en numero, la hora, minutos, segundos y fraccion de segundos y diferencia de horas
select to_number(to_char(sysTIMESTAMP, 'MI')) FROM DUAL;

select to_number(to_char(sysTIMESTAMP, 'SS')) FROM DUAL;

select to_number(to_char(sysTIMESTAMP, 'SS:sss')) FROM DUAL;

--para las fracciones de segundo
select to_number(to_char(sysTIMESTAMP, 'ff')) FROM DUAL;


select      to_char(TO_DATE('23-Feb-2004 7:00 Am','dd-Mon-yyyy hh:mi am'), 'J') FECHA
			from dual;
			
select      to_char(TO_DATE('20-Dic-2023 7:00 Am','dd-Mon-yyyy hh:mi am'), 'J') FECHA
			from dual;
			
select      to_char(TO_DATE('01-Ene--476 7:00 Am','dd-Mon-sYYYY hh:mi am'), 'J') FECHANU
			from dual;


select sysdate - TO_DATE('01-Ene--476 7:00 Am','dd-Mon-sYYYY hh:mi am') from dual;
select sysdate from dual;
select systimestamp from dual;


--la función de truncar y dump para dar un análisis de la cadena obtenida
select dump(trunc(systimestamp)) from dual;

select dump(trunc(systimestamp,'HH')) from dual;

select dump(trunc(systimestamp,'MI')) from dual;
--aquí está truncando a partir de los días
select dump(trunc(systimestamp,'DD')) from dual;

select dump(trunc(systimestamp,'MM')) from dual;
select dump(trunc(systimestamp,'Q')) from dual;

select to_char(trunc(systimestamp, 'Q'), 'dd-mon-yyyy hh:mi:ss am') fecha from dual;

--se pasa a timestamp
select to_timestamp(sysdate) from dual;

--resta fechas y después se multiplica por 24
select (sysdate - TO_DATE('01-Ene--476 7:00 Am','dd-Mon-sYYYY hh:mi am'))*24 from dual;


--extrae segundos del systimestamp
select EXTRACT(SECOND FROM systimestamp) from dual;

select EXTRACT(minute FROM systimestamp) from dual;
--extrae el año de esta fecha
select EXTRACT(YEAR FROM sysdate) "Año_de_hoy" from dual;

--extrae el mes de una fecha que yo le di 
select EXTRACT(MONTH FROM TO_DATE('21-SEP-2003', 'DD-MON-YYYY')) "MI MES" FROM DUAL;

--convierte en cadena la fecha y hora actual
SELECT TO_CHAR(CURRENT_DATE, 'DD-MON-YYYY HH:MI:SS PM') "fecha actual"
FROM dual;

rem (rischert, 2010, 268)

--se pone la fecha como ANSI TIMESTAMP que empieza con año, mes y día seguido de la hora junto con su UTC (opcional)
--se desplegará la fecha y la hora que es en UTC o sea, 8hrs + y 5hrs+
SELECT SYS_EXTRACT_UTC(TIMESTAMP '2009-02-11 7:00:00 -8:00')
"West coast to UTC",
SYS_EXTRACT_UTC(TIMESTAMP '2009-02-11 10:00:00 -5:00')
"East coast to UTC"
FROM dual;

--se extrae hora, etc pero ahora de una fecha timestamp (hasta fracciones de segundo)
SELECT EXTRACT(HOUR FROM TIMESTAMP '2009-02-11 15:48:01.123') hour,
EXTRACT(MINUTE FROM TIMESTAMP '2009-02-11 15:48:01.123') minute,
EXTRACT(SECOND FROM TIMESTAMP '2009-02-11 15:48:01.123') second,
EXTRACT(YEAR FROM TIMESTAMP '2009-02-11 15:48:01.123') year,
EXTRACT(MONTH FROM TIMESTAMP '2009-02-11 15:48:01.123') month,
EXTRACT(DAY FROM TIMESTAMP '2009-02-11 15:48:01.123') day
FROM dual;


SELECT col_timestamp_w_tz, --es equivalente a systimestamp
EXTRACT(YEAR FROM col_timestamp_w_tz) year,
EXTRACT(MONTH FROM col_timestamp_w_tz) month,
EXTRACT(DAY FROM col_timestamp_w_tz) day,
EXTRACT(HOUR FROM col_timestamp_w_tz) hour,
EXTRACT(MINUTE FROM col_timestamp_w_tz) min,
EXTRACT(SECOND FROM col_timestamp_w_tz) sec
FROM date_example;

rem (rischert,2010,270)
SELECT col_timestamp_w_tz,
EXTRACT(TIMEZONE_HOUR FROM col_timestamp_w_tz) tz_hour,
EXTRACT(TIMEZONE_MINUTE FROM col_timestamp_w_tz) tz_min,
EXTRACT(TIMEZONE_REGION FROM col_timestamp_w_tz) tz_region,
EXTRACT(TIMEZONE_ABBR FROM col_timestamp_w_tz) tz_abbr
FROM date_example;

select to_timestamp( '24-FEB-09 04.25.32.000000 PM -05:00','DD-MON-YY HH:MI:SSFF -TZH:TZM')

--el RR es para los últimos dos dígitos del año
SELECT TO_TIMESTAMP ('10-Sep-02 14:10:10.123000', 'DD-Mon-RR HH24:MI:SS.FF') "TIMESTAMP con FF"
   FROM DUAL;

--como se ve en consola, convertir a timestamp hasta fraccion de segundos
TO_TIMESTAMP('10-SEP-0214:10:10.123000','DD-MON-RRHH24:MI:SS.FF')
---------------------------------------------------------------------------
10-SEP-02 02.10.10.123000000 PM

--convertir a timestamp con zona horaria
SELECT TO_TIMESTAMP_TZ('1999-12-01 11:00:00 -8:00',
   'YYYY-MM-DD HH:MI:SS TZH:TZM')"TIMESTAMP con TZ" FROM DUAL;
   
   
   --poner la zona horaria TZH:TZM
SELECT TO_TIMESTAMP_TZ('2023-12-21 08:00:00 -6:00',
   'YYYY-MM-DD HH:MI:SS TZH:TZM') FROM DUAL;
   
   
   --TO_UTC_TIMESTAMP convierte una cadena de texto que representa una fecha en un timestamp con zona horaria en UTC
   SELECT TO_UTC_TIMESTAMP_TZ('1998-01-01') FROM DUAL;

--NO HAY DESPLAZAMIENTO
TO_UTC_TIMESTAMP_TZ('1998-01-01')
---------------------------------------------------------------------------
01-JAN-98 12.00.00.000000000 AM +00:00

TO_TIMESTAMP_TZ('1999-12-0111:00:00-08:00','YYYY-MM-DDHH:MI:SSTZH:TZM')
--------------------------------------------------------------------
01-DEC-99 11.00.00.000000000 AM -08:00

--SE LE AGREGÓ CON T LA HORA HASTA CON FRACCIÓN DE SEGUNDOS
SELECT TO_UTC_TIMESTAMP_TZ('2000-01-02T12:34:56.789') FROM DUAL;

SELECT TO_UTC_TIMESTAMP_TZ('2023-12-21T08:34:56.789') FROM DUAL;


TO_UTC_TIMESTAMP_TZ('2000-01-02T12:34:56.789')21
---------------------------------------------------------------------------
02-JAN-00 12.34.56.789000000 PM +00:00

--se está convirtiendo a un dato de tipo timestamp con zona horaria, se ponen todos los datos que requiere ese tipo de dato
SELECT TO_TIMESTAMP_TZ('1999-12-01 11:00:00 -8:00',
   'YYYY-MM-DD HH:MI:SS TZH:TZM') "TIMESTAMP W TZ" FROM DUAL;

TO_TIMESTAMP_TZ('1999-12-0111:00:00-08:00','YYYY-MM-DDHH:MI:SSTZH:TZM')
--------------------------------------------------------------------
01-DEC-99 11.00.00.000000000 AM -08:00

