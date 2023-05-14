-- Create 1st dimension table
CREATE TABLE DimMember (
    member_id    INT NOT NULL,
    member_name  TEXT,
    member_type	TEXT,
    gender      TEXT,
		age         INT,
	  phone       TEXT,
		staff_id INT,
    FOREIGN KEY (member_type) REFERENCES DimMember_type (member_type),
    FOREIGN KEY (staff_id) REFERENCES staff(staff_id)
);

INSERT INTO DimMember VALUES
(1, 'Lana', 'nm', 'Female', 22, '0691981923', 1),
(2, 'Austin', 'nm', 'Male', 19, '0876236437', 2),
(3, 'Nadia', 'no', 'Female', 26, '0916541452', 2),
(4, 'Christopher', 'nm', 'Male', 20, '0858373812', 1),
(5, 'Lucien', 'no', 'Male', 29, '0654039855', 2);

SELECT * FROM DimMember;

-- Create 2nd dimension table

CREATE TABLE DimMenu (
	  menu_id   INT NOT NULL,
    menu_name TEXT,
		menu_type TEXT,
		price     INT
);

INSERT INTO DimMenu VALUES
(1, 'Cappuccino', 'Drink', 55),
(2, 'Cheese Cake', 'Dessert', 45),
(3, 'Cocoa', 'Drink', 50),
(4, 'Green Tea', 'Drink', 50),
(5, 'Brownie', 'Dessert', 45),
(6, 'Muffin', 'Dessert', 45);

SELECT * FROM DimMenu;

-- Create 3rd dimension table

CREATE TABLE DimStaff (
    staff_id   INT NOT NULL,
    staff_name TEXT
);

insert into DimStaff values
(1,'Alin'),
(2, 'Mimi');

SELECT * FROM DimStaff;

-- Create 4th dimension table

CREATE TABLE DimPayment (
		payment_id INT NOT NULL,
	  payment        TEXT
);

INSERT INTO DimPayment VALUES 
  (1,'Cash'),
  (2,'Mobile Banking');

SELECT * FROM DimPayment;

-- Create 5th dimension table

CREATE TABLE DimMember_type (
  member_type	TEXT NOT NULL,
  member_type_full	TEXT,
  discount REAL,
  discount_note TEXT
);

INSERT into DimMember_type values 
  ('nm', 'normal member', 0.05, 'discount rate 5%'),
  ('no', 'not member', 0, 'no discount');

SELECT * from DimMember_type;

.mode markdown
.header on

-- Insert data in fact table
  
CREATE TABLE orders (
  order_id INT PRIMARY KEY,
  order_date date,
  member_id INT,
  menu_id TEXT,
  staff_id INT,
  sale REAL,
  payment_id TEXT,
    FOREIGN KEY (member_id) REFERENCES DimMember (member_id),
    FOREIGN KEY (menu_id) REFERENCES DimMenu (menu_id),
    FOREIGN KEY (payment_id) REFERENCES DimPayment (payment_id)
);

INSERT INTO orders VALUES 
(1, '2023-03-08', 2, 5, 1, 45, 1),
(2, '2023-03-08', 5, Null, 2, 45, 1),
(3, '2023-03-08', 4, 3, 2, 50, 1),
(4, '2023-03-08', 2, 1, 1, 55, 2),
(5, '2023-03-08', 1, 6, 1, 45, 2),
(6, '2023-03-09', 6, 4, 2, 50, 1),
(7, '2023-03-09', 3, Null, 2, 45, 1),
(8, '2023-03-09', 1, 4, 2, 50, 2),
(9, '2023-03-09', 4, 3, 1, 50, 1),
(10, '2023-03-09', 6, 2, 1, 45, 2),
(11, '2023-03-10', 6, 5, 2, 45, 2),
(12, '2023-03-10', 3, Null, 2, 50, 1),
(13, '2023-03-10', 1, 1, 1, 55, 2),
(14, '2023-03-10', 2, 2, 1, 45, 1),
(15, '2023-03-10', 4, 5, 2, 45, 1),
(16, '2023-03-11', 5, 1, 2, 55, 2),
(17, '2023-03-11', 4, Null, 2, 50, 1),
(18, '2023-03-11', 1, 6, 1, 45, 1),
(19, '2023-03-11', 5, 3, 2, 50, 2),
(20, '2023-03-11', 3, Null, 1, 50, 1);

SELECT * FROM orders;

-- query 1 -- sales summary by menu type

SELECT 
  menu_type,
  count(menu_type) unit,
  sum(sale) total_sales
FROM orders as o
JOIN DimMenu AS m 
  ON  o.menu_id = m.menu_id
GROUP BY 1 
ORDER BY 3 desc;

-- query 2 -- best seller top 3

SELECT 
  m.menu_name,
  count(o.order_id) unit,
  sum(o.sale) total_sales
FROM orders AS o
JOIN DimMenu  m ON o.menu_id = m.menu_id
GROUP BY 1 
ORDER BY 2 desc
LIMIT 3;

-- query 3 -- sales summary by date

SELECT
  order_date,
  sum(sale) sales
FROM orders
GROUP BY order_date;

-- query 4 -- amount sales transferred on 2023-03-09

WITH order_20230309 as (
    SELECT * FROM orders o
    JOIN DimPayment  p ON o.payment_id = p.payment_id
    where order_date = '2023-03-09'
)
SELECT 
  order_date,
  payment,  
	sum(sale) sales
FROM order_20230309
where lower(payment) = 'cash';

-- query 5 -- sales summary by staff

SELECT
  staff_id,
  sum(sale) sales
FROM orders
GROUP BY staff_id;

-- query 6 -- sales summary by member type

CREATE VIEW orders_member AS
	SELECT
        o.order_id,
        o.order_date,
        mn.member_name,
        mt.member_type,
        o.sale
    FROM orders o 
    JOIN DimMember  mn ON o.member_id  = mn.member_id
    JOIN DimMember_type  mt ON mn.member_type = mt.member_type;

SELECT * FROM orders_member; -- check view 

SELECT 
  member_type, 
  sum(sale) sales
FROM orders_member
GROUP BY 1
ORDER BY 2 DESC;

