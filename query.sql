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
Chip nvarchar(250) not null,
Ram int not null,
Rom int not null,
Pin nvarchar(250) not null,
ImagePath nvarchar(550) not null,

)

INSERT INTO PHONES(ID,Ten, Hang, Gia, ManHinh, OS, CameraSau, CameraTruoc,Chip,Ram,Rom,Pin,ImagePath)
VALUES(0, N'iPhone 14 Pro Max 128 GB', N'Apple', 33990000, N'OLED 6.7" Super Retina XDR', N'iOS', N'Chính 48 MP & Phụ 12 MP, 12 MP', '12 MP', N'Apple A16 Bionic', 6, 128, N'4323 mAh', '/images/ip14promax.jpg'),
(1, N'iPhone 14 Pro', 'Apple', 30590000, N'OLED 6.1 Super Retina XDR',  'iOS', N'Chính 48 MP & Phụ 12 MP, 12 MP','12 MP', 'Apple A16 Bionic', 6, 128, '3200 mAh', '/images/ip14pro.jpg')
 select * from PHONES
 DELETE FROM PHONES