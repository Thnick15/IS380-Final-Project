/* Program 2. ReceivePO.sql */

set heading off
set feedback off
set echo off
set verify off


/* spool f:receivePO.txt */

prompt
prompt ****** R E C I E V E   O R D E R ******
prompt

select 'Today''s Date: ', sysdate from dual;
prompt

accept Vpurordnum prompt 'Please enter the Purchase Order Number: ';

select 'Purchase Order Number: ', ltrim(purordnum) from purchaseorders
	where purordnum='&vpurordnum'; 

select 'Item Number: ', pnum from purchaseorders
	where purordnum='&vpurordnum'; 

select 'Item Description: ', pdesc from products, purchaseorders
	where purordnum='&vpurordnum'
	and purchaseorders.pnum=products.pnum;

select 'Supplier Number: ', snum from purchaseorders
	where purordnum='&vpurordnum';

select 'Supplier Name: ', sname from suppliers, purchaseorders
	where purordnum='&vpurordnum'
	and purchaseorders.snum=suppliers.snum;

select 'Date Ordered: ', purorddate from purchaseorders
	where purordnum='&vpurordnum';

select 'Today''s Date: ', sysdate from dual;

select 'Quantity Ordered:    ', ordqty from purchaseorders
where purordnum='&vpurordnum';

column unitprice heading 'Unit Price' format $9,999.99 
column ordamt heading 'Amount Ordered' format $9,999.99 
column shipamt heading 'Amount Due' format $9,999.99 

select 'Unit Price: ', unitprice from purchaseorders
	where purordnum='&vpurordnum';

select 'Amount Ordered: ', ordamt from purchaseorders
	where purordnum='&vpurordnum'; 

prompt
accept Vshipqty prompt 'Enter Quantity Received: ';

update purchaseorders set shipqty = &vshipqty
	where purordnum = '&vpurordnum';

update purchaseorders set shipdate = sysdate 
	where purordnum = '&vpurordnum';

update purchaseorders set status = 'Closed'
	where purordnum = '&vpurordnum';

update purchaseorders set shipamt = unitprice*&vshipqty
	where purordnum='&vpurordnum';

commit; 

select 'Amount Due: ', shipamt from purchaseorders
	where purordnum='&vpurordnum'; 

update products set inv=inv+&vshipqty
	where pnum=(select pnum from purchaseorders where purordnum='&vpurordnum'); 

commit;

select 'Inventory Level:', inv from products p, purchaseorders po
	where purordnum='&vpurordnum'
	and po.pnum=p.pnum; 

prompt
prompt ***********************************
select 'Order is now---> ', status from purchaseorders
	where purordnum='&vpurordnum';


select 'Date Closed: ', shipdate from purchaseorders
	where purordnum='&vpurordnum'; 