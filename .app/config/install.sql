SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

CREATE DATABASE IF NOT EXISTS `zumbiex` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `zumbiex`;

DROP TABLE IF EXISTS `access`;
CREATE TABLE IF NOT EXISTS `access` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `erp_usuarios`;
CREATE TABLE IF NOT EXISTS `erp_usuarios` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

INSERT INTO `erp_usuarios` (`id`, `primeiro_nome`, `segundo_nome`, `email`, `senha`, `criado`, `modificado`, `ativo`, `status`) VALUES
(1, 'Bill', 'Rocha', 'paulo.rocha@outlook.com', 'e807f1fcf82d132f9bb018ca6738a19f', '2015-10-10 00:00:00', '2015-10-10 20:10:39', b'1', 'ACTIVE'),
(2, 'Willian', 'Rafael César', 'abul@gmail.com', 'e807f1fcf82d132f9bb018ca6738a19f', '2015-10-10 00:00:00', '2015-10-10 20:10:39', b'1', 'ACTIVE'),
(3, 'Gerber', 'Zurox', 'zurox@outlook.com', 'e807f1fcf82d132f9bb018ca6738a19f', '2015-10-10 00:00:00', '2015-10-10 20:12:12', b'1', 'ACTIVE'),
(4, 'Jefferson', 'dos Santos e Silva', 'jeff_ss@gmail.com', 'e807f1fcf82d132f9bb018ca6738a19f', '2015-10-10 00:00:00', '2015-10-10 20:12:12', b'1', 'ACTIVE'),
(5, 'Marcos', 'Vinícios do Nascimento', 'vini-nascimento@ymail.com', 'e807f1fcf82d132f9bb018ca6738a19f', '2015-10-10 00:00:00', '2015-10-10 20:13:10', b'1', 'DISABLED');

DROP TABLE IF EXISTS `groups`;
CREATE TABLE IF NOT EXISTS `groups` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `PAR` int(11) NOT NULL DEFAULT '0',
  `STATUS` tinyint(1) NOT NULL DEFAULT '1',
  `NAME` varchar(200) NOT NULL,
  `ABOUT` text NOT NULL,
  PRIMARY KEY (`ID`,`PAR`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Groups defines' AUTO_INCREMENT=19 ;

INSERT INTO `groups` (`ID`, `PAR`, `STATUS`, `NAME`, `ABOUT`) VALUES
(1, 0, 1, 'Gerências', 'Grupo de acesso geral as gerências'),
(2, 0, 1, 'Marketing', 'Grupo base do setor de marketing'),
(3, 1, 1, 'Financeiro', 'Departamento financeiro'),
(4, 1, 1, 'Administrativo', 'Gerência administrativa'),
(5, 1, 1, 'Novos Negócios', 'Gerência de Novos Negócios'),
(6, 2, 1, 'Pesquisa', 'Departamento de Pesquisa de Mercado'),
(7, 2, 1, 'Midias Digitais', 'Departamento de gerenciamento de midias digitais'),
(8, 2, 1, 'Produtos', 'Departamento de Marketing a Produtos'),
(9, 0, 1, 'TI', 'Tecnologia da Infomação'),
(10, 9, 1, 'Hardware', 'Equipamentos de TI'),
(11, 9, 1, 'Software', 'Departamento de Software'),
(12, 10, 1, 'CPD', 'Central de processamento de dados'),
(13, 10, 1, 'Rede', 'Rede de dados e conexões'),
(14, 10, 1, 'Manutenção', 'Manetenção de equipamentos de TI'),
(15, 11, 1, 'Desenvolvimento', 'Desenvolvimento de sistemas'),
(16, 11, 1, 'Sistemas', 'Análise de sistemas'),
(17, 11, 1, 'Segurança', 'Análise e desenvolvimento de segurança em TI'),
(18, 11, 1, 'Database', 'Inteligência operacional de base de dados');

DROP TABLE IF EXISTS `messages`;
CREATE TABLE IF NOT EXISTS `messages` (
  `ID` double NOT NULL AUTO_INCREMENT,
  `SENDDATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `IDFROM` int(11) NOT NULL,
  `NAMEFROM` varchar(200) NOT NULL,
  `TOGROUP` int(11) DEFAULT '0',
  `TOUSER` int(11) DEFAULT '0',
  `TYPE` enum('msg','img','file') NOT NULL DEFAULT 'msg' COMMENT 'types: msg/img/file',
  `CONTENT` text NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Messages data' AUTO_INCREMENT=65 ;

INSERT INTO `messages` (`ID`, `SENDDATE`, `IDFROM`, `NAMEFROM`, `TOGROUP`, `TOUSER`, `TYPE`, `CONTENT`) VALUES
(1, '2015-10-13 08:43:44', 1, 'Bill Rocha', 9, 0, 'msg', 'Teste de envio de mensagem para um GRUPO'),
(2, '2015-10-13 08:43:50', 1, 'Bill Rocha', 0, 3, 'msg', 'Teste de envio de mensagem para um determinado USUÁRIO.'),
(3, '2015-10-13 09:15:43', 1, 'Bill Rocha', 16, 0, 'msg', 'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.'),
(4, '2015-10-13 09:01:22', 1, 'Bill Rocha', 16, 0, 'msg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor.'),
(5, '2015-10-13 08:43:58', 1, 'Bill Rocha', 16, 0, 'msg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
(6, '2015-10-13 09:15:09', 1, 'Bill Rocha', 16, 0, 'msg', 'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
(7, '2015-10-13 08:44:04', 1, 'Bill Rocha', 15, 0, 'msg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
(8, '2015-10-13 08:44:06', 1, 'Bill Rocha', 15, 0, 'msg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
(9, '2015-10-17 17:55:03', 1, 'Bill Rocha', 15, 0, 'msg', 'teste'),
(10, '2015-10-17 17:59:40', 4, 'Jefferson dos Santos e Silva', 1, 0, 'msg', 'olá'),
(11, '2015-10-17 18:00:03', 1, 'Bill Rocha', 15, 0, 'msg', 'ttfcdfggh'),
(12, '2015-10-17 18:02:46', 4, 'Jefferson dos Santos e Silva', 1, 0, 'msg', 'ola, de novo'),
(13, '2015-10-17 18:02:56', 1, 'Bill Rocha', 15, 0, 'msg', 'hi'),
(14, '2015-10-17 18:03:07', 4, 'Jefferson dos Santos e Silva', 1, 0, 'msg', 'ok'),
(15, '2015-10-17 18:04:04', 4, 'Jefferson dos Santos e Silva', 1, 0, 'msg', 'ttt'),
(16, '2015-10-17 18:05:01', 1, 'Bill Rocha', 15, 0, 'msg', 'ghg'),
(17, '2015-10-17 18:05:14', 1, 'Bill Rocha', 15, 0, 'msg', 'hhh'),
(18, '2015-10-17 18:05:27', 4, 'Jefferson dos Santos e Silva', 1, 0, 'msg', 'hjjkkk'),
(19, '2015-10-17 18:08:07', 1, 'Bill Rocha', 15, 0, 'msg', 'Estou no canal 15'),
(20, '2015-10-17 18:08:28', 4, 'Jefferson dos Santos e Silva', 1, 0, 'msg', 'Estou no canal 1'),
(21, '2015-10-17 18:08:35', 1, 'Bill Rocha', 15, 0, 'msg', 'ok'),
(22, '2015-10-17 18:08:59', 1, 'Bill Rocha', 15, 0, 'msg', 'ok'),
(23, '2015-10-17 18:09:11', 4, 'Jefferson dos Santos e Silva', 1, 0, 'msg', 'como?'),
(24, '2015-10-17 18:09:28', 4, 'Jefferson dos Santos e Silva', 1, 0, 'msg', 'fala, ai'),
(25, '2015-10-17 18:09:37', 1, 'Bill Rocha', 15, 0, 'msg', 'como assim?:'),
(26, '2015-10-17 18:35:27', 4, 'Jefferson dos Santos e Silva', 1, 0, 'msg', 'sadsad'),
(27, '2015-10-17 18:39:20', 4, 'Jefferson dos Santos e Silva', 1, 0, 'msg', 'teste'),
(28, '2015-10-17 18:40:32', 4, 'Jefferson dos Santos e Silva', 1, 0, 'msg', 'tese'),
(29, '2015-10-17 18:41:47', 1, 'Bill Rocha', 1, 0, 'msg', 'olá'),
(30, '2015-10-17 18:42:00', 4, 'Jefferson dos Santos e Silva', 1, 0, 'msg', 'tudo bem?'),
(31, '2015-10-17 18:42:10', 1, 'Bill Rocha', 1, 0, 'msg', 'ok'),
(32, '2015-10-17 18:42:19', 4, 'Jefferson dos Santos e Silva', 1, 0, 'msg', 'hi'),
(33, '2015-10-17 18:42:27', 1, 'Bill Rocha', 1, 0, 'msg', 'ui'),
(34, '2015-10-17 18:42:41', 4, 'Jefferson dos Santos e Silva', 1, 0, 'msg', 'a\\cxxz\\cxz\\c\\xzc sadd aSDASdAS'),
(35, '2015-10-17 18:44:03', 4, 'Jefferson dos Santos e Silva', 1, 0, 'msg', 'olá'),
(36, '2015-10-17 18:44:11', 1, 'Bill Rocha', 1, 0, 'msg', 'oi'),
(37, '2015-10-17 18:44:22', 4, 'Jefferson dos Santos e Silva', 1, 0, 'msg', 'hime aslkjd  m ksnm'),
(38, '2015-10-17 18:44:26', 4, 'Jefferson dos Santos e Silva', 1, 0, 'msg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. <br/>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. <br/>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. <br/>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
(39, '2015-10-17 18:45:46', 1, 'Bill Rocha', 1, 0, 'msg', 'hello!'),
(40, '2015-10-17 18:46:14', 4, 'Jefferson dos Santos e Silva', 1, 0, 'msg', 'olá, galera!!'),
(41, '2015-10-17 18:47:14', 1, 'Bill Rocha', 1, 0, 'msg', 'hi'),
(42, '2015-10-17 18:47:22', 4, 'Jefferson dos Santos e Silva', 1, 0, 'msg', 'ok'),
(43, '2015-10-17 19:05:10', 4, 'Jefferson dos Santos e Silva', 1, 0, 'msg', 'teste'),
(44, '2015-10-17 19:10:08', 4, 'Jefferson dos Santos e Silva', 1, 0, 'msg', 'sdfdsf'),
(45, '2015-10-17 19:10:14', 1, 'Bill Rocha', 1, 0, 'msg', 'asdsa'),
(46, '2015-10-17 19:35:19', 1, 'Bill Rocha', 1, 0, 'msg', 'fdgbfd'),
(47, '2015-10-17 19:35:33', 1, 'Bill Rocha', 15, 0, 'msg', 'vcbcv'),
(48, '2015-10-17 19:35:54', 1, 'Bill Rocha', 15, 0, 'msg', 'asdsad'),
(49, '2015-10-17 19:36:30', 1, 'Bill Rocha', 15, 0, 'msg', 'dsfsd df'),
(50, '2015-10-17 20:03:59', 1, 'Bill Rocha', 1, 0, 'msg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. <br/>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. <br/>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. <br/>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
(51, '2015-10-17 20:09:04', 1, 'Bill Rocha', 1, 0, 'msg', 'teste'),
(52, '2015-10-17 20:18:39', 1, 'Bill Rocha', 1, 0, 'msg', 'Outro teste'),
(53, '2015-10-17 20:19:41', 2, 'Willian Rafael César', 1, 0, 'msg', 'Hello'),
(54, '2015-10-17 20:26:00', 1, 'Bill Rocha', 1, 0, 'msg', 'olá'),
(55, '2015-10-17 20:28:09', 1, 'Bill Rocha', 1, 0, 'msg', 'dsafdsa dsaf sadf sdaf~pdsj]fçlskda<br/>f'),
(56, '2015-10-17 20:28:11', 1, 'Bill Rocha', 1, 0, 'msg', 'sdakf sda~fkjsdaflsdakflsdkjf~sdkf'),
(57, '2015-10-17 20:28:13', 1, 'Bill Rocha', 1, 0, 'msg', 'dsfdslfknjsdfsdalkfsdaoifhsda'),
(58, '2015-10-17 20:28:15', 1, 'Bill Rocha', 1, 0, 'msg', 'sdahssdidhs sad'),
(59, '2015-10-17 20:33:39', 2, 'Willian Rafael César', 9, 0, 'msg', 'aasd saas dsad'),
(60, '2015-10-17 20:33:40', 2, 'Willian Rafael César', 9, 0, 'msg', 'asd sa'),
(61, '2015-10-17 20:33:41', 2, 'Willian Rafael César', 9, 0, 'msg', 'sad'),
(62, '2015-10-17 20:33:41', 2, 'Willian Rafael César', 9, 0, 'msg', 'd sad sad'),
(63, '2015-10-17 21:19:46', 1, 'Bill Rocha', 15, 0, 'msg', 'xzcxzcxzc'),
(64, '2015-10-17 21:23:55', 1, 'Bill Rocha', 16, 0, 'msg', 'zxczxczx cxzc');

DROP TABLE IF EXISTS `relay`;
CREATE TABLE IF NOT EXISTS `relay` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PID` int(11) NOT NULL,
  `STATUS` int(11) NOT NULL COMMENT '0 = stop, 1 = running, 2 = stoped',
  `SCRIPT` varchar(200) NOT NULL,
  `OWNER` int(11) NOT NULL,
  `IP` varchar(30) NOT NULL,
  `PORT` varchar(6) NOT NULL,
  `CHA_NOW` int(11) NOT NULL,
  `CHA_MAX` int(11) NOT NULL,
  `US_NOW` int(11) NOT NULL,
  `US_MAX` int(11) NOT NULL,
  `ERRORS` int(11) NOT NULL,
  `START` datetime NOT NULL,
  `LAST_UPDATE` datetime NOT NULL,
  PRIMARY KEY (`ID`,`OWNER`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='tabela de relays' AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `ID` int(11) NOT NULL COMMENT 'ID from erp_usuarios',
  `NAME` varchar(200) NOT NULL COMMENT 'erp_usuarios: nome + sobrenome',
  `SKEY` varchar(200) NOT NULL COMMENT 'generated assincrono key = email+senha',
  `LAST` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'date of last sending msg  ',
  UNIQUE KEY `ID` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `users` (`ID`, `NAME`, `SKEY`, `LAST`) VALUES
(1, 'Bill Rocha', 'G4s3UqqnJI257317yjSvxa24SYPRwJ0E@a8sE2nx', '2015-10-18 00:53:31'),
(2, 'Willian Rafael César', '1YI583T6VCU01M0V5mQNUAte1buxDnnB44srw3k2', '2015-10-17 21:02:31'),
(3, 'Gerber Zurox', 's4uEkl7@yDFuOsc@AqTlMo0nvuJGmwRK62FHBlwX', '2015-10-17 20:51:15'),
(4, 'Jefferson dos Santos e Silva', '82V2mL77DgQvAsysK0t7Ek8RxV1s12EFJ2bBY7T3', '2015-10-17 19:16:27'),
(5, 'Marcos Vinícios do Nascimento', '1q7Q6011pPq6@U87yym3U1tbe3SP335K177Wq46p', '2015-10-17 21:03:05');

DROP TABLE IF EXISTS `user_group`;
CREATE TABLE IF NOT EXISTS `user_group` (
  `IDUSER` int(11) NOT NULL,
  `IDGROUP` int(11) NOT NULL,
  `LASTMSG` double NOT NULL,
  `LASTDATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY `USER` (`IDUSER`,`IDGROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='User in groups';

INSERT INTO `user_group` (`IDUSER`, `IDGROUP`, `LASTMSG`, `LASTDATE`) VALUES
(1, 1, 58, '2015-10-17 20:29:30'),
(1, 4, 0, '2015-10-12 21:41:59'),
(1, 9, 62, '2015-10-17 20:58:54'),
(1, 10, 0, '2015-10-12 16:47:12'),
(1, 11, 0, '2015-10-11 00:24:43'),
(1, 13, 0, '2015-10-12 16:46:13'),
(1, 14, 0, '2015-10-12 16:46:13'),
(1, 15, 63, '2015-10-17 21:20:01'),
(1, 16, 64, '2015-10-17 21:24:09'),
(1, 17, 0, '2015-10-12 16:07:00'),
(2, 1, 52, '2015-10-17 20:19:31'),
(2, 3, 0, '2015-10-11 00:24:43'),
(2, 9, 1, '2015-10-17 20:33:32'),
(3, 9, 0, '2015-10-11 00:24:43'),
(3, 10, 0, '2015-10-11 00:24:43'),
(3, 12, 0, '2015-10-11 00:24:43'),
(3, 18, 0, '2015-10-11 00:24:43'),
(4, 1, 45, '2015-10-17 19:11:14'),
(4, 2, 0, '2015-10-11 00:24:43'),
(4, 6, 0, '2015-10-11 00:24:43'),
(4, 7, 0, '2015-10-11 00:24:43'),
(4, 8, 0, '2015-10-11 00:24:43'),
(5, 1, 0, '2015-10-11 00:24:43'),
(5, 5, 0, '2015-10-11 00:24:43');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;