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
    
    

END;
/


CREATE OR REPLACE PACKAGE BODY SQLPackage AS


-- @shree : Students module

    PROCEDURE display_students(oCursor OUT myCursor) AS
        BEGIN
            OPEN oCursor FOR SELECT * FROM students; 
        END;


    PROCEDURE add_student(temp_sid IN students.sid%TYPE, temp_firstname IN students.firstname%TYPE, temp_lastname IN students.lastname%TYPE, temp_status IN students.status%TYPE, temp_gpa IN students.gpa%TYPE, temp_email IN students.email%TYPE) AS
        BEGIN
            INSERT INTO students VALUES (temp_sid, temp_firstname, temp_lastname, temp_status, temp_gpa, temp_email);
        END;


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




END;
/

    
