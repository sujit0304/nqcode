-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 18, 2025 at 06:12 AM
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=28 ;

--
-- Dumping data for table `user_token`
--

INSERT INTO `user_token` (`id`, `userid`, `token`, `tokenIssueTime`, `tokenExpiryTime`, `tokenRefreshCount`) VALUES
(1, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1laWQiOiIxIiwibmJmIjoxNzI1NDI4Nzc3LCJleHAiOjE3MjU0MzA1NzcsImlhdCI6MTcyNTQyODc3N30.Vq4aAd7Tfk-sBKIK_o8DHKIT_Bsrp6tb6TJdeRRU7Wk', '2024-09-04 11:16:18', '2024-09-04 11:46:18', 0),
(2, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1laWQiOiIxIiwibmJmIjoxNzI1NzE0NjA0LCJleHAiOjE3MjU3MTY0MDQsImlhdCI6MTcyNTcxNDYwNH0.1jLkzak5dHDKgfvnZPeig8XzY_UavczU1Q0ryZYNmH0', '2024-09-07 18:40:05', '2024-09-07 19:10:05', 0),
(3, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1laWQiOiIxIiwibmJmIjoxNzI1NzE0NjM5LCJleHAiOjE3MjU3MTY0MzksImlhdCI6MTcyNTcxNDYzOX0.WUW64Jb3wag5jLxS7246W-XnrTO-ZUROLC4iTp6Y1BU', '2024-09-07 18:40:39', '2024-09-07 19:10:39', 0),
(4, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1laWQiOiIxIiwibmJmIjoxNzM3MDAzMTk4LCJleHAiOjE3MzcwMDQ5OTcsImlhdCI6MTczNzAwMzE5OH0.3ONXJIIXcTOULPLTSl2JOtwcNHnovD0XKRRNN5UG-Qc', '2025-01-16 10:23:18', '2025-01-16 10:53:18', 0),
(5, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1laWQiOiIxIiwibmJmIjoxNzM3MDA4OTE3LCJleHAiOjE3MzcwMTA3MTYsImlhdCI6MTczNzAwODkxN30.3edzAJpieTLm2KZVZ3HViiku6XuE_tBQqicKRLzhwvU', '2025-01-16 11:58:37', '2025-01-16 12:28:37', 0),
(6, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1laWQiOiIxIiwibmJmIjoxNzM3MDA4OTUwLCJleHAiOjE3MzcwMTA3NTAsImlhdCI6MTczNzAwODk1MH0.tIuralPNpDP7EaqfxmPhVKAM8LoeaqNWhObJ_m1IU74', '2025-01-16 11:59:10', '2025-01-16 12:29:10', 0),
(7, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1laWQiOiIxIiwibmJmIjoxNzM3MDA5MzYzLCJleHAiOjE3MzcwMTExNjMsImlhdCI6MTczNzAwOTM2M30.KJuS3GSSvqsj8t7zImU9CLcDx4VlxF_NjwakX_Po7JQ', '2025-01-16 12:06:03', '2025-01-16 12:36:03', 0),
(8, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1laWQiOiIxIiwibmJmIjoxNzM3MDA5NDMxLCJleHAiOjE3MzcwMTEyMzAsImlhdCI6MTczNzAwOTQzMX0.y4n7-eOTP2XMqXd2lTQuVO6iFfVtHBqeOcMgA9LgTV0', '2025-01-16 12:07:11', '2025-01-16 12:37:11', 0),
(9, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1laWQiOiIxIiwibmJmIjoxNzM3MDA5NzAzLCJleHAiOjE3MzcwMTE1MDMsImlhdCI6MTczNzAwOTcwM30.i8pNGnLMwnn6BmkmyWEMyx4maHd_sgF6vQrJsZdTbPk', '2025-01-16 12:11:43', '2025-01-16 12:41:43', 0),
(10, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1laWQiOiIxIiwibmJmIjoxNzM3MDA5NzU0LCJleHAiOjE3MzcwMTE1NTQsImlhdCI6MTczNzAwOTc1NH0.qgWDxGX_qLfSsaQz3pUGgqlyaBgsK7TyXIZxjDXhdlQ', '2025-01-16 12:12:34', '2025-01-16 12:42:34', 0),
(11, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1laWQiOiIxIiwibmJmIjoxNzM3MDA5ODEyLCJleHAiOjE3MzcwMTE2MTIsImlhdCI6MTczNzAwOTgxMn0.pp9pCMzd1Zd-DeIjh8QBLsp3_JqOnHkOzGuzRkrHEks', '2025-01-16 12:13:32', '2025-01-16 12:43:32', 0),
(12, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1laWQiOiIxIiwibmJmIjoxNzM3MDA5ODE2LCJleHAiOjE3MzcwMTE2MTYsImlhdCI6MTczNzAwOTgxNn0.jxHCJ5W4A6RGFqYwXeUQvlBUtSYFpbyx5MAMQb1XFGk', '2025-01-16 12:13:36', '2025-01-16 12:43:36', 0),
(13, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1laWQiOiIxIiwibmJmIjoxNzM3MDA5ODQ1LCJleHAiOjE3MzcwMTE2NDUsImlhdCI6MTczNzAwOTg0NX0.bLbR6hSeW6nHCWOIhMeomBHC0ghbhrSDLn5e9Nj4X3w', '2025-01-16 12:14:05', '2025-01-16 12:44:05', 0),
(14, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1laWQiOiIxIiwibmJmIjoxNzM3MDEwMDc1LCJleHAiOjE3MzcwMTE4NzQsImlhdCI6MTczNzAxMDA3NX0.ww-owfV3MJEJSQcyYtN8Iz7wPBj6gH8dq8Vp0BIWW6I', '2025-01-16 12:17:55', '2025-01-16 12:47:55', 0),
(15, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1laWQiOiIxIiwibmJmIjoxNzM3MDEwMTUyLCJleHAiOjE3MzcwMTE5NTIsImlhdCI6MTczNzAxMDE1Mn0.IPiHH1LJEQctODL-30EB9ikaGhcNrRc0Kl2FXPjRDvI', '2025-01-16 12:19:12', '2025-01-16 12:49:12', 0),
(16, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1laWQiOiIxIiwibmJmIjoxNzM3MDEwMzQwLCJleHAiOjE3MzcwMTIxNDAsImlhdCI6MTczNzAxMDM0MH0.Pv0nljr6dYFhj7ZyxEo6MMWQFVqqDH_CCLUxF2WW-uU', '2025-01-16 12:22:20', '2025-01-16 12:52:20', 0),
(17, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1laWQiOiIxIiwibmJmIjoxNzM3MDEwNzM0LCJleHAiOjE3MzcwMTI1MzQsImlhdCI6MTczNzAxMDczNH0.sv9erTIZnDWXmPvAReFKLwmKbuVsoxMvQnplgWrVGjA', '2025-01-16 12:28:54', '2025-01-16 12:58:54', 0),
(18, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1laWQiOiIxIiwibmJmIjoxNzM3MDEwNzc0LCJleHAiOjE3MzcwMTI1NzQsImlhdCI6MTczNzAxMDc3NH0.3crt6bNnWNA-QbXImf3m5V3VwZD6heYPB5v5T3usmpY', '2025-01-16 12:29:34', '2025-01-16 12:59:34', 0),
(19, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1laWQiOiIxIiwibmJmIjoxNzM3MDI0NzQwLCJleHAiOjE3MzcwMjY1NDAsImlhdCI6MTczNzAyNDc0MH0.93uBz58IFDKVXCt9uMSTOSLAHksRA8w55QZauo1CWaI', '2025-01-16 16:22:20', '2025-01-16 16:52:20', 0),
(20, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1laWQiOiIxIiwibmJmIjoxNzM3MDI1MDI0LCJleHAiOjE3MzcwMjY4MjQsImlhdCI6MTczNzAyNTAyNH0.lIKZnGK25sbYwAwryzCsG0BxZ9dN5RpdZtmWIUSZrfM', '2025-01-16 16:27:04', '2025-01-16 16:57:04', 0),
(21, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1laWQiOiIxIiwibmJmIjoxNzM3MDI1MTY1LCJleHAiOjE3MzcwMjY5NjUsImlhdCI6MTczNzAyNTE2NX0.YXDXV8O1uNLpeBtcZihEnPnk2owHIV_oW-VkwCOWoMw', '2025-01-16 16:29:25', '2025-01-16 16:59:25', 0),
(22, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1laWQiOiIxIiwibmJmIjoxNzM3MDI1NDE0LCJleHAiOjE3MzcwMjcyMTQsImlhdCI6MTczNzAyNTQxNH0.5Fwh_VR4Vrz64PWkvApoUF4E7Q_GBTvQ0ALVLyrHnTY', '2025-01-16 16:33:34', '2025-01-16 17:03:34', 0),
(23, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1laWQiOiIxIiwibmJmIjoxNzM3MDI1NDkxLCJleHAiOjE3MzcwMjcyOTEsImlhdCI6MTczNzAyNTQ5MX0.ZDRusQnCBljIMZJrHsckXhN1Ly3bNctaRcHfLUI0mb8', '2025-01-16 16:34:51', '2025-01-16 17:04:51', 0),
(24, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1laWQiOiIxIiwibmJmIjoxNzM3MDI1NTIxLCJleHAiOjE3MzcwMjczMjEsImlhdCI6MTczNzAyNTUyMX0.W4zOS6JeCsILcFUfdnIRCPmIyZuMEa48ap4haWaObWg', '2025-01-16 16:35:21', '2025-01-16 17:05:21', 0),
(25, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1laWQiOiIxIiwibmJmIjoxNzM3MDI1ODYzLCJleHAiOjE3MzcwMjc2NjMsImlhdCI6MTczNzAyNTg2M30.gssz_yRLrabUkXb_6vjNoGJE1UO-wWkoBGaLnlhFHhg', '2025-01-16 16:41:03', '2025-01-16 17:11:03', 0),
(26, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1laWQiOiIxIiwibmJmIjoxNzM3MDI3MTI5LCJleHAiOjE3MzcwMjg5MjksImlhdCI6MTczNzAyNzEyOX0.CkSIOKeOGdlVtfmUtj_l_DnxUaKc_CimNGP8v5XrsvQ', '2025-01-16 17:02:09', '2025-01-16 17:32:09', 0),
(27, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1laWQiOiIxIiwibmJmIjoxNzM3MDI3MTY4LCJleHAiOjE3MzcwMjg5NjgsImlhdCI6MTczNzAyNzE2OH0.0seg4WFYqpj0RuhOJUEqLe2wX-dPSRMWygitd2Cskjc', '2025-01-16 17:02:48', '2025-01-16 17:32:48', 0);

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
