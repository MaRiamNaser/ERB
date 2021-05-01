CREATE TABLE countries(
   code INT          PRIMARY KEY     NOT NULL,
   name             CHAR(50)    NOT NULL,
   continent_name    CHAR(50)     NOT NULL
	
);

CREATE TABLE users(
   id INT PRIMARY KEY     NOT NULL,
   full_name      CHAR(50)    NOT NULL,
   email            CHAR(50)     NOT NULL,
   gender        CHAR(50),
   date_of_birth CHAR(50),
   country_code  INT ,
   created_at CHAR(50)
	
);


ALTER TABLE users
ADD FOREIGN KEY (country_code) REFERENCES countries(code);


CREATE TABLE orders(
   id INT        PRIMARY KEY     NOT NULL,
   user_id       INT     NOT NULL,
   status        CHAR(50)    ,
   created_at    CHAR(50)   
	
);

ALTER TABLE orders
ADD FOREIGN KEY (user_id) REFERENCES users(id);

CREATE TABLE merchants(
   id INT          PRIMARY KEY     NOT NULL,
   merchant_name       varchar     NOT NULL,
   admin_id        INT    ,
   country_code    INT,
   created_at  varchar(50)
	
);

ALTER TABLE merchants
ADD FOREIGN KEY (admin_id) REFERENCES users(id);


ALTER TABLE merchants
ADD FOREIGN KEY (country_code) REFERENCES countries(code);


CREATE TABLE order_items(
   order_id INT     NOT NULL,
   product_id       INT     NOT NULL,
   quantity        INT    

);

ALTER TABLE order_items
ADD CONSTRAINT PK_order_items
PRIMARY KEY(order_id, product_id);


ALTER TABLE order_items
ADD FOREIGN KEY (order_id) REFERENCES orders(id);



CREATE TABLE products(
   id INT          PRIMARY KEY     NOT NULL,
   merchant_id       INT     NOT NULL,
   name        varchar(50),
	price        INT,
	status        varchar(50),
	created_at    varchar(50)

);

ALTER TABLE order_items
ADD FOREIGN KEY (product_id) REFERENCES products(id);

ALTER TABLE products
ADD FOREIGN KEY (merchant_id) REFERENCES merchants(id);



INSERT INTO public.countries(code, name, continent_name)
	VALUES (1,'countryName1', 'egypt1');
	INSERT INTO public.countries(code, name, continent_name)
	VALUES (2,'countryName2', 'egypt2');
	INSERT INTO public.countries(code, name, continent_name)
	VALUES (3,'countryName3', 'egypt3');
	INSERT INTO public.countries(code, name, continent_name)
	VALUES (4,'countryName4', 'egypt4');
	INSERT INTO public.countries(code, name, continent_name)
	VALUES (5,'countryName5', 'egypt5');
	
	INSERT INTO public.users(
	id, full_name, email, gender, date_of_birth, country_code, created_at)
	VALUES (1,'Mar', 'mar@gmail.com', 'female', '4-26', 1, '2020');	
	INSERT INTO public.users(
	id, full_name, email, gender, date_of_birth, country_code, created_at)
	VALUES (2,'Ahmed', 'ahmed@gmail.com', 'female', '4-26', 3, '2020');
	INSERT INTO public.users(
	id, full_name, email, gender, date_of_birth, country_code, created_at)
	VALUES (3,'yasmeena', 'yasmeena@gmail.com', 'female', '4-26', 3, '2020');
	INSERT INTO public.users(
	id, full_name, email, gender, date_of_birth, country_code, created_at)
	VALUES (4,'Maram', 'maram@gmail.com', 'female', '4-26', 2, '2020');
	
	
	INSERT INTO public.orders(
	id, user_id, status, created_at)
	VALUES (1,1, 'status', '4-26');
	INSERT INTO public.orders(
	id, user_id, status, created_at)
	VALUES (2,2, 'status', '4-26');
	INSERT INTO public.orders(
	id, user_id, status, created_at)
	VALUES (3,3, 'status', '4-26');
	INSERT INTO public.orders(
	id, user_id, status, created_at)
	VALUES (4,4, 'status', '4-26');
	INSERT INTO public.orders(
	id, user_id, status, created_at)
	VALUES (5,4, 'status', '4-26');
	
        INSERT INTO public.orders(
	id, user_id, status, created_at)
	VALUES (6,2, 'status', '4-26');
	
	
	INSERT INTO public.merchants(
	id, merchant_name, admin_id, country_code, created_at)
	VALUES (1,'MerchantName1', 1, 1,  '2020');
	
	INSERT INTO public.merchants(
	id, merchant_name, admin_id, country_code, created_at)
	VALUES (2,'MerchantName2', 2, 2,  '2020');
	INSERT INTO public.merchants(
	id, merchant_name, admin_id, country_code, created_at)
	VALUES (3,'MerchantName2', 3, 3,  '2020');
	INSERT INTO public.merchants(
	id, merchant_name, admin_id, country_code, created_at)
	VALUES (4,'MerchantName2', 4, 4,  '2020');

	INSERT INTO public.products(
	id, merchant_id, name, price, status, created_at)
	VALUES (1,1, 'chocolate1', 100, 'status','26-4');
	INSERT INTO public.products(
	id, merchant_id, name, price, status, created_at)
	VALUES (2,2, 'chocolate2', 150, 'status','26-4');
	INSERT INTO public.products(
	id, merchant_id, name, price, status, created_at)
	VALUES (3,3, 'chocolate3', 200, 'status','26-4');
	INSERT INTO public.products(
	id, merchant_id, name, price, status, created_at)
	VALUES (4,4, 'chocolate4', 250, 'status','26-4');

        INSERT INTO public.products(
	id, merchant_id, name, price, status, created_at)
	VALUES (5,4, 'chocolate5', 200, 'status','26-4');

        INSERT INTO public.products(
	id, merchant_id, name, price, status, created_at)
	VALUES (6,4, 'chocolate6', 20, 'status','26-4');



INSERT INTO public.order_items(
	order_id, product_id, quantity)
	VALUES (1,1, 3);
	INSERT INTO public.order_items(
	order_id, product_id, quantity)
	VALUES (2,2, 4);
	INSERT INTO public.order_items(
	order_id, product_id, quantity)
	VALUES (3,3, 5);
	INSERT INTO public.order_items(
	order_id, product_id, quantity)
	VALUES (4,4, 5);
	INSERT INTO public.order_items(
	order_id, product_id, quantity)
	VALUES (5,5, 5);
	INSERT INTO public.order_items(
	order_id, product_id, quantity)
	VALUES (6,6, 5);
	
	
/*select  full_name as user_name, 
orders.id as order_id,
products.price * order_items.quantity as total_price
from  users, orders, order_items, products 
where users.id = orders.user_id 
and orders.id = order_items.order_id
and order_items.product_id = products.id;
*/


SELECT
 result.user_name,
 result.order_id,
   SUM(total_price) AS total_price
   
FROM

(
		
select  full_name as user_name, 
orders.id as order_id,
products.price * order_items.quantity as total_price
from  users, orders, order_items, products 
where users.id = orders.user_id 
and orders.id = order_items.order_id
and order_items.product_id = products.id

) as result

GROUP BY result.order_id, result.user_name;
