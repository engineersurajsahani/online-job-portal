create database online_job_portal;
use online_job_portal;

create table e_signup
(
id int auto_increment primary key,
fullname nvarchar(200),
username nvarchar(200),
email nvarchar(200),
gender nvarchar(200),
phone_no nvarchar(200),
password nvarchar(200)
);

create table r_signup
(
  r_id int auto_increment primary key,
  fullname  nvarchar(200),
  username  nvarchar(200),
  email  nvarchar(200),
  password  nvarchar(200),
  gender  nvarchar(200),
  phone_no bigint(12)
);


create table r_add_job
(
r_id int auto_increment primary key,
jobtitle nvarchar(200),
companyname nvarchar(200),
location nvarchar(200),
salary nvarchar(200),
job_discription nvarchar(200),
companylogo nvarchar(200),
requirement nvarchar(1000)
);


create table e_feedback
(
e_id int auto_increment primary key,
name nvarchar(200),
email nvarchar(200),
rating nvarchar(200),
feedback nvarchar(1000)
);


create table e_contactus
(
e_id int auto_increment primary key,
name nvarchar(200),
contactnumber bigint(12),
email nvarchar(200),
message nvarchar(500)
);

create table e_apply_job
(
e_id int auto_increment primary key,
name nvarchar(200),
mobilenumber bigint(12),
email nvarchar(200),
jobtitle nvarchar(200),
company nvarchar(200),
resume nvarchar(200)
);


create table e_applicationform
(
e_id int auto_increment primary key,
fullname nvarchar(200),
email nvarchar(200),
mobilenumber bigint(12),
qualification nvarchar(200),
skills nvarchar(200),
expectedsalary nvarchar(200)
);



