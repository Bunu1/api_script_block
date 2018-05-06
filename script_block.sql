-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  Dim 06 mai 2018 à 18:17
-- Version du serveur :  5.7.21
-- Version de PHP :  5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `script_block`
--

-- --------------------------------------------------------

--
-- Structure de la table `argument`
--

DROP TABLE IF EXISTS `argument`;
CREATE TABLE IF NOT EXISTS `argument` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` varchar(100) NOT NULL,
  `type` int(11) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

DROP TABLE IF EXISTS `article`;
CREATE TABLE IF NOT EXISTS `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `available` int(11) NOT NULL DEFAULT '1',
  `date_add` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_user` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `article`
--

INSERT INTO `article` (`id`, `subject`, `content`, `available`, `date_add`, `id_user`) VALUES
(4, 'hazhaha', 'tyfyukghdfuihgjodthjodrdd', 1, '2018-05-06 14:37:48', 1),
(5, 'bite', 'tyfyukghdfuihgjodthjodrdd', 1, '2018-05-06 14:37:48', 1);

-- --------------------------------------------------------

--
-- Structure de la table `block`
--

DROP TABLE IF EXISTS `block`;
CREATE TABLE IF NOT EXISTS `block` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `block_argument`
--

DROP TABLE IF EXISTS `block_argument`;
CREATE TABLE IF NOT EXISTS `block_argument` (
  `id_block` int(11) NOT NULL,
  `id_argument` int(11) NOT NULL,
  `pre_option` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `block_instruction`
--

DROP TABLE IF EXISTS `block_instruction`;
CREATE TABLE IF NOT EXISTS `block_instruction` (
  `id_code_block` int(11) NOT NULL,
  `id_instruction` int(11) NOT NULL,
  `pos` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `code_block`
--

DROP TABLE IF EXISTS `code_block`;
CREATE TABLE IF NOT EXISTS `code_block` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `platform` varchar(100) NOT NULL,
  `description` varchar(255) NOT NULL,
  `id_block` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `instruction`
--

DROP TABLE IF EXISTS `instruction`;
CREATE TABLE IF NOT EXISTS `instruction` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `syntax` text NOT NULL,
  `type` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `script`
--

DROP TABLE IF EXISTS `script`;
CREATE TABLE IF NOT EXISTS `script` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL DEFAULT 'clean',
  `size` int(11) NOT NULL,
  `downloads_count` int(11) NOT NULL DEFAULT '0',
  `date_crea` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_user` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_user` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `script`
--

INSERT INTO `script` (`id`, `name`, `description`, `category`, `size`, `downloads_count`, `date_crea`, `id_user`) VALUES
(5, 'test', 'un bon test', 'clean', 50, 0, '2018-05-06 12:51:21', 1);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(100) NOT NULL,
  `date_insc` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `rank` int(11) NOT NULL,
  `active` int(11) NOT NULL,
  `enabled` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password`, `date_insc`, `rank`, `active`, `enabled`) VALUES
(1, 'bunu', 'bunu@nu.bu', 'bunu', '2018-05-06 13:37:08', 1, 1, 1);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `script`
--
ALTER TABLE `script`
  ADD CONSTRAINT `script_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
