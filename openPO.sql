/* Program 1. OpenPO.sql */

set heading off
set feedback off
set echo off
set verify off


/* spool f:openPO.txt */

prompt
prompt ****** O P E N   O R D E R *********
prompt

select 'Today''s Date:', sysdate from dual;
prompt

accept Vpnum prompt 'Enter the Item Number: ';

select '   Item Description: ', pdesc from products
	where pnum='&vpnum';

select '   Current Inventory Level: ', ltrim(inv) from products
	where pnum='&vpnum';

prompt
prompt Please select from one of the following Authorized Suppliers:

set heading on

column snum heading 'SNUM' format a4
column sname heading 'SNAME' format a15
column location heading 'Location' format a20
column unitprice heading 'Unit Price' format $9,999.99 


select suppliers.snum, sname, scity||', '||sstate as location, unitprice
	from suppliers, pricelist
	where suppliers.snum= pricelist.snum
	and pricelist.pnum='&vpnum';

prompt

set heading off

accept vsnum prompt 'Enter the Supplier Number: ';

select '   Supplier Name: ', sname from suppliers
	where snum='&vsnum';

select '   Address: ', saddress from suppliers
	where snum='&vsnum';

select '   City, State Zip: ', scity||', '||sstate from suppliers
	where snum='&vsnum';

select '   Phone: ', '('||substr(sphone,1,3)||') '||substr(sphone,4,3)||'-'||substr(sphone,-4) from suppliers
	where snum='&vsnum';

prompt

accept vordqty prompt 'Enter Order Quantity: ';

column unitprice heading 'Unit Price' format $9,999.99 
column ordamt heading 'Amount Ordered' format $9,999.99 

select '   Unit Price:', unitprice 
	from pricelist
	where snum='&vsnum'
	and pnum='&vpnum'; 

insert into purchaseorders (purordnum, purorddate, pnum, snum, unitprice, ordqty, ordamt, shipdate, shipqty, shipamt, status)
	select maxnum, sysdate, '&vpnum', '&vsnum', unitprice, &vordqty, unitprice*&vordqty, null, null, null, 'Open' from counter, pricelist
	where pnum = '&vpnum'
	and snum = '&vsnum';

commit; 

select '   Amount ordered: ', ordamt 
	from purchaseorders po, counter 
	where po.purordnum=maxnum;

select '***** Order Status: ', status 
	from purchaseorders po, counter 
	where po.purordnum=maxnum;

select '***** Purchase Order Number is ----->', purordnum 
	from purchaseorders po, counter 
	where po.purordnum=maxnum;

update counter set maxnum=maxnum+1;

commit;

