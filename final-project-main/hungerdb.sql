-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 15, 2022 at 06:38 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hungerdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cartID` int(11) NOT NULL,
  `orderedByName` char(20) NOT NULL,
  `orderedByAddNo` int(11) NOT NULL,
  `restaurantID` int(11) NOT NULL,
  `discountID` int(11) DEFAULT NULL,
  `statusName` char(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cartID`, `orderedByName`, `orderedByAddNo`, `restaurantID`, `discountID`, `statusName`) VALUES
(1, 'elva123', 1, 1, 5, 'Out For Delivery'),
(2, 'johnuser', 2, 2, 5, 'Delivered'),
(4, 'elva123', 1, 1, 5, 'Cancelled'),
(5, 'nazlita', 4, 3, 10, 'Preparing'),
(6, 'elva123', 6, 2, 10, 'Delivered'),
(7, 'rohmah123', 7, 3, 10, 'Delivered'),
(8, 'johnadmin', 6, 1, 5, 'Pending'),
(9, 'johnadmin', 7, 1, NULL, 'Received'),
(10, 'johnadmin', 6, 1, 10, 'Received');

-- --------------------------------------------------------

--
-- Table structure for table `cartitem`
--

CREATE TABLE `cartitem` (
  `CartID` int(11) NOT NULL,
  `menuType` char(15) NOT NULL,
  `restaurantID` int(11) NOT NULL,
  `menuItemName` char(25) NOT NULL,
  `configName` char(30) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `comment` char(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cartitem`
--

INSERT INTO `cartitem` (`CartID`, `menuType`, `restaurantID`, `menuItemName`, `configName`, `quantity`, `comment`) VALUES
(1, 'Dinner', 1, 'Pancakes', 'Small', 5, 'No Comment'),
(1, 'Dinner', 3, 'ChickenWings', 'Small', 2, 'No Comment'),
(2, 'Dessert', 2, 'CheeseCake', 'Small', 2, 'No Comment'),
(4, 'Breakfast', 1, 'Omelettes', 'Regular', 1, 'No Comment'),
(5, 'Lunch', 3, 'MargueritaPizza', 'Large', 3, 'No Comment'),
(6, 'Lunch', 2, 'CrispyChicken', 'Regular', 5, 'Spicy'),
(7, 'Lunch', 3, 'MargueritaPizza', 'Large', 3, 'No Comment'),
(8, 'Breakfast', 1, 'Omelettes', 'Large', 1, 'no');

-- --------------------------------------------------------

--
-- Stand-in structure for view `carttotal`
-- (See below for the actual view)
--
CREATE TABLE `carttotal` (
`cartID` int(11)
,`total` double
);

-- --------------------------------------------------------

--
-- Table structure for table `cuisine`
--

CREATE TABLE `cuisine` (
  `cuisineName` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cuisine`
--

INSERT INTO `cuisine` (`cuisineName`) VALUES
('American'),
('Asian'),
('British'),
('Egyptian'),
('French'),
('Indian'),
('International'),
('Italian'),
('Lebanese'),
('Mexican'),
('Turkish');

-- --------------------------------------------------------

--
-- Table structure for table `deliveryarea`
--

CREATE TABLE `deliveryarea` (
  `areaName` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `deliveryarea`
--

INSERT INTO `deliveryarea` (`areaName`) VALUES
('6th of October'),
('Dokki'),
('Downtown'),
('Giza'),
('Heliopolis'),
('Maadi'),
('Mohandessin'),
('Nasr City'),
('New Cairo'),
('Sheraton'),
('Zamalek');

-- --------------------------------------------------------

--
-- Table structure for table `discount`
--

CREATE TABLE `discount` (
  `discountID` int(11) NOT NULL,
  `expiryDate` date DEFAULT NULL,
  `rate` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `discount`
--

INSERT INTO `discount` (`discountID`, `expiryDate`, `rate`) VALUES
(5, '2020-02-02', 0.2),
(10, '2020-02-02', 0.1);

-- --------------------------------------------------------

--
-- Table structure for table `itemconfiguration`
--

CREATE TABLE `itemconfiguration` (
  `configName` char(30) NOT NULL,
  `ratio` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `itemconfiguration`
--

INSERT INTO `itemconfiguration` (`configName`, `ratio`) VALUES
('Combo - Large', 1.25),
('Combo - Regular', 1.17),
('Combo - Small', 1.1),
('Large', 1.2),
('Regular', 1.1),
('Small', 1);

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

CREATE TABLE `log` (
  `logTime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `logTypeName` char(20) NOT NULL,
  `changedByName` char(20) NOT NULL,
  `changedOnName` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `log`
--

INSERT INTO `log` (`logTime`, `logTypeName`, `changedByName`, `changedOnName`) VALUES
('2022-11-26 15:14:54', 'create_admin', 'johnadmin', 'naah123'),
('2022-12-12 02:57:36', 'create_admin', 'elvanaz', 'rhmh'),
('2022-12-12 02:58:02', 'modifyPassword_admin', 'elvanaz', 'rhmh');

-- --------------------------------------------------------

--
-- Table structure for table `logtype`
--

CREATE TABLE `logtype` (
  `logTypeName` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `logtype`
--

INSERT INTO `logtype` (`logTypeName`) VALUES
('create_admin'),
('create_staff'),
('modifyPassword_admin'),
('modifyPassword_staff'),
('remove_admin'),
('remove_staff');

-- --------------------------------------------------------

--
-- Table structure for table `menutype`
--

CREATE TABLE `menutype` (
  `menuType` char(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `menutype`
--

INSERT INTO `menutype` (`menuType`) VALUES
('Breakfast'),
('Dessert'),
('Dinner'),
('Lunch');

-- --------------------------------------------------------

--
-- Table structure for table `orderstatus`
--

CREATE TABLE `orderstatus` (
  `statusName` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orderstatus`
--

INSERT INTO `orderstatus` (`statusName`) VALUES
('Cancelled'),
('Delivered'),
('Out For Delivery'),
('Pending'),
('Preparing'),
('Received');

-- --------------------------------------------------------

--
-- Table structure for table `restaurant`
--

CREATE TABLE `restaurant` (
  `restaurantID` int(11) NOT NULL,
  `restaurantName` char(25) NOT NULL,
  `cuisine` char(20) NOT NULL,
  `deliveryFee` float DEFAULT NULL,
  `rest_add` char(100) DEFAULT NULL,
  `taxPercent` float DEFAULT NULL CHECK (`taxPercent` >= 0 and `taxPercent` <= 1),
  `startHour` time DEFAULT NULL,
  `endHour` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `restaurant`
--

INSERT INTO `restaurant` (`restaurantID`, `restaurantName`, `cuisine`, `deliveryFee`, `rest_add`, `taxPercent`, `startHour`, `endHour`) VALUES
(1, 'McDonalds', 'American', 7, 'a McStreet number', 0.13, '09:30:00', '23:00:00'),
(2, 'KFC', 'International', 10, 'kfc address', 0.14, '09:30:00', '21:30:00'),
(3, 'PizzaHut', 'Italian', 8, 'pizza hut address', 0.16, '10:00:00', '22:00:00'),
(4, 'minuman enak', 'American', 1, 'Florida', 1, '00:30:30', '01:00:00'),
(5, 'Pojok Taraman', 'American', 2, 'Sleman', 0.8, '08:00:00', '01:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `restaurantdeliveryarea`
--

CREATE TABLE `restaurantdeliveryarea` (
  `areaName` char(20) NOT NULL,
  `restaurantID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `restaurantdeliveryarea`
--

INSERT INTO `restaurantdeliveryarea` (`areaName`, `restaurantID`) VALUES
('6th Of October', 3),
('Heliopolis', 1),
('Heliopolis', 2),
('Heliopolis', 3),
('New Cairo', 2),
('Zamalek', 1);

-- --------------------------------------------------------

--
-- Table structure for table `restaurantmenu`
--

CREATE TABLE `restaurantmenu` (
  `menuType` char(15) NOT NULL,
  `restaurantID` int(11) NOT NULL,
  `startHour` time NOT NULL,
  `endHour` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `restaurantmenu`
--

INSERT INTO `restaurantmenu` (`menuType`, `restaurantID`, `startHour`, `endHour`) VALUES
('Breakfast', 1, '10:30:00', '23:30:00'),
('Dessert', 2, '18:30:00', '20:30:00'),
('Dessert', 3, '18:30:00', '20:30:00'),
('Dinner', 1, '19:30:00', '20:30:00'),
('Dinner', 2, '13:30:00', '22:30:00'),
('Dinner', 3, '13:30:00', '23:30:00'),
('Lunch', 1, '08:30:00', '22:30:00'),
('Lunch', 2, '11:30:00', '22:30:00'),
('Lunch', 3, '11:30:00', '21:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `restaurantmenuitem`
--

CREATE TABLE `restaurantmenuitem` (
  `menuType` char(15) NOT NULL,
  `restaurantID` int(11) NOT NULL,
  `menuItemName` char(25) NOT NULL,
  `basePrice` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `restaurantmenuitem`
--

INSERT INTO `restaurantmenuitem` (`menuType`, `restaurantID`, `menuItemName`, `basePrice`) VALUES
('Breakfast', 1, 'Omelettes', 15),
('Breakfast', 1, 'xdece', 234234),
('Dessert', 2, 'CheeseCake', 20),
('Dessert', 3, 'CinabbonBites', 25),
('Dinner', 1, 'Pancakes', 20),
('Dinner', 2, 'ChickenSalad', 25),
('Dinner', 3, 'ChickenWings', 25),
('Lunch', 1, 'BigMac', 30),
('Lunch', 1, 'BigTasty', 40),
('Lunch', 1, 'Roti', 10),
('Lunch', 2, 'ChickenPanne', 30),
('Lunch', 2, 'CrispyChicken', 35),
('Lunch', 2, 'Nuggets', 15),
('Lunch', 3, 'MargueritaPizza', 35),
('Lunch', 3, 'PepperoniPizza', 45),
('Lunch', 3, 'SeafoodPizza', 60);

-- --------------------------------------------------------

--
-- Table structure for table `restaurantmenuitemconfig`
--

CREATE TABLE `restaurantmenuitemconfig` (
  `menuType` char(15) NOT NULL,
  `restaurantID` int(11) NOT NULL,
  `menuItemName` char(25) NOT NULL,
  `configName` char(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `restaurantmenuitemconfig`
--

INSERT INTO `restaurantmenuitemconfig` (`menuType`, `restaurantID`, `menuItemName`, `configName`) VALUES
('Breakfast', 1, 'Omelettes', 'Large'),
('Breakfast', 1, 'Omelettes', 'Regular'),
('Breakfast', 1, 'Omelettes', 'Small'),
('Dessert', 2, 'CheeseCake', 'Regular'),
('Dessert', 2, 'CheeseCake', 'Small'),
('Dessert', 3, 'CinabbonBites', 'Regular'),
('Dessert', 3, 'CinabbonBites', 'Small'),
('Dinner', 1, 'Pancakes', 'Regular'),
('Dinner', 1, 'Pancakes', 'Small'),
('Dinner', 2, 'ChickenSalad', 'Regular'),
('Dinner', 2, 'ChickenSalad', 'Small'),
('Dinner', 3, 'ChickenWings', 'Regular'),
('Dinner', 3, 'ChickenWings', 'Small'),
('Lunch', 1, 'BigMac', 'Combo - Small'),
('Lunch', 1, 'BigMac', 'Regular'),
('Lunch', 1, 'BigTasty', 'Combo - Large'),
('Lunch', 1, 'BigTasty', 'Regular'),
('Lunch', 1, 'Roti', 'Combo - Small'),
('Lunch', 2, 'ChickenPanne', 'Combo - Small'),
('Lunch', 2, 'ChickenPanne', 'Regular'),
('Lunch', 2, 'CrispyChicken', 'Combo - Large'),
('Lunch', 2, 'CrispyChicken', 'Regular'),
('Lunch', 2, 'Nuggets', 'Regular'),
('Lunch', 3, 'MargueritaPizza', 'Large'),
('Lunch', 3, 'MargueritaPizza', 'Regular'),
('Lunch', 3, 'PepperoniPizza', 'Large'),
('Lunch', 3, 'PepperoniPizza', 'Regular'),
('Lunch', 3, 'SeafoodPizza', 'Large');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `username` char(20) NOT NULL,
  `userType` char(20) NOT NULL,
  `phoneNo` char(11) NOT NULL,
  `email` char(40) NOT NULL,
  `Fname` char(15) NOT NULL,
  `Lname` char(15) NOT NULL,
  `hashedPwd` char(70) NOT NULL,
  `Bdate` date DEFAULT NULL,
  `userStatusName` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`username`, `userType`, `phoneNo`, `email`, `Fname`, `Lname`, `hashedPwd`, `Bdate`, `userStatusName`) VALUES
('aaaaaa', 'end_user', '09000000000', 'aaa@gmail.com', 'Aku', 'Kamu', '12345', '2001-01-01', 'alive'),
('anafaridah', 'end_user', '08989898989', 'ana@gmail.com', 'Ana', 'Nurfaridah', 'ana123', NULL, 'alive'),
('elnaz', 'end_user', '08212121212', 'ell@gmail.com', 'ell', 'vaa', '12345', NULL, 'alive'),
('elva123', 'end_user', '08123456789', 'nazlitaelva@gmail.com', 'Elva', 'Nazlita', 'elva12345', '2003-11-24', 'alive'),
('elvanaz', 'admin', '08234545454', 'elvanaz@gmail.com', 'Elva', 'Nazlita', '11111', '2003-07-07', 'alive'),
('johnadmin', 'admin', '55381238', 'admin@email', 'john', 'admin', '123', '2001-01-15', 'alive'),
('johnstaff', 'staff', '82381238', 'usser@email', 'john', 'user', '123', '2001-01-15', 'alive'),
('johnuser', 'end_user', '88172381238', 'user@email', 'john', 'user', '123', '2001-01-15', 'alive'),
('naah123', 'admin', '08123456123', 'naah@gmail.com', 'nanaa', 'naah', '12345', '2000-12-12', 'alive'),
('nazlita', 'end_user', '01111111111', 'naaaaz@gmail.com', 'nazlita', 'admin', '12345', '2000-11-11', 'alive'),
('nazzzz', 'end_user', '08912121212', 'naz@gmail.com', 'nazlita', 'mau', '11111', NULL, 'alive'),
('rhmh', 'admin', '08978967856', 'roohmahs@gmail.com', 'Rohmah', 'Setya', '33333', '2003-08-09', 'alive'),
('rohmah123', 'end_user', '08234567890', 'rohmah@gmail.com', 'Rohmah', 'Setyaningsih', '9eLFOA95Hg', '2003-12-12', 'alive');

-- --------------------------------------------------------

--
-- Table structure for table `useraddress`
--

CREATE TABLE `useraddress` (
  `userAddNo` int(11) NOT NULL,
  `username` char(20) DEFAULT NULL,
  `areaName` char(20) NOT NULL,
  `addressLine1` char(20) NOT NULL,
  `addressLine2` char(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `useraddress`
--

INSERT INTO `useraddress` (`userAddNo`, `username`, `areaName`, `addressLine1`, `addressLine2`) VALUES
(1, 'johnuser', 'Heliopolis', 'address desc 1', 'Address No 1'),
(2, 'johnuser', 'Zamalek', 'address desc 2', 'Address No 2'),
(3, 'johnuser', 'New Cairo', 'address desc 3', 'Address No 3'),
(4, 'johnstaff', '6th of October', 'address desc 1', 'Address No 4'),
(5, 'johnstaff', 'Zamalek', 'address desc 2', 'Address No 5'),
(6, 'johnadmin', 'Heliopolis', 'address desc 1', 'Address No 6'),
(7, 'johnadmin', 'Zamalek', 'address desc 2', 'Address No 7'),
(8, 'johnadmin', 'Zamalek', 'sambel tomat', 'Address No 8'),
(9, 'elva123', 'Dokki', 'Taraman', 'Sleman');

-- --------------------------------------------------------

--
-- Table structure for table `usercat`
--

CREATE TABLE `usercat` (
  `userType` char(20) NOT NULL,
  `description` char(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `usercat`
--

INSERT INTO `usercat` (`userType`, `description`) VALUES
('admin', 'A System Administrator'),
('end_user', 'The End User / Client'),
('staff', 'An Ordering Staff Member');

-- --------------------------------------------------------

--
-- Table structure for table `userstatus`
--

CREATE TABLE `userstatus` (
  `userStatusName` char(20) NOT NULL,
  `description` char(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `userstatus`
--

INSERT INTO `userstatus` (`userStatusName`, `description`) VALUES
('alive', 'The User is active in the system'),
('dead', 'The User has been deleted from the system');

-- --------------------------------------------------------

--
-- Structure for view `carttotal`
--
DROP TABLE IF EXISTS `carttotal`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `carttotal`  AS   (select distinct `cc`.`cartID` AS `cartID`,`rr`.`deliveryFee` + sum(`r`.`basePrice` * `ic`.`ratio` * (1 + `rr`.`taxPercent`) * `c`.`quantity` * (1 - if(`cc`.`discountID` is null,0,`d`.`rate`))) AS `total` from (((((`cart` `cc` join `cartitem` `c`) join `restaurantmenuitem` `r`) join `restaurant` `rr`) join `itemconfiguration` `ic`) join `discount` `d`) where `cc`.`cartID` = `c`.`CartID` and `cc`.`restaurantID` = `c`.`restaurantID` and `cc`.`restaurantID` = `r`.`restaurantID` and `cc`.`restaurantID` = `rr`.`restaurantID` and `c`.`configName` = `ic`.`configName` and `c`.`restaurantID` = `rr`.`restaurantID` and `c`.`menuType` = `r`.`menuType` and `c`.`restaurantID` = `r`.`restaurantID` and `c`.`menuItemName` = `r`.`menuItemName` and `r`.`restaurantID` = `rr`.`restaurantID` and (`d`.`discountID` = `cc`.`discountID` and `d`.`expiryDate` > curdate() or `cc`.`discountID` is null) group by `cc`.`cartID`,`d`.`discountID` order by `cc`.`cartID`)  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cartID`),
  ADD KEY `rest_name_fk` (`restaurantID`),
  ADD KEY `orderedByAdd_fk` (`orderedByAddNo`),
  ADD KEY `orderedByName_fk` (`orderedByName`),
  ADD KEY `discount_fk` (`discountID`),
  ADD KEY `status_fk` (`statusName`);

--
-- Indexes for table `cartitem`
--
ALTER TABLE `cartitem`
  ADD PRIMARY KEY (`CartID`,`menuType`,`restaurantID`,`menuItemName`,`configName`),
  ADD KEY `menu_item_config_fk` (`menuType`,`restaurantID`,`menuItemName`,`configName`);

--
-- Indexes for table `cuisine`
--
ALTER TABLE `cuisine`
  ADD PRIMARY KEY (`cuisineName`);

--
-- Indexes for table `deliveryarea`
--
ALTER TABLE `deliveryarea`
  ADD PRIMARY KEY (`areaName`);

--
-- Indexes for table `discount`
--
ALTER TABLE `discount`
  ADD PRIMARY KEY (`discountID`);

--
-- Indexes for table `itemconfiguration`
--
ALTER TABLE `itemconfiguration`
  ADD PRIMARY KEY (`configName`);

--
-- Indexes for table `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`logTime`),
  ADD KEY `logtype_fk` (`logTypeName`),
  ADD KEY `changedOn_fk` (`changedOnName`),
  ADD KEY `changedBy_fk` (`changedByName`);

--
-- Indexes for table `logtype`
--
ALTER TABLE `logtype`
  ADD PRIMARY KEY (`logTypeName`);

--
-- Indexes for table `menutype`
--
ALTER TABLE `menutype`
  ADD PRIMARY KEY (`menuType`);

--
-- Indexes for table `orderstatus`
--
ALTER TABLE `orderstatus`
  ADD PRIMARY KEY (`statusName`);

--
-- Indexes for table `restaurant`
--
ALTER TABLE `restaurant`
  ADD PRIMARY KEY (`restaurantID`),
  ADD UNIQUE KEY `restaurantName` (`restaurantName`),
  ADD KEY `cuisine_fk` (`cuisine`);

--
-- Indexes for table `restaurantdeliveryarea`
--
ALTER TABLE `restaurantdeliveryarea`
  ADD PRIMARY KEY (`areaName`,`restaurantID`),
  ADD KEY `rest_fk` (`restaurantID`);

--
-- Indexes for table `restaurantmenu`
--
ALTER TABLE `restaurantmenu`
  ADD PRIMARY KEY (`menuType`,`restaurantID`);

--
-- Indexes for table `restaurantmenuitem`
--
ALTER TABLE `restaurantmenuitem`
  ADD PRIMARY KEY (`menuType`,`restaurantID`,`menuItemName`);

--
-- Indexes for table `restaurantmenuitemconfig`
--
ALTER TABLE `restaurantmenuitemconfig`
  ADD PRIMARY KEY (`menuType`,`restaurantID`,`menuItemName`,`configName`),
  ADD KEY `config_fk` (`configName`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`username`),
  ADD UNIQUE KEY `phoneNo` (`phoneNo`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `usertype_fk` (`userType`),
  ADD KEY `userstatus_fk` (`userStatusName`);

--
-- Indexes for table `useraddress`
--
ALTER TABLE `useraddress`
  ADD PRIMARY KEY (`userAddNo`),
  ADD KEY `user_add_area_fk` (`areaName`),
  ADD KEY `user_add_name_fk` (`username`);

--
-- Indexes for table `usercat`
--
ALTER TABLE `usercat`
  ADD PRIMARY KEY (`userType`);

--
-- Indexes for table `userstatus`
--
ALTER TABLE `userstatus`
  ADD PRIMARY KEY (`userStatusName`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cartID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `restaurant`
--
ALTER TABLE `restaurant`
  MODIFY `restaurantID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `useraddress`
--
ALTER TABLE `useraddress`
  MODIFY `userAddNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `discount_fk` FOREIGN KEY (`discountID`) REFERENCES `discount` (`discountID`),
  ADD CONSTRAINT `orderedByAdd_fk` FOREIGN KEY (`orderedByAddNo`) REFERENCES `useraddress` (`userAddNo`),
  ADD CONSTRAINT `orderedByName_fk` FOREIGN KEY (`orderedByName`) REFERENCES `user` (`username`),
  ADD CONSTRAINT `rest_name_fk` FOREIGN KEY (`restaurantID`) REFERENCES `restaurant` (`restaurantID`),
  ADD CONSTRAINT `status_fk` FOREIGN KEY (`statusName`) REFERENCES `orderstatus` (`statusName`);

--
-- Constraints for table `cartitem`
--
ALTER TABLE `cartitem`
  ADD CONSTRAINT `cart_fk` FOREIGN KEY (`CartID`) REFERENCES `cart` (`cartID`),
  ADD CONSTRAINT `menu_item_config_fk` FOREIGN KEY (`menuType`,`restaurantID`,`menuItemName`,`configName`) REFERENCES `restaurantmenuitemconfig` (`menuType`, `restaurantID`, `menuItemName`, `configName`);

--
-- Constraints for table `log`
--
ALTER TABLE `log`
  ADD CONSTRAINT `changedBy_fk` FOREIGN KEY (`changedByName`) REFERENCES `user` (`username`),
  ADD CONSTRAINT `changedOn_fk` FOREIGN KEY (`changedOnName`) REFERENCES `user` (`username`),
  ADD CONSTRAINT `logtype_fk` FOREIGN KEY (`logTypeName`) REFERENCES `logtype` (`logTypeName`);

--
-- Constraints for table `restaurant`
--
ALTER TABLE `restaurant`
  ADD CONSTRAINT `cuisine_fk` FOREIGN KEY (`cuisine`) REFERENCES `cuisine` (`cuisineName`);

--
-- Constraints for table `restaurantdeliveryarea`
--
ALTER TABLE `restaurantdeliveryarea`
  ADD CONSTRAINT `area_fk` FOREIGN KEY (`areaName`) REFERENCES `deliveryarea` (`areaName`),
  ADD CONSTRAINT `rest_fk` FOREIGN KEY (`restaurantID`) REFERENCES `restaurant` (`restaurantID`);

--
-- Constraints for table `restaurantmenu`
--
ALTER TABLE `restaurantmenu`
  ADD CONSTRAINT `menuType_fk` FOREIGN KEY (`menuType`) REFERENCES `menutype` (`menuType`);

--
-- Constraints for table `restaurantmenuitem`
--
ALTER TABLE `restaurantmenuitem`
  ADD CONSTRAINT `restaurant_menu_fk` FOREIGN KEY (`menuType`,`restaurantID`) REFERENCES `restaurantmenu` (`menuType`, `restaurantID`);

--
-- Constraints for table `restaurantmenuitemconfig`
--
ALTER TABLE `restaurantmenuitemconfig`
  ADD CONSTRAINT `config_fk` FOREIGN KEY (`configName`) REFERENCES `itemconfiguration` (`configName`),
  ADD CONSTRAINT `restaurant_menu_item_fk` FOREIGN KEY (`menuType`,`restaurantID`,`menuItemName`) REFERENCES `restaurantmenuitem` (`menuType`, `restaurantID`, `menuItemName`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `userstatus_fk` FOREIGN KEY (`userStatusName`) REFERENCES `userstatus` (`userStatusName`),
  ADD CONSTRAINT `usertype_fk` FOREIGN KEY (`userType`) REFERENCES `usercat` (`userType`);

--
-- Constraints for table `useraddress`
--
ALTER TABLE `useraddress`
  ADD CONSTRAINT `user_add_area_fk` FOREIGN KEY (`areaName`) REFERENCES `deliveryarea` (`areaName`),
  ADD CONSTRAINT `user_add_name_fk` FOREIGN KEY (`username`) REFERENCES `user` (`username`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
