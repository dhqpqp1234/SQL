

/*********************
--      JOIN        --
*********************/
select *
from employees, departments;

select  em.employee_id,
        first_name,
        salary,
        department_name,
        de.department_id
from employees em, departments de
where em.department_id = de.department_id;

--예제)모든 직원이름, 부서이름, 업무명 을 출력하세요

select  em.first_name 이름,
        em.salary 월급,
        de.department_name 부서명,
        jo.job_title 업무명,
        de.department_id 부서아이디,
        jo.job_id 업무아이디
from employees em, departments de, jobs jo
where em.department_id = de.department_id
and jo.job_id = em.job_id
and salary >= 7000;