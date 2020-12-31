    -- *********************************
    -- NAME: Ashish Sheoran
    -- ID#:  162543177
    -- NAME: YuTung Cheng
    -- ID#:  111507182
    -- NAME: Dave MacLellan
    -- ID#:  134463165
    -- *********************************
    -- Date: November 28, 2019
    -- Purpose: Assignment 2 - DBS301
    -- *********************************
    SET define off;
    --  To DROP tables.
    DROP TABLE a2Employees;
    DROP TABLE a2Professors;
    DROP TABLE a2Departments;
    DROP TABLE a2Countries;
    DROP TABLE a2Term;
    DROP TABLE a2Courses;
    DROP TABLE a2Programs;
    DROP TABLE a2Advisors;
    DROP TABLE a2Sections;
    DROP TABLE a2Students;
    DROP TABLE a2JNC_Stud_Courses;
    DROP TABLE a2JNC_Prog_Students;
    DROP TABLE a2JNC_Prog_Courses;
    
    
    
    --  Creating table a2Employees
    CREATE TABLE a2Employees
        (empId      NUMBER(6)       NOT NULL,
        FirstName   VARCHAR2(20),
        LastName    VARCHAR2(20)    CONSTRAINT a2_emp_empLast_nn   NOT NULL,
        Prefix      VARCHAR2(5),
        Suffix      VARCHAR2(10),
        isActive    NUMBER(35),
        SIN         NUMBER(15)      CONSTRAINT a2_empSIN_nn    NOT NULL,
        DOB         Date            CONSTRAINT a2_empDOB_nn    NOT NULL,
        email       VARCHAR2(25)    CONSTRAINT a2_empEmail_nn  NOT NULL,
        Phone       VARCHAR2(20),
        CONSTRAINT  a2_emp_email_UK     UNIQUE(email),
        CONSTRAINT  a2_emp_empId_PK     PRIMARY KEY(empId)
        );

    -- Insert DATA into a2Employees
    INSERT INTO a2Employees VALUES (001, 'Ian', 'Tipson', 'FULL', 'PROF', 1, 28443498, to_date('03-01-1966', 'dd-mm-yyyy'), 'iantipson@myseneca.ca', '3234562342');
    INSERT INTO a2Employees VALUES (002, 'Sheryl', 'Minnett', 'FULL', 'PROF', 1, 23415634, to_date('03-01-1988', 'dd-mm-yyyy'), 'Sheryl@myseneca.ca', '3234231133');
    INSERT INTO a2Employees VALUES (003, 'Janet', 'Melo-Thaiss', 'FULL', 'PROF', 1, 32213123, to_date('03-01-1961', 'dd-mm-yyyy'), 'jain@myseneca.ca', '3242342342');
    INSERT INTO a2Employees VALUES (004, 'Azzad', 'Kara', 'FULL', 'PROF', 1, 32343498, to_date('03-03-1966', 'dd-mm-yyyy'), 'kara@myseneca.ca', '3421324327');
    INSERT INTO a2Employees VALUES (005, 'Nargls', 'Khan', 'FULL', 'PROF', 1, 74421389, to_date('20-01-1966', 'dd-mm-yyyy'), 'khan@myseneca.ca', '3321342342');
    INSERT INTO a2Employees VALUES (006, 'Peter', 'liu', 'FULL', 'PROF', 1, 78823448, to_date('16-01-1960', 'dd-mm-yyyy'), 'peter@myseneca.ca', '3234212342');
    INSERT INTO a2Employees VALUES (007, 'Mark', 'Thaiss', 'FULL', 'PROF', 1, 88461498, to_date('23-01-1976', 'dd-mm-yyyy'), 'makr@myseneca.ca', '3277562342');
    INSERT INTO a2Employees VALUES (008, 'Tanvir', 'Alam', 'FULL', 'PROF', 1, 12346664, to_date('03-06-1988', 'dd-mm-yyyy'), 'asma@myseneca.ca', '3211313445');
    INSERT INTO a2Employees VALUES (009, 'Nasim', 'Razavl', 'FULL', 'PROF', 1, 23424558, to_date('09-01-1966', 'dd-mm-yyyy'), 'razavii@myseneca.ca', '6473831923');
    INSERT INTO a2Employees VALUES (010, 'Mark', 'Brownlie', 'FULL', 'PROF', 1, 65683498, to_date('22-01-1979', 'dd-mm-yyyy'), 'brown@myseneca.ca', '3325681123');
    INSERT INTO a2Employees VALUES (011, 'James', 'Mwangi', 'FULL', 'PROF', 1, 32462698, to_date('15-01-1976', 'dd-mm-yyyy'), 'imbadeprof@myseneca.ca', '3787878782');
    INSERT INTO a2Employees VALUES (012, 'Clint', 'Macdonald', 'FULL', 'PROF', 1, 1357498, to_date('23-01-1983', 'dd-mm-yyyy'), 'mcd@myseneca.ca', '3431231577');
    INSERT INTO a2Employees VALUES (013, 'Stanley', 'Ukah', 'FULL', 'PROF', 1, 46643498, to_date('13-11-1983', 'dd-mm-yyyy'), 'uukan@myseneca.ca', '8877562342');
    INSERT INTO a2Employees VALUES (014, 'Asam', 'Gulaid', 'FULL', 'PROF', 1, 88443498, to_date('03-11-1978', 'dd-mm-yyyy'), 'assam@myseneca.ca', '9899962342');
    INSERT INTO a2Employees VALUES (015, 'David', 'Humphrey', 'FULL', 'PROF', 1, 66743498, to_date('03-10-1986', 'dd-mm-yyyy'), 'daivvd@myseneca.ca', '5639623421');
    INSERT INTO a2Employees VALUES (016, 'Clifford', 'Michael', 'FULL', 'PROF', 1, 84543498, to_date('03-21-1993', 'dd-mm-yyyy'), 'micc@myseneca.ca', '2342152342');
    INSERT INTO a2Employees VALUES (017, 'Cooler', 'Master', 'FULL', 'PROF', 1, 88443498, to_date('01-09-1983', 'dd-mm-yyyy'), 'assam@myseneca.ca', '7568358563');
    INSERT INTO a2Employees VALUES (018, 'Razzar', 'Keyboard', 'FULL', 'PROF', 1, 88443498, to_date('02-02-1968', 'dd-mm-yyyy'), 'assam@myseneca.ca', '8442418850');





        
    --   Creating table a2Professors   
    CREATE TABLE a2Professors
        (empId      NUMBER(6)       NOT NULL,
        deptCode    NUMBER(4),
        isActive    NUMBER(35)
        );
    ALTER TABLE a2Professors
        ADD CONSTRAINT a2_prof_empId_PK 
        PRIMARY KEY (empId);
    ALTER TABLE a2Professors
        ADD CONSTRAINT a2_prof_empId_FK
        FOREIGN KEY (empId)
        REFERENCES a2Employees(empId);
    
    -- Insert DATA into a2Professors
    INSERT INTO a2Professors VALUES (001, 001, 1);
    INSERT INTO a2Professors VALUES (002, 002, 1);
    INSERT INTO a2Professors VALUES (003, 002, 1);
    INSERT INTO a2Professors VALUES (004, 003, 1);
    INSERT INTO a2Professors VALUES (005, 003, 1);
    INSERT INTO a2Professors VALUES (006, 001, 1);
    INSERT INTO a2Professors VALUES (007, 001, 1);
    INSERT INTO a2Professors VALUES (008, 001, 1);
    INSERT INTO a2Professors VALUES (009, 001, 1);
    INSERT INTO a2Professors VALUES (010, 002, 1);
    INSERT INTO a2Professors VALUES (011, 003, 1);
    INSERT INTO a2Professors VALUES (012, 003, 1);
    INSERT INTO a2Professors VALUES (013, 003, 1);
    INSERT INTO a2Professors VALUES (014, 003, 1);
    INSERT INTO a2Professors VALUES (015, 001, 1);
    INSERT INTO a2Professors VALUES (016, 002, 1);
    INSERT INTO a2Professors VALUES (017, 001, 1);
    INSERT INTO a2Professors VALUES (018, 001, 1);


    --  Creating table a2Departments
    CREATE TABLE a2Departments
        (deptCode       NUMBER(4)       NOT NULL,
        deptName        VARCHAR2(30)    CONSTRAINT a2_dept_depName_nn   NOT NULL,
        officeNumber    VARCHAR2(5),
        displayOrder    VARCHAR2(40),
        CONSTRAINT a2_dept_deptCode_PK
            PRIMARY KEY (deptCode)
        );
        
        --  Need to connect departments with professors using the deptCode
        ALTER TABLE a2Professors
            ADD CONSTRAINT a2_prof_deptCode_FK
            FOREIGN KEY  (deptCode)
            REFERENCES  a2Departments(deptCode);

    -- INSERT DATA INTO DEPARTMENTS
    INSERT INTO a2Departments VALUES (001, "SchoolSoftwareDesign&DataSci", 26234, 001);
    INSERT INTO a2Departments VALUES (002, "Sch of Eng&Lib Studies - FCAD", 33583, 002);
    INSERT INTO a2Departments VALUES (003, "School of Info & Comm Tech-SY", 26234, 003);
            
            
    --  Creating table a2Countries
    CREATE TABLE a2Countries
        (countryCode    NUMBER(4),   
                    CONSTRAINT a2_country_code_PK   
                        PRIMARY KEY (countryCode),
        countryName     VARCHAR2(20),
        continent       VARCHAR2(20),
        isActive        NUMBER(35)
        );
    
    -- Insert DATA into Countries
    INSERT INTO a2Countries VALUES (1, 'CA', 'ON', 1);
    INSERT INTO a2Countries VALUES (2, 'US', 'CA', 1);
    INSERT INTO a2Countries VALUES (3, 'IN', 'XD', 1);
    INSERT INTO a2Countries VALUES (4, 'TW', 'TP', 1);



        
    --  Creating table a2Term
    CREATE TABLE a2Term
        (termCode       NUMBER(10),
                    CONSTRAINT a2_term_code_PK
                        PRIMARY KEY (termCode),
        termName        VARCHAR2(20),
        startDate       DATE        CONSTRAINT a2_term_start_nn     NOT NULL,
        endDate         DATE        CONSTRAINT a2_term_end_nn       NOT NULL
        );
        
    -- Insert DATA into a2Term
    INSERT INTO a2Term VALUES (1, 'SEMESTER 1', to_date('2018/09/01', 'yyyy/mm/dd'), to_date('2018/12/16', 'yyyy/mm/dd'));
    INSERT INTO a2Term VALUES (2, 'SEMESTER 2', to_date('2019/01/02', 'yyyy/mm/dd'), to_date('2019/05/20', 'yyyy/mm/dd'));
    INSERT INTO a2Term VALUES (3, 'SEMESTER 3', to_date('2019/09/01', 'yyyy/mm/dd'), to_date('2019/12/16', 'yyyy/mm/dd'));
    INSERT INTO a2Term VALUES (4, 'SEMESTER 4', to_date('2020/01/02', 'yyyy/mm/dd'), to_date('2020/05/20', 'yyyy/mm/dd'));


        
    --  Creating table Courses
    CREATE TABLE a2Courses
        (courseCode     NUMBER(15),
                    CONSTRAINT a2_courses_code_PK
                        PRIMARY KEY (courseCode),
        courseName      VARCHAR2(20),
        isAvailable     VARCHAR2(20),
        field           VARCHAR2(50)
        );
        
    -- Insert DATA into a2Courses
    INSERT INTO a2Courses VALUES (144, 'IPC144', 1, 'Introduction of C programing');
    INSERT INTO a2Courses VALUES (100, 'APC100', 1, 'Applied Prof Communication');
    INSERT INTO a2Courses VALUES (101, 'COM101', 1, 'Communicating Across Contexts');
    INSERT INTO a2Courses VALUES (102, 'ULI101', 1, 'Intro to UNIX and Linux Internet');
    INSERT INTO a2Courses VALUES (103, 'CPR101', 1, 'Comp Principle for programmer');
    INSERT INTO a2Courses VALUES (244, 'OOP244', 1, 'Object Oriented programming');
    INSERT INTO a2Courses VALUES (255, 'DCF255', 1, 'Data Communications Fund');
    INSERT INTO a2Courses VALUES (222, 'WEB222', 1, 'Web Programming Principle');
    INSERT INTO a2Courses VALUES (201, 'DBS201', 1, 'Intro to Database Design and SQL');
    INSERT INTO a2Courses VALUES (252, 'CAN252', 1, 'Canadians and Americans');
    INSERT INTO a2Courses VALUES (322, 'WEB322', 1, 'Web Tools and Framworks');
    INSERT INTO a2Courses VALUES (301, 'DBS301', 1, 'Database Design II and SQL');
    INSERT INTO a2Courses VALUES (366, 'SYS366', 1, 'Req Gath Using OO Models');
    INSERT INTO a2Courses VALUES (345, 'OOP345', 1, 'Software Development Using Cpp');
    INSERT INTO a2Courses VALUES (594, 'EAC593', 1, 'Business Communication for Work');
    INSERT INTO a2Courses VALUES (444, 'JAC444', 1, 'Intro JAVA for CPP programmers');
    INSERT INTO a2Courses VALUES (422, 'WEB422', 1, 'WEB programming for APPS Service');
    INSERT INTO a2Courses VALUES (433, 'BCI433', 1, 'IBM Buisness Computing');



    
    --  Creating table a2Programs
    CREATE TABLE a2Programs
        (progCode       NUMBER(10),
                     CONSTRAINT a2_program_progCode_PK
                        PRIMARY KEY (progCode),
        progName        VARCHAR2(20),
        lengthYears     NUMBER(3)  CONSTRAINT a2_program_len_nn  NOT NULL,
        isCurrent       VARCHAR2(20),
        deptCode        NUMBER(4),
                    CONSTRAINT a2_program_deptCode_FK       --  To connect with departments table using deptCode foreign key
                        FOREIGN KEY (deptCode)
                        REFERENCES  a2Departments(deptCode)
        );
    
    -- Insert DATA into a2Programs
    INSERT INTO a2Programs VALUES (1, 'CPA', 3, 'YES', 002);
    INSERT INTO a2Programs VALUES (2, 'CPD', 2, 'YES', 003);
    INSERT INTO a2Programs VALUES (3, 'BOTH', 2, 'NO', 001);
        
    --  Creating table a2Advisors
    CREATE TABLE a2Advisors
        (empId          NUMBER(4),
                    CONSTRAINT a2_advisors_empId_PK
                        PRIMARY KEY (empId),
        isActive        NUMBER(35),
                    CONSTRAINT a2_advisors_empId_FK     --  To connect with employees table using  foreign key (empId).
                        FOREIGN KEY (empId)
                        REFERENCES  a2Employees(empId)
        );
        
    -- Insert Data into a2Advisors
    INSERT INTO a2Advisors VALUES (001, 1);
    INSERT INTO a2Advisors VALUES (002, 1);
    INSERT INTO a2Advisors VALUES (003, 1);
    INSERT INTO a2Advisors VALUES (004, 0);
    INSERT INTO a2Advisors VALUES (005, 0);
    INSERT INTO a2Advisors VALUES (006, 0);
    INSERT INTO a2Advisors VALUES (007, 0);
    INSERT INTO a2Advisors VALUES (008, 0);
    INSERT INTO a2Advisors VALUES (009, 0);
    INSERT INTO a2Advisors VALUES (010, 0);
    INSERT INTO a2Advisors VALUES (011, 0);
    INSERT INTO a2Advisors VALUES (012, 0);
    INSERT INTO a2Advisors VALUES (013, 0);
    INSERT INTO a2Advisors VALUES (014, 0);
    INSERT INTO a2Advisors VALUES (015, 0);
    INSERT INTO a2Advisors VALUES (016, 0);
    INSERT INTO a2Advisors VALUES (017, 0);
    INSERT INTO a2Advisors VALUES (018, 0);


    --  Creating table a2Sections
    CREATE TABLE a2Sections
        (sectionId      NUMBER(15),
                    CONSTRAINT a2_section_id_PK
                        PRIMARY KEY (sectionId),
        sectionalLetter VARCHAR2(10),
        courseCode      NUMBER(15),
                    CONSTRAINT a2_sections_courseCode_FK        --  to connect with courses table using foreign key (COURSECODE).
                        FOREIGN KEY (courseCode)
                        REFERENCES  a2Courses(courseCode),
        termCode        NUMBER(10),
                    CONSTRAINT a2_sections_termCode_FK          --  to connect with term table using foreign key (TERMCODE).
                        FOREIGN KEY (termCode)
                        REFERENCES  a2Term(termCode),
        profId          NUMBER(4),
                    CONSTRAINT a2_sections_profId_FK            --  to connect with sections table using foreign key (PROFID) and (EMPID).
                        FOREIGN KEY (profId)
                        REFERENCES  a2Professors(empId)
        );
        
        
    --Insert DATA into a2Sections
    INSERT INTO a2Sections VALUES (1, 'Section 1', 144, 1, 001);
    INSERT INTO a2Sections VALUES (2, 'Section 1', 100, 1, 002);
    INSERT INTO a2Sections VALUES (3, 'Section 1', 101, 1, 003);
    INSERT INTO a2Sections VALUES (4, 'Section 1', 102, 1, 004);
    INSERT INTO a2Sections VALUES (5, 'Section 1', 103, 1, 005);
    INSERT INTO a2Sections VALUES (6, 'Section 2', 244, 2, 006);
    INSERT INTO a2Sections VALUES (7, 'Section 2', 255, 2, 007);
    INSERT INTO a2Sections VALUES (8, 'Section 2', 222, 2, 008);
    INSERT INTO a2Sections VALUES (9, 'Section 2', 201, 2, 009);
    INSERT INTO a2Sections VALUES (10, 'Section 2', 252, 2, 010);
    INSERT INTO a2Sections VALUES (11, 'Section 3', 322, 3, 011);
    INSERT INTO a2Sections VALUES (12, 'Section 3', 301, 3, 012);
    INSERT INTO a2Sections VALUES (13, 'Section 3', 366, 3, 013);
    INSERT INTO a2Sections VALUES (14, 'Section 3', 345, 3, 014);
    INSERT INTO a2Sections VALUES (15, 'Section 4', 594, 4, 015);
    INSERT INTO a2Sections VALUES (16, 'Section 4', 444, 4, 016);
    INSERT INTO a2Sections VALUES (17, 'Section 4', 422, 4, 017);
    INSERT INTO a2Sections VALUES (18, 'Section 4', 433, 4, 018);





    --  Creating table a2Students
    CREATE TABLE a2Students
        (studentId      NUMBER(15),
                CONSTRAINT a2_students_studentId_PK
                    PRIMARY KEY (studentId),
        firstName       VARCHAR2(20),
        lastName        VARCHAR2(20)    NOT NULL,
        DOB             DATE            NOT NULL,
        Gender          VARCHAR2(10)    NOT NULL,
        email           VARCHAR2(20)    NOT NULL,
                CONSTRAINT a2_students_email_UK
                    UNIQUE (email),
        homeCountry     NUMBER(4),
                CONSTRAINT a2_students_country_FK
                    FOREIGN KEY (homeCountry)
                    REFERENCES  a2Countries(countryCode),
        phone           NUMBER(15),
        advisorId       NUMBER(4),
                CONSTRAINT a2_students_advisor_FK
                    FOREIGN KEY (advisorId)
                    REFERENCES  a2Advisors(empId)
        );
        
    -- Insert DATA into a2Students
    INSERT INTO a2Students VALUES(162543177, 'Ashish', 'Sheoran', to_date('1999/12/07', 'yyyy/mm/dd'), 'M', 'ashish1@myseneca.ca', 003, 6479123333, 001);
    INSERT INTO a2Students VALUES(111507182, 'YuTung', 'Cheng', to_date('1993/08/10', 'yyyy/mm/dd'), 'M', 'ycheng55@myseneca.ca', 004, 6479143375, 002);
    INSERT INTO a2Students VALUES(134463165, 'Dave', 'MacLellan', to_date('1992/03/17', 'yyyy/mm/dd'), 'M', 'Dave222@myseneca.ca', 001, 6479142342, 003);


        
    --  Creating table JNC_STUDENTS_COURSES
    CREATE TABLE a2JNC_Stud_Courses
        (courseCode     NUMBER(15)       NOT NULL,
                CONSTRAINT a2_jnc_stud_cours_Code_FK
                    FOREIGN KEY (courseCode)
                    REFERENCES  a2Courses(courseCode),
        studentId       NUMBER(15)       NOT NULL,
                CONSTRAINT a2_jnc_stud_cour_studId_FK
                    FOREIGN KEY (studentId)
                    REFERENCES  a2Students(studentId),
        isActive        NUMBER(35),
                CONSTRAINT a2_jnc_stud_courses_PK
                    PRIMARY KEY (courseCode, studentId)     --  COMPOSITE PRIMARY KEY
        );
        
    -- Insert DATA into JNC_STUDENTS_COURSES
    INSERT INTO JNC_STUDENTS_COURSES VALUES (144, 111507182, 1);
    INSERT INTO JNC_STUDENTS_COURSES VALUES (144, 162543177, 1);
    INSERT INTO JNC_STUDENTS_COURSES VALUES (100, 111507182, 1);
    INSERT INTO JNC_STUDENTS_COURSES VALUES (100, 162543177, 1);
    INSERT INTO JNC_STUDENTS_COURSES VALUES (101, 111507182, 1);
    INSERT INTO JNC_STUDENTS_COURSES VALUES (101, 162543177, 1);
    INSERT INTO JNC_STUDENTS_COURSES VALUES (102, 111507182, 1);
    INSERT INTO JNC_STUDENTS_COURSES VALUES (102, 162543177, 1);
    INSERT INTO JNC_STUDENTS_COURSES VALUES (103, 111507182, 1);
    INSERT INTO JNC_STUDENTS_COURSES VALUES (103, 162543177, 1);

    INSERT INTO JNC_STUDENTS_COURSES VALUES (244, 111507182, 1);
    INSERT INTO JNC_STUDENTS_COURSES VALUES (244, 162543177, 1);
    INSERT INTO JNC_STUDENTS_COURSES VALUES (255, 111507182, 1);
    INSERT INTO JNC_STUDENTS_COURSES VALUES (255, 162543177, 1);
    INSERT INTO JNC_STUDENTS_COURSES VALUES (222, 111507182, 1);
    INSERT INTO JNC_STUDENTS_COURSES VALUES (222, 162543177, 1);
    INSERT INTO JNC_STUDENTS_COURSES VALUES (201, 111507182, 1);
    INSERT INTO JNC_STUDENTS_COURSES VALUES (201, 162543177, 1);
    INSERT INTO JNC_STUDENTS_COURSES VALUES (252, 111507182, 1);
    INSERT INTO JNC_STUDENTS_COURSES VALUES (252, 162543177, 1);

    INSERT INTO JNC_STUDENTS_COURSES VALUES (322, 111507182, 1);
    INSERT INTO JNC_STUDENTS_COURSES VALUES (322, 162543177, 1);
    INSERT INTO JNC_STUDENTS_COURSES VALUES (301, 111507182, 1);
    INSERT INTO JNC_STUDENTS_COURSES VALUES (301, 162543177, 1);
    INSERT INTO JNC_STUDENTS_COURSES VALUES (301, 134463165, 1);
    INSERT INTO JNC_STUDENTS_COURSES VALUES (366, 111507182, 1);
    INSERT INTO JNC_STUDENTS_COURSES VALUES (366, 162543177, 1);
    INSERT INTO JNC_STUDENTS_COURSES VALUES (345, 111507182, 1);
    INSERT INTO JNC_STUDENTS_COURSES VALUES (345, 162543177, 1);

    INSERT INTO JNC_STUDENTS_COURSES VALUES (594, 111507182, 0);
    INSERT INTO JNC_STUDENTS_COURSES VALUES (594, 162543177, 0);
    INSERT INTO JNC_STUDENTS_COURSES VALUES (444, 111507182, 0);
    INSERT INTO JNC_STUDENTS_COURSES VALUES (444, 162543177, 0);
    INSERT INTO JNC_STUDENTS_COURSES VALUES (422, 111507182, 0);
    INSERT INTO JNC_STUDENTS_COURSES VALUES (422, 162543177, 0);
    INSERT INTO JNC_STUDENTS_COURSES VALUES (433, 111507182, 0);
    INSERT INTO JNC_STUDENTS_COURSES VALUES (433, 162543177, 0);



        
    --  Creating table JNC_PROG_STUDENTS
    CREATE TABLE a2JNC_Prog_Students
        (progCode       NUMBER(10)       NOT NULL,
                CONSTRAINT a2_jnc_prog_stud_progcode_FK
                    FOREIGN KEY (progCode)
                    REFERENCES  a2Programs(progCode),
        studentId       NUMBER(15)       NOT NULL,
                CONSTRAINT a2_jnc_prog_stud_studId_FK
                    FOREIGN KEY (studentId)
                    REFERENCES  a2Students(studentId),
        isActive        NUMBER(35),
                CONSTRAINT a2_jnc_prog_students_PK
                    PRIMARY KEY (progCode, studentId)
        );
        
    --Insert DATA into JNC_PROG_STUDENTS
    INSERT INTO JNC_PROG_STUDENTS VALUES (2, 111507182, 1);
    INSERT INTO JNC_PROG_STUDENTS VALUES (2, 162543177, 1);
    INSERT INTO JNC_PROG_STUDENTS VALUES (1, 134463165, 1);


        
    --  Creating table JNC_PROG_COURSES
    CREATE TABLE a2JNC_Prog_Courses
        (progCourseId       NUMBER(10)      NOT NULL,
                CONSTRAINT a2_jnc_prog_courses_PK
                    PRIMARY KEY (progCourseId),
        progCode            NUMBER(10)       NOT NULL,
                CONSTRAINT a2_jnc_prog_cour_progcode_FK
                    FOREIGN KEY (progCode)
                    REFERENCES  a2Programs(progCode),
        courseCode          NUMBER(15)       NOT NULL,
                CONSTRAINT a2_jnc_prog_cour_coursCode_FK
                    FOREIGN KEY (courseCode)
                    REFERENCES  a2Courses(courseCode),
        isActive            NUMBER(35)
        );
        
    -- Insert Data to JNC_PROG_COURSES
    INSERT INTO JNC_PROG_COURSES VALUES (1, 3, 144, 1);
    INSERT INTO JNC_PROG_COURSES VALUES (2, 3, 100, 1);
    INSERT INTO JNC_PROG_COURSES VALUES (2, 3, 101, 1);
    INSERT INTO JNC_PROG_COURSES VALUES (2, 3, 102, 1);
    INSERT INTO JNC_PROG_COURSES VALUES (2, 3, 103, 1);

    INSERT INTO JNC_PROG_COURSES VALUES (2, 3, 244, 1);
    INSERT INTO JNC_PROG_COURSES VALUES (2, 3, 255, 1);
    INSERT INTO JNC_PROG_COURSES VALUES (2, 3, 222, 1);
    INSERT INTO JNC_PROG_COURSES VALUES (2, 3, 201, 1);
    INSERT INTO JNC_PROG_COURSES VALUES (2, 3, 252, 1);

    INSERT INTO JNC_PROG_COURSES VALUES (2, 3, 322, 1);
    INSERT INTO JNC_PROG_COURSES VALUES (2, 3, 301, 1);
    INSERT INTO JNC_PROG_COURSES VALUES (2, 3, 366, 1);
    INSERT INTO JNC_PROG_COURSES VALUES (2, 3, 345, 1);

    INSERT INTO JNC_PROG_COURSES VALUES (2, 3, 594, 1);
    INSERT INTO JNC_PROG_COURSES VALUES (2, 3, 444, 1);
    INSERT INTO JNC_PROG_COURSES VALUES (2, 3, 422, 1);
    INSERT INTO JNC_PROG_COURSES VALUES (2, 3, 433, 1);






    
        
        