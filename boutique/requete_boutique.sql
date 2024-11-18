use boutique_vetement;

-- Afficher les vêtements commander par un client sélectionné suivant son nom
SELECT c.lastName, c.firstName, v.vetementName, v.prix, vp.quantite, p.datePanier
FROM customer c
JOIN panier p ON c.idCustomer = p.idCustomer
JOIN vetement_panier vp ON p.idPanier = vp.idPanier
JOIN vetement v ON vp.idVetement = v.idVetement
WHERE c.lastName = 'NDIAYE'; -- Remplacez 'SAKHO' par le nom du client que vous souhaitez rechercher

-- Afficher le nombre total de vêtement par panier
SELECT p.idPanier, COUNT(vp.idVetement) AS nombreTotalVetements
FROM panier p
JOIN vetement_panier vp ON p.idPanier = vp.idPanier
GROUP BY p.idPanier;

-- Afficher le montant total des commandes par client, trié par nom de client
SELECT c.idCustomer, c.lastName, c.firstName, SUM(pc.total) AS montantTotalCommandes
FROM customer c
JOIN panier p ON c.idCustomer = p.idCustomer
JOIN commande pc ON p.idPanier = pc.idPanier
GROUP BY c.idCustomer, c.lastName, c.firstName
ORDER BY c.lastName, c.firstName;

