INSERT INTO OFFICES VALUES (26, 'Kiev', 'Eastern', 108, 73000.00, 83000.00);
INSERT INTO OFFICES VALUES (27, 'Grodno', 'Eastern', 108, 73000.00, 83000.00);

--delete OFFICES where OFFICE = 26;
--delete OFFICES where OFFICE = 27;
SELECT * FROM OFFICES;
--Уровень изолированности READ UNCOMMITTED допускает неподтвержденное чтение
--ошибка грязного чтения
--1
--начинаем транзакцию
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
BEGIN TRAN
SELECT COUNT(*) FROM OFFICES -- запускаем транзакцию, результат: 11

--3
SELECT COUNT(*) FROM OFFICES --результат, видно неподтвержденное чтение

--5
SELECT COUNT(*) FROM OFFICES -- результат: 10 после отката транзакции 11
COMMIT TRAN

--Покажем, что уровень изолированности READ COMMITTED не допускает неподтвержденное чтение

--6
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
BEGIN TRAN
SELECT COUNT(*) FROM OFFICES --запускаем транзакцию, Результат: 11

--8
SELECT COUNT(*) FROM OFFICES --Результат: ожидание, неподтвержденного чтения нет; --виснет 

--10
SELECT COUNT(*) FROM OFFICES -- сразу после отката транзакции 11 Результат: 11,
COMMIT TRAN

--Покажем, что уровень изолированности READ COMMITTED допускает неповторяющееся чтение

--11
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
BEGIN TRAN
SELECT COUNT(*) FROM OFFICES -- Результат: 11

--13
SELECT COUNT(*) FROM OFFICES -- Результат: 
--пока вторая транзакция удаляла запись, данные дважды прочитались по-разному
COMMIT TRAN

--Покажем, что уровень изолированности REPEATABLE READ не допускает неповторяющееся чтение
INSERT INTO OFFICES VALUES (26, 'Kiev', 'Eastern', 108, 73000.00, 83000.00) -- вернем запись

--14
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
BEGIN TRAN
SELECT COUNT(*) FROM OFFICES --Результат: 11

--16
COMMIT TRAN -- сразу после фиксации транзакции А в окне И
--Строк обработано:1 - прошло выполнение оператора удаления

--Покажем, что уровень изолированности REPEATABLE READ допускает проблему фантомных записей
INSERT INTO OFFICES VALUES (28, 'Moscow', 'Eastern', 108, 73500.00, 83915.00) -- вернем запись
DELETE OFFICES WHERE OFFICE = 28
--18
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
BEGIN TRAN
SELECT COUNT(*) FROM OFFICES --Результат:

--20
SELECT COUNT(*) FROM OFFICES --Результат:
--в рамках одной транзакции А два результата
COMMIT TRAN 

--Покажем, что уровень SERIALIZABLE не допускает проблему фантомных записей

--21
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
BEGIN TRAN
SELECT COUNT(*) FROM OFFICES --Результат:

--23
COMMIT TRAN 


--Установка ALLOW_SNAPSHOT_ISOLATION
USE Matsuk_7
GO
ALTER DATABASE Matsuk_7 SET ALLOW_SNAPSHOT_ISOLATION ON
GO

--Покажем, что уровень изолированности SNAPSHOT не блокирует строки таблицы и при этом это обеспечивает изолированность
--24
SET TRANSACTION ISOLATION LEVEL SNAPSHOT
BEGIN TRAN
SELECT COUNT(*) FROM OFFICES --Результат:

--26
SELECT COUNT(*) FROM OFFICES --Результат: результат прежний

--28
SELECT COUNT(*) FROM OFFICES --Результат: все равно результат прежний

--29
COMMIT
SELECT COUNT(*) FROM OFFICES --Результат: изменился


