use boutique_vetement;

DELIMITER $
CREATE FUNCTION meilleurCLient(annee INT, mois INT) RETURNS VARCHAR(200)
BEGIN
    DECLARE nomClient VARCHAR(200);

    -- Sélectionner le client ayant dépensé le plus d'argent pour l'année et le mois spécifiés
    SELECT c.lastName INTO nomClient
    FROM customer c
    JOIN panier p ON c.idCustomer = p.idCustomer
    JOIN commande cmd ON p.idPanier = cmd.idPanier
    WHERE
        YEAR(cmd.dateCommande) = annee
        AND MONTH(cmd.dateCommande) = mois
    ORDER BY
        cmd.total DESC
    LIMIT 1;

    RETURN nomClient;
END $
DELIMITER ;

SELECT meilleurClient(2023, 10) AS MeilleurCLient;

DELIMITER $
CREATE TRIGGER insert_commande
BEFORE INSERT ON commande
FOR EACH ROW
BEGIN
    DECLARE idCustomerParam INT;
    
    -- Sélectionner l'identifiant du client associé à la commande
    SELECT idCustomer INTO idCustomerParam
    FROM panier
    WHERE idPanier = NEW.idPanier;

    -- Mettre à jour la dateDerniereCommande dans la table Customer
    UPDATE customer
    SET dateDerniereCommande = NEW.dateCommande
    WHERE idCustomer = idCustomerParam;
END $
DELIMITER ;
