---Lenguaje de la aplicación de datos (DDL)
-- CREAR BASE DE DATOS
create database Mikasa_bd;
use Mikasa_bd;
--CREACIÓN DE TABLAS
--TABLA OFICINA
Create table Oficina(
No_oficina int not null Primary Key,
nombre_oicina varchar (30),
direccion_oficina varchar (50),
telefono_oficina varchar (15),
horario_oficina varchar(15),
);
--TABLA PROPIETARIO
Create table Propietario(
no_propietario int not null Primary key,
nombre_propietario varchar (30),
direccion_propietario varchar (50),
telefono_propietario varchar (15),
);
--TABLA PISO
Create table Piso(
No_piso int not null primary key,
Direccion_piso varchar (50),
Zona_piso varchar (20),
Superficie_piso varchar (20),
Habitaciones_piso varchar (10),
Baños_piso varchar (20),
Aseos_piso varchar (4),
Cocina_piso varchar (20),
Gas_piso varchar (20),
Puerta_blindada_piso varchar (20),
Parqueta_piso varchar (2),
No_Oficina2 int not null,
No_propietario_pisos int not null,
FOREIGN KEY (No_Oficina2) REFERENCES Oficina,
FOREIGN KEY (No_propietario_pisos) REFERENCES Propietario,
)

--TABLA VILLA
Create table Villas(
No_villas int not null primary key,
Direccion_villas varchar (50),
Zona_villas varchar (20),
Superficie_villas varchar (20),
Habitaciones_villas varchar (10),
Baños_villas varchar (20),
Aseos_villas varchar (4),
Cocina_villas varchar (20),
Gas_villas varchar (20),
Puerta_blindada_villas varchar (20),
Parqueta_villas varchar (2),
No_Oficina1 int not null,
No_propietario_villas int not null,
FOREIGN KEY (No_Oficina1) REFERENCES Oficina,
FOREIGN KEY (No_propietario_villas) REFERENCES Propietario,
)
--TABLA CASA
Create table Casas( 
No_casa int not null primary key, 
Direccion_casa varchar (50), 
Zona_casa varchar (20), 
Superficie_casa varchar (20), 
Habitaciones_casa varchar (10), 
Baños_casa varchar (20), 
Aseos_casa varchar (4), 
Cocina_casa varchar (20), 
Gas_casa varchar (20), 
Puerta_blindada_casa varchar (20), 
Parqueta_casa varchar (2), 
No_Oficina3 int not null, 
No_propietario_casas int not null, 
FOREIGN KEY (No_Oficina3) REFERENCES Oficina, 
FOREIGN KEY (No_propietario_casas) REFERENCES Propietario, 
) 
-- TABLA LOCAL
Create table Locales(
No_local int not null primary key,
Zona_local varchar (50),
Superficie_local varchar (15),
Direccion_local varchar (30),
No_puertas varchar (10),
Diafono varchar (10),
Acondicionado varchar (10),
No_oficina4 int not null,
No_propietario_locales int not null,
FOREIGN KEY (No_Oficina4) REFERENCES Oficina,
FOREIGN KEY (No_propietario_locales) REFERENCES Propietario,
)

--TABLA FICHA
Create table ficha(
referencia int primary key,
precio_venta float (10),
precio_alquiler float (10),
estatus varchar (15),
);
--TABLA CLIENTE
Create table Cliente(
No_cliente int not null primary key,
Nombre_Cliente Varchar (30),
Direccion_cliente varchar (50),
Telefono_cliente varchar (10),
Correo_cliente varchar (30),
);
-- TABLA VISITA PISO
Create table Visita_piso(
No_Visita_piso int primary key not null,
Fecha_piso varchar (10),
Hora_piso Varchar (15),
No_piso1 int not null,
No_cliente3 int not null,
Referencia3 int not null,
FOREIGN KEY (No_piso1) REFERENCES Piso,
FOREIGN KEY (No_cliente3) REFERENCES Cliente,
FOREIGN KEY (Referencia3) REFERENCES Ficha,
)
-- TABLA VISITA_VILLA
Create table Visita_villa(
No_Visita_villa int primary key not null,
Fecha_villa varchar (10),
Hora_villa Varchar (15),
No_villa1 int not null,
No_cliente2 int not null,
Referencia2 int not null,
FOREIGN KEY (No_villa1) REFERENCES Villas,
FOREIGN KEY (No_cliente2) REFERENCES Cliente,
FOREIGN KEY (Referencia2) REFERENCES Ficha,
)

--TABLA VISITA_CASA
Create table Visita_casa(
No_Visita_casa int primary key not null,
Fecha_casa varchar (10),
Hora_casa Varchar (15),
No_casa1 int not null,
No_cliente4 int not null,
Referencia4 int not null,
FOREIGN KEY (No_casa1) REFERENCES Casas,
FOREIGN KEY (No_cliente4) REFERENCES Cliente,
FOREIGN KEY (Referencia4) REFERENCES Ficha,
)
--TABLA VISITA_LOCAL
Create table Visita_local(
No_Visita_local int primary key not null,
Fecha_local varchar (10),
Hora_local Varchar (15),
No_local1 int not null,
No_cliente1 int not null,
Referencia1 int not null,
FOREIGN KEY (No_local1) REFERENCES Locales,
FOREIGN KEY (No_cliente1) REFERENCES Cliente,
FOREIGN KEY (Referencia1) REFERENCES Ficha,
)

--ALTER TABLE
--ADD
Alter table Casas
Add Jardin Varchar(2);
Select * from Casas
--DROP
Alter table Casas
drop column Jardin
Select * from Casas
--CREATE VIEW (CUATRO VISTAS)
--VISTA 1
Create view [Oficina_Casa_Piso]as
Select No_oficina, No_casa, No_piso
From Oficina, Casas, Piso
where No_oficina=No_Oficina2 and No_oficina=No_Oficina3


--CREATE INDEX (CUATRO INDEX)
Select * from Oficina_Casa_Piso

-- Lenguaje de manipulación de datos(DML)
------------INSERT--------------
--INSERT OFICINA
Insert into Oficina values (01, 'Sadasi', 'Macroplaza', '5510381234', '8 horas');
Insert into Oficina values (02, 'Cosmopol', 'Cosmopol', '5598453214', '8 horas');
Insert into Oficina values (03, 'L.A. Inmobiliria', 'Tepito', '5574856921', '8 Horas');
Insert into Oficina values (04, 'Infonavit', 'Ojo de agua', '5631658400', '10 Horas');
Insert into Oficina values (05, 'CDMX Bienes raices', 'Miraflores 83', '5662958430', '10 horas');
--INSERT PROPIETARIO
Insert into Propietario values (1001, 'José Luis', 'La guadalupana', '5512345678');
Insert into Propietario values (1002, 'Diana Karla', 'Los heroes 5ta', '5548787299');
Insert into Propietario values (1003, 'Angie Diaz', 'Benito Juarez', '5689453201');
Insert into Propietario values (1004, 'Luis Angel', 'Valle de Ecatepec', '5614094294');
Insert into Propietario values (1005, 'Leticia Rodriguez', 'El rodeo', '5548592603');
--INSERT PISO
Insert into Piso values (021, 'Col. Roma', 'Urbana', 'Plano', '3', '1 1/2', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 02, 1001);
Insert into Piso values (022, 'Cosmopol', 'Urbana', 'Plano', '2', '1', 'Sí', 'Sí', 'Sí', 'No', 'No', 05, 1003);
Insert into Piso values (023, 'Valle de ecatepec', 'Urbana', 'Plano', '3', '1', 'Sí', 'Sí', 'No', 'Sí', 'No', 04, 1002);
Insert into Piso values (024, 'Lo héroes Bosques', 'Urbana', 'Plano', ' 2', '1', 'No', 'No', 'Sí', 'No', 'No', 02, 1003);
Insert into Piso values (025, 'Los Héroes 5ta', 'Urbana', 'Plano', '2', '1', 'Sí', 'Sí', 'No', 'Sí', 'No', 01, 1004);
-- INSERT VILLA
Insert into Villas values (011, 'Aragon', 'Urbana', 'Plano', '3', '1', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 02, 1002);
Insert into Villas values (012, 'San Jose', 'Urbana', 'Plano', '2', '1 1/2', 'Sí', 'Sí', 'Sí', 'No', 'No', 05, 1005);
Insert into Villas values (013, 'Las flores', 'Urbana', 'Plano', '3', '1', 'Sí', 'Sí', 'No', 'Sí', 'No', 04, 1004);
Insert into Villas values (014, 'Manzanas', 'Urbana', 'Plano', '2', '1', 'Sí', 'Sí', 'No', 'Sí', 'No', 02, 1002);
Insert into Villas values (015, 'Estado de México', 'Urbana', 'Plano', ' 2', '1', 'No', 'No', 'Sí', 'No', 'No', 01, 1005);
-- INSERT CASA
Insert into Casas values (031, 'El Rodeo', 'Urbana', 'Plano', '3', '1', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 02, 1002); 
Insert into Casas values (032, 'Imperio', 'Urbana', 'Plano', '4', '1 1/2', 'Sí', 'Sí', 'Sí', 'No', 'No', 05, 1005); 
Insert into Casas values (033, 'Insurgentes', 'Urbana', 'Plano', '3', '1', 'Sí', 'Sí', 'No', 'Sí', 'No', 04, 1004); 
Insert into Casas values (034, 'Moctezuma', 'Urbana', 'Plano', '2', '1', 'Sí', 'Sí', 'No', 'Sí', 'No', 02, 1001); 
Insert into Casas values (035, 'Revolucion', 'Urbana', 'Plano', ' 2', '1', 'No', 'No', 'Sí', 'No', 'No', 01, 1003); 
-- INSERT LOCAL
Insert into Locales values (041, 'Urbana', 'Plano', 'Las Américas', '2', 'Sí', 'No', 03, 1001);
Insert into Locales values (042, 'Urbana', 'Montaña', 'Morelos', '1', 'No', 'No', 04, 1004);
Insert into Locales values (043, 'Urbana', 'Plano',  'Jardines', '2', 'No', 'No', 01, 1002);
Insert into Locales values (044, 'Urbana', 'Plano', 'Santa fe', '2', 'Sí', 'Sí', 05, 1005);
Insert into Locales values (045, 'Urbana', 'Plano', 'Azcapotzalco', '1', 'No', 'Sí', 02, 1005);
--INSERT FICHA
Insert into ficha values (201, '50000', '30000', 'Disponible')
Insert into ficha values (202, '70000', '40000', 'Alquilado');
Insert into ficha values (203, '40000', '30000', 'Disponible');
Insert into ficha values (203, '80000', '35000', 'Alquilado');
Insert into ficha values (205, '90000', '45000', 'Disponible');
Insert into ficha values (206, '75000', '45000', 'Alquilado');
Insert into ficha values (207, '45000', '20000', 'Disponible');
Insert into ficha values (208, '100000', '80000', 'Disponible');
Insert into ficha values (209, '75000', '50000', 'Alquilado');
Insert into ficha values (210, '80000', '55000', 'Disponible');
Insert into ficha values (211, '59000', '39000', 'Disponible');
Insert into ficha values (212, '99000', '60000', 'Alquilado');
Insert into ficha values (213, '70000', '45000', 'Disponible');
Insert into ficha values (214, '26000', '20000', 'Disponible');
Insert into ficha values (215, '45000', '30000', 'Alquilado');
Insert into ficha values (216, '85000', '60000', 'Disponible');
Insert into ficha values (217, '95000', '70000', 'Disponible');
Insert into ficha values (218, '80000', '40000', 'Disponible');
Insert into ficha values (219, '73000', '50000', 'Alquilado');
Insert into ficha values (220, '80000', '5000', 'Disponible');
--INSERT CLIENTE
Insert into Cliente Values (2001, 'Alan Fernando', 'Calle Libertad', '5513815098', 'Alan@gmail.com');
Insert into Cliente Values (2002, 'Daniel Alejandro', 'Calle Niños Heroes', '5526931404', 'Dany@hotmail.com');
Insert into Cliente Values (2003, 'Alain Prost', 'Paris', '3378951265', 'Prost@outlook.com');
Insert into Cliente Values (2004, 'Marisela Peña', 'Calle Apatzingan', '5520252901', 'Mary@gmail.com');
Insert into Cliente Values (2005, 'Luis Angel', 'Calle Dolores', '5614094294', 'FEF13@gmail.com');
--INSERT VISITA_PISO
Insert into Visita_piso Values (1, '27/08/2021', '15:30', 021, 2001, 211);
Insert into Visita_piso Values (2, '18/09/2021', '16:00', 022, 2002, 212);
Insert into Visita_piso Values (3, '29/10/2021', '12:00', 023, 2003, 213);
Insert into Visita_piso Values (4, '17/11/2021', '13:00', 024, 2004, 214);
Insert into Visita_piso Values (5, '03/12/2021', '17:00', 025, 2005, 215);
--INSERT VISITA CASA
Insert into Visita_casa Values (6, '28/08/2021', '15:30', 031, 2001, 216);
Insert into Visita_casa Values (7, '19/09/2021', '16:00', 032, 2002, 217);
Insert into Visita_casa Values (8, '30/10/2021', '12:00', 033, 2003, 218);
Insert into Visita_casa Values (9, '18/11/2021', '13:00', 034, 2004, 219);
Insert into Visita_casa Values (10, '04/12/2021', '17:00', 035, 2005, 220);
--INSERT VISITA_LOCAL
Insert into Visita_local Values (11, '25/08/2021', '15:30', 041, 2001, 201);
Insert into Visita_local Values (12, '13/09/2021', '16:00', 042, 2002, 202);
Insert into Visita_local Values (13, '26/10/2021', '12:00',043, 2003, 203);
Insert into Visita_local Values (14, '15/11/2021', '13:00', 044, 2004, 204);
Insert into Visita_local Values (15, '01/12/2021', '17:00', 045, 2005, 205);
-- INSERT VISITA_VILLA
Insert into Visita_villa Values (16, '26/08/2021', '15:30', 011, 2001, 206);
Insert into Visita_villa Values (17, '17/09/2021', '16:00', 012, 2002, 207);
Insert into Visita_villa Values (18, '27/10/2021', '12:00', 013, 2003, 208);
Insert into Visita_villa Values (19, '16/11/2021', '13:00', 014, 2004, 209);
Insert into Visita_villa Values (20, '02/12/2021', '17:00', 015, 2005, 210);

-------UPDATE-------
--UPDATE OFICINA
UPDATE Oficina
set direccion_oficina='Ríos'
where No_oficina=03
--UPDATE PROPIETARIO
UPDATE Propietario
set telefono_propietario='5789631486'
where no_propietario=1002
--UPDATE PISO
UPDATE Piso
set Baños_piso=2
where No_piso='Piso1'
--UPDATE VILLA
UPDATE Villas
set Cocina_villas='No'
where No_Villas=012
--UPDATE CASA
UPDATE Casas
set Gas_casa='Sí'
where No_casa=033
--UPDATE LOCAL
UPDATE Locales
set Diafono='Sí'
where No_local=045
--UPDATE FICHA
UPDATE ficha
set estatus='Alquilado'
where referencia=202
--UPDATE CLIENTE
UPDATE Cliente
set Correo_cliente='afernando@gmail.com'
where no_cliente=2001
--UPDATE VISITA_PISO
UPDATE Visita_piso
set Hora_piso='12:15'
where No_Visita_piso=4
--UPDATE VISITA_CASA
UPDATE Visita_casa
set Hora_casa='13:45'
where No_Visita_casa=7
--UPDATE VISITA_LOCAL
UPDATE Visita_local
set Hora_local='11:35'
where No_Visita_local=11
--UPDATE VISITA_VILLA
UPDATE Visita_villa
set Hora_villa='09:20'
where No_Visita_villa=15
---------DELETE-------------
--DELETE oficina
Delete from oficina
where No_oficina=02
--DELETE
Delete Propietario from 
where no_propietario=1002
--DELETE Piso
Delete from Piso
where No_piso=024
--DELETE Villa
Delete from Villas
where No_villas=022
--DELETE Casa
Delete from Casas where No_casa=031
--DELETE Local_
Delete from Locales
where No_local=044
--DELETE ficha
Delete from ficha
where referencia=206
--DELETE
Delete Cliente from Cliente
where No_cliente=2002
--DELETE Visita_piso
Delete from Visita_piso
where No_Visita_piso=4
--DELETE Visita_casa
Delete from Visita_casa
where No_Visita_casa=5
--DELETE Visita_local
Delete from Visita_local
where No_Visita_local=9
--DELETE Visita_villa
Delete from Visita_villa
where No_Visita_villa=15


------SELECT ---------
Select*from oficina
Select*from propietario
Select*from Piso
Select*from Villas
Select*from Casas
Select*from Locales
select*from ficha
Select*from Cliente
Select*from Visita_piso
Select*from Visita_casa
Select*from Visita_local
Select*from Visita_villa


----Lenguaje de control de datos (DCL)----
---Creación de usuarios

Create table Usuarios(
Id int not null,
Nombre varchar(50),
Contraseña varchar(5)
)
insert into Usuarios values(2019600024, 'Estefania','4567');
insert into Usuarios values(2019600025, 'Coronel','5678');
insert into Usuarios values(2019600026, 'Luis Angel','9123');
insert into Usuarios values(2019600027, 'Leticia','1234');
Select * from Usuarios
---Usuario 1 Rodriguez Gonzalez Leticia
create login LeticiaRG with password ='1234', check_policy = off
go
use  Mikasa_bd;

create user Lety for login LeticiaRG
with default_schema= [dbo]

---Usuario 2 Oskar Coronel
create login OskarC with password ='5678', check_policy = off
go
use  Mikasa_bd;

create user Oskar for login OskarC
with default_schema= [dbo]

---Usuario 3 Franco Peña Luis Angel
create login LuisAFP with password ='4321', check_policy = off
go
use  Mikasa_bd;

create user Franco for login LuisAFP
with default_schema= [dbo]

---Usuario 4 Camacho Hernandez Estefania
create login EstefaniaCH with password ='8765', check_policy = off
go
use  Mikasa_bd;

create user Estef for login  EstefaniaCH
with default_schema= [dbo]
--PRIVILEGIOS
--------GRANT----------
---Usuario1
GRANT insert, update, select, delete
ON  Oficina
TO Lety
WITH GRANT OPTION

GRANT insert, update, select, delete
ON  Propietario
TO Lety
WITH GRANT OPTION

GRANT insert, update, select, delete
ON  Piso
TO Lety
WITH GRANT OPTION

GRANT insert, update, select, delete
ON  Visita_piso
TO Lety
WITH GRANT OPTION

---Usuario2
GRANT insert, update, select, delete
ON  Oficina
TO  Oskar
WITH GRANT OPTION

GRANT insert, update, select, delete
ON  Propietario
TO Oskar
WITH GRANT OPTION

GRANT insert, update, select, delete
ON  Villas
TO Oskar
WITH GRANT OPTION

GRANT insert, update, select, delete
ON  Visita_villa
TO Oskar
WITH GRANT OPTION

---Usuario 3
GRANT insert, update, select, delete
ON  Oficina
TO Franco
WITH GRANT OPTION

GRANT insert, update, select, delete
ON  Propietario
TO Franco
WITH GRANT OPTION

GRANT insert, update, select, delete
ON  Locales
TO Franco
WITH GRANT OPTION

GRANT insert, update, select, delete
ON  Visita_local
TO Franco
WITH GRANT OPTION

---Usuario4
GRANT insert, update, select, delete
ON  Oficina
TO Estef
WITH GRANT OPTION

GRANT insert, update, select, delete
ON  Propietario
TO Estef
WITH GRANT OPTION

GRANT insert, update, select, delete
ON  Casas
TO Estef
WITH GRANT OPTION

GRANT insert, update, select, delete
ON  Visita_casa
TO Estef
WITH GRANT OPTION

----REVOKE ---------
--Usuario 1
--Usuario 2
--Usuario 3
--Usuario 4

----DENY---------
--Usuario 1
--Usuario 2
--Usuario 3
--Usuario 4



---ALGEBRA RELACIONAL ---
--PROYECCION
--RESTRICCION--
--PRODUCTO CARTESIANO--
--JOIN

----CREACION DE PROCEDIMIENTOS ALMACENADOS Y TRIGGERS---
--CREATE PROCEDURE (MINIMO 4)
--CREATE TRIGGERS (MINIMO 3)