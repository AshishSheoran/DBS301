-- ****************************
-- Name: Ashish Sheoran
-- ID: 162543177
-- Date: Sept 20, 2019
-- Purpose: DBS301 LAB3
-- ****************************

--1.	Write a query to display the tomorrow’s date in the following format:
--          September 15th of year 2019
--          the result will depend on the day when you RUN/EXECUTE this query.  Label the column “Tomorrow”.
--          Advanced Option (BONUS):  Define an SQL variable called “tomorrow”, assign it a value of tomorrow’s date,
--          use it in an SQL statement.  Don’t forget to undefine it!
SELECT to_char(sysdate + 1, 'Month ddth" of year "yyyy') AS Tomorrow
    FROM dual;


--2.	For each employee in departments 20, 50 and 60 display last name, first name, salary, and salary increased by
--          4% and expressed as a whole number.  Label the column “Good Salary”.  
--          Also add a column that subtracts the old salary from the new salary and multiplies by 12. 
--          Label the column "Annual Pay Increase".
SELECT last_name, first_name, salary, 
        salary * 0.04 AS "Good Salary",
        ((salary + salary * 0.04) - salary) * 12 AS "Annual Pay Increase"
        FROM employees
        WHERE department_id IN (20, 50, 60);


--3.	Write a query that displays the employee’s Full Name and Job Title in the following format:
 --         DAVIES, CURTIS is ST_CLERK 
--          Only employees whose last name ends with S and first name starts with C or K.  
--          Give this column an appropriate label like Person and Job.  Sort the result by the employees’ last names.
SELECT concat(concat(concat(concat(upper(last_name), ', '),upper(first_name)), ' is '), job_id) AS "Person and Job"
    FROM employees
    WHERE (upper(last_name) LIKE ('%S')) AND
            ((first_name) LIKE ('C%') OR
            (first_name) LIKE ('K%'))
    ORDER BY last_name;


--4.	For each employee hired before 2012, display the employee’s last name, hire date and calculate the number of YEARS 
--          between TODAY and the date the employee was hired.
--          a.	Label the column Years worked. 
--          b.	Order your results by the number of years employed.  Round the number of years employed up to the 
--          closest whole number.
SELECT last_name, hire_date,
        EXTRACT (year FROM sysdate) - EXTRACT(year FROM ROUND(to_date(hire_date), 'YEAR')) AS "Years Worked"
    FROM employees
    WHERE hire_date < to_date(2012, 'yyyy')
    ORDER BY "Years Worked";


--5.	Create a query that displays the city names, country codes and state province names, but only for those cities 
--          that starts with S and has at least 8 characters in their name. If city does not have a province name assigned,
--          then put Unknown Province.  Be cautious of case sensitivity!
SELECT city, country_id, COALESCE(state_province, 'Unkown Province') AS "State Province"
    FROM locations
    WHERE city like 'S%' AND Length(city) >= 8;;


--6.	Display each employee’s last name, hire date, and salary review date, which is the first Thursday 
--          after a year of service, but only for those hired after 2017.  
--          a.	Label the column REVIEW DAY. 
--          b.	Format the dates to appear in the format like:
--              WEDNESDAY, SEPTEMBER the Eighteenth of year 2019
--           c.	Sort by review date
SELECT last_name, hire_date, 
       to_char(next_day(add_months(hire_date,12),'TUESDAY'),'fmDAY, Month "the" Ddspth "of year" YYYY') AS "Review Day"
    FROM employees
    WHERE EXTRACT(year from hire_date) > 2016
    ORDER BY "Review Day";
        