-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 29, 2017 at 01:13 PM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.0.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `emailsmsmain`
--

-- --------------------------------------------------------

--
-- Table structure for table `accgroups`
--

CREATE TABLE `accgroups` (
  `id` int(10) UNSIGNED NOT NULL,
  `groupname` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `parent` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `accgroups`
--

INSERT INTO `accgroups` (`id`, `groupname`, `parent`) VALUES
(1, 'test', 0),
(2, 'testing', 1);

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int(10) NOT NULL,
  `groupid` int(10) DEFAULT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `lname` text COLLATE utf8_unicode_ci NOT NULL,
  `company` text COLLATE utf8_unicode_ci NOT NULL,
  `website` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` text COLLATE utf8_unicode_ci NOT NULL,
  `address1` text COLLATE utf8_unicode_ci NOT NULL,
  `address2` text COLLATE utf8_unicode_ci,
  `state` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `city` text COLLATE utf8_unicode_ci NOT NULL,
  `postcode` text COLLATE utf8_unicode_ci NOT NULL,
  `country` text COLLATE utf8_unicode_ci NOT NULL,
  `phone` text COLLATE utf8_unicode_ci NOT NULL,
  `password` text COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `datecreated` date NOT NULL,
  `email_limit` int(50) NOT NULL DEFAULT '0',
  `sms_limit` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `lastlogin` datetime DEFAULT NULL,
  `email_perm` int(1) NOT NULL DEFAULT '1',
  `sms_perm` int(1) NOT NULL DEFAULT '1',
  `online` int(1) DEFAULT '0',
  `status` enum('Active','Inactive','Closed') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Active',
  `pwresetkey` text COLLATE utf8_unicode_ci NOT NULL,
  `pwresetexpiry` int(10) NOT NULL,
  `emailnotify` enum('Yes','No') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Yes',
  `email_gateway` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `sms_gateway` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `parent` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `groupid`, `name`, `lname`, `company`, `website`, `email`, `address1`, `address2`, `state`, `city`, `postcode`, `country`, `phone`, `password`, `image`, `datecreated`, `email_limit`, `sms_limit`, `lastlogin`, `email_perm`, `sms_perm`, `online`, `status`, `pwresetkey`, `pwresetexpiry`, `emailnotify`, `email_gateway`, `sms_gateway`, `parent`) VALUES
(1, 0, 'gaurav', 'chauhan', 'hicinko', 'hicinko.com', 'testgauravhicinko@gmail.com', 'hn1472  sector 31', 'gurgaon', 'haryana', 'gurgaon', '122001', 'IN', '9650836949', 'acd3d54d9a6131abecc5ae165403a094', '../assets/profile/profile.jpg', '2017-11-20', 997, '15', '2017-11-29 05:12:23', 1, 1, 1, 'Active', '', 0, 'Yes', 'PHPMailer', 'Twilio', 0);

-- --------------------------------------------------------

--
-- Table structure for table `adminperms`
--

CREATE TABLE `adminperms` (
  `roleid` int(1) NOT NULL,
  `permid` int(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `adminperms`
--

INSERT INTO `adminperms` (`roleid`, `permid`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(1, 12),
(1, 13),
(1, 14),
(1, 15),
(1, 16),
(1, 17),
(1, 18),
(1, 19),
(1, 20),
(1, 21),
(1, 22),
(1, 23),
(1, 24),
(1, 25),
(1, 26),
(1, 27),
(1, 28),
(1, 29),
(1, 30),
(1, 31),
(1, 32),
(1, 33),
(1, 34),
(1, 35),
(1, 36),
(1, 37),
(1, 38),
(1, 39),
(1, 40),
(1, 41),
(1, 42),
(1, 43),
(1, 44),
(1, 45),
(1, 46),
(1, 47),
(1, 48),
(1, 49),
(1, 50),
(1, 51),
(1, 52),
(1, 53),
(1, 54);

-- --------------------------------------------------------

--
-- Table structure for table `adminroles`
--

CREATE TABLE `adminroles` (
  `id` int(1) NOT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `adminroles`
--

INSERT INTO `adminroles` (`id`, `name`) VALUES
(1, 'Full Administrator');

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(10) NOT NULL,
  `fname` text NOT NULL,
  `lname` text NOT NULL,
  `username` text NOT NULL,
  `password` varchar(255) NOT NULL DEFAULT '',
  `status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `email` text NOT NULL,
  `image` text,
  `roleid` int(2) NOT NULL,
  `lastlogin` datetime DEFAULT NULL,
  `pwresetkey` text,
  `pwresetexpiry` int(12) DEFAULT NULL,
  `emailnotify` enum('Yes','No') NOT NULL DEFAULT 'Yes',
  `online` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `fname`, `lname`, `username`, `password`, `status`, `email`, `image`, `roleid`, `lastlogin`, `pwresetkey`, `pwresetexpiry`, `emailnotify`, `online`) VALUES
(1, 'Gaurav', 'Chauhan', 'admin', 'acd3d54d9a6131abecc5ae165403a094', 'Active', 'gaurav@hicinko.com', '../assets/admin/man__1_.png', 1, '2017-11-29 05:12:43', NULL, NULL, 'Yes', 1);

-- --------------------------------------------------------

--
-- Table structure for table `appconfig`
--

CREATE TABLE `appconfig` (
  `id` int(11) NOT NULL,
  `setting` text COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `appconfig`
--

INSERT INTO `appconfig` (`id`, `setting`, `value`) VALUES
(1, 'CompanyName', 'gaurav'),
(2, 'Email', 'gaurav@hicinko.com'),
(3, 'sysUrl', 'https://www.hicinko.com/emsystem'),
(4, 'caddress', '<p>hn-1472</p><p>sector 31&nbsp;</p><p>gurgaon</p>'),
(5, 'appStage', 'Live'),
(6, 'SoftwareVersion', '1.0.5'),
(7, 'WebsiteTitle', 'Hicinko Client SMS , EMAIL SYSTEM'),
(8, 'defaultcountry', 'United States of America'),
(9, 'defaultcurrency', 'USD'),
(10, 'defaultcurrencysymbol', '$'),
(11, 'logo', '../assets/uploads/man.png'),
(12, 'admintheme', 'besma'),
(13, 'theme', 'besma'),
(14, 'footerTxt', 'Copyright &copy; Hicinko llc 2014-2019 All Rights Reserved'),
(15, 'BrandName', 'gaurav'),
(16, 'clientlanguage', 'English'),
(17, 'adminlanguage', 'English'),
(18, 'defaultcountrycode', 'BD'),
(19, 'email_perm', '1'),
(20, 'sms_perm', '1'),
(21, 'Client_Registration', '1');

-- --------------------------------------------------------

--
-- Table structure for table `email_logs`
--

CREATE TABLE `email_logs` (
  `id` int(10) NOT NULL,
  `userid` int(10) NOT NULL,
  `email` text COLLATE utf8_unicode_ci NOT NULL,
  `subject` text COLLATE utf8_unicode_ci NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `send_by` int(10) NOT NULL,
  `name_g` text COLLATE utf8_unicode_ci NOT NULL,
  `pnr_g` text COLLATE utf8_unicode_ci NOT NULL,
  `agent_name_g` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `email_logs`
--

INSERT INTO `email_logs` (`id`, `userid`, `email`, `subject`, `message`, `date`, `send_by`, `name_g`, `pnr_g`, `agent_name_g`) VALUES
(38, 1, 'gaurav@hicinko.com', 'sample 1', '<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Strict//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\">\r\n<html xmlns=\"http://www.w3.org/1999/xhtml\" style=\"min-height:100%;background:#f3f3f3\">\r\n\r\n<head>\r\n  <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n</head>\r\n\r\n<body style=\"font-size:16px;min-width:100%;-webkit-text-size-adjust:100%;-ms-text-size-adjust:100%;-moz-box-sizing:border-box;-webkit-box-sizing:border-box;box-sizing:border-box;font-family:\'Circular\', Helvetica, Arial, sans-serif;font-weight:normal;padding:0;margin:0;line-height:1.3;color:#0a0a0a;text-align:left;width:100% !important\">\r\n  <div class=\"preheader\" style=\"mso-hide:all;visibility:hidden;opacity:0;color:transparent;font-size:0px;width:0;height:0;display:none !important\"></div>\r\n  <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\r\n  <meta name=\"viewport\" content=\"width=device-width\">\r\n  \r\n  <style data-roadie-ignore=\"\" data-immutable=\"true\">\r\n    @media only screen and (max-width: 596px) {\r\n      .small-float-center {\r\n        margin: 0 auto !important;\r\n        float: none !important;\r\n        text-align: center !important;\r\n      }\r\n      .small-text-center {\r\n        text-align: center !important;\r\n      }\r\n      .small-text-left {\r\n        text-align: left !important;\r\n      }\r\n      .small-text-right {\r\n        text-align: right !important;\r\n      }\r\n    }\r\n    \r\n    @media only screen and (max-width: 596px) {\r\n      table.body table.container .hide-for-large {\r\n        display: block !important;\r\n        width: auto !important;\r\n        overflow: visible !important;\r\n        max-height: none !important;\r\n      }\r\n    }\r\n    \r\n    @media only screen and (max-width: 596px) {\r\n      table.body table.container .row.hide-for-large,\r\n      table.body table.container .row.hide-for-large {\r\n        display: table !important;\r\n        width: 100% !important;\r\n      }\r\n    }\r\n    \r\n    @media only screen and (max-width: 596px) {\r\n      table.body table.container .show-for-large {\r\n        display: none !important;\r\n        width: 0;\r\n        mso-hide: all;\r\n        overflow: hidden;\r\n      }\r\n    }\r\n    \r\n    @media only screen and (max-width: 596px) {\r\n      table.body img {\r\n        width: auto !important;\r\n        height: auto !important;\r\n      }\r\n      table.body center {\r\n        min-width: 0 !important;\r\n      }\r\n      table.body .container {\r\n        width: 95% !important;\r\n      }\r\n      table.body .columns,\r\n      table.body .column {\r\n        height: auto !important;\r\n        -moz-box-sizing: border-box;\r\n        -webkit-box-sizing: border-box;\r\n        box-sizing: border-box;\r\n        padding-left: 16px !important;\r\n        padding-right: 16px !important;\r\n      }\r\n      table.body .columns .column,\r\n      table.body .columns .columns,\r\n      table.body .column .column,\r\n      table.body .column .columns {\r\n        padding-left: 0 !important;\r\n        padding-right: 0 !important;\r\n      }\r\n      table.body .collapse .columns,\r\n      table.body .collapse .column {\r\n        padding-left: 0 !important;\r\n        padding-right: 0 !important;\r\n      }\r\n      td.small-1,\r\n      th.small-1 {\r\n        display: inline-block !important;\r\n        width: 8.33333% !important;\r\n      }\r\n      td.small-2,\r\n      th.small-2 {\r\n        display: inline-block !important;\r\n        width: 16.66667% !important;\r\n      }\r\n      td.small-3,\r\n      th.small-3 {\r\n        display: inline-block !important;\r\n        width: 25% !important;\r\n      }\r\n      td.small-4,\r\n      th.small-4 {\r\n        display: inline-block !important;\r\n        width: 33.33333% !important;\r\n      }\r\n      td.small-5,\r\n      th.small-5 {\r\n        display: inline-block !important;\r\n        width: 41.66667% !important;\r\n      }\r\n      td.small-6,\r\n      th.small-6 {\r\n        display: inline-block !important;\r\n        width: 50% !important;\r\n      }\r\n      td.small-7,\r\n      th.small-7 {\r\n        display: inline-block !important;\r\n        width: 58.33333% !important;\r\n      }\r\n      td.small-8,\r\n      th.small-8 {\r\n        display: inline-block !important;\r\n        width: 66.66667% !important;\r\n      }\r\n      td.small-9,\r\n      th.small-9 {\r\n        display: inline-block !important;\r\n        width: 75% !important;\r\n      }\r\n      td.small-10,\r\n      th.small-10 {\r\n        display: inline-block !important;\r\n        width: 83.33333% !important;\r\n      }\r\n      td.small-11,\r\n      th.small-11 {\r\n        display: inline-block !important;\r\n        width: 91.66667% !important;\r\n      }\r\n      td.small-12,\r\n      th.small-12 {\r\n        display: inline-block !important;\r\n        width: 100% !important;\r\n      }\r\n      .columns td.small-12,\r\n      .column td.small-12,\r\n      .columns th.small-12,\r\n      .column th.small-12 {\r\n        display: block !important;\r\n        width: 100% !important;\r\n      }\r\n      .body .columns td.small-1,\r\n      .body .column td.small-1,\r\n      td.small-1 center,\r\n      .body .columns th.small-1,\r\n      .body .column th.small-1,\r\n      th.small-1 center {\r\n        display: inline-block !important;\r\n        width: 8.33333% !important;\r\n      }\r\n      .body .columns td.small-2,\r\n      .body .column td.small-2,\r\n      td.small-2 center,\r\n      .body .columns th.small-2,\r\n      .body .column th.small-2,\r\n      th.small-2 center {\r\n        display: inline-block !important;\r\n        width: 16.66667% !important;\r\n      }\r\n      .body .columns td.small-3,\r\n      .body .column td.small-3,\r\n      td.small-3 center,\r\n      .body .columns th.small-3,\r\n      .body .column th.small-3,\r\n      th.small-3 center {\r\n        display: inline-block !important;\r\n        width: 25% !important;\r\n      }\r\n      .body .columns td.small-4,\r\n      .body .column td.small-4,\r\n      td.small-4 center,\r\n      .body .columns th.small-4,\r\n      .body .column th.small-4,\r\n      th.small-4 center {\r\n        display: inline-block !important;\r\n        width: 33.33333% !important;\r\n      }\r\n      .body .columns td.small-5,\r\n      .body .column td.small-5,\r\n      td.small-5 center,\r\n      .body .columns th.small-5,\r\n      .body .column th.small-5,\r\n      th.small-5 center {\r\n        display: inline-block !important;\r\n        width: 41.66667% !important;\r\n      }\r\n      .body .columns td.small-6,\r\n      .body .column td.small-6,\r\n      td.small-6 center,\r\n      .body .columns th.small-6,\r\n      .body .column th.small-6,\r\n      th.small-6 center {\r\n        display: inline-block !important;\r\n        width: 50% !important;\r\n      }\r\n      .body .columns td.small-7,\r\n      .body .column td.small-7,\r\n      td.small-7 center,\r\n      .body .columns th.small-7,\r\n      .body .column th.small-7,\r\n      th.small-7 center {\r\n        display: inline-block !important;\r\n        width: 58.33333% !important;\r\n      }\r\n      .body .columns td.small-8,\r\n      .body .column td.small-8,\r\n      td.small-8 center,\r\n      .body .columns th.small-8,\r\n      .body .column th.small-8,\r\n      th.small-8 center {\r\n        display: inline-block !important;\r\n        width: 66.66667% !important;\r\n      }\r\n      .body .columns td.small-9,\r\n      .body .column td.small-9,\r\n      td.small-9 center,\r\n      .body .columns th.small-9,\r\n      .body .column th.small-9,\r\n      th.small-9 center {\r\n        display: inline-block !important;\r\n        width: 75% !important;\r\n      }\r\n      .body .columns td.small-10,\r\n      .body .column td.small-10,\r\n      td.small-10 center,\r\n      .body .columns th.small-10,\r\n      .body .column th.small-10,\r\n      th.small-10 center {\r\n        display: inline-block !important;\r\n        width: 83.33333% !important;\r\n      }\r\n      .body .columns td.small-11,\r\n      .body .column td.small-11,\r\n      td.small-11 center,\r\n      .body .columns th.small-11,\r\n      .body .column th.small-11,\r\n      th.small-11 center {\r\n        display: inline-block !important;\r\n        width: 91.66667% !important;\r\n      }\r\n      table.body td.small-offset-1,\r\n      table.body th.small-offset-1 {\r\n        margin-left: 8.33333% !important;\r\n        margin-left: 8.33333% !important;\r\n      }\r\n      table.body td.small-offset-2,\r\n      table.body th.small-offset-2 {\r\n        margin-left: 16.66667% !important;\r\n        margin-left: 16.66667% !important;\r\n      }\r\n      table.body td.small-offset-3,\r\n      table.body th.small-offset-3 {\r\n        margin-left: 25% !important;\r\n        margin-left: 25% !important;\r\n      }\r\n      table.body td.small-offset-4,\r\n      table.body th.small-offset-4 {\r\n        margin-left: 33.33333% !important;\r\n        margin-left: 33.33333% !important;\r\n      }\r\n      table.body td.small-offset-5,\r\n      table.body th.small-offset-5 {\r\n        margin-left: 41.66667% !important;\r\n        margin-left: 41.66667% !important;\r\n      }\r\n      table.body td.small-offset-6,\r\n      table.body th.small-offset-6 {\r\n        margin-left: 50% !important;\r\n        margin-left: 50% !important;\r\n      }\r\n      table.body td.small-offset-7,\r\n      table.body th.small-offset-7 {\r\n        margin-left: 58.33333% !important;\r\n        margin-left: 58.33333% !important;\r\n      }\r\n      table.body td.small-offset-8,\r\n      table.body th.small-offset-8 {\r\n        margin-left: 66.66667% !important;\r\n        margin-left: 66.66667% !important;\r\n      }\r\n      table.body td.small-offset-9,\r\n      table.body th.small-offset-9 {\r\n        margin-left: 75% !important;\r\n        margin-left: 75% !important;\r\n      }\r\n      table.body td.small-offset-10,\r\n      table.body th.small-offset-10 {\r\n        margin-left: 83.33333% !important;\r\n        margin-left: 83.33333% !important;\r\n      }\r\n      table.body td.small-offset-11,\r\n      table.body th.small-offset-11 {\r\n        margin-left: 91.66667% !important;\r\n        margin-left: 91.66667% !important;\r\n      }\r\n      table.body table.columns td.expander,\r\n      table.body table.columns th.expander {\r\n        display: none !important;\r\n      }\r\n      table.body .right-text-pad,\r\n      table.body .text-pad-right {\r\n        padding-left: 10px !important;\r\n      }\r\n      table.body .left-text-pad,\r\n      table.body .text-pad-left {\r\n        padding-right: 10px !important;\r\n      }\r\n      table.menu {\r\n        width: 100% !important;\r\n      }\r\n      table.menu td,\r\n      table.menu th {\r\n        width: auto !important;\r\n        display: inline-block !important;\r\n      }\r\n      table.menu.vertical td,\r\n      table.menu.vertical th,\r\n      table.menu.small-vertical td,\r\n      table.menu.small-vertical th {\r\n        display: block !important;\r\n      }\r\n      table.menu[align=\"center\"] {\r\n        width: auto !important;\r\n      }\r\n      table.button.expand {\r\n        width: 100% !important;\r\n      }\r\n    }\r\n    \r\n    @media only screen and (max-width: 596px) {\r\n      .calendar-content {\r\n        padding: 0px !important;\r\n        width: 288px !important;\r\n      }\r\n    \r\n      .not-available-day,\r\n      .calendar-today,\r\n      .available-day {\r\n        height: 40px !important;\r\n        width: 40px !important;\r\n      }\r\n    \r\n      .day-label {\r\n        margin-left: 10% !important;\r\n        margin-top: 0% !important;\r\n        font-size: 15px;\r\n      }\r\n    }\r\n  </style>\r\n  <meta name=\"filler\" content=\"        _      _           _      \">\r\n  <meta name=\"filler\" content=\"       (_)    | |         | |     \">\r\n  <meta name=\"filler\" content=\"   __ _ _ _ __| |__  _ __ | |__   \">\r\n  <meta name=\"filler\" content=\"  / _\' | | \'__| \'_ \\| \'_ \\| \'_ \\  \">\r\n  <meta name=\"filler\" content=\" | (_| | | |  | |_) | | | | |_) | \">\r\n  <meta name=\"filler\" content=\"  \\__,_|_|_|  |_.__/|_| |_|_.__/  \">\r\n  <meta name=\"filler\" content=\"                                  \">\r\n  \r\n  <table class=\"body\" style=\"border-spacing:0;border-collapse:collapse;vertical-align:top;-webkit-hyphens:none;-moz-hyphens:none;hyphens:none;-ms-hyphens:none;font-family:\'Circular\', Helvetica, Arial, sans-serif;font-weight:normal;margin:0;text-align:left;font-size:16px;line-height:19px;background:#f3f3f3;padding:0;width:100%;height:100%;color:#0a0a0a;margin-bottom:0px !important;background-color: white\">\r\n    <tbody><tr style=\"padding:0;vertical-align:top;text-align:left\">\r\n      <td class=\"center\" align=\"center\" valign=\"top\" style=\"font-size:16px;word-wrap:break-word;-webkit-hyphens:auto;-moz-hyphens:auto;hyphens:auto;vertical-align:top;text-align:left;line-height:1.3;color:#0a0a0a;font-family:\'Circular\', Helvetica, Arial, sans-serif;padding:0;margin:0;font-weight:normal;border-collapse:collapse !important\">\r\n        <center style=\"width:100%;min-width:580px\">\r\n          <!--[if mso]>\r\n              <table class=\"container\" width=\"580\">\r\n              <![endif]-->\r\n          <!--[if !mso]>\r\n                <!-- -->\r\n          <table class=\"container\" style=\"border-spacing:0;border-collapse:collapse;padding:0;vertical-align:top;background:#fefefe;width:580px;margin:0 auto;text-align:inherit;max-width:580px;\">\r\n            <!-- <![endif]-->\r\n            <tbody><tr style=\"padding:0;vertical-align:top;text-align:left\">\r\n              <td style=\"font-size:16px;word-wrap:break-word;-webkit-hyphens:auto;-moz-hyphens:auto;hyphens:auto;vertical-align:top;text-align:left;line-height:1.3;color:#0a0a0a;font-family:\'Circular\', Helvetica, Arial, sans-serif;padding:0;margin:0;font-weight:normal;border-collapse:collapse !important\">\r\n                <div>\r\n                  <table class=\"row\" style=\"border-spacing:0;border-collapse:collapse;text-align:left;vertical-align:top;padding:0;width:100%;position:relative;display:table\">\r\n                    <tbody><tr class=\"\" style=\"padding:0;vertical-align:top;text-align:left\">\r\n                      <th class=\"small-12 large-12 columns first last\" style=\"font-size:16px;padding:0;text-align:left;color:#0a0a0a;font-family:\'Circular\', Helvetica, Arial, sans-serif;font-weight:normal;line-height:1.3;margin:0 auto;padding-bottom:16px;width:564px;padding-left:16px;padding-right:16px\">\r\n                        <a href=\"https://www.hicinko.com\" style=\"font-family:\'Circular\', Helvetica, Arial, sans-serif;font-weight:normal;padding:0;margin:0;text-align:left;line-height:1.3;color:#2199e8;text-decoration:none\">\r\n                          <img align=\"center\" alt=\"\" class=\"center standard-header\" height=\"30\" src=\"https://www.hicinko.com/blog/wp-content/uploads/2017/08/Logo.png\" style=\"    display: block;\r\n    outline: none;\r\n    text-decoration: none;\r\n    -ms-interpolation-mode: bicubic;\r\n    width: auto;\r\n    height: 50px;\r\n    max-width: 100%;\r\n    clear: both;\r\n    border: none;\r\n    padding-top: 48px;\r\n    padding-bottom: 16px;\r\n    max-height: 50px;\">\r\n                        </a>\r\n                      </th>\r\n                    </tr>\r\n                  </tbody></table>\r\n                </div>\r\n                <div>\r\n                  <div class=\"headline-body\" style=\"padding-bottom:24px\">\r\n                  <table class=\"row\" style=\"border-spacing:0;border-collapse:collapse;text-align:left;vertical-align:top;padding:0;width:100%;position:relative;display:table\">\r\n                      <tbody><tr class=\"\" style=\"padding:0;vertical-align:top;text-align:left\">\r\n                        <th class=\"small-12 large-12 columns first last\" style=\"font-size:16px;text-align:left;line-height:1.3;color:#0a0a0a;font-family:\'Circular\', Helvetica, Arial, sans-serif;font-weight:normal;padding:0;width:564px;margin:0 auto;padding-left:16px;padding-right:16px;padding-bottom:0px !important\">\r\n                          <p class=\"headline headline-lg heavy max-width-485\" style=\"padding:0;margin:0;text-align:left;font-family:&quot;Circular&quot;, &quot;Helvetica&quot;, Helvetica, Arial, sans-serif;max-width:485px;font-weight:700;color:#484848;line-height:1.3;word-break:keep-all;hyphens:none;-moz-hyphens:none;-webkit-hyphens:none;font-size:32px;-ms-hyphens:none;padding-bottom:8px;margin-bottom:0 !important;\">Hello gaurav chauhan ,</p>\r\n                        </th>\r\n                      </tr>\r\n                    </tbody></table>\r\n                    <table class=\"row\" style=\"border-spacing:0;border-collapse:collapse;text-align:left;vertical-align:top;padding:0;width:100%;position:relative;display:table\">\r\n                      <tbody><tr class=\"\" style=\"padding:0;vertical-align:top;text-align:left\">\r\n                        <th class=\"small-12 large-12 columns first last\" style=\"font-size:16px;text-align:left;line-height:1.3;color:#0a0a0a;font-family:\'Circular\', Helvetica, Arial, sans-serif;font-weight:normal;padding:0;width:564px;margin:0 auto;padding-left:16px;padding-right:16px;padding-bottom:0px !important\">\r\n                          <p class=\"headline headline-lg heavy max-width-485\" style=\"padding:0;margin:0;text-align:left;font-family:&quot;Circular&quot;, &quot;Helvetica&quot;, Helvetica, Arial, sans-serif;max-width:485px;font-weight:700;color:#484848;line-height:1.3;word-break:keep-all;hyphens:none;-moz-hyphens:none;-webkit-hyphens:none;font-size:32px;-ms-hyphens:none;padding-bottom:8px;margin-bottom:0 !important;\">Your reservation is confirmed</p>\r\n                        </th>\r\n                      </tr>\r\n                    </tbody></table>\r\n                    <table class=\"row\" style=\"border-spacing:0;border-collapse:collapse;text-align:left;vertical-align:top;padding:0;width:100%;position:relative;display:table\">\r\n                      <tbody><tr class=\"\" style=\"padding:0;vertical-align:top;text-align:left\">\r\n                        <th class=\"small-12 large-12 columns first last\" style=\"font-size:16px;text-align:left;line-height:1.3;color:#0a0a0a;font-family:\'Circular\', Helvetica, Arial, sans-serif;font-weight:normal;padding:0;width:564px;margin:0 auto;padding-left:16px;padding-right:16px;padding-bottom:0px !important\">\r\n                          <p class=\"body  body-lg body-link-rausch light text-left   \" style=\"font-family:\'Circular\', Helvetica, Arial, sans-serif;padding:0;margin:0;line-height:1.4;font-weight:300;color:#484848;font-size:18px;hyphens:none;-ms-hyphens:none;-webkit-hyphens:none;-moz-hyphens:none;text-align:left;margin-bottom:0px !important;\"></p>\r\n                        </th>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </div>\r\n                </div>\r\n                <div>\r\n                  <table class=\"row\" style=\"border-spacing:0;border-collapse:collapse;text-align:left;vertical-align:top;padding:0;width:100%;position:relative;display:table\">\r\n                    <tbody><tr class=\"\" style=\"padding:0;vertical-align:top;text-align:left\">\r\n                      <th class=\"small-12 large-12 columns first last\" style=\"font-size:16px;padding:0;text-align:left;color:#0a0a0a;font-family:\'Circular\', Helvetica, Arial, sans-serif;font-weight:normal;line-height:1.3;margin:0 auto;padding-bottom:16px;width:564px;padding-left:16px;padding-right:16px\">\r\n                        <a href=\"https://www.hicinko.com/\" style=\"font-family:\'Circular\', Helvetica, Arial, sans-serif;font-weight:normal;padding:0;margin:0;text-align:left;line-height:1.3;color:#2199e8;text-decoration:none\">\r\n                          <img src=\"https://a0.muscache.com/im/pictures/3a4e6241-7bd2-47e0-8f67-5c3c6e21d20a.jpg?aki_policy=large\" class=\"row-pad-bot-1\" style=\"display:block;outline:none;text-decoration:none;-ms-interpolation-mode:bicubic;width:auto;clear:both;max-width:100%;border:none;padding-bottom:8px !important\">\r\n                        </a>\r\n                      </th>\r\n                    </tr>\r\n                  </tbody></table>\r\n                  \r\n                </div>\r\n                \r\n                \r\n                \r\n                \r\n                \r\n                \r\n                \r\n                \r\n                \r\n                \r\n                <div>\r\n                  <table class=\"row\" style=\"border-spacing:0;border-collapse:collapse;text-align:left;vertical-align:top;padding:0;width:100%;position:relative;display:table;\">\r\n                    <tbody style=\"\r\n\"><tr class=\"\" style=\"padding:0;vertical-align:top;text-align:left\">\r\n                      <th class=\"small-12 large-12 columns first last\" style=\"border-top: 4px solid;font-size:16px;padding:0;text-align:left;color:#0a0a0a;font-family:\'Circular\', Helvetica, Arial, sans-serif;font-weight:normal;line-height:1.3;margin:0 auto;padding-bottom:16px;width:564px;padding-left:16px;padding-right:16px;\">\r\n                        <hr class=\"full-divider\" style=\"clear:both;max-width:580px;border-right:0;border-top:0;border-left:0;margin:20px auto;border-bottom:1px solid #cacaca;background-color:#dbdbdb;height:1px;border:none;width:100%;margin-top:0;margin-bottom:0\">\r\n                      </th>\r\n                    </tr>\r\n                  </tbody></table>\r\n                </div>\r\n                <div style=\"padding-top:8px;padding-bottom:8px\">\r\n                  <table class=\"row\" style=\"border-spacing:0;border-collapse:collapse;text-align:left;vertical-align:top;padding:0;width:100%;position:relative;display:table\">\r\n                    <tbody><tr><th class=\"small-7 large-7 columns first\" style=\"font-size:16px;text-align:left;line-height:1.3;font-family:\'Circular\', Helvetica, Arial, sans-serif;font-weight:normal;padding:0;color:#0a0a0a;padding-right:8px;margin:0 auto;padding-bottom:16px;width:322.33333px;padding-left:16px\">\r\n                      <p class=\" body-text-lg light \" style=\"margin:0;text-align:left;padding:0;font-weight:300;font-family:&quot;Circular&quot;, &quot;Helvetica&quot;, Helvetica, Arial, sans-serif;color:#484848;word-break:normal;line-height:1.2;font-size:24px;margin-bottom:0px !important\">Reservation Code</p>\r\n                    </th>\r\n                    <th class=\"small-5 large-5 columns last valign-top\" style=\"font-size:16px;text-align:left;line-height:1.3;color:#0a0a0a;font-family:\'Circular\', Helvetica, Arial, sans-serif;font-weight:normal;padding:0;vertical-align:top;width:225.66667px;padding-left:16px;margin:0 auto;padding-bottom:16px;padding-right:16px\">\r\n                      <p class=\" body-text-lg light text-right\" style=\"padding:0;margin:0;font-size:24px;font-weight:300;font-family:&quot;Circular&quot;, &quot;Helvetica&quot;, Helvetica, Arial, sans-serif;color:#484848;word-break:normal;line-height:1.2;text-align:right;margin-bottom:0px !important\">AAAAA1</p>\r\n                    </th>\r\n                  </tr></tbody></table>\r\n                </div>\r\n                <div>\r\n                  <table class=\"row\" style=\"border-spacing:0;border-collapse:collapse;text-align:left;vertical-align:top;padding:0;width:100%;position:relative;display:table\">\r\n                    <tbody><tr class=\"\" style=\"padding:0;vertical-align:top;text-align:left\">\r\n                      <th class=\"small-12 large-12 columns first last\" style=\"font-size:16px;padding:0;text-align:left;color:#0a0a0a;font-family:\'Circular\', Helvetica, Arial, sans-serif;font-weight:normal;line-height:1.3;margin:0 auto;padding-bottom:16px;width:564px;padding-left:16px;padding-right:16px\">\r\n                        <hr class=\"full-divider\" style=\"clear:both;max-width:580px;border-right:0;border-top:0;border-left:0;margin:20px auto;border-bottom:1px solid #cacaca;background-color:#dbdbdb;height:1px;border:none;width:100%;margin-top:0;margin-bottom:0\">\r\n                      </th>\r\n                    </tr>\r\n                  </tbody></table>\r\n                </div>\r\n                <div style=\"padding-top:16px;padding-bottom:32px\">\r\n                  <table class=\"row\" style=\"border-spacing:0;border-collapse:collapse;text-align:left;vertical-align:top;padding:0;width:100%;position:relative;display:table\">\r\n                    <tbody><tr style=\"padding:0;vertical-align:top;text-align:left\">\r\n                      <th class=\"col-pad-left-2 col-pad-right-2\" style=\"color:#0a0a0a;font-family:\'Circular\', Helvetica, Arial, sans-serif;font-weight:normal;padding:0;margin:0;text-align:left;font-size:16px;line-height:1.3;padding-left:16px;padding-right:16px\">\r\n                        <a href=\"tel:18004836015\" class=\"btn-secondary btn-lg\" style=\"font-family: \'Circular\', Helvetica, Arial, sans-serif;\r\n    font-weight: normal;\r\n    margin: 0;\r\n    text-align: left;\r\n    line-height: 1.3;\r\n    text-decoration: none;\r\n    border: 5px solid black;\r\n    -webkit-border-radius: 3px;\r\n    border-radius: 4px;\r\n    padding: 19px 24px 19px 24px;\r\n    display: block;\r\n    width: auto !important;\r\n    background: #fcb12c;\">\r\n                          <p class=\"text-center\" style=\"font-weight:700;padding:0;margin:0;text-align:center;color:black;font-family:&quot;Circular&quot;, &quot;Helvetica&quot;, Helvetica, Arial, sans-serif;font-size:24px;line-height:32px;margin-bottom:0px !important\">Change Your Reservation</p>\r\n                        </a>\r\n                      </th>\r\n                    </tr>\r\n                  </tbody></table>\r\n                </div>\r\n                <div style=\"padding-top:24px;padding-bottom:24px\">\r\n                  <table class=\"row\" style=\"border-spacing:0;border-collapse:collapse;text-align:left;vertical-align:top;padding:0;width:100%;position:relative;display:table\">\r\n                    <tbody><tr><th class=\"small-10 large-10 columns first\" style=\"font-size:16px;text-align:left;line-height:1.3;font-family:\'Circular\', Helvetica, Arial, sans-serif;font-weight:normal;padding:0;color:#0a0a0a;padding-right:8px;margin:0 auto;padding-bottom:16px;width:467.33333px;padding-left:16px\">\r\n                      <p class=\"body-text-lg heavy row-pad-bot-1\" style=\"padding:0;margin:0;text-align:left;font-size:24px;font-weight:700;font-family:&quot;Circular&quot;, &quot;Helvetica&quot;, Helvetica, Arial, sans-serif;color:#484848;word-break:normal;line-height:1.2;padding-bottom:8px !important;margin-bottom:0px !important\">Bruce is your host</p>\r\n                      <p class=\"body-text light row-pad-bot-4\" style=\"padding:0;margin:0;text-align:left;padding-bottom:32px;font-weight:300;font-family:&quot;Circular&quot;, &quot;Helvetica&quot;, Helvetica, Arial, sans-serif;color:#484848;word-break:normal;line-height:1.4;font-size:18px;margin-bottom:0px !important\">Contact Bruce for further assistance .</p>\r\n                      <p class=\"body-text light\" style=\"margin:0;text-align:left;padding:0;font-weight:300;font-family:&quot;Circular&quot;, &quot;Helvetica&quot;, Helvetica, Arial, sans-serif;color:#484848;word-break:normal;line-height:1.4;font-size:18px;margin-bottom:0px !important\"> <span>\r\n        </span></p><p class=\"color-rausch light\" style=\"font-family:\'Circular\', Helvetica, Arial, sans-serif;padding:0;margin:0;text-align:left;line-height:1.3;text-decoration:none;font-weight:300;color:#ff5a5f !important\">\r\n          Connect to Host\r\n        \r\n      \r\n                        <span class=\"dot\" style=\"font-size:8px;vertical-align:middle;padding-left:8px;padding-right:8px\">\r\n         â€¢ \r\n      </span>\r\n                        <span>\r\n        <a href=\"tel:18004836015\" class=\"color-rausch light\" style=\"font-family:\'Circular\', Helvetica, Arial, sans-serif;padding:0;margin:0;text-align:left;line-height:1.3;text-decoration:none;font-weight:300;color:#ff5a5f !important\">\r\n          +1 (800) 483-6015\r\n        </a>\r\n      </span>\r\n\r\n                      </p>\r\n                    </th>\r\n                    <th class=\"small-2 large-2 columns last\" style=\"font-size:16px;text-align:left;color:#0a0a0a;font-family:\'Circular\', Helvetica, Arial, sans-serif;font-weight:normal;padding:0;line-height:1.3;width:80.66667px;padding-left:16px;margin:0 auto;padding-bottom:16px;padding-right:16px\">\r\n                      <p style=\"font-family:\'Circular\', Helvetica, Arial, sans-serif;font-weight:normal;padding:0;margin:0;text-align:left;line-height:1.3;color:#2199e8;text-decoration:none\">\r\n                        <img src=\"http://www.vanstons.co.uk/images/image/Shirts/Men%20The%20most%20fashionable%20Long%20Sleeve%20Shirt%20with%20Necktie%20-%20Well%20Suited%20Shirts%20Light%20blue%20-%20WE647AA40NJB5934%2019278.jpg\" class=\"profile-img\" style=\"display:block;outline:none;text-decoration:none;-ms-interpolation-mode:bicubic;width:auto;clear:both;border:none;max-width:115px;border-radius:50%;max-height:115px\">\r\n                        <img alt=\"\" class=\"width-77 row-pad-top-2\" src=\"\" style=\"display:block;outline:none;text-decoration:none;-ms-interpolation-mode:bicubic;clear:both;border:none;width:77px;padding-top:16px;max-width:77px\">\r\n                      \r\n                    </p></th>\r\n                  </tr></tbody></table>\r\n                </div>\r\n                <div style=\"padding-bottom:24px\">\r\n                  <table class=\"row\" style=\"border-spacing:0;border-collapse:collapse;text-align:left;vertical-align:top;padding:0;width:100%;position:relative;display:table\">\r\n                    <tbody><tr class=\"\" style=\"padding:0;vertical-align:top;text-align:left\">\r\n                      <th class=\"small-12 large-12 columns first last\" style=\"font-size:16px;padding:0;text-align:left;color:#0a0a0a;font-family:\'Circular\', Helvetica, Arial, sans-serif;font-weight:normal;line-height:1.3;margin:0 auto;padding-bottom:16px;width:564px;padding-left:16px;padding-right:16px\">\r\n                        <hr class=\"partial-divider\" style=\"max-width:580px;clear:both;border-top:0;border-bottom:1px solid #cacaca;border-left:0;margin:20px auto;border-right:0;background-color:#dbdbdb;height:1px;border:none;width:50px;margin-top:0;margin-bottom:0;float:left\">\r\n                      </th>\r\n                    </tr>\r\n                  </tbody></table>\r\n                </div>\r\n                <div style=\"padding-bottom:24px\">\r\n                  <table class=\"row\" style=\"border-spacing:0;border-collapse:collapse;text-align:left;vertical-align:top;padding:0;width:100%;position:relative;display:table\">\r\n                    <tbody><tr class=\"\" style=\"padding:0;vertical-align:top;text-align:left\">\r\n                      <th class=\"small-12 large-12 columns first last\" style=\"font-size:16px;padding:0;text-align:left;color:#0a0a0a;font-family:\'Circular\', Helvetica, Arial, sans-serif;font-weight:normal;line-height:1.3;margin:0 auto;padding-bottom:16px;width:564px;padding-left:16px;padding-right:16px\">\r\n                        <p class=\"body-text-lg heavy row-pad-bot-1\" style=\"padding:0;margin:0;text-align:left;font-size:24px;font-weight:700;font-family:&quot;Circular&quot;, &quot;Helvetica&quot;, Helvetica, Arial, sans-serif;color:#484848;word-break:normal;line-height:1.2;padding-bottom:8px !important;margin-bottom:0px !important\">Know what to do next</p>\r\n                        <p class=\"body-text light row-pad-bot-4\" style=\"padding:0;margin:0;text-align:left;padding-bottom:32px;font-weight:300;font-family:&quot;Circular&quot;, &quot;Helvetica&quot;, Helvetica, Arial, sans-serif;color:#484848;word-break:normal;line-height:1.4;font-size:18px;margin-bottom:0px !important\">Make sure to review our services rendered to your satisfaction. </p>\r\n                        <div class=\"body-text light\" style=\"border: 5px solid black;\r\n    background: #fcb12c;\r\n    margin: 0;\r\n    text-align: left;\r\n    padding: 8px;\r\n    font-weight: 300;\r\n    font-family: \" circular\",=\"\" \"helvetica\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" black;=\"\" word-break:=\"\" normal;=\"\" line-height:=\"\" 1.4;=\"\" font-size:=\"\" 18px;=\"\" margin-bottom:=\"\" 0px=\"\" !important;=\"\" display:=\"\" inline-block!important;\"=\"\">\r\n                          <a target=\"_blank\" href=\"https://www.trustpilot.com/review/hicinko.com\" class=\"color-rausch light\" style=\"font-family:\'Circular\', Helvetica, Arial, sans-serif;padding:0;margin:0;line-height:1.3;text-decoration:none;font-weight:700;color:black !important;font-size: 30px;padding-left: 122px;\">Review Our Services</a>\r\n                        </div>\r\n                      </th>\r\n                    </tr>\r\n                  </tbody></table>\r\n                </div>\r\n                \r\n                \r\n                \r\n                \r\n                \r\n                \r\n                \r\n                \r\n                <div style=\"padding-top:56px\">\r\n                  <table class=\"row\" style=\"border-spacing:0;border-collapse:collapse;text-align:left;vertical-align:top;padding:0;width:100%;position:relative;display:table;border-top: 5px solid;\">\r\n                    <tbody><tr class=\"\" style=\"padding:0;vertical-align:top;text-align:left\">\r\n                      <th class=\"small-12 large-12 columns first last standard-footer-padding\" style=\"font-size:16px;text-align:left;line-height:1.3;color:#0a0a0a;font-family:\'Circular\', Helvetica, Arial, sans-serif;font-weight:normal;padding:0;margin:0 auto;padding-bottom:16px;width:564px;padding-left:16px;padding-right:16px\">\r\n                        <hr class=\"standard-footer-hr\" style=\"clear:both;max-width:580px;border-right:0;border-bottom:1px solid #cacaca;border-left:0;border-top:0;background-color:#dbdbdb;height:2px;width:100%;border:none;margin:auto\">\r\n                        <div class=\"row-pad-bot-4\" style=\"padding-bottom:32px\"></div>\r\n                        <p class=\"standard-footer-text center \" style=\"font-family:&quot;Circular&quot;, &quot;Helvetica&quot;, Helvetica, Arial, sans-serif;padding:0;margin:0;text-align:left;margin-bottom:10px;color:#9ca299;font-size:14px;text-shadow:0 1px #fff;font-weight:300;line-height:1.4\">Sent with <span style=\"color: #fcb12c;\r\n    font-size: 22px;\">â™¥</span> from Reservation Team</p>\r\n                        <p class=\"standard-footer-text \" style=\"font-family:&quot;Circular&quot;, &quot;Helvetica&quot;, Helvetica, Arial, sans-serif;padding:0;margin:0;text-align:left;margin-bottom:10px;color:#9ca299;font-size:14px;text-shadow:0 1px #fff;font-weight:300;line-height:1.4\">â€Œ1501 Broadway Floor 12th, New York City, NY, 10036</p>\r\n                        <p class=\"standard-footer-text \" style=\"font-family:&quot;Circular&quot;, &quot;Helvetica&quot;, Helvetica, Arial, sans-serif;padding:0;margin:0;text-align:left;margin-bottom:10px;color:#9ca299;font-size:14px;text-shadow:0 1px #fff;font-weight:300;line-height:1.4\">\r\n                          \r\n                        </p>\r\n                        <p class=\"standard-footer-text \" style=\"font-family:&quot;Circular&quot;, &quot;Helvetica&quot;, Helvetica, Arial, sans-serif;padding:0;margin:0;text-align:left;margin-bottom:10px;color:#9ca299;font-size:14px;text-shadow:0 1px #fff;font-weight:300;line-height:1.4\"></p>\r\n                      </th>\r\n                    </tr>\r\n                  </tbody></table>\r\n                </div>\r\n              </td>\r\n            </tr>\r\n          </tbody></table>\r\n        </center>\r\n      </td>\r\n    </tr>\r\n  </tbody></table>\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n</body>\r\n\r\n</html>', '2017-11-29 10:25:57', 1, 'gaurav chauhan', 'AAAAA1', 'gaurav chauhan');

-- --------------------------------------------------------

--
-- Table structure for table `email_providers`
--

CREATE TABLE `email_providers` (
  `id` int(10) NOT NULL,
  `name` text NOT NULL,
  `host_name` text,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `port` text,
  `status` int(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `email_providers`
--

INSERT INTO `email_providers` (`id`, `name`, `host_name`, `username`, `password`, `port`, `status`) VALUES
(1, 'PHPMailer', 'smtp.gmail.com', 'testgauravhicinko@gmail.com', 'gaurav.rock', '587', 1),
(2, 'SendGrid', 'https://api.sendgrid.com/', 'User Name', 'Password', '587', 1),
(3, 'MailGun', 'smtp.mailgun.org', 'User Name', 'Password', '587', 1);

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `id` int(11) NOT NULL,
  `tplname` varchar(128) NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT '1',
  `subject` text NOT NULL,
  `message` text NOT NULL,
  `send` tinyint(1) DEFAULT '1',
  `core` enum('Yes','No') DEFAULT 'Yes',
  `hidden` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `tplname`, `language_id`, `subject`, `message`, `send`, `core`, `hidden`) VALUES
(1, 'Customer SignUp', 1, 'Welcome to {{business_name}}', '<div style=\"margin:0;padding:0\"> \n<table cellspacing=\"0\" cellpadding=\"0\" width=\"100%\" border=\"0\" bgcolor=\"#439cc8\">\n  <tbody><tr>\n    <td align=\"center\">\n            <table cellspacing=\"0\" cellpadding=\"0\" width=\"672\" border=\"0\">\n              <tbody><tr>\n                <td height=\"95\" bgcolor=\"#439cc8\" style=\"background:#439cc8;text-align:left\">\n                <table cellspacing=\"0\" cellpadding=\"0\" width=\"672\" border=\"0\">\n                      <tbody><tr>\n                        <td width=\"672\" height=\"40\" style=\"font-size:40px;line-height:40px;height:40px;text-align:left\"></td>\n                      </tr>\n                      <tr>\n                        <td style=\"text-align:left\">                        \n                        <table cellspacing=\"0\" cellpadding=\"0\" width=\"672\" border=\"0\">\n                          <tbody><tr>\n                            <td width=\"37\" height=\"24\" style=\"font-size:40px;line-height:40px;height:40px;text-align:left\">\n                            </td>\n                            <td width=\"523\" height=\"24\" style=\"text-align:left\">\n                            <div width=\"125\" height=\"23\" style=\"display:block;color:#ffffff;font-size:20px;font-family:Arial,Helvetica,sans-serif;max-width:557px;min-height:auto\">{{business_name}}</div>\n                            </td>\n                            <td width=\"44\" style=\"text-align:left\"></td>\n                            <td width=\"30\" style=\"text-align:left\"></td>\n                            <td width=\"38\" height=\"24\" style=\"font-size:40px;line-height:40px;height:40px;text-align:left\"></td>\n                          </tr>\n                        </tbody></table>\n                        </td>\n                      </tr>\n                      <tr><td width=\"672\" height=\"33\" style=\"font-size:33px;line-height:33px;height:33px;text-align:left\"></td></tr>\n                    </tbody></table>\n                \n                </td>\n              </tr>\n            </tbody></table>\n     </td>\n    </tr>\n </tbody></table>  \n  \n <table cellspacing=\"0\" cellpadding=\"0\" width=\"100%\" bgcolor=\"#439cc8\"><tbody><tr><td height=\"5\" style=\"background:#439cc8;height:5px;font-size:5px;line-height:5px\"></td></tr></tbody></table>\n       \n <table cellspacing=\"0\" cellpadding=\"0\" width=\"100%\" border=\"0\" bgcolor=\"#e9eff0\">\n  <tbody><tr>\n    <td align=\"center\">\n      <table cellspacing=\"0\" cellpadding=\"0\" width=\"671\" border=\"0\" bgcolor=\"#e9eff0\" style=\"background:#e9eff0\">\n        <tbody><tr>\n          <td width=\"38\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\"></td>\n          <td width=\"596\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\"></td>\n          <td width=\"37\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\"></td>\n        </tr>\n        <tr>\n          <td width=\"38\" height=\"40\" style=\"font-size:40px;line-height:40px;height:40px;text-align:left\"></td>\n          <td style=\"text-align:left\"><table cellspacing=\"0\" cellpadding=\"0\" width=\"596\" border=\"0\" bgcolor=\"#ffffff\">\n            <tbody><tr>\n              <td width=\"20\" height=\"26\" style=\"font-size:26px;line-height:26px;height:26px;text-align:left\"></td>\n              <td width=\"556\" height=\"26\" style=\"font-size:26px;line-height:26px;height:26px;text-align:left\"></td>\n              <td width=\"20\" height=\"26\" style=\"font-size:26px;line-height:26px;height:26px;text-align:left\"></td>\n            </tr>\n            <tr>\n              <td width=\"20\" height=\"26\" style=\"font-size:26px;line-height:26px;height:26px;text-align:left\"></td>\n              <td width=\"556\" style=\"text-align:left\"><table cellspacing=\"0\" cellpadding=\"0\" width=\"556\" border=\"0\" style=\"font-family:helvetica,arial,sans-seif;color:#666666;font-size:16px;line-height:22px\">\n                <tbody><tr>\n                  <td style=\"text-align:left\"></td>\n                </tr>\n                <tr>\n                  <td style=\"text-align:left\"><table cellspacing=\"0\" cellpadding=\"0\" width=\"556\" border=\"0\">\n                    <tbody><tr><td style=\"font-family:helvetica,arial,sans-serif;font-size:30px;line-height:40px;font-weight:normal;color:#253c44;text-align:left\"></td></tr>\n                    <tr><td width=\"556\" height=\"20\" style=\"font-size:20px;line-height:20px;height:20px;text-align:left\"></td></tr>\n                    <tr>\n                      <td style=\"text-align:left\">\n                 Hi {{name}},<br>\n                 <br>\n                Thanks for signing up to {{business_name}}! This message is an automated reply to your registration request. Login to your account to set up your all details by using the details below:\n            <br>\n                <a target=\"_blank\" style=\"color:#ff6600;font-weight:bold;font-family:helvetica,arial,sans-seif;text-decoration:none\" href=\"{{sys_url}}\">{{sys_url}}</a>.<br>\n                                    Email: {{username}}<br>\n                                    Password: {{password}} \n            <br>\n            Regards,<br>\n            The Team at {{business_name}}<br>\n            <br>\n          </td>\n                    </tr>\n                    <tr>\n                      <td width=\"556\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\">&nbsp;</td>\n                    </tr>\n                  </tbody></table></td>\n                </tr>\n              </tbody></table></td>\n              <td width=\"20\" height=\"26\" style=\"font-size:26px;line-height:26px;height:26px;text-align:left\"></td>\n            </tr>\n            <tr>\n              <td width=\"20\" height=\"2\" bgcolor=\"#d9dfe1\" style=\"background-color:#d9dfe1;font-size:2px;line-height:2px;height:2px;text-align:left\"></td>\n              <td width=\"556\" height=\"2\" bgcolor=\"#d9dfe1\" style=\"background-color:#d9dfe1;font-size:2px;line-height:2px;height:2px;text-align:left\"></td>\n              <td width=\"20\" height=\"2\" bgcolor=\"#d9dfe1\" style=\"background-color:#d9dfe1;font-size:2px;line-height:2px;height:2px;text-align:left\"></td>\n            </tr>\n          </tbody></table></td>\n          <td width=\"37\" height=\"40\" style=\"font-size:40px;line-height:40px;height:40px;text-align:left\"></td>\n        </tr>\n        <tr>\n          <td width=\"38\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\"></td>\n          <td width=\"596\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\"></td>\n          <td width=\"37\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\"></td>\n        </tr>\n      </tbody></table>\n  </td></tr>\n</tbody>\n</table>\n<table cellspacing=\"0\" cellpadding=\"0\" width=\"100%\" border=\"0\" bgcolor=\"#273f47\"><tbody><tr><td align=\"center\">&nbsp;</td></tr></tbody></table>\n<table cellspacing=\"0\" cellpadding=\"0\" width=\"100%\" border=\"0\" bgcolor=\"#364a51\">\n  <tbody><tr>\n    <td align=\"center\">\n       <table cellspacing=\"0\" cellpadding=\"0\" width=\"672\" border=\"0\" bgcolor=\"#364a51\">\n              <tbody><tr>\n              <td width=\"38\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\"></td>\n          <td width=\"569\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\"></td>\n          <td width=\"38\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\"></td>\n              </tr>\n              <tr>\n                <td width=\"38\" height=\"40\" style=\"font-size:40px;line-height:40px;text-align:left\">\n                </td>\n                <td valign=\"top\" style=\"font-family:helvetica,arial,sans-seif;font-size:12px;line-height:16px;color:#949fa3;text-align:left\">Copyright &copy; {{business_name}}, All rights reserved.<br><br><br></td>\n                <td width=\"38\" height=\"40\" style=\"font-size:40px;line-height:40px;text-align:left\"></td>\n              </tr>\n              <tr>\n              <td width=\"38\" height=\"40\" style=\"font-size:40px;line-height:40px;text-align:left\"></td>\n              <td width=\"569\" height=\"40\" style=\"font-size:40px;line-height:40px;text-align:left\"></td>              \n                <td width=\"38\" height=\"40\" style=\"font-size:40px;line-height:40px;text-align:left\"></td>\n              </tr>\n            </tbody></table>\n     </td>\n  </tr>\n</tbody></table><div class=\"yj6qo\"></div><div class=\"adL\">\n     \n</div></div>\n', 1, 'Yes', 0),
(2, 'Ticket For Customer', 1, 'New Ticket From {{business_name}}', '<div style=\"margin:0;padding:0\"> \n<table cellspacing=\"0\" cellpadding=\"0\" width=\"100%\" border=\"0\" bgcolor=\"#439cc8\">\n  <tbody><tr>\n    <td align=\"center\">\n            <table cellspacing=\"0\" cellpadding=\"0\" width=\"672\" border=\"0\">\n              <tbody><tr>\n                <td height=\"95\" bgcolor=\"#439cc8\" style=\"background:#439cc8;text-align:left\">\n                <table cellspacing=\"0\" cellpadding=\"0\" width=\"672\" border=\"0\">\n                      <tbody><tr>\n                        <td width=\"672\" height=\"40\" style=\"font-size:40px;line-height:40px;height:40px;text-align:left\"></td>\n                      </tr>\n                      <tr>\n                        <td style=\"text-align:left\">                        \n                        <table cellspacing=\"0\" cellpadding=\"0\" width=\"672\" border=\"0\">\n                          <tbody><tr>\n                            <td width=\"37\" height=\"24\" style=\"font-size:40px;line-height:40px;height:40px;text-align:left\">\n                            </td>\n                            <td width=\"523\" height=\"24\" style=\"text-align:left\">\n                            <div width=\"125\" height=\"23\" style=\"display:block;color:#ffffff;font-size:20px;font-family:Arial,Helvetica,sans-serif;max-width:557px;min-height:auto\" >{{business_name}}</div>\n                            </td>\n                            <td width=\"44\" style=\"text-align:left\"></td>\n                            <td width=\"30\" style=\"text-align:left\"></td>\n                            <td width=\"38\" height=\"24\" style=\"font-size:40px;line-height:40px;height:40px;text-align:left\"></td>\n                          </tr>\n                        </tbody></table>\n                        </td>\n                      </tr>\n                      <tr><td width=\"672\" height=\"33\" style=\"font-size:33px;line-height:33px;height:33px;text-align:left\"></td></tr>\n                    </tbody></table>\n                \n                </td>\n              </tr>\n            </tbody></table>\n     </td>\n    </tr>\n </tbody></table>  \n  \n <table cellspacing=\"0\" cellpadding=\"0\" width=\"100%\" bgcolor=\"#439cc8\"><tbody><tr><td height=\"5\" style=\"background:#439cc8;height:5px;font-size:5px;line-height:5px\"></td></tr></tbody></table>\n       \n <table cellspacing=\"0\" cellpadding=\"0\" width=\"100%\" border=\"0\" bgcolor=\"#e9eff0\">\n  <tbody><tr>\n    <td align=\"center\">\n      <table cellspacing=\"0\" cellpadding=\"0\" width=\"671\" border=\"0\" bgcolor=\"#e9eff0\" style=\"background:#e9eff0\">\n        <tbody><tr>\n          <td width=\"38\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\"></td>\n          <td width=\"596\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\"></td>\n          <td width=\"37\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\"></td>\n        </tr>\n        <tr>\n          <td width=\"38\" height=\"40\" style=\"font-size:40px;line-height:40px;height:40px;text-align:left\"></td>\n          <td style=\"text-align:left\"><table cellspacing=\"0\" cellpadding=\"0\" width=\"596\" border=\"0\" bgcolor=\"#ffffff\">\n            <tbody><tr>\n              <td width=\"20\" height=\"26\" style=\"font-size:26px;line-height:26px;height:26px;text-align:left\"></td>\n              <td width=\"556\" height=\"26\" style=\"font-size:26px;line-height:26px;height:26px;text-align:left\"></td>\n              <td width=\"20\" height=\"26\" style=\"font-size:26px;line-height:26px;height:26px;text-align:left\"></td>\n            </tr>\n            <tr>\n              <td width=\"20\" height=\"26\" style=\"font-size:26px;line-height:26px;height:26px;text-align:left\"></td>\n              <td width=\"556\" style=\"text-align:left\"><table cellspacing=\"0\" cellpadding=\"0\" width=\"556\" border=\"0\" style=\"font-family:helvetica,arial,sans-seif;color:#666666;font-size:16px;line-height:22px\">\n                <tbody><tr>\n                  <td style=\"text-align:left\"></td>\n                </tr>\n                <tr>\n                  <td style=\"text-align:left\"><table cellspacing=\"0\" cellpadding=\"0\" width=\"556\" border=\"0\">\n                    <tbody><tr><td style=\"font-family:helvetica,arial,sans-serif;font-size:30px;line-height:40px;font-weight:normal;color:#253c44;text-align:left\"></td></tr>\n                    <tr><td width=\"556\" height=\"20\" style=\"font-size:20px;line-height:20px;height:20px;text-align:left\"></td></tr>\n                    <tr>\n                      <td style=\"text-align:left\">\n                 Hi {{name}},<br>\n                 <br>\n                Thank you for stay with us! This is a Support Ticket For Yours.. Login to your account to view  your support tickets details:\n            <br>\n                <a target=\"_blank\" style=\"color:#ff6600;font-weight:bold;font-family:helvetica,arial,sans-seif;text-decoration:none\" href=\"{{sys_url}}\">{{sys_url}}</a>.<br>\n                Ticket ID: {{ticket_id}}<br>\n                Ticket Subject: {{ticket_subject}}<br>\n                Message: {{message}}<br>\n                Created By: {{create_by}} \n            <br>\n            Regards,<br>\n            The Team at {{business_name}}<br>\n            <br>\n          </td>\n                    </tr>\n                    <tr>\n                      <td width=\"556\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\">Â </td>\n                    </tr>\n                  </tbody></table></td>\n                </tr>\n              </tbody></table></td>\n              <td width=\"20\" height=\"26\" style=\"font-size:26px;line-height:26px;height:26px;text-align:left\"></td>\n            </tr>\n            <tr>\n              <td width=\"20\" height=\"2\" bgcolor=\"#d9dfe1\" style=\"background-color:#d9dfe1;font-size:2px;line-height:2px;height:2px;text-align:left\"></td>\n              <td width=\"556\" height=\"2\" bgcolor=\"#d9dfe1\" style=\"background-color:#d9dfe1;font-size:2px;line-height:2px;height:2px;text-align:left\"></td>\n              <td width=\"20\" height=\"2\" bgcolor=\"#d9dfe1\" style=\"background-color:#d9dfe1;font-size:2px;line-height:2px;height:2px;text-align:left\"></td>\n            </tr>\n          </tbody></table></td>\n          <td width=\"37\" height=\"40\" style=\"font-size:40px;line-height:40px;height:40px;text-align:left\"></td>\n        </tr>\n        <tr>\n          <td width=\"38\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\"></td>\n          <td width=\"596\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\"></td>\n          <td width=\"37\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\"></td>\n        </tr>\n      </tbody></table>\n  </td></tr>\n</tbody>\n</table>\n<table cellspacing=\"0\" cellpadding=\"0\" width=\"100%\" border=\"0\" bgcolor=\"#273f47\"><tbody><tr><td align=\"center\">Â </td></tr></tbody></table>\n<table cellspacing=\"0\" cellpadding=\"0\" width=\"100%\" border=\"0\" bgcolor=\"#364a51\">\n  <tbody><tr>\n    <td align=\"center\">\n       <table cellspacing=\"0\" cellpadding=\"0\" width=\"672\" border=\"0\" bgcolor=\"#364a51\">\n              <tbody><tr>\n              <td width=\"38\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\"></td>\n          <td width=\"569\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\"></td>\n          <td width=\"38\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\"></td>\n              </tr>\n              <tr>\n                <td width=\"38\" height=\"40\" style=\"font-size:40px;line-height:40px;text-align:left\">\n                </td>\n                <td valign=\"top\" style=\"font-family:helvetica,arial,sans-seif;font-size:12px;line-height:16px;color:#949fa3;text-align:left\">Copyright Â© {{business_name}}, All rights reserved.<br><br><br></td>\n                <td width=\"38\" height=\"40\" style=\"font-size:40px;line-height:40px;text-align:left\"></td>\n              </tr>\n              <tr>\n              <td width=\"38\" height=\"40\" style=\"font-size:40px;line-height:40px;text-align:left\"></td>\n              <td width=\"569\" height=\"40\" style=\"font-size:40px;line-height:40px;text-align:left\"></td>              \n                <td width=\"38\" height=\"40\" style=\"font-size:40px;line-height:40px;text-align:left\"></td>\n              </tr>\n            </tbody></table>\n     </td>\n  </tr>\n</tbody></table><div class=\"yj6qo\"></div><div class=\"adL\">\n     \n</div></div>\n', 1, 'Yes', 0),
(3, 'Add New Administration', 1, 'Welcome To {{business_name}} Administration', '<div style=\"margin:0;padding:0\"> \n<table cellspacing=\"0\" cellpadding=\"0\" width=\"100%\" border=\"0\" bgcolor=\"#439cc8\">\n  <tbody><tr>\n    <td align=\"center\">\n            <table cellspacing=\"0\" cellpadding=\"0\" width=\"672\" border=\"0\">\n              <tbody><tr>\n                <td height=\"95\" bgcolor=\"#439cc8\" style=\"background:#439cc8;text-align:left\">\n                <table cellspacing=\"0\" cellpadding=\"0\" width=\"672\" border=\"0\">\n                      <tbody><tr>\n                        <td width=\"672\" height=\"40\" style=\"font-size:40px;line-height:40px;height:40px;text-align:left\"></td>\n                      </tr>\n                      <tr>\n                        <td style=\"text-align:left\">                        \n                        <table cellspacing=\"0\" cellpadding=\"0\" width=\"672\" border=\"0\">\n                          <tbody><tr>\n                            <td width=\"37\" height=\"24\" style=\"font-size:40px;line-height:40px;height:40px;text-align:left\">\n                            </td>\n                            <td width=\"523\" height=\"24\" style=\"text-align:left\">\n                            <p  style=\"display:block;color:#ffffff;font-size:20px;font-family:Arial,Helvetica,sans-serif;max-width:557px;min-height:auto\" >{{business_name}}</p>\n                            </td>\n                            <td width=\"44\" style=\"text-align:left\"></td>\n                            <td width=\"30\" style=\"text-align:left\"></td>\n                            <td width=\"38\" height=\"24\" style=\"font-size:40px;line-height:40px;height:40px;text-align:left\"></td>\n                          </tr>\n                        </tbody></table>\n                        </td>\n                      </tr>\n                      <tr><td width=\"672\" height=\"33\" style=\"font-size:33px;line-height:33px;height:33px;text-align:left\"></td></tr>\n                    </tbody></table>\n                \n                </td>\n              </tr>\n            </tbody></table>\n     </td>\n    </tr>\n </tbody></table>  \n  \n <table cellspacing=\"0\" cellpadding=\"0\" width=\"100%\" bgcolor=\"#439cc8\"><tbody><tr><td height=\"5\" style=\"background:#439cc8;height:5px;font-size:5px;line-height:5px\"></td></tr></tbody></table>\n       \n <table cellspacing=\"0\" cellpadding=\"0\" width=\"100%\" border=\"0\" bgcolor=\"#e9eff0\">\n  <tbody><tr>\n    <td align=\"center\">\n      <table cellspacing=\"0\" cellpadding=\"0\" width=\"671\" border=\"0\" bgcolor=\"#e9eff0\" style=\"background:#e9eff0\">\n        <tbody><tr>\n          <td width=\"38\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\"></td>\n          <td width=\"596\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\"></td>\n          <td width=\"37\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\"></td>\n        </tr>\n        <tr>\n          <td width=\"38\" height=\"40\" style=\"font-size:40px;line-height:40px;height:40px;text-align:left\"></td>\n          <td style=\"text-align:left\"><table cellspacing=\"0\" cellpadding=\"0\" width=\"596\" border=\"0\" bgcolor=\"#ffffff\">\n            <tbody><tr>\n              <td width=\"20\" height=\"26\" style=\"font-size:26px;line-height:26px;height:26px;text-align:left\"></td>\n              <td width=\"556\" height=\"26\" style=\"font-size:26px;line-height:26px;height:26px;text-align:left\"></td>\n              <td width=\"20\" height=\"26\" style=\"font-size:26px;line-height:26px;height:26px;text-align:left\"></td>\n            </tr>\n            <tr>\n              <td width=\"20\" height=\"26\" style=\"font-size:26px;line-height:26px;height:26px;text-align:left\"></td>\n              <td width=\"556\" style=\"text-align:left\"><table cellspacing=\"0\" cellpadding=\"0\" width=\"556\" border=\"0\" style=\"font-family:helvetica,arial,sans-seif;color:#666666;font-size:16px;line-height:22px\">\n                <tbody><tr>\n                  <td style=\"text-align:left\"></td>\n                </tr>\n                <tr>\n                  <td style=\"text-align:left\"><table cellspacing=\"0\" cellpadding=\"0\" width=\"556\" border=\"0\">\n                    <tbody><tr><td style=\"font-family:helvetica,arial,sans-serif;font-size:30px;line-height:40px;font-weight:normal;color:#253c44;text-align:left\"></td></tr>\n                    <tr><td width=\"556\" height=\"20\" style=\"font-size:20px;line-height:20px;height:20px;text-align:left\"></td></tr>\n                    <tr>\n                      <td style=\"text-align:left\">\n                 Hi {{name}},<br>\n                 <br>\n                Welcome to {{business_name}} Administration!  This message is an automated reply to your administration registration request. Login to your account to set up your all details by using the details below:\n            <br>\n                <a target=\"_blank\" style=\"color:#ff6600;font-weight:bold;font-family:helvetica,arial,sans-seif;text-decoration:none\" href=\" {{sys_url}}/admin\"> {{sys_url}}/admin</a>.<br>\n                                    Email: {{username}}<br>\n                                    Password: {{password}} \n            <br>\n            On behalf of the {{business_name}},<br>\n            The Team at {{business_name}}<br>\n            <br>\n          </td>\n                    </tr>\n                    <tr>\n                      <td width=\"556\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\">&nbsp;</td>\n                    </tr>\n                  </tbody></table></td>\n                </tr>\n              </tbody></table></td>\n              <td width=\"20\" height=\"26\" style=\"font-size:26px;line-height:26px;height:26px;text-align:left\"></td>\n            </tr>\n            <tr>\n              <td width=\"20\" height=\"2\" bgcolor=\"#d9dfe1\" style=\"background-color:#d9dfe1;font-size:2px;line-height:2px;height:2px;text-align:left\"></td>\n              <td width=\"556\" height=\"2\" bgcolor=\"#d9dfe1\" style=\"background-color:#d9dfe1;font-size:2px;line-height:2px;height:2px;text-align:left\"></td>\n              <td width=\"20\" height=\"2\" bgcolor=\"#d9dfe1\" style=\"background-color:#d9dfe1;font-size:2px;line-height:2px;height:2px;text-align:left\"></td>\n            </tr>\n          </tbody></table></td>\n          <td width=\"37\" height=\"40\" style=\"font-size:40px;line-height:40px;height:40px;text-align:left\"></td>\n        </tr>\n        <tr>\n          <td width=\"38\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\"></td>\n          <td width=\"596\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\"></td>\n          <td width=\"37\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\"></td>\n        </tr>\n      </tbody></table>\n  </td></tr>\n</tbody>\n</table>\n<table cellspacing=\"0\" cellpadding=\"0\" width=\"100%\" border=\"0\" bgcolor=\"#273f47\"><tbody><tr><td align=\"center\">&nbsp;</td></tr></tbody></table>\n<table cellspacing=\"0\" cellpadding=\"0\" width=\"100%\" border=\"0\" bgcolor=\"#364a51\">\n  <tbody><tr>\n    <td align=\"center\">\n       <table cellspacing=\"0\" cellpadding=\"0\" width=\"672\" border=\"0\" bgcolor=\"#364a51\">\n              <tbody><tr>\n              <td width=\"38\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\"></td>\n          <td width=\"569\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\"></td>\n          <td width=\"38\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\"></td>\n              </tr>\n              <tr>\n                <td width=\"38\" height=\"40\" style=\"font-size:40px;line-height:40px;text-align:left\">\n                </td>\n                <td valign=\"top\" style=\"font-family:helvetica,arial,sans-seif;font-size:12px;line-height:16px;color:#949fa3;text-align:left\">Copyright &copy; {{business_name}}, All rights reserved.<br><br><br></td>\n                <td width=\"38\" height=\"40\" style=\"font-size:40px;line-height:40px;text-align:left\"></td>\n              </tr>\n              <tr>\n              <td width=\"38\" height=\"40\" style=\"font-size:40px;line-height:40px;text-align:left\"></td>\n              <td width=\"569\" height=\"40\" style=\"font-size:40px;line-height:40px;text-align:left\"></td>              \n                <td width=\"38\" height=\"40\" style=\"font-size:40px;line-height:40px;text-align:left\"></td>\n              </tr>\n            </tbody></table>\n     </td>\n  </tr>\n</tbody></table><div class=\"yj6qo\"></div><div class=\"adL\">\n     \n</div></div>\n', 1, 'Yes', 0),
(4, 'Admin Password Reset', 1, '{{business_name}} New Password', '<div style=\"margin:0;padding:0\"> \n<table cellspacing=\"0\" cellpadding=\"0\" width=\"100%\" border=\"0\" bgcolor=\"#439cc8\">\n  <tbody><tr>\n    <td align=\"center\">\n            <table cellspacing=\"0\" cellpadding=\"0\" width=\"672\" border=\"0\">\n              <tbody><tr>\n                <td height=\"95\" bgcolor=\"#439cc8\" style=\"background:#439cc8;text-align:left\">\n                <table cellspacing=\"0\" cellpadding=\"0\" width=\"672\" border=\"0\">\n                      <tbody><tr>\n                        <td width=\"672\" height=\"40\" style=\"font-size:40px;line-height:40px;height:40px;text-align:left\"></td>\n                      </tr>\n                      <tr>\n                        <td style=\"text-align:left\">                        \n                        <table cellspacing=\"0\" cellpadding=\"0\" width=\"672\" border=\"0\">\n                          <tbody><tr>\n                            <td width=\"37\" height=\"24\" style=\"font-size:40px;line-height:40px;height:40px;text-align:left\">\n                            </td>\n                            <td width=\"523\" height=\"24\" style=\"text-align:left\">\n                            <p  style=\"display:block;color:#ffffff;font-size:20px;font-family:Arial,Helvetica,sans-serif;max-width:557px;min-height:auto\">{{business_name}}</p>\n                            </td>\n                            <td width=\"44\" style=\"text-align:left\"></td>\n                            <td width=\"30\" style=\"text-align:left\"></td>\n                            <td width=\"38\" height=\"24\" style=\"font-size:40px;line-height:40px;height:40px;text-align:left\"></td>\n                          </tr>\n                        </tbody></table>\n                        </td>\n                      </tr>\n                      <tr><td width=\"672\" height=\"33\" style=\"font-size:33px;line-height:33px;height:33px;text-align:left\"></td></tr>\n                    </tbody></table>\n                \n                </td>\n              </tr>\n            </tbody></table>\n     </td>\n    </tr>\n </tbody></table>  \n  \n <table cellspacing=\"0\" cellpadding=\"0\" width=\"100%\" bgcolor=\"#439cc8\"><tbody><tr><td height=\"5\" style=\"background:#439cc8;height:5px;font-size:5px;line-height:5px\"></td></tr></tbody></table>\n       \n <table cellspacing=\"0\" cellpadding=\"0\" width=\"100%\" border=\"0\" bgcolor=\"#e9eff0\">\n  <tbody><tr>\n    <td align=\"center\">\n      <table cellspacing=\"0\" cellpadding=\"0\" width=\"671\" border=\"0\" bgcolor=\"#e9eff0\" style=\"background:#e9eff0\">\n        <tbody><tr>\n          <td width=\"38\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\"></td>\n          <td width=\"596\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\"></td>\n          <td width=\"37\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\"></td>\n        </tr>\n        <tr>\n          <td width=\"38\" height=\"40\" style=\"font-size:40px;line-height:40px;height:40px;text-align:left\"></td>\n          <td style=\"text-align:left\"><table cellspacing=\"0\" cellpadding=\"0\" width=\"596\" border=\"0\" bgcolor=\"#ffffff\">\n            <tbody><tr>\n              <td width=\"20\" height=\"26\" style=\"font-size:26px;line-height:26px;height:26px;text-align:left\"></td>\n              <td width=\"556\" height=\"26\" style=\"font-size:26px;line-height:26px;height:26px;text-align:left\"></td>\n              <td width=\"20\" height=\"26\" style=\"font-size:26px;line-height:26px;height:26px;text-align:left\"></td>\n            </tr>\n            <tr>\n              <td width=\"20\" height=\"26\" style=\"font-size:26px;line-height:26px;height:26px;text-align:left\"></td>\n              <td width=\"556\" style=\"text-align:left\"><table cellspacing=\"0\" cellpadding=\"0\" width=\"556\" border=\"0\" style=\"font-family:helvetica,arial,sans-seif;color:#666666;font-size:16px;line-height:22px\">\n                <tbody><tr>\n                  <td style=\"text-align:left\"></td>\n                </tr>\n                <tr>\n                  <td style=\"text-align:left\"><table cellspacing=\"0\" cellpadding=\"0\" width=\"556\" border=\"0\">\n                    <tbody><tr><td style=\"font-family:helvetica,arial,sans-serif;font-size:30px;line-height:40px;font-weight:normal;color:#253c44;text-align:left\"></td></tr>\n                    <tr><td width=\"556\" height=\"20\" style=\"font-size:20px;line-height:20px;height:20px;text-align:left\"></td></tr>\n                    <tr>\n                      <td style=\"text-align:left\">\n                 Hi {{name}},<br>\n                 <br>\n                Password Reset Successfuly!   This message is an automated reply to your password reset request. Login to your account to set up your all details by using the details below:\n            <br>\n                <a target=\"_blank\" style=\"color:#ff6600;font-weight:bold;font-family:helvetica,arial,sans-seif;text-decoration:none\" href=\" {{sys_url}}\"> {{sys_url}}</a>.<br>\n                                    User Name: {{username}}<br>\n                                    Password: {{password}} \n            <br>\n            On behalf of the {{business_name}},<br>\n            The Team at {{business_name}}<br>\n            <br>\n          </td>\n                    </tr>\n                    <tr>\n                      <td width=\"556\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\">&nbsp;</td>\n                    </tr>\n                  </tbody></table></td>\n                </tr>\n              </tbody></table></td>\n              <td width=\"20\" height=\"26\" style=\"font-size:26px;line-height:26px;height:26px;text-align:left\"></td>\n            </tr>\n            <tr>\n              <td width=\"20\" height=\"2\" bgcolor=\"#d9dfe1\" style=\"background-color:#d9dfe1;font-size:2px;line-height:2px;height:2px;text-align:left\"></td>\n              <td width=\"556\" height=\"2\" bgcolor=\"#d9dfe1\" style=\"background-color:#d9dfe1;font-size:2px;line-height:2px;height:2px;text-align:left\"></td>\n              <td width=\"20\" height=\"2\" bgcolor=\"#d9dfe1\" style=\"background-color:#d9dfe1;font-size:2px;line-height:2px;height:2px;text-align:left\"></td>\n            </tr>\n          </tbody></table></td>\n          <td width=\"37\" height=\"40\" style=\"font-size:40px;line-height:40px;height:40px;text-align:left\"></td>\n        </tr>\n        <tr>\n          <td width=\"38\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\"></td>\n          <td width=\"596\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\"></td>\n          <td width=\"37\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\"></td>\n        </tr>\n      </tbody></table>\n  </td></tr>\n</tbody>\n</table>\n<table cellspacing=\"0\" cellpadding=\"0\" width=\"100%\" border=\"0\" bgcolor=\"#273f47\"><tbody><tr><td align=\"center\">&nbsp;</td></tr></tbody></table>\n<table cellspacing=\"0\" cellpadding=\"0\" width=\"100%\" border=\"0\" bgcolor=\"#364a51\">\n  <tbody><tr>\n    <td align=\"center\">\n       <table cellspacing=\"0\" cellpadding=\"0\" width=\"672\" border=\"0\" bgcolor=\"#364a51\">\n              <tbody><tr>\n              <td width=\"38\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\"></td>\n          <td width=\"569\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\"></td>\n          <td width=\"38\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\"></td>\n              </tr>\n              <tr>\n                <td width=\"38\" height=\"40\" style=\"font-size:40px;line-height:40px;text-align:left\">\n                </td>\n                <td valign=\"top\" style=\"font-family:helvetica,arial,sans-seif;font-size:12px;line-height:16px;color:#949fa3;text-align:left\">Copyright &copy; {{business_name}}, All rights reserved.<br><br><br></td>\n                <td width=\"38\" height=\"40\" style=\"font-size:40px;line-height:40px;text-align:left\"></td>\n              </tr>\n              <tr>\n              <td width=\"38\" height=\"40\" style=\"font-size:40px;line-height:40px;text-align:left\"></td>\n              <td width=\"569\" height=\"40\" style=\"font-size:40px;line-height:40px;text-align:left\"></td>              \n                <td width=\"38\" height=\"40\" style=\"font-size:40px;line-height:40px;text-align:left\"></td>\n              </tr>\n            </tbody></table>\n     </td>\n  </tr>\n</tbody></table><div class=\"yj6qo\"></div><div class=\"adL\">\n     \n</div></div>\n', 1, 'Yes', 0),
(5, 'Forgot Admin Password', 1, '{{business_name}} password change request', '<div style=\"margin:0;padding:0\"> \n<table cellspacing=\"0\" cellpadding=\"0\" width=\"100%\" border=\"0\" bgcolor=\"#439cc8\">\n  <tbody><tr>\n    <td align=\"center\">\n            <table cellspacing=\"0\" cellpadding=\"0\" width=\"672\" border=\"0\">\n              <tbody><tr>\n                <td height=\"95\" bgcolor=\"#439cc8\" style=\"background:#439cc8;text-align:left\">\n                <table cellspacing=\"0\" cellpadding=\"0\" width=\"672\" border=\"0\">\n                      <tbody><tr>\n                        <td width=\"672\" height=\"40\" style=\"font-size:40px;line-height:40px;height:40px;text-align:left\"></td>\n                      </tr>\n                      <tr>\n                        <td style=\"text-align:left\">                        \n                        <table cellspacing=\"0\" cellpadding=\"0\" width=\"672\" border=\"0\">\n                          <tbody><tr>\n                            <td width=\"37\" height=\"24\" style=\"font-size:40px;line-height:40px;height:40px;text-align:left\">\n                            </td>\n                            <td width=\"523\" height=\"24\" style=\"text-align:left\">\n                            <p  style=\"display:block;color:#ffffff;font-size:20px;font-family:Arial,Helvetica,sans-serif;max-width:557px;min-height:auto\" >{{business_name}}</p>\n                            </td>\n                            <td width=\"44\" style=\"text-align:left\"></td>\n                            <td width=\"30\" style=\"text-align:left\"></td>\n                            <td width=\"38\" height=\"24\" style=\"font-size:40px;line-height:40px;height:40px;text-align:left\"></td>\n                          </tr>\n                        </tbody></table>\n                        </td>\n                      </tr>\n                      <tr><td width=\"672\" height=\"33\" style=\"font-size:33px;line-height:33px;height:33px;text-align:left\"></td></tr>\n                    </tbody></table>\n                \n                </td>\n              </tr>\n            </tbody></table>\n     </td>\n    </tr>\n </tbody></table>  \n  \n <table cellspacing=\"0\" cellpadding=\"0\" width=\"100%\" bgcolor=\"#439cc8\"><tbody><tr><td height=\"5\" style=\"background:#439cc8;height:5px;font-size:5px;line-height:5px\"></td></tr></tbody></table>\n       \n <table cellspacing=\"0\" cellpadding=\"0\" width=\"100%\" border=\"0\" bgcolor=\"#e9eff0\">\n  <tbody><tr>\n    <td align=\"center\">\n      <table cellspacing=\"0\" cellpadding=\"0\" width=\"671\" border=\"0\" bgcolor=\"#e9eff0\" style=\"background:#e9eff0\">\n        <tbody><tr>\n          <td width=\"38\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\"></td>\n          <td width=\"596\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\"></td>\n          <td width=\"37\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\"></td>\n        </tr>\n        <tr>\n          <td width=\"38\" height=\"40\" style=\"font-size:40px;line-height:40px;height:40px;text-align:left\"></td>\n          <td style=\"text-align:left\"><table cellspacing=\"0\" cellpadding=\"0\" width=\"596\" border=\"0\" bgcolor=\"#ffffff\">\n            <tbody><tr>\n              <td width=\"20\" height=\"26\" style=\"font-size:26px;line-height:26px;height:26px;text-align:left\"></td>\n              <td width=\"556\" height=\"26\" style=\"font-size:26px;line-height:26px;height:26px;text-align:left\"></td>\n              <td width=\"20\" height=\"26\" style=\"font-size:26px;line-height:26px;height:26px;text-align:left\"></td>\n            </tr>\n            <tr>\n              <td width=\"20\" height=\"26\" style=\"font-size:26px;line-height:26px;height:26px;text-align:left\"></td>\n              <td width=\"556\" style=\"text-align:left\"><table cellspacing=\"0\" cellpadding=\"0\" width=\"556\" border=\"0\" style=\"font-family:helvetica,arial,sans-seif;color:#666666;font-size:16px;line-height:22px\">\n                <tbody><tr>\n                  <td style=\"text-align:left\"></td>\n                </tr>\n                <tr>\n                  <td style=\"text-align:left\"><table cellspacing=\"0\" cellpadding=\"0\" width=\"556\" border=\"0\">\n                    <tbody><tr><td style=\"font-family:helvetica,arial,sans-serif;font-size:30px;line-height:40px;font-weight:normal;color:#253c44;text-align:left\"></td></tr>\n                    <tr><td width=\"556\" height=\"20\" style=\"font-size:20px;line-height:20px;height:20px;text-align:left\"></td></tr>\n                    <tr>\n                      <td style=\"text-align:left\">\n                 Hi {{name}},<br>\n                 <br>\n                Password Reset Successfuly!   This message is an automated reply to your password reset request. Click this linke to reset your password:\n            <br>\n                <a target=\"_blank\" style=\"color:#ff6600;font-weight:bold;font-family:helvetica,arial,sans-seif;text-decoration:none\" href=\" {{forgotpw_link}} \"> {{forgotpw_link}} </a>.<br>\nNotes: Until your password has been changed, your current password will remain valid. The Forgot Password Link will be available for a limited time only.\n\n            <br>\n            On behalf of the {{business_name}},<br>\n            The Team at {{business_name}}<br>\n            <br>\n          </td>\n                    </tr>\n                    <tr>\n                      <td width=\"556\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\">&nbsp;</td>\n                    </tr>\n                  </tbody></table></td>\n                </tr>\n              </tbody></table></td>\n              <td width=\"20\" height=\"26\" style=\"font-size:26px;line-height:26px;height:26px;text-align:left\"></td>\n            </tr>\n            <tr>\n              <td width=\"20\" height=\"2\" bgcolor=\"#d9dfe1\" style=\"background-color:#d9dfe1;font-size:2px;line-height:2px;height:2px;text-align:left\"></td>\n              <td width=\"556\" height=\"2\" bgcolor=\"#d9dfe1\" style=\"background-color:#d9dfe1;font-size:2px;line-height:2px;height:2px;text-align:left\"></td>\n              <td width=\"20\" height=\"2\" bgcolor=\"#d9dfe1\" style=\"background-color:#d9dfe1;font-size:2px;line-height:2px;height:2px;text-align:left\"></td>\n            </tr>\n          </tbody></table></td>\n          <td width=\"37\" height=\"40\" style=\"font-size:40px;line-height:40px;height:40px;text-align:left\"></td>\n        </tr>\n        <tr>\n          <td width=\"38\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\"></td>\n          <td width=\"596\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\"></td>\n          <td width=\"37\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\"></td>\n        </tr>\n      </tbody></table>\n  </td></tr>\n</tbody>\n</table>\n<table cellspacing=\"0\" cellpadding=\"0\" width=\"100%\" border=\"0\" bgcolor=\"#273f47\"><tbody><tr><td align=\"center\">&nbsp;</td></tr></tbody></table>\n<table cellspacing=\"0\" cellpadding=\"0\" width=\"100%\" border=\"0\" bgcolor=\"#364a51\">\n  <tbody><tr>\n    <td align=\"center\">\n       <table cellspacing=\"0\" cellpadding=\"0\" width=\"672\" border=\"0\" bgcolor=\"#364a51\">\n              <tbody><tr>\n              <td width=\"38\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\"></td>\n          <td width=\"569\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\"></td>\n          <td width=\"38\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\"></td>\n              </tr>\n              <tr>\n                <td width=\"38\" height=\"40\" style=\"font-size:40px;line-height:40px;text-align:left\">\n                </td>\n                <td valign=\"top\" style=\"font-family:helvetica,arial,sans-seif;font-size:12px;line-height:16px;color:#949fa3;text-align:left\">Copyright &copy; {{business_name}}, All rights reserved.<br><br><br></td>\n                <td width=\"38\" height=\"40\" style=\"font-size:40px;line-height:40px;text-align:left\"></td>\n              </tr>\n              <tr>\n              <td width=\"38\" height=\"40\" style=\"font-size:40px;line-height:40px;text-align:left\"></td>\n              <td width=\"569\" height=\"40\" style=\"font-size:40px;line-height:40px;text-align:left\"></td>              \n                <td width=\"38\" height=\"40\" style=\"font-size:40px;line-height:40px;text-align:left\"></td>\n              </tr>\n            </tbody></table>\n     </td>\n  </tr>\n</tbody></table><div class=\"yj6qo\"></div><div class=\"adL\">\n     \n</div></div>\n', 1, 'Yes', 0);
INSERT INTO `email_templates` (`id`, `tplname`, `language_id`, `subject`, `message`, `send`, `core`, `hidden`) VALUES
(6, 'Ticket Reply', 1, 'Reply to Ticket [TID-{{ticket_id}}]', '<div style=\"margin:0;padding:0\"> \n<table cellspacing=\"0\" cellpadding=\"0\" width=\"100%\" border=\"0\" bgcolor=\"#439cc8\">\n  <tbody><tr>\n    <td align=\"center\">\n            <table cellspacing=\"0\" cellpadding=\"0\" width=\"672\" border=\"0\">\n              <tbody><tr>\n                <td height=\"95\" bgcolor=\"#439cc8\" style=\"background:#439cc8;text-align:left\">\n                <table cellspacing=\"0\" cellpadding=\"0\" width=\"672\" border=\"0\">\n                      <tbody><tr>\n                        <td width=\"672\" height=\"40\" style=\"font-size:40px;line-height:40px;height:40px;text-align:left\"></td>\n                      </tr>\n                      <tr>\n                        <td style=\"text-align:left\">                        \n                        <table cellspacing=\"0\" cellpadding=\"0\" width=\"672\" border=\"0\">\n                          <tbody><tr>\n                            <td width=\"37\" height=\"24\" style=\"font-size:40px;line-height:40px;height:40px;text-align:left\">\n                            </td>\n                            <td width=\"523\" height=\"24\" style=\"text-align:left\">\n                            <div width=\"125\" height=\"23\" style=\"display:block;color:#ffffff;font-size:20px;font-family:Arial,Helvetica,sans-serif;max-width:557px;min-height:auto\"  {{business_name}} ></div>\n                            </td>\n                            <td width=\"44\" style=\"text-align:left\"></td>\n                            <td width=\"30\" style=\"text-align:left\"></td>\n                            <td width=\"38\" height=\"24\" style=\"font-size:40px;line-height:40px;height:40px;text-align:left\"></td>\n                          </tr>\n                        </tbody></table>\n                        </td>\n                      </tr>\n                      <tr><td width=\"672\" height=\"33\" style=\"font-size:33px;line-height:33px;height:33px;text-align:left\"></td></tr>\n                    </tbody></table>\n                \n                </td>\n              </tr>\n            </tbody></table>\n     </td>\n    </tr>\n </tbody></table>  \n  \n <table cellspacing=\"0\" cellpadding=\"0\" width=\"100%\" bgcolor=\"#439cc8\"><tbody><tr><td height=\"5\" style=\"background:#439cc8;height:5px;font-size:5px;line-height:5px\"></td></tr></tbody></table>\n       \n <table cellspacing=\"0\" cellpadding=\"0\" width=\"100%\" border=\"0\" bgcolor=\"#e9eff0\">\n  <tbody><tr>\n    <td align=\"center\">\n      <table cellspacing=\"0\" cellpadding=\"0\" width=\"671\" border=\"0\" bgcolor=\"#e9eff0\" style=\"background:#e9eff0\">\n        <tbody><tr>\n          <td width=\"38\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\"></td>\n          <td width=\"596\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\"></td>\n          <td width=\"37\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\"></td>\n        </tr>\n        <tr>\n          <td width=\"38\" height=\"40\" style=\"font-size:40px;line-height:40px;height:40px;text-align:left\"></td>\n          <td style=\"text-align:left\"><table cellspacing=\"0\" cellpadding=\"0\" width=\"596\" border=\"0\" bgcolor=\"#ffffff\">\n            <tbody><tr>\n              <td width=\"20\" height=\"26\" style=\"font-size:26px;line-height:26px;height:26px;text-align:left\"></td>\n              <td width=\"556\" height=\"26\" style=\"font-size:26px;line-height:26px;height:26px;text-align:left\"></td>\n              <td width=\"20\" height=\"26\" style=\"font-size:26px;line-height:26px;height:26px;text-align:left\"></td>\n            </tr>\n            <tr>\n              <td width=\"20\" height=\"26\" style=\"font-size:26px;line-height:26px;height:26px;text-align:left\"></td>\n              <td width=\"556\" style=\"text-align:left\"><table cellspacing=\"0\" cellpadding=\"0\" width=\"556\" border=\"0\" style=\"font-family:helvetica,arial,sans-seif;color:#666666;font-size:16px;line-height:22px\">\n                <tbody><tr>\n                  <td style=\"text-align:left\"></td>\n                </tr>\n                <tr>\n                  <td style=\"text-align:left\"><table cellspacing=\"0\" cellpadding=\"0\" width=\"556\" border=\"0\">\n                    <tbody><tr><td style=\"font-family:helvetica,arial,sans-serif;font-size:30px;line-height:40px;font-weight:normal;color:#253c44;text-align:left\"></td></tr>\n                    <tr><td width=\"556\" height=\"20\" style=\"font-size:20px;line-height:20px;height:20px;text-align:left\"></td></tr>\n                    <tr>\n                      <td style=\"text-align:left\">\n                 Hi {{name}},<br>\n                 <br>\n                Thank you for stay with us! This is a Support Ticket Reply. Login to your account to view  your support ticket reply details:\n            <br>\n                <a target=\"_blank\" style=\"color:#ff6600;font-weight:bold;font-family:helvetica,arial,sans-seif;text-decoration:none\" href=\"{{sys_url}}\">{{sys_url}}</a>.<br>\n                Ticket ID: {{ticket_id}}<br>\n                Ticket Subject: {{ticket_subject}}<br>\n                Message: {{message}}<br>\n                Replyed By: {{reply_by}} <br><br>\n                Should you have any questions in regards to this support ticket or any other tickets related issue, please feel free to contact the Support department by creating a new ticket from your Client Portal \n            <br><br>\n            Regards,<br>\n            The Team at {{business_name}}<br>\n            <br>\n          </td>\n                    </tr>\n                    <tr>\n                      <td width=\"556\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\">&nbsp;</td>\n                    </tr>\n                  </tbody></table></td>\n                </tr>\n              </tbody></table></td>\n              <td width=\"20\" height=\"26\" style=\"font-size:26px;line-height:26px;height:26px;text-align:left\"></td>\n            </tr>\n            <tr>\n              <td width=\"20\" height=\"2\" bgcolor=\"#d9dfe1\" style=\"background-color:#d9dfe1;font-size:2px;line-height:2px;height:2px;text-align:left\"></td>\n              <td width=\"556\" height=\"2\" bgcolor=\"#d9dfe1\" style=\"background-color:#d9dfe1;font-size:2px;line-height:2px;height:2px;text-align:left\"></td>\n              <td width=\"20\" height=\"2\" bgcolor=\"#d9dfe1\" style=\"background-color:#d9dfe1;font-size:2px;line-height:2px;height:2px;text-align:left\"></td>\n            </tr>\n          </tbody></table></td>\n          <td width=\"37\" height=\"40\" style=\"font-size:40px;line-height:40px;height:40px;text-align:left\"></td>\n        </tr>\n        <tr>\n          <td width=\"38\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\"></td>\n          <td width=\"596\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\"></td>\n          <td width=\"37\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\"></td>\n        </tr>\n      </tbody></table>\n  </td></tr>\n</tbody>\n</table>\n<table cellspacing=\"0\" cellpadding=\"0\" width=\"100%\" border=\"0\" bgcolor=\"#273f47\"><tbody><tr><td align=\"center\">&nbsp;</td></tr></tbody></table>\n<table cellspacing=\"0\" cellpadding=\"0\" width=\"100%\" border=\"0\" bgcolor=\"#364a51\">\n  <tbody><tr>\n    <td align=\"center\">\n       <table cellspacing=\"0\" cellpadding=\"0\" width=\"672\" border=\"0\" bgcolor=\"#364a51\">\n              <tbody><tr>\n              <td width=\"38\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\"></td>\n          <td width=\"569\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\"></td>\n          <td width=\"38\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\"></td>\n              </tr>\n              <tr>\n                <td width=\"38\" height=\"40\" style=\"font-size:40px;line-height:40px;text-align:left\">\n                </td>\n                <td valign=\"top\" style=\"font-family:helvetica,arial,sans-seif;font-size:12px;line-height:16px;color:#949fa3;text-align:left\">Copyright &copy; {{business_name}}, All rights reserved.<br><br><br></td>\n                <td width=\"38\" height=\"40\" style=\"font-size:40px;line-height:40px;text-align:left\"></td>\n              </tr>\n              <tr>\n              <td width=\"38\" height=\"40\" style=\"font-size:40px;line-height:40px;text-align:left\"></td>\n              <td width=\"569\" height=\"40\" style=\"font-size:40px;line-height:40px;text-align:left\"></td>              \n                <td width=\"38\" height=\"40\" style=\"font-size:40px;line-height:40px;text-align:left\"></td>\n              </tr>\n            </tbody></table>\n     </td>\n  </tr>\n</tbody></table><div class=\"yj6qo\"></div><div class=\"adL\">\n     \n</div></div>\n', 1, 'Yes', 0),
(7, 'Forgot Client Password', 1, '{{business_name}} password change request', '<div style=\"margin:0;padding:0\"> \n<table cellspacing=\"0\" cellpadding=\"0\" width=\"100%\" border=\"0\" bgcolor=\"#439cc8\">\n  <tbody><tr>\n    <td align=\"center\">\n            <table cellspacing=\"0\" cellpadding=\"0\" width=\"672\" border=\"0\">\n              <tbody><tr>\n                <td height=\"95\" bgcolor=\"#439cc8\" style=\"background:#439cc8;text-align:left\">\n                <table cellspacing=\"0\" cellpadding=\"0\" width=\"672\" border=\"0\">\n                      <tbody><tr>\n                        <td width=\"672\" height=\"40\" style=\"font-size:40px;line-height:40px;height:40px;text-align:left\"></td>\n                      </tr>\n                      <tr>\n                        <td style=\"text-align:left\">                        \n                        <table cellspacing=\"0\" cellpadding=\"0\" width=\"672\" border=\"0\">\n                          <tbody><tr>\n                            <td width=\"37\" height=\"24\" style=\"font-size:40px;line-height:40px;height:40px;text-align:left\">\n                            </td>\n                            <td width=\"523\" height=\"24\" style=\"text-align:left\">\n                            <p  style=\"display:block;color:#ffffff;font-size:20px;font-family:Arial,Helvetica,sans-serif;max-width:557px;min-height:auto\">{{business_name}} </p>\n                            </td>\n                            <td width=\"44\" style=\"text-align:left\"></td>\n                            <td width=\"30\" style=\"text-align:left\"></td>\n                            <td width=\"38\" height=\"24\" style=\"font-size:40px;line-height:40px;height:40px;text-align:left\"></td>\n                          </tr>\n                        </tbody></table>\n                        </td>\n                      </tr>\n                      <tr><td width=\"672\" height=\"33\" style=\"font-size:33px;line-height:33px;height:33px;text-align:left\"></td></tr>\n                    </tbody></table>\n                \n                </td>\n              </tr>\n            </tbody></table>\n     </td>\n    </tr>\n </tbody></table>  \n  \n <table cellspacing=\"0\" cellpadding=\"0\" width=\"100%\" bgcolor=\"#439cc8\"><tbody><tr><td height=\"5\" style=\"background:#439cc8;height:5px;font-size:5px;line-height:5px\"></td></tr></tbody></table>\n       \n <table cellspacing=\"0\" cellpadding=\"0\" width=\"100%\" border=\"0\" bgcolor=\"#e9eff0\">\n  <tbody><tr>\n    <td align=\"center\">\n      <table cellspacing=\"0\" cellpadding=\"0\" width=\"671\" border=\"0\" bgcolor=\"#e9eff0\" style=\"background:#e9eff0\">\n        <tbody><tr>\n          <td width=\"38\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\"></td>\n          <td width=\"596\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\"></td>\n          <td width=\"37\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\"></td>\n        </tr>\n        <tr>\n          <td width=\"38\" height=\"40\" style=\"font-size:40px;line-height:40px;height:40px;text-align:left\"></td>\n          <td style=\"text-align:left\"><table cellspacing=\"0\" cellpadding=\"0\" width=\"596\" border=\"0\" bgcolor=\"#ffffff\">\n            <tbody><tr>\n              <td width=\"20\" height=\"26\" style=\"font-size:26px;line-height:26px;height:26px;text-align:left\"></td>\n              <td width=\"556\" height=\"26\" style=\"font-size:26px;line-height:26px;height:26px;text-align:left\"></td>\n              <td width=\"20\" height=\"26\" style=\"font-size:26px;line-height:26px;height:26px;text-align:left\"></td>\n            </tr>\n            <tr>\n              <td width=\"20\" height=\"26\" style=\"font-size:26px;line-height:26px;height:26px;text-align:left\"></td>\n              <td width=\"556\" style=\"text-align:left\"><table cellspacing=\"0\" cellpadding=\"0\" width=\"556\" border=\"0\" style=\"font-family:helvetica,arial,sans-seif;color:#666666;font-size:16px;line-height:22px\">\n                <tbody><tr>\n                  <td style=\"text-align:left\"></td>\n                </tr>\n                <tr>\n                  <td style=\"text-align:left\"><table cellspacing=\"0\" cellpadding=\"0\" width=\"556\" border=\"0\">\n                    <tbody><tr><td style=\"font-family:helvetica,arial,sans-serif;font-size:30px;line-height:40px;font-weight:normal;color:#253c44;text-align:left\"></td></tr>\n                    <tr><td width=\"556\" height=\"20\" style=\"font-size:20px;line-height:20px;height:20px;text-align:left\"></td></tr>\n                    <tr>\n                      <td style=\"text-align:left\">\n                 Hi {{name}},<br>\n                 <br>\n                Password Reset Successfuly!   This message is an automated reply to your password reset request. Click this linke to reset your password:\n            <br>\n                <a target=\"_blank\" style=\"color:#ff6600;font-weight:bold;font-family:helvetica,arial,sans-seif;text-decoration:none\" href=\" {{forgotpw_link}} \"> {{forgotpw_link}} </a>.<br>\nNotes: Until your password has been changed, your current password will remain valid. The Forgot Password Link will be available for a limited time only.\n\n            <br>\n            On behalf of the {{business_name}},<br>\n            The Team at {{business_name}}<br>\n            <br>\n          </td>\n                    </tr>\n                    <tr>\n                      <td width=\"556\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\">&nbsp;</td>\n                    </tr>\n                  </tbody></table></td>\n                </tr>\n              </tbody></table></td>\n              <td width=\"20\" height=\"26\" style=\"font-size:26px;line-height:26px;height:26px;text-align:left\"></td>\n            </tr>\n            <tr>\n              <td width=\"20\" height=\"2\" bgcolor=\"#d9dfe1\" style=\"background-color:#d9dfe1;font-size:2px;line-height:2px;height:2px;text-align:left\"></td>\n              <td width=\"556\" height=\"2\" bgcolor=\"#d9dfe1\" style=\"background-color:#d9dfe1;font-size:2px;line-height:2px;height:2px;text-align:left\"></td>\n              <td width=\"20\" height=\"2\" bgcolor=\"#d9dfe1\" style=\"background-color:#d9dfe1;font-size:2px;line-height:2px;height:2px;text-align:left\"></td>\n            </tr>\n          </tbody></table></td>\n          <td width=\"37\" height=\"40\" style=\"font-size:40px;line-height:40px;height:40px;text-align:left\"></td>\n        </tr>\n        <tr>\n          <td width=\"38\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\"></td>\n          <td width=\"596\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\"></td>\n          <td width=\"37\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\"></td>\n        </tr>\n      </tbody></table>\n  </td></tr>\n</tbody>\n</table>\n<table cellspacing=\"0\" cellpadding=\"0\" width=\"100%\" border=\"0\" bgcolor=\"#273f47\"><tbody><tr><td align=\"center\">&nbsp;</td></tr></tbody></table>\n<table cellspacing=\"0\" cellpadding=\"0\" width=\"100%\" border=\"0\" bgcolor=\"#364a51\">\n  <tbody><tr>\n    <td align=\"center\">\n       <table cellspacing=\"0\" cellpadding=\"0\" width=\"672\" border=\"0\" bgcolor=\"#364a51\">\n              <tbody><tr>\n              <td width=\"38\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\"></td>\n          <td width=\"569\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\"></td>\n          <td width=\"38\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\"></td>\n              </tr>\n              <tr>\n                <td width=\"38\" height=\"40\" style=\"font-size:40px;line-height:40px;text-align:left\">\n                </td>\n                <td valign=\"top\" style=\"font-family:helvetica,arial,sans-seif;font-size:12px;line-height:16px;color:#949fa3;text-align:left\">Copyright &copy; {{business_name}}, All rights reserved.<br><br><br></td>\n                <td width=\"38\" height=\"40\" style=\"font-size:40px;line-height:40px;text-align:left\"></td>\n              </tr>\n              <tr>\n              <td width=\"38\" height=\"40\" style=\"font-size:40px;line-height:40px;text-align:left\"></td>\n              <td width=\"569\" height=\"40\" style=\"font-size:40px;line-height:40px;text-align:left\"></td>              \n                <td width=\"38\" height=\"40\" style=\"font-size:40px;line-height:40px;text-align:left\"></td>\n              </tr>\n            </tbody></table>\n     </td>\n  </tr>\n</tbody></table><div class=\"yj6qo\"></div><div class=\"adL\">\n     \n</div></div>\n', 1, 'Yes', 0),
(8, 'Client Password Reset', 1, '{{business_name}} New Password', '<div style=\"margin:0;padding:0\"> \n<table cellspacing=\"0\" cellpadding=\"0\" width=\"100%\" border=\"0\" bgcolor=\"#439cc8\">\n  <tbody><tr>\n    <td align=\"center\">\n            <table cellspacing=\"0\" cellpadding=\"0\" width=\"672\" border=\"0\">\n              <tbody><tr>\n                <td height=\"95\" bgcolor=\"#439cc8\" style=\"background:#439cc8;text-align:left\">\n                <table cellspacing=\"0\" cellpadding=\"0\" width=\"672\" border=\"0\">\n                      <tbody><tr>\n                        <td width=\"672\" height=\"40\" style=\"font-size:40px;line-height:40px;height:40px;text-align:left\"></td>\n                      </tr>\n                      <tr>\n                        <td style=\"text-align:left\">                        \n                        <table cellspacing=\"0\" cellpadding=\"0\" width=\"672\" border=\"0\">\n                          <tbody><tr>\n                            <td width=\"37\" height=\"24\" style=\"font-size:40px;line-height:40px;height:40px;text-align:left\">\n                            </td>\n                            <td width=\"523\" height=\"24\" style=\"text-align:left\">\n                            <p  style=\"display:block;color:#ffffff;font-size:20px;font-family:Arial,Helvetica,sans-serif;max-width:557px;min-height:auto\" >{{business_name}}</p>\n                            </td>\n                            <td width=\"44\" style=\"text-align:left\"></td>\n                            <td width=\"30\" style=\"text-align:left\"></td>\n                            <td width=\"38\" height=\"24\" style=\"font-size:40px;line-height:40px;height:40px;text-align:left\"></td>\n                          </tr>\n                        </tbody></table>\n                        </td>\n                      </tr>\n                      <tr><td width=\"672\" height=\"33\" style=\"font-size:33px;line-height:33px;height:33px;text-align:left\"></td></tr>\n                    </tbody></table>\n                \n                </td>\n              </tr>\n            </tbody></table>\n     </td>\n    </tr>\n </tbody></table>  \n  \n <table cellspacing=\"0\" cellpadding=\"0\" width=\"100%\" bgcolor=\"#439cc8\"><tbody><tr><td height=\"5\" style=\"background:#439cc8;height:5px;font-size:5px;line-height:5px\"></td></tr></tbody></table>\n       \n <table cellspacing=\"0\" cellpadding=\"0\" width=\"100%\" border=\"0\" bgcolor=\"#e9eff0\">\n  <tbody><tr>\n    <td align=\"center\">\n      <table cellspacing=\"0\" cellpadding=\"0\" width=\"671\" border=\"0\" bgcolor=\"#e9eff0\" style=\"background:#e9eff0\">\n        <tbody><tr>\n          <td width=\"38\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\"></td>\n          <td width=\"596\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\"></td>\n          <td width=\"37\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\"></td>\n        </tr>\n        <tr>\n          <td width=\"38\" height=\"40\" style=\"font-size:40px;line-height:40px;height:40px;text-align:left\"></td>\n          <td style=\"text-align:left\"><table cellspacing=\"0\" cellpadding=\"0\" width=\"596\" border=\"0\" bgcolor=\"#ffffff\">\n            <tbody><tr>\n              <td width=\"20\" height=\"26\" style=\"font-size:26px;line-height:26px;height:26px;text-align:left\"></td>\n              <td width=\"556\" height=\"26\" style=\"font-size:26px;line-height:26px;height:26px;text-align:left\"></td>\n              <td width=\"20\" height=\"26\" style=\"font-size:26px;line-height:26px;height:26px;text-align:left\"></td>\n            </tr>\n            <tr>\n              <td width=\"20\" height=\"26\" style=\"font-size:26px;line-height:26px;height:26px;text-align:left\"></td>\n              <td width=\"556\" style=\"text-align:left\"><table cellspacing=\"0\" cellpadding=\"0\" width=\"556\" border=\"0\" style=\"font-family:helvetica,arial,sans-seif;color:#666666;font-size:16px;line-height:22px\">\n                <tbody><tr>\n                  <td style=\"text-align:left\"></td>\n                </tr>\n                <tr>\n                  <td style=\"text-align:left\"><table cellspacing=\"0\" cellpadding=\"0\" width=\"556\" border=\"0\">\n                    <tbody><tr><td style=\"font-family:helvetica,arial,sans-serif;font-size:30px;line-height:40px;font-weight:normal;color:#253c44;text-align:left\"></td></tr>\n                    <tr><td width=\"556\" height=\"20\" style=\"font-size:20px;line-height:20px;height:20px;text-align:left\"></td></tr>\n                    <tr>\n                      <td style=\"text-align:left\">\n                 Hi {{name}},<br>\n                 <br>\n                Password Reset Successfuly!   This message is an automated reply to your password reset request. Login to your account to set up your all details by using the details below:\n            <br>\n                <a target=\"_blank\" style=\"color:#ff6600;font-weight:bold;font-family:helvetica,arial,sans-seif;text-decoration:none\" href=\" {{sys_url}}\"> {{sys_url}}</a>.<br>\n                                    Email: {{username}}<br>\n                                    Password: {{password}} \n            <br>\n            On behalf of the {{business_name}},<br>\n            The Team at {{business_name}}<br>\n            <br>\n          </td>\n                    </tr>\n                    <tr>\n                      <td width=\"556\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\">&nbsp;</td>\n                    </tr>\n                  </tbody></table></td>\n                </tr>\n              </tbody></table></td>\n              <td width=\"20\" height=\"26\" style=\"font-size:26px;line-height:26px;height:26px;text-align:left\"></td>\n            </tr>\n            <tr>\n              <td width=\"20\" height=\"2\" bgcolor=\"#d9dfe1\" style=\"background-color:#d9dfe1;font-size:2px;line-height:2px;height:2px;text-align:left\"></td>\n              <td width=\"556\" height=\"2\" bgcolor=\"#d9dfe1\" style=\"background-color:#d9dfe1;font-size:2px;line-height:2px;height:2px;text-align:left\"></td>\n              <td width=\"20\" height=\"2\" bgcolor=\"#d9dfe1\" style=\"background-color:#d9dfe1;font-size:2px;line-height:2px;height:2px;text-align:left\"></td>\n            </tr>\n          </tbody></table></td>\n          <td width=\"37\" height=\"40\" style=\"font-size:40px;line-height:40px;height:40px;text-align:left\"></td>\n        </tr>\n        <tr>\n          <td width=\"38\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\"></td>\n          <td width=\"596\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\"></td>\n          <td width=\"37\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\"></td>\n        </tr>\n      </tbody></table>\n  </td></tr>\n</tbody>\n</table>\n<table cellspacing=\"0\" cellpadding=\"0\" width=\"100%\" border=\"0\" bgcolor=\"#273f47\"><tbody><tr><td align=\"center\">&nbsp;</td></tr></tbody></table>\n<table cellspacing=\"0\" cellpadding=\"0\" width=\"100%\" border=\"0\" bgcolor=\"#364a51\">\n  <tbody><tr>\n    <td align=\"center\">\n       <table cellspacing=\"0\" cellpadding=\"0\" width=\"672\" border=\"0\" bgcolor=\"#364a51\">\n              <tbody><tr>\n              <td width=\"38\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\"></td>\n          <td width=\"569\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\"></td>\n          <td width=\"38\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\"></td>\n              </tr>\n              <tr>\n                <td width=\"38\" height=\"40\" style=\"font-size:40px;line-height:40px;text-align:left\">\n                </td>\n                <td valign=\"top\" style=\"font-family:helvetica,arial,sans-seif;font-size:12px;line-height:16px;color:#949fa3;text-align:left\">Copyright &copy; {{business_name}}, All rights reserved.<br><br><br></td>\n                <td width=\"38\" height=\"40\" style=\"font-size:40px;line-height:40px;text-align:left\"></td>\n              </tr>\n              <tr>\n              <td width=\"38\" height=\"40\" style=\"font-size:40px;line-height:40px;text-align:left\"></td>\n              <td width=\"569\" height=\"40\" style=\"font-size:40px;line-height:40px;text-align:left\"></td>              \n                <td width=\"38\" height=\"40\" style=\"font-size:40px;line-height:40px;text-align:left\"></td>\n              </tr>\n            </tbody></table>\n     </td>\n  </tr>\n</tbody></table><div class=\"yj6qo\"></div><div class=\"adL\">\n     \n</div></div>\n', 1, 'Yes', 0),
(9, 'Ticket For Admin', 1, 'New Ticket From {{business_name}} Client', '<div style=\"margin:0;padding:0\"> \n<table cellspacing=\"0\" cellpadding=\"0\" width=\"100%\" border=\"0\" bgcolor=\"#439cc8\">\n  <tbody><tr>\n    <td align=\"center\">\n            <table cellspacing=\"0\" cellpadding=\"0\" width=\"672\" border=\"0\">\n              <tbody><tr>\n                <td height=\"95\" bgcolor=\"#439cc8\" style=\"background:#439cc8;text-align:left\">\n                <table cellspacing=\"0\" cellpadding=\"0\" width=\"672\" border=\"0\">\n                      <tbody><tr>\n                        <td width=\"672\" height=\"40\" style=\"font-size:40px;line-height:40px;height:40px;text-align:left\"></td>\n                      </tr>\n                      <tr>\n                        <td style=\"text-align:left\">                        \n                        <table cellspacing=\"0\" cellpadding=\"0\" width=\"672\" border=\"0\">\n                          <tbody><tr>\n                            <td width=\"37\" height=\"24\" style=\"font-size:40px;line-height:40px;height:40px;text-align:left\">\n                            </td>\n                            <td width=\"523\" height=\"24\" style=\"text-align:left\">\n                            <div width=\"125\" height=\"23\" style=\"display:block;color:#ffffff;font-size:20px;font-family:Arial,Helvetica,sans-serif;max-width:557px;min-height:auto\" >{{business_name}}</div>\n                            </td>\n                            <td width=\"44\" style=\"text-align:left\"></td>\n                            <td width=\"30\" style=\"text-align:left\"></td>\n                            <td width=\"38\" height=\"24\" style=\"font-size:40px;line-height:40px;height:40px;text-align:left\"></td>\n                          </tr>\n                        </tbody></table>\n                        </td>\n                      </tr>\n                      <tr><td width=\"672\" height=\"33\" style=\"font-size:33px;line-height:33px;height:33px;text-align:left\"></td></tr>\n                    </tbody></table>\n                \n                </td>\n              </tr>\n            </tbody></table>\n     </td>\n    </tr>\n </tbody></table>  \n  \n <table cellspacing=\"0\" cellpadding=\"0\" width=\"100%\" bgcolor=\"#439cc8\"><tbody><tr><td height=\"5\" style=\"background:#439cc8;height:5px;font-size:5px;line-height:5px\"></td></tr></tbody></table>\n       \n <table cellspacing=\"0\" cellpadding=\"0\" width=\"100%\" border=\"0\" bgcolor=\"#e9eff0\">\n  <tbody><tr>\n    <td align=\"center\">\n      <table cellspacing=\"0\" cellpadding=\"0\" width=\"671\" border=\"0\" bgcolor=\"#e9eff0\" style=\"background:#e9eff0\">\n        <tbody><tr>\n          <td width=\"38\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\"></td>\n          <td width=\"596\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\"></td>\n          <td width=\"37\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\"></td>\n        </tr>\n        <tr>\n          <td width=\"38\" height=\"40\" style=\"font-size:40px;line-height:40px;height:40px;text-align:left\"></td>\n          <td style=\"text-align:left\"><table cellspacing=\"0\" cellpadding=\"0\" width=\"596\" border=\"0\" bgcolor=\"#ffffff\">\n            <tbody><tr>\n              <td width=\"20\" height=\"26\" style=\"font-size:26px;line-height:26px;height:26px;text-align:left\"></td>\n              <td width=\"556\" height=\"26\" style=\"font-size:26px;line-height:26px;height:26px;text-align:left\"></td>\n              <td width=\"20\" height=\"26\" style=\"font-size:26px;line-height:26px;height:26px;text-align:left\"></td>\n            </tr>\n            <tr>\n              <td width=\"20\" height=\"26\" style=\"font-size:26px;line-height:26px;height:26px;text-align:left\"></td>\n              <td width=\"556\" style=\"text-align:left\"><table cellspacing=\"0\" cellpadding=\"0\" width=\"556\" border=\"0\" style=\"font-family:helvetica,arial,sans-seif;color:#666666;font-size:16px;line-height:22px\">\n                <tbody><tr>\n                  <td style=\"text-align:left\"></td>\n                </tr>\n                <tr>\n                  <td style=\"text-align:left\"><table cellspacing=\"0\" cellpadding=\"0\" width=\"556\" border=\"0\">\n                    <tbody><tr><td style=\"font-family:helvetica,arial,sans-serif;font-size:30px;line-height:40px;font-weight:normal;color:#253c44;text-align:left\"></td></tr>\n                    <tr><td width=\"556\" height=\"20\" style=\"font-size:20px;line-height:20px;height:20px;text-align:left\"></td></tr>\n                    <tr>\n                      <td style=\"text-align:left\">\n                 Hi {{name}},<br>{{department_name}},<br>\n                 <br>\n            \n                Ticket ID: {{ticket_id}}<br>\n                Ticket Subject: {{ticket_subject}}<br>\n                Message: {{message}}<br>\n                Created By: {{create_by}} <br><br>\n                Waiting for your quick response.\n            <br><br>\n            Thank you. \n            <br>\n            Regards,<br>\n            {{name}}<br>\n{{business_name}} Client. \n            <br>\n          </td>\n                    </tr>\n                    <tr>\n                      <td width=\"556\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\">&nbsp;</td>\n                    </tr>\n                  </tbody></table></td>\n                </tr>\n              </tbody></table></td>\n              <td width=\"20\" height=\"26\" style=\"font-size:26px;line-height:26px;height:26px;text-align:left\"></td>\n            </tr>\n            <tr>\n              <td width=\"20\" height=\"2\" bgcolor=\"#d9dfe1\" style=\"background-color:#d9dfe1;font-size:2px;line-height:2px;height:2px;text-align:left\"></td>\n              <td width=\"556\" height=\"2\" bgcolor=\"#d9dfe1\" style=\"background-color:#d9dfe1;font-size:2px;line-height:2px;height:2px;text-align:left\"></td>\n              <td width=\"20\" height=\"2\" bgcolor=\"#d9dfe1\" style=\"background-color:#d9dfe1;font-size:2px;line-height:2px;height:2px;text-align:left\"></td>\n            </tr>\n          </tbody></table></td>\n          <td width=\"37\" height=\"40\" style=\"font-size:40px;line-height:40px;height:40px;text-align:left\"></td>\n        </tr>\n        <tr>\n          <td width=\"38\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\"></td>\n          <td width=\"596\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\"></td>\n          <td width=\"37\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\"></td>\n        </tr>\n      </tbody></table>\n  </td></tr>\n</tbody>\n</table>\n<table cellspacing=\"0\" cellpadding=\"0\" width=\"100%\" border=\"0\" bgcolor=\"#273f47\"><tbody><tr><td align=\"center\">&nbsp;</td></tr></tbody></table>\n<table cellspacing=\"0\" cellpadding=\"0\" width=\"100%\" border=\"0\" bgcolor=\"#364a51\">\n  <tbody><tr>\n    <td align=\"center\">\n       <table cellspacing=\"0\" cellpadding=\"0\" width=\"672\" border=\"0\" bgcolor=\"#364a51\">\n              <tbody><tr>\n              <td width=\"38\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\"></td>\n          <td width=\"569\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\"></td>\n          <td width=\"38\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\"></td>\n              </tr>\n              <tr>\n                <td width=\"38\" height=\"40\" style=\"font-size:40px;line-height:40px;text-align:left\">\n                </td>\n                <td valign=\"top\" style=\"font-family:helvetica,arial,sans-seif;font-size:12px;line-height:16px;color:#949fa3;text-align:left\">Copyright &copy; {{business_name}}, All rights reserved.<br><br><br></td>\n                <td width=\"38\" height=\"40\" style=\"font-size:40px;line-height:40px;text-align:left\"></td>\n              </tr>\n              <tr>\n              <td width=\"38\" height=\"40\" style=\"font-size:40px;line-height:40px;text-align:left\"></td>\n              <td width=\"569\" height=\"40\" style=\"font-size:40px;line-height:40px;text-align:left\"></td>              \n                <td width=\"38\" height=\"40\" style=\"font-size:40px;line-height:40px;text-align:left\"></td>\n              </tr>\n            </tbody></table>\n     </td>\n  </tr>\n</tbody></table><div class=\"yj6qo\"></div><div class=\"adL\">\n     \n</div></div>\n', 1, 'Yes', 0),
(10, 'Client Ticket Reply', 1, 'Reply to Ticket [TID-{{ticket_id}}]', '<div style=\"margin:0;padding:0\"> \n<table cellspacing=\"0\" cellpadding=\"0\" width=\"100%\" border=\"0\" bgcolor=\"#439cc8\">\n  <tbody><tr>\n    <td align=\"center\">\n            <table cellspacing=\"0\" cellpadding=\"0\" width=\"672\" border=\"0\">\n              <tbody><tr>\n                <td height=\"95\" bgcolor=\"#439cc8\" style=\"background:#439cc8;text-align:left\">\n                <table cellspacing=\"0\" cellpadding=\"0\" width=\"672\" border=\"0\">\n                      <tbody><tr>\n                        <td width=\"672\" height=\"40\" style=\"font-size:40px;line-height:40px;height:40px;text-align:left\"></td>\n                      </tr>\n                      <tr>\n                        <td style=\"text-align:left\">                        \n                        <table cellspacing=\"0\" cellpadding=\"0\" width=\"672\" border=\"0\">\n                          <tbody><tr>\n                            <td width=\"37\" height=\"24\" style=\"font-size:40px;line-height:40px;height:40px;text-align:left\">\n                            </td>\n                            <td width=\"523\" height=\"24\" style=\"text-align:left\">\n                            <div width=\"125\" height=\"23\" style=\"display:block;color:#ffffff;font-size:20px;font-family:Arial,Helvetica,sans-serif;max-width:557px;min-height:auto\">{{business_name}}</div>\n                            </td>\n                            <td width=\"44\" style=\"text-align:left\"></td>\n                            <td width=\"30\" style=\"text-align:left\"></td>\n                            <td width=\"38\" height=\"24\" style=\"font-size:40px;line-height:40px;height:40px;text-align:left\"></td>\n                          </tr>\n                        </tbody></table>\n                        </td>\n                      </tr>\n                      <tr><td width=\"672\" height=\"33\" style=\"font-size:33px;line-height:33px;height:33px;text-align:left\"></td></tr>\n                    </tbody></table>\n                \n                </td>\n              </tr>\n            </tbody></table>\n     </td>\n    </tr>\n </tbody></table>  \n  \n <table cellspacing=\"0\" cellpadding=\"0\" width=\"100%\" bgcolor=\"#439cc8\"><tbody><tr><td height=\"5\" style=\"background:#439cc8;height:5px;font-size:5px;line-height:5px\"></td></tr></tbody></table>\n       \n <table cellspacing=\"0\" cellpadding=\"0\" width=\"100%\" border=\"0\" bgcolor=\"#e9eff0\">\n  <tbody><tr>\n    <td align=\"center\">\n      <table cellspacing=\"0\" cellpadding=\"0\" width=\"671\" border=\"0\" bgcolor=\"#e9eff0\" style=\"background:#e9eff0\">\n        <tbody><tr>\n          <td width=\"38\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\"></td>\n          <td width=\"596\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\"></td>\n          <td width=\"37\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\"></td>\n        </tr>\n        <tr>\n          <td width=\"38\" height=\"40\" style=\"font-size:40px;line-height:40px;height:40px;text-align:left\"></td>\n          <td style=\"text-align:left\"><table cellspacing=\"0\" cellpadding=\"0\" width=\"596\" border=\"0\" bgcolor=\"#ffffff\">\n            <tbody><tr>\n              <td width=\"20\" height=\"26\" style=\"font-size:26px;line-height:26px;height:26px;text-align:left\"></td>\n              <td width=\"556\" height=\"26\" style=\"font-size:26px;line-height:26px;height:26px;text-align:left\"></td>\n              <td width=\"20\" height=\"26\" style=\"font-size:26px;line-height:26px;height:26px;text-align:left\"></td>\n            </tr>\n            <tr>\n              <td width=\"20\" height=\"26\" style=\"font-size:26px;line-height:26px;height:26px;text-align:left\"></td>\n              <td width=\"556\" style=\"text-align:left\"><table cellspacing=\"0\" cellpadding=\"0\" width=\"556\" border=\"0\" style=\"font-family:helvetica,arial,sans-seif;color:#666666;font-size:16px;line-height:22px\">\n                <tbody><tr>\n                  <td style=\"text-align:left\"></td>\n                </tr>\n                <tr>\n                  <td style=\"text-align:left\"><table cellspacing=\"0\" cellpadding=\"0\" width=\"556\" border=\"0\">\n                    <tbody><tr><td style=\"font-family:helvetica,arial,sans-serif;font-size:30px;line-height:40px;font-weight:normal;color:#253c44;text-align:left\"></td></tr>\n                    <tr><td width=\"556\" height=\"20\" style=\"font-size:20px;line-height:20px;height:20px;text-align:left\"></td></tr>\n                    <tr>\n                      <td style=\"text-align:left\">\n                 Hi {{name}},<br>{{department_name}},<br>\n                 <br>\n                 This is a Support Ticket Reply From Cleint.\n            <br>\n                Ticket ID: {{ticket_id}}<br>\n                Ticket Subject: {{ticket_subject}}<br>\n                Message: {{message}}<br>\n                Replyed By: {{reply_by}}  <br><br>\n                Waiting for your quick response.\n            <br><br>\n            Thank you. \n            <br>\n            Regards,<br>\n            {{name}}<br>\n{{business_name}} Client. \n            <br>\n          </td>\n                    </tr>\n                    <tr>\n                      <td width=\"556\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\">&nbsp;</td>\n                    </tr>\n                  </tbody></table></td>\n                </tr>\n              </tbody></table></td>\n              <td width=\"20\" height=\"26\" style=\"font-size:26px;line-height:26px;height:26px;text-align:left\"></td>\n            </tr>\n            <tr>\n              <td width=\"20\" height=\"2\" bgcolor=\"#d9dfe1\" style=\"background-color:#d9dfe1;font-size:2px;line-height:2px;height:2px;text-align:left\"></td>\n              <td width=\"556\" height=\"2\" bgcolor=\"#d9dfe1\" style=\"background-color:#d9dfe1;font-size:2px;line-height:2px;height:2px;text-align:left\"></td>\n              <td width=\"20\" height=\"2\" bgcolor=\"#d9dfe1\" style=\"background-color:#d9dfe1;font-size:2px;line-height:2px;height:2px;text-align:left\"></td>\n            </tr>\n          </tbody></table></td>\n          <td width=\"37\" height=\"40\" style=\"font-size:40px;line-height:40px;height:40px;text-align:left\"></td>\n        </tr>\n        <tr>\n          <td width=\"38\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\"></td>\n          <td width=\"596\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\"></td>\n          <td width=\"37\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\"></td>\n        </tr>\n      </tbody></table>\n  </td></tr>\n</tbody>\n</table>\n<table cellspacing=\"0\" cellpadding=\"0\" width=\"100%\" border=\"0\" bgcolor=\"#273f47\"><tbody><tr><td align=\"center\">&nbsp;</td></tr></tbody></table>\n<table cellspacing=\"0\" cellpadding=\"0\" width=\"100%\" border=\"0\" bgcolor=\"#364a51\">\n  <tbody><tr>\n    <td align=\"center\">\n       <table cellspacing=\"0\" cellpadding=\"0\" width=\"672\" border=\"0\" bgcolor=\"#364a51\">\n              <tbody><tr>\n              <td width=\"38\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\"></td>\n          <td width=\"569\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\"></td>\n          <td width=\"38\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\"></td>\n              </tr>\n              <tr>\n                <td width=\"38\" height=\"40\" style=\"font-size:40px;line-height:40px;text-align:left\">\n                </td>\n                <td valign=\"top\" style=\"font-family:helvetica,arial,sans-seif;font-size:12px;line-height:16px;color:#949fa3;text-align:left\">Copyright &copy; {{business_name}}, All rights reserved.<br><br><br></td>\n                <td width=\"38\" height=\"40\" style=\"font-size:40px;line-height:40px;text-align:left\"></td>\n              </tr>\n              <tr>\n              <td width=\"38\" height=\"40\" style=\"font-size:40px;line-height:40px;text-align:left\"></td>\n              <td width=\"569\" height=\"40\" style=\"font-size:40px;line-height:40px;text-align:left\"></td>              \n                <td width=\"38\" height=\"40\" style=\"font-size:40px;line-height:40px;text-align:left\"></td>\n              </tr>\n            </tbody></table>\n     </td>\n  </tr>\n</tbody></table><div class=\"yj6qo\"></div><div class=\"adL\">\n     \n</div></div>\n', 1, 'Yes', 0),
(11, 'Bulk Email Send', 1, 'Email From {{business_name}}', '{{message_body}}\r\n', 1, 'Yes', 0);
INSERT INTO `email_templates` (`id`, `tplname`, `language_id`, `subject`, `message`, `send`, `core`, `hidden`) VALUES
(12, 'Customer Invoice Created', 1, '{{business_name}} Invoice', '<div style=\"margin:0;padding:0\"> \n<table cellspacing=\"0\" cellpadding=\"0\" width=\"100%\" border=\"0\" bgcolor=\"#439cc8\">\n  <tbody><tr>\n    <td align=\"center\">\n            <table cellspacing=\"0\" cellpadding=\"0\" width=\"672\" border=\"0\">\n              <tbody><tr>\n                <td height=\"95\" bgcolor=\"#439cc8\" style=\"background:#439cc8;text-align:left\">\n                <table cellspacing=\"0\" cellpadding=\"0\" width=\"672\" border=\"0\">\n                      <tbody><tr>\n                        <td width=\"672\" height=\"40\" style=\"font-size:40px;line-height:40px;height:40px;text-align:left\"></td>\n                      </tr>\n                      <tr>\n                        <td style=\"text-align:left\">                        \n                        <table cellspacing=\"0\" cellpadding=\"0\" width=\"672\" border=\"0\">\n                          <tbody><tr>\n                            <td width=\"37\" height=\"24\" style=\"font-size:40px;line-height:40px;height:40px;text-align:left\">\n                            </td>\n                            <td width=\"523\" height=\"24\" style=\"text-align:left\">\n                            <div width=\"125\" height=\"23\" style=\"display:block;color:#ffffff;font-size:20px;font-family:Arial,Helvetica,sans-serif;max-width:557px;min-height:auto\"   >{{business_name}}</div>\n                            </td>\n                            <td width=\"44\" style=\"text-align:left\"></td>\n                            <td width=\"30\" style=\"text-align:left\"></td>\n                            <td width=\"38\" height=\"24\" style=\"font-size:40px;line-height:40px;height:40px;text-align:left\"></td>\n                          </tr>\n                        </tbody></table>\n                        </td>\n                      </tr>\n                      <tr><td width=\"672\" height=\"33\" style=\"font-size:33px;line-height:33px;height:33px;text-align:left\"></td></tr>\n                    </tbody></table>\n                \n                </td>\n              </tr>\n            </tbody></table>\n     </td>\n    </tr>\n </tbody></table>  \n  \n <table cellspacing=\"0\" cellpadding=\"0\" width=\"100%\" bgcolor=\"#439cc8\"><tbody><tr><td height=\"5\" style=\"background:#439cc8;height:5px;font-size:5px;line-height:5px\"></td></tr></tbody></table>\n       \n <table cellspacing=\"0\" cellpadding=\"0\" width=\"100%\" border=\"0\" bgcolor=\"#e9eff0\">\n  <tbody><tr>\n    <td align=\"center\">\n      <table cellspacing=\"0\" cellpadding=\"0\" width=\"671\" border=\"0\" bgcolor=\"#e9eff0\" style=\"background:#e9eff0\">\n        <tbody><tr>\n          <td width=\"38\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\"></td>\n          <td width=\"596\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\"></td>\n          <td width=\"37\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\"></td>\n        </tr>\n        <tr>\n          <td width=\"38\" height=\"40\" style=\"font-size:40px;line-height:40px;height:40px;text-align:left\"></td>\n          <td style=\"text-align:left\"><table cellspacing=\"0\" cellpadding=\"0\" width=\"596\" border=\"0\" bgcolor=\"#ffffff\">\n            <tbody><tr>\n              <td width=\"20\" height=\"26\" style=\"font-size:26px;line-height:26px;height:26px;text-align:left\"></td>\n              <td width=\"556\" height=\"26\" style=\"font-size:26px;line-height:26px;height:26px;text-align:left\"></td>\n              <td width=\"20\" height=\"26\" style=\"font-size:26px;line-height:26px;height:26px;text-align:left\"></td>\n            </tr>\n            <tr>\n              <td width=\"20\" height=\"26\" style=\"font-size:26px;line-height:26px;height:26px;text-align:left\"></td>\n              <td width=\"556\" style=\"text-align:left\"><table cellspacing=\"0\" cellpadding=\"0\" width=\"556\" border=\"0\" style=\"font-family:helvetica,arial,sans-seif;color:#666666;font-size:16px;line-height:22px\">\n                <tbody><tr>\n                  <td style=\"text-align:left\"></td>\n                </tr>\n                <tr>\n                  <td style=\"text-align:left\"><table cellspacing=\"0\" cellpadding=\"0\" width=\"556\" border=\"0\">\n                    <tbody><tr><td style=\"font-family:helvetica,arial,sans-serif;font-size:30px;line-height:40px;font-weight:normal;color:#253c44;text-align:left\"></td></tr>\n                    <tr><td width=\"556\" height=\"20\" style=\"font-size:20px;line-height:20px;height:20px;text-align:left\"></td></tr>\n                    <tr>\n                      <td style=\"text-align:left\">\n       				   Hi {{name}},<br>\n        			   <br>\n       					Thank you for stay with us! This message is an automated reply to your invoice request. Login to your account to view your invoice details.<br /><br />\n						<br>\n        				<a target=\"_blank\" style=\"color:#ff6600;font-weight:bold;font-family:helvetica,arial,sans-seif;text-decoration:none\" href=\"{{sys_url}}\">{{sys_url}}</a>.<br>\n                                    Invoice ID: {{invoice_id}} <br>\n                                    Invoice Amount: {{invoice_amount}}\n						<br>\n            Should you have any questions in regards to this invoice or any other billing related issue, please feel free to contact the Billing department by creating a new ticket from your Client Portal.\n            <br><br>\n						Regards,<br>\n						The Team at {{business_name}}<br>\n						<br>\n					</td>\n                    </tr>\n                    <tr>\n                      <td width=\"556\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\"> </td>\n                    </tr>\n                  </tbody></table></td>\n                </tr>\n              </tbody></table></td>\n              <td width=\"20\" height=\"26\" style=\"font-size:26px;line-height:26px;height:26px;text-align:left\"></td>\n            </tr>\n            <tr>\n              <td width=\"20\" height=\"2\" bgcolor=\"#d9dfe1\" style=\"background-color:#d9dfe1;font-size:2px;line-height:2px;height:2px;text-align:left\"></td>\n              <td width=\"556\" height=\"2\" bgcolor=\"#d9dfe1\" style=\"background-color:#d9dfe1;font-size:2px;line-height:2px;height:2px;text-align:left\"></td>\n              <td width=\"20\" height=\"2\" bgcolor=\"#d9dfe1\" style=\"background-color:#d9dfe1;font-size:2px;line-height:2px;height:2px;text-align:left\"></td>\n            </tr>\n          </tbody></table></td>\n          <td width=\"37\" height=\"40\" style=\"font-size:40px;line-height:40px;height:40px;text-align:left\"></td>\n        </tr>\n        <tr>\n          <td width=\"38\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\"></td>\n          <td width=\"596\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\"></td>\n          <td width=\"37\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\"></td>\n        </tr>\n      </tbody></table>\n  </td></tr>\n</tbody>\n</table>\n<table cellspacing=\"0\" cellpadding=\"0\" width=\"100%\" border=\"0\" bgcolor=\"#273f47\"><tbody><tr><td align=\"center\"> </td></tr></tbody></table>\n<table cellspacing=\"0\" cellpadding=\"0\" width=\"100%\" border=\"0\" bgcolor=\"#364a51\">\n  <tbody><tr>\n    <td align=\"center\">\n       <table cellspacing=\"0\" cellpadding=\"0\" width=\"672\" border=\"0\" bgcolor=\"#364a51\">\n              <tbody><tr>\n              <td width=\"38\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\"></td>\n          <td width=\"569\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\"></td>\n          <td width=\"38\" height=\"30\" style=\"font-size:30px;line-height:30px;height:30px;text-align:left\"></td>\n              </tr>\n              <tr>\n                <td width=\"38\" height=\"40\" style=\"font-size:40px;line-height:40px;text-align:left\">\n                </td>\n                <td valign=\"top\" style=\"font-family:helvetica,arial,sans-seif;font-size:12px;line-height:16px;color:#949fa3;text-align:left\">Copyright © {{business_name}}, All rights reserved.<br><br><br></td>\n                <td width=\"38\" height=\"40\" style=\"font-size:40px;line-height:40px;text-align:left\"></td>\n              </tr>\n              <tr>\n              <td width=\"38\" height=\"40\" style=\"font-size:40px;line-height:40px;text-align:left\"></td>\n              <td width=\"569\" height=\"40\" style=\"font-size:40px;line-height:40px;text-align:left\"></td>              \n                <td width=\"38\" height=\"40\" style=\"font-size:40px;line-height:40px;text-align:left\"></td>\n              </tr>\n            </tbody></table>\n     </td>\n  </tr>\n</tbody></table><div class=\"yj6qo\"></div><div class=\"adL\">\n     \n</div></div>', 1, 'Yes', 0);

-- --------------------------------------------------------

--
-- Table structure for table `email_transaction`
--

CREATE TABLE `email_transaction` (
  `id` int(10) NOT NULL,
  `userid` int(10) NOT NULL,
  `amount` int(10) NOT NULL DEFAULT '0',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `email_transaction`
--

INSERT INTO `email_transaction` (`id`, `userid`, `amount`, `date`) VALUES
(1, 1, 20, '2017-11-21 06:59:13'),
(2, 1, 1000, '2017-11-29 10:18:01');

-- --------------------------------------------------------

--
-- Table structure for table `int_country_codes`
--

CREATE TABLE `int_country_codes` (
  `id` int(11) NOT NULL,
  `country_name` varchar(200) DEFAULT NULL,
  `iso_code` varchar(100) DEFAULT NULL,
  `country_code` varchar(10) DEFAULT NULL,
  `tariff` float(5,2) DEFAULT '3.00',
  `active` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `int_country_codes`
--

INSERT INTO `int_country_codes` (`id`, `country_name`, `iso_code`, `country_code`, `tariff`, `active`) VALUES
(1, 'Afghanistan', 'AF / AFG', '93', 1.00, 1),
(2, 'Albania', 'AL / ALB', '355', 1.00, 1),
(3, 'Algeria', 'DZ / DZA', '213', 1.00, 1),
(4, 'Andorra', 'AD / AND', '376', 1.00, 1),
(5, 'Angola', 'AO / AGO', '244', 1.00, 0),
(6, 'Antarctica', 'AQ / ATA', '672', 1.00, 1),
(7, 'Argentina', 'AR / ARG', '54', 1.00, 1),
(8, 'Armenia', 'AM / ARM', '374', 1.00, 1),
(9, 'Aruba', 'AW / ABW', '297', 1.00, 0),
(10, 'Australia', 'AU / AUS', '61', 1.00, 1),
(11, 'Austria', 'AT / AUT', '43', 1.00, 1),
(12, 'Azerbaijan', 'AZ / AZE', '994', 1.00, 1),
(13, 'Bahrain', 'BH / BHR', '973', 1.00, 1),
(14, 'Bangladesh', 'BD / BGD', '880', 1.00, 1),
(15, 'Belarus', 'BY / BLR', '375', 1.00, 1),
(16, 'Belgium', 'BE / BEL', '32', 1.00, 1),
(17, 'Belize', 'BZ / BLZ', '501', 1.00, 1),
(18, 'Benin', 'BJ / BEN', '229', 1.00, 1),
(19, 'Bhutan', 'BT / BTN', '975', 1.00, 1),
(20, 'Bolivia', 'BO / BOL', '591', 1.00, 1),
(21, 'Bosnia and Herzegovina', 'BA / BIH', '387', 1.00, 1),
(22, 'Botswana', 'BW / BWA', '267', 1.00, 1),
(23, 'Brazil', 'BR / BRA', '55', 1.00, 1),
(24, 'Brunei', 'BN / BRN', '673', 1.00, 1),
(25, 'Bulgaria', 'BG / BGR', '359', 1.00, 1),
(26, 'Burkina Faso', 'BF / BFA', '226', 1.00, 1),
(27, 'Burma (Myanmar)', 'MM / MMR', '95', 1.00, 1),
(28, 'Burundi', 'BI / BDI', '257', 1.00, 1),
(29, 'Cambodia', 'KH / KHM', '855', 1.00, 1),
(30, 'Cameroon', 'CM / CMR', '237', 1.00, 1),
(31, 'Canada', 'CA / CAN', '1', 1.00, 1),
(32, 'Cape Verde', 'CV / CPV', '238', 1.00, 1),
(33, 'Central African Republic', 'CF / CAF', '236', 1.00, 1),
(34, 'Chad', 'TD / TCD', '235', 1.00, 1),
(35, 'Chile', 'CL / CHL', '56', 1.00, 1),
(36, 'China', 'CN / CHN', '86', 1.00, 1),
(37, 'Christmas Island', 'CX / CXR', '61', 1.00, 1),
(38, 'Cocos (Keeling) Islands', 'CC / CCK', '61', 1.00, 1),
(39, 'Colombia', 'CO / COL', '57', 1.00, 1),
(40, 'Comoros', 'KM / COM', '269', 1.00, 1),
(41, 'Cook Islands', 'CK / COK', '682', 1.00, 1),
(42, 'Costa Rica', 'CR / CRC', '506', 1.00, 1),
(43, 'Croatia', 'HR / HRV', '385', 1.00, 1),
(44, 'Cuba', 'CU / CUB', '53', 1.00, 1),
(45, 'Cyprus', 'CY / CYP', '357', 1.00, 1),
(46, 'Czech Republic', 'CZ / CZE', '420', 1.00, 1),
(47, 'Congo', 'CD / COD', '243', 1.00, 1),
(48, 'Denmark', 'DK / DNK', '45', 1.00, 1),
(49, 'Djibouti', 'DJ / DJI', '253', 1.00, 1),
(50, 'Ecuador', 'EC / ECU', '593', 1.00, 1),
(51, 'Egypt', 'EG / EGY', '20', 1.00, 1),
(52, 'El Salvador', 'SV / SLV', '503', 1.00, 1),
(53, 'Equatorial Guinea', 'GQ / GNQ', '240', 1.00, 1),
(54, 'Eritrea', 'ER / ERI', '291', 1.00, 1),
(55, 'Estonia', 'EE / EST', '372', 1.00, 1),
(56, 'Ethiopia', 'ET / ETH', '251', 1.00, 1),
(57, 'Falkland Islands', 'FK / FLK', '500', 1.00, 1),
(58, 'Faroe Islands', 'FO / FRO', '298', 1.00, 1),
(59, 'Fiji', 'FJ / FJI', '679', 1.00, 1),
(60, 'Finland', 'FI / FIN', '358', 1.00, 1),
(61, 'France', 'FR / FRA', '33', 1.00, 1),
(62, 'French Polynesia', 'PF / PYF', '689', 1.00, 1),
(63, 'Gabon', 'GA / GAB', '241', 1.00, 1),
(64, 'Gambia', 'GM / GMB', '220', 1.00, 1),
(65, 'Gaza Strip', '/', '970', 1.00, 1),
(66, 'Georgia', 'GE / GEO', '995', 1.00, 1),
(67, 'Germany', 'DE / DEU', '49', 1.00, 1),
(68, 'Ghana', 'GH / GHA', '233', 1.00, 1),
(69, 'Gibraltar', 'GI / GIB', '350', 1.00, 1),
(70, 'Greece', 'GR / GRC', '30', 1.00, 1),
(71, 'Greenland', 'GL / GRL', '299', 1.00, 1),
(72, 'Guatemala', 'GT / GTM', '502', 1.00, 1),
(73, 'Guinea', 'GN / GIN', '224', 1.00, 1),
(74, 'Guinea-Bissau', 'GW / GNB', '245', 1.00, 1),
(75, 'Guyana', 'GY / GUY', '592', 1.00, 1),
(76, 'Haiti', 'HT / HTI', '509', 1.00, 1),
(77, 'Holy See (Vatican City)', 'VA / VAT', '39', 1.00, 1),
(78, 'Honduras', 'HN / HND', '504', 1.00, 1),
(79, 'Hong Kong', 'HK / HKG', '852', 1.00, 1),
(80, 'Hungary', 'HU / HUN', '36', 1.00, 1),
(81, 'Iceland', 'IS / IS', '354', 1.00, 1),
(82, 'India', 'IN / IND', '91', 1.00, 1),
(83, 'Indonesia', 'ID / IDN', '62', 1.00, 1),
(84, 'Iran', 'IR / IRN', '98', 1.00, 1),
(85, 'Iraq', 'IQ / IRQ', '964', 1.00, 1),
(86, 'Ireland', 'IE / IRL', '353', 1.00, 1),
(87, 'Isle of Man', 'IM / IMN', '44', 1.00, 1),
(88, 'Israel', 'IL / ISR', '972', 1.00, 1),
(89, 'Italy', 'IT / ITA', '39', 1.00, 1),
(90, 'Ivory Coast', 'CI / CIV', '225', 1.00, 1),
(91, 'Japan', 'JP / JPN', '81', 1.00, 1),
(92, 'Jordan', 'JO / JOR', '962', 1.00, 1),
(93, 'Kazakhstan', 'KZ / KAZ', '7', 1.00, 1),
(94, 'Kenya', 'KE / KEN', '254', 1.00, 1),
(95, 'Kiribati', 'KI / KIR', '686', 1.00, 1),
(96, 'Kosovo', '/', '381', 1.00, 1),
(97, 'Kuwait', 'KW / KWT', '965', 1.00, 1),
(98, 'Kyrgyzstan', 'KG / KGZ', '996', 1.00, 1),
(99, 'Laos', 'LA / LAO', '856', 1.00, 1),
(100, 'Latvia', 'LV / LVA', '371', 1.00, 1),
(101, 'Lebanon', 'LB / LBN', '961', 1.00, 1),
(102, 'Lesotho', 'LS / LSO', '266', 1.00, 1),
(103, 'Liberia', 'LR / LBR', '231', 1.00, 1),
(104, 'Libya', 'LY / LBY', '218', 1.00, 1),
(105, 'Liechtenstein', 'LI / LIE', '423', 1.00, 1),
(106, 'Lithuania', 'LT / LTU', '370', 1.00, 1),
(107, 'Luxembourg', 'LU / LUX', '352', 1.00, 1),
(108, 'Macau', 'MO / MAC', '853', 1.00, 1),
(109, 'Macedonia', 'MK / MKD', '389', 1.00, 1),
(110, 'Madagascar', 'MG / MDG', '261', 1.00, 1),
(111, 'Malawi', 'MW / MWI', '265', 1.00, 1),
(112, 'Malaysia', 'MY / MYS', '60', 1.00, 1),
(113, 'Maldives', 'MV / MDV', '960', 1.00, 1),
(114, 'Mali', 'ML / MLI', '223', 1.00, 1),
(115, 'Malta', 'MT / MLT', '356', 1.00, 1),
(116, 'Marshall Islands', 'MH / MHL', '692', 1.00, 1),
(117, 'Mauritania', 'MR / MRT', '222', 1.00, 1),
(118, 'Mauritius', 'MU / MUS', '230', 1.00, 1),
(119, 'Mayotte', 'YT / MYT', '262', 1.00, 1),
(120, 'Mexico', 'MX / MEX', '52', 1.00, 1),
(121, 'Micronesia', 'FM / FSM', '691', 1.00, 1),
(122, 'Moldova', 'MD / MDA', '373', 1.00, 1),
(123, 'Monaco', 'MC / MCO', '377', 1.00, 1),
(124, 'Mongolia', 'MN / MNG', '976', 1.00, 1),
(125, 'Montenegro', 'ME / MNE', '382', 1.00, 1),
(126, 'Morocco', 'MA / MAR', '212', 1.00, 1),
(127, 'Mozambique', 'MZ / MOZ', '258', 1.00, 1),
(128, 'Namibia', 'NA / NAM', '264', 1.00, 1),
(129, 'Nauru', 'NR / NRU', '674', 1.00, 1),
(130, 'Nepal', 'NP / NPL', '977', 1.00, 1),
(131, 'Netherlands', 'NL / NLD', '31', 1.00, 1),
(132, 'Netherlands Antilles', 'AN / ANT', '599', 1.00, 1),
(133, 'New Caledonia', 'NC / NCL', '687', 1.00, 1),
(134, 'New Zealand', 'NZ / NZL', '64', 1.00, 1),
(135, 'Nicaragua', 'NI / NIC', '505', 1.00, 1),
(136, 'Niger', 'NE / NER', '227', 1.00, 1),
(137, 'Nigeria', 'NG / NGA', '234', 1.00, 1),
(138, 'Niue', 'NU / NIU', '683', 1.00, 1),
(139, 'Norfolk Island', '/ NFK', '672', 1.00, 1),
(140, 'North Korea', 'KP / PRK', '850', 1.00, 1),
(141, 'Norway', 'NO / NOR', '47', 1.00, 1),
(142, 'Oman', 'OM / OMN', '968', 1.00, 1),
(143, 'Pakistan', 'PK / PAK', '92', 1.00, 1),
(144, 'Palau', 'PW / PLW', '680', 1.00, 1),
(145, 'Panama', 'PA / PAN', '507', 1.00, 1),
(146, 'Papua New Guinea', 'PG / PNG', '675', 1.00, 1),
(147, 'Paraguay', 'PY / PRY', '595', 1.00, 1),
(148, 'Peru', 'PE / PER', '51', 1.00, 1),
(149, 'Philippines', 'PH / PHL', '63', 1.00, 1),
(150, 'Pitcairn Islands', 'PN / PCN', '870', 1.00, 1),
(151, 'Poland', 'PL / POL', '48', 1.00, 1),
(152, 'Portugal', 'PT / PRT', '351', 1.00, 1),
(153, 'Puerto Rico', 'PR / PRI', '1', 1.00, 1),
(154, 'Qatar', 'QA / QAT', '974', 1.00, 1),
(155, 'Republic of the Congo', 'CG / COG', '242', 1.00, 1),
(156, 'Romania', 'RO / ROU', '40', 1.00, 1),
(157, 'Russia', 'RU / RUS', '7', 1.00, 1),
(158, 'Rwanda', 'RW / RWA', '250', 1.00, 1),
(159, 'Saint Barthelemy', 'BL / BLM', '590', 1.00, 1),
(160, 'Saint Helena', 'SH / SHN', '290', 1.00, 1),
(161, 'Saint Pierre and Miquelon', 'PM / SPM', '508', 1.00, 1),
(162, 'Samoa', 'WS / WSM', '685', 1.00, 1),
(163, 'San Marino', 'SM / SMR', '378', 1.00, 1),
(164, 'Sao Tome and Principe', 'ST / STP', '239', 1.00, 1),
(165, 'Saudi Arabia', 'SA / SAU', '966', 1.00, 1),
(166, 'Senegal', 'SN / SEN', '221', 1.00, 1),
(167, 'Serbia', 'RS / SRB', '381', 1.00, 1),
(168, 'Seychelles', 'SC / SYC', '248', 1.00, 1),
(169, 'Sierra Leone', 'SL / SLE', '232', 1.00, 1),
(170, 'Singapore', 'SG / SGP', '65', 1.00, 1),
(171, 'Slovakia', 'SK / SVK', '421', 1.00, 1),
(172, 'Slovenia', 'SI / SVN', '386', 1.00, 1),
(173, 'Solomon Islands', 'SB / SLB', '677', 1.00, 1),
(174, 'Somalia', 'SO / SOM', '252', 1.00, 1),
(175, 'South Africa', 'ZA / ZAF', '27', 1.00, 1),
(176, 'South Korea', 'KR / KOR', '82', 1.00, 1),
(177, 'Spain', 'ES / ESP', '34', 1.00, 1),
(178, 'Sri Lanka', 'LK / LKA', '94', 1.00, 1),
(179, 'Sudan', 'SD / SDN', '249', 1.00, 1),
(180, 'Suriname', 'SR / SUR', '597', 1.00, 1),
(181, 'Swaziland', 'SZ / SWZ', '268', 1.00, 1),
(182, 'Sweden', 'SE / SWE', '46', 1.00, 1),
(183, 'Switzerland', 'CH / CHE', '41', 1.00, 1),
(184, 'Syria', 'SY / SYR', '963', 1.00, 1),
(185, 'Taiwan', 'TW / TWN', '886', 1.00, 1),
(186, 'Tajikistan', 'TJ / TJK', '992', 1.00, 1),
(187, 'Tanzania', 'TZ / TZA', '255', 1.00, 1),
(188, 'Thailand', 'TH / THA', '66', 1.00, 1),
(189, 'Timor-Leste', 'TL / TLS', '670', 1.00, 1),
(190, 'Togo', 'TG / TGO', '228', 1.00, 1),
(191, 'Tokelau', 'TK / TKL', '690', 1.00, 1),
(192, 'Tonga', 'TO / TON', '676', 1.00, 1),
(193, 'Tunisia', 'TN / TUN', '216', 1.00, 1),
(194, 'Turkey', 'TR / TUR', '90', 1.00, 1),
(195, 'Turkmenistan', 'TM / TKM', '993', 1.00, 1),
(196, 'Tuvalu', 'TV / TUV', '688', 1.00, 1),
(197, 'Uganda', 'UG / UGA', '256', 1.00, 1),
(198, 'Ukraine', 'UA / UKR', '380', 1.00, 1),
(199, 'United Arab Emirates', 'AE / ARE', '971', 1.00, 1),
(200, 'United Kingdom', 'GB / GBR', '44', 1.00, 1),
(201, 'United States', 'US / USA', '1', 1.00, 1),
(202, 'Uruguay', 'UY / URY', '598', 1.00, 1),
(203, 'Uzbekistan', 'UZ / UZB', '998', 1.00, 1),
(204, 'Vanuatu', 'VU / VUT', '678', 1.00, 1),
(205, 'Venezuela', 'VE / VEN', '58', 1.00, 1),
(206, 'Vietnam', 'VN / VNM', '84', 1.00, 1),
(207, 'Wallis and Futuna', 'WF / WLF', '681', 1.00, 1),
(208, 'West Bank', '/', '970', 1.00, 1),
(209, 'Yemen', 'YE / YEM', '967', 1.00, 1),
(210, 'Zambia', 'ZM / ZMB', '260', 1.00, 1),
(211, 'Zimbabwe', 'ZW / ZWE', '263', 1.00, 1);

-- --------------------------------------------------------

--
-- Table structure for table `invoiceitems`
--

CREATE TABLE `invoiceitems` (
  `id` int(10) NOT NULL,
  `cname` varchar(50) NOT NULL,
  `item` text NOT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `qty` int(10) DEFAULT NULL,
  `tamount` decimal(10,2) NOT NULL,
  `invoiceid` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `invoiceitems`
--

INSERT INTO `invoiceitems` (`id`, `cname`, `item`, `price`, `qty`, `tamount`, `invoiceid`) VALUES
(1, 'gaurav', 'Buy SMS Plan Popular Plan', '100.00', 1, '100.00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` int(10) NOT NULL,
  `userid` int(10) NOT NULL,
  `created` date DEFAULT NULL,
  `datepaid` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `subtotal` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL DEFAULT '0.00',
  `status` enum('Unpaid','Paid','Partially Paid','Cancelled') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Unpaid',
  `paymentmethod` text COLLATE utf8_unicode_ci NOT NULL,
  `tax` decimal(10,2) NOT NULL DEFAULT '0.00',
  `discount` decimal(5,2) DEFAULT '0.00',
  `note` text COLLATE utf8_unicode_ci
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `userid`, `created`, `datepaid`, `subtotal`, `total`, `status`, `paymentmethod`, `tax`, `discount`, `note`) VALUES
(1, 1, '2017-11-21', '2017-11-21 00:00:00', '100.00', '100.00', 'Unpaid', 'paypal', '0.00', '0.00', '');

-- --------------------------------------------------------

--
-- Table structure for table `manage_sender`
--

CREATE TABLE `manage_sender` (
  `id` int(10) NOT NULL,
  `s_id` varchar(100) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `manage_sender`
--

INSERT INTO `manage_sender` (`id`, `s_id`, `status`) VALUES
(1, 'Govt', 0),
(3, 'Interpool', 0),
(4, 'Besma', 1);

-- --------------------------------------------------------

--
-- Table structure for table `payment_gateways`
--

CREATE TABLE `payment_gateways` (
  `id` int(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `value` text NOT NULL,
  `settings` text NOT NULL,
  `extra_value` text,
  `status` enum('active','inactive') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment_gateways`
--

INSERT INTO `payment_gateways` (`id`, `name`, `value`, `settings`, `extra_value`, `status`) VALUES
(1, 'Paypal', 'demo@paypal.com', 'paypal', '', 'active'),
(2, 'Stripe', 'pk_test_ARblMczqDw61NusMMs7o1RVK', 'stripe', 'sk_test_BQokikJOvBiI2HlWgH4olfQ2', 'active'),
(3, 'Bank', 'Make a Payment to Our Bank Account &lt;br&gt;Bank Name: Bank Name &lt;br&gt;Account Name: Account Holder Name &lt;br&gt;Account Number: Account Number &lt;br&gt;', 'manualpayment', '', 'active'),
(4, 'Authorize.net', 'YOUR_API_LOGIN_ID', 'authorize_net', 'YOUR_TRANSACTION_KEY', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `sms_gateway`
--

CREATE TABLE `sms_gateway` (
  `id` int(10) NOT NULL,
  `name` text NOT NULL,
  `api_link` text,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `api_id` text,
  `schedule` enum('Yes','No') NOT NULL DEFAULT 'No',
  `status` enum('Active','Inactive') NOT NULL DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sms_gateway`
--

INSERT INTO `sms_gateway` (`id`, `name`, `api_link`, `username`, `password`, `api_id`, `schedule`, `status`) VALUES
(1, 'Twilio', '', 'AC088f9188eec14991f951c524380040a6', '6281689441e3f85579fff9af325129ec', '', 'No', 'Active'),
(2, 'Clickatell', 'http://api.clickatell.com', 'turbo-smsing', 'XICEMNYNMDRDBS', '3537357', 'No', 'Active'),
(3, 'SMSKaufen', 'http://www.smskaufen.com/sms/gateway/sms.php', 'API User Name', 'SMS API Key', '', 'No', 'Active'),
(4, 'Route SMS', 'http://smsplus1.routesms.com:8080/bulksms/bulksms', 'API User Name', 'Password', '', 'No', 'Active'),
(5, 'SMSGlobal', 'http://www.smsglobal.com/http-api.php', 'API User Name', 'Password', '', 'Yes', 'Active'),
(6, 'Nexmo', 'http://rest.nexmo.com/sms/xml', '80db0526', '5beff774', '', 'No', 'Active'),
(7, 'Kapow', 'http://www.kapow.co.uk/scripts/sendsms.php', 'username', 'password', '', 'No', 'Active'),
(8, 'TelAPI', '', 'TestUser', 'Token or password', '', 'No', 'Active'),
(9, 'NibsSMS', 'http://nibssms.com/portal/apiclient', 'Email/User Name', 'User Name', '18', 'Yes', 'Active'),
(10, 'InfoBip', 'http://api.infobip.com/api/v3/sendsms/plain', 'user name', 'password', '', 'No', 'Active'),
(11, 'RANNH', 'http://rannh.com/sendsms.php', 'testuser', 'testpassword', '', 'No', 'Active'),
(12, 'CsNetworks', 'http://api.cs-networks.net', 'softvillagebd', 'shamim+rahman+97', '', 'No', 'Active'),
(13, 'Bulk SMS', 'http://bulksms.2way.co.za', 'john', 'abcd1234', NULL, 'No', 'Active'),
(14, 'SMSC', 'http://smsc.i-digital-m.com', 'user', 'password', NULL, 'No', 'Active'),
(15, 'Telenorcsms', 'https://telenorcsms.com.pk', 'xxxx', 'xxx', '', 'No', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `sms_history`
--

CREATE TABLE `sms_history` (
  `id` int(10) NOT NULL,
  `userid` int(10) NOT NULL,
  `sender` varchar(25) NOT NULL,
  `receiver` varchar(25) NOT NULL,
  `amount` int(5) NOT NULL,
  `sms` text NOT NULL,
  `ip` varchar(30) DEFAULT NULL,
  `report` text,
  `reqlogtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `send_by` int(10) DEFAULT NULL,
  `name_sg` text NOT NULL,
  `agent_sg` text NOT NULL,
  `pnr_g` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sms_history`
--

INSERT INTO `sms_history` (`id`, `userid`, `sender`, `receiver`, `amount`, `sms`, `ip`, `report`, `reqlogtime`, `send_by`, `name_sg`, `agent_sg`, `pnr_g`) VALUES
(5, 1, '+13193180761', '+918860551726', 1, 'asdasdasdasdasdasd', '::1', 'date_created Tue', '2017-11-28 12:09:53', 1, 'rohan', 'gaurav chauhan', '');

-- --------------------------------------------------------

--
-- Table structure for table `sms_plan_feature`
--

CREATE TABLE `sms_plan_feature` (
  `id` int(10) NOT NULL,
  `pid` int(10) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `fvalue` varchar(50) NOT NULL,
  `status` int(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sms_plan_feature`
--

INSERT INTO `sms_plan_feature` (`id`, `pid`, `fname`, `fvalue`, `status`) VALUES
(1, 1, 'SMS Credit', '1000', 1),
(2, 1, '24/7 Customer Support', 'Yes', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sms_price_plan`
--

CREATE TABLE `sms_price_plan` (
  `id` int(10) NOT NULL,
  `plan_name` varchar(50) NOT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `popular` int(2) NOT NULL DEFAULT '0',
  `status` int(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sms_price_plan`
--

INSERT INTO `sms_price_plan` (`id`, `plan_name`, `price`, `popular`, `status`) VALUES
(1, 'Popular Plan', '100.00', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sms_transaction`
--

CREATE TABLE `sms_transaction` (
  `id` int(10) NOT NULL,
  `userid` int(10) NOT NULL,
  `amount` int(10) NOT NULL DEFAULT '0',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sms_transaction`
--

INSERT INTO `sms_transaction` (`id`, `userid`, `amount`, `date`) VALUES
(1, 1, 20, '2017-11-21 06:59:14');

-- --------------------------------------------------------

--
-- Table structure for table `supportdepartments`
--

CREATE TABLE `supportdepartments` (
  `id` int(10) NOT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `email` text COLLATE utf8_unicode_ci NOT NULL,
  `order` int(10) NOT NULL,
  `show` enum('Yes','No') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `supportdepartments`
--

INSERT INTO `supportdepartments` (`id`, `name`, `email`, `order`, `show`) VALUES
(1, 'Support Department', 'support@example.com', 1, 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `ticketreplies`
--

CREATE TABLE `ticketreplies` (
  `id` int(10) NOT NULL,
  `tid` int(10) NOT NULL,
  `userid` int(10) NOT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `admin` text COLLATE utf8_unicode_ci NOT NULL,
  `image` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` int(10) NOT NULL,
  `did` int(10) NOT NULL,
  `userid` int(10) NOT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `email` text COLLATE utf8_unicode_ci NOT NULL,
  `date` date NOT NULL DEFAULT '0000-00-00',
  `subject` text COLLATE utf8_unicode_ci NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('Pending','Answered','Customer Reply','In Progress','Closed') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Pending',
  `admin` text COLLATE utf8_unicode_ci NOT NULL,
  `replyby` text COLLATE utf8_unicode_ci NOT NULL,
  `closed_by` text COLLATE utf8_unicode_ci
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accgroups`
--
ALTER TABLE `accgroups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `firstname_lastname` (`name`(32),`lname`(32)),
  ADD KEY `email` (`email`(64));

--
-- Indexes for table `adminperms`
--
ALTER TABLE `adminperms`
  ADD KEY `roleid_permid` (`roleid`,`permid`);

--
-- Indexes for table `adminroles`
--
ALTER TABLE `adminroles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`(32));

--
-- Indexes for table `appconfig`
--
ALTER TABLE `appconfig`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_logs`
--
ALTER TABLE `email_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userid` (`userid`);

--
-- Indexes for table `email_providers`
--
ALTER TABLE `email_providers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`,`language_id`),
  ADD KEY `tplname` (`tplname`(32));

--
-- Indexes for table `email_transaction`
--
ALTER TABLE `email_transaction`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `int_country_codes`
--
ALTER TABLE `int_country_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoiceitems`
--
ALTER TABLE `invoiceitems`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userid` (`userid`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `manage_sender`
--
ALTER TABLE `manage_sender`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_gateways`
--
ALTER TABLE `payment_gateways`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_gateway`
--
ALTER TABLE `sms_gateway`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_history`
--
ALTER TABLE `sms_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_plan_feature`
--
ALTER TABLE `sms_plan_feature`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_price_plan`
--
ALTER TABLE `sms_price_plan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_transaction`
--
ALTER TABLE `sms_transaction`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supportdepartments`
--
ALTER TABLE `supportdepartments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`(64));

--
-- Indexes for table `ticketreplies`
--
ALTER TABLE `ticketreplies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tid_date` (`tid`,`date`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userid` (`userid`),
  ADD KEY `status` (`status`),
  ADD KEY `date` (`date`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accgroups`
--
ALTER TABLE `accgroups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `adminroles`
--
ALTER TABLE `adminroles`
  MODIFY `id` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `appconfig`
--
ALTER TABLE `appconfig`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `email_logs`
--
ALTER TABLE `email_logs`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `email_providers`
--
ALTER TABLE `email_providers`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `email_transaction`
--
ALTER TABLE `email_transaction`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `int_country_codes`
--
ALTER TABLE `int_country_codes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=212;

--
-- AUTO_INCREMENT for table `invoiceitems`
--
ALTER TABLE `invoiceitems`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `manage_sender`
--
ALTER TABLE `manage_sender`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `payment_gateways`
--
ALTER TABLE `payment_gateways`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sms_gateway`
--
ALTER TABLE `sms_gateway`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `sms_history`
--
ALTER TABLE `sms_history`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sms_plan_feature`
--
ALTER TABLE `sms_plan_feature`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sms_price_plan`
--
ALTER TABLE `sms_price_plan`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sms_transaction`
--
ALTER TABLE `sms_transaction`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `supportdepartments`
--
ALTER TABLE `supportdepartments`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ticketreplies`
--
ALTER TABLE `ticketreplies`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
