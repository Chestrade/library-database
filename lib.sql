USE master;
GO
DROP DATABASE IF EXISTS biblio;
GO
CREATE DATABASE biblio;
USE biblio;
GO

DROP TABLE IF EXISTS Pret;
CREATE TABLE Pret(
    No_Pret int NOT NULL PRIMARY KEY,
    Qunatite_pretee int NOT NULL,
    Titre_document VARCHAR(255) NOT NULL, -- reference a la table titre document
    Nom_section VARCHAR(255) NOT NULL --reference a cle primaire de section
);

DROP TABLE IF EXISTS Document;
CREATE TABLE Document(
    Titre_document VARCHAR(255) NOT NULL PRIMARY KEY,
    Type_document VARCHAR(32) NOT NULL,
    Langue_Document VARCHAR(32) NOT NULL
);

DROP TABLE IF EXISTS Acquisition;
CREATE TABLE Acquisition(
    No_Acquisition int NOT NULL PRIMARY KEY,
    Quantite_acquise int,
    Titre_document VARCHAR(255), -- reference au document
    Nom_section VARCHAR(255), -- reference a la section
    No_editeur VARCHAR(255), --reference a l'editeur
);

DROP TABLE IF EXISTS Editeur;
CREATE TABLE Editeur(
    No_editeur int NOT NULL PRIMARY KEY,
    Nom_editeur VARCHAR(255),

);

DROP TABLE IF EXISTS Section;
CREATE TABLE Section(
    Nom_section VARCHAR(255) NOT NULL PRIMARY KEY, --ref a la section
    Numero_etage int NOT NULL,
    Numero_telephone Decimal(10,0) NOT NULL,
    No_chef_equipe int --ref a employe
    
);

DROP TABLE IF EXISTS Employe;
CREATE TABLE Employe(
    No_employe int NOT NULL PRIMARY KEY,
    Nom VARCHAR(255) NOT NULL,
    Salaire Decimal(5,0),
    Nom_section VARCHAR(255) NOT NULL -- ref a la section

    
);

