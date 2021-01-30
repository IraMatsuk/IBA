CREATE TABLE PRODUCTS
     (MFR_ID CHAR(3) NOT NULL,
  PRODUCT_ID CHAR(5) NOT NULL,
 DESCRIPTION VARCHAR(20) NOT NULL,
       PRICE MONEY NOT NULL,
 QTY_ON_HAND INTEGER NOT NULL,
 PRIMARY KEY (MFR_ID, PRODUCT_ID));

 CREATE TABLE OFFICES
     (OFFICE INT NOT NULL,
        CITY VARCHAR(15) NOT NULL,
      REGION VARCHAR(10) NOT NULL,
         MGR INT,
      TARGET DECIMAL(9,2),
       SALES DECIMAL(9,2) NOT NULL,
 PRIMARY KEY (OFFICE));

 CREATE TABLE SALESREPS
   (EMPL_NUM INT NOT NULL,
             CHECK (EMPL_NUM BETWEEN 101 AND 199),
        NAME VARCHAR(15) NOT NULL,
        AGE INTEGER,
  REP_OFFICE INTEGER,
       TITLE VARCHAR(10),
   HIRE_DATE DATE NOT NULL,
     MANAGER INT,
       QUOTA DECIMAL(9,2),
       SALES DECIMAL(9,2) NOT NULL,
 PRIMARY KEY (EMPL_NUM),
 FOREIGN KEY (MANAGER) REFERENCES SALESREPS(EMPL_NUM),
 CONSTRAINT WORKSIN FOREIGN KEY (REP_OFFICE)  
  REFERENCES OFFICES(OFFICE));

CREATE TABLE CUSTOMERS
   (CUST_NUM INTEGER    NOT NULL,
    COMPANY VARCHAR(20) NOT NULL,
    CUST_REP INTEGER,
    CREDIT_LIMIT DECIMAL(9,2),
PRIMARY KEY (CUST_NUM),
CONSTRAINT HASREP FOREIGN KEY (CUST_REP)
REFERENCES SALESREPS(EMPL_NUM));

CREATE TABLE ORDERS
  (ORDER_NUM INTEGER NOT NULL,
             CHECK (ORDER_NUM > 100000),
  ORDER_DATE DATE NOT NULL,
        CUST INTEGER NOT NULL,
         REP INTEGER,
         MFR CHAR(3) NOT NULL,
     PRODUCT CHAR(5) NOT NULL,
         QTY INTEGER NOT NULL,
      AMOUNT DECIMAL(9,2) NOT NULL,
PRIMARY KEY (ORDER_NUM),
CONSTRAINT PLACEDBY FOREIGN KEY (CUST)
REFERENCES CUSTOMERS(CUST_NUM)
ON DELETE CASCADE,
CONSTRAINT TAKENBY FOREIGN KEY (REP)
REFERENCES SALESREPS(EMPL_NUM),
CONSTRAINT ISFOR FOREIGN KEY (MFR, PRODUCT)
REFERENCES PRODUCTS(MFR_ID, PRODUCT_ID));

ALTER TABLE OFFICES
  ADD CONSTRAINT HASMGR
  FOREIGN KEY (MGR) REFERENCES SALESREPS(EMPL_NUM);

---
---  Inserts for sample schema
---

---
---  PRODUCTS
---
INSERT INTO PRODUCTS VALUES('REI','2A45C','Ratchet Link',79.00,210);
INSERT INTO PRODUCTS VALUES('ACI','4100Y','Widget Remover',2750.00,25);
INSERT INTO PRODUCTS VALUES('QSA','XK47 ','Reducer',355.00,38);
INSERT INTO PRODUCTS VALUES('BIC','41627','Plate',180.00,0);
INSERT INTO PRODUCTS VALUES('IMM','779C ','900-LB Brace',1875.00,9);
INSERT INTO PRODUCTS VALUES('ACI','41003','Size 3 Widget',107.00,207);
INSERT INTO PRODUCTS VALUES('ACI','41004','Size 4 Widget',117.00,139);
INSERT INTO PRODUCTS VALUES('BIC','41003','Handle',652.00,3);
INSERT INTO PRODUCTS VALUES('IMM','887P ','Brace Pin',250.00,24);
INSERT INTO PRODUCTS VALUES('QSA','XK48 ','Reducer',134.00,203);
INSERT INTO PRODUCTS VALUES('REI','2A44L','Left Hinge',4500.00,12);
INSERT INTO PRODUCTS VALUES('FEA','112  ','Housing',148.00,115);
INSERT INTO PRODUCTS VALUES('IMM','887H ','Brace Holder',54.00,223);
INSERT INTO PRODUCTS VALUES('BIC','41089','Retainer',225.00,78);
INSERT INTO PRODUCTS VALUES('ACI','41001','Size 1 Wiget',55.00,277);
INSERT INTO PRODUCTS VALUES('IMM','775C ','500-lb Brace',1425.00,5);
INSERT INTO PRODUCTS VALUES('ACI','4100Z','Widget Installer',2500.00,28);
INSERT INTO PRODUCTS VALUES('QSA','XK48A','Reducer',177.00,37);
INSERT INTO PRODUCTS VALUES('ACI','41002','Size 2 Widget',76.00,167);
INSERT INTO PRODUCTS VALUES('REI','2A44R','Right Hinge',4500.00,12);
INSERT INTO PRODUCTS VALUES('IMM','773C ','300-lb Brace',975.00,28);
INSERT INTO PRODUCTS VALUES('ACI','4100X','Widget Adjuster',25.00,37);
INSERT INTO PRODUCTS VALUES('FEA','114  ','Motor Mount',243.00,15);
INSERT INTO PRODUCTS VALUES('IMM','887X ','Brace Retainer',475.00,32);
INSERT INTO PRODUCTS VALUES('REI','2A44G','Hinge Pin',350.00,14);


---
---  OFFICES
---
INSERT INTO OFFICES VALUES(22,'Denver','Western',null,300000.00,186042.00);
INSERT INTO OFFICES VALUES(11,'New York','Eastern',null,575000.00,692637.00);
INSERT INTO OFFICES VALUES(12,'Chicago','Eastern',null,800000.00,735042.00);
INSERT INTO OFFICES VALUES(13,'Atlanta','Eastern',null,350000.00,367911.00);
INSERT INTO OFFICES VALUES(21,'Los Angeles','Western',null,725000.00,835915.00);


---
---  SALESREPS
---
INSERT INTO SALESREPS VALUES (106,'Sam Clark',52,11,'VP Sales','2006-06-14',null,275000.00,299912.00);
INSERT INTO SALESREPS VALUES (109,'Mary Jones',31,11,'Sales Rep','2007-10-12',106,300000.00,392725.00);
INSERT INTO SALESREPS VALUES (104,'Bob Smith',33,12,'Sales Mgr','2005-05-19',106,200000.00,142594.00);
INSERT INTO SALESREPS VALUES (108,'Larry Fitch',62,21,'Sales Mgr','2007-10-12',106,350000.00,361865.00);
INSERT INTO SALESREPS VALUES (105,'Bill Adams',37,13,'Sales Rep','2006-02-12',104,350000.00,367911.00);
INSERT INTO SALESREPS VALUES (102,'Sue Smith',48,21,'Sales Rep','2004-12-10',108,350000.00,474050.00);
INSERT INTO SALESREPS VALUES (101,'Dan Roberts',45,12,'Sales Rep','2004-10-20',104,300000.00,305673.00);
INSERT INTO SALESREPS VALUES (110,'Tom Snyder',41,null,'Sales Rep','2008-01-13',101,null,75985.00);
INSERT INTO SALESREPS VALUES (103,'Paul Cruz',29,12,'Sales Rep','2005-03-01',104,275000.00,286775.00);
INSERT INTO SALESREPS VALUES (107,'Nancy Angelli',49,22,'Sales Rep','2006-11-14',108,300000.00,186042.00);


---
---   OFFICE MANAGERS
---
UPDATE OFFICES SET MGR=108 WHERE OFFICE=22;
UPDATE OFFICES SET MGR=106 WHERE OFFICE=11;
UPDATE OFFICES SET MGR=104 WHERE OFFICE=12;
UPDATE OFFICES SET MGR=105 WHERE OFFICE=13;
UPDATE OFFICES SET MGR=108 WHERE OFFICE=21;

---
---   CUSTOMERS
---
INSERT INTO CUSTOMERS VALUES(2111,'JCP Inc.',103,50000.00);
INSERT INTO CUSTOMERS VALUES(2102,'First Corp.',101,65000.00);
INSERT INTO CUSTOMERS VALUES(2103,'Acme Mfg.',105,50000.00);
INSERT INTO CUSTOMERS VALUES(2123,'Carter \& Sons',102,40000.00);
INSERT INTO CUSTOMERS VALUES(2107,'Ace International',110,35000.00);
INSERT INTO CUSTOMERS VALUES(2115,'Smithson Corp.',101,20000.00);
INSERT INTO CUSTOMERS VALUES(2101,'Jones Mfg.',106,65000.00);
INSERT INTO CUSTOMERS VALUES(2112,'Zetacorp',108,50000.00);
INSERT INTO CUSTOMERS VALUES(2121,'QMA Assoc.',103,45000.00);
INSERT INTO CUSTOMERS VALUES(2114,'Orion Corp.',102,20000.00);
INSERT INTO CUSTOMERS VALUES(2124,'Peter Brothers',107,40000.00);
INSERT INTO CUSTOMERS VALUES(2108,'Holm \& Landis',109,55000.00);
INSERT INTO CUSTOMERS VALUES(2117,'J.P. Sinclair',106,35000.00);
INSERT INTO CUSTOMERS VALUES(2122,'Three Way Lines',105,30000.00);
INSERT INTO CUSTOMERS VALUES(2120,'Rico Enterprises',102,50000.00);
INSERT INTO CUSTOMERS VALUES(2106,'Fred Lewis Corp.',102,65000.00);
INSERT INTO CUSTOMERS VALUES(2119,'Solomon Inc.',109,25000.00);
INSERT INTO CUSTOMERS VALUES(2118,'Midwest Systems',108,60000.00);
INSERT INTO CUSTOMERS VALUES(2113,'Ian \& Schmidt',104,20000.00);
INSERT INTO CUSTOMERS VALUES(2109,'Chen Associates',103,25000.00);
INSERT INTO CUSTOMERS VALUES(2105,'AAA Investments',101,45000.00);

---
---  ORDERS
---
INSERT INTO ORDERS VALUES (112961,'2007-12-17',2117,106,'REI','2A44L',7,31500.00);
INSERT INTO ORDERS VALUES (113012,'2008-01-11',2111,105,'ACI','41003',35,3745.00);
INSERT INTO ORDERS VALUES (112989,'2008-01-03',2101,106,'FEA','114',6,1458.00);
INSERT INTO ORDERS VALUES (113051,'2008-02-10',2118,108,'QSA','XK47',4,1420.00);
INSERT INTO ORDERS VALUES (112968,'2007-10-12',2102,101,'ACI','41004',34,3978.00);
INSERT INTO ORDERS VALUES (113036,'2008-01-30',2107,110,'ACI','4100Z',9,22500.00);
INSERT INTO ORDERS VALUES (113045,'2008-02-02',2112,108,'REI','2A44R',10,45000.00);
INSERT INTO ORDERS VALUES (112963,'2007-12-17',2103,105,'ACI','41004',28,3276.00);
INSERT INTO ORDERS VALUES (113013,'2008-01-14',2118,108,'BIC','41003',1,652.00);
INSERT INTO ORDERS VALUES (113058,'2008-02-23',2108,109,'FEA','112',10,1480.00);
INSERT INTO ORDERS VALUES (112997,'2008-01-08',2124,107,'BIC','41003',1,652.00);
INSERT INTO ORDERS VALUES (112983,'2007-12-27',2103,105,'ACI','41004',6,702.00);
INSERT INTO ORDERS VALUES (113024,'2008-01-20',2114,108,'QSA','XK47',20,7100.00);
INSERT INTO ORDERS VALUES (113062,'2008-02-24',2124,107,'FEA','114',10,2430.00);
INSERT INTO ORDERS VALUES (112979,'2007-10-12',2114,102,'ACI','4100Z',6,15000.00);
INSERT INTO ORDERS VALUES (113027,'2008-01-22',2103,105,'ACI','41002',54,4104.00);
INSERT INTO ORDERS VALUES (113007,'2008-01-08',2112,108,'IMM','773C',3,2925.00);
INSERT INTO ORDERS VALUES (113069,'2008-03-02',2109,107,'IMM','775C',22,31350.00);
INSERT INTO ORDERS VALUES (113034,'2008-01-29',2107,110,'REI','2A45C',8,632.00);
INSERT INTO ORDERS VALUES (112992,'2007-11-04',2118,108,'ACI','41002',10,760.00);
INSERT INTO ORDERS VALUES (112975,'2007-10-12',2111,103,'REI','2A44G',6,2100.00);
INSERT INTO ORDERS VALUES (113055,'2008-02-15',2108,101,'ACI','4100X',6,150.00);
INSERT INTO ORDERS VALUES (113048,'2008-02-10',2120,102,'IMM','779C',2,3750.00);
INSERT INTO ORDERS VALUES (112993,'2007-01-04',2106,102,'REI','2A45C',24,1896.00);
INSERT INTO ORDERS VALUES (113065,'2008-02-27',2106,102,'QSA','XK47',6,2130.00);
INSERT INTO ORDERS VALUES (113003,'2008-01-25',2108,109,'IMM','779C',3,5625.00);
INSERT INTO ORDERS VALUES (113049,'2008-02-10',2118,108,'QSA','XK47',2,776.00);
INSERT INTO ORDERS VALUES (112987,'2007-12-31',2103,105,'ACI','4100Y',11,27500.00);
INSERT INTO ORDERS VALUES (113057,'2008-02-18',2111,103,'ACI','4100X',24,600.00);
INSERT INTO ORDERS VALUES (113042,'2008-02-20',2113,101,'REI','2A44R',5,22500.00);





USE [Matsuk_7]
GO

--Транзакции в T-SQL
select * from CUSTOMERS;
--1. Разработать скрипт, демонстрирующий работу в режиме неявной транзакции.

--Неявная транзакция - задает любую отдельную инструкцию INSERT, UPDATE или DELETE как единицу транзакции.
--устанавливаем неявную транзакцию 

---------------CASE1------------------
CREATE TABLE WEATHER (w varchar(10) unique);

DECLARE @flag int = 2;  --для фиксации данных д.б. 1
SET IMPLICIT_TRANSACTIONS ON;
--INSERT WEATHER VALUES ('Sun'), ('Rain'), ('Wind');
INSERT WEATHER VALUES ('Snow');
IF @flag = 1 COMMIT ELSE ROLLBACK;  -- выполняется вставка в таблицу если значение флага 1

delete from weather where w = 'Snow'; --удаляем данные

SELECT * FROM WEATHER; --проверяем


-------------------CASE2----------------------
SET IMPLICIT_TRANSACTIONS ON;

SELECT @@TRANCOUNT
	AS 'Number of transactions';

DECLARE @point int = 1;
--INSERT INTO PRODUCTS VALUES ('WWW', '333WW', 'Towel', 21.00, 200);
INSERT INTO PRODUCTS VALUES ('WWW', '333XX', 'Towel', 21.00, 200);

IF @point = 1 COMMIT ELSE ROLLBACK;

--DELETE FROM PRODUCTS WHERE PRODUCT_ID = '333WW';

SELECT @@TRANCOUNT
	AS 'Number of transactions';

SELECT * FROM PRODUCTS;



------------------CASE3------------------------
SET IMPLICIT_TRANSACTIONS ON;

--проверяем, что транзакция еще не началась
SELECT @@TRANCOUNT
	AS 'Number of transactions'

--вставляем данные
INSERT INTO CUSTOMERS VALUES (2000, 'Matsuk Fam.', 101, 80000.00);
--DELETE FROM CUSTOMERS WHERE CUST_NUM = 2000
SELECT @@TRANCOUNT
	AS 'Number of transactions'

--проверяем что транзакция не закончилась
WHILE (@@TRANCOUNT > 0) 
--все транзакции нужно закомитить, пока их число не будет равным 0
COMMIT TRANSACTION;

--смотрим, что транзакция закончилась
SELECT @@TRANCOUNT
	AS 'Number of transactions'

--проверяем
SELECT * FROM CUSTOMERS;




------------------------2. Разработать скрипт, демонстрирующий свойства ACID явной транзакции.
--В блоке CATCH предусмотреть выдачу соответствующих сообщений об ошибках.

--XACT_STATE = 1 - транзакция фиксирована (закомичена)
--XACT_STATE = -1 - транзакция не фиксирована и должна быть откатана (rollback)
--XACT_STATE = 0 - нет транзакций, операторы rollback и commit сгенерируют ошибку
BEGIN TRY
	BEGIN TRANSACTION; 
	SELECT @@TRANCOUNT AS 'Number of transactions'
	--delete from CUSTOMERS WHERE CUST_NUM = 2100;
	--INSERT INTO CUSTOMERS VALUES (2125, 'Matsuk Fam.', 101, 20000.00);
	UPDATE CUSTOMERS
	SET COMPANY = 'Matsuk Family' WHERE CUST_NUM = 2125
	ROLLBACK TRANSACTION
	COMMIT TRANSACTION 
END TRY
BEGIN CATCH
	--если транзакция не закомичена и не завершена
	IF (XACT_STATE()) = -1
	BEGIN
		PRINT 'Транзакция не завершена ' + 'Rollback transaction.'
		ROLLBACK TRANSACTION;
	END;

	--если транзакция активна 
	IF(XACT_STATE()) = 1
	BEGIN
		PRINT 'Транзакция завершена ' + 'Commit transaction.'
		COMMIT TRANSACTION;
	END;

	IF(XACT_STATE()) = 0
	BEGIN
		PRINT 'Транзакций нет'
	END;
END CATCH;


SELECT @@TRANCOUNT
	AS 'Number of transactions'

SELECT * FROM CUSTOMERS;



--------------------CASE2------------------
--АТОМАРНОСТЬ явной транзакции - выполняются все операторы или ни один
BEGIN TRY
	BEGIN TRANSACTION
		DELETE WEATHER WHERE W = 'Sun';
		INSERT WEATHER VALUES('Rain');
		INSERT WEATHER VALUES('Rain');
	COMMIT TRAN
END TRY

BEGIN CATCH
PRINT 'There is an error: ' + 
	CASE
		WHEN error_number() = 2627 THEN 'All lines should be unique!'
		--WHEN error_number() = 2628 THEN 'All lines should be unique!'
		ELSE 'Error: ' + CAST(error_number() AS varchar(5)) + error_message()
	END;
	IF @@TRANCOUNT > 0 PRINT @@TRANCOUNT ROLLBACK TRAN;
END CATCH

SELECT * FROM WEATHER;

--СОГЛАСОВАННОСТЬ явной транзакции - в результате выполнения транзакции база данных не будет содержать несогласованных данных. 
--Иными словами, выполняемые транзакцией трансформации данных переводят базу данных из одного согласованного состояния в другое.
--Например, при переводе денег с одного счёта на другой, в случае, если деньги ушли с одного счёта, они должны прийти на другой.

--ИЗОЛИРОВАННОСТЬ - отделяет все параллельные транзакции друг от друга.
--Это значит, что активная транзакция не может видеть модификации данных в параллельной или незавершенной транзакции
--т.е. её результат не должен зависеть от выполнения других параллельных транзакций


--ДОЛГОВЕЧНОСТЬ - обеспечивает сохраняемость данных,
--если мы получили подтверждение о выполнении транзакции, то изменения, вызванные этой транзакцией не должны быть отменены из-за сбоя системы (например, отключение электропитания).

--3. Разработать скрипт, демонстрирующий применение оператора SAVETRAN.
--В блоке CATCH предусмотреть выдачу соответствующих сообщений об ошибках.
--как вывести ошибки?!!!!!
SELECT * FROM CUSTOMERS

BEGIN TRY
	SELECT @@TRANCOUNT AS 'Number of transactions'  -- 0
	--начинаем транзакцию
	BEGIN TRANSACTION

	SELECT @@TRANCOUNT AS 'Number of transactions'  -- 2
	--вставляем строку данных в таблицу, транзакция не завершена
	INSERT INTO CUSTOMERS VALUES(2127, 'IBA', 101, 15000.00);
	DELETE CUSTOMERS WHERE COMPANY = 'IBA';
	--SELECT @@TRANCOUNT AS 'Number of transactions'  -- 2
	--SAVE TRAN не фиксирует и не откатывает, данные еще не зафиксированы
	--но здесь оставляем точку, которая говорит, что можем вернуться к ней
	--транзакция не завершена
	SAVE TRAN transact_insert

	SELECT @@TRANCOUNT AS 'Number of transactions'  -- 2
	--транзакция не завершена
	UPDATE CUSTOMERS SET COMPANY = 'IBA' WHERE CUST_NUM = 2126

	SELECT @@TRANCOUNT AS 'Number of transactions'  -- 2
	--откатываемся к точке SAVE TRAN, а там у нас получается только insert (update тут нет)
	ROLLBACK TRANSACTION transact_insert

	SELECT @@TRANCOUNT AS 'Number of transactions'  -- 2
	--фиксируем транзакцию
	--и соответственно 	UPDATE CUSTOMERS SET COMPANY = 'IBA' WHERE CUST_NUM = 2126 не будет зафиксировано
	COMMIT TRANSACTION 

	SELECT @@TRANCOUNT AS 'Number of transactions'  --1
END TRY

BEGIN CATCH
PRINT 'Error: ' +
	CASE 
		WHEN @@TRANCOUNT > 0 THEN 'Транзакция не завершена.' 
		ELSE 'Транзакция завершена.'
	END;
	IF @@TRANCOUNT > 0 
		PRINT @@TRANCOUNT  -- 1
		PRINT 'Транзакция не завершена.'
		ROLLBACK TRAN;
		SELECT @@TRANCOUNT AS 'Number of transactions';  -- 0

	IF @@TRANCOUNT = 0
		PRINT @@TRANCOUNT 
		PRINT 'Транзакция завершена.'
		COMMIT TRANSACTION;
END CATCH



--case2
BEGIN TRY
	BEGIN TRANSACTION T
	UPDATE CUSTOMERS
	SET COMPANY = 'IBB' WHERE CUST_NUM = 2126
	SAVE TRAN update_transact
	--DELETE FROM CUSTOMERS WHERE CUST_NUM = 2128
	UPDATE CUSTOMERS
	SET COMPANY = 'Matsuk ' WHERE CUST_NUM = 2127
	ROLLBACK TRANSACTION update_transact
	COMMIT TRANSACTION T
END TRY

BEGIN CATCH
PRINT 'Error: ' +
	CASE
		WHEN @@TRANCOUNT > 0 THEN 'Транзакция не завершена.'
		ELSE 'Транзакция завершена'
	END;
	IF @@TRANCOUNT > 0 
		PRINT @@TRANCOUNT  -- 1
		PRINT 'Транзакция не завершена.'
		ROLLBACK TRAN;
		SELECT @@TRANCOUNT AS 'Number of transactions';  -- 0

	IF @@TRANCOUNT = 0
		PRINT @@TRANCOUNT 
		PRINT 'Транзакция завершена.'
		COMMIT TRANSACTION;
END CATCH


SELECT * FROM CUSTOMERS;


--4. Разработать два скрипта А и В. Продемонстрировать неподтвержденное, неповторяющееся и фантомное чтение. 
--Показать усиление уровней изолированности.
				--ГРЯЗНОЕ чтение
--грязное чтение - происходит чтение несуществующих данных или потеря модификации данных
				--НЕПОВТОРЯЕМОЕ чтение:
--один процесс считывает данные несколько раз, а другой процесс изменяет эти данные между двумя операциями чтения первого процесса.
--Значения двух чтений будут разными.
				--ФАНТОМНОЕ чтение:
--Последовательные операции чтения могут возратить разные значения.
--Считывание разного числа строк при каждом чтении.
--Возникают доп.фантомные строки, которые вставляются другими транзакциями.

				--НЕПОДТВЕРЖДЕННОЕ чтение (READ UNCOMMITTED):
--Не изолирует операции чтения других транзакций.
--Транзакция не задает и не признает блокировок.
--Допускает проблемы: грязное чтение, неповторяемое чтение, фантомное чтение.

--READ UNCOMMITTED
--начинаем транзакцию
BEGIN TRANSACTION C1
SELECT * FROM CUSTOMERS;


--производим операции с транзакцией
	UPDATE CUSTOMERS
		SET CREDIT_LIMIT =CREDIT_LIMIT + 10 WHERE CUST_NUM = 2126;
	UPDATE CUSTOMERS
	SET CREDIT_LIMIT = CREDIT_LIMIT + 15 WHERE CUST_NUM = 2126;
	INSERT INTO CUSTOMERS VALUES(2128, 'IRKA', 101, 25000.00);
	
--откат изменений транзакции С1
ROLLBACK TRANSACTION 
SELECT * FROM CUSTOMERS
WHERE CUST_NUM = 2126;
COMMIT TRANSACTION C1;

	--READ COMMITTED
--начинаем параллельно две транзакции
--case1
BEGIN TRANSACTION C1
SELECT * FROM CUSTOMERS;
--производим операции с транзакцией
	UPDATE CUSTOMERS
		SET CREDIT_LIMIT = CREDIT_LIMIT + 10 WHERE CUST_NUM = 2127;
	UPDATE CUSTOMERS
		SET CREDIT_LIMIT = CREDIT_LIMIT + 15 WHERE CUST_NUM = 2127;
		INSERT INTO CUSTOMERS VALUES(2126, 'ISKRA', 101, 25000.00);

--комит всех транзакций 
COMMIT TRANSACTION C1;


	--Неповторяющееся чтение
--начинаем параллельно две транзакции
BEGIN TRANSACTION C1
SELECT * FROM CUSTOMERS;
--пробуем обновить данные и перейти к другой транзакции где также пробуем обновить данные
	UPDATE CUSTOMERS
		SET CREDIT_LIMIT = CREDIT_LIMIT + 10 WHERE CUST_NUM > 2124;
	DELETE FROM CUSTOMERS WHERE CUST_NUM = 2126;
	COMMIT TRANSACTION C1


---------------------------5. Разработать скрипт, демонстрирующий свойства вложенных транзакций.
SELECT COUNT(*) '1', @@TRANCOUNT 'TRANCOUNT' FROM CUSTOMERS;
--начинаем транзакцию A1
BEGIN TRANSACTION A1
SELECT COUNT(*) '2', @@TRANCOUNT 'TRANCOUNT' FROM CUSTOMERS;
--вставляем строку данных в таблицу CUSTOMERS
INSERT INTO CUSTOMERS VALUES (2130, 'WWW1', 101, 35000.00);
SELECT COUNT(*) '3', @@TRANCOUNT 'TRANCOUNT' FROM CUSTOMERS;
--DELETE CUSTOMERS WHERE CUST_NUM = 2130;

--начинаем транзакцию А2
BEGIN TRANSACTION A2
SELECT COUNT(*) '4', @@TRANCOUNT 'TRANCOUNT' FROM CUSTOMERS;
--обновить данные
UPDATE CUSTOMERS
	SET COMPANY = 'QQQ1' WHERE CUST_NUM = 2130;
SELECT COUNT(*) '5', @@TRANCOUNT 'TRANCOUNT' FROM CUSTOMERS;

COMMIT TRANSACTION A2
SELECT COUNT(*) '6', @@TRANCOUNT 'TRANCOUNT' FROM CUSTOMERS;
--запоминаем изменения
COMMIT TRANSACTION A1
SELECT COUNT(*) '7', @@TRANCOUNT 'TRANCOUNT' FROM CUSTOMERS;

--комитим все транзакции, пока количество транзакций не станет равным 0
WHILE (@@TRANCOUNT > 0) COMMIT TRANSACTION;

--проверяем что транзакция закончилась
SELECT COUNT(*) '8', @@TRANCOUNT 'TRANCOUNT' FROM CUSTOMERS;

--выбираем все данные из таблицы CUSTOMERS
SELECT * FROM CUSTOMERS;


     -----------CASE2----------------

SELECT COUNT(*) '1', @@TRANCOUNT 'TRANCOUNT' FROM CUSTOMERS;
BEGIN TRANSACTION A;

INSERT INTO CUSTOMERS VALUES(2127, 'ISKRA', 102, 35000.00);
SELECT COUNT(*) '2', @@TRANCOUNT 'TRANCOUNT' FROM CUSTOMERS;
--DELETE CUSTOMERS WHERE COMPANY = 'ISKRA';

BEGIN TRANSACTION B;
DELETE CUSTOMERS WHERE CUST_NUM = 2127;
SELECT COUNT(*) '3', @@TRANCOUNT 'TRANCOUNT' FROM CUSTOMERS;

COMMIT TRANSACTION B;
SELECT COUNT(*) '4', @@TRANCOUNT 'TRANCOUNT' FROM CUSTOMERS;

INSERT INTO CUSTOMERS VALUES(2127, 'ISKRA', 102, 35000.00);
SELECT COUNT(*) '5', @@TRANCOUNT 'TRANCOUNT' FROM CUSTOMERS;

COMMIT TRANSACTION A;
SELECT COUNT(*) '6', @@TRANCOUNT 'TRANCOUNT' FROM CUSTOMERS;






--READ UNCOMMITTED

--2
BEGIN TRAN -- ОТКРЫВАЕМ ПАРАЛЛЕЛЬНУЮ ТРАНЗАКЦИЮ
DELETE FROM OFFICES WHERE OFFICE = 27 --удаляем строку из таблицы

--4
ROLLBACK TRAN --откатываем транзакцию

--7
BEGIN TRAN --открываем параллельную транзакцию
DELETE FROM OFFICES WHERE OFFICE = 26 --удаляем строку из таблицы

--9
ROLLBACK TRAN --откатываем транзакцию

--12
BEGIN TRAN --открываем параллельную транзакцию
DELETE FROM OFFICES WHERE OFFICE = 26 --удаляем строку из таблицы
COMMIT TRAN

--15
BEGIN TRAN --открываем параллельную транзакцию
DELETE FROM OFFICES WHERE OFFICE = 26 --удаляем строку из таблицы, результат - ожидание

--17
COMMIT TRAN --завершаем транзакцию

--19
BEGIN TRAN 
INSERT INTO OFFICES VALUES (31, 'Minsk', 'Eastern', 108, 75500.00, 84000.00); --строк обработано: 1
COMMIT TRAN --завершаем транзакцию

--22
BEGIN TRAN 
INSERT INTO OFFICES VALUES (29, 'Gomel', 'Eastern', 108, 71000.00, 86000.00); --ожидание

--24
COMMIT TRAN

--25
