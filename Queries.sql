--description of each table

	desc hall;
	desc student;
	desc staff;
	desc rooms;
	desc meal_schedule;
	

--data according each table

	select *  from hall;
	select *  from student;
	select *  from staff;
	select *  from rooms;
	select *  from meal_schedule;

--add a column named phone_number of type varchar2(20) to the student table

alter table student add phone_number varchar2(20);

--rename the column email to student_email in the student table

alter table student rename column email TO student_email;

-- modify the data type of the column capacity to number(5) in the hall table

alter table hall modify capacity number(5);

--drop the column occupant_id from the rooms table

alter table rooms drop column occupant_id;

--Update Data in a Table

update student set major = 'Computer Science and Engineering' where student_id = 2007062;

--Deleting Row from a Table

delete from student where student_id = 2007078;



--Find the distinct hall IDs from the student and staff tables

select hall_id from student
union
select hall_id FROM staff;



--LIKE % Command
select * FROM student WHERE student_email like '%@gmail.com';




--WITH Clause Display the enrollment year and the number of students enrolled in each year

with EnrollmentCount as (
    select enrollment_year, COUNT(*) as num_students
    from student
    group by enrollment_year
)
select * from EnrollmentCount;





--Aggregate Functions
--Count


select count(*) as total_students from student;


-min

select min(capacity) as min_capacity from hall;


-avg

select avg(enrollment_year) as avg_enrollment_year from student;


-max
select max(schedule_id) as max_schedule_id from meal_schedule;





--Group By, Having, Nested Subquery Display the count of students enrolled in each major where the count is greater than 1.

select major, count(*) as num_students
from student
group by major
having count(*) > 1;

--Find students enrolled in either 'CSE' or 'EEE' major.

select * from student
where major = 'CSE' OR major = 'EEE';


--Inner Join ,Display the student ID, full name, and hall name for all students.


select s.student_id, s.full_name, h.hall_name
from student s
inner join hall h ON s.hall_id = h.hall_id;


--Outer Join ,Display all students along with their respective rooms, even if they don't have a room assigned.


select s.*, r.*
from student s
left outer join rooms r on s.student_id = r.occupant_id;


--Natural Join,Display the hall name and location along with the staff details.

SELECT h.hall_name, h.location, s.*
FROM staff s
NATURAL JOIN hall h;












