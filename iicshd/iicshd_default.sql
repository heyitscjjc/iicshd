-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 25, 2020 at 03:41 PM
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
-- Table structure for table `updatelogs`
--

CREATE TABLE `updatelogs` (
  `ULOGNO` int(11) NOT NULL,
  `ULOGACT` varchar(250) NOT NULL,
  `ULOGUSER` varchar(250) NOT NULL,
  `ULOGTIME` timestamp(1) NOT NULL DEFAULT CURRENT_TIMESTAMP(1) ON UPDATE CURRENT_TIMESTAMP(1),
  `ULOGNEW` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `updatelogs`
--

INSERT INTO `updatelogs` (`ULOGNO`, `ULOGACT`, `ULOGUSER`, `ULOGTIME`, `ULOGNEW`) VALUES
(1, 'Login', 'Admin  Account', '2020-02-25 14:39:36.0', 'Logged in successfully.');

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

INSERT INTO `users` (`userno`, `userid`, `fname`, `mname`, `lname`, `email`, `password`, `forgotpass`, `role`, `secqno`, `secqa`, `hidden`, `inqueue`, `vcode`, `verified`, `deptno`) VALUES
(1, 'admin', 'Admin', NULL, 'Account', 'admin@ust.edu.ph', '$2y$10$Zklc9S1XCvNQGdYg2LOn8.dVShgTiEJ9xTxLvU7F7VGm8YBjY8u5m', 0, 'admin', 1, '$2y$10$iJaecd1jMFQ7Trh.LdmMSe.x3ghek2gZJNGGtD673NnJnp6KZ3Aau', 0, 0, '7SY1V', 1, 0),
(4, 'faculty', 'Faculty', NULL, 'Account', 'faculty@ust.edu.ph', '$2y$10$6vV.gy0Ln0scm1kKZnQ5WeoT4UcVPcRl6egOOjEOASRdvdEvyK426', 0, 'faculty', 1, '$2y$10$6vV.gy0Ln0scm1kKZnQ5WeoT4UcVPcRl6egOOjEOASRdvdEvyK426', 0, 0, '$2y$10$6vV.gy0Ln0scm1kKZnQ5WeoT4UcVPcRl6egOOjEOASRdvdEvyK426', 1, 0);

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
  `secqno` int(2) NOT NULL,
  `secqa` varchar(256) NOT NULL,
  `hidden` int(1) NOT NULL,
  `inqueue` int(1) NOT NULL DEFAULT '0',
  `vcode` varchar(8) NOT NULL,
  `verified` int(1) NOT NULL,
  `deptname` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  MODIFY `notifno` int(11) NOT NULL AUTO_INCREMENT;

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
-- AUTO_INCREMENT for table `updatelogs`
--
ALTER TABLE `updatelogs`
  MODIFY `ULOGNO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users_temp`
--
ALTER TABLE `users_temp`
  MODIFY `userno` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
