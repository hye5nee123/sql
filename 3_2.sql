5. 각 사원의 이름을 표시하고 근무 달 수(입사일로부터 현재까지의 달 수)를 계산하여 열 레이블을 MONTHS_WORKED로 지정하시
오. 결과는 정수로 반올림하여 표시하시오.

SELECT last_name, ROUND(MONTHS_BETWEEN(SYSDATE,hire_date)) "MONTHS_WORKED"
FROM employees;
--WHERE
6. 모든 사원의 성 및 급여를 표시하기 위한 query를 작성합니다. 급여가 15자 길이로 표시되고 왼쪽에 # 
기호가 채워지도록 형식을 지정하시오. 열 레이블을 SALARY 로 지정합니다.

SELECT last_name,
LPAD(salary,15,'#') "SALARY"
FROM employees;

7. 부서 90의 모든 사원에 대해 성(last_name) 및 재직 기간(주 단위)을 표시하도록 query 를 작성하시오. 
주를 나타내는 숫자 열의 레이블로 TENURE를 지정하고 주를 나타내는 숫자 값을 정수로 나타내시오.

SELECT last_name, ROUND ((SYSDATE-hire_date)/7)"TENURE"
FROM employees;

+sql04문제

1. 각 사원에 대해 다음 항목을 생성하는 질의를 작성하고 열 레이블을 Dream Salaries로 지정하시오.
<employee last_name> earns <salary> monthly but wants <3 times salary>. 
<예시> Matos earns $2,600.00 monthly but wants $7,800.00.
SELECT last_name ||' earns '||INITCAP(TO_CHAR(salary,'$999,999,999.999'))||
       ' monthly but wants'||TO_CHAR(salary*3,'$9,999,999.999') AS " Dream Salaries"
FROM employees;


2. 사원의 이름, 입사일 및 급여 검토일을 표시하시오. 급여 검토일은 여섯 달이 경과한 후 첫번째 월요일입니다.
열 레이블을 REVIEW로 지정하고 날짜는 "2010.03.31 월요일"과 같은 형식으로 표시되도록 지정하시오.
SELECT last_name,hire_date,TO_CHAR(NEXT_DAY((ADD_MONTHS(hire_date,6)),'월'),'YYYY.MM.DD. DAY') "REVIEW"
FROM employees;


3. 이름, 입사일 및 업무 시작 요일을 표시하고 열 레이블을 DAY로 지정하시오. 
월요일을 시작으로 해서 요일을 기준으로 결과를 정렬하시오.
/*-1 줘서 일요일을 0을 만들기!*/

SELECT last_name, hire_date,TO_CHAR(hire_date,'day') "요일"
FROM employees
ORDER BY TO_CHAR(hire_date-1,'D');

4. 사원의 이름과 커미션을 표시하는 질의를 작성하시오. 커미션을 받지 않는 사원일 경우 
“No Commission”을 표시하시오. 열 레이블은 COMM으로 지정하시오.

SELECT first_name,NVL(TO_CHAR(Commission_pct),'"No Commission"')"COMM"
FROM employees
ORDER BY commission_pct;


5. DECODE 함수와 CASE 구문을 사용하여 다음 데이터에 따라 JOB_ID 열의 값을 기준으로
모든 사원의 등급을 표시하는 질의를 작성하시오.

업무         등급
AD_PRES     A
ST_MAN      B
IT_PROG     C
SA_REP      D
ST_CLERK    E
그외         0

SELECT job_id,
       CASE job_id WHEN 'AD_PRES' THEN 'A'
                   WHEN 'ST_MAN' THEN 'B'
                   WHEN 'IT_PROG' THEN 'c'
                   WHEN 'SA_REP' THEN 'D'
                   WHEN 'ST_CLERK' THEN 'E'
                   ELSE '0'
       END
       AS "등급"
FROM employees
ORDER BY 1;/*궁금*/