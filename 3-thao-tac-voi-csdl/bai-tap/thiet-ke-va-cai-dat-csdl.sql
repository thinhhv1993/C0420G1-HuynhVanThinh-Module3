create database library_manager;

use library_manager;

-- tạo bảng sách
create table book(
book_id int primary key,
book_name varchar(50),
book_number int,
date_publish date,
number_publish int,
book_price double,
book_image varchar(50)
);

-- tạo bảng nhà xuất bản
create table publishers(
publishers_id int primary key,
publishers_name varchar(50),
publishers_add varchar(50)
);

-- tạo bảng loại sách
create table species_book(
species_id int primary key,
species_code int
);

-- tạo bảng sinh viên
create table students(
students_card char(15) primary key,
students_name varchar(50),
students_birthday date,
students_add varchar(50),
students_email varchar(30),
students_phone int,
students_image varchar(50)

);

-- tạo bảng thông tin mượn sách
create table borrow_book(
borrow_id int primary key,
borrow_date date,
pay_date date

);

-- tạo khoá ngoại giữa sách và nhà xuất bản
alter table book
add column publishers_id int,
add foreign key (publishers_id) references publishers(publishers_id);

-- tạo khoá ngoại giữa sách và loại sách
alter table book
add column species_id int,
add foreign key (species_id) references species_book(species_id);

-- tạo khoá ngoại giữa sách và thông tin mượn sách
alter table borrow_book
add column book_id int,
add foreign key (book_id) references book(book_id);

-- tạo khoá ngoại giữa sinh viên và thông tin mượn sách
alter table borrow_book
add column students_card char(15),
add foreign key (students_card) references students(students_card);

-- thêm dữ liệu  loại sách
insert into species_book values(1,123);
insert into species_book values(2,124);
insert into species_book values(3,125);
insert into species_book values(4,126);
insert into species_book values(5,127);

-- thêm dữ liệu nhà xuất bản
insert into publishers values(1,'nhi dong','dn');
insert into publishers values(2,'nhung bong hoa nho','dn');
insert into publishers values(3,'viet nam','hn');
insert into publishers values(4,'mat troi be con','hue');
insert into publishers values(5,'thanh pho hcm','hcm');

-- thêm dữ liệu sách
insert into book values(1,'giao khoa 1',5,'2000-10-20',1,10,'abc',1,1);
insert into book values(2,'giao khoa 2',5,'2000-10-20',1,10,'abc',2,1);
insert into book values(3,'giao khoa 3',5,'2000-10-20',1,10,'abc',3,1);
insert into book values(4,'giao khoa 4',5,'2000-10-20',1,10,'abc',4,1);
insert into book values(5,'giao khoa 5',5,'2000-10-20',1,10,'abc',5,1);
insert into book values(6,'giao khoa 6',5,'2000-10-20',1,10,'abc',1,1);

-- thêm dữ liệu sinh viên 
insert into students values('123456789','thinh','2000-10-10','dn','thinh@gmail.com',1234567890,'abc');
insert into students values('123456780','tuong','2000-10-10','dn','thinh@gmail.com',1234567890,'abc');
insert into students values('123456781','vu','2000-10-10','dn','thinh@gmail.com',1234567890,'abc');
insert into students values('123456782','huy','2000-10-10','dn','thinh@gmail.com',1234567890,'abc');
insert into students values('123456783','viet','2000-10-10','dn','thinh@gmail.com',1234567890,'abc');

-- thêm dữ liệu vào mượn sách
insert into borrow_book values(1,'2020-10-10','2020-10-15',1,123456789);
insert into borrow_book values(2,'2020-10-10','2020-10-15',1,123456780);
insert into borrow_book values(3,'2020-10-10','2020-10-15',1,123456781);
insert into borrow_book values(4,'2020-10-10','2020-10-15',1,123456782);
insert into borrow_book values(5,'2020-10-10','2020-10-15',1,123456783);