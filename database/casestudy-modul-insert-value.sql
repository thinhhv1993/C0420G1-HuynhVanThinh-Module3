use furama;

insert into rent_type(rent_type_name,rent_type_cost) values 
('year',5000000) ,
('mounth',4000000) ,
('day',3000000) ,
('time',2000000) ;

insert into service_type(service_type_name) values 
('Villa'),
('House'),
('Room');

insert into customer_type(customer_type_name) values
('Diamond'),
('Platinium'),
('Gold'),
('Silver'),
('Member');

insert into education_degree(education_degree_name) values
('Trung Cấp'),
('Cao Đẳng'),
('Đại Học'),
('Sau Đại Học');

insert into `position`(position_name) values 
('Lễ Tân'),
('Phục Vụ'),
('Chuyên Viên'),
('Giám Sát'),
('Quản Lý'),
('Giám Đốc');

insert into division(division_name) values
('Sale – Marketing'),
('Hành Chính'),
('Phục vụ'),
('Quản lý');

insert into attach_service(attach_service_name,attach_service_cost,attach_service_unit,attach_service_status) values 
('massage',10,1,'bình thường'),
('karaoke',10,1,'bình thường'),
('thức ăn',10,1,'bình thường'),
('nước uống',10,1,'bình thường'),
('thuê xe tham quan resort',10,1,'bình thường');

