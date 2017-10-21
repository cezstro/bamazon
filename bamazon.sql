CREATE DATABASE bamazon;
USE bamazon;

DROP TABLE IF EXISTS products;

CREATE TABLE products (PRIMARY KEY(itemID), itemID INTEGER(5) AUTO_INCREMENT NOT NULL, product_name VARCHAR(75), department_name VARCHAR(100), item_cost FLOAT(10),stock_quantity INTEGER(5));

INSERT INTO products (product_name, department_name, item_cost, stock_quantity)
VALUES ('Huggies Little Snugglers Diapers, Size 1', 'Infants', 24.99, 220);

INSERT INTO products (product_name, department_name, item_cost, stock_quantity)
VALUES ('Enfamil Infant Formula Twin Pack', 'Infants', 9.99, 150);

INSERT INTO products (product_name, department_name, item_cost, stock_quantity)
VALUES ('Kirkland Signature Yard & Leaf Bags 45 Gallon', 'PLASTICS / PAPER PRODUCTS', 34.99, 17);

INSERT INTO products (product_name, department_name, item_cost, stock_quantity)
VALUES ('Ziploc Sandwich Bags', 'PLASTICS / PAPER PRODUCTS', 11.99, 10);

INSERT INTO products (product_name, department_name, item_cost, stock_quantity)
VALUES ('Ziploc Slider Bags Gallon & Storage Mix', 'PLASTICS / PAPER PRODUCTS', 9.99, 2);

INSERT INTO products (product_name, department_name, item_cost, stock_quantity)
VALUES ('Airborne Chewable Berry or Cirtus', 'HEALTH', 19.95, 120);

INSERT INTO products (product_name, department_name, item_cost, stock_quantity)
VALUES ('Applied Nutrition Liquid Collagen 400 mg', 'HEALTH', 6.95, 6);

INSERT INTO products (product_name, department_name, item_cost, stock_quantity)
VALUES ('Barleans OMega Fish Oil Lemon Zest', 'HEALTH', 3.95, 90);

INSERT INTO products (product_name, department_name, item_cost, stock_quantity)
VALUES ('Duracell Alkaline AAA Batteries', 'BATTERIESs', 16.32, 60);

INSERT INTO products (product_name, department_name, item_cost, stock_quantity)
VALUES ('Kirkland AAA Alkaline Batteries', 'BATTERIESg', 2.99, 18);

SELECT * FROM products;
