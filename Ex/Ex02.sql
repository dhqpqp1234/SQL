/*******************
select 문
    select 절
    from 절
    where 절
    order by 절
*******************/ 

--모든 컬럼 조회하기
select*
from employees;

select*
from departments;

--원하는 컬러먼 조회하기

select employee_id,
       first_name,
       last_name
from employees;

--예제)
--사원의 이름(first_name)과 전화번호 입사일 연봉을 출력하세요
select  first_name,
        phone_number,
        hire_date,
        salary
from employees;

--출력할때 컬럼명 별명 사용하기
select  first_name "이름",
        phone_number "전화번호",
        hire_date "입사일",
        salary "연봉"
from employees;
--사원의 사원번호 이름 급여 전화번호 이메일 입사일로 표시
select   first_name as 이름,--많이 안씀 알아둘것
         last_name  성,
         salary "Salary",
         phone_number "hp", --대소문자 개념이 없어서 대문자로 표기 ""표써주면 소문자
         email "이  메  일", --공백 ""
         hire_date "입사일"
from employees;

--연결연산자 (커럼을 붙이기)
select first_name,
       last_name 
from employees;

select first_name  || last_name  
from employees;

select first_name  || '   ' || last_name -- 공백 넣기  
from employees;

select first_name || '  hire date is  ' ||hire_date as 입사일 --문구추가  
from employees;

--산술 연산자
select  first_name, 
        salary, 
        salary*12 as "money",
        (salary+300)*12 as "add money"
from employees;

select job_id*12 -- id는 숫자가 아니라 오류
from employees;

--전체직원의 정보를 다음과 같이 출력하세요
select first_name || '-' || last_name 성명,
       salary 급여,
       salary*12 연봉,
      (salary*12)+5000 연봉2,
      phone_number "전화번호"
from employees;

select first_name
from employees
where department_id=10;

--연봉 15000이상
select first_name, salary
from employees
where salary*12>=15000;     

--7월 1일 이후에입사한사람 이름 입사일
select first_name,
       hire_date 
from employees
where hire_date>='07/01/01';

--이름 lex연봉출력

select salary
from employees
where first_name = 'Lex';

--조건 2개 출력 연봉 14000이상 17000이하인 사원 이름과 연봉
select first_name,
       salary 
from employees
where salary>=14000
and salary<=17000;

--조건 2개 출력 연봉 14000이상 17000이하인 사원 이름과 연봉
--between 연산자는 작은값을 앞에 큰값을 뒤에 놓아야함
--경계값이 포함되어있는 교집합에 사용  **느린연산자에 속한다잉
select first_name,
       salary 
from employees
where salary between 14000 and 17000;

--입사일이 04/01/01 에서 05/12/31 사이의 사원 이름가 입사일
select first_name 이름,
       hire_date "입사일" 
from employees
where hire_date>='04/01/01'
and hire_date<= '05/12/31';


--in연산자로 여러 조건을 검사하기
select first_name,
       last_name,
       salary 
from employees
where first_name in('Neena','Lex','John');

select first_name,
       last_name,
       salary 
from employees
where first_name = 'Neena'
or first_name = 'Lex'
or first_name = 'John';

--연봉이 2100, 3100, 4100, 5100 인 사원의 이름과 연봉을 구하시오오옹 
select first_name,
       salary 
from employees
where salary in (2100,3100,4100,5100);

select first_name,
       salary 
from employees
where salary = 2100
or salary =3100
or salary =4100
or salary =5100;

--Like연산자 비슷한것들 모두 찾기
select first_name, last_name, salary
from employees
where first_name like '%s%';

--L포함 4개글자 가진것 찾기
select first_name, last_name, salary
from employees
where first_name like 'L____';

--이름에 am을 포함한 사원의 이름과 연봉
select first_name,
       salary 
from employees
where first_name like '%am%';

--이름의 두번째 글자가 a인 사원의 이름과 연봉

select first_name,
       salary 
from employees
where first_name like '_a%';


--이름의 네번째 글자가 a인 사원의 이름과 연봉

select first_name,
       salary 
from employees
where first_name like '___a%';

--이름이 4글자인 사원중 끝에서 두번째 글자가 a인 사원 이름출력

select first_name,
       salary 
from employees
where first_name like '__a_';

select  first_name,
        salary,
        commission_pct,
        salary*commission_pct
from employees
where salary between 13000 and 15000;

--null 찾기 xxx is null; null 아닌거 찾기 is not null;
select  first_name,
        salary,
        commission_pct,
        salary*commission_pct
from employees
where commission_pct is not null;

--담당 매니저가 없고 커미션비율이 없는 직원의 이름 출력

select  first_name,
        salary,
        commission_pct
from employees
where manager_id is null
and commission_pct is null;

select first_name,
       salary 
from employees
where salary>=10000;

--order by 절을 사용해 보기 좋게 정렬 desc 내림차순 asc오름차순
select first_name,salary
from employees
order by salary asc;

--급여가 9000이상인 사람만 출력
select first_name,salary
from employees
where salary >=9000
order by salary desc;

--알파벳순으로 정렬
select *
from employees
order by first_name asc;

--부서 번호를 오름차순 정렬 부서번호,급여 이름 출력
select  department_id,
        salary,
        first_name
from  employees
order by department_id  asc;


--급여가 10000이상인 직원의 이름 급여를 급여가 큰직원부터 출력
select  salary,
        first_name
from  employees
where salary >=10000
order by salary desc;

--부서번호를 오름차순으로 정렬 부서 번호가 같으면 급여가 높은사람부터 부서번호 급여 이름 출력
select  department_id,
        salary,
        first_name
from  employees
order by department_id asc, salary desc, first_name asc;

--단일행 함수
--문자함수 - INITCAP(컬럼명)
--부서번호 100인 직원의 이메일주소와 부서번호를 출력하세요
select  email, 
        INITCAP(email) "email2",--INITCAP(email)이메일 소문자로  
        department_id 
from employees
where department_id = 100;

--문자함수 -LOWER(컬럼명)UPPER(컬럼명)
select  first_name,
        UPPER(first_name) upper,
        lower(first_name) "lower"
from employees
where department_id = 100;

-- 문자함수 – SUBSTR(컬럼명, 시작위치, 글자수)
select  first_name,
        SUBSTR(first_name,1,4),
        SUBSTR(first_name,-3,3)
from employees
where department_id = 100;

--문자함수 – LPAD(컬럼명, 자리수, ‘채울문자’) / RPAD(컬럼명, 자리수, ‘채울문자’)
select  first_name,
        LPAD(first_name, 10,'*'),
        RPAD(first_name,10,'*')
from employees;

-- 문자함수 – REPLACE (컬럼명, 문자1, 문자2)
select  first_name,
        REPLACE(first_name,'a','*'),
        REPLACE(first_name,substr(first_name,2,3),'***')
from employees
where department_id = 100;

select REPLACE('abcdefg','bc','*******')
from dual;

select substr('900214-1234234',0,1)
from dual; 

--숫자함수 – ROUND 반올림(숫자, 출력을 원하는 자리수)
select round(123.453,2) "r2",
       round(123.456,0) "r0",
       round(123.456,-1) "r-1"
from dual;

--숫자함수 – TRUNC 반올림ㄴㄴ(숫자, 출력을 원하는 자리수)
select trunc(123.346,2) "r2",
       trunc(123.456,0) "r0",     
       trunc(123.456,-1) "r-1" 
from dual;

--날짜함수 – SYSDATE()
select sysdate
from dual;

select MONTHS_BETWEEN(sysdate,hire_date)
from employees;

select*
from employees;

-- TO_CHAR(숫자, ‘출력모양’) 숫자형문자형으로 변환하기
select first_name,
       to_char(salary*12,'$099999') 
from employees
where department_id = 110;

select to_char(9876,'99999'),
       to_char(9876,'09999'),
       to_char(9876,'$09999'),
       to_char(9876,'9999.99'),
       to_char(987654321,'999,999,999')
from dual;

-- 단일함수>변환함수>TO_CHAR(날짜, ‘출력모양’) 날짜문자형으로 변환하기

select sysdate,
        to_char(sysdate,'YYYY-MM-DD'),
        to_char(sysdate,'YYYY-MM-DD HH24:MI:SS'),
        to_char(sysdate,'YYYY'),
        to_char(sysdate,'YY'),
        to_char(sysdate,'MM'),
        to_char(sysdate,'MONTH'),
        to_char(sysdate,'DD'),
        to_char(sysdate,'DAY'),
        to_char(sysdate,'HH24'),
        to_char(sysdate,'MI'),
        to_char(sysdate,'SS')
from dual;