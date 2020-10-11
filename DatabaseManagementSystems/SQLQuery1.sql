create table user13_table(x1 int);
/* Òàáëèöà ïîäðàçäåëåíèé */
CREATE TABLE user13_DEPT
(
  DEPTNO INT NOT NULL,
  DNAME  VARCHAR(14) NOT NULL,
  LOC    VARCHAR(13)
);


ALTER TABLE user13_DEPT
  ADD CONSTRAINT user13_DEPT_PK PRIMARY KEY (DEPTNO); /* áóäóò îáÿçàòåëüíûå óíèêàëüíûå çíà÷åíèÿ, ýòî uniqe + not null */
ALTER TABLE user13_DEPT
  ADD CONSTRAINT user13_DEPT_UK UNIQUE (DNAME); /*óíèêàëüíîå ïîëå ìîæåò áûòü ïóñòûì */

   select * from user13_DEPT;
/* Òàáëèöà ñîòðóäíèêîâ */
CREATE TABLE user13_EMP
(
  EMPNO    INT NOT NULL,
  ENAME    VARCHAR(10) NOT NULL,
  JOB      VARCHAR(9),
  MGR      INT,
  HIREDATE DATE,
  SAL      INT,
  COMM     INT,
  DEPTNO   INT
);
   select * from user13_EMP;

ALTER TABLE user13_EMP
  ADD CONSTRAINT user13_EMP_PK PRIMARY KEY (EMPNO);
ALTER TABLE user13_EMP
  ADD CONSTRAINT user13_EMP_UK UNIQUE (ENAME);
ALTER TABLE user13_EMP
  ADD CONSTRAINT user13_EMP_DEPT_FK FOREIGN KEY (DEPTNO)
  REFERENCES user13_DEPT (DEPTNO);
ALTER TABLE user13_EMP
  ADD CONSTRAINT user13_EMP_MGR_FK FOREIGN KEY (MGR)
  REFERENCES user13_EMP (EMPNO);

  
/* Òàáëèöà âèëîê çàðïëàò */
CREATE TABLE user13_SALGRADE (
 GRADE               INT NOT NULL,
 LOSAL               INT,
 HISAL               INT);

select * from user13_SALGRADE;

ALTER TABLE user13_SALGRADE
  ADD CONSTRAINT user13_SALGRADE_PK PRIMARY KEY (GRADE);

/* Äàííûå ïî ïîäðàçäåëåíèÿì */
INSERT INTO user13_DEPT VALUES (10,'ACCOUNTING','NEW YORK');
INSERT INTO user13_DEPT VALUES (20,'RESEARCH','DALLAS');
INSERT INTO user13_DEPT VALUES (30,'SALES','CHICAGO');
INSERT INTO user13_DEPT VALUES (40,'OPERATIONS','BOSTON');

/* Äàííûå ïî ñîòðóäíèêàì */
INSERT INTO user13_EMP VALUES (7839,'KING','PRESIDENT',NULL,'2011-09-11',5000,NULL,10);
INSERT INTO user13_EMP VALUES (7698,'BLAKE','MANAGER',7839,'2014-01-31',2850,NULL,30);
INSERT INTO user13_EMP VALUES (7782,'CLARK','MANAGER',7839,'2013-02-21',2450,NULL,10);
INSERT INTO user13_EMP VALUES (7566,'JONES','MANAGER',7839,'2017-09-19',2975,NULL,20);
INSERT INTO user13_EMP VALUES (7654,'MARTIN','SALESMAN',7698,'2017-09-11',1250,400,30);
INSERT INTO user13_EMP VALUES (7499,'ALLEN','SALESMAN',7698,'2017-09-11',1600,300,30);
INSERT INTO user13_EMP VALUES (7844,'TURNER','SALESMAN',7698,'2017-03-22',1500,0,30);
INSERT INTO user13_EMP VALUES (7900,'JAMES','CLERK',7698,'2016-11-11',950,NULL,30);
INSERT INTO user13_EMP VALUES (7521,'WARD','SALESMAN',7698,'2015-07-17',1250,500,30);
INSERT INTO user13_EMP VALUES (7902,'FORD','ANALYST',7566,'2017-03-11',3000,NULL,20);
INSERT INTO user13_EMP VALUES (7369,'SMITH','CLERK',7902,'2012-09-17',800,NULL,20);
INSERT INTO user13_EMP VALUES (7788,'SCOTT','ANALYST',7566,'2017-01-11',3000,NULL,20);
INSERT INTO user13_EMP VALUES (7876,'ADAMS','CLERK',7788,'2018-07-13',1100,NULL,20);
INSERT INTO user13_EMP VALUES (7934,'MILLER','CLERK',7782,'2018-03-12',1300,NULL,10);

/* Äàííûå ïî óðîâíÿì çàðïëàò */
INSERT INTO user13_SALGRADE VALUES (1,700,1200);
INSERT INTO user13_SALGRADE VALUES (2,1201,1400);
INSERT INTO user13_SALGRADE VALUES (3,1401,2000);
INSERT INTO user13_SALGRADE VALUES (4,2001,3000);
INSERT INTO user13_SALGRADE VALUES (5,3001,9999);

--îïðåäåëèòü ôàìèëèè ñîòðóäíèêîâ, çàðïëàòû êîòîðûõ âûøå 2000;
select ENAME
from dbo.user13_EMP
where SAL > 2000;

--íàéòè îòäåëû, êîòîðûå íàõîäÿòñÿ â Äàëëàñå;
select DNAME
from dbo.user13_DEPT
where LOC = 'DALLAS';

--îïðåäåëèòü ôàìèëèè ñîòðóäíèêîâ èç îòäåëà 20;
select DNAME
from dbo.user13_DEPT
where DEPTNO = 20;

--íàéòè ñîòðóäíèêîâ, ÷üèì íà÷àëüíèêîì ÿâëÿåòñÿ ñîòðóäíèê 7839;
select EMPNO, ENAME 
from dbo.user13_EMP
where MGR = 7839;

--îòñîðòèðîâàòü ñîòðóäíèêîâ èõ äàòå íàéìà.
select *
from dbo.user13_EMP
order by HIREDATE DESC;



update user13_SALGRADE set HISAL = 2999 where GRADE  = 4;

select * from user13_SALGRADE;

delete user13_SALGRADE where GRADE = 4;
select * from user13_SALGRADE;

insert into user13_SALGRADE values(4,2001,3000);
select * from user13_SALGRADE;

update user13_SALGRADE set HISAL = 6666 where GRADE = 5;


delete user13_SALGRADE where GRADE = 5;
select * from user13_SALGRADE;


insert into user13_SALGRADE values(5,3001,9999);


update user13_DEPT set DNAME = 'programmer' where DNAME = 'RESEARCH';
delete user13_DEPT where DNAME = 'programmer';

select * from user13_DEPT;


update user13_EMP set DEPTNO = 30 where DEPTNO = 20;


insert into user13_DEPT values(20,'RESEARCH','DALLAS');