-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  mar. 24 avr. 2018 à 22:54
-- Version du serveur :  5.7.17
-- Version de PHP :  5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";
CREATE DATABASE IF NOT EXISTS `bdgaragevirtuel` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `bdgaragevirtuel`;


--
-- Base de données :  `bdgaragevirtuel`
--

-- --------------------------------------------------------

--
-- Structure de la table `abonnements`
--

CREATE TABLE `abonnements` (
  `idAbonnement` int(8) NOT NULL,
  `typeAbonnement` varchar(8)COLLATE utf8_unicode_ci DEFAULT NULL,
  `prix` decimal(2,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONS POUR LA TABLE `abonnements`:
--

-- --------------------------------------------------------

--
-- Structure de la table `adresses`
--

CREATE TABLE `adresses` (
  `idAdresse` int(11) NOT NULL,
  `idMembre` int(11) DEFAULT NULL,
  `numeroCivique` int(11) DEFAULT NULL,
  `nomRue` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ville` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `codePostal` char(7) COLLATE utf8_unicode_ci DEFAULT NULL,
  `region` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `latitude` decimal(18,9) DEFAULT NULL,
  `longitude` decimal(18,9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONS POUR LA TABLE `adresses`:
--

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `idCategorie` int(8) NOT NULL,
  `description` varchar(100)COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONS POUR LA TABLE `categories`:
--

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`idCategorie`, `description`) VALUES
(1, 'Accessoires Informatiques'),
(2, 'Appareils electromenagers'),
(3, 'Appareils photo et cameras'),
(4, 'Art et objet de collection'),
(5, 'Articles pour bebes'),
(6, 'Articles de sport et exercice'),
(7, 'Autre'),
(8, 'Bijoux et montres'),
(9, 'Equipements electroniques'),
(10, 'Instruments de musique'),
(11, 'Objets gratuits'),
(12, 'Sante et besoins speciaux'),
(13, 'Souliers'),
(14, 'velos'),
(15, 'vetements');

-- --------------------------------------------------------

--
-- Structure de la table `connexions`
--

CREATE TABLE `connexions` (
  `idMembre` int(11) NOT NULL,
  `courriel` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `motPasse` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


--
-- RELATIONS POUR LA TABLE `connexions`:
--

-- --------------------------------------------------------

--
-- Structure de la table `evenements`
--

CREATE TABLE `evenements` (
  `idEvenement` int(8) NOT NULL,
  `titreEvenement` varchar(150)COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255)COLLATE utf8_unicode_ci DEFAULT NULL,
  `idAdresse` int(8) NOT NULL,
  `dateDebut` datetime NOT NULL,
  `dateFin` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONS POUR LA TABLE `evenements`:
--

-- --------------------------------------------------------

--
-- Structure de la table `membres`
--

CREATE TABLE `membres` (
  `idMembre` int(11) NOT NULL,
  `prenom` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nom` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telephone` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateNaissance` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sexe` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photoMembre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONS POUR LA TABLE `membres`:
--

-- --------------------------------------------------------

--
-- Structure de la table `photoproduits`
--

CREATE TABLE `photoproduits` (
  `idPhoto` int(8) NOT NULL,
  `idProduit` int(8) NOT NULL,
  `idEvenement` int(8) NOT NULL,
  `photoProd` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- RELATIONS POUR LA TABLE `photoproduits`:
--

-- --------------------------------------------------------

--
-- Structure de la table `produits`
--

CREATE TABLE `produits` (
  `idProduit` int(8) NOT NULL,
  `idMembre` int(8) NOT NULL,
  `nomProduit` varchar(50)COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255)COLLATE utf8_unicode_ci DEFAULT NULL,
  `quantite` int(5) NOT NULL,
  `idCategorie` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONS POUR LA TABLE `produits`:
--

-- --------------------------------------------------------

--
-- Structure de la table `vendeurs`
--

CREATE TABLE `vendeurs` (
  `idMembre` int(8) NOT NULL,
  `idAbonnement` int(8) NOT NULL,
  `idAdresse` int(8) NOT NULL,
  `idEvenement` int(8) NOT NULL,
  `idProduit` int(8) NOT NULL,
  `actif` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONS POUR LA TABLE `vendeurs`:
--

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `abonnements`
--
ALTER TABLE `abonnements`
  ADD PRIMARY KEY (`idAbonnement`);

--
-- Index pour la table `adresses`
--

  

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
ADD PRIMARY KEY (`idCategorie`);

--
-- Index pour la table `connexions`
--


--
-- Index pour la table `evenements`
--
ALTER TABLE `evenements`
  ADD PRIMARY KEY (`idEvenement`),
  ADD KEY `Evenements_FK` (`idAdresse`);

--
-- Index pour la table `membres`
--
ALTER TABLE `membres`
  ADD PRIMARY KEY (`idMembre`);

  
--
-- Index pour la table `photoproduits`
--


--
-- Index pour la table `produits`
--


--
-- Index pour la table `vendeurs`
--

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `abonnements`
--
ALTER TABLE `abonnements`
  MODIFY `idAbonnement` int(8) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `adresses`
--
  
--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `idCategorie` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT pour la table `connexions`
--


--
-- AUTO_INCREMENT pour la table `evenements`
--
ALTER TABLE `evenements`
  MODIFY `idEvenement` int(8) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `membres`
--
ALTER TABLE `membres`
  MODIFY `idMembre` int(8) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `photoproduits`
--
ALTER TABLE `photoproduits`
  MODIFY `idPhoto` int(8) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `produits`
--
ALTER TABLE `produits`
  MODIFY `idProduit` int(8) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `vendeurs`
--
ALTER TABLE `vendeurs`
  MODIFY `idMembre` int(8) NOT NULL AUTO_INCREMENT;COMMIT;

ALTER TABLE `adresses`
  ADD PRIMARY KEY (`idAdresse`),
  ADD CONSTRAINT `adresses_ibfk_2` FOREIGN KEY (`idMembre`) REFERENCES `membres` (`idMembre`) ON DELETE CASCADE ON UPDATE CASCADE;
  
  ALTER TABLE `connexions`
ADD CONSTRAINT `connexions_ibfk_1` FOREIGN KEY (`idMembre`) REFERENCES `membres` (`idMembre`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `produits`
  ADD PRIMARY KEY (`idProduit`),
  ADD CONSTRAINT `Produits_FK_1` FOREIGN KEY (`idMembre`) REFERENCES `membres` (`idMembre`) ON DELETE CASCADE ON UPDATE CASCADE;
  ADD CONSTRAINT `Produits_Fk_2` FOREIGN KEY(`idCategorie`) REFERENCES `membres` (`idCategorie`) ON DELETE CASCADE ON UPDATE CASCADE;;

ALTER TABLE `vendeurs`
  ADD CONSTRAINT KEY `vendeurs_ibfk_1` FOREIGN KEY(`idMembre`) REFERENCES `membres` (`idMembre`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT KEY `vendeurs_FK_2` FOREIGN KEY (`idAbonnement`) REFERENCES `abonnements` (`idAbonnement`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT KEY `vendeurs_FK_3` FOREIGN KEY (`idAdresse`) REFERENCES `adresses` (`idAdresse`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT KEY `vendeurs_FK_4` FOREIGN KEY (`idEvenement`) REFERENCES `evenements` (`idEvenement`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT KEY `Vendeurs_FK_5`FOREIGN KEY (`idProduit`)  REFERENCES `produits` (`idProduit`) ON DELETE CASCADE ON UPDATE CASCADE;
  
  ALTER TABLE `photoproduits`
  ADD PRIMARY KEY (`idPhoto`),
  ADD CONSTRAINT `PhotoProduits_FK_1` FOREIGN KEY(`idProduit`) REFERENCES `produits` (`idProduit`) ON DELETE CASCADE ON UPDATE CASCADE;
  ADD KEY `PhotoProduits_FK_2` FOREIGN KEY(`idEvenement`) REFERENCES `evenements` (`idEvenement`) ON DELETE CASCADE ON UPDATE CASCADE;
