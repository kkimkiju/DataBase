SELECT * FROM EMP
-- SELECT���� �����ͺ��̽��� �����Ǿ��ִ� �����͸� ��ȸ�� �� ���
-- SELECT : ��ȸ�� �� �̸� �Ǵ� ����� �����͸� ���� ,*�� ��� �÷��� �ǹ�
-- FROM : ��ȸ�� ���̺��� ����
SELECT EMPNO,ENAME,DEPTNO
FROM EMP;
-- [SQL�� �ۼ� ���ǻ���]
-- SQL�� ��/�ҹ��� �������� ����
-- �� �� �Ǵ� ���� �ٿ� �Է� �� �� ����
-- �Ϲ������� Ű����� �빮�ڷ� �Է�
-- SQL ���� ������ ���� ;�� ����Ͽ� ����� ���� ǥ��

-- ���� ������� �Բ� ����� �� ����
-- �÷� �̸��� �������� ��Ī�� ����� �� ���� / AS, "" �� ����ص� �ǰ� �� �ص� �� ���峻�� ������ �ִ� ��쿡�� �ݵ�� ����ؾ� ��
SELECT ENAME, SAL, SAL*12+COMM ����, COMM
FROM EMP;

SELECT ENAME "����", SAL "�޿�", SAL*12*COMM "����"
FROM EMP;

-- �ߺ��� �����ϴ� DISTINCT : �����͸� ��ȸ�� �� �ߺ��Ǵ� ���� ���� �� ��ȸ�� �� ���
-- ���� �ߺ��� ���� �� ������ ǥ���� �� ���
SELECT DEPTNO FROM EMP; -- ����� �μ� ��ȣ�� ǥ����
SELECT DISTINCT DEPTNO FROM EMP;
SELECT JOB, DEPTNO FROM EMP;
SELECT DISTINCT JOB, DEPTNO FROM EMP; --��å�� �μ� �� ���� ���ǿ� ���� �ߺ� ����

-- WHERE ���� : ����ڰ� ���ϴ� ���ǿ� �´� �����͸� ��ȸ�ϰ� ���� �� ���(���� ����)
-- 10�� �μ��� �Ҽӵ� ����� ��� ������ ǥ��
-- DATABASE�� ���ٶ�� �ǹ̴� ���α׷��� ���� �޸� =(1��) ��
SELECT * FROM emp
WHERE deptno = 10;

SELECT EMPNO,ENAME,JOB,SAL FROM EMP
WHERE SAL >2500; 

SELECT *
FROM EMP
WHERE SAL * 12 = 36000; --��� ������, *,-,+,/


SELECT * 
FROM EMP 
WHERE COMM > 300; --�� ������ > ,>= ,< ,<=

SELECT * FROM EMP
WHERE HIREDATE < '81/01/01'; -- ��¥ ������ ���������� Ư���� �������� ���� ��, ũ��/�۴� �� ����

SELECT * FROM EMP
WHERE ename = 'WARD';

--[���� ������ ǥ���ϴ� �������� ���]
SELECT * FROM EMP
-- WHERE deptno != 30;               ��
-- WHERE deptno <> 30;               ��
-- WHERE deptno ^= 30;          4���� ��� �����ʴ��� ���
-- WHERE NOT deptno = 30;             ��

--[�������� : AND, OR, NOT]
SELECT * FROM EMP
WHERE sal >= 3000 AND DEPTNO = 20; --�޿��� 3000�̻��̰� �μ��� 30���� ����� ���

SELECT * FROM EMP
WHERE sal >= 3000 OR DEPTNO = 20; --�޿��� 3000�̻��̰ų� �μ��� 20���� ����� ���

SELECT * FROM EMP
WHERE sal >= 3000 AND (DEPTNO = 20 OR HIREDATE < '82/01/01')



SELECT * FROM EMP


SELECT * FROM EMP
WHERE SAL >= 2500 AND JOB = 'MANAGER';  --���ڿ� �񱳴� ''

-- IN ������
SELECT * FROM EMP
WHERE JOB = 'MANAGER' OR JOB = 'SALESMAN' OR JOB = 'CLERK'
--�� �Ʒ� ����
SELECT * FROM EMP
WHERE JOB IN ('MANAGER', 'CLERK', 'SALESMAN'); --���� x�� NOT in

SELECT * FROM EMP
WHERE DEPTNO IN(10,20);


SELECT * FROM EMP
WHERE SAL >=2000 AND SAL <= 3000;
--�� �Ʒ� ����
SELECT * FROM EMP
WHERE sal BETWEEN 2000 AND 3000;

-- 1980���� �ƴ� �ؿ� �Ի��� ������ ��ȸ
SELECT * FROM EMP
WHERE NOT HIREDATE BETWEEN '1980/01/01' AND '1980/12/31'

-- LIKE, NOT LIKE ������ : ������ �Ϻθ� �˻��� �� ���
-- % : ���̿� ������� ��� ���� �����͸� �ǹ� (���̰� 0~���Ѵ�)
-- _ : ���� 1���� �ǹ�
SELECT empno, ename FROM EMP
WHERE ENAME LIKE '%K%'; --�̸��� k�� ���ԵǾ��ִ� ��� �����

--��� �̸��� �� ��° ���ڰ� L�� ����� ���
SELECT * FROM EMP
WHERE ENAME LIKE '_L%'

-- IS NULL : NULL ���θ� Ȯ��
-- NULL�� ���� �������� ������ �ǹ�(��Ȯ�� ����), ����, �Ҵ�, �񱳺Ұ�. NULL�� ������ �����ϸ� ����� NULL
SELECT ename, sal, sal*12+comm AS "����", COMM
FROM EMP;

-- �Ʒ��� �ڵ忡�� NULL�� �񱳺Ұ��̹Ƿ� ���� ������ ����
SELECT * FROM EMP
WHERE comm = NULL;


SELECT * FROM EMP
WHERE comm IS NULL;

-- ������ ���� ORDER BY ��  ASC = �������� // DESC =��������
SELECT * FROM EMP
ORDER BY SAL ; --���� ������ ���� ������ �ش� �÷� �������� �������� ������

SELECT * FROM emp
ORDER BY sal ASC; 

SELECT * FROM emp
ORDER BY sal DESC;

--���ÿ�
SELECT * FROM emp
ORDER BY deptno ASC, SAL DESC;

--���Ῥ����

SELECT ENAME || 'S JOB IS '||JOB AS EMPLOYEE
FROM EMP;


SELECT *
  FROM EMP
 WHERE ENAME LIKE '%S';


SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
  FROM EMP 
 WHERE DEPTNO = 30 AND JOB = 'SALESMAN';

SELECT empno, ename,sal,deptno
FROM EMP
WHERE DEPTNO IN(20,30) AND sal > 2000;

SELECT *FROM EMP
WHERE sal<=2000 or sal >=3000

SELECT ename,empno,sal,deptno
FROM EMP
WHERE ENAME LIKE '%E%'
AND DEPTNO = 30
AND sal NOT BETWEEN 1000 AND 2000;

SELECT *
FROM EMP
WHERE COMM IS NULL
AND MGR IS NOT NULL
AND JOB IN ('MANAGER', 'CLERK')
AND ENAME NOT LIKE '_L%';


--���� �Լ� : ������ ������ ó���ϱ� ���� �Լ��� �ǹ�
-- DUAL ���̺� : SYS �������� �����ϴ� ���̺�, �Լ��� ������ ���̺� ���� ���� ������ �� �ֵ��� ����
-- ABS : ���밪�� ����
SELECT -10, ABS(-10) FROM dual;
-- ROUND : �ݿø��� ����� ��ȯ, �ݿø��� ��ġ�� ������ �� ������ ��������������, 0�� ��ġ���� �ݿø�
?SELECT ROUND(1234.5678) AS Round,--��ġ�� �������� ������ 0�� ��ġ
	ROUND(1234.5678, 0) AS round_0,
	ROUND(1234.5678, 1) AS round_1,
	ROUND(1234.5678, 2) AS round_2,
	ROUND(1234.5678, -1) AS round_minus1,
	ROUND(1234.5678, -2) AS round_minus2
FROM DUAL;

--TRUNC : ������ �� ����� ��ȯ�ϴ� �Լ�
?SELECT ROUND(1234.5678) AS TRUNC,
	TRUNC(1234.5678, 0) AS round_0,
	TRUNC(1234.5678, 1) AS round_1,
	TRUNC(1234.5678, 2) AS round_2,
	TRUNC(1234.5678, -1) AS round_minus1,
	TRUNC(1234.5678, -2) AS round_minus2
FROM DUAL;

-- MOD : ������ �� �� �������� ����ϴ� �Լ�
SELECT MOD(21,5) FROM dual;

-- CEIL : �Ҽ��� ���ϰ� ������ ������ �ø�
SELECT CEIL(12.345) FROM dual;

-- FLOOR : �Ҽ��� ���ϸ� ������ ����
SELECT FLOOR(12.545) FROM dual;

-- POWER : ���� A�� ���� B��ŭ �����ϴ� �Լ�
SELECT POWER(2,3) FROM dual;

-- ���� �Լ� : ���� �����͸� �����ϰų� ���� �����ͷ� ���� Ư�� ����� ����� �� �� ���
SELECT ename, UPPER(ename), LOWER(ename), INITCAP(ename)
FROM EMP;

-- ���ڿ� ���̸� ���ϴ� LENGTH �Լ�
SELECT ename, LENGTH(ename) FROM EMP;

--LENGTH(���ڿ� ����)�� LENGTHB(���ڿ��� ����Ʈ ��) �Լ� ��
SELECT LENGTH('�ѱ�'), LENGTH('ENG'), LENGTHB('�ѱ�'), LENGTHB('ENG')
FROM dual;

-- SUBSTR(���, ������ġ, ����) / SUBSTRB
-- ��� ���ڿ��� ������ġ���� ������ ������ŭ ���ڸ� ��ȯ
-- �����ͺ��̽��� ���α׷��� ���� �޸� 0���� �����ϴ� �ε����� �ƴ�
SELECT job, SUBSTR(job, 1, 2), SUBSTR(job, 3,2),SUBSTR(job, 5)
FROM EMP;

-- �������� �ڿ������� ���
SELECT job, SUBSTR(JOB, -LENGTH(job)),
	SUBSTR(job, -LENGTH(job), 2),
	SUBSTR(job, -3)
FROM emp;

-- INSTR : ���ڿ� ������ �ȿ� Ư�����ڳ� ���ڿ��� ��� ���ԵǾ� �ִ����� �˾� �� �� ���
SELECT INSTR('HELLO, ORACLE!', 'L') AS INSTR_1, -- ó������ �˻�
 INSTR('HELLO, ORACLE!', 'L', 5) AS INSTR_2, -- 5��° ���� �˻�
 INSTR('HELLO, ORACLE!', 'L', 2, 2) AS INSTR_3 -- 2��°���� �˻��ϴµ� �ش� ���ڰ� 2��° ��Ÿ���� ��
FROM DUAL;

--Ư�� ���ڰ� ���Ե� �� ã��
SELECT *FROM EMP
WHERE INSTR(ENAME, 'S') > 0;

SELECT * FROM EMP
WHERE ename LIKE '%S%';

-- REPLACE : Ư�� ���ڿ��� �����Ϳ� ���Ե� ���ڸ� �ٸ� ���ڷ� ��ü�� �� ���
SELECT '010-1234-5678' AS repalce_before,
	REPLACE('010-1234-5678', '-', ' ') AS replace1,
	REPLACE('010-1234-5678', '-') AS replace2
FROM dual;

-- LPAD/ RPAD : ���� ���� ĭ���� �����ϰ� ��ĭ ��ŭ Ư�� ���ڷ� ä��� �Լ�
SELECT LPAD('ORACLE',10,'+') FROM dual;
SELECT RPAD('ORACLE',10,'+') FROM dual;

--�������� ���ڸ��� *�� ǥ���ϱ�
SELECT RPAD('971215-', 14, '*') AS rpad_jumin,
 	RPAD('010-1234-',13,'*') AS rpad_phone
FROM dual;

-- �� ���ڿ��� ��ġ�� CONCAT �Լ�
SELECT CONCAT(empno,ename), CONCAT(empno, CONCAT(' : ', ename))
FROM EMP
WHERE ename= 'JAMES';

-- TRIM / LTRIM / RTRIM : ���ڿ� ������ ������ Ư�� ���ڸ� ����� ���� ���
SELECT '[' || TRIM(' _Oracle_ ') || ']' AS TRIM,
 '[' || LTRIM(' _Oracle_ ') || ']' AS LTRIM,
 '[' || LTRIM('<_Oracle_>', '<_') || ']' AS LTRIM_2,
 '[' || RTRIM(' _Oracle_ ') || ']' AS RTRIM,
 '[' || RTRIM('<_Oracle_>', '_>') || ']' AS RTRIM_2
 FROM DUAL;

-- ��¥ �����͸� �ٷ�� ��¥ �Լ� 
-- SYSDATE : �ü���κ��� �ð��� �о��
SELECT SYSDATE FROM dual;

SELECT SYSDATE AS "���� �ð�",
	SYSDATE -1 AS "����",
	SYSDATE +1 AS "����"
FROM DUAL;

-- �� ���� ������ ��¥�� ���ϴ� ADD_MONTHS �Լ�

SELECT SYSDATE AS "����",
    ADD_MONTHS(SYSDATE, 3) AS "�� �� ��" --���ݺ��� 3���� ������ ��¥
FROM DUAL;
--�Ի� 10�ֳ��� �Ǵ� ����� ������ ����ϱ�
SELECT empno, ename, hiredate,
	ADD_MONTHS(hiredate, 120) AS "�Ի� 10�ֳ�"
FROM EMP

--�������� : SYSDATE�� ADD_MONTHS �Լ��� ����Ͽ� ���� ��¥�� 6���� ���� ��¥�� ��µǵ���
SELECT SYSDATE AS "���� ��¥",
 ADD_MONTHS(SYSDATE, 6) AS "6�� ��"
 FROM DUAL;

-- ���ƿ��� ���� NETX_DAY, ���� ������ ��¥�� ���ϴ� LAST_DAY
SELECT SYSDATE,
	NEXT_DAY(SYSDATE, '������'),
	LAST_DAY(SYSDATE)
FROM dual;

--��¥ ���� ���� �Լ�
SELECT EXTRACT(YEAR FROM DATE '2024-03-26')
FROM dual;


SELECT * FROM EMP
WHERE EXTRACT(MONTH FROM hiredate) = 12;

--�ڷ����� ��ȯ�ϴ� �� ��ȯ �Լ�
SELECT empno, ename, empno + '500'
FROM EMP
WHERE ename = 'FORD';

--��¥, ���ڸ� ���ڷ� ��ȯ�ϴ� TO_CHAR �Լ�
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS') AS "���糯¥�ð�"
FROM dual;

SELECT SYSDATE FROM dual;

SELECT SYSDATE,
     TO_CHAR(SYSDATE, 'HH24:MI:SS') AS HH24MISS,
     TO_CHAR(SYSDATE, 'HH12:MI:SS AM') AS HHMISS_AM,
     TO_CHAR(SYSDATE, 'HH:MI:SS P.M.') AS HHMISS_PM
FROM DUAL;

--���� ������ ������ �����Ͽ� ����ϱ�
SELECT SAL,
     TO_CHAR(SAL, '$999,999') AS SAL_$,
     TO_CHAR(SAL, 'L999,999') AS SAL_L,
     TO_CHAR(SAL, '999,999.00') AS SAL_1,
     TO_CHAR(SAL, '000,999,999.00') AS SAL_2,
     TO_CHAR(SAL, '000999999.99') AS SAL_3,
     TO_CHAR(SAL, '999,999,00') AS SAL_4
FROM EMP;

SELECT '1300' - '1200' FROM DUAL;
SELECT TO_NUMBER('1300') - '1000' FROM dual;

--TO_DATE : ���ڿ��� ��õ� ��¥�� ��ȯ�ϴ��Լ�
SELECT TO_DATE('22/08/20', 'YY/MM/DD')
FROM dual;

--NULL ó�� �Լ� : NULL �̶� Ư������ �࿡ ������ ���� �������� ������ �����Ͱ��� NULL�� ��
--NULL�� 0�̳� ������� �ٸ��ǹ�, ���굵 �ȵǰ� �񱳵� �ȵ�
-- NVL
SELECT empno, ename, sal, comm, sal+comm,
	NVL(COMM,0),
	sal + NVL(comm, 0)
FROM emp;

--NVL2 : �Է� �����Ͱ� NULL�� �ƴϸ� �� ��° �Ű����� ������ ��ȯ, NULL�̸� 3��° �Ű����� ������ ��ȯ
SELECT EMPNO, ENAME, COMM,
     NVL2(COMM, 'O', 'X'),
     NVL2(COMM, SAL*12+COMM, SAL*12) AS ANNSAL
FROM EMP;

SELECT NULLIF(10, 10), NULLIF('A', 'B') FROM dual;


-- ��������
--1.EMP���̺��� COMM �� ���� NULL�� �ƴ� ���� ��ȸ
SELECT * 
FROM EMP
WHERE COMM IS NOT NULL; 

--2. EMP���̺��� Ŀ�̼��� ���� ���ϴ� ���� ��ȸ
SELECT *
FROM EMP
WHERE COMM IS NULL OR COMM = 0

--3.EMP���̺��� �����ڰ� ���� ���� ���� ��ȸ
SELECT *
FROM EMP
WHERE MGR IS NULL

--4.EMP���̺��� �޿��� ���� �޴� ���� ������ ��ȸ
SELECT *
FROM EMP
ORDER BY SAL DESC;

--5.EMP���̺��� �޿��� ���� ��� Ŀ�̼��� �������� ���� ��ȸ
SELECT *
FROM EMP
ORDER BY SAL DESC, Comm DESC;

--6.EMP���̺��� �����ȣ, �����,����, �Ի��� ��ȸ (��, �Ի����� �������� ���� ó��)
SELECT empno,ename,job,hiredate
FROM EMP
ORDER BY HIREDATE;

--7.EMP���̺��� �����ȣ, ����� ��ȸ (�����ȣ ���� �������� ����)
SELECT empno,ename
FROM EMP
ORDER BY HIREDATE DESC;

--8.EMP���̺��� ���, �Ի���, �����, �޿� ��ȸ (�μ���ȣ�� ���� ������, ���� �μ���ȣ�� ���� �ֱ� �Ի��� ������ ó��)
SELECT empno,hiredate,ename,sal
FROM EMP
ORDER BY DEPTNO , hiredate DESC

--9.���� ��¥�� ���� ���� ��ȸ
SELECT SYSDATE 
FROM DUAL;

--10.EMP���̺��� ���, �����, �޿� ��ȸ  (��, �޿��� 100���������� ���� ��� ó���ϰ� �޿� ���� �������� ����)
SELECT EMPNO , ENAME ,TRUNC(SAL, -2) AS SAL 
FROM EMP;

--11.EMP���̺��� �����ȣ�� Ȧ���� ������� ��ȸ
SELECT *
FROM EMP
WHERE MOD(EMPNO, 2) = 1;

--12.EMP���̺��� �����, �Ի��� ��ȸ (��, �Ի����� �⵵�� ���� �и� �����ؼ� ���)
SELECT ename,EXTRACT(YEAR  FROM hiredate) "�Ի� �⵵", EXTRACT(MONTH FROM hiredate) "�Ի� ��"
FROM EMP

--13.EMP���̺��� 9���� �Ի��� ������ ���� ��ȸ
SELECT *
FROM EMP
WHERE EXTRACT(MONTH FROM hiredate) =9

--14.EMP���̺��� 81�⵵�� �Ի��� ���� ��ȸ
SELECT *
FROM EMP
WHERE EXTRACT(YEAR  FROM hiredate) =1981

--15.EMP���̺��� �̸��� 'E'�� ������ ���� ��ȸ
SELECT *
FROM EMP
WHERE ename LIKE'%E'

--16.EMP���̺��� �̸��� �� ��° ���ڰ� 'R'�� ������ ���� ��ȸ
SELECT *
FROM EMP
WHERE ENAME LIKE '__R%'

--17.EMP���̺��� ���, �����, �Ի���, �Ի��Ϸκ��� 40�� �Ǵ� ��¥ ��ȸ
SELECT empno, ename, hiredate,
	ADD_MONTHS(hiredate, 480) AS "�Ի� 40�ֳ�"
FROM EMP

--18.EMP���̺��� �Ի��Ϸκ��� 38�� �̻� �ٹ��� ������ ���� ��ȸ
SELECT * 
FROM EMP
WHERE (SYSDATE-HIREDATE) > 13870 

SELECT *
FROM EMP
WHERE MONTHS_BETWEEN(SYSDATE, HIREDATE)/12 >= 38;



-- 19. ���� ��¥���� �⵵�� ����
SELECT EXTRACT(YEAR FROM SYSDATE)
FROM DUAL;

-- ������ �Լ� : ���� �࿡ ���� �Լ��� ����Ǿ� �ϳ��� ����� ��Ÿ���� �Լ�, ���� �Լ���� ��
SELECT SUM(sal)
FROM EMP;

--GROUP BY : �׷����� �����ִ� �Լ�
SELECT deptno, SUM(SAL)  --3.�μ��� �μ��� �޿��� �հ踦 ���
FROM EMP                 --1.���� ��� ���̺��� ���� ��
GROUP BY DEPTNO;         --2.��� ���̺��� �μ� ������ ����

-- ��� ����� �޿��� ������ �հ� ���ϱ�
SELECT sum(sal),sum(comm)
FROM EMP;

-- ���̺��� ������ ���� ���
SELECT COUNT(*)
FROM EMP;

-- 30�� �μ��� ��� �� ���
SELECT COUNT(*)
FROM EMP
WHERE DEPTNO = 30;

SELECT COUNT(comm)
FROM EMP
WHERE comm IS NOT NULL;

--10�� �μ��� ��� �� �ִ� �޿� ����ϱ�
SELECT MAX(SAL)
FROM EMP
WHERE DEPTNO = 10;

--30�� �μ��� ��� �޿�
SELECT AVG(SAL)
FROM EMP
WHERE DEPTNO = 30;

--�μ��� ��� �޿�
SELECT AVG(SAL), deptno
FROM EMP
GROUP BY DEPTNO;

SELECT AVG(SAL) FROM EMP WHERE deptno = 10
UNION ALL
SELECT AVG(SAL) FROM EMP WHERE DEPTNO = 20
UNION ALL 
SELECT AVG(SAL) FROM EMP WHERE DEPTNO = 30;

--�μ���ȣ �� ��å�� ��� �޿��� �����ϱ�
SELECT deptno,job,AVG(sal)
FROM EMP
GROUP BY DEPTNO, JOB 
ORDER BY DEPTNO, JOB

--�μ� �ڵ�, �޿� �հ�, �μ� ��� �޿�, �ο� �� ���ķ� ����ϱ�
SELECT deptno AS "�μ� �ڵ�",
	SUM(SAL) AS "�޿� �հ�",
	ROUND(AVG(SAL)) AS "��� �޿�",
	COUNT(*) AS "�ο� ��"
FROM EMP
GROUP BY DEPTNO
ORDER BY DEPTNO;

-- ���� 1.FROM 2.WHERE 3.GROUP BY 4.HAVING 5.SELECT 6.ORDER BY

-- HAVING �� : GROUP BY ���� ������ ���� ���, GROUP BY���� ���� �׷�ȭ�� ��� ���� ������ �����ϴµ� ���
 SELECT job, AVG(SAL)
 FROM EMP
 WHERE DEPTNO = 10
 GROUP BY JOB
 	HAVING AVG(sal) >= 2000
 ORDER BY JOB; 
 
-- 1. HAVING���� ����Ͽ� �μ��� ��å�� ��� �޿��� 500 �̻��� ������� �μ���ȣ,��å,��ձ޿� ���
SELECT deptno,job,AVG(SAl)
FROM EMP
GROUP BY DEPTNO,job
	HAVING AVG(sal) >= 500
ORDER BY DEPTNO ,JOB;


-- 2.�μ���ȣ, ��ձ޿�, �ְ�޿�,�����޿�, ����� ��� / �� ��� �޿��� �Ҽ��� �����ϰ� �μ� ��ȣ�� ���
SELECT deptno,ROUND(AVG(SAL)),MAX(SAL),MIn(SAL),COUNT(*)
FROM EMP
GROUP BY DEPTNO;

-- 3. ���� ��å�� �����ϴ� ����� 3�� �̻��� ��å�� �ο��� ���
SELECT job,COUNT(*)
FROM EMP
GROUP BY JOB
	HAVING COUNT(*) >= 3

-- 4. ������� �Ի� ������ �������� �μ����� �� ���� �Ի��ߴ��� ���
SELECT EXTRACT(YEAR FROM HIREDATE) AS "�Ի� �⵵", deptno,count(*)
FROM EMP
GROUP BY DEPTNO,EXTRACT(year FROM HIREDATE)
ORDER BY EXTRACT(YEAR FROM HIREDATE),deptno

SELECT TO_CHAR(hiredate, 'YYYY') AS "�Ի� �⵵", deptno,count(*)
FROM EMP
GROUP BY TO_CHAR(hiredate, 'YYYY'),deptno
ORDER BY "�Ի� �⵵"


-- 5. �߰� ������ �޴� ����� ���� �ʴ� ��� �� ���, �߰� ���� ���δ� O,X�� ǥ��
SELECT 
    CASE WHEN (COMM IS NULL OR COMM = 0) THEN 'X' ELSE 'O' END AS "�߰� ���� ����",
    COUNT(*) AS "�ο� ��"
FROM EMP
GROUP BY 
    CASE WHEN (COMM IS NULL OR COMM = 0) THEN 'X' ELSE 'O' END;

   
-- 6. �� �μ��� �Ի� ������ ��� �� , �ְ� �޿�, �޿� ��, ��� �޿��� ���

SELECT EXTRACT(YEAR FROM HIREDATE), deptno,count(*),MAX(SAL),Sum(sal),AVG(SAL)
FROM EMP
GROUP BY DEPTNO,EXTRACT(year FROM HIREDATE)
ORDER BY DEPTNO

SELECT deptno,
	TO_CHAR(hiredate, 'YYYY') AS "�Ի�⵵",
	COUNT(*) AS "��� ��",
	MAX(sal) AS "�ְ� �޿�",
	ROUND(AVG(SAL)) AS "��� �޿�"
FROM EMP
GROUP BY deptno, TO_CHAR(hiredate, 'YYYY')
ORDER BY DEPTNO

-- ROLLUP �Լ� : �׷츶�� �߰���� ���������� ��ü���
SELECT deptno, job, COUNT(*), MAX(sal), SUM(sal), AVG(sal)
FROM EMP
GROUP BY ROLLUP(DEPTNO ,JOB);

-- ���� ������ : �� �� �̻��� ���� ����� �ϳ��� �����ϴ� ������(������ ó��)
SELECT empno, ename, job
FROM EMP
WHERE job = 'SALESMAN'
UNION
SELECT empno, ename, job
FROM EMP
WHERE job = 'MANAGER'
ORDER BY JOB

-- ����(JOIN) : �� �� �̻��� ���̺��� �����͸� �����ͼ� �����ϴµ� ���Ǵ� SQL ���
-- ���̺� ���� �ĺ� ���� Promary Key�� ���̺� ���� ���밪�� Foreign Key���� ����Ͽ� ����
-- ���� ����(���� ����, inner join)�̸� ����Ŭ ���, ���ʿ� ������ �÷��� �ִ� ��� ���̺� �̸��� ǥ���ؾ� ��
SELECT empno, ename, mgr,sal, e.DEPTNO
FROM emp e, dept d
WHERE e.DEPTNO = d.DEPTNO
AND sal >= 3000;	

-- ANSI ���
SELECT empno,ename,mgr,sal,e.DEPTNO
FROM EMP e JOIN DEPT d
ON e.DEPTNO = d.DEPTNO
WHERE sal >= 3000;

SELECT E.EMPNO, E.ENAME, D.DEPTNO, D.DNAME,D.LOC  
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE sal <= 2500 AND EMPNO <=9999
ORDER BY DEPTNO 

-- �� ���� : ������ �÷��� ���� �� ����ϴ� ����(�Ϲ������� ���� �������� ����)
SELECT * FROM emp;
SELECT * FROM SALGRADE;
SELECT e.ENAME, e.SAL,s.GRADE
FROM EMP e JOIN SALGRADE s 
ON e.SAL BETWEEN s.LOSAL AND s.HISAL

-- ��ü ���� : ���� ���̺��� �����ؼ� ���� ��� ã�� �� �� ���
SELECT e1.EMPNO, e1.ENAME, e1.MGR,
	e2.EMPNO AS"��� �����ȣ",
	e2.ENAME AS"��� �̸�"
FROM EMP e1 JOIN EMP e2
ON e1.MGR = e2.EMPNO

--�ܺ� ����(Left outer join) : ������ �κ��� �ִ� ���� �ִ� ���̺�(+)
SELECT e.ENAME, e.DEPTNO, d.DNAME
FROM EMP e, DEPT d
WHERE e.DEPTNO(+) = d.DEPTNO
ORDER BY e.DEPTNO;

SELECT e.ENAME, e.DEPTNO, d.DNAME
FROM EMP e FULL OUTER JOIN DEPT D
ON e.DEPTNO = d.DEPTNO
ORDER BY e.DEPTNO;

-- NATURAL JOIN : ���������� ����ϴ� �ٸ� ���, ������ ���� ���, �� ���̺��� ���� ���� �ڵ����� ����
SELECT e.EMPNO, e.ENAME, d.DNAME, DEPTNO --DEPTNO�� ��ġ�� ������ e,d�� ���� �ȵ�
FROM EMP e NATURAL JOIN DEPT d;

--�� �Ʒ� ���� �ڵ�

--JOIN ~ USING : ��������(�����)�� ����ϴ� ��� ���� �ϳ�
SELECT e.EMPNO, e.ENAME, d.DNAME, DEPTNO, e.sal
FROM EMP e JOIN DEPT d USING(DEPTNO)
WHERE sal >=3000
ORDER BY deptno, e.EMPNO

--�������� 1 : �޿��� 2000 �ʰ��� ������� �μ� ����, ��� ���� ��� (SQL -99 ���)
SELECT DEPTNO, DNAME,EMPNO,ENAME,SAL
FROM EMP NATURAL JOIN DEPT
WHERE SAL >=2000

--�������� 2 : �μ��� ��� �޿�, �ִ� �޿�, �ּ� �޿�, ��� �� ���(ANSI JOIN ���)
SELECT d.DEPTNO, DNAME,
	ROUND(AVG(SAL)) AS "��� �޿�",
	MAX(SAL) AS "�ִ� �޿�",
	MIN(SAL) AS "�ּ� �޿�",
	COUNT(*) AS "��� ��"
FROM EMP e JOIN DEPT d
ON e.DEPTNO = d.DEPTNO
GROUP BY d.DEPTNO, d.DNAME;

SELECT d.DEPTNO, d.DNAME, e.EMPNO, e.ENAME, e.JOB, e.SAL
FROM EMP e RIGHT OUTER JOIN DEPT d
ON e.DEPTNO = d.DEPTNO
ORDER BY DEPTNO, e.ENAME

SELECT ENAME,HIREDATE,DEPTNO
FROM EMP
WHERE EMPNO = 7499

SELECT *
FROM EMP
WHERE ENAME = 'ALLEN'

SELECT *
FROM EMP
WHERE UPPER(ENAME) > UPPER('K')

SELECT ENAME, SAL, DEPTNO,HIREDATE 
FROM EMP
WHERE HIREDATE BETWEEN '1981-04-03' AND '1982-12-09'

SELECT ename,job,sal
FROM EMP
WHERE SAL > 1600 AND SAL < 3000

SELECT *
FROM EMP
WHERE NOT HIREDATE BETWEEN '1981-01-01' AND '1981-12-31'

SELECT *
FROM EMP
WHERE job = 'MANAGER' OR job = 'SALESMAN'

SELECT *
FROM EMP
WHERE DEPTNO != 30 AND DEPTNO != 20 --DEPTNO NOT IN(20,30)�� ����

SELECT EMPNO, ENAME, DEPTNO
FROM EMP
WHERE ENAME LIKE 'S%'

SELECT *
FROM EMP e 
WHERE ENAME LIKE '_A%'

SELECT *
FROM EMP e 
WHERE comm IS NOT NULL

SELECT *
FROM EMP e 
WHERE ENAME LIKE 'J%S'

SELECT *
FROM EMP e 
WHERE sal > 1500 
AND DEPTNO = 30 
AND job = 'MANAGER' 

SELECT ENAME, SAL,NVL(COMM,0),SAL+NVL(COMM,0)  AS "�Ѿ�" 
FROM EMP
ORDER BY "�Ѿ�" DESC