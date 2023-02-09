which psql
psql --version
sudo systemctl start postgresql
sudo systemctl status postgresql

--ex1
sudo -i -u postgres
psql

--ex2
create database N33481_13;

--ex3
\c n33481_13

--ex4         
create schema N33481_13_schema_lab1;

--ex5
create table N33481_13_tbl1();
create table N33481_13_schema_lab1.N33481_13_tbl2();

--ex6
CREATE TABLE N33481_13_schema_lab1.N33481_13_table_i5 (
  stud_id int primary key,
  stud_name varchar (50) not null,
  stud_nationality char, 
  acc_created_on TIMESTAMP,
  date_admission date,
  cod bytea);

--ex7
CREATE TABLE N33481_13_schema_lab1.N33481_13_table_i6 (
  id int default -1,
  period interval
  );

--ex8
CREATE TYPE N33481_13_schema_lab1.N33481_13_type AS(price real, weight real, MFD date, cod bytea);

--ex9
CREATE TYPE N33481_13_schema_lab1.N33481_13_enum AS('large', 'medium', 'small');

--ex10
CREATE DOMAIN N33481_13_schema_lab1.N33481_13_domain int check(value > 99 and value < 1000);

--ex11
CREATE SEQUENCE N33481_13_schema_lab1.N33481_13_seq as int (start with 1000 increment by -1); 

--ex12
CREATE INDEX N33481_13_idx1 on N33481_13_schema_lab1.N33481_13_table_i5(stud_id);

--ex13
CREATE INDEX N33481_13_idx2 on N33481_13_schema_lab1.N33481_13_table_i5(stud_id, date_admission);

--ex14
CREATE INDEX N33481_13_idx3 on N33481_13_schema_lab1.N33481_13_table_i5(mod(stud_id,10));

--ex15
CREATE INDEX N33481_13_idx4 on N33481_13_schema_lab1.N33481_13_table_i5(id) where id >= 100 and id <=1000;

--ex16
CREATE TABLE N33481_13_schema_lab1.N33481_13_table_i5_notnull (
  stud_id int primary key,
  stud_name varchar (50) not null,
  stud_nationality char not null, 
  acc_created_on TIMESTAMP,
  date_admission date,
  cod bytea);

--ex17
CREATE TABLE N33481_13_schema_lab1.N33481_13_table_i5_unique (
  stud_id int,
  stud_name varchar (50) not null,
  stud_nationality char not null, 
  acc_created_on TIMESTAMP,
  date_admission date,
  cod bytea,
  unique(stud_id, stud_nationality));
  

--ex118
CREATE TABLE N33481_13_schema_lab1.N33481_13_table_i5_pk (
  stud_id int primary key,
  stud_name varchar (50) not null,
  stud_nationality char not null, 
  acc_created_on TIMESTAMP,
  date_admission date,
  cod bytea);

--ex19
CREATE TABLE N33481_13_schema_lab1.N33481_13_table_i5_check (
  stud_id int primary key,
  stud_name varchar (50) check (stud_name like '%a%'),
  stud_nationality char not null, 
  acc_created_on TIMESTAMP,
  date_admission date,
  cod bytea);

--ex20
CREATE VIEW N33481_13_schema_lab1.N33481_13 AS
SELECT stud_nationality, date_admission
FROM N33481_13_schema_lab1.N33481_13_table_i5;
