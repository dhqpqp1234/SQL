--문제 1.
select  first_name 이름, 
        last_name 이름,
        salary 월급,
        phone_number 전화번호,
        hire_date 입사일
from employees
order by hire_date asc;

--문제2.

select job_title,
       max_salary 
from jobs
order by max_salary desc;

--문제3.
select first_name,
       manager_id,
       commission_pct,
       salary
from employees
where commission_pct is null AND salary>3000 
order by salary asc;

--문제 4.
select job_title 업무이름,
       max_salary 최고월급  
from jobs
where max_salary>=10000
order by max_salary desc;

--문제 5.
select first_name 직원이름,
       salary 월급,
        NVL(commission_pct,0) 커미션퍼센트
from employees
order by salary desc;

--문제 6.
select  first_name 이름,
        salary 월급,
        to_char(hire_date,'YYYY-MM') 입사일,
        department_id 부서번호
from employees
where department_id in(10,90,100);

--문제 7.
select first_name 이름,
       salary 월급 
from employees
where first_name like 'S%';

--문제 8.
select *
from departments
order by length(department_name) desc;

--문제 9.

select 
       upper(country_name) 나라이름
from countries;

--문제 10.
select first_name 이름,
       salary 월급,
       REPLACE(phone_number,'.','-')  전화번호,
       hire_date 입사일
from employees
where hire_date<'03/12/31'
order by hire_date asc;