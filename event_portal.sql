-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 29, 2021 at 08:56 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `event portal`
--

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `EventID` int(11) NOT NULL,
  `Event_Creator` varchar(50) NOT NULL,
  `Event_Name` varchar(50) NOT NULL,
  `Short_Description` varchar(1000) NOT NULL,
  `Entry_fees` varchar(20) DEFAULT NULL,
  `Event_Coordinators` varchar(1000) NOT NULL,
  `Prize` varchar(300) DEFAULT NULL,
  `Event_Rules` varchar(1000) NOT NULL,
  `Participant_Type` varchar(20) NOT NULL,
  `Last_Date` date NOT NULL,
  `Event_Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`EventID`, `Event_Creator`, `Event_Name`, `Short_Description`, `Entry_fees`, `Event_Coordinators`, `Prize`, `Event_Rules`, `Participant_Type`, `Last_Date`, `Event_Date`) VALUES
(23, 'ICONS', 'Infospark', 'Tech Fest', '', 'Manjusha Tatiya', '', 'Demo rules', '4', '2021-07-02', '2021-07-30'),
(24, 'MESA', 'Treasure Hunt', 'Searching fun items', '35', 'Student Council and MESA', '500', 'Demo rules', '2', '2021-07-02', '2021-07-17');

-- --------------------------------------------------------

--
-- Table structure for table `participants`
--

CREATE TABLE `participants` (
  `ParticipantID` int(10) NOT NULL,
  `Participant_Name` varchar(50) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Mobile` varchar(10) NOT NULL,
  `Team_Members` varchar(100) DEFAULT NULL,
  `Event_Name` varchar(50) NOT NULL,
  `Event_Creator` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `participants`
--

INSERT INTO `participants` (`ParticipantID`, `Participant_Name`, `Username`, `Email`, `Mobile`, `Team_Members`, `Event_Name`, `Event_Creator`) VALUES
(16, 'Rajita Roy', 'rajita.roy@indiraicem.ac.in', 'rajita.roy@indiraicem.ac.in', '8100580060', 'Bhavesh Sharma, Prathamesh Shinde, Ruturaj Patil', 'Infospark', 'ICONS'),
(17, 'Bhavesh Sharma', 'rajita.roy@indiraicem.ac.in', 'royrajita6@gmail.com', '8100580060', 'Rajita Roy', 'Treasure Hunt', 'MESA');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `amount` int(11) NOT NULL,
  `payment_status` varchar(50) NOT NULL,
  `payment_id` varchar(60) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`id`, `name`, `amount`, `payment_status`, `payment_id`, `added_on`) VALUES
(12, 'Bhavesh Sharma', 35, 'complete', 'pay_HSmFWDZFclqk3P', '2021-06-29 08:31:56');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `UserID` int(11) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Username` varchar(30) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `Created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `UserType` varchar(20) NOT NULL DEFAULT 'participant'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UserID`, `Name`, `Username`, `Password`, `Created_at`, `UserType`) VALUES
(1, 'ICONS', 'icons@indiraicem.ac.in', '25c481cf6cda58eed02a921009320f37', '2021-03-18 17:50:42', 'organizer'),
(6, 'MESA', 'mesa@indiraicem.ac.in', 'aabd0957e66f1ca641e55fe3990055f1', '2021-03-19 00:56:47', 'organizer'),
(7, 'CESA', 'cesa@indiraicem.ac.in', 'd8ade3a2738973680e5496c306350c1d', '2021-03-19 00:59:05', 'organizer'),
(8, 'FESA', 'fesa@indiraicem.ac.in', 'cd38c389b13dd2b3ba404dc3d7cac9dd', '2021-03-19 01:00:02', 'organizer'),
(9, 'Student Council', 'studentcouncil@indiraicem.ac.i', '738116e65b4f68988b814bf341723e94', '2021-03-19 01:01:43', 'organizer'),
(28, 'Rajita Roy', 'rajita.roy@indiraicem.ac.in', '81dc9bdb52d04dc20036dbd8313ed055', '2021-06-29 11:58:03', 'participant');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`EventID`),
  ADD UNIQUE KEY `Event_Name` (`Event_Name`);

--
-- Indexes for table `participants`
--
ALTER TABLE `participants`
  ADD PRIMARY KEY (`ParticipantID`),
  ADD KEY `Event_Name_FK` (`Event_Name`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserID`),
  ADD UNIQUE KEY `username_index` (`Username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `EventID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `participants`
--
ALTER TABLE `participants`
  MODIFY `ParticipantID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `participants`
--
ALTER TABLE `participants`
  ADD CONSTRAINT `Event_Name_FK` FOREIGN KEY (`Event_Name`) REFERENCES `events` (`Event_Name`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
