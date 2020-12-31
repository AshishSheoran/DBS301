-- ***************************************
-- Name: Ashish Sheoran
-- ID: 162543177
-- Date: October 2, 2019
-- Purpose: Lab 5 DBS 301
-- ***************************************

-- PART-A: Simple Joins
-- Question 1.  
--      Display the department name, city, street address and postal code for departments.
--      Sorted by city and department name.

SELECT d.department_name, l.city, l.street_address, l.postal_code
    FROM departments d, locations l
    WHERE d.location_id = l.location_id
    ORDER BY city, department_name;
    
    
-- Question 2.
--      Display full name of employees as a single filed using format of "Last, First"
--      their hire date, salary, department name and city
--      But only for departments with names starting with an A or S
--      Sorted by Department name and Employee name.

SELECT e.last_name || ' ' || e.first_name  "Last, First",
        e.hire_date, e.salary, d.department_name, l.city
    FROM employees e, departments d, locations l
    WHERE ((e.department_id = d.department_id) AND (d.location_id = l.location_id))
        AND (department_name LIKE  'A%' OR department_name LIKE 'S%')
    ORDER BY department_name, "Last, First";
    
    
-- Question 3.
--      Display the full name of the manager of each department in states/provinces of 
--          Ontario, New Jersey and Washington
--      Along with the department name, city, postal code and province name
--      Sort the output by city and then by department name.

SELECT e.first_name||' '||e.last_name "Full Name",
        d.department_name, l.city, l.postal_code, l.state_province
    FROM employees e, departments d, locations l
    WHERE e.employee_id = d.manager_id
        AND d.location_id = l.location_id
            AND state_province IN ('Ontario', 'New Jersey', 'Washington')
    ORDER BY city, department_name;
    
    
-- Question 4.
--      Display employee's last name and employee number 
--          Along with their manager's last name and manager number.
--      Label the columns Employee, Emp#, Manager and Mgr# respectively.

SELECT e.last_name Employee, e.employee_id Emp#,
        m.last_name Manager, m.employee_id Mgr#
    FROM employees e, employees m
    WHERE e.manager_id(+) = m.employee_id;
        

-- PART B : NON-SIMPLE JOINS (Using JOIN statement)
-- Question 5.
--      Display the department name, city, street address, postal code and country name
--          for all departments.
--      Using the JOIN and USING form of syntax.
--      Sort the output by department name descending.

SELECT department_name "Department Name", city, street_address "Street Address",
        postal_code "Postal Code", country_name "Country Name"
    FROM departments LEFT JOIN locations USING(location_id)
        LEFT JOIN countries USING(country_id)
    ORDER BY department_name desc;
    
    
-- Question 6.
--      Display full name of the employees, their hire date and salary together
--          With their department name
--      Only for departments which names start with A or S.
--      - Full name should be formatted: First/Last
--      - Use the JOIN and ON form of syntax.
--      - Sort the output by department name and then by last name.

SELECT first_name || '/' || last_name "Full/Last", hire_date "Hire Date",
        salary, department_name "Department Name"
    FROM employees LEFT JOIN departments
        ON employees.department_id = departments.department_id
    WHERE upper(department_name) LIKE ('A%')
        OR upper(department_name) LIKE ('S%')
    ORDER BY department_name, last_name;
    
    
-- Question 7.
--      Display full name of the manager of each department 
--          - in provinces Ontario, New Jersey and Washington
--          - plus department name, city, postal code and province name.
--      a) Full name should be formatted: Last,First
--      b) Use the JOIN and ON form of syntax.
--      c) Sort the output by city and then by department name.

SELECT last_name || ',' || first_name "Last,First",
        department_name, city, postal_code, state_province
    FROM (employees e JOIN departments d ON e.employee_id = d.manager_id)
        JOIN locations l ON d.location_id = l.location_id
    WHERE state_province IN ('Ontario', 'New Jersey', 'Washington')
    ORDER BY city, department_name;
    
    
-- Question 8.
--      Display the department name and Highest, Lowest and Average pay per each department.
--          - Name these results High, Low and Avg.
--      a) Use JOIN and ON form of the syntax.
--      b) Sort the output so that department with highest average salary are shown first.
SELECT department_name "Department Name",
        LPAD(NVL(to_char(max(salary), '$999,999.99'), '---'), 12) "High",
        LPAD(NVL(to_char(min(salary), '$999,999.99'), '---'), 12) "Low",
        LPAD(NVL(to_char(avg(salary), '$999,999.99'), '---'), 12) "Avg"
    FROM departments LEFT JOIN employees
        ON departments.department_id = employees.department_id
    GROUP BY department_name
    ORDER BY "Avg" DESC;
    
    
-- Question 9.
--      Display the employee last name and employee number
--          - Along with their manager's last name and manager number.
--      a) Label the columns Employee, Emp#, Manager and Mgr# respectively.
--      b) Include also employees who do NOT have a manager and also employees 
--          who do NOT supervise anyone ( or you could say managers without 
--          employees to supervise).

SELECT e.last_name AS "Employee", e.employee_id AS "Emp#",
        NVL(m.last_name, '-') AS "Manager",
        NVL(to_char(m.employee_id), '-') AS "Mgr#"
    FROM employees e LEFT OUTER JOIN employees m
        ON e.manager_id = m.employee_id
    ORDER BY "Mgr#";
        

    