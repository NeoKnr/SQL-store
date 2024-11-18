use boutique_sql;

DELIMITER // 

CREATE PROCEDURE dupliquerVetements(
    IN idCategorieSource INT,
    IN idCategorieCible INT
)
BEGIN
    INSERT INTO vetement (vetementName, prix, vetDescription, photo, idCategorie, idSexe)
    SELECT vetementName, prix, vetDescription, photo, idCategorieCible, idSexe
    FROM vetement
    WHERE idCategorie = idCategorieSource;
END //

DELIMITER ;