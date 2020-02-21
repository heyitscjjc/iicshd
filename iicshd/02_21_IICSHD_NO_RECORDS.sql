-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 21, 2020 at 12:55 PM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `iicshd`
--

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `annno` int(11) NOT NULL,
  `anntitle` varchar(60) NOT NULL,
  `anndesc` varchar(250) NOT NULL,
  `anndate` timestamp(1) NOT NULL DEFAULT CURRENT_TIMESTAMP(1) ON UPDATE CURRENT_TIMESTAMP(1),
  `userno` int(11) NOT NULL,
  `hidden` int(1) NOT NULL,
  `pin` int(1) NOT NULL DEFAULT '0',
  `deptno` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `consultations`
--

CREATE TABLE `consultations` (
  `conno` int(11) NOT NULL,
  `consub` varchar(60) NOT NULL,
  `condesc` varchar(256) NOT NULL,
  `conprof` int(11) NOT NULL,
  `userno` int(11) NOT NULL,
  `condatecreated` timestamp(1) NOT NULL DEFAULT CURRENT_TIMESTAMP(1) ON UPDATE CURRENT_TIMESTAMP(1),
  `conpref` varchar(256) NOT NULL,
  `constatus` varchar(20) NOT NULL,
  `conremarks` varchar(256) DEFAULT NULL,
  `constart` timestamp NULL DEFAULT NULL,
  `conend` timestamp NULL DEFAULT NULL,
  `condatemodified` timestamp(1) NOT NULL DEFAULT '0000-00-00 00:00:00.0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `consulthours`
--

CREATE TABLE `consulthours` (
  `chourno` int(11) NOT NULL,
  `userno` int(11) NOT NULL,
  `isactive` int(1) NOT NULL,
  `daytime` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `consultlogs`
--

CREATE TABLE `consultlogs` (
  `conno` int(11) NOT NULL,
  `consub` varchar(60) NOT NULL,
  `condesc` varchar(256) NOT NULL,
  `conprof` int(11) NOT NULL,
  `userno` int(11) NOT NULL,
  `condatecreated` timestamp(1) NOT NULL DEFAULT CURRENT_TIMESTAMP(1) ON UPDATE CURRENT_TIMESTAMP(1),
  `conpref` varchar(256) NOT NULL,
  `constatus` varchar(20) NOT NULL,
  `condatemodified` timestamp(1) NOT NULL DEFAULT '0000-00-00 00:00:00.0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dept`
--

CREATE TABLE `dept` (
  `deptno` int(1) NOT NULL,
  `deptname` varchar(255) NOT NULL,
  `hidden` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dept`
--

INSERT INTO `dept` (`deptno`, `deptname`, `hidden`) VALUES
(0, 'All', 1),
(1, 'Computer Science', 0),
(2, 'Information System', 0),
(3, 'Information Technology', 0);

-- --------------------------------------------------------

--
-- Table structure for table `doclogs`
--

CREATE TABLE `doclogs` (
  `docno` int(11) NOT NULL,
  `docdatesubmit` timestamp(1) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(1),
  `userno` int(11) NOT NULL,
  `doctitle` varchar(60) NOT NULL,
  `docdesc` varchar(250) NOT NULL,
  `docstatus` varchar(60) NOT NULL,
  `docdatechange` timestamp(1) NOT NULL DEFAULT CURRENT_TIMESTAMP(1),
  `hidden` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE `documents` (
  `docno` int(11) NOT NULL,
  `docdatesubmit` timestamp(1) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(1),
  `userno` int(11) NOT NULL,
  `doctitle` varchar(60) NOT NULL,
  `docdesc` varchar(250) NOT NULL,
  `docstatus` varchar(60) NOT NULL,
  `docdatechange` timestamp(1) NOT NULL DEFAULT CURRENT_TIMESTAMP(1),
  `docDir` varchar(250) NOT NULL,
  `hidden` int(1) NOT NULL,
  `docISO` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE `files` (
  `fileno` int(11) NOT NULL,
  `filetitle` varchar(256) NOT NULL,
  `filename` varchar(256) NOT NULL,
  `filedate` timestamp(1) NOT NULL DEFAULT CURRENT_TIMESTAMP(1) ON UPDATE CURRENT_TIMESTAMP(1),
  `hidden` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `files`
--

INSERT INTO `files` (`fileno`, `filetitle`, `filename`, `filedate`, `hidden`) VALUES
(1, 'Test File', 'Capstone-Project-1_Eval-form_revised-1.docx', '2019-03-04 16:22:15.0', 0);

-- --------------------------------------------------------

--
-- Table structure for table `notif`
--

CREATE TABLE `notif` (
  `notifno` int(11) NOT NULL,
  `userno` int(11) NOT NULL,
  `notiftitle` varchar(256) NOT NULL,
  `notifdesc` varchar(256) NOT NULL,
  `notifaudience` varchar(256) NOT NULL,
  `notifdate` datetime(1) NOT NULL,
  `notifstatus` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notif`
--

INSERT INTO `notif` (`notifno`, `userno`, `notiftitle`, `notifdesc`, `notifaudience`, `notifdate`, `notifstatus`) VALUES
(1, 3, 'Consultation Request', 'Title: 123', '4', '2019-03-04 21:52:19.0', 1),
(2, 1, 'New Announcement Posted', 'Test posted by Admin  Account', 'all', '2019-03-04 23:58:59.0', 1),
(3, 3, 'New Queue Ticket', 'Queue Ticket No. 1 now in Waiting list.', 'admin', '2019-03-05 00:01:00.0', 1),
(4, 1, 'Schedule Updated', 'Updated IS Faculty Schedule.', 'all', '2019-03-05 00:06:42.0', 1),
(5, 1, 'New File Upload', 'New File Available: Capstone-Project-1_Eval-form_revised-1.docx.', 'student', '2019-03-05 00:22:14.0', 1),
(6, 3, 'Consultation Request', 'Title: This is a test', '4', '2019-03-05 01:01:20.0', 1),
(7, 3, 'New Queue Ticket', 'Queue Ticket No. 2 now in Waiting list.', 'admin', '2019-03-05 03:28:13.0', 1),
(8, 3, 'New Queue Ticket', 'Queue Ticket No. 3 now in Waiting list.', 'admin', '2019-03-05 03:31:11.0', 1),
(9, 3, 'New Queue Ticket', 'Queue Ticket No. 4 now in Waiting list.', 'admin', '2019-03-05 03:37:39.0', 1),
(10, 3, 'New Queue Ticket', 'Queue Ticket No. 5 now in Waiting list.', 'admin', '2019-03-05 03:40:09.0', 1),
(11, 3, 'New Queue Ticket', 'Queue Ticket No. 1 now in Waiting list.', 'admin', '2019-03-05 13:15:22.0', 1),
(12, 3, 'Consultation Request', 'Title: Consultation', '4', '2019-03-05 13:34:49.0', 1),
(13, 3, 'Consultation Request', 'Title: Testing', '4', '2019-03-05 14:32:30.0', 1),
(14, 3, 'Consultation Request', 'Title: 123', '4', '2019-03-05 15:15:18.0', 1),
(15, 3, 'Consultation Request', 'Title: Test', '4', '2019-03-05 15:45:16.0', 1),
(16, 3, 'Consultation Request', 'Title: Testing', '4', '2019-03-05 15:58:43.0', 1),
(17, 3, 'Consultation Request', 'Title: Test 1', '4', '2019-03-05 16:14:49.0', 1),
(18, 3, 'Consultation Request', 'Title: Test 2', '4', '2019-03-05 16:17:15.0', 1),
(19, 1, 'New Announcement Posted', 'Test posted by Admin  Account', 'all', '2019-03-07 00:11:15.0', 1),
(20, 1, 'New Announcement Posted', 'Test posted by Admin  Account', 'all', '2019-03-07 00:13:46.0', 1),
(21, 1, 'New Announcement Posted', 'Test posted by Admin  Account', 'all', '2019-03-07 00:17:10.0', 1),
(22, 1, 'New Announcement Posted', 'Testing posted by Admin  Account', 'all', '2019-03-07 00:19:37.0', 1),
(23, 1, 'New Announcement Posted', 'Test posted by Admin  Account', 'all', '2019-03-07 00:22:28.0', 1),
(24, 1, 'New Announcement Posted', 'Test posted by Admin  Account', 'all', '2019-03-07 00:24:53.0', 1),
(25, 1, 'New Announcement Posted', 'Test posted by Admin  Account', 'all', '2019-03-07 00:30:04.0', 1),
(26, 1, 'New Announcement Posted', 'Test posted by Admin  Account', 'all', '2019-03-07 00:42:12.0', 1),
(27, 1, 'New Announcement Posted', 'Test posted by Admin  Account', 'all', '2019-03-07 00:45:56.0', 1),
(28, 1, 'New Announcement Posted', 'test posted by Admin  Account', 'all', '2019-03-07 00:48:14.0', 1),
(29, 1, 'New Announcement Posted', 'Test posted by Admin  Account', 'all', '2019-03-07 00:49:16.0', 1),
(30, 1, 'New Announcement Posted', 'Testing posted by Admin  Account', 'all', '2019-03-07 00:50:40.0', 1),
(31, 1, 'New Announcement Posted', 'test posted by Admin  Account', 'all', '2019-03-07 00:51:04.0', 1),
(32, 1, 'New Announcement Posted', 'Test posted by Admin  Account', 'all', '2019-03-07 00:54:51.0', 1),
(33, 1, 'New Announcement Posted', 'Test posted by Admin  Account', 'all', '2019-03-07 00:55:39.0', 1),
(34, 1, 'New Announcement Posted', 'q123 posted by Admin  Account', 'all', '2019-03-07 12:24:35.0', 1),
(35, 1, 'Schedule Updated', 'Updated CS Class Schedule.', 'all', '2019-03-07 12:27:05.0', 1),
(36, 1, 'New Announcement Posted', '123 posted by Admin  Account', 'all', '2019-03-07 12:27:39.0', 1),
(37, 1, 'New Announcement Posted', '123 posted by Admin  Account', 'all', '2019-03-07 12:28:11.0', 1),
(38, 1, 'New Announcement Posted', '123 posted by Admin  Account', 'all', '2019-03-07 12:30:05.0', 1),
(39, 1, 'New Announcement Posted', '123 posted by Admin  Account', 'all', '2019-03-07 12:38:44.0', 1),
(40, 1, 'New Announcement Posted', '123 posted by Admin  Account', 'all', '2019-03-07 12:42:02.0', 1),
(41, 1, 'New Announcement Posted', '123 posted by Admin  Account', 'all', '2019-03-07 12:53:31.0', 1),
(42, 1, 'New Announcement Posted', '123 posted by Admin  Account', 'all', '2019-03-07 13:04:26.0', 1),
(43, 1, 'New Announcement Posted', '123 posted by Admin  Account', 'all', '2019-03-07 13:08:31.0', 1),
(44, 1, 'New Announcement Posted', '123 posted by Admin  Account', 'all', '2019-03-07 13:08:53.0', 1),
(45, 1, 'New Announcement Posted', '123 posted by Admin  Account', 'all', '2019-03-07 13:09:06.0', 1),
(46, 1, 'New Announcement Posted', '213 posted by Admin  Account', 'all', '2019-03-07 13:09:20.0', 1),
(47, 1, 'New Announcement Posted', '123 posted by Admin  Account', 'all', '2019-03-07 13:09:57.0', 1),
(48, 1, 'New Announcement Posted', '123 posted by Admin  Account', 'all', '2019-03-07 13:10:24.0', 1),
(49, 1, 'New Announcement Posted', '123 posted by Admin  Account', 'all', '2019-03-07 13:12:46.0', 1),
(50, 1, 'New Announcement Posted', '123 posted by Admin  Account', 'all', '2019-03-07 13:13:26.0', 1),
(51, 1, 'New Announcement Posted', '123 posted by Admin  Account', 'all', '2019-03-07 13:14:32.0', 1),
(52, 1, 'New Announcement Posted', '123 posted by Admin  Account', 'all', '2019-03-07 13:16:05.0', 1),
(53, 1, 'New Announcement Posted', '123 posted by Admin  Account', 'all', '2019-03-07 13:16:49.0', 1),
(54, 1, 'New Announcement Posted', '123 posted by Admin  Account', 'all', '2019-03-07 13:18:19.0', 1),
(55, 1, 'New Announcement Posted', '312 posted by Admin  Account', 'all', '2019-03-07 13:18:32.0', 1),
(56, 1, 'New Announcement Posted', '312 posted by Admin  Account', 'all', '2019-03-07 13:18:32.0', 1),
(57, 1, 'New Announcement Posted', '123 posted by Admin  Account', 'all', '2019-03-07 13:21:24.0', 1),
(58, 1, 'New Announcement Posted', '123 posted by Admin  Account', 'all', '2019-03-07 13:23:17.0', 1),
(59, 1, 'New Announcement Posted', '123 posted by Admin  Account', 'all', '2019-03-07 13:28:19.0', 1),
(60, 1, 'New Announcement Posted', '123 posted by Admin  Account', 'all', '2019-03-07 13:29:02.0', 1),
(61, 1, 'New Announcement Posted', '123 posted by Admin  Account', 'all', '2019-03-07 13:31:27.0', 1),
(62, 1, 'New Announcement Posted', 'New posted by Admin  Account', 'all', '2019-03-07 13:32:22.0', 1),
(63, 1, 'New Announcement Posted', 'Test posted by Admin  Account', 'all', '2019-03-07 13:37:06.0', 1),
(64, 1, 'New Announcement Posted', 'Sample posted by Admin  Account', 'all', '2019-03-07 13:37:53.0', 1),
(65, 1, 'New Announcement Posted', '123 posted by Admin  Account', 'all', '2019-03-07 13:41:41.0', 1),
(66, 1, 'Schedule Updated', 'Updated CS Class Schedule.', 'all', '2019-03-07 13:49:32.0', 1),
(67, 1, 'New Announcement Posted', '123 posted by Admin  Account', 'all', '2019-03-07 13:54:38.0', 1),
(68, 1, 'New Announcement Posted', '3213 posted by Admin  Account', 'all', '2019-03-07 13:54:41.0', 1),
(69, 1, 'New Announcement Posted', '432 posted by Admin  Account', 'all', '2019-03-07 13:54:45.0', 1),
(70, 1, 'New Announcement Posted', '123 posted by Admin  Account', 'all', '2019-03-07 13:55:54.0', 1),
(71, 1, 'New Announcement Posted', '67576 posted by Admin  Account', 'all', '2019-03-07 13:56:09.0', 1),
(72, 3, 'New Queue Ticket', 'Queue Ticket No. 1 now in Waiting list.', 'admin', '2019-03-07 14:08:45.0', 1),
(73, 3, 'New Queue Ticket', 'Queue Ticket No. 2 now in Waiting list.', 'admin', '2019-03-07 14:25:33.0', 1),
(74, 1, 'Queue Status', 'Now Serving Queue Ticket No. 2.', '3', '2019-03-07 14:27:22.0', 1),
(75, 3, 'New Queue Ticket', 'Queue Ticket No. 3 now in Waiting list.', 'admin', '2019-03-07 14:41:12.0', 1),
(76, 1, 'Queue Status', 'Now Serving Queue Ticket No. 3.', '3', '2019-03-07 14:41:21.0', 1),
(77, 3, 'New Queue Ticket', 'Queue Ticket No. 4 now in Waiting list.', 'admin', '2019-03-07 14:44:19.0', 1),
(78, 1, 'Queue Status', 'Now Serving Queue Ticket No. 4.', '3', '2019-03-07 14:50:05.0', 1),
(79, 2, 'New Queue Ticket', 'Queue Ticket No. 1 now in Waiting list.', 'admin', '2019-03-07 14:51:00.0', 1),
(80, 1, 'Queue Status', 'Now Serving Queue Ticket No. 5.', '2', '2019-03-07 14:52:20.0', 1),
(81, 2, 'New Queue Ticket', 'Queue Ticket No. 6 now in Waiting list.', 'admin', '2019-03-07 14:53:25.0', 1),
(82, 3, 'New Queue Ticket', 'Queue Ticket No. 5 now in Waiting list.', 'admin', '2019-03-07 14:53:43.0', 1),
(83, 1, 'Queue Status', 'Now Serving Queue Ticket No. 6.', '2', '2019-03-07 14:58:47.0', 1),
(84, 1, 'Queue Status', 'Now Serving Queue Ticket No. 7.', '3', '2019-03-07 14:58:50.0', 1),
(85, 3, 'New Queue Ticket', 'Queue Ticket No. 8 now in Waiting list.', 'admin', '2019-03-07 14:58:56.0', 1),
(86, 2, 'New Queue Ticket', 'Queue Ticket No. 7 now in Waiting list.', 'admin', '2019-03-07 14:59:28.0', 1),
(87, 1, 'Queue Status', 'Now Serving Queue Ticket No. 8.', '3', '2019-03-07 15:01:50.0', 1),
(88, 1, 'Queue Status', 'Now Serving Queue Ticket No. 9.', '2', '2019-03-07 15:01:54.0', 1),
(89, 2, 'New Queue Ticket', 'Queue Ticket No. 10 now in Waiting list.', 'admin', '2019-03-07 15:02:01.0', 1),
(90, 3, 'New Queue Ticket', 'Queue Ticket No. 9 now in Waiting list.', 'admin', '2019-03-07 15:02:23.0', 1),
(91, 1, 'Queue Status', 'Now Serving Queue Ticket No. 10.', '2', '2019-03-07 15:03:45.0', 1),
(92, 1, 'Queue Status', 'Now Serving Queue Ticket No. 11.', '3', '2019-03-07 15:03:48.0', 1),
(93, 3, 'New Queue Ticket', 'Queue Ticket No. 12 now in Waiting list.', 'admin', '2019-03-07 15:03:55.0', 1),
(94, 1, 'Queue Status', 'Now Serving Queue Ticket No. 12.', '3', '2019-03-07 15:04:06.0', 1),
(95, 2, 'New Queue Ticket', 'Queue Ticket No. 11 now in Waiting list.', 'admin', '2019-03-07 15:04:44.0', 1),
(96, 1, 'Queue Status', 'Now Serving Queue Ticket No. 13.', '2', '2019-03-07 15:07:48.0', 1),
(97, 1, 'New Announcement Posted', '3123 posted by Admin  Account', 'all', '2019-03-07 15:17:23.0', 1),
(98, 3, 'New Queue Ticket', 'Queue Ticket No. 13 now in Waiting list.', 'admin', '2019-03-07 15:22:45.0', 1),
(99, 1, 'Queue Status', 'Now Serving Queue Ticket No. 14', '3', '2019-03-07 15:23:14.0', 1),
(100, 3, 'New Queue Ticket', 'Queue Ticket No. 15 now in Waiting list.', 'admin', '2019-03-07 15:24:57.0', 1),
(101, 2, 'New Queue Ticket', 'Queue Ticket No. 14 now in Waiting list.', 'admin', '2019-03-07 15:25:33.0', 1),
(102, 1, 'Queue Status', 'Now Serving Queue Ticket No. 15', '3', '2019-03-07 15:25:41.0', 1),
(103, 1, 'Queue Status', 'Now Serving Queue Ticket No. 16', '2', '2019-03-07 15:25:48.0', 1),
(104, 2, 'New Queue Ticket', 'Queue Ticket No. 17 now in Waiting list.', 'admin', '2019-03-07 15:28:26.0', 1),
(105, 1, 'Queue Status', 'Now Serving Queue Ticket No. 17', '2', '2019-03-07 15:28:34.0', 1),
(106, 2, 'New Queue Ticket', 'Queue Ticket No. 18 now in Waiting list.', 'admin', '2019-03-07 15:28:41.0', 1),
(107, 1, 'Queue Status', 'Now Serving Queue Ticket No. 18', '2', '2019-03-07 15:29:03.0', 1),
(108, 2, 'New Queue Ticket', 'Queue Ticket No. 19 now in Waiting list.', 'admin', '2019-03-07 15:30:00.0', 1),
(109, 1, 'Queue Status', 'Now Serving Queue Ticket No. 19', '2', '2019-03-07 15:30:11.0', 1),
(110, 2, 'New Queue Ticket', 'Queue Ticket No. 20 now in Waiting list.', 'admin', '2019-03-07 15:31:28.0', 1),
(111, 1, 'Queue Status', 'Now Serving Queue Ticket No. 20', '2', '2019-03-07 15:32:15.0', 1),
(112, 2, 'New Queue Ticket', 'A new Queue Ticket has been added to the Waiting list.', 'admin', '2019-03-07 15:32:24.0', 1),
(113, 1, 'Queue Status', 'Now Serving Queue Ticket No. 21', '2', '2019-03-07 15:34:23.0', 1),
(114, 2, 'New Queue Ticket', 'A new Queue Ticket has been added to the Waiting list.', 'admin', '2019-03-07 15:34:30.0', 1),
(115, 3, 'New Queue Ticket', 'A new Queue Ticket has been added to the Waiting list.', 'admin', '2019-03-07 15:35:52.0', 1),
(116, 1, 'Queue Status', 'Now Serving Queue Ticket No. 22', '2', '2019-03-07 15:36:10.0', 1),
(117, 1, 'Queue Status', 'Now Serving Queue Ticket No. 23', '3', '2019-03-07 15:36:15.0', 1),
(118, 3, 'New Queue Ticket', 'A new Queue Ticket has been added to the Waiting list.', 'admin', '2019-03-07 15:36:21.0', 1),
(119, 1, 'Queue Status', 'Now Serving Queue Ticket No. 24', '3', '2019-03-07 15:39:48.0', 1),
(120, 3, 'New Queue Ticket', 'Waiting List has been updated.', 'admin', '2019-03-07 15:39:57.0', 1),
(121, 1, 'Queue Status', 'Now Serving Queue Ticket No. 25', '3', '2019-03-07 15:40:39.0', 1),
(122, 3, 'New Queue Ticket', 'Queue Ticket No. 26 now in Waiting list.', 'admin', '2019-03-07 15:40:48.0', 1),
(123, 1, 'Queue Status', 'Now Serving Queue Ticket No. 26', '3', '2019-03-07 15:40:55.0', 1),
(124, 1, 'New Announcement Posted', '123 posted by Admin  Account', 'all', '2019-03-07 15:46:26.0', 1),
(125, 1, 'New Announcement Posted', '321 posted by Admin  Account', 'all', '2019-03-07 15:50:37.0', 1),
(126, 3, 'New Queue Ticket', 'Queue Ticket No. 27 now in Waiting list.', 'admin', '2019-03-07 15:50:58.0', 1),
(127, 1, 'Queue Status', 'Now Serving Queue Ticket No. 27', '3', '2019-03-07 15:51:08.0', 1),
(128, 3, 'New Queue Ticket', 'Queue Ticket No. 28 now in Waiting list.', 'admin', '2019-03-07 15:54:42.0', 1),
(129, 1, 'Queue Status', 'Now Serving Queue Ticket No. 28', '3', '2019-03-07 16:01:54.0', 1),
(130, 3, 'New Queue Ticket', 'Queue Ticket No. 29 now in Waiting list.', 'admin', '2019-03-07 16:04:04.0', 1),
(131, 1, 'Queue Status', 'Now Serving Queue Ticket No. 29', '3', '2019-03-07 16:04:11.0', 1),
(132, 1, 'New Announcement Posted', '321 posted by Admin  Account', 'all', '2019-03-07 16:14:00.0', 1),
(133, 3, 'Consultation Request', 'Title: Test', '4', '2019-03-07 16:14:39.0', 1),
(134, 3, 'New Queue Ticket', 'Queue Ticket No. 30 now in Waiting list.', 'admin', '2019-03-07 17:15:50.0', 1),
(135, 1, 'Queue Status', 'Now Serving Queue Ticket No. 30', '3', '2019-03-07 17:16:02.0', 1),
(136, 4, 'Consultation Request Accepted', 'Title: Test', '3', '2019-03-07 17:51:07.0', 1),
(137, 3, 'Consultation Request', 'Title: 321', '4', '2019-03-07 17:53:33.0', 1),
(138, 4, 'Consultation Request Update', 'Title: 321(Accepted)', '3', '2019-03-07 17:54:18.0', 1),
(139, 3, 'New Consultation Request', 'Title: Sample Title Sample Description Sample Description', '4', '2019-03-07 17:55:30.0', 1),
(140, 3, 'New Consultation Request', 'Title: &lt;li style=&quot;width: 300px; white-space: normal;&quot;&gt;   &lt;li style=&quot;width: 300px; white-space: normal;&quot;&gt;', '4', '2019-03-07 17:57:12.0', 1),
(141, 4, 'Consultation Request Update', 'Title: <li style=\"width: 300px; white-space: normal;\"& (Declined)', '3', '2019-03-07 17:59:55.0', 1),
(142, 4, 'Consultation Request Update', 'Title: Sample Title Sample Description Sample Description (Accepted)', '3', '2019-03-07 18:01:30.0', 1),
(143, 3, 'New Consultation Request', 'Title: 312', '4', '2019-03-07 18:09:35.0', 1),
(144, 4, 'Consultation Request Update', 'Title: 312 (Accepted)', '3', '2019-03-07 18:10:05.0', 1),
(145, 3, 'New Consultation Request', 'Title: 321', '4', '2019-03-07 18:32:58.0', 1),
(146, 4, 'Consultation Request Update', 'Title: 321 (Accepted)', '3', '2019-03-07 18:39:01.0', 1),
(147, 3, 'New Consultation Request', 'Title: 312', '4', '2019-03-07 18:41:00.0', 1),
(148, 3, 'New Consultation Request', 'Title: 312', '4', '2019-03-07 18:49:59.0', 1),
(149, 3, 'New Consultation Request', 'Title: 321', '4', '2019-03-07 18:50:03.0', 1),
(150, 4, 'Consultation Request Update', 'Title: 321 (Thank you)', '3', '2019-03-07 18:53:34.0', 1),
(151, 4, 'Consultation Request Update', 'Title: Test 2 ()', '3', '2019-03-07 18:58:13.0', 1),
(152, 4, 'Consultation Request Update', 'Title: Test 2 (Accepted)', '3', '2019-03-07 18:59:01.0', 1),
(153, 4, 'Consultation Request Update', 'Title: Test 2 ()', '3', '2019-03-07 18:59:07.0', 1),
(154, 4, 'Consultation Request Update', 'Title: 312 (Accepted)', '3', '2019-03-07 19:05:44.0', 1),
(155, 3, 'New Queue Ticket', 'Queue Ticket No. 31 now in Waiting list.', 'admin', '2019-03-07 19:07:24.0', 1),
(156, 2, 'New Queue Ticket', 'Queue Ticket No. 23 now in Waiting list.', 'admin', '2019-03-07 19:07:43.0', 1),
(157, 1, 'Queue Status', 'Now Serving Queue Ticket No. 31', '3', '2019-03-07 19:13:52.0', 1),
(158, 1, 'Queue Status', 'Now Serving Queue Ticket No. 32', '2', '2019-03-07 19:16:13.0', 1),
(159, 3, 'New Queue Ticket', 'A New Queue Ticket has been added to the Waiting list.', 'admin', '2019-03-07 19:16:23.0', 1),
(160, 1, 'Queue Status', 'Now Serving Queue Ticket No. 33', '3', '2019-03-07 19:16:39.0', 1),
(161, 3, 'New Queue Ticket', 'A New Queue Ticket has been added to the Waiting list.', 'admin', '2019-03-07 20:44:36.0', 1),
(162, 1, 'Queue Status', 'Now Serving Queue Ticket No. 34', '3', '2019-03-07 20:45:12.0', 1),
(163, 2, 'New Queue Ticket', 'A New Queue Ticket has been added to the Waiting list.', 'admin', '2019-03-08 14:01:24.0', 1),
(164, 3, 'New Queue Ticket', 'A New Queue Ticket has been added to the Waiting list.', 'admin', '2019-03-08 14:09:26.0', 1),
(165, 1, 'Queue Status', 'Now Serving Queue Ticket No. 35', '2', '2019-03-08 14:10:19.0', 1),
(166, 1, 'Queue Status', 'Now Serving Queue Ticket No. 36', '3', '2019-03-08 14:11:40.0', 1),
(167, 2, 'New Queue Ticket', 'A New Queue Ticket has been added to the Waiting list.', 'admin', '2019-03-08 14:36:37.0', 1),
(168, 1, 'Queue Status', 'Now Serving Queue Ticket No. 37', '2', '2019-03-08 14:36:47.0', 1),
(169, 2, 'New Queue Ticket', 'A New Queue Ticket has been added to the Waiting list.', 'admin', '2019-03-08 14:48:18.0', 1),
(170, 1, 'Queue Status', 'Now Serving Queue Ticket No. 38', '2', '2019-03-08 14:48:31.0', 1),
(171, 2, 'New Queue Ticket', 'A New Queue Ticket has been added to the Waiting list.', 'admin', '2019-03-08 14:53:58.0', 1),
(172, 1, 'Queue Status', 'Now Serving Queue Ticket No. 39', '2', '2019-03-08 14:54:07.0', 1),
(173, 2, 'New Queue Ticket', 'A New Queue Ticket has been added to the Waiting list.', 'admin', '2019-03-08 14:59:26.0', 1),
(174, 1, 'Queue Status', 'Now Serving Queue Ticket No. 40', '2', '2019-03-08 15:00:56.0', 1),
(175, 1, 'Document Status Updated', 'Document Title: 123 / Status: Received by Office', '3', '2019-03-08 19:34:24.0', 1),
(176, 1, 'Document Status Updated', 'Document Title: 123 / Status: On-Process', '3', '2019-03-08 19:35:08.0', 1),
(177, 1, 'Document Status Updated', 'Document Title: 123 / Status: Processed', '3', '2019-03-08 19:36:09.0', 1),
(178, 1, 'Document Status Updated', 'Document Title: 123 / Status: For Release', '3', '2019-03-08 19:36:47.0', 1),
(179, 3, 'Document Status Updated', 'Document Title:  / Status: Received by Student', 'admin', '2019-03-08 19:42:38.0', 1),
(180, 3, 'New Queue Ticket', 'A New Queue Ticket has been added to the Waiting list.', 'admin', '2019-03-08 19:54:17.0', 1),
(181, 1, 'Queue Status', 'Now Serving Queue Ticket No. 41', '3', '2019-03-08 19:54:28.0', 1),
(182, 1, 'Queue Status', 'Now Serving Queue Ticket No. 42', '3', '2019-03-08 19:55:04.0', 1),
(183, 3, 'New Queue Ticket', 'A New Queue Ticket has been added to the Waiting list.', 'admin', '2019-03-08 19:59:12.0', 1),
(184, 1, 'Queue Status', 'Now Serving Queue Ticket No. 43', '3', '2019-03-08 19:59:28.0', 1),
(185, 3, 'New Queue Ticket', 'A New Queue Ticket has been added to the Waiting list.', 'admin', '2019-03-08 20:05:27.0', 1),
(186, 1, 'Queue Status', 'Now Serving Queue Ticket No. 44', '3', '2019-03-08 20:05:34.0', 1),
(187, 1, 'New Document Submission', 'Title: Test / Moved to New Submissions', 'admin', '2019-03-08 20:08:10.0', 1),
(188, 1, 'Document Status Updated', 'Document Title: Test Submission / Status: Received by Office', '3', '2019-03-08 20:08:46.0', 1),
(189, 1, 'Document Status Updated', 'Document Title: Test Submission / Status: Received by Office', '3', '2019-03-08 20:09:06.0', 1),
(190, 1, 'Document Status Updated', 'Document Title: Test / Status: Not Received', '3', '2019-03-08 20:09:14.0', 1),
(191, 1, 'Document Status Updated', 'Document Title: Test / Status: Not Received', '3', '2019-03-08 20:09:18.0', 1),
(192, 3, 'New Queue Ticket', 'A New Queue Ticket has been added to the Waiting list.', 'admin', '2019-03-09 10:24:01.0', 1),
(193, 1, 'Queue Status', 'Now Serving Queue Ticket No. 45', '3', '2019-03-09 12:02:00.0', 1),
(194, 1, 'New Announcement Posted', 'asdf posted by Admin  Account', 'all', '2019-03-09 12:28:17.0', 1),
(195, 3, 'New Queue Ticket', 'A New Queue Ticket has been added to the Waiting list.', 'admin', '2019-03-13 23:47:28.0', 1),
(196, 1, 'Queue Status', 'Now Serving Queue Ticket No. 46', '3', '2019-03-13 23:47:33.0', 1),
(197, 1, 'New Document Submission', 'Title: Petition Form / Moved to New Submissions', 'admin', '2019-03-13 23:47:44.0', 1),
(198, 3, 'New Consultation Request', 'Title: Test Consultation', '4', '2019-03-14 00:10:38.0', 1),
(199, 3, 'New Queue Ticket', 'A New Queue Ticket has been added to the Waiting list.', 'admin', '2019-03-14 16:17:01.0', 1),
(200, 1, 'Queue Status', 'Now Serving Queue Ticket No. 47', '3', '2019-03-14 16:30:08.0', 1),
(201, 1, 'New Document Submission', 'Title: Petition Form / Moved to New Submissions', 'admin', '2019-03-14 16:30:16.0', 1),
(202, 3, 'New Queue Ticket', 'A New Queue Ticket has been added to the Waiting list.', 'admin', '2019-03-14 16:31:42.0', 1),
(203, 1, 'Queue Status', 'Now Serving Queue Ticket No. 48', '3', '2019-03-14 16:33:33.0', 1),
(204, 3, 'New Consultation Request', 'Title: Sample', '4', '2019-03-16 12:04:14.0', 1),
(205, 3, 'New Consultation Request', 'Title: Sample 2', '4', '2019-03-16 12:06:13.0', 1),
(206, 3, 'New Consultation Request', 'Title: AA', '4', '2019-05-03 19:49:45.0', 1),
(207, 3, 'New Consultation Request', 'Title: 111', '4', '2019-05-03 19:50:58.0', 1),
(208, 3, 'New Consultation Request', 'Title: 11133', '4', '2019-05-03 19:52:26.0', 1),
(209, 3, 'New Consultation Request', 'Title: Sample', '4', '2019-05-03 19:55:05.0', 1),
(210, 3, 'New Consultation Request', 'Title: 123123', '4', '2019-05-03 19:56:23.0', 1),
(211, 3, 'New Consultation Request', 'Title: Try nga', '4', '2019-05-03 19:59:20.0', 1),
(212, 3, 'New Consultation Request', 'Title: Gte', '4', '2019-05-03 20:12:09.0', 1),
(213, 3, 'New Queue Ticket', 'A New Queue Ticket has been added to the Waiting list.', 'admin', '2019-05-03 20:16:24.0', 1),
(214, 1, 'Queue Status', 'Now Serving Queue Ticket No. 49', '3', '2019-05-03 20:16:41.0', 1),
(215, 1, 'New Document Submission', 'Title: Endorsement Letter / Moved to New Submissions', 'admin', '2019-05-03 20:17:46.0', 1),
(216, 1, 'Document Status Updated', 'Document Title: Endorsement Letter / Status: Received by Office', '3', '2019-05-03 20:18:13.0', 1),
(217, 3, 'New Queue Ticket', 'A New Queue Ticket has been added to the Waiting list.', 'admin', '2019-05-03 20:18:49.0', 1),
(218, 1, 'Queue Status', 'Now Serving Queue Ticket No. 50', '3', '2019-05-03 20:23:39.0', 1),
(219, 3, 'New Queue Ticket', 'A New Queue Ticket has been added to the Waiting list.', 'admin', '2019-05-03 20:31:43.0', 1),
(220, 1, 'Queue Status', 'Now Serving Queue Ticket No. 51', '3', '2019-05-03 20:31:50.0', 1),
(221, 3, 'New Queue Ticket', 'A New Queue Ticket has been added to the Waiting list.', 'admin', '2019-05-03 20:53:42.0', 1),
(222, 1, 'Queue Status', 'Now Serving Queue Ticket No. 52', '3', '2019-05-03 20:53:47.0', 1),
(223, 3, 'New Queue Ticket', 'A New Queue Ticket has been added to the Waiting list.', 'admin', '2019-05-03 20:58:40.0', 1),
(224, 1, 'Queue Status', 'Now Serving Queue Ticket No. 53', '3', '2019-05-03 20:58:48.0', 1),
(225, 1, 'New Announcement Posted', 'TEST posted by Admin  Account', 'all', '2019-11-26 18:29:50.0', 1),
(226, 1, 'New Announcement Posted', 'CJJCCJCJCJCJCJ posted by Admin  Account', 'all', '2019-11-26 18:30:12.0', 1),
(227, 10, 'New Queue Ticket', 'A New Queue Ticket has been added to the Waiting list.', 'admin', '2019-11-30 22:19:21.0', 1),
(228, 1, 'Queue Status', 'Now Serving Queue Ticket No. 54', '10', '2019-11-30 22:19:28.0', 1),
(229, 1, 'Document Status Updated', 'Document Title: Petition Form / Status: Not Received', '3', '2019-11-30 22:21:23.0', 1),
(230, 10, 'New Queue Ticket', 'A New Queue Ticket has been added to the Waiting list.', 'admin', '2019-11-30 22:37:42.0', 1),
(231, 1, 'Queue Status', 'Now Serving Queue Ticket No. 55', '10', '2019-11-30 22:37:54.0', 1),
(232, 10, 'New Queue Ticket', 'A New Queue Ticket has been added to the Waiting list.', 'admin', '2019-11-30 22:40:31.0', 1),
(233, 1, 'Queue Status', 'Now Serving Queue Ticket No. 56', '10', '2019-11-30 22:40:38.0', 1),
(234, 10, 'New Queue Ticket', 'A New Queue Ticket has been added to the Waiting list.', 'admin', '2019-11-30 22:45:04.0', 1),
(235, 1, 'Queue Status', 'Now Serving Queue Ticket No. 57', '10', '2019-11-30 22:45:10.0', 1),
(236, 10, 'New Queue Ticket', 'A New Queue Ticket has been added to the Waiting list.', 'admin', '2019-11-30 22:46:10.0', 1),
(237, 1, 'Queue Status', 'Now Serving Queue Ticket No. 58', '10', '2019-11-30 22:46:19.0', 1),
(238, 10, 'New Queue Ticket', 'A New Queue Ticket has been added to the Waiting list.', 'admin', '2019-11-30 22:47:52.0', 1),
(239, 1, 'Queue Status', 'Now Serving Queue Ticket No. 1', '10', '2019-11-30 22:48:11.0', 1),
(240, 10, 'New Queue Ticket', 'A New Queue Ticket has been added to the Waiting list.', 'admin', '2019-11-30 22:48:54.0', 1),
(241, 1, 'Queue Status', 'Now Serving Queue Ticket No. 2', '10', '2019-11-30 22:49:48.0', 1),
(242, 10, 'New Queue Ticket', 'A New Queue Ticket has been added to the Waiting list.', 'admin', '2019-11-30 22:50:14.0', 1),
(243, 1, 'Document Status Updated', 'Document Title: Sample Test Document / Status: On-Process', '12', '2019-12-01 10:49:21.0', 1),
(244, 3, 'New Queue Ticket', 'A New Queue Ticket has been added to the Waiting list.', 'admin', '2019-12-06 23:26:07.0', 1),
(245, 1, 'Queue Status', 'Now Serving Queue Ticket No. 4', '3', '2019-12-06 23:26:37.0', 1),
(246, 3, 'New Queue Ticket', 'A New Queue Ticket has been added to the Waiting list.', 'admin', '2019-12-06 23:27:01.0', 1),
(247, 1, 'Queue Status', 'Now Serving Queue Ticket No. 5', '3', '2019-12-06 23:27:05.0', 1),
(248, 1, 'Document Status Updated', 'Document Title: Reg form / Status: Received by Office', '12', '2019-12-06 23:31:50.0', 1),
(249, 1, 'Document Status Updated', 'Document Title: Sample Docu / Status: Received by Office', '3', '2019-12-06 23:32:06.0', 1),
(250, 2, 'New Queue Ticket', 'A New Queue Ticket has been added to the Waiting list.', 'admin', '2019-12-07 15:54:08.0', 1),
(251, 1, 'Queue Status', 'Now Serving Queue Ticket No. 6', '2', '2019-12-07 15:55:06.0', 1),
(252, 2, 'New Queue Ticket', 'A New Queue Ticket has been added to the Waiting list.', 'admin', '2019-12-07 17:01:56.0', 1),
(253, 1, 'Queue Status', 'Now Serving Queue Ticket No. 7', '2', '2019-12-07 17:02:24.0', 1),
(254, 7, 'New Announcement Posted', 'test posted by Faculty  Account 2', 'all', '2020-02-06 16:32:50.0', 1),
(255, 7, 'New Announcement Posted', 'test posted by Faculty  Account 2', 'all', '2020-02-06 16:37:15.0', 1),
(256, 7, 'New Announcement Posted', 'TEST FOR IS posted by Faculty  Account 2', 'all', '2020-02-08 00:25:27.0', 1),
(257, 7, 'New Announcement Posted', 'TEST POST FOR ALL posted by Faculty  Account 2', 'all', '2020-02-08 00:27:10.0', 1),
(258, 7, 'New Announcement Posted', 'TEST FOR CS posted by Faculty  Account 2', 'all', '2020-02-08 00:32:40.0', 1),
(259, 3, 'New Queue Ticket', 'A New Queue Ticket has been added to the Waiting list.', 'admin', '2020-02-09 21:55:56.0', 1),
(260, 1, 'Queue Status', 'Now Serving Queue Ticket No. 8', '3', '2020-02-09 21:56:27.0', 1),
(261, 1, 'New Document Submission', 'Title: Petition Form / Moved to New Submissions', 'admin', '2020-02-09 21:56:37.0', 1),
(262, 1, 'Document Status Updated', 'Document Title: Sample Docu / Status: For Release', '3', '2020-02-09 23:41:27.0', 1),
(263, 1, 'Document Status Updated', 'Document Title: Petition Form / Status: Received by Office', '3', '2020-02-09 23:46:42.0', 1),
(264, 1, 'Document Status Updated', 'Document Title: Petition Form / Status: For Release', '3', '2020-02-09 23:46:51.0', 1),
(265, 3, 'New Queue Ticket', 'A New Queue Ticket has been added to the Waiting list.', 'admin', '2020-02-09 23:59:46.0', 1),
(266, 1, 'Queue Status', 'Now Serving Queue Ticket No. 9', '3', '2020-02-09 23:59:53.0', 1),
(267, 1, 'New Document Submission', 'Title: Add/Drop Form / Moved to New Submissions', 'admin', '2020-02-10 00:01:29.0', 1),
(268, 1, 'Document Status Updated', 'Document Title: Add/Drop Form / Status: On-Process', '3', '2020-02-10 00:06:21.0', 1),
(269, 1, 'Document Status Updated', 'Document Title: Add/Drop Form / Status: On-Process', '3', '2020-02-10 00:08:23.0', 1),
(270, 1, 'Document Status Updated', 'Document Title: Add/Drop Form / Status: On-Process', '3', '2020-02-10 00:09:29.0', 1),
(271, 1, 'Document Status Updated', 'Document Title: Add/Drop Form / Status: Processed', '3', '2020-02-10 00:10:20.0', 1),
(272, 1, 'Document Status Updated', 'Document Title: Add/Drop Form / Status: On-Process', '3', '2020-02-10 00:10:32.0', 1),
(273, 1, 'Document Status Updated', 'Document Title: Add/Drop Form / Status: On-Process', '3', '2020-02-10 00:11:02.0', 1),
(274, 1, 'Document Status Updated', 'Document Title: Add/Drop Form / Status: On-Process', '3', '2020-02-10 00:11:33.0', 1),
(275, 1, 'Document Status Updated', 'Document Title: Add/Drop Form / Status: On-Process', '3', '2020-02-10 00:13:18.0', 1),
(276, 1, 'Document Status Updated', 'Document Title: Add/Drop Form / Status: On-Process', '3', '2020-02-10 00:13:49.0', 1),
(277, 3, 'New Queue Ticket', 'A New Queue Ticket has been added to the Waiting list.', 'admin', '2020-02-10 00:14:34.0', 1),
(278, 1, 'Queue Status', 'Now Serving Queue Ticket No. 10', '3', '2020-02-10 00:14:42.0', 1),
(279, 1, 'New Document Submission', 'Title: Endorsement Letter / Moved to New Submissions', 'admin', '2020-02-10 00:14:54.0', 1),
(280, 1, 'Document Status Updated', 'Document Title: Endorsement Letter / Status: On-Process', '3', '2020-02-10 00:15:12.0', 1),
(281, 1, 'Document Status Updated', 'Document Title: Endorsement Letter / Status: On-Process', '3', '2020-02-10 00:24:17.0', 1),
(282, 1, 'Document Status Updated', 'Document Title: Endorsement Letter / Status: On-Process', '3', '2020-02-10 00:24:17.0', 1),
(283, 3, 'New Queue Ticket', 'A New Queue Ticket has been added to the Waiting list.', 'admin', '2020-02-10 00:25:28.0', 1),
(284, 1, 'Queue Status', 'Now Serving Queue Ticket No. 11', '3', '2020-02-10 00:25:34.0', 1),
(285, 1, 'New Document Submission', 'Title: Add/Drop Form / Moved to New Submissions', 'admin', '2020-02-10 00:25:45.0', 1),
(286, 1, 'Document Status Updated', 'Document Title: Endorsement Letter / Status: On-Process', '3', '2020-02-10 00:26:09.0', 1);

-- --------------------------------------------------------

--
-- Table structure for table `qtoggle`
--

CREATE TABLE `qtoggle` (
  `qtogno` int(11) NOT NULL DEFAULT '1',
  `qtoggle` int(1) NOT NULL DEFAULT '1',
  `qadmin` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `qtoggle`
--

INSERT INTO `qtoggle` (`qtogno`, `qtoggle`, `qadmin`) VALUES
(1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `queue`
--

CREATE TABLE `queue` (
  `qno` int(11) NOT NULL,
  `userno` int(11) NOT NULL,
  `qtype` varchar(256) NOT NULL,
  `qtitle` varchar(256) DEFAULT NULL,
  `qdesc` varchar(256) DEFAULT NULL,
  `qdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `qstatus` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `queuelogs`
--

CREATE TABLE `queuelogs` (
  `qno` int(11) NOT NULL,
  `userno` int(11) NOT NULL,
  `qtype` varchar(256) NOT NULL,
  `qtitle` varchar(256) DEFAULT NULL,
  `qdesc` varchar(256) DEFAULT NULL,
  `qremarks` varchar(256) NOT NULL,
  `qdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `qstatus` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE `schedule` (
  `schedno` int(11) NOT NULL,
  `schedname` varchar(256) NOT NULL,
  `schedlink` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `schedule`
--

INSERT INTO `schedule` (`schedno`, `schedname`, `schedlink`) VALUES
(1, 'CS Faculty Schedule', 'https://docs.google.com/spreadsheets/d/e/2PACX-1vTvnJYMr_GxnctfzGYWhfJHZeRvLgklo8ZQEofJi9I1dhA5mvORuOLH4jZPbdMQK2zHiO46D-MOJM5J/pubhtml'),
(2, 'CS Class Schedule', 'https://docs.google.com/spreadsheets/d/e/2PACX-1vSFsehwaVAw1SGX1Or-UFO7NB0ZsRagSIA4LI3w963vL15CHbeGonfNwboHn87uFcsTN91X8jL3mdPK/pubhtml'),
(3, 'CS Room Schedule', 'https://docs.google.com/spreadsheets/d/e/2PACX-1vTVznQuQx2HCM64TgYqkvwwasPFGn4jY6tfwy4L-kf_7hOSEJLlqRGHCo93MOI8p8-yl4tuD3z09gbB/pubhtml'),
(4, 'CS Exam Schedule', 'https://docs.google.com/spreadsheets/d/1eOEVm9EIQWb8nOAbiE3nvZPObZ0nUWHOUXklLS3x-jo/edit?ts=5d959d48#gid=252821764'),
(5, 'IS Faculty Schedule', 'https://docs.google.com/spreadsheets/d/e/2PACX-1vRqNMXeqZx9ZNHMxaB2ET9yxjV0p8XdrVm-HLPkKmaa_KYSt63CjvpmK_MTdH4aUt4Y95B52ZKmcSsw/pubhtml'),
(6, 'IS Class Schedule', 'https://docs.google.com/spreadsheets/d/e/2PACX-1vTY0Gm1js0gJ0vKbSaTDloax_NfwSCBBIIOcLfqu5T9UzUUNtItt9iwE_fyrZfM-5uPf-TNEahqTCEP/pubhtml'),
(7, 'IS Room Schedule', 'https://docs.google.com/spreadsheets/d/e/2PACX-1vTVznQuQx2HCM64TgYqkvwwasPFGn4jY6tfwy4L-kf_7hOSEJLlqRGHCo93MOI8p8-yl4tuD3z09gbB/pubhtml'),
(8, 'IS Exam Schedule', 'https://docs.google.com/spreadsheets/d/1eOEVm9EIQWb8nOAbiE3nvZPObZ0nUWHOUXklLS3x-jo/edit?ts=5d959d48#gid=741387929'),
(9, 'IT Faculty Schedule', 'https://docs.google.com/spreadsheets/d/e/2PACX-1vTzKNt6idi-6zbU1Xy5M5G9HRPrKB3d7SIU0yTgg_0UX5E3Ey0kF7r-NH1IdWj5Z9yWInl0lF7qlzYn/pubhtml'),
(10, 'IT Class Schedule', 'https://docs.google.com/spreadsheets/d/e/2PACX-1vSLEkDs0pDX8Rs6s0O29o8QkPrxdS6x9qTv1qiKjEXWfbVMIWKQVm0uLBeq9coi9rUP4lHeIZpvFLBa/pubhtml'),
(11, 'IT Room Schedule', 'https://docs.google.com/spreadsheets/d/e/2PACX-1vTVznQuQx2HCM64TgYqkvwwasPFGn4jY6tfwy4L-kf_7hOSEJLlqRGHCo93MOI8p8-yl4tuD3z09gbB/pubhtml'),
(12, 'IT Exam Schedule', 'https://docs.google.com/spreadsheets/d/1eOEVm9EIQWb8nOAbiE3nvZPObZ0nUWHOUXklLS3x-jo/edit?ts=5d959d48#gid=141333251');

-- --------------------------------------------------------

--
-- Table structure for table `secq`
--

CREATE TABLE `secq` (
  `secqno` int(11) NOT NULL,
  `secq` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `secq`
--

INSERT INTO `secq` (`secqno`, `secq`) VALUES
(1, 'What is your mother\'s maiden name?'),
(2, 'What was your favorite childhood movie?'),
(3, 'What is the name of your first pet?');

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `sectionno` int(11) NOT NULL,
  `sectionname` varchar(10) NOT NULL,
  `hidden` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`sectionno`, `sectionname`, `hidden`) VALUES
(1, '4IT-D', 0),
(2, '4IT-G', 0),
(3, '1IT-A', 0),
(4, '1IT-B', 0),
(5, '1IT-C', 0),
(6, '1IT-D', 0),
(7, '1IT-E', 0),
(8, '1IT-F', 0),
(9, '1IT-G', 0),
(10, '1IT-H', 0),
(11, '2IT-A', 0),
(12, '2IT-B', 0),
(13, '3IT-A', 0),
(14, '3IT-B', 0),
(15, '3IT-C', 1),
(16, '4IT-A', 0),
(17, '4IT-B', 0),
(18, '4IT-C', 0),
(19, '4IT-E', 0),
(20, '4IT-F', 0),
(21, '4IT-H', 0),
(22, '4IT-I', 0),
(24, '1CS-B', 0),
(25, '1CS-C', 0),
(26, '2CS-A', 0),
(27, '3CS-A', 0),
(28, '4CS-A', 0),
(29, '4CS-B', 0),
(30, '4CS-C', 0),
(31, '4CS-D', 0),
(32, '1IS-A', 0),
(33, '1IS-B', 0),
(34, '1IS-C', 0),
(35, '2IS-A', 0),
(36, '4IS-A', 0),
(37, '4IS-B', 0),
(38, '4IS-C', 0),
(39, '1CS-A', 0);

-- --------------------------------------------------------

--
-- Table structure for table `updatelogs`
--

CREATE TABLE `updatelogs` (
  `ULOGNO` int(11) NOT NULL,
  `ULOGACT` varchar(250) NOT NULL,
  `ULOGUSER` varchar(250) NOT NULL,
  `ULOGTIME` timestamp(1) NOT NULL DEFAULT CURRENT_TIMESTAMP(1) ON UPDATE CURRENT_TIMESTAMP(1),
  `ULOGNEW` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userno` int(11) NOT NULL,
  `userid` varchar(15) NOT NULL,
  `fname` varchar(60) NOT NULL,
  `mname` varchar(60) DEFAULT NULL,
  `lname` varchar(60) NOT NULL,
  `email` varchar(60) NOT NULL,
  `password` varchar(256) NOT NULL,
  `forgotpass` int(1) NOT NULL,
  `role` varchar(10) NOT NULL,
  `section` varchar(10) NOT NULL,
  `secqno` int(2) NOT NULL,
  `secqa` varchar(256) NOT NULL,
  `hidden` int(1) NOT NULL,
  `inqueue` int(1) NOT NULL DEFAULT '0',
  `vcode` varchar(256) NOT NULL,
  `verified` int(1) NOT NULL,
  `deptno` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userno`, `userid`, `fname`, `mname`, `lname`, `email`, `password`, `forgotpass`, `role`, `section`, `secqno`, `secqa`, `hidden`, `inqueue`, `vcode`, `verified`, `deptno`) VALUES
(1, 'admin', 'Admin', NULL, 'Account', 'admin@ust.edu.ph', '$2y$10$Zklc9S1XCvNQGdYg2LOn8.dVShgTiEJ9xTxLvU7F7VGm8YBjY8u5m', 0, 'admin', 'admin', 1, '$2y$10$iJaecd1jMFQ7Trh.LdmMSe.x3ghek2gZJNGGtD673NnJnp6KZ3Aau', 0, 0, '7SY1V', 1, 0),
(2, '2015084963', 'Joseph Christian', 'Bautista', 'Dizon', 'josephchristian.dizon.iics@ust.edu.ph', '$2y$10$e/8aISvR6VMaBzvClAjx/.lplmn7tVYTrgnDXHIkqwPyw//mu1YVW', 0, 'student', '4ITG', 1, '$2y$10$9vjPLrodNKDz9m9rdQDbWuBb0ONgx75rRYYIZZdrOvJsMm5m7hx0S', 0, 0, 'XSCKM', 1, 1),
(3, '2015086320', 'Rolland Charles', 'Dela Cruz', 'Gamez', 'rollandcharles.gamez.iics@ust.edu.ph', '$2y$10$IaUC95enpsco4m0SCAA5kO1JplON0qhyg0DVfycagqSyj25fuJOEy', 0, 'student', '4IT-G', 1, '$2y$10$zJm6hSk3IfGi.kgCyYukReLDbDyMsJYkdbny.dG9oyZPvIoTray.O', 0, 0, 'YOVKG', 1, 2),
(4, '1998123123', 'Faculty', NULL, 'Account', 'faculty@ust.edu.ph', '$2y$10$6vV.gy0Ln0scm1kKZnQ5WeoT4UcVPcRl6egOOjEOASRdvdEvyK426', 0, 'faculty', 'itchair', 1, '$2y$10$6vV.gy0Ln0scm1kKZnQ5WeoT4UcVPcRl6egOOjEOASRdvdEvyK426', 0, 0, '$2y$10$6vV.gy0Ln0scm1kKZnQ5WeoT4UcVPcRl6egOOjEOASRdvdEvyK426', 1, 0),
(5, 'testadmin', 'Test', '', 'Admin', 'testadmin@ust.edu.ph', '$2y$10$bxyin98.mkqiS10wynA/F.1rSKaingUyvviMUf/DP83a9UG9YEbjC', 0, 'admin', 'Admin', 1, '$2y$10$erQZNbWVDpym0Yx5FL7AFeG28lAlmjtBcHfY0rIucQsCwhCdHTsIG', 0, 0, 'admin', 1, 0),
(7, '1998123124', 'Faculty', NULL, 'Account 2', 'faculty@ust.edu.ph', '$2y$10$6vV.gy0Ln0scm1kKZnQ5WeoT4UcVPcRl6egOOjEOASRdvdEvyK426', 0, 'faculty', 'swdb', 1, '$2y$10$6vV.gy0Ln0scm1kKZnQ5WeoT4UcVPcRl6egOOjEOASRdvdEvyK426', 0, 0, '$2y$10$6vV.gy0Ln0scm1kKZnQ5WeoT4UcVPcRl6egOOjEOASRdvdEvyK426', 1, 0),
(14, '2019134640', 'Medlynne', 'Villafuerte', 'Cuyugan', 'medlynne.cuyugan.cthm@ust.edu.ph', '$2y$10$a26x9RI2w8ZLT1v3PPHhOee7/5ry9zYZS1/FTCKri4QQCs.kO6CF.', 0, 'student', '1IT-A', 2, '$2y$10$kQvJ6P44ZhuGELwghEKEoOcoxn3gHLW4eEXhAMnyfs.wx46cy.MEC', 0, 0, '$2y$10$bx/6G8d.XvUHog4nRPN2COmDajEazGkHINmjfLgq7Z7dGh9WDX2OW', 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `users_temp`
--

CREATE TABLE `users_temp` (
  `userno` int(11) NOT NULL,
  `userid` varchar(15) NOT NULL,
  `fname` varchar(60) NOT NULL,
  `mname` varchar(60) DEFAULT NULL,
  `lname` varchar(60) NOT NULL,
  `email` varchar(60) NOT NULL,
  `password` varchar(256) NOT NULL,
  `forgotpass` int(1) NOT NULL,
  `role` varchar(10) NOT NULL,
  `section` varchar(10) NOT NULL,
  `secqno` int(2) NOT NULL,
  `secqa` varchar(256) NOT NULL,
  `hidden` int(1) NOT NULL,
  `inqueue` int(1) NOT NULL DEFAULT '0',
  `vcode` varchar(8) NOT NULL,
  `verified` int(1) NOT NULL,
  `deptname` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_temp`
--

INSERT INTO `users_temp` (`userno`, `userid`, `fname`, `mname`, `lname`, `email`, `password`, `forgotpass`, `role`, `section`, `secqno`, `secqa`, `hidden`, `inqueue`, `vcode`, `verified`, `deptname`) VALUES
(2, '2019281930', 'Test', '', 'Email', '123123@ust.edu.ph', '$2y$10$MHZOkAc.2BysUAB62ToYSuNOKBt4nuCI5S43H6RSFrTcDuX3p.2FO', 0, 'student', '1CS-A', 2, '$2y$10$CtY4eMSTS4fynlYWLPwbpO7/KwD0bJD4qIEBXAU5xZNISNq2pOcEy', 0, 0, 'UW89Q', 0, ''),
(3, '2018920392', 'Test', '', 'Email', '1231232@ust.edu.ph', '$2y$10$zy1ZiOoBVihfYuF5EUBfQOtaTFO5dHOZWM.ZKJtWq7kjsVOGTsvVu', 0, 'student', '1CS-A', 1, '$2y$10$WD3ORnAswvfpQuOiBXwynOLtaMaip0RqwlhHMQeV9DeMYtzoUd/J.', 0, 0, 'CC6BN', 0, '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`annno`),
  ADD KEY `userid` (`userno`),
  ADD KEY `deptno` (`deptno`);

--
-- Indexes for table `consultations`
--
ALTER TABLE `consultations`
  ADD PRIMARY KEY (`conno`),
  ADD KEY `conprof` (`conprof`),
  ADD KEY `userid` (`userno`);

--
-- Indexes for table `consulthours`
--
ALTER TABLE `consulthours`
  ADD PRIMARY KEY (`chourno`),
  ADD KEY `userno` (`userno`);

--
-- Indexes for table `consultlogs`
--
ALTER TABLE `consultlogs`
  ADD PRIMARY KEY (`conno`),
  ADD KEY `conprof` (`conprof`),
  ADD KEY `userid` (`userno`);

--
-- Indexes for table `dept`
--
ALTER TABLE `dept`
  ADD PRIMARY KEY (`deptno`);

--
-- Indexes for table `doclogs`
--
ALTER TABLE `doclogs`
  ADD PRIMARY KEY (`docno`),
  ADD KEY `userid` (`userno`);

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`docno`),
  ADD KEY `userid` (`userno`);

--
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`fileno`);

--
-- Indexes for table `notif`
--
ALTER TABLE `notif`
  ADD PRIMARY KEY (`notifno`),
  ADD KEY `userno` (`userno`);

--
-- Indexes for table `qtoggle`
--
ALTER TABLE `qtoggle`
  ADD PRIMARY KEY (`qtogno`);

--
-- Indexes for table `queue`
--
ALTER TABLE `queue`
  ADD PRIMARY KEY (`qno`),
  ADD KEY `userid` (`userno`);

--
-- Indexes for table `queuelogs`
--
ALTER TABLE `queuelogs`
  ADD PRIMARY KEY (`qno`),
  ADD KEY `userid` (`userno`);

--
-- Indexes for table `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`schedno`);

--
-- Indexes for table `secq`
--
ALTER TABLE `secq`
  ADD PRIMARY KEY (`secqno`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`sectionno`);

--
-- Indexes for table `updatelogs`
--
ALTER TABLE `updatelogs`
  ADD PRIMARY KEY (`ULOGNO`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userno`),
  ADD KEY `userid` (`userid`),
  ADD KEY `secqno` (`secqno`),
  ADD KEY `deptno` (`deptno`);

--
-- Indexes for table `users_temp`
--
ALTER TABLE `users_temp`
  ADD PRIMARY KEY (`userno`),
  ADD KEY `userid` (`userid`),
  ADD KEY `secqno` (`secqno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `annno` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `consultations`
--
ALTER TABLE `consultations`
  MODIFY `conno` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `consulthours`
--
ALTER TABLE `consulthours`
  MODIFY `chourno` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `consultlogs`
--
ALTER TABLE `consultlogs`
  MODIFY `conno` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `doclogs`
--
ALTER TABLE `doclogs`
  MODIFY `docno` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
  MODIFY `docno` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `fileno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `notif`
--
ALTER TABLE `notif`
  MODIFY `notifno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=287;

--
-- AUTO_INCREMENT for table `queue`
--
ALTER TABLE `queue`
  MODIFY `qno` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `queuelogs`
--
ALTER TABLE `queuelogs`
  MODIFY `qno` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `schedule`
--
ALTER TABLE `schedule`
  MODIFY `schedno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `secq`
--
ALTER TABLE `secq`
  MODIFY `secqno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `sectionno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `updatelogs`
--
ALTER TABLE `updatelogs`
  MODIFY `ULOGNO` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users_temp`
--
ALTER TABLE `users_temp`
  MODIFY `userno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
