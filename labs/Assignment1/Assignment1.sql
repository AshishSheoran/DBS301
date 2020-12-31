-- *********************************
-- NAME: Ashish Sheoran
-- ID#: 162543177
-- NAME: Yu-Tung Cheng
-- ID#:
-- NAME:
-- ID#:
-- *********************************
-- Date: 
-- Purpose: Assignment 1 - DBS301
-- *********************************

-- Question 1.
--      Display the employee number, full employee name, job and hire date of all employees
--          hired in May or November of any year, with the most recently hired employees displayed first.
--      * Also, exclude people hired in 2015 and 2016.
--      * Full name should be in the form "Lastname, Firstname" with an alias called "Full Name".
--      * Hire date should point to the last day in May or November of that year (NOR to the exact day)
--        and be in the form of [May 31<st,nd,rd,th>of 2016] with the heading Starting Date. Do NOT use LIKE operator.
--      * <st,nd,rd,th> means days that end in a 1, should have "st", days that end in a 2 should have "nd",
--        days that end in a 3 should have "rd" and all others should have "th".
--      * You should display ONE row per output line by limiting the width of the Full Name to 25 characters.

SELECT employee_id AS "Employee#",
        SUBSTR(last_name || ' ' || first_name, 1, 25) AS "Full Name",
        job_id AS "Job",
        to_char(hire_date, 'fm[Month ddth "of" yyyy]') AS "Hire Date"
    FROM employees
    WHERE EXTRACT(MONTH FROM hire_date) IN ('5','11') AND
            EXTRACT(Year FROM hire_date) NOT IN ('2015', '2016')
    ORDER BY hire_date DESC;
    
    
-- Question 2.
--      List the employee number, full name, job and the modified salary for all employees 
--          whose monthly earning(without this increase) is outside the range $6,000 - $11,000.
--          and who are employed as Vice Presidents or Managers (President is not counted here.)
--      * You should use Wild Card characters for this.
--      * VP's will get 25% and managers 18% salary increase.
--      * Sort the output by the top salaries (before this increase) firstly.
--      * Heading will be like Employees with increased Pay.
--      * The output lines should look like this sample line
--          Emp# 124 named Kevin Mourgos who is ST_MAN will have a new salary of $6960.

SELECT 'Emp# '||employee_id||' named '||first_name||' '||last_name||' who is '||job_id||' will have a new salary of $'||
    CASE
        WHEN UPPER(job_id) like '%VP%' THEN salary * 1.25 
        WHEN UPPER(job_id) like '%MGR' THEN salary * 1.18
        WHEN UPPER(job_id) like '%MAN' THEN salary * 1.18
        ELSE salary END "Employees with increased Pay" 
    FROM employees
    WHERE salary NOT BETWEEN 6000 AND 11000
        AND job_id LIKE '%VP%' OR job_id LIKE '%MAN%' OR job_id LIKE '%MGR'
    ORDER BY salary DESC;
    

-- Question 3.
--      Display the employee last name, salary, job title and manager# of all employees
--          not earning a commission OR if they work in the SALES department
--          but only if their total monthly salary with $1000 included bonus and commission(if earned)
--          is greater than $15,000.
--      * Let's assume that all employees receive this bonus.
--      * If an employee does not have a manger, then display the word NONE
--      * instead. This column should have an alias Manager#.
--      * Display the Total annual salary as well in the form of $135,600.00 with the heading Total Income. 
--      * Sort the result so that best paid employees are shown first.

SELECT last_name "Last Name", salary, job_id Job,
        NVL(to_char(manager_id), 'NONE') "Manager#",
        to_char((salary + 1000 + NVL(commission_pct, 0) * salary) * 12, '$999,999.99') AS "Total Annual Salary"
    FROM employees
    WHERE commission_pct IS NULL
        OR (upper(job_id) LIKE 'SA%' 
        AND (salary + 1000 + NVL(commission_pct, 0) * salary > 15000))
    ORDER BY salary DESC;
    
    
-- Question 4.
--      Display department_id, job_id and the lowest salary for this combination under the alias Lowest Dept/Job Pay,
--      but only if that Lowest Pay falls in the range $6000 - $17000.
--      Exclude people who work as some kind of Representative job from this query and 
--          departments IT and SALES as well.
--      * Sort the output according to the Department_id and then by Job_id.
--      * You MUST NOT use the Subquery method.


SELECT department_id || ', ' || job_id || ', ' || to_char(min(salary), '$999,999.99') AS "Lowest Dept/Job Pay"
    FROM employees
    WHERE salary BETWEEN 6000 AND 17000
        AND job_id NOT LIKE 'IT%'
        AND job_id NOT LIKE 'SA%'
        AND job_id NOT LIKE '%REP'
    GROUP BY department_id, job_id
    ORDER BY department_id, job_id;


    
   
    