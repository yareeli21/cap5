PROMPT Chapter 4: Date and Conversion Functions
PROMPT Lab 4.3
rem Overriding the individual session time zone 
rem consultar 
rem  https://www.timeanddate.com/time/map/
rem 
rem referente al tiempo universal coordinado
rem 

SET PAGESIZE 99
SET LINESIZE 250
rem 176 en ascii

SET COLSEP ' ░ '
SET NULL s/Datos
ALTER SESSION SET TIME_ZONE = 'America/Mexico_City';
ALTER SESSION SET TIME_ZONE = dbtimezone;
ALTER SESSION SET TIME_ZONE = local;
ALTER SESSION SET TIME_ZONE = '-6:00';
rem V$timezone_names
col tzname format a35
col tzabbrev format a15
--es el nombre de la zona horaria y la otra la abreviación de la zona horaria
--las de México
SELECT tzname,tzabbrev 
 FROM v$timezone_names 
 where tzname like '%Mex%'
 order by 2;

 desc v$timezone_names;

 
 SELECT tzname,tzabbrev 
 FROM v$timezone_names
 order by 2;
 
 SELECT tzname,tzabbrev 
 FROM v$timezone_names 
 where tzabbrev IN ('CDT','LMT','MST') 
 AND 
 tzname like '%Mex%';
 
 rem despeguemos Australia

 SELECT tzname,tzabbrev 
 FROM v$timezone_names 
 where  tzname like '%Australia%';

 select *from v$timezone_names;
 
  SELECT tzname,tzabbrev 
 FROM v$timezone_names 
 where  tzname like '%Australia%'
 order by 2;
 
 rem despleguemos India
   SELECT tzname,tzabbrev 
 FROM v$timezone_names 
 where  tzname like '%India%'
 order by 2;
 
    SELECT tzname,tzabbrev 
 FROM v$timezone_names 
 where  tzname like '%Delhi%'
 order by 2;
 
 REM    INDIA   IST INDIAN STANDARD TIME
    SELECT tzname,tzabbrev 
 FROM v$timezone_names 
 where  tzabbrev like '%IST%'
 order by 2;
 
 REM DESPLEGUEMOS LOS VALORES DISTINTOS DE 
 REM     TZABBREV 
 
 SELECT DISTINCT TZABBREV 
	FROM v$timezone_names
	order by 1;
 
 
DROP TABLE date_example2;
CREATE TABLE date_example2
  (col_date DATE,
   col_ts TIMESTAMP(6), 
   col_ts_w_tz tIMESTAMP WITH TIME ZONE,
   col_ts_w_local_tz TIMESTAMP WITH LOCAL TIME ZONE
   );

   --se pobla la tabla, primero el nombre de los atributos y se agregan los datos en orden con los atributos
INSERT INTO date_example2
  (col_date, 
   col_ts, 
   col_ts_w_tz,
   col_ts_w_local_tz)
VALUES
  (TO_DATE('18-ENE-2024 07:01:32', 'DD-MON-YYYY HH24:MI:SS'),
   TO_TIMESTAMP('18-ENE-2024 07:01:32.325330', 'DD-MON-YYYY  HH24:MI:SS.FF'),
   TO_TIMESTAMP_TZ('18-ENE-2024 07:01:32.325330 -6:00', 'DD-MON-YYYY HH24:MI:SS.FF TZH:TZM'),
   TO_TIMESTAMP('18-ENE-2024 07:01:32.325330', ' DD-MON-YYYY HH24:MI:SS.FF'));
COMMIT;

rem adicionemos otra tupla 
INSERT INTO date_example2
  (col_date, 
   col_ts, 
   col_ts_w_tz,
   col_ts_w_local_tz)
VALUES
  (TO_DATE('18-ENE-2024 07:01:32', 'DD-MON-YYYY HH24:MI:SS'),
   TO_TIMESTAMP   ('10-ENE-2024 07:03:32.525880', 'DD-MON-YYYY  HH24:MI:SS.FF'),
   TO_TIMESTAMP_TZ('10-ENE-2024 07:03:32.525880 -6:00', 'DD-MON-YYYY HH24:MI:SS.FF TZH:TZM'),
   TO_TIMESTAMP   ('10-ENE-2024 07:03:32.525880', ' DD-MON-YYYY HH24:MI:SS.FF'));
   
 commit 

col col_ts HEADING "Time stamp" format a30 just center 
col col_ts_w_tz HEADING "Time stamp con Zona" format a32 just center 
col col_ts_w_local_tz HEADING "Time stamp Zona Local" format a30 just center

select col_ts from date_example2;
select col_ts_w_tz from date_example2;
select col_ts_w_local_tz from date_example2;

select col_ts, col_ts_w_tz, col_ts_w_local_tz from date_example2;

select ' ',col_ts, col_ts_w_tz, col_ts_w_local_tz,' ' from date_example2;
/*
col "TIMESTAMP" format a30 JUST CENTER 
col "TS CON ZONA" format a32 JUST CENTER 
col "TS CON ZONA LOCAL" format a30 JUST CENTER 



select col_ts "TIMESTAMP" from date_example2;
select col_ts_w_tz "TS CON ZONA" from date_example2;
select col_ts_w_local_tz "TS CON ZONA LOCAL" from date_example2;
*/

--se obtienen los segundos de cada timestamp

select extract (SECOND from col_ts) segundos from date_example2;

select extract (SECOND from col_ts_w_tz) segundos from date_example2;

select extract (SECOND from col_ts_w_local_tz) segundos from date_example2;




select extract (timezone_hour from col_ts_w_tz) horas from date_example2;

select extract (timezone_hour from col_ts_w_local_tz) horas from date_example2;

rem (Rischert, 2003,261)
col col_ts_w_tz format a32
col tz_hour format 999
col tz_min  format 999
col tz_region format a12
col tz_abbr   format a10
SELECT col_ts_w_tz col_ts_w_tz, 
 EXTRACT(TIMEZONE_HOUR FROM col_ts_w_tz) tz_hour, 
 EXTRACT(TIMEZONE_MINUTE FROM col_ts_w_tz) tz_min, 
 EXTRACT(TIMEZONE_REGION FROM col_ts_w_tz) tz_region, 
 EXTRACT(TIMEZONE_ABBR FROM col_ts_w_tz) tz_abbr 
 FROM date_example2;
 
 COL ts_en_UTC FORMAT A32
 select ' ',sys_extract_utc (col_ts_w_tz) ts_en_UTC,' ' from date_example2;
 
 select ' ',sys_extract_utc (col_ts_w_tz) ts_en_UTC, col_ts_w_tz,' ' from date_example2;
 
 rem (Rischert, 2003, 257)
 col current_ts format a32
 col local_ts   format a30
 --hora y fecha actual con zona horaria y hora y fecha actual
 SELECT ' ',CURRENT_TIMESTAMP current_ts, LOCALTIMESTAMP local_ts, ' '
 FROM dual; 
 
 SELECT col_ts_w_tz, col_ts_w_local_tz 
 FROM date_example2; 
 
 -- AT TIME ZONE convierte una columna de timestamp con zona horaria a otra zona horaria especificada
 SELECT col_ts_w_tz, col_ts_w_tz AT TIME ZONE 'America/Los_Angeles' 
 FROM date_example2; 
 
 SELECT col_ts_w_tz, col_ts_w_tz AT TIME ZONE 'Europe/Paris' 
 FROM date_example2;
 
  SELECT col_ts_w_tz, col_ts_w_tz AT TIME ZONE 'Australia/Sydney' 
 FROM date_example2;



  SELECT col_ts_w_tz, col_ts_w_tz AT TIME ZONE 'Australia/Lord_Howe' 
 FROM date_example2;
 
   SELECT col_ts_w_tz, col_ts_w_tz AT TIME ZONE 'Australia/Eucla' 
 FROM date_example2;
 
   SELECT col_ts_w_tz, col_ts_w_tz AT TIME ZONE 'Australia/Lord_Howe',
   col_ts_w_tz - col_ts_w_tz AT TIME ZONE 'Australia/Lord_Howe'
 FROM date_example2;
 
 --en la segunda parte se hace una resta de las horas 
   SELECT col_ts_w_tz, col_ts_w_tz AT TIME ZONE 'Australia/Lord_Howe',
   col_ts_w_tz - col_ts_w_tz AT TIME ZONE 'Australia/Eucla'
 FROM date_example2;
 
 
 /*
 Australia/Lord_Howe
 Australia/Eucla
 */
 
  SELECT col_ts_w_tz, col_ts_w_tz AT TIME ZONE 'Australia/Darwin' 
 FROM date_example2;
 
  SELECT col_ts_w_tz, col_ts_w_tz AT TIME ZONE 'Asia/Shanghai' 
 FROM date_example2;
 
 
 