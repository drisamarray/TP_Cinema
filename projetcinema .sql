-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Lun 06 Novembre 2017 à 05:27
-- Version du serveur :  5.7.14
-- Version de PHP :  5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `projetcinema`
--

-- --------------------------------------------------------

--
-- Structure de la table `cinema`
--

CREATE TABLE `cinema` (
  `ID_INCREMENTAL` int(11) NOT NULL,
  `IDCINEMA` varchar(100) NOT NULL,
  `IDGESTIONNAIRE` varchar(100) NOT NULL,
  `NOMCINEMA` varchar(100) NOT NULL,
  `VILLE` varchar(50) NOT NULL,
  `NBRSALLES` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Table des cinémas';

--
-- Contenu de la table `cinema`
--

INSERT INTO `cinema` (`ID_INCREMENTAL`, `IDCINEMA`, `IDGESTIONNAIRE`, `NOMCINEMA`, `VILLE`, `NBRSALLES`) VALUES
(4, 'ali-cinema ali-20', 'ali', 'cinema ali', 'Montreal', 6),
(1, 'ali-montreuil-65', 'ali', 'montreuil', 'ottawa', 17),
(2, 'ali-pop-51', 'ali', 'pop', 'mm', 5),
(3, 'brain-fofo-11', 'brain', 'fofo', 'vanco', 11);

-- --------------------------------------------------------

--
-- Structure de la table `film`
--

CREATE TABLE `film` (
  `ID_INCREMENTAL` int(11) NOT NULL,
  `CODEFILM` varchar(100) NOT NULL,
  `GENRE` varchar(150) NOT NULL,
  `TITRE` varchar(150) NOT NULL,
  `REALISATEUR` varchar(100) NOT NULL,
  `ACTEURS` varchar(150) NOT NULL,
  `DESCRIPTION` varchar(255) NOT NULL,
  `AFFICHE` varchar(200) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `film`
--

INSERT INTO `film` (`ID_INCREMENTAL`, `CODEFILM`, `GENRE`, `TITRE`, `REALISATEUR`, `ACTEURS`, `DESCRIPTION`, `AFFICHE`) VALUES
(1, 'fdfff-ffff-fff64', 'Drame ', 'fdfff', 'ffff', 'fff', 'fffff', 'test454.jpg'),
(2, 'iiiii-iiiii-iiiii98', 'Aventure ', 'iiiii', 'iiiii', 'iiiii', 'iiiiiii', 'iiiii-iiiii-iiiii98.jpg'),
(3, 'yoooo-yooo-yoooo9', 'Thriller ', 'yoooo', 'yooo', 'yoooo', 'yooooo', 'yoooo-yooo-yoooo9.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `projection`
--

CREATE TABLE `projection` (
  `ID_INCREMENTAL` int(11) NOT NULL,
  `CODEPROJECTION` varchar(100) NOT NULL,
  `CODEFILM` varchar(100) NOT NULL,
  `CODECINEMA` varchar(100) NOT NULL,
  `NUMSALLE` int(2) NOT NULL,
  `SEANCE` varchar(100) NOT NULL,
  `DU` date NOT NULL,
  `AU` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `projection`
--

INSERT INTO `projection` (`ID_INCREMENTAL`, `CODEPROJECTION`, `CODEFILM`, `CODECINEMA`, `NUMSALLE`, `SEANCE`, `DU`, `AU`) VALUES
(1, 'fdfff-ffff-fff64-10-2017-11-01-2017-11-30', 'fdfff-ffff-fff64', 'montreuil', 10, 'S3 ', '2017-11-01', '2017-11-30'),
(2, 'lefilm-lerealisateur-les acteurs91-2-2017-11-03-2017-11-24', 'lefilm-lerealisateur-les acteurs91', 'montreuil', 2, 'S2 ', '2017-11-03', '2017-11-24'),
(3, 'iiiii-iiiii-iiiii98-2-2017-11-02-2017-11-10', 'iiiii-iiiii-iiiii98', 'cinema ali', 2, 'S3 ', '2017-11-02', '2017-11-10'),
(4, 'yoooo-yooo-yoooo9-1-2017-11-08-2017-11-24', 'yoooo-yooo-yoooo9', 'cinema ali', 1, 'S2 ', '2017-11-08', '2017-11-24');

-- --------------------------------------------------------

--
-- Structure de la table `seances`
--

CREATE TABLE `seances` (
  `IDSEANCE` varchar(6) NOT NULL,
  `LIBELLE` varchar(150) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `seances`
--

INSERT INTO `seances` (`IDSEANCE`, `LIBELLE`) VALUES
('S1', '14h-17h Semaine'),
('S2', '16h-19h Semaine'),
('S3', '18h-21h Semaine'),
('S4', '20h-23h Semaine'),
('S5', '22h-01h Semaine'),
('W1', '10h-13h weekend'),
('W2', '12h-15h weekend');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `ID_INCREMENTAL` int(11) NOT NULL,
  `IDENTIFIANT` varchar(100) NOT NULL,
  `MOTDEPASSE` varchar(250) NOT NULL,
  `NOM` varchar(100) NOT NULL,
  `PRENOM` varchar(100) NOT NULL,
  `COURRIEL` varchar(100) NOT NULL,
  `TEL` varchar(20) DEFAULT NULL,
  `TYPE` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `user`
--

INSERT INTO `user` (`ID_INCREMENTAL`, `IDENTIFIANT`, `MOTDEPASSE`, `NOM`, `PRENOM`, `COURRIEL`, `TEL`, `TYPE`) VALUES
(1, 'ali', '86318e52f5ed4801abe1d13d509443de', 'ali', 'ali', 'ali@yahoo.fr', 'null', 'gestionnaire'),
(3, 'bob', '9f9d51bc70ef21ca5c14f307980a29d8', 'bob', 'bob', 'bob@bob.ca', 'null', 'visiteur'),
(4, 'brain', '8b373710bcf876edd91f281e50ed58ab', 'brain', 'brain', 'brain@b', 'null', 'gestionnaire'),
(2, 'gali', '2d08d56c51e49b53cc75f59078e44b1a', 'gali', 'gali', 'gali@galié.com', 'null', 'visiteur'),
(5, 'p', '83878c91171338902e0fe0fb97a8c47a', 'p', 'p', 'p@p', 'null', 'visiteur');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `cinema`
--
ALTER TABLE `cinema`
  ADD PRIMARY KEY (`IDCINEMA`),
  ADD UNIQUE KEY `incrementeCinema` (`ID_INCREMENTAL`) USING BTREE,
  ADD KEY `cleEtrangere` (`IDGESTIONNAIRE`);

--
-- Index pour la table `film`
--
ALTER TABLE `film`
  ADD PRIMARY KEY (`CODEFILM`),
  ADD KEY `IncrementFilms` (`ID_INCREMENTAL`);

--
-- Index pour la table `projection`
--
ALTER TABLE `projection`
  ADD PRIMARY KEY (`CODEPROJECTION`),
  ADD UNIQUE KEY `cleEtrangereFilm` (`CODEFILM`) USING BTREE,
  ADD KEY `incrementeProjection` (`ID_INCREMENTAL`),
  ADD KEY `cleEtrangereCinema` (`CODECINEMA`) USING BTREE;

--
-- Index pour la table `seances`
--
ALTER TABLE `seances`
  ADD PRIMARY KEY (`IDSEANCE`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`IDENTIFIANT`),
  ADD UNIQUE KEY `incrementeUer` (`ID_INCREMENTAL`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `cinema`
--
ALTER TABLE `cinema`
  MODIFY `ID_INCREMENTAL` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `film`
--
ALTER TABLE `film`
  MODIFY `ID_INCREMENTAL` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `projection`
--
ALTER TABLE `projection`
  MODIFY `ID_INCREMENTAL` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `ID_INCREMENTAL` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
