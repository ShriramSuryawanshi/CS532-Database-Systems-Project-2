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

    
    

END;
/


CREATE OR REPLACE PACKAGE BODY SQLPackage AS


-- @shree : Students module

PROCEDURE display_students(oCursor out myCursor) AS
    BEGIN
        OPEN ocursor FOR SELECT * FROM students; 
    END;

PROCEDURE add_student(temp_sid IN students.sid%TYPE, temp_firstname IN students.firstname%TYPE, temp_lastname IN students.lastname%TYPE, temp_status IN students.status%TYPE, temp_gpa IN students.gpa%TYPE, temp_email IN students.email%TYPE) AS
    BEGIN
        INSERT INTO students VALUES (temp_sid, temp_firstname, temp_lastname, temp_status, temp_gpa, temp_email);
     END;


END;
/

    
