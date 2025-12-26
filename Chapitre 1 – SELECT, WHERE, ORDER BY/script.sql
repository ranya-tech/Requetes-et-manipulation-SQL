CREATE DATABASE tutoriel1;
USE tutoriel1;
CREATE TABLE Article(
    id INT AUTO_INCREMENT PRIMARY KEY,
    titre VARCHAR(40) NOT NULL,
    contenu TEXT NOT NULL,
    datePub DATE
);
INSERT INTO Article (id,titre,contenu,datePub)
VALUES
(1, 'Chapitre1', 'Instruction pour sélectionner filtrer et trier des données dans une table', '2023-08-21'),
(2, 'Chapitre2', 'Instruction pour sélectionner filtrer et trier des données dans une table', '2025-12-26'),
(3, 'Chapitre3', 'Instruction pour sélectionner filtrer et trier des données dans une table', '2025-10-04'),
(4, 'Chapitre4', 'Instruction pour sélectionner filtrer et trier des données dans une table', '2023-06-26');
SELECT * FROM Article;
SELECT titre, datePub
FROM Article
WHERE datePub >= '2024-01-01'
ORDER BY datePub ASC
LIMIT 4;
