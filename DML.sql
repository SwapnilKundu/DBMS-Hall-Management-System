insert into hall (hall_id, hall_name, capacity, location)
values (1, 'Bangabandhu Hall', 500, 'Beside KUET Academic');

insert into hall (hall_id, hall_name, capacity, location)
values (2, 'Khaja Hall', 450, 'Beside KUET Shahid Minar');

insert into hall (hall_id, hall_name, capacity, location)
values (3, 'Lalon shah Hall', 400, 'Beside KUET IT Park');

insert into hall (hall_id, hall_name, capacity, location)
values (4, 'Rokeya Hall', 790, 'Beside KUET Administration Building');

select *  from hall;


insert into student (student_id, full_name, email, dob, major, enrollment_year, hall_id)
values (2007062, 'Swapnil Kundu Argha', 'swapnilkundu01@gmail.com', to_date('2003-01-16', 'yyyy-mm-dd'), 'CSE', 2022, 1);

insert into student (student_id, full_name, email, dob, major, enrollment_year, hall_id)
values (2007064, 'Farhan Miraz Shihab', 'miraz64@gmail.com', to_date('2002-05-15', 'yyyy-mm-dd'), 'CSE', 2022, 1);

insert into student (student_id, full_name, email, dob, major, enrollment_year, hall_id)
values (2001039, 'Yusuf Al Naim', 'naimcivil@gmail.com', to_date('2002-11-20', 'yyyy-mm-dd'), 'Civil Engineering', 2022, 1);

insert into student (student_id, full_name, email, dob, major, enrollment_year, hall_id)
values (2003037, 'Satiyajit ghosh ', 'satiyajit67@gmail.com', to_date('2001-08-10', 'yyyy-mm-dd'), 'EEE', 2020, 2);

insert into student (student_id, full_name, email, dob, major, enrollment_year, hall_id)
values (2003119, 'Sakibul Hoque', 'Sakibul867@gmail.com', to_date('2002-08-12', 'yyyy-mm-dd'), 'EEE', 2019, 3);

insert into student (student_id, full_name, email, dob, major, enrollment_year, hall_id)
values (2007078, 'Samiha Akter', 'Sambahamba12@example.com', to_date('2002-04-10', 'yyyy-mm-dd'), 'CSE', 2019, 4);

insert into student (student_id, full_name, email, dob, major, enrollment_year, hall_id)
values (2003118, 'Mehenrunnesha Esha', 'Esha118@example.com', to_date('2002-04-10', 'yyyy-mm-dd'), 'CSE', 20, 4);

select * from student;


insert into staff (staff_id, full_name, email, position, hall_id)
values (1, 'Krishna Chandra Biswas', 'Krishnachandra@gmail.com', 'Hall Section Officer', 1);

insert into staff (staff_id, full_name, email, position, hall_id)
values (2, 'Sultan Ali', 'sultanAli@yahoo.com', 'Hall Director', 2);

insert into staff (staff_id, full_name, email, position, hall_id)
values (3, 'Mofiz Uddin', 'MofizUddin@example.com', 'Maintenance Supervisor', 3);

insert into staff (staff_id, full_name, email, position, hall_id)
values (4, 'Shanhina Sabnam', 'sabanm123@example.com', 'Section Officer', 4);

select * from staff;

insert into rooms (room_id, room_number, capacity, occupant_id, hall_id)
values (1, '401', 2, 2007062, 1);
insert into rooms (room_id, room_number, capacity, occupant_id, hall_id)
values (2, '102', 2, 2007064, 1);

insert into rooms (room_id, room_number, capacity, occupant_id, hall_id)
values (6, '201', 3, 2003037, 2);

insert into rooms (room_id, room_number, capacity, occupant_id, hall_id)
values (11, '301', 4, 2003119, 3);

insert into rooms (room_id, room_number, capacity, occupant_id, hall_id)
values (16, '401', 5, 2007078, 4);

insert into rooms (room_id, room_number, capacity, occupant_id, hall_id)
values (3, '103', 2, 2001039, 1);

select * from rooms;

insert into meal_schedule (schedule_id, hall_id, meal_date, meal_time, menu_item)
values (2101, 1, to_date('2024-04-23', 'yyyy-mm-dd'), '12:00 PM', 'Chicken Alfredo');

insert into meal_schedule (schedule_id, hall_id, meal_date, meal_time, menu_item)
values (9200, 1, to_date('2024-04-24', 'yyyy-mm-dd'), '12:00 PM', 'Veg Pulao');

insert into meal_schedule (schedule_id, hall_id, meal_date, meal_time, menu_item)
values (8300, 2, to_date('2024-04-23', 'yyyy-mm-dd'), '6:00 PM', 'Vegetable Stir-Fry');

insert into meal_schedule (schedule_id, hall_id, meal_date, meal_time, menu_item)
values (3400, 2, to_date('2024-04-24', 'yyyy-mm-dd'), '6:00 PM', 'Pasta with Garlic Bread');

insert into meal_schedule (schedule_id, hall_id, meal_date, meal_time, menu_item)
values (5500, 3, to_date('2024-04-23', 'yyyy-mm-dd'), '7:30 AM', 'Scrambled Eggs');

insert into meal_schedule (schedule_id, hall_id, meal_date, meal_time, menu_item)
values (4600, 3, to_date('2024-04-24', 'yyyy-mm-dd'), '7:30 AM', 'Breakfast Sandwiches');

insert into meal_schedule (schedule_id, hall_id, meal_date, meal_time, menu_item)
values (3700, 4, to_date('2024-04-23', 'yyyy-mm-dd'), '1:00 PM', 'Grilled Salmon');

insert into meal_schedule (schedule_id, hall_id, meal_date, meal_time, menu_item)
values (8002, 4, to_date('2024-04-24', 'yyyy-mm-dd'), '1:00 PM', 'Roast Chicken with Mashed Potatoes');

select * from meal_schedule;