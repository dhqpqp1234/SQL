/*
문제1.
담당 매니저가 배정되어있으나 커미션비율이 없고, 월급이 3000초과인 직원의
이름, 매니저아이디, 커미션 비율, 월급 을 출력하세요.
(45건)
*/
select e.first_name 직원이름,
       m.manager_id 매니저아이디,
       e.commission_pct 커미션비율,
       e.salary 월급
from employees e, employees m
where e.commission_pct is null
and e.manager_id = m.employee_id
and e.salary > 3000;
/*
문제2. 
각 부서별로 최고의 급여를 받는 사원의 직원번호(employee_id), 이름(first_name), 급여
(salary), 입사일(hire_date), 전화번호(phone_number), 부서번호(department_id) 를 조회하
세요
-조건절비교 방법으로 작성하세요
-급여의 내림차순으로 정렬하세요
-입사일은 2001-01-13 토요일 형식으로 출력합니다.
-전화번호는 515-123-4567 형식으로 출력합니다.
(11건)
*/
select employee_id 직원번호,
       first_name 이름,
       salary 급여,
       to_char(hire_date,'YYYY-MM-DD DAY') 입사일,
       replace(phone_number,'.','-') 전화번호,
       department_id 부서번호
from employees
where (department_id,salary) in (select department_id,
                                        max(salary)
                                        from employees
                                        group by department_id);
/*
select  department_id
        max(salary)
from employees
group by department_id;
*/


/*
문제3
매니저별 담당직원들의 평균급여 최소급여 최대급여를 알아보려고 한다.
-통계대상(직원)은 2005년 이후(2005년 1월 1일 ~ 현재)의 입사자 입니다.
-매니저별 평균급여가 5000이상만 출력합니다.
-매니저별 평균급여의 내림차순으로 출력합니다.
-매니저별 평균급여는 소수점 첫째자리에서 반올림 합니다.
-출력내용은 매니저아이디, 매니저이름(first_name), 매니저별평균급여, 매니저별최소급여, 매
니저별최대급여 입니다.
(9건)
*/
select m.employee_id 매니저아이디,
       m.first_name 매니저이름,
       avg(e.salary) 매니저별평균급여,
       min(e.salary) 매니저별최소급여,
       max(e.salary) 매니저별최대급여
from employees e, employees m
where e.hire_date > '2005/12/31'
and m.employee_id = e.manager_id
group by m.employee_id, m.first_name
having avg(e.salary) >=5000
order by avg(e.salary)asc;

                                        
                                        
/*
문제4.
각 사원(employee)에 대해서 사번(employee_id), 이름(first_name), 부서명
(department_name), 매니저(manager)의 이름(first_name)을 조회하세요.
부서가 없는 직원(Kimberely)도 표시합니다.
(106명)
*/

select e.employee_id 사번,
       e.first_name 이름,
       d.department_name 부서명,
       m.first_name 매니저이름
from employees e, employees m, departments d
where e.department_id = d.department_id(+)
and e.manager_id = m.employee_id;

/*
문제5.
2005년 이후 입사한 직원중에 입사일이 11번째에서 20번째의 직원의
사번, 이름, 부서명, 급여, 입사일을 입사일 순서로 출력하세요
*/
-- 입사일순으로 정렬
-- 2005년 이후 입사
--11번째 ~ 20번째





select      employee_id as 사번,
            first_name as 이름,
            department_name as 부서명,
            salary as 급여,
            hire_date as 입사일
from (select  rownum rn,
                ot.employee_id,
                ot.first_name,
                ot.department_name,
                ot.salary,
                ot.hire_date
        from (select    e.employee_id ,
                        e.first_name ,
                        d.department_name ,
                        e.salary ,
                        e.hire_date 
                        from employees e, departments d
                        where e.department_id = d.department_id
                        and e.hire_date > '2005/12/31'
                        order by e.hire_date asc) ot
        )ort
where rn >= 11
and rn <=20;




/*
문제6.
가장 늦게 입사한 직원의 이름(first_name last_name)과 연봉(salary)과 근무하는 부서 이름
(department_name)은?
*/
select first_name || last_name 이름,
       salary 연봉,
       d.department_name 부서이름
from employees e, departments d
where e.hire_date in (select max(hire_date)
                        from employees)
and e.department_id = d.department_id;

/*
select max(hire_date)
from employees;
*/
/*
문제7.
평균연봉(salary)이 가장 높은 부서 직원들의 직원번호(employee_id), 이름(firt_name), 성
(last_name)과 업무(job_title), 연봉(salary)을 조회하시오.
*/


/*
문제8.
평균 급여(salary)가 가장 높은 부서는?
*/
select d.department_name
from employees e, departments d
where e.department_id = d.department_id
group by d.department_name
having avg(salary) = (select max(avg(salary))
                        from employees
                        group by department_id);


/*
문제9.
평균 급여(salary)가 가장 높은 지역은? 
*/
select r.region_name
from employees e, departments d, locations l, countries c, regions r
where e.department_id = d.department_id
and d.location_id = l.location_id
and l.country_id = c.country_id
and c.region_id = r.region_id
group by r.region_name
having avg(salary) = (select max(avg(salary))
                        from employees e, departments d, locations l, countries c, regions r
                        where e.department_id = d.department_id
                        and d.location_id = l.location_id
                        and l.country_id = c.country_id
                        and c.region_id = r.region_id
                        group by r.region_name);


/*
문제10.
평균 급여(salary)가 가장 높은 업무는? 
*/

select j.job_title
from employees e, jobs j
where e.job_id = j.job_id
group by j.job_title
having avg(salary) = (select max(avg(salary))
                        from employees e, jobs j
                        where e.job_id = j.job_id
                        group by j.job_title);