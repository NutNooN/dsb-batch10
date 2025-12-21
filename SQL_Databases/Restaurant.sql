
-- create table
-- table 1 food
CREATE TABLE 'food' (
  'food_id' int,
  'name' text,
  'description' text,
  'price' int
);

-- table 2 order
CREATE TABLE 'order' (
  `order_id` int ,
  `order_date` date,
  `staff_id` int,
  `customer_id` int,
  `food_id` int,
  `quantity` int,
  `price` decimal
);

-- table 3 customer
CREATE TABLE `customer` (
  `customer_id` int ,
  `first_name` text,
  `last_name` text,
  `email` text,
  `region` text
);

-- table 4 staff
CREATE TABLE `staff` (
  `staff_id` int ,
  `first_name` text,
  `last_name` text,
  `position` text,
  `email` text
);

-- table 5 ingredient
CREATE TABLE `ingredient` (
  `ingre_id` int PRIMARY KEY,
  `ingre_name` varchar(255)
);

-- table 6 brige food & ingredient
CREATE TABLE `bridge` (
  `food_id` int,
  `ingre_id` int
);

-- insert data
-- table 1 food
INSERT INTO food VALUES
  (1,'Fried Rice','Seafood Shrimp Squid', 90),
  (2,'Pad Thai', 'Seafood Shrimp Squid', 99),
  (3,'Som Tam','Papaya',50),
  (4,'Yum Nua,Seafood', 'Shrimp Squid',50),
  (5,'Tom Yum Kung,Seafood', 'Shrimp Squid',150),
  (6,'Green Curry','Chicken',150),
  (7,'Spring Rolls','Shrimp',50),
  (8,'Mango Sticky Rice','Mango',50),
  (9,'Fish cakes','Fish',30),
  (10,'Fried Chicken','Chicken',10);

-- table 2 order
INSERT INTO 'order' VALUES
  (1,'2024-06-29',2,1,8,2,100),
  (2,'2024-06-29',4,2,3,1,50),
  (3,'2024-06-29',5,2,7,1,50),
  (4,'2024-06-29',2,5,9,2,60),
  (5,'2024-06-29',5,3,6,3,450),
  (6,'2024-06-29',4,5,4,1,50),
  (7,'2024-06-30',1,4,3,3,150),
  (8,'2024-06-30',1,2,9,2,60),
  (9,'2024-06-30',5,3,8,1,50),
  (10,'2024-06-30',5,2,7,1,50),
  (11,'2024-06-30',4,4,5,1,150),
  (12,'2024-06-30',3,5,5,1,150),
  (13,'2024-07-01',1,2,9,2,60),
  (14,'2024-07-01',5,3,10,1,10),
  (15,'2024-07-01',3,6,7,3,150),
  (16,'2024-07-01',4,3,4,1,50),
  (17,'2024-07-01',2,6,10,3,30),
  (18,'2024-07-02',1,5,6,1,150),
  (19,'2024-07-02',1,2,3,3,150),
  (20,'2024-07-02',4,1,1,1,90);

-- table 3 customer
INSERT INTO customer VALUES
  (1,'Dorami','Cat','Dorami.C@doraemon.jp','Asia'),
  (2,'Nobita','Noby','Nobita.N@doraemon.jp','Asia'),
  (3,'Shizuka','Sue','Shizuka.S@doraemon.jp','Asia'),
  (4,'Suneo','Sneech','Suneo.S@doraemon.jp','Asia'),
  (5,'Gian','Big G','Gian.B@doraemon.jp','Europe'),
  (6,'Jaiko','Little G','Jaiko.L@doraemon.jp','Europe');

-- table 4 staff
INSERT INTO staff VALUES
  (1,'Luffy','Monkey.D','Waiter','Luffy.M@onepiece.jp'),
  (2,'Zoro','Roronoa','Chef','Zoro.R@onepiece.jp'),
  (3,'Nami','N','Waitress','Nami.N@onepiece.jp'),
  (4,'Sanji','S','Chef','Sanji.S@onepiece.jp'),
  (5,'Robin','Nico','Cashier','Robin.N@onepiece.jp'),
  (6,'Hancock','Boa','Boss','Hancock.B@onepiece.jp');

-- table 5 ingredient
INSERT INTO ingredient VALUES
  (1,'Shrimp'),
  (2,'Squid'),
  (3,'Chicken'),
  (4,'Fish'),
  (5,'Mango'),
  (6,'Papaya');

-- table 6 bridge
INSERT INTO bridge VALUES
  (1,1),
  (1,2),
  (2,1),
  (2,2),
  (3,6),
  (4,1),
  (4,2),
  (5,1),
  (5,2),
  (6,3),
  (7,1),
  (8,5),
  (9,4),
  (10,3);

.mode table
.header on
SELECT * From food;
SELECT * From 'order';
SELECT * From customer;
SELECT * From staff;
SELECT * From ingredient;
SELECT * From bridge;

-- query 1 [Top 5 popular food]
.mode table
.header on

WITH total_amount AS (
  SELECT 
    food_id,
    SUM (PRICE) AS total
  FROM 'order'
  GROUP BY food_id
  )

SELECT
  t2.name,
  t1.total
FROM total_amount AS t1
JOIN food AS t2
ON t1.food_id = t2.food_id
ORDER BY 2 DESC
LIMIT 5;

-- query 2 [Total revenue seperate by region]
WITH total_revenue AS (
  SELECT 
    customer_id,
    SUM(price) AS revenue
  FROM 'order'
  GROUP BY 1
)

SELECT
  region,
  SUM (revenue) AS total
FROM total_revenue AS t1
JOIN customer AS t2
ON t1.customer_id = t2.customer_id
GROUP by region
ORDER by 2 DESC;

-- query 3 [How much ingredient that used in 2024-06]
WITH food_sale AS (
  SELECT 
    food_id,
    SUM(quantity) AS qty,
    STRFTIME('%Y-%m', order_date) AS monthid
  FROM 'order'
  WHERE monthid ='2024-06'
  GROUP BY 1
)

SELECT 
  t3.ingre_name,
  t1.qty * t2.ingre_id AS total_ingre
FROM food_sale AS t1
JOIN bridge AS t2
ON t1.food_id = t2.food_id
JOIN ingredient AS t3
ON t2.ingre_id = t3.ingre_id
GROUP BY 1
ORDER BY 2 DESC;
