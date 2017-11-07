-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Mar 07 Novembre 2017 à 14:57
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
(10, 'boss-Cinema du boss-35', 'boss', 'Cinema du boss', 'Trois Rivieres', 3),
(3, 'dris-Cinema 7em Art-90', 'dris', 'Cinema 7em Art', 'Longueil', 6),
(1, 'dris-Cinema Collise-77', 'dris', 'Cinema Collise', 'Montreal', 7),
(2, 'dris-Cinema Megarama-5', 'dris', 'Cinema Megarama', 'Saint-Hubert', 5),
(7, 'francis-Cinema Beaubien-7', 'francis', 'Cinema Beaubien', 'Montreal', 3),
(8, 'francis-Cinema Francoeur-43', 'francis', 'Cinema Francoeur', 'Laval', 5),
(9, 'francis-Cinema Guazzi-35', 'francis', 'Cinema Guazzi', 'Quebec', 3);

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
(1, 'Transformers-Micheal Bay-Shia Lebeuf, Lionel Messi50', 'Action ', 'Transformers', 'Micheal Bay', 'Shia Lebeuf, Lionel Messi', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum ac pharetra libero. Integer in suscipit diam, sit amet eleifend nunc. Curabitur egestas nunc nulla, in aliquet risus efficitur quis. Vivamus facilisis est libero, vitae iaculis nulla cur', 'Transformers-Micheal Bay-Shia Lebeuf, Lionel Messi50.jpg'),
(2, 'Atlantis-Steven Spielberg-Tom cruise, Monica Belluchi9', 'Aventure ', 'Atlantis', 'Steven Spielberg', 'Tom cruise, Monica Belluchi', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum ac pharetra libero. Integer in suscipit diam, sit amet eleifend nunc. Curabitur egestas nunc nulla, in aliquet risus efficitur quis. Vivamus facilisis est libero, vitae iaculis nulla cur', 'Atlantis-Steven Spielberg-Tom cruise, Monica Belluchi9.jpg'),
(3, 'Rogue one-Tarantino-Acteur cÃ©lÃ¨bre, autre actrice90', 'Action Aventure ', 'Rogue one', 'Tarantino', 'Acteur cÃ©lÃ¨bre, autre actrice', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum ac pharetra libero. Integer in suscipit diam, sit amet eleifend nunc. Curabitur egestas nunc nulla, in aliquet risus efficitur quis. Vivamus facilisis est libero, vitae iaculis nulla cur', 'Rogue one-Tarantino-Acteur cÃ©lÃ¨bre, autre actrice90.jpg'),
(4, 'Hysteria-Steven Spielberg-Un bon acteur, une actrice talentueuse64', 'Drame ', 'Hysteria', 'Steven Spielberg', 'Un bon acteur, une actrice talentueuse', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum ac pharetra libero. Integer in suscipit diam, sit amet eleifend nunc. Curabitur egestas nunc nulla, in aliquet risus efficitur quis. Vivamus facilisis est libero, vitae iaculis nulla cur', 'Hysteria-Steven Spielberg-Un bon acteur, une actrice talentueuse64.jpg'),
(5, 'Marcheurs du grand nord-Jean Jaques Lavalle -Jean jacques Christophe, Samantha Hupert34', 'Drame ', 'Marcheurs du grand nord', 'Jean Jaques Lavalle ', 'Jean jacques Christophe, Samantha Hupert', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum ac pharetra libero. Integer in suscipit diam, sit amet eleifend nunc. Curabitur egestas nunc nulla, in aliquet risus efficitur quis. Vivamus facilisis est libero, vitae iaculis nulla cur', 'Marcheurs du grand nord-Jean Jaques Lavalle -Jean jacques Christophe, Samantha Hupert34.jpg'),
(6, 'Sinistre-Realisateur Louche-Acteur effrayant, actrice effrayante81', 'Horreur ', 'Sinistre', 'Realisateur Louche', 'Acteur effrayant, actrice effrayante', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum ac pharetra libero. Integer in suscipit diam, sit amet eleifend nunc. Curabitur egestas nunc nulla, in aliquet risus efficitur quis. Vivamus facilisis est libero, vitae iaculis nulla cur', 'Sinistre-Realisateur Louche-Acteur effrayant, actrice effrayante81.jpg'),
(7, 'Dark night-Nick Nolan-Bale, Ronaldo89', 'Action Aventure ', 'Dark night', 'Nick Nolan', 'Bale, Ronaldo', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum ac pharetra libero. Integer in suscipit diam, sit amet eleifend nunc. Curabitur egestas nunc nulla, in aliquet risus efficitur quis. Vivamus facilisis est libero, vitae iaculis nulla cur', 'Dark night-Nick Nolan-Bale, Ronaldo89.jpg'),
(8, 'Dark night-Nick Nolan-Bale, Ronaldo30', 'Action Aventure ', 'Dark night', 'Nick Nolan', 'Bale, Ronaldo', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum ac pharetra libero. Integer in suscipit diam, sit amet eleifend nunc. Curabitur egestas nunc nulla, in aliquet risus efficitur quis. Vivamus facilisis est libero, vitae iaculis nulla cur', 'Dark night-Nick Nolan-Bale, Ronaldo30.jpg'),
(9, 'London-Alexssandro Ulala-Alexis Le Grand46', 'Drame ', 'London', 'Alexssandro Ulala', 'Alexis Le Grand', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum ac pharetra libero. Integer in suscipit diam, sit amet eleifend nunc. Curabitur egestas nunc nulla, in aliquet risus efficitur quis. Vivamus facilisis est libero, vitae iaculis nulla cur', 'London-Alexssandro Ulala-Alexis Le Grand46.jpg'),
(10, 'The cabin-Alain Le Cabiet -Rachelle Medina39', 'Horreur', 'The cabin', 'Alain Le Cabiet ', 'Rachelle Medina', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum ac pharetra libero. Integer in suscipit diam, sit amet eleifend nunc. Curabitur egestas nunc nulla, in aliquet risus efficitur quis. Vivamus facilisis est libero, vitae iaculis nulla cur', 'The cabin-Alain Le Cabiet -Rachelle Medina39.jpg'),
(22, 'Life of pi-Yang Lee-Amita Piscine', 'Aventure ', 'Life of pi', 'Yang Lee', 'Amita Piscine', 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.', 'Life of pi-Yang Lee-Amita Piscine.jpg'),
(21, 'Le Hobbit-Peter Jakson-Freudo le hobbit', 'Aventure ', 'Le Hobbit', 'Peter Jakson', 'Freudo le hobbit', 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.', 'Le Hobbit-Peter Jakson-Freudo le hobbit.jpg'),
(20, 'Breathless-Pataya-Pataya Patate', 'Romance ', 'Breathless', 'Pataya', 'Pataya Patate', 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.', 'Breathless-Pataya-Pataya Patate.jpg'),
(19, 'Les Expendables-Le Réalisateur-Un acteur, Une actrice', 'Aventure ', 'Les Expendables', 'Le Réalisateur', 'Un acteur, Une actrice', 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.', 'Les Expendables-Le Réalisateur-Un acteur, Une actrice.jpg'),
(15, 'Le Livre De La Jungle-Baguera-Baguera, Maougli4', 'Aventure Animation ', 'Le Livre De La Jungle', 'Baguera', 'Baguera, Maougli', 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.', 'Le Livre De La Jungle-Baguera-Baguera, Maougli4.jpg'),
(16, 'Le Livre De La Jungle-Baguera-Baguera, Maougli', 'Aventure Animation', 'Le Livre De La Jungle', 'Baguera', 'Baguera, Maougli', 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.', 'Le Livre De La Jungle-Baguera-Baguera, Maougli.jpg'),
(17, 'Oblivion-Trudeau-Trudeau Fils, tom cruise', 'Action ', 'Oblivion', 'Trudeau', 'Trudeau Fils, tom cruise', 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.', 'Oblivion-Trudeau-Trudeau Fils, tom cruise.jpg'),
(18, 'Sacred Montain-Ulula Mutumba-Yanick Mabeme', 'Action Aventure ', 'Sacred Montain', 'Ulula Mutumba', 'Yanick Mabeme', 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.', 'Sacred Montain-Ulula Mutumba-Yanick Mabeme.jpg'),
(23, 'Inception-Nollan-DiCaprio', 'Action Thriller ', 'Inception', 'Nollan', 'DiCaprio', 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.', 'Inception-Nollan-DiCaprio.jpg'),
(24, 'Les marchands du nord-Le Marchand-Les marchands', 'Aventure Drame ', 'Les marchands du nord', 'Le Marchand', 'Les marchands', 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.', 'Les marchands du nord-Le Marchand-Les marchands.jpg');

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
(1, 'Transformers-Micheal Bay-Shia Lebeuf, Lionel Messi50-3-2017-11-01-2018-01-31', 'Transformers-Micheal Bay-Shia Lebeuf, Lionel Messi50', 'Cinema Collise', 3, '18h-21h Semaine', '2017-11-01', '2018-01-31'),
(2, 'Atlantis-Steven Spielberg-Tom cruise, Monica Belluchi9-4-2017-11-01-2017-12-31', 'Atlantis-Steven Spielberg-Tom cruise, Monica Belluchi9', 'Cinema 7em Art', 4, '16h-19h Semaine', '2017-11-01', '2017-12-31'),
(3, 'Rogue one-Tarantino-Acteur cÃ©lÃ¨bre, autre actrice90-3-2017-11-15-2018-01-15', 'Rogue one-Tarantino-Acteur cÃ©lÃ¨bre, autre actrice90', 'Cinema Collise', 3, '22h-01h Semaine 12h-15h Weekend', '2017-11-15', '2018-01-15'),
(4, 'Hysteria-Steven Spielberg-Un bon acteur, une actrice talentueuse64-4-2017-11-01-2018-01-31', 'Hysteria-Steven Spielberg-Un bon acteur, une actrice talentueuse64', 'Cinema Megarama', 4, '16h-19h Semaine 20h-23h Semaine', '2017-11-01', '2018-01-31'),
(5, 'Sinistre-Realisateur Louche-Acteur effrayant, actrice effrayante81-2-2017-11-01-2018-01-31', 'Sinistre-Realisateur Louche-Acteur effrayant, actrice effrayante81', 'Cinema Beaubien', 2, '22h-01h Semaine', '2017-11-01', '2018-01-31'),
(6, 'Dark night-Nick Nolan-Bale, Ronaldo89-3-2017-11-01-2018-01-31', 'Dark night-Nick Nolan-Bale, Ronaldo89', 'Cinema Francoeur', 3, '18h-21h Semaine', '2017-11-01', '2018-01-31'),
(7, 'Dark night-Nick Nolan-Bale, Ronaldo30-1-2017-11-01-2018-01-31', 'Dark night-Nick Nolan-Bale, Ronaldo30', 'Cinema Francoeur', 1, '16h-19h Semaine', '2017-11-01', '2018-01-31'),
(8, 'London-Alexssandro Ulala-Alexis Le Grand46-2-2017-11-01-2018-01-31', 'London-Alexssandro Ulala-Alexis Le Grand46', 'Cinema Francoeur', 2, '16h-19h Semaine 12h-15h Weekend', '2017-11-01', '2018-01-31'),
(9, 'The cabin-Alain Le Cabiet -Rachelle Medina39-3-2017-11-01-2018-01-31', 'The cabin-Alain Le Cabiet -Rachelle Medina39', 'Cinema Beaubien', 3, '22h-01h Semaine', '2017-11-01', '2018-01-31'),
(10, 'Resident Evil-Mila Yankovich-Mila Jovovich73-4-2017-11-15-2018-01-31', 'Resident Evil-Mila Yankovich-Mila Jovovich73', 'Cinema Megarama', 4, '16h-19h Semaine', '2017-11-15', '2018-01-31'),
(11, 'Resident Evil-Mila Yankovich-Mila Jovovich23-3-2017-11-15-2018-02-28', 'Resident Evil-Mila Yankovich-Mila Jovovich23', 'Cinema 7em Art', 3, '22h-01h Semaine 20h-23h Semaine', '2017-11-15', '2018-02-28'),
(12, 'Oblivion-Tom Cruise-Tom Cruise, Julia Roberts92-4-2017-11-01-2018-02-28', 'Oblivion-Tom Cruise-Tom Cruise, Julia Roberts92', 'Cinema 7em Art', 4, '22h-01h Semaine', '2017-11-01', '2018-02-28'),
(13, 'Thheb-Alexssandro Ulala-Alexis Le Grand89-2-2017-11-01-2018-01-31', 'Thheb-Alexssandro Ulala-Alexis Le Grand89', 'Cinema Megarama', 2, '18h-21h Semaine', '2017-11-01', '2018-01-31'),
(14, 'Le Livre De La Jungle-Baguera-Baguera, Maougli4-2-2017-11-01-2018-02-28', 'Le Livre De La Jungle-Baguera-Baguera, Maougli4', 'Cinema 7em Art', 2, '14h-17h Semaine 12h-15h Weekend', '2017-11-01', '2018-02-28'),
(15, 'Le Livre De La Jungle-Baguera-Baguera, Maougli-2-2017-11-01-2018-01-30', 'Le Livre De La Jungle-Baguera-Baguera, Maougli', 'Cinema Collise', 2, '14h-17h Semaine 12h-15h Weekend', '2017-11-01', '2018-01-30'),
(16, 'Oblivion-Trudeau-Trudeau Fils, tom cruise-Cinema Collise-3-2017-11-01-2018-01-30', 'Oblivion-Trudeau-Trudeau Fils, tom cruise', 'Cinema Collise', 3, '20h-23h Semaine 22h-01h Semaine ', '2017-11-01', '2018-01-30'),
(17, 'Sacred Montain-Ulula Mutumba-Yanick Mabeme-Cinema 7em Art-2-2017-11-10-2017-12-30', 'Sacred Montain-Ulula Mutumba-Yanick Mabeme', 'Cinema 7em Art', 2, '18h-21h Semaine 10h-13h Weekend ', '2017-11-10', '2017-12-30'),
(18, 'Les Expendables-Le Réalisateur-Un acteur, Une actrice-Cinema Collise-3-2017-11-09-2017-11-23', 'Les Expendables-Le Réalisateur-Un acteur, Une actrice', 'Cinema Collise', 3, '18h-21h Semaine ', '2017-11-09', '2017-11-23'),
(19, 'Breathless-Pataya-Pataya Patate-Cinema Guazzi-1-2017-11-17-2017-12-22', 'Breathless-Pataya-Pataya Patate', 'Cinema Guazzi', 1, '16h-19h Semaine ', '2017-11-17', '2017-12-22'),
(20, 'Le Hobbit-Peter Jakson-Freudo le hobbit-Cinema du boss-2-2017-11-10-2017-11-21', 'Le Hobbit-Peter Jakson-Freudo le hobbit', 'Cinema du boss', 2, '16h-19h Semaine ', '2017-11-10', '2017-11-21'),
(21, 'Life of pi-Yang Lee-Amita Piscine-Cinema 7em Art-2-2017-11-01-2018-01-30', 'Life of pi-Yang Lee-Amita Piscine', 'Cinema 7em Art', 2, '18h-21h Semaine ', '2017-11-01', '2018-01-30'),
(22, 'Inception-Nollan-DiCaprio-Cinema du boss-2-2017-11-01-2018-01-30', 'Inception-Nollan-DiCaprio', 'Cinema du boss', 2, '16h-19h Semaine ', '2017-11-01', '2018-01-30'),
(23, 'Les marchands du nord-Le Marchand-Les marchands-Cinema du boss-3-2017-11-01-2017-12-30', 'Les marchands du nord-Le Marchand-Les marchands', 'Cinema du boss', 3, '16h-19h Semaine 18h-21h Semaine ', '2017-11-01', '2017-12-30');

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
(4, 'ali', '86318e52f5ed4801abe1d13d509443de', 'ali', 'ali', 'ali@ali', 'null', 'visiteur'),
(3, 'bob', '9f9d51bc70ef21ca5c14f307980a29d8', 'bob', 'bob', 'bob@bob', 'null', 'visiteur'),
(7, 'boss', 'ceb8447cc4ab78d2ec34cd9f11e4bed2', 'grand', 'boss', 'boss@boss', 'null', 'gestionnaire'),
(1, 'dris', '2b29d08e383ff4cd8a2b6b226ce37e38', 'dris', 'dris', 'dris@dris.com', 'null', 'gestionnaire'),
(2, 'francis', 'd0ab7fe6c314f4fe5b6c18a0157c96b4', 'francis', 'francis', 'francis@francis', 'null', 'gestionnaire'),
(5, 'peter', '51dc30ddc473d43a6011e9ebba6ca770', 'peter', 'peter', 'peter@yahoo.fr', 'null', 'visiteur'),
(6, 'younes', '083af24243207a87b587d00e12cc30ca', 'Younes', 'Younes', 'younes@fr', 'null', 'visiteur');

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
  MODIFY `ID_INCREMENTAL` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT pour la table `film`
--
ALTER TABLE `film`
  MODIFY `ID_INCREMENTAL` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT pour la table `projection`
--
ALTER TABLE `projection`
  MODIFY `ID_INCREMENTAL` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `ID_INCREMENTAL` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
