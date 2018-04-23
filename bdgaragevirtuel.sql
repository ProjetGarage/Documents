DROP DATABASE bdgaragevirtuel;
CREATE DATABASE bdgaragevirtuel;
USE bdgaragevirtuel;

DROP TABLE IF EXISTS Connexions;
DROP TABLE IF EXISTS Membres;
DROP TABLE IF EXISTS Adresses;
DROP TABLE IF EXISTS Produits;
DROP TABLE IF EXISTS PhotoProduits;
DROP TABLE IF EXISTS Categories;
DROP TABLE IF EXISTS Vendeurs;
DROP TABLE IF EXISTS Abonnements;
DROP TABLE IF EXISTS Evenements;

CREATE TABLE Connexions (
 idMembre  INT(8) NOT NULL AUTO_INCREMENT,
 courriel  VARCHAR(35) NOT NULL,
 motPasse  VARCHAR(100) NOT NULL,
 CONSTRAINT Connexions_PK PRIMARY KEY (courriel),
 CONSTRAINT Connexions_FK FOREIGN KEY (idMembre) REFERENCES Membres(idMembre));

CREATE TABLE Membres (
 idMembre      INT(8) NOT NULL AUTO_INCREMENT,    
 prenom        VARCHAR(35) NOT NULL,
 nom           VARCHAR(35) NoT NULL,
 telephone     VARCHAR(12) NOT NULL,
 dateNaissance DATE NOT NULL,
 sexe          VARCHAR(1) NOT NULL,
 photoMembre   VARCHAR(255) NOT NULL,
 CONSTRAINT Membres_PK PRIMARY KEY (idMembre));
 
CREATE TABLE Adresses (
 idAdresse     INT(8) NOT NULL AUTO_INCREMENT,
 idMembre      INT(8) NOT NULL,  
 numeroCivique VARCHAR(5)  NOT NULL,
 nomRue        VARCHAR(30) NoT NULL,
 ville         VARCHAR(30) NOT NULL,
 codePostal    VARCHAR(7)  NOT NULL,
 region        VARCHAR(50) NOT NULL,
 latitude      DECIMAL(18,9)  NOT NULL,
 longitude     DECIMAL(18,9)  NOT NULL,
 CONSTRAINT Adresses_PK PRIMARY KEY (idAdresse),
 CONSTRAINT Adresses_FK FOREIGN KEY (idMembre) REFERENCES Membres(idMembre));

CREATE TABLE Produits (
 idProduit    INT(8) NOT NULL AUTO_INCREMENT,
 nomProduit   VARCHAR(50) NOT NULL,
 description  VARCHAR(255) NOT NULL,
 quantite     INT(5) NOT NULL,
 idCategorie  INT(8) NOT NULL,
 idVendeur    INT(8) NOT NULL,
 CONSTRAINT Produits_PK PRIMARY KEY (idProduit),
 CONSTRAINT Produits_FK_idVendeur FOREIGN KEY (idVendeur)   REFERENCES Vendeurs(idVendeur),
 CONSTRAINT Produits_FK_idProduit FOREIGN KEY (idProduit)   REFERENCES PhotoProduits(idProduit),
 CONSTRAINT Produits_FK_idCategorie FOREIGN KEY (idCategorie) REFERENCES Categories(idCategorie));
 
CREATE TABLE PhotoProduits (
 idPhoto     INT(8) NOT NULL AUTO_INCREMENT,
 idProduit   INT(8) NOT NULL,
 idEvenement INT(8) NOT NULL,
 CONSTRAINT PhotoProduits_PK PRIMARY KEY (idPhoto),
 CONSTRAINT PhotoProduits_FK_idProduit   FOREIGN KEY (idProduit)   REFERENCES Produits(idProduit),
 CONSTRAINT PhotoProduits_FK_idEvenement FOREIGN KEY (idEvenement) REFERENCES Evenements(idEvenement));

CREATE TABLE Categories (
 idCategorie  INT(8) NOT NULL AUTO_INCREMENT,
 nomCategorie VARCHAR(50) NOT NULL,
 CONSTRAINT Categories_PK PRIMARY KEY (idCategorie));
 
 INSERT INTO Categories VALUES (0,'Accessoires Informatiques');
 INSERT INTO Categories VALUES (0,'Appareils electromenagers');
 INSERT INTO Categories VALUES (0,'Appareils photo et cameras');
 INSERT INTO Categories VALUES (0,'Art et objet de collection');
 INSERT INTO Categories VALUES (0,'Articles pour bebes');
 INSERT INTO Categories VALUES (0,'Articles de sport et exercice');
 INSERT INTO Categories VALUES (0,'Autre');
 INSERT INTO Categories VALUES (0,'Bijoux et montres');
 INSERT INTO Categories VALUES (0,'Equipements electroniques');
 INSERT INTO Categories VALUES (0,'Instruments de musique');
 INSERT INTO Categories VALUES (0,'Objets gratuits');
 INSERT INTO Categories VALUES (0,'Sante et besoins speciaux');
 INSERT INTO Categories VALUES (0,'Souliers');
 INSERT INTO Categories VALUES (0,'velos');
 INSERT INTO Categories VALUES (0,'vetements');
 
CREATE TABLE Vendeurs (
 idMembre     INT(8) NOT NULL AUTO_INCREMENT,
 idAbonnement INT(8) NOT NULL,
 idAdresse    INT(8) NOT NULL,
 idEvenement  INT(8) NOT NULL,
 idProduit    INT(8) NOT NULL,
 actif        INT(1) NOT NULL,
 CONSTRAINT Vendeurs_FK_idMembre     FOREIGN KEY (idMembre)      REFERENCES Membres(idMembre),
 CONSTRAINT Vendeurs_FK_idAbonnement FOREIGN KEY (idAbonnement)  REFERENCES Abonnements(idAbonnement),
 CONSTRAINT Vendeurs_FK_idAdresse    FOREIGN KEY (idAdresse)     REFERENCES Adresses(idAdresses),
 CONSTRAINT Vendeurs_FK_idEvenement  FOREIGN KEY (idEvenement)   REFERENCES Evenements(idEvenement),
 CONSTRAINT Vendeurs_FK_idProduit    FOREIGN KEY (idProduit)     REFERENCES Produits(idProduit));
 
CREATE TABLE Abonnements (
 idAbonnement    INT(8) NOT NULL AUTO_INCREMENT,
 typeAbonnement  VARCHAR(8) NOT NULL,
 prix            DECIMAL(2,2),        
 CONSTRAINT Abonnements_PK PRIMARY KEY (idAbonnement)); 
 
 CREATE TABLE Evenements (
 idEvenement    INT(8) NOT NULL AUTO_INCREMENT,
 titreEvenement VARCHAR(150) NOT NULL,
 description    VARCHAR(255) NOT NULL,
 idAdresse      INT(8) NOT NULL,
 dateDebut      DATETIME NOT NULL,
 dateFin        DATETIME NOT NULL,
 CONSTRAINT Evenements_PK PRIMARY KEY (idEvenement),
 CONSTRAINT Evenements_FK FOREIGN KEY (idAdresse) REFERENCES Adresses(idAdresse));
