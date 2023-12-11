2. 각 사원에 대해 사원 번호, 이름, 급여 및 
   15% 인상된 급여를 정수로 표시하시오. 
   인상된 급여 열의 레이블을 New Salary로 지정하시오.
   
SELECT employee_id,last_name,salary,
        ROUND (salary*1.15) "New Salary" 
FROM employees;



3. 2번 질의를 수정하여 
   새 급여에서 이전 급여를 빼는 새 열을 추가하고 
   레이블을 Increase로 지정하고 수정한 질의를 실행하시오.
SELECT employee_id,last_name,salary,
        ROUND (salary*1.15)-salary "Increase" 
FROM employees;


4. 이름이 J, A 또는 M으로 시작하는 
   모든 사원의 이름(대문자 표시) 및 이름 길이를 표시하는 
   질의를 작성하고 각열에 적합한 레이블을 지정하시오. 
   결과를 사원의 이름에 따라 정렬하시오.
   
   SELECT UPPER(last_name) "name" ,LENGTH(last_name) "length"
   FROM employees
   WHERE UPPER(SUBSTR(last_name,1,1)) IN ('J','A','M')
   ORDER BY LENGTH(last_name) ;

