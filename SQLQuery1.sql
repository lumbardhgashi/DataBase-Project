Create database Aeroporti

use Aeroporti

create table Testi(
FAA_Test_No int Primary key,
Emri varchar(40) Not Null ,
PiketMax int 
);

create table Aeroplani(
Numri_regjistrimit char(15) Primary Key
);
Create database Aeroporti

use Aeroporti

create table Testi(
FAA_Test_No int Primary key,
Emri varchar(40) Not Null ,
PiketMax int 
);

create table Aeroplani(
Numri_regjistrimit char(15) Primary Key
);

create table Testimi(
Data_Testimit Date ,
Score int ,
Oret char(10) ,
FAA int ,
Nr_Regjistrimit char(15) ,
Primary key(FAA,Nr_Regjistrimit),
Foreign key (FAA) references Testi(FAA_Test_No),
Foreign key (Nr_Regjistrimit) references  Aeroplani(Numri_regjistrimit)
);

create table Kompania_EA(
ID_MA char(10) Primary key ,
DataLicencimit date ,
DataEMbarimitLicences date ,
);

create table MirembajtjaEAeroplaneve(
Nr_RegjAeroplanit char(15),
IDKompania_EA char(10),
Primary key(Nr_RegjAeroplanit,IDKompania_EA),
Foreign key(Nr_RegjAeroplanit) references Aeroplani(Numri_regjistrimit),
Foreign key(IDKompania_EA)references Kompania_EA(ID_MA)
); 

create table Modeli(
Numri_Modelit char(15)Primary key,
KapaciteiAeroplanit int ,
Pesha char(25)
);

create table Perket(
NR_MODEL char(15),
Nr_RegjistrimAE CHAR(15),
Primary key(Nr_RegjistrimAE,NR_MODEL),
Foreign key(Nr_RegjistrimAE) references Aeroplani(Numri_regjistrimit),
Foreign key(NR_MODEL) references Modeli(Numri_Modelit)
);

create table Airoporti(
Emri varchar(50) Primary key
);

create table Akomoduar(
Emri_Aeroportit varchar(50),
Numri_Model char(15),
Primary key(Emri_Aeroportit,Numri_Model),
foreign key (Emri_Aeroportit) references Airoporti(Emri),
foreign key (Numri_Model) references Modeli(Numri_Modelit)
);

create table KompaniaPerMirembajtjenAiroportit(
ID_MEA char(20) Primary key ,
DataLicencimit date,
DataMbarimitLicences date 
);

create table MirembajtjaAiroportit(
Emri_Aeroportit varchar(50),
ID_mea char(20),
Primary key(Emri_Aeroportit,ID_mea),
foreign key (Emri_Aeroportit) references Airoporti(Emri) ,
foreign key (ID_mea) references KompaniaPerMirembajtjenAiroportit(ID_MEA)
);

create table Klienti(
Passaporta char(15) Primary key ,
DataLindjes date ,
viza char(5),
);

create table Udheton(
VendiKuDoUdhetoj varchar(70),
Nr_MOD char(15) ,
Pass char(15),
Primary key (Nr_MOD,Pass),
Foreign key(Nr_MOD) references Modeli(Numri_Modelit),
Foreign key(Pass) references Klienti(Passaporta)
);


create table IRritur(
PassPort char(15),
primary key (PassPort),
Foreign key (PassPort) references Klienti(Passaporta)
);

create table Femija(
PassPort char(15),
ID_Rritur char(15),
primary key (PassPort,ID_Rritur),
Foreign key (PassPort) references Klienti(Passaporta),
Foreign key (ID_Rritur) references IRritur(PassPort)
);

create table Punonjesi(
SSN char(20) Primary key,
Emri varchar(40) Not null ,
Paga money,
NumriUnionit char(15),
Rruga varchar(40),
Qyteti varchar(30),
ZipKodi char(15),
);





create table NumriTelefonit(
Nr_Tel char(15),
SSN_A char(20),
Primary key(Nr_Tel),
Foreign key(SSN_A) references Punonjesi(SSN)
);
Drop table NumriTelefonit

create table Punon(
SSN char(20),
Emri_Aeroportit varchar(50),
Primary key(Emri_Aeroportit,SSN),
Foreign key (Emri_Aeroportit) references Airoporti(Emri),
Foreign key (SSN) references Punonjesi(SSN)
);

create table PunetoriTeknik(
SSN char(20) ,
Numri_Modelit char(15)
Primary key(SSN,Numri_Modelit),
Foreign key (SSN) references Punonjesi(SSN),
Foreign key (Numri_Modelit) references Modeli(Numri_Modelit)
);

create table KontrolluesTrafiku(
DataEkzaminimitMjeksor Date ,
SSN char(20),
Primary key(DataEkzaminimitMjeksor),
Foreign key (SSN) references Punonjesi(SSN)
);

Drop table KontrolluesTrafiku


insert into Testi values ('12345','Emri1','60')
insert into Testi values ('12346','Emri2','69')
insert into Testi values ('12347','Emri3','70')
insert into Testi values ('12344','Emri4','75')
insert into Testi values ('12348','Emri5','80')
insert into Testi values ('12349','Emri6','79')
insert into Testi values ('12355','Emri7','62')
insert into Testi values ('12356','Emri8','90')
insert into Testi values ('12357','Emri9','750')
insert into Testi values ('12358','Emri10','100')

Select *
From Testi

insert into Aeroplani values ('01')
insert into Aeroplani values ('02')
insert into Aeroplani values ('03')
insert into Aeroplani values ('04')
insert into Aeroplani values ('05')
insert into Aeroplani values ('06')
insert into Aeroplani values ('07')
insert into Aeroplani values ('08')
insert into Aeroplani values ('09')
insert into Aeroplani values ('010')

Select *
From Aeroplani

insert into Testimi values('04/05/2021','65','2:25','12345','01')
insert into Testimi values('04/05/2021','65','2:25','12346','01')
insert into Testimi values('04/05/2021','65','2:25','12347','02')
insert into Testimi values('04/05/2021','65','2:25','12348','02')
insert into Testimi values('04/05/2021','65','2:25','12349','03')
insert into Testimi values('04/05/2021','75','4:05','12348','03')
insert into Testimi values('05/04/2021','78','3:45','12355','03')
insert into Testimi values('09/06/2021','55','12:52','12349','04')
insert into Testimi values('09/07/2021','91','20:27','12358','04')
insert into Testimi values('10/01/2021','53','22:28','12358','05')
insert into Testimi values('02/02/2021','71','24:45','12356','05')
insert into Testimi values('04/03/2021','64','21:15','12357','06')
insert into Testimi values('11/04/2021','85','17:05','12355','06')
insert into Testimi values('12/05/2021','79','18:59','12356','06')
insert into Testimi values('12/06/2021','51','19:00','12346','06')
insert into Testimi values('10/07/2021','84','20:01','12345','07')
insert into Testimi values('05/08/2021','79','13:33','12346','07')
insert into Testimi values('05/09/2021','88','14:06','12347','08')
insert into Testimi values('06/10/2021','99','15:03','12348','08')
insert into Testimi values('08/11/2021','100','16:09','12346','08')
insert into Testimi values('09/11/2021','67','17:51','12349','08')
insert into Testimi values('01/12/2021','66','18:08','12349','09')
insert into Testimi values('01/12/2021','85','19:33','12355','09')
insert into Testimi values('06/12/2021','78','20:34','12356','010')
insert into Testimi values('07/05/2021','77','09:46','12357','010')
insert into Testimi values('08/12/2021','76','10:49','12358','010')


Select *
From Testimi

insert into Kompania_EA values('EA01','08/12/2008','08/05/2024')
insert into Kompania_EA values('EA02','11/01/2006','09/09/2025')
insert into Kompania_EA values('EA03','10/12/2007','10/08/2026')
insert into Kompania_EA values('EA04','09/07/2012','11/07/2026')
insert into Kompania_EA values('EA05','05/08/2011','12/08/2027')
insert into Kompania_EA values('EA06','03/09/2010','12/10/2028')
insert into Kompania_EA values('EA07','07/12/2014','11/11/2029')
insert into Kompania_EA values('EA08','05/10/2015','04/10/2030')
insert into Kompania_EA values('EA09','09/11/2019','05/11/2030')
insert into Kompania_EA values('EA10','08/12/2020','10/12/2031')

Select *
From Kompania_EA

insert into MirembajtjaEAeroplaneve values ('01','EA01')
insert into MirembajtjaEAeroplaneve values ('02','EA01')
insert into MirembajtjaEAeroplaneve values ('03','EA01')
insert into MirembajtjaEAeroplaneve values ('04','EA02')
insert into MirembajtjaEAeroplaneve values ('05','EA02')
insert into MirembajtjaEAeroplaneve values ('06','EA02')
insert into MirembajtjaEAeroplaneve values ('07','EA03')
insert into MirembajtjaEAeroplaneve values ('08','EA03')
insert into MirembajtjaEAeroplaneve values ('09','EA03')
insert into MirembajtjaEAeroplaneve values ('010','EA04')
insert into MirembajtjaEAeroplaneve values ('01','EA04')
insert into MirembajtjaEAeroplaneve values ('02','EA04')
insert into MirembajtjaEAeroplaneve values ('03','EA04')
insert into MirembajtjaEAeroplaneve values ('04','EA05')
insert into MirembajtjaEAeroplaneve values ('05','EA05')
insert into MirembajtjaEAeroplaneve values ('06','EA05')
insert into MirembajtjaEAeroplaneve values ('07','EA06')
insert into MirembajtjaEAeroplaneve values ('08','EA06')
insert into MirembajtjaEAeroplaneve values ('09','EA06')
insert into MirembajtjaEAeroplaneve values ('010','EA07')
insert into MirembajtjaEAeroplaneve values ('01','EA07')
insert into MirembajtjaEAeroplaneve values ('02','EA07')
insert into MirembajtjaEAeroplaneve values ('03','EA07')
insert into MirembajtjaEAeroplaneve values ('04','EA07')
insert into MirembajtjaEAeroplaneve values ('05','EA08')
insert into MirembajtjaEAeroplaneve values ('06','EA08')

SELECT *
From MirembajtjaEAeroplaneve

insert into Modeli values('DC01','250','50 T')
insert into Modeli values('DC02','150','30 T')
insert into Modeli values('DC03','230','42 T')
insert into Modeli values('DC04','290','59 T')
insert into Modeli values('DC05','280','58 T')
insert into Modeli values('DC06','270','55 T')
insert into Modeli values('DC07','300','65 T')
insert into Modeli values('DC08','310','66 T')
insert into Modeli values('DC09','225','51 T')
insert into Modeli values('DC10','273','62 T')

Select * 
From Modeli

insert into Perket values ('DC01','01')
insert into Perket values ('DC02','02')
insert into Perket values ('DC03','03')
insert into Perket values ('DC04','04')
insert into Perket values ('DC05','05')
insert into Perket values ('DC06','06')
insert into Perket values ('DC07','07')
insert into Perket values ('DC08','08')
insert into Perket values ('DC09','09')
insert into Perket values ('DC10','010')
insert into Perket values ('DC01','07')
insert into Perket values ('DC02','06')
insert into Perket values ('DC03','05')
insert into Perket values ('DC04','08')
insert into Perket values ('DC05','03')
insert into Perket values ('DC06','02')
insert into Perket values ('DC07','010')
insert into Perket values ('DC08','09')
insert into Perket values ('DC09','08')
insert into Perket values ('DC10','07')
insert into Perket values ('DC01','06')
insert into Perket values ('DC02','05')
insert into Perket values ('DC03','04')
insert into Perket values ('DC04','03')
insert into Perket values ('DC05','02')
insert into Perket values ('DC06','01')

Select *
From Perket

insert into Airoporti values('Adem Jashari1')
insert into Airoporti values('Adem Jashari2')
insert into Airoporti values('Adem Jashari3')
insert into Airoporti values('Adem Jashari4')
insert into Airoporti values('Adem Jashari5')
insert into Airoporti values('Adem Jashari6')
insert into Airoporti values('Adem Jashari7')
insert into Airoporti values('Adem Jashari8')
insert into Airoporti values('Adem Jashari9')
insert into Airoporti values('Adem Jashari10')

Select*
From Airoporti

insert into Akomoduar values('Adem Jashari1','DC01')
insert into Akomoduar values('Adem Jashari2','DC01')
insert into Akomoduar values('Adem Jashari3','DC01')
insert into Akomoduar values('Adem Jashari4','DC01')
insert into Akomoduar values('Adem Jashari5','DC02')
insert into Akomoduar values('Adem Jashari6','DC02')
insert into Akomoduar values('Adem Jashari7','DC02')
insert into Akomoduar values('Adem Jashari8','DC02')
insert into Akomoduar values('Adem Jashari9','DC03')
insert into Akomoduar values('Adem Jashari10','DC03')
insert into Akomoduar values('Adem Jashari1','DC03')
insert into Akomoduar values('Adem Jashari2','DC03')
insert into Akomoduar values('Adem Jashari3','DC04')
insert into Akomoduar values('Adem Jashari4','DC04')
insert into Akomoduar values('Adem Jashari5','DC04')
insert into Akomoduar values('Adem Jashari6','DC04')
insert into Akomoduar values('Adem Jashari7','DC05')
insert into Akomoduar values('Adem Jashari8','DC05')
insert into Akomoduar values('Adem Jashari9','DC05')
insert into Akomoduar values('Adem Jashari10','DC05')
insert into Akomoduar values('Adem Jashari1','DC06')
insert into Akomoduar values('Adem Jashari2','DC06')
insert into Akomoduar values('Adem Jashari3','DC06')
insert into Akomoduar values('Adem Jashari4','DC06')
insert into Akomoduar values('Adem Jashari5','DC07')
insert into Akomoduar values('Adem Jashari6','DC07')

Select *
From Akomoduar

insert into KompaniaPerMirembajtjenAiroportit values('MEA01','08/12/2008','08/05/2024')
insert into KompaniaPerMirembajtjenAiroportit values('MEA02','11/01/2006','09/09/2025')
insert into KompaniaPerMirembajtjenAiroportit values('MEA03','10/12/2007','10/08/2026')
insert into KompaniaPerMirembajtjenAiroportit values('MEA04','09/07/2012','11/07/2026')
insert into KompaniaPerMirembajtjenAiroportit values('MEA05','05/08/2011','12/08/2027')
insert into KompaniaPerMirembajtjenAiroportit values('MEA06','03/09/2010','12/10/2028')
insert into KompaniaPerMirembajtjenAiroportit values('MEA07','07/12/2014','11/11/2029')
insert into KompaniaPerMirembajtjenAiroportit values('MEA08','05/10/2015','04/10/2030')
insert into KompaniaPerMirembajtjenAiroportit values('MEA09','09/11/2019','05/11/2030')
insert into KompaniaPerMirembajtjenAiroportit values('MEA10','08/12/2020','10/12/2031')

Select *
From KompaniaPerMirembajtjenAiroportit

insert into MirembajtjaAiroportit values('Adem Jashari1','MEA01')
insert into MirembajtjaAiroportit values('Adem Jashari2','MEA01')
insert into MirembajtjaAiroportit values('Adem Jashari3','MEA01')
insert into MirembajtjaAiroportit values('Adem Jashari4','MEA01')
insert into MirembajtjaAiroportit values('Adem Jashari5','MEA02')
insert into MirembajtjaAiroportit values('Adem Jashari6','MEA02')
insert into MirembajtjaAiroportit values('Adem Jashari7','MEA02')
insert into MirembajtjaAiroportit values('Adem Jashari8','MEA02')
insert into MirembajtjaAiroportit values('Adem Jashari9','MEA03')
insert into MirembajtjaAiroportit values('Adem Jashari10','MEA03')
insert into MirembajtjaAiroportit values('Adem Jashari1','MEA03')
insert into MirembajtjaAiroportit values('Adem Jashari2','MEA03')
insert into MirembajtjaAiroportit values('Adem Jashari3','MEA04')
insert into MirembajtjaAiroportit values('Adem Jashari4','MEA04')
insert into MirembajtjaAiroportit values('Adem Jashari5','MEA04')
insert into MirembajtjaAiroportit values('Adem Jashari6','MEA04')
insert into MirembajtjaAiroportit values('Adem Jashari7','MEA05')
insert into MirembajtjaAiroportit values('Adem Jashari8','MEA05')
insert into MirembajtjaAiroportit values('Adem Jashari9','MEA05')
insert into MirembajtjaAiroportit values('Adem Jashari10','MEA05')
insert into MirembajtjaAiroportit values('Adem Jashari1','MEA06')
insert into MirembajtjaAiroportit values('Adem Jashari2','MEA06')
insert into MirembajtjaAiroportit values('Adem Jashari3','MEA06')
insert into MirembajtjaAiroportit values('Adem Jashari4','MEA06')
insert into MirembajtjaAiroportit values('Adem Jashari5','MEA07')
insert into MirembajtjaAiroportit values('Adem Jashari6','MEA07')

Select *
From MirembajtjaAiroportit

insert into Klienti values('P01','12/24/2001','V01')
insert into Klienti values('P02','02/04/2000','V02')
insert into Klienti values('P03','11/14/2015','V03')
insert into Klienti values('P04','10/12/2009','V04')
insert into Klienti values('P05','12/11/2000','V05')
insert into Klienti values('P06','09/15/1955','V06')
insert into Klienti values('P07','08/21/1975','V07')
insert into Klienti values('P08','05/28/1969','V08')
insert into Klienti values('P09','06/30/1982','V09')
insert into Klienti values('P10','07/31/1993','V10')
insert into Klienti values('P11','05/15/1997','V11')
insert into Klienti values('P12','05/03/1999','V12')
insert into Klienti values('P13','11/14/2013','V13')
insert into Klienti values('P14','12/02/2014','V14')
insert into Klienti values('P15','08/21/2016','V15')
insert into Klienti values('P16','01/23/2008','V16')
insert into Klienti values('P17','02/04/2018','V17')
insert into Klienti values('P18','02/11/2022','V18')
insert into Klienti values('P19','05/25/2015','V19')
insert into Klienti values('P20','09/30/2019','V20')

SELECT*
from Klienti

insert into Udheton values('Kosove','DC01','P01')
insert into Udheton values('Kosove','DC01','P02')
insert into Udheton values('Kosove','DC01','P03')
insert into Udheton values('Kosove','DC01','P04')
insert into Udheton values('Kosove','DC01','P05')
insert into Udheton values('Kosove','DC01','P06')
insert into Udheton values('Kosove','DC01','P07')
insert into Udheton values('Kosove','DC01','P08')
insert into Udheton values('Kosove','DC01','P09')
insert into Udheton values('Kosove','DC01','P10')
insert into Udheton values('Maldive','DC02','P01')
insert into Udheton values('Maldive','DC02','P02')
insert into Udheton values('Maldive','DC02','P03')
insert into Udheton values('Maldive','DC02','P04')
insert into Udheton values('Maldive','DC02','P05')
insert into Udheton values('Maldive','DC02','P06')
insert into Udheton values('Maldive','DC02','P07')
insert into Udheton values('Maldive','DC02','P08')
insert into Udheton values('Maldive','DC02','P09')
insert into Udheton values('Maldive','DC02','P10')
insert into Udheton values('Zvicer','DC03','P01')
insert into Udheton values('Zvicer','DC03','P02')
insert into Udheton values('Zvicer','DC03','P03')
insert into Udheton values('Zvicer','DC03','P04')
insert into Udheton values('Zvicer','DC03','P05')

Select *
From Udheton

insert into IRritur values('P01')
insert into IRritur values('P02')
insert into IRritur values('P05')
insert into IRritur values('P06')
insert into IRritur values('P07')
insert into IRritur values('P08')
insert into IRritur values('P09')
insert into IRritur values('P10')
insert into IRritur values('P11')
insert into IRritur values('P12')

Select * 
From IRritur

insert into Femija values('P03','P01')
insert into Femija values('P04','P02')
insert into Femija values('P13','P05')
insert into Femija values('P14','P06')
insert into Femija values('P15','P07')
insert into Femija values('P16','P08')
insert into Femija values('P17','P09')
insert into Femija values('P18','P10')
insert into Femija values('P19','P11')
insert into Femija values('P20','P12')


Select * 
From Femija

insert into Punonjesi values('S01','Emri01','2500$','U01','Rruga1','Qyteti1','Z01')
insert into Punonjesi values('S02','Emri02','500$','U02','Rruga1','Qyteti1','Z01')
insert into Punonjesi values('S03','Emri03','3400$','U03','Rruga2','Qyteti2','Z02')
insert into Punonjesi values('S04','Emri04','2100$','U04','Rruga2','Qyteti2','Z02')
insert into Punonjesi values('S05','Emri05','2200$','U05','Rruga3','Qyteti3','Z03')
insert into Punonjesi values('S06','Emri06','1200$','U06','Rruga3','Qyteti3','Z03')
insert into Punonjesi values('S07','Emri07','1800$','U07','Rruga4','Qyteti4','Z04')
insert into Punonjesi values('S08','Emri08','1954$','U08','Rruga4','Qyteti4','Z04')
insert into Punonjesi values('S09','Emri09','1234$','U09','Rruga5','Qyteti5','Z05')
insert into Punonjesi values('S10','Emri10','5124$','U10','Rruga5','Qyteti5','Z05')

Select *
From Punonjesi

insert into NumriTelefonit values ('123456789','S01')
insert into NumriTelefonit values ('123456788','S01')
insert into NumriTelefonit values ('123456787','S01')
insert into NumriTelefonit values ('123456786','S02')
insert into NumriTelefonit values ('123456785','S02')
insert into NumriTelefonit values ('123456784','S02')
insert into NumriTelefonit values ('123456783','S03')
insert into NumriTelefonit values ('123456782','S03')
insert into NumriTelefonit values ('123456781','S03')
insert into NumriTelefonit values ('123456780','S04')
insert into NumriTelefonit values ('123456779','S04')
insert into NumriTelefonit values ('123456778','S04')
insert into NumriTelefonit values ('123456777','S05')
insert into NumriTelefonit values ('123456776','S05')
insert into NumriTelefonit values ('123456775','S05')
insert into NumriTelefonit values ('123456774','S05')
insert into NumriTelefonit values ('123456773','S06')
insert into NumriTelefonit values ('123456772','S06')
insert into NumriTelefonit values ('123456771','S06')
insert into NumriTelefonit values ('123456770','S07')
insert into NumriTelefonit values ('123456689','S07')
insert into NumriTelefonit values ('123456688','S07')
insert into NumriTelefonit values ('123456687','S08')
insert into NumriTelefonit values ('123456686','S09')
insert into NumriTelefonit values ('123456685','S10')
insert into NumriTelefonit values ('123456684','S09')
insert into NumriTelefonit values ('123456683','S08')
insert into NumriTelefonit values ('123456682','S07')

Select *
From NumriTelefonit

insert into Punon values('S01','Adem Jashari1')
insert into Punon values('S02','Adem Jashari1')
insert into Punon values('S03','Adem Jashari1')
insert into Punon values('S04','Adem Jashari2')
insert into Punon values('S05','Adem Jashari2')
insert into Punon values('S06','Adem Jashari2')
insert into Punon values('S07','Adem Jashari3')
insert into Punon values('S08','Adem Jashari3')
insert into Punon values('S09','Adem Jashari3')
insert into Punon values('S10','Adem Jashari4')
insert into Punon values('S01','Adem Jashari4')
insert into Punon values('S02','Adem Jashari4')
insert into Punon values('S03','Adem Jashari5')
insert into Punon values('S04','Adem Jashari5')
insert into Punon values('S05','Adem Jashari5')
insert into Punon values('S06','Adem Jashari6')
insert into Punon values('S07','Adem Jashari6')
insert into Punon values('S08','Adem Jashari6')
insert into Punon values('S09','Adem Jashari7')
insert into Punon values('S10','Adem Jashari7')
insert into Punon values('S01','Adem Jashari7')
insert into Punon values('S02','Adem Jashari8')
insert into Punon values('S03','Adem Jashari8')
insert into Punon values('S04','Adem Jashari10')
insert into Punon values('S05','Adem Jashari9')

Select *
From Punon

insert into PunetoriTeknik values('S01','DC01')
insert into PunetoriTeknik values('S01','DC02')
insert into PunetoriTeknik values('S01','DC03')
insert into PunetoriTeknik values('S01','DC04')
insert into PunetoriTeknik values('S01','DC05')
insert into PunetoriTeknik values('S01','DC06')
insert into PunetoriTeknik values('S02','DC07')
insert into PunetoriTeknik values('S02','DC08')
insert into PunetoriTeknik values('S02','DC09')
insert into PunetoriTeknik values('S03','DC10')
insert into PunetoriTeknik values('S03','DC01')
insert into PunetoriTeknik values('S03','DC02')
insert into PunetoriTeknik values('S03','DC03')
insert into PunetoriTeknik values('S03','DC04')
insert into PunetoriTeknik values('S04','DC05')
insert into PunetoriTeknik values('S04','DC06')
insert into PunetoriTeknik values('S04','DC07')
insert into PunetoriTeknik values('S04','DC08')
insert into PunetoriTeknik values('S04','DC09')
insert into PunetoriTeknik values('S04','DC10')
insert into PunetoriTeknik values('S04','DC01')
insert into PunetoriTeknik values('S05','DC02')
insert into PunetoriTeknik values('S05','DC03')
insert into PunetoriTeknik values('S05','DC04')
insert into PunetoriTeknik values('S05','DC05')

Select *
From PunetoriTeknik

insert into KontrolluesTrafiku values ('01/01/2021','S06')
insert into KontrolluesTrafiku values ('02/21/2021','S06')
insert into KontrolluesTrafiku values ('03/22/2021','S07')
insert into KontrolluesTrafiku values ('04/12/2021','S07')
insert into KontrolluesTrafiku values ('05/13/2021','S08')
insert into KontrolluesTrafiku values ('06/14/2021','S08')
insert into KontrolluesTrafiku values ('07/15/2021','S09')
insert into KontrolluesTrafiku values ('08/16/2021','S09')
insert into KontrolluesTrafiku values ('09/17/2021','S10')
insert into KontrolluesTrafiku values ('10/18/2021','S10')

Select *
From KontrolluesTrafiku

create table Testimi(
Data_Testimit Date ,
Score int ,
Oret char(10) ,
FAA int ,
Nr_Regjistrimit char(15) ,
Primary key(FAA,Nr_Regjistrimit),
Foreign key (FAA) references Testi(FAA_Test_No),
Foreign key (Nr_Regjistrimit) references  Aeroplani(Numri_regjistrimit)
);

create table Kompania_EA(
ID_MA char(10) Primary key ,
DataLicencimit date ,
DataEMbarimitLicences date ,
);

create table MirembajtjaEAeroplaneve(
Nr_RegjAeroplanit char(15),
IDKompania_EA char(10),
Primary key(Nr_RegjAeroplanit,IDKompania_EA),
Foreign key(Nr_RegjAeroplanit) references Aeroplani(Numri_regjistrimit),
Foreign key(IDKompania_EA)references Kompania_EA(ID_MA)
); 

create table Modeli(
Numri_Modelit char(15)Primary key,
KapaciteiAeroplanit int ,
Pesha char(25)
);

create table Perket(
NR_MODEL char(15),
Nr_RegjistrimAE CHAR(15),
Primary key(Nr_RegjistrimAE,NR_MODEL),
Foreign key(Nr_RegjistrimAE) references Aeroplani(Numri_regjistrimit),
Foreign key(NR_MODEL) references Modeli(Numri_Modelit)
);

create table Airoporti(
Emri varchar(50) Primary key
);

create table Akomoduar(
Emri_Aeroportit varchar(50),
Numri_Model char(15),
Primary key(Emri_Aeroportit,Numri_Model),
foreign key (Emri_Aeroportit) references Airoporti(Emri),
foreign key (Numri_Model) references Modeli(Numri_Modelit)
);

create table KompaniaPerMirembajtjenAiroportit(
ID_MEA char(20) Primary key ,
DataLicencimit date,
DataMbarimitLicences date 
);

create table MirembajtjaAiroportit(
Emri_Aeroportit varchar(50),
ID_mea char(20),
Primary key(Emri_Aeroportit,ID_mea),
foreign key (Emri_Aeroportit) references Airoporti(Emri) ,
foreign key (ID_mea) references KompaniaPerMirembajtjenAiroportit(ID_MEA)
);

create table Klienti(
Passaporta char(15) Primary key ,
DataLindjes date ,
viza char(5),
);

create table Udheton(
VendiKuDoUdhetoj varchar(70),
Nr_MOD char(15) ,
Pass char(15),
Primary key (Nr_MOD,Pass),
Foreign key(Nr_MOD) references Modeli(Numri_Modelit),
Foreign key(Pass) references Klienti(Passaporta)
);


create table IRritur(
PassPort char(15),
primary key (PassPort),
Foreign key (PassPort) references Klienti(Passaporta)
);

create table Femija(
PassPort char(15),
ID_Rritur char(15),
primary key (PassPort,ID_Rritur),
Foreign key (PassPort) references Klienti(Passaporta),
Foreign key (ID_Rritur) references IRritur(PassPort)
);

create table Punonjesi(
SSN char(20) Primary key,
Emri varchar(40) Not null ,
Paga money,
NumriUnionit char(15),
Rruga varchar(40),
Qyteti varchar(30),
ZipKodi char(15),
);





create table NumriTelefonit(
Nr_Tel char(15),
SSN_A char(20),
Primary key(Nr_Tel),
Foreign key(SSN_A) references Punonjesi(SSN)
);
Drop table NumriTelefonit

create table Punon(
SSN char(20),
Emri_Aeroportit varchar(50),
Primary key(Emri_Aeroportit,SSN),
Foreign key (Emri_Aeroportit) references Airoporti(Emri),
Foreign key (SSN) references Punonjesi(SSN)
);

create table PunetoriTeknik(
SSN char(20) ,
Numri_Modelit char(15)
Primary key(SSN,Numri_Modelit),
Foreign key (SSN) references Punonjesi(SSN),
Foreign key (Numri_Modelit) references Modeli(Numri_Modelit)
);

create table KontrolluesTrafiku(
DataEkzaminimitMjeksor Date ,
SSN char(20),
Primary key(DataEkzaminimitMjeksor),
Foreign key (SSN) references Punonjesi(SSN)
);

Drop table KontrolluesTrafiku


insert into Testi values ('12345','Emri1','60')
insert into Testi values ('12346','Emri2','69')
insert into Testi values ('12347','Emri3','70')
insert into Testi values ('12344','Emri4','75')
insert into Testi values ('12348','Emri5','80')
insert into Testi values ('12349','Emri6','79')
insert into Testi values ('12355','Emri7','62')
insert into Testi values ('12356','Emri8','90')
insert into Testi values ('12357','Emri9','750')
insert into Testi values ('12358','Emri10','100')

Select *
From Testi

insert into Aeroplani values ('01')
insert into Aeroplani values ('02')
insert into Aeroplani values ('03')
insert into Aeroplani values ('04')
insert into Aeroplani values ('05')
insert into Aeroplani values ('06')
insert into Aeroplani values ('07')
insert into Aeroplani values ('08')
insert into Aeroplani values ('09')
insert into Aeroplani values ('010')

Select *
From Aeroplani

insert into Testimi values('04/05/2021','65','2:25','12345','01')
insert into Testimi values('04/05/2021','65','2:25','12346','01')
insert into Testimi values('04/05/2021','65','2:25','12347','02')
insert into Testimi values('04/05/2021','65','2:25','12348','02')
insert into Testimi values('04/05/2021','65','2:25','12349','03')
insert into Testimi values('04/05/2021','75','4:05','12348','03')
insert into Testimi values('05/04/2021','78','3:45','12355','03')
insert into Testimi values('09/06/2021','55','12:52','12349','04')
insert into Testimi values('09/07/2021','91','20:27','12358','04')
insert into Testimi values('10/01/2021','53','22:28','12358','05')
insert into Testimi values('02/02/2021','71','24:45','12356','05')
insert into Testimi values('04/03/2021','64','21:15','12357','06')
insert into Testimi values('11/04/2021','85','17:05','12355','06')
insert into Testimi values('12/05/2021','79','18:59','12356','06')
insert into Testimi values('12/06/2021','51','19:00','12346','06')
insert into Testimi values('10/07/2021','84','20:01','12345','07')
insert into Testimi values('05/08/2021','79','13:33','12346','07')
insert into Testimi values('05/09/2021','88','14:06','12347','08')
insert into Testimi values('06/10/2021','99','15:03','12348','08')
insert into Testimi values('08/11/2021','100','16:09','12346','08')
insert into Testimi values('09/11/2021','67','17:51','12349','08')
insert into Testimi values('01/12/2021','66','18:08','12349','09')
insert into Testimi values('01/12/2021','85','19:33','12355','09')
insert into Testimi values('06/12/2021','78','20:34','12356','010')
insert into Testimi values('07/05/2021','77','09:46','12357','010')
insert into Testimi values('08/12/2021','76','10:49','12358','010')


Select *
From Testimi

insert into Kompania_EA values('EA01','08/12/2008','08/05/2024')
insert into Kompania_EA values('EA02','11/01/2006','09/09/2025')
insert into Kompania_EA values('EA03','10/12/2007','10/08/2026')
insert into Kompania_EA values('EA04','09/07/2012','11/07/2026')
insert into Kompania_EA values('EA05','05/08/2011','12/08/2027')
insert into Kompania_EA values('EA06','03/09/2010','12/10/2028')
insert into Kompania_EA values('EA07','07/12/2014','11/11/2029')
insert into Kompania_EA values('EA08','05/10/2015','04/10/2030')
insert into Kompania_EA values('EA09','09/11/2019','05/11/2030')
insert into Kompania_EA values('EA10','08/12/2020','10/12/2031')

Select *
From Kompania_EA

insert into MirembajtjaEAeroplaneve values ('01','EA01')
insert into MirembajtjaEAeroplaneve values ('02','EA01')
insert into MirembajtjaEAeroplaneve values ('03','EA01')
insert into MirembajtjaEAeroplaneve values ('04','EA02')
insert into MirembajtjaEAeroplaneve values ('05','EA02')
insert into MirembajtjaEAeroplaneve values ('06','EA02')
insert into MirembajtjaEAeroplaneve values ('07','EA03')
insert into MirembajtjaEAeroplaneve values ('08','EA03')
insert into MirembajtjaEAeroplaneve values ('09','EA03')
insert into MirembajtjaEAeroplaneve values ('010','EA04')
insert into MirembajtjaEAeroplaneve values ('01','EA04')
insert into MirembajtjaEAeroplaneve values ('02','EA04')
insert into MirembajtjaEAeroplaneve values ('03','EA04')
insert into MirembajtjaEAeroplaneve values ('04','EA05')
insert into MirembajtjaEAeroplaneve values ('05','EA05')
insert into MirembajtjaEAeroplaneve values ('06','EA05')
insert into MirembajtjaEAeroplaneve values ('07','EA06')
insert into MirembajtjaEAeroplaneve values ('08','EA06')
insert into MirembajtjaEAeroplaneve values ('09','EA06')
insert into MirembajtjaEAeroplaneve values ('010','EA07')
insert into MirembajtjaEAeroplaneve values ('01','EA07')
insert into MirembajtjaEAeroplaneve values ('02','EA07')
insert into MirembajtjaEAeroplaneve values ('03','EA07')
insert into MirembajtjaEAeroplaneve values ('04','EA07')
insert into MirembajtjaEAeroplaneve values ('05','EA08')
insert into MirembajtjaEAeroplaneve values ('06','EA08')

SELECT *
From MirembajtjaEAeroplaneve

insert into Modeli values('DC01','250','50 T')
insert into Modeli values('DC02','150','30 T')
insert into Modeli values('DC03','230','42 T')
insert into Modeli values('DC04','290','59 T')
insert into Modeli values('DC05','280','58 T')
insert into Modeli values('DC06','270','55 T')
insert into Modeli values('DC07','300','65 T')
insert into Modeli values('DC08','310','66 T')
insert into Modeli values('DC09','225','51 T')
insert into Modeli values('DC10','273','62 T')

Select * 
From Modeli

insert into Perket values ('DC01','01')
insert into Perket values ('DC02','02')
insert into Perket values ('DC03','03')
insert into Perket values ('DC04','04')
insert into Perket values ('DC05','05')
insert into Perket values ('DC06','06')
insert into Perket values ('DC07','07')
insert into Perket values ('DC08','08')
insert into Perket values ('DC09','09')
insert into Perket values ('DC10','010')
insert into Perket values ('DC01','07')
insert into Perket values ('DC02','06')
insert into Perket values ('DC03','05')
insert into Perket values ('DC04','08')
insert into Perket values ('DC05','03')
insert into Perket values ('DC06','02')
insert into Perket values ('DC07','010')
insert into Perket values ('DC08','09')
insert into Perket values ('DC09','08')
insert into Perket values ('DC10','07')
insert into Perket values ('DC01','06')
insert into Perket values ('DC02','05')
insert into Perket values ('DC03','04')
insert into Perket values ('DC04','03')
insert into Perket values ('DC05','02')
insert into Perket values ('DC06','01')

Select *
From Perket

insert into Airoporti values('Adem Jashari1')
insert into Airoporti values('Adem Jashari2')
insert into Airoporti values('Adem Jashari3')
insert into Airoporti values('Adem Jashari4')
insert into Airoporti values('Adem Jashari5')
insert into Airoporti values('Adem Jashari6')
insert into Airoporti values('Adem Jashari7')
insert into Airoporti values('Adem Jashari8')
insert into Airoporti values('Adem Jashari9')
insert into Airoporti values('Adem Jashari10')

Select*
From Airoporti

insert into Akomoduar values('Adem Jashari1','DC01')
insert into Akomoduar values('Adem Jashari2','DC01')
insert into Akomoduar values('Adem Jashari3','DC01')
insert into Akomoduar values('Adem Jashari4','DC01')
insert into Akomoduar values('Adem Jashari5','DC02')
insert into Akomoduar values('Adem Jashari6','DC02')
insert into Akomoduar values('Adem Jashari7','DC02')
insert into Akomoduar values('Adem Jashari8','DC02')
insert into Akomoduar values('Adem Jashari9','DC03')
insert into Akomoduar values('Adem Jashari10','DC03')
insert into Akomoduar values('Adem Jashari1','DC03')
insert into Akomoduar values('Adem Jashari2','DC03')
insert into Akomoduar values('Adem Jashari3','DC04')
insert into Akomoduar values('Adem Jashari4','DC04')
insert into Akomoduar values('Adem Jashari5','DC04')
insert into Akomoduar values('Adem Jashari6','DC04')
insert into Akomoduar values('Adem Jashari7','DC05')
insert into Akomoduar values('Adem Jashari8','DC05')
insert into Akomoduar values('Adem Jashari9','DC05')
insert into Akomoduar values('Adem Jashari10','DC05')
insert into Akomoduar values('Adem Jashari1','DC06')
insert into Akomoduar values('Adem Jashari2','DC06')
insert into Akomoduar values('Adem Jashari3','DC06')
insert into Akomoduar values('Adem Jashari4','DC06')
insert into Akomoduar values('Adem Jashari5','DC07')
insert into Akomoduar values('Adem Jashari6','DC07')

Select *
From Akomoduar

insert into KompaniaPerMirembajtjenAiroportit values('MEA01','08/12/2008','08/05/2024')
insert into KompaniaPerMirembajtjenAiroportit values('MEA02','11/01/2006','09/09/2025')
insert into KompaniaPerMirembajtjenAiroportit values('MEA03','10/12/2007','10/08/2026')
insert into KompaniaPerMirembajtjenAiroportit values('MEA04','09/07/2012','11/07/2026')
insert into KompaniaPerMirembajtjenAiroportit values('MEA05','05/08/2011','12/08/2027')
insert into KompaniaPerMirembajtjenAiroportit values('MEA06','03/09/2010','12/10/2028')
insert into KompaniaPerMirembajtjenAiroportit values('MEA07','07/12/2014','11/11/2029')
insert into KompaniaPerMirembajtjenAiroportit values('MEA08','05/10/2015','04/10/2030')
insert into KompaniaPerMirembajtjenAiroportit values('MEA09','09/11/2019','05/11/2030')
insert into KompaniaPerMirembajtjenAiroportit values('MEA10','08/12/2020','10/12/2031')

Select *
From KompaniaPerMirembajtjenAiroportit

insert into MirembajtjaAiroportit values('Adem Jashari1','MEA01')
insert into MirembajtjaAiroportit values('Adem Jashari2','MEA01')
insert into MirembajtjaAiroportit values('Adem Jashari3','MEA01')
insert into MirembajtjaAiroportit values('Adem Jashari4','MEA01')
insert into MirembajtjaAiroportit values('Adem Jashari5','MEA02')
insert into MirembajtjaAiroportit values('Adem Jashari6','MEA02')
insert into MirembajtjaAiroportit values('Adem Jashari7','MEA02')
insert into MirembajtjaAiroportit values('Adem Jashari8','MEA02')
insert into MirembajtjaAiroportit values('Adem Jashari9','MEA03')
insert into MirembajtjaAiroportit values('Adem Jashari10','MEA03')
insert into MirembajtjaAiroportit values('Adem Jashari1','MEA03')
insert into MirembajtjaAiroportit values('Adem Jashari2','MEA03')
insert into MirembajtjaAiroportit values('Adem Jashari3','MEA04')
insert into MirembajtjaAiroportit values('Adem Jashari4','MEA04')
insert into MirembajtjaAiroportit values('Adem Jashari5','MEA04')
insert into MirembajtjaAiroportit values('Adem Jashari6','MEA04')
insert into MirembajtjaAiroportit values('Adem Jashari7','MEA05')
insert into MirembajtjaAiroportit values('Adem Jashari8','MEA05')
insert into MirembajtjaAiroportit values('Adem Jashari9','MEA05')
insert into MirembajtjaAiroportit values('Adem Jashari10','MEA05')
insert into MirembajtjaAiroportit values('Adem Jashari1','MEA06')
insert into MirembajtjaAiroportit values('Adem Jashari2','MEA06')
insert into MirembajtjaAiroportit values('Adem Jashari3','MEA06')
insert into MirembajtjaAiroportit values('Adem Jashari4','MEA06')
insert into MirembajtjaAiroportit values('Adem Jashari5','MEA07')
insert into MirembajtjaAiroportit values('Adem Jashari6','MEA07')

Select *
From MirembajtjaAiroportit

insert into Klienti values('P01','12/24/2001','V01')
insert into Klienti values('P02','02/04/2000','V02')
insert into Klienti values('P03','11/14/2015','V03')
insert into Klienti values('P04','10/12/2009','V04')
insert into Klienti values('P05','12/11/2000','V05')
insert into Klienti values('P06','09/15/1955','V06')
insert into Klienti values('P07','08/21/1975','V07')
insert into Klienti values('P08','05/28/1969','V08')
insert into Klienti values('P09','06/30/1982','V09')
insert into Klienti values('P10','07/31/1993','V10')
insert into Klienti values('P11','05/15/1997','V11')
insert into Klienti values('P12','05/03/1999','V12')
insert into Klienti values('P13','11/14/2013','V13')
insert into Klienti values('P14','12/02/2014','V14')
insert into Klienti values('P15','08/21/2016','V15')
insert into Klienti values('P16','01/23/2008','V16')
insert into Klienti values('P17','02/04/2018','V17')
insert into Klienti values('P18','02/11/2022','V18')
insert into Klienti values('P19','05/25/2015','V19')
insert into Klienti values('P20','09/30/2019','V20')

SELECT*
from Klienti

insert into Udheton values('Kosove','DC01','P01')
insert into Udheton values('Kosove','DC01','P02')
insert into Udheton values('Kosove','DC01','P03')
insert into Udheton values('Kosove','DC01','P04')
insert into Udheton values('Kosove','DC01','P05')
insert into Udheton values('Kosove','DC01','P06')
insert into Udheton values('Kosove','DC01','P07')
insert into Udheton values('Kosove','DC01','P08')
insert into Udheton values('Kosove','DC01','P09')
insert into Udheton values('Kosove','DC01','P10')
insert into Udheton values('Maldive','DC02','P01')
insert into Udheton values('Maldive','DC02','P02')
insert into Udheton values('Maldive','DC02','P03')
insert into Udheton values('Maldive','DC02','P04')
insert into Udheton values('Maldive','DC02','P05')
insert into Udheton values('Maldive','DC02','P06')
insert into Udheton values('Maldive','DC02','P07')
insert into Udheton values('Maldive','DC02','P08')
insert into Udheton values('Maldive','DC02','P09')
insert into Udheton values('Maldive','DC02','P10')
insert into Udheton values('Zvicer','DC03','P01')
insert into Udheton values('Zvicer','DC03','P02')
insert into Udheton values('Zvicer','DC03','P03')
insert into Udheton values('Zvicer','DC03','P04')
insert into Udheton values('Zvicer','DC03','P05')

Select *
From Udheton

insert into IRritur values('P01')
insert into IRritur values('P02')
insert into IRritur values('P05')
insert into IRritur values('P06')
insert into IRritur values('P07')
insert into IRritur values('P08')
insert into IRritur values('P09')
insert into IRritur values('P10')
insert into IRritur values('P11')
insert into IRritur values('P12')

Select * 
From IRritur

insert into Femija values('P03','P01')
insert into Femija values('P04','P02')
insert into Femija values('P13','P05')
insert into Femija values('P14','P06')
insert into Femija values('P15','P07')
insert into Femija values('P16','P08')
insert into Femija values('P17','P09')
insert into Femija values('P18','P10')
insert into Femija values('P19','P11')
insert into Femija values('P20','P12')


Select * 
From Femija

insert into Punonjesi values('S01','Emri01','2500$','U01','Rruga1','Qyteti1','Z01')
insert into Punonjesi values('S02','Emri02','500$','U02','Rruga1','Qyteti1','Z01')
insert into Punonjesi values('S03','Emri03','3400$','U03','Rruga2','Qyteti2','Z02')
insert into Punonjesi values('S04','Emri04','2100$','U04','Rruga2','Qyteti2','Z02')
insert into Punonjesi values('S05','Emri05','2200$','U05','Rruga3','Qyteti3','Z03')
insert into Punonjesi values('S06','Emri06','1200$','U06','Rruga3','Qyteti3','Z03')
insert into Punonjesi values('S07','Emri07','1800$','U07','Rruga4','Qyteti4','Z04')
insert into Punonjesi values('S08','Emri08','1954$','U08','Rruga4','Qyteti4','Z04')
insert into Punonjesi values('S09','Emri09','1234$','U09','Rruga5','Qyteti5','Z05')
insert into Punonjesi values('S10','Emri10','5124$','U10','Rruga5','Qyteti5','Z05')

Select *
From Punonjesi

insert into NumriTelefonit values ('123456789','S01')
insert into NumriTelefonit values ('123456788','S01')
insert into NumriTelefonit values ('123456787','S01')
insert into NumriTelefonit values ('123456786','S02')
insert into NumriTelefonit values ('123456785','S02')
insert into NumriTelefonit values ('123456784','S02')
insert into NumriTelefonit values ('123456783','S03')
insert into NumriTelefonit values ('123456782','S03')
insert into NumriTelefonit values ('123456781','S03')
insert into NumriTelefonit values ('123456780','S04')
insert into NumriTelefonit values ('123456779','S04')
insert into NumriTelefonit values ('123456778','S04')
insert into NumriTelefonit values ('123456777','S05')
insert into NumriTelefonit values ('123456776','S05')
insert into NumriTelefonit values ('123456775','S05')
insert into NumriTelefonit values ('123456774','S05')
insert into NumriTelefonit values ('123456773','S06')
insert into NumriTelefonit values ('123456772','S06')
insert into NumriTelefonit values ('123456771','S06')
insert into NumriTelefonit values ('123456770','S07')
insert into NumriTelefonit values ('123456689','S07')
insert into NumriTelefonit values ('123456688','S07')
insert into NumriTelefonit values ('123456687','S08')
insert into NumriTelefonit values ('123456686','S09')
insert into NumriTelefonit values ('123456685','S10')
insert into NumriTelefonit values ('123456684','S09')
insert into NumriTelefonit values ('123456683','S08')
insert into NumriTelefonit values ('123456682','S07')

Select *
From NumriTelefonit

insert into Punon values('S01','Adem Jashari1')
insert into Punon values('S02','Adem Jashari1')
insert into Punon values('S03','Adem Jashari1')
insert into Punon values('S04','Adem Jashari2')
insert into Punon values('S05','Adem Jashari2')
insert into Punon values('S06','Adem Jashari2')
insert into Punon values('S07','Adem Jashari3')
insert into Punon values('S08','Adem Jashari3')
insert into Punon values('S09','Adem Jashari3')
insert into Punon values('S10','Adem Jashari4')
insert into Punon values('S01','Adem Jashari4')
insert into Punon values('S02','Adem Jashari4')
insert into Punon values('S03','Adem Jashari5')
insert into Punon values('S04','Adem Jashari5')
insert into Punon values('S05','Adem Jashari5')
insert into Punon values('S06','Adem Jashari6')
insert into Punon values('S07','Adem Jashari6')
insert into Punon values('S08','Adem Jashari6')
insert into Punon values('S09','Adem Jashari7')
insert into Punon values('S10','Adem Jashari7')
insert into Punon values('S01','Adem Jashari7')
insert into Punon values('S02','Adem Jashari8')
insert into Punon values('S03','Adem Jashari8')
insert into Punon values('S04','Adem Jashari10')
insert into Punon values('S05','Adem Jashari9')

Select *
From Punon

insert into PunetoriTeknik values('S01','DC01')
insert into PunetoriTeknik values('S01','DC02')
insert into PunetoriTeknik values('S01','DC03')
insert into PunetoriTeknik values('S01','DC04')
insert into PunetoriTeknik values('S01','DC05')
insert into PunetoriTeknik values('S01','DC06')
insert into PunetoriTeknik values('S02','DC07')
insert into PunetoriTeknik values('S02','DC08')
insert into PunetoriTeknik values('S02','DC09')
insert into PunetoriTeknik values('S03','DC10')
insert into PunetoriTeknik values('S03','DC01')
insert into PunetoriTeknik values('S03','DC02')
insert into PunetoriTeknik values('S03','DC03')
insert into PunetoriTeknik values('S03','DC04')
insert into PunetoriTeknik values('S04','DC05')
insert into PunetoriTeknik values('S04','DC06')
insert into PunetoriTeknik values('S04','DC07')
insert into PunetoriTeknik values('S04','DC08')
insert into PunetoriTeknik values('S04','DC09')
insert into PunetoriTeknik values('S04','DC10')
insert into PunetoriTeknik values('S04','DC01')
insert into PunetoriTeknik values('S05','DC02')
insert into PunetoriTeknik values('S05','DC03')
insert into PunetoriTeknik values('S05','DC04')
insert into PunetoriTeknik values('S05','DC05')

Select *
From PunetoriTeknik

insert into KontrolluesTrafiku values ('01/01/2021','S06')
insert into KontrolluesTrafiku values ('02/21/2021','S06')
insert into KontrolluesTrafiku values ('03/22/2021','S07')
insert into KontrolluesTrafiku values ('04/12/2021','S07')
insert into KontrolluesTrafiku values ('05/13/2021','S08')
insert into KontrolluesTrafiku values ('06/14/2021','S08')
insert into KontrolluesTrafiku values ('07/15/2021','S09')
insert into KontrolluesTrafiku values ('08/16/2021','S09')
insert into KontrolluesTrafiku values ('09/17/2021','S10')
insert into KontrolluesTrafiku values ('10/18/2021','S10')

Select *
From KontrolluesTrafiku


