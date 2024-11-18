-- crée la base de données boutique_vetement
CREATE DATABASE IF NOT EXISTS boutique_vetement;

use boutique_vetement;

CREATE TABLE IF NOT EXISTS categorie
(
	idCategorie INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	libelle VARCHAR(100) NOT NULL
) ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS sexe
(
	idSexe INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	libelle VARCHAR(50) NOT NULL
) ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS modePaiement
(
	idModePaiement INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	modePaiement VARCHAR(100) NOT NULL
) ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS mention
(
	idMention INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	libelle VARCHAR(100) NOT NULL
) ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS customer
(
	idCustomer INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    lastName VARCHAR(100) NOT NULL,
    firstName VARCHAR(100) NOT NULL,
    adresse VARCHAR(100) NOT NULL,
    telephone VARCHAR(20) NOT NULL,
    email VARCHAR(200) NOT NULL,
    dateDerniereCommande date,
    idSexe INT NOT NULL,
	CONSTRAINT fk_customer_idSexe
    FOREIGN KEY (idSexe)
    REFERENCES sexe (idSexe)
) ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS panier
(
	idPanier INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    datePanier date NOT NULL,
    total DECIMAL(10,2) NOT NULL,
    idCustomer INT NOT NULL,
	CONSTRAINT fk_panier_idCustomer
    FOREIGN KEY (idCustomer)
    REFERENCES customer (idCustomer)
) ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS vetement
(
	idVetement INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    vetementName VARCHAR(100) NOT NULL,
    prix DECIMAL(10,2) NOT NULL,
    vetDescription VARCHAR(200) NOT NULL,
    photo VARCHAR(100),
    idCategorie INT NOT NULL,
	CONSTRAINT fk_idVetement_idCategorie
    FOREIGN KEY (idCategorie)
    REFERENCES categorie (idCategorie),
    idSexe INT NOT NULL,
	CONSTRAINT fk_idVetement_idSexe
    FOREIGN KEY (idSexe)
    REFERENCES sexe (idSexe)
) ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS commande
(
	idCommande INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    dateCommande date NOT NULL,
    numCommande VARCHAR(200) NOT NULL,
    total DECIMAL(10,2) NOT NULL,
    idModePaiement INT NOT NULL,
	CONSTRAINT fk_idCommande_idModePaiement
    FOREIGN KEY (idModePaiement)
    REFERENCES modePaiement (idModePaiement),
    idPanier INT NOT NULL,
	CONSTRAINT fk_idCommande_idPanier
    FOREIGN KEY (idPanier)
    REFERENCES panier (idPanier)
) ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS vetement_panier
(
	quantite INT NOT NULL,
    prix DECIMAL(10,2) NOT NULL,
    idPanier INT NOT NULL,
	idVetement INT NOT NULL,
    CONSTRAINT fk_vetement_panier_idPanier
    FOREIGN KEY (idPanier)
    REFERENCES panier (idPanier),
	CONSTRAINT fk_vetement_panier_idVetement
    FOREIGN KEY (idVetement)
    REFERENCES vetement (idVetement)
) ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS vetement_mention
(
	idMention INT NOT NULL,
	idVetement INT NOT NULL,
    CONSTRAINT fk_vetement_mention_idMention
    FOREIGN KEY (idMention)
    REFERENCES mention (idMention),
	CONSTRAINT fk_vetement_mention_idVetement
    FOREIGN KEY (idVetement)
    REFERENCES vetement (idVetement)
) ENGINE = INNODB;

ALTER TABLE vetement_mention ADD CONSTRAINT pk_vetement_mention_idVetement_idMention PRIMARY KEY (idVetement, idMention);
