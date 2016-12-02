-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Ven 02 Décembre 2016 à 04:57
-- Version du serveur :  5.7.14
-- Version de PHP :  5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `refugies`
--

-- --------------------------------------------------------

--
-- Structure de la table `aime`
--

CREATE TABLE `aime` (
  `idUser` int(11) NOT NULL,
  `IdEndroit` int(11) NOT NULL,
  `aime` tinyint(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `blague`
--

CREATE TABLE `blague` (
  `idBlague` int(11) NOT NULL,
  `contenu_blague` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `blague`
--

INSERT INTO `blague` (`idBlague`, `contenu_blague`) VALUES
(0, 'Why do witches have brooms?\r\nBecause vacuum cleaners are too heavy.'),
(1, 'How do you cut the ocean in half?\r\nWith a see-saw.\r\n'),
(2, 'Why do cows have bells?\r\nBecause  horns don\'t work.'),
(3, ' What starts with P ends with E and has  of letters?\r\nThe Post Office'),
(4, 'How  letters are there in the alphabet?\r\n24 because E.T. went home.');

-- --------------------------------------------------------

--
-- Structure de la table `conscerned_by_purchase`
--

CREATE TABLE `conscerned_by_purchase` (
  `idUser` int(11) NOT NULL,
  `idPurchase` int(11) NOT NULL,
  `percents` tinyint(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `conscerned_by_purchase`
--

INSERT INTO `conscerned_by_purchase` (`idUser`, `idPurchase`, `percents`) VALUES
(1, 17, 50),
(2, 17, 50),
(1, 18, 33),
(2, 18, 33),
(4, 18, 33),
(1, 19, 20),
(2, 19, 40),
(4, 19, 40);

-- --------------------------------------------------------

--
-- Structure de la table `endroit`
--

CREATE TABLE `endroit` (
  `id_endroit` int(11) NOT NULL,
  `Ville` varchar(30) CHARACTER SET utf8 NOT NULL,
  `nom` varchar(255) CHARACTER SET utf8 NOT NULL,
  `Description` varchar(255) CHARACTER SET utf8 NOT NULL,
  `lattitude` varchar(255) CHARACTER SET utf8 NOT NULL,
  `longitude` varchar(255) CHARACTER SET utf8 NOT NULL,
  `adresse` varchar(255) CHARACTER SET utf8 NOT NULL,
  `Code_postal` int(11) NOT NULL,
  `Type_Endroit` varchar(30) CHARACTER SET utf8 NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `endroit`
--

INSERT INTO `endroit` (`id_endroit`, `Ville`, `nom`, `Description`, `lattitude`, `longitude`, `adresse`, `Code Postal`, `Type_Endroit`) VALUES
(1, 'Paris', 'resto du coeur1', 'Restaurant du coeur dans le 11eme arrondissement', '2°23\'06.0"E', '48°51\'06.0"N', '3-5 Rue Cesselin, 75011', 75011, 'Restaurant'),
(2, 'Paris', 'Restaurant du coeur Clichy', 'Restaurant du coeur au coeur de Clichy', '2°19\'47.6"E', '48°52\'46.8"N ', '42 Rue de Clichy', 75009, 'Restaurant'),
(3, 'Marseille', 'Restaurant du Coeur Marseille', 'Restaurant du coeur au deuxieme arrondissement de marseille', '5°22\'09.0"E', '43°18\'12.4"N ', '10 Rue Vincent Leblanc, 13002 Marseille', 13002, 'Restaurant'),
(4, 'Paris', 'Gymnase Michel Lecomte', 'Nous accueillons les réfugiés dans cette periode de grand froid.', '2°21\'22.6"E', '48°51\'44.0"N', '14 Rue Michel le Comte', 75003, ''),
(5, 'Paris', 'U Express Paris Temple', 'Nous donnons des vetements aujourd\'hui.', '2°21\'27.2"E', '48°51\'45.5"N', '109 Rue du Temple', 75003, 'Vetements');

-- --------------------------------------------------------

--
-- Structure de la table `friends`
--

CREATE TABLE `friends` (
  `idFriendship` int(11) NOT NULL,
  `idUser1` int(11) NOT NULL,
  `idUser2` int(11) NOT NULL,
  `dateFriendship` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `debt` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `friends`
--

INSERT INTO `friends` (`idFriendship`, `idUser1`, `idUser2`, `dateFriendship`, `confirmed`, `debt`) VALUES
(1, 1, 2, '2016-11-30 21:34:18', 1, 60),
(2, 4, 1, '2016-12-01 11:14:50', 1, -45);

-- --------------------------------------------------------

--
-- Structure de la table `friend_asks`
--

CREATE TABLE `friend_asks` (
  `idFriendAsk` int(11) NOT NULL,
  `idUser1` int(11) NOT NULL,
  `idUser2` int(11) NOT NULL,
  `firstNameAsk` varchar(255) NOT NULL,
  `lastNameAsk` varchar(255) NOT NULL,
  `viewed` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `friend_asks`
--

INSERT INTO `friend_asks` (`idFriendAsk`, `idUser1`, `idUser2`, `firstNameAsk`, `lastNameAsk`, `viewed`) VALUES
(4, 1, 3, 'Mic', 'Dema', 0),
(5, 3, 1, 'Jeanne', 'Rousse', 0);

-- --------------------------------------------------------

--
-- Structure de la table `groups`
--

CREATE TABLE `groups` (
  `idGroup` int(11) NOT NULL,
  `nameGroup` varchar(255) NOT NULL,
  `creationDateGroup` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `idPropri` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `groups`
--

INSERT INTO `groups` (`idGroup`, `nameGroup`, `creationDateGroup`, `idPropri`) VALUES
(1, 'Vacances 2016', '2016-12-01 10:06:25', 1);

-- --------------------------------------------------------

--
-- Structure de la table `in_group`
--

CREATE TABLE `in_group` (
  `idUser` int(11) NOT NULL,
  `idGroup` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `in_group`
--

INSERT INTO `in_group` (`idUser`, `idGroup`) VALUES
(1, 1),
(2, 1),
(3, 1);

-- --------------------------------------------------------

--
-- Structure de la table `messages`
--

CREATE TABLE `messages` (
  `idMess` int(11) NOT NULL,
  `contenu_mess` varchar(255) NOT NULL,
  `idUser` int(11) NOT NULL,
  `recu` tinyint(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `propose`
--

CREATE TABLE `propose` (
  `idUser` int(11) NOT NULL,
  `IdEndroit` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `purchases`
--

CREATE TABLE `purchases` (
  `idPurchase` int(11) NOT NULL,
  `costPurchase` int(11) NOT NULL,
  `titlePurchase` varchar(255) NOT NULL,
  `detailPurchase` text NOT NULL,
  `datePurchase` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `idPurchaser` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `purchases`
--

INSERT INTO `purchases` (`idPurchase`, `costPurchase`, `titlePurchase`, `detailPurchase`, `datePurchase`, `idPurchaser`) VALUES
(17, 30, 'Super U', 'desc', '2016-12-01 18:26:27', 1),
(19, 100, 'Super U 3', 'desc', '2016-12-01 18:28:47', 1),
(18, 15, 'Super U 2', 'desc', '2016-12-01 18:27:27', 1);

-- --------------------------------------------------------

--
-- Structure de la table `refund`
--

CREATE TABLE `refund` (
  `idRefund` int(11) NOT NULL,
  `idUser1` int(11) NOT NULL,
  `idUser2` int(11) NOT NULL,
  `priceRefund` int(11) NOT NULL,
  `dateRefund` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `acceptedRefund` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `reponse`
--

CREATE TABLE `reponse` (
  `idRep` int(11) NOT NULL,
  `contenu_Rep` varchar(255) NOT NULL,
  `idBlague` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `idUser` int(11) NOT NULL,
  `firstNameUser` varchar(255) DEFAULT NULL,
  `lastNameUser` varchar(255) DEFAULT NULL,
  `Nom_association` varchar(255) DEFAULT NULL,
  `suscribeDateUser` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `type_user` enum('Refugie','Association') DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `users`
--

INSERT INTO `users` (`idUser`, `firstNameUser`, `lastNameUser`, `Nom_association`, `suscribeDateUser`, `email`, `password`, `type_user`) VALUES
(1, 'Mic', 'Dema', NULL, '2016-11-30 21:33:54', '', '', 'Association'),
(2, 'Paul', 'Albert', NULL, '2016-11-30 21:33:54', '', '', NULL),
(3, 'Jeanne', 'Rousse', NULL, '2016-12-01 10:33:05', '', '', NULL),
(4, 'Eddy', 'Malou', NULL, '2016-12-01 11:14:02', '', '', NULL);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `aime`
--
ALTER TABLE `aime`
  ADD PRIMARY KEY (`idUser`,`IdEndroit`);

--
-- Index pour la table `blague`
--
ALTER TABLE `blague`
  ADD PRIMARY KEY (`idBlague`);

--
-- Index pour la table `endroit`
--
ALTER TABLE `endroit`
  ADD PRIMARY KEY (`id_endroit`);

--
-- Index pour la table `friends`
--
ALTER TABLE `friends`
  ADD PRIMARY KEY (`idFriendship`);

--
-- Index pour la table `friend_asks`
--
ALTER TABLE `friend_asks`
  ADD PRIMARY KEY (`idFriendAsk`);

--
-- Index pour la table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`idGroup`);

--
-- Index pour la table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`idMess`),
  ADD KEY `FK_Id_Messages_ID` (`idUser`);

--
-- Index pour la table `propose`
--
ALTER TABLE `propose`
  ADD PRIMARY KEY (`idUser`,`IdEndroit`),
  ADD KEY `FK_Id_Endroit_propose` (`IdEndroit`);

--
-- Index pour la table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`idPurchase`);

--
-- Index pour la table `refund`
--
ALTER TABLE `refund`
  ADD PRIMARY KEY (`idRefund`);

--
-- Index pour la table `reponse`
--
ALTER TABLE `reponse`
  ADD PRIMARY KEY (`idRep`),
  ADD KEY `FK_Id_Blague_reponse` (`idBlague`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`idUser`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `blague`
--
ALTER TABLE `blague`
  MODIFY `idBlague` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT pour la table `endroit`
--
ALTER TABLE `endroit`
  MODIFY `id_endroit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pour la table `friends`
--
ALTER TABLE `friends`
  MODIFY `idFriendship` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `friend_asks`
--
ALTER TABLE `friend_asks`
  MODIFY `idFriendAsk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pour la table `groups`
--
ALTER TABLE `groups`
  MODIFY `idGroup` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `messages`
--
ALTER TABLE `messages`
  MODIFY `idMess` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `idPurchase` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT pour la table `refund`
--
ALTER TABLE `refund`
  MODIFY `idRefund` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `reponse`
--
ALTER TABLE `reponse`
  MODIFY `idRep` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `idUser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
