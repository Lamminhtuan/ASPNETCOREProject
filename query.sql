﻿CREATE DATABASE ASP
USE ASP



CREATE TABLE PHONES
(
ID int not null primary key,
Ten nvarchar(250) not null,
Hang nvarchar(250) not null,
Gia decimal(18,2) not null,
ManHinh nvarchar(250) not null,
OS nvarchar(250) not null,
CameraSau nvarchar(250) not null,
CameraTruoc nvarchar(250) not null,
NhuCau nvarchar(250) not null,
Chip nvarchar(250) not null,
Ram int not null,
Rom int not null,
Pin nvarchar(250) not null,
ThietKe nvarchar(250) not null,
ImagePath nvarchar(550) not null,
)
CREATE TABLE LAPTOPS
(
ID int not null primary key,
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
)
DROP TABLE PHONES, LAPTOPS

INSERT INTO PHONES(ID,Ten, Hang, Gia, ManHinh, OS, CameraSau, CameraTruoc, NhuCau, Chip,Ram,Rom,Pin, ThietKe, ImagePath)
VALUES(0, N'iPhone 14 Pro Max 128 GB', N'Apple', 33990000, N'OLED 6.7" Super Retina XDR', N'iOS', N'Chính 48 MP & Phụ 12 MP, 12 MP', '12 MP',N'Cao cấp, sang trọng', N'Apple A16 Bionic', 6, 128, N'4323 mAh',N'Khung thép không gỉ & Mặt lưng kính cường lực', '/images/ip14promax.jpg'),
(1, N'iPhone 14 Pro', 'Apple', 30590000, N'OLED 6.1" Super Retina XDR',  'iOS', N'Chính 48 MP & Phụ 12 MP, 12 MP','12 MP', N'Cao cấp, sang trọng','Apple A16 Bionic', 6, 128, '3200 mAh', N'Khung thép không gỉ & Mặt lưng kính cường lực','/images/ip14pro.jpg'),
(2, N'iPhone 13 Pro Max', 'Apple', 28490000, N'OLED 6.7" Super Retina XDR', 'iOS', '3 camera 12 MP ', '12 MP', N'Cao cấp, sang trọng', 'Apple 15 Bionic', 6, 128, '4352 mAh',N'Khung thép không gỉ & Mặt lưng kính cường lực', '/images/ip13promax.jpg'),
(3, 'Samsung Galaxy S22 Ultra', 'Samsung', 25990000, 'Dynamic AMOLED 2X 6.8" Quad HD + (2K +)', 'Android', N'Chính 108 MP & Phụ 12 MP, 10 MP, 10 MP', '40 MP',N'Cao cấp, sang trọng', 'Snapdragon 8 Gen 1',  8, 128, '5000 mAh',N'Khung kim loại & Mặt lưng kính' ,'/images/s22ultra.jpg'),
(4, 'Samsung Galaxy S22+', 'Samsung', 21990000, 'Dynamic AMOLED 2X 6.6" Full HD +', 'Android', N'Chính 50 MP & Phụ 12 MP, 10 MP', '10 MP',N'Chụp ảnh, quay phim', 'Snapdragon 8 Gen 1', 8, 128, '4500 mAh', N'Khung nhôm & Mặt lưng kính','/images/s22+.jpg'),
(5, 'Samsung Galaxy Z Fold4 5G', 'Samsung', 37990000, N'Dynamic AMOLED 2X Chính 7.6" & Phụ 6.2" Quad HD+ (2K+)' , 'Android', N'Chính 50 MP & Phụ 12 MP, 10 MP', '10 MP & 4 MP',N'Màn hình gập', 'Snapdragon 8+ Gen 1', 12, 256, '4400 mAh',N'Khung nhôm & Mặt lưng kính cường lực', '/images/zfold4.jpg'),
(6, 'Samsung Galaxy Z Flip4 5G', 'Samsung', 20990000, N'Chính: Dynamic AMOLED 2X, Phụ: Super AMOLED, Chính 6.7" & Phụ 1.9" Full HD+', 'Android', '2 camera 12 MP', '10 MP', N'Màn hình gập','Snapdragon 8+ Gen 1', 8, 256, '3700 mAh',N'Khung nhôm & Mặt lưng kính cường lực','/images/zflip4.jpg'),
(7, 'OPPO Find X5 Pro 5G', 'OPPO', 30490000, 'AMOLED 6.7" Quad HD + (2K +)','Android', N'Chính 50 MP & Phụ 50 MP, 13 MP', '32 MP',N'Chụp ảnh, quay phim', 'Snapdragon 8 Gen 1', 12, 256, '5000 mAh',N'Khung kim loại & Mặt lưng gốm' ,'/images/findx5pro.jpg'),
(8, 'Xiaomi 12 Pro', 'Xiaomi', 25490000, 'AMOLED 6.73" Quad HD + (2K +)', 'Android', '3 camera 50 MP', '32 MP',N'Cao cấp, sang trong','Snapdragon 8 Gen 1', 12, 256, '4600 mAh',N'Khung kim loại & Mặt lưng kính' ,'/images/xiaomi12pro.jpg'),
(9, 'Vivo X80', 'Vivo', 19190000, 'AMOLED 6.78" Full HD +', 'Android', 'Chính 50 MP & Phụ 12 MP, 12 MP', '32 MP',N'Chụp ảnh, quay phim', 'MediaTek Dimensity 9000', 12, 256, '4500 mAh',N'Khung hợp kim nhôm & Mặt lưng kính' ,'/images/vivox80.jpg'),
(10, 'OPPO Reno8 Pro 5G', 'OPPO', 18990000, 'AMOLED 6.7" Full HD +', 'Android', N'Chính 50 MP & Phụ 8 MP, 2 MP', '32 MP',N'Chụp ảnhm quay phim' ,N'MediaTek Dimensity 8100 Max 8 nhân', 12, 256, '4500 mAh', N'Khung kim loại & Mặt lưng kính cường lực Gorilla Glass 5','/images/reno8pro.jpg'),
(11, 'Samsung Galaxy S21 FE 5G', 'Samsung', 12990000, 'Dynamic AMOLED 2X 6.4" Full HD +', 'Android', N'Chính 12 MP & Phụ 12 MP, 8 MP', '32 MP',N'Chụp ảnh, quay phim', 'Exynos 2100', 8, 128, '4500 mAh',N'Khung kim loại & Mặt lưng nhựa', '/images/s21fe.jpg'),
(12, 'Samsung Galaxy A73 5G', 'Samsung', 11990000, 'Super AMOLED Plus 6.7" Full HD +','Android', N'Chính 108 MP & Phụ 12 MP, 5 MP, 5 MP', '32 MP', N'Chụp ảnh, quay phim','Snapdragon 778G 5G', 8, 128, '5000 mAh',N'Khung & Mặt lưng nhựa','/images/a73.jpg'),
(13, 'Vivo V23 5G', 'Vivo', 11690000, 'AMOLED 6.44" Full HD +', 'Android', N'Chính 64 MP & Phụ 8 MP, 2 MP', N'Chính 50 MP & Phụ 8 MP',N'Chụp ảnh, quay phim', 'MediaTek Dimensity 920 5G', 8, 128, '4200 mAh',N'Khung kim loại & Mặt lưng kính', '/images/vivov23.jpg'),
(14, 'Xiaomi 12T 5G', 'Xiaomi', 12490000, 'AMOLED 6.67" 1.5K','Android', N'Chính 108 MP & Phụ 8 MP, 2 MP','20 MP', N'Chơi game, cấu hình mạnh', N'MediaTek Dimensity 8100 Ultra 8 nhân', 8, 128, '5000 mAh', N'Khung kim loại, nhựa & Mặt lưng kính','/images/xiaomi12t.jpg'),
(15, 'iPhone SE (2022)', 'Apple', 12990000, 'IPS LCD 4.7" Retina HD','iOS', '12 MP','7 MP',N'Chơi game, cấu hình cao', 'Apple A15 Bionic', 4, 128, '2018 mAh',N'Khung kim loại & Mặt lưng kính', '/images/se2022.jpg'),
(16, 'Realme 9 Pro+ 5G', 'Realme', 9990000, 'Super AMOLED 6.4" Full HD +', 'Android', N'Chính 50 MP & Phụ 8 MP, 2 MP', '16 MP',N'Chụp ảnh, quay phim', 'MediaTek Dimensity 920 5G', 8, 128, '4500 mAh', N'Khung nhựa & Mặt lưng kính', '/images/realme9pro+.jpg'),
(17, 'Samsung Galaxy A53 5G', 'Samsung', 9990000, 'Super AMOLED 6.5" Full HD +', 'Android', N'Chính 64 MP & Phụ 12 MP, 5 MP, 5 MP','32 MP', N'Chụp ảnh, quay phim','Exynos 1280', 8, 128, '5000 mAh', N'Khung & Mặt lưng nhựa','/images/a53.jpg'),
(18, 'Xiaomi Redmi Note 10 Pro', 'Xiaomi', 7090000, 'AMOLED 6.67" Full HD +', 'Android', N'Chính 108 MP & Phụ 8 MP, 5 MP, 2 MP','16 MP', 'Snapdragon 732G', 8, 128, '5020 mAh', '/images/redminote10pro.jpg'),
(19, 'Vivo V23e', 'Vivo', 7190000, 'AMOLED 6.44" Full HD +', 'Android', N'Chính 64 MP & Phụ 8 MP, 2 MP','50 MP', 'MediaTek Helio G96', 8, 128, '4050 mAh', '/images/vivov23e.jpg'),
(20, 'Xiaomi Redmi Note 11 Pro', 'Xiaomi', 7190000, 'AMOLED 6.67" Full HD +', 'Android', N'Chính 108 MP & Phụ 8 MP, 2 MP, 2 MP', '16 MP', 'MediaTek Helio G96', 8, 128, '5000 mAh', '/images/redminote11pro.jpg'),
(21, 'Samsung Galaxy A33 5G', 'Samsung', 7290000, 'Super AMOLED 6.4" Full HD +','Android', N'Chính 48 MP & Phụ 8 MP, 5 MP, 2 MP','13 MP', 'Exynos 1280', 6, 128, '5000 mAh', '/images/a33.jpg'),
(22, 'Vivo T1 5G', 'Vivo', 7990000, 'AMOLED 6.44" Full HD +','Android', N'Chính 64 MP & Phụ 8 MP, 2 MP','16 MP', 'Snapdragon 778G 5G', 8, 128, '4700 mAh', '/images/vivot1.jpg'),
(23, 'Vivo Y53S', 'Vivo', 6990000, 'IPS LCD 6.58" Full HD +','Android', N'Chính 64 MP & Phụ 2 MP, 2 MP', '16 MP', 'MediaTek Helio G80', 8, 128, '5000 mAh', '/images/vivoy53s.jpg'),
(24, 'OPPO A96', 'Oppo', 6490000, 'IPS LCD 6.59" Full HD +','Android', N'Chính 50 MP & Phụ 2 MP','16 MP', 'Snapdragon 680', 8, 128, '5000 mAh', '/images/oppoa96.jpg'),
(25, 'Realme C21-Y', 'Realme', 2690000, 'IPS LCD 6.5" HD +', 'Android', N'Chính 13 MP & Phụ 2 MP, 2 MP', '5 MP', 'Spreadtrum T610', 3, 32, '5000 mAh', '/images/c21-y.jpg'),
(26, 'Realme C11', 'Realme', 2790000, 'IPS LCD 6.5" HD +','Android', '8 MP','5 MP', 'Spreadtrum SC9863A', 4, 64, '5000 mAh', '/images/c11.jpg'),
(27, 'Nokia C31', 'Nokia', 2790000, 'TFT LCD 6.7" HD +', 'Android', N'Chính 13 MP & Phụ 2 MP, 2 MP','5 MP', 'Unisoc SC9863A1', 3, 32, '5050 mAh', '/images/nokiac31.jpg'),
(28, 'Nokia G10', 'Nokia', 2990000, 'TFT LCD 6.5" HD +','Android', N'Chính 13 MP & Phụ 2 MP, 2 MP','8 MP', 'MediaTek Helio G25', 4, 64, '5050 mAh', '/images/nokiag10.jpg'),
(29, 'Nokia G21', 'Nokia', 3890000, 'TFT LCD 6.5" HD +','Android', N'Chính 50 MP & Phụ 2 MP, 2 MP','8 MP', 'Unisoc T606', 4, 128, '5050 mAh', '/images/nokiag21.jpg'),
(30, 'iPhone 14 Pro Max 1TB', 'Apple', 49990000, 'OLED 6.7" Super Retina XDR', 'iOS', N'Chính 48 MP & Phụ 12 MP, 12 MP', '12 MP', 'Apple A16 Bionic', 6, 1024, '4323 mAh', '/images/ip14promax.jpg'),
(31, 'Xiaomi Redmi 10A', 'Xiaomi', 2490000, 'IPS LCD 6.53" HD +', 'Android', N'Chính 13 MP & Phụ 2 MP', '5 MP', 'MediaTek Helio G25', 2, 32, '5000 mAh', '/images/redmi10a.jpg'),
(32, 'Xiaomi Redmi 9A', 'Xiaomi', 2290000, 'IPS LCD 6.53" HD +', 'Android', '13 MP', '5 MP', 'MediaTek Helio G25', 2, 32, '5000 mAh', '/images/redmi9a.jpg'),
(33, 'Xiaomi 11T Pro 5G', 'Xiaomi', 14390000, 'AMOLED 6.67" Full HD +', 'Android', 'Chính 108 MP & Phụ 8 MP, 5 MP', '16 MP', 'Snapdragon 888', 12, 256, '5000 mAh', '/images/xiaomi11tpro.jpg'),
(34, 'Samsung Galaxy S22 Ultra 512 GB', 'Samsung', 29990000, 'Dynamic AMOLED 2X 6.8" Quad HD + (2K +)', 'Android', N'Chính 108 MP & Phụ 12 MP, 10 MP, 10 MP', '40 MP', 'Snapdragon 8 Gen 1', 12, 512, '5000 mAh', '/images/s22ultra.jpg'),
(35, 'Samsung Galaxy M53', 'Samsung', 11990000, 'Super AMOLED Plus 6.7" Full HD +', 'Android', N'Chính 108 MP & Phụ 8 MP, 2 MP, 2 MP', '32 MP', 'MediaTek Dimensity 900 5G', 8, 256, '5000 mAh', '/images/m53.jpg'),
(36, 'Xiaomi 11 Lite 5G NE', 'Xiaomi', 8490000, 'AMOLED 6.55" Full HD +', 'Android', N'Chính 64 MP & Phụ 8 MP, 5 MP', '20 MP', 'Snapdragon 778G 5G' , 8, 128, '4250 mAh', '/images/11lite.jpg'),
(37, 'Xiaomi Redmi 9C', 'Xiaomi', 3290000, 'IPS LCD 6.53" HD +', 'Android', N'Chính 13 MP & Phụ 2 MP, 2 MP', '5 MP', 'MediaTek Helio G35', 4, 128, '5000 mAh', '/images/redmi9c.jpg'),
(38, 'iPhone 14 256 GB', 'Apple', 24990000, 'OLED 6.1" Super Retina XDR', 'iOS', '2 camera 12 MP', '12 MP', 'Apple A15 Bionic', 6, 256, '3279 mAh', '/images/ip14.jpg'),
(39, 'iPhone 14 Plus 256 GB', 'Apple', 27990000, 'OLED 6.7" Super Retina XDR', 'iOS', '2 camera 12 MP', '12 MP', 'Apple A15 Bionic', 6, 256, '4325 mAh', '/images/ip14plus.jpg'),
(40, 'Samsung Galaxy Z Fold3 5G', 'Samsung', 31990000, 'Dynamic AMOLED 2X Chính 7.6" & Phụ 6.2" Full HD+', 'Android', '3 camera 12 MP', '10 MP & 4 MP', 'Snapdragon 888', 12, 512, '4400 mAh', '/images/zfold3.jpg'),
(41, 'iPhone 13 mini 512 GB', 'Apple', 22490000, 'OLED 5.4" Super Retina XDR', 'iOS', '2 camera 12 MP', '12 MP', 'Apple A15 Bionic', 4, 512, '2438 mAh', '/images/ip13mini.jpg'),
(42, 'iPhone 13 512 GB', 'Apple', 25990000, 'OLED 6.1" Super Retina XDR', 'iOS', '2 camera 12 MP', '12 MP', 'Apple A15 Bionic', 4, 512, '3240 mAh', '/images/ip13.jpg'),
(43, 'OPPO A17', 'Oppo', 3790000, 'IPS LCD 6.56" HD +', 'Android', N'Chính 50 MP & Phụ 0.3 MP', '5 MP', 'MediaTek Helio G35', 4, 64, '5000 mAh', '/images/oppoa17.jpg'),
(44, 'Samsung Galaxy A04', 'Samsung', 2790000, 'IPS LCD 6.5" HD +', 'Android', N'Chính 50 MP & Phụ 2 MP', '5 MP', 'MediaTek Helio P35', 3, 32, '5000 mAh', '/images/a04.jpg'),
(45, 'Realme C33', 'Realme', 3690000, 'IPS LCD 6.5" HD +', 'Android', N'Chính 50 MP & Phụ 0.3 MP', '5 MP', 'Unisoc Tiger T612', 4, 64, '5000 mAh', '/images/realmec33.jpg'),
(46, 'Realme C30s', 'Realme', 2990000, 'IPS LCD 6.5" HD +', 'Android', '8 MP', '5 MP', 'Unisoc SC9863A1', 4, 64, '5000 mAh', '/images/realmec30s.jpg'),
(47, 'Nokia G11 Plus', 'Nokia', 3140000, 'TFT LCD 6.51" HD +', 'Android', N'Chính 50 MP & Phụ 2 MP', '8 MP', 'Unisoc T606', 3, 64, '5050 mAh', '/images/nokiag11+.jpg'),
(48, 'Vivo Y16', 'Vivo', 3790000, 'IPS LCD 6.51" HD +', 'Android', N'Chính 13 MP & Phụ 2 MP', '5 MP', 'MediaTek Helio P35', 4, 64, '5000 mAh', '/images/vivoy16.jpg'),
(49, 'Nokia C21 Plus', 'Nokia', 2790000, 'TFT LCD 6.5" HD +', 'Android', N'Chính 13 MP & Phụ 2 MP', '5 MP', 'Spreadtrum SC9863A', 3, 64, '5050 mAh', '/images/nokiac21+.jpg')
--Insert laptops
INSERT LAPTOPS (ID, Ten, Hang, Gia, ManHinh, OS, Webcam, NhuCau, Chip, VGA, Ram, Rom, Pin, KhoiLuong, CongGiaoTiep, ThietKe, ImagePath) VALUES (51, N'Nitro 5 Tiger AN515 58 769J', N'Acer', CAST(30990000.00 AS Decimal(18, 2)), N'15.6 inch FHD(1920 x 1080) IPS 144Hz SlimBezel', N'Windows 11 Home', N'720p HD audio/video recording', N'Gaming, Văn phòng, Đồ họa - Kỹ thuật', N'Intel Core i7-12700H up to 4.7GHz, 24MB Cache', N'NVIDIA® GeForce RTX™ 3050 4GB GDDR6', 8, 512, N'4 Cell 57.5WHr', 2.5, N'1x USB 3.2 Gen 2 Type-C Ports ; DisplayPort over USB-C; Thunderbolt 4; USB charging 5 V; 3 A; DC-in port 20 V; 65 W);1x USB 3.2 Gen 2 port featuring power-off USB charging;1x USB 3.2 Gen 2 port;1x USB 3.2 Gen 1 por', N'nhựa Polycarbonate với màu Obsidian Black', N'https://product.hstatic.net/1000026716/product/fe2769ba0040c59929f58641d85409_master_1b48676e034340379d49fab4078b5949_1c6ae60d0b2f422eafc29e6bab219a13.png'),
 (52, N'Aspire 5 A514 54 5127', N'Acer', CAST(18490000.00 AS Decimal(18, 2)), N'14" FHD (+A3:E41920 x 1080) IPS, Acer ComfyView LCD', N'Windows 11 Home', N'HD Camera', N'Văn phòng', N'Intel Core i5-1135G7 2.4GHz up to 4.2GHz 8MB', N'Intel® Iris® Xe Graphics', 8, 512, N'3 Cell 48WHrs', 1.45, N'1x USB 3.2 port with power-off charging;2x USB 3.2 port;1x USB Type-C port;1x RJ-45 port;1x HDMI® 2.0', N'Vỏ nhựa - nắp lưng bằng kim loại', N'https://product.hstatic.net/1000026716/product/laptop-acer-aspire-5-a514-54-5127-1_b245f3377c9b4339aad8148a99d67e08.jpg'),
 (53, N'Nitro 5 Tiger AN515 58 773Y', N'Acer', CAST(32990000.00 AS Decimal(18, 2)), N'15.6 inch FHD(1920 x 1080) IPS 144Hz SlimBezel', N'Windows 11 Home', N'720p HD audio/video recording', N'Gaming, Văn phòng, Đồ họa - Kỹ thuật', N'Intel Core i7-12700H up to 4.7GHz, 24MB Cache', N'NVIDIA® GeForce RTX™ 3050Ti 4GB GDDR6', 8, 512, N'4 Cell 57.5WHr', 2.5, N'1x USB 3.2 Gen 2 Type-C Ports ;1x USB 3.2 Gen 2 port featuring power-off USB charging;1x USB 3.2 Gen 2 port;1x USB 3.2 Gen 1 port;1x Ethernet (RJ-45) port', N'nhựa Polycarbonate với màu Obsidian Black', N'https://product.hstatic.net/1000026716/product/-tiger-an515-58-52sp-i5-12500h_21eec226f57c41a7865fdc18004a57c8_master_f56fd9b017244342821d65c8c49efe28.png'),

 (54, N'Nitro 5 Tiger AN515 58 52SP', N'Acer', CAST(27990000.00 AS Decimal(18, 2)), N'15.6 inch FHD(1920 x 1080) IPS 144Hz SlimBezel', N'Windows 11 Home', N'HD Webcam', N'Gaming, Văn phòng, Đồ họa - Kỹ thuật', N'Intel Core i5-12500H 3.3GHz up to 4.5GHz 18MB', N'NVIDIA® GeForce RTX™ 3050 4GB GDDR6', 8, 512, N'4 Cell 57.5WHr', 2.5, N'1x USB 3.2 Gen 2 Type-C Ports ;1x USB 3.2 Gen 2 port featuring power-off USB charging;1x USB 3.2 Gen 2 port;1x USB 3.2 Gen 1 port; support;1x 3.5 mm headphone/speaker jack;1x DC-in jack for AC adapter', N'nhựa Polycarbonate với màu Obsidian Black', N'https://product.hstatic.net/1000026716/product/gearvn-may-tinh-xach-tay-acer-nitro-5-an515-58-52sp-1_5358676a1607457184a6512bf81855a5.jpg'),
 (55, N'Pavilion 15 EG2036TX 6K782PA', N'HP', CAST(20590000.00 AS Decimal(18, 2)), N'15.6 inch FHD (1920 x 1080) IPS, micro-edge, BrightView, 250 nits, 45% NTSC', N'Windows 11 Home', N'HP Wide Vision 720p HD camera with temporal noise reduction and integrated dual array digital microphones', N'Văn phòng', N'Intel Core i5-1235U 1.3GHz up to 4.4GHz 12MB', N'NVIDIA GeForce MX550 2GB GDDR6 + Intel Iris Xe Graphics', 8, 512, N'3 Cell 43WHr', 1.74, N'1x SuperSpeed USB Type-C 10Gbps signaling rate (USB Power Delivery, DisplayPort 1.4, HP Sleep and Charge);2x SuperSpeed USB Type-A 5Gbps signaling rate;1x HDMI 2.1;1x AC smart pin;1x headphone/microphone combo', N'Vỏ nhựa - chiếu nghỉ tay bằng kim loại', N'https://product.hstatic.net/1000026716/product/c08149750_c308606069b64efe8d3c8f92a0594635.png'),

 (56, N'Pavilion 15 EG0513TU 46M12PA', N'HP', CAST(14190000.00 AS Decimal(18, 2)), N'15.6" FHD (1920 x 1080) IPS, micro-edge, BrightView, 250 nits, 45% NTSC', N'Windows 11', N'HP Wide Vision HD Camera', N'Văn phòng', N'Intel Core i3-1125G4 2.0GHz up to 3.7G+A6:H7Hz 8MB', N'Intel UHD Graphics', 4, 256, N'3 Cell 41WHr', 1.75, N'1x SuperSpeed USB Type-C® 10Gbps signaling rate (USB Power Delivery, DisplayPort™ 1.4, HP Sleep and Charge);2x SuperSpeed USB Type-A 5Gbps signaling rate;1x HDMI 2.0;1x AC smart pin;1x headphone/microphone combo', N'Vỏ nhựa - chiếu nghỉ tay bằng kim loại', N'https://product.hstatic.net/1000026716/product/laptop-hp-pavilion-15-eg0513tu-46m12pa-1_90e2f9d4f4754af2a064884081026ffb.jpg'),

 (57, N'Pavilion 15 EG0506TX 46M05PA', N'HP', CAST(19990000.00 AS Decimal(18, 2)), N'15.6" FHD (1920 x 1080) IPS, micro-edge, BrightView, 250 nits, 45% NTSC', N'Windows 11', N'HP Wide Vision HD Camera', N'Văn phòng', N'Intel Core i5-1135G7 2.4GHz up to 4.2GHz 8MB', N'NVIDIA GeForce MX450 2GB GDDR5 + Intel Iris Xe Graphics', 8, 512, N'3 Cell 41WHr', 1.75, N'1x SuperSpeed USB Type-C® 10Gbps signaling rate (USB Power Delivery, DisplayPort™ 1.4, HP Sleep and Charge);2x SuperSpeed USB Type-A 5Gbps signaling rate;1x HDMI 2.0;1x AC smart pin;1xheadphone/microphone combo', N'Vỏ nhựa - chiếu nghỉ tay bằng kim loại', N'https://product.hstatic.net/1000026716/product/laptop-hp-pavilion-15-eg0506tx-46m05pa-1_a04f18486f014aa38e272a7d85460bda.jpg'),

 (58, N'ProBook 450 G8 614K3PA', N'HP', CAST(20990000.00 AS Decimal(18, 2)), N'15.6" FHD (1920 x 1080) Diagonal IPS Anti-Glare WLED-Backlit, 45% NTSC, 250nits', N'Windows 11 Home', N'720p HD Camera', N'Văn phòng', N'Intel Core i5-1135G7 2.4GHz up to 4.2GHz 8MB', N'Intel Iris Xᵉ Graphics', 8, 512, N'3 Cell 45WHr', 1.74, N'1x USB 3.1 Gen 2 Type-C port;3x USB 3.1 Gen 1 Type-A ports (1 Charging, 1 Powered port);1x HDMI 1.4b;1x RJ-45 (Ethernet) port;1xHeadphone/microphone combo jack;1x AC power port;FingerPrint', N'Vỏ nhựa với màu Silver', N'https://product.hstatic.net/1000026716/product/laptop-hp-probook-450-g8-614k3pa-3_94b16d64e78f4fef96ccb69c2a8b7bd4.jpg'),

 (59, N'MacBook Pro 14 M1 Pro 2021', N'MacBook', CAST(53990000.00 AS Decimal(18, 2)), N'14.2"Liquid Retina XDR display (3024 x 1964)120Hz', N'Mac OS', N'1080p FaceTime HD camera', N'Văn phòng, Đồ họa - Kỹ thuật', N'Apple M1 Pro200GB/s', N'Apple M1 Card tích hợp 14 nhân GPU', 16, 512, N'70 WHr', 1.6, N'Jack tai nghe 3.5 mm;3 x Thunderbolt 4 USB-C;HDMI', N'Vỏ kim loại nguyên khối', N'https://cdn.tgdd.vn/Products/Images/44/253581/macbook-pro-14-m1-pro-2021-bac-2.jpg'),
 
 (60, N'XPS 15 9520 70295790', N'DELL', CAST(79990000.00 AS Decimal(18, 2)), N'15.6" inch, 3.5K QHD+ (3456 x 2160), OLED, touch-screen, 400 nit, Anti-reflective', N'Windows 11 Home', N'HD camera', N'Văn phòng, Đồ họa - Kỹ thuật', N'Intel Core i9-12900HK 3.8GHz up to 5.0GHz 18MB, 14 nhân, 20 luồng, 24 MB Intel Smart Cache', N'NVIDIA GeForce RTX 3050Ti 4GB GDDR6', 16, 512, N'6 Cell 86Whrs', 1.96, N'2x Thunderbolt 4 (USB Type-C with DisplayPort and Power Delivery);1 x USB 3.2 Gen 2 (Type-C) Port with DisplayPort;1 x 3.5mm headphone/microphone combo jack;1x SD-card Slot', N'Vỏ kim loại nguyên khối ', N'https://product.hstatic.net/1000026716/product/gearvn-laptop-dell-xps-15-9520-70295790-4_91711590f56c486da86d071f8c5e734b.png'),

 (61, N'ProArt Studiobook Pro 16 OLED W7600Z3A L2048W', N'Asus', CAST(82990000.00 AS Decimal(18, 2)), N'16” 4K (3840 x 2400) OLED 16:10, 0.2ms response time, 550nits, 100% DCI-P3, PANTONE Validated, Glossy display, 70% less harmful blue light', N'Windows 11 Home', N'HD camera with IR function to support Windows Hello with privacy shutter', N'Văn phòng, Đồ họa - Kỹ thuật', N'Intel Core i9-12900H 2.5GHz up to 5.0GHz 24MB', N'NVIDIA® RTX™ A3000 12GB GDDR6', 32, 1024, N'4 Cell 90WHrs', 2.4, N'2x Thunderbolt™ 4 supports display / power delivery;2x USB 3.2 Gen 2 Type-A;1x HDMI 2.1;1x 3.5mm Combo Audio Jack;1x RJ45 Gigabit Ethernet;1x DC-in
FingerPrint', N'Vỏ nhôm với màu Mineral Black Aluminum', N'https://product.hstatic.net/1000026716/product/gearvn-laptop-asus-proart-studiobook-pro-16-oled-w7600z3a-l2048w-2_508bb1962f1043c78f040f9e4d8d500d.png'),
 (62, N'Creator M16 A12UC 291VN', N'MSI', CAST(36990000.00 AS Decimal(18, 2)), N'16 inch QHD+ (2560 x 1600), IPS 60Hz, DCI-P3 100% typical, 500nits', N'Windows 10 Home', N'HD type (30fps@720p)', N'Văn phòng, Đồ họa - Kỹ thuật', N'Intel Core i7-12700H 3.5GHz up to 4.7GHz 24M, 14 nhân 20 luồng', N'NVIDIA GeForce RTX 3050 4GB GDDR6 Up to 1450MHz Boost Clock, 60W Maximum Graphics Power', 16, 512, N'3 Cell 53.5WHr', 2.2, N'1x Type-C USB 3.2 Gen1;2x Type-A USB 3.2 Gen1;1x Type-A USB 2.0;1x RJ45;1x (4K @ 60Hz) HDMI;1x Mic-in/Headphone-out Combo Jack', N'
Vỏ kim loại với màu Core Black', N'https://product.hstatic.net/1000026716/product/gearvn-laptop-msi-creator-m16-a12uc-291vn-3_1fe3ee20a3504cc0b600b0af46de94a9.png'),

 (63, N'AERO 16 XE5 73VN938AH', N'GIGABYTE', CAST(82990000.00 AS Decimal(18, 2)), N'15.6" UHD+ (3840x2400) Samsung AMOLED Display (VESA DisplayHDR 500 True Black, 100% DCI-P3)', N'Windows 10 Home', N'HD Camera', N'Văn phòng, Đồ họa - Kỹ thuật', N'Intel Core i7-12700H 3.6GHz up to 4.9GHz 25MB', N'NVIDIA® GeForce RTX™ 3070 Ti 8GB GDDR6 Boost Clock 1035 MHz / Maximum Graphics Power 105 W', 16, 2048, N'4 Cell 99 WHrs', 2.3, N'2x Thunderbolt™ 4 Support DP / one port support PD in 100W;1x USB 3.2 Gen2 (Type-C) Support DP;1x 3.5mm Audio Combo;1x DC-in Jack
Fingerprint', N'Vỏ hợp kim nhôm CNC', N'https://product.hstatic.net/1000026716/product/ero-16-xe5-73vn938ah-i7-12700h_79752fe99fec47c29314f3bf7a6092fd_master_f8b3314ef39f4e7ab2a90e30bf4e1611.png'),

 (64, N'Zenbook 17 Fold OLED UX9702AA MD014W', N'Asus', CAST(89990000.00 AS Decimal(18, 2)), N'17.3" 2.5K Tỷ lệ khung hình 4:3 (2560 x 1920) FOLED, 0,2 ms, 60Hz, Độ sáng tối đa 500 nit, DCI-P3 100%, Màn hình HDR True Black 500 VESA, PANTONE Validated, Glossy-Touch Screen', N'Windows 11 Home', N'Camera 5.0 IR with Windows Hello support', N'Văn phòng', N'CPU Intel® Core™ i7-1250U 1.1 GHz (12M Cache, lên đến 4.7 GHz, 2P+8E nhân)', N'Intel® Iris Xe Graphics', 16, 1024, N'75WHrs, 4S1P, 4-cell Li-ion', 1.5, N'2x Thunderbolt™ 4 supports display / power delivery;1x 3.5mm Combo Audio Jack', N'Nhôm - Magie', N'https://product.hstatic.net/1000026716/product/gearvn-laptop-asus-zenbook-17-fold-oled-ux9702aa-md014w-6_52a1234494484ec3ae4ec1564cdd9ca9.png'),

 (65, N'Vivobook 15X OLED A1503ZA L1151W', N'Asus', CAST(16990000.00 AS Decimal(18, 2)), N'15.6" FHD (1920 x 1080) OLED 16:9 aspect ratio, 0.2ms response time, 600nits peak brightness, 100% DCI-P3 color gamut, Contrast ratio: 1,000,000:1, VESA CERTIFIED Display HDR True Black 600, 1.07 billion colors, PANTONE Validated, Glossy display, 70%', N'Windows 11 Home', N'720p HD camera With privacy shutter', N'Văn phòng', N'Intel® Core™ i3-1220P Processor 1.1 GHz (12M Cache, up to 4.4 GHz, 10 cores)', N'Intel Iris Xe Graphics (with dual channel memory)
Intel® UHD Graphics (with single channel memory)', 8, 256, N'70WHrs, 3S1P, 3-cell Li-ion', 1.7, N'1x USB 2.0 Type-A;1 x USB 3.2 Gen 1 Type-C;2 x USB 3.2 Gen 1 Type-A;1 x HDMI 1.4;1 x 3.5mm Combo Audio Jack;1 x DC-in', N'nhựa Polycarbonate với màu Silver', N'https://product.hstatic.net/1000026716/product/gearvn-laptop-asus-vivobook-15x-oled-a1503za-l1151w-3_928974d7fc484bb3ad21e71a69770c9e.png'),

 (66, N'TUF A15 FA506ICB HN355W', N'Asus', CAST(21990000.00 AS Decimal(18, 2)), N'15.6inch FHD (1920 x 1080) IPS, 144Hz, Wide View, 250nits, Narrow Bezel, Non-Glare with 45% NTSC, 63% sRGB', N'Windows 11 Home', N'HD 720p CMOS module', N'Gaming, Văn phòng, Đồ họa - Kỹ thuật', N'AMD Ryzen 5 4600H 3.0GHz up to 4.0GHz 11MB, 6-core/ 12-thread', N'NVIDIA® GeForce RTX™ 3050 Laptop GPU 4GB GDDR6, up to 1600Mhz at 60W ( 75W with Dynamic Boost)', 8, 512, N'3 Cell 48WHr', 2.3, N'1x RJ45 LAN port;3x USB 3.2 Gen 1 Type-A;1x USB 3.2 Gen 1 Type-C support DisplayPort™;1x HDMI 2.0b;1x 3.5mm Combo Audio Jack', N'nhựa Polycarbonate với màu Graphite Black', N'https://product.hstatic.net/1000026716/product/gearvn-laptop-gaming-asus-tuf-a15-fa506icb-hn355w-3_15619a8e70154af9a530b93612377087.png'),

 (67, N'ROG Zephyrus G14 GA402RJ L8030W', N'Asus', CAST(53000000.00 AS Decimal(18, 2)), N'14" WQXGA (2560 x 1600) 16:10, IPS, 120Hz, 3ms, DCI-P3: 100%, Pantone Validated, anti-glare display, 500nits, Adaptive-Sync, Dolby vision', N'Windows 11 Home', N'720P HD IR Camera for Windows Hello', N'Gaming, Văn phòng, Đồ họa - Kỹ thuật', N'AMD Ryzen™ 7 6800HS 3.2GHz up to 4.7GHz 16MB', N'AMD Radeon™ RX 6700S 8GB GDDR6 With ROG Boost: up to 100W (SmartShift)', 16, 1024, N'4 Cell 76WHr', 1.6, N'1x USB 3.2 Gen 2 Type-C support DisplayPort™ / power delivery;1x USB 3.2 Gen 2 Type-C support DisplayPort™;2x USB 3.2 Gen 2 Type-A;1x 3.5mm Combo Audio Jack;1x HDMI 2.0b', N'nhựa Polycarbonate với màu Eclipse Gray', N'https://product.hstatic.net/1000026716/product/laptop-gaming-asus-rog-zephyrus-g14-ga402rj-l8030w-3_c357d3e823fc45d588f737466ea12a99.jpg'),

 (68, N'Legion 5 15ARH7H 82RE0036VN', N'Lenovo', CAST(43990000.00 AS Decimal(18, 2)), N'15.6" FHD (1920x1080) IPS 300nits Anti-glare, 165Hz, 100% sRGB, Dolby Vision, FreeSync, G-SYNC, DC dimmer', N'Windows 11 Home', N'FHD 1080p with E-camera Shutter', N'Gaming, Văn phòng, Đồ họa - Kỹ thuật', N'AMD Ryzen 7 6800H (8C / 16T, 3.2 / 4.7GHz, 4MB L2 / 16MB L3)', N'NVIDIA GeForce RTX 3050 Ti 4GB GDDR6, Boost Clock 1695MHz, TGP 95W', 16, 512, N'4Cell, 80WHrs', 2.35, N'2x USB 3.2 Gen 1;1x USB 3.2 Gen 1 ;2x USB-C 3.2 Gen 2 ;1x USB-C 3.2 Gen 2 ;1x HDMI, up to 8K/60Hz;1x Ethernet (RJ-45);1x Headphone / microphone combo jack (3.5mm);1x Power connector', N'Vỏ nhôm với màu Storm Grey', N'https://product.hstatic.net/1000026716/product/gearvn-laptop-gaming-lenovo-legion-5-15arh7h-82re0036vn-2_31fa28653a894ef793592b24e5c8b7d8.png'),

 (69, N'ThinkBook 13S G3 ACN 20YA003CVN', N'Lenovo', CAST(22490000.00 AS Decimal(18, 2)), N'13.3inch WUXGA (1920x1200) IPS 300nits Anti-glare, 100% sRGB, Dolby Vision', N'Windows 11 Home', N'720p with Privacy Shutter', N' Văn phòng', N'AMD Ryzen 5 5600U (6C / 12T, 2.3 / 4.2GHz, 3MB L2 / 16MB L3)', N'AMD Radeon Graphics', 8, 512, N'2cells 56Wh', 1.26, N'1x USB 3.2 Gen 1;1x USB 3.2 Gen 1 (Always On);1x USB-C 3.2 Gen 2 (support data transfer, Power Delivery 3.0, and DisplayPort 1.4);1x HDMI 2.0b;1x Headphone/microphone combo jack (3.5mm)', N'Vỏ nhôm với màu Mineral Grey ', N'https://product.hstatic.net/1000026716/product/gearvn-laptop-lenovo-thinkbook-13s-g3-acn-20ya003cvn-2_58ceaecf31aa44d195d14f8ebf6e5d35.png'),

 (70, N'IdeaPad 5 Pro 14ITL6 82L300M9VN', N'Lenovo', CAST(22990000.00 AS Decimal(18, 2)), N'14" 2.2K (2240x1400) IPS 300nits Anti-glare, 60Hz, 100% sRGB', N'Windows 11 Home', N'IR & HD 720p + ToF Sensor', N' Văn phòng', N'Intel Core i5-1135G7 2.5GHz up to 4.2GHz, 4 Cores 8 Threads ,8MB', N'Intel Iris Xe Graphics ', 8, 512, N'3 Cells 56.5WHrs', 1.38, N'1x USB 3.2 Gen 1;1x USB 3.2 Gen 1 ;1x USB-C 3.2 Gen 1 ;1x USB-C 3.2 Gen 1 ;1x HDMI 1.4b;1x Card reader;1x Headphone / microphone combo jack (3.5mm)', N'Vỏ nhôm với màu Cloud Grey', N'https://product.hstatic.net/1000026716/product/ideapad_5_pro_14itl6_ct1_03_98e97758bb51466591b7733e05a08384.png'),

 (71, N'U4 UD 50S1823SO', N'GIGABYTE', CAST(25490000.00 AS Decimal(18, 2)), N'14.0" FHD (1920x1080) Thin Bezel, IPS-level, Anti-glare Display LCD,', N'Windows 11 Home', N'14.0" FHD (1920x1080) Thin Bezel, IPS-level, Anti-glare Display LCD,', N' Văn phòng', N'Intel® Core™ i5-1155G7 (2.5GHz~4.5GHz)
', N'Intel Iris Xe graphics', 16, 512, N'36Wh', 0.99, N'1x USB 3.2 Gen1 (Type-A);1x USB 3.2 Gen2 (Type-A);1x Thunderbolt™ 4 (Type-C) (USB4 / DP / PD charging);1x HDMI 2.0 (with HDCP);1x Audio combo jack;1x MicroSD Card Reader;1x DC-in Jack', N'hợp kim nhôm magie', N'https://product.hstatic.net/1000026716/product/gearvn-laptop-gigabyte-u4-ud-50s1823so-2_59106787f3654ef499585f2ab36008ba.png'),

 (72, N'U4 UD 70S1823SO', N'GIGABYTE', CAST(25390000.00 AS Decimal(18, 2)), N'14.0" FHD (1920x1080) Thin Bezel, IPS-level, Anti-glare Display LCD,~100% sRGB', N'Windows 11 Home', N'HD Camera', N' Văn phòng', N'Intel Core i7-1195G7 (4 lõi, 8 luồng, tối đa 5,0 GHz)', N'Intel Iris Xe graphics', 16, 512, N'36Wh', 0.99, N'1x USB 3.2 Gen1 (Type-A);1x USB 3.2 Gen2 (Type-A);1x Thunderbolt™ 4 (Type-C) (USB4 / DP / PD charging);1x HDMI 2.0 (with HDCP);1x Audio combo jack;1x MicroSD Card Reader;1x DC-in Jack', N'hợp kim nhôm magie', N'https://product.hstatic.net/1000026716/product/gearvn-laptop-gigabyte-u4-ud-70s1823so-4_48c2c6269a504b628ae6d7d3c1e88fb9.png'),

 (73, N'G15 5511 70266676', N'DELL', CAST(19990001.00 AS Decimal(18, 2)), N'15.6" FHD (1920 x1080) 120Hz, 250 nits, WVA, Anti-Glare, LED Backlit, Narrow Border Display', N'Windows 11 Home', N'RGB HD camera (720p) ', N'Gaming, Văn phòng, Đồ họa - Kỹ thuật', N'Intel Core i5-11400H 2.7GHz up to 4.5GHz 12MB', N'NVIDIA GeForce RTX 3050 4GB GDDR6', 8, 256, N'3 Cell 56WHr', 2.65, N'1x USB 3.2 Gen 2 Type-C port with Display Port;3x USB 3.2 Gen 1;1x HDMI 2.1;1x RJ45
;1x headset port', N'nhựa Polycarbonate với màu Dark Shadow Grey', N'https://product.hstatic.net/1000026716/product/laptops_g-series_g15_5511_dark_shadow_gray_rgb_kb_media_gallery_3_51b4653b72c74ce1842d6ca268ed6b0d.png'),

 (74, N'G15 5525 R5H085W11GR3050', N'DELL', CAST(26490000.00 AS Decimal(18, 2)), N'15.6-inch FHD (1920 x1080) 120Hz, 250 nits, WVA, Anti-Glare, LED Backlit, Narrow Border Display', N'Windows 11 Home', N'HD camera (720p) ', N'Gaming, Văn phòng, Đồ họa - Kỹ thuật', N'AMD Ryzen 5 6600H (19MB Cache, 3.3GHz, Turbo Boost 4.5GHz), 6 Cores 12 Threads', N'NVIDIA® GeForce RTX™ 3050 4GB GDDR6', 8, 512, N'3 Cell 56WHr', 2.72, N'3x USB 3.2 Gen 1 ;1x USB 3.2 Gen 1;Type-C port with DisplayPort with alt mode 1x HDMI 2.1;1x RJ45;1x Headphones/mic', N'nhựa Polycarbonate với màu Dark Shadow Grey', N'https://product.hstatic.net/1000026716/product/gearvn-laptop-gaming-dell-g15-5525-r5h085w11gr3050-4_942c0132f33e4b6d8e9338c02a84e1b4.png'),

 (75, N'G15 5520 i7H165W11GR3050T', N'DELL', CAST(37990000.00 AS Decimal(18, 2)), N'15.6-inch FHD (1920 x1080) 165Hz 300 nits WVA Anti-Glare LED Backlit Narrow Border Display', N'Windows 11 Home SL', N'HD camera (720p) ', N'Gaming, Văn phòng, Đồ họa - Kỹ thuật', N'Intel Core i7-12700H (14 Cores 20 Threads, 24MB Cache, 3.5 GHz, Turbo Boost 4.7 GHz)', N'NVIDIA GeForce RTX 3050Ti 4GB GDDR6', 16, 512, N'3 Cell 56WHr', 2.67, N'3x USB 3.2 Gen 1 ;1x USB 3.2 Gen 1;Type-C port with DisplayPort with alt mode; 1x HDMI 2.1;1x RJ45;1x Headphones/mic', N'nhựa Polycarbonate với màu Dark Shadow Grey', N'https://product.hstatic.net/1000026716/product/gearvn-laptop-gaming-dell-g15-5520-i7h165w11gr3050t-2_b1872ad3872049a58cf2570ac299a2f4.png'),

 (76, N'G15 5520 P105F008 71000334', N'DELL', CAST(41590000.00 AS Decimal(18, 2)), N'15.6-inch FHD (1920 x1080) 165Hz, 300 nits, WVA Anti-Glare, 100% sRGB, LED Backlit, Narrow Border Display', N'Windows 11 Home SL', N'HD camera (720p) ', N'Gaming, Văn phòng, Đồ họa - Kỹ thuật', N'Intel Core i7-12700H (14 Cores 20 Threads, 24MB Cache, 3.5 GHz, Turbo Boost 4.7 GHz)', N'NVIDIA GeForce RTX™ 3060 6GB GDDR6', 16, 512, N'6 Cell 86WHrs', 2.67, N'3x USB 3.2 Gen 1 ;1x USB 3.2 Gen 1;Type-C port with DisplayPort with alt mode 1x HDMI 2.1
1x RJ45;1x Headphones/mic', N'nhựa Polycarbonate với màu Dark Shadow Grey', N'https://product.hstatic.net/1000026716/product/gearvn-laptop-gaming-dell-g15-5520-p105f008-71000334-2_defb59f79da544a7b4fe89cbfff76863.png'),

 (77, N'Gram 2022 14Z90Q G.AJ53A5', N'LG', CAST(31290000.00 AS Decimal(18, 2)), N'14 inch WUXGA (1920x1200), 16:10, IPS, DCI-P3 99%, LGD, 350 nits, Anti-Glare', N'Windows 11 Home', N'Webcam IR FHD IR with Dual Mic', N'Văn phòng', N'Intel Core i5-1240P 3.3GHz up to 4.4GHz 12MB', N'Intel Iris Xe Graphics', 8, 256, N'72WHr', 0.999, N'2x Thunderbolt 4 supports display / power delivery;2x USB 3.2 Gen2;1x HDMI;1x 3.5mm Combo Audio Jack', N'hợp kim magie', N'https://product.hstatic.net/1000026716/product/dz-4_8647e49a42554713bdfc13a46b0cfbff.jpg'),

 (78, N'Gram 2022 14Z90Q G.AJ32A5', N'LG', CAST(25990000.00 AS Decimal(18, 2)), N'14 inch WUXGA (1920x1200), 16:10, IPS, DCI-P3 99%, LGD, 350 nits, Anti-Glare', N'Windows 11 Home', N'Webcam IR FHD IR with Dual Mic', N'Văn phòng', N'Intel Core i3-1220P 1.1GHz up to 4.4GHz 12MB', N'Intel UHD Graphics', 8, 256, N'72WHr', 0.999, N'2x Thunderbolt 4 supports display / power delivery;2x USB 3.2 Gen2;1x HDMI;1x 3.5mm Combo Audio Jack', N'hợp kim magie', N'https://product.hstatic.net/1000026716/product/022-14z90q-g-aj32a5-i3-1220p-1_ffb7c901da534c9480961af03cc13cdd_master_d08a94f18391473fb0915a045f56bd42.png'),

 (79, N'Gram 2022', N'LG', CAST(37790000.00 AS Decimal(18, 2)), N'14 inch WUXGA (1920x1200), 16:10, IPS, DCI-P3 99%, LGD, 350 nits, Anti-Glare', N'Windows 11 Home', N'Webcam IR FHD IR with Dual Mic', N'Văn phòng', N'Intel Core i7-1260P 1.5GHz up to 4.7GHz 18MB', N'Intel Iris Xe Graphics', 16, 512, N'72WHr', 0.999, N'2x Thunderbolt 4 supports display / power delivery;2x USB 3.2 Gen2;1x HDMI;1x 3.5mm Combo Audio Jack', N'hợp kim magie', N'https://product.hstatic.net/1000026716/product/022-14z90q-g-aj32a5-i3-1220p-1_ffb7c901da534c9480961af03cc13cdd_master_726ed92a7e5342468a96c766aa17cb7c.png'),

 (80, N'Gram 2022', N'LG', CAST(41990000.00 AS Decimal(18, 2)), N'16 inch WQXGA (2560 x 1600), 16:10, IPS, DCI-P3 99%, LGD, 350 nits, Anti-Glare', N'Windows 11 Home', N'Webcam IR FHD IR with Dual Mic', N'Văn phòng', N'Intel Core i5-1240P 1.7GHz up to 4.4GHz 12MB', N'Intel Iris Xe Graphics', 16, 256, N'80WHr', 1.199, N'2x Thunderbolt 4 supports display / power delivery;2x USB 3.2 Gen2;1x HDMI;1x 3.5mm Combo Audio Jack', N'hợp kim magie', N'https://product.hstatic.net/1000026716/product/022-16z90q-g-ah52a5-i5-1240p-1_2e9bc64c971f4c6996994035e663b022_master_2a6d9bc9707e410c948eef7e79ce7a25.png')

 CREATE TABLE GIOHANG(
IDGH int not null PRIMARY KEY,
NgayMua date not null,
TongGia decimal
)

CREATE TABLE CTGIOHANG(

IDGH int FOREIGN KEY REFERENCES GIOHANG(IDGH),
IDSP int not null,
ImagePath nvarchar(550) not null,
DonGia decimal not null,
SoLuong int not null,
PRIMARY KEY(IDGH, IDSP)
)

INSERT INTO GIOHANG VALUES (0, GETDATE(), 0)