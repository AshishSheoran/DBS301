-- ***************************
-- NAME: ASHISH SHEORAN
-- ID: 162543177
-- DATE: OCTOBER 08, 2019
-- PURPOSE: DBS301 LAB-6
-- ***************************

-- Task 1.
--   Set Autocommit on.
SET AUTOCOMMIT ON;

-- Task 2.
--   Insert myself in employee.
INSERT INTO employees 
    VALUES (999, 'Ashish', 'Sheoran', 'ASHEORAN1', '437.224.9323', sysdate, 'AD_VP', NULL, 0.21, 100, 90);
    
    
-- Task 3.
--   Create an Update statement to: 
--      Change the salary of the employees with a last name of Matos and Whalen to be 2500.
UPDATE employees
    SET salary = 2500
    WHERE UPPER(last_name) = 'MATOS' OR UPPER(last_name) = 'WHALEN';
    
    
-- Task 4.
--   Display the last names of all employees who are in the same department as the 
--      employees named Abel.
SELECT last_name "Last Name"
    FROM employees
    WHERE department_id IN (
        SELECT department_id
            FROM employees
            WHERE UPPER(last_name) = 'ABEL'
    );


-- Task 5.
--  Display the last name of the lowest paid employee(s).
SELECT last_name "Last Name"
    FROM employees
    WHERE salary = (
        SELECT min(salary)
            FROM employees
    );
    
    
-- Task 6
--  Display the city that the lowest paid employee(s) are located in.
SELECT DISTINCT(city) City
    FROM locations
    WHERE location_id IN (
    
            SELECT location_id
                FROM departments
                WHERE department_id IN (
                
                    SELECT department_id
                        FROM employees
                        WHERE salary = (
                        
                            SELECT min(salary)
                                FROM employees
                        )
                )
    );
    
    
    
-- Task 7.
--   Display the last name, department id and salary of the lowest paid employee(s) in each department.
--      Sort by department_id.
SELECT last_name "Last Name",
        department_id "Department ID",
        salary "Salary"
    FROM employees
    WHERE department_id || salary IN (
    
            SELECT department_id || min(salary)
                FROM employees
                GROUP BY department_id
    )
    ORDER BY department_id;
    

-- Task 8.
--     Display the last name of the lowest paid employee(s) in each city.
SELECT last_name "Last Name",
        city "City"
    FROM (
        SELECT city, last_name, salary
            FROM (employees e JOIN departments d
                    ON e.department_id = d.department_id) JOIN locations l
                    ON l.location_id = d.location_id
         )
                
     WHERE city || salary IN (
             SELECT city || MIN(salary) "Salary"
                 FROM (employees e JOIN departments d
                         ON e.department_id = d.department_id) JOIN locations l
                         ON d.location_id = l.location_id
                GROUP BY city
        );
        
        
-- Task 9.
--   Display last name and salary for all employees who earn less than the lowest salary in ANY department.
--      Sort the output by top salaries first and then by last name.
SELECT last_name "Last Name",
        salary "Salary"
    FROM employees
    WHERE salary < ANY(
         SELECT MIN(salary)
             FROM employees
            GROUP BY department_id
    )
    ORDER BY salary DESC, last_name;


-- Task 10
--  Display last name, job title and salary for all employees whose salary matches any of the
--      salaries from the IT Department. DO NOT use JOIN method.
--      Sort the output by salary ascending first and then by last name.
SELECT last_name "Last Name",
        job_id "Job Title",
        salary "Salary"
    FROM employees
    WHERE salary = ANY(
            SELECT salary
                FROM employees
                WHERE department_id = (
                        SELECT department_id
                            FROM departments
                            WHERE UPPER(department_name)='IT'
                )
    )
    ORDER BY salary, last_name;
    
