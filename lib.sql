
GO
DROP DATABASE IF EXISTS biblio;
GO
CREATE DATABASE biblio;
USE biblio;
GO

DROP DATABASE IF EXISTS biblio;
GO
CREATE DATABASE biblio;
GO
USE biblio;
GO

-- supression des tables avant la creation.

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
    Nom_editeur VARCHAR(255),

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

-- Inserstion des données
INSERT INTO Document(Titre_document, Type_document, Langue_Document) VALUES ('Base de donnees avancees', 'Livre', 'Francais');
INSERT INTO Document(Titre_document, Type_document, Langue_Document) VALUES ('Introduction a SQL', 'Livre', 'Francais');
INSERT INTO Document(Titre_document, Type_document, Langue_Document) VALUES ('Algorithmique', 'Livre', 'Francais');
INSERT INTO Document(Titre_document, Type_document, Langue_Document) VALUES ('Systemes distribues', 'Livre', 'Anglais');

INSERT INTO Employe(No_employe, Nom, Salaire, Nom_section) VALUES (1, 'Tremblay', 62000, 'Sciences');
INSERT INTO Employe(No_employe, Nom, Salaire, Nom_section) VALUES (2, 'Gagnon', 60000, 'Lettres');
INSERT INTO Employe(No_employe, Nom, Salaire, Nom_section) VALUES (3, 'Roy', 65000, 'Informatique');
INSERT INTO Employe(No_employe, Nom, Salaire, Nom_section) VALUES (9, 'Bouchard', 58000, 'Histoire');
INSERT INTO Employe(No_employe, Nom, Salaire, Nom_section) VALUES (14, 'Pelletier', 70000, 'Medecine');
INSERT INTO Employe(No_employe, Nom, Salaire, Nom_section) VALUES (15, 'Lefebvre', 55000, 'Arts');
INSERT INTO Employe(No_employe, Nom, Salaire, Nom_section) VALUES (17, 'Moreau', 72000, 'Administration');




--INSERT INTO Pret (No_Pret, Quantite_pretee, Titre_document, Nom_section) VALUES (2005, 2, 'Base de donnees avancees', 'Informatique');
--INSERT INTO Pret (No_Pret, Quantite_pretee, Titre_document, Nom_section) VALUES (2006, 1, 'Introduction a SQL', 'Informatique');
--INSERT INTO Pret (No_Pret, Quantite_pretee, Titre_document, Nom_section) VALUES (2007, 3, 'Algorithmique', 'Sciences');
--INSERT INTO Pret (No_Pret, Quantite_pretee, Titre_document, Nom_section) VALUES (2009, 1, 'Algorithmique', 'Sciences');
--INSERT INTO Pret (No_Pret, Quantite_pretee, Titre_document, Nom_section) VALUES (2009, 1, 'Algorithmique', 'Sciences');




