--*******************그룹함수*********************************

select first_name, 
       sum(salary) 
from employees;

select  
       sum(salary) 
from employees;

--■ 그룹함수 - count()

select count(*),
       count(commission_pct), -- null제외하고 실제 데이터 검사 
       count(manager_id)
from employees;


select count(*)
from employees
where salary > 16000;

--■ 그룹함수 sum()
select count(salary),
       sum(salary)
from employees;       

--■ 그룹함수 - avg()
select count(*),   
       sum(salary),
       avg(salary)
from employees;

select count(*),   
       sum(salary),      -- 급여가 nullㅇ니 사람은 평균계산에서 제외
       avg(nvl(salary,0)), -- null값은 0으로 변경후 평균을 계산
       round(avg(salary)) -- 반올림
from employees;

--■ 그룹함수 - max() / min()
select MAX(salary),
       MIN(salary), 
       count(*)
from employees;

-- ■GROUP BY 절  from다음 들어가융
--전체평균
select  
        round(avg(salary))
from employees
order by department_id asc;

--부서별 평균
select  department_id,
        round(avg(salary))
from employees
group by department_id
order by department_id asc;


select department_id,
       avg(salary), --  department_id  부서별 평균
       sum(salary),  -- department_id 부서별 합계
       count(salary) -- department_id  부서별 카운트
from employees
group by department_id 
order by department_id asc;

select  department_id,
        avg(salary),
        sum(salary),
        count(salary),
        job_id    --group id를 낼때는 컴럼에 참여한 값만 가능
from employees
group by department_id, job_id -- 
order by department_id;

--■ HAVING 절
-- 연봉(salary)의 합계가 20000 이상인 부서의 부서 번호와 , 인원수, 급여합계를 출력
select department_id,
       count(*),
       sum(salary)
from employees
--where sum(salary)>=20000 --where 절에는 그룹 함수를 쓸수없다
group by department_id
having sum(salary)>=20000
and sum(salary)<=100000
and department_id = 90;
--and hire_date >= 04/01/01 Having 절에는 그룹함수와 gruop by에 참여한 컬럼만 사용가능


--■ CASE ~ END 문
select employee_id,
       first_name,
       job_id,
       salary,
       salary+salary*0.1  realsalary2
from employees;


select employee_id,
       first_name,
       job_id,
       salary,
       case when job_id = 'AC_ACCOUNT' then salary+salary*0.1
            when job_id = 'SA_REP'  then salary+salary*0.2   
            when job_id = 'ST_CLERK'  then salary+salary*0.3
            else salary
       end realsalary
from employees;

--■ DECODE 문 (CASE ~ END 비교)
select employee_id,
       first_name,
       job_id,
       salary,
       DECODE(job_id, 'AC_ACCOUNT', salary+salary*0.1,
                      'SA_REP', salary+salary*0.2,
                      'ST_CLERK', salary+salary*0.3,
            salary) bonus
from employees;

select  first_name,
        department_id,
        case when department_id >= 10 and department_id <= 50 then 'A-TEAM'
             when department_id >= 60 and department_id <= 100 then 'B-TEAM'
             when department_id >= 110 and department_id <= 150 then 'C-TEAM'
             else '팀없음'
        end  TEAM      
from employees;