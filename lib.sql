DROP DATABASE IF EXISTS biblio;
--GO
--CREATE DATABASE biblio;
--GO
--USE biblio;
--GO


-- 1. Creation de tables

DROP TABLE IF EXISTS Pret;
DROP TABLE IF EXISTS Document;
DROP TABLE IF EXISTS Section;
DROP TABLE IF EXISTS Editeur;
DROP TABLE IF EXISTS Acquisition;
DROP TABLE IF EXISTS Employe;
--GO

CREATE TABLE Document(
    Titre_document VARCHAR(255) NOT NULL PRIMARY KEY,
    Type_document VARCHAR(32) NOT NULL,
    Langue_Document VARCHAR(32) NOT NULL
);


CREATE TABLE Section(
    Nom_section VARCHAR(255) NOT NULL PRIMARY KEY,
    Numero_etage int NOT NULL,
    Numero_telephone Decimal(10,0) NOT NULL,
    No_chef_equipe int
    
);

CREATE TABLE Employe(
    No_employe int NOT NULL PRIMARY KEY,
    Nom VARCHAR(255) NOT NULL,
    Salaire Decimal(5,0),
    Nom_section VARCHAR(255) 
);

CREATE TABLE Pret(
    No_Pret int NOT NULL PRIMARY KEY,
    Quantite_pretee int CHECK (Quantite_pretee >= 1),
    Titre_document VARCHAR(255),
    Nom_section VARCHAR(255)
);

CREATE TABLE Acquisition(
    No_Acquisition int NOT NULL PRIMARY KEY,
    Quantite_acquise int,
    Titre_document VARCHAR(255),
    Nom_section VARCHAR(255),
    No_editeur int
);
 
CREATE TABLE Editeur(
    No_editeur int NOT NULL PRIMARY KEY,
    Nom_editeur VARCHAR(255)

);

GO
-- Ajout des foreign keys
ALTER TABLE Pret ADD CONSTRAINT FK_Pret_Document FOREIGN KEY (Titre_document) REFERENCES Document(Titre_document);
ALTER TABLE Pret ADD CONSTRAINT FK_Pret_Section FOREIGN KEY (Nom_section) REFERENCES Section(Nom_section);

ALTER TABLE Acquisition ADD CONSTRAINT FK_Acquisition_Document FOREIGN KEY(Titre_document) REFERENCES Document(Titre_document);
ALTER TABLE Acquisition ADD CONSTRAINT FK_Acquisition_Section FOREIGN KEY(Nom_section) REFERENCES Section(Nom_section);
ALTER TABLE Acquisition ADD CONSTRAINT FK_Acquisition_Editeur FOREIGN KEY(No_editeur) REFERENCES Editeur(No_editeur);

ALTER TABLE Section ADD CONSTRAINT FK_Section_Employe FOREIGN KEY(No_chef_equipe) REFERENCES Employe(No_employe);
ALTER TABLE Employe ADD CONSTRAINT FK_Employe_Section FOREIGN KEY(Nom_section) REFERENCES Section(Nom_section);
GO



-- 2 .Inserstion des données
INSERT INTO Document(Titre_document, Type_document, Langue_Document) VALUES 
('Base de donnees avancees', 'Livre', 'Francais'),
('Introduction a SQL', 'Livre', 'Francais'),
('Algorithmique', 'Livre', 'Francais'),
('Systemes distribues', 'Livre', 'Anglais');

INSERT INTO Section(Nom_section, Numero_etage, Numero_telephone, No_chef_equipe) VALUES 
('Sciences', 1, 5141111111, NULL),
('Lettres', 2, 5142222222, NULL),
('Informatique', 3, 5143333333, NULL),
('Histoire', 4, 5144444444, NULL),
('Medecine', 5, 5145555555, NULL),
('Arts', 6, 5146666666, NULL),
('Administration', 7, 5147777777, NULL);

INSERT INTO Employe(No_employe, Nom, Salaire, Nom_section) VALUES 
(1, 'Tremblay', 62000, 'Sciences'),
(2, 'Gagnon', 60000, 'Lettres'),
(3, 'Roy', 65000, 'Informatique'),
(9, 'Bouchard', 58000, 'Histoire'),
(14, 'Pelletier', 70000, 'Medecine'),
(15, 'Lefebvre', 55000, 'Arts'),
(17, 'Moreau', 72000, 'Administration');


UPDATE Section SET No_chef_equipe = 1 WHERE Nom_section = 'Sciences';
UPDATE Section SET No_chef_equipe = 2 WHERE Nom_section = 'Lettres';
UPDATE Section SET No_chef_equipe = 3 WHERE Nom_section = 'Informatique';
UPDATE Section SET No_chef_equipe = 9 WHERE Nom_section = 'Histoire';
UPDATE Section SET No_chef_equipe = 14 WHERE Nom_section = 'Medecine';
UPDATE Section SET No_chef_equipe = 15 WHERE Nom_section = 'Arts';
UPDATE Section SET No_chef_equipe = 17 WHERE Nom_section = 'Administration';

INSERT INTO Pret (No_Pret, Quantite_pretee, Titre_document, Nom_section) VALUES 
(2005, 2, 'Base de donnees avancees', 'Informatique'),
(2006, 1, 'Introduction a SQL', 'Informatique'),
(2007, 3, 'Algorithmique', 'Sciences'),
(2009, 1, 'Algorithmique', 'Sciences'),
(2013, 2, 'Systemes distribues', 'Informatique'),
(2014, 1, 'Introduction a SQL', 'Informatique'),
(2015, 4, 'Base de donnees avancees', 'Informatique'),
(2019, 1, 'Algorithmique', 'Sciences'),
(2020, 1, 'Systemes distribues', 'Informatique');

INSERT INTO Editeur (No_editeur, Nom_editeur) VALUES 
(10, 'Pearson'),
(20, 'OReilly'),
(30, 'Springer'),
(40, 'Dunod');

INSERT INTO Acquisition (No_Acquisition, Quantite_acquise, Titre_document, Nom_section, No_editeur) VALUES 
(30001, 10, 'Base de donnees avancees', 'Informatique', 30),
(30002, 8, 'Introduction a SQL', 'Informatique', 20),
(30003, 6, 'Algorithmique', 'Sciences', 10),
(30004, 5, 'Systemes distribues', 'Informatique', 30),
(30005, 4, 'Algorithmique', 'Sciences', 10);



-- 3. suppression des donnes
DELETE FROM Pret WHERE No_Pret=2005;

DELETE FROM Employe WHERE No_employe=2;
DELETE FROM Employe WHERE No_employe=3;
-- Echec de supression car les employes 2 et 3 sont des FOREIGN KEYS de la table Section.

-- --4 Ajout de colonnes
ALTER TABLE Pret
ADD Date_pret Date SET DATEFORMAT dmy;

UPDATE Pret SET Date_Pret = GETDATE();

--5. Changement de nom de document
UPDATE Document SET Titre_document='SysDistib' WHERE Titre_document='Systemes distribues';
--Ne fonctionne pas car Titre_document est une clé étrangère dans plusieurs autres tableau. 
--De plus, Système distribues se retourve déjà dans plusieurs tableaux.

--Solution alternative
ALTER TABLE Pret DROP CONSTRAINT FK_Pret_Document;
ALTER TABLE Acquisition DROP CONSTRAINT FK_Acquisition_Document;

UPDATE Document SET Titre_document='SysDitib' WHERE Titre_document='Systemes distribues';
UPDATE Pret SET Titre_document='SysDitib' WHERE Titre_document='Systemes distribues';
UPDATE Acquisition SET Titre_document='SysDitib' WHERE Titre_document='Systemes distribues';

ALTER TABLE Pret ADD CONSTRAINT FK_Pret_Document FOREIGN KEY (Titre_document) REFERENCES Document(Titre_document);
ALTER TABLE Acquisition ADD CONSTRAINT FK_Acquisition_Document FOREIGN KEY(Titre_document) REFERENCES Document(Titre_document);

-- 6. Afficher prets total par titre
SELECT Titre_document, SUM(Quantite_pretee) AS Total_pret FROM Pret GROUP BY Titre_document;

-- 7. afficher section ayant 0 prets
-- se fait avec un left join.
SELECT Section.Nom_section 
FROM Section 
LEFT JOIN Pret 
ON Section.Nom_section = Pret.Nom_section 
WHERE Pret.Nom_section IS NULL;

-- 8 Afficher employes qui travaillent dans une section ayant pretes moins de 2 documents differnets.
GO
SELECT Nom, Nom_section FROM Employe
WHERE Nom_section IN (SELECT Nom_section FROM Pret WHERE Quantite_pretee < 2);
GO

-- 9 Augmenter salaire de 15% de ceux qui gagnent moins de 60000
UPDATE Employe
SET Salaire = Salaire * 1.15 WHERE Salaire < 60000;
GO

-- 10 supression des tables
ALTER TABLE Pret DROP CONSTRAINT FK_Pret_Document;
ALTER TABLE Pret DROP CONSTRAINT FK_Pret_Section;
DROP TABLE Pret;

ALTER TABLE Acquisition DROP CONSTRAINT FK_Acquisition_Editeur;
ALTER TABLE Acquisition DROP CONSTRAINT FK_Acquisition_Document;
ALTER TABLE Acquisition DROP CONSTRAINT FK_Acquisition_Section;
DROP TABLE Acquisition;

ALTER TABLE Employe DROP CONSTRAINT FK_Employe_Section;
ALTER TABLE Section DROP CONSTRAINT FK_Section_Employe;

DROP TABLE Employe;
DROP TABLE Section;

DROP TABLE Document;
DROP TABLE Editeur;



SELECT * FROM Employe;
SELECT * FROM Pret;
SELECT * FROM Section;
SELECT * FROM Document;
SELECT * FROM Acquisition;
SELECT * FROM Editeur;



