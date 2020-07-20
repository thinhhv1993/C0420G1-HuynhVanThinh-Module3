drop database if exists furama_manager;
-- tạo cơ sở dữ liệu 
create database if not exists furama_manager;

use furama_manager;

-- ----------------------------------------
-- tạo bảng service
create table DichVu(
IDDichvu int primary key,
TenDichVu varchar(45),
DienTich int,
SoTang int,
SoNguoiToiDa varchar(45),
ChiPhiThue varchar(45),
IDKieuThue int,
IDLoaiDichVu int,
TrangThai varchar(45)
);

-- thêm bảng kiểu thuế
create table KieuThue(
IDKieuThue int primary key,
TenKieuThue varchar(45),
Gia int
);

-- thêm bảng loại dịch vụ
create table LoaiDichVu(
IDLoaiDichVu int primary key,
TenLoaiDichVu varchar(45)
);

-- tạo bảng hợp đồng
create table HopDong(
IDHopDong int primary key,
NgayLamHopDong date,
NgayKetThuc date,
TienDatCoc int,
TongTien int,
IDNhanVien int,
IDKhachHang int,
IDDichVu int
);

-- tạo bảng hợp đồng chi tiết
create table HopDongChiTiet(
IDHopDongChiTiet int primary key,
IDHopDong int,
IDDichVuDiKem int,
SoLuong int
);

-- tạo bảng Dịch Vụ Đi Kèm
create table DichVuDiKem(
IDDichVuDiKem int primary key,
TenDichVuDiKem varchar(45),
Gia int,
DonVi int,
TrangThaiKhaDung varchar(45)
);

-- ----------------------------------------

-- tạo bảng khách hàng 
create table KhachHang(
IDKhachHang int primary key,
HoTen varchar(45),
NgaySinh date,
SoCMND varchar(45),
SDT varchar(20),
Email varchar(45),
DiaChi varchar(45),
IDLoaiKhach int
);

-- tạo bảng loại khách hàng
create table LoaiKhach(
IDLoaiKhach int primary key,
TenLoaiKhach varchar(45)
);

-- ----------------------------------------

-- tạo bảng nhân viên
create table NhanVien(
IDNhanVien int primary key,
HoTen varchar(45),
NgaySinh date,
SoCMND varchar(45),
Luong varchar(45),
SDT varchar(45),
Email varchar(45),
DiaChi varchar(45),
IDViTri int,
IDTrinhDo int,
IDBoPhan int
);

-- tạo bảng vị trí
create table ViTri(
IDViTri int primary key,
TenViTri varchar(45)
);

-- tạo bảng trình độ
create table TrinhDo(
IDTrinhDo int primary key,
TrinhDo varchar(45)
);

-- tạo bảng bộ phận
create table BoPhan(
IDBoPhan int primary key,
TenBoPhan varchar(45)
);

-- -----------------------------------------
-- thêm khoá ngoại loại dịch vụ cho bảng dịch vụ
alter table DichVu
add foreign key (IDLoaiDichVu) references LoaiDichVu(IDLoaiDichVu);

-- thêm khoá ngoại kiểu thuế cho bảng dịch vụa
alter table DichVu
add foreign key (IDKieuThue) references KieuThue(IDKieuThue);

-- thêm khoá ngoại dịch vụ cho bảng hợp đồng
alter table HopDong
add foreign key (IDDichVu) references DichVu(IDDichVu);

-- thêm khoá ngoại hợp đồng cho bảng hợp đồng chi tiết
alter table HopDongChiTiet
add foreign key (IDHopDong) references HopDong(IDHopDong);

-- thêm khoá ngoại dịch vụ đi kèm cho bảng hợp đồng chi tiết
alter table HopDongChiTiet
add foreign key (IDDichVuDiKem) references DichVuDiKem(IDDichVuDiKem);

-- thêm khoá ngoại khách hàng cho bảng hợp đồng 
alter table HopDong
add foreign key (IDKhachHang) references KhachHang(IDKhachHang);

-- thêm khoá ngoại loại khách cho bảng khách hàng 
alter table KhachHang
add foreign key (IDLoaiKhach) references LoaiKhach(IDLoaiKhach);

-- thêm khoá ngoại nhân viên cho bảng hợp đồng
alter table HopDong
add foreign key (IDNhanVien) references NhanVien(IDNhanVien);

-- thêm khoá ngoại vị trí cho bảng nhân viên 
alter table NhanVien
add foreign key (IDViTri) references ViTri(IDViTri);

-- thêm khoá ngoại trình độ cho bảng nhân viên 
alter table NhanVien
add	foreign key (IDTrinhDo) references TrinhDo(IDTrinhDo);

-- thêm khoá ngoại bộ phân cho bảng nhân viên 
alter table NhanVien
add foreign key (IDBoPhan) references BoPhan(IDBoPhan);

-- ----------------------------------------------------------

-- thêm dữ liệu cho bảng Loại dịch vụ 
insert into LoaiDichVu values 
( 1,'Villa'),
( 2,'House'),
( 3,'Room');

-- thêm dữ liệu cho bảng kiểu thuê
insert into KieuThue values
(1,'Gia Đình',100000),
(2,'Cong Ty',200000),
(3,'Đoàn Du Lịch',100000);

--  thêm dữ liệu cho bảng loại khách 
insert into LoaiKhach values
(1,'Diamond'),
(2,'Platinum'),
(3,'Gold'),
(4,'Silver'),
(5,'Copper');

-- thêm dữ liệu cho bảng vị trí
insert into ViTri values
(1,'Giám Đốc'),
(2,'Quản Lý'),
(3,'Nhân Vien');

-- thêm dữ liệu cho bảng trình độ
insert into TrinhDo values
(1,'Thạc Sĩ'),
(2,'Đại Học'),
(3,'Cao Đẳng'),
(4,'Phổ Thông');

-- thêm dữ liệu cho bảng bộ phận
insert into BoPhan values
(1,'Kinh Doanh'),
(2,'Nhân Sự'),
(3,'Lễ Tân'),
(4,'Buồng Phòng'),
(5,'Phục Vụ '),
(6,'Bếp'),
(7,'Bảo Vệ');

-- thêm dữ liệu cho bảng dịch vụ đi kèm 
insert into DichVuDiKem values
(1,'Massage',45000,1,'Tốt'),
(2,'Karaoke',50000,1,'Tốt'),
(3,'Thức ăn',30000,1,'Tốt'),
(4,'Nước uống',20000,1,'Tốt'),
(5,'Thuê xe duy chuyển',40000,1,'Tốt');

-- thêm dữ liệu cho bảng dịch vụ
insert into DichVu values
(1,'Mer Villa',200,5,'10','100000',1,1,'vẫn còn'),
(2,'King Villa',190,5,'10','90000',2,1,'vẫn còn'),
(3,'Beautiful Villa',180,5,'10','80000',3,1,'vẫn còn'),
(4,'Luxury Villa',170,5,'10','70000',1,1,'vẫn còn'),
(5,'Newly Villa',160,5,'10','60000',2,1,'vẫn còn'),
(6,'Fleur House',150,5,'10','50000',1,2,'vẫn còn'),
(7,'Jhon House ',140,5,'10','40000',2,2,'vẫn còn'),
(8,'Ocean House ',130,5,'10','30000',3,2,'vẫn còn'),
(9,'Perfect House ',120,5,'10','20000',1,2,'vẫn còn'),
(10,'Pandora House ',110,5,'10','10000',2,2,'vẫn còn'),
(11,'501 Room ',100,5,'10','9000',1,3,'vẫn còn'),
(12,'502 Room ',90,5,'10','8000',2,3,'vẫn còn'),
(13,'503 Room ',80,5,'10','7000',3,3,'vẫn còn'),
(14,'504 Room ',70,5,'10','6000',1,3,'vẫn còn'),
(15,'505 Room ',60,5,'10','5000',2,3,'vẫn còn');

-- thêm dữ liệu cho bảng khách hàng 
insert into KhachHang values
(1,'Huỳnh Văn Thịnh','1990-10-10','12345','123456789','a@gmail.com','Đà Nẵng',1),
(2,'Phạm Vũ','1990-10-10','12345','123456789','b@gmail.com','Đà Nẵng',1),
(3,'Vũ Lê Tường','1990-10-10','12345','123456789','c@gmail.com','Quảng Trị',1),
(4,'Võ Đức Việt','1990-10-10','12345','123456789','d@gmail.com','Quảng TRị',1),
(5,'Dương Nhật Huy','1990-10-10','12345','123456789','e@gmail.com','Quảng Nam',1),
(6,'Nguyễn Văn Hiếu','1990-10-10','12345','123456789','f@gmail.com','Quảng Nam',2),
(7,'Nguyễn Ngọc Anh Quốc','1990-10-10','12345','123456789','g@gmail.com','Huế',2),
(8,'Nguyễn Tiến Quốc','1990-10-10','12345','123456789','h@gmail.com','Huế',2),
(9,'Trần Huỳnh Kim Ngân','1990-10-10','12345','123456789','i@gmail.com','Quảng Bình',2),
(10,'Nguyễn Hải Đăng','1990-10-10','12345','123456789','k@gmail.com','Quảng Bình',2),
(11,'Nguyễn Văn Hải','1990-10-10','12345','123456789','l@gmail.com','Quảng Ngãi',3),
(12,'Trần Quang Trung','1990-10-10','12345','123456789','m@gmail.com','Quảng Ngãi',3),
(13,'Trần Chí Trung','1990-10-10','12345','123456789','n@gmail.com','Quy Nhơn',3),
(14,'Đỗ Hùng Dũng','1990-10-10','12345','123456789','o@gmail.com','Quy Nhơn',3),
(15,'Cao Mộng','1990-10-10','12345','123456789','s@gmail.com','Quy Nhơn',3),
(16,'Cao Mộng','1990-10-10','12345','123456789','s@gmail.com','Quy Nhơn',3);

-- thêm dữ liệu bảng nhân viên
insert into NhanVien values
(1,'Linh','1991-10-10','12345','20000','12345','anh@gmail.com','Đà Nẵng',1,1,1),
(2,'Tuan','1991-10-10','12345','20000','12345','anh@gmail.com','Đà Nẵng',1,1,2),
(3,'Phương','1991-10-10','12345','20000','12345','anh@gmail.com','Đà Nẵng',1,1,3),
(4,'Trang','1991-10-10','12345','20000','12345','anh@gmail.com','Đà Nẵng',1,1,4),
(5,'Quỳnh','1991-10-10','12345','20000','12345','anh@gmail.com','Đà Nẵng',1,1,5),
(6,'Yến','1991-10-10','12345','20000','12345','anh@gmail.com','Đà Nẵng',1,1,6),
(7,'Nga','1991-10-10','12345','20000','12345','anh@gmail.com','Đà Nẵng',1,1,7),
(8,'Nhàn','1991-10-10','12345','10000','12345','anh@gmail.com','Huế',2,2,1),
(9,'Quý','1991-10-10','12345','10000','12345','anh@gmail.com','Huế',2,2,2),
(10,'Huệ','1991-10-10','12345','10000','12345','anh@gmail.com','Huế',2,2,3),
(11,'Thảo','1991-10-10','12345','10000','12345','anh@gmail.com','Huế',2,2,4),
(12,'Na','1991-10-10','12345','10000','12345','anh@gmail.com','Huế',2,2,5),
(13,'Thuận','1991-10-10','12345','10000','12345','anh@gmail.com','Huế',2,2,6),
(14,'Ngân','1991-10-10','12345','10000','12345','anh@gmail.com','Huế',2,2,7),
(15,'Hà','1991-10-10','12345','10000','12345','anh@gmail.com','Quảng Nam',3,1,1),
(16,'Châu','1991-10-10','12345','10000','12345','anh@gmail.com','Quảng Nam',3,1,2),
(17,'Ngọc','1991-10-10','12345','5000','12345','anh@gmail.com','Quảng Nam',3,1,3),
(18,'Hiền','1991-10-10','12345','5000','12345','anh@gmail.com','Quảng Nam',3,1,4),
(19,'My','1991-10-10','12345','5000','12345','anh@gmail.com','Quảng Nam',3,1,5),
(20,'Hương','1991-10-10','12345','5000','12345','anh@gmail.com','Quảng Nam',3,1,6),
(21,'Ánh','1991-10-10','12345','5000','12345','anh@gmail.com','Quảng Nam',3,1,7);

-- thêm dữ liệu vào bảng hợp đồng
insert into HopDong values 
(1,'2000-10-10','2000-11-11',1000,100000,1,1,1),
(2,'2000-10-10','2000-11-11',1000,100000,1,2,1),
(3,'2000-10-10','2000-11-11',1000,100000,1,3,1),
(4,'2000-10-10','2000-11-11',1000,100000,1,4,1),
(5,'2000-10-10','2000-11-11',1000,100000,1,5,1),
(6,'2000-10-10','2000-11-11',1000,100000,2,1,2),
(7,'2000-10-10','2000-11-11',1000,100000,2,2,2),
(8,'2000-10-10','2000-11-11',1000,100000,2,3,2),
(9,'2000-10-10','2000-11-11',1000,100000,2,4,2),
(10,'2000-10-10','2000-11-11',1000,100000,2,5,2),
(11,'2000-10-10','2000-11-11',1000,100000,3,1,3),
(12,'2000-10-10','2000-11-11',1000,100000,3,2,3),
(13,'2000-10-10','2000-11-11',1000,100000,3,3,3),
(14,'2000-10-10','2000-11-11',1000,100000,3,4,3),
(15,'2000-10-10','2000-11-11',1000,100000,3,4,3),
(16,'2018-10-10','2000-11-11',1000,100000,3,4,3),
(17,'2019-10-10','2000-11-11',1000,100000,3,5,3);

-- thêm dữ liệu cho bảng hợp đồng chi tiết
insert into HopDongChiTiet values 
(1,1,1,1),
(1,1,2,1),
(2,2,2,1),
(3,3,3,1),
(4,4,4,1),
(5,5,5,1),
(6,6,1,1),
(7,7,2,1),
(8,8,3,1),
(9,9,4,1),
(10,10,5,1),
(11,11,1,1),
(12,12,2,1),
(13,13,3,1),
(14,14,4,1),
(15,15,5,1);


-- hiển thị tên nhân viên
select * from NhanVien where HoTen like ('H%') or HoTen like ('T%') or HoTen like ('K%') and length(HoTen) <= 15 ;

-- hiển thị thông tin tất cả khách hàng có độ tuổi 18 đến 50 và có địa chỉ ở đà nẵng hoặc quảng trị
select * from KhachHang where DiaChi in ('Đà Nẵng', 'Quảng Trị')
 and (TIMESTAMPDIFF(YEAR,NgaySinh, CURDATE()) >= 18 or TIMESTAMPDIFF(YEAR,NgaySinh, CURDATE()) <=50) ;
  
  -- 4.	Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. 
  -- Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng.
  -- Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
 
select k.HoTen,count(h.IDHopDong) as 'Số lần đặt phòng'
from KhachHang k
right join HopDong h on  k.IDKhachHang = h.IDKhachHang
where k.IDLoaiKhach = 1
group by k.IDKhachHang;

-- 5.	Hiển thị IDKhachHang, HoTen, TenLoaiKhach, IDHopDong, TenDichVu, NgayLamHopDong, NgayKetThuc,
-- TongTien (Với TongTien được tính theo công thức như sau: ChiPhiThue + SoLuong*Gia, với SoLuong và Giá là từ bảng DichVuDiKem)
-- cho tất cả các Khách hàng đã từng đặt phỏng. (Những Khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).

select k.IDKhachHang,k.HoTen,l.TenLoaiKhach,h.IDHopDong,t.TenDichVu,h.NgayLamHopDong,h.NgayKetThuc,t.ChiPhiThue + (dv.DonVi*dv.Gia) as 'Tổng Tiền'
from KhachHang k
left join HopDong h on k.IDKhachHang = h.IDKhachHang 
left join LoaiKhach l on k.IDLoaiKhach = l.IDLoaiKhach
left join DichVu t on t.IDdichVu = h.IDDichVu
left join HopDongChiTiet hdct on hdct.IDHopDong = h.IDHopDong
left join DichVuDiKem dv on dv.IDDichVuDiKem =  hdct.IDDichVuDiKem;

-- 6.	Hiển thị IDDichVu, TenDichVu, DienTich, ChiPhiThue, TenLoaiDichVu
--  của tất cả các loại Dịch vụ chưa từng được Khách hàng thực hiện đặt từ quý 1 của năm 2019 (Quý 1 là tháng 1, 2, 3).

select dv.IDDichVu,dv.TenDichVu,dv.DienTich,dv.ChiPhiThue,ldv.TenLoaiDichVu,hd.ngaylamhopdong
from DichVu dv 
left join LoaiDichVu ldv on ldv.IDLoaiDichVu = dv.IDLoaiDichVu
left join HopDong hd on hd.IDDichVu = dv.IDDichVu
where (datediff(hd.ngaylamhopdong,'2019-01-01')<0) or (datediff(hd.ngaylamhopdong,'2019-03-31')>0);


-- 7.	Hiển thị thông tin IDDichVu, TenDichVu, DienTich, SoNguoiToiDa, ChiPhiThue, TenLoaiDichVu
-- của tất cả các loại dịch vụ đã từng được Khách hàng đặt phòng trong năm 2018 nhưng chưa từng được Khách hàng đặt phòng  trong năm 2019.

select dv.IDDichVu, dv.TenDichVu, dv.DienTich, dv.SoNguoiToiDa, dv.ChiPhiThue, ldv.TenLoaiDichVu 
from DichVu dv
left join LoaiDichVu ldv on ldv.IDLoaiDichVu = dv.IDLoaiDichVu
left join HopDong hd on hd.IDDichVu = dv.IDDichVu
where (hd.ngaylamhopdong between '2018-01-01' and '2018-12-30') and (hd.ngaylamhopdong not between '2019-01-01' and '2019-12-30'); 

-- 8.	Hiển thị thông tin HoTenKhachHang có trong hệ thống, với yêu cầu HoThenKhachHang không trùng nhau.
-- Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên
-- cách 1 :
select distinct HoTen from KhachHang;
-- cách 2 :
select HoTen from KhachHang group by HoTen having count(HoTen) >= 1; 
-- cách 3 :
select HoTen from KhachHang 
union 
select HoTen from KhachHang ;

-- 9.Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng 
-- trong năm 2019 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.

-- 10.	Hiển thị thông tin tương ứng với từng Hợp đồng thì đã sử dụng bao nhiêu Dịch vụ đi kèm. 
-- Kết quả hiển thị bao gồm IDHopDong, NgayLamHopDong, NgayKetthuc, TienDatCoc, SoLuongDichVuDiKem 
-- (được tính dựa trên việc count các IDHopDongChiTiet).

select h.IDHopDong, h.NgayLamHopDong, h.NgayKetthuc, h.TienDatCoc, count(hc.IDDichVuDiKem) as 'SoLuongDichVuDiKem'
from HopDong h
join HopDongChiTiet hc on hc.IDHopDong = h.IDHopDong
group by h.IDHopDong;

-- 11.	Hiển thị thông tin các Dịch vụ đi kèm đã được sử dụng bởi những Khách hàng
-- có TenLoaiKhachHang là “Diamond” và có địa chỉ là “Vinh” hoặc “Quảng Ngãi”.

select dvdk.IDDichVuDiKem,dvdk.TenDichVuDiKem,dvdk.Gia,dvdk.DonVi,dvdk.TrangThaiKhaDung,kh.HoTen
from DichVuDiKem dvdk
join HopDongChiTiet hdct on dvdk.IDDichVuDiKem = hdct.IDDichVuDiKem
join HopDong hd on hdct.IDHopDong = hd.IDHopDong
join KhachHang kh on kh.IDKhachHang = hd.IDKhachHang
join LoaiKhach lk on lk.IDLoaiKhach = kh.IDLoaiKhach
where lk.TenLoaiKhach  = 'Diamond' and (kh.DiaChi = 'Quảng Nam' or kh.DiaChi = 'Đà Nẵng') 
group by kh.HoTen;

-- 12.	Hiển thị thông tin IDHopDong, TenNhanVien, TenKhachHang, SoDienThoaiKhachHang, TenDichVu, SoLuongDichVuDikem
-- (được tính dựa trên tổng Hợp đồng chi tiết), TienDatCoc của tất cả các dịch vụ đã từng được khách hàng đặt 
-- vào 3 tháng cuối năm 2019 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2019.

select IDHopDong, TenNhanVien, TenKhachHang, SoDienThoaiKhachHang, TenDichVu,  count(hc.IDDichVuDiKem) as 'SoLuongDichVuDiKem'
from HopDong hd
join NhanVien nv on nv.