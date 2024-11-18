use boutique_vetement;

CREATE VIEW vue_vetements AS 
SELECT v.idVetement, v.vetementName, v.vetDescription, c.libelle AS categorie_libelle, s.libelle AS sexe_libelle, m.libelle AS mention_libelle
FROM vetement v
JOIN categorie c ON v.idCategorie = c.idCategorie
JOIN sexe s ON v.idSexe = s.idSexe
LEFT JOIN vetement_mention vm ON v.idVetement = vm.idVetement
LEFT JOIN mention m ON vm.idMention = m.idMention;