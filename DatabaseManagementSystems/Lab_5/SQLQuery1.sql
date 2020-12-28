--1.Разработать T-SQL-скрипт  следующего содержания: 
--1.1.объявить переменные типа: char, varchar, datetime, time, int, smallint,  tinyint, numeric(12, 5).
--1.2.первые две переменные проинициализировать в операторе объявления.
--1.3.присвоить  произвольные значения следующим двум переменным с помощью оператора SET, 
--одной из  этих переменных  присвоить значение, полученное в результате запроса SELECT.
--1.4.одну из переменных оставить без инициализации и не присваивать ей значения, оставшимся переменным присвоить некоторые значения с помощью оператора SELECT;.
--1.5.значения половины переменных вывести с помощью оператора SELECT, значения другой половины переменных распечатать с помощью оператора PRINT. 

DECLARE @ch CHAR(3) = 'Ira', --хранит строку длиной от 1 до 8 000 символов. На каждый символ выделяет по 1 байту. Не подходит для многих языков, так как хранит символы не в кодировке Unicode.
		@v_ch VARCHAR(30) = 'Hello world';  --хранит строку. На каждый символ выделяется 1 байт. Можно указать конкретную длину для столбца - от 1 до 8 000 символов.
SELECT @ch AS CHAR							--В отличие от типа CHAR если в столбец с типом VARCHAR(10) будет сохранена строка в 5 символов, то в столце будет сохранено именно пять символов.
SELECT @v_ch AS VARCHAR
							
DECLARE @date_time DATETIME, @time TIME
SET @date_time = GETDATE();
--SET @date_time = '2010-10-01 21:12:23'
SET @time = '15:00:00'
--SET @date_time = @date_time + CAST(@time AS DATETIME)

SELECT @date_time AS DATETIME
SELECT @time AS TIME
		
DECLARE	@i INT,  -- хранит числа от –2 147 483 648 до 2 147 483 647. Занимает 4 байта. Наиболее используемый тип для хранения чисел.
		@s_i SMALLINT,  -- хранит числа от –32 768 до 32 767. Занимает 2 байта
		@t_i TINYINT,  -- хранит числа от 0 до 255. Занимает 1 байт. Хорошо подходит для хранения небольших чисел.
		@num NUMERIC(12,5) -- данный тип аналогичен типу DECIMAL, хранит числа c фиксированной точностью. Занимает от 5 до 17 байт в зависимости от количества чисел после запятой.
SELECT @i  = 20000000;
SELECT @s_i = 20000;
SELECT @num = 21.52;

--select @i as int
--select @s_i as smallint
--sele ct @t_i AS TINYINT
--select @num as numeric

PRINT @i;
PRINT @s_i;
PRINT @t_i;
PRINT @num;
GO

--2.Разработать скрипт, в котором определяется средняя стоимость продукта. 
--Если средняя стоимость продукта превышает 10, то вывести количество продуктов, среднюю стоимость продукта, максимальную стоимость продукта. 
--Если средняя стоимость продукта меньше 10, то вывести минимальную стоимость продукта. 

DECLARE @prod_avg_price numeric(8,3) = (SELECT CAST(AVG(PRICE) AS numeric(8,3)) FROM PRODUCTS);
DECLARE @prod_count numeric(8,3) = (SELECT CAST(COUNT(PRICE) AS numeric(8,3)) FROM PRODUCTS);
DECLARE @prod_max_price numeric(8,3) = (SELECT CAST(MAX(PRICE) AS numeric(8,3)) FROM PRODUCTS);
DECLARE @prod_min_price numeric(8,3) = (SELECT CAST(MIN(PRICE) AS numeric(8,3)) FROM PRODUCTS);

if @prod_avg_price < 10
--prod_avg_price = 889
	SELECT @prod_min_price 'prod_min_price'
else
	SELECT @prod_avg_price 'prod_avg_price',
		   @prod_count 'prod_count',
		   @prod_max_price 'prod_max_price';
GO

--3.Подсчитать количество заказов сотрудника в определенный период. 
DECLARE @begin_year char(4) = '2006';
DECLARE @finish_year char(4) = '2007';
DECLARE @number_of_orders_in_period int = 
	(SELECT SUM(QTY)
	FROM ORDERS
	WHERE YEAR(ORDER_DATE) BETWEEN @begin_year AND @finish_year);

SELECT @number_of_orders_in_period 'number_of_orders_in_period';
GO

--4.Разработать T-SQL-скрипты, выполняющие: 
SELECT CITY, LEN(CITY) Name_Lengh FROM OFFICES;
SELECT LTRIM(' CITY') Left_Trim, RTRIM(' CITY   ') Right_Trim;
SELECT CITY, CHARINDEX('an', CITY) Str_Pos FROM OFFICES;
SELECT CITY, PATINDEX('%a%n%', CITY) Str_Pos FROM OFFICES;
SELECT LEFT(CITY, 3)l3, RIGHT(CITY, 3)r3 FROM OFFICES;
SELECT LOWER(CITY), UPPER(CITY) FROM OFFICES;
SELECT CITY, REPLICATE(CITY, 4) FROM OFFICES;
--4.1.преобразование имени сотрудника в инициалы.
3
--4.2.поиск сотрудников, у которых дата найма в следующем месяце.
DECLARE @hiredate DATETIME = MONTH(GETDATE()) + 1

SELECT NAME, HIRE_DATE FROM SALESREPS
WHERE MONTH(HIRE_DATE) = @hiredate;
GO
--4.3.поиск сотрудников, которые проработали более 10 лет.
DECLARE @experience DATETIME = YEAR(GETDATE()) - 10
SELECT NAME, HIRE_DATE
FROM SALESREPS
WHERE YEAR(HIRE_DATE) <= @experience;
GO
--4.4.поиск дня недели, в который делались заказы.
DECLARE @day_of_week DATETIME;
SELECT *, DATENAME(WEEKDAY, ORDER_DATE) AS DAY_OF_WEEK
FROM ORDERS
WHERE DATENAME(WEEKDAY, ORDER_DATE) LIKE 'Monday';

--5.Продемонстрировать применение оператора IF… ELSE.
--см. пример №2

--6.Продемонстрировать применение оператора CASE.
SELECT [DESCRIPTION],
	CASE 
		WHEN [QTY_ON_HAND] BETWEEN 0 AND 10 THEN 'Категоия A'
		WHEN [QTY_ON_HAND] BETWEEN 10 AND 100  THEN 'Категоия B'
		WHEN [QTY_ON_HAND] > 100  THEN 'Категоия C'
		ELSE 'Категоия D'
	END AS CATEGORY
FROM PRODUCTS;

DECLARE @qty int = 100;
PRINT 
(CASE 
	WHEN @qty BETWEEN 0 AND 10 THEN 'Категоия A'
	WHEN @qty BETWEEN 10 AND 100  THEN 'Категоия B'
	WHEN @qty BETWEEN 100 AND 300 THEN 'Категоия C'
	ELSE 'Категоия D'
	END
)

--7.Продемонстрировать применение оператора RETURN. 
PRINT '1';
RETURN
PRINT '2';
GO

--8.Разработать скрипт с ошибками, в котором используются для обработки ошибок блоки TRY и CATCH. 
--Применить функции ERROR_NUMBER (код последней ошибки), ERROR_ES-SAGE (сообщение об ошибке), 
--ERROR_LINE(код последней ошибки), ERROR_PROCEDURE (имя  процедуры или NULL), ERROR_SEVERITY (уровень серьезности ошибки), ERROR_STATE (метка ошибки). 
DECLARE @X int = 2, @Y int = 0, @Z int;
BEGIN TRY
	PRINT 'Block A'
	SET @Z = @X/@Y; --error
	PRINT 'Block B'
END TRY
BEGIN CATCH
	PRINT 'Block C'
	PRINT ERROR_NUMBER() --код последней ошибки
	PRINT ERROR_MESSAGE() --сообщение об ошибке
	PRINT ERROR_LINE() --код последней ошибки
	PRINT ERROR_PROCEDURE()
	--select ERROR_PROCEDURE() as ErrorProcedure --имя  процедуры или NULL
	PRINT ERROR_SEVERITY()  --уровень серьезности ошибки
	PRINT ERROR_STATE()  --метка ошибки
END CATCH
GO

--example2
DECLARE @msg tinyint;
begin try
	set @msg = 300;
end try
begin catch
	print ERROR_MESSAGE()
	print ERROR_NUMBER() 
	print ERROR_SEVERITY()
	print ERROR_LINE()
	print ERROR_STATE()
	print ERROR_PROCEDURE()
end catch
go

--9.Создать локальную временную таблицу из трех столбцов. Добавить данные (10 строк) с использованием оператора WHILE. Вывести ее содержимое.
CREATE TABLE #TMP
	(PRODUCT_NAME VARCHAR(30),
	QTY INT,
	PRICE_TMP MONEY);


--drop table #tmp;


DECLARE @a INT  -- объявляет переменную типа INT
SET @a = 1 -- устанавливает значение а =1 
WHILE (@a <= 10) -- цикл работает пока значение переменной а < или = 10
BEGIN
INSERT INTO #TMP(PRODUCT_NAME, QTY, PRICE_TMP) values ('test', @a, @a * 10);
set @a = @a + 1;
END
select * from #tmp; -- Выводим значение

