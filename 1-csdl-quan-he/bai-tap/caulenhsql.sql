-- tạo data base.
create database codegym_management;

-- chọn cơ sở dữ liệu mình muốn.
use codegym_management;

-- tạo bản trong cơ sở dữ liệu mình đã chọn
create table student (
	id int,
    name varchar(50),
    date_of_birth date
);

-- thay đổi thuộc tính id thành khoá chính và cho giá trị tự động tăng.
alter table student
modify id int primary key auto_increment;

-- thêm giá trị vào cơ sở dữ liệu.
insert into student (name, date_of_birth)
values
('Tien', '2000-07-13'),
('Toan', '2001-07-13');

-- chọn show ra toàn bộ name trong bảng table.
select name
from student;


-- update dòng có id = 1 đổi tên 
update student
set name = 'Thanh Tien'
where id = 1;

-- xoá dòng có id = 1 trong bảng student.
delete from student
where id = 1;

-- xoá bản student.
delete from student;

-- xoá hoàn toàn dữ liệu bản ghi.
truncate table student;


-- xoá bản ghi. 
drop table student;


-- xoá cơ sở dữ liệu.
drop database codegym_management;
