CREATE DATABASE IF NOT EXISTS InventoryDB;
USE InventoryDB;
CREATE TABLE inventory (
    id INT AUTO_INCREMENT PRIMARY KEY,
    item_name VARCHAR(255) NOT NULL,
    quantity INT NOT NULL,
    date_received DATE,
    supplier_name VARCHAR(255),
    price_per_item DECIMAL(10, 2)
);
