SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

DROP DATABASE `zumbi`;
CREATE DATABASE IF NOT EXISTS `zumbi` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `zumbi`;

DROP TABLE IF EXISTS `access`;
CREATE TABLE `access` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REQUEST` varchar(200) NOT NULL,
  `METHOD` varchar(12) NOT NULL,
  `REMOTE` varchar(200) NOT NULL,
  `AGENT` varchar(300) NOT NULL,
  `ACCEPT` varchar(200) NOT NULL,
  `ENCODING` varchar(200) NOT NULL,
  `LANGUAGE` varchar(200) NOT NULL,
  `IDATE` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID` (`ID`,`IDATE`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `erp_usuarios`;
CREATE TABLE `erp_usuarios` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `primeiro_nome` varchar(45) CHARACTER SET latin1 NOT NULL,
  `segundo_nome` varchar(45) CHARACTER SET latin1 NOT NULL,
  `email` varchar(100) CHARACTER SET latin1 NOT NULL,
  `senha` varchar(60) CHARACTER SET latin1 NOT NULL,
  `criado` datetime NOT NULL,
  `modificado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ativo` bit(1) NOT NULL DEFAULT b'1',
  `status` varchar(20) CHARACTER SET latin1 NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_email` (`email`),
  KEY `key_email` (`email`) COMMENT '  ',
  KEY `key_senha` (`senha`),
  KEY `key_ativo` (`ativo`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `groups`;
CREATE TABLE `groups` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `PAR` int(11) NOT NULL DEFAULT '0',
  `STATUS` tinyint(1) NOT NULL DEFAULT '1',
  `NAME` varchar(200) NOT NULL,
  `ABOUT` text NOT NULL,
  PRIMARY KEY (`ID`,`PAR`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Groups defines';

DROP TABLE IF EXISTS `messages`;
CREATE TABLE `messages` (
  `ID` double NOT NULL AUTO_INCREMENT,
  `DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `FROM` int(11) NOT NULL,
  `TO_GROUP` int(11) DEFAULT '0',
  `TO_USER` int(11) DEFAULT '0',
  `TYPE` enum('msg','img','file') NOT NULL DEFAULT 'msg' COMMENT 'types: msg/img/file',
  `CONTENT` text NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Messages data';

DROP TABLE IF EXISTS `user_group`;
CREATE TABLE `user_group` (
  `USER` int(11) NOT NULL,
  `GROUP` int(11) NOT NULL,
  `LASTMSG` double NOT NULL,
  `LASTDATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY `USER` (`USER`,`GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='User in groups';

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `ID` int(11) NOT NULL COMMENT 'ID from erp_usuarios',
  `NAME` varchar(200) NOT NULL COMMENT 'erp_usuarios: nome + sobrenome',
  `SKEY` varchar(200) NOT NULL COMMENT 'generated assincrono key = email+senha',
  `LAST` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'date of last sending msg  ',
  UNIQUE KEY `ID` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
