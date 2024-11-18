use boutique_vetement;

CREATE USER 'Aïcha'@'localhost'IDENTIFIED BY 'sata';

GRANT SELECT, INSERT, UPDATE, DELETE ON boutique_vetement.* TO 'Aïcha'@'localhost';

FLUSH PRIVILEGES;