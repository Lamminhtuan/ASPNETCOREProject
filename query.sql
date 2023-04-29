CREATE DATABASE ASP
GO

USE ASP
GO

SELECT * FROM TAIKHOAN

--CREATE TABLES
CREATE TABLE PHONE
(
ID nvarchar(6) not null primary key,
Ten nvarchar(250) not null,
Hang nvarchar(250) not null,
Gia decimal(18,2) not null,
ManHinh nvarchar(250) not null,
OS nvarchar(250) not null,
CameraSau nvarchar(250) not null,
CameraTruoc nvarchar(250) not null,
NhuCau nvarchar(250) not null,
Chip nvarchar(250) not null,
Ram float not null,
Rom float not null,
Pin nvarchar(250) not null,
ThietKe nvarchar(250) not null,
ImagePath nvarchar(550) not null,
SaoTrungBinh float not null
)

CREATE TABLE LAPTOP
(
ID nvarchar(6) not null primary key,
Ten nvarchar(250) not null,
Hang nvarchar(250) not null,
Gia decimal(18,2) not null,
ManHinh nvarchar(250) not null,
OS nvarchar(250) not null,
Webcam nvarchar(250) not null,
NhuCau nvarchar(250) not null,
Chip nvarchar(250) not null,
VGA nvarchar(250) not null,
Ram int not null,
Rom int not null,
Pin nvarchar(250) not null,
KhoiLuong float not null,
CongGiaoTiep nvarchar(250) not null,
ThietKe nvarchar(250) not null,
ImagePath nvarchar(550) not null,
SaoTrungBinh float not null
)
CREATE TABLE TAIKHOAN(
Email nvarchar(50) COLLATE SQL_Latin1_General_CP1_CS_AS not null primary key,
HoTen nvarchar(100) not null,
MatKhau nvarchar(100) COLLATE SQL_Latin1_General_CP1_CS_AS not null,

DiaChi nvarchar(200) not null,
SDT varchar(20) not null,
VaiTro nvarchar(50) not null
)


CREATE TABLE YEUTHICH(
Email  nvarchar (50) COLLATE SQL_Latin1_General_CP1_CS_AS FOREIGN KEY REFERENCES Taikhoan(Email),
IDSP nvarchar(6) not null,
Ten nvarchar(250) not null,
Gia decimal(18,2) not null,
ImagePath nvarchar(550) not null,
PRIMARY KEY (Email, IDSP),
)



CREATE TABLE GIOHANG(
Email nvarchar(50) not null,
IDGH nvarchar(5) not null PRIMARY KEY,
NgayMua date not null,
TongGia decimal not null,
GiamGia decimal(4,2) not null,
TongPhaiTra decimal not null
)

CREATE TABLE VOUCHER(
Voucher varchar(10) not null primary key,
GiamGia decimal(4,2) not null,
)

	CREATE TABLE CTGIOHANG(

	IDGH nvarchar(5) FOREIGN KEY REFERENCES GIOHANG(IDGH),
	IDSP nvarchar(5) not null,
	Ten nvarchar(250) not null,
	ImagePath nvarchar(550) not null,
	DonGia decimal not null,
	SoLuong int not null,
	ThanhTien decimal not null,
	PRIMARY KEY(IDGH, IDSP)
	)
GO


INSERT INTO PHONE(ID,Ten, Hang, Gia, ManHinh, OS, CameraSau, CameraTruoc, NhuCau, Chip,Ram,Rom,Pin, ThietKe, ImagePath, SaoTrungBinh)
VALUES('DT01', N'iPhone 14 Pro Max 128 GB', N'Apple', 33990000, N'OLED 6.7" Super Retina XDR', N'iOS', N'Chính 48 MP & Phụ 12 MP, 12 MP', '12 MP',N'Cao cấp, sang trọng, chụp ảnh, quay phim', N'Apple A16 Bionic', 6, 128, N'4323 mAh',N'Khung thép không gỉ & Mặt lưng kính cường lực', 'https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-vang-thumb-600x600.jpg', 0),
('DT02', N'iPhone 14 Pro', 'Apple', 30590000, N'OLED 6.1" Super Retina XDR',  'iOS', N'Chính 48 MP & Phụ 12 MP, 12 MP','12 MP', N'Cao cấp, sang trọng, chụp ảnh, quay phim','Apple A16 Bionic', 6, 128, '3200 mAh', N'Khung thép không gỉ & Mặt lưng kính cường lực','https://cdn.tgdd.vn/Products/Images/42/247508/iphone-14-pro-tim-thumb-600x600.jpg', 0),
('DT03', N'iPhone 13 Pro Max', 'Apple', 28490000, N'OLED 6.7" Super Retina XDR', 'iOS', '3 camera 12 MP ', '12 MP', N'Cao cấp, sang trọng, chụp ảnh, quay phim', 'Apple 15 Bionic', 6, 128, '4352 mAh',N'Khung thép không gỉ & Mặt lưng kính cường lực', 'https://cdn.tgdd.vn/Products/Images/42/230529/iphone-13-pro-max-xanh-la-thumb-600x600.jpg', 0),
('DT04', 'Samsung Galaxy S22 Ultra', 'Samsung', 25990000, 'Dynamic AMOLED 2X 6.8" Quad HD + (2K +)', 'Android', N'Chính 108 MP & Phụ 12 MP, 10 MP, 10 MP', '40 MP',N'Cao cấp, sang trọng, chụp ảnh, quay phim', 'Snapdragon 8 Gen 1',  8, 128, '5000 mAh',N'Khung kim loại & Mặt lưng kính' ,'https://cdn.tgdd.vn/Products/Images/42/235838/Galaxy-S22-Ultra-Burgundy-600x600.jpg', 0),
('DT05', 'Samsung Galaxy S22 Plus', 'Samsung', 21990000, 'Dynamic AMOLED 2X 6.6" Full HD +', 'Android', N'Chính 50 MP & Phụ 12 MP, 10 MP', '10 MP',N'Chụp ảnh, quay phim, cao cấp, sang trọng', 'Snapdragon 8 Gen 1', 8, 128, '4500 mAh', N'Khung nhôm & Mặt lưng kính','https://cdn.tgdd.vn/Products/Images/42/242439/Galaxy-S22-Plus-White-600x600.jpg' ,0),
('DT06', 'Samsung Galaxy Z Fold4 5G', 'Samsung', 37990000, N'Dynamic AMOLED 2X Chính 7.6" & Phụ 6.2" Quad HD+ (2K+)' , 'Android', N'Chính 50 MP & Phụ 12 MP, 10 MP', '10 MP & 4 MP',N'Màn hình gập, cao cấp, sang trọng, chụp ảnh, quay phim', 'Snapdragon 8+ Gen 1', 12, 256, '4400 mAh',N'Khung nhôm & Mặt lưng kính cường lực', 'https://cdn.tgdd.vn/Products/Images/42/250625/samsung-galaxy-z-fold4-xanh-256gb-600x600.jpg',0),
('DT07', 'Samsung Galaxy Z Flip4 5G', 'Samsung', 20990000, N'Chính: Dynamic AMOLED 2X, Phụ: Super AMOLED, Chính 6.7" & Phụ 1.9" Full HD+', 'Android', '2 camera 12 MP', '10 MP', N'Màn hình gập, cao cấp, sang trọng, chụp ảnh, quay phim','Snapdragon 8+ Gen 1', 8, 256, '3700 mAh',N'Khung nhôm & Mặt lưng kính cường lực','https://cdn.tgdd.vn/Products/Images/42/258047/samsung-galaxy-z-flip4-5g-128gb-thumb-tim-600x600.jpg',0),
('DT08', 'OPPO Find X5 Pro 5G', 'OPPO', 30490000, 'AMOLED 6.7" Quad HD + (2K +)','Android', N'Chính 50 MP & Phụ 50 MP, 13 MP', '32 MP',N'Cao cấp, sang trọng, chụp ảnh, quay phim', 'Snapdragon 8 Gen 1', 12, 256, '5000 mAh',N'Khung kim loại & Mặt lưng gốm' ,'https://cdn.tgdd.vn/Products/Images/42/250622/oppo-find-x5-pro-den-thumb-600x600.jpg',0),
('DT09', 'Xiaomi 12 Pro', 'Xiaomi', 25490000, 'AMOLED 6.73" Quad HD + (2K +)', 'Android', '3 camera 50 MP', '32 MP',N'Cao cấp, sang trọng, chụp ảnh, quay phim','Snapdragon 8 Gen 1', 12, 256, '4600 mAh',N'Khung kim loại & Mặt lưng kính' ,'https://cdn.tgdd.vn/Products/Images/42/255635/Xiaomi-12-Pro-tim-thumb-mau-600x600.jpg',0),
('DT10', 'Vivo X80', 'Vivo', 19190000, 'AMOLED 6.78" Full HD +', 'Android', 'Chính 50 MP & Phụ 12 MP, 12 MP', '32 MP',N'Cao cấp, sang trọng, chụp ảnh, quay phim', 'MediaTek Dimensity 9000', 12, 256, '4500 mAh',N'Khung hợp kim nhôm & Mặt lưng kính' ,'https://cdn.tgdd.vn/Products/Images/42/253138/vivo-x80-xanh-thumb-600x600.jpg',0),
('DT11', 'OPPO Reno8 Pro 5G', 'OPPO', 18990000, 'AMOLED 6.7" Full HD +', 'Android', N'Chính 50 MP & Phụ 8 MP, 2 MP', '32 MP',N'Chụp ảnh, quay phim',N'MediaTek Dimensity 8100 Max 8 nhân', 12, 256, '4500 mAh', N'Khung kim loại & Mặt lưng kính cường lực Gorilla Glass 5','https://cdn.tgdd.vn/Products/Images/42/260546/oppo-reno8-pro-thumb-xanh-1-600x600.jpg',0),
('DT12', 'Samsung Galaxy S21 FE 5G', 'Samsung', 12990000, 'Dynamic AMOLED 2X 6.4" Full HD +', 'Android', N'Chính 12 MP & Phụ 12 MP, 8 MP', '32 MP',N'Chụp ảnh, quay phim', 'Exynos 2100', 8, 128, '4500 mAh',N'Khung kim loại & Mặt lưng nhựa', 'https://cdn.tgdd.vn/Products/Images/42/233090/Samsung-Galaxy-S21-FE-trang-1-2-600x600.jpg',0),
('DT13', 'Samsung Galaxy A73 5G', 'Samsung', 11990000, 'Super AMOLED Plus 6.7" Full HD +','Android', N'Chính 108 MP & Phụ 12 MP, 5 MP, 5 MP', '32 MP', N'Chụp ảnh, quay phim','Snapdragon 778G 5G', 8, 128, '5000 mAh',N'Khung & Mặt lưng nhựa','https://cdn.tgdd.vn/Products/Images/42/246195/samsung-galaxy-a73-5g-xanh-thumb-600x600.jpg',0),
('DT14', 'Vivo V23 5G', 'Vivo', 11690000, 'AMOLED 6.44" Full HD +', 'Android', N'Chính 64 MP & Phụ 8 MP, 2 MP', N'Chính 50 MP & Phụ 8 MP',N'Chụp ảnh, quay phim', 'MediaTek Dimensity 920 5G', 8, 128, '4200 mAh',N'Khung kim loại & Mặt lưng kính', 'https://cdn.tgdd.vn/Products/Images/42/264034/vivo-v23-5g-5-600x600.jpg',0),
('DT15', 'Xiaomi 12T 5G', 'Xiaomi', 12490000, 'AMOLED 6.67" 1.5K','Android', N'Chính 108 MP & Phụ 8 MP, 2 MP','20 MP', N'Chơi game', N'MediaTek Dimensity 8100 Ultra 8 nhân', 8, 128, '5000 mAh', N'Khung kim loại, nhựa & Mặt lưng kính','https://cdn.tgdd.vn/Products/Images/42/279065/xiaomi-12t-thumb-600x600.jpg',0),
('DT16', 'iPhone SE (2022)', 'Apple', 12990000, 'IPS LCD 4.7" Retina HD','iOS', '12 MP','7 MP',N'Chơi game', 'Apple A15 Bionic', 4, 128, '2018 mAh',N'Khung kim loại & Mặt lưng kính', 'https://cdn.tgdd.vn/Products/Images/42/244141/iphone-se-white-600x600.jpg',0),
('DT17', 'Realme 9 Pro+ 5G', 'Realme', 9990000, 'Super AMOLED 6.4" Full HD +', 'Android', N'Chính 50 MP & Phụ 8 MP, 2 MP', '16 MP',N'Chụp ảnh, quay phim', 'MediaTek Dimensity 920 5G', 8, 128, '4500 mAh', N'Khung nhựa & Mặt lưng kính', 'https://cdn.tgdd.vn/Products/Images/42/255513/realme-9-pro-plus-5g-blue-thumb-600x600.jpg',0),
('DT18', 'Samsung Galaxy A53 5G', 'Samsung', 9990000, 'Super AMOLED 6.5" Full HD +', 'Android', N'Chính 64 MP & Phụ 12 MP, 5 MP, 5 MP','32 MP', N'Chụp ảnh, quay phim','Exynos 1280', 8, 128, '5000 mAh', N'Khung & Mặt lưng nhựa','https://cdn.tgdd.vn/Products/Images/42/246196/Samsung-Galaxy-A53-xanh-thumb-600x600.jpg',0),
('DT19', 'Xiaomi Redmi Note 10 Pro', 'Xiaomi', 7090000, 'AMOLED 6.67" Full HD +', 'Android', N'Chính 108 MP & Phụ 8 MP, 5 MP, 2 MP','16 MP', N'Cao cấp, sang trọng, chụp ảnh, quay phim', 'Snapdragon 732G', 8, 128, '5020 mAh',N'Khung kim loại & Mặt lưng kính cường lực' ,'https://cdn.tgdd.vn/Products/Images/42/229228/xiaomi-redmi-note-10-pro-thumb-xam-600x600-600x600.jpg',0),
('DT20', 'Vivo V23e', 'Vivo', 7190000, 'AMOLED 6.44" Full HD +', 'Android', N'Chính 64 MP & Phụ 8 MP, 2 MP','50 MP',N'Chụp ảnh, quay phim', 'MediaTek Helio G96', 8, 128, '4050 mAh', N'Khung nhựa & Mặt lưng kính', 'https://cdn.tgdd.vn/Products/Images/42/245607/Vivo-V23e-1-2-600x600.jpg',0),
('DT21', 'Xiaomi Redmi Note 11 Pro', 'Xiaomi', 7190000, 'AMOLED 6.67" Full HD +', 'Android', N'Chính 108 MP & Phụ 8 MP, 2 MP, 2 MP', '16 MP',N'Chơi game', 'MediaTek Helio G96', 8, 128, '5000 mAh', N'Khung nhựa & Mặt lưng kính','https://cdn.tgdd.vn/Products/Images/42/270471/xiaomi-redmi-note-11-pro-trang-thumb-600x600.jpg',0),
('DT22', 'Samsung Galaxy A33 5G', 'Samsung', 7290000, 'Super AMOLED 6.4" Full HD +','Android', N'Chính 48 MP & Phụ 8 MP, 5 MP, 2 MP','13 MP', N'Chơi game','Exynos 1280', 6, 128, '5000 mAh', N'Khung & Mặt lưng nhựa' ,'https://cdn.tgdd.vn/Products/Images/42/246199/samsung-galaxy-a33-5g-thumb-new-1-600x600.jpg',0),
('DT23', 'Vivo T1 5G', 'Vivo', 7990000, 'AMOLED 6.44" Full HD +','Android', N'Chính 64 MP & Phụ 8 MP, 2 MP','16 MP', N'Chơi game', 'Snapdragon 778G 5G', 8, 128, '4700 mAh',N'Khung & Mặt lưng nhựa Polymer cao cấp', 'https://cdn.tgdd.vn/Products/Images/42/279643/vivo-t1-44w-thumb-600x600.jpg',0),
('DT24', 'Vivo Y53S', 'Vivo', 6990000, 'IPS LCD 6.58" Full HD +','Android', N'Chính 64 MP & Phụ 2 MP, 2 MP', '16 MP',N'Chơi game' ,'MediaTek Helio G80', 8, 128, '5000 mAh',N'Khung & Mặt lưng nhựa Polymer cao cấp'  ,'https://cdn.tgdd.vn/Products/Images/42/240286/vivo-y53s-xanh-600x600.jpg',0),
('DT25', 'OPPO A96', 'Oppo', 6490000, 'IPS LCD 6.59" Full HD +','Android', N'Chính 50 MP & Phụ 2 MP','16 MP',N'Chụp ảnh, quay phim', 'Snapdragon 680', 8, 128, '5000 mAh',N'Khung nhựa & Mặt lưng thuỷ tinh hữu cơ'  ,'https://cdn.tgdd.vn/Products/Images/42/274381/oppo-a96-den-thumb-1-600x600.jpg',0),
('DT26', 'Realme C21-Y', 'Realme', 3690000, 'IPS LCD 6.5" HD +', 'Android', N'Chính 13 MP & Phụ 2 MP, 2 MP', '5 MP',N'Giá rẻ, pin trâu', 'Spreadtrum T610', 3, 32, '5000 mAh',N'Khung & Mặt lưng nhựa', 'https://cdn.tgdd.vn/Products/Images/42/253402/realme-c21-y-blue-600x600.jpg',0),
('DT27', 'Realme C11', 'Realme', 2790000, 'IPS LCD 6.5" HD +','Android', '8 MP','5 MP',N'Giá rẻ, pin trâu', 'Spreadtrum SC9863A', 4, 64, '5000 mAh',N'Khung & Mặt lưng nhựa', 'https://cdn.tgdd.vn/Products/Images/42/236257/realme-c11-2021-blue-1-600x600.jpg',0),
('DT28', 'Nokia C31', 'Nokia', 2790000, 'TFT LCD 6.7" HD +', 'Android', N'Chính 13 MP & Phụ 2 MP, 2 MP','5 MP',N'Giá rẻ, pin trâu', 'Unisoc SC9863A1', 3, 32, '5050 mAh',N'Khung & Mặt lưng nhựa Polycarbonate', 'https://cdn.tgdd.vn/Products/Images/42/292717/Nokia-C31-Green-thumb-600x600.jpg',0),
('DT29', 'Nokia G10', 'Nokia', 2990000, 'TFT LCD 6.5" HD +','Android', N'Chính 13 MP & Phụ 2 MP, 2 MP','8 MP', N'Giá rẻ, pin trâu','MediaTek Helio G25', 4, 64, '5050 mAh',N'Khung kim loại & Mặt lưng nhựa', 'https://cdn.tgdd.vn/Products/Images/42/235995/Nokia%20g10%20xanh%20duong-600x600.jpg',0),
('DT30', 'Nokia G21', 'Nokia', 3890000, 'TFT LCD 6.5" HD +','Android', N'Chính 50 MP & Phụ 2 MP, 2 MP','8 MP', N'Giá rẻ, pin trâu','Unisoc T606', 4, 128, '5050 mAh',N'Khung kim loại & Mặt lưng nhựa', 'https://cdn.tgdd.vn/Products/Images/42/270207/nokia-g21-xanh-thumb-600x600.jpg',0),
('DT31', 'iPhone 14 Pro Max 1TB', 'Apple', 49990000, 'OLED 6.7" Super Retina XDR', 'iOS', N'Chính 48 MP & Phụ 12 MP, 12 MP', '12 MP',N'Cao cấp, sang trọng, chụp ảnh, quay phim', 'Apple A16 Bionic', 6, 1024, '4323 mAh',N'Khung thép không gỉ & Mặt lưng kính cường lực','https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-vang-thumb-600x600.jpg',0),
('DT32', 'Xiaomi Redmi 10A', 'Xiaomi', 2490000, 'IPS LCD 6.53" HD +', 'Android', N'Chính 13 MP & Phụ 2 MP', '5 MP', N'Giá rẻ, pin trâu','MediaTek Helio G25', 2, 32, '5000 mAh',N'Khung & Mặt lưng nhựa','https://cdn.tgdd.vn/Products/Images/42/271734/xiaomi-redmi-10a-thumb-600x600.jpg',0),
('DT33', 'Xiaomi Redmi 9A', 'Xiaomi', 2290000, 'IPS LCD 6.53" HD +', 'Android', '13 MP', '5 MP', N'Giá rẻ, pin trâu','MediaTek Helio G25', 2, 32, '5000 mAh',N'Khung & Mặt lưng nhựa', 'https://cdn.tgdd.vn/Products/Images/42/218734/xiaomi-redmi-9a-xanhla-600x600-200x200.jpg',0),
('DT34', 'Xiaomi 11T Pro 5G', 'Xiaomi', 14390000, 'AMOLED 6.67" Full HD +', 'Android', 'Chính 108 MP & Phụ 8 MP, 5 MP', '16 MP',N'Chơi game, chụp ảnh, quay phim' ,'Snapdragon 888', 12, 256, '5000 mAh',N'Khung kim loại & Mặt lưng kính', 'https://cdn.tgdd.vn/Products/Images/42/248218/Xiaomi-11T-Pro-Blue-1-2-600x600.jpg',0),
('DT35', 'Samsung Galaxy S22 Ultra 512 GB', 'Samsung', 29990000, 'Dynamic AMOLED 2X 6.8" Quad HD + (2K +)', 'Android', N'Chính 108 MP & Phụ 12 MP, 10 MP, 10 MP', '40 MP',N'Chụp ảnh, quay phim, cao cấp, sang trọng', 'Snapdragon 8 Gen 1', 12, 512, '5000 mAh',N'Khung kim loại & Mặt lưng kính', 'https://cdn.tgdd.vn/Products/Images/42/271698/Galaxy-S22-Ultra-White-600x600.jpg',0),
('DT36', 'Samsung Galaxy M53', 'Samsung', 11990000, 'Super AMOLED Plus 6.7" Full HD +', 'Android', N'Chính 108 MP & Phụ 8 MP, 2 MP, 2 MP', '32 MP', N'Chơi game' ,'MediaTek Dimensity 900 5G', 8, 256, '5000 mAh', N'Khung kim loại & Mặt lưng nhựa' ,'https://cdn.tgdd.vn/Products/Images/42/247364/samsung-galaxy-m53-nau-thumb-600x600.jpg',0),
('DT37', 'Xiaomi 11 Lite 5G NE', 'Xiaomi', 8490000, 'AMOLED 6.55" Full HD +', 'Android', N'Chính 64 MP & Phụ 8 MP, 5 MP', '20 MP', N'Cao cấp, sang trọng','Snapdragon 778G 5G' , 8, 128, '4250 mAh',N'Khung kim loại & Mặt lưng kính cường lực Gorilla Glass 5','https://cdn.tgdd.vn/Products/Images/42/249427/xiaomi-11-lite-5g-ne-white-600x600.jpg',0),
('DT38', 'Xiaomi Redmi 9C', 'Xiaomi', 3290000, 'IPS LCD 6.53" HD +', 'Android', N'Chính 13 MP & Phụ 2 MP, 2 MP', '5 MP',N'Giá rẻ, pin trâu', 'MediaTek Helio G35', 4, 128, '5000 mAh',N'Khung & Mặt lưng nhựa' ,'https://cdn.tgdd.vn/Products/Images/42/246937/xiaomi-redmi-9c-4gb-xanh-1-600x600.jpg',0),
('DT39', 'iPhone 14 256 GB', 'Apple', 24990000, 'OLED 6.1" Super Retina XDR', 'iOS', '2 camera 12 MP', '12 MP', N'Cao cấp, sang trọng, chụp ảnh, quay phim','Apple A15 Bionic', 6, 256, '3279 mAh', N'Khung nhôm & Mặt lưng kính cường lực','https://cdn.tgdd.vn/Products/Images/42/240259/iPhone-14-thumb-tim-1-600x600.jpg',0),
('DT40', 'iPhone 14 Plus 256 GB', 'Apple', 27990000, 'OLED 6.7" Super Retina XDR', 'iOS', '2 camera 12 MP', '12 MP', N'Cao cấp, sang trọng, chụp ảnh, quay phim','Apple A15 Bionic', 6, 256, '4325 mAh',N'Khung nhôm & Mặt lưng kính cường lực', 'https://cdn.tgdd.vn/Products/Images/42/245545/iPhone-14-plus-thumb-den-600x600.jpg',0),
('DT41', 'Samsung Galaxy Z Fold3 5G', 'Samsung', 31990000, 'Dynamic AMOLED 2X Chính 7.6" & Phụ 6.2" Full HD+', 'Android', '3 camera 12 MP', '10 MP & 4 MP',N'Màn hình gập, cao cấp, sang trọng, chụp ảnh, quay phim', 'Snapdragon 888', 12, 512, '4400 mAh',N'Khung nhôm & Mặt lưng kính cường lực', 'https://cdn.tgdd.vn/Products/Images/42/226935/samsung-galaxy-z-fold-3-silver-1-600x600.jpg',0),
('DT42', 'iPhone 13 mini 512 GB', 'Apple', 22490000, 'OLED 5.4" Super Retina XDR', 'iOS', '2 camera 12 MP', '12 MP', N'Cao cấp, sang trọng, chơi game', 'Apple A15 Bionic', 4, 512, '2438 mAh',N'Khung nhôm & Mặt lưng kính cường lực', 'https://cdn.tgdd.vn/Products/Images/42/236780/iphone-13-mini-midnight-1-600x600.jpg',0),
('DT43', 'iPhone 13 512 GB', 'Apple', 25990000, 'OLED 6.1" Super Retina XDR', 'iOS', '2 camera 12 MP', '12 MP', N'Cao cấp, sang trọng, chụp ảnh, quay phim','Apple A15 Bionic', 4, 512, '3240 mAh',N'Khung nhôm & Mặt lưng kính cường lực' ,'https://cdn.tgdd.vn/Products/Images/42/223602/iphone-13-starlight-1-600x600.jpg',0),
('DT44', 'OPPO A17', 'Oppo', 3790000, 'IPS LCD 6.56" HD +', 'Android', N'Chính 50 MP & Phụ 0.3 MP', '5 MP',N'Giá rẻ, pin trâu', 'MediaTek Helio G35', 4, 64, '5000 mAh',N'Khung nhựa & Mặt lưng thuỷ tinh hữu cơ', 'https://cdn.tgdd.vn/Products/Images/42/288401/oppo-a17-den-thumb-600x600.jpg',0),
('DT45', 'Samsung Galaxy A04', 'Samsung', 2790000, 'IPS LCD 6.5" HD +', 'Android', N'Chính 50 MP & Phụ 2 MP', '5 MP', N'Giá rẻ, pin trâu','MediaTek Helio P35', 3, 32, '5000 mAh',N'Khung & Mặt lưng nhựa', 'https://cdn.tgdd.vn/Products/Images/42/275434/samsung-galaxy-a04-thumb-1-600x600.jpg',0),
('DT46', 'Realme C33', 'Realme', 3690000, 'IPS LCD 6.5" HD +', 'Android', N'Chính 50 MP & Phụ 0.3 MP', '5 MP',N'Giá rẻ, pin trâu', 'Unisoc Tiger T612', 4, 64, '5000 mAh',N'Khung nhựa & Mặt lưng thuỷ tinh hữu cơ', 'https://cdn.tgdd.vn/Products/Images/42/292247/realme-c33-thumb-600x600-1-600x600.jpg',0),
('DT47', 'Realme C30s', 'Realme', 2990000, 'IPS LCD 6.5" HD +', 'Android', '8 MP', '5 MP', N'Giá rẻ, pin trâu', 'Unisoc SC9863A1', 4, 64, '5000 mAh', N'Khung nhựa, kim loại & Mặt lưng nhựa','https://cdn.tgdd.vn/Products/Images/42/290877/Realme-c30s-xanh-temp-600x600.jpg',0),
('DT48', 'Nokia G11 Plus', 'Nokia', 3140000, 'TFT LCD 6.51" HD +', 'Android', N'Chính 50 MP & Phụ 2 MP', '8 MP',N'Giá rẻ, pin trâu', 'Unisoc T606', 3, 64, '5050 mAh',N'Khung kim loại & Mặt lưng nhựa', 'https://cdn.tgdd.vn/comment/52810818/nokia-g11-plus-xam-thumb-600x600U6ODF.jpg',0),
('DT49', 'Vivo Y16', 'Vivo', 3790000, 'IPS LCD 6.51" HD +', 'Android', N'Chính 13 MP & Phụ 2 MP', '5 MP', N'Giá rẻ, pin trâu','MediaTek Helio P35', 4, 64, '5000 mAh',N'Khung & Mặt lưng nhựa Polymer cao cấp', 'https://cdn.tgdd.vn/Products/Images/42/262004/xiaomi-redmi-10-2022-xanh-thumb-600x600.jpg',0),
('DT50', 'Nokia C21 Plus', 'Nokia', 2790000, 'TFT LCD 6.5" HD +', 'Android', N'Chính 13 MP & Phụ 2 MP', '5 MP', N'Giá rẻ, pin trâu','Spreadtrum SC9863A', 3, 64, '5050 mAh',N'Khung hợp kim nhôm & Mặt lưng nhựa', 'https://cdn.tgdd.vn/Products/Images/42/274084/Nokia-C21-Plus-Gray-600x600.jpg',0),
('DT51', 'Masstel Lux 20 4G', 'Masstel', 850000, N'TFT LCD 2.4", 16.7 triệu màu', N'Điện thoại phổ thông', N'Không', 'Không', N'Nghe gọi','Unisoc T107', 0.048,  0.128, '1800 mAh',N'Khung & Mặt lưng nhựa', 'https://cdn.tgdd.vn/Products/Images/42/285027/masstel-lux-20-xanh-thumb-600x600.jpeg',0),
('DT52', 'Mobell M239', 'Mobell', 500000, N'TFT LCD 1.77", 65.000 màu', N'Điện thoại phổ thông', N'8 MP', N'Không', N'Nghe gọi','Unisoc UMS9117-L', 0.048,  0.128, '1000 mAh',N'Khung & Mặt lưng nhựa', 'https://cdn.tgdd.vn/Products/Images/42/284122/mobell-m239-do-thumb-1-600x600.jpg',0),
('DT53', 'Masstel Lux 10 4G', 'Masstel', 750000, N'TFT LCD 2.4", 16.7 triệu màu', N'Điện thoại phổ thông', N'Không' , 'Không', N'Nghe gọi','Unisoc T107', 0.048,  0.128, '1400 mAh',N'Khung & Mặt lưng nhựa', 'https://cdn.tgdd.vn/Products/Images/42/299611/masstel-lux-10-vang-thumb-600x600.jpg',0),
('DT54', 'Masstel FAMI 60 4G', 'Masstel', 800000, N'TFT LCD 2", 260.000 màu ', N'Điện thoại phổ thông', N'Không', 'Không', N'Nghe gọi','Unisoc UIS8910', 0.016,  0.024, '2000 mAh',N'Khung kim loại & Mặt lưng nhựa', 'https://cdn.tgdd.vn/Products/Images/42/264121/masstel-fami-60-thumb-600x600.jpeg',0),
('DT55', 'Nokia 110 4G', 'Nokia', 870000, N'TFT LCD 1.8", 65.536 màu', N'Điện thoại phổ thông', N'0.08 MP', 'Không', N'Nghe gọi','Unisoc T107', 0.048,  0.128, '1020 mAh',N'Khung & Mặt lưng nhựa', 'https://cdn.tgdd.vn/Products/Images/42/240196/nokia-110-4g-blue-600x600.jpg',0),
('DT56', 'Nokia 105 4G', 'Nokia', 820000, N'TFT LCD 1.8", 65.536 màu', N'Điện thoại phổ thông', N'Không', 'Không', N'Nghe gọi','Unisoc T107', 0.048,  0.128, '1020 mAh',N'Khung & Mặt lưng nhựa', 'https://cdn.tgdd.vn/Products/Images/42/240194/nokia-105-4g-blue-600x600.jpg',0),
('DT57', 'Itel it9210 4G', 'Itel', 680000, N'LCD 2.4", 256.000 màu', N'Điện thoại phổ thông', N'0.3 MP', 'Không', N'Nghe gọi','Unisoc T117', 0.064,  0.128, '1900 mAh',N'Khung & Mặt lưng nhựa', 'https://cdn.tgdd.vn/Products/Images/42/260146/itel-it9210-black-1-600x600.jpg',0),
('DT58', 'Itel it9010 4G', 'Itel', 580000, N'LCD 1.77", 256.000 màu ', N'Điện thoại phổ thông', N'0.08 MP', 'Không', N'Nghe gọi','Không có thông tin', 0.048,  0.128, '1000 mAh',N'Khung & Mặt lưng nhựa', 'https://cdn.tgdd.vn/Products/Images/42/279401/itel-it9010-thumb-1-2-600x600.jpg',0),
('DT59', 'Masstel IZI 26 4G', 'Masstel', 630000, N'TFT LCD 2.4", 262.000 màu', N'Điện thoại phổ thông', N'Không', 'Không', N'Nghe gọi','Unisoc T107', 0.048,  0.128, '1800 mAh',N'Khung & Mặt lưng nhựa', 'https://cdn.tgdd.vn/Products/Images/42/299610/masstel-izi-26-4g-thum-600x600.jpg',0),
('DT60', 'Nokia 8210 4G', 'Nokia', 1590000, N'QVGA 2.8"', N'Điện thoại phổ thông', N'0.3 MP', 'Không', N'Nghe gọi','Unisoc T107', 0.048,  0.128, '1450 mAh',N'Khung & Mặt lưng nhựa Polycarbonate', 'https://cdn.tgdd.vn/Products/Images/42/286060/Nokia%208210-xanh-thumb-600x600.jpg',0)
--Insert laptops
INSERT LAPTOP(ID, Ten, Hang, Gia, ManHinh, OS, Webcam, NhuCau, Chip, VGA, Ram, Rom, Pin, KhoiLuong, CongGiaoTiep, ThietKe, ImagePath, SaoTrungBinh) VALUES ('LT01', N'Nitro 5 Tiger AN515 58 769J', N'Acer', CAST(30990000.00 AS Decimal(18, 2)), N'15.6 inch FHD(1920 x 1080) IPS 144Hz SlimBezel', N'Windows 11 Home', N'720p HD audio/video recording', N'Gaming, Văn phòng, Đồ họa - Kỹ thuật', N'Intel Core i7-12700H up to 4.7GHz, 24MB Cache', N'NVIDIA® GeForce RTX™ 3050 4GB GDDR6', 8, 512, N'4 Cell 57.5WHr', 2.5, N'1x USB 3.2 Gen 2 Type-C Ports ; DisplayPort over USB-C; Thunderbolt 4; USB charging 5 V; 3 A; DC-in port 20 V; 65 W);1x USB 3.2 Gen 2 port featuring power-off USB charging;1x USB 3.2 Gen 2 port;1x USB 3.2 Gen 1 por', N'nhựa Polycarbonate với màu Obsidian Black', N'https://product.hstatic.net/1000026716/product/fe2769ba0040c59929f58641d85409_master_1b48676e034340379d49fab4078b5949_1c6ae60d0b2f422eafc29e6bab219a13.png',0),
 ('LT02', N'Aspire 5 A514 54 5127', N'Acer', CAST(18490000.00 AS Decimal(18, 2)), N'14" FHD (+A3:E41920 x 1080) IPS, Acer ComfyView LCD', N'Windows 11 Home', N'HD Camera', N'Văn phòng', N'Intel Core i5-1135G7 2.4GHz up to 4.2GHz 8MB', N'Intel® Iris® Xe Graphics', 8, 512, N'3 Cell 48WHrs', 1.45, N'1x USB 3.2 port with power-off charging;2x USB 3.2 port;1x USB Type-C port;1x RJ-45 port;1x HDMI® 2.0', N'Vỏ nhựa - nắp lưng bằng kim loại', N'https://product.hstatic.net/1000026716/product/laptop-acer-aspire-5-a514-54-5127-1_b245f3377c9b4339aad8148a99d67e08.jpg', 0),
 ('LT03', N'Nitro 5 Tiger AN515 58 773Y', N'Acer', CAST(32990000.00 AS Decimal(18, 2)), N'15.6 inch FHD(1920 x 1080) IPS 144Hz SlimBezel', N'Windows 11 Home', N'720p HD audio/video recording', N'Gaming, Văn phòng, Đồ họa - Kỹ thuật', N'Intel Core i7-12700H up to 4.7GHz, 24MB Cache', N'NVIDIA® GeForce RTX™ 3050Ti 4GB GDDR6', 8, 512, N'4 Cell 57.5WHr', 2.5, N'1x USB 3.2 Gen 2 Type-C Ports ;1x USB 3.2 Gen 2 port featuring power-off USB charging;1x USB 3.2 Gen 2 port;1x USB 3.2 Gen 1 port;1x Ethernet (RJ-45) port', N'nhựa Polycarbonate với màu Obsidian Black', N'https://product.hstatic.net/1000026716/product/-tiger-an515-58-52sp-i5-12500h_21eec226f57c41a7865fdc18004a57c8_master_f56fd9b017244342821d65c8c49efe28.png',0),

 ('LT04', N'Nitro 5 Tiger AN515 58 52SP', N'Acer', CAST(27990000.00 AS Decimal(18, 2)), N'15.6 inch FHD(1920 x 1080) IPS 144Hz SlimBezel', N'Windows 11 Home', N'HD Webcam', N'Gaming, Văn phòng, Đồ họa - Kỹ thuật', N'Intel Core i5-12500H 3.3GHz up to 4.5GHz 18MB', N'NVIDIA® GeForce RTX™ 3050 4GB GDDR6', 8, 512, N'4 Cell 57.5WHr', 2.5, N'1x USB 3.2 Gen 2 Type-C Ports ;1x USB 3.2 Gen 2 port featuring power-off USB charging;1x USB 3.2 Gen 2 port;1x USB 3.2 Gen 1 port; support;1x 3.5 mm headphone/speaker jack;1x DC-in jack for AC adapter', N'nhựa Polycarbonate với màu Obsidian Black', N'https://product.hstatic.net/1000026716/product/gearvn-may-tinh-xach-tay-acer-nitro-5-an515-58-52sp-1_5358676a1607457184a6512bf81855a5.jpg',0),
 ('LT05', N'Pavilion 15 EG2036TX 6K782PA', N'HP', CAST(20590000.00 AS Decimal(18, 2)), N'15.6 inch FHD (1920 x 1080) IPS, micro-edge, BrightView, 250 nits, 45% NTSC', N'Windows 11 Home', N'HP Wide Vision 720p HD camera with temporal noise reduction and integrated dual array digital microphones', N'Văn phòng', N'Intel Core i5-1235U 1.3GHz up to 4.4GHz 12MB', N'NVIDIA GeForce MX550 2GB GDDR6 + Intel Iris Xe Graphics', 8, 512, N'3 Cell 43WHr', 1.74, N'1x SuperSpeed USB Type-C 10Gbps signaling rate (USB Power Delivery, DisplayPort 1.4, HP Sleep and Charge);2x SuperSpeed USB Type-A 5Gbps signaling rate;1x HDMI 2.1;1x AC smart pin;1x headphone/microphone combo', N'Vỏ nhựa - chiếu nghỉ tay bằng kim loại', N'https://product.hstatic.net/1000026716/product/c08149750_c308606069b64efe8d3c8f92a0594635.png',0),

 ('LT06', N'Pavilion 15 EG0513TU 46M12PA', N'HP', CAST(14190000.00 AS Decimal(18, 2)), N'15.6" FHD (1920 x 1080) IPS, micro-edge, BrightView, 250 nits, 45% NTSC', N'Windows 11', N'HP Wide Vision HD Camera', N'Văn phòng', N'Intel Core i3-1125G4 2.0GHz up to 3.7G+A6:H7Hz 8MB', N'Intel UHD Graphics', 4, 256, N'3 Cell 41WHr', 1.75, N'1x SuperSpeed USB Type-C® 10Gbps signaling rate (USB Power Delivery, DisplayPort™ 1.4, HP Sleep and Charge);2x SuperSpeed USB Type-A 5Gbps signaling rate;1x HDMI 2.0;1x AC smart pin;1x headphone/microphone combo', N'Vỏ nhựa - chiếu nghỉ tay bằng kim loại', N'https://product.hstatic.net/1000026716/product/laptop-hp-pavilion-15-eg0513tu-46m12pa-1_90e2f9d4f4754af2a064884081026ffb.jpg',0),

 ('LT07', N'Pavilion 15 EG0506TX 46M05PA', N'HP', CAST(19990000.00 AS Decimal(18, 2)), N'15.6" FHD (1920 x 1080) IPS, micro-edge, BrightView, 250 nits, 45% NTSC', N'Windows 11', N'HP Wide Vision HD Camera', N'Văn phòng', N'Intel Core i5-1135G7 2.4GHz up to 4.2GHz 8MB', N'NVIDIA GeForce MX450 2GB GDDR5 + Intel Iris Xe Graphics', 8, 512, N'3 Cell 41WHr', 1.75, N'1x SuperSpeed USB Type-C® 10Gbps signaling rate (USB Power Delivery, DisplayPort™ 1.4, HP Sleep and Charge);2x SuperSpeed USB Type-A 5Gbps signaling rate;1x HDMI 2.0;1x AC smart pin;1xheadphone/microphone combo', N'Vỏ nhựa - chiếu nghỉ tay bằng kim loại', N'https://product.hstatic.net/1000026716/product/laptop-hp-pavilion-15-eg0506tx-46m05pa-1_a04f18486f014aa38e272a7d85460bda.jpg',0),

 ('LT08', N'ProBook 450 G8 614K3PA', N'HP', CAST(20990000.00 AS Decimal(18, 2)), N'15.6" FHD (1920 x 1080) Diagonal IPS Anti-Glare WLED-Backlit, 45% NTSC, 250nits', N'Windows 11 Home', N'720p HD Camera', N'Văn phòng', N'Intel Core i5-1135G7 2.4GHz up to 4.2GHz 8MB', N'Intel Iris Xᵉ Graphics', 8, 512, N'3 Cell 45WHr', 1.74, N'1x USB 3.1 Gen 2 Type-C port;3x USB 3.1 Gen 1 Type-A ports (1 Charging, 1 Powered port);1x HDMI 1.4b;1x RJ-45 (Ethernet) port;1xHeadphone/microphone combo jack;1x AC power port;FingerPrint', N'Vỏ nhựa với màu Silver', N'https://product.hstatic.net/1000026716/product/laptop-hp-probook-450-g8-614k3pa-3_94b16d64e78f4fef96ccb69c2a8b7bd4.jpg',0),

 ('LT09', N'MacBook Pro 14 M1 Pro 2021', N'MacBook', CAST(53990000.00 AS Decimal(18, 2)), N'14.2"Liquid Retina XDR display (3024 x 1964)120Hz', N'Mac OS', N'1080p FaceTime HD camera', N'Văn phòng, Đồ họa - Kỹ thuật', N'Apple M1 Pro200GB/s', N'Apple M1 Card tích hợp 14 nhân GPU', 16, 512, N'70 WHr', 1.6, N'Jack tai nghe 3.5 mm;3 x Thunderbolt 4 USB-C;HDMI', N'Vỏ kim loại nguyên khối', N'https://cdn.tgdd.vn/Products/Images/44/253581/macbook-pro-14-m1-pro-2021-bac-2.jpg',0),
 
 ('LT10', N'XPS 15 9520 70295790', N'DELL', CAST(79990000.00 AS Decimal(18, 2)), N'15.6" inch, 3.5K QHD+ (3456 x 2160), OLED, touch-screen, 400 nit, Anti-reflective', N'Windows 11 Home', N'HD camera', N'Văn phòng, Đồ họa - Kỹ thuật', N'Intel Core i9-12900HK 3.8GHz up to 5.0GHz 18MB, 14 nhân, 20 luồng, 24 MB Intel Smart Cache', N'NVIDIA GeForce RTX 3050Ti 4GB GDDR6', 16, 512, N'6 Cell 86Whrs', 1.96, N'2x Thunderbolt 4 (USB Type-C with DisplayPort and Power Delivery);1 x USB 3.2 Gen 2 (Type-C) Port with DisplayPort;1 x 3.5mm headphone/microphone combo jack;1x SD-card Slot', N'Vỏ kim loại nguyên khối ', N'https://product.hstatic.net/1000026716/product/gearvn-laptop-dell-xps-15-9520-70295790-4_91711590f56c486da86d071f8c5e734b.png',0),

 ('LT11', N'ProArt Studiobook Pro 16 OLED W7600Z3A L2048W', N'Asus', CAST(82990000.00 AS Decimal(18, 2)), N'16” 4K (3840 x 2400) OLED 16:10, 0.2ms response time, 550nits, 100% DCI-P3, PANTONE Validated, Glossy display, 70% less harmful blue light', N'Windows 11 Home', N'HD camera with IR function to support Windows Hello with privacy shutter', N'Văn phòng, Đồ họa - Kỹ thuật', N'Intel Core i9-12900H 2.5GHz up to 5.0GHz 24MB', N'NVIDIA® RTX™ A3000 12GB GDDR6', 32, 1024, N'4 Cell 90WHrs', 2.4, N'2x Thunderbolt™ 4 supports display / power delivery;2x USB 3.2 Gen 2 Type-A;1x HDMI 2.1;1x 3.5mm Combo Audio Jack;1x RJ45 Gigabit Ethernet;1x DC-in
FingerPrint', N'Vỏ nhôm với màu Mineral Black Aluminum', N'https://product.hstatic.net/1000026716/product/gearvn-laptop-asus-proart-studiobook-pro-16-oled-w7600z3a-l2048w-2_508bb1962f1043c78f040f9e4d8d500d.png',0),
 ('LT12', N'Creator M16 A12UC 291VN', N'MSI', CAST(36990000.00 AS Decimal(18, 2)), N'16 inch QHD+ (2560 x 1600), IPS 60Hz, DCI-P3 100% typical, 500nits', N'Windows 10 Home', N'HD type (30fps@720p)', N'Văn phòng, Đồ họa - Kỹ thuật', N'Intel Core i7-12700H 3.5GHz up to 4.7GHz 24M, 14 nhân 20 luồng', N'NVIDIA GeForce RTX 3050 4GB GDDR6 Up to 1450MHz Boost Clock, 60W Maximum Graphics Power', 16, 512, N'3 Cell 53.5WHr', 2.2, N'1x Type-C USB 3.2 Gen1;2x Type-A USB 3.2 Gen1;1x Type-A USB 2.0;1x RJ45;1x (4K @ 60Hz) HDMI;1x Mic-in/Headphone-out Combo Jack', N'
Vỏ kim loại với màu Core Black', N'https://product.hstatic.net/1000026716/product/gearvn-laptop-msi-creator-m16-a12uc-291vn-3_1fe3ee20a3504cc0b600b0af46de94a9.png',0),

 ('LT13', N'AERO 16 XE5 73VN938AH', N'GIGABYTE', CAST(82990000.00 AS Decimal(18, 2)), N'15.6" UHD+ (3840x2400) Samsung AMOLED Display (VESA DisplayHDR 500 True Black, 100% DCI-P3)', N'Windows 10 Home', N'HD Camera', N'Văn phòng, Đồ họa - Kỹ thuật', N'Intel Core i7-12700H 3.6GHz up to 4.9GHz 25MB', N'NVIDIA® GeForce RTX™ 3070 Ti 8GB GDDR6 Boost Clock 1035 MHz / Maximum Graphics Power 105 W', 16, 2048, N'4 Cell 99 WHrs', 2.3, N'2x Thunderbolt™ 4 Support DP / one port support PD in 100W;1x USB 3.2 Gen2 (Type-C) Support DP;1x 3.5mm Audio Combo;1x DC-in Jack
Fingerprint', N'Vỏ hợp kim nhôm CNC', N'https://product.hstatic.net/1000026716/product/ero-16-xe5-73vn938ah-i7-12700h_79752fe99fec47c29314f3bf7a6092fd_master_f8b3314ef39f4e7ab2a90e30bf4e1611.png',0),

 ('LT14', N'Zenbook 17 Fold OLED UX9702AA MD014W', N'Asus', CAST(89990000.00 AS Decimal(18, 2)), N'17.3" 2.5K Tỷ lệ khung hình 4:3 (2560 x 1920) FOLED, 0,2 ms, 60Hz, Độ sáng tối đa 500 nit, DCI-P3 100%, Màn hình HDR True Black 500 VESA, PANTONE Validated, Glossy-Touch Screen', N'Windows 11 Home', N'Camera 5.0 IR with Windows Hello support', N'Văn phòng', N'CPU Intel® Core™ i7-1250U 1.1 GHz (12M Cache, lên đến 4.7 GHz, 2P+8E nhân)', N'Intel® Iris Xe Graphics', 16, 1024, N'75WHrs, 4S1P, 4-cell Li-ion', 1.5, N'2x Thunderbolt™ 4 supports display / power delivery;1x 3.5mm Combo Audio Jack', N'Nhôm - Magie', N'https://product.hstatic.net/1000026716/product/gearvn-laptop-asus-zenbook-17-fold-oled-ux9702aa-md014w-6_52a1234494484ec3ae4ec1564cdd9ca9.png',0),

 ('LT15', N'Vivobook 15X OLED A1503ZA L1151W', N'Asus', CAST(16990000.00 AS Decimal(18, 2)), N'15.6" FHD (1920 x 1080) OLED 16:9 aspect ratio, 0.2ms response time, 600nits peak brightness, 100% DCI-P3 color gamut, Contrast ratio: 1,000,000:1, VESA CERTIFIED Display HDR True Black 600, 1.07 billion colors, PANTONE Validated, Glossy display, 70%', N'Windows 11 Home', N'720p HD camera With privacy shutter', N'Văn phòng', N'Intel® Core™ i3-1220P Processor 1.1 GHz (12M Cache, up to 4.4 GHz, 10 cores)', N'Intel Iris Xe Graphics (with dual channel memory)
Intel® UHD Graphics (with single channel memory)', 8, 256, N'70WHrs, 3S1P, 3-cell Li-ion', 1.7, N'1x USB 2.0 Type-A;1 x USB 3.2 Gen 1 Type-C;2 x USB 3.2 Gen 1 Type-A;1 x HDMI 1.4;1 x 3.5mm Combo Audio Jack;1 x DC-in', N'nhựa Polycarbonate với màu Silver', N'https://product.hstatic.net/1000026716/product/gearvn-laptop-asus-vivobook-15x-oled-a1503za-l1151w-3_928974d7fc484bb3ad21e71a69770c9e.png',0),

 ('LT16', N'TUF A15 FA506ICB HN355W', N'Asus', CAST(21990000.00 AS Decimal(18, 2)), N'15.6inch FHD (1920 x 1080) IPS, 144Hz, Wide View, 250nits, Narrow Bezel, Non-Glare with 45% NTSC, 63% sRGB', N'Windows 11 Home', N'HD 720p CMOS module', N'Gaming, Văn phòng, Đồ họa - Kỹ thuật', N'AMD Ryzen 5 4600H 3.0GHz up to 4.0GHz 11MB, 6-core/ 12-thread', N'NVIDIA® GeForce RTX™ 3050 Laptop GPU 4GB GDDR6, up to 1600Mhz at 60W ( 75W with Dynamic Boost)', 8, 512, N'3 Cell 48WHr', 2.3, N'1x RJ45 LAN port;3x USB 3.2 Gen 1 Type-A;1x USB 3.2 Gen 1 Type-C support DisplayPort™;1x HDMI 2.0b;1x 3.5mm Combo Audio Jack', N'nhựa Polycarbonate với màu Graphite Black', N'https://product.hstatic.net/1000026716/product/gearvn-laptop-gaming-asus-tuf-a15-fa506icb-hn355w-3_15619a8e70154af9a530b93612377087.png',0),

 ('LT17', N'ROG Zephyrus G14 GA402RJ L8030W', N'Asus', CAST(53000000.00 AS Decimal(18, 2)), N'14" WQXGA (2560 x 1600) 16:10, IPS, 120Hz, 3ms, DCI-P3: 100%, Pantone Validated, anti-glare display, 500nits, Adaptive-Sync, Dolby vision', N'Windows 11 Home', N'720P HD IR Camera for Windows Hello', N'Gaming, Văn phòng, Đồ họa - Kỹ thuật', N'AMD Ryzen™ 7 6800HS 3.2GHz up to 4.7GHz 16MB', N'AMD Radeon™ RX 6700S 8GB GDDR6 With ROG Boost: up to 100W (SmartShift)', 16, 1024, N'4 Cell 76WHr', 1.6, N'1x USB 3.2 Gen 2 Type-C support DisplayPort™ / power delivery;1x USB 3.2 Gen 2 Type-C support DisplayPort™;2x USB 3.2 Gen 2 Type-A;1x 3.5mm Combo Audio Jack;1x HDMI 2.0b', N'nhựa Polycarbonate với màu Eclipse Gray', N'https://product.hstatic.net/1000026716/product/laptop-gaming-asus-rog-zephyrus-g14-ga402rj-l8030w-3_c357d3e823fc45d588f737466ea12a99.jpg',0),

 ('LT18', N'Legion 5 15ARH7H 82RE0036VN', N'Lenovo', CAST(43990000.00 AS Decimal(18, 2)), N'15.6" FHD (1920x1080) IPS 300nits Anti-glare, 165Hz, 100% sRGB, Dolby Vision, FreeSync, G-SYNC, DC dimmer', N'Windows 11 Home', N'FHD 1080p with E-camera Shutter', N'Gaming, Văn phòng, Đồ họa - Kỹ thuật', N'AMD Ryzen 7 6800H (8C / 16T, 3.2 / 4.7GHz, 4MB L2 / 16MB L3)', N'NVIDIA GeForce RTX 3050 Ti 4GB GDDR6, Boost Clock 1695MHz, TGP 95W', 16, 512, N'4Cell, 80WHrs', 2.35, N'2x USB 3.2 Gen 1;1x USB 3.2 Gen 1 ;2x USB-C 3.2 Gen 2 ;1x USB-C 3.2 Gen 2 ;1x HDMI, up to 8K/60Hz;1x Ethernet (RJ-45);1x Headphone / microphone combo jack (3.5mm);1x Power connector', N'Vỏ nhôm với màu Storm Grey', N'https://product.hstatic.net/1000026716/product/gearvn-laptop-gaming-lenovo-legion-5-15arh7h-82re0036vn-2_31fa28653a894ef793592b24e5c8b7d8.png',0),

 ('LT19', N'ThinkBook 13S G3 ACN 20YA003CVN', N'Lenovo', CAST(22490000.00 AS Decimal(18, 2)), N'13.3inch WUXGA (1920x1200) IPS 300nits Anti-glare, 100% sRGB, Dolby Vision', N'Windows 11 Home', N'720p with Privacy Shutter', N' Văn phòng', N'AMD Ryzen 5 5600U (6C / 12T, 2.3 / 4.2GHz, 3MB L2 / 16MB L3)', N'AMD Radeon Graphics', 8, 512, N'2cells 56Wh', 1.26, N'1x USB 3.2 Gen 1;1x USB 3.2 Gen 1 (Always On);1x USB-C 3.2 Gen 2 (support data transfer, Power Delivery 3.0, and DisplayPort 1.4);1x HDMI 2.0b;1x Headphone/microphone combo jack (3.5mm)', N'Vỏ nhôm với màu Mineral Grey ', N'https://product.hstatic.net/1000026716/product/gearvn-laptop-lenovo-thinkbook-13s-g3-acn-20ya003cvn-2_58ceaecf31aa44d195d14f8ebf6e5d35.png',0),

 ('LT20', N'IdeaPad 5 Pro 14ITL6 82L300M9VN', N'Lenovo', CAST(22990000.00 AS Decimal(18, 2)), N'14" 2.2K (2240x1400) IPS 300nits Anti-glare, 60Hz, 100% sRGB', N'Windows 11 Home', N'IR & HD 720p + ToF Sensor', N' Văn phòng', N'Intel Core i5-1135G7 2.5GHz up to 4.2GHz, 4 Cores 8 Threads ,8MB', N'Intel Iris Xe Graphics ', 8, 512, N'3 Cells 56.5WHrs', 1.38, N'1x USB 3.2 Gen 1;1x USB 3.2 Gen 1 ;1x USB-C 3.2 Gen 1 ;1x USB-C 3.2 Gen 1 ;1x HDMI 1.4b;1x Card reader;1x Headphone / microphone combo jack (3.5mm)', N'Vỏ nhôm với màu Cloud Grey', N'https://product.hstatic.net/1000026716/product/ideapad_5_pro_14itl6_ct1_03_98e97758bb51466591b7733e05a08384.png',0),

 ('LT21', N'U4 UD 50S1823SO', N'GIGABYTE', CAST(25490000.00 AS Decimal(18, 2)), N'14.0" FHD (1920x1080) Thin Bezel, IPS-level, Anti-glare Display LCD,', N'Windows 11 Home', N'14.0" FHD (1920x1080) Thin Bezel, IPS-level, Anti-glare Display LCD,', N' Văn phòng', N'Intel® Core™ i5-1155G7 (2.5GHz~4.5GHz)
', N'Intel Iris Xe graphics', 16, 512, N'36Wh', 0.99, N'1x USB 3.2 Gen1 (Type-A);1x USB 3.2 Gen2 (Type-A);1x Thunderbolt™ 4 (Type-C) (USB4 / DP / PD charging);1x HDMI 2.0 (with HDCP);1x Audio combo jack;1x MicroSD Card Reader;1x DC-in Jack', N'hợp kim nhôm magie', N'https://product.hstatic.net/1000026716/product/gearvn-laptop-gigabyte-u4-ud-50s1823so-2_59106787f3654ef499585f2ab36008ba.png',0),

 ('LT22', N'U4 UD 70S1823SO', N'GIGABYTE', CAST(25390000.00 AS Decimal(18, 2)), N'14.0" FHD (1920x1080) Thin Bezel, IPS-level, Anti-glare Display LCD,~100% sRGB', N'Windows 11 Home', N'HD Camera', N' Văn phòng', N'Intel Core i7-1195G7 (4 lõi, 8 luồng, tối đa 5,0 GHz)', N'Intel Iris Xe graphics', 16, 512, N'36Wh', 0.99, N'1x USB 3.2 Gen1 (Type-A);1x USB 3.2 Gen2 (Type-A);1x Thunderbolt™ 4 (Type-C) (USB4 / DP / PD charging);1x HDMI 2.0 (with HDCP);1x Audio combo jack;1x MicroSD Card Reader;1x DC-in Jack', N'hợp kim nhôm magie', N'https://product.hstatic.net/1000026716/product/gearvn-laptop-gigabyte-u4-ud-70s1823so-4_48c2c6269a504b628ae6d7d3c1e88fb9.png',0),

 ('LT23', N'G15 5511 70266676', N'DELL', CAST(19990001.00 AS Decimal(18, 2)), N'15.6" FHD (1920 x1080) 120Hz, 250 nits, WVA, Anti-Glare, LED Backlit, Narrow Border Display', N'Windows 11 Home', N'RGB HD camera (720p) ', N'Gaming, Văn phòng, Đồ họa - Kỹ thuật', N'Intel Core i5-11400H 2.7GHz up to 4.5GHz 12MB', N'NVIDIA GeForce RTX 3050 4GB GDDR6', 8, 256, N'3 Cell 56WHr', 2.65, N'1x USB 3.2 Gen 2 Type-C port with Display Port;3x USB 3.2 Gen 1;1x HDMI 2.1;1x RJ45
;1x headset port', N'nhựa Polycarbonate với màu Dark Shadow Grey', N'https://product.hstatic.net/1000026716/product/laptops_g-series_g15_5511_dark_shadow_gray_rgb_kb_media_gallery_3_51b4653b72c74ce1842d6ca268ed6b0d.png',0),

 ('LT24', N'G15 5525 R5H085W11GR3050', N'DELL', CAST(26490000.00 AS Decimal(18, 2)), N'15.6-inch FHD (1920 x1080) 120Hz, 250 nits, WVA, Anti-Glare, LED Backlit, Narrow Border Display', N'Windows 11 Home', N'HD camera (720p) ', N'Gaming, Văn phòng, Đồ họa - Kỹ thuật', N'AMD Ryzen 5 6600H (19MB Cache, 3.3GHz, Turbo Boost 4.5GHz), 6 Cores 12 Threads', N'NVIDIA® GeForce RTX™ 3050 4GB GDDR6', 8, 512, N'3 Cell 56WHr', 2.72, N'3x USB 3.2 Gen 1 ;1x USB 3.2 Gen 1;Type-C port with DisplayPort with alt mode 1x HDMI 2.1;1x RJ45;1x Headphones/mic', N'nhựa Polycarbonate với màu Dark Shadow Grey', N'https://product.hstatic.net/1000026716/product/gearvn-laptop-gaming-dell-g15-5525-r5h085w11gr3050-4_942c0132f33e4b6d8e9338c02a84e1b4.png',0),

 ('LT25', N'G15 5520 i7H165W11GR3050T', N'DELL', CAST(37990000.00 AS Decimal(18, 2)), N'15.6-inch FHD (1920 x1080) 165Hz 300 nits WVA Anti-Glare LED Backlit Narrow Border Display', N'Windows 11 Home SL', N'HD camera (720p) ', N'Gaming, Văn phòng, Đồ họa - Kỹ thuật', N'Intel Core i7-12700H (14 Cores 20 Threads, 24MB Cache, 3.5 GHz, Turbo Boost 4.7 GHz)', N'NVIDIA GeForce RTX 3050Ti 4GB GDDR6', 16, 512, N'3 Cell 56WHr', 2.67, N'3x USB 3.2 Gen 1 ;1x USB 3.2 Gen 1;Type-C port with DisplayPort with alt mode; 1x HDMI 2.1;1x RJ45;1x Headphones/mic', N'nhựa Polycarbonate với màu Dark Shadow Grey', N'https://product.hstatic.net/1000026716/product/gearvn-laptop-gaming-dell-g15-5520-i7h165w11gr3050t-2_b1872ad3872049a58cf2570ac299a2f4.png',0),

 ('LT26', N'G15 5520 P105F008 71000334', N'DELL', CAST(41590000.00 AS Decimal(18, 2)), N'15.6-inch FHD (1920 x1080) 165Hz, 300 nits, WVA Anti-Glare, 100% sRGB, LED Backlit, Narrow Border Display', N'Windows 11 Home SL', N'HD camera (720p) ', N'Gaming, Văn phòng, Đồ họa - Kỹ thuật', N'Intel Core i7-12700H (14 Cores 20 Threads, 24MB Cache, 3.5 GHz, Turbo Boost 4.7 GHz)', N'NVIDIA GeForce RTX™ 3060 6GB GDDR6', 16, 512, N'6 Cell 86WHrs', 2.67, N'3x USB 3.2 Gen 1 ;1x USB 3.2 Gen 1;Type-C port with DisplayPort with alt mode 1x HDMI 2.1
1x RJ45;1x Headphones/mic', N'nhựa Polycarbonate với màu Dark Shadow Grey', N'https://product.hstatic.net/1000026716/product/gearvn-laptop-gaming-dell-g15-5520-p105f008-71000334-2_defb59f79da544a7b4fe89cbfff76863.png',0),

 ('LT27', N'Gram 2022 14Z90Q G.AJ53A5', N'LG', CAST(31290000.00 AS Decimal(18, 2)), N'14 inch WUXGA (1920x1200), 16:10, IPS, DCI-P3 99%, LGD, 350 nits, Anti-Glare', N'Windows 11 Home', N'Webcam IR FHD IR with Dual Mic', N'Văn phòng', N'Intel Core i5-1240P 3.3GHz up to 4.4GHz 12MB', N'Intel Iris Xe Graphics', 8, 256, N'72WHr', 0.999, N'2x Thunderbolt 4 supports display / power delivery;2x USB 3.2 Gen2;1x HDMI;1x 3.5mm Combo Audio Jack', N'hợp kim magie', N'https://product.hstatic.net/1000026716/product/dz-4_8647e49a42554713bdfc13a46b0cfbff.jpg',0),

 ('LT28', N'Gram 2022 14Z90Q G.AJ32A5', N'LG', CAST(25990000.00 AS Decimal(18, 2)), N'14 inch WUXGA (1920x1200), 16:10, IPS, DCI-P3 99%, LGD, 350 nits, Anti-Glare', N'Windows 11 Home', N'Webcam IR FHD IR with Dual Mic', N'Văn phòng', N'Intel Core i3-1220P 1.1GHz up to 4.4GHz 12MB', N'Intel UHD Graphics', 8, 256, N'72WHr', 0.999, N'2x Thunderbolt 4 supports display / power delivery;2x USB 3.2 Gen2;1x HDMI;1x 3.5mm Combo Audio Jack', N'hợp kim magie', N'https://product.hstatic.net/1000026716/product/022-14z90q-g-aj32a5-i3-1220p-1_ffb7c901da534c9480961af03cc13cdd_master_d08a94f18391473fb0915a045f56bd42.png',0),

 ('LT29', N'Gram 2022', N'LG', CAST(37790000.00 AS Decimal(18, 2)), N'14 inch WUXGA (1920x1200), 16:10, IPS, DCI-P3 99%, LGD, 350 nits, Anti-Glare', N'Windows 11 Home', N'Webcam IR FHD IR with Dual Mic', N'Văn phòng', N'Intel Core i7-1260P 1.5GHz up to 4.7GHz 18MB', N'Intel Iris Xe Graphics', 16, 512, N'72WHr', 0.999, N'2x Thunderbolt 4 supports display / power delivery;2x USB 3.2 Gen2;1x HDMI;1x 3.5mm Combo Audio Jack', N'hợp kim magie', N'https://product.hstatic.net/1000026716/product/022-14z90q-g-aj32a5-i3-1220p-1_ffb7c901da534c9480961af03cc13cdd_master_726ed92a7e5342468a96c766aa17cb7c.png',0),

 ('LT30', N'Gram 2022', N'LG', CAST(41990000.00 AS Decimal(18, 2)), N'16 inch WQXGA (2560 x 1600), 16:10, IPS, DCI-P3 99%, LGD, 350 nits, Anti-Glare', N'Windows 11 Home', N'Webcam IR FHD IR with Dual Mic', N'Văn phòng', N'Intel Core i5-1240P 1.7GHz up to 4.4GHz 12MB', N'Intel Iris Xe Graphics', 16, 256, N'80WHr', 1.199, N'2x Thunderbolt 4 supports display / power delivery;2x USB 3.2 Gen2;1x HDMI;1x 3.5mm Combo Audio Jack', N'hợp kim magie', N'https://product.hstatic.net/1000026716/product/022-16z90q-g-ah52a5-i5-1240p-1_2e9bc64c971f4c6996994035e663b022_master_2a6d9bc9707e410c948eef7e79ce7a25.png',0)

 --Insert Laptops của Trường
 INSERT LAPTOP (ID, Ten, Hang, Gia, ManHinh, OS, Webcam, NhuCau, Chip, VGA, Ram, Rom, Pin, KhoiLuong, CongGiaoTiep, ThietKe, ImagePath, SaoTrungBinh) VALUES
('LT31', N'G5 GE-51VN263SH', N'Gigabyte', 21690000, N'15.6 inch', N'Win11', N'HD type (30fps@720p)', N'Gaming', N'Intel, Core i5, 12500H', N'NVIDIA GeForce RTX 3050 4GB; Intel Iris Xe Graphics', 8, 512, N'Lithium-ion 54 Wh', 1.9, N'1 Card reader;
1 DC-in jack;
1 DisplayPort 1.4;
1 HDMI 2.1;
1 Jack 3.5 mm;
1 LAN;
1 USB 2.0;
1 USB 3.2 Gen 1;
2 USB 3.2 Gen 2', N'Vỏ máy: Nhựa', N'https://images.fpt.shop/unsafe/fit-in/240x215/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2022/11/9/638036059541782094_gigabyte-gaming-g5-ge-i5-12500h-rtx3050-dd-bh-moi.jpg', 0),

('LT32', N'TUF FX517ZC-HN077W', N'Asus', 23490000, N'15.6 inch', N'Win11', N'HD Webcam (720p Webcam)', N'Gaming', N'Intel, Core i5, 12450H',N'NVIDIA GeForce RTX 3050 4GB; Intel UHD Graphics', 8, 512, N'Lithium-ion 4 Cell 180 W', 2, N'1 HDMI;
1 Jack 3.5 mm;
1 LAN;
1 Thunderbolt;
1 Type C;
2 USB 3.2 Gen 1', N'Tản nhiệt: 1 quạt; Mặt lưng máy: Kim loại', N'https://images.fpt.shop/unsafe/fit-in/240x215/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2022/3/22/637835763372337463_asus-tuf-gaming-fx517-den-dd-rtx-3050.jpg',0),

('LT33', N'IdeaPad 3 15IAH7', N'Lenovo', 20490000, N'15.6 inch', N'Win11', N'HD Webcam (720p Webcam)', N'Gaming', N'Intel, Core i5, 12500H', N'NVIDIA GeForce RTX 3050 4GB', 16, 512, N'Lithium polymer 4 Cell', 2.25, N'1 HDMI;
1 Jack 3.5 mm;
1 LAN;
2 USB 3.2', N'Tản nhiệt: 2 quạt; Mặt bàn phím + kê tay: Nhựa ABS', N'https://images.fpt.shop/unsafe/fit-in/240x215/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2022/8/26/637971149907512230_lenovo-ideapad-gaming-3-15iah7-xam-dd.jpg',0),

('LT34', N'TUF Gaming FX517ZE-HN045W', N'Asus', 24490000, N'15.6 inch', N'Win11', N'HD Webcam (720p Webcam)', N'Gaming', N'Intel, Core i5, 12450H', N'NVIDIA GeForce RTX 3050 Ti 4 GB; Intel Iris Xe Graphics', 8, 512, N'Lithium polymer 4 Cell 180W', 2, N'1 LAN;
1 Thunderbolt;
1 USB 3.2 Gen 2;
2 USB 3.2 Gen 1', N'Vỏ: Nhôm cao cấp phủ chống dính', N'https://images.fpt.shop/unsafe/fit-in/240x215/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2022/7/20/637939094246813408_asus-tuf-gaming-fx517-den-dd-rtx-3050ti.jpg',0),

('LT35', N'Inspiron 16 N5620', N'Dell', 26990000, N'16 inch', N'Win11', N'Trước RGB HD Camera', N'Sinh viên - Văn phòng', N'Intel, Core i5, 1240P', N'Intel Iris Xe Graphics', 16, 512, N'Lithium-ion 54 W', 1.97, N'1 HDMI 1.4;
1 Jack 3.5 mm;
1 USB 3.2 Gen 2;
2 USB 3.2', N'Mặt bên ngoài cùng: Nhựa', N'https://images.fpt.shop/unsafe/fit-in/240x215/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2022/7/22/637941164968673889_dell-inspiron-16-n5620-bac-dd.jpg',0),

('LT36', N'Katana GF66 12UCK-805VN', N'MSI', 23990000, N'15.6 inch', N'Win11', N'HD Webcam (720p Webcam)', N'Gaming', N'Intel, Core i7, 12650H', N'NVIDIA GeForce RTX 3050 4GB; Intel UHD Graphics',8, 512, N'Lithium polymer 180W', 2.25, N'	
1 HDMI;
1 Jack 3.5 mm;
1 LAN;
1 Type C;
1 USB 2.0;
2 USB 3.2 Gen 1', N'Nhựa', N'https://images.fpt.shop/unsafe/fit-in/240x215/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2022/11/21/638046447294275297_msi-gaming-katana-gf66-dd-bh-moi.jpg',0),

('LT37', N'Yoga Slim 7 Pro 14IHU5O', N'Lenovo', 21790000, N'14 inch',N'Win11', N'HD Webcam (720p Webcam)', N'Mỏng nhẹ', N'Intel, Core i5, 11300H', N'Intel Iris Xe Graphics', 16, 512, N'4 Cell', 1.4, N'1 Jack 3.5 mm;
1 USB 3.2 Gen 1;
2 Thunderbolt', N'Vỏ máy: Hợp kim nhôm', N'https://images.fpt.shop/unsafe/fit-in/240x215/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2022/5/25/637890960008464129_lenovo-yoga-slim-7-pro-14ihu5-bac-dd-oled.jpg',0),

('LT38', N'IdeaPad 5 Pro 16IAH7', N'Lenovo', 23190000, N'16 inch', N'Win11', N'Full HD Webcam (1080p Webcam)', N'Học sinh - Sinh viên', N'Intel, Core i7, 12700H', N'Intel Iris Xe Graphics', 16, 512, N'Lithium polymer 100W', 1.95, N'1 Card reader;
1 HDMI;
1 Jack 3.5 mm;
1 Type C;
2 USB 3.2', N'Mặt bàn phím + kê tay: Hợp kim nhôm; Vỏ máy: Nhôm', N'https://images.fpt.shop/unsafe/fit-in/240x215/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2022/9/22/637994515343436804_lenovo-ideapad-5-pro-16iah7-xam-dd.jpg',0),

('LT39', N'TUF FX517ZM-HN480W', N'Asus', 28490000, N'15.6 inch', N'Win11', N'HD Webcam (720p Webcam)', N'Gaming', N'Intel, Core i7, 12650H', N'NVIDIA GeForce RTX 3060 6GB; Intel UHD Graphics',8,512, N'Lithium polymer 200W', 2, N'	
1 HDMI 2.0;
1 Jack 3.5 mm;
1 LAN;
1 Thunderbolt;
1 Type C;
2 USB 3.2', N'Khung máy: Nhựa; Mặt lưng máy: Kim loại', N'https://images.fpt.shop/unsafe/fit-in/240x215/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2022/9/20/637992839292679823_asus-tuf-gaming-fx517-den-dd.jpg',0),

('LT40', N'Nitro AN515-58-52SP', N'Acer', 24290000, N'15.6 inch', N'Win11', N'HD Webcam (720p Webcam)', N'Gaming', N'Intel, Core i5, 12500H', N'NVIDIA GeForce RTX 3050 4GB; Intel Iris Xe Graphics', 8, 512, N'Lithium-ion 57.5W', 2.5, N'	
1 DC-in jack;
1 HDMI;
1 Jack 3.5 mm;
1 LAN;
1 Type C;
3 USB 3.0', N'Mặt bàn phím + kê tay: Nhựa', N'https://images.fpt.shop/unsafe/fit-in/240x215/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2022/3/1/637817434232133881_acer-nitro-gaming-an515-58-dd.jpg',0),

('LT41', N'IdeaPad 1 15AMN7 R5 7520U', N'Lenovo', 12490000, N'15.6 inch', N'Win11', N'HD Webcam (720p Webcam)', N'Thiết kế đồ họa', N'AMD, Ryzen 5, 7520U', N'AMD Radeon 610 2GB', 8, 512, N'Lithium-ion 65W', 1.58, N'Card reader;
HDMI 1.4;
Jack 3.5 mm;
Type C;
USB 2.0;
USB 3.2 Gen 1', N'Nhựa ABS', N'https://images.fpt.shop/unsafe/fit-in/240x215/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2022/11/29/638053327684236749_lenovo-ideapad-1-15amn7-xam-dd.jpg',0),

('LT42', N'TUF FX506LHB-HN188W', N'Asus', 16990000, N'15.6 inch', N'Win11', N'HD Webcam (720p Webcam)', N'Gaming', N'Intel, Core i5, 10300H', N'NVIDIA GeForce GTX 1650 4GB; Intel UHD Graphics', 8, 512, N'Lithium-ion 200W', 2.3, N'	
1 HDMI;
1 Jack 3.5 mm;
1 Type C;
1 USB 2.0;
2 USB 3.0', N'Vỏ máy: Nhựa', N'https://images.fpt.shop/unsafe/fit-in/240x215/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2022/1/26/637787904727727554_asus-tuf-gaming-fx506lh-den-2022-dd.jpg',0),

('LT43', N'GF63 Thin 11SC-1090VN', N'MSI', 16990000, N'15.6 inch', N'Win11', N'HD Webcam (720p Webcam)', N'Gaming', N'Intel, Core i5, 11400H', N'NVIDIA GeForce GTX 1650 4GB', 8, 512, N'Lithium-ion 120W', 1.86, N'	
1 HDMI;
1 LAN;
1 Type C;
3 USB 3.2 Gen 1', N'Nhựa', N'https://images.fpt.shop/unsafe/fit-in/240x215/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2022/10/7/638007352801976726_msi-gaming-gf63-thin-11sc-1090vn-den-dd.jpg',0),

('LT44', N'Modern 14 B11MOU-1028VN', N'MSI', 9990000, N'14 inch', N'Win11', N'HD Webcam (720p Webcam)', N'Gaming', N'Intel, Core i3, 115G4', N'Intel UHD Graphics', 8, 256, N'Lithium polymer 39W', 1.3, N'1 HDMI;
1 Jack 3.5 mm;
3 USB 3.0', N'Khung màn hình: Nhựa;
Mặt bàn phím + kê tay: Kim loại;
Mặt bên ngoài cùng: Kim loại', N'https://images.fpt.shop/unsafe/fit-in/240x215/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2021/9/4/637663485438013374_msi-modern-14-xam-dd.jpg',0),

('LT45', N'15s-fq2663TU', N'HP', 9690000, N'15.6 inch', N'Win11', N'HD Webcam (720p Webcam)', N'Sinh viên - Văn phòng', N'Intel, Core i3, 1115G4', N'Intel UHD Graphics', 4, 256, N'Lithium-ion 45W', 1.7, N'	
1 HDMI 1.4;
1 Jack 3.5 mm;
1 Type C;
2 USB 2.0', N'Mặt bàn phím + kê tay: Nhựa', N'https://images.fpt.shop/unsafe/fit-in/240x215/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2022/7/11/637931467519964702_hp-15s-fq-bac-win11-dd.jpg',0),

('LT46', N'Vivobook X515EA-BR2045W', N'Asus', 10590000, N'15.6 inch', N'Win11', N'HD Webcam (720p Webcam)', N'Doanh nhân', N'Intel, Core i3, 1115G4', N'Intel UHD Graphics', 4, 512, N'Lithium-ion 45W', 1.8, N'	
1 DC-in jack;
1 HDMI 1.4;
1 Jack 3.5 mm;
1 Type C;
1 USB 2.0', N'Chất liệu: Nhựa', N'https://images.fpt.shop/unsafe/fit-in/240x215/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2021/1/12/637460615818949069_asus-vivobook-x515-bac-dd.png',0),

('LT47', N'ROG G513IC-HN729W R7 4800H', N'Asus', 20990000, N'15.6 inch', N'Win11', N'HD Webcam (720p Webcam)', N'Sinh viên - Văn phòng', N'AMD, Ryzen 7, 4800H', N'NVIDIA GeForce RTX 3050 4GB; AMD Radeon Graphics', 8, 512, N'Lithium-ion 200W', 2.1, N'1 HDMI 2.0;
1 Jack 3.5 mm;
1 Type C;
3 USB 3.2 Gen 1', N'Mặt bàn phím + kê tay: Nhựa', N'https://images.fpt.shop/unsafe/fit-in/240x215/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2021/8/26/637655728046080925_asus-rog-gaming-g513-rgb4-xam-dd.jpg',0),

('LT48', N'GF63 Thin 11SC-663VN', N'MSI', 18990000, N'15.6 inch', N'Win11', N'Trước HD Webcam (720p Webcam)', N'Gaming', N'Intel, Core i7, 11800H', N'NVIDIA GeForce GTX 1650 Max-Q 4GB; Intel UHD Graphics', 8, 512, N'Lithium polymer 3 Cell', 1.86, N'	
1 HDMI;
1 LAN;
1 Type C;
3 USB 3.2 Gen 1', 
N'Nhựa;
Vỏ máy: Alumium CNC', N'https://images.fpt.shop/unsafe/fit-in/240x215/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2021/8/7/637639339928194488_msi-gaming-gf63-den-dd.jpg',0),

('LT49', N'Nitro AN515-57-54MV', N'Acer', 21290000, N'15.6 inch', N'Win10', N'HD Webcam (720p Webcam)', N'Gaming', N'Intel, Core i5, 11400H', N'NVIDIA GeForce RTX 3050 4GB; Intel UHD Graphics', 8, 512, N'Lithium-ion 4 Cell', 2.2, N'1 DC-in jack;
1 HDMI;
1 Jack 3.5 mm;
1 Type C;
1 USB 2.0;
1 USB 3.0', N'Khung màn hình: Nhựa;
Mặt bàn phím + kê tay: Nhựa;
Mặt bên ngoài cùng: Nhựa;
Mặt lưng máy: Nhựa', N'https://images.fpt.shop/unsafe/fit-in/240x215/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2021/7/20/637624023473077758_acer-nitro-gaming-an515-57-den-rtx3050-dd-1.jpg',0),

('LT50', N'GF63 Thin 11UC-444VN', N'MSI', 18490000, N'15.6 inch', N'Win10', N'HD Webcam (720p Webcam)', N'Gaming', N'Intel, Core i5, 11400H', N'NVIDIA GeForce RTX 3050 4GB; Intel UHD Graphics', 8, 512, N'Lithium polymer 120W 3 Cell', 1.86, N'1 DC-in jack;
1 HDMI;
1 Jack 3.5 mm;
1 Type C;
4 USB 3.0', N'Khung màn hình: Nhựa;
Mặt bàn phím + kê tay: Kim loại;
Mặt bên ngoài cùng: Kim loại;
Mặt lưng máy: Nhựa', N'https://images.fpt.shop/unsafe/fit-in/240x215/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2022/1/26/637788084553132269_msi-gf63-thin-den-dd.jpg',0),

('LT51', N'TUF FA506IHRB-HN019W R5', N'Asus', 16490000, N'15.6 inch', N'Win11', N'HD Webcam (720p Webcam)', N'Cao cấp - Sang trọng', N'AMD, Ryzen 5, 4600H', N'NVIDIA GeForce GTX 1650 4GB; AMD Radeon Graphics', 8, 512, N'Lithium-ion 3 viên 150W', 2.3, N'1 HDMI 2.0;
1 Jack 3.5 mm;
1 LAN;
1 Type C;
3 USB 3.2', N'Mặt lưng máy: Nhựa', N'https://images.fpt.shop/unsafe/fit-in/240x215/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2022/8/2/637950740313797526_asus-tuf-gaming-fa506ihr-den-dd.jpg',0),

('LT52', N'Vivobook M1403QA-LY022W R5', N'Asus', 14990000, N'14 inch', N'Win11', N'HD Webcam (720p Webcam)', N'Sinh viên - Văn phòng', N'AMD, Ryzen 5, 5600H', N'AMD Radeon Graphics', 8, 512, N'Lithium-ion 3 viên 150W', 1.6, N'	
1 DC-in jack;
1 HDMI;
1 Jack 3.5 mm;
1 Type C;
1 USB 2.0;
2 USB 3.2 Gen 1', N'Chất liệu: Kim loại', N'https://images.fpt.shop/unsafe/fit-in/240x215/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2022/9/14/637987718881809877_asus-vivobook-m1403-non-oled-bac-dd.jpg',0),

('LT53', N'Modern 15 A5M 235VN R7', N'MSI', 15990000, N'15.6 inch', N'Win11', N'HD Webcam (720p Webcam)', N'Gaming', N'AMD, Ryzen 7, 5700U', N'AMD Radeon Graphics', 8, 512, N'Lithium polymer 65W 3 Cell', 1.6, N'	
1 Card reader;
1 DC-in jack;
1 HDMI;
1 Jack 3.5 mm;
1 Type C;
3 USB 3.0', N'	
Khung màn hình: Nhựa;
Mặt bàn phím + kê tay: Kim loại;
Mặt bên ngoài cùng: Kim loại', N'https://images.fpt.shop/unsafe/fit-in/240x215/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2021/11/18/637728547611527044_msi-modern-15-a5m-234vn-r5-5500u-xam-dd.jpg',0),

('LT54', N'IdeaPad 3 14IAU7', N'Lenovo', 14790000, N'14 inch', N'Win11', N'HD Webcam (720p Webcam)', N'Cao cấp - Sang trọng', N'Intel, Core i5, 1235U', N'Intel Iris Xe Graphics', 8, 512, N'Lithium polymer 65W', 1.63, N'1 Card reader;	
1 HDMI;
1 Jack 3.5 mm;
1 Type C;
1 USB 2.0;
1 USB 3.2', N'Vỏ máy: Nhựa ABS', N'https://images.fpt.shop/unsafe/fit-in/240x215/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2022/10/7/638007503320711896_lenovo-ideapad-3-14iau7-xanh-dd.jpg',0),

('LT55', N'Pavilion 15 eg2057TU', N'HP', 17090000, N'15.6 inch', N'Win11', N'HD Webcam (720p Webcam)', N'Thiết kế đồ họa', N'Intel, Core i5, 1240P', N'Intel Iris Xe Graphics', 8, 512, N'3 Cell 65W', 1.702, N'	
1 HDMI;
1 Jack 3.5 mm;
3 USB 3.2 Gen 1', N'Mặt bàn phím + kê tay: Nhôm; Vỏ máy: Nhựa', N'https://images.fpt.shop/unsafe/fit-in/240x215/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2022/7/29/637947006257497678_hp-pavilion-15-eg-bac-2022-win11-dd.jpg',0),

('LT56', N'Vivobook M1503QA-L1026W R5', N'Asus', 16490000, N'15.6 inch', N'Win11', N'HD Webcam (720p Webcam)', N'Mỏng nhẹ', N'AMD, Ryzen 5, 5600H', N'AMD Radeon Graphics', 8, 512, N'Lithium-ion 90W', 1.7, N'1 DC-in jack;
1 HDMI;
1 Jack 3.5 mm;
1 Type C;
1 USB 2.0;
2 USB 3.2 Gen 1', N'Chất liệu: Kim loại', N'https://images.fpt.shop/unsafe/fit-in/240x215/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2022/8/26/637971384442849961_asus-vivobook-m1503-bac-dd.jpg',0),

('LT57', N'IdeaPad 5 Pro 16IAH7', N'Lenovo', 21490000, N'16 inch', N'Win11', N'Full HD Webcam (1080p Webcam)', N'Sinh viên - Văn phòng', N'Intel, Core i5, 12500H', N'Intel Iris Xe Graphics', 16, 512, N'Lithium polymer 4 Cell', 1.95, N'1 Card reader;
1 HDMI;
1 Jack 3.5 mm;
1 Type C;
2 USB 3.2', N'Mặt bàn phím + kê tay: Hợp kim nhôm; Vỏ máy: Nhôm', N'https://images.fpt.shop/unsafe/fit-in/240x215/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2022/9/22/637994618112287575_lenovo-ideapad-5-pro-16iah7-xam-dd.jpg',0),

('LT58', N'Modern 14 B11MOU-1031VN', N'MSI', 15790000, N'14 inch', N'Win11', N'HD Webcam (720p Webcam)', N'Gaming', N'Intel, Core i7, 1195G7', N'Intel Iris Xe Graphics', 8, 512, N'Lithium polymer 65W 3 Cell', 1.3, N'1 DC-in jack;
1 HDMI;
1 Jack 3.5 mm;
1 Type C;
3 USB 3.0', N'Khung màn hình: Nhựa; Mặt bàn phím + kê tay: Kim loại; Mặt bên ngoài cùng: Kim loại; Mặt lưng máy: Kim loại', N'https://images.fpt.shop/unsafe/fit-in/240x215/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2021/9/4/637663485438013374_msi-modern-14-xam-dd.jpg',0),

('LT59', N'Pavilion 14 dv2034TU', N'HP', 16690000, N'14 inch', N'Win11', N'HD Webcam (720p Webcam)', N'Mỏng nhẹ', N'Intel, Core i5, 1235U', N'Intel Iris Xe Graphics', 8, 512, N'Lithium-ion 65W 3 Cell', 1.41, N'	
1 HDMI;
1 Jack 3.5 mm;
1 Type C;
2 USB 3.0', N'Hợp kim nhôm', N'https://images.fpt.shop/unsafe/fit-in/240x215/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2021/3/15/637514266078486477_hp-pavilion-14-dv-bac-dd.jpg',0),

('LT60', N'Legion 5 15ARH7 R5', N'Lenovo', 26190000, N'15.6 inch', N'Win11', N'Full HD Webcam (1080p Webcam)', N'Gaming', N'AMD, Ryzen 5, 6600H', N'NVIDIA GeForce RTX 3050 4GB; AMD Radeon Graphics', 8, 512, N'Lithium polymer 3 viên 230W', 2.35, N'	
1 HDMI;
1 Jack 3.5 mm;
1 LAN;
3 Type C;
3 USB 3.2 Gen 1', N'Mặt bên ngoài cùng: Nhựa ABS; Mặt lưng máy: Alumium CNC', N'https://images.fpt.shop/unsafe/fit-in/240x215/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2022/10/20/638018700298075854_lenovo-gaming-legion-5-15arh7-xam-dam-dd.jpg',0)


INSERT INTO VOUCHER VALUES('HAPPYUIT', 0.2)
INSERT INTO TAIKHOAN VALUES (N'Test', 'TEST', '1', '1', '1', 'TEMP')
INSERT INTO TAIKHOAN VALUES('admin@gmail.com', N'Admin', '123', 'TPHCM', '098', 'Admin')
INSERT INTO TAIKHOAN VALUES('123@gmail.com', N'Johnson', '123', 'TPHCM', '098', 'User')
INSERT INTO GIOHANG VALUES ('', 'GH01', GETDATE(), 0, 0, 0)
GO

CREATE PROCEDURE DangNhap @email nvarchar(50), @password nvarchar(100)
AS
BEGIN
SELECT * FROM TAIKHOAN WHERE Email  = @email COLLATE SQL_Latin1_General_CP1_CS_AS
AND MatKhau = @password COLLATE SQL_Latin1_General_CP1_CS_AS
END
GO

--STORED PROCEDURE
CREATE PROCEDURE CheckTaiKhoanTrung @email nvarchar(50)
AS
BEGIN
SELECT * FROM TAIKHOAN WHERE Email  = @email COLLATE SQL_Latin1_General_CP1_CS_AS

END
GO

CREATE PROCEDURE CheckEmailExists @email nvarchar(50)
AS
BEGIN
SELECT * FROM TAIKHOAN WHERE Email  = @email COLLATE SQL_Latin1_General_CP1_CS_AS

END
GO

CREATE PROCEDURE DoiMatKhau @email nvarchar(50), @password nvarchar(100)
AS
BEGIN
	 UPDATE TAIKHOAN
	 SET MatKhau = @password COLLATE SQL_Latin1_General_CP1_CS_AS
	 WHERE Email = @email COLLATE SQL_Latin1_General_CP1_CS_AS

END
GO


CREATE TABLE REVIEWPHONE(
IDGH nvarchar(5) FOREIGN KEY REFERENCES GIOHANG(IDGH),
IDSP nvarchar(6) FOREIGN KEY REFERENCES PHONE(ID),
Sao int not null,
BinhLuan nvarchar(200) not null
PRIMARY KEY(IDGH, IDSP)
)

CREATE TABLE REVIEWLAPTOP(

IDGH nvarchar(5) FOREIGN KEY REFERENCES GIOHANG(IDGH),
IDSP nvarchar(6) FOREIGN KEY REFERENCES LAPTOP(ID),
Sao int not null,
BinhLuan nvarchar(200) not null
PRIMARY KEY(IDGH, IDSP)
)

