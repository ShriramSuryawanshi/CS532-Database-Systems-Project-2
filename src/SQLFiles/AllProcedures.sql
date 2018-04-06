/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  shree
 * Created: Apr 6, 2018
 */

set serveroutput on;

CREATE OR REPLACE PACKAGE SQLPackage AS

    type myCursor is ref cursor;


    PROCEDURE display_students(oCursor out myCursor);

END;
/


CREATE OR REPLACE PACKAGE BODY SQLPackage AS


-- @shree - Task 1 : showing tables

PROCEDURE display_students(oCursor out myCursor) AS
    BEGIN
        OPEN ocursor for select * from students; 
    END;


END;
/

    
