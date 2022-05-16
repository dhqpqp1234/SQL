select *
from employees;

select e.first_name,
       d.department_name 
from employees e, departments d
where e.department_id = d.department_id;

--left join
select e.first_name,
       e.department_id,
       d.department_name,
       d.department_id
from employees e left outer join departments d
on e.department_id = d.department_id;


--right join
select e.first_name,
       e.department_id,
       d.department_name,
       d.department_id
from employees e right outer join departments d
on e.department_id = d.department_id;


--right join 오라클표현법
select e.first_name,
       e.department_id,
       d.department_name,
       d.department_id
from employees e , departments d
where e.department_id(+) = d.department_id;

--right join --->left join
select e.first_name,
       e.department_id,
       d.department_name,
       d.department_id
from departments d left outer join employees e  
on e.department_id = d.department_id;

--full outer join
select e.first_name,
       e.department_id,
       d.department_name,
       d.department_id
from employees e full outer join departments d
on e.department_id = d.department_id;

--------------self join----------------
select e.employee_id,
       e.first_name,
       e.salary,
       e.phone_number,
       e.manager_id,
       m.employee_id,
       m.first_name,
       m.phone_number
from employees e , employees m
where e.manager_id = m.employee_id;


select employee_id,
       first_name,
       salary,
       manager_id
from employees;

select e.first_name,
       e.salary,
       m.first_name,
       m.phone_number,
       e.phone_number
from employees e, employees m
where e.manager_id = m.employee_id;


--subquery
select first_name,
       salary 
from employees
where salary >= 11000
order by salary desc;
--Den 보다 급여를 많은 사람의 이름과 급여는 ?
select salary
from employees
where first_name = 'Den'; --11000

select first_name,
       salary 
from employees
where salary >= (select salary
                 from employees
                 where first_name = 'Den');
                 
--급여를 가장 적게 받는 사람의 이름 , 급여, 사원번호는?
select first_name,
       salary,
       employee_id
from employees
where salary = (select min(salary)
                from employees);

--평균 급여보다 적게 받는 사람의 이름, 급여를 출력

select first_name,
       salary 
from employees
where salary<(select avg(salary)
             from employees);
--평균급여
select avg(salary)
from employees;

-- 부서번호가 110인 직원의 급여와 같은 모든 직원의 사번, 이름, 급여를 출력
select salary
from employees
where department_id = 110;

--비교
select employee_id,
       first_name,
       salary
from employees
where salary = 12008
or salary = 8300;

--다른표현법
select employee_id,
       first_name,
       salary
from employees
where salary in(12008, 8300);

--사용
select employee_id,
       first_name,
       salary
from employees
where salary in(select salary
                from employees
                where department_id = 110);
