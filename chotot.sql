-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 23, 2020 at 09:13 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `chotot`
--

-- --------------------------------------------------------

--
-- Table structure for table `tindang`
--

CREATE TABLE `tindang` (
  `id` int(11) NOT NULL,
  `ten` varchar(250) NOT NULL,
  `idnguoiban` int(11) NOT NULL,
  `diadiem` varchar(250) NOT NULL,
  `giaban` int(11) NOT NULL,
  `ngayban` datetime NOT NULL DEFAULT current_timestamp(),
  `anh` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tindang`
--

INSERT INTO `tindang` (`id`, `ten`, `idnguoiban`, `diadiem`, `giaban`, `ngayban`, `anh`) VALUES
(1, 'Bàn ghế', 1, 'Hà Nội', 1500000, '2020-10-23 10:21:33', '../../../assets/images/danh-muc/noi-ngoai-that.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tindang`
--
ALTER TABLE `tindang`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tindang`
--
ALTER TABLE `tindang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
