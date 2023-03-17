--Quetion 1--
SELECT
  em.dep_id 
  ,emp_id
  , emp_name
  , job_name
  , manager_id
  , salary 
FROM
  employees AS em
  
  INNER JOIN department AS de 
    ON em.dep_id = de.dep_id , slary_grade AS sla 
WHERE
  de.dep_name = 'MARKETING' 
  AND de.dep_location IN ('MELBOURNE', 'PERTH') 
  AND (em.salary BETWEEN '1501' AND '9999') 
  AND DATE_PART('year', em.hire_date ::date) - DATE_PART('year', to_char(now(), 'YYYY-MM-DD') ::date) > 5;
  
--Quetion 2--
SELECT em.emp_id, em.emp_name, em.job_name, em.manager_id, em.hire_date FROM employees AS em
WHERE em.hire_date < (SELECT hire_date FROM employees AS em1 WHERE em.manager_id = em1.emp_id)

--Quetion 3--

SELECT em.emp_name AS name_manager, STRING_AGG (em1.emp_name, ',' ORDER BY em1.emp_name) FROM
(SELECT
  manager_id
  , emp_id
  , emp_name
  , job_name
FROM
  employees) AS em 
  LEFT JOIN (SELECT manager_id, emp_name FROM employees) AS em1  
    ON em.emp_id = em1.manager_id
GROUP BY name_manager
--Quetion 4--

SELECT em.emp_id, em.emp_name AS name_emplyee, em1.emp_name AS name_employee  FROM
(SELECT
  manager_id
  , emp_id
  , emp_name
  , job_name
FROM
  employees) AS em 
  LEFT JOIN (SELECT emp_id, emp_name FROM employees) AS em1  
    ON em.manager_id = em1.emp_id
	
--Quetion 5--
SELECT emp_id, emp_name FROM employees WHERE salary = (SELECT MAX(salary) FROM employees) LIMIT 1

--Quetion 6--
SELECT dep_location FROM department AS de, employees AS em 
WHERE de.dep_id = em.dep_id AND em.hire_date = (SELECT MIN(hire_date) FROM employees)

--Quetion 7--
SELECT job_name FROM employees em WHERE em.salary = (SELECT MIN(salary) FROM employees) LIMIT 1

--Quetion 8--

