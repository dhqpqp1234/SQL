/*
문제1.
평균 급여보다 적은 급여을 받는 직원은 몇명인지 구하시요.
*/
select count(salary)
from employees
where salary < (select avg(salary)
                from employees);
                
/*
문제2. 
평균급여 이상, 최대급여 이하의 월급을 받는 사원의
직원번호(employee_id), 이름(first_name), 급여(salary), 평균급여, 최대급여를 급여의 오름차
순으로 정렬하여 출력하세요
*/                
select employee_id 직원번호,
       first_name 이름,
       salary 급여,
       avg(salary) 평균급여,
       max(salary) 최대급여 
from employees
where salary>=(select avg(salary)
                from employees)
and salary <= (select max(salary)
                from employees)
group by first_name, salary, employee_id                
order by salary desc;

/*
문제3.
직원중 Steven(first_name) king(last_name)이 소속된 부서(departments)가 있는 곳의 주소
를 알아보려고 한다.
도시아이디(location_id), 거리명(street_address), 우편번호(postal_code), 도시명(city), 주
(state_province), 나라아이디(country_id) 를 출력하세요
*/
--다다시다시다시다시다시다시다시다시다시다시다시다시다시다시다시시
select department_id 
from employees 
where first_name = 'Steven' 
and last_name = 'King';

select location_id
from departments
where department_id =90;

                     
                     
select *
from locations 
where location_id=(select location_id 
                    from departments
                    where department_id 
                    =(select department_id 
                    from employees 
                    where first_name 
                    = 'Steven' and last_name = 'King'));                    
--다다시다시다시다시다시다시다시다시다시다시다시다시다시다시다시시                     


/*
문제 4.
job_id 가 'ST_MAN' 인 직원의 급여보다 작은 직원의 사번,이름,급여를 급여의 내림차순으로
출력하세요 -ANY연산자 사용
*/
select employee_id 사번,
       first_name 이름,
       salary 급여
from employees 
where salary < any (select salary
                    from employees 
                    where job_id = 'ST_MAN')
order by salary asc;

/*
문제5. 
각 부서별로 최고의 급여를 받는 사원의 직원번호(employee_id), 이름(first_name)과 급여
(salary) 부서번호(department_id)를 조회하세요
단 조회결과는 급여의 내림차순으로 정렬되어 나타나야 합니다. 
조건절비교, 테이블조인 2가지 방법으로 작성하세요
*/
-- 조건절
select employee_id 직원번호,
       first_name 이름,
       salary 급여,
       department_id 부서번호
from employees
where (department_id, salary) in (select 
                                    department_id,
                                    max(salary)
                                    from employees
                                    group by department_id)
order by salary asc;


--테이블
select  e.employee_id 직원번호,
        e.first_name 이름,
        e.salary 급여,
        e.department_id 부서번호
from employees e, (select department_id, 
                    max(salary) salary
                    from employees
                    group by department_id) s 
where e.department_id = s.department_id
and e.salary = s.salary 
order by e.salary asc;
                    
/*
문제6.
각 업무(job) 별로 연봉(salary)의 총합을 구하고자 합니다. 
연봉 총합이 가장 높은 업무부터 업무명(job_title)과 연봉 총합을 조회하시오
*/                    
select j.job_title 업무명,
       sum(e.salary) 연봉총합
from employees e, jobs j
where e.job_id = j.job_id
group by j.job_title;

/*
자신의 부서 평균 급여보다 연봉(salary)이 많은 직원의 직원번호(employee_id), 이름
(first_name)과 급여(salary)을 조회하세요
*/

select employee_id 직원번호,
       first_name 이름,
       salary 급여
from employees e
where salary > any (select avg(salary)
                 from employees
                 where department_id = e.department_id);
                 
/*
직원 입사일이 11번째에서 15번째의 직원의 사번, 이름, 급여, 입사일을 입사일 순서로 출력
하세요
*/    