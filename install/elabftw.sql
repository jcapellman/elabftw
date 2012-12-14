-- phpMyAdmin SQL Dump
-- version 3.3.9.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 31, 2012 at 10:54 AM
-- Server version: 5.5.9
-- PHP Version: 5.3.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `elabumr144`
--

-- --------------------------------------------------------

--
-- Table structure for table `experiments`
--

CREATE TABLE `experiments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `date` int(10) unsigned NOT NULL,
  `body` text NOT NULL,
  `outcome` varchar(255) NOT NULL,
  `links` varchar(255) DEFAULT NULL,
  `userid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=469 ;

-- --------------------------------------------------------

--
-- Table structure for table `experiments_links`
--

CREATE TABLE `experiments_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(10) unsigned NOT NULL,
  `link_id` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=29 ;

-- --------------------------------------------------------

--
-- Table structure for table `experiments_tags`
--

CREATE TABLE `experiments_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(255) NOT NULL,
  `item_id` int(10) unsigned NOT NULL,
  `userid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2254 ;

-- --------------------------------------------------------

--
-- Table structure for table `experiments_templates`
--

CREATE TABLE `experiments_templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `body` text,
  `name` varchar(255) NOT NULL,
  `userid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `date` int(10) unsigned NOT NULL,
  `body` text,
  `rating` tinyint(10) DEFAULT '0',
  `type` varchar(255) DEFAULT 'item',
  `userid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=41 ;

-- --------------------------------------------------------

--
-- Table structure for table `items_tags`
--

CREATE TABLE `items_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(255) NOT NULL,
  `item_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=100 ;

-- --------------------------------------------------------

--
-- Table structure for table `items_templates`
--

CREATE TABLE `items_templates` (
  `id` int(10) unsigned NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `body` text,
  `tags` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Dumping data for table `items_templates`
--

INSERT INTO `items_templates` VALUES(1, 'pla', '<p>Backbone :</p>\r\n<p>Concentration :</p>\r\n<p>Resistances :</p>', 'plasmid');
INSERT INTO `items_templates` VALUES(2, 'pro', 'Source :', 'protocol');
INSERT INTO `items_templates` VALUES(3, 'ant', '<p>Target :</p>\r\n<p>Concentration :</p>\r\n<p>Isotype :</p>\r\n<p>Host :</p>\r\n<p>Type :</p>\r\n<p>WB dilution :</p>\r\n<p>IF dilution :</p>\r\n<p>IP dilution :</p>\r\n<p>Comments :</p>', NULL);
--
-- Table structure for table `uploads`
--

CREATE TABLE `uploads` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `real_name` text NOT NULL,
  `long_name` text NOT NULL,
  `comment` text NOT NULL,
  `item_id` int(10) unsigned DEFAULT NULL,
  `userid` text NOT NULL,
  `type` varchar(255) NOT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=117 ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `salt` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(127) DEFAULT NULL,
  `cellphone` varchar(127) DEFAULT NULL,
  `skype` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  `is_jc_resp` tinyint(1) NOT NULL DEFAULT '0',
  `is_pi` tinyint(1) NOT NULL DEFAULT '0',
  `journal` int(11) NOT NULL DEFAULT '0',
  `last_jc` int(4) NOT NULL,
  `register_date` bigint(20) unsigned NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `group` varchar(255) NOT NULL DEFAULT 'user',
  `theme` varchar(30) NOT NULL DEFAULT 'default',
  `display` varchar(10) NOT NULL DEFAULT 'default',
  `order_by` varchar(255) NOT NULL DEFAULT 'date',
  `sort_by` varchar(4) NOT NULL DEFAULT 'desc',
  `limit_nb` tinyint(255) NOT NULL DEFAULT '15',
  `sc_create` varchar(1) NOT NULL DEFAULT 'c',
  `sc_edit` varchar(1) NOT NULL DEFAULT 'e',
  `sc_submit` varchar(1) NOT NULL DEFAULT 's',
  `sc_todo` varchar(1) NOT NULL DEFAULT 't',
  `validated` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=90 ;

-- create root user with password toor and admin rights
INSERT INTO `users` VALUES(90, 'root', 'f69483d4a0edb8cc81092a0412b7b276e2fda6fda3a16cb61d16626cb6cd39b235721093e74eb93e23c2021afb3b6056aedb1a45b5bd767baf42d592f99b4c89', '8c744dc6b145df85c03655a678657bf3096ed7b6acd76d2bb27914069f544b07ad164ddf759db02d6bd6542fa4041a04b16060431cbc55d6814f12b048f43240', 'Admin', 'ROOT', 'noreply@nodomain.net', NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1351677553, NULL, 'user', 'default', 'default', 'date', 'desc', 15, 'c', 'e', 's', 't', 1);