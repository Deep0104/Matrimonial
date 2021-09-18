-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 18, 2021 at 06:19 AM
-- Server version: 5.7.17
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `matri`
--

-- --------------------------------------------------------

--
-- Table structure for table `base`
--

CREATE TABLE `base` (
  `sn` int(10) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `mobile` varchar(100) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `caste` varchar(100) NOT NULL,
  `religion` varchar(100) NOT NULL,
  `dob` varchar(100) NOT NULL,
  `address` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `occupation` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `base`
--

INSERT INTO `base` (`sn`, `fname`, `lname`, `mobile`, `gender`, `caste`, `religion`, `dob`, `address`, `email`, `pass`, `occupation`, `code`) VALUES
(1, 'Ankit', 'Kumar', '7374087417', 'male', 'YOGI', 'hindu', '11-6-1990', 'Chirawa', 'deepak@gmail.com', '456', 'Doctor', 'DJQuw5_1'),
(2, 'Ajay', 'Yadav', '82095442241', 'male', 'YADAV', 'hindu', '9-6-1999', 'shimla', 'ajay@gmail.com', '123456', 'Engineer', 'DJKNp4_2'),
(3, 'Ankit ', 'Yogi', '2889658741', 'male', 'YOGI', 'hindu', '-1986', 'Jaipur', 'ankit@gmail.com', '123456', 'Engineer', 'Vghqv7_3'),
(4, 'Sunil', 'Poonia', '5482148515', 'male', 'JAAT', 'hindu', '8-4-1991', '', 'sunil@gmail.com', '123', 'Engineer', 'FSx139_4'),
(5, 'Shivani', 'Rohilla', '7894254655', 'female', 'JAAT', 'hindu', '10-5-1996', 'Delhi', 'shivani@gmail.com', '4561', 'Engineer', 'AMWow3_5'),
(6, 'Disha', 'Patani', '789525846', 'female', 'KAPOOR', 'hindu', '5-5-1990', 'Mumbai', 'disha@gmail.com', '4561', 'Other', 'IORbm8_6'),
(7, 'Aman', 'Yogi', '4569871235', 'male', 'YOGI', 'hindu', '13-3-1992', 'Chirawa', 'aman@gmail.com', '123', 'Engineer', 'Aafgi3_7'),
(8, 'Manisha', 'kumari', '7891098851', 'female', 'YOGI', 'hindu', '3-3-1998', 'delhi', 'manisha@gmail.com', '456123', 'Civil', 'PTtu12_8'),
(9, 'Arpit', 'Sharma', '4586971235', 'male', 'SHARMA', 'hindu', '10-8-1978', 'Churu', 'arpit@gmail.com', '4561', 'Engineer', 'ADFTYv_9'),
(10, 'Sonam', 'Choudhary', '4569821372', 'male', 'JAAT', 'hindu', '2-8-1990', 'Mumbai', 'sonam@gmail.com', '7894', 'Civil', 'NThy05_10'),
(11, 'Shainace', 'Shrestha', '1234567892', 'female', 'KAPOOR', 'christian', '1-5-1995', 'Mumbai', 'shainace@gmail.com', '7891', 'Other', 'IKlp04_11'),
(12, 'Niharika', 'Jatu', '7285746852', 'female', 'YOGI', 'hindu', '8-10-1998', 'vill-Bhakharana', 'nanu@gmail.com', '789', 'Engineer', 'FGHRy2_12'),
(13, 'Rani', 'Meena', '4857958568', 'male', 'MEENA', 'hindu', '5-4-2000', 'Dausa', 'rani@gmail.com', '456', 'Student', 'LuBas13');

-- --------------------------------------------------------

--
-- Table structure for table `inbox`
--

CREATE TABLE `inbox` (
  `sn` int(11) NOT NULL,
  `code` varchar(100) NOT NULL,
  `tcode` varchar(100) NOT NULL,
  `tos` varchar(200) NOT NULL,
  `fcode` varchar(100) NOT NULL,
  `froms` varchar(255) NOT NULL,
  `date` varchar(20) NOT NULL,
  `msg` varchar(3000) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inbox`
--

INSERT INTO `inbox` (`sn`, `code`, `tcode`, `tos`, `fcode`, `froms`, `date`, `msg`) VALUES
(1, 'ATVapu6_1', 'Vghqv7_3', 'ankit@gmail.com', 'DJQuw5_1', 'deepak@gmail.com', '11 Apr,2020', 'Hello'),
(2, 'Jfilnpz_2', 'Vghqv7_3', 'ankit@gmail.com', 'DJQuw5_1', 'deepak@gmail.com', '12 Apr,2020', 'hello how are you\r\n'),
(3, 'CFJUYZr_3', 'DJQuw5_1', 'deepak@gmail.com', 'Vghqv7_3', 'ankit@gmail.com', '12 Apr,2020', 'hello\r\n'),
(4, 'BWquwx9_4', 'FSx139_4', 'sunil@gmail.com', 'DJKNp4_2', 'ajay@gmail.com', '25 Apr,2020', 'hiii\r\n'),
(5, 'GYbhjt6_5', 'FSx139_4', 'sunil@gmail.com', 'IORbm8_6', 'disha@gmail.com', '26 Apr,2020', 'hey '),
(6, 'KVWfk14_6', 'FSx139_4', 'sunil@gmail.com', 'IORbm8_6', 'disha@gmail.com', '26 Apr,2020', 'kse ho marcos'),
(7, 'FKLXbi8_7', 'AMWow3_5', 'shivani@gmail.com', 'Aafgi3_7', 'aman@gmail.com', '26 Apr,2020', 'hello\r\n'),
(8, 'KNdmuvz_8', 'Aafgi3_7', 'aman@gmail.com', 'AMWow3_5', 'shivani@gmail.com', '26 Apr,2020', 'hello\r\n'),
(9, 'DFUefqt_9', 'Aafgi3_7', 'aman@gmail.com', 'DJQuw5_1', 'deepak@gmail.com', '26 Apr,2020', 'hii'),
(10, 'EORTlt0_10', 'FSx139_4', 'sunil@gmail.com', 'DJQuw5_1', 'deepak@gmail.com', '27 Apr,2020', 'hello'),
(11, 'BIMcgh5_11', 'FSx139_4', 'sunil@gmail.com', 'AMWow3_5', 'shivani@gmail.com', '07 May,2020', 'hello\r\n'),
(12, 'NRUYgyz_12', 'FSx139_4', 'sunil@gmail.com', 'Aafgi3_7', 'aman@gmail.com', '07 May,2020', 'hey\r\n'),
(13, 'efgopx5_13', 'PTtu12_8', 'manisha@gmail.com', 'DJQuw5_1', 'deepak@gmail.com', '22 Jun,2020', 'hiii'),
(14, 'AJQby38_14', 'FGHRy2_12', 'nanu@gmail.com', 'DJQuw5_1', 'deepak@gmail.com', '24 Jun,2020', 'hiii'),
(15, 'xXFRbt_15', 'Aafgi3_7', 'aman@gmail.com', 'DJQuw5_1', 'deepak@gmail.com', '10-7-2020', 'jsp'),
(16, 'UiNwlx_16', 'Aafgi3_7', 'aman@gmail.com', 'DJQuw5_1', 'deepak@gmail.com', '10-7-2020', 'jsp'),
(17, 'c7ySFB_17', 'Aafgi3_7', 'aman@gmail.com', 'DJQuw5_1', 'deepak@gmail.com', '10-7-2020', 'hi\r\n'),
(18, 'rpbDN8_18', 'AMWow3_5', 'shivani@gmail.com', 'DJQuw5_1', 'deepak@gmail.com', '10-7-2020', 'hello'),
(19, 'V4jprM_19', 'AMWow3_5', 'shivani@gmail.com', 'DJQuw5_1', 'deepak@gmail.com', '10-7-2020', 'hello');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
