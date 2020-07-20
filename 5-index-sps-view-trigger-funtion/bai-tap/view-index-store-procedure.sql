drop database if exists demo;

create database if not exists demo;

use demo;

create table products(
id int,
productCode int,
productName varchar(50),
productPrice double,
productAmount double,
productDescription varchar(20),
productStatus varchar(10)
);

-- tạo unique index trên cột productCode
create unique index uidx_productCode on products (productCode);

--  tạo composite trên 2 cột 	productName , productPrice
create index idx_pName_pPrice on products (productName,productPrice);

insert into products values 
(1,123,'banh',1,1,'banh mi','con'),
(1,124,'kem',1,1,'banh mi','con'),
(1,125,'sinh to',1,1,'banh mi','con'),
(1,126,'my tom',1,1,'banh mi','con'),
(1,127,'trai cay',1,1,'banh mi','con'),
(1,128,'tom',1,1,'banh mi','con');

-- sử dụng câu lênh explain 
explain select * from products where  productCode = 123;

-- tạo view  productCode, productName, productPrice, productStatus từ bảng products.
create view products_view 
as
select productCode, productName, productPrice, productStatus from products;

select * from products_view;

-- sửa view 
alter view products_view 
as select productCode, productName, productPrice from products;

select * from products_view;

-- xoá view 
drop view products_view;

-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
delimiter  //
create procedure find_by_product()
begin 
select * from products;
end; // 
delimiter ;

call find_by_product();

-- Tạo store procedure thêm một sản phẩm mới
delimiter  //
create procedure insert_products(id int,
productCode int,
productName varchar(50),
productPrice double,
productAmount double,
productDescription varchar(20),
productStatus varchar(10))
begin
	insert into products values (id, productCode, productName, productPrice, productAmount, productDescription, productStatus);
end;// 
delimiter ;

call insert_products(1,129,'banh',1,1,'banh mi','con');

select * from products;

-- tạo procedure sửa thông tin sản phẩm theo id 
delimiter  //
create procedure update_products(v_id int,
v_productCode int,
v_productName varchar(50),
v_productPrice double,
v_productAmount double,
v_productDescription varchar(20),
v_productStatus varchar(10))
begin
start transaction;
     if  exists (select 1 from products where productName = v_productName) then
		 update products set productCode = v_productCode, productPrice = v_productPrice, 
		productAmount = v_productAmount, productDescription = v_productDescription, productStatus = v_productStatus where  productName = v_productName;
    end if;
end;// 
delimiter ;

call update_products(1,130,'kem',1,1,'banh my','con');
call update_products(2,130,'banh',1,1,'banh mi','con');

-- Tạo store procedure xoá sản phẩm theo id
delimiter  //
create procedure delete_product(v_id int)
begin
start transaction;
	delete from products where v_id = id;
   if not exists (select 1 from products where id = v_id)then
		rollback;
    end if;
    end;//
    delimiter ;
    
call delete_product(1);
call delete_product(2);


