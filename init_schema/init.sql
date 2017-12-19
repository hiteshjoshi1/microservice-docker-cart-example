drop schema if exists microservices_cust;
drop schema if exists  microservices_invoice;
drop schema if exists  microservices_prod;

CREATE SCHEMA microservices_prod;

USE microservices_prod;

DROP TABLE IF EXISTS unit_type;
CREATE TABLE IF NOT EXISTS unit_type(ID BIGINT AUTO_INCREMENT PRIMARY KEY, UNIT_NAME VARCHAR(200) NOT NULL);

DROP TABLE IF EXISTS categories;
CREATE TABLE IF NOT EXISTS categories (
    ID BIGINT AUTO_INCREMENT PRIMARY KEY,
    CATEGORY_NAME VARCHAR(200) NOT NULL,
    unit_type_ID BIGINT NOT NULL,
    CONTROLLED BOOLEAN,
    FOREIGN KEY (unit_type_ID)
        REFERENCES unit_type (ID)
);



DROP TABLE IF EXISTS inventory;
CREATE TABLE IF NOT EXISTS inventory (
    ID BIGINT AUTO_INCREMENT PRIMARY KEY,
    PRODUCT_NAME VARCHAR(200) NOT NULL,
    QUANTITY BIGINT NOT NULL,
    UNIT_PRICE DOUBLE(10,4),
    PURCHASE_PRICE DOUBLE(10,4),
    TAX_RATE INTEGER(99),
    CATEGORY_ID BIGINT NOT NULL,
    BRAND_NAME VARCHAR(200),
    FOREIGN KEY (CATEGORY_ID)
        REFERENCES categories (ID)
);

commit;
INSERT INTO unit_type(UNIT_NAME)  VALUES ('Per Unit');
 
INSERT INTO unit_type(UNIT_NAME)  VALUES ('Per Kg');


INSERT INTO categories(unit_type_ID,CATEGORY_NAME,CONTROLLED)
 VALUES (1,'CLOTHES',false);
 
 INSERT INTO categories(unit_type_ID,CATEGORY_NAME,CONTROLLED)
 VALUES (2,'VEGETABLES',false);
 
INSERT INTO categories(unit_type_ID,CATEGORY_NAME,CONTROLLED)
 VALUES (1,'MEDICINES',true);
  
INSERT INTO categories(unit_type_ID,CATEGORY_NAME,CONTROLLED)
 VALUES (1,'MEDICINES',true);

commit;

/*run inventory inserts in a seprate command*/
INSERT INTO inventory(
    PRODUCT_NAME,
    QUANTITY,
    UNIT_PRICE,
    PURCHASE_PRICE,
    TAX_RATE,    
    CATEGORY_ID,BRAND_NAME) VALUES('Shirts',
    50,
    100,
    91,
    15,    
    2,'Louis Phillipe'); 
 
 INSERT INTO inventory(
    PRODUCT_NAME,
    QUANTITY,
    UNIT_PRICE,
    PURCHASE_PRICE,
    TAX_RATE,    
    CATEGORY_ID,BRAND_NAME) VALUES('Pants',
    100,
    100,
    91,
    15,    
    2,'Louis Phillipe'); 
    
	INSERT INTO inventory(
    PRODUCT_NAME,
    QUANTITY,
    UNIT_PRICE,
    PURCHASE_PRICE,
    TAX_RATE,    
    CATEGORY_ID) VALUES('Shimla Apples',
    1000,
    10,
    9,
    4,    
    3); 
commit;


/*------------------------------------------ */

CREATE SCHEMA microservices_invoice;

USE microservices_invoice;

DROP TABLE IF EXISTS mode_of_pay;
CREATE TABLE IF NOT EXISTS mode_of_pay (
    ID BIGINT AUTO_INCREMENT PRIMARY KEY,
    MODE_NAME VARCHAR(100) NOT NULL,
    MODE_DESC VARCHAR(500)
);



DROP TABLE IF EXISTS invoice;

CREATE TABLE IF NOT EXISTS invoice (
    ID BIGINT AUTO_INCREMENT PRIMARY KEY,
    CUST_ID BIGINT NOT NULL,
    DATE_OF_PURCHASE DATETIME,
    MODE_PAY_ID BIGINT NOT NULL,
    TOTAL_TAX_AMT INTEGER,
    CASHIER_NAME VARCHAR(500),
    FOREIGN KEY (MODE_PAY_ID)
        REFERENCES mode_of_pay(ID)
);

/* Item_id is from Inventory table */
DROP TABLE IF EXISTS orderitems;
Create table if not exists orderitems (
    ID BIGINT AUTO_INCREMENT PRIMARY KEY,
	INVOICE_ID BIGINT NOT NULL,
	ITEM_ID BIGINT NOT NULL,
    QUANTITY INTEGER(5),
	TAX_AMT BIGINT,
	TOTAL_COST BIGINT,
    CONSTRAINT tb_fk FOREIGN KEY (INVOICE_ID)
	REFERENCES invoice(ID)	
);
commit;

insert into mode_of_pay(MODE_NAME,MODE_DESC) values('Cash','OTC cash settlement');
insert into mode_of_pay(MODE_NAME,MODE_DESC) values('Card','OTC card settlement');
insert into mode_of_pay(MODE_NAME,MODE_DESC) values('Online','Online through payment gateway');
insert into mode_of_pay(MODE_NAME,MODE_DESC) values('Wallet','OTC through wallet');
commit;

insert into invoice(CUST_ID,DATE_OF_PURCHASE,MODE_PAY_ID,TOTAL_TAX_AMT,CASHIER_NAME) values(1,'2017-10-01 00:00:00',2,5,'Venu Babu');
insert into invoice(CUST_ID,DATE_OF_PURCHASE,MODE_PAY_ID,TOTAL_TAX_AMT,CASHIER_NAME) values(1,'2017-10-11 00:00:00',3,4,'Ram Babu');
insert into invoice(CUST_ID,DATE_OF_PURCHASE,MODE_PAY_ID,TOTAL_TAX_AMT,CASHIER_NAME) values(2,'2017-10-09 00:00:00',4,8,'Hari Babu');

commit;

insert into orderitems(INVOICE_ID,ITEM_ID, QUANTITY,TAX_AMT,TOTAL_COST) values(1,4,6,2.6,50);
insert into orderitems(INVOICE_ID,ITEM_ID, QUANTITY,TAX_AMT, TOTAL_COST) values(2,3,9,3.9,100);
insert into orderitems(INVOICE_ID,ITEM_ID, QUANTITY,TAX_AMT, TOTAL_COST) values(2,4,9,3.9,100);
insert into orderitems(INVOICE_ID,ITEM_ID, QUANTITY,TAX_AMT, TOTAL_COST) values(1,3,9,3.9,100);

commit;

/* -----------------------------------------------------*/

create schema microservices_cust;

USE microservices_cust;

DROP TABLE IF EXISTS customer;
CREATE TABLE IF NOT EXISTS customer(ID BIGINT AUTO_INCREMENT PRIMARY KEY, CUST_NAME VARCHAR(400) NOT NULL,
CUST_AGE INTEGER(3),MEMBERSHIP_ID BIGINT, CUST_PHONE_NUM BIGINT(10) NOT NULL, ALT_NUM BIGINT(10), PRIMARY_ADDR_ID BIGINT);


DROP TABLE IF EXISTS address;
CREATE TABLE IF NOT EXISTS address(ADDRESS_ID BIGINT AUTO_INCREMENT PRIMARY KEY, CUST_ID BIGINT NOT NULL,APARTMENT_NAME VARCHAR(500),
STREET_NAME VARCHAR(800),CITY VARCHAR(200),STATE VARCHAR(20),PIN INTEGER(10), FOREIGN KEY(CUST_ID) REFERENCES customer(ID));

commit;


INSERT INTO customer(CUST_NAME, CUST_AGE, CUST_PHONE_NUM) VALUES('Hitesh Joshi',31,951911009); 

 INSERT INTO customer(CUST_NAME, CUST_AGE, CUST_PHONE_NUM) VALUES('Deepika Joshi',30,989220110); 
 commit;

INSERT INTO address(CUST_ID,APARTMENT_NAME,STREET_NAME,CITY,STATE,PIN)
 VALUES (1,'Vijaya Residency','Allahpur','Bangalore','Karanataka',560037);
 
 INSERT INTO address(CUST_ID,APARTMENT_NAME,STREET_NAME,CITY,STATE,PIN)
 VALUES (2,'Vijaya Residency','KareemNagar','Allahbad','UP',560037);
 
 INSERT INTO address(CUST_ID,APARTMENT_NAME,STREET_NAME,CITY,STATE,PIN)
 VALUES (1,'Muir Road','Near Bus stand','Almora','Uttarakhand',262501);
 
 INSERT INTO address(CUST_ID,APARTMENT_NAME,STREET_NAME,CITY,STATE,PIN)
 VALUES (1,'Hubris Residency','HSR layout','Bangalore','Karanataka',560037); 
 
 commit;
 
UPDATE customer 
SET 
    PRIMARY_ADDR_ID = 1
WHERE
    ID = 1;
commit;
	


