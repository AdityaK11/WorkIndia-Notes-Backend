-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 21, 2020 at 07:51 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.1.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `workindia`
--

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

CREATE TABLE `notes` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `note` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notes`
--

INSERT INTO `notes` (`id`, `userid`, `note`) VALUES
(6, 2, 'gAAAAABfFnS04_uRYNcPCs35RiqZBzGdKIx9Cx75_L8xLtSa5dT2ctX7vA8Nqj5GbLoe0KPbUizZMhsJFgv9BgrzGJdqPcoJSa-lZ0UHOPFYrJOemaMh9KM='),
(7, 4, 'gAAAAABfFn2CSkPsJgIOoHnLX4p-x1RS2BNoGUUpvvHhBh9P4KSyfgvhQjWoTDrez65WX90nfr2QcOR05jptPFZjFlUvCw8m9w=='),
(8, 4, 'gAAAAABfFn3KY8a2F0XPXW8oWAJXcGea4Y9Q550DyGbXdMKIRMig9AS_WHaiwAEnNGXtLKo2Nhu4PpGZNTJi6OILDhTpS6bgDA=='),
(9, 4, 'gAAAAABfFn3P4llD4T_Obv_FtVD252mUVEHjx8esJhntD10bchRHsVyyB3BvdkP68EP-WzZCfK_L5dKk134TpDv0dVjJSuZklQ=='),
(10, 2, 'gAAAAABfFn3pG7Qo5HFH3-kDj1JPEqCiywg2Xc0V_KMazVjfrS3WwCHbQ6GnBxNb37vUbERgeLXOZkDmyuItzCYTa-R2oQBSdA=='),
(11, 3, 'gAAAAABfFn4KsAvhPK3_QiUEM1hReQkoiVW5urvm3l0ZefYgXAinQk_RSITBrW9Lmi-byWmWoHFZEPms6ZpcCsVADJe4K-2Uxg=='),
(12, 4, 'gAAAAABfFn--UnAKYtHbcA0eRz9YXk-5iXf4oX9SWzyCxhBXsOrWkY1T8zVEygvtd9CqK9P-RejpNb7iPitH2fg670vTCDESAg=='),
(13, 4, 'gAAAAABfFoC5TzIaEkyk6a3SGEbxgbcSjASP2GSbpy23tefUQ8pnUBiQX2VJ35Qrc8i9zjHT8RfXRFbQkr9WAbm2gqzrxLnYUQ=='),
(14, 4, 'gAAAAABfFoFwYpzLClL_-kt5820-6fS59R1oh1ZKvol8NTX4Zaborh-9kg76WWdYS6GyiVG0XpL095PNV9NsITdcvxrs-o0kug==');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`) VALUES
(1, 'test', 'test'),
(2, 'Aditya', '1234'),
(4, 'Joy', '1234'),
(8, 'Joy', '1234');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `notes`
--
ALTER TABLE `notes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
