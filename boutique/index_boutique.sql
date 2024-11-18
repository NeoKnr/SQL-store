use boutique_vetement;

-- Index sur la colonne idCategorie de la table vetement
CREATE INDEX idx_idCategorie ON vetement (idCategorie);

-- Index sur la colonne idSexe de la table vetement
CREATE INDEX idx_idSexe ON vetement (idSexe);

-- Index sur la colonne idCustomer de la table panier
CREATE INDEX idx_idCustomer ON panier (idCustomer);

-- Index sur la colonne idPanier de la table commande
CREATE INDEX idx_idPanier ON commande (idPanier);

-- Index sur les colonnes idPanier et idVetement de la table vetement_panier
CREATE INDEX idx_idPanier_idVetement ON vetement_panier (idPanier, idVetement);

-- Index sur la colonne idMention de la table vetement_mention
CREATE INDEX idx_idMention ON vetement_mention (idMention);

-- Index sur la colonne dateCommande de la table commande
CREATE INDEX idx_dateCommande ON commande (dateCommande);

-- Index sur les colonnes idCustomer et datePanier de la table panier
CREATE INDEX idx_idCustomer_datePanier ON panier (idCustomer, datePanier);
