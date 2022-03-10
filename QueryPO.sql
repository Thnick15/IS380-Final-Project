/* Program 3. QueryPO.sql */

set heading off
set feedback off
set echo off
set verify off


/* spool f:QueryPO.txt */

prompt
prompt ****** Q U E R Y   O R D E R ******
prompt

accept Vpurordnum prompt 'Please enter the Purchase Order Number: ';

prompt
select 'Purchase Order Number: ', ltrim(purordnum) from purchaseorders
	where purordnum='&vpurordnum'; 

select 'Item Number: ', pnum from purchaseorders
	where purordnum='&vpurordnum'; 

select '   Item Description: ', pdesc from products p, purchaseorders po
	where purordnum='&vpurordnum'
	and po.pnum=p.pnum;

select '   Current Inventory Level: ', inv from products p, purchaseorders po
	where purordnum='&vpurordnum'
	and po.pnum=p.pnum; 

select 'Supplier Number: ', snum from purchaseorders
	where purordnum='&vpurordnum';

select '   Supplier Name: ', sname from suppliers s, purchaseorders po
	where purordnum='&vpurordnum'
	and po.snum=s.snum;

column unitprice heading 'Unit Price' format $9,999.99 
column ordamt heading 'Amount Ordered' format $9,999.99 
column shipamt heading 'Amount Due' format $9,999.99 

prompt
select 'Date Ordered: ', purorddate from purchaseorders
	where purordnum='&vpurordnum';

select 'Quantity Ordered:    ', ordqty from purchaseorders
	where purordnum='&vpurordnum';

select 'Date Received: ', shipdate from purchaseorders
	where purordnum='&vpurordnum';

select 'Quantity Received:    ', shipqty from purchaseorders
	where purordnum='&vpurordnum';

select 'Unit Price: ', unitprice from purchaseorders
	where purordnum='&vpurordnum';

select 'Amount Ordered:', ordamt from purchaseorders
	where purordnum='&vpurordnum'; 

select 'Amount Due:        ', shipamt from purchaseorders
	where purordnum='&vpurordnum';  

prompt
select 'Order Status:   ', status from purchaseorders
	where purordnum='&vpurordnum';