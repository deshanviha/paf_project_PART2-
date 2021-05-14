-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 14, 2021 at 03:45 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.2.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gb_funding`
--

-- --------------------------------------------------------

--
-- Table structure for table `fundingtest1`
--

CREATE TABLE `fundingtest1` (
  `fundId` int(11) NOT NULL,
  `funderName` varchar(100) NOT NULL,
  `fundDate` date NOT NULL,
  `fundPrice` double NOT NULL,
  `fundCate` varchar(50) NOT NULL,
  `fundDesc` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `fundingtest1`
--

INSERT INTO `fundingtest1` (`fundId`, `funderName`, `fundDate`, `fundPrice`, `fundCate`, `fundDesc`) VALUES
(66, 'vihanga deshan', '2020-10-09', 2000, 'Mobile app', 'continue on update'),
(67, 'Sachintha Prabash', '2021-01-15', 30000, 'web application', 'Host only'),
(68, 'Bhanuka+gamage', '2021-01-31', 300000, 'Mobile+application', 'Source+code+need+after+the+implimentaion');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `fundingtest1`
--
ALTER TABLE `fundingtest1`
  ADD PRIMARY KEY (`fundId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `fundingtest1`
--
ALTER TABLE `fundingtest1`
  MODIFY `fundId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
