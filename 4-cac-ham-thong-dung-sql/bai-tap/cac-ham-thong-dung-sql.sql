create database students;
use students;

create table student(
id int primary key auto_increment,
`name` varchar(10),
age int,
course char(4),
price int
);

insert into student(`name`,age,course,price)
values('hoang',21,'CNTT',400000),
('viet',19,'dtvt',320000),
('thanh',18,'ktdn',400000),
('nhan',19,'CK',450000),
('huong',20,'TCNH',500000),
('huong',20,'TCNH',200000);

-- hiển thị tất cả các dòng tên hương
select * from student where name = 'huong' ;

-- hiển thị tổng số tiền của hương
select sum(price) from student where name = 'huong'; 

-- hiển thị danh sách của tất cả các học viên không trùng lặp
select * , count('name') c from student GROUP BY name HAVING c >=1;

-- Viết câu lệnh lấy ra tên danh sách của tất cả học viên, không trùng lặp
select distinct name from student;