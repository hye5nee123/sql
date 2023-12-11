1. 각 사원에 대해 다음 항목을 생성하는 질의를 작성하고
 열 레이블을 Dream Salaries로 지정하시오.(변환함수, 연결 연산자)
<employee last_name> earns <salary> monthly but wants < salary의 3배>. 
<예시> Matos earns $2,600.00 monthly but wants $7,800.00.

SELECT last_name||' earns '||INITCAP(salary)||' monthly but wants '||salary*3 " Dream Salaries"
FROM employees;


2. 사원의 이름, 입사일 및 급여 검토일을 표시하시오. 급여 검토일은 여섯 달이 경과한 후 첫번째 월요일입니다.
열 레이블을 REVIEW로 지정하고 날짜는 "2010.03.31 월요일"과 같은 형식으로 표시되도록 지정하시오.(날짜함수)

SELECT last_name,hire_date,
      TO_CHAR(NEXT_DAY(ADD_MONTHS(hire_date,6),'월'),'YYYY.MM.DD.DAY')
FROM employees;


3. 이름, 입사일 및 업무 시작 요일을 표시하고 열 레이블을 DAY로 지정하시오.(날짜함수)
 월요일을 시작으로 해서 요일을 기준으로 결과를 정렬하시오.(산수)
 
SELECT last_name,hire_date,TO_CHAR(hire_date,'DAY')
FROM employees
ORDER BY TO_CHAR(hire_date-1,'d');

4. 사원의 이름과 커미션을 표시하는 질의를 작성하시오.
커미션을 받지 않는 사원일 경우 “No Commission”을 표시하시오. 열 레이블은 COMM으로 지정하시오.(NVL함수)
SELECT last_name,NVL(TO_CHAR(commission_pct),'"No Commission”') AS "COMM"
FROM employees;
5. DECODE 함수와 CASE 구문을 사용하여 다음 데이터에 따라 JOB_ID 열의 값을 기준으로 모든 사원의 등급을 표시하는 질의를 작성하시오.

업무         등급
AD_PRES     A
ST_MAN      B
IT_PROG     C
SA_REP      D
ST_CLERK    E
그외         0
SELECT job_id "업무",
        DECODE (job_id,'AD_PRES','A',
                       'ST_MAN','B',
                       'IT_PROG','C',
                       'SA_REP','D',
                       'ST_CLERK','E',
                                 0)
              AS "등급"
FROM employees;
