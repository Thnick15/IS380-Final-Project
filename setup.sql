/* Semester Project. GMI Purchase Order System */

set echo on

/* spool f:setup.txt */


drop table purchaseorders; 
drop table pricelist;
drop table suppliers;  
drop table products; 
drop table counter;
 

create table counter 
	(maxnum number(5), 
	primary key (maxnum)); 

insert into counter values (1021); 

create table products
	(pnum varchar2(3),
	pdesc varchar2(25),
	inv number(10),
	primary key (pnum)); 

insert into products values ('p1', 'Pencil', 50);
insert into products values ('p2', 'Eraser', 100);
insert into products values ('p3', 'Marker', 150);
insert into products values ('p4', 'Pen', 200);
insert into products values ('p5', 'Paper', 250);

create table suppliers
	(snum varchar2(3),
	sname varchar2(25),
	saddress varchar2(25),
	scity varchar2(25),
	sstate varchar2(5),
	szip number(10),
	sphone number(15),
	primary key (snum)); 

insert into suppliers values ('s1', 'Staples', '123 Main Street', 'Long Beach', 'CA', 91111, 6532343245);
insert into suppliers values ('s2', 'OfficeMax', '269 Lovers Lane', 'Huntington Beach', 'CA', 91112, 6152335568);
insert into suppliers values ('s3', 'Office Depot', 'Ha-Ha Road', 'Newport Beach', 'CA', 91113, 9055547812);
insert into suppliers values ('s4', 'Target', '321 Chestnut Street', 'Irvine', 'CA', 91114, 6175399843);
insert into suppliers values ('s5', 'Walmart', 'South Park Avenue', 'Santa Ana', 'CA', 91115, 5083344343);

create table pricelist
	(pnum varchar2(3),
	snum varchar2(3),
	unitprice number(5,2),  
	primary key (pnum, snum),
	constraint si_fk1 foreign key (snum) references suppliers(snum), 
	constraint si_fk2 foreign key (pnum) references products(pnum)); 

insert into pricelist values ('p1', 's1', 2.50);
insert into pricelist values ('p3', 's1', 2.00);
insert into pricelist values ('p4', 's1', 2.00);
insert into pricelist values ('p1', 's3', 2.00);
insert into pricelist values ('p4', 's4', 2.50);

create table purchaseorders
	(purordnum number(8),
	purorddate date,
	pnum varchar2(3),
	snum varchar2(3),
	unitprice number(5,2),
	ordqty varchar2(8),
	ordamt number(8),
	shipdate date,
	shipqty number(6),
	shipamt number(10),
	status varchar2(8),
	primary key (purordnum),
	constraint po_fk3 foreign key (pnum) references products(pnum),
	constraint po_fk4 foreign key (snum) references suppliers(snum)); 

/* test data */
insert into purchaseorders values (1001, '14-may-18', 'p1', 's3', 2.00, 25, 50.00, '7-apr-18', 25, 50.00, 'Closed'); 
insert into purchaseorders values (1002, '4-may-18', 'p1', 's3', 2.00, 25, 50.00, '2-apr-18', 25, 50.00, 'Closed'); 
insert into purchaseorders values (1003, '16-may-18', 'p1', 's3', 2.00, 25, 50.00, '3-apr-18', 25, 50.00, 'Closed'); 
insert into purchaseorders values (1004, '2-jan-18', 'p4', 's2', 2.00, 25, 70.00, '6-apr-18', 25, 70.00, 'Open'); 
insert into purchaseorders values (1005, '5-jan-18', 'p4', 's2', 2.00, 25, 70.00, '20-apr-18', 25, 70.00, 'Open');
insert into purchaseorders values (1006, '7-jan-18', 'p4', 's2', 2.00, 25, 70.00, '16-apr-18', 25, 70.00, 'Open');
insert into purchaseorders values (1007, '11-jan-18', 'p4', 's4', 2.00, 25, 70.00, '17-apr-18', 25, 70.00, 'Open');
insert into purchaseorders values (1008, '12-jan-18', 'p4', 's4', 2.00, 25, 70.00, '8-apr-18', 25, 70.00, 'Open');
insert into purchaseorders values (1009, '15-jan-18', 'p1', 's3', 2.00, 25, 50.00, '5-apr-18', 25, 50.00, 'Open'); 
insert into purchaseorders values (1010, '3-apr-18', 'p4', 's4', 2.50, 48, 120.00, '6-apr-18', 28, 70.00,'Open'); 
insert into purchaseorders values (1011, '2-apr-18', 'p1', 's3', 2.00, 25, 50.00, '7-apr-18', 25, 50.00, 'Open'); 
insert into purchaseorders values (1012, '5-may-18', 'p1', 's3', 2.00, 25, 50.00, '7-jun-18', 500, 1000.00, 'Open'); 
insert into purchaseorders values (1013, '6-jan-18', 'p1', 's3', 2.00, 25, 50.00, '7-apr-18', 25, 250.00, 'Open'); 
insert into purchaseorders values (1014, '5-may-18', 'p1', 's3', 2.00, 25, 90.00, '7-apr-18', 25, 50.00, 'Closed');
insert into purchaseorders values (1015, '11-may-18', 'p1', 's3', 2.00, 25, 50.00, '7-jun-18', 25, 50.00, 'Closed');
insert into purchaseorders values (1016, '26-may-18', 'p1', 's3', 2.00, 25, 50.00, '7-jun-18', 25, 50.00, 'Closed');
insert into purchaseorders values (1017, '10-may-18', 'p1', 's3', 2.00, 35, 50.00, '7-jun-18', 35, 50.00, 'Closed');
insert into purchaseorders values (1018, '7-may-18', 'p1', 's3', 2.00, 75, 520.00, '7-jun-18', 55, 500.00, 'Closed');
insert into purchaseorders values (1019, '5-may-18', 'p1', 's3', 2.00, 55, 450.00, '7-jun-18', 25, 50.00, 'Closed');
insert into purchaseorders values (1020, '15-may-18', 'p1', 's3', 2.00, 45, 550.00, '7-jun-18', 25, 50.00, 'Closed');

commit;

/* spool off */