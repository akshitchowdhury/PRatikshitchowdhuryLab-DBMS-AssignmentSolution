create database ecomm;
create table supplier(
     supp_id int primary key,
     supp_name varchar(50) not null,
     supp_city varchar(50) not null,
     supp_phone varchar(50) not null
     );
create table customer(
	cus_id int primary key,
    cus_name varchar(20) not null,
	cus_phone varchar(10) not null,
    cus_city varchar(30) not null,
    cus_gender char
    );

create table category(
	cat_id int primary key,
    cat_name varchar(30) not null
    );

create table product(
		pro_id int primary key,
        pro_name varchar(20) not null default "Dummy",
        pro_desc varchar(60),
        cat_id int ,
        Foreign key(cat_id) references category(cat_id)
        );	
        
  create table supplier_pricing(
	pricing_id int primary key,
    pro_id int,
    supp_id int,
    supp_price int default 0,
    foreign key(pro_id) references product(pro_id),
    foreign key(supp_id) references supplier(supp_id)
    );
    
    create table orders(
    ord_id int primary key,
    ord_amount int not null,
    ord_date date not null,
    cus_id int,
    pricing_id int,
    Foreign key(cus_id) references customer(cus_id),
    Foreign key(pricing_id) references supplier_pricing(pricing_id)
    );
    
	create table rating(
    rat_id int primary key,
    ord_id int,
    rat_ratstars int not null,
    foreign key(ord_id) references orders(ord_id)
    );
    
    -------------------------------------------------------------------------------------
    
INSERT INTO SUPPLIER VALUES(1,"Rajesh Retails","Delhi",'1234567890'); 
INSERT INTO SUPPLIER VALUES(2,"Appario Ltd.","Mumbai",'2589631470'); 
INSERT INTO SUPPLIER VALUES(3,"Knome products","Banglore",'9785462315'); 
INSERT INTO SUPPLIER VALUES(4,"Bansal Retails","Kochi",'8975463285');
INSERT INTO SUPPLIER VALUES(5,"Mittal Ltd.","Lucknow",'7898456532');


INSERT INTO CUSTOMER VALUES(1,"AAKASH",'9999999999',"DELHI",'M'); 
INSERT INTO CUSTOMER VALUES(2,"AMAN",'9785463215',"NOIDA",'M'); 
INSERT INTO CUSTOMER VALUES(3,"NEHA",'9999999999',"MUMBAI",'F'); 
INSERT INTO CUSTOMER VALUES(4,"MEGHA",'9994562399',"KOLKATA",'F'); 
INSERT INTO CUSTOMER VALUES(5,"PULKIT",'7895999999',"LUCKNOW",'M');

INSERT INTO CATEGORY VALUES( 1,"BOOKS"); 
INSERT INTO CATEGORY VALUES(2,"GAMES"); 
INSERT INTO CATEGORY VALUES(3,"GROCERIES"); 
INSERT INTO CATEGORY VALUES (4,"ELECTRONICS"); 
INSERT INTO CATEGORY VALUES(5,"CLOTHES");


INSERT INTO PRODUCT VALUES(1,"GTA V","Windows 7 and above with i5 processor and 8GB RAM",2);
INSERT INTO PRODUCT VALUES(2,"TSHIRT","SIZE-L with Black, Blue and White variations",5);
INSERT INTO PRODUCT VALUES(3,"ROG LAPTOP","Windows 10 with 15inch screen, i7 processor, 1TB SSD",4); 
INSERT INTO PRODUCT VALUES(4,"OATS","Highly Nutritious from Nestle",3);
INSERT INTO PRODUCT VALUES(5,"HARRY POTTER","Best Collection of all time by J.K Rowling",1);
INSERT INTO PRODUCT VALUES(6,"MILK","1L Toned MIlk",3);
INSERT INTO PRODUCT VALUES(7,"Boat EarPhones","1.5Meter long Dolby Atmos",4);
INSERT INTO PRODUCT VALUES(8,"Jeans","Stretchable Denim Jeans with various sizes and color",5);
INSERT INTO PRODUCT VALUES(9,"Project IGI","compatible with windows 7 and above",2);
INSERT INTO PRODUCT VALUES(10,"Hoodie","Black GUCCI for 13 yrs and above",5);
INSERT INTO PRODUCT VALUES(11,"Rich Dad Poor Dad","Written by RObert Kiyosaki",1);
INSERT INTO PRODUCT VALUES(12,"Train Your Brain","By Shireen Stephen",1);


INSERT INTO SUPPLIER_PRICING VALUES(1,1,2,1500); 
INSERT INTO SUPPLIER_PRICING VALUES(2,3,5,30000); 
INSERT INTO SUPPLIER_PRICING VALUES(3,5,1,3000); 
INSERT INTO SUPPLIER_PRICING VALUES(4,2,3,2500);
INSERT INTO SUPPLIER_PRICING VALUES(5,4,1,1000); 
INSERT INTO SUPPLIER_PRICING VALUES(6,12,2,780); 
INSERT INTO SUPPLIER_PRICING VALUES(7,12,4,789); 
INSERT INTO SUPPLIER_PRICING VALUES(8,3,1,31000); 
INSERT INTO SUPPLIER_PRICING VALUES(9,1,5,1450); 
INSERT INTO SUPPLIER_PRICING VALUES(10,4,2,999); 
INSERT INTO SUPPLIER_PRICING VALUES(11,7,3,549); 
INSERT INTO SUPPLIER_PRICING VALUES(12,7,4,529); 
INSERT INTO SUPPLIER_PRICING VALUES(13,6,2,105); 
INSERT INTO SUPPLIER_PRICING VALUES(14,6,1,99); 
INSERT INTO SUPPLIER_PRICING VALUES(15,2,5,2999); 
INSERT INTO SUPPLIER_PRICING VALUES(16,5,2,2999);

INSERT INTO orders VALUES (101,1500,"2021-10-06",2,1); 
INSERT INTO orders VALUES(102,1000,"2021-10-12",3,5); 
INSERT INTO orders VALUES(103,30000,"2021-09-16",5,2); 
INSERT INTO orders VALUES(104,1500,"2021-10-05",1,1); 
INSERT INTO orders VALUES(105,3000,"2021-08-16",4,3); 
INSERT INTO orders VALUES(106,1450,"2021-08-18",1,9); 
INSERT INTO orders VALUES(107,789,"2021-09-01",3,7);
INSERT INTO orders VALUES(108,780,"2021-09-07",5,6); 
INSERT INTO orders VALUES(109,3000,"2021-09-10",5,3); 
INSERT INTO orders VALUES(110,2500,"2021-09-10",2,4); 
INSERT INTO orders VALUES(111,1000,"2021-09-15",4,5); 
INSERT INTO orders VALUES(112,789,"2021-09-16",4,7); 
INSERT INTO orders VALUES(113,31000,"2021-09-16",1,8); 
INSERT INTO orders VALUES(114,1000,"2021-09-16",3,5); 
INSERT INTO orders VALUES(115,3000,"2021-09-16",5,3); 
INSERT INTO orders VALUES(116,99,"2021-09-17",2,14);

INSERT INTO RATING VALUES(1,101,4);
INSERT INTO RATING VALUES(2,102,3); 
INSERT INTO RATING VALUES(3,103,1); 
INSERT INTO RATING VALUES(4,104,2); 
INSERT INTO RATING VALUES(5,105,4); 
INSERT INTO RATING VALUES(6,106,3); 
INSERT INTO RATING VALUES(7,107,4); 
INSERT INTO RATING VALUES(8,108,4); 
INSERT INTO RATING VALUES(9,109,3); 
INSERT INTO RATING VALUES(10,110,5); 
INSERT INTO RATING VALUES(11,111,3); 
INSERT INTO RATING VALUES(12,112,4); 
INSERT INTO RATING VALUES(13,113,2); 
INSERT INTO RATING VALUES(14,114,1); 
INSERT INTO RATING VALUES(15,115,1); 
INSERT INTO RATING VALUES(16,116,0);

---------------------------------------------------------------------------------------------------------------

Q3.

select count(t1.cus_gender) as NoOfCustomers, t1.cus_gender from 
(select orders.*, customer.cus_gender, customer.cus_name 
from orders inner join customer 
where orders.cus_id=customer.cus_id 
having orders.ord_amount>=3000) as t1 group by t1.cus_gender;


Q4.
select  prod.*,pro_name as "Product Name" from product inner join
 (select pri.*,pro_id from supplier_pricing as s inner join 
 (select * from orders
 where cus_id =2) as pri
 on pri.pricing_id = s.pricing_id) as prod
 on prod.pro_id = product.pro_id;
 
 Q5.
 select supplier.*,supp.numOfProducts from supplier inner join
 (select supp_id,count(pro_id) as numOfProducts from supplier_pricing
 group by supp_id
 having count(pro_id)>1) as supp /* modify number for condition other than 1 product*/
 on supp.supp_id = supplier.supp_id;
 
 Q6.
 select cat_id,cat_name,f.pro_name,min(f.bprice) as price  from
 (select p.*, min(supp_price) as bprice from supplier_pricing
 inner join
 (Select product.pro_id,product.cat_id,product.pro_name,category.cat_name from product
 left join category
 on product.cat_id = category.cat_id)as p
 on p.pro_id = supplier_pricing.pro_id
 group by p.pro_id order by p.cat_id, bprice) as f
 group by cat_id;
 
 Q7.
 select p.pro_id, pro_name from product,
(select ord_id, pro_id, ord_date from orders as o
inner join supplier_pricing as s
on o.pricing_id = s.pricing_id and o.ord_date > "2021-10-05") as p
where product.pro_id = p.pro_id;
 
 Q8.
 select cus_name, cus_gender from customer
where cus_name like "A%"; 

Q9.

select t2.supp_id, supp_name, t2.stars as Rating, Type_Of_Service from supplier as sd
right join 
(select t1.*, supp_id from supplier_pricing as s
right join 
(select o.ord_id,rat.stars,rat.Type_Of_Service,o.pricing_id from orders as o
right join
 (select ord_id, rat_ratstars as stars,
 case 
	when rat_ratstars =5 then "Excellent Service"
    when rat_ratstars >4 then "Good Service"
    when rat_ratstars >2 then "Average Service"
	ELSE "Poor Service"
end as Type_Of_Service from rating) as rat
on o.ord_id = rat.ord_id)as t1
on s.pricing_id = t1.pricing_id) as t2
on t2.supp_id = sd.supp_id ;
end //
Delimiter ;

call SupplierRatings;
