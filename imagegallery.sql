-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 21, 2014 at 02:58 PM
-- Server version: 5.6.16
-- PHP Version: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `imagegallery`
--

create database imagegallery;

use imagegallery;

-- --------------------------------------------------------

--
-- Table structure for table `aboutimage`
--

CREATE TABLE IF NOT EXISTS `aboutimage` (
  `id` int(11) NOT NULL,
  `imagename` varchar(255) NOT NULL,
  `imagetype` varchar(15) NOT NULL,
  `imagesize` int(11) NOT NULL,
  `imagewidth` int(11) NOT NULL,
  `imageheight` int(11) NOT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `aboutimage`
--

INSERT INTO `aboutimage` (`id`, `imagename`, `imagetype`, `imagesize`, `imagewidth`, `imageheight`) VALUES
(481, '1.jpg', 'image/jpeg', 399654, 2048, 1363),
(482, '10.JPG', 'image/jpeg', 233861, 2048, 1148),
(483, '11.JPG', 'image/jpeg', 258528, 2048, 1148),
(484, '12.JPG', 'image/jpeg', 525027, 2048, 1148),
(485, '13.JPG', 'image/jpeg', 407073, 2048, 1148),
(486, '14.JPG', 'image/jpeg', 613975, 2048, 1148),
(487, '15.JPG', 'image/jpeg', 431438, 2048, 1148),
(488, '16.JPG', 'image/jpeg', 232024, 2048, 1148),
(489, '17.JPG', 'image/jpeg', 267742, 2048, 1148),
(490, '18.JPG', 'image/jpeg', 326383, 2048, 1148),
(491, '19.JPG', 'image/jpeg', 279633, 2048, 1148),
(492, '2.jpg', 'image/jpeg', 441643, 2048, 1363),
(493, '20.JPG', 'image/jpeg', 325414, 2048, 1148),
(494, '21.JPG', 'image/jpeg', 327597, 2048, 1148),
(495, '22.JPG', 'image/jpeg', 307825, 2048, 1148),
(496, '23.JPG', 'image/jpeg', 389885, 1148, 2048),
(497, '24.JPG', 'image/jpeg', 960634, 2048, 1148),
(498, '25.JPG', 'image/jpeg', 359552, 2048, 1148),
(499, '26.JPG', 'image/jpeg', 304426, 2048, 1148),
(500, '27.JPG', 'image/jpeg', 225952, 2048, 1148),
(501, '28.JPG', 'image/jpeg', 192304, 2048, 1148),
(502, '29.JPG', 'image/jpeg', 736918, 2048, 1148),
(503, '3.JPG', 'image/jpeg', 257187, 2048, 1151),
(504, '30.JPG', 'image/jpeg', 549554, 2048, 1148),
(505, '31.JPG', 'image/jpeg', 203771, 2048, 1365),
(506, '32.png', 'image/png', 1408960, 1920, 1080),
(507, '33.jpg', 'image/jpeg', 720352, 2048, 1365),
(508, '34.jpg', 'image/jpeg', 634454, 2048, 1365),
(509, '4.JPG', 'image/jpeg', 501084, 2048, 1204),
(510, '5.JPG', 'image/jpeg', 221164, 1148, 2048),
(511, '6.JPG', 'image/jpeg', 174794, 2048, 1148),
(512, '7.JPG', 'image/jpeg', 224432, 2048, 1148),
(513, '8.JPG', 'image/jpeg', 262823, 2048, 1148),
(514, '9.JPG', 'image/jpeg', 257298, 2048, 1148),
(515, '35.jpg', 'image/jpeg', 224332, 2048, 1148),
(516, '36.jpg', 'image/jpeg', 232347, 2048, 1148);

-- --------------------------------------------------------

--
-- Table structure for table `image`
--

CREATE TABLE IF NOT EXISTS `image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imagename` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=517 ;

--
-- Dumping data for table `image`
--

INSERT INTO `image` (`id`, `imagename`) VALUES
(481, '1.jpg'),
(482, '10.JPG'),
(483, '11.JPG'),
(484, '12.JPG'),
(485, '13.JPG'),
(486, '14.JPG'),
(487, '15.JPG'),
(488, '16.JPG'),
(489, '17.JPG'),
(490, '18.JPG'),
(491, '19.JPG'),
(492, '2.jpg'),
(493, '20.JPG'),
(494, '21.JPG'),
(495, '22.JPG'),
(496, '23.JPG'),
(497, '24.JPG'),
(498, '25.JPG'),
(499, '26.JPG'),
(500, '27.JPG'),
(501, '28.JPG'),
(502, '29.JPG'),
(503, '3.JPG'),
(504, '30.JPG'),
(505, '31.JPG'),
(506, '32.png'),
(507, '33.jpg'),
(508, '34.jpg'),
(509, '4.JPG'),
(510, '5.JPG'),
(511, '6.JPG'),
(512, '7.JPG'),
(513, '8.JPG'),
(514, '9.JPG'),
(515, '35.jpg'),
(516, '36.jpg');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `aboutimage`
--
ALTER TABLE `aboutimage`
  ADD CONSTRAINT `aboutimage_ibfk_1` FOREIGN KEY (`id`) REFERENCES `image` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
