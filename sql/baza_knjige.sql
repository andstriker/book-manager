-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.32-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for baza_knjige
CREATE DATABASE IF NOT EXISTS `baza_knjige` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `baza_knjige`;

-- Dumping structure for table baza_knjige.author
CREATE TABLE IF NOT EXISTS `author` (
  `author_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `nationality` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`author_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table baza_knjige.author: ~17 rows (approximately)
INSERT INTO `author` (`author_id`, `name`, `nationality`) VALUES
	(1, 'George Orwell', 'United Kingdom'),
	(2, 'Andy Weir', 'United States'),
	(3, 'J.K. Rowling', 'United Kingdom'),
	(4, 'Cormac McCarthy', 'United States'),
	(5, 'Dmitriĭ Glukhovskiĭ', 'Russia'),
	(6, 'Walter Tevis', 'United States'),
	(7, 'OccupyTheWeb', 'United States'),
	(8, 'Ernest Hemingway', 'United States'),
	(9, 'John Ronald Reuel Tolkien', 'United Kingdom'),
	(10, 'Tom Clancy', 'United States'),
	(12, 'Cheng\'en Wu', 'China'),
	(13, 'Ivo Andric', 'Yugoslavia'),
	(14, 'Branko Copic', 'Yugoslavia'),
	(15, 'Mario Puzo', 'United States'),
	(16, 'Suzanne Collins', 'United States'),
	(17, 'Sun Tzu', 'China'),
	(18, 'Mark Bowden', 'United States');

-- Dumping structure for table baza_knjige.book
CREATE TABLE IF NOT EXISTS `book` (
  `book_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` bigint(20) DEFAULT NULL,
  `genre` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `year` int(11) unsigned DEFAULT NULL,
  `price` float DEFAULT NULL,
  PRIMARY KEY (`book_id`),
  KEY `FKklnrv3weler2ftkweewlky958` (`author_id`),
  CONSTRAINT `FKklnrv3weler2ftkweewlky958` FOREIGN KEY (`author_id`) REFERENCES `author` (`author_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table baza_knjige.book: ~18 rows (approximately)
INSERT INTO `book` (`book_id`, `author_id`, `genre`, `title`, `year`, `price`) VALUES
	(1, 1, 'Sci-Fi', '1984', 1949, 24.99),
	(2, 2, 'Sci-Fi', 'The Martian', 2011, 29.99),
	(3, 3, 'Fantasy', 'Harry Potter and the Deathly Hallows', 1997, 19.99),
	(4, 4, 'Thriller', 'No Country for Old Men', 2005, 19.49),
	(5, 5, 'Sci-Fi', 'Metro 2033', 2002, 22.99),
	(6, 6, 'Novel', 'The Queen\'s Gambit', 1983, 18.99),
	(7, 7, 'Technology', 'Linux Basics for Hackers, 2nd Edition', 2018, 22.49),
	(8, 8, 'Novel', 'A Farewell to Arms', 1929, 26.99),
	(9, 9, 'Fantasy', 'The Lord of the Rings', 1954, 34.49),
	(10, 9, 'Fantasy', 'The Hobbit', 1937, 28.99),
	(11, 10, 'Novel', 'Rainbow Six', 1998, 22.99),
	(13, 12, 'Epic', 'Journey to the West - Vol. 1', 1592, 21.49),
	(14, 13, 'Novel', 'Prokleta avlija', 1954, 27.49),
	(16, 14, 'Poem', 'Hedgehog\'s Home', 1949, 23.49),
	(17, 15, 'Novel', 'The Godfather', 1969, 31.99),
	(18, 16, 'Sci-Fi', 'The Hunger Games', 2008, 35.99),
	(19, 17, 'Non-fiction', 'The Art of War', 2005, 21.99),
	(20, 18, 'Biography', 'Black Hawk Down', 1999, 23.99);

-- Dumping structure for table baza_knjige.cart_item
CREATE TABLE IF NOT EXISTS `cart_item` (
  `cart_item_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `book_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`cart_item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table baza_knjige.cart_item: ~0 rows (approximately)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
