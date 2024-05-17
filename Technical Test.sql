INSERT INTO table_b (nama_buah, quantity) VALUES
('Mangga', 5),
('Jeruk', 2),
('Nangka', 4),
('Kelapa', 6);

SELECT * FROM table_a harga_inventory
LEFT JOIN table_b quantity_inventory
ON harga_inventory.nama_buah = quantity_inventory.nama_buah;

SELECT * FROM table_a harga_inventory
RIGHT JOIN table_b quantity_inventory
ON harga_inventory.nama_buah = quantity_inventory.nama_buah;

SELECT * FROM table_a harga_inventory
JOIN table_b quantity_inventory
ON harga_inventory.nama_buah = quantity_inventory.nama_buah;

SELECT *
FROM table_a harga_inventory
LEFT JOIN table_b quantity_inventory
ON harga_inventory.nama_buah = quantity_inventory.nama_buah
UNION
SELECT *
FROM table_a harga_inventory
RIGHT JOIN table_b quantity_inventory
ON harga_inventory.nama_buah = quantity_inventory.nama_buah;

SELECT harga_inventory.nama_buah, (quantity_inventory.quantity * harga_inventory.harga) sales
FROM table_a harga_inventory
JOIN table_b quantity_inventory
ON harga_inventory.nama_buah = quantity_inventory.nama_buah;

SELECT nama_buah
FROM table_a
WHERE nama_buah LIKE '%K%'
UNION
SELECT nama_buah
FROM table_b
WHERE nama_buah LIKE '%K%';

SELECT a.nama_buah
FROM table_a a
JOIN table_b b ON a.nama_buah = b.nama_buah
WHERE a.harga > 1000 AND b.quantity < 5;
