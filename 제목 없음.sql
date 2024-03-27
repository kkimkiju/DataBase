SELECT * FROM EMP
-- SELECT문은 데이터베이스에 보관되어있는 데이터를 조회할 때 사용
-- SELECT : 조회할 열 이름 또는 출력할 데이터를 지정 ,*은 모든 컬럼을 의미
-- FROM : 조회할 테이블을 지정
SELECT EMPNO,ENAME,DEPTNO
FROM EMP;
-- [SQL문 작성 유의사항]
-- SQL문 대/소문자 구분하지 않음
-- 한 줄 또는 여러 줄에 입력 될 수 있음
-- 일반적으로 키워드는 대문자로 입력
-- SQL 문의 마지막 절은 ;을 기술하여 명령의 끝을 표시

-- 열과 연산식을 함께 사용할 수 있음
-- 컬럼 이름은 보기좋게 별칭을 사용할 수 있음 / AS, "" 은 사용해도 되고 안 해도 됨 문장내의 공백이 있는 경우에는 반드시 사용해야 함
SELECT ENAME, SAL, SAL*12+COMM 연봉, COMM
FROM EMP;

SELECT ENAME "성명", SAL "급여", SAL*12*COMM "연봉"
FROM EMP;

-- 중복을 제거하는 DISTINCT : 데이터를 조회할 때 중복되는 행이 여러 개 조회될 때 사용
-- 값이 중복된 행을 한 개씩만 표시할 때 사용
SELECT DEPTNO FROM EMP; -- 사원의 부서 번호를 표시함
SELECT DISTINCT DEPTNO FROM EMP;
SELECT JOB, DEPTNO FROM EMP;
SELECT DISTINCT JOB, DEPTNO FROM EMP; --직책과 부서 두 가지 조건에 대해 중복 제거

-- WHERE 구문 : 사용자가 원하는 조건에 맞는 데이터만 조회하고 싶을 때 사용(행을 제한)
-- 10번 부서에 소속된 사원의 모든 정보를 표시
-- DATABASE의 같다라는 의미는 프로그래밍 언어와 달리 =(1개) 임
SELECT * FROM emp
WHERE deptno = 10;

SELECT EMPNO,ENAME,JOB,SAL FROM EMP
WHERE SAL >2500; 

SELECT *
FROM EMP
WHERE SAL * 12 = 36000; --산술 연산자, *,-,+,/


SELECT * 
FROM EMP 
WHERE COMM > 300; --비교 연산자 > ,>= ,< ,<=

SELECT * FROM EMP
WHERE HIREDATE < '81/01/01'; -- 날짜 정보는 내부적으로 특수한 유형으로 관리 됨, 크다/작다 비교 가능

SELECT * FROM EMP
WHERE ename = 'WARD';

--[같지 않음을 표현하는 여러가지 방법]
SELECT * FROM EMP
-- WHERE deptno != 30;               ㅣ
-- WHERE deptno <> 30;               ㅣ
-- WHERE deptno ^= 30;          4가지 모두 같지않다의 방법
-- WHERE NOT deptno = 30;             ㅣ

--[논리연산자 : AND, OR, NOT]
SELECT * FROM EMP
WHERE sal >= 3000 AND DEPTNO = 20; --급여가 3000이상이고 부서가 30번인 대상자 출력

SELECT * FROM EMP
WHERE sal >= 3000 OR DEPTNO = 20; --급여가 3000이상이거나 부서가 20번인 대상자 출력

SELECT * FROM EMP
WHERE sal >= 3000 AND (DEPTNO = 20 OR HIREDATE < '82/01/01')



SELECT * FROM EMP


SELECT * FROM EMP
WHERE SAL >= 2500 AND JOB = 'MANAGER';  --문자열 비교는 ''

-- IN 연산자
SELECT * FROM EMP
WHERE JOB = 'MANAGER' OR JOB = 'SALESMAN' OR JOB = 'CLERK'
--위 아래 같음
SELECT * FROM EMP
WHERE JOB IN ('MANAGER', 'CLERK', 'SALESMAN'); --포함 x는 NOT in

SELECT * FROM EMP
WHERE DEPTNO IN(10,20);


SELECT * FROM EMP
WHERE SAL >=2000 AND SAL <= 3000;
--위 아래 같음
SELECT * FROM EMP
WHERE sal BETWEEN 2000 AND 3000;

-- 1980년이 아닌 해에 입사한 직원을 조회
SELECT * FROM EMP
WHERE NOT HIREDATE BETWEEN '1980/01/01' AND '1980/12/31'

-- LIKE, NOT LIKE 연산자 : 내용의 일부를 검색할 때 사용
-- % : 길이와 상관없이 모든 문자 데이터를 의미 (길이가 0~무한대)
-- _ : 문자 1개를 의미
SELECT empno, ename FROM EMP
WHERE ENAME LIKE '%K%'; --이름에 k가 포함되어있는 모든 대상자

--사원 이름의 두 번째 글자가 L인 사원만 출력
SELECT * FROM EMP
WHERE ENAME LIKE '_L%'

-- IS NULL : NULL 여부를 확인
-- NULL은 값이 존재하지 않음을 의미(미확정 상태), 연산, 할당, 비교불가. NULL과 연산을 수행하면 결과가 NULL
SELECT ename, sal, sal*12+comm AS "연봉", COMM
FROM EMP;

-- 아래의 코드에서 NULL은 비교불가이므로 값이 나오지 않음
SELECT * FROM EMP
WHERE comm = NULL;


SELECT * FROM EMP
WHERE comm IS NULL;

-- 정렬을 위한 ORDER BY 절  ASC = 오름차순 // DESC =내림차순
SELECT * FROM EMP
ORDER BY SAL ; --정렬 조건을 넣지 않으면 해당 컬럼 기준으로 오름차순 정렬함

SELECT * FROM emp
ORDER BY sal ASC; 

SELECT * FROM emp
ORDER BY sal DESC;

--동시에
SELECT * FROM emp
ORDER BY deptno ASC, SAL DESC;

--연결연산자

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


--숫자 함수 : 수학적 계산식을 처리하기 위한 함수를 의미
-- DUAL 테이블 : SYS 계정에서 제공하는 테이블, 함수나 계산식을 테이블 참조 없이 실행할 수 있도록 제공
-- ABS : 절대값을 구함
SELECT -10, ABS(-10) FROM dual;
-- ROUND : 반올림한 결과를 반환, 반올림할 위치를 지정할 수 있으며 지정하지않으면, 0의 위치에서 반올림
?SELECT ROUND(1234.5678) AS Round,--위치를 지정하지 않으면 0의 위치
	ROUND(1234.5678, 0) AS round_0,
	ROUND(1234.5678, 1) AS round_1,
	ROUND(1234.5678, 2) AS round_2,
	ROUND(1234.5678, -1) AS round_minus1,
	ROUND(1234.5678, -2) AS round_minus2
FROM DUAL;

--TRUNC : 버림을 한 결과를 반환하는 함수
?SELECT ROUND(1234.5678) AS TRUNC,
	TRUNC(1234.5678, 0) AS round_0,
	TRUNC(1234.5678, 1) AS round_1,
	TRUNC(1234.5678, 2) AS round_2,
	TRUNC(1234.5678, -1) AS round_minus1,
	TRUNC(1234.5678, -2) AS round_minus2
FROM DUAL;

-- MOD : 나누기 한 후 나머지를 출력하는 함수
SELECT MOD(21,5) FROM dual;

-- CEIL : 소수점 이하가 있으면 무조건 올림
SELECT CEIL(12.345) FROM dual;

-- FLOOR : 소수점 이하를 무조건 버림
SELECT FLOOR(12.545) FROM dual;

-- POWER : 정수 A를 정수 B만큼 제곱하는 함수
SELECT POWER(2,3) FROM dual;

-- 문자 함수 : 문자 데이터를 가공하거나 문자 데이터로 부터 특정 결과를 얻고자 할 때 사용
SELECT ename, UPPER(ename), LOWER(ename), INITCAP(ename)
FROM EMP;

-- 문자열 길이를 구하는 LENGTH 함수
SELECT ename, LENGTH(ename) FROM EMP;

--LENGTH(문자열 길이)와 LENGTHB(문자열의 바이트 수) 함수 비교
SELECT LENGTH('한글'), LENGTH('ENG'), LENGTHB('한글'), LENGTHB('ENG')
FROM dual;

-- SUBSTR(대상, 시작위치, 길이) / SUBSTRB
-- 대상 문자열의 시작위치부터 선택한 개수만큼 문자를 반환
-- 데이터베이스는 프로그래밍 언어와 달리 0부터 시작하는 인덱스가 아님
SELECT job, SUBSTR(job, 1, 2), SUBSTR(job, 3,2),SUBSTR(job, 5)
FROM EMP;

-- 음수값은 뒤에서부터 계산
SELECT job, SUBSTR(JOB, -LENGTH(job)),
	SUBSTR(job, -LENGTH(job), 2),
	SUBSTR(job, -3)
FROM emp;

-- INSTR : 문자열 데이터 안에 특정문자나 문자열이 어디에 포함되어 있는지를 알아 낼 때 사용
SELECT INSTR('HELLO, ORACLE!', 'L') AS INSTR_1, -- 처음부터 검색
 INSTR('HELLO, ORACLE!', 'L', 5) AS INSTR_2, -- 5번째 부터 검색
 INSTR('HELLO, ORACLE!', 'L', 2, 2) AS INSTR_3 -- 2번째부터 검색하는데 해당 문자가 2번째 나타나는 값
FROM DUAL;

--특정 문자가 포함된 행 찾기
SELECT *FROM EMP
WHERE INSTR(ENAME, 'S') > 0;

SELECT * FROM EMP
WHERE ename LIKE '%S%';

-- REPLACE : 특정 문자열에 데이터에 포함된 문자를 다른 문자로 대체할 때 사용
SELECT '010-1234-5678' AS repalce_before,
	REPLACE('010-1234-5678', '-', ' ') AS replace1,
	REPLACE('010-1234-5678', '-') AS replace2
FROM dual;

-- LPAD/ RPAD : 기준 공간 칸수를 지정하고 빈칸 만큼 특정 문자로 채우는 함수
SELECT LPAD('ORACLE',10,'+') FROM dual;
SELECT RPAD('ORACLE',10,'+') FROM dual;

--개인정보 뒷자리를 *로 표시하기
SELECT RPAD('971215-', 14, '*') AS rpad_jumin,
 	RPAD('010-1234-',13,'*') AS rpad_phone
FROM dual;

-- 두 문자열을 합치는 CONCAT 함수
SELECT CONCAT(empno,ename), CONCAT(empno, CONCAT(' : ', ename))
FROM EMP
WHERE ename= 'JAMES';

-- TRIM / LTRIM / RTRIM : 문자열 데이터 내에서 특정 문자를 지우기 위해 사용
SELECT '[' || TRIM(' _Oracle_ ') || ']' AS TRIM,
 '[' || LTRIM(' _Oracle_ ') || ']' AS LTRIM,
 '[' || LTRIM('<_Oracle_>', '<_') || ']' AS LTRIM_2,
 '[' || RTRIM(' _Oracle_ ') || ']' AS RTRIM,
 '[' || RTRIM('<_Oracle_>', '_>') || ']' AS RTRIM_2
 FROM DUAL;

-- 날짜 데이터를 다루는 날짜 함수 
-- SYSDATE : 운영체제로부터 시간을 읽어옴
SELECT SYSDATE FROM dual;

SELECT SYSDATE AS "현재 시간",
	SYSDATE -1 AS "어제",
	SYSDATE +1 AS "내일"
FROM DUAL;

-- 몇 개월 이후의 날짜를 구하는 ADD_MONTHS 함수

SELECT SYSDATE AS "오늘",
    ADD_MONTHS(SYSDATE, 3) AS "세 달 뒤" --지금부터 3개월 이후의 날짜
FROM DUAL;
--입사 10주년이 되는 사원들 데이터 출력하기
SELECT empno, ename, hiredate,
	ADD_MONTHS(hiredate, 120) AS "입사 10주년"
FROM EMP

--연습문제 : SYSDATE와 ADD_MONTHS 함수를 사용하여 현재 날짜와 6개월 이후 날짜가 출력되도록
SELECT SYSDATE AS "현재 날짜",
 ADD_MONTHS(SYSDATE, 6) AS "6달 뒤"
 FROM DUAL;

-- 돌아오는 요일 NETX_DAY, 달의 마지막 날짜를 구하는 LAST_DAY
SELECT SYSDATE,
	NEXT_DAY(SYSDATE, '월요일'),
	LAST_DAY(SYSDATE)
FROM dual;

--날짜 정보 추출 함수
SELECT EXTRACT(YEAR FROM DATE '2024-03-26')
FROM dual;


SELECT * FROM EMP
WHERE EXTRACT(MONTH FROM hiredate) = 12;

--자료형을 변환하는 형 변환 함수
SELECT empno, ename, empno + '500'
FROM EMP
WHERE ename = 'FORD';

--날짜, 숫자를 문자로 변환하는 TO_CHAR 함수
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS') AS "현재날짜시간"
FROM dual;

SELECT SYSDATE FROM dual;

SELECT SYSDATE,
     TO_CHAR(SYSDATE, 'HH24:MI:SS') AS HH24MISS,
     TO_CHAR(SYSDATE, 'HH12:MI:SS AM') AS HHMISS_AM,
     TO_CHAR(SYSDATE, 'HH:MI:SS P.M.') AS HHMISS_PM
FROM DUAL;

--숫자 데이터 형식을 지정하여 출력하기
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

--TO_DATE : 문자열로 명시된 날짜로 변환하는함수
SELECT TO_DATE('22/08/20', 'YY/MM/DD')
FROM dual;

--NULL 처리 함수 : NULL 이란 특정열의 행에 데이터 값이 지정되지 않으면 데이터값이 NULL이 됨
--NULL은 0이나 공백과는 다른의미, 연산도 안되고 비교도 안됨
-- NVL
SELECT empno, ename, sal, comm, sal+comm,
	NVL(COMM,0),
	sal + NVL(comm, 0)
FROM emp;

--NVL2 : 입력 데이터가 NULL이 아니면 두 번째 매개변수 값으로 반환, NULL이면 3번째 매개변수 값으로 반환
SELECT EMPNO, ENAME, COMM,
     NVL2(COMM, 'O', 'X'),
     NVL2(COMM, SAL*12+COMM, SAL*12) AS ANNSAL
FROM EMP;

SELECT NULLIF(10, 10), NULLIF('A', 'B') FROM dual;


-- 연습문제
--1.EMP테이블에서 COMM 의 값이 NULL이 아닌 정보 조회
SELECT * 
FROM EMP
WHERE COMM IS NOT NULL; 

--2. EMP테이블에서 커미션을 받지 못하는 직원 조회
SELECT *
FROM EMP
WHERE COMM IS NULL OR COMM = 0

--3.EMP테이블에서 관리자가 없는 직원 정보 조회
SELECT *
FROM EMP
WHERE MGR IS NULL

--4.EMP테이블에서 급여를 많이 받는 직원 순으로 조회
SELECT *
FROM EMP
ORDER BY SAL DESC;

--5.EMP테이블에서 급여가 같을 경우 커미션을 내림차순 정렬 조회
SELECT *
FROM EMP
ORDER BY SAL DESC, Comm DESC;

--6.EMP테이블에서 사원번호, 사원명,직급, 입사일 조회 (단, 입사일을 오름차순 정렬 처리)
SELECT empno,ename,job,hiredate
FROM EMP
ORDER BY HIREDATE;

--7.EMP테이블에서 사원번호, 사원명 조회 (사원번호 기준 내림차순 정렬)
SELECT empno,ename
FROM EMP
ORDER BY HIREDATE DESC;

--8.EMP테이블에서 사번, 입사일, 사원명, 급여 조회 (부서번호가 빠른 순으로, 같은 부서번호일 때는 최근 입사일 순으로 처리)
SELECT empno,hiredate,ename,sal
FROM EMP
ORDER BY DEPTNO , hiredate DESC

--9.오늘 날짜에 대한 정보 조회
SELECT SYSDATE 
FROM DUAL;

--10.EMP테이블에서 사번, 사원명, 급여 조회  (단, 급여는 100단위까지의 값만 출력 처리하고 급여 기준 내림차순 정렬)
SELECT EMPNO , ENAME ,TRUNC(SAL, -2) AS SAL 
FROM EMP;

--11.EMP테이블에서 사원번호가 홀수인 사원들을 조회
SELECT *
FROM EMP
WHERE MOD(EMPNO, 2) = 1;

--12.EMP테이블에서 사원명, 입사일 조회 (단, 입사일은 년도와 월을 분리 추출해서 출력)
SELECT ename,EXTRACT(YEAR  FROM hiredate) "입사 년도", EXTRACT(MONTH FROM hiredate) "입사 월"
FROM EMP

--13.EMP테이블에서 9월에 입사한 직원의 정보 조회
SELECT *
FROM EMP
WHERE EXTRACT(MONTH FROM hiredate) =9

--14.EMP테이블에서 81년도에 입사한 직원 조회
SELECT *
FROM EMP
WHERE EXTRACT(YEAR  FROM hiredate) =1981

--15.EMP테이블에서 이름이 'E'로 끝나는 직원 조회
SELECT *
FROM EMP
WHERE ename LIKE'%E'

--16.EMP테이블에서 이름의 세 번째 글자가 'R'인 직원의 정보 조회
SELECT *
FROM EMP
WHERE ENAME LIKE '__R%'

--17.EMP테이블에서 사번, 사원명, 입사일, 입사일로부터 40년 되는 날짜 조회
SELECT empno, ename, hiredate,
	ADD_MONTHS(hiredate, 480) AS "입사 40주년"
FROM EMP

--18.EMP테이블에서 입사일로부터 38년 이상 근무한 직원의 정보 조회
SELECT * 
FROM EMP
WHERE (SYSDATE-HIREDATE) > 13870 

SELECT *
FROM EMP
WHERE MONTHS_BETWEEN(SYSDATE, HIREDATE)/12 >= 38;



-- 19. 오늘 날짜에서 년도만 추출
SELECT EXTRACT(YEAR FROM SYSDATE)
FROM DUAL;

-- 다중행 함수 : 여러 행에 대해 함수가 적용되어 하나의 결과를 나타내는 함수, 집계 함수라고도 함
SELECT SUM(sal)
FROM EMP;

--GROUP BY : 그룹으로 묶어주는 함수
SELECT deptno, SUM(SAL)  --3.부서와 부서의 급여의 합계를 출력
FROM EMP                 --1.먼저 사원 테이블을 가져 옴
GROUP BY DEPTNO;         --2.사원 테이블을 부서 단위로 묶음

-- 모든 사원의 급여와 수당의 합계 구하기
SELECT sum(sal),sum(comm)
FROM EMP;

-- 테이블의 데이터 개수 출력
SELECT COUNT(*)
FROM EMP;

-- 30번 부서의 사원 수 출력
SELECT COUNT(*)
FROM EMP
WHERE DEPTNO = 30;

SELECT COUNT(comm)
FROM EMP
WHERE comm IS NOT NULL;

--10번 부서의 사원 중 최대 급여 출력하기
SELECT MAX(SAL)
FROM EMP
WHERE DEPTNO = 10;

--30번 부서의 평균 급여
SELECT AVG(SAL)
FROM EMP
WHERE DEPTNO = 30;

--부서별 평균 급여
SELECT AVG(SAL), deptno
FROM EMP
GROUP BY DEPTNO;

SELECT AVG(SAL) FROM EMP WHERE deptno = 10
UNION ALL
SELECT AVG(SAL) FROM EMP WHERE DEPTNO = 20
UNION ALL 
SELECT AVG(SAL) FROM EMP WHERE DEPTNO = 30;

--부서번호 및 직책별 평균 급여로 정렬하기
SELECT deptno,job,AVG(sal)
FROM EMP
GROUP BY DEPTNO, JOB 
ORDER BY DEPTNO, JOB

--부서 코드, 급여 합계, 부서 평균 급여, 인원 순 정렬로 출력하기
SELECT deptno AS "부서 코드",
	SUM(SAL) AS "급여 합계",
	ROUND(AVG(SAL)) AS "평균 급여",
	COUNT(*) AS "인원 수"
FROM EMP
GROUP BY DEPTNO
ORDER BY DEPTNO;

-- 순서 1.FROM 2.WHERE 3.GROUP BY 4.HAVING 5.SELECT 6.ORDER BY

-- HAVING 절 : GROUP BY 절이 존재할 때만 사용, GROUP BY절을 통해 그룹화된 결과 값의 범위를 제한하는데 사용
 SELECT job, AVG(SAL)
 FROM EMP
 WHERE DEPTNO = 10
 GROUP BY JOB
 	HAVING AVG(sal) >= 2000
 ORDER BY JOB; 
 
-- 1. HAVING절을 사용하여 부서별 직책의 평균 급여가 500 이상인 사원들의 부서번호,직책,평균급여 출력
SELECT deptno,job,AVG(SAl)
FROM EMP
GROUP BY DEPTNO,job
	HAVING AVG(sal) >= 500
ORDER BY DEPTNO ,JOB;


-- 2.부서번호, 평균급여, 최고급여,최저급여, 사원수 출력 / 단 평균 급여는 소수점 제외하고 부서 번호별 출력
SELECT deptno,ROUND(AVG(SAL)),MAX(SAL),MIn(SAL),COUNT(*)
FROM EMP
GROUP BY DEPTNO;

-- 3. 같은 직책의 종사하는 사원이 3명 이상인 직책과 인원을 출력
SELECT job,COUNT(*)
FROM EMP
GROUP BY JOB
	HAVING COUNT(*) >= 3

-- 4. 사원들의 입사 연도를 기준으로 부서별로 몇 명이 입사했는지 출력
SELECT EXTRACT(YEAR FROM HIREDATE) AS "입사 년도", deptno,count(*)
FROM EMP
GROUP BY DEPTNO,EXTRACT(year FROM HIREDATE)
ORDER BY EXTRACT(YEAR FROM HIREDATE),deptno

SELECT TO_CHAR(hiredate, 'YYYY') AS "입사 년도", deptno,count(*)
FROM EMP
GROUP BY TO_CHAR(hiredate, 'YYYY'),deptno
ORDER BY "입사 년도"


-- 5. 추가 수당을 받는 사원과 받지 않는 사원 수 출력, 추가 수당 여부는 O,X로 표기
SELECT 
    CASE WHEN (COMM IS NULL OR COMM = 0) THEN 'X' ELSE 'O' END AS "추가 수당 여부",
    COUNT(*) AS "인원 수"
FROM EMP
GROUP BY 
    CASE WHEN (COMM IS NULL OR COMM = 0) THEN 'X' ELSE 'O' END;

   
-- 6. 각 부서의 입사 연도별 사원 수 , 최고 급여, 급여 합, 평균 급여를 출력

SELECT EXTRACT(YEAR FROM HIREDATE), deptno,count(*),MAX(SAL),Sum(sal),AVG(SAL)
FROM EMP
GROUP BY DEPTNO,EXTRACT(year FROM HIREDATE)
ORDER BY DEPTNO

SELECT deptno,
	TO_CHAR(hiredate, 'YYYY') AS "입사년도",
	COUNT(*) AS "사원 수",
	MAX(sal) AS "최고 급여",
	ROUND(AVG(SAL)) AS "평균 급여"
FROM EMP
GROUP BY deptno, TO_CHAR(hiredate, 'YYYY')
ORDER BY DEPTNO

-- ROLLUP 함수 : 그룹마다 중간통계 마지막에는 전체통계
SELECT deptno, job, COUNT(*), MAX(sal), SUM(sal), AVG(sal)
FROM EMP
GROUP BY ROLLUP(DEPTNO ,JOB);

-- 집합 연산자 : 두 개 이상의 쿼리 결과를 하나로 결합하는 연산자(수직적 처리)
SELECT empno, ename, job
FROM EMP
WHERE job = 'SALESMAN'
UNION
SELECT empno, ename, job
FROM EMP
WHERE job = 'MANAGER'
ORDER BY JOB

-- 조인(JOIN) : 두 개 이상의 테이블에서 데이터를 가져와서 연결하는데 사용되는 SQL 기능
-- 테이블에 대한 식별 값인 Promary Key와 테이블 간에 공통값인 Foreign Key값을 사용하여 조인
-- 내부 조인(동등 조인, inner join)이며 오라클 방식, 양쪽에 동일한 컬럼이 있는 경우 테이블 이름을 표시해야 함
SELECT empno, ename, mgr,sal, e.DEPTNO
FROM emp e, dept d
WHERE e.DEPTNO = d.DEPTNO
AND sal >= 3000;	

-- ANSI 방식
SELECT empno,ename,mgr,sal,e.DEPTNO
FROM EMP e JOIN DEPT d
ON e.DEPTNO = d.DEPTNO
WHERE sal >= 3000;

SELECT E.EMPNO, E.ENAME, D.DEPTNO, D.DNAME,D.LOC  
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE sal <= 2500 AND EMPNO <=9999
ORDER BY DEPTNO 

-- 비등가 조인 : 동일한 컬럼이 없을 때 사용하는 조인(일반적으로 많이 사용되지는 않음)
SELECT * FROM emp;
SELECT * FROM SALGRADE;
SELECT e.ENAME, e.SAL,s.GRADE
FROM EMP e JOIN SALGRADE s 
ON e.SAL BETWEEN s.LOSAL AND s.HISAL

-- 자체 조인 : 현재 테이블을 조인해서 뭔가 결과 찾아 낼 때 사용
SELECT e1.EMPNO, e1.ENAME, e1.MGR,
	e2.EMPNO AS"상관 사원번호",
	e2.ENAME AS"상관 이름"
FROM EMP e1 JOIN EMP e2
ON e1.MGR = e2.EMPNO

--외부 조인(Left outer join) : 부족한 부분이 있는 행이 있는 테이블에(+)
SELECT e.ENAME, e.DEPTNO, d.DNAME
FROM EMP e, DEPT d
WHERE e.DEPTNO(+) = d.DEPTNO
ORDER BY e.DEPTNO;

SELECT e.ENAME, e.DEPTNO, d.DNAME
FROM EMP e FULL OUTER JOIN DEPT D
ON e.DEPTNO = d.DEPTNO
ORDER BY e.DEPTNO;

-- NATURAL JOIN : 동등조인을 사용하는 다른 방법, 조건절 없이 사용, 두 테이블의 같은 열을 자동으로 연결
SELECT e.EMPNO, e.ENAME, d.DNAME, DEPTNO --DEPTNO는 겹치기 때문에 e,d를 쓰면 안됨
FROM EMP e NATURAL JOIN DEPT d;

--위 아래 같은 코드

--JOIN ~ USING : 동등조인(등가조인)을 대신하는 방식 중의 하나
SELECT e.EMPNO, e.ENAME, d.DNAME, DEPTNO, e.sal
FROM EMP e JOIN DEPT d USING(DEPTNO)
WHERE sal >=3000
ORDER BY deptno, e.EMPNO

--연습문제 1 : 급여가 2000 초과인 사원들의 부서 정보, 사원 정보 출력 (SQL -99 방식)
SELECT DEPTNO, DNAME,EMPNO,ENAME,SAL
FROM EMP NATURAL JOIN DEPT
WHERE SAL >=2000

--연습문제 2 : 부서별 평균 급여, 최대 급여, 최소 급여, 사원 수 출력(ANSI JOIN 방식)
SELECT d.DEPTNO, DNAME,
	ROUND(AVG(SAL)) AS "평균 급여",
	MAX(SAL) AS "최대 급여",
	MIN(SAL) AS "최소 급여",
	COUNT(*) AS "사원 수"
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
WHERE DEPTNO != 30 AND DEPTNO != 20 --DEPTNO NOT IN(20,30)과 같음

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

SELECT ENAME, SAL,NVL(COMM,0),SAL+NVL(COMM,0)  AS "총액" 
FROM EMP
ORDER BY "총액" DESC