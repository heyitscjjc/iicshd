-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 07, 2020 at 05:55 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.11

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
  `anndate` timestamp(1) NOT NULL DEFAULT current_timestamp(1) ON UPDATE current_timestamp(1),
  `userno` int(11) NOT NULL,
  `hidden` int(1) NOT NULL,
  `pin` int(1) NOT NULL DEFAULT 0,
  `deptno` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `announcements`
--

INSERT INTO `announcements` (`annno`, `anntitle`, `anndesc`, `anndate`, `userno`, `hidden`, `pin`, `deptno`) VALUES
(1, 'Test Announcement', 'This is an announcement made by the Admin.', '2019-11-26 10:26:59.2', 1, 0, 0, 0),
(2, 'This is a test announcement with notifications', 'Testing', '2019-03-03 16:53:54.9', 1, 1, 0, 0),
(3, 'Test Announcement', 'New', '2019-03-03 16:54:04.2', 1, 1, 0, 0),
(4, 'Test', 'Announcement', '2019-03-03 16:54:00.6', 1, 1, 0, 0),
(5, 'Test', 'Testing Announcement', '2019-03-03 16:54:07.9', 1, 1, 0, 0),
(6, 'Test', 'ANnouncement', '2019-03-06 04:03:21.8', 1, 0, 0, 0),
(7, 'Test', 'Announcement', '2019-03-06 16:11:15.0', 1, 0, 0, 0),
(8, 'Test', 'Test', '2019-03-06 16:13:46.0', 1, 0, 0, 0),
(9, 'Test', 'Test', '2019-03-06 16:17:10.0', 1, 0, 0, 0),
(10, 'Testing', 'Testing', '2019-03-06 16:19:36.0', 1, 0, 0, 0),
(11, 'Test', 'Test', '2019-03-06 16:22:28.0', 1, 0, 0, 0),
(12, 'Test', 'Test', '2019-03-06 16:24:52.0', 1, 0, 0, 0),
(13, 'Test', 'Test', '2019-03-06 16:30:04.0', 1, 0, 0, 0),
(14, 'Test', 'Test', '2019-03-06 16:42:12.0', 1, 0, 0, 0),
(15, 'Test', 'Test', '2019-03-06 16:45:55.0', 1, 0, 0, 0),
(16, 'test', 'Test', '2019-03-06 16:48:14.0', 1, 0, 0, 0),
(17, 'Test', 'Test', '2019-03-06 16:49:16.0', 1, 0, 0, 0),
(18, 'Testing', 'Testing', '2019-03-06 16:50:40.0', 1, 0, 0, 0),
(19, 'test', 'test', '2019-03-06 16:51:04.0', 1, 0, 0, 0),
(20, 'Test', 'Test', '2019-03-06 16:54:51.0', 1, 0, 0, 0),
(21, 'Test', 'Test', '2019-03-06 16:55:39.0', 1, 0, 0, 0),
(22, 'q123', '123', '2019-03-07 04:24:34.0', 1, 0, 0, 0),
(23, '123', '123', '2019-03-07 04:27:39.0', 1, 0, 0, 0),
(24, '123', '123', '2019-03-07 04:28:11.0', 1, 0, 0, 0),
(25, '123', '123', '2019-03-07 04:30:05.0', 1, 0, 0, 0),
(26, '123', '123', '2019-03-07 04:38:44.0', 1, 0, 0, 0),
(27, '123', '123', '2019-03-07 04:42:02.0', 1, 0, 0, 0),
(28, '123', '123', '2019-03-07 04:53:31.0', 1, 0, 0, 0),
(29, '123', '123', '2019-03-07 05:04:26.0', 1, 0, 0, 0),
(30, '123', '123', '2019-03-07 05:08:30.0', 1, 0, 0, 0),
(31, '123', '123', '2019-03-07 05:08:52.0', 1, 0, 0, 0),
(32, '123', '123', '2019-03-07 05:09:05.0', 1, 0, 0, 0),
(33, '213', '123', '2019-03-07 05:09:20.0', 1, 0, 0, 0),
(34, '123', '123', '2019-03-07 05:09:57.0', 1, 0, 0, 0),
(35, '123', '123', '2019-03-07 05:10:24.0', 1, 0, 0, 0),
(36, '123', '123', '2019-03-07 05:12:46.0', 1, 0, 0, 0),
(37, '123', '123', '2019-03-07 05:13:25.0', 1, 0, 0, 0),
(38, '123', '123', '2019-03-07 05:14:31.0', 1, 0, 0, 0),
(39, '123', '123', '2019-03-07 05:16:05.0', 1, 0, 0, 0),
(40, '123', '123', '2019-03-07 05:16:48.0', 1, 0, 0, 0),
(41, '123', '123', '2019-03-07 05:18:19.0', 1, 0, 0, 0),
(42, '312', '312', '2019-03-07 05:18:32.0', 1, 0, 0, 0),
(43, '312', '312', '2019-03-07 05:18:32.0', 1, 0, 0, 0),
(44, '123', '123', '2019-03-07 05:21:24.0', 1, 0, 0, 0),
(45, '123', '123', '2019-03-07 05:23:17.0', 1, 0, 0, 0),
(46, '123', '123', '2019-03-07 05:28:19.0', 1, 0, 0, 0),
(47, '123', '123', '2019-03-07 05:29:02.0', 1, 0, 0, 0),
(48, '123', '123', '2019-03-07 05:31:26.0', 1, 0, 0, 0),
(49, 'New', '123', '2019-03-07 05:32:22.0', 1, 0, 0, 0),
(50, 'Test', 'New', '2019-03-07 05:37:05.0', 1, 0, 0, 0),
(51, 'Sample', '123', '2019-03-07 05:37:53.0', 1, 0, 0, 0),
(52, '123', '123', '2019-03-07 05:41:41.0', 1, 0, 0, 0),
(53, '123', '312', '2019-03-07 05:54:38.0', 1, 0, 0, 0),
(54, '3213', '3123', '2019-03-07 05:54:41.0', 1, 0, 0, 0),
(55, '432', '23412', '2019-03-07 05:54:45.0', 1, 0, 0, 0),
(56, '123', '123', '2019-03-07 05:55:54.0', 1, 0, 0, 0),
(57, '67576', '54', '2019-03-07 05:56:09.0', 1, 0, 0, 0),
(58, '3123', '123', '2019-03-07 07:17:22.0', 1, 0, 0, 0),
(59, '123', '123', '2019-03-07 07:46:26.0', 1, 0, 0, 0),
(60, '321', '312', '2019-03-07 07:50:37.0', 1, 0, 0, 0),
(61, '321', '312', '2019-03-07 08:14:00.0', 1, 0, 0, 0),
(62, 'asdf', 'sample', '2019-11-26 10:27:02.3', 1, 0, 1, 0),
(63, 'TEST', 'TEST JC JC', '2019-11-26 10:29:50.0', 1, 0, 0, 0),
(64, 'CJJCCJCJCJCJCJ', 'EOWKEWOEKW', '2019-11-26 10:30:12.0', 1, 0, 0, 0),
(65, 'test', 'dept post', '2020-02-06 08:37:14.0', 7, 0, 0, 3),
(66, 'TEST FOR IS', 'TEST', '2020-02-07 16:25:27.0', 7, 0, 0, 2),
(67, 'TEST POST FOR ALL', 'ALL', '2020-02-07 16:27:10.0', 7, 0, 0, 0),
(68, 'TEST FOR CS', 'TEST', '2020-02-07 16:32:40.0', 7, 0, 0, 1);

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
  `condatecreated` timestamp(1) NOT NULL DEFAULT current_timestamp(1) ON UPDATE current_timestamp(1),
  `conpref` varchar(256) NOT NULL,
  `constatus` varchar(20) NOT NULL,
  `conremarks` varchar(256) DEFAULT NULL,
  `constart` timestamp NULL DEFAULT NULL,
  `conend` timestamp NULL DEFAULT NULL,
  `condatemodified` timestamp(1) NOT NULL DEFAULT '0000-00-00 00:00:00.0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `consultations`
--

INSERT INTO `consultations` (`conno`, `consub`, `condesc`, `conprof`, `userno`, `condatecreated`, `conpref`, `constatus`, `conremarks`, `constart`, `conend`, `condatemodified`) VALUES
(1, 'Test 1', 'Sample', 4, 3, '2019-05-03 11:53:43.5', 'Wednesday 10:00 AM-12:00 PM', 'Declined', '123', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2019-03-05 08:17:04.0'),
(2, 'Test 2', 'Sample', 4, 3, '2019-03-07 10:59:07.3', '', 'Done', 'Thanks', '2018-12-31 17:00:00', '2018-12-31 17:00:00', '2019-03-07 10:59:07.0'),
(3, 'Test', 'Consultation', 4, 3, '2019-03-07 09:51:07.3', '', 'Accepted', '123', '2018-12-31 17:00:00', '2019-01-01 05:00:00', '2019-03-07 09:51:07.0'),
(4, '321', '312', 4, 3, '2019-03-07 09:54:18.8', '', 'Accepted', 'Please see me', '2018-12-31 17:00:00', '2019-01-01 05:00:00', '2019-03-07 09:54:18.0'),
(5, 'Sample Title Sample Description Sample Description', 'Sample Description Sample Description Sample Description Sample Description Sample Description Sample Description', 4, 3, '2019-03-07 10:01:30.0', '', 'Accepted', 'Sample', '2018-12-31 17:00:00', '2019-01-01 05:00:00', '2019-03-07 10:01:30.0'),
(6, '&lt;li style=&quot;width: 300px; white-space: normal;&quot;&', '&lt;li style=&quot;width: 300px; white-space: normal;&quot;&gt;   &lt;li style=&quot;width: 300px; white-space: normal;&quot;&gt;', 4, 3, '2019-03-07 09:59:55.4', '', 'Declined', 'Sample Remarks', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2019-03-07 09:59:55.0'),
(7, '312', '312', 4, 3, '2019-03-07 10:10:05.9', '', 'Accepted', 'Please see me on the said time.', '2018-12-31 17:00:00', '2019-01-01 05:00:00', '2019-03-07 10:10:05.0'),
(8, '321', '312', 4, 3, '2019-03-07 10:53:34.0', '', 'Accepted', 'Thank you', '2019-03-06 04:12:00', '0000-00-00 00:00:00', '2019-03-07 10:53:34.0'),
(9, '312', '312', 4, 3, '2019-03-07 11:05:44.6', '', 'Accepted', 'Sample Remarks', '2019-03-07 17:13:00', '2019-03-08 06:30:00', '2019-03-07 11:05:44.0'),
(10, '312', '312', 4, 3, '2019-03-07 10:49:58.0', '', 'Requested', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00.0'),
(11, '321', '312', 4, 3, '2019-03-07 10:50:02.0', '', 'Requested', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00.0'),
(12, 'Test Consultation', 'May I ask for consultation?', 4, 3, '2019-03-13 16:10:38.0', '', 'Requested', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00.0'),
(13, 'Sample', 'Consultation', 4, 3, '2019-03-16 04:04:13.0', '', 'Requested', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00.0'),
(14, 'Sample 2', 'Sample', 4, 3, '2019-03-16 04:06:12.0', '', 'Requested', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00.0'),
(15, 'AA', 'TEST', 4, 3, '2019-05-03 11:49:45.0', 'Monday', 'Requested', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00.0'),
(16, '111', '111', 4, 3, '2019-05-03 11:50:58.0', 'Wednesday', 'Requested', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00.0'),
(17, '11133', '123123', 4, 3, '2019-05-03 11:52:26.0', 'Wednesday', 'Requested', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00.0'),
(18, 'Sample', 'Please', 4, 3, '2019-05-03 11:55:04.0', 'Monday', 'Requested', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00.0'),
(19, '123123', '321312', 4, 3, '2019-05-03 11:56:23.0', 'Monday', 'Requested', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00.0'),
(20, 'Try nga', '123', 4, 3, '2019-05-03 11:59:20.0', 'Monday', 'Requested', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00.0'),
(21, 'Gte', '13', 4, 3, '2019-05-03 12:12:08.0', 'Monday 2:00 PM-4:00 PM', 'Requested', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00.0');

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

--
-- Dumping data for table `consulthours`
--

INSERT INTO `consulthours` (`chourno`, `userno`, `isactive`, `daytime`) VALUES
(1, 4, 1, 'Monday 2:00 PM-4:00 PM'),
(2, 4, 1, 'Wednesday 10:00 AM-12:00 PM');

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
  `condatecreated` timestamp(1) NOT NULL DEFAULT current_timestamp(1) ON UPDATE current_timestamp(1),
  `conpref` varchar(256) NOT NULL,
  `constatus` varchar(20) NOT NULL,
  `condatemodified` timestamp(1) NOT NULL DEFAULT '0000-00-00 00:00:00.0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `consultlogs`
--

INSERT INTO `consultlogs` (`conno`, `consub`, `condesc`, `conprof`, `userno`, `condatecreated`, `conpref`, `constatus`, `condatemodified`) VALUES
(1, 'Test Consultation', 'This is a test', 4, 3, '2019-03-03 16:45:29.0', '', 'Requested', '0000-00-00 00:00:00.0'),
(2, 'Consultation 2', 'Test', 4, 3, '2019-03-03 16:46:39.0', '', 'Requested', '0000-00-00 00:00:00.0'),
(3, 'Test Consultation', 'notify me senpai', 4, 3, '2019-03-03 16:47:34.0', '', 'Requested', '0000-00-00 00:00:00.0'),
(4, 'Need help with my grades', 'Please', 4, 3, '2019-03-03 16:48:26.0', '', 'Requested', '0000-00-00 00:00:00.0'),
(5, '123', '123', 4, 3, '2019-03-04 13:52:19.0', '', 'Requested', '0000-00-00 00:00:00.0'),
(6, 'This is a test', 'Testing', 4, 3, '2019-03-04 17:01:20.0', '', 'Requested', '0000-00-00 00:00:00.0'),
(7, 'Consultation', 'IT205', 4, 3, '2019-03-05 05:34:49.0', '', 'Requested', '0000-00-00 00:00:00.0'),
(8, 'Testing', 'New', 4, 3, '2019-03-05 06:32:30.0', '', 'Requested', '0000-00-00 00:00:00.0'),
(9, '123', '123', 4, 3, '2019-03-05 07:15:18.0', '', 'Requested', '0000-00-00 00:00:00.0'),
(10, 'Test', 'Sample', 4, 3, '2019-03-05 07:45:16.0', '', 'Requested', '0000-00-00 00:00:00.0'),
(11, 'Testing', 'Test', 4, 3, '2019-03-05 07:58:43.0', '', 'Requested', '0000-00-00 00:00:00.0'),
(12, 'Test 1', 'Sample', 4, 3, '2019-03-05 08:14:49.0', '', 'Requested', '0000-00-00 00:00:00.0'),
(13, 'Test 2', 'Sample', 4, 3, '2019-03-05 08:17:15.0', '', 'Requested', '0000-00-00 00:00:00.0'),
(14, 'Test', 'Consultation', 4, 3, '2019-03-07 08:14:38.0', '', 'Requested', '0000-00-00 00:00:00.0'),
(15, '321', '312', 4, 3, '2019-03-07 09:53:32.0', '', 'Requested', '0000-00-00 00:00:00.0'),
(16, 'Sample Title Sample Description Sample Description', 'Sample Description Sample Description Sample Description Sample Description Sample Description Sample Description', 4, 3, '2019-03-07 09:55:30.0', '', 'Requested', '0000-00-00 00:00:00.0'),
(17, '&lt;li style=&quot;width: 300px; white-space: normal;&quot;&', '&lt;li style=&quot;width: 300px; white-space: normal;&quot;&gt;   &lt;li style=&quot;width: 300px; white-space: normal;&quot;&gt;', 4, 3, '2019-03-07 09:57:12.0', '', 'Requested', '0000-00-00 00:00:00.0'),
(18, '312', '312', 4, 3, '2019-03-07 10:09:35.0', '', 'Requested', '0000-00-00 00:00:00.0'),
(19, '321', '312', 4, 3, '2019-03-07 10:32:57.0', '', 'Requested', '0000-00-00 00:00:00.0'),
(20, '312', '312', 4, 3, '2019-03-07 10:41:00.0', '', 'Requested', '0000-00-00 00:00:00.0'),
(21, '312', '312', 4, 3, '2019-03-07 10:49:59.0', '', 'Requested', '0000-00-00 00:00:00.0'),
(22, '321', '312', 4, 3, '2019-03-07 10:50:02.0', '', 'Requested', '0000-00-00 00:00:00.0'),
(23, 'Test Consultation', 'May I ask for consultation?', 4, 3, '2019-03-13 16:10:38.0', '', 'Requested', '0000-00-00 00:00:00.0'),
(24, 'Sample', 'Consultation', 4, 3, '2019-03-16 04:04:14.0', '', 'Requested', '0000-00-00 00:00:00.0'),
(25, 'Sample 2', 'Sample', 4, 3, '2019-03-16 04:06:12.0', '', 'Requested', '0000-00-00 00:00:00.0'),
(26, 'AA', 'TEST', 4, 3, '2019-05-03 11:49:45.0', 'Monday', 'Requested', '0000-00-00 00:00:00.0'),
(27, '111', '111', 4, 3, '2019-05-03 11:50:58.0', 'Wednesday', 'Requested', '0000-00-00 00:00:00.0'),
(28, '11133', '123123', 4, 3, '2019-05-03 11:52:26.0', 'Wednesday', 'Requested', '0000-00-00 00:00:00.0'),
(29, 'Sample', 'Please', 4, 3, '2019-05-03 11:55:04.0', 'Monday', 'Requested', '0000-00-00 00:00:00.0'),
(30, '123123', '321312', 4, 3, '2019-05-03 11:56:23.0', 'Monday', 'Requested', '0000-00-00 00:00:00.0'),
(31, 'Try nga', '123', 4, 3, '2019-05-03 11:59:20.0', 'Monday', 'Requested', '0000-00-00 00:00:00.0'),
(32, 'Gte', '13', 4, 3, '2019-05-03 12:12:09.0', 'Monday 2:00 PM-4:00 PM', 'Requested', '0000-00-00 00:00:00.0');

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
  `docdatesubmit` timestamp(1) NULL DEFAULT NULL ON UPDATE current_timestamp(1),
  `userno` int(11) NOT NULL,
  `doctitle` varchar(60) NOT NULL,
  `docdesc` varchar(250) NOT NULL,
  `docstatus` varchar(60) NOT NULL,
  `docdatechange` timestamp(1) NOT NULL DEFAULT current_timestamp(1),
  `hidden` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doclogs`
--

INSERT INTO `doclogs` (`docno`, `docdatesubmit`, `userno`, `doctitle`, `docdesc`, `docstatus`, `docdatechange`, `hidden`) VALUES
(1, '2019-03-08 11:42:38.6', 3, '123', '321', 'Received by Student', '2019-03-08 11:42:38.0', 0),
(2, '2019-03-08 08:26:35.9', 3, 'Sample Document', 'Petition Paper', 'Received by Student', '2019-03-08 08:26:35.0', 0),
(3, '2019-03-08 12:08:46.7', 3, 'Test Submission', 'Submitted Document', 'Received by Office', '2019-03-08 12:08:46.0', 0),
(4, '2019-03-08 12:09:06.8', 3, 'Test Submission', 'Submitted Document', 'Received by Office', '2019-03-08 12:09:06.0', 0),
(5, '2019-03-08 12:09:13.9', 3, 'Test', 'Submission', 'Not Received', '2019-03-08 12:09:13.0', 0),
(6, '2019-03-08 12:09:18.2', 3, 'Test', 'Submission', 'Not Received', '2019-03-08 12:09:18.0', 0),
(7, '2019-11-30 14:21:22.9', 3, 'Petition Form', 'Sample', 'Not Received', '2019-11-30 14:21:22.0', 0),
(8, '2019-03-14 08:30:16.0', 3, 'Petition Form', '', 'Submitted', '0000-00-00 00:00:00.0', 0),
(9, '2019-05-03 12:18:13.0', 3, 'Endorsement Letter', 'Sample', 'Received by Office', '2019-05-03 12:18:13.0', 0);

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE `documents` (
  `docno` int(11) NOT NULL,
  `docdatesubmit` timestamp(1) NULL DEFAULT NULL ON UPDATE current_timestamp(1),
  `userno` int(11) NOT NULL,
  `doctitle` varchar(60) NOT NULL,
  `docdesc` varchar(250) NOT NULL,
  `docstatus` varchar(60) NOT NULL,
  `docdatechange` timestamp(1) NOT NULL DEFAULT current_timestamp(1),
  `docDir` varchar(250) NOT NULL,
  `hidden` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `documents`
--

INSERT INTO `documents` (`docno`, `docdatesubmit`, `userno`, `doctitle`, `docdesc`, `docstatus`, `docdatechange`, `docDir`, `hidden`) VALUES
(27, '2019-12-06 15:31:50.4', 12, 'Reg form', 'For OJT 2', 'Received by Office', '2019-12-06 15:31:50.0', 'uploads/submittedDocs/DIZON_REG_FORM.pdf', 0),
(28, '2019-12-06 15:32:06.5', 3, 'Sample Docu', 'Docu', 'Received by Office', '2019-12-06 15:32:06.0', 'uploads/submittedDocs/TEST.pdf', 0);

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE `files` (
  `fileno` int(11) NOT NULL,
  `filetitle` varchar(256) NOT NULL,
  `filename` varchar(256) NOT NULL,
  `filedate` timestamp(1) NOT NULL DEFAULT current_timestamp(1) ON UPDATE current_timestamp(1),
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
  `notifstatus` int(1) NOT NULL DEFAULT 0
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
(258, 7, 'New Announcement Posted', 'TEST FOR CS posted by Faculty  Account 2', 'all', '2020-02-08 00:32:40.0', 0);

-- --------------------------------------------------------

--
-- Table structure for table `qtoggle`
--

CREATE TABLE `qtoggle` (
  `qtogno` int(11) NOT NULL DEFAULT 1,
  `qtoggle` int(1) NOT NULL DEFAULT 1,
  `qadmin` int(1) NOT NULL DEFAULT 1
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
  `qdate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `qstatus` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `queue`
--

INSERT INTO `queue` (`qno`, `userno`, `qtype`, `qtitle`, `qdesc`, `qdate`, `qstatus`) VALUES
(1, 10, 'Enrollment Concern', NULL, '', '2019-11-30 14:48:44', 'No-Show'),
(2, 10, 'Enrollment Concern', NULL, '', '2019-11-30 14:50:01', 'No-Show'),
(3, 10, 'Enrollment Concern', NULL, '', '2019-11-30 14:50:14', 'Waiting'),
(4, 3, 'Document Inquiry', NULL, '', '2019-12-06 15:26:50', 'Done'),
(5, 3, 'Document Inquiry', NULL, '', '2019-12-06 15:27:17', 'No-Show'),
(6, 2, 'Document Inquiry', NULL, '', '2019-12-07 07:55:15', 'Done'),
(7, 2, 'Document Inquiry', NULL, '', '2020-02-06 07:03:12', 'Done');

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
  `qdate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `qstatus` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `queuelogs`
--

INSERT INTO `queuelogs` (`qno`, `userno`, `qtype`, `qtitle`, `qdesc`, `qremarks`, `qdate`, `qstatus`) VALUES
(1, 2, 'Document Inquiry', '', '', '', '2019-02-20 03:00:34', 'Waiting'),
(2, 2, 'Enrollment Concern', '', '', '', '2019-02-20 03:01:35', 'Waiting'),
(3, 2, 'Document Inquiry', '', '', '', '2019-02-19 16:00:00', 'Done'),
(4, 2, 'Enrollment Concern', '', '', '', '2019-02-19 16:00:00', 'Done'),
(5, 2, 'Document Inquiry', '', '', '', '2019-02-20 03:04:38', 'Waiting'),
(6, 2, 'Enrollment Concern', '', '', '', '2019-02-20 03:06:03', 'Waiting'),
(7, 2, 'Document Inquiry', NULL, '', '', '2019-02-19 16:00:00', 'No-Show'),
(8, 2, 'Enrollment Concern', NULL, '', '', '2019-02-19 16:00:00', 'No-Show'),
(9, 2, 'Document Inquiry', '', '', '', '2019-02-20 03:07:12', 'Waiting'),
(10, 2, 'Document Inquiry', '', '', '', '2019-02-19 16:00:00', 'Done'),
(11, 3, 'Document Inquiry', '', '', '', '2019-03-02 18:38:57', 'Waiting'),
(12, 3, 'Document Inquiry', '', '', '', '2019-03-02 16:00:00', 'Done'),
(13, 3, 'Meeting with Admin', '', '', '', '2019-03-02 18:48:37', 'Waiting'),
(14, 3, 'Meeting with Admin', '', '', '', '2019-03-02 16:00:00', 'Done'),
(15, 3, 'Other', '', '123', '', '2019-03-02 18:56:03', 'Waiting'),
(16, 3, 'Other', '', '123', '', '2019-03-02 16:00:00', 'Done'),
(17, 3, 'Document Inquiry', '', '', '', '2019-03-02 18:59:32', 'Waiting'),
(18, 3, 'Document Inquiry', '', '', '', '2019-03-02 16:00:00', 'Done'),
(19, 3, 'Document Submission', '123', '123', '', '2019-03-02 19:00:16', 'Waiting'),
(20, 3, 'Document Submission', NULL, '123', '', '2019-03-02 16:00:00', 'No-Show'),
(21, 3, 'Document Submission', '123', '123', '', '2019-03-02 19:02:14', 'Waiting'),
(22, 3, 'Document Submission', '123', '123', '', '2019-03-02 16:00:00', 'Done'),
(23, 3, 'Document Submission', '123', '3321', '', '2019-03-02 19:11:55', 'Waiting'),
(24, 3, 'Document Submission', '123', '3321', '', '2019-03-02 16:00:00', 'Done'),
(25, 3, 'Document Inquiry', '', '', '', '2019-03-03 16:08:43', 'Waiting'),
(26, 3, 'Document Inquiry', '', '', '', '2019-03-03 16:00:00', 'Done'),
(27, 3, 'Other', '', '123', '', '2019-03-03 16:10:11', 'Waiting'),
(28, 3, 'Other', '', '123', '', '2019-03-03 16:00:00', 'Done'),
(29, 3, 'Document Inquiry', '', '', '', '2019-03-03 16:12:54', 'Waiting'),
(30, 3, 'Document Inquiry', '', '', '', '2019-03-03 16:00:00', 'Done'),
(31, 3, 'Document Inquiry', '', '', '', '2019-03-03 16:23:31', 'Waiting'),
(32, 3, 'Document Inquiry', '', '', '', '2019-03-03 16:00:00', 'Done'),
(33, 3, 'Document Inquiry', '', '', '', '2019-03-04 04:28:35', 'Waiting'),
(34, 3, 'Document Inquiry', '', '', '', '2019-03-03 16:00:00', 'Done'),
(35, 3, 'Document Inquiry', '', '', '', '2019-03-04 16:01:00', 'Waiting'),
(36, 3, 'Document Inquiry', '', '', '', '2019-03-04 16:00:00', 'Done'),
(37, 3, 'Document Submission', '123', '123', '', '2019-03-04 19:28:13', 'Waiting'),
(38, 3, 'Document Submission', '123', '123', '', '2019-03-04 16:00:00', 'Done'),
(39, 3, 'Document Submission', 'Testing', 'Test', '', '2019-03-04 19:31:11', 'Waiting'),
(40, 3, 'Document Submission', 'Testing', 'Test', '', '2019-03-04 16:00:00', 'Done'),
(41, 3, 'Document Submission', '3322', '11', '', '2019-03-04 19:37:39', 'Waiting'),
(42, 3, 'Document Submission', '3322', '11', '', '2019-03-04 16:00:00', 'Done'),
(43, 3, 'Document Submission', '123', '321', '', '2019-03-04 19:40:09', 'Waiting'),
(44, 3, 'Document Submission', '123', '321', '', '2019-03-04 16:00:00', 'Done'),
(45, 3, 'Document Submission', 'Sample Document', 'Petition Paper', '', '2019-03-05 05:15:22', 'Waiting'),
(46, 3, 'Document Submission', 'Sample Document', 'Petition Paper', '', '2019-03-04 16:00:00', 'Done'),
(47, 3, 'Document Inquiry', '', '', '', '2019-03-07 06:08:45', 'Waiting'),
(48, 3, 'Document Inquiry', '', '', '', '2019-03-06 16:00:00', 'Done'),
(49, 3, 'Enrollment Concern', '', '', '', '2019-03-07 06:25:33', 'Waiting'),
(50, 3, 'Enrollment Concern', '', '', '', '2019-03-06 16:00:00', 'Done'),
(51, 3, 'Document Inquiry', '', '', '', '2019-03-07 06:41:12', 'Waiting'),
(52, 3, 'Document Inquiry', '', '', '', '2019-03-06 16:00:00', 'Done'),
(53, 3, 'Document Inquiry', '', '', '', '2019-03-07 06:44:19', 'Waiting'),
(54, 2, 'Enrollment Concern', '', '', '', '2019-03-07 06:51:00', 'Waiting'),
(55, 3, 'Document Inquiry', '', '', '', '2019-03-06 16:00:00', 'Done'),
(56, 2, 'Enrollment Concern', '', '', '', '2019-03-06 16:00:00', 'Done'),
(57, 2, 'Document Inquiry', '', '', '', '2019-03-07 06:53:25', 'Waiting'),
(58, 3, 'Document Inquiry', '', '', '', '2019-03-07 06:53:43', 'Waiting'),
(59, 2, 'Document Inquiry', '', '', '', '2019-03-06 16:00:00', 'Done'),
(60, 3, 'Document Inquiry', '', '', '', '2019-03-06 16:00:00', 'Done'),
(61, 3, 'Enrollment Concern', '', '', '', '2019-03-07 06:58:56', 'Waiting'),
(62, 2, 'Document Inquiry', '', '', '', '2019-03-07 06:59:27', 'Waiting'),
(63, 3, 'Enrollment Concern', '', '', '', '2019-03-06 16:00:00', 'Done'),
(64, 2, 'Document Inquiry', '', '', '', '2019-03-06 16:00:00', 'Done'),
(65, 2, 'Document Inquiry', '', '', '', '2019-03-07 07:02:01', 'Waiting'),
(66, 3, 'Document Inquiry', '', '', '', '2019-03-07 07:02:23', 'Waiting'),
(67, 2, 'Document Inquiry', '', '', '', '2019-03-06 16:00:00', 'Done'),
(68, 3, 'Document Inquiry', '', '', '', '2019-03-06 16:00:00', 'Done'),
(69, 3, 'Document Inquiry', '', '', '', '2019-03-07 07:03:55', 'Waiting'),
(70, 2, 'Enrollment Concern', '', '', '', '2019-03-07 07:04:44', 'Waiting'),
(71, 3, 'Document Inquiry', '', '', '', '2019-03-06 16:00:00', 'Done'),
(72, 2, 'Enrollment Concern', NULL, '', '', '2019-03-06 16:00:00', 'No-Show'),
(73, 3, 'Document Inquiry', '', '', '', '2019-03-07 07:22:45', 'Waiting'),
(74, 3, 'Document Inquiry', '', '', '', '2019-03-06 16:00:00', 'Done'),
(75, 3, 'Document Inquiry', '', '', '', '2019-03-07 07:24:57', 'Waiting'),
(76, 2, 'Enrollment Concern', '', '', '', '2019-03-07 07:25:33', 'Waiting'),
(77, 3, 'Document Inquiry', '', '', '', '2019-03-06 16:00:00', 'Done'),
(78, 2, 'Enrollment Concern', '', '', '', '2019-03-06 16:00:00', 'Done'),
(79, 2, 'Document Inquiry', '', '', '', '2019-03-07 07:28:26', 'Waiting'),
(80, 2, 'Document Inquiry', '', '', '', '2019-03-06 16:00:00', 'Done'),
(81, 2, 'Document Inquiry', '', '', '', '2019-03-07 07:28:41', 'Waiting'),
(82, 2, 'Document Inquiry', '', '', '', '2019-03-06 16:00:00', 'Done'),
(83, 2, 'Document Inquiry', '', '', '', '2019-03-07 07:30:00', 'Waiting'),
(84, 2, 'Document Inquiry', '', '', '', '2019-03-06 16:00:00', 'Done'),
(85, 2, 'Document Inquiry', '', '', '', '2019-03-07 07:31:28', 'Waiting'),
(86, 2, 'Document Inquiry', '', '', '', '2019-03-06 16:00:00', 'Done'),
(87, 2, 'Document Inquiry', '', '', '', '2019-03-07 07:32:24', 'Waiting'),
(88, 2, 'Document Inquiry', '', '', '', '2019-03-06 16:00:00', 'Done'),
(89, 2, 'Enrollment Concern', '', '', '', '2019-03-07 07:34:30', 'Waiting'),
(90, 3, 'Document Inquiry', '', '', '', '2019-03-07 07:35:52', 'Waiting'),
(91, 2, 'Enrollment Concern', '', '', '', '2019-03-06 16:00:00', 'Done'),
(92, 3, 'Document Inquiry', '', '', '', '2019-03-06 16:00:00', 'Done'),
(93, 3, 'Document Inquiry', '', '', '', '2019-03-07 07:36:21', 'Waiting'),
(94, 3, 'Document Inquiry', '', '', '', '2019-03-06 16:00:00', 'Done'),
(95, 3, 'Document Inquiry', '', '', '', '2019-03-07 07:39:57', 'Waiting'),
(96, 3, 'Document Inquiry', '', '', '', '2019-03-06 16:00:00', 'Done'),
(97, 3, 'Document Inquiry', '', '', '', '2019-03-07 07:40:48', 'Waiting'),
(98, 3, 'Document Inquiry', '', '', '', '2019-03-06 16:00:00', 'Done'),
(99, 3, 'Document Inquiry', '', '', '', '2019-03-07 07:50:58', 'Waiting'),
(100, 3, 'Document Inquiry', '', '', '', '2019-03-06 16:00:00', 'Done'),
(101, 3, 'Document Inquiry', '', '', '', '2019-03-07 07:54:42', 'Waiting'),
(102, 3, 'Document Inquiry', '', '', '', '2019-03-06 16:00:00', 'Done'),
(103, 3, 'Document Inquiry', '', '', '', '2019-03-07 08:04:04', 'Waiting'),
(104, 3, 'Document Inquiry', '', '', '', '2019-03-06 16:00:00', 'Done'),
(105, 3, 'Enrollment Concern', '', '', '', '2019-03-07 09:15:49', 'Waiting'),
(106, 3, 'Enrollment Concern', '', '', '', '2019-03-06 16:00:00', 'Done'),
(107, 3, 'Document Inquiry', '', '', '', '2019-03-07 11:07:24', 'Waiting'),
(108, 2, 'Document Inquiry', '', '', '', '2019-03-07 11:07:43', 'Waiting'),
(109, 3, 'Document Inquiry', '', '', '', '2019-03-06 16:00:00', 'Done'),
(110, 3, 'Document Inquiry', '', '', '', '2019-03-07 11:16:23', 'Waiting'),
(111, 2, 'Document Inquiry', '', '', '', '2019-03-06 16:00:00', 'Done'),
(112, 3, 'Document Inquiry', '', '', '', '2019-03-06 16:00:00', 'Done'),
(113, 3, 'Document Inquiry', '', '', '', '2019-03-07 12:44:36', 'Waiting'),
(114, 2, 'Document Inquiry', '', '', '', '2019-03-08 06:01:24', 'Waiting'),
(115, 3, 'Document Inquiry', '', '', '', '2019-03-07 16:00:00', 'Done'),
(116, 3, 'Document Inquiry', '', '', '', '2019-03-08 06:09:26', 'Waiting'),
(117, 2, 'Document Inquiry', '', '', '', '2019-03-07 16:00:00', 'Done'),
(118, 3, 'Document Inquiry', '', '', '', '2019-03-07 16:00:00', 'Done'),
(119, 2, 'Document Inquiry', '', '', '', '2019-03-08 06:36:37', 'Waiting'),
(120, 2, 'Document Inquiry', '', '', '', '2019-03-07 16:00:00', 'Done'),
(121, 2, 'Document Inquiry', '', '', '', '2019-03-08 06:48:18', 'Waiting'),
(122, 2, 'Document Inquiry', NULL, '', '', '2019-03-07 16:00:00', 'No-Show'),
(123, 2, 'Document Inquiry', '', '', '', '2019-03-08 06:53:57', 'Waiting'),
(124, 2, 'Document Inquiry', '', '', '', '2019-03-07 16:00:00', 'Done'),
(125, 2, 'Document Inquiry', '', '', '', '2019-03-08 06:59:26', 'Waiting'),
(126, 2, 'Document Inquiry', '', '', '', '2019-03-07 16:00:00', 'Done'),
(127, 3, 'Document Submission', 'Test Submission', 'Submitted Document', '', '2019-03-08 11:49:06', 'Waiting'),
(128, 3, 'Document Submission', 'Test Submission', 'Submitted Document', '', '2019-03-08 11:54:16', 'Waiting'),
(129, 3, 'Document Submission', 'Test Submission', 'Submitted Document', '', '2019-03-07 16:00:00', 'Done'),
(130, 3, 'Document Submission', 'Test Submission', 'Submitted Document', '', '2019-03-07 16:00:00', 'Done'),
(131, 3, 'Document Submission', 'Test', 'Submission', '', '2019-03-08 11:59:11', 'Waiting'),
(132, 3, 'Document Submission', 'Test', 'Submission', '', '2019-03-07 16:00:00', 'Done'),
(133, 3, 'Document Submission', 'Test', 'Submission', '', '2019-03-08 12:05:27', 'Waiting'),
(134, 3, 'Document Submission', 'Test', 'Submission', '', '2019-03-07 16:00:00', 'Done'),
(135, 3, 'Document Inquiry', '', '', '', '2019-03-09 02:24:01', 'Waiting'),
(136, 3, 'Document Inquiry', '', '', '', '2019-03-12 16:00:00', 'Done'),
(137, 3, 'Document Submission', 'Petition Form', 'Sample', '', '2019-03-13 15:47:28', 'Waiting'),
(138, 3, 'Document Submission', 'Petition Form', 'Sample', '', '2019-03-12 16:00:00', 'Done'),
(139, 3, 'Other', 'Petition Form', '', '', '2019-03-14 08:17:01', 'Waiting'),
(140, 3, 'Other', 'Petition Form', '', '', '2019-03-13 16:00:00', 'Done'),
(141, 3, 'Other', NULL, 'Sample', '', '2019-03-14 08:31:42', 'Waiting'),
(142, 3, 'Other', '', 'Sample', '', '2019-05-02 16:00:00', 'Done'),
(143, 3, 'Document Submission', 'Endorsement Letter', 'Sample', '', '2019-05-03 12:16:24', 'Waiting'),
(144, 3, 'Document Submission', 'Endorsement Letter', 'Sample', '', '2019-05-02 16:00:00', 'Done'),
(145, 3, 'Document Inquiry', NULL, '', '', '2019-05-03 12:18:49', 'Waiting'),
(146, 3, 'Document Inquiry', '', '', '', '2019-05-02 16:00:00', 'Done'),
(147, 3, 'Enrollment Concern', NULL, '', '', '2019-05-03 12:31:43', 'Waiting'),
(148, 3, 'Enrollment Concern', '', '', 'Sample', '2019-05-02 16:00:00', 'Done'),
(149, 3, 'Document Inquiry', NULL, '', '', '2019-05-03 12:53:42', 'Waiting'),
(150, 3, 'Document Inquiry', '', '', 'Done', '2019-05-02 16:00:00', 'Done'),
(151, 3, 'Document Inquiry', NULL, '', '', '2019-05-03 12:58:40', 'Waiting'),
(152, 3, 'Document Inquiry', '', '', 'TESTING', '2019-05-03 12:59:00', 'Done'),
(153, 10, 'Document Inquiry', NULL, '', '', '2019-11-30 14:19:21', 'Waiting'),
(154, 10, 'Document Inquiry', '', '', 'test', '2019-11-30 14:19:53', 'Done'),
(155, 10, 'Document Inquiry', NULL, '', '', '2019-11-30 14:37:42', 'Waiting'),
(156, 10, 'Document Inquiry', NULL, '', 'No-Show', '2019-11-30 14:40:18', 'No-Show'),
(157, 10, 'Document Inquiry', NULL, '', '', '2019-11-30 14:40:31', 'Waiting'),
(158, 10, 'Document Inquiry', NULL, '', 'No-Show', '2019-11-30 14:40:55', 'No-Show'),
(159, 10, 'Enrollment Concern', NULL, '', '', '2019-11-30 14:45:03', 'Waiting'),
(160, 10, 'Enrollment Concern', NULL, '', 'No-Show', '2019-11-30 14:45:54', 'No-Show'),
(161, 10, 'Enrollment Concern', NULL, '', '', '2019-11-30 14:46:10', 'Waiting'),
(162, 10, 'Enrollment Concern', NULL, '', 'No-Show', '2019-11-30 14:47:20', 'No-Show'),
(163, 10, 'Enrollment Concern', NULL, '', '', '2019-11-30 14:47:52', 'Waiting'),
(164, 10, 'Enrollment Concern', NULL, '', 'No-Show', '2019-11-30 14:48:44', 'No-Show'),
(165, 10, 'Enrollment Concern', NULL, '', '', '2019-11-30 14:48:54', 'Waiting'),
(166, 10, 'Enrollment Concern', NULL, '', 'No-Show', '2019-11-30 14:50:01', 'No-Show'),
(167, 10, 'Enrollment Concern', NULL, '', '', '2019-11-30 14:50:14', 'Waiting'),
(168, 3, 'Document Inquiry', NULL, '', '', '2019-12-06 15:26:07', 'Waiting'),
(169, 3, 'Document Inquiry', '', '', 'test', '2019-12-06 15:26:50', 'Done'),
(170, 3, 'Document Inquiry', NULL, '', '', '2019-12-06 15:27:01', 'Waiting'),
(171, 3, 'Document Inquiry', NULL, '', 'No-Show', '2019-12-06 15:27:17', 'No-Show'),
(172, 2, 'Document Inquiry', NULL, '', '', '2019-12-07 07:54:08', 'Waiting'),
(173, 2, 'Document Inquiry', '', '', 'test', '2019-12-07 07:55:15', 'Done'),
(174, 2, 'Document Inquiry', NULL, '', '', '2019-12-07 09:01:55', 'Waiting'),
(175, 2, 'Document Inquiry', '', '', 'test\r\n', '2020-02-06 07:03:12', 'Done');

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
  `hidden` int(1) NOT NULL DEFAULT 0
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
  `ULOGTIME` timestamp(1) NOT NULL DEFAULT current_timestamp(1) ON UPDATE current_timestamp(1),
  `ULOGNEW` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `updatelogs`
--

INSERT INTO `updatelogs` (`ULOGNO`, `ULOGACT`, `ULOGUSER`, `ULOGTIME`, `ULOGNEW`) VALUES
(1, 'Login', 'Admin  Account', '2019-02-19 02:59:49.0', 'Logged in successfully.'),
(2, 'Add Security Question', 'Admin  Account', '2019-02-19 02:59:53.0', 'Added security question successfully.'),
(3, 'Add Security Question', 'Admin  Account', '2019-02-19 03:00:29.0', 'Added security question successfully.'),
(4, 'Add Security Question', 'Admin  Account', '2019-02-19 03:01:56.0', 'Added security question successfully.'),
(5, 'Add Security Question', 'Admin  Account', '2019-02-19 03:02:07.0', 'Added security question successfully.'),
(6, 'Add Security Question', 'Admin  Account', '2019-02-19 03:02:26.0', 'Added security question successfully.'),
(7, 'Add Security Question', 'Admin  Account', '2019-02-19 03:02:44.0', 'Added security question successfully.'),
(8, 'Add Security Question', 'Admin  Account', '2019-02-19 03:03:08.0', 'Added security question successfully.'),
(9, 'Login', 'Admin  Account', '2019-02-19 05:08:51.0', 'Logged in successfully.'),
(10, 'Post Announcement', 'Admin  Account', '2019-02-19 05:09:11.0', 'Announcement posted successfully.'),
(11, 'Login', 'Admin  Account', '2019-02-19 16:13:20.0', 'Logged in successfully.'),
(12, 'Login', 'Admin  Account', '2019-02-20 02:19:52.0', 'Logged in successfully.'),
(13, 'Login', 'Admin  Account', '2019-02-20 02:23:52.0', 'Logged in successfully.'),
(14, 'Queue Control', 'Admin  Account', '2019-02-20 02:35:58.0', 'Admin is available.'),
(15, 'Queue Control', 'Admin  Account', '2019-02-20 02:36:00.0', 'Admin is unavailable.'),
(16, 'Queue Control', 'Admin  Account', '2019-02-20 02:36:02.0', 'Admin is unavailable.'),
(17, 'Queue Control', 'Admin  Account', '2019-02-20 02:36:58.0', 'Admin is unavailable.'),
(18, 'Queue Control', 'Admin  Account', '2019-02-20 02:37:34.0', 'Admin is unavailable.'),
(19, 'Queue Control', 'Admin  Account', '2019-02-20 02:39:12.0', 'Admin is unavailable.'),
(20, 'Queue Control', 'Admin  Account', '2019-02-20 02:39:21.0', 'Admin is unavailable.'),
(21, 'Queue Control', 'Admin  Account', '2019-02-20 02:39:32.0', 'Admin is available.'),
(22, 'Queue Control', 'Admin  Account', '2019-02-20 02:39:33.0', 'Admin is unavailable.'),
(23, 'Queue Control', 'Admin  Account', '2019-02-20 02:40:34.0', 'Admin is available.'),
(24, 'Queue Control', 'Admin  Account', '2019-02-20 02:42:15.0', 'Admin is unavailable.'),
(25, 'Queue Control', 'Admin  Account', '2019-02-20 02:42:39.0', 'Admin is unavailable.'),
(26, 'Queue Control', 'Admin  Account', '2019-02-20 02:42:42.0', 'Admin is unavailable.'),
(27, 'Queue Control', 'Admin  Account', '2019-02-20 02:46:02.0', 'Admin is unavailable.'),
(28, 'Queue Control', 'Admin  Account', '2019-02-20 02:46:52.0', 'Admin is available.'),
(29, 'Queue Control', 'Admin  Account', '2019-02-20 02:46:53.0', 'Admin is unavailable.'),
(30, 'Queue Control', 'Admin  Account', '2019-02-20 02:46:55.0', 'Admin is available.'),
(31, 'Queue Control', 'Admin  Account', '2019-02-20 02:46:56.0', 'Admin is unavailable.'),
(32, 'Queue Control', 'Admin  Account', '2019-02-20 02:47:26.0', 'Admin is available.'),
(33, 'Queue Control', 'Admin  Account', '2019-02-20 02:47:28.0', 'Admin is unavailable.'),
(34, 'Login', 'Wesley C Chong', '2019-02-20 02:50:23.0', 'Logged in successfully.'),
(35, 'Queue Control', 'Admin  Account', '2019-02-20 02:50:31.0', 'Admin is available.'),
(36, 'Queue Control', 'Admin  Account', '2019-02-20 02:52:12.0', 'Admin is unavailable.'),
(37, 'Queue Control', 'Admin  Account', '2019-02-20 02:52:39.0', 'Admin is available.'),
(38, 'Queue Control', 'Admin  Account', '2019-02-20 02:52:46.0', 'Admin is unavailable.'),
(39, 'Queue Control', 'Admin  Account', '2019-02-20 02:52:52.0', 'Admin is available.'),
(40, 'Get Queue Ticket', 'Wesley C Chong', '2019-02-20 02:54:30.0', 'Queue Ticket No.  / '),
(41, 'Get Queue Ticket', 'Wesley C Chong', '2019-02-20 02:55:49.0', 'Queue Ticket No.  / '),
(42, 'Get Queue Ticket', 'Wesley C Chong', '2019-02-20 02:59:35.0', 'Queue Ticket No.  / '),
(43, 'Get Queue Ticket', 'Wesley C Chong', '2019-02-20 02:59:39.0', 'Queue Ticket No.  / '),
(44, 'Get Queue Ticket', 'Wesley C Chong', '2019-02-20 03:00:34.0', 'Queue Ticket No.  / Document Inquiry'),
(45, 'Get Queue Ticket', 'Wesley C Chong', '2019-02-20 03:01:15.0', 'Queue Ticket No. 0001 / '),
(46, 'Get Queue Ticket', 'Wesley C Chong', '2019-02-20 03:01:35.0', 'Queue Ticket No. 0001 / Enrollment Concern'),
(47, 'Queue Control', 'Admin  Account', '2019-02-20 03:01:45.0', 'Queue No. 0001 listed as Done.'),
(48, 'Queue Control', 'Admin  Account', '2019-02-20 03:01:52.0', 'Queue No. 0002 listed as Done.'),
(49, 'Get Queue Ticket', 'Wesley C Chong', '2019-02-20 03:04:39.0', 'Queue Ticket No. 0002 / Document Inquiry'),
(50, 'Get Queue Ticket', 'Wesley C Chong', '2019-02-20 03:06:03.0', 'Queue Ticket No. 0003 / Enrollment Concern'),
(51, 'Queue Control', 'Admin  Account', '2019-02-20 03:06:08.0', 'Queue No. 0003 listed as No-Show.'),
(52, 'Queue Control', 'Admin  Account', '2019-02-20 03:06:12.0', 'Queue No. 0004 listed as No-Show.'),
(53, 'Get Queue Ticket', 'Wesley C Chong', '2019-02-20 03:07:13.0', 'Queue Ticket No. 0004 / Document Inquiry'),
(54, 'Queue Control', 'Admin  Account', '2019-02-20 03:07:17.0', 'Queue No. 0005 listed as Done.'),
(55, 'Get Queue Ticket', 'Wesley C Chong', '2019-02-20 03:07:21.0', 'Queue Ticket No. 0005 / '),
(56, 'Login', 'Admin  Account', '2019-02-20 04:20:58.0', 'Logged in successfully.'),
(57, 'Queue Control', 'Admin  Account', '2019-02-20 04:21:08.0', 'Admin is unavailable.'),
(58, 'Queue Control', 'Admin  Account', '2019-02-20 04:21:12.0', 'Admin is available.'),
(59, 'Queue Control', 'Admin  Account', '2019-02-20 04:21:25.0', 'Admin is unavailable.'),
(60, 'Queue Control', 'Admin  Account', '2019-02-20 04:21:50.0', 'Admin is available.'),
(61, 'Login', 'Ralph Angelo Cruz Vicente', '2019-02-20 04:25:50.0', 'Logged in successfully.'),
(62, 'Queue Control', 'Admin  Account', '2019-02-20 04:26:52.0', 'Admin is unavailable.'),
(63, 'Login', 'Admin  Account', '2019-02-20 04:27:26.0', 'Logged in successfully.'),
(64, 'Add Security Question', 'Admin  Account', '2019-02-20 04:27:43.0', 'Added security question successfully.'),
(65, 'File Upload', 'Admin  Account', '2019-02-20 04:28:02.0', 'Document template uploaded.'),
(66, 'Add Security Question', 'Admin  Account', '2019-02-20 04:30:03.0', 'Added security question successfully.'),
(67, 'File Upload', 'Admin  Account', '2019-02-20 04:30:13.0', 'Document template uploaded.'),
(68, 'Login', 'Ralph Angelo Cruz Vicente', '2019-02-20 04:31:14.0', 'Logged in successfully.'),
(69, 'Queue Control', 'Admin  Account', '2019-02-20 04:32:21.0', 'Closed queue successfully.'),
(70, 'Queue Control', 'Admin  Account', '2019-02-20 04:32:22.0', 'Opened queue successfully.'),
(71, 'Queue Control', 'Admin  Account', '2019-02-20 04:32:24.0', 'Closed queue successfully.'),
(72, 'Login', 'Admin  Account', '2019-02-20 19:37:21.0', 'Logged in successfully.'),
(73, 'Login', 'Admin  Account', '2019-02-21 08:49:43.0', 'Logged in successfully.'),
(74, 'Login', 'Admin  Account', '2019-02-21 08:58:27.0', 'Logged in successfully.'),
(75, 'Login', 'Admin  Account', '2019-02-25 05:17:41.0', 'Logged in successfully.'),
(76, 'Login', 'Admin  Account', '2019-02-25 05:21:09.0', 'Logged in successfully.'),
(77, 'Add Section', 'Admin  Account', '2019-02-25 05:45:25.0', 'Added section successfully.'),
(78, 'Add Section', 'Admin  Account', '2019-02-25 05:52:43.0', 'Added section successfully.'),
(79, 'Add Section', 'Admin  Account', '2019-02-25 05:52:49.0', 'Added section successfully.'),
(80, 'Add Section', 'Admin  Account', '2019-02-25 05:53:04.0', 'Added section successfully.'),
(81, 'Add Section', 'Admin  Account', '2019-02-25 05:53:10.0', 'Added section successfully.'),
(82, 'Add Section', 'Admin  Account', '2019-02-25 05:53:20.0', 'Added section successfully.'),
(83, 'Add Section', 'Admin  Account', '2019-02-25 05:53:36.0', 'Added section successfully.'),
(84, 'Add Section', 'Admin  Account', '2019-02-25 05:53:43.0', 'Added section successfully.'),
(85, 'Add Section', 'Admin  Account', '2019-02-25 05:53:50.0', 'Added section successfully.'),
(86, 'Add Section', 'Admin  Account', '2019-02-25 05:53:55.0', 'Added section successfully.'),
(87, 'Add Section', 'Admin  Account', '2019-02-25 05:54:01.0', 'Added section successfully.'),
(88, 'Add Section', 'Admin  Account', '2019-02-25 05:54:05.0', 'Added section successfully.'),
(89, 'Add Section', 'Admin  Account', '2019-02-25 05:54:17.0', 'Added section successfully.'),
(90, 'Add Section', 'Admin  Account', '2019-02-25 05:54:23.0', 'Added section successfully.'),
(91, 'Add Section', 'Admin  Account', '2019-02-25 05:54:28.0', 'Added section successfully.'),
(92, 'Add Section', 'Admin  Account', '2019-02-25 05:54:32.0', 'Added section successfully.'),
(93, 'Add Section', 'Admin  Account', '2019-02-25 05:54:36.0', 'Added section successfully.'),
(94, 'Add Section', 'Admin  Account', '2019-02-25 05:54:40.0', 'Added section successfully.'),
(95, 'Add Section', 'Admin  Account', '2019-02-25 05:54:58.0', 'Added section successfully.'),
(96, 'Add Section', 'Admin  Account', '2019-02-25 05:55:09.0', 'Added section successfully.'),
(97, 'Add Section', 'Admin  Account', '2019-02-25 06:03:49.0', 'Added section successfully.'),
(98, 'Add Section', 'Admin  Account', '2019-02-25 06:03:54.0', 'Added section successfully.'),
(99, 'Add Section', 'Admin  Account', '2019-02-25 06:04:05.0', 'Added section successfully.'),
(100, 'Add Section', 'Admin  Account', '2019-02-25 06:04:11.0', 'Added section successfully.'),
(101, 'Add Section', 'Admin  Account', '2019-02-25 06:04:17.0', 'Added section successfully.'),
(102, 'Add Section', 'Admin  Account', '2019-02-25 06:04:21.0', 'Added section successfully.'),
(103, 'Login', 'Admin  Account', '2019-02-25 11:07:45.0', 'Logged in successfully.'),
(104, 'Queue Control', 'Admin  Account', '2019-02-25 11:13:20.0', 'Opened queue successfully.'),
(105, 'Queue Control', 'Admin  Account', '2019-02-25 11:13:22.0', 'Closed queue successfully.'),
(106, 'Login', 'Admin  Account', '2019-02-25 11:18:45.0', 'Logged in successfully.'),
(107, 'Login', 'Admin  Account', '2019-02-25 12:49:46.0', 'Logged in successfully.'),
(108, 'Update Schedule Link', 'Admin  Account', '2019-02-25 13:23:00.0', 'Updated schedule link of CS Class Schedule successfully.'),
(109, 'Update Schedule Link', 'Admin  Account', '2019-02-25 13:28:12.0', 'Updated schedule link of CS Class Schedule successfully.'),
(110, 'Login', 'Ralph Angelo Cruz Vicente', '2019-02-25 13:46:38.0', 'Logged in successfully.'),
(111, 'Login', 'Faculty  Account', '2019-02-25 13:47:10.0', 'Logged in successfully.'),
(112, 'Login', 'Admin  Account', '2019-02-25 13:50:25.0', 'Logged in successfully.'),
(113, 'Login', 'Test  Admin', '2019-02-25 14:34:13.0', 'Logged in successfully.'),
(114, 'Login', 'Admin  Account', '2019-02-25 14:34:32.0', 'Logged in successfully.'),
(115, 'Login', 'Admin  Account', '2019-02-26 00:26:48.0', 'Logged in successfully.'),
(116, 'Login', 'Admin  Account', '2019-02-26 00:30:57.0', 'Logged in successfully.'),
(117, 'Login', 'Ralph Angelo Cruz Vicente', '2019-02-26 00:35:11.0', 'Logged in successfully.'),
(118, 'Update Schedule Link', 'Admin  Account', '2019-02-26 00:36:07.0', 'Updated schedule link of IS Room Schedule successfully.'),
(119, 'Queue Control', 'Admin  Account', '2019-02-26 00:49:08.0', 'Opened queue successfully.'),
(120, 'Queue Control', 'Admin  Account', '2019-02-26 00:49:10.0', 'Closed queue successfully.'),
(121, 'Queue Control', 'Admin  Account', '2019-02-26 01:04:21.0', 'Opened queue successfully.'),
(122, 'Queue Control', 'Admin  Account', '2019-02-26 01:04:25.0', 'Closed queue successfully.'),
(123, 'Login', 'Ralph Angelo Cruz Vicente', '2019-02-26 01:10:47.0', 'Logged in successfully.'),
(124, 'Login', 'Faculty  Account', '2019-02-26 01:13:33.0', 'Logged in successfully.'),
(125, 'Login', 'Admin  Account', '2019-02-26 01:14:42.0', 'Logged in successfully.'),
(126, 'Login', 'Ralph Angelo Cruz Vicente', '2019-02-26 01:18:11.0', 'Logged in successfully.'),
(127, 'Login', 'Admin  Account', '2019-02-26 01:22:02.0', 'Logged in successfully.'),
(128, 'Queue Control', 'Admin  Account', '2019-02-26 01:22:04.0', 'Opened queue successfully.'),
(129, 'Queue Control', 'Admin  Account', '2019-02-26 01:22:10.0', 'Closed queue successfully.'),
(130, 'Queue Control', 'Admin  Account', '2019-02-26 01:29:47.0', 'Opened queue successfully.'),
(131, 'Queue Control', 'Admin  Account', '2019-02-26 01:39:52.0', 'Closed queue successfully.'),
(132, 'Queue Control', 'Admin  Account', '2019-02-26 01:41:07.0', 'Opened queue successfully.'),
(133, 'Queue Control', 'Admin  Account', '2019-02-26 02:52:07.0', 'Closed queue successfully.'),
(134, 'Login', 'Admin  Account', '2019-02-26 02:52:11.0', 'Logged in successfully.'),
(135, 'Queue Control', 'Admin  Account', '2019-02-26 02:53:17.0', 'Opened queue successfully.'),
(136, 'Queue Control', 'Admin  Account', '2019-02-26 03:18:24.0', 'Closed queue successfully.'),
(137, 'Login', 'Admin  Account', '2019-02-26 03:42:18.0', 'Logged in successfully.'),
(138, 'Add Section', 'Admin  Account', '2019-02-26 03:42:37.0', 'Added section successfully.'),
(139, 'Login', 'Faculty  Account', '2019-02-26 03:43:37.0', 'Logged in successfully.'),
(140, 'Login', 'Sean Puzon Sasot', '2019-02-26 03:45:33.0', 'Logged in successfully.'),
(141, 'Login', 'Admin  Account', '2019-02-26 03:59:38.0', 'Logged in successfully.'),
(142, 'Login', 'Sean Puzon Sasot', '2019-02-26 04:01:25.0', 'Logged in successfully.'),
(143, 'File Upload', 'Admin  Account', '2019-02-26 04:02:16.0', 'Document template uploaded.'),
(144, 'Login', 'Ralph Angelo Cruz Vicente', '2019-02-26 04:02:43.0', 'Logged in successfully.'),
(145, 'Login', 'Admin  Account', '2019-02-26 04:04:04.0', 'Logged in successfully.'),
(146, 'File Upload', 'Admin  Account', '2019-02-26 04:04:41.0', 'Document template uploaded.'),
(147, 'File Upload', 'Admin  Account', '2019-02-26 04:08:41.0', 'Document template uploaded.'),
(148, 'File Upload', 'Admin  Account', '2019-02-26 04:09:43.0', 'Document template uploaded.'),
(149, 'File Upload', 'Admin  Account', '2019-02-26 04:12:16.0', 'Document template uploaded.'),
(150, 'File Upload', 'Admin  Account', '2019-02-26 04:13:18.0', 'Document template uploaded.'),
(151, 'File Delete', 'Admin  Account', '2019-02-26 04:14:09.0', 'Document template deleted.'),
(152, 'File Upload', 'Admin  Account', '2019-02-26 04:14:29.0', 'Document template uploaded.'),
(153, 'File Delete', 'Admin  Account', '2019-02-26 04:15:00.0', 'Document template deleted.'),
(154, 'Login', 'Admin  Account', '2019-02-26 05:28:46.0', 'Logged in successfully.'),
(155, 'Add Section', 'Admin  Account', '2019-02-26 05:29:07.0', 'Added section successfully.'),
(156, 'Login', 'Ralph Angelo Cruz Vicente', '2019-02-26 05:29:16.0', 'Logged in successfully.'),
(157, 'Login', 'Admin  Account', '2019-02-26 05:36:45.0', 'Logged in successfully.'),
(158, 'Add Section', 'Admin  Account', '2019-02-26 05:37:27.0', 'Added section successfully.'),
(159, 'Add Section', 'Admin  Account', '2019-02-26 05:37:34.0', 'Added section successfully.'),
(160, 'Add Section', 'Admin  Account', '2019-02-26 05:37:40.0', 'Added section successfully.'),
(161, 'Add Section', 'Admin  Account', '2019-02-26 05:37:45.0', 'Added section successfully.'),
(162, 'Add Section', 'Admin  Account', '2019-02-26 05:37:50.0', 'Added section successfully.'),
(163, 'Add Section', 'Admin  Account', '2019-02-26 05:38:04.0', 'Added section successfully.'),
(164, 'Add Section', 'Admin  Account', '2019-02-26 05:38:11.0', 'Added section successfully.'),
(165, 'Add Section', 'Admin  Account', '2019-02-26 05:38:17.0', 'Added section successfully.'),
(166, 'Add Section', 'Admin  Account', '2019-02-26 05:38:37.0', 'Added section successfully.'),
(167, 'Add Section', 'Admin  Account', '2019-02-26 05:38:42.0', 'Added section successfully.'),
(168, 'Add Section', 'Admin  Account', '2019-02-26 05:38:49.0', 'Added section successfully.'),
(169, 'Add Section', 'Admin  Account', '2019-02-26 05:38:57.0', 'Added section successfully.'),
(170, 'Add Section', 'Admin  Account', '2019-02-26 05:39:03.0', 'Added section successfully.'),
(171, 'Add Section', 'Admin  Account', '2019-02-26 05:39:18.0', 'Added section successfully.'),
(172, 'Add Section', 'Admin  Account', '2019-02-26 05:39:23.0', 'Added section successfully.'),
(173, 'Add Section', 'Admin  Account', '2019-02-26 05:39:28.0', 'Added section successfully.'),
(174, 'Add Section', 'Admin  Account', '2019-02-26 05:39:37.0', 'Added section successfully.'),
(175, 'Add Section', 'Admin  Account', '2019-02-26 05:39:44.0', 'Added section successfully.'),
(176, 'Add Section', 'Admin  Account', '2019-02-26 05:39:59.0', 'Added section successfully.'),
(177, 'Add Section', 'Admin  Account', '2019-02-26 05:40:05.0', 'Added section successfully.'),
(178, 'Login', 'Admin  Account', '2019-02-26 07:18:31.0', 'Logged in successfully.'),
(179, 'Update Schedule Link', 'Admin  Account', '2019-02-26 07:19:04.0', 'Updated schedule link of IS Room Schedule successfully.'),
(180, 'Update Schedule Link', 'Admin  Account', '2019-02-26 07:19:32.0', 'Updated schedule link of CS Room Schedule successfully.'),
(181, 'Update Schedule Link', 'Admin  Account', '2019-02-26 07:19:57.0', 'Updated schedule link of IS Faculty Schedule successfully.'),
(182, 'Update Schedule Link', 'Admin  Account', '2019-02-26 07:20:14.0', 'Updated schedule link of CS Faculty Schedule successfully.'),
(183, 'Update Schedule Link', 'Admin  Account', '2019-02-26 07:20:28.0', 'Updated schedule link of CS Class Schedule successfully.'),
(184, 'Add Section', 'Admin  Account', '2019-02-26 07:21:05.0', 'Added section successfully.'),
(185, 'Add Section', 'Admin  Account', '2019-02-26 07:21:15.0', 'Added section successfully.'),
(186, 'Add Section', 'Admin  Account', '2019-02-26 07:21:24.0', 'Added section successfully.'),
(187, 'Add Section', 'Admin  Account', '2019-02-26 07:21:38.0', 'Added section successfully.'),
(188, 'Add Section', 'Admin  Account', '2019-02-26 07:21:52.0', 'Added section successfully.'),
(189, 'Add Section', 'Admin  Account', '2019-02-26 07:22:01.0', 'Added section successfully.'),
(190, 'Add Section', 'Admin  Account', '2019-02-26 07:22:07.0', 'Added section successfully.'),
(191, 'Add Section', 'Admin  Account', '2019-02-26 07:22:20.0', 'Added section successfully.'),
(192, 'Add Section', 'Admin  Account', '2019-02-26 07:22:26.0', 'Added section successfully.'),
(193, 'Add Section', 'Admin  Account', '2019-02-26 07:22:39.0', 'Added section successfully.'),
(194, 'Add Section', 'Admin  Account', '2019-02-26 07:22:46.0', 'Added section successfully.'),
(195, 'Add Section', 'Admin  Account', '2019-02-26 07:22:52.0', 'Added section successfully.'),
(196, 'Add Section', 'Admin  Account', '2019-02-26 07:23:03.0', 'Added section successfully.'),
(197, 'Add Section', 'Admin  Account', '2019-02-26 07:23:10.0', 'Added section successfully.'),
(198, 'Add Section', 'Admin  Account', '2019-02-26 07:23:15.0', 'Added section successfully.'),
(199, 'Add Section', 'Admin  Account', '2019-02-26 07:23:25.0', 'Added section successfully.'),
(200, 'Login', 'Ralph Angelo Cruz Vicente', '2019-02-26 07:24:31.0', 'Logged in successfully.'),
(201, 'Login', 'Admin  Account', '2019-02-26 07:24:44.0', 'Logged in successfully.'),
(202, 'Queue Control', 'Admin  Account', '2019-02-26 07:24:47.0', 'Opened queue successfully.'),
(203, 'Queue Control', 'Admin  Account', '2019-02-26 07:24:52.0', 'Closed queue successfully.'),
(204, 'Login', 'Ralph Angelo Cruz Vicente', '2019-02-26 07:37:00.0', 'Logged in successfully.'),
(205, 'Login', 'Admin  Account', '2019-02-27 04:51:45.0', 'Logged in successfully.'),
(206, 'Add Section', 'Admin  Account', '2019-02-27 05:02:57.0', 'Added section successfully.'),
(207, 'Login', 'Admin  Account', '2019-03-02 17:50:23.0', 'Logged in successfully.'),
(208, 'Login', 'Admin  Account', '2019-03-02 18:20:43.0', 'Logged in successfully.'),
(209, 'Queue Control', 'Admin  Account', '2019-03-02 18:33:37.0', 'Opened queue successfully.'),
(210, 'Login', 'Ralph Angelo Cruz Vicente', '2019-03-02 18:38:53.0', 'Logged in successfully.'),
(211, 'Get Queue Ticket', 'Ralph Angelo Cruz Vicente', '2019-03-02 18:38:58.0', 'Queue Ticket No.  / Document Inquiry'),
(212, 'Queue Control', 'Admin  Account', '2019-03-02 18:39:04.0', 'Queue No. 0006 listed as Done.'),
(213, 'Get Queue Ticket', 'Ralph Angelo Cruz Vicente', '2019-03-02 18:48:37.0', 'Queue Ticket No. 0006 / Meeting with Admin'),
(214, 'Queue Control', 'Admin  Account', '2019-03-02 18:48:48.0', 'Queue No. 0007 listed as Done.'),
(215, 'Get Queue Ticket', 'Ralph Angelo Cruz Vicente', '2019-03-02 18:56:03.0', 'Queue Ticket No. 0007 / Other'),
(216, 'Queue Control', 'Admin  Account', '2019-03-02 18:59:28.0', 'Queue No. 0008 listed as Done.'),
(217, 'Get Queue Ticket', 'Ralph Angelo Cruz Vicente', '2019-03-02 18:59:33.0', 'Queue Ticket No. 0008 / Document Inquiry'),
(218, 'Queue Control', 'Admin  Account', '2019-03-02 18:59:37.0', 'Queue No. 0009 listed as Done.'),
(219, 'Get Queue Ticket', 'Ralph Angelo Cruz Vicente', '2019-03-02 19:00:16.0', 'Queue Ticket No. 0009 / Document Submission'),
(220, 'Queue Control', 'Admin  Account', '2019-03-02 19:00:28.0', 'Queue No. 0010 listed as No-Show.'),
(221, 'Get Queue Ticket', 'Ralph Angelo Cruz Vicente', '2019-03-02 19:02:14.0', 'Queue Ticket No. 0010 / Document Submission'),
(222, 'Queue Control', 'Admin  Account', '2019-03-02 19:02:21.0', 'Queue No. 0011 listed as Done.'),
(223, 'Update Document Status', 'Admin  Account', '2019-03-02 19:02:30.0', 'Document No. 0001 changed status to Received by Office'),
(224, 'Get Queue Ticket', 'Ralph Angelo Cruz Vicente', '2019-03-02 19:11:56.0', 'Queue Ticket No. 0011 / Document Submission'),
(225, 'Queue Control', 'Admin  Account', '2019-03-02 19:12:07.0', 'Queue No. 0012 listed as Done.'),
(226, 'Update Document Status', 'Admin  Account', '2019-03-02 19:12:12.0', 'Document No. 0002 changed status to Not Received'),
(227, 'Login', 'Admin  Account', '2019-03-03 14:34:21.0', 'Logged in successfully.'),
(228, 'Post Announcement', 'Admin  Account', '2019-03-03 15:53:46.0', 'Announcement posted successfully.'),
(229, 'Post Announcement', 'Admin  Account', '2019-03-03 15:56:16.0', 'Announcement posted successfully.'),
(230, 'Post Announcement', 'Admin  Account', '2019-03-03 15:57:02.0', 'Announcement posted successfully.'),
(231, 'Post Announcement', 'Admin  Account', '2019-03-03 15:59:03.0', 'Announcement posted successfully.'),
(232, 'Login', 'Ralph Angelo Cruz Vicente', '2019-03-03 15:59:38.0', 'Logged in successfully.'),
(233, 'Login', 'Admin  Account', '2019-03-03 16:03:54.0', 'Logged in successfully.'),
(234, 'Login', 'Ralph Angelo Cruz Vicente', '2019-03-03 16:04:06.0', 'Logged in successfully.'),
(235, 'Get Queue Ticket', 'Ralph Angelo Cruz Vicente', '2019-03-03 16:08:43.0', 'Queue Ticket No.  / Document Inquiry'),
(236, 'Login', 'Admin  Account', '2019-03-03 16:09:55.0', 'Logged in successfully.'),
(237, 'Queue Control', 'Admin  Account', '2019-03-03 16:10:02.0', 'Queue No. 0001 listed as Done.'),
(238, 'Get Queue Ticket', 'Ralph Angelo Cruz Vicente', '2019-03-03 16:10:12.0', 'Queue Ticket No. 0001 / Other'),
(239, 'Queue Control', 'Admin  Account', '2019-03-03 16:11:42.0', 'Queue No. 0002 listed as Done.'),
(240, 'Get Queue Ticket', 'Ralph Angelo Cruz Vicente', '2019-03-03 16:12:54.0', 'Queue Ticket No. 0002 / Document Inquiry'),
(241, 'Queue Control', 'Admin  Account', '2019-03-03 16:17:58.0', 'Queue No. 0003 listed as Done.'),
(242, 'Login', 'Faculty  Account', '2019-03-03 16:18:12.0', 'Logged in successfully.'),
(243, 'Login', 'Admin  Account', '2019-03-03 16:23:24.0', 'Logged in successfully.'),
(244, 'Get Queue Ticket', 'Ralph Angelo Cruz Vicente', '2019-03-03 16:23:31.0', 'Queue Ticket No. 4 / Document Inquiry'),
(245, 'Queue Control', 'Admin  Account', '2019-03-03 16:27:36.0', 'Queue No. 0004 listed as Done.'),
(246, 'File Upload', 'Admin  Account', '2019-03-03 16:31:44.0', 'Document template uploaded.'),
(247, 'File Delete', 'Admin  Account', '2019-03-03 16:36:08.0', 'Document template deleted.'),
(248, 'File Upload', 'Admin  Account', '2019-03-03 16:36:19.0', 'Document template uploaded.'),
(249, 'Update Schedule Link', 'Admin  Account', '2019-03-03 16:38:28.0', 'Updated schedule link of CS Class Schedule successfully.'),
(250, 'Update Schedule Link', 'Admin  Account', '2019-03-03 16:38:50.0', 'Updated schedule link of CS Class Schedule successfully.'),
(251, 'Consultation Request', 'Ralph Angelo Cruz Vicente', '2019-03-03 16:45:29.0', 'Consultation Request (Test Consultation) sent to 4.'),
(252, 'Consultation Request', 'Ralph Angelo Cruz Vicente', '2019-03-03 16:46:39.0', 'Consultation Request (Consultation 2) sent.'),
(253, 'Login', 'Faculty  Account', '2019-03-03 16:46:54.0', 'Logged in successfully.'),
(254, 'Login', 'Ralph Angelo Cruz Vicente', '2019-03-03 16:47:23.0', 'Logged in successfully.'),
(255, 'Consultation Request', 'Ralph Angelo Cruz Vicente', '2019-03-03 16:47:34.0', 'Consultation Request (Test Consultation) sent.'),
(256, 'Login', 'Faculty  Account', '2019-03-03 16:47:41.0', 'Logged in successfully.'),
(257, 'Login', 'Ralph Angelo Cruz Vicente', '2019-03-03 16:48:16.0', 'Logged in successfully.'),
(258, 'Consultation Request', 'Ralph Angelo Cruz Vicente', '2019-03-03 16:48:26.0', 'Consultation Request (Need help with my grades) sent.'),
(259, 'Login', 'Faculty  Account', '2019-03-03 16:48:36.0', 'Logged in successfully.'),
(260, 'Login', 'Admin  Account', '2019-03-03 16:53:49.0', 'Logged in successfully.'),
(261, 'Delete Announcement', 'Admin  Account', '2019-03-03 16:53:55.0', 'Announcement deleted successfully.'),
(262, 'Delete Announcement', 'Admin  Account', '2019-03-03 16:54:00.0', 'Announcement deleted successfully.'),
(263, 'Delete Announcement', 'Admin  Account', '2019-03-03 16:54:04.0', 'Announcement deleted successfully.'),
(264, 'Delete Announcement', 'Admin  Account', '2019-03-03 16:54:08.0', 'Announcement deleted successfully.'),
(265, 'File Delete', 'Admin  Account', '2019-03-03 16:55:20.0', 'Document template deleted.'),
(266, 'Login', 'Admin  Account', '2019-03-03 17:07:27.0', 'Logged in successfully.'),
(267, 'Queue Control', 'Admin  Account', '2019-03-03 17:09:01.0', 'Closed queue successfully.'),
(268, 'Login', 'Admin  Account', '2019-03-04 04:18:20.0', 'Logged in successfully.'),
(269, 'Login', 'Ralph Angelo Cruz Vicente', '2019-03-04 04:28:22.0', 'Logged in successfully.'),
(270, 'Queue Control', 'Admin  Account', '2019-03-04 04:28:30.0', 'Opened queue successfully.'),
(271, 'Get Queue Ticket', 'Ralph Angelo Cruz Vicente', '2019-03-04 04:28:35.0', 'Queue Ticket No. 1 / Document Inquiry'),
(272, 'Login', 'Faculty  Account', '2019-03-04 04:39:23.0', 'Logged in successfully.'),
(273, 'Login', 'Ralph Angelo Cruz Vicente', '2019-03-04 04:41:02.0', 'Logged in successfully.'),
(274, 'Login', 'Admin  Account', '2019-03-04 04:44:22.0', 'Logged in successfully.'),
(275, 'Login', 'Admin  Account', '2019-03-04 05:00:11.0', 'Logged in successfully.'),
(276, 'Queue Control', 'Admin  Account', '2019-03-04 05:00:16.0', 'Queue No. 0001 listed as Done.'),
(277, 'Login', 'Faculty  Account', '2019-03-04 13:21:47.0', 'Logged in successfully.'),
(278, 'Login', 'Ralph Angelo Cruz Vicente', '2019-03-04 13:48:42.0', 'Logged in successfully.'),
(279, 'Consultation Request', 'Ralph Angelo Cruz Vicente', '2019-03-04 13:52:19.0', 'Consultation Request (123) sent.'),
(280, 'Login', 'Admin  Account', '2019-03-04 14:15:47.0', 'Logged in successfully.'),
(281, 'Update Consultation Request Status', 'Faculty  Account', '2019-03-04 14:40:05.0', 'Consultation Request No. 0001 changed status to Accepted.'),
(282, 'Update Consultation Request Status', 'Faculty  Account', '2019-03-04 14:41:33.0', 'Consultation Request No. 0001 changed status to Declined.'),
(283, 'Update Consultation Request Status', 'Faculty  Account', '2019-03-04 14:43:31.0', 'Consultation Request No. 0001 changed status to Declined.'),
(284, 'Update Consultation Request Status', 'Faculty  Account', '2019-03-04 14:46:31.0', 'Consultation Request No. 0001 changed status to Declined.'),
(285, 'Update Consultation Request Status', 'Faculty  Account', '2019-03-04 14:46:53.0', 'Consultation Request No. 0001 changed status to Declined.'),
(286, 'Update Consultation Request Status', 'Faculty  Account', '2019-03-04 14:47:23.0', 'Consultation Request No. 0001 changed status to Declined.'),
(287, 'Update Consultation Request Status', 'Faculty  Account', '2019-03-04 14:47:27.0', 'Consultation Request No. 0001 changed status to Declined.'),
(288, 'Update Consultation Request Status', 'Faculty  Account', '2019-03-04 14:47:35.0', 'Consultation Request No. 0001 changed status to Declined.'),
(289, 'Update Consultation Request Status', 'Faculty  Account', '2019-03-04 14:47:47.0', 'Consultation Request No. 0001 changed status to Declined.'),
(290, 'Update Consultation Request Status', 'Faculty  Account', '2019-03-04 14:48:10.0', 'Consultation Request No. 0001 changed status to Accepted.'),
(291, 'Update Consultation Request Status', 'Faculty  Account', '2019-03-04 14:52:48.0', 'Consultation Request No. 0001 changed status to Accepted.'),
(292, 'Update Consultation Request Status', 'Faculty  Account', '2019-03-04 14:52:57.0', 'Consultation Request No. 0001 changed status to Accepted.'),
(293, 'Update Consultation Request Status', 'Faculty  Account', '2019-03-04 14:53:02.0', 'Consultation Request No. 0001 changed status to Declined.'),
(294, 'Update Consultation Request Status', 'Faculty  Account', '2019-03-04 14:57:15.0', 'Consultation Request No. 0001 changed status to Declined.'),
(295, 'Update Consultation Request Status', 'Faculty  Account', '2019-03-04 14:58:07.0', 'Consultation Request No. 0001 changed status to Accepted.'),
(296, 'Update Consultation Request Status', 'Faculty  Account', '2019-03-04 15:03:59.0', 'Consultation Request No. 0001 changed status to Accepted.'),
(297, 'Update Consultation Request Status', 'Faculty  Account', '2019-03-04 15:05:34.0', 'Consultation Request No. 0001 changed status to Accepted.'),
(298, 'Update Consultation Request Status', 'Faculty  Account', '2019-03-04 15:06:28.0', 'Consultation Request No. 0001 changed status to Accepted.'),
(299, 'Update Consultation Request Status', 'Faculty  Account', '2019-03-04 15:09:48.0', 'Consultation Request No. 0001 changed status to Accepted.'),
(300, 'Update Consultation Request Status', 'Faculty  Account', '2019-03-04 15:10:52.0', 'Consultation Request No. 0001 changed status to Declined.'),
(301, 'Update Consultation Request Status', 'Faculty  Account', '2019-03-04 15:11:38.0', 'Consultation Request No. 0001 changed status to Accepted.'),
(302, 'Update Consultation Request Status', 'Faculty  Account', '2019-03-04 15:12:27.0', 'Consultation Request No. 0001 changed status to Accepted.'),
(303, 'Update Consultation Request Status', 'Faculty  Account', '2019-03-04 15:13:35.0', 'Consultation Request No. 0001 changed status to Accepted.'),
(304, 'Update Consultation Request Status', 'Faculty  Account', '2019-03-04 15:17:14.0', 'Consultation Request No. 0001 changed status to Declined.'),
(305, 'Update Consultation Request Status', 'Faculty  Account', '2019-03-04 15:19:07.0', 'Consultation Request No. 0001 changed status to Declined.'),
(306, 'Update Consultation Request Status', 'Faculty  Account', '2019-03-04 15:20:04.0', 'Consultation Request No. 0001 changed status to Accepted.'),
(307, 'Login', 'Admin  Account', '2019-03-04 15:58:51.0', 'Logged in successfully.'),
(308, 'Post Announcement', 'Admin  Account', '2019-03-04 15:58:59.0', 'Announcement posted successfully.'),
(309, 'Login', 'Ralph Angelo Cruz Vicente', '2019-03-04 16:00:51.0', 'Logged in successfully.'),
(310, 'Get Queue Ticket', 'Ralph Angelo Cruz Vicente', '2019-03-04 16:01:00.0', 'Queue Ticket No. 1 / Document Inquiry'),
(311, 'Update Schedule Link', 'Admin  Account', '2019-03-04 16:06:42.0', 'Updated schedule link of IS Faculty Schedule successfully.'),
(312, 'Login', 'Faculty  Account', '2019-03-04 16:16:35.0', 'Logged in successfully.'),
(313, 'Login', 'Ralph Angelo Cruz Vicente', '2019-03-04 16:20:06.0', 'Logged in successfully.'),
(314, 'Login', 'Admin  Account', '2019-03-04 16:20:32.0', 'Logged in successfully.'),
(315, 'Queue Control', 'Admin  Account', '2019-03-04 16:20:38.0', 'Queue No. 0001 listed as Done.'),
(316, 'File Upload', 'Admin  Account', '2019-03-04 16:22:14.0', 'Document template uploaded.'),
(317, 'Login', 'Ralph Angelo Cruz Vicente', '2019-03-04 16:38:40.0', 'Logged in successfully.'),
(318, 'Login', 'Ralph Angelo Cruz Vicente', '2019-03-04 17:00:58.0', 'Logged in successfully.'),
(319, 'Consultation Request', 'Ralph Angelo Cruz Vicente', '2019-03-04 17:01:20.0', 'Consultation Request (This is a test) sent.'),
(320, 'Login', 'Faculty  Account', '2019-03-04 17:01:29.0', 'Logged in successfully.'),
(321, 'Login', 'Faculty  Account', '2019-03-04 18:15:28.0', 'Logged in successfully.'),
(322, 'Login', 'Admin  Account', '2019-03-04 19:22:01.0', 'Logged in successfully.'),
(323, 'Login', 'Ralph Angelo Cruz Vicente', '2019-03-04 19:28:04.0', 'Logged in successfully.'),
(324, 'Get Queue Ticket', 'Ralph Angelo Cruz Vicente', '2019-03-04 19:28:13.0', 'Queue Ticket No. 2 / Document Submission'),
(325, 'Queue Control', 'Admin  Account', '2019-03-04 19:28:19.0', 'Queue No. 0002 listed as Done.'),
(326, 'Get Queue Ticket', 'Ralph Angelo Cruz Vicente', '2019-03-04 19:31:11.0', 'Queue Ticket No. 3 / Document Submission'),
(327, 'Queue Control', 'Admin  Account', '2019-03-04 19:31:20.0', 'Queue No. 0003 listed as Done.'),
(328, 'Update Document Status', 'Admin  Account', '2019-03-04 19:32:59.0', 'Document No. 0003 changed status to Received by Office'),
(329, 'Update Document Status', 'Admin  Account', '2019-03-04 19:35:41.0', 'Document No. 0004 changed status to Received by Office'),
(330, 'Get Queue Ticket', 'Ralph Angelo Cruz Vicente', '2019-03-04 19:37:39.0', 'Queue Ticket No. 4 / Document Submission'),
(331, 'Queue Control', 'Admin  Account', '2019-03-04 19:37:51.0', 'Queue No. 0004 listed as Done.'),
(332, 'Update Document Status', 'Admin  Account', '2019-03-04 19:38:42.0', 'Document No. 0005 changed status to Received by Office'),
(333, 'Get Queue Ticket', 'Ralph Angelo Cruz Vicente', '2019-03-04 19:40:09.0', 'Queue Ticket No. 5 / Document Submission'),
(334, 'Queue Control', 'Admin  Account', '2019-03-04 19:40:14.0', 'Queue No. 0005 listed as Done.'),
(335, 'Update Document Status', 'Admin  Account', '2019-03-04 19:40:19.0', 'Document No. 0001 changed status to Received by Office'),
(336, 'Update Document Status', 'Admin  Account', '2019-03-04 19:40:34.0', 'Document No. 0001 changed status to On-Process'),
(337, 'Login', 'Ralph Angelo Cruz Vicente', '2019-03-04 19:40:45.0', 'Logged in successfully.'),
(338, 'Login', 'Admin  Account', '2019-03-04 19:42:46.0', 'Logged in successfully.'),
(339, 'Login', 'Faculty  Account', '2019-03-04 20:08:17.0', 'Logged in successfully.'),
(340, 'Login', 'Ralph Angelo Cruz Vicente', '2019-03-04 20:08:27.0', 'Logged in successfully.'),
(341, 'Login', 'Admin  Account', '2019-03-05 05:13:39.0', 'Logged in successfully.'),
(342, 'Login', 'Ralph Angelo Cruz Vicente', '2019-03-05 05:14:30.0', 'Logged in successfully.'),
(343, 'Get Queue Ticket', 'Ralph Angelo Cruz Vicente', '2019-03-05 05:15:22.0', 'Queue Ticket No. 1 / Document Submission'),
(344, 'Queue Control', 'Admin  Account', '2019-03-05 05:16:03.0', 'Queue No. 0001 listed as Done.'),
(345, 'Update Document Status', 'Admin  Account', '2019-03-05 05:16:47.0', 'Document No. 0002 changed status to Received by Office'),
(346, 'Queue Control', 'Admin  Account', '2019-03-05 05:17:38.0', 'Admin is available.'),
(347, 'Login', 'Ralph Angelo Cruz Vicente', '2019-03-05 05:33:01.0', 'Logged in successfully.'),
(348, 'Consultation Request', 'Ralph Angelo Cruz Vicente', '2019-03-05 05:34:49.0', 'Consultation Request (Consultation) sent.'),
(349, 'Login', 'Faculty  Account', '2019-03-05 05:35:10.0', 'Logged in successfully.'),
(350, 'Update Consultation Request Status', 'Faculty  Account', '2019-03-05 05:38:26.0', 'Consultation Request No. 0002 changed status to Accepted.'),
(351, 'Login', 'Admin  Account', '2019-03-05 05:41:10.0', 'Logged in successfully.'),
(352, 'Login', 'Faculty  Account', '2019-03-05 06:23:52.0', 'Logged in successfully.'),
(353, 'Login', 'Faculty  Account', '2019-03-05 06:26:46.0', 'Logged in successfully.'),
(354, 'Update Consultation Request Status', 'Faculty  Account', '2019-03-05 06:28:51.0', 'Consultation Request No. 0003 changed status to Accepted.'),
(355, 'Login', 'Ralph Angelo Cruz Vicente', '2019-03-05 06:32:16.0', 'Logged in successfully.'),
(356, 'Consultation Request', 'Ralph Angelo Cruz Vicente', '2019-03-05 06:32:30.0', 'Consultation Request (Testing) sent.'),
(357, 'Login', 'Faculty  Account', '2019-03-05 06:55:24.0', 'Logged in successfully.'),
(358, 'Login', 'Faculty  Account', '2019-03-05 07:04:59.0', 'Logged in successfully.'),
(359, 'Login', 'Ralph Angelo Cruz Vicente', '2019-03-05 07:15:07.0', 'Logged in successfully.'),
(360, 'Consultation Request', 'Ralph Angelo Cruz Vicente', '2019-03-05 07:15:18.0', 'Consultation Request (123) sent.'),
(361, 'Login', 'Admin  Account', '2019-03-05 07:31:12.0', 'Logged in successfully.'),
(362, 'Login', 'Ralph Angelo Cruz Vicente', '2019-03-05 07:31:22.0', 'Logged in successfully.'),
(363, 'Login', 'Faculty  Account', '2019-03-05 07:31:30.0', 'Logged in successfully.'),
(364, 'Update Consultation Request Status', 'Faculty  Account', '2019-03-05 07:44:57.0', 'Consultation Request No. 0001 changed status to Accepted.'),
(365, 'Consultation Request', 'Ralph Angelo Cruz Vicente', '2019-03-05 07:45:16.0', 'Consultation Request (Test) sent.'),
(366, 'Update Consultation Request Status', 'Faculty  Account', '2019-03-05 07:57:29.0', 'Consultation Request No. 0002 changed status to Accepted.'),
(367, 'Consultation Request', 'Ralph Angelo Cruz Vicente', '2019-03-05 07:58:43.0', 'Consultation Request (Testing) sent.'),
(368, 'Login', 'Faculty  Account', '2019-03-05 08:05:38.0', 'Logged in successfully.'),
(369, 'Login', 'Faculty  Account', '2019-03-05 08:13:46.0', 'Logged in successfully.'),
(370, 'Login', 'Ralph Angelo Cruz Vicente', '2019-03-05 08:14:39.0', 'Logged in successfully.'),
(371, 'Consultation Request', 'Ralph Angelo Cruz Vicente', '2019-03-05 08:14:49.0', 'Consultation Request (Test 1) sent.'),
(372, 'Update Consultation Request Status', 'Faculty  Account', '2019-03-05 08:17:04.0', 'Consultation Request No. 0001 changed status to Declined.'),
(373, 'Consultation Request', 'Ralph Angelo Cruz Vicente', '2019-03-05 08:17:15.0', 'Consultation Request (Test 2) sent.'),
(374, 'Login', 'Admin  Account', '2019-03-05 08:41:21.0', 'Logged in successfully.'),
(375, 'Login', 'Faculty  Account', '2019-03-06 04:02:19.0', 'Logged in successfully.'),
(376, 'Login', 'Ralph Angelo Cruz Vicente', '2019-03-06 04:03:28.0', 'Logged in successfully.'),
(377, 'Login', 'Faculty  Account', '2019-03-06 04:04:52.0', 'Logged in successfully.'),
(378, 'Login', 'Ralph Angelo Cruz Vicente', '2019-03-06 04:05:42.0', 'Logged in successfully.'),
(379, 'Login', 'Faculty  Account', '2019-03-06 04:09:23.0', 'Logged in successfully.'),
(380, 'Login', 'Admin  Account', '2019-03-06 15:09:56.0', 'Logged in successfully.'),
(381, 'Login', 'Admin  Account', '2019-03-06 16:04:13.0', 'Logged in successfully.'),
(382, 'Post Announcement', 'Admin  Account', '2019-03-06 16:11:15.0', 'Announcement posted successfully.'),
(383, 'Post Announcement', 'Admin  Account', '2019-03-06 16:13:46.0', 'Announcement posted successfully.'),
(384, 'Post Announcement', 'Admin  Account', '2019-03-06 16:17:10.0', 'Announcement posted successfully.'),
(385, 'Post Announcement', 'Admin  Account', '2019-03-06 16:19:37.0', 'Announcement posted successfully.'),
(386, 'Post Announcement', 'Admin  Account', '2019-03-06 16:22:28.0', 'Announcement posted successfully.'),
(387, 'Post Announcement', 'Admin  Account', '2019-03-06 16:24:53.0', 'Announcement posted successfully.'),
(388, 'Post Announcement', 'Admin  Account', '2019-03-06 16:30:04.0', 'Announcement posted successfully.'),
(389, 'Post Announcement', 'Admin  Account', '2019-03-06 16:42:12.0', 'Announcement posted successfully.'),
(390, 'Post Announcement', 'Admin  Account', '2019-03-06 16:45:55.0', 'Announcement posted successfully.'),
(391, 'Post Announcement', 'Admin  Account', '2019-03-06 16:48:14.0', 'Announcement posted successfully.'),
(392, 'Post Announcement', 'Admin  Account', '2019-03-06 16:49:16.0', 'Announcement posted successfully.'),
(393, 'Post Announcement', 'Admin  Account', '2019-03-06 16:50:40.0', 'Announcement posted successfully.'),
(394, 'Post Announcement', 'Admin  Account', '2019-03-06 16:51:04.0', 'Announcement posted successfully.'),
(395, 'Post Announcement', 'Admin  Account', '2019-03-06 16:54:51.0', 'Announcement posted successfully.'),
(396, 'Login', 'Admin  Account', '2019-03-06 16:55:32.0', 'Logged in successfully.'),
(397, 'Post Announcement', 'Admin  Account', '2019-03-06 16:55:39.0', 'Announcement posted successfully.'),
(398, 'File Upload', 'Admin  Account', '2019-03-06 16:56:03.0', 'Document template uploaded.'),
(399, 'Login', 'Admin  Account', '2019-03-07 04:24:29.0', 'Logged in successfully.'),
(400, 'Post Announcement', 'Admin  Account', '2019-03-07 04:24:35.0', 'Announcement posted successfully.'),
(401, 'Update Schedule Link', 'Admin  Account', '2019-03-07 04:27:05.0', 'Updated schedule link of CS Class Schedule successfully.'),
(402, 'Post Announcement', 'Admin  Account', '2019-03-07 04:27:39.0', 'Announcement posted successfully.'),
(403, 'Post Announcement', 'Admin  Account', '2019-03-07 04:28:11.0', 'Announcement posted successfully.'),
(404, 'Post Announcement', 'Admin  Account', '2019-03-07 04:30:05.0', 'Announcement posted successfully.'),
(405, 'Post Announcement', 'Admin  Account', '2019-03-07 04:38:44.0', 'Announcement posted successfully.'),
(406, 'Post Announcement', 'Admin  Account', '2019-03-07 04:42:02.0', 'Announcement posted successfully.'),
(407, 'Post Announcement', 'Admin  Account', '2019-03-07 04:53:31.0', 'Announcement posted successfully.'),
(408, 'Login', 'Admin  Account', '2019-03-07 05:04:21.0', 'Logged in successfully.'),
(409, 'Post Announcement', 'Admin  Account', '2019-03-07 05:04:26.0', 'Announcement posted successfully.'),
(410, 'Post Announcement', 'Admin  Account', '2019-03-07 05:08:30.0', 'Announcement posted successfully.'),
(411, 'Post Announcement', 'Admin  Account', '2019-03-07 05:08:53.0', 'Announcement posted successfully.'),
(412, 'Post Announcement', 'Admin  Account', '2019-03-07 05:09:06.0', 'Announcement posted successfully.'),
(413, 'Post Announcement', 'Admin  Account', '2019-03-07 05:09:20.0', 'Announcement posted successfully.'),
(414, 'Post Announcement', 'Admin  Account', '2019-03-07 05:09:57.0', 'Announcement posted successfully.'),
(415, 'Post Announcement', 'Admin  Account', '2019-03-07 05:10:24.0', 'Announcement posted successfully.'),
(416, 'Post Announcement', 'Admin  Account', '2019-03-07 05:12:46.0', 'Announcement posted successfully.'),
(417, 'Post Announcement', 'Admin  Account', '2019-03-07 05:13:25.0', 'Announcement posted successfully.'),
(418, 'Post Announcement', 'Admin  Account', '2019-03-07 05:14:32.0', 'Announcement posted successfully.'),
(419, 'Post Announcement', 'Admin  Account', '2019-03-07 05:16:05.0', 'Announcement posted successfully.'),
(420, 'Post Announcement', 'Admin  Account', '2019-03-07 05:16:49.0', 'Announcement posted successfully.'),
(421, 'Post Announcement', 'Admin  Account', '2019-03-07 05:18:19.0', 'Announcement posted successfully.'),
(422, 'Post Announcement', 'Admin  Account', '2019-03-07 05:18:32.0', 'Announcement posted successfully.'),
(423, 'Post Announcement', 'Admin  Account', '2019-03-07 05:18:32.0', 'Announcement posted successfully.'),
(424, 'Login', 'Admin  Account', '2019-03-07 05:20:48.0', 'Logged in successfully.'),
(425, 'Post Announcement', 'Admin  Account', '2019-03-07 05:21:24.0', 'Announcement posted successfully.'),
(426, 'Post Announcement', 'Admin  Account', '2019-03-07 05:23:17.0', 'Announcement posted successfully.'),
(427, 'Login', 'Admin  Account', '2019-03-07 05:26:01.0', 'Logged in successfully.'),
(428, 'Login', 'Admin  Account', '2019-03-07 05:27:33.0', 'Logged in successfully.'),
(429, 'Post Announcement', 'Admin  Account', '2019-03-07 05:28:19.0', 'Announcement posted successfully.'),
(430, 'Login', 'Admin  Account', '2019-03-07 05:28:52.0', 'Logged in successfully.'),
(431, 'Post Announcement', 'Admin  Account', '2019-03-07 05:29:02.0', 'Announcement posted successfully.'),
(432, 'Post Announcement', 'Admin  Account', '2019-03-07 05:31:27.0', 'Announcement posted successfully.'),
(433, 'Post Announcement', 'Admin  Account', '2019-03-07 05:32:22.0', 'Announcement posted successfully.'),
(434, 'Post Announcement', 'Admin  Account', '2019-03-07 05:37:05.0', 'Announcement posted successfully.'),
(435, 'Login', 'Admin  Account', '2019-03-07 05:37:27.0', 'Logged in successfully.'),
(436, 'Post Announcement', 'Admin  Account', '2019-03-07 05:37:53.0', 'Announcement posted successfully.'),
(437, 'Post Announcement', 'Admin  Account', '2019-03-07 05:41:41.0', 'Announcement posted successfully.'),
(438, 'Update Schedule Link', 'Admin  Account', '2019-03-07 05:49:32.0', 'Updated schedule link of CS Class Schedule successfully.'),
(439, 'Post Announcement', 'Admin  Account', '2019-03-07 05:54:38.0', 'Announcement posted successfully.'),
(440, 'Post Announcement', 'Admin  Account', '2019-03-07 05:54:41.0', 'Announcement posted successfully.'),
(441, 'Post Announcement', 'Admin  Account', '2019-03-07 05:54:45.0', 'Announcement posted successfully.'),
(442, 'Post Announcement', 'Admin  Account', '2019-03-07 05:55:54.0', 'Announcement posted successfully.'),
(443, 'Post Announcement', 'Admin  Account', '2019-03-07 05:56:09.0', 'Announcement posted successfully.'),
(444, 'Login', 'Ralph Angelo Cruz Vicente', '2019-03-07 06:08:40.0', 'Logged in successfully.'),
(445, 'Get Queue Ticket', 'Ralph Angelo Cruz Vicente', '2019-03-07 06:08:45.0', 'Queue Ticket No. 1 / Document Inquiry'),
(446, 'Login', 'Ralph Angelo Cruz Vicente', '2019-03-07 06:23:55.0', 'Logged in successfully.'),
(447, 'Queue Control', 'Admin  Account', '2019-03-07 06:25:28.0', 'Queue No. 0001 listed as Done.'),
(448, 'Get Queue Ticket', 'Ralph Angelo Cruz Vicente', '2019-03-07 06:25:33.0', 'Queue Ticket No. 2 / Enrollment Concern'),
(449, 'Queue Control', 'Admin  Account', '2019-03-07 06:27:24.0', 'Queue No. 0002 listed as Done.'),
(450, 'Login', 'Ralph Angelo Cruz Vicente', '2019-03-07 06:37:12.0', 'Logged in successfully.'),
(451, 'Login', 'Ralph Angelo Cruz Vicente', '2019-03-07 06:37:32.0', 'Logged in successfully.'),
(452, 'Login', 'Ralph Angelo Cruz Vicente', '2019-03-07 06:40:55.0', 'Logged in successfully.'),
(453, 'Get Queue Ticket', 'Ralph Angelo Cruz Vicente', '2019-03-07 06:41:12.0', 'Queue Ticket No. 3 / Document Inquiry'),
(454, 'Login', 'Ralph Angelo Cruz Vicente', '2019-03-07 06:43:55.0', 'Logged in successfully.'),
(455, 'Queue Control', 'Admin  Account', '2019-03-07 06:44:01.0', 'Queue No. 0003 listed as Done.'),
(456, 'Get Queue Ticket', 'Ralph Angelo Cruz Vicente', '2019-03-07 06:44:19.0', 'Queue Ticket No. 4 / Document Inquiry'),
(457, 'Login', 'Wesley C Chong', '2019-03-07 06:50:56.0', 'Logged in successfully.'),
(458, 'Get Queue Ticket', 'Wesley C Chong', '2019-03-07 06:51:00.0', 'Queue Ticket No. 1 / Enrollment Concern'),
(459, 'Queue Control', 'Admin  Account', '2019-03-07 06:52:19.0', 'Queue No. 0004 listed as Done.'),
(460, 'Queue Control', 'Admin  Account', '2019-03-07 06:52:23.0', 'Queue No. 0005 listed as Done.'),
(461, 'Get Queue Ticket', 'Wesley C Chong', '2019-03-07 06:53:25.0', 'Queue Ticket No. 6 / Document Inquiry'),
(462, 'Login', 'Ralph Angelo Cruz Vicente', '2019-03-07 06:53:39.0', 'Logged in successfully.'),
(463, 'Get Queue Ticket', 'Ralph Angelo Cruz Vicente', '2019-03-07 06:53:43.0', 'Queue Ticket No. 5 / Document Inquiry'),
(464, 'Queue Control', 'Admin  Account', '2019-03-07 06:58:48.0', 'Queue No. 0006 listed as Done.'),
(465, 'Queue Control', 'Admin  Account', '2019-03-07 06:58:51.0', 'Queue No. 0007 listed as Done.'),
(466, 'Get Queue Ticket', 'Ralph Angelo Cruz Vicente', '2019-03-07 06:58:56.0', 'Queue Ticket No. 8 / Enrollment Concern'),
(467, 'Login', 'Wesley C Chong', '2019-03-07 06:59:23.0', 'Logged in successfully.'),
(468, 'Get Queue Ticket', 'Wesley C Chong', '2019-03-07 06:59:27.0', 'Queue Ticket No. 7 / Document Inquiry'),
(469, 'Queue Control', 'Admin  Account', '2019-03-07 07:01:52.0', 'Queue No. 0008 listed as Done.'),
(470, 'Queue Control', 'Admin  Account', '2019-03-07 07:01:56.0', 'Queue No. 0009 listed as Done.'),
(471, 'Get Queue Ticket', 'Wesley C Chong', '2019-03-07 07:02:01.0', 'Queue Ticket No. 10 / Document Inquiry'),
(472, 'Login', 'Ralph Angelo Cruz Vicente', '2019-03-07 07:02:14.0', 'Logged in successfully.'),
(473, 'Get Queue Ticket', 'Ralph Angelo Cruz Vicente', '2019-03-07 07:02:23.0', 'Queue Ticket No. 9 / Document Inquiry'),
(474, 'Queue Control', 'Admin  Account', '2019-03-07 07:03:47.0', 'Queue No. 0010 listed as Done.'),
(475, 'Queue Control', 'Admin  Account', '2019-03-07 07:03:50.0', 'Queue No. 0011 listed as Done.'),
(476, 'Get Queue Ticket', 'Ralph Angelo Cruz Vicente', '2019-03-07 07:03:55.0', 'Queue Ticket No. 12 / Document Inquiry'),
(477, 'Login', 'Wesley C Chong', '2019-03-07 07:04:40.0', 'Logged in successfully.'),
(478, 'Get Queue Ticket', 'Wesley C Chong', '2019-03-07 07:04:44.0', 'Queue Ticket No. 11 / Enrollment Concern'),
(479, 'Queue Control', 'Admin  Account', '2019-03-07 07:07:45.0', 'Queue No. 0012 listed as Done.'),
(480, 'Queue Control', 'Admin  Account', '2019-03-07 07:07:51.0', 'Queue No. 0013 listed as No-Show.'),
(481, 'Login', 'Ralph Angelo Cruz Vicente', '2019-03-07 07:15:09.0', 'Logged in successfully.'),
(482, 'Queue Control', 'Admin  Account', '2019-03-07 07:16:04.0', 'Admin is unavailable.'),
(483, 'Login', 'Admin  Account', '2019-03-07 07:17:19.0', 'Logged in successfully.'),
(484, 'Post Announcement', 'Admin  Account', '2019-03-07 07:17:23.0', 'Announcement posted successfully.'),
(485, 'Get Queue Ticket', 'Ralph Angelo Cruz Vicente', '2019-03-07 07:22:45.0', 'Queue Ticket No. 13 / Document Inquiry'),
(486, 'Login', 'Admin  Account', '2019-03-07 07:24:45.0', 'Logged in successfully.'),
(487, 'Queue Control', 'Admin  Account', '2019-03-07 07:24:51.0', 'Queue No. 0014 listed as Done.'),
(488, 'Get Queue Ticket', 'Ralph Angelo Cruz Vicente', '2019-03-07 07:24:57.0', 'Queue Ticket No. 15 / Document Inquiry'),
(489, 'Login', 'Wesley C Chong', '2019-03-07 07:25:21.0', 'Logged in successfully.');
INSERT INTO `updatelogs` (`ULOGNO`, `ULOGACT`, `ULOGUSER`, `ULOGTIME`, `ULOGNEW`) VALUES
(490, 'Get Queue Ticket', 'Wesley C Chong', '2019-03-07 07:25:33.0', 'Queue Ticket No. 14 / Enrollment Concern'),
(491, 'Queue Control', 'Admin  Account', '2019-03-07 07:25:47.0', 'Queue No. 0015 listed as Done.'),
(492, 'Queue Control', 'Admin  Account', '2019-03-07 07:28:16.0', 'Queue No. 0016 listed as Done.'),
(493, 'Get Queue Ticket', 'Wesley C Chong', '2019-03-07 07:28:26.0', 'Queue Ticket No. 17 / Document Inquiry'),
(494, 'Queue Control', 'Admin  Account', '2019-03-07 07:28:36.0', 'Queue No. 0017 listed as Done.'),
(495, 'Get Queue Ticket', 'Wesley C Chong', '2019-03-07 07:28:41.0', 'Queue Ticket No. 18 / Document Inquiry'),
(496, 'Queue Control', 'Admin  Account', '2019-03-07 07:29:10.0', 'Queue No. 0018 listed as Done.'),
(497, 'Get Queue Ticket', 'Wesley C Chong', '2019-03-07 07:30:00.0', 'Queue Ticket No. 19 / Document Inquiry'),
(498, 'Queue Control', 'Admin  Account', '2019-03-07 07:30:19.0', 'Queue No. 0019 listed as Done.'),
(499, 'Get Queue Ticket', 'Wesley C Chong', '2019-03-07 07:31:28.0', 'Queue Ticket No. 20 / Document Inquiry'),
(500, 'Queue Control', 'Admin  Account', '2019-03-07 07:32:17.0', 'Queue No. 0020 listed as Done.'),
(501, 'Get Queue Ticket', 'Wesley C Chong', '2019-03-07 07:32:24.0', 'Queue Ticket No. 21 / Document Inquiry'),
(502, 'Queue Control', 'Admin  Account', '2019-03-07 07:34:25.0', 'Queue No. 0021 listed as Done.'),
(503, 'Get Queue Ticket', 'Wesley C Chong', '2019-03-07 07:34:30.0', 'Queue Ticket No. 22 / Enrollment Concern'),
(504, 'Login', 'Ralph Angelo Cruz Vicente', '2019-03-07 07:35:46.0', 'Logged in successfully.'),
(505, 'Get Queue Ticket', 'Ralph Angelo Cruz Vicente', '2019-03-07 07:35:52.0', 'Queue Ticket No. 16 / Document Inquiry'),
(506, 'Login', 'Admin  Account', '2019-03-07 07:35:59.0', 'Logged in successfully.'),
(507, 'Queue Control', 'Admin  Account', '2019-03-07 07:36:12.0', 'Queue No. 0022 listed as Done.'),
(508, 'Queue Control', 'Admin  Account', '2019-03-07 07:36:17.0', 'Queue No. 0023 listed as Done.'),
(509, 'Get Queue Ticket', 'Ralph Angelo Cruz Vicente', '2019-03-07 07:36:21.0', 'Queue Ticket No. 24 / Document Inquiry'),
(510, 'Queue Control', 'Admin  Account', '2019-03-07 07:39:50.0', 'Queue No. 0024 listed as Done.'),
(511, 'Get Queue Ticket', 'Ralph Angelo Cruz Vicente', '2019-03-07 07:39:57.0', 'Queue Ticket No. 25 / Document Inquiry'),
(512, 'Queue Control', 'Admin  Account', '2019-03-07 07:40:41.0', 'Queue No. 0025 listed as Done.'),
(513, 'Get Queue Ticket', 'Ralph Angelo Cruz Vicente', '2019-03-07 07:40:48.0', 'Queue Ticket No. 26 / Document Inquiry'),
(514, 'Queue Control', 'Admin  Account', '2019-03-07 07:40:58.0', 'Queue No. 0026 listed as Done.'),
(515, 'Post Announcement', 'Admin  Account', '2019-03-07 07:46:26.0', 'Announcement posted successfully.'),
(516, 'Login', 'Ralph Angelo Cruz Vicente', '2019-03-07 07:47:56.0', 'Logged in successfully.'),
(517, 'Login', 'Ralph Angelo Cruz Vicente', '2019-03-07 07:48:53.0', 'Logged in successfully.'),
(518, 'Login', 'Admin  Account', '2019-03-07 07:50:29.0', 'Logged in successfully.'),
(519, 'Post Announcement', 'Admin  Account', '2019-03-07 07:50:37.0', 'Announcement posted successfully.'),
(520, 'Get Queue Ticket', 'Ralph Angelo Cruz Vicente', '2019-03-07 07:50:58.0', 'Queue Ticket No. 27 / Document Inquiry'),
(521, 'Queue Control', 'Admin  Account', '2019-03-07 07:51:16.0', 'Queue No. 0027 listed as Done.'),
(522, 'Get Queue Ticket', 'Ralph Angelo Cruz Vicente', '2019-03-07 07:54:42.0', 'Queue Ticket No. 28 / Document Inquiry'),
(523, 'Queue Control', 'Admin  Account', '2019-03-07 08:03:53.0', 'Queue No. 0028 listed as Done.'),
(524, 'Get Queue Ticket', 'Ralph Angelo Cruz Vicente', '2019-03-07 08:04:04.0', 'Queue Ticket No. 29 / Document Inquiry'),
(525, 'Queue Control', 'Admin  Account', '2019-03-07 08:06:13.0', 'Queue No. 0029 listed as Done.'),
(526, 'Post Announcement', 'Admin  Account', '2019-03-07 08:14:00.0', 'Announcement posted successfully.'),
(527, 'Login', 'Faculty  Account', '2019-03-07 08:14:11.0', 'Logged in successfully.'),
(528, 'Consultation Request', 'Ralph Angelo Cruz Vicente', '2019-03-07 08:14:39.0', 'Consultation Request (Test) sent.'),
(529, 'Login', 'Faculty  Account', '2019-03-07 09:10:02.0', 'Logged in successfully.'),
(530, 'Login', 'Ralph Angelo Cruz Vicente', '2019-03-07 09:10:51.0', 'Logged in successfully.'),
(531, 'Login', 'Admin  Account', '2019-03-07 09:15:31.0', 'Logged in successfully.'),
(532, 'Get Queue Ticket', 'Ralph Angelo Cruz Vicente', '2019-03-07 09:15:50.0', 'Queue Ticket No. 30 / Enrollment Concern'),
(533, 'Login', 'Faculty  Account', '2019-03-07 09:43:09.0', 'Logged in successfully.'),
(534, 'Update Consultation Request Status', 'Faculty  Account', '2019-03-07 09:44:15.0', 'Consultation Request No. 0002 changed status to Accepted.'),
(535, 'Update Consultation Request Status', 'Faculty  Account', '2019-03-07 09:51:07.0', 'Consultation Request No. 0003 changed status to Accepted.'),
(536, 'Consultation Request', 'Ralph Angelo Cruz Vicente', '2019-03-07 09:53:33.0', 'Consultation Request (321) sent.'),
(537, 'Update Consultation Request Status', 'Faculty  Account', '2019-03-07 09:54:18.0', 'Consultation Request No. 0004 changed status to Accepted.'),
(538, 'Consultation Request', 'Ralph Angelo Cruz Vicente', '2019-03-07 09:55:30.0', 'Consultation Request (Sample Title Sample Description Sample Description) sent.'),
(539, 'Consultation Request', 'Ralph Angelo Cruz Vicente', '2019-03-07 09:57:12.0', 'Consultation Request (&lt;li style=&quot;width: 300px; white-space: normal;&quot;&gt;   &lt;li style'),
(540, 'Update Consultation Request Status', 'Faculty  Account', '2019-03-07 09:59:55.0', 'Consultation Request No. 0006 changed status to Declined.'),
(541, 'Update Consultation Request Status', 'Faculty  Account', '2019-03-07 10:01:30.0', 'Consultation Request No. 0005 changed status to Accepted.'),
(542, 'Consultation Request', 'Ralph Angelo Cruz Vicente', '2019-03-07 10:09:35.0', 'Consultation Request (312) sent.'),
(543, 'Update Consultation Request Status', 'Faculty  Account', '2019-03-07 10:10:05.0', 'Consultation Request No. 0007 changed status to Accepted.'),
(544, 'Consultation Request', 'Ralph Angelo Cruz Vicente', '2019-03-07 10:32:58.0', 'Consultation Request (321) sent.'),
(545, 'Update Consultation Request Status', 'Faculty  Account', '2019-03-07 10:39:01.0', 'Consultation Request No. 0008 changed status to Accepted.'),
(546, 'Consultation Request', 'Ralph Angelo Cruz Vicente', '2019-03-07 10:41:00.0', 'Consultation Request (312) sent.'),
(547, 'Consultation Request', 'Ralph Angelo Cruz Vicente', '2019-03-07 10:49:59.0', 'Consultation Request (312) sent.'),
(548, 'Consultation Request', 'Ralph Angelo Cruz Vicente', '2019-03-07 10:50:03.0', 'Consultation Request (321) sent.'),
(549, 'Update Consultation Request Remarks', 'Faculty  Account', '2019-03-07 10:53:34.0', 'Consultation Request No. 0008 changed status to .'),
(550, 'Update Consultation Request Remarks', 'Faculty  Account', '2019-03-07 10:58:13.0', 'Consultation Request No. 0002 changed status to Done.'),
(551, 'Update Consultation Request Status', 'Faculty  Account', '2019-03-07 10:59:01.0', 'Consultation Request No. 0002 changed status to Accepted.'),
(552, 'Update Consultation Request Remarks', 'Faculty  Account', '2019-03-07 10:59:07.0', 'Consultation Request No. 0002 changed status to Done.'),
(553, 'Update Consultation Request Status', 'Faculty  Account', '2019-03-07 11:05:44.0', 'Consultation Request No. 0009 changed status to Accepted.'),
(554, 'Login', 'Admin  Account', '2019-03-07 11:07:13.0', 'Logged in successfully.'),
(555, 'Queue Control', 'Admin  Account', '2019-03-07 11:07:16.0', 'Queue No. 0030 listed as Done.'),
(556, 'Get Queue Ticket', 'Ralph Angelo Cruz Vicente', '2019-03-07 11:07:24.0', 'Queue Ticket No. 31 / Document Inquiry'),
(557, 'Login', 'Wesley C Chong', '2019-03-07 11:07:40.0', 'Logged in successfully.'),
(558, 'Get Queue Ticket', 'Wesley C Chong', '2019-03-07 11:07:43.0', 'Queue Ticket No. 23 / Document Inquiry'),
(559, 'Login', 'Ralph Angelo Cruz Vicente', '2019-03-07 11:14:20.0', 'Logged in successfully.'),
(560, 'Queue Control', 'Admin  Account', '2019-03-07 11:15:56.0', 'Queue No. 0031 listed as Done.'),
(561, 'Get Queue Ticket', 'Ralph Angelo Cruz Vicente', '2019-03-07 11:16:23.0', 'Queue Ticket No. 32 / Document Inquiry'),
(562, 'Queue Control', 'Admin  Account', '2019-03-07 11:16:34.0', 'Queue No. 0032 listed as Done.'),
(563, 'Queue Control', 'Admin  Account', '2019-03-07 11:16:57.0', 'Queue No. 0033 listed as Done.'),
(564, 'Login', 'Admin  Account', '2019-03-07 12:44:19.0', 'Logged in successfully.'),
(565, 'Login', 'Ralph Angelo Cruz Vicente', '2019-03-07 12:44:29.0', 'Logged in successfully.'),
(566, 'Get Queue Ticket', 'Ralph Angelo Cruz Vicente', '2019-03-07 12:44:36.0', 'Queue Ticket No. 34 / Document Inquiry'),
(567, 'Login', 'Ralph Angelo Cruz Vicente', '2019-03-07 12:45:21.0', 'Logged in successfully.'),
(568, 'Login', 'Faculty  Account', '2019-03-07 12:45:39.0', 'Logged in successfully.'),
(569, 'Login', 'Faculty  Account', '2019-03-07 12:47:50.0', 'Logged in successfully.'),
(570, 'Login', 'Ralph Angelo Cruz Vicente', '2019-03-07 12:49:17.0', 'Logged in successfully.'),
(571, 'Login', 'Admin  Account', '2019-03-07 12:52:13.0', 'Logged in successfully.'),
(572, 'Login', 'Admin  Account', '2019-03-07 15:38:30.0', 'Logged in successfully.'),
(573, 'Login', 'Ralph Angelo Cruz Vicente', '2019-03-08 06:00:37.0', 'Logged in successfully.'),
(574, 'Login', 'Wesley C Chong', '2019-03-08 06:01:19.0', 'Logged in successfully.'),
(575, 'Get Queue Ticket', 'Wesley C Chong', '2019-03-08 06:01:24.0', 'Queue Ticket No. 33 / Document Inquiry'),
(576, 'Login', 'Admin  Account', '2019-03-08 06:08:23.0', 'Logged in successfully.'),
(577, 'Queue Control', 'Admin  Account', '2019-03-08 06:08:30.0', 'Queue No. 0034 listed as Done.'),
(578, 'Login', 'Wesley C Chong', '2019-03-08 06:09:16.0', 'Logged in successfully.'),
(579, 'Get Queue Ticket', 'Ralph Angelo Cruz Vicente', '2019-03-08 06:09:26.0', 'Queue Ticket No. 35 / Document Inquiry'),
(580, 'Login', 'Admin  Account', '2019-03-08 06:10:12.0', 'Logged in successfully.'),
(581, 'Queue Control', 'Admin  Account', '2019-03-08 06:11:34.0', 'Queue No. 0035 listed as Done.'),
(582, 'Queue Control', 'Admin  Account', '2019-03-08 06:24:12.0', 'Queue No. 0036 listed as Done.'),
(583, 'Get Queue Ticket', 'Wesley C Chong', '2019-03-08 06:36:37.0', 'Queue Ticket No. 36 / Document Inquiry'),
(584, 'Queue Control', 'Admin  Account', '2019-03-08 06:37:38.0', 'Queue No. 0037 listed as Done.'),
(585, 'Get Queue Ticket', 'Wesley C Chong', '2019-03-08 06:48:18.0', 'Queue Ticket No. 38 / Document Inquiry'),
(586, 'Queue Control', 'Admin  Account', '2019-03-08 06:48:45.0', 'Queue No. 0038 listed as No-Show.'),
(587, 'Get Queue Ticket', 'Wesley C Chong', '2019-03-08 06:53:58.0', 'Queue Ticket No. 39 / Document Inquiry'),
(588, 'Queue Control', 'Admin  Account', '2019-03-08 06:54:17.0', 'Queue No. 0039 listed as Done.'),
(589, 'Get Queue Ticket', 'Wesley C Chong', '2019-03-08 06:59:26.0', 'Queue Ticket No. 40 / Document Inquiry'),
(590, 'Queue Control', 'Admin  Account', '2019-03-08 07:08:46.0', 'Queue No. 0040 listed as Done.'),
(591, 'Login', 'Ralph Angelo Cruz Vicente', '2019-03-08 07:57:02.0', 'Logged in successfully.'),
(592, 'Login', 'Ralph Angelo Cruz Vicente', '2019-03-08 08:16:05.0', 'Logged in successfully.'),
(593, 'Login', 'Admin  Account', '2019-03-08 08:22:36.0', 'Logged in successfully.'),
(594, 'Update Document Status', 'Admin  Account', '2019-03-08 08:26:10.0', 'Document No. 0002 changed status to For Release'),
(595, 'Login', 'Ralph Angelo Cruz Vicente', '2019-03-08 08:26:25.0', 'Logged in successfully.'),
(596, 'Login', 'Ralph Angelo Cruz Vicente', '2019-03-08 11:20:09.0', 'Logged in successfully.'),
(597, 'Login', 'Admin  Account', '2019-03-08 11:20:53.0', 'Logged in successfully.'),
(598, 'Login', 'Faculty  Account', '2019-03-08 11:21:06.0', 'Logged in successfully.'),
(599, 'Login', 'Ralph Angelo Cruz Vicente', '2019-03-08 11:33:55.0', 'Logged in successfully.'),
(600, 'Login', 'Admin  Account', '2019-03-08 11:34:02.0', 'Logged in successfully.'),
(601, 'Update Document Status', 'Admin  Account', '2019-03-08 11:34:24.0', 'Document No. 0001 changed status to Received by Office'),
(602, 'Update Document Status', 'Admin  Account', '2019-03-08 11:35:08.0', 'Document No. 0001 changed status to On-Process'),
(603, 'Update Document Status', 'Admin  Account', '2019-03-08 11:36:09.0', 'Document No. 0001 changed status to Processed'),
(604, 'Update Document Status', 'Admin  Account', '2019-03-08 11:36:47.0', 'Document No. 0001 changed status to For Release'),
(605, 'Get Queue Ticket', 'Ralph Angelo Cruz Vicente', '2019-03-08 11:49:06.0', 'Queue Ticket No. 37 / Document Submission'),
(606, 'Get Queue Ticket', 'Ralph Angelo Cruz Vicente', '2019-03-08 11:54:16.0', 'Queue Ticket No. 37 / Document Submission'),
(607, 'Queue Control', 'Admin  Account', '2019-03-08 11:55:00.0', 'Queue No. 0041 listed as Done.'),
(608, 'Queue Control', 'Admin  Account', '2019-03-08 11:55:17.0', 'Queue No. 0042 listed as Done.'),
(609, 'Get Queue Ticket', 'Ralph Angelo Cruz Vicente', '2019-03-08 11:59:12.0', 'Queue Ticket No. 43 / Document Submission'),
(610, 'Queue Control', 'Admin  Account', '2019-03-08 12:00:32.0', 'Queue No. 0043 listed as Done.'),
(611, 'Get Queue Ticket', 'Ralph Angelo Cruz Vicente', '2019-03-08 12:05:27.0', 'Queue Ticket No. 44 / Document Submission'),
(612, 'Queue Control', 'Admin  Account', '2019-03-08 12:08:10.0', 'Queue No. 0044 listed as Done.'),
(613, 'Update Document Status', 'Admin  Account', '2019-03-08 12:08:46.0', 'Document No. 0003 changed status to Received by Office'),
(614, 'Update Document Status', 'Admin  Account', '2019-03-08 12:09:06.0', 'Document No. 0004 changed status to Received by Office'),
(615, 'Update Document Status', 'Admin  Account', '2019-03-08 12:09:13.0', 'Document No. 0005 changed status to Not Received'),
(616, 'Update Document Status', 'Admin  Account', '2019-03-08 12:09:18.0', 'Document No. 0006 changed status to Not Received'),
(617, 'Login', 'Ralph Angelo Cruz Vicente', '2019-03-09 02:23:47.0', 'Logged in successfully.'),
(618, 'Get Queue Ticket', 'Ralph Angelo Cruz Vicente', '2019-03-09 02:24:01.0', 'Queue Ticket No. 45 / Document Inquiry'),
(619, 'Login', 'Admin  Account', '2019-03-09 02:24:47.0', 'Logged in successfully.'),
(620, 'Login', 'Admin  Account', '2019-03-09 03:55:35.0', 'Logged in successfully.'),
(621, 'Post Announcement', 'Admin  Account', '2019-03-09 04:28:17.0', 'Announcement posted successfully.'),
(622, 'Login', 'Admin  Account', '2019-03-12 06:03:12.0', 'Logged in successfully.'),
(623, 'Login', 'Ralph Angelo Cruz Vicente', '2019-03-13 04:29:18.0', 'Logged in successfully.'),
(624, 'Login', 'Ralph Angelo Cruz Vicente', '2019-03-13 08:25:25.0', 'Logged in successfully.'),
(625, 'Login', 'Ralph Angelo Cruz Vicente', '2019-03-13 14:50:43.0', 'Logged in successfully.'),
(626, 'Login', 'Admin  Account', '2019-03-13 14:53:09.0', 'Logged in successfully.'),
(627, 'Login', 'Ralph Angelo Cruz Vicente', '2019-03-13 15:42:15.0', 'Logged in successfully.'),
(628, 'Queue Control', 'Admin  Account', '2019-03-13 15:47:15.0', 'Queue No. 0045 listed as Done.'),
(629, 'Get Queue Ticket', 'Ralph Angelo Cruz Vicente', '2019-03-13 15:47:28.0', 'Queue Ticket No. 46 / Document Submission'),
(630, 'Queue Control', 'Admin  Account', '2019-03-13 15:47:44.0', 'Queue No. 0046 listed as Done.'),
(631, 'Consultation Request', 'Ralph Angelo Cruz Vicente', '2019-03-13 16:10:38.0', 'Consultation Request (Test Consultation) sent.'),
(632, 'Login', 'Faculty  Account', '2019-03-13 16:10:45.0', 'Logged in successfully.'),
(633, 'Login', 'Ralph Angelo Cruz Vicente', '2019-03-13 16:15:34.0', 'Logged in successfully.'),
(634, 'Login', 'Faculty  Account', '2019-03-14 02:25:50.0', 'Logged in successfully.'),
(635, 'Login', 'Faculty  Account', '2019-03-14 03:51:30.0', 'Logged in successfully.'),
(636, 'Login', 'Admin  Account', '2019-03-14 08:15:45.0', 'Logged in successfully.'),
(637, 'Login', 'Ralph Angelo Cruz Vicente', '2019-03-14 08:16:52.0', 'Logged in successfully.'),
(638, 'Get Queue Ticket', 'Ralph Angelo Cruz Vicente', '2019-03-14 08:17:01.0', 'Queue Ticket No. 47 / Other'),
(639, 'Queue Control', 'Admin  Account', '2019-03-14 08:30:16.0', 'Queue No. 0047 listed as Done.'),
(640, 'Get Queue Ticket', 'Ralph Angelo Cruz Vicente', '2019-03-14 08:31:42.0', 'Queue Ticket No. 48 / Other'),
(641, 'Login', 'Faculty  Account', '2019-03-15 03:46:30.0', 'Logged in successfully.'),
(642, 'Login', 'Faculty  Account', '2019-03-15 13:57:47.0', 'Logged in successfully.'),
(643, 'Login', 'Ralph Angelo Cruz Vicente', '2019-03-15 14:52:42.0', 'Logged in successfully.'),
(644, 'Login', 'Faculty  Account', '2019-03-15 14:53:34.0', 'Logged in successfully.'),
(645, 'Login', 'Ralph Angelo Cruz Vicente', '2019-03-15 14:55:31.0', 'Logged in successfully.'),
(646, 'Login', 'Faculty  Account', '2019-03-15 14:59:37.0', 'Logged in successfully.'),
(647, 'Login', 'Ralph Angelo Cruz Vicente', '2019-03-15 15:00:26.0', 'Logged in successfully.'),
(648, 'Login', 'Faculty  Account', '2019-03-16 03:02:07.0', 'Logged in successfully.'),
(649, 'Login', 'Ralph Angelo Cruz Vicente', '2019-03-16 03:02:18.0', 'Logged in successfully.'),
(650, 'Consultation Request', 'Ralph Angelo Cruz Vicente', '2019-03-16 04:04:14.0', 'Consultation Request (Sample) sent.'),
(651, 'Consultation Request', 'Ralph Angelo Cruz Vicente', '2019-03-16 04:06:12.0', 'Consultation Request (Sample 2) sent.'),
(652, 'Login', 'Faculty  Account', '2019-03-16 04:18:12.0', 'Logged in successfully.'),
(653, 'Login', 'Admin  Account', '2019-05-03 10:59:05.0', 'Logged in successfully.'),
(654, 'Login', 'Faculty  Account 2', '2019-05-03 11:00:01.0', 'Logged in successfully.'),
(655, 'Login', 'Ralph Angelo Cruz Vicente', '2019-05-03 11:00:42.0', 'Logged in successfully.'),
(656, 'Login', 'Admin  Account', '2019-05-03 11:01:39.0', 'Logged in successfully.'),
(657, 'Queue Control', 'Admin  Account', '2019-05-03 11:01:45.0', 'Queue No. 0048 listed as Done.'),
(658, 'Login', 'Admin  Account', '2019-05-03 11:03:20.0', 'Logged in successfully.'),
(659, 'Login', 'Faculty  Account', '2019-05-03 11:26:26.0', 'Logged in successfully.'),
(660, 'Login', 'Ralph Angelo Cruz Vicente', '2019-05-03 11:27:17.0', 'Logged in successfully.'),
(661, 'Consultation Request', 'Ralph Angelo Cruz Vicente', '2019-05-03 11:49:45.0', 'Consultation Request (AA) sent.'),
(662, 'Consultation Request', 'Ralph Angelo Cruz Vicente', '2019-05-03 11:50:58.0', 'Consultation Request (111) sent.'),
(663, 'Consultation Request', 'Ralph Angelo Cruz Vicente', '2019-05-03 11:52:26.0', 'Consultation Request (11133) sent.'),
(664, 'Consultation Request', 'Ralph Angelo Cruz Vicente', '2019-05-03 11:55:05.0', 'Consultation Request (Sample) sent.'),
(665, 'Consultation Request', 'Ralph Angelo Cruz Vicente', '2019-05-03 11:56:23.0', 'Consultation Request (123123) sent.'),
(666, 'Consultation Request', 'Ralph Angelo Cruz Vicente', '2019-05-03 11:59:20.0', 'Consultation Request (Try nga) sent.'),
(667, 'Login', 'Faculty  Account', '2019-05-03 12:02:04.0', 'Logged in successfully.'),
(668, 'Login', 'Ralph Angelo Cruz Vicente', '2019-05-03 12:09:42.0', 'Logged in successfully.'),
(669, 'Consultation Request', 'Ralph Angelo Cruz Vicente', '2019-05-03 12:12:09.0', 'Consultation Request (Gte) sent.'),
(670, 'Get Queue Ticket', 'Ralph Angelo Cruz Vicente', '2019-05-03 12:16:24.0', 'Queue Ticket No. 49 / Document Submission'),
(671, 'Login', 'Admin  Account', '2019-05-03 12:16:37.0', 'Logged in successfully.'),
(672, 'Queue Control', 'Admin  Account', '2019-05-03 12:17:46.0', 'Queue No. 0049 listed as Done.'),
(673, 'Update Document Status', 'Admin  Account', '2019-05-03 12:18:13.0', 'Document No. 0009 changed status to Received by Office'),
(674, 'Login', 'Ralph Angelo Cruz Vicente', '2019-05-03 12:18:37.0', 'Logged in successfully.'),
(675, 'Get Queue Ticket', 'Ralph Angelo Cruz Vicente', '2019-05-03 12:18:49.0', 'Queue Ticket No. 50 / Document Inquiry'),
(676, 'Queue Control', 'Admin  Account', '2019-05-03 12:24:21.0', 'Queue No. 0050 listed as Done.'),
(677, 'Get Queue Ticket', 'Ralph Angelo Cruz Vicente', '2019-05-03 12:31:43.0', 'Queue Ticket No. 51 / Enrollment Concern'),
(678, 'Queue Control', 'Admin  Account', '2019-05-03 12:35:01.0', 'Queue No. 0051 listed as Done.'),
(679, 'Get Queue Ticket', 'Ralph Angelo Cruz Vicente', '2019-05-03 12:53:42.0', 'Queue Ticket No. 52 / Document Inquiry'),
(680, 'Queue Control', 'Admin  Account', '2019-05-03 12:54:21.0', 'Queue No. 0052 listed as Done.'),
(681, 'Get Queue Ticket', 'Ralph Angelo Cruz Vicente', '2019-05-03 12:58:40.0', 'Queue Ticket No. 53 / Document Inquiry'),
(682, 'Queue Control', 'Admin  Account', '2019-05-03 12:59:00.0', 'Queue No. 0053 listed as Done.'),
(683, 'Login', 'Ralph Angelo Cruz Vicente', '2019-05-03 13:35:35.0', 'Logged in successfully.'),
(684, 'Login', 'Faculty  Account', '2019-05-03 13:42:59.0', 'Logged in successfully.'),
(685, 'Login', 'Jospeh Christian Bautista Dizon', '2019-11-26 08:50:55.0', 'Logged in successfully.'),
(686, 'Login', 'Admin  Account', '2019-11-26 08:59:54.0', 'Logged in successfully.'),
(687, 'Login', 'Joseph Christian Bautista Dizon', '2019-11-26 09:03:12.0', 'Logged in successfully.'),
(688, 'Login', 'Admin  Account', '2019-11-26 09:09:37.0', 'Logged in successfully.'),
(689, 'Login', 'Joseph Christian Bautista Dizon', '2019-11-26 09:20:19.0', 'Logged in successfully.'),
(690, 'Login', 'Faculty  Account 2', '2019-11-26 09:40:58.0', 'Logged in successfully.'),
(691, 'Login', 'Admin  Account', '2019-11-26 09:56:51.0', 'Logged in successfully.'),
(692, 'Login', 'Joseph Christian Bautista Dizon', '2019-11-26 10:12:25.0', 'Logged in successfully.'),
(693, 'Login', 'Admin  Account', '2019-11-26 10:13:42.0', 'Logged in successfully.'),
(694, 'Login', 'Joseph Christian Bautista Dizon', '2019-11-26 10:25:12.0', 'Logged in successfully.'),
(695, 'Login', 'Admin  Account', '2019-11-26 10:29:41.0', 'Logged in successfully.'),
(696, 'Post Announcement', 'Admin  Account', '2019-11-26 10:29:50.0', 'Announcement posted successfully.'),
(697, 'Post Announcement', 'Admin  Account', '2019-11-26 10:30:12.0', 'Announcement posted successfully.'),
(698, 'Login', 'Joseph Christian Bautista Dizon', '2019-11-26 10:30:37.0', 'Logged in successfully.'),
(699, 'Login', 'Admin  Account', '2019-11-26 10:53:39.0', 'Logged in successfully.'),
(700, 'Login', 'Joseph Christian Bautista Dizon', '2019-11-26 10:58:09.0', 'Logged in successfully.'),
(701, 'Login', 'Admin  Account', '2019-11-26 11:46:12.0', 'Logged in successfully.'),
(702, 'Login', 'Joseph Christian Bautista Dizon', '2019-11-26 15:28:53.0', 'Logged in successfully.'),
(703, 'Login', 'Joseph Christian Bautista Dizon', '2019-11-27 07:33:42.0', 'Logged in successfully.'),
(704, 'Login', 'Joseph Christian Bautista Dizon', '2019-11-27 07:35:04.0', 'Logged in successfully.'),
(705, 'Login', 'Joseph Christian Bautista Dizon', '2019-11-27 14:10:16.0', 'Logged in successfully.'),
(706, 'Login', 'Joseph Christian BAUTISTA Dizon', '2019-11-30 14:16:51.0', 'Logged in successfully.'),
(707, 'Login', 'Admin  Account', '2019-11-30 14:18:11.0', 'Logged in successfully.'),
(708, 'Login', 'Joseph Christian BAUTISTA Dizon', '2019-11-30 14:18:59.0', 'Logged in successfully.'),
(709, 'Get Queue Ticket', 'Joseph Christian BAUTISTA Dizon', '2019-11-30 14:19:21.0', 'Queue Ticket No. 1 / Document Inquiry'),
(710, 'Queue Control', 'Admin  Account', '2019-11-30 14:19:53.0', 'Queue No. 0054 listed as Done.'),
(711, 'Queue Control', 'Admin  Account', '2019-11-30 14:19:57.0', 'Admin is available.'),
(712, 'Queue Control', 'Admin  Account', '2019-11-30 14:20:04.0', 'Closed queue successfully.'),
(713, 'Queue Control', 'Admin  Account', '2019-11-30 14:20:09.0', 'Opened queue successfully.'),
(714, 'Update Document Status', 'Admin  Account', '2019-11-30 14:21:22.0', 'Document No. 0007 changed status to Not Received'),
(715, 'Get Queue Ticket', 'Joseph Christian BAUTISTA Dizon', '2019-11-30 14:37:42.0', 'Queue Ticket No. 55 / Document Inquiry'),
(716, 'Queue Control', 'Admin  Account', '2019-11-30 14:40:18.0', 'Queue No. 0055 listed as No-Show.'),
(717, 'Get Queue Ticket', 'Joseph Christian BAUTISTA Dizon', '2019-11-30 14:40:31.0', 'Queue Ticket No. 56 / Document Inquiry'),
(718, 'Queue Control', 'Admin  Account', '2019-11-30 14:40:55.0', 'Queue No. 0056 listed as No-Show.'),
(719, 'Get Queue Ticket', 'Joseph Christian BAUTISTA Dizon', '2019-11-30 14:45:04.0', 'Queue Ticket No. 57 / Enrollment Concern'),
(720, 'Queue Control', 'Admin  Account', '2019-11-30 14:45:54.0', 'Queue No. 0057 listed as No-Show.'),
(721, 'Get Queue Ticket', 'Joseph Christian BAUTISTA Dizon', '2019-11-30 14:46:10.0', 'Queue Ticket No. 58 / Enrollment Concern'),
(722, 'Queue Control', 'Admin  Account', '2019-11-30 14:47:20.0', 'Queue No. 0058 listed as No-Show.'),
(723, 'Get Queue Ticket', 'Joseph Christian BAUTISTA Dizon', '2019-11-30 14:47:52.0', 'Queue Ticket No. 1 / Enrollment Concern'),
(724, 'Queue Control', 'Admin  Account', '2019-11-30 14:48:44.0', 'Queue No. 0001 listed as No-Show.'),
(725, 'Get Queue Ticket', 'Joseph Christian BAUTISTA Dizon', '2019-11-30 14:48:54.0', 'Queue Ticket No. 2 / Enrollment Concern'),
(726, 'Queue Control', 'Admin  Account', '2019-11-30 14:49:57.0', 'Closed queue successfully.'),
(727, 'Queue Control', 'Admin  Account', '2019-11-30 14:49:58.0', 'Opened queue successfully.'),
(728, 'Queue Control', 'Admin  Account', '2019-11-30 14:50:01.0', 'Queue No. 0002 listed as No-Show.'),
(729, 'Get Queue Ticket', 'Joseph Christian BAUTISTA Dizon', '2019-11-30 14:50:14.0', 'Queue Ticket No. 3 / Enrollment Concern'),
(730, 'Login', 'Joseph Christian Bautista Dizon', '2019-11-30 15:34:12.0', 'Logged in successfully.'),
(731, 'Login', 'Joseph Christian BAUTISTA Dizon', '2019-11-30 15:41:57.0', 'Logged in successfully.'),
(732, 'Login', 'Admin  Account', '2019-11-30 16:28:02.0', 'Logged in successfully.'),
(733, 'Login', 'Joseph Christian BAUTISTA Dizon', '2019-11-30 16:32:35.0', 'Logged in successfully.'),
(734, 'Login', 'Joseph Christian BAUTISTA Dizon', '2019-12-01 01:12:40.0', 'Logged in successfully.'),
(735, 'Login', 'Admin  Account', '2019-12-01 01:14:12.0', 'Logged in successfully.'),
(736, 'Login', 'Admin  Account', '2019-12-01 02:48:53.0', 'Logged in successfully.'),
(737, 'Update Document Status', 'Admin  Account', '2019-12-01 02:49:21.0', 'Document No. 0013 changed status to On-Process'),
(738, 'Login', 'Joseph Christian BAUTISTA Dizon', '2019-12-01 03:38:25.0', 'Logged in successfully.'),
(739, 'Login', 'Admin  Account', '2019-12-01 04:51:26.0', 'Logged in successfully.'),
(740, 'Login', 'Joseph Christian BAUTISTA Dizon', '2019-12-01 05:12:11.0', 'Logged in successfully.'),
(741, 'Login', 'Ralph Angelo Cruz Vicente', '2019-12-06 15:26:00.0', 'Logged in successfully.'),
(742, 'Get Queue Ticket', 'Ralph Angelo Cruz Vicente', '2019-12-06 15:26:07.0', 'Queue Ticket No. 1 / Document Inquiry'),
(743, 'Queue Control', 'Admin  Account', '2019-12-06 15:26:50.0', 'Queue No. 0004 listed as Done.'),
(744, 'Get Queue Ticket', 'Ralph Angelo Cruz Vicente', '2019-12-06 15:27:01.0', 'Queue Ticket No. 5 / Document Inquiry'),
(745, 'Queue Control', 'Admin  Account', '2019-12-06 15:27:17.0', 'Queue No. 0005 listed as No-Show.'),
(746, 'Login', 'Rolland Charles Dela Cruz Gamez', '2019-12-06 15:28:43.0', 'Logged in successfully.'),
(747, 'Update Document Status', 'Admin  Account', '2019-12-06 15:31:50.0', 'Document No. 0027 changed status to Received by Office'),
(748, 'Update Document Status', 'Admin  Account', '2019-12-06 15:32:06.0', 'Document No. 0028 changed status to Received by Office'),
(749, 'Login', 'Society of Information Technology Enthusiast  ', '2019-12-06 15:41:54.0', 'Logged in successfully.'),
(750, 'Login', 'Admin  Account', '2019-12-06 15:48:52.0', 'Logged in successfully.'),
(751, 'Login', 'Society of Information Technology Enthusiast  ', '2019-12-06 15:51:19.0', 'Logged in successfully.'),
(752, 'Login', 'Rolland Charles Dela Cruz Gamez', '2019-12-06 15:55:47.0', 'Logged in successfully.'),
(753, 'Login', 'Rolland Charles Dela Cruz Gamez', '2019-12-06 16:07:34.0', 'Logged in successfully.'),
(754, 'Login', 'Rolland Charles Dela Cruz Gamez', '2019-12-07 00:37:17.0', 'Logged in successfully.'),
(755, 'Login', 'Admin  Account', '2019-12-07 00:37:53.0', 'Logged in successfully.'),
(756, 'Login', 'Joseph Christian Bautista Dizon', '2019-12-07 03:17:26.0', 'Logged in successfully.'),
(757, 'Login', 'Rolland Charles Dela Cruz Gamez', '2019-12-07 03:17:42.0', 'Logged in successfully.'),
(758, 'Login', 'Admin  Account', '2019-12-07 03:17:52.0', 'Logged in successfully.'),
(759, 'Login', 'Joseph Christian Bautista Dizon', '2019-12-07 07:53:52.0', 'Logged in successfully.'),
(760, 'Get Queue Ticket', 'Joseph Christian Bautista Dizon', '2019-12-07 07:54:08.0', 'Queue Ticket No. 1 / Document Inquiry'),
(761, 'Login', 'Admin  Account', '2019-12-07 07:54:11.0', 'Logged in successfully.'),
(762, 'Queue Control', 'Admin  Account', '2019-12-07 07:55:15.0', 'Queue No. 0006 listed as Done.'),
(763, 'Login', 'Joseph Christian Bautista Dizon', '2019-12-07 08:49:04.0', 'Logged in successfully.'),
(764, 'Get Queue Ticket', 'Joseph Christian Bautista Dizon', '2019-12-07 09:01:56.0', 'Queue Ticket No. 7 / Document Inquiry'),
(765, 'Login', 'Admin  Account', '2019-12-07 09:02:13.0', 'Logged in successfully.'),
(766, 'Login', 'Rolland Charles Dela Cruz Gamez', '2019-12-07 10:14:50.0', 'Logged in successfully.'),
(767, 'Login', 'Admin  Account', '2020-01-30 03:13:58.0', 'Logged in successfully.'),
(768, 'Login', 'Rolland Charles Dela Cruz Gamez', '2020-02-05 06:49:05.0', 'Logged in successfully.'),
(769, 'Login', 'Admin  Account', '2020-02-05 07:05:50.0', 'Logged in successfully.'),
(770, 'Login', 'Rolland Charles Dela Cruz Gamez', '2020-02-05 07:08:49.0', 'Logged in successfully.'),
(771, 'Login', 'Admin  Account', '2020-02-05 08:54:17.0', 'Logged in successfully.'),
(772, 'Login', 'Rolland Charles Dela Cruz Gamez', '2020-02-05 08:55:59.0', 'Logged in successfully.'),
(773, 'Login', 'Admin  Account', '2020-02-05 09:09:22.0', 'Logged in successfully.'),
(774, 'Login', 'Faculty  Account 2', '2020-02-05 09:25:59.0', 'Logged in successfully.'),
(775, 'Login', 'Rolland Charles Dela Cruz Gamez', '2020-02-06 07:02:38.0', 'Logged in successfully.'),
(776, 'Login', 'Admin  Account', '2020-02-06 07:02:58.0', 'Logged in successfully.'),
(777, 'Queue Control', 'Admin  Account', '2020-02-06 07:03:12.0', 'Queue No. 0007 listed as Done.'),
(778, 'Login', 'Medlynne Villafuerte Cuyugan', '2020-02-06 08:23:01.0', 'Logged in successfully.'),
(779, 'Login', 'Faculty  Account 2', '2020-02-06 08:24:08.0', 'Logged in successfully.'),
(780, 'Post Announcement', 'Faculty  Account 2', '2020-02-06 08:32:50.0', 'Announcement posted successfully.'),
(781, 'Post Announcement', 'Faculty  Account 2', '2020-02-06 08:37:15.0', 'Announcement posted successfully.'),
(782, 'Login', 'Faculty  Account 2', '2020-02-07 15:34:45.0', 'Logged in successfully.'),
(783, 'Login', 'Medlynne Villafuerte Cuyugan', '2020-02-07 15:39:51.0', 'Logged in successfully.'),
(784, 'Login', 'Rolland Charles Dela Cruz Gamez', '2020-02-07 15:54:33.0', 'Logged in successfully.'),
(785, 'Login', 'Medlynne Villafuerte Cuyugan', '2020-02-07 16:04:47.0', 'Logged in successfully.'),
(786, 'Login', 'Rolland Charles Dela Cruz Gamez', '2020-02-07 16:05:06.0', 'Logged in successfully.'),
(787, 'Login', 'Medlynne Villafuerte Cuyugan', '2020-02-07 16:10:18.0', 'Logged in successfully.'),
(788, 'Login', 'Faculty  Account 2', '2020-02-07 16:10:45.0', 'Logged in successfully.'),
(789, 'Login', 'Medlynne Villafuerte Cuyugan', '2020-02-07 16:14:38.0', 'Logged in successfully.'),
(790, 'Login', 'Rolland Charles Dela Cruz Gamez', '2020-02-07 16:16:44.0', 'Logged in successfully.'),
(791, 'Login', 'Medlynne Villafuerte Cuyugan', '2020-02-07 16:18:41.0', 'Logged in successfully.'),
(792, 'Login', 'Rolland Charles Dela Cruz Gamez', '2020-02-07 16:21:54.0', 'Logged in successfully.'),
(793, 'Login', 'Rolland Charles Dela Cruz Gamez', '2020-02-07 16:22:36.0', 'Logged in successfully.'),
(794, 'Login', 'Medlynne Villafuerte Cuyugan', '2020-02-07 16:22:55.0', 'Logged in successfully.'),
(795, 'Login', 'Rolland Charles Dela Cruz Gamez', '2020-02-07 16:23:43.0', 'Logged in successfully.'),
(796, 'Login', 'Rolland Charles Dela Cruz Gamez', '2020-02-07 16:24:52.0', 'Logged in successfully.'),
(797, 'Login', 'Faculty  Account 2', '2020-02-07 16:25:12.0', 'Logged in successfully.'),
(798, 'Post Announcement', 'Faculty  Account 2', '2020-02-07 16:25:27.0', 'Announcement posted successfully.'),
(799, 'Login', 'Rolland Charles Dela Cruz Gamez', '2020-02-07 16:25:39.0', 'Logged in successfully.'),
(800, 'Login', 'Medlynne Villafuerte Cuyugan', '2020-02-07 16:25:50.0', 'Logged in successfully.'),
(801, 'Login', 'Joseph Christian Bautista Dizon', '2020-02-07 16:26:47.0', 'Logged in successfully.'),
(802, 'Login', 'Faculty  Account 2', '2020-02-07 16:26:58.0', 'Logged in successfully.'),
(803, 'Post Announcement', 'Faculty  Account 2', '2020-02-07 16:27:10.0', 'Announcement posted successfully.'),
(804, 'Login', 'Rolland Charles Dela Cruz Gamez', '2020-02-07 16:27:20.0', 'Logged in successfully.'),
(805, 'Login', 'Joseph Christian Bautista Dizon', '2020-02-07 16:27:32.0', 'Logged in successfully.'),
(806, 'Login', 'Medlynne Villafuerte Cuyugan', '2020-02-07 16:27:40.0', 'Logged in successfully.'),
(807, 'Login', 'Admin  Account', '2020-02-07 16:28:48.0', 'Logged in successfully.'),
(808, 'Login', 'Joseph Christian Bautista Dizon', '2020-02-07 16:32:10.0', 'Logged in successfully.'),
(809, 'Login', 'Faculty  Account 2', '2020-02-07 16:32:25.0', 'Logged in successfully.'),
(810, 'Post Announcement', 'Faculty  Account 2', '2020-02-07 16:32:40.0', 'Announcement posted successfully.'),
(811, 'Login', 'Joseph Christian Bautista Dizon', '2020-02-07 16:32:53.0', 'Logged in successfully.'),
(812, 'Login', 'Rolland Charles Dela Cruz Gamez', '2020-02-07 16:33:13.0', 'Logged in successfully.');

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
  `inqueue` int(1) NOT NULL DEFAULT 0,
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
  `inqueue` int(1) NOT NULL DEFAULT 0,
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
  MODIFY `annno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `consultations`
--
ALTER TABLE `consultations`
  MODIFY `conno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `consulthours`
--
ALTER TABLE `consulthours`
  MODIFY `chourno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `consultlogs`
--
ALTER TABLE `consultlogs`
  MODIFY `conno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `doclogs`
--
ALTER TABLE `doclogs`
  MODIFY `docno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
  MODIFY `docno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `fileno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `notif`
--
ALTER TABLE `notif`
  MODIFY `notifno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=259;

--
-- AUTO_INCREMENT for table `queue`
--
ALTER TABLE `queue`
  MODIFY `qno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `queuelogs`
--
ALTER TABLE `queuelogs`
  MODIFY `qno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=176;

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
  MODIFY `ULOGNO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=813;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users_temp`
--
ALTER TABLE `users_temp`
  MODIFY `userno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
