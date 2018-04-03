# CarRental
CarRentalRepository

**User must register and login inorder to book a car**



**Software SetUp**
presentation layer :
------------------

Jsp,
Html,
Javascript,
JQuery,
Bootstrap,

Serice layer :
--------------
Java 1.8
Spring 5.x

Dao layer :
----------
Spring JDBC

Database :
---------
Oracle 11g

IDE :
Eclipse neon.3

*****************************************************************************************************

***********************Database Tables Info************************************************************

Table 1: 
-----------
CREATE TABLE "SYSTEM"."CAR" 
   (	"ID" NUMBER(11,0) NOT NULL ENABLE, 
	"NAME" VARCHAR2(50 BYTE) NOT NULL ENABLE, 
	"MODEL" VARCHAR2(15 BYTE) NOT NULL ENABLE, 
	"MAKER" VARCHAR2(50 BYTE) NOT NULL ENABLE, 
	"CATEGORY" VARCHAR2(15 BYTE), 
	"RENT_PER_DAY" NUMBER(8,2), 
	 CONSTRAINT "CAR_ID_PK" PRIMARY KEY ("ID"));

Sequence for Car Id increment :
------------------------------
create sequence car_id_seq start with 100;

Trigger for Car Id Insertion:
-----------------------------
create or replace TRIGGER cars_trigger
  BEFORE INSERT ON car
  FOR EACH ROW
DECLARE
BEGIN
  IF( :new.id IS NULL )
  THEN
    :new.id := car_id_seq.nextval;
  END IF;
END;


Table 2:
--------

CREATE TABLE "SYSTEM"."USERS" 
   (	"USER_ID" NUMBER(4,0) NOT NULL ENABLE, 
	"FIRST_NAME" VARCHAR2(40 BYTE), 
	"LAST_NAME" VARCHAR2(40 BYTE), 
	"EMAIL" VARCHAR2(50 BYTE), 
	"PASSWORD" VARCHAR2(50 BYTE), 
	"DOB" DATE, 
	"GENDER" VARCHAR2(15 BYTE), 
	"MOBILE_NO" VARCHAR2(10 BYTE), 
	"ADDRESS" VARCHAR2(1000 BYTE), 
	 CONSTRAINT "USER_ID_PK" PRIMARY KEY ("USER_ID"));
   
   Sequence for User Id increment :
------------------------------

create sequence USER_ID_SEQ start with 500;

Trigger for User Id Insertion:
-----------------------------
create or replace TRIGGER users_trigger
  BEFORE INSERT ON Users
  FOR EACH ROW
DECLARE
BEGIN
  IF( :new.user_id IS NULL )
  THEN
    :new.user_id := user_id_seq.nextval;
  END IF;
END;

Table 3:
--------

create table car_rent_details(booked_id number(4), car_id NUMBER(11,0),
from_date date, to_date date,booked_by NUMBER(4,0),booked_date date,
constraint booked_id_pk primary key(booked_id),
constraint car_id_fk foreign key(car_id) references car(id),
constraint user_id_fk foreign key(booked_by) references users(user_id));

  Sequence for booked_id increment :
------------------------------

create sequence CAR_RENT_ID start with 800;

Trigger for booked_id Insertion:
-----------------------------

create or replace trigger car_rent_trigger
        before insert on CAR_RENT_DETAILS
        for each row
        declare begin
        if(:new.booked_id is null)
        then 
        :new.booked_id := car_rent_id.nextval;
        End if;
        end;

*******************************************END*********************************************************************************************


