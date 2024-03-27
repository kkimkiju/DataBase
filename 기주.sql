
-- 4. 사원들의 입사 연도를 기준으로 부서별로 몇 명이 입사했는지 출력
SELECT EXTRACT(YEAR FROM HIREDATE) AS "입사 년도", deptno,count(*)
FROM EMP
GROUP BY DEPTNO,EXTRACT(year FROM HIREDATE)
ORDER BY EXTRACT(YEAR FROM HIREDATE),deptno

SELECT TO_CHAR(hiredate, 'YYYY') AS "입사 년도", deptno,count(*)
FROM EMP
GROUP BY TO_CHAR(hiredate, 'YYYY'),deptno