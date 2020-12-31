-- ***************************
-- Name: Ashish Sheoran
-- ID: 162543177
-- DATE: November 6,2019
-- PURPOSE: LAB 8 DBS301
-- ***************************

DROP VIEW vwAllDeptSumm;
DROP VIEW vwAllEmps;
DROP VIEW vwAllDepts;
-- 1.   Display the names of the employees whose salary is the same as the lowest salaried employee in any department.
SELECT first_name||' '|| last_name as "Name", salary
    FROM employees
    WHERE salary = ANY (
                    SELECT min(salary)
                        FROM employees
                    );


-- 2.   Display the names of the employees whose salary is the lowest in each department.
SELECT first_name||' '||last_name as "Name", salary, department_id
    FROM employees
    WHERE (salary, department_id) IN (
                                    SELECT min(salary), department_id
                                        FROM employees
                                        GROUP BY department_id
                                    )
    ORDER BY department_id;


-- 3.   Give each of the employees in question 2 a $120 bonus.
UPDATE employees
    SET salary = salary + 120
    WHERE employee_id = ANY (
                        SELECT employee_id
                            FROM employees
                            WHERE (salary, department_id) IN (
                                                        SELECT MIN(salary), department_id
                                                            FROM employees
                                                            GROUP BY department_id
                                                            HAVING department_id IS NOT NULL
                                                            )
                            );


-- 4.   Create a view named vwAllEmps that consists of all employees includes employee_id, last_name, salary, department_id,
--      department_name, city and country.
CREATE VIEW vwAllEmps AS (
    SELECT employee_id, last_name, salary, department_id, department_name, city, country_name
        FROM employees JOIN departments USING (department_id)
        JOIN locations USING (location_id)
        JOIN countries USING (country_id)
    );


-- 5.   Use the vwAllEmps view to:
--      a). Display the employee id, last name, salary and city for all employees
SELECT employee_id, last_name, salary, city
    FROM vwAllEmps;

--      b). Display the total salary of all employees by city
SELECT city, sum(salary) AS "SALARY"
    FROM vwAllEmps
    GROUP BY city
    ORDER BY "SALARY";

--      c). Increase the salary of the lowest paid employee(s) in each department by 120.
UPDATE vwAllEmps 
    SET salary = salary + 120
    WHERE (salary, department_id) IN (
                                SELECT MIN(salary), department_id
                                    FROM vwAllEmps
                                    GROUP BY department_id
                                    );

--      d). What happens if you try to insert an employee by providing values for all columns in this view?
INSERT INTO vwAllEmps 
    VALUES(777, 'BEAR', 32000, 99, 'IT', 'TORONTO', 'CANADA');
    -- Values can not be inserted into the view because we can not insert values into multiple table using a simple view.
    -- Proof:
    /*  
        Error starting at line : 75 in command -
        INSERT INTO vwAllEmps 
            VALUES(777, 'BEAR', 32000, 99, 'IT', 'TORONTO', 'CANADA')
        Error at Command Line : 75 Column : 1
        Error report -
        SQL Error: ORA-01776: cannot modify more than one base table through a join view
        01776. 00000 -  "cannot modify more than one base table through a join view"
        *Cause:    Columns belonging to more than one underlying table were either
                   inserted into or updated.
        *Action:   Phrase the statement as two or more separate statements.
    */

--      e). Delete the employee named Vargas. Did it work? Show proof.
DELETE FROM vwAllEmps
    WHERE UPPER(last_name) = 'VARGAS';
    -- Interestingly, the employee with last name Vargas is deleted
    -- Proof:
    --    1 row deleted.  


-- 6.   Create a view named vwAllDepts that consist of all departments and includes department_id, department_name, city 
--      and country(if applicable)
CREATE VIEW vwAllDepts AS (
    SELECT department_id, department_name, city, country_name
        FROM departments JOIN locations USING (location_id)
        JOIN countries USING (country_id)
        );

-- 7.   Use the vwAllDepts view to:
--      a.  For all of the departments display the department_id, name and city
SELECT department_id, department_name, city
    FROM vwAllDepts;

--      b.  For each city that has departments located in it display the number of departments by city.
SELECT city, COUNT(department_id) AS "Departments"
    FROM vwAllDepts
    GROUP BY city;


-- 8.   Create a view called vwAllDeptSumm that consist of all departments and includes for each department: department_id,
--      department_name, number of employees, number of salaried employees, total salary of all employees. Number of salaried
--      must be different from number of employees.The difference is some get commission.
    CREATE VIEW  vwAllDeptSumm  AS 
    SELECT department_id, department_name, COUNT(employee_id)  Employees,
    COUNT(employee_id)- COUNT(commission_pct) "Salaried Employees", SUM(salary) "Total Salary" 
    FROM employees JOIN departments USING (department_id)
    GROUP BY department_id, department_name
    ORDER BY department_id;
    


-- 9.   Use the vwAllDeptSumm view to display department name and number of employees for departments that have more than 
--      the average number of employees.
SELECT department_name, employees
    FROM vwAllDeptSumm
    WHERE employees > (
                    SELECT AVG(employees)
                        FROM vwAllDeptSumm
                        );

-- 10.  a.  Use the GRANT statement to allow another student (Neptune account) to retrieve data for your employees table and 
--          to allow them to retrieve, insert and update data in your departments table. Show proof
GRANT
    SELECT
ON
    employees
TO
    Neptune;
GRANT
    SELECT,
    INSERT,
    UPDATE
ON
    departments
TO 
    Neptune;
    
--      b.  Use the REVOKE statement to remove permission for that student to insert and update data in your departments table.
REVOKE
    INSERT,
    UPDATE
ON
    departments
FROM
    Neptune;












