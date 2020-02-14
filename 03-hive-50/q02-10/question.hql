-- 
-- Pregunta
-- ===========================================================================
--
-- Para resolver esta pregunta use el archivo `data.tsv`.
--
-- Construya una consulta que ordene la tabla por letra y valor (3ra columna).
--
-- Escriba el resultado a la carpeta `output` de directorio de trabajo.
--
-- >>> Escriba su respuesta a partir de este punto <<<
--

drop table if exists data;
drop table if exists data2;

CREATE TABLE data (letra STRING,fecha STRING, numero INT)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t';

LOAD DATA LOCAL INPATH 'data.tsv' OVERWRITE INTO TABLE data;

CREATE TABLE data2 AS
SELECT * FROM data
ORDER BY letra,numero,fecha;


INSERT OVERWRITE LOCAL DIRECTORY 'output'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
select * from data2;