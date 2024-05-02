-- 1. employees���̺�� departments���̺��� inner join�Ͽ�
--    ���, first_name, last_name, department_id, department_name�� ��ȸ�ϼ���.
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

-- 2. employees���̺�� departments���̺��� natural join�Ͽ�
--    ���, first_name, last_name, department_id, department_name�� ��ȸ�ϼ���.
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

-- 3. employees���̺�� departments���̺��� using���� ����Ͽ�
--    ���, first_name, last_name, department_id, department_name�� ��ȸ�ϼ���.
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

-- 4. employees���̺�� departments���̺�� locations ���̺��� 
--    join�Ͽ� employee_id, first_name, department_name, city�� ��ȸ�ϼ���
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
-- 5. employees ���̺�� jobs ���̺��� INNER JOIN�Ͽ� 
-- ����� first_name, last_name, job_title�� ��ȸ�ϼ���.
SELECT 
    E.first_name,
    E.last_name,
    J.job_title
FROM employees E
JOIN jobs J
ON e.job_id = j.job_id
;
-- 6. employees ���̺�� departments ���̺��� INNER JOIN�Ͽ� 
-- �μ���� �� �μ��� �ִ� �޿����� ��ȸ�ϼ���.
SELECT 
  e.department_id,
  d.department_name,
  MAX(E.salary) AS "�ִ� �޿�"
FROM employees E
JOIN departments D
ON e.department_id = d.department_id
GROUP BY e.department_id, d.department_name -- ���� �Լ��� �ݵ�� ������ �÷��� �߰�
ORDER BY e.department_id
;
-- 7. employees ���̺�� jobs ���̺��� INNER JOIN�Ͽ� 
--    ������ ��� �޿��� ���� Ÿ��Ʋ�� ��ȸ�ϼ���.
SELECT
    E.job_id,
    j.job_title,
    AVG(E.salary) AS "��� �޿�"
FROM employees E
JOIN jobs J
ON J.job_id = E.job_id
GROUP BY j.job_title, E.job_id
;