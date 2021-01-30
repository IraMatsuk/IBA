---------------------------Лабораторная работа № 9-----------------------

---------------------------Индексы в T-SQL.------------------------------
USE[Matsuk_3]

SELECT * FROM CUSTOMERS
SELECT * FROM OFFICES
SELECT * FROM ORDERS
SELECT * FROM PRODUCTS
SELECT * FROM SALESREPS

--создаем временную таблицу
CREATE TABLE #tmp_Table
	(tb_1 int,
	tb_2 varchar(100));

--заполняем временную таблицу данными
SET NOCOUNT ON;
DECLARE @i int = 0;
WHILE (@i < 1000)
	BEGIN
		INSERT #tmp_Table VALUES (FLOOR(50000*RAND()), REPLICATE('STR', 10));
		IF (@i % 100 = 0)
			PRINT @i;
		SET @i = @i + 1;
	END;


SELECT * FROM #tmp_Table WHERE tb_1 BETWEEN 100 AND 900 ORDER BY tb_1;
--0.0088264 - table scan
--0.0116501 - sort
--0.0204765 - select

--0,0088264
CHECKPOINT;
DBCC DROPCLEANBUFFERS;

EXEC SP_HELPINDEX '#tmp_Table';

CREATE CLUSTERED INDEX #tmp_Table_CLUST ON #tmp_Table (tb_1);
--0,0033008 - clustered index seek

--DROP TABLE #tmp_Table
GO

-------создадим еще одну временную таблицу----
CREATE TABLE #tmp_Table2
	(tb_1 int IDENTITY(1,1),
	 tb_2 int,
	 tb_3 varchar(100));

--заполняем временную таблицу данными
SET NOCOUNT ON;
DECLARE @i int = 0;
WHILE (@i < 20000)
	BEGIN
		INSERT #tmp_Table2 (tb_2, tb_3) VALUES (FLOOR(30000*RAND()), REPLICATE('STR', 10));
		SET @i = @i + 1;
	END;


SELECT COUNT(*) FROM #tmp_Table2;
SELECT * FROM #tmp_Table2;

CREATE INDEX #tmp_Table2_NOCLUST ON #tmp_Table2(tb_1, tb_2);

SELECT * FROM #tmp_Table2 WHERE tb_1 BETWEEN 100 AND 900 AND tb_2 < 4500;  -- heap
SELECT * FROM #tmp_Table2 ORDER BY tb_1; --heap      0,12306 - (table scan)   1,32297 - (sort)  1,44603 - (select) 
SELECT tb_1, tb_2 FROM #tmp_Table2 WHERE tb_1 = 666 AND tb_2 = 4500;  --ind    --0,0032831 (index seek)
SELECT * FROM #tmp_Table2 WHERE tb_1 = 666 AND tb_2 = 4500;  --ind + heap   0,0032831 (index seek)   0,0032831 (rid lookup(heap))   0,0065704

drop table #tmp_Table2
-------------------создадим третью временную таблицу
CREATE TABLE #tmp_Table3
	(tb_1 int IDENTITY(1,1),
	 tb_2 int,
	 tb_3 varchar(100));

--заполняем временную таблицу данными
SET NOCOUNT ON;
DECLARE @i int = 0;
WHILE (@i < 20000)
	BEGIN
		INSERT #tmp_Table3 (tb_2, tb_3) VALUES (FLOOR(30000*RAND()), REPLICATE('STR', 10));
		SET @i = @i + 1;
	END;

select * from #tmp_Table3
--------------создаем фильтрующий индекс-------------
CREATE INDEX #tmp_Table3 ON #tmp_Table3(tb_2) WHERE tb_2 >= 15000 AND tb_2 < 20000;

--проверяем
SELECT tb_2 FROM #tmp_Table3 WHERE tb_2 BETWEEN 5000 AND 19999;
SELECT tb_2 FROM #tmp_Table3 WHERE tb_2 > 15000 AND tb_2 < 19999;
SELECT tb_2 FROM #tmp_Table3 WHERE tb_2 = 17999;
SELECT tb_1, tb_2 FROM #tmp_Table3 WHERE tb_2 = 17999;

DROP TABLE #tmp_Table3


-----------создаем индекс покрытия---------------
CREATE INDEX #tmp_Table_Include ON #tmp_Table3(tb_2) INCLUDE (tb_1) WHERE tb_2 >= 15000 AND tb_2 < 21000;

SELECT tb_1, tb_2 FROM #tmp_Table3 WHERE tb_2 = 17999;








------------------1.Найдите все индексы для таблиц базы данных.
--SP_HELPINDEX - получить перечень индексов, связанных с заданной таблицей
EXEC SP_HELPINDEX 'CUSTOMERS';
EXEC SP_HELPINDEX 'OFFICES';
EXEC SP_HELPINDEX 'ORDERS';
EXEC SP_HELPINDEX 'PRODUCTS';
EXEC SP_HELPINDEX 'SALESREPS';

-----------------2.Создайте индекс для таблицы для одного столбца и продемонстрируйте его применение.

CREATE INDEX Index_Customers ON CUSTOMERS (CUST_REP); --создастся некластеризованный индекс, т.к. в данной таблице есть первичный ключ(соответственно и кластериз.индекс)

SELECT COUNT(*) FROM CUSTOMERS WHERE CUST_REP = 102;  --0.0032864 - index seek,   0.0000029 - stream aggregate,    0.0032893 - compute scalar and select


SELECT * FROM CUSTOMERS WHERE CUST_REP = 102;  --0.0033051 -clustered index scan and select

DROP INDEX Index_Customers ON CUSTOMERS;

--3.Создайте индекс для таблицы для нескольких столбцов и продемонстрируйте его применение.
CREATE INDEX Composite_Index ON PRODUCTS(DESCRIPTION, PRICE);

SELECT PRICE FROM PRODUCTS;  --0.0033095
SELECT DESCRIPTION FROM PRODUCTS WHERE PRICE > 1000; --0.0033095
SELECT * FROM PRODUCTS WHERE PRICE BETWEEN 100 AND 2000 AND DESCRIPTION = 'Reducer'; --0.0033095
SELECT * FROM PRODUCTS ORDER BY PRICE; --0.0033095,  0.0115424(0.0148519)
SELECT DESCRIPTION, PRICE FROM PRODUCTS WHERE PRICE = 4500 AND DESCRIPTION = 'Left Hinge';  --0,0032831 (index seek)

DROP INDEX Composite_Index ON PRODUCTS;
--4.Создайте фильтрующий индекс для таблицы и продемонстрируйте его применение.
--создаем фильтрующий индекс
CREATE INDEX Filter_Index_Salesreps ON SALESREPS(AGE) WHERE AGE >= 30 AND AGE < 60;

--проверяем
SELECT AGE FROM SALESREPS;  --0.003293
SELECT NAME FROM SALESREPS WHERE AGE > 40 AND AGE < 60;  --0.003293
SELECT AGE, NAME FROM SALESREPS WHERE AGE = 29; --0.003293
SELECT AGE FROM SALESREPS WHERE AGE = 29; --0.003293


DROP INDEX Filter_Index_Salesreps ON SALESREPS;
--5.Создайте индекс покрытия для таблицы и продемонстрируйте его применение.
CREATE INDEX Include_Index_Salesreps ON SALESREPS(AGE) INCLUDE (REP_OFFICE) WHERE AGE > 29 AND AGE < 62;

SELECT AGE, REP_OFFICE FROM SALESREPS WHERE AGE = 62; --0.003293
SELECT AGE, REP_OFFICE FROM SALESREPS WHERE AGE BETWEEN 30 AND 60; --0.0032908

DROP INDEX Include_Index_Salesreps ON SALESREPS;
--6.Создайте индекс для запроса с соединением таблиц и продемонстрируйте его применение.

------------CASE1---------------------
--Выбираем фамилии и даты найма всех сотрудников и отсортируем по сумме заказов, которые они выполнили.
SELECT S.NAME, 
       S.HIRE_DATE,
	   SUM(AMOUNT) AS SUM_ORDERS
FROM SALESREPS S 
JOIN ORDERS O 
ON O.REP = S.EMPL_NUM
GROUP BY S.HIRE_DATE, S.NAME
ORDER BY SUM(O.AMOUNT) DESC;


SELECT * FROM SALESREPS;
SELECT * FROM ORDERS;

EXEC sp_helpindex 'SALESREPS';
EXEC sp_helpindex 'ORDERS';

--создаем индекс
CREATE INDEX Index_Salesr ON SALESREPS (NAME,HIRE_DATE);

--представление индексов
SELECT  * FROM SYS.dm_db_index_physical_stats(DB_iD('Matsuk_3'), OBJECT_ID('SALESREPS'), NULL,NULL,NULL);
SELECT  * FROM SYS.dm_db_index_physical_stats(DB_iD('Matsuk_3'), OBJECT_ID('ORDERS'), NULL,NULL,NULL);


DROP INDEX Include_Index_Salesreps ON SALESREPS;
------------CASE2------------
-------Выбрать всех сотрудников из Eastern региона и отсортировать по параметру QUOTA.
SELECT NAME, EMPL_NUM, REP_OFFICE, REGION, QUOTA 
FROM SALESREPS S 
LEFT JOIN OFFICES O ON S.REP_OFFICE = O.OFFICE
WHERE O.REGION = 'Eastern'
ORDER BY QUOTA DESC;
--0.004706 (clust.index seek)
--0.0194274 - >  0.0194311 (sort - estimated subtree cost)  /  0.01138181  ->  0.0113855 (estimated operator cost) 


exec sp_helpindex 'OFFICES';
exec sp_helpindex 'SALESREPS';

SELECT  * FROM SYS.dm_db_index_physical_stats(DB_ID('Matsuk_3'), OBJECT_ID('OFFICES'), NULL,NULL,NULL);
SELECT  * FROM SYS.dm_db_index_physical_stats(DB_ID('Matsuk_3'), OBJECT_ID('SALESREPS'), NULL,NULL,NULL);

CREATE INDEX regionIndex ON OFFICES(OFFICE) where REGION = 'Eastern';


exec sp_helpindex 'OFFICES';
CREATE INDEX quota_Index ON SALESREPS(QUOTA, REP_OFFICE);

DROP INDEX regionIndex ON OFFICES;
DROP INDEX quota_Index ON SALESREPS;
--7.Покажите состояние индексов для таблицы и продемонстрируйте их перестройку и реорганизацию.
--rebuild - перестройка, если меняем саму таблицу, удаляем что-то, то образуются пустоты, поэтому сносим старый индекс и делаем новый на новых данных
--реорганизация - переставляет листья, чтобы они были в порядке на уже существующем индексе.
--Реорганизация: это дефрагментация индексов. Берет существующий индекс(ы) и дефрагментирует существующие страницы. Однако если страницы не находятся в непрерывном порядке, 
--они остаются такими же, как и раньше. Меняется только содержание страниц.

--Rebuild: на самом деле он отбрасывает индекс и перестраивает его с нуля. 
--Это означает, что вы получите совершенно новый индекс, с дефрагментированными и смежными страницами.
SELECT  * FROM SYS.dm_db_index_physical_stats(DB_ID('Matsuk_3'), OBJECT_ID('OFFICES'), NULL,NULL,NULL);
ALTER INDEX regionIndex ON OFFICES REORGANIZE;

SELECT  * FROM SYS.dm_db_index_physical_stats(DB_ID('Matsuk_3'), OBJECT_ID('SALESREPS'), NULL,NULL,NULL);
ALTER INDEX quota_Index ON SALESREPS REBUILD WITH (ONLINE = OFF);
--avg_fragmentation_in_percent - Процентная доля логической фрагментации (неупорядоченные страницы в индексе).
--fragment_count - Число фрагментов (физически последовательные конечные страницы) в индексе.
--avg_fragment_size_in_pages - Среднее число страниц в одном фрагменте индекса.
--Выяснив степень фрагментации, используйте нижеследующую таблицу для определения наиболее подходящего метода устранения фрагментации.

--Корректирующая инструкция

--> 5 % и <= 30 %	ALTER INDEX REORGANIZE
--> 30%	ALTER INDEX REBUILD WITH (ONLINE = ON)

--8.Для запросов, разработанных в лабораторной работе № 3, покажите и проанализируйте планы запросов.
--9.Создайте индексы для оптимизации запросов из лабораторной работы № 3.
--10.Создайте необходимые индексы для базы данных своего варианта.
