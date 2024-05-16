-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 13, 2023 at 03:18 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `market`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `CategoryID` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Description` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`CategoryID`, `Name`, `Description`) VALUES
(8, 'Fruit', 'fruit, the fleshy or dry ripened ovary of a flowering plant, enclosing the seed or seeds. Thus, apricots, bananas, and grapes, as well as bean pods, corn grains, tomatoes, cucumbers, and (in their she'),
(9, 'Green Vegetables', 'Vegetables are important sources of many nutrients, including potassium, dietary fiber, folate, vitamin A, and vitamin C'),
(10, 'Spices', 'Cinnamon to Lower Blood Sugar. This popular spice comes from the bark of the cinnamon tree and is used in everything from pumpkin spice lattes to Cincinnati chili. ');

-- --------------------------------------------------------

--
-- Table structure for table `category_seq`
--

CREATE TABLE `category_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category_seq`
--

INSERT INTO `category_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `CustomerID` int(11) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `Fullname` varchar(50) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `usertype` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`CustomerID`, `Password`, `Fullname`, `Email`, `city`, `usertype`) VALUES
(1, '123456', 'admin', 'admin', 'sgu', 'admin'),
(2, '123456', 'Hào Võ', 'hao@gmail.com', 'sgu', 'customer'),
(27, '123456', 'Tấn Đạt', 'dattruong@gmail.com', 'sgu', 'seller');

-- --------------------------------------------------------

--
-- Table structure for table `customers_seq`
--

CREATE TABLE `customers_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers_seq`
--

INSERT INTO `customers_seq` (`next_val`) VALUES
(101);

-- --------------------------------------------------------

--
-- Table structure for table `order1`
--

CREATE TABLE `order1` (
  `orderid` int(11) NOT NULL,
  `customerid` int(11) NOT NULL,
  `date` datetime DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `total` float NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order1`
--

INSERT INTO `order1` (`orderid`, `customerid`, `date`, `note`, `total`) VALUES
(1, 27, '2023-11-16 14:30:55', 'OK', 0.0111),
(2, 27, '2023-11-17 00:30:23', 'OK', 30000),
(3, 27, '2023-11-17 00:31:08', 'OK', 10000),
(4, 27, '2023-11-17 00:35:00', 'OK', 30000),
(5, 27, '2023-11-17 00:36:04', 'OK', 10000),
(6, 27, '2023-11-17 00:36:43', 'OK', 10000),
(7, 27, '2023-11-17 00:36:48', 'OK', 10000),
(8, 27, '2023-11-17 00:37:34', 'OK', 30000),
(9, 27, '2023-11-17 00:38:54', 'OK', 10000),
(52, 27, '2023-11-17 00:43:33', 'OK', 10000),
(53, 27, '2023-11-17 00:46:29', 'OK', 30000),
(54, 27, '2023-11-17 00:46:38', 'OK', 30000),
(55, 27, '2023-11-17 00:51:17', 'OK', 30000),
(56, 27, '2023-11-17 00:51:33', 'OK', 30000),
(102, 27, '2023-11-17 00:55:08', 'OK', 10000),
(103, 27, '2023-11-17 00:55:54', 'OK', 10000),
(104, 27, '2023-11-17 00:56:59', 'OK', 20000),
(105, 27, '2023-11-17 00:57:44', 'OK', 30000),
(152, 27, '2023-11-17 01:04:27', 'OK', 30000),
(153, 27, '2023-11-17 01:04:46', 'OK', 60000),
(202, 27, '2023-11-17 01:05:35', 'OK', 90000),
(203, 27, '2023-11-17 01:06:44', 'OK', 140000),
(252, 27, '2023-11-17 01:14:08', 'OK', 30000),
(253, 27, '2023-11-17 01:21:59', 'OK', 60000),
(254, 27, '2023-11-17 01:27:50', 'OK', 0.0111),
(255, 27, '2023-11-17 01:28:13', 'OK', 0.0222),
(256, 27, '2023-11-17 21:17:33', 'OK', 120000),
(302, 27, '2023-11-17 21:23:22', 'OK', 30000),
(303, 27, '2023-11-17 21:23:30', 'OK', 10000),
(304, 27, '2023-11-17 21:23:54', 'OK', 30000),
(305, 27, '2023-11-17 21:24:06', 'OK', 30000),
(306, 27, '2023-11-17 21:24:52', 'OK', 30000),
(307, 27, '2023-11-17 21:26:27', 'OK', 30000);

-- --------------------------------------------------------

--
-- Table structure for table `order1_seq`
--

CREATE TABLE `order1_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order1_seq`
--

INSERT INTO `order1_seq` (`next_val`) VALUES
(401);

-- --------------------------------------------------------

--
-- Table structure for table `orderdetail`
--

CREATE TABLE `orderdetail` (
  `OrderID` int(11) NOT NULL,
  `VegetableID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Price` float NOT NULL,
  `order_detailid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `orderdetail`
--

INSERT INTO `orderdetail` (`OrderID`, `VegetableID`, `Quantity`, `Price`, `order_detailid`) VALUES
(81, 8, 2, 30000, 0),
(81, 9, 1, 10000, 0),
(82, 9, 2, 10000, 0),
(83, 8, 1, 30000, 0),
(83, 9, 1, 10000, 0),
(84, 8, 1, 30000, 0),
(84, 9, 1, 10000, 0),
(84, 10, 2, 30000, 0),
(1, 452, 1, 0.0111, 1),
(2, 8, 1, 30000, 2),
(3, 9, 1, 10000, 3),
(4, 10, 1, 30000, 4),
(5, 9, 1, 10000, 5),
(6, 9, 1, 10000, 6),
(7, 9, 1, 10000, 7),
(8, 8, 1, 30000, 8),
(9, 9, 1, 10000, 9),
(52, 9, 1, 10000, 52),
(53, 8, 1, 30000, 53),
(54, 8, 1, 30000, 54),
(55, 8, 1, 30000, 55),
(56, 8, 1, 30000, 56),
(102, 9, 1, 10000, 102),
(103, 9, 1, 10000, 103),
(104, 9, 3, 10000, 104),
(105, 9, 5, 10000, 105),
(152, 8, 1, 30000, 152),
(153, 10, 2, 30000, 153),
(202, 8, 5, 30000, 202),
(203, 12, 7, 35000, 203),
(252, 8, 1, 30000, 252),
(253, 8, 2, 30000, 253),
(254, 452, 1, 0.0111, 254),
(255, 452, 2, 0.0111, 255),
(256, 8, 4, 30000, 256),
(302, 8, 1, 30000, 302),
(303, 9, 1, 10000, 303),
(304, 8, 1, 30000, 304),
(305, 8, 1, 30000, 305),
(306, 8, 1, 30000, 306),
(307, 8, 1, 30000, 307);

-- --------------------------------------------------------

--
-- Table structure for table `orderdetail_seq`
--

CREATE TABLE `orderdetail_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orderdetail_seq`
--

INSERT INTO `orderdetail_seq` (`next_val`) VALUES
(401);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `OrderID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Total` double NOT NULL,
  `Note` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`OrderID`, `CustomerID`, `Date`, `Total`, `Note`) VALUES
(81, 12, '2021-09-07', 70000, ''),
(82, 12, '2021-09-07', 20000, ''),
(83, 12, '2021-09-07', 40000, ''),
(84, 27, '2021-09-07', 100000, '');

-- --------------------------------------------------------

--
-- Table structure for table `vegetable`
--

CREATE TABLE `vegetable` (
  `VegetableID` int(11) NOT NULL,
  `CategoryID` int(11) NOT NULL,
  `vegetablename` varchar(50) NOT NULL,
  `Unit` varchar(20) NOT NULL,
  `Amount` int(11) NOT NULL,
  `Images` varchar(50) NOT NULL,
  `Price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `vegetable`
--

INSERT INTO `vegetable` (`VegetableID`, `CategoryID`, `vegetablename`, `Unit`, `Amount`, `Images`, `Price`) VALUES
(8, 9, 'Cà chua 1', 'kg', 10, 'images/apple.jpg', 30000),
(9, 9, 'Cải thìa', 'kg', 5, 'images/celery.jpg', 10000),
(10, 9, 'Củ khoai lang', 'kg', 10, 'khoai-langjpg.jpg', 30000),
(11, 9, 'Cải thảo', 'kg', 6, 'rau-cai-thao.jpg', 10000),
(12, 9, 'Khoai tây', 'kg', 8, 'khoai_tay.jpg', 35000),
(13, 9, 'Cà rốt', 'kg', 10, 'ca_rot.jpg', 15000),
(452, 8, 'dua chuột', 'kg', 12, 'images/potato.jpg', 0.0111);

-- --------------------------------------------------------

--
-- Table structure for table `vegetable_seq`
--

CREATE TABLE `vegetable_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vegetable_seq`
--

INSERT INTO `vegetable_seq` (`next_val`) VALUES
(551);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`CategoryID`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`CustomerID`);

--
-- Indexes for table `order1`
--
ALTER TABLE `order1`
  ADD PRIMARY KEY (`orderid`);

--
-- Indexes for table `orderdetail`
--
ALTER TABLE `orderdetail`
  ADD KEY `VegetableID` (`VegetableID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`OrderID`);

--
-- Indexes for table `vegetable`
--
ALTER TABLE `vegetable`
  ADD PRIMARY KEY (`VegetableID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `CategoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `CustomerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `OrderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `vegetable`
--
ALTER TABLE `vegetable`
  MODIFY `VegetableID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=453;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orderdetail`
--
ALTER TABLE `orderdetail`
  ADD CONSTRAINT `orderdetail_ibfk_2` FOREIGN KEY (`VegetableID`) REFERENCES `vegetable` (`VegetableID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
