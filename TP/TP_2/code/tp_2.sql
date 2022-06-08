
-- This commands drops the database if it was already created.
-- This allows to recreate everything from scratch for test purposes.

DROP DATABASE IF EXISTS tp2;

-- Create the DB tp2 and use it.

CREATE DATABASE tp2;
USE tp2;


-- orders
-- id number
-- typePresta VARCHAR(50),
-- designation VARCHAR(50),
-- clientId number
-- nbDays number
-- unitPrice number
-- totalExcludeTaxe number
-- totalWithTaxe number
-- state number (0,1,2) (CANCELED, OPTION, CONFIRMED)

CREATE TABLE orders (
    ordersId INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    typePresta VARCHAR(50) NOT NULL,
    designation VARCHAR(50) NOT NULL,
    clientId INT NOT NULL,
    nbDays INT NOT NULL,
    unitPrice FLOAT NOT NULL,
    -- totalExcludeTax NOT NULL
    -- totalWithTaxe NOT NULL,
    orderState INT NOT NULL,
    totalTaxExcluded FLOAT GENERATED ALWAYS AS (nbDays * unitPrice) STORED,
    totalWithTax FLOAT GENERATED ALWAYS AS (totalTaxExcluded * 1.2) STORED
);

INSERT INTO orders (ordersId, typePresta, designation, clientId, nbDays, unitPrice, orderState)
VALUES
    (1,  "Formation", "Angular_init"     ,2,  3,    1200, 0),
    (2,  "Formation", "React avancé"     ,2,  3,    1000, 2),
    (3,  "Coaching" , "React Techlead"   ,1,  20,   900,  2),
    (4,  "Coaching" , "Nest.js Techlead" ,1,  50,   800,  1),
    (5,  "Coaching" , "React Teachlead"  ,3,  30,   800,  1),
    (6,  "Coaching" , "Jakarta EE"       ,3,  180,  900,  2),
    (7,  "Coaching" , "Angular Techlead" ,4,  57,   200,  2),
    (8,  "Coaching" , "Angular Techlead" ,4,  50,   780,  0),
    (9,  "Coaching" , "Angular Techlead" ,4,  6,    117,  0),
    (10, "Coaching",  "Angular Techlead" ,4,  10,   900,  1);

-- CREATE VIEW v_formatted_table AS SELECT
--     CONCAT(manufacturer, " - ", NAME) AS full_name,
--     CONCAT("€ ", price) AS price,
--     CONCAT("€ ", price * units_sold) AS ca
-- FROM
--     telephones;


CREATE TABLE clients (
    id INT AUTO_INCREMENT PRIMARY KEY,
    companyName VARCHAR(50),
    firstName VARCHAR(50),
    lastName VARCHAR(50),
    email VARCHAR(50),
    phone VARCHAR(50),
    address VARCHAR(50),
    zipCode VARCHAR(50),
    city VARCHAR(50),
    country VARCHAR(50),
    clientState INT
);

INSERT INTO clients (
    id,
    companyName,
    firstName,
    lastName,
    email,
    phone,
    address,
    zipCode,
    city,
    country,
    clientState
) VALUES

-- *=> Remplissez la base de données au travers des insertions

(1,"Capgemini" ,"Fabrice","Martin","martin@mail.com","06 56 85 84 33","abc","xyz","Nantes","France",0),
(2,"M2i Formation" ,"Julien","Lamard","lamard@mail.com","06 11 22 33 44","abc","xyz","Paris","France",1),
(3,"ATOS" ,"titi","once","titi@mail.com","06 00 11 22 33","def","ijk","Stras","France",2),
(4,"SOPRA STERIA" ,"jack","thecat","jackcat@mail.com","06 00 11 22 33","def","ijk","Stras","France",0);

-- *=> Ecrire une requête pour créer ces 2 tables en prenant en compte la jointure

-- D'abord, le champ "clientId" dans la table orders doit etre changé pour
-- référencer la clé primaire id de la table clients

ALTER TABLE orders ADD FOREIGN KEY(clientId) REFERENCES clients(id) ON DELETE RESTRICT;

-- On visualise puis on créer une table avec le join:

SELECT *
FROM
    clients
JOIN orders ON clients.id = orders.clientId;


CREATE TABLE joined_table AS SELECT *
FROM
    clients
JOIN orders ON clients.id = orders.clientId;


SELECT * FROM joined_table;

-- On ajoute ici les colonnes HT et TTC;

ALTER TABLE joined_table ADD FOREIGN KEY(clientId) REFERENCES clients(id) ON DELETE CASCADE;

ALTER TABLE joined_table ADD HT DOUBLE;
ALTER TABLE joined_table ADD TTC DOUBLE;

-- Et on update leurs valeurs:

UPDATE joined_table SET
    HT = nbDays * unitPrice,
    TTC = HT * 1.2;


-- *=> Afficher toutes les formations sollicités par le client M2i formation

SELECT * FROM joined_table where companyName = 'M2i Formation';

-- *=> Afficher les noms et contacts de tous les contacts des clients qui ont sollicité un
-- coaching

SELECT firstName, lastName, email, phone, address, zipCode, city, country, typePresta 
FROM joined_table 
WHERE typePresta = 'Coaching';


-- *=> Afficher les noms et contacts de tous les contacts des clients qui ont sollicité un
-- coaching pour les accompagnements React.js


SELECT 
    firstName, lastName, email, phone, address, zipCode, city, country, typePresta, designation
FROM 
    joined_table where typePresta = 'Coaching' AND designation LIKE '%React%';


-- *=> Pour chacune des demandes de formation, afficher le prix UHT et prix TTC en se
-- basant sur le unité Price(TJM) et le nombre de jours de prestation tout en sachant
-- que la TVA est de 20%.

SELECT 
    companyName,
    SUM(HT) AS total_HT,
    SUM(TTC) AS total_TTC
FROM 
    joined_table 
GROUP BY 
    companyName;


-- *=> Lister toutes les prestations qui sont confirmés et qui vont rapporter plus
-- 30.000€

SELECT 
    companyName, typePresta, designation, HT 
FROM
    joined_table
WHERE
    orderState = 2 
    AND
    HT > 30000;

SELECT * FROM clients;
SELECT * FROM orders;
SELECT * FROM joined_table;
