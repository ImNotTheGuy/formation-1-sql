-- Créer une base de données appelée sales

CREATE DATABASE sales;
USE sales;

-- ## Créer une table appelée telephones avec les colonnes suivantes :
-- *=> name : chaîne de caractères qui représente le modèle du téléphone
-- *=> manufacturer : chaîne de caractères qui représente le fabricant
-- *=> price : un nombre qui représente le prix UHT
-- *=> units_sold : nombre qui représentent la quantité vendue


CREATE TABLE telephones(
    id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    manufacturer VARCHAR(50) NOT NULL,
    price FLOAT NOT NULL,
    units_sold INTEGER NOT NULL
);

-- *=> Insérer les données suivantes (cf .pdf)

INSERT INTO telephones (id, name, manufacturer, price, units_sold) VALUES
(1, "N1280", "Nokia", 199, 1925),
(2, "Iphone 4", "Apple", 399, 9436),
(3, "Galaxy S 5", "Samsung", 299, 2359),
(4, "S5620 Monte", "Samsung", 250, 2385),
(5, "N8", "Nokia", 150, 7543),
(6, "Droid", "Motorola", 150, 8395),
(7, "Iphone 13 Pro Max", "Apple", 1300, 12849),
(8, "Galaxy Note 20", "Samsung", 1100, 10353);

-- *=> Ecrire une requête pour liste tous les modèles de téléphones

SELECT name FROM telephones;

-- *=> Ecrire une requête pour lister tous les 
-- telephone(name, manufacturer) de tous les
-- téléphone dont le prix est supérieur à 200€

SELECT name, manufacturer FROM telephones WHERE price > 200;

-- *=> Ecrire une requête pour lister tous les 
-- telephone(name, manufacturer) de tous les
-- téléphone dont le prix est varie entre 150 et 200€

SELECT name, manufacturer FROM telephones where price >= 150 AND price <= 200;

-- *=> Lister tous les téléphones de marque samsung et Apple

SELECT * FROM telephones WHERE manufacturer='Apple' OR manufacturer='Samsung';

-- Équivalent des lignes précédentes, on peut l'écrire aussi:

SELECT * FROM telephones WHERE manufacturer IN("Apple", "Samsung");


SELECT name, manufacturer FROM telephones WHERE price BETWEEN 150 AND 200;

SELECT name, manufacturer, price FROM telephones WHERE price BETWEEN 150 AND 200 ORDER BY price ASC;


-- Afficher dans l'ordre croissant des prix
SELECT id,name,manufacturer,price FROM telephones ORDER BY price ASC;

-- Afficher dans l'ordre decroissant des prix
SELECT id,name,manufacturer,price FROM telephones ORDER BY price DESC;

-- Several order criterias
SELECT id,name,manufacturer,price FROM telephones ORDER BY price DESC,manufacturer DESC;


-- CONCAT function

SELECT 
    CONCAT(manufacturer, " - ",name) AS full_name,
    CONCAT("€ ", price) AS price,
    CONCAT("€ ", price*units_sold) AS ca

FROM
    telephones;

-- Création d'une vue

CREATE VIEW v_formatted_table AS SELECT
    CONCAT(manufacturer, " - ", NAME) AS full_name,
    CONCAT("€ ", price) AS price,
    CONCAT("€ ", price * units_sold) AS ca
FROM
    telephones;

-- Compter condition

SELECT count(*) FROM telephones WHERE manufacturer='Apple';

-- Average and Sum grouped by manufacturer

SELECT
    manufacturer,
    CONCAT(SUM(price * units_sold), " €") AS total_CA,
    CONCAT(AVG(price * units_sold), " €") AS average_CA
FROM
    telephones
GROUP BY
    manufacturer;