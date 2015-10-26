-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 25-Out-2015 às 05:12
-- Versão do servidor: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `zumbi`
--
CREATE DATABASE IF NOT EXISTS `zumbi` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `zumbi`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `access`
--

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=259 ;

--
-- Extraindo dados da tabela `access`
--

INSERT INTO `access` (`ID`, `REQUEST`, `METHOD`, `REMOTE`, `AGENT`, `ACCEPT`, `ENCODING`, `LANGUAGE`, `IDATE`) VALUES
(1, '/zumbi/', 'GET', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-24 23:01:20'),
(2, '/zumbi/user/checkUser', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-24 23:01:24'),
(3, '/zumbi/', 'GET', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-24 23:01:34'),
(4, '/zumbi/user/checkUser', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-24 23:01:35'),
(5, '/zumbi/user/checkUser', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-24 23:01:21'),
(6, '/zumbi/user/getUserList', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-24 23:01:21'),
(7, '/zumbi/user/checkUser', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-24 23:01:30'),
(8, '/zumbi/user/getUserList', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-24 23:01:30'),
(9, '/zumbi/', 'GET', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-24 23:01:35'),
(10, '/zumbi/user/checkUser', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-24 23:01:39'),
(11, '/zumbi/user/getUserList', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-24 23:01:40'),
(12, '/zumbi/', 'GET', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-24 23:01:49'),
(13, '/zumbi/user/checkUser', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-24 23:01:54'),
(14, '/zumbi/msg/getMsgByGroup/', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-24 23:01:54'),
(15, '/zumbi/user/getUserList', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-24 23:01:55'),
(16, '/zumbi/user/checkUser', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-24 23:01:00'),
(17, '/zumbi/msg/getMsgByGroup/', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-24 23:01:00'),
(18, '/zumbi/user/getUserList', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-24 23:01:00'),
(19, '/zumbi/user/checkUser', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-24 23:01:06'),
(20, '/zumbi/msg/getMsgByGroup/', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-24 23:01:07'),
(21, '/zumbi/user/getUserList', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-24 23:01:07'),
(22, '/zumbi/user/checkUser', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-24 23:01:12'),
(23, '/zumbi/msg/getMsgByGroup/', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-24 23:01:12'),
(24, '/zumbi/user/getUserList', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-24 23:01:12'),
(25, '/zumbi/', 'GET', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:04'),
(26, '/zumbi/user/checkUser', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:08'),
(27, '/zumbi/msg/getMsgByGroup/', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:08'),
(28, '/zumbi/user/getUserList', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:08'),
(29, '/zumbi/', 'GET', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:59'),
(30, '/zumbi/user/checkUser', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:02'),
(31, '/zumbi/msg/getMsgByGroup/', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:02'),
(32, '/zumbi/user/getUserList', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:02'),
(33, '/zumbi/', 'GET', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:40'),
(34, '/zumbi/', 'GET', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:40'),
(35, '/zumbi/user/checkUser', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:43'),
(36, '/zumbi/msg/getMsgByGroup/', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:43'),
(37, '/zumbi/user/getUserList', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:43'),
(38, '/zumbi/', 'GET', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:16'),
(39, '/zumbi/', 'GET', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:18'),
(40, '/zumbi/user/checkUser', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:21'),
(41, '/zumbi/msg/getMsgByGroup/', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:21'),
(42, '/zumbi/user/getUserList', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:21'),
(43, '/zumbi/user/checkUser', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:34'),
(44, '/zumbi/user/getUserList', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:34'),
(45, '/zumbi/msg/getUserGroupStatus', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:38'),
(46, '/zumbi/msg/getUserGroupStatus', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:39'),
(47, '/zumbi/user/getUserList', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:40'),
(48, '/zumbi/user/checkUser', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:02'),
(49, '/zumbi/user/getUserList', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:02'),
(50, '/zumbi/msg/getUserGroupStatus', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:05'),
(51, '/zumbi/', 'GET', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:08'),
(52, '/zumbi/user/checkUser', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:11'),
(53, '/zumbi/msg/getMsgByGroup/', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:11'),
(54, '/zumbi/user/getUserList', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:11'),
(55, '/zumbi/msg/getMsgByGroup/', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:15'),
(56, '/zumbi/user/checkUser', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:37'),
(57, '/zumbi/msg/getMsgByGroup/', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:37'),
(58, '/zumbi/user/getUserList', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:37'),
(59, '/zumbi/user/checkUser', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:05'),
(60, '/zumbi/msg/getMsgByGroup/', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:05'),
(61, '/zumbi/user/getUserList', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:05'),
(62, '/zumbi/user/checkUser', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:12'),
(63, '/zumbi/msg/getMsgByGroup/', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:12'),
(64, '/zumbi/user/getUserList', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:12'),
(65, '/zumbi/msg/getMsgByGroup/', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:13'),
(66, '/zumbi/user/checkUser', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:29'),
(67, '/zumbi/msg/getMsgByGroup/', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:29'),
(68, '/zumbi/user/getUserList', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:30'),
(69, '/zumbi/user/checkUser', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:04'),
(70, '/zumbi/msg/getMsgByGroup/', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:04'),
(71, '/zumbi/user/getUserList', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:04'),
(72, '/zumbi/msg/getMsgByGroup/', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:37'),
(73, '/zumbi/user/checkUser', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:17'),
(74, '/zumbi/msg/getMsgByGroup/', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:17'),
(75, '/zumbi/user/getUserList', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:17'),
(76, '/zumbi/msg/getMsgByGroup/', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:19'),
(77, '/zumbi/user/checkUser', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:53'),
(78, '/zumbi/msg/getMsgByGroup/', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:53'),
(79, '/zumbi/user/getUserList', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:53'),
(80, '/zumbi/', 'GET', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:57'),
(81, '/zumbi/user/checkUser', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:00'),
(82, '/zumbi/msg/getMsgByGroup/', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:00'),
(83, '/zumbi/user/getUserList', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:00'),
(84, '/zumbi/', 'GET', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:30'),
(85, '/zumbi/user/checkUser', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:32'),
(86, '/zumbi/msg/getMsgByGroup/', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:32'),
(87, '/zumbi/user/getUserList', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:33'),
(88, '/zumbi/msg/getMsgByGroup/', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:42'),
(89, '/zumbi/', 'GET', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:36'),
(90, '/zumbi/user/checkUser', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:38'),
(91, '/zumbi/msg/getMsgByGroup/', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:38'),
(92, '/zumbi/user/getUserList', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:39'),
(93, '/zumbi/msg/getMsgByGroup/', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:40'),
(94, '/zumbi/msg/getMsgByGroup/', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:48'),
(95, '/zumbi/msg/getMsgByGroup/', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:50'),
(96, '/zumbi/msg/getMsgByGroup/', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:53'),
(97, '/zumbi/', 'GET', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:45'),
(98, '/zumbi/user/checkUser', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:47'),
(99, '/zumbi/msg/getMsgByGroup/', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:48'),
(100, '/zumbi/user/getUserList', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:48'),
(101, '/zumbi/user/getUserList', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:55'),
(102, '/zumbi/user/getUserList', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:57'),
(103, '/zumbi/', 'GET', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:50'),
(104, '/zumbi/user/checkUser', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:53'),
(105, '/zumbi/msg/getMsgByGroup/', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:53'),
(106, '/zumbi/user/getUserList', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:53'),
(107, '/zumbi/msg/getMsgByGroup/', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:56'),
(108, '/zumbi/', 'GET', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:05'),
(109, '/zumbi/user/checkUser', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:09'),
(110, '/zumbi/msg/getMsgByGroup/', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:09'),
(111, '/zumbi/user/getUserList', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:09'),
(112, '/zumbi/', 'GET', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:23'),
(113, '/zumbi/user/checkUser', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:26'),
(114, '/zumbi/msg/getMsgByGroup/', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:26'),
(115, '/zumbi/user/getUserList', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:26'),
(116, '/zumbi/', 'GET', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:32'),
(117, '/zumbi/user/checkUser', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:35'),
(118, '/zumbi/msg/getMsgByGroup/', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:35'),
(119, '/zumbi/user/getUserList', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:35'),
(120, '/zumbi/', 'GET', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:42'),
(121, '/zumbi/user/checkUser', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:45'),
(122, '/zumbi/msg/getMsgByGroup/', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:45'),
(123, '/zumbi/user/getUserList', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:45'),
(124, '/zumbi/', 'GET', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:56'),
(125, '/zumbi/user/checkUser', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:59'),
(126, '/zumbi/msg/getMsgByGroup/', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:59'),
(127, '/zumbi/user/getUserList', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:59'),
(128, '/zumbi/', 'GET', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:21'),
(129, '/zumbi/user/checkUser', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:25'),
(130, '/zumbi/msg/getMsgByGroup/', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:25'),
(131, '/zumbi/user/getUserList', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:25'),
(132, '/zumbi/', 'GET', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:50'),
(133, '/zumbi/user/checkUser', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:53'),
(134, '/zumbi/msg/getMsgByGroup/', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:53'),
(135, '/zumbi/user/getUserList', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:53'),
(136, '/zumbi/', 'GET', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:09'),
(137, '/zumbi/user/checkUser', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:12'),
(138, '/zumbi/msg/getMsgByGroup/', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:12'),
(139, '/zumbi/user/getUserList', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:12'),
(140, '/zumbi/', 'GET', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:37'),
(141, '/zumbi/user/checkUser', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:40'),
(142, '/zumbi/msg/getMsgByGroup/', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:40'),
(143, '/zumbi/user/getUserList', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:40'),
(144, '/zumbi/', 'GET', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:56'),
(145, '/zumbi/user/checkUser', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:59'),
(146, '/zumbi/msg/getMsgByGroup/', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:59'),
(147, '/zumbi/user/getUserList', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:59'),
(148, '/zumbi/', 'GET', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:03'),
(149, '/zumbi/user/checkUser', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:07'),
(150, '/zumbi/msg/getMsgByGroup/', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:07'),
(151, '/zumbi/user/getUserList', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:08'),
(152, '/zumbi/', 'GET', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:35'),
(153, '/zumbi/user/checkUser', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:39'),
(154, '/zumbi/msg/getMsgByGroup/', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:39'),
(155, '/zumbi/user/getUserList', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:40'),
(156, '/zumbi/', 'GET', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:08'),
(157, '/zumbi/user/checkUser', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:11'),
(158, '/zumbi/msg/getMsgByGroup/', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:11'),
(159, '/zumbi/user/getUserList', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:12'),
(160, '/zumbi/msg/getMsgByGroup/', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:17'),
(161, '/zumbi/msg/getMsgByGroup/', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:29'),
(162, '/zumbi/', 'GET', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:51'),
(163, '/zumbi/user/checkUser', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:55'),
(164, '/zumbi/msg/getMsgByGroup/', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:55'),
(165, '/zumbi/user/getUserList', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:55'),
(166, '/zumbi/', 'GET', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:11'),
(167, '/zumbi/user/checkUser', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:14'),
(168, '/zumbi/msg/getMsgByGroup/', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:15'),
(169, '/zumbi/user/getUserList', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:15'),
(170, '/zumbi/msg/getMsgByGroup/', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:22'),
(171, '/zumbi/', 'GET', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:34'),
(172, '/zumbi/user/checkUser', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:37'),
(173, '/zumbi/msg/getMsgByGroup/', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:37'),
(174, '/zumbi/user/getUserList', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:37');
INSERT INTO `access` (`ID`, `REQUEST`, `METHOD`, `REMOTE`, `AGENT`, `ACCEPT`, `ENCODING`, `LANGUAGE`, `IDATE`) VALUES
(175, '/zumbi/msg/getMsgByGroup/', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:11'),
(176, '/zumbi/msg/getMsgByGroup/', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:12'),
(177, '/zumbi/msg/getMsgByGroup/', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:13'),
(178, '/zumbi/msg/getMsgByGroup/', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:15'),
(179, '/zumbi/', 'GET', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:59'),
(180, '/zumbi/user/checkUser', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:02'),
(181, '/zumbi/msg/getMsgByGroup/', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:02'),
(182, '/zumbi/user/getUserList', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:02'),
(183, '/zumbi/', 'GET', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:09'),
(184, '/zumbi/user/checkUser', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:11'),
(185, '/zumbi/msg/getMsgByGroup/', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:12'),
(186, '/zumbi/user/getUserList', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:12'),
(187, '/zumbi/', 'GET', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:23'),
(188, '/zumbi/user/checkUser', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:26'),
(189, '/zumbi/msg/getMsgByGroup/', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:26'),
(190, '/zumbi/user/getUserList', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:26'),
(191, '/zumbi/', 'GET', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:50'),
(192, '/zumbi/user/checkUser', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:53'),
(193, '/zumbi/msg/getMsgByGroup/', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:53'),
(194, '/zumbi/user/getUserList', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:53'),
(195, '/zumbi/', 'GET', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:42'),
(196, '/zumbi/user/checkUser', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:45'),
(197, '/zumbi/msg/getMsgByGroup/', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:45'),
(198, '/zumbi/user/getUserList', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:45'),
(199, '/zumbi/', 'GET', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:26'),
(200, '/zumbi/user/checkUser', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:28'),
(201, '/zumbi/msg/getMsgByGroup/', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:28'),
(202, '/zumbi/user/getUserList', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:28'),
(203, '/zumbi/', 'GET', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:40'),
(204, '/zumbi/user/checkUser', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:44'),
(205, '/zumbi/msg/getMsgByGroup/', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:44'),
(206, '/zumbi/user/getUserList', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:44'),
(207, '/zumbi/', 'GET', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:35'),
(208, '/zumbi/user/checkUser', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:37'),
(209, '/zumbi/msg/getMsgByGroup/', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:38'),
(210, '/zumbi/user/getUserList', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:38'),
(211, '/zumbi/', 'GET', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:12'),
(212, '/zumbi/user/checkUser', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:15'),
(213, '/zumbi/msg/getMsgByGroup/', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:15'),
(214, '/zumbi/user/getUserList', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:15'),
(215, '/zumbi/', 'GET', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:37'),
(216, '/zumbi/user/checkUser', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:39'),
(217, '/zumbi/msg/getMsgByGroup/', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:40'),
(218, '/zumbi/user/getUserList', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:40'),
(219, '/zumbi/', 'GET', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:57'),
(220, '/zumbi/user/checkUser', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:00'),
(221, '/zumbi/msg/getMsgByGroup/', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:01'),
(222, '/zumbi/user/getUserList', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:01'),
(223, '/zumbi/msg/getMsgByGroup/', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:16'),
(224, '/zumbi/msg/getMsgByGroup/', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:18'),
(225, '/zumbi/', 'GET', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:40'),
(226, '/zumbi/user/checkUser', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:43'),
(227, '/zumbi/msg/getMsgByGroup/', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:43'),
(228, '/zumbi/user/getUserList', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:43'),
(229, '/zumbi/msg/getMsgByGroup/', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:22'),
(230, '/zumbi/', 'GET', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:31'),
(231, '/zumbi/', 'GET', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 01:01:32'),
(232, '/xhat/', 'GET', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 02:01:46'),
(233, '/xhat/', 'GET', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 02:01:48'),
(234, '/xhat/', 'GET', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 02:01:40'),
(235, '/xhat/user/checkUser', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 02:01:43'),
(236, '/xhat/msg/getMsgByGroup/', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 02:01:43'),
(237, '/xhat/user/getUserList', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 02:01:44'),
(238, '/xhat/user/getUserList', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 02:01:50'),
(239, '/xhat/msg/getMsgByGroup/', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 02:01:52'),
(240, '/xhat/msg/getUserGroupStatus', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 02:01:02'),
(241, '/xhat/msg/getMsgByGroup/', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 02:01:02'),
(242, '/xhat/', 'GET', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 02:01:04'),
(243, '/xhat/user/checkUser', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 02:01:07'),
(244, '/xhat/msg/getMsgByGroup/', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 02:01:08'),
(245, '/xhat/user/getUserList', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 02:01:08'),
(246, '/xhat/', 'GET', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 02:01:10'),
(247, '/xhat/', 'GET', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 02:01:57'),
(248, '/xhat/', 'GET', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 02:01:57'),
(249, '/xhat/user/checkUser', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 02:01:00'),
(250, '/xhat/msg/getMsgByGroup/', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 02:01:00'),
(251, '/xhat/user/getUserList', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 02:01:00'),
(252, '/xhat/', 'GET', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 02:01:02'),
(253, '/zumbi/', 'GET', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 02:01:10'),
(254, '/zumbi/user/checkUser', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 02:01:13'),
(255, '/zumbi/msg/getMsgByGroup/', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 02:01:13'),
(256, '/zumbi/user/getUserList', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 02:01:13'),
(257, '/zumbi/msg/getMsgByGroup/', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 02:01:20'),
(258, '/zumbi/msg/getMsgByGroup/', 'POST', '::1', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', '*/*', 'gzip, deflate', 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2,fr;q=0.2,gl;q=0.2,sk;q=0.2', '2015-10-25 02:01:22');

-- --------------------------------------------------------

--
-- Estrutura da tabela `erp_usuarios`
--

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Extraindo dados da tabela `erp_usuarios`
--

INSERT INTO `erp_usuarios` (`id`, `primeiro_nome`, `segundo_nome`, `email`, `senha`, `criado`, `modificado`, `ativo`, `status`) VALUES
(1, 'Bill', 'Rocha', 'paulo.rocha@outlook.com', 'e807f1fcf82d132f9bb018ca6738a19f', '2015-10-10 00:00:00', '2015-10-10 20:10:39', b'1', 'ACTIVE'),
(2, 'Willian', 'Rafael César', 'abul@gmail.com', 'e807f1fcf82d132f9bb018ca6738a19f', '2015-10-10 00:00:00', '2015-10-10 20:10:39', b'1', 'ACTIVE'),
(3, 'Gerber', 'Zurox', 'zurox@outlook.com', 'e807f1fcf82d132f9bb018ca6738a19f', '2015-10-10 00:00:00', '2015-10-10 20:12:12', b'1', 'ACTIVE'),
(4, 'Jefferson', 'dos Santos e Silva', 'jeff_ss@gmail.com', 'e807f1fcf82d132f9bb018ca6738a19f', '2015-10-10 00:00:00', '2015-10-10 20:12:12', b'1', 'ACTIVE'),
(5, 'Marcos', 'Vinícios do Nascimento', 'vini-nascimento@ymail.com', 'e807f1fcf82d132f9bb018ca6738a19f', '2015-10-10 00:00:00', '2015-10-10 20:13:10', b'1', 'DISABLED'),
(6, 'Marta', 'Barata da Silva', 'martachinela@gmail.com', 'e807f1fcf82d132f9bb018ca6738a19f', '0000-00-00 00:00:00', '2015-10-25 01:46:13', b'1', 'ACTIVE'),
(7, 'Armando', 'Pinto de Souza', 'armandinho24@gmagazine.com.br', 'e807f1fcf82d132f9bb018ca6738a19f', '0000-00-00 00:00:00', '2015-10-25 01:46:13', b'1', 'ACTIVE'),
(8, 'Marina', 'do Rego Salgado', 'maresal@yahoo.com.br', 'e807f1fcf82d132f9bb018ca6738a19f', '0000-00-00 00:00:00', '2015-10-25 01:46:13', b'1', 'ACTIVE');

-- --------------------------------------------------------

--
-- Estrutura da tabela `groups`
--

DROP TABLE IF EXISTS `groups`;
CREATE TABLE IF NOT EXISTS `groups` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `PAR` int(11) NOT NULL DEFAULT '0',
  `STATUS` tinyint(1) NOT NULL DEFAULT '1',
  `NAME` varchar(200) NOT NULL,
  `ABOUT` text NOT NULL,
  PRIMARY KEY (`ID`,`PAR`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Groups defines' AUTO_INCREMENT=19 ;

--
-- Extraindo dados da tabela `groups`
--

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

-- --------------------------------------------------------

--
-- Estrutura da tabela `messages`
--

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Messages data' AUTO_INCREMENT=144 ;

--
-- Extraindo dados da tabela `messages`
--

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
(64, '2015-10-17 21:23:55', 1, 'Bill Rocha', 16, 0, 'msg', 'zxczxczx cxzc'),
(65, '2015-10-21 23:01:55', 2, 'Willian Rafael César', 9, 0, 'msg', 'teste'),
(66, '2015-10-21 23:02:01', 2, 'Willian Rafael César', 9, 0, 'msg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. <br/>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. <br/>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. <br/>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
(67, '2015-10-21 23:03:57', 1, 'Bill Rocha', 15, 0, 'msg', 'teste'),
(68, '2015-10-21 23:06:20', 1, 'Bill Rocha', 15, 0, 'msg', 'teste'),
(69, '2015-10-21 23:21:33', 1, 'Bill Rocha', 9, 0, 'msg', 'Teste'),
(70, '2015-10-21 23:22:25', 1, 'Bill Rocha', 1, 0, 'msg', 'olá'),
(71, '2015-10-21 23:35:46', 1, 'Bill Rocha', 1, 0, 'msg', 'teste'),
(72, '2015-10-21 23:45:58', 1, 'Bill Rocha', 1, 0, 'msg', 'Este é mais um teste de mensagem!'),
(73, '2015-10-21 23:51:32', 1, 'Bill Rocha', 1, 0, 'msg', 'teste'),
(74, '2015-10-22 00:10:29', 1, 'Bill Rocha', NULL, 0, 'msg', 'Enviando mensagens de teste'),
(75, '2015-10-22 00:10:53', 1, 'Bill Rocha', 1, 0, 'msg', 'Enviando algumas mensagens de teste ao servidor.'),
(76, '2015-10-22 00:12:10', 1, 'Bill Rocha', NULL, 0, 'msg', 'teste'),
(77, '2015-10-22 00:12:29', 1, 'Bill Rocha', 1, 0, 'msg', 'oqeu é isso'),
(78, '2015-10-22 00:13:57', 2, 'Willian Rafael César', 1, 0, 'msg', 'olá, galera!!'),
(79, '2015-10-22 00:15:48', 2, 'Willian Rafael César', 1, 0, 'msg', 'teste'),
(80, '2015-10-22 00:16:02', 1, 'Bill Rocha', 1, 0, 'msg', 'Meu teste'),
(81, '2015-10-22 00:16:10', 2, 'Willian Rafael César', 1, 0, 'msg', 'ok'),
(82, '2015-10-22 00:19:59', 2, 'Willian Rafael César', 1, 0, 'msg', 'outra mensagem de teste'),
(83, '2015-10-22 00:29:49', 2, 'Willian Rafael César', 1, 0, 'msg', 'teste'),
(84, '2015-10-22 00:30:46', 2, 'Willian Rafael César', 1, 0, 'msg', 'olá!'),
(85, '2015-10-22 00:32:05', 2, 'Willian Rafael César', 1, 0, 'msg', 'Olá, galera!'),
(86, '2015-10-22 00:32:16', 1, 'Bill Rocha', 1, 0, 'msg', 'blaz'),
(87, '2015-10-22 00:33:00', 2, 'Willian Rafael César', 1, 0, 'msg', 'hi, men.'),
(88, '2015-10-22 00:33:05', 1, 'Bill Rocha', 1, 0, 'msg', 'olá'),
(89, '2015-10-22 00:33:38', 2, 'Willian Rafael César', 1, 0, 'msg', 'ok'),
(90, '2015-10-22 00:46:03', 2, 'Willian Rafael César', 1, 0, 'msg', 'ts'),
(91, '2015-10-22 00:52:54', 1, 'Bill Rocha', 1, 0, 'msg', 'teste'),
(92, '2015-10-22 00:53:06', 1, 'Bill Rocha', 1, 0, 'msg', 'teste'),
(93, '2015-10-22 01:27:50', 1, 'Bill Rocha', 1, 0, 'msg', 'teste'),
(94, '2015-10-22 01:40:39', 1, 'Bill Rocha', 1, 0, 'msg', 'teste'),
(95, '2015-10-22 01:51:21', 1, 'Bill Rocha', 1, 0, 'msg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. <br/>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. <br/>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. <br/>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
(96, '2015-10-22 02:01:29', 1, 'Bill Rocha', 1, 0, 'msg', 'olá'),
(97, '2015-10-22 02:01:54', 2, 'Willian Rafael César', 1, 0, 'msg', 'Olá, alguém por ai?'),
(98, '2015-10-22 02:02:13', 2, 'Willian Rafael César', 1, 0, 'msg', 'oi'),
(99, '2015-10-22 02:02:25', 1, 'Bill Rocha', 1, 0, 'msg', 'Come está, Rafael?'),
(100, '2015-10-22 02:06:27', 2, 'Willian Rafael César', 1, 0, 'msg', 'ok'),
(101, '2015-10-22 02:13:53', 1, 'Bill Rocha', 1, 0, 'msg', 'Teste'),
(102, '2015-10-22 02:14:57', 3, 'Gerber Zurox', 9, 0, 'msg', 'E ai, gente?'),
(103, '2015-10-22 02:22:02', 1, 'Bill Rocha', 1, 0, 'msg', 'Testando com um smartphone microsoft Lumia'),
(104, '2015-10-22 02:43:59', 1, 'Bill Rocha', 15, 0, 'msg', 'olá'),
(105, '2015-10-22 02:44:56', 2, 'Willian Rafael César', 9, 0, 'msg', 'Falái'),
(106, '2015-10-22 02:46:23', 1, 'Bill Rocha', 9, 0, 'msg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. <br/>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. <br/>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. <br/>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
(107, '2015-10-22 02:46:44', 1, 'Bill Rocha', 9, 0, 'msg', '<b>olá</b>, pessoal!'),
(108, '2015-10-22 02:49:22', 1, 'Bill Rocha', 15, 0, 'msg', 'Teste'),
(109, '2015-10-22 02:50:50', 1, 'Bill Rocha', 15, 0, 'msg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. <br/>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. <br/>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. <br/>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
(110, '2015-10-22 03:00:30', 1, 'Bill Rocha', 15, 0, 'msg', 'teste'),
(111, '2015-10-22 03:09:27', 1, 'Bill Rocha', 16, 0, 'msg', 'asdasd'),
(112, '2015-10-22 03:21:25', 1, 'Bill Rocha', 16, 0, 'msg', 'fasdfsdfs'),
(113, '2015-10-22 03:24:25', 1, 'Bill Rocha', 16, 0, 'msg', 'dfdfsfs'),
(114, '2015-10-23 00:51:20', 1, 'Bill Rocha', 15, 0, 'msg', 'Teste'),
(115, '2015-10-23 03:21:52', 1, 'Bill Rocha', 17, 0, 'msg', 'Hello!'),
(116, '2015-10-23 03:23:23', 1, 'Bill Rocha', 17, 0, 'msg', 'Oi!'),
(117, '2015-10-23 03:54:41', 1, 'Bill Rocha', 15, 0, 'msg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. <br/>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. <br/>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. <br/>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
(118, '2015-10-23 03:56:15', 1, 'Bill Rocha', 1, 0, 'msg', 'Olá!<br/>Alguém tem o controle do mês de Novembro - ativo?'),
(119, '2015-10-24 02:59:08', 1, 'Bill Rocha', 1, 0, 'msg', 'oi'),
(120, '2015-10-24 03:00:19', 1, 'Bill Rocha', 1, 0, 'msg', 'olá'),
(121, '2015-10-24 03:00:55', 1, 'Bill Rocha', 1, 0, 'msg', 'hi!!'),
(122, '2015-10-24 03:04:49', 1, 'Bill Rocha', 1, 0, 'msg', 'alguém por ai?'),
(123, '2015-10-24 03:05:03', 2, 'Willian Rafael César', 1, 0, 'msg', 'ok'),
(124, '2015-10-24 03:15:33', 1, 'Bill Rocha', 9, 0, 'msg', 'oi, mano!'),
(125, '2015-10-24 03:16:16', 2, 'Willian Rafael César', 9, 0, 'msg', 'olá'),
(126, '2015-10-24 03:18:12', 1, 'Bill Rocha', 9, 0, 'msg', 'hi'),
(127, '2015-10-24 03:18:29', 2, 'Willian Rafael César', 9, 0, 'msg', 'olá'),
(128, '2015-10-24 03:18:52', 1, 'Bill Rocha', 9, 0, 'msg', 'fala'),
(129, '2015-10-24 03:19:04', 2, 'Willian Rafael César', 9, 0, 'msg', 'ok'),
(130, '2015-10-24 03:21:24', 2, 'Willian Rafael César', 9, 0, 'msg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. <br/>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. <br/>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. <br/>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
(131, '2015-10-24 03:22:04', 1, 'Bill Rocha', 9, 0, 'msg', 'olá'),
(132, '2015-10-24 03:22:09', 2, 'Willian Rafael César', 9, 0, 'msg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. <br/>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. <br/>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. <br/>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
(133, '2015-10-24 03:22:16', 1, 'Bill Rocha', 9, 0, 'msg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. <br/>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. <br/>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. <br/>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
(134, '2015-10-24 03:23:12', 2, 'Willian Rafael César', 9, 0, 'msg', 'this type'),
(135, '2015-10-24 03:28:06', 2, 'Willian Rafael César', 9, 0, 'msg', 'yes'),
(136, '2015-10-24 03:28:18', 1, 'Bill Rocha', 9, 0, 'msg', 'ok'),
(137, '2015-10-24 03:28:25', 2, 'Willian Rafael César', 9, 0, 'msg', 'yes, ok!'),
(138, '2015-10-24 03:42:06', 3, 'Gerber Zurox', 9, 0, 'msg', 'hi'),
(139, '2015-10-25 01:32:06', 1, 'Bill Rocha', 16, 0, 'msg', 'hi'),
(140, '2015-10-25 03:10:29', 8, 'Marina do Rego Salgado', 3, 0, 'msg', 'Olá, alguém interessado?'),
(141, '2015-10-25 03:12:22', 7, 'Armando Pinto de Souza', 7, 0, 'msg', 'oieee'),
(142, '2015-10-25 03:12:54', 6, 'Marta Barata da Silva', 3, 0, 'msg', 'hi, all'),
(143, '2015-10-25 03:14:46', 5, 'Marcos Vinícios do Nascimento', 5, 0, 'msg', 'My god!? <br/><br/>It´s running!!');

-- --------------------------------------------------------

--
-- Estrutura da tabela `relay`
--

DROP TABLE IF EXISTS `relay`;
CREATE TABLE IF NOT EXISTS `relay` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PID` int(11) NOT NULL,
  `STATUS` int(11) NOT NULL COMMENT '0 = stop, 1 = running, 2 = stoped',
  `SCRIPT` varchar(200) NOT NULL,
  `TITLE` varchar(200) NOT NULL,
  `IP` varchar(30) NOT NULL,
  `PORT` varchar(6) NOT NULL,
  `CHA_NOW` int(11) NOT NULL,
  `CHA_MAX` int(11) NOT NULL,
  `US_NOW` int(11) NOT NULL,
  `US_MAX` int(11) NOT NULL,
  `ERRORS` int(11) NOT NULL,
  `START` datetime NOT NULL,
  `LAST_UPDATE` datetime NOT NULL,
  PRIMARY KEY (`ID`,`TITLE`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='tabela de relays' AUTO_INCREMENT=16 ;

--
-- Extraindo dados da tabela `relay`
--

INSERT INTO `relay` (`ID`, `PID`, `STATUS`, `SCRIPT`, `TITLE`, `IP`, `PORT`, `CHA_NOW`, `CHA_MAX`, `US_NOW`, `US_MAX`, `ERRORS`, `START`, `LAST_UPDATE`) VALUES
(14, 4128, 0, 'C:\\wamp\\www\\zumbi\\.app\\model\\relay.php', 'Xhat - zumbi', '0.0.0.0', '8080', 0, 0, 0, 0, 0, '2015-10-24 23:12:56', '2015-10-24 23:13:56'),
(15, 4316, 1, 'C:\\wamp\\www\\zumbi\\.app\\model\\relay.php', 'Xhat - zumbi', '0.0.0.0', '8080', 0, 0, 1, 1, 0, '2015-10-24 23:28:20', '2015-10-25 02:12:20');

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `ID` int(11) NOT NULL COMMENT 'ID from erp_usuarios',
  `NAME` varchar(200) NOT NULL COMMENT 'erp_usuarios: nome + sobrenome',
  `SKEY` varchar(200) NOT NULL COMMENT 'generated assincrono key = email+senha',
  `LAST` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'date of last sending msg  ',
  UNIQUE KEY `ID` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`ID`, `NAME`, `SKEY`, `LAST`) VALUES
(1, 'Bill Rocha', 'tUBd-NUx{iaUdU-mc_TMWZWH(O4=1{8Ggo@@>Vi%', '2015-10-25 04:08:13');

-- --------------------------------------------------------

--
-- Estrutura da tabela `user_group`
--

DROP TABLE IF EXISTS `user_group`;
CREATE TABLE IF NOT EXISTS `user_group` (
  `IDUSER` int(11) NOT NULL,
  `IDGROUP` int(11) NOT NULL,
  `LASTMSG` double NOT NULL,
  `LASTDATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY `USER` (`IDUSER`,`IDGROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='User in groups';

--
-- Extraindo dados da tabela `user_group`
--

INSERT INTO `user_group` (`IDUSER`, `IDGROUP`, `LASTMSG`, `LASTDATE`) VALUES
(1, 1, 123, '2015-10-24 03:06:29'),
(1, 4, 0, '2015-10-12 21:41:59'),
(1, 9, 138, '2015-10-25 01:35:11'),
(1, 10, 0, '2015-10-12 16:47:12'),
(1, 11, 0, '2015-10-11 00:24:43'),
(1, 13, 0, '2015-10-12 16:46:13'),
(1, 14, 0, '2015-10-12 16:46:13'),
(1, 15, 117, '2015-10-23 03:54:48'),
(1, 16, 139, '2015-10-25 03:30:56'),
(1, 17, 116, '2015-10-23 03:23:50'),
(2, 1, 123, '2015-10-24 03:07:26'),
(2, 3, 0, '2015-10-11 00:24:43'),
(2, 9, 125, '2015-10-24 03:18:01'),
(3, 9, 138, '2015-10-25 01:47:00'),
(3, 10, 0, '2015-10-11 00:24:43'),
(3, 12, 0, '2015-10-11 00:24:43'),
(3, 18, 0, '2015-10-11 00:24:43'),
(4, 1, 123, '2015-10-25 01:47:07'),
(4, 2, 0, '2015-10-11 00:24:43'),
(4, 6, 0, '2015-10-11 00:24:43'),
(4, 7, 0, '2015-10-11 00:24:43'),
(4, 8, 0, '2015-10-11 00:24:43'),
(5, 1, 123, '2015-10-25 01:47:12'),
(5, 5, 0, '2015-10-11 00:24:43'),
(6, 3, 140, '2015-10-25 03:12:29'),
(6, 7, 0, '2015-10-25 03:11:55'),
(7, 3, 140, '2015-10-25 03:12:12'),
(7, 7, 0, '2015-10-25 03:11:32'),
(8, 3, 0, '2015-10-25 03:10:03');

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_group_by_user`
--
DROP VIEW IF EXISTS `view_group_by_user`;
CREATE TABLE IF NOT EXISTS `view_group_by_user` (
`ID` int(11)
,`LASTMSG` double
,`LASTDATE` timestamp
,`GID` int(10) unsigned
,`PAR` int(11)
,`NAME` varchar(200)
,`ABOUT` text
,`MSG` bigint(21)
,`TOTAL` bigint(21)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `view_msg_from_users`
--
DROP VIEW IF EXISTS `view_msg_from_users`;
CREATE TABLE IF NOT EXISTS `view_msg_from_users` (
`ID` int(11)
,`NAME` varchar(200)
,`TYPE` enum('msg','img','file')
,`LAST` timestamp
,`TOTAL` bigint(21)
);
-- --------------------------------------------------------

--
-- Structure for view `view_group_by_user`
--
DROP TABLE IF EXISTS `view_group_by_user`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_group_by_user` AS select `user_group`.`IDUSER` AS `ID`,`user_group`.`LASTMSG` AS `LASTMSG`,`user_group`.`LASTDATE` AS `LASTDATE`,`groups`.`ID` AS `GID`,`groups`.`PAR` AS `PAR`,`groups`.`NAME` AS `NAME`,`groups`.`ABOUT` AS `ABOUT`,(select count(`messages`.`ID`) from `messages` where ((`messages`.`TOGROUP` = `GID`) and (`messages`.`ID` > `user_group`.`LASTMSG`))) AS `MSG`,(select count(`messages`.`ID`) from `messages` where (`messages`.`TOGROUP` = `GID`)) AS `TOTAL` from ((`user_group` join `users`) join `groups`) where ((`users`.`ID` = `user_group`.`IDUSER`) and (`groups`.`ID` = `user_group`.`IDGROUP`)) order by `groups`.`PAR` desc;

-- --------------------------------------------------------

--
-- Structure for view `view_msg_from_users`
--
DROP TABLE IF EXISTS `view_msg_from_users`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_msg_from_users` AS select `messages`.`IDFROM` AS `ID`,`messages`.`NAMEFROM` AS `NAME`,`messages`.`TYPE` AS `TYPE`,max(`messages`.`SENDDATE`) AS `LAST`,count(`messages`.`ID`) AS `TOTAL` from `messages` where `messages`.`IDFROM` in (select `user_group`.`IDUSER` from `user_group`) group by `messages`.`IDFROM`,`messages`.`TYPE` order by `LAST` desc;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
