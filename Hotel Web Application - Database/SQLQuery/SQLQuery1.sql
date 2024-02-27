﻿--HOTEL
CREATE TABLE HOTEL
(
MANAGER_ID INT,
HOTELNAME NVARCHAR(50) CONSTRAINT HOTEL_HOTELNAME_UQ UNIQUE,
HOTEL_ID INT IDENTITY(3,1) CONSTRAINT HOTEL_HOTELID_PK PRIMARY KEY,
);
--HOTEL LOCATION
CREATE TABLE HOTELLOCATION
(
HOTELID INT,
HOTELLOCATION NVARCHAR(50),
CONSTRAINT HOTELLOCATION_HOTELLOCATION_HOTELID_PK PRIMARY KEY (HOTELLOCATION,HOTELID) --COMPOSITE PK
);
--MANAGER 
CREATE TABLE MANAGER
(
MANAGER_ID INT  IDENTITY (3,7) CONSTRAINT MANAGER_MANAGERID_PK PRIMARY KEY,
MFNAME NVARCHAR(10)CONSTRAINT MANAGER_MFNAME_NN NOT NULL,
MLNAME NVARCHAR (10) CONSTRAINT MANAGER_MLNAME_NN NOT NULL,
MSALARY DECIMAL(7,2) CONSTRAINT MANAGER_MSALARY_CH CHECK((MSALARY>=10000)AND(MSALARY<=20000)),
MADD NVARCHAR(50),
MNUM NVARCHAR (15),
);
--EMPLOYEE 
CREATE TABLE EMPLOYEE
(
EID INT IDENTITY (2020,7)CONSTRAINT EMPLOYEE_EID_PK PRIMARY KEY,
EFNAME NVARCHAR(10)CONSTRAINT EMPLOYEE_EFNAME_NN NOT NULL,
ELNAME NVARCHAR (10) CONSTRAINT EMPLOYEE_ELNAME_NN NOT NULL,
EADD NVARCHAR(50),
ENUM NVARCHAR(15),
SALARY DECIMAL(7,2) CONSTRAINT EMPLOYEE_SALARY_CH CHECK((SALARY>=1000)AND(SALARY<=10000)),
HOTELID INT ,
);
--ROOMS 
CREATE TABLE ROOM
(
ROOM_NUM INT IDENTITY (101,1)  CONSTRAINT ROOM_ROOMNUM_PK PRIMARY KEY,
RFLOOR NCHAR (10),
);
--ROOM TYPE
CREATE TABLE ROOMTYPE
(
ROOMNUM INT,
ROOMTYPE_ID NCHAR(10) 
CONSTRAINT ROOMTYPE_ROOMNUM_ROOMTYPE_ID_PK PRIMARY KEY (ROOMNUM,ROOMTYPE_ID), --COMPOSITE PK
AREA NVARCHAR(100),
TYPE NVARCHAR (4) ,
NUMOFBEDS NVARCHAR(4),
RVIEWS NVARCHAR(10),
);
--GUEST
CREATE TABLE GUEST
(
G_ID INT IDENTITY (1000,100) CONSTRAINT GUEST_GID_PK PRIMARY KEY,
GFNAME NVARCHAR(10)CONSTRAINT GUEST_GFNAME_NN NOT NULL,
GLNAME NVARCHAR (10) CONSTRAINT GUEST_GLNAME_NN NOT NULL,
GNUM NVARCHAR(15),
GADD NVARCHAR(50),
);
--BOOKING
CREATE TABLE BOOKING
(
BOOK_ID INT IDENTITY (16700,1) CONSTRAINT BOOKING_BOOKID_PK PRIMARY KEY,
CHECKIN DATE ,
CHECKOUT DATE ,
);
--PAYMENT
CREATE TABLE PAYMENT
(
PI_D INT IDENTITY (16700,1) CONSTRAINT PAYMENT_PID_PK PRIMARY KEY,
PMETHOD NVARCHAR (4) ,
AMOUNT NVARCHAR(1000),
);

--GUESTBOOK
CREATE TABLE GUESTBOOK
(
GID INT,
BOOKID INT, 
CONSTRAINT GUESTBOOK_GID_BOOKID_PK PRIMARY KEY (GID,BOOKID) --COMPOSITE PK
);
--PAYMENT BOOKING
CREATE TABLE PAYMENTBOOKING
(
PID INT,
BOOKID INT,
CONSTRAINT PAYMENTBOOKING_PID_BOOKID_PK PRIMARY KEY (PID,BOOKID) --COMPOSITE PK
);
--ROOM BOOKING
CREATE TABLE ROOMBOOKING
(
RNUM INT ,
BOOKID INT,
CONSTRAINT ROOMBOOKING_RNUM_BOOKID_PK PRIMARY KEY (RNUM,BOOKID) --COMPOSITE PK
);