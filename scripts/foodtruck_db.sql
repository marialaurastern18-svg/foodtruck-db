--CREACION DE TABLAS
CREATE TABLE foodtrucks (foodtruck_id INT PRIMARY KEY, name VARCHAR(100) NOT NULL,
cuisine_type VARCHAR(100),
city VARCHAR (100));

CREATE TABLE products (product_id INT PRIMARY KEY, foodtruck_id INT NOT NULL, 
name VARCHAR(100) NOT NULL,
price DECIMAL(10,2) NOT NULL,
stock INT NOT NULL,

CONSTRAINT FK_products_foodtruck
FOREIGN KEY (foodtruck_id)
REFERENCES foodtrucks(foodtruck_id)); 

CREATE TABLE orders (order_id INT PRIMARY KEY, foodtruck_id INT NOT NULL,
order_date DATE NOT NULL,
status VARCHAR(50) NOT NULL,
total DECIMAL(10,2) NOT NULL,

CONSTRAINT FK_orders_foodtruck
FOREIGN KEY (foodtruck_id)
REFERENCES foodtrucks(foodtruck_id)); 


ALTER TABLE orders
ADD COLUMN COMMENTS VARCHAR (255);
SELECT * FROM orders;
SELECT column_name
FROM information_schema.COLUMNS
WHERE table_name = 'orders';
CREATE TABLE order_items (order_item_id INT PRIMARY KEY, order_id INT NOT NULL,
product_id INT NOT NULL, quantity INT NOT NULL,

CONSTRAINT FK_order_items_orders
FOREIGN KEY (order_id)
REFERENCES orders (order_id),

CONSTRAINT FK_order_items_products
FOREIGN KEY (product_id)
REFERENCES products (product_id));


CREATE TABLE locations( location_id INT PRIMARY KEY, foodtruck_id INT NOT NULL, 
location_date DATE NOT NULL, zone VARCHAR(100) NOT NULL,

CONSTRAINT FK_location_foodtruck
FOREIGN KEY (foodtruck_id)
REFERENCES foodtrucks(foodtruck_id));


--INSERCION DE DATOS
INSERT INTO foodtrucks (foodtruck_id, name, cuisine_type, city)
VALUES
(1,'Taco Loco', 'Mexicana', 'Chicago'),
(2,'Burguer Bros', 'Americana', 'Buenos Aires');
SELECT * FROM foodtrucks;


INSERT INTO products(product_id, foodtruck_id,name, price,stock)
VALUES
(101, 1, 'Taco al pastor',50, 100),
(102, 1, 'Quesadilla', 40, 80),
(103, 2, 'Cheeseburguer', 70, 120),
(104,2, 'Papas Fritas', 30, 150);
SELECT *  FROM products;


INSERT INTO orders ( order_id, foodtruck_id, order_date, status, total)
VALUES
(1001, 1,'2023-09-01', 'entregado', 90),
(1002, 2,'2023-09-01', 'pendiente', 100);
SELECT * FROM orders;

INSERT INTO order_items ( order_item_id,order_id, product_id, quantity)
VALUES
(1, 1001,101, 1),
(2,1002,103, 1),
(3, 1002, 104, 1);
SELECT * FROM order_items;


INSERT INTO locations( location_id, foodtruck_id, location_date, zone)
VALUES
(1,1, '2023-09-01','Centro'),
(2,2,'2023-09-01','Parque');
SELECT * FROM locations;



