
DROP DATABASE IF EXISTS CAPSTONE_PRJ;

CREATE DATABASE CAPSTONE_PRJ;

USE CAPSTONE_PRJ;

select count(*) from account;

select count(*) from card;

select count(*) from client;

select count(*) from disp;

select count(*) from district;

select count(*) from loan;

select count(*) from orders;

select count(*) from transaction_data;

CREATE TABLE  loan_trans  AS
select td.*,ln.loan_id,ln.date as loan_date,ln.amount as loan_amount,ln.duration,ln.payments,ln.status from loan ln 
join transaction_data td on ln.account_id=td.account_id;

create table acc_ord as
select o.*,acc.date as account_date,acc.district_id as account_district_id,acc.frequency from account 
acc left join orders  o on acc.account_id=o.account_id;

create table card_disp as 
select card .*,disp.account_id,disp.client_id as disposition_client_id,disp.type as disposition_type from card card 
join disp disp on card .disp_id=disp.disp_id;

create table card_disp_clent as
select * from card_disp cd join client c on cd.disposition_client_id=c.client_id;

create table card_disp_client_dist as
select * from card_disp_clent cdc join district dist on cdc.district_id=dist.A1;

create table acc_ord_card_disp_client_dist as 
select cdcd.*,ao.order_id,ao.bank_to,ao.account_to,ao.amount,ao.k_symbol,ao.account_date,ao.account_district_id,ao.frequency from acc_ord ao left join card_disp_client_dist cdcd on ao.account_id=cdcd.account_id;

