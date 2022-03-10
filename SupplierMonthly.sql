set heading off
set feedback off
set echo off
set verify off


/* spool f:SupplierMonthly.txt */

prompt
prompt ****** SUPPLIER MONTHLY Report ******
prompt

set heading on

column snum heading 'Supplier Number' format a15
column sname heading 'Supplier Name' format a20
column orddate heading 'Order Month' format a12
column orders heading 'No of Orders' format 999
column shipqty heading 'Total Units' format 99999
column shipamt heading 'Total Amount' format $9,999.99


select purchaseorders.snum, suppliers.sname, to_char(purorddate, 'mm/yyyy') as orddate, count(purordnum) as orders, sum(shipqty) as shipqty, sum(shipamt) as shipamt
from purchaseorders, suppliers
where purchaseorders.snum = suppliers.snum
group by suppliers.sname, purchaseorders.snum, to_char(purorddate, 'mm/yyyy')
order by purchaseorders.snum;
