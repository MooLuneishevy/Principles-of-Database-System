create table course(
course_id varchar(20),
title varchar(40),
dept_name varchar(20),
credits numeric(2,1)
);
create table section(
ID varchar(20),
course_id varchar(20),
title varchar(40),
dept_name varchar(20),
credits numeric(2,1),
semester varchar(20),
year int
);
create table student(
ID varchar(20),
name varchar(20),
dept_name varchar(20),
tot_cred numeric(3,1)
);
create table takes(
ID varchar(20),
course_id varchar(20),
semester varchar(20),
year int,
grade numeric(3,1)
);
create table instructor(
ID varchar(20),
name varchar(20),
dept_name varchar(20),
salary int,
building varchar(20),
budget int
);
create table guide(
ID_inst varchar(20),
ID_stud varchar(20)
);
create table prerequisite(
ID varchar(20),
ID_pre varchar(20)
);