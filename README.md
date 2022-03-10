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
 <br /> SNUM  SNAME     LOCATION   UnitPrice
 <br /> -----    --------- ---------  ----------
 <br /> s1  Staples Palmdale, CA  $2.50
 <br /> s3  Office Max  Long Beach, CA  $2.00
 
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
