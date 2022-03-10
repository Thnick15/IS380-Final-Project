*.sql linguist-language=sql

<h2 align="center">IS380 Final Project</h4>

<h4 align="center">California State University, Long Beach</h4>

<h4 align="center">Sping 2018</h4>

<h4 align="center">IS 380 - Database Management</h4>

<h4 align="center">Semester Project</h4>

<h3 align="center">GMI Purchase Order System</h4>

<h3 align="left">Project Description</h4>

The General Murchandise Inc. (GMI) has asked you to design and implement a purchase order system. The GMI sells many office products, such as Pencil, Pen, and the like. Each product has a product ID and description. GMI constantly orders products from its suppliers, such as Staples, Office Depot, etc. To simplify the matter, each time we place an order with a supplier, only one item is ordered. Not every supplier carries every product so we keep track authorized/available suppliers for each product. For instance, the authorized suppliers of Item p1 Pencil are s1 and s3; the authorized suppliers of item p3 Magic Marker are s1 and s2. Notice that the same item may have different price with different suppliers. For instance, p1 Pencil is $2.50 if we order it from Staples, and $2.00 if we order from OFfice Max. GMI maintains the price list in its database.

<h3 align="left">Program 1. OpenPO.sql</h4>

To place a purchase order, the user runs a program named **OpenPO.sql**. The system first prompts the Welcome message and automatically displays today's date. The system then prompts the user to enter the Item Number. The item's description and current inventory level are then displayed. The system then displays the list of authorized suppliers, location, and unit price. The user enters the supplier's number. The supplier's name, address, and phone number are displayed. Please notice the specific format when displaying the address and the phone number. The system then prompts for the quantity to be ordered and display unit price and amount ordered. The system updates all data to the database and assigns a unique order number to this data. This order is now 'O'pened.

A sample screen is as follows. The <ins>**bold**</ins> text indicates user input. Everything else is displayed automatically.

**SQL> start f:openpo.sql**

********* O P E N    O R D E R *********

Today's Date: 22-MAR-18

Enter the Item Number: <ins>**p1**</ins>
  <br />Item Description:Pencil
  <br />Current Inventory Level: 230

Please select from one of the following Authorized Suppliers:
```
SNUM  SNAME     LOCATION        UnitPrice
----- --------- --------------  ----------
s1  Staples     Palmdale, CA    $2.50
s3  Office Max  Long Beach, CA  $2.00
```
 
 Enter the Supplier Number: <ins>**s3**</ins>
 <br /> Supplier Name: Office Max
 <br /> Address: 123 Main Street
 <br /> City, State Zip: Long Beach CA
 <br /> Phone: (562) 985-1111
 
 Enter Order Quantity: <ins>**20**</ins>
 <br /> Unit Price $2.00
 <br /> Amount Ordered: $40.00
 
 ****** Order Status: Open
 
 ****** Purchase Order number is ------> 1001
 
 <ins>Note 1:</ins> Since the unit price may change over time, you should store t he unit price and amoutn information under each order.
 <br /><ins>Note 2:</ins> In terms of screen out, you do not need to match spacing exactly, but you do need to display all information in reasonable format.
 
 <h3 align="left">Program 2. ReceivePO.sql</h4>
 
 When the ordered items arrive at our facility, the user would run the program **ReceivePO.sql** to reflect this transaction. The user enters the order number, the system displays all the details of that order. The program then asks the user how many units are actually received, and display the amount due based on the received units. Product inventory level is calculated. The order is now 'C'losed.
 
 
**SQL> start f:receivepo.sql**

********* R E C E I V E    O R D E R *********

Today's Date: 02-APR-2018

Please enter the Purchase Order Number: <ins>**1001**</ins>

 <br /> Order Number: 1001
 <br /> Item Number: p1
 <br /> Item Description: Pencil
 <br /> Supplier Number: s3
 <br /> Supplier Name: Office Max
 <br /> Date ordered: 22-MAR-2018
 <br /> Today's date: 02-APR-2018
 <br /> Unit Price: $2.00
 <br /> Amount Ordered: $40.00

Enter quantity received: <ins>**18**</ins>
 <br /> Amount Due: $36.00
 <br /> Inventory Level: 248

**
 <br /> Order is now ---> Closed
 <br /> Date Closed: 02-APR-2018
 
  <h3 align="left">Program 3. QueryPO.sql</h4>
  
  **QueryPO.dql** is a program to look up details of the order. In other words, the user enters the order number, and details of the order are displayed, like the following:

**SQL> start f:querypo.sql**

********* Q U E R Y    O R D E R *********

Please enter the Purchase Order Number: <ins>**1001**</ins>

 <br /> Purchase Order Number: 1001
 <br /> Item Number: p1
 <br /> Item Description: Pencil
 <br /> Current Inventory Level: 248
 <br /> Supplier Number: s3
 <br /> Supplier Name: Office Max
 <br /> Date ordered: 22-MAR-2018
 <br /> Quantity Ordered: 20
 <br /> Date Received: 02-APR-2018
 <br /> Unit Price: $2.00
 <br /> Amount Ordered: $40.00
 <br /> Amount Due: $36.00
 
 Order Status: Closed
 
 <h3 align="left">Program 4. Aging.sql</h4>
 
 The management is concerned when orders have not been delivered for too long. This report displays orders have been Opened for x number of days and have not been closed (this is typically called the "aging" report). Please sort your report by the longest DaysOpen first. Here is a sample report:
 
 **SQL> start f:aging.sql**

********* PURCHASE ORDER AGING Report *********

Today's Date: 4/2/2018

Please enter number of days to query: <ins>**30**</ins>
```
PO    PO    Date      Prod   Product     Order Unit   Order   SNUM    SNAME        Days
Numb  Stat  Open       Num   Description Qty   Price  Amount                       Open
----  ----  ---------- ----  ----------- ---- -----   ------- ----- ------------- -----
1008   O    2/11/2018  p1    Pencil      42    2.00    84.00   s2    Office Depot    50
1010   O    2/19/2018  p5    Eraser      15    3.00    45.00   s1    Staples         42
```

 <h3 align="left">Program 5. ShortShip.sql</h4>
 
 When the receiving units are less than the order units, this order is called "short ship". The management is concerned about short ships and would like to see a report of short ship orders. It is sorted by PO Number.
 
**SQL> start f:shortship**

********* SHORT SHIP Report *********

Today's Date: 4/2/2018

Please enter number of days to query: <ins>**30**</ins>
```
PO    PO     Date       Prod  Product     Order Receive Short    SNUM  SNAME       
Numb  Status Open       Num   Description Qty   Qty     Qty                     
----  ----   ---------- ----  ----------- ---- ------  -------  ----- ---------------
1842   C     03/04/2018  p1    Pencil      42    35       7       s2   Office Depot
1851   C     03/06/2018  p5    Eraser      15    14       1       s1   Staples
1864   C     03/07/2018  p3    Marker      120   100     20       s2   Office Depot
```

<h3 align="left">Program 6. SupplierMonthly.sql</h4>

This program displays number of orders, total units and amount according to each supplier and the month/year of the order open date. In other words, for each supplier and each month/year, the management wants to see the number of orders, total units, and total amount. The following is a sample report:

**SQL> start f:SupplierMonthly**

********* SUPPLIER MONTHLY Report *********

```
Supplier  Supplier     Order      No of     Total   Total     
Number    Name         Month      Orders    Units   Amount                        
-------  ----------   ---------- -------  -------  --------
s1       Staples      01/2018      48      4,509    $19,394
s1       Staples      02/2018      39      3,293    $17409
s1       Staples      03/2018      84      9,283    $46,594
...
s2       Office Depot 01/2018      15      1,663    $ 5,394
s2       Office Depot 02/2018      22      2,608    $10,283

```
