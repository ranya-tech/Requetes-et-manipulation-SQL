CREATE DATABASE tutoriel3;
USE tutoriel3;
CREATE TABLE Utilisateur(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(20) NOT NULL
);
CREATE TABLE Article(
    id INT AUTO_INCREMENT PRIMARY KEY,
    titre VARCHAR(40) NOT NULL,
    auteur VARCHAR(35),
    contenu TEXT NOT NULL,
    datePub DATE,
    vues INT,
    id_auteur INT NOT NULL,
    FOREIGN KEY (id_auteur) REFERENCES Utilisateur(id)
);

INSERT INTO Utilisateur (id, nom)
VALUES
(1,'Ali'),
(2,'Sara'),
(3,'Aya'),
(4,'Ahmed');
INSERT INTO Article (id, titre, auteur, contenu, datePub, vues, id_auteur)
VALUES
(1, 'Chapitre1', 'Sara','Instruction pour sélectionner filtrer et trier des données dans une table', '2023-08-21', 7, 2),
(2, 'Chapitre2', 'Ali','Instruction pour sélectionner filtrer et trier des données dans une table', '2025-12-26', 6, 1),
(3, 'Chapitre3', 'Aya','Instruction pour sélectionner filtrer et trier des données dans une table', '2025-10-04', 7, 3),
(4, 'Chapitre4', 'Ali','Instruction pour sélectionner filtrer et trier des données dans une table', '2023-06-26', 8, 1);

SELECT a.titre, u.nom
FROM Article a
INNER JOIN Utilisateur u ON a.id_auteur = u.id
WHERE u.nom = 'Ali';

SELECT a.titre, a.datePub, u.nom
FROM Article a
INNER JOIN Utilisateur u ON a.id_auteur = u.id;

