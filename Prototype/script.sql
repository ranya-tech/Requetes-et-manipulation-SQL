USE Projets;

INSERT INTO Employeur (nom, prenom, email, role)
VALUES 
('EL Amrani', 'Ali', 'ali.elamrani@mail.com', 'chef de projet'),
('Benali', 'Sara', 'sara.benali@mail.com', 'développeur'),
('EL Khatib', 'Youssef', 'youssef.elkhatib@mail.com', 'testeur'),
('Hassan', 'Lina', 'lina.hassan@mail.com', 'développeur'),
('Alami', 'Ahmed', 'ahmed.alami@mail.com', 'testeur');
INSERT INTO Projet (id,nom, description, dateDebut, dateFin, statut, idChefprojet)
VALUES
(234, 'Site E-commerce Beauty', 'Création dun site e-commerce pour produits de beauté', '2025-11-20', '2026-01-15', 'en cours', 1),
(123, 'Application Mobile', 'Développement d une application mobile pour la gestion de tâches', '2025-04-01', '2025-06-30','terminée', 1),
(250, 'Site E-commerce Fashion', 'Création d un site e-commerce pour vendre des vêtements et accessoires en ligne', '2026-01-16', '2026-03-28', 'annulé', 1),
(100, 'Application de Gestion de Restaurant', 'Développement d une application pour gérer les commandes, les tables et le personnel', '2025-01-09', '2025-04-01', 'terminée', 1),
(98,'Application de Gestion d Hôtel', 'Développement d une application pour gérer les réservations, le personnel et les chambres', '2025-09-01', '2025-12-15', 'en cours', 1);
INSERT INTO Taches (description, dateLimite, priorite, etat, idEmploye, idProjet)
VALUES
('Conception de la base de données', '2025-11-30', 1, 'terminée', 2, 234),
('Développement front-end', '2025-12-12', 2, 'en cours', 2, 234),
('Tests unitaires', '2025-06-25', 3, 'non commencée', 3, 123),
('Développement back-end', '2025-06-29', 1, 'terminée', 4, 123),
('Conception de l interface utilisateur', '2026-03-15', 2, 'non commencée', 3, 250),
('Déploiement et documentation', '2025-03-28', 1, 'terminée', 2, 100),
('Conception de la base de données pour l hôtel', '2025-12-10', 1, 'en cours', 2, 98);
--SELECT
--1-Afficher tous les projets (titre,dateDeb,dateFin);
SELECT nom, dateDebut, dateFin
FROM Projet;
--2-Afficher les employés dont le nom commence par 'EL';
SELECT * FROM Employeur
WHERE nom LIKE 'EL%';
--3-Afficher les taches du projet Num 234 ordonnées par priorité par ordre croissant;
SELECT t.description, idProjet, t.priorite
FROM Taches t 
INNER JOIN Projet p ON t.idProjet = p.id
WHERE p.id = 234
ORDER BY priorite ASC;
--4-Afficher les projets qui doivent se terminer avant Avril 2026;
SELECT * FROM Projet
WHERE dateFin < '2026-04-01';
--5-Afficher tous les employés développeurs;
SELECT e.nom, e.prenom
FROM Employeur e
WHERE e.role = 'développeur';
--6-Afficher les taches terminées du projet de code 98;
SELECT t.description
FROM Taches t
WHERE t.etat = 'terminée' AND t.idProjet = 98;
--7-Afficher pour les projets avec leur responsables(titre,dateDéb,dateFin,nomChef,prénomChef);
SELECT p.nom AS titre, p.dateDebut, p.dateFin, e.nom AS nomChef, e.prenom AS prenomChef
FROM Projet p
INNER JOIN Employeur e ON p.idChefprojet = e.id;
--8-Afficher les taches du projet 'Site E-commerce Beauty';
SELECT t.description, p.nom 
FROM Taches t
INNER JOIN Projet p ON t.idProjet = p.id
WHERE p.nom = 'Site E-commerce Beauty';
--9-Afficher le nombre de taches 'terminées' du projet  'Site E-commerce Beauty';
SELECT t.description, p.nom
FROM Taches t
INNER JOIN Projet p ON t.idProjet = p.id
WHERE p.nom = 'Site E-commerce Beauty' AND t.etat = 'terminée';
--10-Combien de projets ont été terminé dans l'année 2025;
SELECT p.nom, p.dateFin
FROM Projet p
WHERE statut = 'terminée' 
AND p.dateFin BETWEEN '2025-01-01' AND '2025-12-31';
--UPDATE
--1-Modifier la date de fin du projet 234 par "16/05/2026";
UPDATE Projet
SET dateFin = '2026-05-16'
WHERE id = 234;
--2-Modifier l'état de la tache 98 par "Terminée";
UPDATE Taches
SET etat = 'terminée'
WHERE id = 2;
--DELETE
--1-Supprimer les taches "non commencées" du projet 123;
DELETE FROM Taches
WHERE idProjet = 123 AND etat = 'non commencée';
--2-Supprimer l'employé "ALAMI AHMED";
DELETE FROM Employeur
WHERE nom = 'Alami' AND prenom = 'Ahmed';