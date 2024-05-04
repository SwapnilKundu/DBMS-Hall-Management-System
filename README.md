# DBMS-Hall-Management-System
A DBMS project by **Swapnil Kundu Argha.** 

**Roll** : **2007062** 

![Hall Management System by SWAPNIL KUNDU ARGHA .](https://prod-files-secure.s3.us-west-2.amazonaws.com/f57b8904-dc9e-4288-9fc6-c63117eb3384/4db2596a-cab6-4a3a-8cd0-837663c8b7ea/University-of-California-Davis-Yosemite-Hall-Exterior_1280x650.jpg)

Hall Management System by SWAPNIL KUNDU ARGHA .

## **Introduction**

- **Project Overview:**
The Hall Management System is designed to streamline the management of halls within an educational institution. It provides a centralized platform for managing hall-related data, including student accommodation, staff information, room allocation, and meal schedules. The system aims to enhance efficiency and organization in hall management processes.

- **Importance of the Database in Hall Management System:**
A well-structured database is essential for effective hall management. It facilitates seamless data organization, retrieval, and manipulation, enabling administrators to efficiently allocate resources, track occupancy, and plan facilities. The database serves as the backbone of the Hall Management System, providing a reliable foundation for managing various aspects of hall administration.

                                                   ****

## **Project Objectives:**

The Hall Management System project is tailored to meet several key objectives essential for efficient hall management:

1. **Design a Relational Database Schema for Managing Hall-Related Data:** The primary objective is to design a comprehensive relational database schema that effectively organizes and stores hall-related data. This includes data pertaining to students, staff, rooms, meal schedules, and hall amenities.
2. **Implement SQL Queries for Retrieving, Updating, and Managing Data within the Database:** A crucial objective is to implement a wide range of SQL queries that allow for the manipulation and retrieval of data stored within the database. These queries enable various functionalities, such as adding new records, updating existing information, and retrieving detailed data based on specific criteria.

**Database Design**

**Overview of the Database Schema:**
The Hall Management System database is structured around several key tables designed to encompass all necessary hall-related data. The main tables include:

- Hall: Stores information about different halls, including hall ID, name, capacity, and location.
- Student: Contains data about students residing in the halls, including student ID, name, email, date of birth, major, enrollment year, and hall ID.
- Staff: Stores information about staff members associated with hall management, including staff ID, name, email, position, and hall ID.
- Rooms: Records details about individual rooms within the halls, including room ID, room number, capacity, occupant ID, and hall ID.
- Meal Schedule: Manages meal schedules for different halls, including schedule ID, hall ID, meal date, meal time, and menu item.

```sql
--hall
create table hall (
    Hall_ID number primary key,
    Hall_Name varchar(100),
    Capacity number,
    Location varchar(100)
);

--student
create table student(
    student_id number primary key,
    full_name varchar(100),
    email varchar2(100),
    dob date,
    major varchar(50),
    enrollment_year number,
    hall_id number,
    foreign key (hall_id) references hall(hall_id)
);  

--staff
create table staff (
    staff_id number primary key,
    full_name varchar(100),
    email varchar(100),
    position varchar(100),
    hall_id number,
    foreign key (hall_id) references hall(hall_id)
);

--rooms
create table rooms (
    room_id number primary key,
    room_number varchar(20),
    capacity number,
    occupant_id number,
    hall_id number,
    foreign key (occupant_id) references student(student_id),
    foreign key (hall_id) references hall(hall_id)
);

--meal_schedule
create table meal_schedule (
    schedule_id number primary key,
    hall_id number,
    meal_date date,
    meal_time varchar(20),
    menu_item varchar(200),
    foreign key (hall_id) references hall(hall_id)
);

```

**Rationale Behind the Design Decisions:**
The design of the database schema was guided by the need to comprehensively represent and efficiently access hall-related data. Each table was created to serve a specific segment of hall management data, ensuring that the database could handle diverse queries—from student accommodation and staff information to room allocation and meal schedules.

**Table Relationships:**
The relationships between the tables are primarily defined by foreign keys that ensure data integrity and relational connections. For example, the student table has a foreign key referencing the hall table to establish the association between students and the halls they reside in.

**Normalization:**
Normalization was applied up to the third normal form (3NF) to eliminate data redundancy and avoid update anomalies. This ensures that all data is stored in only one place, changes in data are propagated consistently, and the database remains efficient and scalable.

### **Entity-Relationship Diagram (ERD):**

![Screenshot_4-5-2024_104058_mermaid.live.jpeg](https://prod-files-secure.s3.us-west-2.amazonaws.com/f57b8904-dc9e-4288-9fc6-c63117eb3384/7010234f-fbfa-48a3-90f8-3abd309cddc4/65325d3b-2067-40af-ada4-a545ca699441.png)

## **SQL Queries and Functionality**

**Examples of SQL Queries:**
To facilitate a wide range of informational needs for users, several SQL queries have been designed to extract useful information from the database. Here are examples illustrating common queries:

- **Retrieving Student Information:**

```sql
SELECT full_name, email, major FROM Student WHERE student_id = '2007062';

```

- **Room Allocation Details:**

```sql
SELECT room_number, capacity, full_name FROM Rooms JOIN Student ON Rooms.occupant_id = Student.student_id WHERE hall_id = '1';

```

**Queries for Common Operations:**
In addition to specific queries, the database supports various common operations:

- **Searching for Students by Major:**

```sql
SELECT * FROM Student WHERE major LIKE '%CSE%';

```

- **Listing Meal Schedules:**

```sql
SELECT * FROM Meal_Schedule WHERE meal_date >= CURRENT_DATE ORDER BY meal_date ASC;

```

**Implementation of Advanced SQL Features:**
Advanced SQL features such as stored procedures, triggers, and functions can be utilized to enhance the functionality and efficiency of the database. For example, stored procedures can automate complex operations like updating room occupancy based on student enrollment or calculating meal expenses.

1. **Subquery to Retrieve Students from a Specific Hall:**

```sql

SELECT full_name, email
FROM Student
WHERE hall_id = (SELECT hall_id FROM Hall WHERE hall_name = 'Bangabandhu Hall');

```

This subquery retrieves the names and emails of students residing in the 'Bangabandhu Hall'.

1. **Subquery to Count the Number of Rooms in Each Hall:**

```sql

SELECT hall_name, (SELECT COUNT(*) FROM Rooms WHERE Rooms.hall_id = Hall.hall_id) AS num_rooms
FROM Hall;

```

This subquery counts the number of rooms in each hall and returns the hall name along with the corresponding room count.

1. **Subquery to Calculate Average Meal Schedule Frequency:**

```sql

SELECT AVG(meal_freq)
FROM (SELECT hall_id, COUNT(*) AS meal_freq FROM Meal_Schedule GROUP BY hall_id) AS HallMealFreq;

```

This subquery calculates the average frequency of meal schedules across all halls.

**Triggering Code:**

1. **Trigger to Update Room Capacity When a New Student is Enrolled:**

```sql
CREATE OR REPLACE TRIGGER UpdateRoomCapacity
AFTER INSERT ON Student
FOR EACH ROW
BEGIN
    UPDATE Rooms
    SET capacity = capacity - 1
    WHERE room_id = (SELECT room_id FROM Rooms WHERE hall_id = :NEW.hall_id AND occupant_id IS NULL AND ROWNUM = 1);
END;

```

This trigger automatically updates the room capacity by decrementing it by 1 when a new student is enrolled in a hall.

1. **Trigger to Notify Staff When a Student Changes Rooms:**

```sql

CREATE OR REPLACE TRIGGER RoomChangeNotification
AFTER UPDATE OF room_id ON Student
FOR EACH ROW
BEGIN
    INSERT INTO Notification (staff_id, message, created_at)
    VALUES (:NEW.staff_id, 'Student ' || :NEW.full_name || ' has changed rooms.', SYSDATE);
END;

```

This trigger sends a notification to the staff member responsible for hall management when a student changes rooms.

## **Targeted Customers/Users:**

The Hall Management System is designed to serve various stakeholders within the educational institution, including:

- **Hall Administrators:** Responsible for managing hall resources, allocating rooms, and organizing meal schedules.
- **Students**: Utilize the system to apply for accommodation, view room allocations, and access meal schedules.
- **Staff Members**: Use the system to coordinate hall activities, manage facilities, and communicate with residents.
- **Maintenance Staff**: They can use the system to track room conditions, schedule repairs, and manage maintenance tasks.
- **Institution Management**: They can use the system to monitor hall occupancy, resources, and overall management effectiveness.

## **Conclusion**

**Reflection on Achievements and Challenges:**
Throughout the development of the Hall Management System, numerous achievements were realized, such as designing an efficient database schema and implementing robust SQL queries. However, challenges were encountered, including ensuring data consistency and scalability. Innovative solutions were implemented to address these challenges and optimize system performance.

**Significance of the Database in Hall Management:**
The Hall Management System database holds significant value for educational institutions by providing a centralized platform for managing hall-related data. It streamlines hall administration processes, enhances resource allocation, and improves overall efficiency. The database serves as a vital tool for administrators, students, and staff, contributing to a seamless and organized hall management experience.
