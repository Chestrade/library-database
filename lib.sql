DROP DATABASE IF EXISTS biblio;
GO
CREATE DATABASE biblio;
GO
USE biblio;
GO


-- 1. Creation de tables

DROP TABLE IF EXISTS Pret;
DROP TABLE IF EXISTS Document;
DROP TABLE IF EXISTS Section;
DROP TABLE IF EXISTS Editeur;
DROP TABLE IF EXISTS Acquisition;
DROP TABLE IF EXISTS Employe;
GO


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
ALTER TABLE Pret ADD FOREIGN KEY (Titre_document) REFERENCES Document(Titre_document);
ALTER TABLE Pret ADD FOREIGN KEY (Nom_section) REFERENCES Section(Nom_section);

ALTER TABLE Acquisition ADD FOREIGN KEY(Titre_document) REFERENCES Document(Titre_document);
ALTER TABLE Acquisition ADD FOREIGN KEY(Nom_section) REFERENCES Section(Nom_section);
ALTER TABLE Acquisition ADD FOREIGN KEY(No_editeur) REFERENCES Editeur(No_editeur);

ALTER TABLE Section ADD FOREIGN KEY(No_chef_equipe) REFERENCES Employe(No_employe);
ALTER TABLE Employe ADD FOREIGN KEY(Nom_section) REFERENCES Section(Nom_section);
GO

-- 2 .Inserstion des données
INSERT INTO Document(Titre_document, Type_document, Langue_Document) VALUES 
('Base de donnees avancees', 'Livre', 'Francais'),
('Introduction a SQL', 'Livre', 'Francais'),
('Algorithmique', 'Livre', 'Francais'),
('Systemes distribues', 'Livre', 'Anglais');

INSERT INTO Employe(No_employe, Nom, Salaire, Nom_section) VALUES 
(1, 'Tremblay', 62000, 'Sciences'),
(2, 'Gagnon', 60000, 'Lettres'),
(3, 'Roy', 65000, 'Informatique'),
(9, 'Bouchard', 58000, 'Histoire'),
(14, 'Pelletier', 70000, 'Medecine'),
(15, 'Lefebvre', 55000, 'Arts'),
(17, 'Moreau', 72000, 'Administration');

INSERT INTO Section(Nom_section, Numero_etage, Numero_telephone, No_chef_equipe) VALUES 
('Sciences', 1, 5141111111, 1),
('Lettres', 2, 5142222222, 2),
('Informatique', 3, 5143333333, 2),
('Histoire', 4, 5144444444, 2),
('Medecine', 5, 5145555555, 1),
('Arts', 6, 5146666666, 15),
('Administration', 7, 5147777777, 17);

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

INSERT INTO Acquisition (No_Acquisition, Quantite_acquise, Titre_document, Nom_section, No_editeur) VALUES 
(30001, 10, 'Base de donnees avancees', 'Informatique', 30),
(30002, 8, 'Introduction a SQL', 'Informatique', 20),
(30003, 6, 'Algorithmique', 'Sciences', 10),
(30004, 5, 'Systemes distribues', 'Informatique', 30),
(30005, 4, 'Algorithmique', 'Sciences', 10);

INSERT INTO Editeur (No_editeur, Nom_editeur) VALUES 
(10, 'Pearson'),
(20, 'OReilly'),
(30, 'Springer'),
(40, 'Dunod');
