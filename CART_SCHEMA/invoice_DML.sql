USE microservices_invoice;
insert into mode_of_pay(MODE_NAME,MODE_DESC) values('Cash','OTC cash settlement');
insert into mode_of_pay(MODE_NAME,MODE_DESC) values('Card','OTC card settlement');
insert into mode_of_pay(MODE_NAME,MODE_DESC) values('Online','Online through payment gateway');
insert into mode_of_pay(MODE_NAME,MODE_DESC) values('Wallet','OTC through wallet');

select * from mode_of_pay;

/*run invoice inserts in a seprate command*/

insert into invoice(CUST_ID,ITEM_ID,QUANTITY,DATE_OF_PURCHASE,MODE_PAY_ID,TAX_AMT,CASHIER_NAME) values(1,4,10,NOW(),2,5,'Venu Babu');
insert into invoice(CUST_ID,ITEM_ID,QUANTITY,DATE_OF_PURCHASE,MODE_PAY_ID,TAX_AMT,CASHIER_NAME) values(1,3,10,'2017-10-01 00:00:00',2,5,'Venu Babu');

select * from invoice;