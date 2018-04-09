/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  shree
 * Created: Apr 9, 2018
 */


DROP SEQUENCE generate_logid;

DROP TRIGGER students_updated;
DROP TRIGGER delete_student_enrollments;
DROP TRIGGER enrollments_updated;
DROP TRIGGER enrollment_added_classes;
DROP TRIGGER enorllment_dropped_classes;


-- @shree : creating sequence for logids
CREATE SEQUENCE generate_logid 
	INCREMENT BY 1 
	START WITH 100
	MAXVALUE 999;



CREATE OR REPLACE TRIGGER enrollment_added_classes
BEFORE INSERT ON ENROLLMENTS
FOR EACH ROW
BEGIN
	UPDATE classes SET class_size  = class_size + 1 WHERE classid = :NEW.classid;
END;
/


CREATE OR REPLACE TRIGGER enorllment_dropped_classes
BEFORE DELETE ON ENROLLMENTS
FOR EACH ROW
BEGIN
	UPDATE classes SET class_size  = class_size - 1 WHERE classid = :OLD.classid;
END;
/

CREATE OR REPLACE TRIGGER delete_student_enrollments
BEFORE DELETE ON students
FOR EACH ROW
BEGIN
	DELETE FROM enrollments WHERE sid = :OLD.sid;
END;
/


CREATE OR REPLACE TRIGGER enrollments_updated
BEFORE INSERT OR DELETE ON enrollments
FOR EACH ROW
DECLARE
	dba varchar(20);
	keyvalue varchar(20);
BEGIN
	SELECT USER INTO dba from dual;
	
	IF INSERTING THEN
		keyvalue := :NEW.sid || ',' || :NEW.classid;
		INSERT INTO logs VALUES (generate_logid.nextval, dba, sysdate, 'Enrollments', 'Insert', keyvalue);
	END IF;

	IF DELETING THEN
		keyvalue := :OLD.sid || ',' || :OLD.classid;
		INSERT INTO logs VALUES (generate_logid.nextval, dba, sysdate, 'Enrollments', 'Delete', keyvalue);
	END IF;
END;  
/


CREATE OR REPLACE TRIGGER students_updated
BEFORE INSERT OR DELETE OR UPDATE on students
FOR EACH ROW
DECLARE
	dba varchar(20);
BEGIN
	SELECT USER INTO dba from dual;
	
	 IF INSERTING THEN
		INSERT INTO logs VALUES (generate_logid.nextval, dba, sysdate, 'Students', 'Insert', :NEW.sid);
	 END IF;

	IF DELETING THEN
		INSERT INTO logs VALUES (generate_logid.nextval, dba, sysdate, 'Students', 'Delete', :OLD.sid);
	END IF;
END;  
/