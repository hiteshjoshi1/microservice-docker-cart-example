USE microservices_cust;
INSERT INTO customer(CUST_NAME, CUST_AGE, CUST_PHONE_NUM) VALUES('Hitesh Joshi',31,951911009); 

INSERT INTO address(CUST_ID,APARTMENT_NAME,STREET_NAME,CITY,STATE,PIN)
 VALUES (1,'Hubris Residency','HSR layout','Bangalore','Karanataka',560037); 
 
 
 /*run customer inserts in a separate command*/
 INSERT INTO customer(CUST_NAME, CUST_AGE, CUST_PHONE_NUM) VALUES('Deepika Joshi',30,989220110); 

INSERT INTO address(CUST_ID,APARTMENT_NAME,STREET_NAME,CITY,STATE,PIN)
 VALUES (1,'Vijaya Residency','Allahpur','Bangalore','Karanataka',560037);
 
 INSERT INTO address(CUST_ID,APARTMENT_NAME,STREET_NAME,CITY,STATE,PIN)
 VALUES (2,'Vijaya Residency','KareemNagar','Allahbad','UP',560037);
 
 INSERT INTO address(CUST_ID,APARTMENT_NAME,STREET_NAME,CITY,STATE,PIN)
 VALUES (1,'Muir Road','Near Bus stand','Almora','Uttarakhand',262501);
 
 
 
UPDATE customer 
SET 
    PRIMARY_ADDR_ID = 1
WHERE
    ID = 1;

SELECT * FROM     customer;

SELECT    * FROM    address;

SELECT    * FROM    address t,     customer c WHERE     t.cust_id = c.id;

SELECT   * FROM     address t,     customer c WHERE     t.cust_id = c.id  AND c.cust_name = 'Hitesh Joshi';
