
-- Drop existing tables
drop table  meal_schedule;
drop table  rooms;
drop table  staff;
drop table  student;
drop table  hall;

-- Create tables
create table hall (
    Hall_ID number primary key,
    Hall_Name varchar2(100),
    Capacity number,
    Location varchar2(100)
);

create table student(
    student_id number primary key,
    full_name varchar2(100),
    email varchar2(100),
    dob date,
    major varchar2(50),
    enrollment_year number,
    hall_id number,
    foreign key (hall_id) references hall(hall_id)
);  

create table staff (
    staff_id number primary key,
    full_name varchar2(100),
    email varchar2(100),
    position varchar2(100),
    hall_id number,
    foreign key (hall_id) references hall(hall_id)
);

create table rooms (
    room_id number primary key,
    room_number varchar2(20),
    capacity number,
    occupant_id number,
    hall_id number,
    foreign key (occupant_id) references student(student_id),
    foreign key (hall_id) references hall(hall_id)
);

create table meal_schedule (
    schedule_id number primary key,
    hall_id number,
    meal_date date,
    meal_time varchar2(20),
    menu_item varchar2(200),
    foreign key (hall_id) references hall(hall_id)
);

