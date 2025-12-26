CREATE DATABASE tutoriel1;
USE tutoriel1;
CREATE TABLE Article(
    id INT AUTO_INCREMENT PRIMARY KEY,
    titre VARCHAR(40) NOT NULL,
    auteur VARCHAR(35),
    contenu TEXT NOT NULL,
    datePub DATE,
    vues INT
);
INSERT INTO Article (id, titre, auteur, contenu, datePub, vues)
VALUES
(1, 'Chapitre1', 'Sara','Instruction pour sélectionner filtrer et trier des données dans une table', '2023-08-21', 7),
(2, 'Chapitre2', 'Ali','Instruction pour sélectionner filtrer et trier des données dans une table', '2025-12-26', 6),
(3, 'Chapitre3', 'Aya','Instruction pour sélectionner filtrer et trier des données dans une table', '2025-10-04', 7),
(4, 'Chapitre4', 'Ali','Instruction pour sélectionner filtrer et trier des données dans une table', '2023-06-26', 8);
SELECT * FROM Article;
SELECT COUNT(*) AS total_articles FROM Article;
SELECT MAX(datePub) AS derniere_publication FROM Article;
SELECT auteur, COUNT(*) AS nb_articles
FROM Article
GROUP BY auteur
HAVING COUNT(*) >= 3;
SELECT AVG(vues) AS moyenne_vues FROM Article;
