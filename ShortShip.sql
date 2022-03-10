set heading off
set feedback off
set echo off
set verify off


/* spool e:ShortShip.txt */ 

prompt
prompt ****** SHORT SHIP Report ******
prompt

select 'Today''s Date:', to_char(sysdate, 'mm/dd/yyyy') from dual;
prompt

set heading on

column purordnum heading 'PO Numb' format 99999
column stat heading 'PO Status' format a10
column orddate heading 'Date Open' format 9999
column pnum heading 'Prod Num' format a10
column pdesc heading 'Product Description' format a30
column ordqty heading 'Order Qty' format 999
column shipqty heading 'Receive Qty' format 999
column shortqty heading 'Short Qty' format 999
column snum heading 'SNUM' format a10
column sname heading 'SNAME' format a30


select purchaseorders.purordnum,  substr(status, 1,1) as stat, to_char(purorddate, 'mm/dd/yyyy') as orddate, products.pnum, pdesc, ordqty, shipqty, ordqty - shipqty as shortqty, suppliers.snum, sname 
from purchaseorders, suppliers, products
where purchaseorders.pnum = products.pnum 
and purchaseorders.snum= suppliers.snum
and status = 'Closed'
order by purordnum asc; 

