---------------------------------------------------------------------------------

--	   This SQL file builds the tables for nested table data

---------------------------------------------------------------------------------
DROP TABLE DEPARTMENT;

DROP TYPE PROJECTLIST;

DROP TYPE PROJECT;

CREATE OR REPLACE TYPE Project AS OBJECT (
    project_no NUMBER(2), 
    title      VARCHAR2(35),
    cost       NUMBER(7,2));
/

CREATE TYPE ProjectList AS VARRAY(50) OF Project;
/

CREATE TABLE department (
   dept_id  NUMBER(2),
   name     VARCHAR2(15),
   budget   NUMBER(11,2),
   projects ProjectList);


INSERT INTO department
      VALUES(30, 'Accounting', 1205700, 
         ProjectList(Project(1, 'Design New Expense Report', 3250), 
                     Project(2, 'Outsource Payroll', 12350), 
                     Project(3, 'Evaluate Merger Proposal', 2750), 
                     Project(4, 'Audit Accounts Payable', 1425))); 
INSERT INTO department
      VALUES(50, 'Maintenance', 925300,
         ProjectList(Project(1, 'Repair Leak in Roof', 2850),
                     Project(2, 'Install New Door Locks', 1700),
                     Project(3, 'Wash Front Windows', 975),
                     Project(4, 'Repair Faulty Wiring', 1350),
                     Project(5, 'Winterize Cooling System', 1125)));
INSERT INTO department
      VALUES(60, 'Security', 750400,
         ProjectList(Project(1, 'Issue New Employee Badges', 13500),
                     Project(2, 'Find Missing Computer Chips', 2750),
                     Project(3, 'Upgrade Alarm System', 3350),
                     Project(4, 'Inspect Emergency Exits', 1900)));


DROP TABLE DIVISION;

DROP TYPE COURSELIST;

DROP TYPE COURSE;

CREATE TYPE Course AS OBJECT (
    course_no NUMBER(4), 
    title     VARCHAR2(35),
    credits    NUMBER(1));
/

CREATE TYPE CourseList AS TABLE OF Course;
/

CREATE TABLE division (
    name     VARCHAR2(20),
    director VARCHAR2(20),
    office   VARCHAR2(20),
    courses  CourseList) 
    NESTED TABLE courses STORE AS courses_tab;


INSERT INTO division
      VALUES('Psychology', 'Irene Friedman', 'Fulton Hall 133',
         CourseList(Course(1000, 'General Psychology', 5),
                    Course(2100, 'Experimental Psychology', 4),
                    Course(2200, 'Psychological Tests', 3),
                    Course(2250, 'Behavior Modification', 4),
                    Course(3540, 'Groups and Organizations', 3),
                    Course(3552, 'Human Factors in the Workplace', 4),
                    Course(4210, 'Theories of Learning', 4),
                    Course(4320, 'Cognitive Processes', 4),
                    Course(4410, 'Abnormal Psychology', 4)));
INSERT INTO division
      VALUES('History', 'John Whalen', 'Applegate Hall 142',
         CourseList(Course(1011, 'History of Europe I', 4),
                    Course(1012, 'History of Europe II', 4),
                    Course(1202, 'American History', 5),
                    Course(2130, 'The Renaissance', 3),
                    Course(2132, 'The Reformation', 3),
                    Course(3105, 'History of Ancient Greece', 4),
                    Course(3321, 'Early Japan', 4),
                    Course(3601, 'Latin America Since 1825', 4),
                    Course(3702, 'Medieval Islamic History', 4)));
INSERT INTO division
      VALUES('English', 'Lynn Saunders', 'Breakstone Hall 205',
         CourseList(Course(1002, 'Expository Writing', 3),
                    Course(2020, 'Film and Literature', 4),
                    Course(2418, 'Modern Science Fiction', 3),
                    Course(2810, 'Discursive Writing', 4),
                    Course(3010, 'Modern English Grammar', 3),
                    Course(3720, 'Introduction to Shakespeare', 4),
                    Course(3760, 'Modern Drama', 4),
                    Course(3822, 'The Short Story', 4),
                    Course(3870, 'The American Novel', 5)));

commit;