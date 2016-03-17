-- phpMyAdmin SQL Dump
-- version 4.0.10.10
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 17, 2016 at 10:01 PM
-- Server version: 5.5.45
-- PHP Version: 5.4.44

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `test`
--

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

CREATE TABLE IF NOT EXISTS `authors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `authors`
--

INSERT INTO `authors` (`id`, `firstname`, `lastname`) VALUES
(1, 'Amy', 'Levy'),
(2, 'Emma', 'Lazarus'),
(3, 'Hannah', 'Arendt');

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE IF NOT EXISTS `books` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `date_create` date DEFAULT NULL,
  `date_update` date DEFAULT NULL,
  `preview` varchar(255) DEFAULT NULL,
  `date` date NOT NULL,
  `author_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `books_authors_fkey` (`author_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `name`, `date_create`, `date_update`, `preview`, `date`, `author_id`) VALUES
(2, 'Selected Poems', '2016-03-17', '2016-03-17', 'gold.png', '2016-03-24', 2),
(3, 'I Lift My Lamp', '2016-03-17', '2016-03-17', 'gold.png', '2016-03-15', 2),
(4, 'The New Colossus', '2016-03-17', '2016-03-17', 'gold.png', '2016-03-22', 2),
(5, 'A Minor Poet And Other Verse', '2016-03-17', '2016-03-17', 'gold.png', '2016-08-29', 1),
(6, 'Reuben Sachs', '2016-03-17', '2016-03-17', 'gold.png', '2016-03-08', 1),
(7, 'The Romance of a Shop', '2016-03-17', '2016-03-17', 'gold.png', '2016-12-10', 1),
(8, 'The Human Condition', '2016-03-17', '2016-03-17', 'gold.png', '2016-03-29', 3),
(9, 'Men in Dark Times', '2016-03-17', '2016-03-17', 'gold.png', '2016-03-15', 3),
(10, 'Responsibility and Judgment', '2016-03-17', '2016-03-17', 'gold.png', '2016-03-17', 3);

-- --------------------------------------------------------

--
-- Table structure for table `migration`
--

CREATE TABLE IF NOT EXISTS `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1458158976),
('m160316_193934_create_table_books_and_authors', 1458198241);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `books_authors_fkey` FOREIGN KEY (`author_id`) REFERENCES `authors` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
