create database QLThuVien_SOF102
go 
use [QLThuVien_SOF102]
go

Create table NXB
(
	MaXB nvarchar(10) not null primary key,
	DiaChi nvarchar(100) ,
	SoDT nvarchar(13)
)

create table SACH
(
	MaSach nvarchar(10) not null primary key,
	TenSach nvarchar(50) not null,
	NamSX int ,
	SoLuong int ,
	GiaSach float not null,
	MaLoaiSach nvarchar(10) ,
	MaXB nvarchar(10),
	Hinh nvarchar(200) null
)
 
 Create table LOAISACH
 (
	MaLoaiSach nvarchar(10) not null primary key,
	TenLoaiSach nvarchar(50) not null
 )

 Create table NHANVIEN(
	MaNV nvarchar(5) not null,
	CCCD nvarchar(120) not null,
	Ho nvarchar(50) ,
	Ten nvarchar(20) not null,
	Phai nvarchar(3) ,
	NgSinh date ,
	SoDT nvarchar(10) ,
	ChucVu nvarchar(50) ,
	constraint pkManv primary key (MaNV)
)

create table DOCGIA
(
	MaDocGia nvarchar(5) not null,
	Ho nvarchar(10) ,
	Ten nvarchar(20) ,
	CCCD nvarchar(12) not null,
	Email nvarchar(50),
	DiaChi nvarchar(300),
	NgayCap date,
	HanSD date,
	Hinh nvarchar(200),
	primary key (MaDocGia)
)

create table PHIEUMUON
(
	MaPhieuMuon nvarchar(5) not null,
	MaDocGia nvarchar(5) not null,
	MaSach nvarchar(10) not null,
	TenSach nvarchar(50) not null,
	NgayMuon date not null,
	HanTra date not null
	primary key (MaPhieuMuon)
)


Create table PHIEUTRA(
	MaPhieuTra nvarchar(5) not null,
	MaPhieuMuon nvarchar(5) not null,
	MaSach nvarchar(10) not null,
	NgayTra date,
	primary key	(MaPhieuTra)
)

Create table PHIEUPHAT(	
	MaPhieuPhat nvarchar(5) not null,
	MaPhieuTra nvarchar(5) not null,
	MaSach nvarchar(10) not null,
	NgayPhat date,
	LiDoPhat nvarchar(200),
	PhiPhat money,
	MaNV nvarchar(5) not null
	constraint pkMaPhieuPhat primary key (MaPhieuPhat)
)

alter table Sach
add FOREIGN KEY (MaLoaiSach) REFERENCES Loaisach(MaLoaiSach),
	FOREIGN KEY (MaXB) REFERENCES NXB(MaXB)

alter table Phieumuon
add FOREIGN KEY (MaDocGia) REFERENCES docgia(MaDocGia),
	FOREIGN KEY (MaSach) REFERENCES Sach(MaSach)

alter table PHIEUTRA
add FOREIGN KEY (MaPhieuMuon) REFERENCES PhieuMuon(MaPhieuMuon)

alter table phieuphat
add FOREIGN KEY (manv) REFERENCES nhanvien(manv),
	FOREIGN KEY (Maphieutra) REFERENCES phieutra(Maphieutra)

	
Create table USERS(
	MaNV nvarchar(5),
	PASSWORD nvarchar(100) not null,
	constraint pk_user primary key (MaNV),
	constraint pk_user_nhanvien foreign key (MaNV) REFERENCES NHANVIEN(MaNV)
);

Create view ThongTinUser
as
select USERS.*, NHANVIEN.ChucVu, 
                concat(NHANVIEN.Ho,' ',NHANVIEN.Ten) as 'HOTEN'
               from USERS join NHANVIEN on USERS.MaNV = NHANVIEN.MANV


go
insert into DOCGIA values ('DG001', N'Lê', N'An', '801772509582', 'anl@gmail.com', N'TP-HCM', '2023-01-01', '2024-01-01',''),
						('DG002', N'Lê', N'Ngân', '517114260455', 'nganl@gmail.com', N'TP-HCM',  '2023-01-01', '2024-01-01',''),
						('DG003', N'Lê', N'Hà', '973877675410', 'hal@gmail.com', N'TP-HCM',  '2023-01-01', '2024-01-01',''),
						('DG004', N'Nguyễn', N'An', '836897699403', 'ann@gmail.com', N'TP-HCM',  '2023-01-01', '2024-01-01',''),
						('DG005', N'Cao', N'Minh', '677826952563', 'minhc@gmail.com', N'TP-HCM',  '2023-07-27', '2024-07-27',''),
						('DG006', N'Nguyễn', N'Vinh', '939920514292', 'vinhn@gmail.com', N'TP-HCM',  '2023-09-20', '2024-09-20',''),
						('DG007', N'Lương', N'Anh', '916483053141', 'anhl@gmail.com', N'TP-HCM',  '2023-06-01', '2024-06-01',''),
						('DG008', N'Mỹ', N'An', '403988192493', 'anm@gmail.com', N'TP-HCM',  '2023-03-22', '2024-03-22',''),
						('DG009', N'Hòa', N'Bình', '421941674718', 'binhh@gmail.com', N'TP-HCM',  '2023-01-11', '2024-01-11',''),
						('DG010', N'Lê', N'Mỹ', '494790320618', 'myl@gmail.com', N'TP-HCM',  '2023-01-15', '2024-01-15','')

go
INSERT INTO LOAISACH VALUES ('LS001', N'Truyền thuyết'),
							('LS002', N'Cổ tích'),
							('LS003', N'Truyện tranh'),
							('LS004', N'Truyện cười'),
							('LS005', N'Ngụ ngôn'),
							('LS006', N'Ngôn tình'),
							('LS007', N'Địa lí'),
							('LS008', N'Lịch sử'),
							('LS009', N'Logical'),
							('LS010', N'Sách giáo khoa'),
							('LS011', N'Sách tự lực')

go
INSERT INTO NXB VALUES ('NXB001', N'Quang Trung_Q12', '012556789'),
						('NXB002', N'Pakadao_Q1', '0123444789'),
						('NXB003', N'Lương Định Của_Q2', '0123336789'),
						('NXB004', N'Hóc Môn', '0123457569'),
						('NXB005', N'Củ Chi', '0123451119'),
						('NXB006', N'Q5', '0123456656'),
						('NXB007', N'Lê Đức Thọ_Gò Vấp', '0121216789')

go
INSERT INTO SACH VALUES ('S001', N'Đắc nhân tâm', 2000, 10, 120000, 'LS011', 'NXB001', ''),
						('S002', N'Sinh học ', 2001, 19, 200000, 'LS010', 'NXB002', ''),
						('S003', N'Giáo dục', 2001, 77, 50000, 'LS010', 'NXB003', ''),
						('S004', N'Lịch sử', 2001, 19, 135000, 'LS008', 'NXB004', ''),
						('S005', N'Khéo ăn nói', 2000, 11, 40000,'LS004', 'NXB005', ''),
						('S006', N'Lương y ', 1999, 10, 127000, 'LS009', 'NXB006', ''),
						('S007', N'Cuộc chiến giữa các vị thần', 2000, 30, 55000, 'LS001', 'NXB007', ''),
						('S008', N'Vương triều sụp đổ', 2001, 16, 35000, 'LS001', 'NXB007', ''),
						('S009', N'Ếch ngồi đáy giếng', 1999, 10, 50000, 'LS006', 'NXB004', ''),
						('S010', N'Lợn cưới áo mới', 2000, 18, 45000, 'LS005', 'NXB003', '')

go
INSERT INTO PHIEUMUON VALUES ('PM001', 'DG001', 'S006', N'Lương y ', '2023-07-19', '2023-07-26'),
							('PM002', 'DG002', 'S003', N'Giáo dục', '2023-07-19', '2023-07-26'),
							('PM003', 'DG003', 'S002', N'Sinh học ', '2023-07-19', '2023-07-26'),
							('PM004', 'DG004', 'S004', N'Lịch sử', '2023-07-19', '2023-07-26'),
							('PM005', 'DG005', 'S006', N'Lương y ', '2023-07-19', '2023-07-26'),
							('PM006', 'DG006', 'S006', N'Lương y ', '2023-07-19', '2023-07-26'),
							('PM007', 'DG007', 'S001', N'Đắc nhân tâm', '2023-07-19', '2023-07-26'),
							('PM008', 'DG008', 'S008', N'Vương triều sụp đổ', '2023-07-19', '2023-07-26'),
							('PM009', 'DG009', 'S005', N'Khéo ăn nói', '2023-07-19', '2023-07-26'),
							('PM010', 'DG010', 'S006', N'Lương y ', '2023-07-19', '2023-07-26')

go
INSERT INTO NHANVIEN VALUES ('NV001', '250076412511', N'Nguyễn', N'Tú', N'Nam', '1990-01-05', '0123432789', N'Thủ thư'),
							('NV002', '772495539081', N'Nguyễn Thị Diệu', N'Mỵ', N'Nữ', '1991-03-07', '0126556789', N'Thủ thư'),
							('NV003', '189072627471', N'Phùng Thành', N'Phương', N'Nam', '1980-04-01', '0123456776', N'Quản lý'),
							('NV004', '203340679023', N'Võ Tấn', N'Thành', N'Nam', '1992-02-01', '0123456777', N'Thủ thư'),
							('NV005', '141999802031', N'Hoàng Hữu', N'Thành', N'Nam', '1999-06-01', '0123456788', N'Quản lý')

go

insert into USERS values ('NV001', '123456'),
						 ('NV002', '123456'),
						 ('NV003', '123456'),
						 ('NV004', '123456'),
						 ('NV005', '123456')
						 
go
INSERT INTO PHIEUTRA VALUES ('PT001', 'PM001', 'S006', '2023-07-25'),
							('PT002', 'PM002', 'S003', '2023-07-25'),
							('PT003', 'PM003', 'S002', '2023-07-25'),
							('PT004', 'PM004', 'S004', '2023-07-25'),
							('PT005', 'PM005', 'S006', '2023-07-25'),
							('PT006', 'PM006', 'S006', '2023-07-25'),
							('PT007', 'PM007', 'S001', '2023-07-25'),
							('PT008', 'PM008', 'S008', '2023-07-25'),
							('PT009', 'PM009', 'S005', '2023-07-25'),
							('PT010', 'PM010', 'S006', '2023-07-25')

go
INSERT INTO PHIEUPHAT VALUES ('PP001', 'PT006', 'S006', '2023-07-26', N'Mất', 21000.0, 'NV001'),
							('PP002', 'PT008', 'S008', '2023-07-26', N'Hỏng', 5300.0, 'NV001'),
							('PP010', 'PT010', 'S06', '2023-07-26', N'Trễ hạn', 12200.0, 'NV002')


go
Create view Mat 
as
	Select PhieuPhat.MaSach, TenSach, count(Sach.MaSach) as N'Số lượng' from Sach join PhieuPhat on Sach.MaSach = PHIEUPHAT.MaSach
		where LiDoPhat like N'Mất'
		group by PhieuPhat.MaSach, Sach.TenSach

go
Create view Hong 
as
	Select PhieuPhat.MaSach, TenSach, count(Sach.MaSach) as N'Số lượng' from Sach join PhieuPhat on Sach.MaSach = PHIEUPHAT.MaSach
		where LiDoPhat like N'Hỏng'
		group by PhieuPhat.MaSach, Sach.TenSach  

go
Create view Trehan
as
	Select PhieuPhat.MaSach, TenSach, count(Sach.MaSach) as N'Số lượng' from Sach join PhieuPhat on Sach.MaSach = PHIEUPHAT.MaSach
		where LiDoPhat like N'Trễ hạn'
		group by PhieuPhat.MaSach, Sach.TenSach

