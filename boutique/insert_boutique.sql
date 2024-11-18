use boutique_vetement;

insert into categorie (libelle) VALUES
('Pantalons'),
('T-shirt'),
('Chemises'),
('Shorts'),
('Jupes');

select * from categorie;

insert into mention (libelle) VALUES
('Fabriqué en France'),
('Coton biologique'),
('Fibres recyclés');

select * from mention;

insert into sexe (libelle) VALUES
('Masculin'),
('Féminin');

select * from sexe;

insert into modePaiement (modePaiement) VALUES
('Carte bancaire'),
('Virement bancaire'),
('Chèque'),
('Paypal');

select * from modePaiement;

insert into customer (lastName, firstName, adresse, telephone, email, dateDerniereCommande, idSexe) VALUES
('MANUEL', 'Fabien', 'Chez Fabien', '0934571964', 'maildefabien@gmail.com', '2023-11-17', 1),
('NDIAYE', 'Abdou', 'Chez Abdou', '0467281946', 'maildeabdou@gmail.com', '2023-11-16', 1),
('MONTREDON', 'Chloé', 'Chez Chloé', '0697651583', 'maildechloe@gmail.com', '2023-11-15', 2);

select * from customer;

insert into vetement (vetementName, prix, vetDescription, photo, idCategorie, idSexe) VALUES
('Cargo', 55.99, 'Pantalon homme', 'photo pantalon', 1, 1),
('Coupe sportive', 29.99, 'Short bleu', 'photo short', 4, 2),
('Henley', 35.17, 'T-shirt à col tunisien', 'photo t-shirt', 2, 1),
('Le petit col', 19.99, 'Chemise à petit col', 'photo chemise', 3, 1),
('La jupe à godets', 41.32, 'Jupe à godets rose', 'photo jupe', 5, 2);

select * from vetement;

insert into vetement_mention (idMention, idVetement) VALUES
(3, 10),
(1, 7),
(2, 9),
(3, 6),
(1, 8);

select * from vetement_mention;

insert into panier (datePanier, total, idCustomer) VALUES
('2019-07-19', 559.9, 2),
('2020-01-25', 211.02, 3),
('2023-12-03', 123.96, 1);

select * from panier;

insert into vetement_panier (quantite, prix, idPanier, idVetement) VALUES
(6, 211.02, 2, 8),
(10, 559.9, 1, 6),
(3, 123.96, 3, 10);

select * from vetement_panier;

insert into commande (dateCommande, numCommande, total, idModePaiement, idPanier) VALUES
('2023-10-30', 'KD782HF849', 211.02, 1, 2),
('2022-01-06', 'N64DE839A', 559.9, 4, 1);

select * from commande;