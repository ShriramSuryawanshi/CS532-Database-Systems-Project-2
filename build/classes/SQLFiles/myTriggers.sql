/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
 
  /* 	CS532 - Project 2
 *	1. Shriram Suryawanshi
 *	2. Vinen Furtado
 */
 

-- @@ : dropping the sequence
DROP SEQUENCE generate_logid;

-- @@ : dropping all the triggers
DROP TRIGGER students_updated_insert;
DROP TRIGGER students_updated_delete;
DROP TRIGGER delete_student_enrollments;
DROP TRIGGER enrollments_updated_insert;
DROP TRIGGER enrollments_updated_delete;
DROP TRIGGER enrollment_added_classes;
DROP TRIGGER enorllment_dropped_classes;


-- @@ : creating sequence for logids
CREATE SEQUENCE generate_logid 
	INCREMENT BY 1 
	START WITH 101
	MAXVALUE 999;


-- @@ : student enrolled, increase respective class_size by 1
CREATE OR REPLACE TRIGGER enrollment_added_classes
BEFORE INSERT ON ENROLLMENTS
FOR EACH ROW
BEGIN
	UPDATE classes SET class_size  = class_size + 1 WHERE classid = :NEW.classid;
END;
/

-- @@ : student dropped for the class, decrease respective class_size by 1
CREATE OR REPLACE TRIGGER enorllment_dropped_classes
BEFORE DELETE ON ENROLLMENTS
FOR EACH ROW
BEGIN
	UPDATE classes SET class_size  = class_size - 1 WHERE classid = :OLD.classid;
END;
/

-- @@ : student deleted, delete all his enrollments
CREATE OR REPLACE TRIGGER delete_student_enrollments
BEFORE DELETE ON students
FOR EACH ROW
BEGIN
	DELETE FROM enrollments WHERE sid = :OLD.sid;
END;
/

-- @@ : student enrolled, update log table
CREATE OR REPLACE TRIGGER enrollments_updated_insert
BEFORE INSERT ON enrollments
FOR EACH ROW
DECLARE
	dba varchar(20);
	keyvalue varchar(20);
BEGIN
	SELECT USER INTO dba from dual;
	keyvalue := :NEW.sid || ',' || :NEW.classid;
	INSERT INTO logs VALUES (generate_logid.nextval, dba, sysdate, 'Enrollments', 'Insert', keyvalue);
END;  
/


-- @@ : enollment dropped (deleted), update log table
CREATE OR REPLACE TRIGGER enrollments_updated_delete
BEFORE DELETE ON enrollments
FOR EACH ROW
DECLARE
	dba varchar(20);
	keyvalue varchar(20);
BEGIN
	SELECT USER INTO dba from dual;
	keyvalue := :OLD.sid || ',' || :OLD.classid;
	INSERT INTO logs VALUES (generate_logid.nextval, dba, sysdate, 'Enrollments', 'Delete', keyvalue);
END;  
/

-- @@ : student added, update log table
CREATE OR REPLACE TRIGGER students_updated_insert
BEFORE INSERT ON students
FOR EACH ROW
DECLARE
	dba varchar(20);
BEGIN
	SELECT USER INTO dba from dual;
	INSERT INTO logs VALUES (generate_logid.nextval, dba, sysdate, 'Students', 'Insert', :NEW.sid);
END;  
/

-- @@ : student deleted, update log table
CREATE OR REPLACE TRIGGER students_updated_delete
BEFORE DELETE ON students
FOR EACH ROW
DECLARE
	dba varchar(20);
BEGIN
	SELECT USER INTO dba from dual;
	INSERT INTO logs VALUES (generate_logid.nextval, dba, sysdate, 'Students', 'Delete', :OLD.sid);
END;  
/