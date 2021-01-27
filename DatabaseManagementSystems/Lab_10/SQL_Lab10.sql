--Лабораторная работа №10 – СУБД – 2 часа

--Курсоры в T-SQL.
--Курсор - программная конструкция, которая служит для хранения результата запроса
--и для обработки строк результирующего набора запись за записью.

--Курсор - область памяти сервера, предназначенная для хранения и ибработки результата. 
--Курсор - область памяти сервера, предназначенная для хранения и ибработки результата select-запроса.

--Если не указан ни один из параметров GLOBAL или LOCAL, то значение по умолчанию управляется параметром default to local cursor базы данных.

--1.Разработать курсор, который выводит все данные о клиенте.
--объявляем переменные
DECLARE @msg varchar(80),
		@cust_num int,
		@company varchar(20),
		@cust_rep int,
		@credit_limit decimal(9,2);

--объявляем курсор в операторае DECLARE
DECLARE customer_cursor CURSOR FOR
SELECT CUST_NUM, COMPANY, CUST_REP, CREDIT_LIMIT FROM CUSTOMERS;

PRINT 'Сведения о клиенте: ';
--открываем курсор с помощью оператора OPEN
OPEN customer_cursor;
--с помощью оператора FETCH считывается одна или несколько строк результирующего набора, связанного
--с курсором SELECT-оператора, и обрабатывается нужным образом.
--результат каждого считывания проверяется с помощью системной функции @@FETCH_STATUS.
--считываем данные первой строки в наши переменные
FETCH FROM customer_cursor INTO @cust_num, @company, @cust_rep, @credit_limit;
--если данные в курсоре есть, то заходим в цикл
--и крутимся там до тех пор, пока не закончатся строки в курсоре
WHILE @@FETCH_STATUS = 0
BEGIN
	SELECT @msg = CAST(@cust_num as varchar(5)) + ' ' + @company + ' ' + CAST(@cust_rep as varchar(5)) + ' ' + CAST(@credit_limit as varchar(15));
	PRINT @msg;
	FETCH FROM customer_cursor INTO @cust_num, @company, @cust_rep, @credit_limit;
END;
--закрываем курсор
CLOSE customer_cursor;

DEALLOCATE customer_cursor;


--2. Разработать курсор, который выводит все данные о сотрудниках офисов и их количество.
DECLARE @message varchar(200),
		@empl_num int,
		@name char(15),
		@age int,
		@rep_office int,
		@title char(11),
		@hire_date date,
		@manager int,
		@quota decimal (9,2),
		@sales decimal (9,2),
		@count int = 0;

DECLARE salesreps_cursor CURSOR FOR
SELECT * FROM SALESREPS
PRINT 'Сведения о сотрудниках: '; 

OPEN salesreps_cursor;
FETCH FROM salesreps_cursor INTO @empl_num, @name, @age, @rep_office, @title, @hire_date, @manager, @quota, @sales;
WHILE @@FETCH_STATUS = 0
BEGIN
	SELECT @message = 'EMPL_NUM: ' + CAST(@empl_num as char(5)) + 'NAME: ' + @name + ' AGE: ' + CAST(@age as char(4)) + 'REP_OFFICE: ' + CAST(@rep_office as char(4)) 
			+ ' TITLE: ' + @title + ' HIRE_DATE: ' + CAST(@hire_date as char(12))   + ' MANAGER: ' + CAST(@manager as char(5)) + ' QUOTA: ' 
			+ CAST(@quota as char(12)) + ' SALES: ' + CAST(@sales as char(13));
	PRINT @message;
	FETCH FROM salesreps_cursor INTO @empl_num, @name, @age, @rep_office, @title, @hire_date, @manager, @quota, @sales;
	SET @count += 1;
END;
PRINT 'Количество сотрудников: ' + CAST(@count as char(3));
CLOSE salesreps_cursor;

DEALLOCATE salesreps_cursor;

--3.Разработать локальный курсор, который выводит все сведения о товарах и их среднюю цену.
--Локальный курсор существует в рамках одного пакета

DECLARE @msg varchar(100),
		@mfr_id char(3),
		@product_id char(7),
		@description varchar(20),
		@price money,
		@qty int,
		@avg_price money;

PRINT 'Сведения о товарах:';

DECLARE products_cursor CURSOR LOCAL FOR
SELECT * 
FROM PRODUCTS;

OPEN products_cursor;

FETCH FROM products_cursor INTO @mfr_id, @product_id, @description, @price, @qty;
WHILE @@FETCH_STATUS = 0
BEGIN
	SELECT @msg = 'MFR_ID: ' + @mfr_id + ' ID: ' + @product_id + 'DESCRIPTION: ' + CAST(@description AS CHAR(17)) + ' PRICE: ' + CAST(@price as char(8)) + '  QTY: ' + CAST(@qty as char(8));
	PRINT @msg;
	FETCH FROM products_cursor INTO @mfr_id, @product_id, @description, @price, @qty;	
END;
SET @avg_price = (SELECT CAST(AVG(PRICE) AS money) FROM PRODUCTS);
PRINT 'Средняя цена товаров: ' + CAST(@avg_price as char(6));
--SELECT @avg_price as avg_product_price;
CLOSE products_cursor;

--SELECT * FROM PRODUCTS;
SELECT AVG(PRICE) AS average_sum
FROM PRODUCTS; --889.08


--4.Разработать глобальный курсор, который выводит сведения о заказах, выполненных в 2008 году.
--несколько пакетов (default)
--GLOBAL указывает, что курсор является глобальным по отношению к соединению. Имя курсора может использоваться любой хранимой процедурой или пакетом, 
--которые выполняются в соединении. Курсор неявно освобождается только в случае разрыва соединения.
DECLARE @data_row varchar(150),
		@order_num int,
		@order_date date,
		@cust int,
		@rep int,
		@mfr char(3),
		@product char(7),
		@quantity int,
		@amount decimal (9,2);

DECLARE orders_in_2008 CURSOR GLOBAL FOR
SELECT * FROM ORDERS
WHERE ORDER_DATE LIKE '2008%'
ORDER BY ORDER_DATE;

PRINT 'Сведения о заказах, выполненных в 2008 году: ';
OPEN orders_in_2008;
FETCH FROM orders_in_2008 INTO @order_num, @order_date, @cust, @rep, @mfr, @product, @quantity, @amount;

WHILE @@FETCH_STATUS = 0
BEGIN
	SELECT @data_row = 'ORDER_NUM: ' + CAST(@order_num as char(8)) + ' ORDER_DATE: ' + CAST(@order_date as char(12)) + 
		   ' CUST: ' + CAST(@cust as char(6)) + ' REP: ' + CAST(@rep as char(5)) + ' MFR: ' + @mfr + ' PRODUCT: ' + @product + 
		   ' QTY: ' + CAST(@quantity as char(5)) + ' AMOUNT: ' + CAST(@amount as char(13));
	PRINT @data_row
	FETCH FROM orders_in_2008 INTO @order_num, @order_date, @cust, @rep, @mfr, @product, @quantity, @amount;
END;
CLOSE orders_in_2008;
--используем оператор DEALLOCATE для освобождения курсора, т.к. курсор глобальный
DEALLOCATE orders_in_2008;

--5.Разработать статический курсор, который выводит сведения о покупателях и их заказах.
--статические курсоры - данные выбраны один раз и произошедшие изменения не видны
--статические курсоры используют рабочие таблицы базы данных tempdb для хранения строк, составляющих курсор
--доделать заказы
SELECT DISTINCT *
FROM CUSTOMERS C LEFT JOIN ORDERS O
ON C.CUST_NUM = O.CUST;

DECLARE @data_row varchar(80),
		@cust_num_curs int,
		@company_curs varchar(20),
		@cust_rep_curs int,
		@credit_limit_cust decimal(9,2);
DECLARE @order_num_curs int,
		@order_date_curs date,
		@cust_curs int,
		@mfr_curs char(3),
		@product_curs char(5),
		@qty_curs int,
		@amount_curs decimal(9,2);
DECLARE customers_cursor CURSOR STATIC FOR
SELECT DISTINCT CUST_NUM, COMPANY, CUST_REP,CREDIT_LIMIT, AMOUNT 
FROM CUSTOMERS C LEFT JOIN ORDERS O
ON C.CUST_NUM = O.CUST;
PRINT 'Сведения о покупателях и их заказах: ';
OPEN customers_cursor;
FETCH FROM customers_cursor INTO @cust_num_curs, @company_curs, @cust_rep_curs, @credit_limit_cust, @amount_curs;

WHILE @@FETCH_STATUS = 0
BEGIN
	SELECT @data_row = CAST(@cust_num_curs as char(6)) + CAST(@company_curs AS char(18)) + CAST(@cust_rep_curs as char(5)) + CAST(@credit_limit_cust as char(13)) + CAST(@amount_curs as char(10));
	PRINT @data_row;
	FETCH FROM customers_cursor INTO @cust_num_curs, @company_curs, @cust_rep_curs, @credit_limit_cust, @amount_curs;
END;
CLOSE customers_cursor;

DEALLOCATE customers_cursor;

SELECT * FROM CUSTOMERS;
SELECT * FROM ORDERS;
--6.Разработать динамический курсор, который обновляет данные о сотруднике в зависимости от суммы выполненных заказов (поле SALES).
--динамические курсоры - изменения данных отображаются в динамике (default).
DECLARE @data_row varchar(100),
		@salesreps_name varchar(15),
		@salesreps_title varchar(10),
		@salesreps_sales decimal(9,2);

DECLARE salesreps_cursor CURSOR FOR
SELECT NAME, TITLE, SALES FROM SALESREPS;
OPEN salesreps_cursor;
FETCH FROM salesreps_cursor INTO @salesreps_name, @salesreps_title, @salesreps_sales;
WHILE @@FETCH_STATUS = 0
BEGIN
	IF @salesreps_sales < 300000 UPDATE SALESREPS SET TITLE = 'LOW SALES'
	WHERE CURRENT OF salesreps_cursor;
	FETCH FROM salesreps_cursor INTO @salesreps_name, @salesreps_title, @salesreps_sales;
END;
CLOSE salesreps_cursor;
DEALLOCATE salesreps_cursor;

SELECT * FROM SALESREPS;
--7.Продемонстрировать свойства SCROLL.
--SCROLL означает, что "передвигаться" по курсору можно в любом направлении (в операторе FETCH доступно FIRST, LAST, PRIOR, NEXT, RELATIVE, ABSOLUTE). 
--Параметр SCROLL не может указываться вместе с параметром FAST_FORWARD. 
--Курсоры STATIC, KEYSET и DYNAMIC имеют значение по умолчанию SCROLL.
--STATIC означает, что курсор необновляемый. Результирующий набор данных такого курсора извлекается из БД и сохраняется в базе для временных объектов tempdb.

--FIRST - Выбрать следующую строку. Это действие подразумевается по умолчанию, если направление опущено.
DECLARE @msg varchar(80),
		@cust_num int,
		@company varchar(20),
		@cust_rep int,
		@credit_limit decimal(9,2);

DECLARE customer_cursor CURSOR SCROLL FOR
SELECT CUST_NUM, COMPANY, CUST_REP, CREDIT_LIMIT FROM CUSTOMERS;
PRINT 'Сведения о клиенте: ';
OPEN customer_cursor;
FETCH FIRST FROM customer_cursor INTO @cust_num, @company, @cust_rep, @credit_limit;
WHILE @@FETCH_STATUS = 0
BEGIN
	SELECT @msg = CAST(@cust_num as varchar(5)) + ' ' + @company + ' ' + CAST(@cust_rep as varchar(5)) + ' ' + CAST(@credit_limit as varchar(15));
	PRINT @msg;
	FETCH FROM customer_cursor INTO @cust_num, @company, @cust_rep, @credit_limit;
END;
CLOSE customer_cursor;

DEALLOCATE customer_cursor;

----LAST - Выбрать последнюю строку запроса (аналогично ABSOLUTE -1).
DECLARE @msg varchar(80),
		@cust_num int,
		@company varchar(20),
		@cust_rep int,
		@credit_limit decimal(9,2);

DECLARE customer_cursor CURSOR SCROLL FOR
SELECT CUST_NUM, COMPANY, CUST_REP, CREDIT_LIMIT FROM CUSTOMERS;
PRINT 'Сведения о клиенте: ';
OPEN customer_cursor;
FETCH LAST FROM customer_cursor INTO @cust_num, @company, @cust_rep, @credit_limit;
WHILE @@FETCH_STATUS = 0
BEGIN
	SELECT @msg = CAST(@cust_num as varchar(5)) + ' ' + @company + ' ' + CAST(@cust_rep as varchar(5)) + ' ' + CAST(@credit_limit as varchar(15));
	PRINT @msg;
	FETCH FROM customer_cursor INTO @cust_num, @company, @cust_rep, @credit_limit;
END;
CLOSE customer_cursor;

DEALLOCATE customer_cursor;

--PRIOR - Выбрать предыдущую строку.
DECLARE @msg varchar(80),
		@cust_num int,
		@company varchar(20),
		@cust_rep int,
		@credit_limit decimal(9,2);

DECLARE customer_cursor CURSOR SCROLL FOR
SELECT CUST_NUM, COMPANY, CUST_REP, CREDIT_LIMIT FROM CUSTOMERS;
PRINT 'Сведения о клиенте: ';
OPEN customer_cursor;
FETCH PRIOR FROM customer_cursor INTO @cust_num, @company, @cust_rep, @credit_limit;
WHILE @@FETCH_STATUS = 0
BEGIN
	SELECT @msg = CAST(@cust_num as varchar(5)) + ' ' + @company + ' ' + CAST(@cust_rep as varchar(5)) + ' ' + CAST(@credit_limit as varchar(15));
	PRINT @msg;
	FETCH FROM customer_cursor INTO @cust_num, @company, @cust_rep, @credit_limit;
END;
CLOSE customer_cursor;

DEALLOCATE customer_cursor;

--RELATIVE int
--Выбрать строку под номером int, считая со следующей вперёд, либо под номером abs(число), считая с предыдущей назад, если число отрицательно. 
--RELATIVE 0 повторно считывает текущую строку, если таковая имеется.
--Переход на n-ю запись, считая от текущего положения указателя в наборе данных
SELECT * FROM CUSTOMERS;

DECLARE @msg varchar(80),
		@cust_num int,
		@company varchar(20),
		@cust_rep int,
		@credit_limit decimal(9,2);

DECLARE customer_cursor CURSOR SCROLL FOR
SELECT CUST_NUM, COMPANY, CUST_REP, CREDIT_LIMIT FROM CUSTOMERS;
PRINT 'Сведения о клиенте: ';
OPEN customer_cursor;
FETCH RELATIVE 1 FROM customer_cursor INTO @cust_num, @company, @cust_rep, @credit_limit;
	SELECT @msg = CAST(@cust_num as varchar(5)) + ' ' + @company + ' ' + CAST(@cust_rep as varchar(5)) + ' ' + CAST(@credit_limit as varchar(15));
	PRINT @msg;
	FETCH RELATIVE -2 FROM customer_cursor INTO @cust_num, @company, @cust_rep, @credit_limit;
	SELECT @msg = CAST(@cust_num as varchar(5)) + ' ' + @company + ' ' + CAST(@cust_rep as varchar(5)) + ' ' + CAST(@credit_limit as varchar(15));
	PRINT @msg;
	FETCH RELATIVE 0 FROM customer_cursor INTO @cust_num, @company, @cust_rep, @credit_limit;
	SELECT @msg = CAST(@cust_num as varchar(5)) + ' ' + @company + ' ' + CAST(@cust_rep as varchar(5)) + ' ' + CAST(@credit_limit as varchar(15));
	PRINT @msg;
CLOSE customer_cursor;

DEALLOCATE customer_cursor;

--ABSOLUTE int- Выбрать строку под номером число с начала, либо под номером abs(число) с конца, если число отрицательно. Если число выходит за границы набора строк, 
--курсор размещается перед первой или после последней строки; в частности, с ABSOLUTE 0 курсор оказывается перед первой строкой.
--Переход на n-ю запись, считая от начала набора данных

DECLARE @msg varchar(80),
		@cust_num int,
		@company varchar(20),
		@cust_rep int,
		@credit_limit decimal(9,2);

DECLARE customer_cursor CURSOR SCROLL FOR
SELECT CUST_NUM, COMPANY, CUST_REP, CREDIT_LIMIT FROM CUSTOMERS;
PRINT 'Сведения о клиенте: ';
OPEN customer_cursor;
FETCH ABSOLUTE 1 FROM customer_cursor INTO @cust_num, @company, @cust_rep, @credit_limit;
	SELECT @msg = CAST(@cust_num as varchar(5)) + ' ' + @company + ' ' + CAST(@cust_rep as varchar(5)) + ' ' + CAST(@credit_limit as varchar(15));
	PRINT @msg;
	FETCH RELATIVE 2 FROM customer_cursor INTO @cust_num, @company, @cust_rep, @credit_limit;
	SELECT @msg = CAST(@cust_num as varchar(5)) + ' ' + @company + ' ' + CAST(@cust_rep as varchar(5)) + ' ' + CAST(@credit_limit as varchar(15));
	PRINT @msg;
	FETCH RELATIVE 2 FROM customer_cursor INTO @cust_num, @company, @cust_rep, @credit_limit;
	SELECT @msg = CAST(@cust_num as varchar(5)) + ' ' + @company + ' ' + CAST(@cust_rep as varchar(5)) + ' ' + CAST(@credit_limit as varchar(15));
	PRINT @msg;
		FETCH RELATIVE 0 FROM customer_cursor INTO @cust_num, @company, @cust_rep, @credit_limit;
	SELECT @msg = CAST(@cust_num as varchar(5)) + ' ' + @company + ' ' + CAST(@cust_rep as varchar(5)) + ' ' + CAST(@credit_limit as varchar(15));
	PRINT @msg;
CLOSE customer_cursor;

DEALLOCATE customer_cursor;