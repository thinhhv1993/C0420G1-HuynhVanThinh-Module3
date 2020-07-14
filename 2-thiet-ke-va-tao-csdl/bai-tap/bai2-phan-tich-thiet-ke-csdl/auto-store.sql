create database auto_store;

use auto_store;

-- tạo bảng khách hàng
create table customers (
 id int primary key,
 name_customers varchar(50) not null,
 phone int not null,
 address varchar(100)not null
 
 
); 

-- tạo bảng loại sản phẩm
create table product_line (
product_line varchar(50) primary key,
`description` text not null


);


-- tạo bảng sản phẩm
create table product(
id int primary key,
name_product varchar(50) not null,
producer varchar(50) not null,
number_warehouse varchar(50) not null,
price_in double not null,
price_out double not null


);


-- tạo bảng đơn hàng
create table orders(

ordernumber int primary key,
date_buy date not null,
date_delivered date not null,
date_delivered_reality date not null,
number_orders int not null,
unit_price double not null
);


-- tạo bảng thanh toán
create table payment(
id int primary key,
date_pay date not null,
money double not null

);


-- tạo bản nhân viên
create table employees(
id int primary key,
name_employees varchar(50) not null,
email varchar(50) not null,
position_employees varchar(20) not null


);


-- tạo bảng văn phòng
create table offices(
id int primary key,
address varchar(50) not null,
phone int not null,
nation varchar(20) not null


);

-- thêm khoá ngoại khách hàng vào đơn hàng
alter table orders
add column id_customer int,
add constraint id_customer 
FOREIGN KEY (id_customer) REFERENCES customers(id);

-- thêm khoá ngoại khách hàng vào thanh toán
alter table payment
add column id_customer int,
add constraint id_customer1 
FOREIGN KEY (id_customer) REFERENCES customers(id);

-- tạo khoá phức hợp hoá đơn và sản phẩm 
create table orders_have_product(
orders_id int,
product_id int,

primary key(orders_id,product_id),
foreign key (orders_id) references orders (ordernumber),
foreign key (product_id) references product (id)
);

-- thêm khoá ngoại loại hàng cho sản phẩm
alter table product
add column product_line varchar(50),
add constraint product_line 
FOREIGN KEY (product_line) REFERENCES product_line(product_line);

-- thêm khoá ngoại nhân viên cho khách hàng
alter table customers
add	column employees_id int,
add constraint employees_id 
FOREIGN KEY (employees_id) REFERENCES employees(id);

-- tạo bảng nhân viên quản lý 
create table manager_employees(
id int primary key,
name_manager varchar(50) not null,
position_employees varchar(30) NOT NULL DEFAULT 'manager'

);

-- thêm khoá ngoại nhân viên quản lý cho bảng nhân viên
alter table employees
add column manager_employees_id int,
add constraint manager_employees_id
FOREIGN KEY (manager_employees_id) REFERENCES manager_employees(id);

-- thêm khoá ngoại văn phòng cho bảng nhân viên
alter table employees
add column offices_id int,
add constraint offices_id
FOREIGN KEY (offices_id) REFERENCES offices(id);

