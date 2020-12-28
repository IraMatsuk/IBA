---
---  CREATE TABLE statements
---

--DROP TABLE ORDERS;
--DROP TABLE CUSTOMERS;
--DROP TABLE SALESREPS;
--DROP TABLE OFFICES;
--DROP TABLE PRODUCTS;


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
INSERT INTO SALESREPS VALUES (111,'John Angelli',49,22,'Sales Rep','2005-11-14',108,300000.00,185042.00);


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


select *from ORDERS;
select * from CUSTOMERS;

--3.1. Выбрать фамилии и даты найма всех сотрудников.
select name, HIRE_DATE from salesreps;

--3.2. Выбрать все заказы, выполненные после опреденной даты.           ----
select * from orders
where order_date >'2007-12-12';

--3.3. Выбрать все офисы из определенного региона и управляемые определенным сотрудником.
select * from OFFICES
where REGION= 'Western' and MGR = '108';

--3.4. Выбрать заказы, сумма которых больше определенного значения.
select * from orders
where AMOUNT > 30000;

--3.5.Выбрать заказы определенного покупателя.
select * from ORDERS
where CUST = 2106;

--3.6.Выбрать заказы, сделанные в определенный период.
select * from orders
where ORDER_DATE > '2008-01-01' and ORDER_DATE < '2008-12-12';

--3.7.Выбрать офисы из 12, 13 и 21 региона.
select * from OFFICES
where OFFICE in (12, 13, 21);


--3.8.Выбрать сотрудника, у которого нет менеджера (самого главного).
select name from SALESREPS
where MANAGER is null;

--3.9.Выбрать офисы из региона, который начинается на East.
select *from OFFICES
where REGION like 'E%a%s%t%';

--3.10.Выбрать все продукты с ценой больше определенного значения и отсортировать в порядке убывания цены.
select * from PRODUCTS
where PRICE > 1000
order by PRICE desc;


--3.11.Выбрать фамилии и даты найма всех сотрудников и отсортировать по возрасту.
select name, 
	hire_date
	from SALESREPS
	order by AGE asc;

--3.12.Выбрать все заказы и отсортировать вначале по стоиомсти по убыванию, а затем по количеству заказанного по возрастанию.
select * from ORDERS
order by AMOUNT desc, QTY asc;

--3.13.Выбрать 5 самых дорогих товаров.
select top 5 * from ORDERS
order by AMOUNT desc;

--3.14.Выбрать 3 самых молодых сотрудников.
select top 3 * from SALESREPS
order by AGE;

--3.15.Выбрать 20% самых дорогих заказов.
select top 20 percent * from ORDERS
order by AMOUNT desc;

--3.16.Выбрать 11 покупателей с самым высоким кредитным лимитом.
select top 11 * from CUSTOMERS
order by CREDIT_LIMIT desc;

--3.17.Выбрать сотрудников с 4 по 7, отсортированных по дате найма.
select * from SALESREPS
order by HIRE_DATE
	offset 3 rows
	fetch next 4 rows only;

select name
from SALESREPS
order by HIRE_DATE
offset 3 rows
fetch next 4 rows only;


--3.18.Выбрать сотрудников с 4 по 7, отсортированных по возрасту и тех, кто с ними одного возраста.
--case1
select * from SALESREPS
order by AGE
	offset 3 rows
	fetch next 4 rows only;
--case2
select name
from SALESREPS
order by AGE
offset 3 rows
fetch next 4 rows only;

--case3
select name, REP_OFFICE from (
	select top 5 with ties *
	from SALESREPS
	order by REP_OFFICE) x

except
select name, REP_OFFICE from (
	select top 2 *
	from SALESREPS
	order by REP_OFFICE) y;

--3.19.Выбрать уникальные товары в заказах.
SELECT DISTINCT PRODUCT
from ORDERS;

--3.20.Подсчитать количество заказов для каждого покупателя. ---------ДОДЕЛАТЬ!!!!!
SELECT ORDER_DATE, COUNT(CUST) AS AMOUNT_OF_ORDERS
FROM ORDERS
GROUP BY ORDER_DATE;


--3.21.Подсчитать итоговую сумму заказа для каждого покупателя.
SELECT ORDER_DATE, SUM(AMOUNT) AS AMOUNT_PER_DAY
FROM ORDERS
GROUP BY ORDER_DATE;

--3.22.Подсчитать среднюю цену заказа для каждого сотрудника.
SELECT REP, AVG(AMOUNT) AS AVERAGE_PRICE
FROM ORDERS
GROUP BY REP;

--3.23.Найти сотрудников, у которых есть заказ стоимости выше определенного значения.
select 
	s.NAME
from SALESREPS s left join ORDERS o
on o.ORDER_NUM = s.NAME
where o.AMOUNT > 40000;

select 
	c.COMPANY
from CUSTOMERS c left join ORDERS o
on o.CUST = c.CUST_NUM
where o.ORDER_NUM is null;

--3.24.Найти количество продуктов для каждого производителя.
SELECT MFR_ID, COUNT(PRODUCT_ID) AS AMOUNT_OF_PRODUCTS
FROM PRODUCTS
GROUP BY MFR_ID;

SELECT COUNT(ORDER_NUM), CUST
FROM ORDERS
GROUP BY CUST
HAVING COUNT(ORDER_NUM) > 3;



--3.25.Найти самый дорогой товар каждого производителя.
select top 1
PRODUCT_ID, PRICE
from PRODUCTS
order by PRICE desc;


select 
max(PRICE)
from PRODUCTS;

--3.26.Найти покупателей и их заказы (в результирующем наборе должны быть: наименование покупателя, наименование товара, производитель, количество и итоговая сумма).
select 
	c.COMPANY,
	o.PRODUCT,
	o.MFR,
	o.QTY,
	o.AMOUNT
from ORDERS o join CUSTOMERS c
on o.CUST = c.CUST_NUM;

--3.27.Найти всех покупателей и их заказы.
select 
	c.COMPANY,
	o.PRODUCT,
	o.MFR,
	o.QTY,
	o.AMOUNT
from ORDERS o left join CUSTOMERS c
on o.CUST = c.CUST_NUM;

--3.28.Найти покупателей, у которых нет заказов.
select 
	c.COMPANY
from CUSTOMERS c left join ORDERS o
on o.CUST = c.CUST_NUM
where o.ORDER_NUM is null;

--3.29.Найти покупателей, у которых есть заказы в определенный период.
select
	c.COMPANY
from CUSTOMERS c left join ORDERS o
on o.CUST = c.CUST_NUM
where o.ORDER_DATE > '2008-01-01' AND  o.ORDER_DATE < '2008-02-03';

--3.30.Найти покупателей, у которых есть заказы выше определенной суммы.
select
	c.COMPANY
from CUSTOMERS c left join ORDERS o
on o.CUST = c.CUST_NUM
where o.AMOUNT > 30000;

--3.31.Найти заказы, которые оформляли менеджеры из региона EAST.
select o.CITY, od.PRODUCT
from OFFICES o join SALESREPS s
on o.OFFICE = s.REP_OFFICE
join orders od
on od.REP = s.EMPL_NUM

--3.32.Найти всех сотрудников из региона EAST и все их заказы
select s.EMPL_NUM,
		s.NAME,
		o.REGION
from SALESREPS s join OFFICES o
on REP_OFFICE = o.OFFICE
join ORDERS od on s.EMPL_NUM = od.REP
where o.REGION like 'East%';

select s.EMPL_NUM,
		s.NAME,
		o.REGION,
		od.ORDER_NUM,
		od.ORDER_DATE,
		od.AMOUNT
from SALESREPS s join OFFICES o
on REP_OFFICE = o.OFFICE
left join ORDERS od on s.EMPL_NUM = od.REP
where o.REGION like 'East%'
order by s.NAME;

--3.33.Найти сотрудников, которые не оформили ни одного заказа.
select s.EMPL_NUM,
		s.NAME
from SALESREPS s left join ORDERS od
on s.EMPL_NUM = od.REP
where od.AMOUNT is null;


--3.34.Найти сотрудников одного возраста.
select s1.NAME,
		s1.AGE,
		s2.name,
		s2.age
from SALESREPS s1 join SALESREPS s2
on s1.AGE = s2.AGE
where s1.EMPL_NUM > s2.EMPL_NUM;
 

 --посчитать количество заказов которое обработал каждый сотрудник и отсортировать по количеству обработанных заказов по убыванию
select 
		s.EMPL_NUM,
		s.NAME, 
		count(od.QTY) count_of_orders
;




--------------Example1--------------------
select o.CITY, count (od.PRODUCT) count_of_orders
from OFFICES o join SALESREPS s
on o.OFFICE = s.REP_OFFICE
join orders od
on od.REP = s.EMPL_NUM
group by o.CITY
order by city;


--------------Example2--------------------
SELECT * FROM ORDERS
WHERE CUST = (
SELECT CUST_NUM FROM CUSTOMERS WHERE COMPANY = 'First Corp.');

--------------Example3--------------------
SELECT O.ORDER_NUM, O.ORDER_DATE, O.AMOUNT FROM
(SELECT COMPANY, CUST_NUM FROM CUSTOMERS WHERE CREDIT_LIMIT>40000)AS C
JOIN ORDERS AS O ON C.CUST_NUM = O.CUST WHERE Year(O.)
------не завершено--------

SELECT C.COMPANY, 
	OrderCOunt = (SELECT COUNT(ORDER_NUM) FROM ORDERS O WHERE O.CUST = C.CUST_NUM)
FROM CUSTOMERS C
ORDER BY OrderCount DESC;


SELECT C.COMPANY, C.CREDIT_LIMIT
FROM CUSTOMERS C
WHERE CUST_NUM IN (SELECT O.CUST FROM ORDERS O WHERE AMOUNT>35000);


SELECT S.NAME, S.SALES,
	MaxOrder = (SELECT MAX(AMOUNT) FROM ORDERS O WHERE O.REP = S.EMPL_NUM)
FROM SALESREPS S
ORDER BY S.SALES DESC;


SELECT S.NAME, S.SALES
FROM SALESREPS S
WHERE REP_OFFICE = (SELECT OFFICE FROM OFFICES WHERE CITY LIKE '%e%');
-----не завершено-----


--ANY - условие истинно хотя бы для одного значения из набора
SELECT O1.REP,
		O1.AMOUNT
FROM ORDERS O1
WHERE O1.AMOUNT > ANY (SELECT MAX(AMOUNT) FROM ORDERS O2 GROUP BY O2.REP)
ORDER BY O1.REP;

------ALL - условие истинно для всех значений из набора
SELECT O1.REP,
		O1.AMOUNT
FROM ORDERS O1
WHERE O1.AMOUNT > ALL (SELECT MAX(AMOUNT) FROM ORDERS O2 GROUP BY O2.REP)
ORDER BY O1.REP;  -- не вернет записей


---EXISTS / NOT EXISTS
SELECT S.EMPL_NUM,
		S.NAME,
		YEAR(O.ORDER_DATE)
FROM SALESREPS S Left join ORDERS O
ON O.REP = S.EMPL_NUM
ORDER BY S.NAME, ORDER_DATE DESC;


----Найти тех, кто выполнял заказы
SELECT S.EMPL_NUM,
		S.NAME
FROM SALESREPS S
WHERE 
NOT EXISTS (SELECT O.REP FROM ORDERS O WHERE O.REP=S.EMPL_NUM)
ORDER BY S.EMPL_NUM;

----Найти тех, кто не выполнял заказы
SELECT S.EMPL_NUM,
		S.NAME
FROM SALESREPS S
WHERE
NOT EXISTS (SELECT O.REP FROM ORDERS O WHERE O.REP=S.EMPL_NUM)
ORDER BY S.EMPL_NUM;


SELECT O1.REP,
		O1.ORDER_DATE,
		O1.ORDER_NUM
		O1.AMOUNT
FROM ORDERS O1
WHERE O1.AMOUNT = (SELECT MAX(AMOUNT) FROM ORDERS O2)
ORDER BY O1.REP; 


--ОПЕРАЦИИ ОБЪЕДИНЕНИЯ МНОЖЕСТВ
--UNION - ПО ОДНОМУ РАЗУ ДЛЯ КАЖДОЙ ЗАПИСИ.....
SELECT S.EMPL_NUM,
		S.NAME,
		YEAR(O.ORDER_DATE) AS Fin_Year
FROM SALESREPS S Left join ORDERS O
ON O.REP = S.EMPL_NUM
WHERE YEAR(O.ORDER_DATE) != 2007 OR YEAR (O.ORDER_DATE)  IS NULL

	UNION

SELECT S.EMPL_NUM,
		S.NAME,
		YEAR(O.ORDER_DATE) AS Fin_Year
FROM SALESREPS S Left join ORDERS O
ON O.REP = S.EMPL_NUM
WHERE YEAR(O.ORDER_DATE) != 2008 OR YEAR (O.ORDER_DATE)  IS NULL;


--INTERSECT
SELECT S.EMPL_NUM,
		S.NAME,
		YEAR(O.ORDER_DATE) AS Fin_Year
FROM SALESREPS S Left join ORDERS O
ON O.REP = S.EMPL_NUM
WHERE YEAR(O.ORDER_DATE) != 2007 OR YEAR (O.ORDER_DATE)  IS NULL

	INTERSECT

SELECT S.EMPL_NUM,
		S.NAME,
		YEAR(O.ORDER_DATE) AS Fin_Year
FROM SALESREPS S Left join ORDERS O
ON O.REP = S.EMPL_NUM
WHERE YEAR(O.ORDER_DATE) != 2008 OR YEAR (O.ORDER_DATE)  IS NULL;


--EXCEPT
SELECT S.EMPL_NUM,
		S.NAME,
		YEAR(O.ORDER_DATE) AS Fin_Year
FROM SALESREPS S Left join ORDERS O
ON O.REP = S.EMPL_NUM
WHERE YEAR(O.ORDER_DATE) != 2007 OR YEAR (O.ORDER_DATE)  IS NULL

	EXCEPT

SELECT S.EMPL_NUM,
		S.NAME,
		YEAR(O.ORDER_DATE) AS Fin_Year
FROM SALESREPS S Left join ORDERS O
ON O.REP = S.EMPL_NUM
WHERE YEAR(O.ORDER_DATE) != 2008 OR YEAR (O.ORDER_DATE)  IS NULL;


--INSERT---
SELECT * FROM PRODUCTS

--INSERT INTO PRODUCTS (MFR_ID, PRODUCT_ID, DESCRIPTION, PRICE, QTY_ON_HAND)
--VALUES('ACI', '41007', 'Test Product', default, null);


INSERT INTO PRODUCTS (MFR_ID, PRODUCT_ID, DESCRIPTION, PRICE, QTY_ON_HAND)
VALUES('ACI', '41007', 'Test Product', 10, 10);


ALTER TABLE PRODUCTS ADD CONSTRAINT def_price
	DEFAULT 100 FOR PRICE;


--INSERT SELECT
CREATE TABLE USERS (U_ID INT, U_NAME VARCHAR(15));

INSERT INTO USERS (U_ID, U_NAME)
SELECT EMPL_NUM, NAME FROM SALESREPS;

SELECT * FROM USERS;
DELETE USERS;

--SELECT OUTPUT  (inserted - это псевдотаблица)
INSERT INTO SALESREPS (EMPL_NUM, NAME, HIRE_DATE, SALES)
	OUTPUT inserted.EMPL_NUM, inserted.NAME INTO USERS
	VALUES (129, 'John Dow', '2006-11-14', 10000);

--DELETE SELECT
INSERT INTO USERS (U_ID, U_NAME)
SELECT EMPL_NUM, NAME FROM SALESREPS;

DELETE USERS
FROM USERS U join SALESREPS S ON S.EMPL_NUM = U.U_ID
AND S.MANAGER IS NULL;


--DELETE OUTUT
SELECT *
INTO SALESREPS_copy
FROM SALESREPS;

SELECT * FROM SALESREPS_copy;

DELETE SALESREPS_copy
	OUTPUT deleted.EMPL_NUM, deleted.NAME INTO USERS
	WHERE YEAR(HIRE_DATE) < 2005;


--TRUNCATE TABLE
TRUNCATE TABLE SALESREPS_copy;

DROP TABLE SALESREPS_copy;


--UPDATE
SELECT *
INTO SALESREPS_copy
FROM SALESREPS;

SELECT EMPL_NUM, NAME, AGE, SALES FROM SALESREPS_copy;

UPDATE SALESREPS_copy SET AGE +=1;

UPDATE SALESREPS_copy SET AGE +=2;

UPDATE SALESREPS_copy SET AGE = LEFT(SALES, 2);


--UPDATE SELECT---
UPDATE SALESREPS_copy SET AGE += 1
FROM SALESREPS_copy U join SALESREPS S ON S.EMPL_NUM = U.EMPL_NUM
AND S.MANAGER IS NULL;


--UPDATE OUTPUT
SELECT * FROM USERS
DELETE USERS;

UPDATE SALESREPS_copy SET AGE += 1
OUTPUT inserted.AGE - deleted.AGE U_ID, inserted.NAME u1_name INTO USERS
WHERE YEAR(HIRE_DATE) < 2005;

GO
-- Представления - поименованный запрос

CREATE VIEW Best_Sales AS
SELECT * FROM SALESREPS WHERE [SALES] > 200000;

GO

SELECT * FROM Best_Sales ORDER BY SALES;

DROP VIEW Best_Sales;
GO

CREATE VIEW Best_Sales AS
SELECT * FROM SALESREPS
WHERE [SALES] > 200000
ORDER BY SALES; -- ошибка!!!! надо секция top вместе с order_by
GO

CREATE VIEW Best_Sales AS
SELECT TOP (10) * FROM SALESREPS
WHERE [SALES]>20000
ORDER BY SALES;
GO

SELECT * FROM Best_Sales;

--DML INTO VIEW
INSERT INTO Best_Sales (EMPL_NUM, NAME, HIRE_DATE, SALES)
	VALUES (140, 'John Castillo', '2015-11-14', 10000);

SELECT * FROM Best_Sales; -- 7

SELECT * FROM SALESREPS;

INSERT INTO Best_Sales (EMPL_NUM, NAME, HIRE_DATE, MANAGER, SALES)
	VALUES (133, 'John Bon Jovi', '2019-11-14', 134, 10000); -- FK
GO


--SCHEMABINDING - ЗАПРЕТ НА ИЗМЕНЕНИЕ БАЗОВЫХ ТАБЛИЦ 
CREATE VIEW dbo.Low_Sales WITH SCHEMABINDING AS
SELECT EMPL_NUM, NAME, HIRE_DATE, SALES FROM dbo.SALESREPS
WHERE [SALES] < 100000;

SELECT * FROM Low_Sales;

ALTER TABLE SALESREPS DROP COLUMN SALES; -- ОШИБКА!!!
ALTER TABLE SALESREPS DROP COLUMN AGE; -- ВЫПОЛНЕНО

ALTER TABLE SALESREPS 
	ADD CONSTRAINT default_sales
	DEFAULT 10000 FOR SALES; -- ВЫПОЛНЕНО


----------GROUP BY----------------
SELECT CREDIT_LIMIT, COUNT(COMPANY) AS Count_of_Companies
FROM CUSTOMERS
GROUP BY CREDIT_LIMIT;


SELECT ORDER_DATE, QTY, SUM(AMOUNT) AS AMOUNT_PER_DAY_SUM, COUNT(AMOUNT) AS AMOUNT_PER_DAY_QUAN
FROM ORDERS
GROUP BY ORDER_DATE, QTY
ORDER BY ORDER_DATE;


-------------HAVING
SELECT ORDER_DATE, SUM(AMOUNT) AS AMOUNT_PER_DAY
FROM ORDERS
GROUP BY ORDER_DATE
HAVING AMOUNT_PER_DAY > 10000; --!!!!!!





-----------GROUP BY CUBE, ROLLUP (GROUP BY CUBE - СЧИТАЮТ ПОДИТОГИ, А ПОТОМ ИТОГ ИТОГОВ, А ROLLUP... )
CREATE TABLE tr(t_type VARCHAR(5), t_color VARCHAR(5), t_sum INT);

INSERT INTO (t_type)
   

   -----------итоговая сумма за столы и стулья
select t_type,
		sum(t_sum) [Итого]
from tr
group by t_type;


-----------стоимость по цвету
select t_color,
		sum(t_sum) [Итого]
from tr
group by t_color;


--------Стоимость всех синих стульев
select t_type,
		t_color
		sum(t_sum) [Итого]
from tr
where t_color = 'blue'; --????????


-------GROUP BY CUBE
select t_color,
		sum(t_sum) [Итого]
from tr
group by cube (t_color, t_type);





----Все переменные начинаются с @, объявление переменной - это declare
DECLARE @X int  1,
		@Y decimal (5,3),
		@Z float (4) = 4.3E-2;

DECLARE @ch char(2),
		@text_en varchar(20) = 'Hello',
		@text_ru nvarchar(20) = 'Привет';



--Operator set присваивает значение

--Operator select позволяет потом выбирать переменные

--Operator print позволяет вывести строку


--Использование функции cast:

--avg от price, а затем через if else 
--количество продуктов count
--max
--min
-- промежуток времени задаем через переменные (переменная - с такого-то и вторая переменная - по такое-то)
--найти месяц текущий, месяц в котором сотрудник нанят и выяснить что разница между ними 1

