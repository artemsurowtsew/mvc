-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 13, 2024 at 07:48 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `library`
--

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

CREATE TABLE `authors` (
  `author_id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `authors`
--

INSERT INTO `authors` (`author_id`, `first_name`, `last_name`, `country`) VALUES
(1, 'Charles', 'Dickens', 'United Kingdom'),
(2, 'Mark', 'Zuckerberg', 'United States'),
(3, 'Brian', 'Kernighan', 'United States'),
(4, 'Dennis', 'Ritchie', 'United States'),
(5, 'Bjarne', 'Stroustrup', 'Denmark');

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `book_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `publish_year` int(11) DEFAULT NULL,
  `pages_count` int(11) DEFAULT NULL,
  `cover_image` varchar(255) DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`book_id`, `title`, `description`, `publish_year`, `pages_count`, `cover_image`, `author_id`) VALUES
(1, 'A Tale of Two Cities', 'A historical novel set in London and Paris during the French Revolution.', 1859, 489, 'tale_of_two_cities_cover.jpg', 1),
(2, 'The C Programming Language', 'A book that teaches the C programming language, written by Dennis Ritchie and Brian Kernighan.', 1978, 274, 'c_programming_language_cover.jpg', 2),
(3, 'The C++ Programming Language', 'A comprehensive guide to the C++ language by its creator, Bjarne Stroustrup.', 1985, 1023, 'cpp_programming_language_cover.jpg', 3),
(4, 'The Pragmatic Programmer', 'A classic book on software development by Andrew Hunt and David Thomas.', 1999, 320, 'pragmatic_programmer_cover.jpg', 4),
(5, 'The Art of Computer Programming', 'A multi-volume work on algorithms and programming by Donald Knuth.', 1968, 3145, 'art_of_computer_programming_cover.jpg', 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`author_id`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`book_id`),
  ADD KEY `author_id` (`author_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `authors`
--
ALTER TABLE `authors`
  MODIFY `author_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `book_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `books_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `authors` (`author_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
