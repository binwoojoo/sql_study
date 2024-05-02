-- 1. employees테이블과 departments테이블을 inner join하여
--    사번, first_name, last_name, department_id, department_name을 조회하세요.
SELECT
    E.employee_id,
    E.first_name, 
    E.last_name,
    D.department_id,
    D.department_name
FROM employees E
JOIN departments D
ON E.department_id = D.department_id
    AND e.manager_id = d.manager_id
;

-- 2. employees테이블과 departments테이블을 natural join하여
--    사번, first_name, last_name, department_id, department_name을 조회하세요.
SELECT
    E.employee_id,
    E.first_name, 
    E.last_name,
    department_id,
    D.department_name
FROM employees E
NATURAL JOIN departments D
--ON E.department_id = D.department_id
;

-- 3. employees테이블과 departments테이블을 using절을 사용하여
--    사번, first_name, last_name, department_id, department_name을 조회하세요.
SELECT
    E.employee_id,
    E.first_name, 
    E.last_name,
    department_id,
    D.department_name
FROM employees E
JOIN departments D
USING (department_id,manager_id)
;

-- 4. employees테이블과 departments테이블과 locations 테이블을 
--    join하여 employee_id, first_name, department_name, city를 조회하세요
SELECT
    E.employee_id,
    E.first_name, 
    D.department_name,
    L.city
FROM employees E
JOIN departments D
ON E.department_id = D.department_id
JOIN locations L
ON  D.location_id = L.location_id
;
-- 5. employees 테이블과 jobs 테이블을 INNER JOIN하여 
-- 사원의 first_name, last_name, job_title을 조회하세요.
SELECT 
    E.first_name,
    E.last_name,
    J.job_title
FROM employees E
JOIN jobs J
ON e.job_id = j.job_id
;
-- 6. employees 테이블과 departments 테이블을 INNER JOIN하여 
-- 부서명과 각 부서의 최대 급여값을 조회하세요.
SELECT 
  e.department_id,
  d.department_name,
  MAX(E.salary) AS "최대 급여"
FROM employees E
JOIN departments D
ON e.department_id = d.department_id
GROUP BY e.department_id, d.department_name -- 집계 함수에 반드시 셀렉한 컬럼을 추가
ORDER BY e.department_id
;
-- 7. employees 테이블과 jobs 테이블을 INNER JOIN하여 
--    직무별 평균 급여와 직무 타이틀을 조회하세요.
SELECT
    E.job_id,
    j.job_title,
    AVG(E.salary) AS "평균 급여"
FROM employees E
JOIN jobs J
ON J.job_id = E.job_id
GROUP BY j.job_title, E.job_id
;