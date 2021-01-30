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


USE [Matsuk_8]
GO

-------------------------------Триггеры в T-SQL.--------------------------------

--Триггер - специальный вид хранимых процедур, выполняющихся при событиях базы данных--DML-триггеры - создаются для таблицы или представления, реагируют на события INSERT, DELETE, UPDATE:	---AFTER-триггеры	---INSTEAD OF-триггеры--DDL-триггеры – создаются для сервера или БД, реагируют на события сервера или БД:
	---триггеры уровня сервера (ALLSERVER)	---триггеры уровня базы данных (DATABASE)

--1.Разработать следующие DML триггеры и продемонстрировать работоспособность триггеров: 
--1.1.При добавлении нового офиса добавлять строку с данными офиса в таблицу Audit.
CREATE TABLE AUDIT
		(OFFICE INT NOT NULL,
        CITY VARCHAR(15) NOT NULL,
		REGION VARCHAR(10) NOT NULL,
        MGR INT,
		TARGET DECIMAL(9,2),
        SALES DECIMAL(9,2) NOT NULL,
		OPERATION VARCHAR(15) NOT NULL);


SELECT * FROM AUDIT;
--DROP TABLE AUDIT

CREATE TRIGGER TriggerUpdate
ON OFFICES 
AFTER INSERT 
AS
BEGIN
	DECLARE @office int, @city varchar(15), @region varchar(10),
			@mgr int, @target decimal(9,2), @sales decimal(9,2);

	SELECT @office = (SELECT OFFICE FROM inserted);
	SELECT @city = (SELECT CITY FROM inserted);
	SELECT @region = (SELECT REGION FROM inserted);
	SELECT @mgr = (SELECT MGR FROM inserted);
	SELECT @target = (SELECT TARGET FROM inserted);
	SELECT @sales = (SELECT SALES FROM inserted);

	INSERT INTO AUDIT VALUES (@office, @city, @region, @mgr, @target, @sales, 'INSERT');
	RETURN;
END;

INSERT INTO OFFICES VALUES (30, 'Kiev', 'Eastern', 104, 850000.00, 800000.00);
INSERT INTO OFFICES VALUES (31, 'Livov', 'Eastern', 105, 650000.00, 700000.00);
INSERT INTO OFFICES VALUES (32, 'Brest', 'Western', 104, 550000.00, 430000.00);
--INSERT INTO OFFICES VALUES (33, 'Pinsk', 'Eastern', 105, 530000.00, 520000.00);
--DELETE OFFICES WHERE CITY = 'Kiev';
SELECT * FROM AUDIT;
SELECT * FROM OFFICES

DROP TRIGGER TriggerUpdate


--1.2.При обновлении данных офиса добавлять строку с предыдущими данными офиса в таблицу Audit.
CREATE TRIGGER TriggerUpdateOffice
ON OFFICES
AFTER UPDATE
AS
BEGIN
	DECLARE @office int, @city varchar(15), @region varchar(10),
			@mgr int, @target decimal(9,2), @sales decimal(9,2);

	SELECT @office = (SELECT OFFICE FROM inserted);
	SELECT @city = (SELECT CITY FROM inserted);
	SELECT @region = (SELECT REGION FROM inserted);
	SELECT @mgr = (SELECT MGR FROM inserted);
	SELECT @target = (SELECT TARGET FROM inserted);
	SELECT @sales = (SELECT SALES FROM inserted);

	INSERT INTO AUDIT VALUES (@office, @city, @region, @mgr, @target, @sales, 'UPDATE');
	RETURN;
END;
UPDATE OFFICES SET SALES = SALES * 0.5 WHERE CITY = 'Kiev';

--INSERT INTO OFFICES VALUES (32, 'Brest', 'Western', 104, 550000.00, 430000.00);
--INSERT INTO OFFICES VALUES (33, 'Pinsk', 'Eastern', 105, 530000.00, 520000.00);

SELECT * FROM AUDIT;
SELECT * FROM OFFICES

DROP TRIGGER TriggerUpdateOffice

--1.3.При удалении данных о офиса добавлять строку с данными офиса в таблицу Audit. 
CREATE TRIGGER TriggerDeleteOffice
ON OFFICES
AFTER DELETE
AS
BEGIN
	DECLARE @office int, @city varchar(15), @region varchar(10),
			@mgr int, @target decimal(9,2), @sales decimal(9,2);

	SET @office = (SELECT OFFICE FROM deleted);
	SET @city = (SELECT CITY FROM deleted);
	SET @region = (SELECT REGION FROM deleted);
	SET @mgr = (SELECT MGR FROM deleted);
	SET @target = (SELECT TARGET FROM deleted);
	SET @sales = (SELECT SALES FROM deleted);

	INSERT INTO AUDIT VALUES (@office, @city, @region, @mgr, @target, @sales, 'DELETE');
	RETURN;
END;

DELETE OFFICES WHERE CITY = 'Livov';

SELECT * FROM AUDIT;
SELECT * FROM OFFICES

DROP TRIGGER TriggerDeleteOffice


--2.Разработать скрипт, который демонстрирует, что проверка ограничения целостности выполняется до срабатывания AFTER-триггера.

--------------CASE1-------------
CREATE TRIGGER TEST_TRIGGER
ON OFFICES
AFTER INSERT
AS
 BEGIN
    IF (select SALES FROM inserted) < 400000.00
        ROLLBACK TRAN
      PRINT('Продажи меньше 400000.00 недопустимы ')  
 END
 
INSERT INTO OFFICES VALUES (50, 'Brest', 'Western', 104, 350000.00, 430000.00);
--успешно
INSERT INTO OFFICES VALUES (51, 'Pinsk', 'Eastern', 105, 430000.00, 350000.00);
--ошибка!

SELECT * FROM OFFICES

DROP TRIGGER TEST_TRIGGER


-----------CASE2---------------
CREATE TABLE CHECK_INTEGRITY 
	(ID INT PRIMARY KEY,
	OPERATION VARCHAR(20)
	);

CREATE TABLE CHECK_INTEGRITY_COPY
	(ID INT PRIMARY KEY,
	OPERATION VARCHAR(20)
	);
--DROP TABLE CHECK_INTEGRITY;
--DROP TABLE CHECK_INTEGRITY_COPY;

select * from CHECK_INTEGRITY 
SELECT * FROM CHECK_INTEGRITY_COPY


CREATE TRIGGER Insert_Trigger
ON CHECK_INTEGRITY
AFTER INSERT
AS
begin
	DECLARE @id int, @operation varchar(20);
	SELECT @id = (SELECT ID FROM inserted)
	SELECT @operation = (SELECT OPERATION FROM inserted)

	INSERT INTO CHECK_INTEGRITY_COPY values (@id, @operation);
end;

INSERT INTO CHECK_INTEGRITY VALUES (35, 'insert');
INSERT INTO CHECK_INTEGRITY VALUES (36, 'insert');

drop TRIGGER Insert_Trigger



--3. Создать 3 триггера, срабатывающих на событие удаления в таблице и упорядочить их.
--создаем новую таблицу
CREATE TABLE TRIGGER_PRIORITY
		(OFFICE INT NOT NULL,
        CITY VARCHAR(15) NOT NULL,
		REGION VARCHAR(10) NOT NULL,
        MGR INT,
		TARGET DECIMAL(9,2),
        SALES DECIMAL(9,2) NOT NULL,
		OPERATION VARCHAR(15) NOT NULL);
GO

--DROP TABLE TRIGGER_PRIORITY;
--создаем 3 триггера удаления
CREATE TRIGGER DeleteTrigg1
ON OFFICES
AFTER DELETE
AS
BEGIN
	DECLARE @office int, @city varchar(15), @region varchar(10),
			@mgr int, @target decimal(9,2), @sales decimal(9,2);
	PRINT 'DELETE1'
	SET @office = (SELECT OFFICE FROM deleted);
	SET @city = (SELECT CITY FROM deleted);
	SET @region = (SELECT REGION FROM deleted);
	SET @mgr = (SELECT MGR FROM deleted);
	SET @target = (SELECT TARGET FROM deleted);
	SET @sales = (SELECT SALES FROM deleted);
	INSERT INTO TRIGGER_PRIORITY VALUES (@office, @city, @region, @mgr, @target, @sales, 'DELETE');
	RETURN;
END;


CREATE TRIGGER DeleteTrigg2
ON OFFICES
AFTER DELETE
AS
BEGIN
	DECLARE @office int, @city varchar(15), @region varchar(10),
			@mgr int, @target decimal(9,2), @sales decimal(9,2);
	PRINT 'DELETE2'
	SET @office = (SELECT OFFICE FROM deleted);
	SET @city = (SELECT CITY FROM deleted);
	SET @region = (SELECT REGION FROM deleted);
	SET @mgr = (SELECT MGR FROM deleted);
	SET @target = (SELECT TARGET FROM deleted);
	SET @sales = (SELECT SALES FROM deleted);

	INSERT INTO TRIGGER_PRIORITY VALUES (@office, @city, @region, @mgr, @target, @sales, 'DELETE');
	RETURN;
END;

CREATE TRIGGER DeleteTrigg3
ON OFFICES
AFTER DELETE
AS
BEGIN
	DECLARE @office int, @city varchar(15), @region varchar(10),
			@mgr int, @target decimal(9,2), @sales decimal(9,2);
	PRINT 'DELETE3'
	SET @office = (SELECT OFFICE FROM deleted);
	SET @city = (SELECT CITY FROM deleted);
	SET @region = (SELECT REGION FROM deleted);
	SET @mgr = (SELECT MGR FROM deleted);
	SET @target = (SELECT TARGET FROM deleted);
	SET @sales = (SELECT SALES FROM deleted);

	INSERT INTO TRIGGER_PRIORITY VALUES (@office, @city, @region, @mgr, @target, @sales, 'DELETE');
	RETURN;
END;


EXEC sp_settriggerorder @TRIGGERNAME = 'DeleteTrigg3', @ORDER = 'FIRST', @STMTTYPE = 'DELETE';
EXEC sp_settriggerorder @TRIGGERNAME = 'DeleteTrigg1', @ORDER = 'LAST', @STMTTYPE = 'DELETE';
EXEC sp_settriggerorder @TRIGGERNAME = 'DeleteTrigg2', @ORDER = 'NONE', @STMTTYPE = 'DELETE';
--INSERT INTO OFFICES VALUES (32, 'Brest', 'Western', 104, 550000.00, 430000.00);
--INSERT INTO OFFICES VALUES (34, 'Pinsk', 'Eastern', 105, 530000.00, 520000.00);
DELETE OFFICES WHERE CITY = 'Brest';
--DELETE OFFICES WHERE CITY = 'Pinsk';
SELECT * FROM TRIGGER_PRIORITY;
SELECT* FROM OFFICES

DROP TRIGGER DeleteTrigg1
DROP TRIGGER DeleteTrigg2
DROP TRIGGER DeleteTrigg3
GO

--4.Разработать скрипт, демонстрирующий, что AFTER-триггер является частью транзакции, в рамках которого выполняется оператор, активизировавший триггер.
-- Триггер выполняется как неявно определенная транзакция, поэтому внутри 
--триггера допускается применение команд управления транзакциями. 
--В частности, при обнаружении нарушения ограничений целостности для 
--прерывания выполнения триггера и отмены всех изменений, которые 
--пытался выполнить пользователь, необходимо использовать команду ROLLBACK TRANSACTION. 
--Для фиксации изменений, внесенных при выполнении транзакции, следует
--использовать команду COMMIT TRANSACTION.


--------------CASE1---------------
CREATE TRIGGER AFTER_TRIGGER
ON OFFICES
AFTER INSERT
AS
 BEGIN
	DECLARE @office int, @city varchar(15), @region varchar(10),
			@mgr int, @target decimal(9,2), @sales decimal(9,2);
	SELECT @office = (SELECT OFFICE FROM inserted);
    IF (select SALES FROM inserted) < 400000.00
		BEGIN
			ROLLBACK TRAN
			PRINT('Продажи меньше 400000.00 недопустимы ') 
		END
	INSERT INTO AUDIT VALUES (@office, @city, @region, @mgr, @target, @sales, 'INSERT');
	RETURN;
 END
 
INSERT INTO OFFICES VALUES (52, 'Krakov', 'Western', 104, 550000.00, 350000.00);
--ошибка!
INSERT INTO OFFICES VALUES (53, 'Paris', 'Eastern', 106, 650000.00, 600000.00);
--успешно

SELECT * FROM OFFICES
SELECT * FROM AUDIT

DROP TRIGGER AFTER_TRIGGER
GO


--INSERT INTO OFFICES VALUES (36, 'Lisboa', 'Eastern', NULL, 840000.00, 880000.00);
--INSERT INTO OFFICES VALUES (37, 'Sintra', 'Eastern', NULL, 880000.00, 870000.00);

CREATE TRIGGER OFFICE_INSERT
ON OFFICES
AFTER INSERT
AS
BEGIN
	DECLARE @office int, @city varchar(15), @region varchar(10),
			@mgr int, @target decimal(9,2), @sales decimal(9,2);

	SELECT @office = (SELECT OFFICE FROM inserted);
	SELECT @city = (SELECT CITY FROM inserted);
	SELECT @region = (SELECT REGION FROM inserted);
	SELECT @mgr = (SELECT MGR FROM inserted);
	SELECT @target = (SELECT TARGET FROM inserted);
	SELECT @sales = (SELECT SALES FROM inserted);
	IF (SELECT MGR FROM AUDIT WHERE MGR = mgr) is null
	BEGIN
		PRINT 'Целостность нарушена'
		SELECT @@TRANCOUNT  --1
		ROLLBACK TRANSACTION
		SELECT @@TRANCOUNT  --0
	END;
	INSERT INTO AUDIT VALUES (@office, @city, @region, @mgr, @target, @sales, 'INSERT');
	RETURN;
END;

INSERT INTO OFFICES VALUES (38, 'Porto', 'Eastern', null, 880000.00, 870000.00);
--ошибка!

INSERT INTO OFFICES VALUES (39, 'Porto', 'Eastern', 105, 880000.00, 870000.00);
--успешно

drop trigger OFFICE_INSERT
GO

--delete from OFFICES where OFFICE = 38
DELETE FROM AUDIT WHERE OFFICE = 38 

SELECT * FROM AUDIT 
SELECT * FROM OFFICES
GO

--5. Создать триггер на обновление для представления. Продемонстрировать работоспособность триггера.

--Триггер INSTEAD OF позволяет управлять тем, что происходит, когда выполняются функции INSERT, UPDATE или DELETE. 
--Триггер INSTEAD OF используется в первую очередь при модификации объединенного представления (union view).
-------------CASE1 (instead of insert)--------------
create table Wage_structure (  
	Type char(1),  
	Wage_limit int);
--drop table Wage_structure;

create table Employee_Wage  (  
	EmployeeID int,
	EmployeeName varchar(50),  
	EmployeeType char(1),
	Employee_Wage int);
--drop table Employee_Wage;

INSERT INTO Wage_structure VALUES ('A', 10)
INSERT INTO Wage_structure VALUES ('B', 20)


SELECT * FROM Wage_structure
select * from Employee_Wage;


CREATE TRIGGER Tgr_InsteadOf_Wage 
ON Employee_Wage
INSTEAD OF INSERT
AS
BEGIN
	DECLARE @Type char(1);
	DECLARE @Wage int;
	DECLARE @WageLimit int;

	SELECT @Type = EmployeeType, @Wage = Employee_Wage FROM inserted;
	SELECT @WageLimit = Wage_limit FROM Wage_structure WHERE Type = @Type;

	if @Wage > @WageLimit
		begin
			raiserror ('Wage Limit Exceeded', 16, 1);
			return;
		end
	else
		begin
			INSERT INTO Employee_Wage SELECT * FROM inserted;
		end
END;

INSERT INTO Employee_Wage VALUES (1, 'Allison', 'A', 15);
--Msg 50000, Level 16, State 1, Procedure Tgr_InsteadOf_Wage, Line 15 [Batch Start Line 577]
--Wage Limit Exceeded
--(1 row affected)
--т.к. в А лимит 10, а мы пытаемся внести 15
SELECT * FROM Wage_structure
select * from Employee_Wage;


INSERT INTO Employee_Wage VALUES (1, 'Allison', 'A', 9);
--(1 row affected)
--(1 row affected)
--Completion time: 2021-01-29T21:56:11.8579730+03:00

SELECT * FROM Wage_structure
select * from Employee_Wage;

INSERT INTO Employee_Wage VALUES (1, 'Allison', 'A', 19);
--опять ошибка

INSERT INTO Employee_Wage VALUES (2, 'Luis', 'B', 19);
--успешно
SELECT * FROM Wage_structure
select * from Employee_Wage;

INSERT INTO Employee_Wage VALUES (2, 'Luis', 'B', 25);
--ошибка

select * from Wage_structure;
select * from Employee_Wage;

--drop trigger Tgr_InsteadOf_Wage;



-----------CASE2 (instead of update)----------------

CREATE TRIGGER Tgr_InsteadOf_Update 
ON Employee_Wage
INSTEAD OF update
AS
BEGIN
	DECLARE @EmployeeType char(1);
	DECLARE @Employee_Wage int;
	DECLARE @WageLimit int;

	SELECT @EmployeeType = EmployeeType, @Employee_Wage = Employee_Wage FROM deleted;
	SELECT @WageLimit = Wage_limit FROM Wage_structure WHERE Type = @EmployeeType;

	if @Employee_Wage > 15
		begin
			raiserror ('Can not update Employee_Wage', 16, 1);
			return;
		end
	else
		begin
			UPDATE Employee_Wage
			SET Employee_Wage.Employee_Wage = Employee_Wage * 1.5;
		end
END;

UPDATE Employee_Wage
SET Employee_Wage.Employee_Wage = Employee_Wage * 1.5 WHERE Employee_Wage = 25;
--ошибка!

UPDATE Employee_Wage
SET Employee_Wage.Employee_Wage = Employee_Wage * 1.5 WHERE Employee_Wage = 10;
--успешно!

SELECT * FROM Wage_structure
select * from Employee_Wage;

--вставим новые данные в таблицу
--INSERT INTO Employee_Wage VALUES (3, 'Bob', 'A', 25);
--INSERT INTO Employee_Wage VALUES (4, 'Bob', 'A', 10);
--проверяем

--delete from Employee_Wage where EmployeeID = 1

--удаляем триггер
drop trigger Tgr_InsteadOf_Update


--6.Создать триггер уровня базы данных. Продемонстрировать работоспособность триггера.
--DISABLE TRIGGER prevent_Delete ON DATABASE
--disable trigger trg_index_changes on database

--CREATE TABLE
CREATE TABLE ddl (
	ID INT,
	NAME_USER NVARCHAR(20));
GO


--------DDL-триггер для предотвращения удаления таблицы--------------
CREATE TRIGGER prevent_drop_Trigger
ON DATABASE
FOR DROP_TABLE
AS
	PRINT 'You must disable Trigger "safety_Trigger" to drop table!'
	ROLLBACK;
GO
--Проверяем триггер, пытаемся удалить таблицу
DROP TABLE ddl;
GO
--будет ошибка: 'You must disable Trigger "safety_Trigger" to drop table!'
--нужно выполнить DISABLE TRIGGER:
DISABLE TRIGGER prevent_drop_Trigger on database
GO
--повторяем попытку удаления таблицы:
DROP TABLE ddl; --успешно
GO

--Удаляем триггер 
DROP TRIGGER drop_Trigger ON DATABASE;
GO

---------DDL-триггер для предотвращения создания таблицы---------------
CREATE TRIGGER prevent_Create
ON DATABASE FOR CREATE_TABLE
AS
BEGIN
	PRINT 'You must disable Trigger "prevent_Create" to create tables in database!'
	ROLLBACK
END
GO
--Проверяем триггер, пытаемся создать таблицу, выведет ошибку
CREATE TABLE ddl_1 (
	ID INT,
	NAME_USER VARCHAR(20));
GO

--делаем DISABLE TRIGGER:
--DISABLE TRIGGER prevent_Create ON DATABASE
--GO

--Удаляем триггер
DROP TRIGGER prevent_Create ON DATABASE
GO


--7.Удалить все триггеры.
--см.выше