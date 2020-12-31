-- ***************************
-- Name: Ashish Sheoran
-- ID: 162543177
-- DATE: SEPT 11 ,2019
-- PURPOSE: LAB 2 DBS301
-- ***************************

-- 1.   Display the employee_id, last name and salary of employees earning in the range of $8,000 to $11,000. 
--      Sort the output by top salaries first and then by last name.

SELECT employee_id, last_name, to_char(ROUND(salary), '$999,999.99') AS SALARY
    FROM employees
    WHERE salary >= 8000 AND salary <= 11000
    ORDER BY salary DESC, last_name;
    
    
    
-- 2.   Modify previous query (#1) so that additional condition is to display only if they work as Programmers 
--      or Sales Representatives. Use same sorting as before.

SELECT employee_id, last_name, to_char(salary, '$999,999.99') AS SALARY
    FROM employees e
    WHERE ((e.job_id) LIKE 'SA_REP' OR (e.job_id) LIKE 'IT_PROG') AND ((e.salary) >= 8000 AND (e.salary) <= 110000)
    ORDER BY salary DESC, last_name;
    
    
-- 3.   The Human Resources department wants to find high salary and low salary employees. Modify previous query
--      (#2) so that it displays the same job titles but for people who earn outside the given salary range from 
--      question 1. Use same sorting as before.

SELECT employee_id, last_name, to_char(salary, '$999,999.99') AS SALARY
    FROM employees e
    WHERE ((e.job_id) LIKE 'SA_REP' OR (e.job_id) LIKE 'IT_PROG') AND ((e.salary) < 8000 OR (e.salary) > 110000)
    ORDER BY salary DESC, last_name;
    
    
--4.    The company needs a list of long term employees, in order to give them a thank you dinner. Display the last name,
--      job_id and salary of employees hired before 2018. List the most recently hired employees first.

SELECT last_name, job_id, to_char(salary, '$999,999.99') AS SALARY
    FROM employees
    WHERE hire_date < to_date('2018-01-01', 'yyyy-mm-dd')
    ORDER BY hire_date DESC;
    
    
-- 5.   Modify previous query (#4) so that it displays only employees earning more than $11,000. List the output by job title 
--      alphabetically and then by highest paid employees.

SELECT last_name, job_id AS "Job Title", to_char(salary, '$999,999.99') AS SALARY
    FROM employees
    WHERE (hire_date < to_date('2018-01-01', 'yyyy-mm-dd')) AND salary > 11000
    ORDER BY job_id, salary DESC;
    
    
-- 6.   Display the job titles and full names of employees whose first name contains an ‘e’ or ‘E’ anywhere. 
--      The output should look like: (BONUS MARK FOR NOT using the OR keyword in the solution but obtaining the same results)

SELECT job_id AS "Job Title", first_name || ' ' || last_name AS "Full Name"
    FROM employees
    WHERE UPPER(first_name) LIKE UPPER('%e%');


-- 7.   Create a query to display the address of the various locations where offices are located.  Add a parameter
--      to the query such that the user can enter all, or part of, the city name and all locations from the resultant 
--      cities will be shown.

SELECT street_address, city
    FROM locations
    WHERE UPPER(city) LIKE UPPER('%&city%');

