drop schema if exists microservices_cust;
drop schema if exists  microservices_invoice;
drop schema if exists  microservices_prod;

CREATE SCHEMA microservices_prod;

USE microservices_prod;

DROP TABLE IF EXISTS unit_type;
CREATE TABLE IF NOT EXISTS unit_type(ID BIGINT AUTO_INCREMENT PRIMARY KEY, UNIT_NAME VARCHAR(200) NOT NULL);

commit;

DROP TABLE IF EXISTS categories;
CREATE TABLE IF NOT EXISTS categories (
    ID BIGINT AUTO_INCREMENT PRIMARY KEY,
    CATEGORY_NAME VARCHAR(200) NOT NULL,
    unit_type_ID BIGINT NOT NULL,
    CONTROLLED BOOLEAN,
    FOREIGN KEY (unit_type_ID)
        REFERENCES unit_type (ID)
);

commit;

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

DROP TABLE IF EXISTS primary_prod_category;
CREATE TABLE IF NOT EXISTS primary_prod_category (
    ID BIGINT AUTO_INCREMENT PRIMARY KEY,
    CATEGORY_NAME VARCHAR(200) NOT NULL
);

commit;

DROP TABLE IF EXISTS secondary_prod_category;
CREATE TABLE IF NOT EXISTS secondary_prod_category (
    ID BIGINT AUTO_INCREMENT PRIMARY KEY,
    CATEGORY_NAME VARCHAR(200) NOT NULL,
    PRIMARY_CATEGORY_ID BIGINT NOT NULL,
    FOREIGN KEY (PRIMARY_CATEGORY_ID)
        REFERENCES primary_prod_category(ID)
);

commit;

DROP TABLE IF EXISTS tertiary_prod_category;
CREATE TABLE IF NOT EXISTS tertiary_prod_category (
    ID BIGINT AUTO_INCREMENT PRIMARY KEY,
    CATEGORY_NAME VARCHAR(200) NOT NULL,
    SECONDARY_CATEGORY_ID BIGINT NOT NULL,
    FOREIGN KEY (SECONDARY_CATEGORY_ID)
        REFERENCES secondary_prod_category (ID)
);

commit;

DROP TABLE IF EXISTS clothing_products;
CREATE TABLE IF NOT EXISTS clothing_products (
    ID BIGINT AUTO_INCREMENT PRIMARY KEY,
    PRODUCT_NAME VARCHAR(200) NOT NULL,
    QUANTITY_AVAILABLE BIGINT NOT NULL,
    UNIT_PRICE DOUBLE(10,4),
    CATEGORY_ID BIGINT NOT NULL,
    BRAND_NAME VARCHAR(200)  NOT NULL,
    SIZE VARCHAR(200),
    PRODUCT_DETAILS VARCHAR(500),    
    FOREIGN KEY (CATEGORY_ID)
        REFERENCES tertiary_prod_category(ID)
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



INSERT INTO primary_prod_category(CATEGORY_NAME) VALUES('Men');
INSERT INTO secondary_prod_category(CATEGORY_NAME,PRIMARY_CATEGORY_ID) VALUES('Topwear',(select ID from primary_prod_category where CATEGORY_NAME='Men'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('T-Shirts',(select ID from secondary_prod_category where CATEGORY_NAME='Topwear'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Casual Shirts',(select ID from secondary_prod_category where CATEGORY_NAME='Topwear'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Formal Shirts',(select ID from secondary_prod_category where CATEGORY_NAME='Topwear'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Sweaters & Sweatshirts',(select ID from secondary_prod_category where CATEGORY_NAME='Topwear'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Jackets',(select ID from secondary_prod_category where CATEGORY_NAME='Topwear'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Blazers & Coats',(select ID from secondary_prod_category where CATEGORY_NAME='Topwear'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Suits',(select ID from secondary_prod_category where CATEGORY_NAME='Topwear'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Clothing Fabric',(select ID from secondary_prod_category where CATEGORY_NAME='Topwear'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Jeans',(select ID from secondary_prod_category where CATEGORY_NAME='Topwear'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Casual Trousers',(select ID from secondary_prod_category where CATEGORY_NAME='Topwear'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Formal Trousers',(select ID from secondary_prod_category where CATEGORY_NAME='Topwear'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Shorts',(select ID from secondary_prod_category where CATEGORY_NAME='Topwear'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Track Pants/Joggers',(select ID from secondary_prod_category where CATEGORY_NAME='Topwear'));
INSERT INTO secondary_prod_category(CATEGORY_NAME,PRIMARY_CATEGORY_ID) VALUES('Sports & Active Wear',(select ID from primary_prod_category where CATEGORY_NAME='Men'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Active T-Shirts',(select ID from secondary_prod_category where CATEGORY_NAME='Sports & Active Wear'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Track Pants & Shorts',(select ID from secondary_prod_category where CATEGORY_NAME='Sports & Active Wear'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Jackets & Sweatshirts',(select ID from secondary_prod_category where CATEGORY_NAME='Sports & Active Wear'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Swimwear',(select ID from secondary_prod_category where CATEGORY_NAME='Sports & Active Wear'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Smart Wearables',(select ID from secondary_prod_category where CATEGORY_NAME='Sports & Active Wear'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Sports Accessories',(select ID from secondary_prod_category where CATEGORY_NAME='Sports & Active Wear'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Sports Equipment',(select ID from secondary_prod_category where CATEGORY_NAME='Sports & Active Wear'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Sports Shoes',(select ID from secondary_prod_category where CATEGORY_NAME='Sports & Active Wear'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Kurtas & Kurta Sets',(select ID from secondary_prod_category where CATEGORY_NAME='Sports & Active Wear'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Sherwanis',(select ID from secondary_prod_category where CATEGORY_NAME='Sports & Active Wear'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Nehru Jackets',(select ID from secondary_prod_category where CATEGORY_NAME='Sports & Active Wear'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Dhoti',(select ID from secondary_prod_category where CATEGORY_NAME='Sports & Active Wear'));
INSERT INTO secondary_prod_category(CATEGORY_NAME,PRIMARY_CATEGORY_ID) VALUES('Innerwear & Sleepwear',(select ID from primary_prod_category where CATEGORY_NAME='Men'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Briefs & Trunks',(select ID from secondary_prod_category where CATEGORY_NAME='Innerwear & Sleepwear'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Boxers',(select ID from secondary_prod_category where CATEGORY_NAME='Innerwear & Sleepwear'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Vests',(select ID from secondary_prod_category where CATEGORY_NAME='Innerwear & Sleepwear'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Sleepwear & Loungewear',(select ID from secondary_prod_category where CATEGORY_NAME='Innerwear & Sleepwear'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Thermals',(select ID from secondary_prod_category where CATEGORY_NAME='Innerwear & Sleepwear'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Casual Shoes',(select ID from secondary_prod_category where CATEGORY_NAME='Innerwear & Sleepwear'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Sports Shoes',(select ID from secondary_prod_category where CATEGORY_NAME='Innerwear & Sleepwear'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Formal Shoes',(select ID from secondary_prod_category where CATEGORY_NAME='Innerwear & Sleepwear'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Sandals & Floaters',(select ID from secondary_prod_category where CATEGORY_NAME='Innerwear & Sleepwear'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Flip Flops',(select ID from secondary_prod_category where CATEGORY_NAME='Innerwear & Sleepwear'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Customizable Shoes',(select ID from secondary_prod_category where CATEGORY_NAME='Innerwear & Sleepwear'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Socks',(select ID from secondary_prod_category where CATEGORY_NAME='Innerwear & Sleepwear'));
INSERT INTO secondary_prod_category(CATEGORY_NAME,PRIMARY_CATEGORY_ID) VALUES('Sunglasses and Frames',(select ID from primary_prod_category where CATEGORY_NAME='Men'));
INSERT INTO secondary_prod_category(CATEGORY_NAME,PRIMARY_CATEGORY_ID) VALUES('Fashion Accessories',(select ID from primary_prod_category where CATEGORY_NAME='Men'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Wallets',(select ID from secondary_prod_category where CATEGORY_NAME='Fashion Accessories'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Belts',(select ID from secondary_prod_category where CATEGORY_NAME='Fashion Accessories'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Ties, Cufflinks & Pocket Squares',(select ID from secondary_prod_category where CATEGORY_NAME='Fashion Accessories'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Accessory Gift Sets',(select ID from secondary_prod_category where CATEGORY_NAME='Fashion Accessories'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Helmets',(select ID from secondary_prod_category where CATEGORY_NAME='Fashion Accessories'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Caps & Hats',(select ID from secondary_prod_category where CATEGORY_NAME='Fashion Accessories'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Mufflers, Scarves & Gloves',(select ID from secondary_prod_category where CATEGORY_NAME='Fashion Accessories'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Phone Cases',(select ID from secondary_prod_category where CATEGORY_NAME='Fashion Accessories'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Travel Accessories',(select ID from secondary_prod_category where CATEGORY_NAME='Fashion Accessories'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Rings & Wristwear',(select ID from secondary_prod_category where CATEGORY_NAME='Fashion Accessories'));
INSERT INTO primary_prod_category(CATEGORY_NAME) VALUES('Women');
INSERT INTO secondary_prod_category(CATEGORY_NAME,PRIMARY_CATEGORY_ID) VALUES('Indian & Fusion Wear',(select ID from primary_prod_category where CATEGORY_NAME='Women'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Kurtas & Suits',(select ID from secondary_prod_category where CATEGORY_NAME='Indian & Fusion Wear'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Kurtis, Tunics & Tops',(select ID from secondary_prod_category where CATEGORY_NAME='Indian & Fusion Wear'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Ethnic Dresses',(select ID from secondary_prod_category where CATEGORY_NAME='Indian & Fusion Wear'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Leggings, Salwars, Churidars',(select ID from secondary_prod_category where CATEGORY_NAME='Indian & Fusion Wear'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Skirts & Palazzos',(select ID from secondary_prod_category where CATEGORY_NAME='Indian & Fusion Wear'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Sarees & Blouses',(select ID from secondary_prod_category where CATEGORY_NAME='Indian & Fusion Wear'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Dress Material',(select ID from secondary_prod_category where CATEGORY_NAME='Indian & Fusion Wear'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Lehenga Choli',(select ID from secondary_prod_category where CATEGORY_NAME='Indian & Fusion Wear'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Dupattas & Shawls',(select ID from secondary_prod_category where CATEGORY_NAME='Indian & Fusion Wear'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Jackets & Waistcoats',(select ID from secondary_prod_category where CATEGORY_NAME='Indian & Fusion Wear'));
INSERT INTO secondary_prod_category(CATEGORY_NAME,PRIMARY_CATEGORY_ID) VALUES('Western Wear',(select ID from primary_prod_category where CATEGORY_NAME='Women'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Dresses & Jumpsuits',(select ID from secondary_prod_category where CATEGORY_NAME='Western Wear'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Tops, T-Shirts & Shirts',(select ID from secondary_prod_category where CATEGORY_NAME='Western Wear'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Jeans & Jeggings',(select ID from secondary_prod_category where CATEGORY_NAME='Western Wear'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Trousers & Capris',(select ID from secondary_prod_category where CATEGORY_NAME='Western Wear'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Shorts & Skirts',(select ID from secondary_prod_category where CATEGORY_NAME='Western Wear'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Shrugs',(select ID from secondary_prod_category where CATEGORY_NAME='Western Wear'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Sweaters & Sweatshirts',(select ID from secondary_prod_category where CATEGORY_NAME='Western Wear'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Jackets & Waistcoats',(select ID from secondary_prod_category where CATEGORY_NAME='Western Wear'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Coats & Blazers',(select ID from secondary_prod_category where CATEGORY_NAME='Western Wear'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Bras & Lingerie Sets',(select ID from secondary_prod_category where CATEGORY_NAME='Western Wear'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Briefs',(select ID from secondary_prod_category where CATEGORY_NAME='Western Wear'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Shapewear',(select ID from secondary_prod_category where CATEGORY_NAME='Western Wear'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Sleepwear & Loungewear',(select ID from secondary_prod_category where CATEGORY_NAME='Western Wear'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Swimwear',(select ID from secondary_prod_category where CATEGORY_NAME='Western Wear'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Camisoles & Thermals',(select ID from secondary_prod_category where CATEGORY_NAME='Western Wear'));
INSERT INTO secondary_prod_category(CATEGORY_NAME,PRIMARY_CATEGORY_ID) VALUES('Footwear',(select ID from primary_prod_category where CATEGORY_NAME='Women'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Flats & Casual Shoes',(select ID from secondary_prod_category where CATEGORY_NAME='Footwear'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Heels',(select ID from secondary_prod_category where CATEGORY_NAME='Footwear'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Boots',(select ID from secondary_prod_category where CATEGORY_NAME='Footwear'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Sports Shoes & Floaters',(select ID from secondary_prod_category where CATEGORY_NAME='Footwear'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Clothing',(select ID from secondary_prod_category where CATEGORY_NAME='Footwear'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Footwear',(select ID from secondary_prod_category where CATEGORY_NAME='Footwear'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Sports Accessories',(select ID from secondary_prod_category where CATEGORY_NAME='Footwear'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Sports Equipment',(select ID from secondary_prod_category where CATEGORY_NAME='Footwear'));
INSERT INTO secondary_prod_category(CATEGORY_NAME,PRIMARY_CATEGORY_ID) VALUES('Headphones & Speakers',(select ID from primary_prod_category where CATEGORY_NAME='Women'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Makeup',(select ID from secondary_prod_category where CATEGORY_NAME='Headphones & Speakers'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Skincare',(select ID from secondary_prod_category where CATEGORY_NAME='Headphones & Speakers'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Premium Beauty',(select ID from secondary_prod_category where CATEGORY_NAME='Headphones & Speakers'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Fragrances',(select ID from secondary_prod_category where CATEGORY_NAME='Headphones & Speakers'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Fashion Jewellery',(select ID from secondary_prod_category where CATEGORY_NAME='Headphones & Speakers'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Fine Jewellery',(select ID from secondary_prod_category where CATEGORY_NAME='Headphones & Speakers'));
INSERT INTO primary_prod_category(CATEGORY_NAME) VALUES('Kids');
INSERT INTO secondary_prod_category(CATEGORY_NAME,PRIMARY_CATEGORY_ID) VALUES('Boys Clothing',(select ID from primary_prod_category where CATEGORY_NAME='Kids'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('T-Shirts',(select ID from secondary_prod_category where CATEGORY_NAME='Boys Clothing'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Shirts',(select ID from secondary_prod_category where CATEGORY_NAME='Boys Clothing'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Jeans & Trousers',(select ID from secondary_prod_category where CATEGORY_NAME='Boys Clothing'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Shorts & Dungarees',(select ID from secondary_prod_category where CATEGORY_NAME='Boys Clothing'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Track Pants & Pyjamas',(select ID from secondary_prod_category where CATEGORY_NAME='Boys Clothing'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Clothing Sets',(select ID from secondary_prod_category where CATEGORY_NAME='Boys Clothing'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Indian Wear',(select ID from secondary_prod_category where CATEGORY_NAME='Boys Clothing'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Sweaters, Sweatshirts & Jackets',(select ID from secondary_prod_category where CATEGORY_NAME='Boys Clothing'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Rompers & Sleepwear',(select ID from secondary_prod_category where CATEGORY_NAME='Boys Clothing'));
INSERT INTO secondary_prod_category(CATEGORY_NAME,PRIMARY_CATEGORY_ID) VALUES('Girls Clothing',(select ID from primary_prod_category where CATEGORY_NAME='Kids'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Dresses',(select ID from secondary_prod_category where CATEGORY_NAME='Girls Clothing'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Tops & T-Shirts',(select ID from secondary_prod_category where CATEGORY_NAME='Girls Clothing'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Clothing Sets',(select ID from secondary_prod_category where CATEGORY_NAME='Girls Clothing'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Indian Wear',(select ID from secondary_prod_category where CATEGORY_NAME='Girls Clothing'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Skirts, Shorts & Jumpsuits',(select ID from secondary_prod_category where CATEGORY_NAME='Girls Clothing'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Tights & Leggings',(select ID from secondary_prod_category where CATEGORY_NAME='Girls Clothing'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Jeans, Trousers & Capris',(select ID from secondary_prod_category where CATEGORY_NAME='Girls Clothing'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Track Pants',(select ID from secondary_prod_category where CATEGORY_NAME='Girls Clothing'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Sweaters, Sweatshirts & Jackets',(select ID from secondary_prod_category where CATEGORY_NAME='Girls Clothing'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Rompers & Sleepwear',(select ID from secondary_prod_category where CATEGORY_NAME='Girls Clothing'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Casual Shoes',(select ID from secondary_prod_category where CATEGORY_NAME='Girls Clothing'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Sports Shoes',(select ID from secondary_prod_category where CATEGORY_NAME='Girls Clothing'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Sandals',(select ID from secondary_prod_category where CATEGORY_NAME='Girls Clothing'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Flip flops',(select ID from secondary_prod_category where CATEGORY_NAME='Girls Clothing'));
INSERT INTO secondary_prod_category(CATEGORY_NAME,PRIMARY_CATEGORY_ID) VALUES('Girls Footwear',(select ID from primary_prod_category where CATEGORY_NAME='Kids'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Casual Shoes',(select ID from secondary_prod_category where CATEGORY_NAME='Girls Footwear'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Flats',(select ID from secondary_prod_category where CATEGORY_NAME='Girls Footwear'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Heels',(select ID from secondary_prod_category where CATEGORY_NAME='Girls Footwear'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Sports Shoes',(select ID from secondary_prod_category where CATEGORY_NAME='Girls Footwear'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Flip flops',(select ID from secondary_prod_category where CATEGORY_NAME='Girls Footwear'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Sandals',(select ID from secondary_prod_category where CATEGORY_NAME='Girls Footwear'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Bags & Backpacks',(select ID from secondary_prod_category where CATEGORY_NAME='Girls Footwear'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Watches',(select ID from secondary_prod_category where CATEGORY_NAME='Girls Footwear'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Jewellery',(select ID from secondary_prod_category where CATEGORY_NAME='Girls Footwear'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Hair Accessories',(select ID from secondary_prod_category where CATEGORY_NAME='Girls Footwear'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Sunglasses',(select ID from secondary_prod_category where CATEGORY_NAME='Girls Footwear'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Frames',(select ID from secondary_prod_category where CATEGORY_NAME='Girls Footwear'));
INSERT INTO secondary_prod_category(CATEGORY_NAME,PRIMARY_CATEGORY_ID) VALUES('Brands',(select ID from primary_prod_category where CATEGORY_NAME='Kids'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Mothercare',(select ID from secondary_prod_category where CATEGORY_NAME='Brands' and primary_category_id =(select id from primary_prod_category where category_name='Kids' ) ));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Gini and Jony',(select ID from secondary_prod_category where CATEGORY_NAME='Brands' and primary_category_id =(select id from primary_prod_category where category_name='Kids' ) ));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('U.S. Polo Assn. Kids',(select ID from secondary_prod_category where CATEGORY_NAME='Brands' and primary_category_id =(select id from primary_prod_category where category_name='Kids' ) ));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('United Colors of Benetton',(select ID from secondary_prod_category where CATEGORY_NAME='Brands' and primary_category_id =(select id from primary_prod_category where category_name='Kids' ) ));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('YK',(select ID from secondary_prod_category where CATEGORY_NAME='Brands' and primary_category_id =(select id from primary_prod_category where category_name='Kids' ) ));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Allen Solly Junior',(select ID from secondary_prod_category where CATEGORY_NAME='Brands' and primary_category_id =(select id from primary_prod_category where category_name='Kids' ) ));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Next',(select ID from secondary_prod_category where CATEGORY_NAME='Brands' and primary_category_id =(select id from primary_prod_category where category_name='Kids' ) ));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Pepe Jeans',(select ID from secondary_prod_category where CATEGORY_NAME='Brands' and primary_category_id =(select id from primary_prod_category where category_name='Kids' ) ));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Tommy Hilfiger',(select ID from secondary_prod_category where CATEGORY_NAME='Brands' and primary_category_id =(select id from primary_prod_category where category_name='Kids' ) ));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('612 League',(select ID from secondary_prod_category where CATEGORY_NAME='Brands' and primary_category_id =(select id from primary_prod_category where category_name='Kids' ) ));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Action Figures & Soft Toys',(select ID from secondary_prod_category where CATEGORY_NAME='Brands' and primary_category_id =(select id from primary_prod_category where category_name='Kids' ) ));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Learning & Development Toys',(select ID from secondary_prod_category where CATEGORY_NAME='Brands' and primary_category_id =(select id from primary_prod_category where category_name='Kids' ) ));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Toy Vehicles',(select ID from secondary_prod_category where CATEGORY_NAME='Brands' and primary_category_id =(select id from primary_prod_category where category_name='Kids' ) ));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Activity & Construction Toys',(select ID from secondary_prod_category where CATEGORY_NAME='Brands' and primary_category_id =(select id from primary_prod_category where category_name='Kids' ) ));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Musical Toys & Ride Ons',(select ID from secondary_prod_category where CATEGORY_NAME='Brands' and primary_category_id =(select id from primary_prod_category where category_name='Kids' ) ));
INSERT INTO primary_prod_category(CATEGORY_NAME) VALUES('Home & Living');
INSERT INTO secondary_prod_category(CATEGORY_NAME,PRIMARY_CATEGORY_ID) VALUES('Bed Linen & Furnishing',(select ID from primary_prod_category where CATEGORY_NAME='Home & Living'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Bedsheets',(select ID from secondary_prod_category where CATEGORY_NAME='Bed Linen & Furnishing'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Bedding Sets',(select ID from secondary_prod_category where CATEGORY_NAME='Bed Linen & Furnishing'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Blankets Quilts and Dohars',(select ID from secondary_prod_category where CATEGORY_NAME='Bed Linen & Furnishing'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Pillows & Pillow Covers',(select ID from secondary_prod_category where CATEGORY_NAME='Bed Linen & Furnishing'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Bed Covers',(select ID from secondary_prod_category where CATEGORY_NAME='Bed Linen & Furnishing'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Bath Towels',(select ID from secondary_prod_category where CATEGORY_NAME='Bed Linen & Furnishing'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Hand and Face Towels',(select ID from secondary_prod_category where CATEGORY_NAME='Bed Linen & Furnishing'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Beach Towels',(select ID from secondary_prod_category where CATEGORY_NAME='Bed Linen & Furnishing'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Towels Set',(select ID from secondary_prod_category where CATEGORY_NAME='Bed Linen & Furnishing'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Bath Rugs',(select ID from secondary_prod_category where CATEGORY_NAME='Bed Linen & Furnishing'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Bath Robes',(select ID from secondary_prod_category where CATEGORY_NAME='Bed Linen & Furnishing'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Bathroom Accessories',(select ID from secondary_prod_category where CATEGORY_NAME='Bed Linen & Furnishing'));
INSERT INTO secondary_prod_category(CATEGORY_NAME,PRIMARY_CATEGORY_ID) VALUES('Cushions & Cushion Covers',(select ID from primary_prod_category where CATEGORY_NAME='Home & Living'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Carpets',(select ID from secondary_prod_category where CATEGORY_NAME='Cushions & Cushion Covers'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Floor Mats and Dhurries',(select ID from secondary_prod_category where CATEGORY_NAME='Cushions & Cushion Covers'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Door Mats',(select ID from secondary_prod_category where CATEGORY_NAME='Cushions & Cushion Covers'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Tableware & Serveware',(select ID from secondary_prod_category where CATEGORY_NAME='Cushions & Cushion Covers'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Cookware & Kitchen Tools',(select ID from secondary_prod_category where CATEGORY_NAME='Cushions & Cushion Covers'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Kitchen Storage',(select ID from secondary_prod_category where CATEGORY_NAME='Cushions & Cushion Covers'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Table Covers & Furnishings',(select ID from secondary_prod_category where CATEGORY_NAME='Cushions & Cushion Covers'));
INSERT INTO secondary_prod_category(CATEGORY_NAME,PRIMARY_CATEGORY_ID) VALUES('Home Décor',(select ID from primary_prod_category where CATEGORY_NAME='Home & Living'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Plants & Planters',(select ID from secondary_prod_category where CATEGORY_NAME='Home Décor'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Aromas, Candles & Candle Holders',(select ID from secondary_prod_category where CATEGORY_NAME='Home Décor'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Clocks',(select ID from secondary_prod_category where CATEGORY_NAME='Home Décor'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Mirrors',(select ID from secondary_prod_category where CATEGORY_NAME='Home Décor'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Wall Décor',(select ID from secondary_prod_category where CATEGORY_NAME='Home Décor'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Wall Shelves',(select ID from secondary_prod_category where CATEGORY_NAME='Home Décor'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Fountains',(select ID from secondary_prod_category where CATEGORY_NAME='Home Décor'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Showpieces & Vases',(select ID from secondary_prod_category where CATEGORY_NAME='Home Décor'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Floor lamps',(select ID from secondary_prod_category where CATEGORY_NAME='Home Décor'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Table lamps',(select ID from secondary_prod_category where CATEGORY_NAME='Home Décor'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Wall lamps',(select ID from secondary_prod_category where CATEGORY_NAME='Home Décor'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Organisers',(select ID from secondary_prod_category where CATEGORY_NAME='Home Décor'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Hooks & Holders',(select ID from secondary_prod_category where CATEGORY_NAME='Home Décor'));
INSERT INTO secondary_prod_category(CATEGORY_NAME,PRIMARY_CATEGORY_ID) VALUES('Brands',(select ID from primary_prod_category where CATEGORY_NAME='Home & Living'));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Bombay Dyeing',(select ID from secondary_prod_category where CATEGORY_NAME='Brands' and primary_category_id =(select id from primary_prod_category where category_name='Home & Living' ) ));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Spaces',(select ID from secondary_prod_category where CATEGORY_NAME='Brands' and primary_category_id =(select id from primary_prod_category where category_name='Home & Living' ) ));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Portico New York',(select ID from secondary_prod_category where CATEGORY_NAME='Brands' and primary_category_id =(select id from primary_prod_category where category_name='Home & Living' ) ));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Pure Home & Living',(select ID from secondary_prod_category where CATEGORY_NAME='Brands' and primary_category_id =(select id from primary_prod_category where category_name='Home & Living' ) ));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Swayam',(select ID from secondary_prod_category where CATEGORY_NAME='Brands' and primary_category_id =(select id from primary_prod_category where category_name='Home & Living' ) ));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Raymond Home',(select ID from secondary_prod_category where CATEGORY_NAME='Brands' and primary_category_id =(select id from primary_prod_category where category_name='Home & Living' ) ));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('At Home by Nilkamal',(select ID from secondary_prod_category where CATEGORY_NAME='Brands' and primary_category_id =(select id from primary_prod_category where category_name='Home & Living' ) ));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Corelle',(select ID from secondary_prod_category where CATEGORY_NAME='Brands' and primary_category_id =(select id from primary_prod_category where category_name='Home & Living' ) ));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Trident',(select ID from secondary_prod_category where CATEGORY_NAME='Brands' and primary_category_id =(select id from primary_prod_category where category_name='Home & Living' ) ));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Cortina',(select ID from secondary_prod_category where CATEGORY_NAME='Brands' and primary_category_id =(select id from primary_prod_category where category_name='Home & Living' ) ));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('WELHOME',(select ID from secondary_prod_category where CATEGORY_NAME='Brands' and primary_category_id =(select id from primary_prod_category where category_name='Home & Living' ) ));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Random',(select ID from secondary_prod_category where CATEGORY_NAME='Brands' and primary_category_id =(select id from primary_prod_category where category_name='Home & Living' ) ));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Home sparkle',(select ID from secondary_prod_category where CATEGORY_NAME='Brands' and primary_category_id =(select id from primary_prod_category where category_name='Home & Living' ) ));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Tangerine',(select ID from secondary_prod_category where CATEGORY_NAME='Brands' and primary_category_id =(select id from primary_prod_category where category_name='Home & Living' ) ));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('Sej by Nisha Gupta',(select ID from secondary_prod_category where CATEGORY_NAME='Brands' and primary_category_id =(select id from primary_prod_category where category_name='Home & Living' ) ));
INSERT INTO tertiary_prod_category(CATEGORY_NAME,SECONDARY_CATEGORY_ID) VALUES('House This',(select ID from secondary_prod_category where CATEGORY_NAME='Brands' and primary_category_id =(select id from primary_prod_category where category_name='Home & Living' ) ));
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

commit;

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
commit;
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
commit;

DROP TABLE IF EXISTS address;
CREATE TABLE IF NOT EXISTS address(ADDRESS_ID BIGINT AUTO_INCREMENT PRIMARY KEY, CUST_ID BIGINT NOT NULL,APARTMENT_NAME VARCHAR(500),
STREET_NAME VARCHAR(800),CITY VARCHAR(200),STATE VARCHAR(20),PIN INTEGER(10), FOREIGN KEY(CUST_ID) REFERENCES customer(ID));

commit;


INSERT INTO customer(CUST_NAME, CUST_AGE, CUST_PHONE_NUM) VALUES('Hitesh Joshi',31,951911009); 

 INSERT INTO customer(CUST_NAME, CUST_AGE, CUST_PHONE_NUM) VALUES('Deepika Joshi',30,989220110); 


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
	

