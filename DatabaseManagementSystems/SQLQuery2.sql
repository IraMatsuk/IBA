--DROP TABLE user13_DISCARDED;
--DROP TABLE user13_ACTS;
--DROP TABLE user13_EMPLOYEES;
--DROP TABLE user13_EQUIPMENT;

CREATE TABLE user13_EQUIPMENT --СПИСОК ОБОРУДОВАНИЯ
(
  EQUIPID      INT PRIMARY KEY, --Код оборудования
  EQUIPNAME     VARCHAR(20) NOT NULL,  --Название оборудования
  EQUIPTYPE     VARCHAR(20),  --Тип оборудования
  EQUIPDATE     DATE, --Дата поступления
  EQUIPQUANTITY INT --Количество оборудования
);

INSERT INTO user13_EQUIPMENT VALUES (1, 'МИКСЕР', 'ЭЛЕКТРОМЕХАНИЧЕСКОЕ', '2016-11-21', 3);
INSERT INTO user13_EQUIPMENT VALUES (2, 'ОВОЩЕРЕЗКА', 'ЭЛЕКТРОМЕХАНИЧЕСКОЕ', '2016-08-10', 4);
INSERT INTO user13_EQUIPMENT VALUES (3, 'МЯСОРУБКА', 'ЭЛЕКТРОМЕХАНИЧЕСКОЕ', '2017-10-01', 2);

select * from user13_EQUIPMENT;

CREATE TABLE user13_EMPLOYEES --СПИСОК СОТРУДНИКОВ
(
  EMPID    INT PRIMARY KEY, -- Код сотрудника
  SURNAME  VARCHAR(20) NOT NULL, --Фамилия сотрудника
  EMPNAME VARCHAR(20), --Имя сотрудника
  PATRONYMIC VARCHAR(20), --Отчество сотрудника
  EMPPOSITION   VARCHAR(14), --Должность сотрудника
  HIREDATE DATE --Дата найма
);

INSERT INTO user13_EMPLOYEES VALUES (1, 'КРЕМКО', 'МАРИНА', 'СЕРГЕЕВНА', 'ПОВАР', '2016-12-15');
INSERT INTO user13_EMPLOYEES VALUES (2, 'ФИЛАТОВА', 'ДИАНА', 'ВИКТОРОВНА', 'АДМИНИСТРАТОР', '2017-07-18');
INSERT INTO user13_EMPLOYEES VALUES (3, 'КОРОЛЬ', 'ПАВЕЛ', 'АЛЕКСЕЕВИЧ', 'БАРМЕН', '2018-08-02');

select * from user13_EMPLOYEES;


CREATE TABLE user13_ACTS --СПИСОК АКТОВ
(
  ACTNUMBER INT PRIMARY KEY, --Номер акта
  ACTDATE DATE, --Дата акта
  EMPID INT -- Код сотрудника, составившего акт 
);

ALTER TABLE  user13_ACTS ADD CONSTRAINT user13_ACT_EMPLOYEES
FOREIGN KEY(EMPID) REFERENCES user13_EMPLOYEES(EMPID)

INSERT INTO user13_ACTS VALUES (1, '2020-04-14', 1);
INSERT INTO user13_ACTS VALUES (2, '2019-08-15', 2);

select * from user13_ACTS;


CREATE TABLE user13_DISCARDED --СПИСАННОЕ ОБОРУДОВАНИЕ
(
  DISCARDID INT PRIMARY KEY, --Номер списанного оборудования
  ACTNUMBER   INT, --Номер акта 
  EQUIPID INT, --Код оборудования
  REASONDESTRUCTION  VARCHAR(50) --Причина списания 
);

ALTER TABLE user13_DISCARDED ADD CONSTRAINT user13_ACT_DISCARDED 

ALTER TABLE user13_DISCARDED ADD CONSTRAINT user13_EQUIPMENT_DISCARDED
FOREIGN KEY(EQUIPID) REFERENCES user13_EQUIPMENT(EQUIPID)


INSERT INTO user13_DISCARDED VALUES (1, 1, 2, 'ПОВРЕЖДЕНИЕ НАСАДКИ');
INSERT INTO user13_DISCARDED VALUES (2, 2, 3, 'ПОВРЕЖДЕНИЕ НАСАДКИ');

select * from user13_DISCARDED;