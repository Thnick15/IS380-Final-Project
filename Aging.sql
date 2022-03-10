/* Program 4. Aging.sql */

set heading off
set feedback off
set echo off
set verify off


/* spool f:Aging.txt */

prompt
prompt ****** PURCHASE ORDER AGING REPORT ******

select 'Today''s Date:', to_char(sysdate, 'mm/dd/yyyy') from dual;
prompt

accept Vdays prompt 'Please enter number of days to query: ';


set heading on

column purordnum heading 'PO Numb' format 99999
column stat heading 'PO Stat' format a8
column orddate heading 'Date Open' format 9999
column pnum heading 'Prod Num' format a10
column pdesc heading 'Product Description' format a20
column ordqty heading 'Order Qty' format 999
column unitprice heading 'Unit Price' format $9,999.99
column ordamt heading 'Order Amount' format $999,999.99
column snum heading 'SNUM' format a4
column sname heading 'SNAME' format a15
column daysopen heading 'Days Open' format 9999


select purchaseorders.purordnum, substr(status, 1,1) as stat, to_char(purorddate, 'mm/dd/yyyy') as orddate, products.pnum, pdesc, ordqty, unitprice, ordamt, suppliers.snum, sname,  sysdate - purorddate as daysopen 
from purchaseorders, suppliers, products, dual
where purchaseorders.pnum = products.pnum 
and purchaseorders.snum= suppliers.snum
and status = 'Open'
order by daysopen desc nulls last;
