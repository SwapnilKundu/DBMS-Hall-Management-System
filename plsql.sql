--Variable Declaration and Print Value

declare
    v_name varchar2(50);
begin
    v_name := 'Hasmot';
   Dbms_output.put_line('Name: ' || v_name);
end;



--Insert and Set Default Value:

insert into student (student_id, full_name, email, dob, major, enrollment_year, hall_id)
values (2008001, 'Test Student', 'test@example.com', SYSDATE, 'Computer Science', DEFAULT, 1);


--what is a row type in PL/SQL and how can it be used

declare
    v_student student%ROWTYPE;
begin
    select * into v_student FROM student WHERE student_id = 2007062;
    dbms_output.put_line('Student Name: ' || v_student.full_name);
end;



--use a cursor to fetch records and get the count of fetched records
declare
    CURSOR c_students IS SELECT * FROM student;
    v_count NUMBER := 0;
    v_rec student%ROWTYPE;
begin
    for v_rec in c_students LOOP
        v_count := v_count + 1;
    end loop;
    dbms_output.put_line('Total Students: ' || v_count);
end;






--use a FOR loop to iterate over a collection and extend an array dynamically.
declare
    TYPE id_list IS table of student.student_id%TYPE;
    v_ids id_list := id_list();
begin
    FOR rec IN (SELECT student_id FROM student) LOOP
        v_ids.EXTEND;
        v_ids(v_ids.LAST) := rec.student_id;
    end loop ;
    for i IN 1..v_ids.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE('Student ID: ' || v_ids(i));
    END LOOP;
end;




--f IF-ELSEIF-ELSE construct in PL/SQL

DECLARE
    v_num number := 10;
BEGIN
    IF v_num < 0 THEN
        DBMS_OUTPUT.PUT_LINE('Negative');
    ELSIF v_num = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Zero');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Positive');
    END IF;
END;



--create a procedure to insert a record into the hall table

create or replace PROCEDURE insert_hall (
    p_id IN hall.hall_id%TYPE,
    p_name IN hall.hall_name%TYPE,
    p_capacity IN hall.capacity%TYPE,
    p_location IN hall.location%TYPE
)
AS
BEGIN
    INSERT INTO hall (hall_id, hall_name, capacity, location)
    VALUES (p_id, p_name, p_capacity, p_location);
END insert_hall;





--Define a function to calculate the age of a student based on their date of birth.
CREATE OR REPLACE FUNCTION calculate_age (
    p_dob IN DATE
) RETURN NUMBER
AS
    v_age NUMBER;
BEGIN
    SELECT FLOOR(MONTHS_BETWEEN(SYSDATE, p_dob) / 12) INTO v_age FROM DUAL;
    RETURN v_age;
END calculate_age;



--Trigger that automatically updates the enrollment year of a student when inserted


CREATE OR REPLACE TRIGGER update_enrollment_year
BEFORE INSERT ON student
FOR EACH ROW
BEGIN
    :NEW.enrollment_year := EXTRACT(YEAR FROM SYSDATE);
END;


-- trigger that prevents updating the email of a staff member

CREATE OR REPLACE TRIGGER prevent_email_update
BEFORE UPDATE OF email ON staff
FOR EACH ROW
BEGIN
    IF :OLD.email != :NEW.email THEN
        RAISE_APPLICATION_ERROR(-20001, 'Email cannot be updated.');
    END IF;
END;

--trigger that logs the deletion of a room into a separate table.

CREATE OR REPLACE TRIGGER log_room_deletion
AFTER DELETE ON rooms
FOR EACH ROW
BEGIN
    INSERT INTO room_deletion_log (room_id, deletion_date)
    VALUES (:OLD.room_id, SYSDATE);
END;

          ------------------------------------------------finally----------------------------------------------------------------

set SERVEROUTPUT on;
begin
dbms_output.put_line('Project Name:  ');
dbms_output.put_line('------------');
dbms_output.put_line('Hall Management System ');
dbms_output.put_line('Created by:  ');
dbms_output.put_line('----------');
dbms_output.put_line('Swapnil Kundu Argha' );
dbms_output.put_line('Roll: ');
dbms_output.put_line('----');
dbms_output.put_line('2007062 ');
dbms_output.put_line('--------------------------------------------------');
end;
/

