USE microservices_prod;

INSERT INTO unit_type(UNIT_NAME)  VALUES ('Per Unit');
 
INSERT INTO unit_type(UNIT_NAME)  VALUES ('Per Kg');
 
SELECT * FROM unit_type;


INSERT INTO categories(unit_type_ID,CATEGORY_NAME,CONTROLLED)
 VALUES (1,'CLOTHES',false);
 
 INSERT INTO categories(unit_type_ID,CATEGORY_NAME,CONTROLLED)
 VALUES (2,'VEGETABLES',false);
 
INSERT INTO categories(unit_type_ID,CATEGORY_NAME,CONTROLLED)
 VALUES (1,'MEDICINES',true);
  
INSERT INTO categories(unit_type_ID,CATEGORY_NAME,CONTROLLED)
 VALUES (1,'MEDICINES',true);
 
SELECT * FROM categories;

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
 
 select * from inventory;

 