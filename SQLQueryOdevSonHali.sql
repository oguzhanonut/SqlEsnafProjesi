create table tblOtobusSoforleri
(
oSoforID tinyint identity(1,1) primary key,
oSoforAdi varchar(50) ,
oSoforSoyad varchar(50),
oSoforTelNo char(11)constraint tekillik_oSoforTelNo unique(oSoforTelNo) not null,
oSoforYas tinyint

)

create table tblServisSoforleri
(
sSoforID tinyint  identity(1,1) primary key,
sSoforAdi varchar(50) ,
sSoforSoyadi varchar(50) ,
sSoforTelNo char(11) not null,
sSoforYas tinyint
)
create table tblOtobusler
(
OtobusID tinyint  identity(1,1) primary key,
oPlaka varchar(8) constraint tekillik_oPlaka unique(oPlaka) not null,
oSoforID_OtobusSoforleri tinyint foreign key(oSoforID_OtobusSoforleri) references tblOtobusSoforleri(oSoforID)
)
create table tblServisler
(
ServisID tinyint identity(1,1) primary key,
sPlaka varchar(9)constraint tekillik_sPlaka unique (sPlaka)not null,
sSoforID_ServisSoforleri tinyint foreign key (sSoforID_ServisSoforleri) references tblServisSoforleri(sSoforID)
)
create table tblFirmalar
(
FirmaID tinyint identity(1,1) primary key,
FirmaAdi varchar(20)
)
create table tblOkullar
(
OkulID tinyint identity(1,1) primary key,
OkulAdi varchar(30)

)
create table tblVeliler
(
VeliID smallint identity(1,1) primary key,
VeliAdi varchar(30),
VeliSoyadi varchar(30),
VeliTelNo char(11) constraint tekillik_VeliTelNo unique(VeliTelNo)

)
create table tblkarabukIlceleri
(
KarabukIlceleriID tinyint identity(1,1) primary key,
IlceAdi varchar(20)
)
create table tblMahalleler
(
MahalleID tinyint identity(1,1) primary key,
MahalleAdi varchar(30)
)
create table tblYolcuAdres
(
YolcuAdresID smallint identity(1,1) primary key,
IlceID_KarabukIlceleri tinyint foreign key(IlceID_KarabukIlceleri) references tblKarabukIlceleri(KarabukIlceleriID),
MahalleID_Mahalleler tinyint foreign key(MahalleID_Mahalleler) references tblMahalleler(MahalleID) 


)

create table tblOgrenciAdres
(
OgrenciAdresID smallint identity(1,1) primary key,
IlceID_KarabukIlceleri tinyint foreign key(IlceID_KarabukIlceleri) references tblKarabukIlceleri(KarabukIlceleriID),
MahalleID_Mahalleler tinyint foreign key (IlceID_KarabukIlceleri) references tblMahalleler(MahalleID)

)
create table tblOgrenciler
(
OgrenciID smallint identity(1,1) primary key,
OgrenciAdi varchar(30),
OgrenciSoyadi varchar(40),
OkulID_Okullar tinyint foreign key(OkulID_Okullar) references tblOkullar(OkulID),
AdresID_OgrenciAdres smallint foreign key(AdresID_OgrenciAdres) references tblOgrenciAdres(OgrenciAdresID),
VeliID_Veliler smallint foreign key(VeliID_Veliler) references tblVeliler(VeliId)
)
create table tblyolcular
(
YolcuID smallint identity(1,1) primary key,
YolcuAdi varchar(50),
YolcuSoyadi varchar(40),
AdresID_YolcuAdres smallint foreign key(AdresID_YolcuAdres) references tblyolcuAdres(YolcuAdresID),
FirmaID_Firmalar tinyint foreign key (FirmaID_Firmalar) references tblFirmalar(FirmaID)
)
create table tblGenelTabloOgrenci
(
ID smallint identity(1,1) primary key,
ServisID tinyint foreign key(ServisID) references tblServisler(ServisID),
sSoforID tinyint foreign key(sSoforID) references tblServisSoforleri(sSoforID),
OgrenciID smallint foreign key(OgrenciID)references tblOgrenciler(OgrenciID),
AdresID_OgrenciAdres smallint foreign key (AdresID_OgrenciAdres) references tblOgrenciAdres(OgrenciAdresID),
OkulID_Okullar tinyint foreign key (OkulID_Okullar) references tblOkullar(OkulID), 
VeliID_Veliler smallint foreign key(VeliID_Veliler) references tblVeliler(VeliID)
)
create table tblGeneltabloYolcu
(
ID smallint identity(1,1) primary key ,
OtobusID tinyint foreign key (OtobusID) references tblOtobusler(OtobusID),
oSoforID tinyint foreign key(oSoforID) references tblOtobusSoforleri(oSoforID),
AdresID_YolcuAdres smallint foreign key(AdresID_YolcuAdres) references tblYolcuAdres(YolcuAdresID),
FirmaID_Firmalar tinyint foreign key (FÝrmaID_Firmalar) references tblFirmalar(FirmaID)
)

------------------------------------------------------------------------------------

insert into tblOtobusSoforleri
(oSoforAdi,oSoforSoyad,oSoforTelNo,oSoforYas)
values
('Musa','Önüt',05438788787,52)

----------------------------------------------
insert into tblServisSoforleri
(sSoforAdi,sSoforSoyadi,sSoforTelNo,sSoforYas)
values
('Sadýk','Tunçkaya',05421342324,54)
-----------------------------------------------
insert into tblOtobusler
(oPlaka,oSoforID_OtobusSoforleri)
values
('78s0131',1)
------------------------------------
insert into tblServisler
(sPlaka,sSoforID_ServisSoforleri)
values
('78s0098',1)
------------------------------------------
insert into tblFirmalar
(FirmaAdi)
values
('kardemir')
------------------------------------------
insert into tblOkullar
(OkulAdi)
values
('Atatürk')
-------------------------------------
insert into tblVeliler
(VeliAdi,VeliSoyadi,VeliTelNo)
values
('Serhat','Goktepe',05412365432)
---------------------------------------
insert into tblkarabukIlceleri
(IlceAdi)
values
('safranbolu')
----------------------------------------
insert into tblMahalleler
(MahalleAdi)
values
('barýþ mah')
----------------------------------------
insert into tblYolcuAdres
(IlceID_KarabukIlceleri,MahalleID_Mahalleler)
values
(1,1)
------------------------------------------
insert into tblOgrenciAdres
(IlceID_KarabukIlceleri,MahalleID_Mahalleler)
values
(1,1)
--------------------------------------------
insert into tblOgrenciler
(OgrenciAdi,OgrenciSoyadi,OkulID_Okullar,AdresID_OgrenciAdres,VeliID_Veliler)
values
('Oðuzhan','Önüt',1,1,1)
--------------------------------------------
insert into tblyolcular
(YolcuAdi,YolcuSoyadi,FirmaID_Firmalar,AdresID_YolcuAdres)
values
('elvan','baser',1,1)
--------------------------------------------
insert into tblGenelTabloOgrenci
(ServisID,sSoforID,OgrenciID,AdresID_OgrenciAdres,OkulID_Okullar,VeliID_Veliler)
values
(1,1,1,1,1,1)
--------------------------------------------
insert into tblGeneltabloYolcu
(OtobusID,oSoforID,AdresID_YolcuAdres,FirmaID_Firmalar)
values
(1,1,1,1)




select * from tblGeneltabloYolcu
