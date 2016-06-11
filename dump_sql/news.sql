-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 11, 2016 at 10:19 AM
-- Server version: 5.7.9
-- PHP Version: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `news`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1018350796 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(113629430, 'Sport', '2016-06-11 10:16:36', '2016-06-11 10:16:36'),
(281110143, 'Economie', '2016-06-11 10:16:36', '2016-06-11 10:16:36'),
(298486374, 'Politique', '2016-06-11 10:16:36', '2016-06-11 10:16:36'),
(980190962, 'HEIG', '2016-06-11 10:16:36', '2016-06-11 10:16:36'),
(1018350795, 'Education', '2016-06-11 10:16:36', '2016-06-11 10:16:36');

-- --------------------------------------------------------

--
-- Table structure for table `categories_reports`
--

DROP TABLE IF EXISTS `categories_reports`;
CREATE TABLE IF NOT EXISTS `categories_reports` (
  `report_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories_reports`
--

INSERT INTO `categories_reports` (`report_id`, `category_id`) VALUES
(980190962, 980190962),
(980190962, 1018350795),
(298486374, 298486374);

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
CREATE TABLE IF NOT EXISTS `media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'France Info', '2016-06-11 10:16:36', '2016-06-11 10:16:36'),
(2, 'Suisse Info', '2016-06-11 10:16:36', '2016-06-11 10:16:36');

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

DROP TABLE IF EXISTS `reports`;
CREATE TABLE IF NOT EXISTS `reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `head` text,
  `text` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=980190963 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reports`
--

INSERT INTO `reports` (`id`, `user_id`, `title`, `head`, `text`, `created_at`, `updated_at`) VALUES
(298486374, 113629430, 'Une journée ensoleillée à Yverdon', 'Du jamais vu depuis plus de 6 mois', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis eget dui vitae massa rhoncus consectetur at nec justo.', '2016-06-11 10:16:36', '2016-06-11 10:16:36'),
(980190962, 298486374, 'Le récit d''un jour sans pain', 'Deux étudiants nous font le récit de leur formation', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis eget dui vitae massa rhoncus consectetur at nec justo.', '2016-06-11 10:16:36', '2016-06-11 10:16:36');

-- --------------------------------------------------------

--
-- Table structure for table `reports_sources`
--

DROP TABLE IF EXISTS `reports_sources`;
CREATE TABLE IF NOT EXISTS `reports_sources` (
  `report_id` int(11) NOT NULL,
  `source_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reports_sources`
--

INSERT INTO `reports_sources` (`report_id`, `source_id`) VALUES
(980190962, 980190962),
(980190962, 298486374),
(298486374, 980190962),
(298486374, 113629430);

-- --------------------------------------------------------

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
CREATE TABLE IF NOT EXISTS `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `schema_migrations`
--

INSERT INTO `schema_migrations` (`version`) VALUES
('20160412132429'),
('20160412135105'),
('20160412135120'),
('20160412135133'),
('20160412135155'),
('20160412135626'),
('20160412152917'),
('20160412172919'),
('20160412172933'),
('20160419125002');

-- --------------------------------------------------------

--
-- Table structure for table `sources`
--

DROP TABLE IF EXISTS `sources`;
CREATE TABLE IF NOT EXISTS `sources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tyype` varchar(255) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=980190963 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sources`
--

INSERT INTO `sources` (`id`, `tyype`, `firstname`, `lastname`, `name`, `created_at`, `updated_at`) VALUES
(113629430, 'PhysicalSource', 'Alexandre', 'Swonikki', NULL, '2016-06-11 10:16:37', '2016-06-11 10:16:37'),
(298486374, 'LogicalSource', NULL, NULL, 'Grands Levages SàRL', '2016-06-11 10:16:37', '2016-06-11 10:16:37'),
(980190962, 'PhysicalSource', 'Alexandra', 'Geux', NULL, '2016-06-11 10:16:37', '2016-06-11 10:16:37');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `email` varchar(255) NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) DEFAULT NULL,
  `last_sign_in_ip` varchar(255) DEFAULT NULL,
  `medium_id` int(11) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB AUTO_INCREMENT=980190963 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `created_at`, `updated_at`, `email`, `encrypted_password`, `reset_password_token`, `reset_password_sent_at`, `remember_created_at`, `sign_in_count`, `current_sign_in_at`, `last_sign_in_at`, `current_sign_in_ip`, `last_sign_in_ip`, `medium_id`, `role`) VALUES
(113629430, 'Jaime', 'HEIG', '2016-06-11 10:16:37', '2016-06-11 10:16:37', 'jaime@heig.com', '$2a$10$hmzrM6fvBrP1irK6lNuAV.hXWXLGyMWC9LgJvQTmLMh5Xb31Byyku', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 2, 'author'),
(298486374, 'Albert', 'Haller', '2016-06-11 10:16:37', '2016-06-11 10:18:14', 'albert@haller.com', '$2a$10$ebRmQ37KbWwkHmJr4Xpr/Ok7gTm.AkXFnpkg2LVloP4m4J5G2FD0i', NULL, NULL, NULL, 1, '2016-06-11 10:18:14', '2016-06-11 10:18:14', '127.0.0.1', '127.0.0.1', 1, 'author'),
(980190962, 'Jean', 'Paul', '2016-06-11 10:16:37', '2016-06-11 10:16:37', 'jean@paul.com', '$2a$10$BhCA60p.TXSTN8SMTcWM2OR2RhbZkJ/nTgZlgBETKQB2lMHo8AQQG', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1, 'admin');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
