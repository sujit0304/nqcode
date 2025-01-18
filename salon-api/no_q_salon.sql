-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 30, 2024 at 12:30 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `no_q_salon`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking_slot_master`
--

CREATE TABLE IF NOT EXISTS `booking_slot_master` (
  `slot_id` int(11) NOT NULL AUTO_INCREMENT,
  `slot_time` varchar(50) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`slot_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=57 ;

--
-- Dumping data for table `booking_slot_master`
--

INSERT INTO `booking_slot_master` (`slot_id`, `slot_time`, `status`) VALUES
(1, '8:00 AM to 08:15 AM', 0),
(2, '8:15 AM to 08:30 AM', 0),
(3, '8:30 AM to 08:45 AM', 0),
(4, '8:45 AM to 09:00 AM', 0),
(5, '09:00 AM to 09:15 AM', 0),
(6, '09:15 AM to 09:30 AM', 0),
(7, '09:30 AM to 09:45 AM', 0),
(8, '09:45 AM to 10:00 AM', 0),
(9, '10:00 AM to 10:15 AM', 0),
(10, '10:15 AM to 10:30 AM', 0),
(11, '10:30 AM to 10:45 AM', 0),
(12, '10:45 AM to 11:00 AM', 0),
(13, '11:00 AM to 11:15 AM', 0),
(14, '11:15 AM to 11:30 AM', 0),
(15, '11:30 AM to 11:45 AM', 0),
(16, '11:45 AM to 12:00 PM', 0),
(17, '12:00 PM to 12:15 PM', 0),
(18, '12:15 PM to 12:30 PM', 0),
(19, '12:30 PM to 12:45 PM', 0),
(20, '12:45 PM to 01:00 PM', 0),
(21, '01:00 PM to 01:15 PM', 0),
(22, '01:15 PM to 01:30 PM', 0),
(23, '01:30 PM to 01:45 PM', 0),
(24, '01:45 PM to 02:00 PM', 0),
(25, '02:00 PM to 02:15 PM', 0),
(26, '02:15 PM to 02:30 PM', 0),
(27, '02:30 PM to 02:45 PM', 0),
(28, '02:45 PM to 03:00 PM', 0),
(29, '03:00 PM to 03:15 PM', 0),
(30, '03:15 PM to 03:30 PM', 0),
(31, '03:30 PM to 03:45 PM', 0),
(32, '03:45 PM to 04:00 PM', 0),
(33, '04:00 PM to 04:15 PM', 0),
(34, '04:15 PM to 04:30 PM', 0),
(35, '04:30 PM to 04:45 PM', 0),
(36, '04:45 PM to 05:00 PM', 0),
(37, '05:00 PM to 05:15 PM', 0),
(38, '05:15 PM to 05:30 PM', 0),
(39, '05:30 PM to 05:45 PM', 0),
(40, '05:45 PM to 06:00 PM', 0),
(41, '06:00 PM to 06:15 PM', 0),
(42, '06:15 PM to 06:30 PM', 0),
(43, '06:30 PM to 06:45 PM', 0),
(44, '06:45 PM to 07:00 PM', 0),
(45, '07:00 PM to 07:15 PM', 0),
(46, '07:15 PM to 07:30 PM', 0),
(47, '07:30 PM to 07:45 PM', 0),
(48, '07:45 PM to 08:00 PM', 0),
(49, '08:00 PM to 08:15 PM', 0),
(50, '08:15 PM to 08:30 PM', 0),
(51, '08:30 PM to 08:45 PM', 0),
(52, '08:45 PM to 09:00 PM', 0),
(53, '09:00 PM to 09:15 PM', 0),
(54, '09:15 PM to 09:30 PM', 0),
(55, '09:30 PM to 09:45 PM', 0),
(56, '09:45 PM to 10:00 PM', 0);

-- --------------------------------------------------------

--
-- Table structure for table `customer_rating`
--

CREATE TABLE IF NOT EXISTS `customer_rating` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `vendorid` int(11) NOT NULL,
  `star_rating` float NOT NULL,
  `comments` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE IF NOT EXISTS `services` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vendorid` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` varchar(300) NOT NULL,
  `price` double NOT NULL,
  `offer` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `shop_list`
--

CREATE TABLE IF NOT EXISTS `shop_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_id` int(11) NOT NULL,
  `shop_name` varchar(200) NOT NULL,
  `shop_address` text NOT NULL,
  `landmark` varchar(200) NOT NULL,
  `pincode` int(50) NOT NULL,
  `latitude` varchar(100) NOT NULL,
  `longitute` varchar(100) NOT NULL,
  `shop_status` int(11) NOT NULL,
  `shop_image` text NOT NULL,
  `contact_no` varchar(50) NOT NULL,
  `alt_contact` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `added_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(50) NOT NULL,
  `password` varchar(200) NOT NULL,
  `firstName` varchar(200) NOT NULL,
  `lastName` varchar(200) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `mobile` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `userid`, `password`, `firstName`, `lastName`, `gender`, `mobile`) VALUES
(1, 'sujit@gmail.com', '123456', 'Sujit', 'Prajapati', 'Male', '9137837796');

-- --------------------------------------------------------

--
-- Table structure for table `user_appoinments`
--

CREATE TABLE IF NOT EXISTS `user_appoinments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `vendorid` int(11) NOT NULL,
  `appoinment_code` int(11) NOT NULL,
  `accept_by_vendor` int(11) NOT NULL,
  `appoinment_status` int(11) NOT NULL,
  `amount` double(5,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

CREATE TABLE IF NOT EXISTS `user_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Full_Name` varchar(250) NOT NULL,
  `Address` text NOT NULL,
  `latitude` varchar(50) NOT NULL,
  `langitute` varchar(50) NOT NULL,
  `pincode` varchar(50) NOT NULL,
  `contact` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user_token`
--

CREATE TABLE IF NOT EXISTS `user_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `token` text NOT NULL,
  `tokenIssueTime` datetime NOT NULL,
  `tokenExpiryTime` datetime NOT NULL,
  `tokenRefreshCount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `user_token`
--

INSERT INTO `user_token` (`id`, `userid`, `token`, `tokenIssueTime`, `tokenExpiryTime`, `tokenRefreshCount`) VALUES
(1, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1laWQiOiIxIiwibmJmIjoxNzI1NDI4Nzc3LCJleHAiOjE3MjU0MzA1NzcsImlhdCI6MTcyNTQyODc3N30.Vq4aAd7Tfk-sBKIK_o8DHKIT_Bsrp6tb6TJdeRRU7Wk', '2024-09-04 11:16:18', '2024-09-04 11:46:18', 0),
(2, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1laWQiOiIxIiwibmJmIjoxNzI1NzE0NjA0LCJleHAiOjE3MjU3MTY0MDQsImlhdCI6MTcyNTcxNDYwNH0.1jLkzak5dHDKgfvnZPeig8XzY_UavczU1Q0ryZYNmH0', '2024-09-07 18:40:05', '2024-09-07 19:10:05', 0),
(3, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1laWQiOiIxIiwibmJmIjoxNzI1NzE0NjM5LCJleHAiOjE3MjU3MTY0MzksImlhdCI6MTcyNTcxNDYzOX0.WUW64Jb3wag5jLxS7246W-XnrTO-ZUROLC4iTp6Y1BU', '2024-09-07 18:40:39', '2024-09-07 19:10:39', 0);

-- --------------------------------------------------------

--
-- Table structure for table `vendor_details`
--

CREATE TABLE IF NOT EXISTS `vendor_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_login_id` int(11) NOT NULL,
  `shop_name` varchar(200) NOT NULL,
  `shop_address` text NOT NULL,
  `landmark` text NOT NULL,
  `pincode` varchar(50) NOT NULL,
  `shop_open_time` varchar(50) NOT NULL,
  `shop_closed_time` varchar(50) NOT NULL,
  `no_of_chair` int(11) NOT NULL,
  `shop_status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vendor_login`
--

CREATE TABLE IF NOT EXISTS `vendor_login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `firstName` varchar(200) NOT NULL,
  `lastName` varchar(200) NOT NULL,
  `mobile` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vendor_token`
--

CREATE TABLE IF NOT EXISTS `vendor_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_login_id` int(11) NOT NULL,
  `token` text NOT NULL,
  `tokenIssueTime` datetime NOT NULL,
  `tokenExpiryTime` datetime NOT NULL,
  `tokenRefreshCount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
