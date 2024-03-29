CREATE OR REPLACE TRIGGER Q1
BEFORE DELETE ON MODULE    
FOR EACH ROW
DECLARE 
check1 MODULE.CODE%TYPE;
BEGIN
SELECT DISTINCT CODE INTO check1 FROM ENSEIGNT WHERE CODE = :OLD.CODE ;
IF check1 != NULL THEN RAISE_APPLICATION_ERROR(-20001, 'IMPOSSIBLE');
        END IF;
END;

DELETE FROM MODULE WHERE CODE = 'ACSI';


CREATE OR REPLACE TRIGGER Q2
BEFORE INSERT ON MODULE    
FOR EACH ROW
DECLARE 
check1 MODULE.CODE%TYPE;
BEGIN
SELECT DISTINCT CODE INTO check1 FROM ENSEIGNT WHERE CODE = :NEW.CODE ;
IF check1 != NULL THEN RAISE_APPLICATION_ERROR(-20001, 'IMPOSSIBLE');
        END IF;
END;




CREATE OR REPLACE TRIGGER Q3
BEFORE INSERT ON NOTATION  
FOR EACH ROW

DECLARE 
CURSOR Note IS SELECT MOY_CC, MOY_TEST FROM NOTATION;
BEGIN 
OPEN Note; 
FOR MOY_CC IN Note LOOP
    IF :NEW.MOY_CC IS NULL
    THEN
    :NEW.MOY_CC := 0;
    END IF;
 END LOOP;
 FOR MOY_TEST IN Note LOOP
    IF :NEW.MOY_CC IS NULL
    THEN
    :NEW.MOY_CC := 0;
    END IF;
 END LOOP;
 
END;




CREATE OR REPLACE TRIGGER Q5
BEFORE UPDATE ON MODULE  
FOR EACH ROW 
BEGIN
IF (:NEW.COEFF_TEST + :NEW.COEFF_CC != 100) THEN RAISE_APPLICATION_ERROR(-20001,'LES COEFF SONT TROP GRAND');
END IF;
END;



CREATE OR REPLACE





























