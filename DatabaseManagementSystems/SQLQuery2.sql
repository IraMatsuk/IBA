--DROP TABLE user13_DISCARDED;
--DROP TABLE user13_ACTS;
--DROP TABLE user13_EMPLOYEES;
--DROP TABLE user13_EQUIPMENT;

CREATE TABLE user13_EQUIPMENT --������ ������������
(
  EQUIPID      INT PRIMARY KEY, --��� ������������
  EQUIPNAME     VARCHAR(20) NOT NULL,  --�������� ������������
  EQUIPTYPE     VARCHAR(20),  --��� ������������
  EQUIPDATE     DATE, --���� �����������
  EQUIPQUANTITY INT --���������� ������������
);

INSERT INTO user13_EQUIPMENT VALUES (1, '������', '�������������������', '2016-11-21', 3);
INSERT INTO user13_EQUIPMENT VALUES (2, '����������', '�������������������', '2016-08-10', 4);
INSERT INTO user13_EQUIPMENT VALUES (3, '���������', '�������������������', '2017-10-01', 2);

select * from user13_EQUIPMENT;

CREATE TABLE user13_EMPLOYEES --������ �����������
(
  EMPID    INT PRIMARY KEY, -- ��� ����������
  SURNAME  VARCHAR(20) NOT NULL, --������� ����������
  EMPNAME VARCHAR(20), --��� ����������
  PATRONYMIC VARCHAR(20), --�������� ����������
  EMPPOSITION   VARCHAR(14), --��������� ����������
  HIREDATE DATE --���� �����
);

INSERT INTO user13_EMPLOYEES VALUES (1, '������', '������', '���������', '�����', '2016-12-15');
INSERT INTO user13_EMPLOYEES VALUES (2, '��������', '�����', '����������', '�������������', '2017-07-18');
INSERT INTO user13_EMPLOYEES VALUES (3, '������', '�����', '����������', '������', '2018-08-02');

select * from user13_EMPLOYEES;


CREATE TABLE user13_ACTS --������ �����
(
  ACTNUMBER INT PRIMARY KEY, --����� ����
  ACTDATE DATE, --���� ����
  EMPID INT -- ��� ����������, ������������ ��� 
);

ALTER TABLE  user13_ACTS ADD CONSTRAINT user13_ACT_EMPLOYEES
FOREIGN KEY(EMPID) REFERENCES user13_EMPLOYEES(EMPID)

INSERT INTO user13_ACTS VALUES (1, '2020-04-14', 1);
INSERT INTO user13_ACTS VALUES (2, '2019-08-15', 2);

select * from user13_ACTS;


CREATE TABLE user13_DISCARDED --��������� ������������
(
  DISCARDID INT PRIMARY KEY, --����� ���������� ������������
  ACTNUMBER   INT, --����� ���� 
  EQUIPID INT, --��� ������������
  REASONDESTRUCTION  VARCHAR(50) --������� �������� 
);

ALTER TABLE user13_DISCARDED ADD CONSTRAINT user13_ACT_DISCARDED 

ALTER TABLE user13_DISCARDED ADD CONSTRAINT user13_EQUIPMENT_DISCARDED
FOREIGN KEY(EQUIPID) REFERENCES user13_EQUIPMENT(EQUIPID)


INSERT INTO user13_DISCARDED VALUES (1, 1, 2, '����������� �������');
INSERT INTO user13_DISCARDED VALUES (2, 2, 3, '����������� �������');

select * from user13_DISCARDED;