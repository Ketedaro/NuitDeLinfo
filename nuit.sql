-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Jeu 01 Décembre 2016 à 23:09
-- Version du serveur :  5.7.14
-- Version de PHP :  5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `nuit`
--

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
  `Description` varchar(255) CHARACTER SET utf8 NOT NULL,
  `lattitude` varchar(255) CHARACTER SET utf8 NOT NULL,
  `longitude` varchar(255) CHARACTER SET utf8 NOT NULL,
  `Code Postal` int(11) NOT NULL,
  `Type_Endroit` varchar(30) CHARACTER SET utf8 NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

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
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `idUser` int(11) NOT NULL,
  `firstNameUser` varchar(255) NOT NULL,
  `lastNameUser` varchar(255) NOT NULL,
  `suscribeDateUser` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `email` varchar(255) NOT NULL,
  `type_user` enum('Refugie','Association') DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE `Propose` (
  `idUser` int(11) NOT NULL,
  `IdEndroit` int(11) NOT NULL

) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE `aime` (
  `idUser` int(11) NOT NULL,
  `IdEndroit` int(11) NOT NULL,
  `aime` BOOLEAN DEFAULT NULL

) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE `Messages` (
  `idMess` int(11) NOT NULL,
  `contenu_mess` varchar(255) NOT NULL,
    `idUser` int(11) NOT NULL,
  `recu` BOOLEAN DEFAULT NULL

) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE `Blague` (
  `idBlague` int(11) NOT NULL,
  `contenu_blague` varchar(255) NOT NULL

) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE `Reponse` (
  `idRep` int(11) NOT NULL,
  `contenu_Rep` varchar(255) NOT NULL,
  `idBlague` int(11) NOT NULL
  

) ENGINE=MyISAM DEFAULT CHARSET=utf8;

ALTER TABLE `Propose`
  ADD PRIMARY KEY (`idUser`,`IdEndroit`);
  
  ALTER TABLE `aime`
  ADD PRIMARY KEY (`idUser`,`IdEndroit`);

  ALTER TABLE `Messages`
  ADD PRIMARY KEY (`idMess`);
  
    ALTER TABLE `Blague`
  ADD PRIMARY KEY (`idBlague`);
  
    ALTER TABLE `Reponse`
  ADD PRIMARY KEY (`idRep`);
  
    
  ALTER TABLE `Messages`
ADD CONSTRAINT FK_Id_Messages_ID
FOREIGN KEY (idUser)
REFERENCES users(idUser);
  
  ALTER TABLE Reponse
ADD CONSTRAINT FK_Id_Blague_reponse
FOREIGN KEY (idBlague)
REFERENCES Blague(idBlague);
  
ALTER TABLE Propose
ADD CONSTRAINT FK_Id_User_propose
FOREIGN KEY (idUser)
REFERENCES users(idUser);

ALTER TABLE Propose
ADD CONSTRAINT FK_Id_Endroit_propose
FOREIGN KEY (idEndroit)
REFERENCES endroit(id_endroit);



--
-- Contenu de la table `users`
--

INSERT INTO `users` (`idUser`, `firstNameUser`, `lastNameUser`, `suscribeDateUser`, `email`, `type_user`) VALUES
(1, 'Mic', 'Dema', '2016-11-30 21:33:54', '', 'Association'),
(2, 'Paul', 'Albert', '2016-11-30 21:33:54', '', NULL),
(3, 'Jeanne', 'Rousse', '2016-12-01 10:33:05', '', NULL),
(4, 'Eddy', 'Malou', '2016-12-01 11:14:02', '', NULL);

--
-- Index pour les tables exportées
--

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
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`idUser`);

--
-- AUTO_INCREMENT pour les tables exportées
--

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
-- AUTO_INCREMENT pour la table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `idPurchase` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT pour la table `refund`
--
ALTER TABLE `refund`
  MODIFY `idRefund` int(11) NOT NULL AUTO_INCREMENT;
  
  ALTER TABLE `Messages`
  MODIFY `idMess` int(11) NOT NULL AUTO_INCREMENT;
  
    ALTER TABLE `Blague`
  MODIFY `idBlague` int(11) NOT NULL AUTO_INCREMENT;
  
    ALTER TABLE `Reponse`
  MODIFY `idRep` int(11) NOT NULL AUTO_INCREMENT;
  ALTER TABLE `endroit`
  MODIFY `id_endroit` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `idUser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
