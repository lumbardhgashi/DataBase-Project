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

insert into Punonjesi values('S01','Emri01','2500','U01','Rruga1','Qyteti1','Z01')
insert into Punonjesi values('S02','Emri02','500','U02','Rruga1','Qyteti1','Z01')
insert into Punonjesi values('S03','Emri03','3400','U03','Rruga2','Qyteti2','Z02')
insert into Punonjesi values('S04','Emri04','2100','U04','Rruga2','Qyteti2','Z02')
insert into Punonjesi values('S05','Emri05','2200','U05','Rruga3','Qyteti3','Z03')
insert into Punonjesi values('S06','Emri06','1200','U06','Rruga3','Qyteti3','Z03')
insert into Punonjesi values('S07','Emri07','1800','U07','Rruga4','Qyteti4','Z04')
insert into Punonjesi values('S08','Emri08','1954','U08','Rruga4','Qyteti4','Z04')
insert into Punonjesi values('S09','Emri09','1234','U09','Rruga5','Qyteti5','Z05')
insert into Punonjesi values('S10','Emri10','5124','U10','Rruga5','Qyteti5','Z05')

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

Select *
From Punonjesi



/*
Perdorimi I UPDATE
*/

Update Testimi
SET Score ='90'
Where Data_Testimit='01/09/2022'

Update Kompania_EA
Set DataLicencimit = '01/05/2021'
Where ID_MA = 'EA01'

Update Klienti 
Set viza ='V0001'
Where DataLindjes = '01/01/2003'

Update Modeli
Set Pesha ='55 T'
Where KapaciteiAeroplanit < '200'

Update Punonjesi
Set Paga = '3000'
Where Qyteti = 'Qyteti1'

Update  Testimi
Set Oret ='15:42'
Where Data_Testimit = '01/09/2022'

Update Punonjesi
Set NumriUnionit = 'U02'
Where Emri= 'EmriPunonjesit'

Update Udheton
Set VendiKuDoUdhetoj='SHBA'
where Nr_MOD = 'D01'

Update Testi
Set PiketMax='100'
Where Emri = 'Emri1'

Update Testi 
Set Emri = 'EMRINdrruar'
Where PiketMax = '45'

Update Testimi
SET Score ='82'
Where Data_Testimit='01/04/2012'

Update Kompania_EA
Set DataLicencimit = '04/09/2022'
Where ID_MA = 'EA03'

Update Klienti 
Set viza ='V0001'
Where DataLindjes = '10/30/2003'

Update Modeli
Set Pesha ='35 T'
Where KapaciteiAeroplanit < '100'

Update Punonjesi
Set Paga = '4000'
Where Qyteti = 'Qyteti1'

Update  Testimi
Set Oret ='15:00'
Where Data_Testimit = '05/10/2021'

Update Punonjesi
Set NumriUnionit = 'U03'
Where Emri= 'EmriPunonjesit'

Update Udheton
Set VendiKuDoUdhetoj='Angli'
where Nr_MOD = 'D02'

Update Testi
Set PiketMax='88'
Where Emri = 'Emri3'

Update Testi 
Set Emri = 'EmriN'
Where PiketMax = '66'

/*
Perdorimi i Delete
*/

DELETE FROM Punonjesi
WHERE Paga < 1300

Delete From Testimi
Where Score < 63

Delete From Kompania_EA
Where DataEMbarimitLicences < '01/09/2022'


Delete From KompaniaPerMirembajtjenAiroportit
Where DataMbarimitLicences < '01/09/2022'

Delete From Airoporti
Where Emri='Adem Jashari'

Delete From Punonjesi
where Emri= 'Emri1'

Delete From KontrolluesTrafiku
Where DataEkzaminimitMjeksor < '01/01/2010'

Delete From IRritur
Where PassPort = 'P00'

Delete From Femija
Where ID_Rritur = 'P01'

Delete From Testimi
Where Score between '40' and '50'





--Pjesa Tret


/* 8 query të thjeshta 
Lumbardh gashi : 2,4,6,8
Egzon Pajaziti : 1,3,5,7
*/

/*
1)
Te kthehet testi me emrin "Emri2"
*/
Select *
From Testi
Where Emri = 'Emri2'

/*
2)
Te kthehet testimi i aeroplanit 
dhe numri regjistrimit te aeroplaneve 
qe jane testuar ne oren 2:25
*/
Select * 
From Testimi
Where Oret = '2:25'

/*
3)
Te ktheht Kompania per mirembajtjen e aeroplaneve
Qe daten e licencimit e ka me '05/08/2011'
*/
Select *
From Kompania_EA
Where DataLicencimit = '05/08/2011'


/*
4)
Te kthehen modelet e aeroplaneve te cilet jane
te akomoduar ne aeroportin Adem Jashari4
*/
Select *
From Akomoduar
Where Emri_Aeroportit = 'Adem Jashari4'

/*
5)
Te kthehet historiku i udhetimeve 
te klientit me passaport 'P01'
*/
Select VendiKuDoUdhetoj
From Udheton
Where Pass = 'P01'

/*
6)
Te kthehen punonjesit qe e kan 
pagen me te vogel se 1600 $
*/
Select p.Emri, p.Paga, p.Qyteti
From Punonjesi p
Where Paga < '1600'

/*
7)
Te kthehen aeroportet se ku punon Punetori me SSN 'S04'
*/
Select *
From Punon
Where SSN = 'S04'

/*
8)
Te kthehen kontrolluesit e trafikut te cilet daten e ekzaminimit mjeksor
ne mes te datave '2/2/2021' Dhe '4/1/2021'
*/
Select *
From KontrolluesTrafiku
Where DataEkzaminimitMjeksor between '2/2/2021' and '4/1/2021'


/* 8 query të thjeshta, minimum dy relacione(tabela) e më tepër. 
Lumbardh gashi : 1,3,5,7
Egzon Pajaziti : 2,4,6,8
*/

/*
1)
Te kthehen te gjithe aeroplanet te cilet numri i pikeve nga testimi i FAA
eshte me i vogel se 67
*/
Select *
From Testi t, Testimi ts 
Where t.FAA_Test_No = ts.FAA and ts.Score < '67'

/*
2)
Te kthehen Aeroportet qe i mirmban kompania me id"MEA01"
*/
Select *
From KompaniaPerMirembajtjenAiroportit km, MirembajtjaAiroportit ma
Where km.ID_MEA = ma.ID_mea and km.ID_MEA = 'MEA01'

/*
3)
Te  kthehen punetoret qe paga e tyre eshte me e vogel ose e 
barabart me 1234 $ si dhe aeroporti ne te cilin ata punojne 
*/
Select a.Emri, p.Paga, p.Qyteti
From Punonjesi p, Punon pu, Airoporti a
Where p.SSN = pu.SSN and pu.Emri_Aeroportit = a.Emri 
and p.Paga <= '1234'

/*
4)
Te kthehen modelet e aeroplaneve te cilet kank peshen 58 tone kg
dhe airoporti ku jan akomoduar ata aeroplan respektiv
*/
Select a.Emri_Aeroportit [Emri], m.KapaciteiAeroplanit, m.Pesha
From Modeli m, Akomoduar a
Where m.Numri_Modelit = a.Numri_Model and m.Pesha = '58 T'

/*
5)
Te kthehen klientet te cilet do te aterojne per ne kosove
*/
Select *
From Klienti k, Udheton u, Modeli m
Where k.Passaporta = u.Pass and u.Nr_MOD = m.Numri_Modelit 
and u.VendiKuDoUdhetoj = 'Kosove'

/*
6)
Te kthehen aeroplanet te cilet pesha e tyre eshte 66 Tone kg
*/
Select p.NR_MODEL [Modeli], m.Pesha, p.Nr_RegjistrimAE [Regjistrimi]
From Modeli m, Perket p
Where m.Numri_Modelit = p.NR_MODEL and m.Pesha = '66 T'

/*
7)
Te kthehen kompanit per mirembajten e aeroplaneve 
qe daten e mbarimit te licences se tyre e kan deri ne  vitin 2026
*/
Select *
From Kompania_EA kea, MirembajtjaEAeroplaneve ma
Where kea.ID_MA = ma.IDKompania_EA and kea.DataEMbarimitLicences <= '2026/1/1'


/*
8)
Te kthehen numrat e telefonit per punonjesin me Emrin
"Emri07"
*/
Select *
From Punonjesi p, NumriTelefonit nt
Where p.SSN = nt.SSN_A
and p.Emri = 'Emri07'



/*
Të krijoni min. 8 query të avancuara (4 për student), të realizuara në minimum dy relacione
(tabela) e më tepër.
Shënim: Query ose Subquery të avancuar konsiderohet përdorimi i kombinimeve të funksioneve
akumuluese,respektivisht joins-ave, përkatësisht të realizohet një kërkesë/raport më kompleks.

Lumbardh gashi : 2,4,6,8
Egzon Pajaziti : 1,3,5,7
*/

/*
1)
Te kthehen te gjith punonjesit me pagat e tyre dhe vendin e punes si dhe 
nga cili Qytet vjen secili punonjes po ashtu  
te renditen sipas pages me te larte
Le te Perdoret join
*/
Select a.Emri as Emri_Aeroportit,p.Emri as Emri_Puntorit , p.Paga  , p.Qyteti
From Punonjesi p join  Punon pu  
on p.SSN = pu.SSN  
Join Airoporti a
on a.Emri = pu.Emri_Aeroportit
order by p.Paga desc


/*
2)
Te Kthehen sa punetore marrin paga te njejta dhe te kthehen pagat pa u perseritur
Le te perdoret Left Join 
*/
Select count(p.Paga)[Punetoret] ,p.Paga
From Punonjesi p Left Join Punon pu 
on p.SSN = pu.SSN
Group by p.Paga 


/*
3)
Te kthehen aeroplanet me numrin e regjistrimit te tyre ,
piket dhe daten e testimit 
duke pasur parasysh qe duhet te kthehet secila her qe nje aeroplan eshte testuar
te radhiten nga aeroplani me piket e testimit me te medha e deri tek ai me i vogli 
Le te perdoret inner Join dhe Right Join 
*/
Select a.Numri_regjistrimit , t.Score [Piket_Nga_Testimi] , t.Data_Testimit
From Testi te inner Join Testimi t 
on te.FAA_Test_No=t.FAA
Right join Aeroplani a
on a.Numri_regjistrimit = t.Nr_Regjistrimit
order by t.Score desc

/*
4)
Te kthehen Aeroplanet se nga cila Kompani mirmbahen 
dhe secila her qe kompania e ka mirmbajt aeroplanin respektiv
Perdorimi i Right Join dhe Full Outer Join inclusive
*/
Select*
From Kompania_EA ke Right Join MirembajtjaEAeroplaneve me
on ke.ID_MA = me.IDKompania_EA Full outer join Aeroplani ae
on me.Nr_RegjAeroplanit = ae.Numri_regjistrimit

/*
5)
Te kthehet numri i punonjeseve se sa punojes punojne ne Aeroportet e caktuara
Dhe te radhiten nga  Aeroporti me me shum punetor tek aeroporti me me se paku punetor
Perdorimi i Left Join
*/
Select count(p.SSN)[Numri_Puntorve] , ae.Emri [Emri_Aeroportit]
From Punon p Left Join Airoporti ae
On p.Emri_Aeroportit = ae.Emri
Group by ae.Emri
order by Numri_Puntorve desc


/*
6)
Te kthehen modelet e aeroplaneve te akomuduar ne aeroportet respektive
te cilet pesha e tyre eshte me e larte se 58 Ton Kg
Perdorimi i Full Outer JOIN 
*/
Select a.Emri_Aeroportit [Emri], m.KapaciteiAeroplanit, m.Pesha
From Modeli m Full outer join  Akomoduar a
on m.Numri_Modelit = a.Numri_Model
Where  m.Pesha = '58 T'

/*
7)
Te kthehen te gjitha informatat per klientin se ku do te shkoj dhe me 
cilin model te aeroplaneve te akomuduar ne aeroport do te ateroj
Perdorimi i inner Join dhe Right Join 
*/
Select *
From Klienti k inner Join Udheton u
on k.Passaporta =u.Pass 
Right join Modeli m
on u.Nr_MOD =m.Numri_Modelit
Where u.VendiKuDoUdhetoj = 'Kosove' 

/*
8)
Te kthehen punetoret te cilet punojne ne aeroporte te caktuara 
te cilet paga e tyre eshte me e vogel se 1234$
Perdorimi i left Join dhe Full outer join 
*/
Select a.Emri, p.Paga, p.Qyteti
From Punonjesi p left Join  Punon pu
on p.SSN = pu.SSN
Full Outer Join  Airoporti a
on a.Emri = pu.Emri_Aeroportit
Where p.Paga <= '1234'
order by p.Paga desc



/*
Të krijoni min. 8 subquery të thjeshta (4 për student).
Lumbardh gashi : 1,3,5,7
Egzon Pajaziti : 2,4,6,8
*/


/*
1)
Te kthehen te gjithe klientet qe nuk jane femije 
*/
Select *
From  IRritur ir 
Where ir.PassPort in (Select k.Passaporta
                      From Klienti k)


/*
2)
Te kthehen prinderit e femijeve , me ke udhetojne femijet 
Per secilin femije 
*/
Select f.PassPort [Pasaporta_Femijes] ,f.ID_Rritur [Pasaporta_prindit]
From  Femija f 
Where f.PassPort in (Select k.Passaporta
                      From Klienti k)

/*
3)
Per secilin klient tregoni ku ka udhetuar 
Historiku i fluturimeve per secilin klient
*/
Select u.Pass[Klienti] ,u.VendiKuDoUdhetoj 
From Udheton u
Where u.Pass in (Select k.Passaporta
                 From Klienti k)


/*
4)
Nga te gjithe klientet e aeroportit qe kan shfrytezuar 
per aterime te kthehen ata klient te cilet jan femije
*/
Select f.PassPort
From  Femija f 
Where f.PassPort in (Select k.Passaporta
                      From Klienti k)


/*
5)
Te kthehen te gjithe klientet e aeroportit 
te cilet do te udhetojne per ne kosove
*/
Select u.Pass [Klienti] , u.VendiKuDoUdhetoj
From Udheton u 
Where u.VendiKuDoUdhetoj='Kosove' and u.Pass in (Select k.Passaporta
                                                 From Klienti k)

/*
6)
Te kthehn aeroplanet qe jan testuar
per te ateruar ne destinacone rrespektive
*/
Select *
From Aeroplani a
Where a.Numri_regjistrimit in (Select t.Nr_Regjistrimit
                                   From Testimi t)

/*
7)
Te kthehen aeroplanet e testuar 
qe piket e tyre jane me te medha se sa piket me te vogla 
nga testimi
*/
Select t.Nr_Regjistrimit[NrRegjistrimit_Aeroplanit] ,t.Score[Piket_Nga_Testimi] 
From Testimi t 
Where t.Score >Any (Select te.PiketMax
                    From Testi te)

/*
8)
Te kthehen kontrolluesit e trafikut nga te gjithe punonjesit 
qe punojne ne aeroporte 
*/
Select *
From KontrolluesTrafiku k 
Where k.SSN in(Select p.SSN
                From Punonjesi p) 





/*
Të krijoni min. 8 subquery të avancuara (4 për student). (min. 1 subquery në klauzolën
SELECT, dhe min. 1 subquery ne klauzolën FROM)
Lumbardh Gashi : 1,3,5,7,10
Egzon Pajaziti : 2,4,6,8,9
*/

/*
1)
Te kthehen punetoret qe e kane pagen me te vogel se
Paga me e madhe se e kontrollueseve te trafikut 
dhe te mos perseriten pagat po ashtu te radhiten nga me e 
madhja tek me e vogla
*/
Select Distinct p.Paga , p.Emri 
From Punonjesi p join PunetoriTeknik pt
on p.SSN = pt.SSN
Where p.Paga <Any (Select p.Paga
                   From KontrolluesTrafiku k inner Join Punonjesi p
				   on k.SSN = p.SSN)
order by p.Paga desc

/*
2)
Te kthehen punonjesit qe kan 3 
numra te telefonit ose me shume
dhe te rradhiten nga me e madhja tek me e vogla.
*/
Select p.SSN , count(Nr_Tel)[Numrat e telefonit]
From Punonjesi p Right Join NumriTelefonit nr
on p.SSN = nr.SSN_A 
Group by p.SSN 
Having count(nr.Nr_Tel) in (Select Count(nr.Nr_Tel)[nr] 
                              From NumriTelefonit nr inner Join Punonjesi p
							  ON nr.SSN_A = p.SSN
							  Group by p.SSN
							  Having Count(nr.Nr_Tel) >= 3
							  )
order by [Numrat e telefonit] desc


/*
3)
Te kthehen klientet qe udhetojne per 
Ne Zvicer
*/
Select *
From Klienti k Full Outer Join Udheton u
on k.Passaporta = u.Pass
Where u.VendiKuDoUdhetoj in (Select u.VendiKuDoUdhetoj
                             From Klienti k Right Join Udheton u
							 on k.Passaporta = u.VendiKuDoUdhetoj
							 Where u.VendiKuDoUdhetoj = 'Zvicer')


/*
4)
Te kthehen modelet e aeroplaneve te cilet nuk udhetojne 
por vetem jane te akomoduar ne aeroporte te caktuara
*/
Select m.Numri_Modelit[Modeli Aeroplanit ] ,m.KapaciteiAeroplanit , m.Pesha , a.Emri_Aeroportit[Aeroplanet e Akomoduar] 
From Modeli m Inner Join Akomoduar a
on m.Numri_Modelit = a.Numri_Model
Where m.Numri_Modelit in (Select m.Numri_Modelit
                              From Modeli m Left Join Udheton u
                              on m.Numri_Modelit = u.Nr_MOD
							  Where u.VendiKuDoUdhetoj is null)
/*
5)
Te kthehen modelet e aeroplaneve qe 
kontrollohen nga puntoret e caktuar teknik
ku ato modele udhetojne per ne kosove
*/
Select m.Numri_Modelit[Modeli Aeroplanit], m.KapaciteiAeroplanit , m.Pesha ,pt.SSN[Punetoret teknik]
From Modeli m Left Join PunetoriTeknik pt
on m.Numri_Modelit = pt.Numri_Modelit
Where m.Numri_Modelit =Any (Select m.Numri_Modelit
                            From Modeli m Right Join Udheton u
							On m.Numri_Modelit = u.Nr_MOD
							Where u.VendiKuDoUdhetoj='Kosove')


/*
6)
Te kthehen cilat aeroporte i miremban kompania
Me ID 'MEA01'
*/
Select kp.ID_MEA[Kompania me id] , kp.DataLicencimit ,kp.DataMbarimitLicences , ma.Emri_Aeroportit
From KompaniaPerMirembajtjenAiroportit kp Join MirembajtjaAiroportit ma
on kp.ID_MEA =ma.ID_mea
Where kp.ID_MEA  in (Select kp.ID_MEA
                    From MirembajtjaAiroportit ma Right Join Airoporti a
					On ma.Emri_Aeroportit = a.Emri
					inner Join  KompaniaPerMirembajtjenAiroportit kp
					on kp.ID_MEA = ma.ID_mea
					Where kp.ID_MEA = 'MEA01')

/*
7)
Te kthehen modelet e aeroplaneve te cilet 
udhetojne dhe bartin klient si dhe kapacitetet e tyre por 
edhe nga cilet punetore teknik mirembahen ata aeroplan 
*/
Select  m.Numri_Modelit [Modeli Aeroplanit] , m.KapaciteiAeroplanit , m.Pesha , pt.SSN[Puntori Qe mbikqyre Aeroplanin] 
From Modeli m  Right join PunetoriTeknik pt
on m.Numri_Modelit = pt.Numri_Modelit
Where m.Numri_Modelit  not in (Select m.Numri_Modelit
                               From Modeli m Left Join Udheton u
							   On m.Numri_Modelit = u.Nr_MOD
							   Where u.VendiKuDoUdhetoj is null)

/*
8)
Te kthehen Aeroplanet Te cilet te cilet jane 
Testuar me shume se 2 her 
*/
Select te.Nr_Regjistrimit , te.Data_Testimit ,te.Score [Piket Nga Testimi]
From Testi t Join Testimi te
on t.FAA_Test_No = te.FAA
Where te.Nr_Regjistrimit in (Select a.Numri_regjistrimit
                         From Aeroplani a Right join Testimi te
						 on a.Numri_regjistrimit = te.Nr_Regjistrimit
						 Group by a.Numri_regjistrimit
						 Having Count(te.FAA) > 2)
Order by te.Nr_Regjistrimit asc

/*
9)
Te kthehen nga sa numra i kan punetoret tane 
Duke e perdorur subquery ne klauzolen Select
*/
Select p.Emri,p.SSN[ID Puntori],Telefoni =
      (Select Count(*)
       From NumriTelefonit nr 
	   Where nr.SSN_A = p.SSN)
From Punonjesi p

/*
10)
Te kthehen sa her jan testuar te gjithe aeroplanet 
Duke Perdorur SubQuery Ne Klauzolen From
*/
Select a.Numri_regjistrimit , Subquery.[Sa her esht testu]
From Aeroplani a ,(Select t.Nr_Regjistrimit , count(*) [Sa her esht testu]
                  From Testimi t 
				  Group by t.Nr_Regjistrimit) Subquery
Where Subquery.Nr_Regjistrimit = a.Numri_regjistrimit


/*
▪ Të krijoni min. 8 query/subquery (4 për student). Duke përdorur operacionet e algjebrës
relacionale (Union, Prerja, diferenca, etj.)
Lumbardh Gashi : 2,4,6,8
Egzon Pajaziti : 1,3,5,7
*/

/*
1)
Te kthehen modelet e aeroplaneve te cilet kank peshen 58 tone kg
dhe airoporti ku jan akomoduar ata aeroplan respektiv
*/
π a . emri_aeroportit, m . kapaciteiaeroplanit, m . pesha
 σ m . numri_modelit = a . numri_model AND m . pesha = "58 T"
  (ρ m modeli ×
   ρ a akomoduar)

/*
2)
Te kthehen te gjithe aeroplanet te cilet numri i pikeve nga testimi i FAA
eshte me i vogel se 67
*/
σ t . faa_test_no = ts . faa AND ts . score < "67"
 (ρ t testi ×
  ρ ts testimi)


/*
3)
Te kthehen numrat e telefonit per punonjesin me Emrin
"Emri07"
*/
σ p . ssn = nt . ssn_a AND p . emri = "Emri07"
 (ρ p punonjesi ×
  ρ nt numritelefonit)


/*
4)
Te kthehen modelet e aeroplaneve te cilet jane
te akomoduar ne aeroportin Adem Jashari4
*/
σ emri_aeroportit = "Adem Jashari4" akomoduar


/*
5)
Te kthehen kompanit per mirembajten e aeroplaneve 
qe daten e mbarimit te licences se tyre e kan deri ne  vitin 2026
*/
σ kea . id_ma = ma . idkompania_ea AND kea . dataembarimitlicences <= "2026/1/1"
 (ρ kea kompania_ea ×
  ρ ma mirembajtjaeaeroplaneve)

/*
6)
Te kthehen numrat e telefonit per punonjesin me Emrin
"Emri07"
*/
σ p . ssn = nt . ssn_a AND p . emri = "Emri07"
 (ρ p punonjesi ×
  ρ nt numritelefonit)

/*
7)
Te kthehen kontrolluesit e trafikut te cilet daten e ekzaminimit mjeksor
ne mes te datave '2/2/2021' Dhe '4/1/2021'
*/
σ "2/2/2021" <= dataekzaminimitmjeksor AND dataekzaminimitmjeksor <= "4/1/2021" kontrolluestrafiku


/*
8)
Te kthehen aeroportet se ku punon Punetori me SSN 'S04'
*/
σ ssn = "S04" punon




/*
Të krijoni min. 8 Proceduara të ruajtura (Stored Procedure) (4 për student)
▪ Minimum 2 procedura me parametra input dhe output
▪ Min. 2 procedura me kombinime të shprehjeve (IF…ELSE, WHILE, CASE )Lumbardh Gashi : 1,3,5,7
Egzon Pajaziti : 2,4,6,8
*/

/*
1)
Te kthehen punonjesit qe e kan emrin 'Emri01' 
ose qe e kan pagen 4000 $
Me ane te Stored Procedure 
Duke perdorur inpute nga shfytezuesi
*/
Create Procedure Proc1
@Emri varchar ,
@Paga money
as
Begin
Select*
From Punonjesi p
Where p.Emri = @Emri or
p.Paga = @Paga
End
Drop Procedure Proc1

Exec Proc1 'Emri01' ,'4000'

/*
2)
Te kthehet kompania qe daten e licencimit 
e merr nga shfrytezuesi 
*/
Create Procedure Proc2
@DataLicencimit date 
as
Begin
Select *
From Kompania_EA
Where DataLicencimit = @DataLicencimit
end

Exec Proc2 '05/08/2011'


/*
3)
Te kthehen pagat  punetoreve nga vijne si dhe pagen le ta merr
nga shfrytezuesi (input ) po ashtu te kemi 2 outpute Qytetin dhe emrin 
e aeroportit ne te cilin punojne 
JAN PERDORUR EDHE OUTPUTET 
*/
Create Procedure Proc3
@Emri Varchar output,
@Paga money  ,
@Qyteti varchar output
as
Begin
Select a.Emri, p.Paga, p.Qyteti
From Punonjesi p, Punon pu, Airoporti a
Where p.SSN = pu.SSN and pu.Emri_Aeroportit = a.Emri 
and p.Paga <=@Paga 
end

DECLARE @Emri varchar, @Paga money, @Qyteti varchar
Exec Proc3 
@Emri out,
'4000',
@Qyteti out
Print 'Puntori me Emer : '+@Emri+' me page :' + convert (varchar,@Paga)+' nga :'+@Qyteti

/*
4)
Te kthehn klientet
qe daten e lindjes e kan me te madhe se 
data e dhene nga shfrytezuesi ose
te jet personi i cili ka pasaporten e njejt me 
ate qe e shtyp Shfrytezuesi
*/

Create Procedure Proc4
@DataLindjes date,
@Pass char
AS
Begin
Select *
From Klienti k
Where k.DataLindjes > @DataLindjes
or k.Passaporta =@Pass
End
Exec Proc4 '2001-12-24' ,'P01'



/*
5)
Te kthehen te gjithe punonjesit te cilet
vin nga qyteti qe i jep shfrytezuesi ose
te cilet pagen e kan me te madhe se ajo qka 
jep shfytezuesi
*/
Create Procedure Proc5
@Qyteti varchar,
@Paga money
AS
Begin
Select *
From Punonjesi p
Where p.Qyteti =@Qyteti or 
p.Paga > @Paga
End
Exec Proc5 'Qyteti1','3000'

/*
6)
Te kthehen Sa puntor jan te 
Atij Lloji qe kerkon shfrytezuesi 
*/
Create Procedure Proc6
(
@LlojiPuntorit varchar(50),
@Numro int = null
)
AS
begin 
   if(@LlojiPuntorit = 'PuntorTeknik')
 begin 
   Set @Numro =(
   Select Count(*)
   From PunetoriTeknik p join Punonjesi pu
   on p.SSN=pu.SSN)
   Print 'Puntor Teknik jan gjithsej : '+convert(varchar,@Numro)
 end
   else 
   if(@LlojiPuntorit ='KontrolluesTrafiku')
   begin 
    Set @Numro =(
    Select Count(*)
    From KontrolluesTrafiku kT Inner Join Punonjesi pu
    on kT.SSN = pu.SSN)
    Print 'Kontrollues Trafiku jan gjithsej : '+convert(varchar,@Numro)
   end
    else Print 'Nuk posedojm ket lloj te puntorit'
end

Drop Procedure Proc6

Exec Proc6 'KontrolluesTrafiku'


/*
7)
Te kthehet puntori me mbshkrim nese ka 
pagen e mire apo jo i cili shfrytezuesi e dergon SSN e 
puntorit si dhe pagen e tij 
*/
Create PROCEDURE Proc7
@SSN char(5)=null,
@Paga int = null
AS
BEGIN
SELECT p.Emri , p.Qyteti,p.Rruga,p.SSN ,Paga=( CASE
WHEN @Paga between 500 and 1200 THEN 'Punonjesi ka page te Ulet'
WHEN @Paga between 1210 and 10000 THEN 'Punonjesi ka page te mire '
else NULL
END )
FROM Punonjesi p 
Where p.SSN = @SSN
Group by p.Emri , p.Qyteti,p.Rruga,p.SSN 
END


execute Proc7 'S01', 4000


/*
8)
Te Kthehen 10 punonjesit e pare qe punojne ne 
aeroporte duke i kthyer si tabela
whlie loop
*/
DECLARE @Numri INT = 0 ;
DECLARE @Totali INT = 0 ;
WHILE @Numri < = 8
BEGIN
SET @Totali = @Totali + @Numri;
SET @Numri = @Numri + 1 ;
Select *
From Punonjesi
Where SSN like 'S0'+convert(varchar,@Numri)
END
