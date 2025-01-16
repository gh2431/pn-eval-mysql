CREATE TABLE IF NOT EXISTS client (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    prenom VARCHAR(255) NOT NULL,
    nom VARCHAR(255) NOT NULL,
    mail VARCHAR(255) NOT NULL UNIQUE,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
)ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS produit(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(255) NOT NULL UNIQUE,
    description TEXT,
    prix INT UNSIGNED NOT NULL,/*prix en centimes*/
    stock INT UNSIGNED NOT NULL
)ENGINE=INNODB;

INSERT INTO produit (`nom`,`description`,`prix`,`stock`)
    VALUES  ('Zéphyr', 'vent d''ouest doux et chaud.', 1500, 5),
            ('Mistral', 'vent du nord ou nord-ouest, soufflant violemment, en toutes saisons, dans la vallée du Rhône', 750, 13),
            ('Alizé', 'vent régulier dans la zone inter-tropicale. Il est de nord-est dans l’hémisphère nord et de sud-est dans l’hémisphère sud', 2300, 7),
            ('Sirocco', 'vent brûlant du sud, sec et chaud charriant du sable du sahara pouvant atteindre l''Espagne, la France et l''Italie', 3200, 3),
            ('Harmattan', 'alizé continental : vent de nord-est, très sec, soufflant en hiver et au printemps en Afrique occidentale', 2900, 4);

INSERT INTO client (`prenom`,`nom`,`mail`,`created_at`)
    VALUES  ('Mme hiver', 'froide', 'hiver.froide@fr','2020/12/01'),
            ('M été', 'chaud', 'été.chaud@fr','2021/07/01'),
            ('Mme printemps', 'automne', 'printemps.automne@fr','2024/04/01');

CREATE TABLE IF NOT EXISTS commande(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, 
    reférence_de_client VARCHAR(255) NOT NULL
)ENGINE=INNODB;

INSERT INTO commande (`date`, `reférence_de_client`)
    VALUES  ('2025/04/01', '3'),
            ('2025/07/01', '2');

CREATE TABLE IF NOT EXISTS détails_commande(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    référence_de_commande VARCHAR(255) NOT NULL,
    référence_du_produit VARCHAR(255) NOT NULL,
    quantité VARCHAR(255) NOT NULL
)ENGINE=INNODB;

INSERT INTO détails_commande (`référence_de_commande`,`référence_du_produit`,`quantité`)
    VALUES  ('1','2','3'),
            ('2','4','6');

CREATE VIEW détails as (select client.prenom, client.nom, commande.date, produit.nom, détails_commande.quantité
    left join client on client.id = commande.reférence_de_client
    left join commande on commande.id = détails_commande.référence_de_commande
    left join détails_commande on détails_commande.référence_du_produit = produit.id); 


CREATE VIEW détails as (select client.prenom, client.nom, commande.date, produit.nom AS produit, détails_commande.quantité 
from client 
left join commande on client.id = commande.reférence_de_client 
left join détails_commande on commande.id = détails_commande.référence_de_commande 
left join produit on détails_commande.référence_du_produit = produit.id); 

    update référence_du_produit set produit.nom_id = 2 where produit.nom="Mistral";