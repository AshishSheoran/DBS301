-- ****************************
-- Name: Ashish Sheoran
-- ID: 162543177
-- Date: October 31, 2019
-- Purpose: DBS301 LAB 7
-- ****************************

-- Question 1.
--   The HR department needs a list of Department IDs for departments that do not contain
--   the job ID of ST_CLERK> Use a set operator to create this report. 

SELECT department_id
    FROM departments
    
MINUS

SELECT department_id
    FROM employees
    WHERE UPPER(job_id) = 'ST_CLERK';
    
    
-- Question 2.
--   Same department requests a list of countries that have no departments located in them.
--   Display country ID and the country name. Use SET operators. 

SELECT country_id, country_name
    FROM countries

    MINUS

SELECT country_id, country_name
    FROM countries JOIN locations USING(country_id)
        JOIN departments USING(location_id);



-- Queestion 3
--	The Vice President needs very quickly a list of departments 10, 50, 20 in that order. 
--  job ID and department ID are to be displayed.

SELECT DISTINCT job_id, department_id
    FROM employees
    WHERE department_id = 10
    
UNION ALL

SELECT DISTINCT job_id, department_id
    FROM employees
    WHERE department_id = 50
    
UNION ALL

SELECT DISTINCT job_id, department_id
    FROM employees
    WHERE department_id = 20;
    

-- Question 4

--Create a statement that lists the employeeIDs and JobIDs of those employees who currently have a job title that is
--the same as their job title when they were initially hired by the company (that is, they changed jobs but have now gone back
--to doing their original job).

    
SELECT employee_id, job_id
    FROM (SELECT employee_id
            FROM employees
        
          MINUS
        
          SELECT employee_id
            FROM job_history) 
        JOIN employees USING(employee_id)
    ORDER BY employee_id;
    
    
-- Question 5

--	The HR department needs a SINGLE report with the following specifications:
        --a.	Last name and department ID of all employees regardless of whether they belong to a department or not.
        --b.	Department ID and department name of all departments regardless of whether they have employees in them or not.

        --Write a compound query to accomplish this.
        
SELECT last_name, department_id, department_name
    FROM (
        SELECT department_id
            FROM employees
            
        UNION
        
        SELECT department_id
            FROM departments)
    FULL OUTER JOIN employees USING(department_id)
    FULL OUTER JOIN departments USING(department_id);
    