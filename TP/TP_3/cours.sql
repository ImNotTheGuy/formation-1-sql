DROP DATABASE IF EXISTS cours;

CREATE DATABASE cours;
USE cours;


CREATE TABLE clients(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(20) NOT NULL,
    prenom VARCHAR(20) NOT NULL,
    adresse_email VARCHAR(50) NOT NULL UNIQUE
);



CREATE TABLE produits(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    designation VARCHAR(50) NOT NULL,
    prixUHT FLOAT NOT NULL,
    prixTTC FLOAT GENERATED ALWAYS AS (prixUHT * 1.2) STORED,
    quantite_stock INT NOT NULL
);


-- La clé primaire de cette table est appelée composite, car elle est créee au travers d'une association de plusieurs clés.
-- Différentes

CREATE TABLE achats(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_clients INT,
    id_produits INT,
    FOREIGN KEY(id_clients) REFERENCES clients(id) ON UPDATE CASCADE ON DELETE SET NULL,
    FOREIGN KEY(id_produits) REFERENCES produits(id) ON UPDATE CASCADE ON DELETE RESTRICT
);

-- Inserted 25 rows for clients and produits from mockaroo.com



-- MULTI-JOIN:

SELECT
    CONCAT(clients.prenom, " ", clients.nom) AS CLIENT,
    produits.designation
FROM
    clients
JOIN achats ON clients.id = achats.id_client
JOIN produits ON achats.id_produit = produits.id;