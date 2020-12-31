-- ***************************************
-- Name: Ashish Sheoran
-- ID: 162543177
-- Date: Sept 27, 2019
-- Purpose: Lab 4 DBS 301
-- ***************************************

-- Question 1.   
--      Display the difference between the Average pay and Lowest pay in the company. Name this result Real Amount.
--      Format the output as currency with 2 decimal places.

SELECT  to_char(ROUND(AVG(salary) - MIN(salary)), '$999,999.99') AS "Real Amount"
    FROM employees;
    

-- Question 2.
--      Display the department number and Highest, Lowest and Average pay per each department. Name these results
--      High, Low and Avg. Sort the output so that the department with highest average salary is shown first.
--      Format the output as currency where appropriate.

SELECT department_id,
        to_char(ROUND(max(salary)), '$999,999.99') as High,
        to_char(ROUND(min(salary)), '$999,999.99') as Low,
        to_char(ROUND(avg(salary)), '$999,999.99') as Avg
    FROM employees
    WHERE department_id is not null
    GROUP BY department_id
    ORDER BY AVG DESC;
    
    
-- Question 3.
--      Display how many people work the same job in the same department. Name these results Dept#, Job and How Many.
--      Include only jobs that involve more than one person. 
--      Sort the output so that jobs with most people involved are shown first.

SELECT department_id AS Dept#, 
        job_id AS Job,
        COUNT(job_id) AS "How Many"
    FROM employees
    GROUP BY job_id,department_id
    ORDER BY 3 DESC;
    
    
    
-- Question 4.
--      For each job title display the job title and total amount paid each month for this type of job.
--      Exclude titles AD_PRES and AD_VP and also include only jobs that require more than $11,000
--      Sort the output so that top paid jobs are shown first.

SELECT job_id AS "Job Title", to_char(SUM(salary), '$999,999.99') AS "Amount Paid"
    FROM employees
    WHERE job_id NOT IN ('AD_PREV', 'AD_VP')
    GROUP BY job_id
    HAVING SUM(salary) > 11000
    ORDER BY "Amount Paid" DESC;
        
        
-- Question 5.
--      For each manager number display how many persons he/she supervises.
--      Exclude managers with numbers 100, 101 and 102 and also include those managers that supervise more than 2 persons.
--      Sort the output that manager numbers with the most supervised persons are shown first.

SELECT manager_id AS Manager#, COUNT(employee_id) AS Employees
    FROM employees
    WHERE manager_id NOT IN ('100', '101', '102')
    GROUP BY manager_id
    HAVING COUNT(employee_id) > 2
    ORDER BY Employees DESC;
    
    
-- Question 6.
--      For each department show the latest and earliest hire date, BUT
--          - Exclude departments 10 and 20
--          - Exclude those departments where the last person was hired in this decade.
--          - Sort the output so that the most recent, meaning latest hire dates, are shown first.

SELECT department_id AS Department#,
        to_char(MAX(hire_date), 'yyyy-mm-dd') AS Latest,
       to_char(MIN(hire_date), 'yyyy-mm-dd') AS Earliest
    FROM employees
    WHERE department_id NOT IN ('10', '20')
    GROUP BY department_id
    HAVING MAX(hire_date) < to_char( date '11-01-01', 'yy-mm-dd')
    ORDER BY Latest DESC;

