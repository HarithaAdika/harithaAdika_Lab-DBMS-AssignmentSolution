CREATE database IF NOT EXISTS `ecommerce_directory`  ;
USE `ecommerce_directory` ;

/* Creating tables */
CREATE TABLE IF NOT EXISTS `supplier`(`SUPP_ID` INT NOT NULL,`SUPP_NAME` VARCHAR(50) NOT NULL,`SUPP_CITY` VARCHAR(50) NOT NULL, `SUPP_PHONE` VARCHAR(50) NOT NULL,PRIMARY KEY(`SUPP_ID`));

CREATE TABLE IF NOT EXISTS `customer`(`CUS_ID` INT NOT NULL,`CUS_NAME` VARCHAR(20) NOT NULL, `CUS_PHONE` VARCHAR(10) NOT NULL,`CUS_CITY` VARCHAR(30) NOT NULL,`CUS_GENDER` CHAR(1) NULL DEFAULT NULL,PRIMARY KEY(`CUS_ID`));

CREATE TABLE IF NOT EXISTS `category`(`CAT_ID` INT NOT NULL,`CAT_NAME` VARCHAR(20) NOT NULL,PRIMARY KEY(`CAT_ID`));
 
CREATE TABLE IF NOT EXISTS `product`(`PRO_ID` INT NOT NULL,`PRO_NAME` VARCHAR(20) NOT NULL DEFAULT
"Dummy", `PRO_DESC` VARCHAR(60) NULL DEFAULT NULL,`CAT_ID` INT NOT NULL,PRIMARY KEY(`PRO_ID`),FOREIGN KEY (`CAT_ID`)  REFERENCES `category` (`CAT_ID`));

CREATE TABLE IF NOT EXISTS `supplier_pricing`(`PRICING_ID` INT NOT NULL,`PRO_ID` INT NOT NULL,`SUPP_ID` INT NOT NULL,`SUPP_PRICE` INT DEFAULT 0,PRIMARY KEY(`PRICING_ID`),FOREIGN KEY (`PRO_ID`)  REFERENCES `product` (`PRO_ID`),FOREIGN KEY (`SUPP_ID`)  REFERENCES `supplier` (`SUPP_ID`));

CREATE TABLE IF NOT EXISTS `order`(`ORD_ID` INT NOT NULL,`ORD_AMOUNT` INT NOT NULL,`ORD_DATE` DATE NOT NULL,`CUS_ID` INT NOT NULL,`PRICING_ID` INT NOT NULL,PRIMARY KEY(`ORD_ID`),FOREIGN KEY (`CUS_ID`)  REFERENCES `customer` (`CUS_ID`),FOREIGN KEY (`PRICING_ID`)  REFERENCES `supplier_pricing` (`PRICING_ID`));

CREATE TABLE IF NOT EXISTS `rating`(`RAT_ID` INT NOT NULL,`ORD_ID` INT NOT NULL,`RAT_RATSTARS` INT NOT NULL,PRIMARY KEY(`RAT_ID`),FOREIGN KEY (`ORD_ID`)  REFERENCES `order` (`ORD_ID`));

/*  Inserting values into created tables */
-- 2) Insert the following data in the table created above
-- Supplier Table Data:
INSERT INTO supplier VALUES (1,'Rajesh Retails','Delhi',1234567890);
INSERT INTO supplier VALUES (2,'Appario Ltd.','Mumbai',2589631470);
INSERT INTO supplier VALUES (3,'Knome products','Banglore',9785462315);
INSERT INTO supplier VALUES (4,'Bansal Retails','Kochi',8975463285);
INSERT INTO supplier VALUES (5,'Mittal Ltd.','Lucknow',7898456532);
-- Customer Table:
INSERT INTO customer VALUES (1,'AAKASH',9999999999,'DELHI','M');
INSERT INTO customer VALUES (2,'AMAN',9785463215,'NOIDA','M');
INSERT INTO customer VALUES (3,'NEHA',9999999999,'MUMBAI','F');
INSERT INTO customer VALUES (4,'MEGHA',9994562399,'KOLKATA','F');
INSERT INTO customer VALUES (5,'PULKIT',7895999999,'LUCKNOW','M');
-- Category Table:
INSERT INTO category VALUES (1,'BOOKS');
INSERT INTO category VALUES (2,'GAMES');
INSERT INTO category VALUES (3,'GROCERIES');
INSERT INTO category VALUES (4,'ELECTRONICS');
INSERT INTO category VALUES (5,'CLOTHES');
-- Product Table:
INSERT INTO product VALUES (1,'GTA V','Windows 7 and above with i5 processor and 8GB RAM',2);
INSERT INTO product VALUES (2,'TSHIRT','SIZE-L with Black, Blue and White variations',5);
INSERT INTO product VALUES (3,'ROG LAPTOP','Windows 10 with 15inch screen, i7 processor, 1TB SSD',4);
INSERT INTO product VALUES (4,'OATS','Highly Nutritious from Nestle',3);
INSERT INTO product VALUES (5,'HARRY POTTER','Best Collection of all time by J.K Rowling',1);
INSERT INTO product VALUES (6,'MILK','1L Toned MIlk',3);
INSERT INTO product VALUES (7,'Boat Earphones','1.5Meter long Dolby Atmos',4);
INSERT INTO product VALUES (8,'Jeans','Stretchable Denim Jeans with various sizes and color',5);
INSERT INTO product VALUES (9,'Project IGI','compatible with windows 7 and above',2);
INSERT INTO product VALUES (10,'Hoodie','Black GUCCI for 13 yrs and above',5);
INSERT INTO product VALUES (11,'Rich Dad Poor Dad','Written by RObert Kiyosaki',1);
INSERT INTO product VALUES (12,'Train Your Brain','By Shireen Stephen',1);

-- Supplier_pricing Table:
INSERT INTO supplier_pricing VALUES (1,1,2,1500);
INSERT INTO supplier_pricing VALUES (2,3,5,30000);
INSERT INTO supplier_pricing VALUES (3,5,1,3000);
INSERT INTO supplier_pricing VALUES (4,2,3,2500);
INSERT INTO supplier_pricing VALUES (5,4,1,1000);
-- Order Table:
INSERT INTO ecommerce_directory.order VALUES (101,1500,'2021-10-06',2,1);
INSERT INTO ecommerce_directory.order VALUES (102,1000,'2021-10-12',3,5);
INSERT INTO ecommerce_directory.order VALUES (103,30000,'2021-09-16',5,2);
INSERT INTO ecommerce_directory.order VALUES (104,1500,'2021-10-05',1,1);
INSERT INTO ecommerce_directory.order VALUES (105,3000,'2021-08-16',4,3);
INSERT INTO ecommerce_directory.order VALUES (106,1450,'2021-08-18',1,9);
INSERT INTO ecommerce_directory.order VALUES (107,789,'2021-09-01',3,7);
INSERT INTO ecommerce_directory.order VALUES (108,780,'2021-09-07',5,6);
INSERT INTO ecommerce_directory.order VALUES (109,3000,'2021-00-10',5,3);
INSERT INTO ecommerce_directory.order VALUES (110,2500,'2021-09-10',2,4);
INSERT INTO ecommerce_directory.order VALUES (111,1000,'2021-09-15',4,5);
INSERT INTO ecommerce_directory.order VALUES (112,789,'2021-09-16',4,7);
INSERT INTO ecommerce_directory.order VALUES (113,31000,'2021-09-16',1,8);
INSERT INTO ecommerce_directory.order VALUES (114,1000,'2021-09-16',3,5);
INSERT INTO ecommerce_directory.order VALUES (115,3000,'2021-09-16',5,3);
INSERT INTO ecommerce_directory.order VALUES (116,99,'2021-09-17',2,14);

-- Rating table:
INSERT INTO rating VALUES (1,101,4); 
INSERT INTO rating VALUES (2,102,3); 
INSERT INTO rating VALUES (3,103,1); 
INSERT INTO rating VALUES (4,104,2); 
INSERT INTO rating VALUES (5,105,4); 
INSERT INTO rating VALUES (6,106,3); 
INSERT INTO rating VALUES (7,107,4); 
INSERT INTO rating VALUES (8,108,4); 
INSERT INTO rating VALUES (9,109,3); 
INSERT INTO rating VALUES (10,110,5); 
INSERT INTO rating VALUES (11,111,3); 
INSERT INTO rating VALUES (12,112,4); 
INSERT INTO rating VALUES (13,113,2); 
INSERT INTO rating VALUES (14,114,1); 
INSERT INTO rating VALUES (15,115,1); 
INSERT INTO rating VALUES (16,116,0);

 /* 3. Display the total number of customers based on gender who have placed orders of worth at least Rs.3000 */

SELECT C.CUS_GENDER AS GENDER, count(distinct(C.CUS_ID)) AS NoOfCustomers FROM customer C WHERE C.CUS_ID IN ( SELECT CUS_ID From ecommerce_directory.order WHERE ORD_AMOUNT>=3000) group by C.CUS_GENDER;

/*4) Display all the orders along with product name ordered by a customer having Customer_Id=2 */

SELECT order_details.*,P.PRO_NAME AS Product_Name FROM product AS P INNER JOIN
(SELECT ord.*, SP.PRO_ID FROM ecommerce_directory.order AS ord INNER JOIN supplier_pricing AS SP ON ord.PRICING_ID = SP.PRICING_ID WHERE ord.CUS_ID =2 ) AS order_details ON order_details.PRO_ID = P.PRO_ID;

/* 5) Display the Supplier details who can supply more than one product. */

SELECT * FROM supplier WHERE SUPP_ID IN
(SELECT SUPP_ID From supplier_pricing GROUP BY SUPP_ID HAVING COUNT(PRO_ID)>1);

/* 6) Find the least expensive product from each category and print the table with category id, name, product name and price of the product */

SELECT C.CAT_ID,C.CAT_NAME,prod.PRO_NAME,min(prod.MIN_PRICE) AS Minimum_Price FROM category C  INNER JOIN
(SELECT P.CAT_ID,P.PRO_NAME,price.* FROM product P INNER JOIN
(SELECT SP.PRO_ID,min(SP.SUPP_PRICE) AS MIN_PRICE FROM supplier_pricing SP GROUP BY SP.PRO_ID)
AS price WHERE price.PRO_ID=P.PRO_ID) AS prod WHERE prod.CAT_ID = C.CAT_ID GROUP BY prod.CAT_ID;

/* 7) Display the Id and Name of the Product ordered after “2021-10-05”. */

SELECT PRO_ID AS Product_ID, PRO_NAME AS Product_Name FROM product WHERE PRO_ID IN
(SELECT PRO_ID FROM supplier_pricing WHERE PRICING_ID IN
(SELECT PRICING_ID FROM ecommerce_directory.order WHERE ORD_DATE>'2021-10-05'));

/* 8) Display customer name and gender whose names start or end with character 'A' */
-- Solution1:
SELECT CUS_NAME AS CustomerName, CUS_GENDER AS Gender FROM ecommerce_directory.customer WHERE CUS_NAME LIKE 'A%' OR CUS_NAME LIKE '%A';
-- Solution2:
SELECT CUS_NAME AS CustomerName, CUS_GENDER AS Gender FROM ecommerce_directory.customer WHERE LEFT(CUS_NAME , 1) IN ('A') 
OR RIGHT(CUS_NAME,1) IN  ('A');

/* 9) Create a stored procedure to display supplier id, name, rating and Type_of_Service. For Type_of_Service, If rating =5, print “Excellent 
Service”,If rating >4 print “Good Service”, If rating >2 print “Average Service” else print “Poor Service” */

DELIMITER &&
CREATE DEFINER=`root`@`localhost` PROCEDURE `ProdServiceRating`()
BEGIN
SELECT service_report.SUPP_ID,service_report.SUPP_NAME,service_report.Average,
CASE
WHEN service_report.Average = 5 THEN 'Excellent Service'
WHEN service_report.Average > 4 THEN 'Good Service'
WHEN service_report.Average > 2 THEN 'Avergae Service'
ELSE 'Poor Service'
END AS Type_of_Service FROM
(select final.SUPP_ID, supplier.SUPP_NAME, final.Average from
(select test2.SUPP_ID, sum(test2.RAT_RATSTARS)/count(test2.RAT_RATSTARS) as Average from
(select supplier_pricing.SUPP_ID,test.ORD_ID,test.RAT_RATSTARS from supplier_pricing inner join
(select `order`.PRICING_ID, `order`.ORD_ID, rating.RAT_RATSTARS from `order` inner join rating on rating.ORD_ID = `order`.ORD_ID ) 
as test where test.PRICING_ID = supplier_pricing.PRICING_ID)
as test2 group by supplier_pricing.SUPP_ID)
as final inner join supplier where final.SUPP_ID = supplier.SUPP_ID) as service_report;
END &&
DELIMITER ;
call `ProdServiceRating`();