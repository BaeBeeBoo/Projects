.table

.mode column

CREATE TABLE IF NOT EXISTS customer (
	customer_id INTEGER PRIMARY KEY,
	name TEXT NOT NULL,
	city TEXT,
	email TEXT
);

INSERT INTO customer VALUES
(1, "John Doe", "San Francisco", "johndoe@gmail.com"),
(2, "Jane Doe", "New York", "janedoe@yahoo.com"),
(3, "John Smith", "Los Angeles", "johnsmith@gmail.com"),
(4, "Jane Smith", "Chicago", "janesmith@yahoo.com"),
(5, "Peter Jones", "Dallas", "peterjones@gmail.com"),
(6, "Mary Jones", "Houston", "maryjones@yahoo.com"),
(7, "David Brown", "Austin", "davidbrown@gmail.com"),
(8, "Susan Brown", "San Antonio", "susanbrown@yahoo.com"),
(9, "Michael Green", "Fort Worth", "michaelgreen@gmail.com"),
(10, "Jennifer Green", "El Paso", "jennifergreen@yahoo.com"),
(11, "Alex Doe", "Seattle", "alexdoe@hotmail.com"),
(12, "Maria Smith", "Denver", "mariasmith@hotmail.com"),
(13, "Peter Brown", "Phoenix", "peterbrown@hotmail.com"),
(14, "Susan Green", "Las Vegas", "susangreen@hotmail.com"),
(15, "David Williams", "El Paso", "davidwilliams@hotmail.com");

CREATE TABLE IF NOT EXISTS menu (
  menu_id INTEGER PRIMARY KEY,
  menu_name TEXT NOT NULL,
  price INTEGER NOT NULL
);

INSERT INTO menu VALUES
(1, "Fillet Burger", 5.99),
(2, "Fillet Tower Burger", 6.99),
(3, "Zinger Burger", 5.99),
(4, "Zinger Tower Burger", 6.99),
(5, "Vegan Burger", 5.99);

CREATE TABLE IF NOT EXISTS ingredient (
  ingredient_id INTEGER PRIMARY KEY,
  ingredient_name TEXT NOT NULL
);

INSERT INTO ingredient VALUES
(1, "Sesame seed bun"),
(2, "Bun with breast fillet"),
(3, "Bun with sesame seeds"),
(4, "Chicken breast fillet"),
(5, "Spicy chicken breast fillet"),
(6, "Spicy chicken fillet"),
(7, "Quorn fillet"),
(8, "Slice of cheese"),
(9, "Crunchy hashbrown"),
(10, "Crispy hashbrown"),
(11, "Lettuce"),
(12, "Fiery salsa sauce"),
(13, "Mayo"),
(14, "Vegan Mayo");

CREATE TABLE IF NOT EXISTS menu_ingredient (
  menu_id INTEGER NOT NULL,
  ingredient_id INTEGER NOT NULL,
  FOREIGN KEY (menu_id) REFERENCES menu (menu_id),
  FOREIGN KEY (ingredient_id) REFERENCES ingredient (ingredient_id)
);

INSERT INTO menu_ingredient VALUES
(1, 1),
(1, 4),
(1, 11),
(1, 13),
(2, 1),
(2, 4),
(2, 8),
(2, 9),
(2, 11),
(2, 12),
(2, 13),
(3, 2),
(3, 5),
(3, 11),
(3, 13),
(4, 3),
(4, 6),
(4, 8),
(4, 10),
(4, 11),
(4, 12),
(4, 13),
(5, 1),
(5, 7),
(5, 11),
(5, 14);

CREATE TABLE IF NOT EXISTS orders (
  customer_id INTEGER NOT NULL,
  order_date TEXT NOT NULL,
  payment TEXT NOT NULL,
  total INTEGER NOT NULL,
	FOREIGN KEY (customer_id) REFERENCES customer (customer_id)
);

INSERT INTO orders VALUES
(1, "2023-06-24", "Cash", 17.97),
(2, "2023-06-22", "Mobile Banking", 13.98),
(3, "2023-06-21", "Mobile Banking", 19.97),
(4, "2023-06-22", "Cash", 17.97),
(5, "2023-06-23", "Cash", 31.95),
(6, "2023-06-24", "Mobile Banking", 12.98),
(7, "2023-06-23", "Cash", 24.96),
(8, "2023-06-21", "Mobile Banking", 18.97),
(9, "2023-06-24", "Mobile Banking", 31.95),
(10, "2023-06-20", "Cash", 13.98),
(11, "2023-06-23", "Mobile Banking", 19.97),
(12, "2023-06-24", "Cash", 24.96),
(13, "2023-06-21", "Mobile Banking", 12.98),
(14, "2023-06-22", "Cash", 17.98),
(15, "2023-06-20", "Cash", 18.97);

-- QUERY1: JOIN
SELECT
    C.customer_id, 
    C.name AS customer_name,
    O.payment AS bill_payment, 
    O.total AS total_amount
FROM customer AS C
JOIN orders AS O
ON C.customer_id = O.customer_id;

-- QUERY2: Aggregrate
SELECT 
  COUNT(*),
  SUM(total)
FROM customer AS C
JOIN orders AS O
ON C.customer_id = O.customer_id;

-- QUERY3: WITH
WITH sub1 AS (
    SELECT * FROM customer
    WHERE email LIKE '%@yahoo.com'
  ), sub2 AS (
    SELECT * FROM orders
    WHERE NOT payment = 'Cash' 
    AND total >= 18.97
  )
SELECT 
    sub1.customer_id, 
    sub1.name AS customer_name,
    sub2.payment, 
    sub2.total 
FROM sub1 
JOIN sub2 
ON sub1.customer_id = sub2.customer_id;

-- QUERY4: Subquery
SELECT 
    sub1.customer_id, 
    sub1.name AS customer_name,
    sub2.payment AS bill_payment, 
    sub2.total AS total_amount
FROM (SELECT * FROM customer
    WHERE email LIKE '%@gmail.com') AS sub1 
JOIN(SELECT * FROM orders
    WHERE NOT payment = 'Mobile Banking' 
    AND total >= 24.96) AS sub2 
ON sub1.customer_id = sub2.customer_id;

-- QUERY5: JOIN MULTIPLE TABLE 
SELECT 
   I.ingredient_name  
FROM menu AS M
JOIN menu_ingredient AS N 
ON M.menu_id = N.menu_id 
JOIN ingredient AS I 
ON N.ingredient_id = I.ingredient_id
WHERE menu_name = 'Zinger Tower Burger';
