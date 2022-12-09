-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 25, 2022 at 06:03 AM
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
-- Database: `ci4`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `app_id` int(11) NOT NULL,
  `pat_id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `app_schedule` datetime NOT NULL,
  `app_status` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`app_id`, `pat_id`, `staff_id`, `app_schedule`, `app_status`) VALUES
(4, 1, 13, '2022-08-30 18:12:00', 'Cancelled'),
(6, 1, 13, '2022-11-05 21:52:00', 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `inventory_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `dispense` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `total_price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`inventory_id`, `quantity`, `dispense`, `price`, `total_price`) VALUES
(11, 6, 1, 2, 12),
(12, 0, 2, 2, 0),
(13, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `medicine`
--

CREATE TABLE `medicine` (
  `med_id` int(11) NOT NULL,
  `med_name` varchar(30) NOT NULL,
  `med_description` text NOT NULL,
  `med_quantity` int(11) NOT NULL,
  `med_price` float NOT NULL,
  `med_totalprice` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `medicine`
--

INSERT INTO `medicine` (`med_id`, `med_name`, `med_description`, `med_quantity`, `med_price`, `med_totalprice`) VALUES
(1, 'gg', 'r', 0, 4, 0),
(2, 'aaa', 'dd', 2, 3, 6),
(3, 'diatabs', 'dfdf', 2, 3, 6);

-- --------------------------------------------------------

--
-- Table structure for table `med_dispense`
--

CREATE TABLE `med_dispense` (
  `dis_id` int(11) NOT NULL,
  `pat_id` int(11) NOT NULL,
  `med_id` int(11) NOT NULL,
  `dis_num` int(11) NOT NULL,
  `dis_date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `med_supplies`
--

CREATE TABLE `med_supplies` (
  `med_item_id` int(11) NOT NULL,
  `med_item_name` text NOT NULL,
  `med_item_description` text NOT NULL,
  `med_item_price` float NOT NULL,
  `med_item_quantity` int(11) NOT NULL,
  `med_item_totalprice` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `med_supplies`
--

INSERT INTO `med_supplies` (`med_item_id`, `med_item_name`, `med_item_description`, `med_item_price`, `med_item_quantity`, `med_item_totalprice`) VALUES
(1, 'band aid(box - 30pcs)', 'a piece of sticking plaster of a type having a gauze pad in the center, used to cover minor wounds.', 30, 1, 30),
(2, 'Green Cross Alcohol 70% Isopropyl 250ml', 'are used within medicine as an antiseptic, disinfectant, and antidote.', 48, 10, 480);

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `pat_id` int(11) NOT NULL,
  `pat_datecreated` date NOT NULL DEFAULT current_timestamp(),
  `pat_type` varchar(15) NOT NULL,
  `pat_fname` varchar(100) NOT NULL COMMENT 'Name',
  `pat_lname` varchar(100) NOT NULL COMMENT 'Course',
  `pat_mi` varchar(4) NOT NULL,
  `pat_suffix` varchar(4) NOT NULL,
  `pat_address` text NOT NULL,
  `pat_gender` varchar(11) NOT NULL,
  `pat_bdate` date DEFAULT NULL,
  `pat_bloodtype` varchar(11) NOT NULL,
  `pat_famhistory` text NOT NULL,
  `pat_contactnum` varchar(11) NOT NULL,
  `pat_emergencynum` varchar(11) DEFAULT NULL,
  `pat_email` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='datatable demo table';

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`pat_id`, `pat_datecreated`, `pat_type`, `pat_fname`, `pat_lname`, `pat_mi`, `pat_suffix`, `pat_address`, `pat_gender`, `pat_bdate`, `pat_bloodtype`, `pat_famhistory`, `pat_contactnum`, `pat_emergencynum`, `pat_email`) VALUES
(1, '2022-07-20', 'Applicants', 'Joey Anthony', 'Tuminez', 'E.', 'N/A', 'Brgy. Nagba, Tigbauan, Iloilo', 'Male', '2000-05-24', 'O', 'N/A', '09669663078', '09123900586', 'tuminezjoeyanthony@gmail.com'),
(2, '2022-10-08', 'Student', 'Ben', 'Nicolas', 'P.', 'NA', 'vvsvsvsvv', 'Male', '2022-10-08', 'O', 'N/A', '46464564646', '64765745747', 'ben.nicolas@students.isatu.edu');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `staff_id` int(11) NOT NULL,
  `staff_type` varchar(11) NOT NULL,
  `staff_fname` varchar(30) NOT NULL,
  `staff_lname` varchar(30) NOT NULL,
  `staff_suffix` varchar(4) NOT NULL,
  `staff_mi` varchar(3) NOT NULL,
  `staff_address` text NOT NULL,
  `staff_contactnum` varchar(11) NOT NULL,
  `staff_email` varchar(30) NOT NULL,
  `staff_licensenum` varchar(30) NOT NULL,
  `staff_specialization` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`staff_id`, `staff_type`, `staff_fname`, `staff_lname`, `staff_suffix`, `staff_mi`, `staff_address`, `staff_contactnum`, `staff_email`, `staff_licensenum`, `staff_specialization`) VALUES
(13, 'Doctor', 'Ben', 'Nicolas', '', 'P.', '', '', '', '', ''),
(14, 'Nurse', 'Ainnah Rose', 'Segotier', '', 'D.', '', '', '', '', ''),
(15, 'Nurse', 'Gilliane', 'Gortayo', '', 'S.', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `username`, `password`) VALUES
(1, 'admin', '$2y$10$fJXHxwEpSf/jamyxDDyJ7OSrPK5VoDXaVc8C7qrM6z/mfMZxfmhXG');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`app_id`),
  ADD KEY `pat_id` (`pat_id`,`staff_id`),
  ADD KEY `pat_id_2` (`pat_id`,`staff_id`),
  ADD KEY `pat_id_3` (`pat_id`),
  ADD KEY `appointment_ibfk_2` (`staff_id`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`inventory_id`);

--
-- Indexes for table `medicine`
--
ALTER TABLE `medicine`
  ADD PRIMARY KEY (`med_id`);

--
-- Indexes for table `med_dispense`
--
ALTER TABLE `med_dispense`
  ADD PRIMARY KEY (`dis_id`),
  ADD KEY `pat_id` (`pat_id`),
  ADD KEY `med_id` (`med_id`);

--
-- Indexes for table `med_supplies`
--
ALTER TABLE `med_supplies`
  ADD PRIMARY KEY (`med_item_id`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`pat_id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`staff_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `app_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `inventory_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `medicine`
--
ALTER TABLE `medicine`
  MODIFY `med_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `med_dispense`
--
ALTER TABLE `med_dispense`
  MODIFY `dis_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `med_supplies`
--
ALTER TABLE `med_supplies`
  MODIFY `med_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
  MODIFY `pat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `staff_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`pat_id`) REFERENCES `patient` (`pat_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `appointment_ibfk_2` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `med_dispense`
--
ALTER TABLE `med_dispense`
  ADD CONSTRAINT `med_dispense_ibfk_1` FOREIGN KEY (`pat_id`) REFERENCES `patient` (`pat_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `med_dispense_ibfk_2` FOREIGN KEY (`med_id`) REFERENCES `medicine` (`med_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
