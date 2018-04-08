/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  shree
 * Created: Apr 6, 2018
 */

SET SERVEROUTPUT ON;

CREATE OR REPLACE PACKAGE SQLPackage AS

    TYPE myCursor IS REF CURSOR;



-- @shree : Students Module

    PROCEDURE display_students(oCursor OUT myCursor);

    PROCEDURE add_student(temp_sid IN students.sid%TYPE, temp_firstname IN students.firstname%TYPE, temp_lastname IN students.lastname%TYPE, temp_status IN students.status%TYPE, temp_gpa IN students.gpa%TYPE, temp_email IN students.email%TYPE);

    PROCEDURE find_student(oCursor IN OUT myCursor,  temp_sid IN students.sid%TYPE);

    PROCEDURE delete_student(temp_sid IN students.sid%TYPE);


-- @shree : Courses Module

    PROCEDURE display_courses(oCursor OUT myCursor);

    PROCEDURE display_prerequisites(oCursor OUT myCursor);

    PROCEDURE find_course(oCursor IN OUT myCursor, temp_dept IN courses.dept_code%TYPE, temp_course IN courses.course_no%TYPE);


-- @shree : Classes Module

    PROCEDURE display_classes(oCursor OUT myCursor);

    PROCEDURE find_class(oCursor IN OUT myCursor,  temp_classid IN classes.classid%TYPE);
    
    

END;
/


CREATE OR REPLACE PACKAGE BODY SQLPackage AS

-- @shree : Students module
-- @shree : Students module - show students
    PROCEDURE display_students(oCursor OUT myCursor) AS
        BEGIN
            OPEN oCursor FOR SELECT * FROM students; 
        END;

-- @shree : Students module - insert student
    PROCEDURE add_student(temp_sid IN students.sid%TYPE, temp_firstname IN students.firstname%TYPE, temp_lastname IN students.lastname%TYPE, temp_status IN students.status%TYPE, temp_gpa IN students.gpa%TYPE, temp_email IN students.email%TYPE) AS
        BEGIN
            INSERT INTO students VALUES (temp_sid, temp_firstname, temp_lastname, temp_status, temp_gpa, temp_email);
        END;

-- @shree : Students module - find student and his classes
    PROCEDURE find_student(oCursor IN OUT myCursor,  temp_sid IN students.sid%TYPE) AS

    sidcheck varchar(10);
    cnt varchar(10);

    BEGIN
        sidcheck := 0;

        BEGIN
            SELECT sid INTO sidcheck FROM students WHERE sid = temp_sid;
            EXCEPTION
                WHEN no_data_found THEN raise_application_error(-20001, 'The sid is invalid.');
            return;
        END;

        BEGIN
            SELECT sid INTO cnt FROM enrollments WHERE sid = temp_sid AND ROWNUM = 1;
            EXCEPTION
                WHEN no_data_found THEN 
                    OPEN oCursor FOR SELECT sid, lastname, status FROM students WHERE sid = temp_sid;
                return;
        END;

        BEGIN
            OPEN oCursor FOR 
                SELECT students.sid, students.lastname, students.status, classes.classid, concat(classes.dept_code, classes.course_no), courses.title, classes.year, classes.semester FROM Students 
                    JOIN enrollments ON enrollments.sid = students.sid AND students.sid = temp_sid
                    JOIN classes ON classes.classid = enrollments.classid
                    JOIN courses ON courses.dept_code = classes.dept_code AND courses.course_no = classes.course_no;
        END;

    END;

-- @shree : Students module - delete student
    PROCEDURE delete_student(temp_sid IN students.sid%TYPE) AS
        
        sidcheck varchar(10);
        
        BEGIN
            sidcheck := 0;

            BEGIN
                SELECT sid INTO sidcheck FROM students WHERE sid = temp_sid;
                EXCEPTION
                    WHEN no_data_found THEN raise_application_error(-20001, 'The sid is invalid.');
                return;
            END;

            BEGIN
                DELETE FROM students WHERE sid = temp_sid;
            END;

        END;
            
    
    -- @shree : Courses module
    -- @shree : Courses module - show courses
    PROCEDURE display_courses(oCursor OUT myCursor) AS
        BEGIN
            OPEN oCursor FOR SELECT * FROM courses; 
        END;

   -- @shree : Courses module - show prerequisites
    PROCEDURE display_prerequisites(oCursor OUT myCursor) AS
        BEGIN
            OPEN oCursor FOR SELECT * FROM prerequisites; 
        END;

            
    -- @shree : Courses module - find course
     PROCEDURE find_course(oCursor IN OUT myCursor, temp_dept IN courses.dept_code%TYPE, temp_course IN courses.course_no%TYPE) AS

        cidcheck varchar(20);
        
        BEGIN
            cidcheck := 0;

            BEGIN
                SELECT title INTO cidcheck FROM courses WHERE course_no = temp_course AND UPPER(dept_code) = temp_dept;
                EXCEPTION
                    WHEN no_data_found THEN raise_application_error(-20001, 'Course not found!');
                return;
            END;

            BEGIN
               OPEN oCursor FOR WITH Parent (pre_dept_code, pre_course_no, dept_code, course_no)
               AS
               (
                   SELECT pre_dept_code, pre_course_no, dept_code, course_no FROM prerequisites m WHERE UPPER(dept_code) = temp_dept AND course_no = temp_course
                   UNION ALL
                   SELECT  m.pre_dept_code, m.pre_course_no, m.dept_code, m.course_no FROM prerequisites m INNER JOIN Parent p ON p.pre_dept_code = m.dept_code and p.pre_course_no = m.course_no
               )
               SELECT concat(pre_dept_code, pre_course_no) FROM Parent;

           END;

     END;


-- @shree : Classes module
-- @shree : Classes module - show classes
    PROCEDURE display_classes(oCursor OUT myCursor) AS
        BEGIN
            OPEN oCursor FOR SELECT * FROM classes; 
        END;

    -- @shree : Classes module - find class and students
    PROCEDURE find_class(oCursor IN OUT myCursor,  temp_classid IN classes.classid%TYPE) AS

    classidcheck char(10);
    stdntchk char(10);


    BEGIN
        classidcheck := 0;

        BEGIN
            SELECT classid INTO classidcheck FROM classes WHERE classid = temp_classid;
            EXCEPTION
                WHEN no_data_found THEN raise_application_error(-20001, 'The cid is invalid.');
            return;
        END;

        BEGIN
            SELECT sid INTO stdntchk FROM enrollments WHERE classid = temp_classid AND ROWNUM = 1;
            EXCEPTION                
                    WHEN no_data_found THEN 
                        OPEN oCursor FOR 
                            SELECT classes.classid, courses.title, classes.semester, classes.year FROM classes 
                                JOIN courses ON courses.dept_code = classes.dept_code AND courses.course_no = classes.course_no AND classes.classid = temp_classid;                                
                return;
        END;

        BEGIN
            OPEN oCursor FOR 
                SELECT classes.classid, courses.title, classes.semester, classes.year, students.sid, students.lastname FROM classes 
                    JOIN courses ON courses.dept_code = classes.dept_code AND courses.course_no = classes.course_no AND classes.classid = temp_classid
	JOIN enrollments ON enrollments.classid = classes.classid
	JOIN students ON students.sid = enrollments.sid;
        END;
     
     END;



END;
/

    
