-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.12-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for sy
DROP DATABASE IF EXISTS `sy`;
CREATE DATABASE IF NOT EXISTS `sy` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `sy`;

-- Dumping structure for table sy.agency
DROP TABLE IF EXISTS `agency`;
CREATE TABLE IF NOT EXISTS `agency` (
  `id` int(11) NOT NULL,
  `short_name` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `short_name` (`short_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table sy.agency: ~9 rows (approximately)
DELETE FROM `agency`;
/*!40000 ALTER TABLE `agency` DISABLE KEYS */;
INSERT INTO `agency` (`id`, `short_name`) VALUES
	(1, 'BEEL'),
	(2, 'GAJA'),
	(3, 'GAMMON'),
	(4, 'INDWELL'),
	(5, 'KANWAR'),
	(6, 'PMPL'),
	(7, 'RVPR'),
	(8, 'SIPPL'),
	(9, 'SVIEPL');
/*!40000 ALTER TABLE `agency` ENABLE KEYS */;

-- Dumping structure for table sy.contract
DROP TABLE IF EXISTS `contract`;
CREATE TABLE IF NOT EXISTS `contract` (
  `id` int(11) NOT NULL,
  `sct_num` varchar(10) NOT NULL,
  `agency_id` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sct_num` (`sct_num`),
  KEY `FK_Contract_agency` (`agency_id`),
  CONSTRAINT `FK_Contract_agency` FOREIGN KEY (`agency_id`) REFERENCES `agency` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table sy.contract: ~14 rows (approximately)
DELETE FROM `contract`;
/*!40000 ALTER TABLE `contract` DISABLE KEYS */;
INSERT INTO `contract` (`id`, `sct_num`, `agency_id`) VALUES
	(1, '1789/1', 7),
	(2, '1789/2', 5),
	(3, '1792-A', 7),
	(4, '1792-B', 8),
	(5, '1792-C', 4),
	(6, '1795-A', 7),
	(7, '1795-B', 8),
	(8, '1851-A', 9),
	(9, '1851-B', 1),
	(10, '1841', 2),
	(11, '1867', 8),
	(12, '1885', 6),
	(13, '1888', 6),
	(14, '1889', 6);
/*!40000 ALTER TABLE `contract` ENABLE KEYS */;

-- Dumping structure for table sy.rsv
DROP TABLE IF EXISTS `rsv`;
CREATE TABLE IF NOT EXISTS `rsv` (
  `id` int(11) NOT NULL,
  `rsv_num` int(11) NOT NULL,
  `issued_on` date DEFAULT NULL,
  `is_cancelled` tinyint(1) DEFAULT 0,
  `scrap_qty` decimal(5,2) NOT NULL DEFAULT 0.00,
  `agency_id` int(11) DEFAULT NULL,
  `sct_ref` int(11) DEFAULT NULL,
  `scrap_type` char(3) DEFAULT NULL,
  `no_of_trips` int(11) DEFAULT NULL,
  `used_from` date DEFAULT NULL,
  `used_till` date DEFAULT NULL,
  `submitted_on` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rsv_num` (`rsv_num`),
  KEY `FK_rsv_agency` (`agency_id`),
  KEY `FK_rsv_contract` (`sct_ref`),
  CONSTRAINT `FK_rsv_agency` FOREIGN KEY (`agency_id`) REFERENCES `agency` (`id`),
  CONSTRAINT `FK_rsv_contract` FOREIGN KEY (`sct_ref`) REFERENCES `contract` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table sy.rsv: ~144 rows (approximately)
DELETE FROM `rsv`;
/*!40000 ALTER TABLE `rsv` DISABLE KEYS */;
INSERT INTO `rsv` (`id`, `rsv_num`, `issued_on`, `is_cancelled`, `scrap_qty`, `agency_id`, `sct_ref`, `scrap_type`, `no_of_trips`, `used_from`, `used_till`, `submitted_on`) VALUES
	(1, 201, '2021-03-20', 1, 0.00, 8, 4, 'CAN', 0, NULL, NULL, NULL),
	(2, 202, '2021-03-23', 1, 0.00, 5, 2, 'CAN', 0, NULL, NULL, NULL),
	(3, 203, '2021-03-31', 1, 0.00, 5, 2, 'CAN', 0, NULL, NULL, NULL),
	(4, 204, '2021-03-31', 1, 0.00, 5, 2, 'CAN', 0, NULL, NULL, NULL),
	(5, 205, '2021-03-31', 0, 22.13, 5, 2, 'TMT', 1, '2021-03-24', '2021-03-24', '2021-03-31'),
	(6, 206, '2021-03-31', 0, 19.83, 5, 2, 'TMT', 1, '2021-03-25', '2021-03-25', '2021-03-30'),
	(7, 207, '2021-03-31', 0, 17.07, 5, 2, 'TMT', 1, '2021-03-27', '2021-03-27', '2021-03-31'),
	(8, 208, '2021-03-31', 0, 8.77, 5, 2, 'TMT', 1, '2021-05-22', '2021-05-22', '2021-05-25'),
	(9, 209, '2021-03-31', 0, 9.97, 5, 2, 'TMT', 1, '2021-05-27', '2021-05-27', '2021-05-27'),
	(10, 210, '2021-04-03', 1, 0.00, 9, 8, 'CAN', 0, NULL, NULL, NULL),
	(11, 211, '2021-04-05', 0, 27.39, 1, 9, 'PKG', 5, '2021-04-05', '2021-04-17', '2021-05-29'),
	(12, 212, '2021-04-05', 0, 19.60, 9, 8, 'PKG', 2, '2021-04-03', '2021-04-05', '2021-06-11'),
	(13, 213, '2021-04-06', 0, 33.29, 9, 8, 'PKG', 3, '2021-04-07', '2021-04-11', '2021-06-11'),
	(14, 214, '2021-04-07', 0, 35.42, 8, 4, 'STR', 9, '2021-04-07', '2021-04-19', '2021-06-11'),
	(15, 215, '2021-04-15', 0, 21.45, 7, 3, 'STR', 7, '2021-04-16', '2021-04-28', '2021-06-12'),
	(16, 216, '2021-04-26', 1, 0.00, 4, 5, 'CAN', 0, NULL, NULL, NULL),
	(17, 217, '2021-04-27', 0, 27.74, 7, 1, 'TMT', 7, '2021-04-28', '2021-05-23', '2021-06-11'),
	(18, 218, '2021-04-27', 0, 45.81, 7, 3, 'STR', 13, '2021-05-10', '2021-05-21', '2021-06-11'),
	(19, 219, '2021-05-03', 1, 0.00, 4, 5, 'CAN', 0, NULL, NULL, NULL),
	(20, 220, '2021-05-03', 0, 5.45, 1, 9, 'PKG', 1, '2021-05-25', '2021-05-25', '2021-05-25'),
	(21, 221, '2021-05-05', 0, 3.15, 8, 11, 'STR', 1, '2021-05-05', '2021-05-05', '2021-06-07'),
	(22, 222, '2021-05-10', 1, 0.00, 4, 5, 'CAN', 0, NULL, NULL, NULL),
	(23, 223, '2021-05-25', 0, 2.57, 7, 1, 'TMT', 1, '2021-06-25', '2021-06-25', '2021-06-25'),
	(24, 224, '2021-05-25', 1, 0.00, 7, 3, 'CAN', 0, NULL, NULL, NULL),
	(25, 225, '2021-05-26', 0, 3.51, 7, 3, 'STR', 1, '2021-05-26', '2021-05-26', '2021-05-26'),
	(26, 226, '2021-05-26', 0, 9.79, 7, 1, 'TMT', 2, '2021-05-26', '2021-05-26', '2021-05-26'),
	(27, 227, '2021-05-27', 0, 4.20, 1, 9, 'PKG', 1, '2021-05-27', '2021-05-27', '2021-05-29'),
	(28, 228, '2021-05-27', 0, 3.00, 7, 1, 'TMT', 1, '2021-05-28', '2021-05-28', '2021-05-28'),
	(29, 229, '2021-05-27', 0, 8.94, 7, 1, 'TMT', 1, '2021-05-31', '2021-05-31', '2021-05-31'),
	(30, 230, '2021-05-28', 0, 24.84, 1, 9, 'PKG', 4, '2021-04-23', '2021-05-23', '2021-05-29'),
	(31, 231, '2021-05-31', 0, 4.01, 7, 1, 'TMT', 1, '2021-06-01', '2021-06-01', '2021-06-01'),
	(32, 232, '2021-05-31', 0, 4.89, 7, 1, 'TMT', 1, '2021-06-03', '2021-06-03', '2021-06-04'),
	(33, 233, '2021-05-31', 1, 0.00, 4, 5, 'CAN', 0, NULL, NULL, NULL),
	(34, 234, '2021-05-31', 0, 6.65, 4, 5, 'STR', 1, '2021-05-31', '2021-06-01', '2021-06-01'),
	(35, 235, '2021-06-01', 0, 65.69, 8, 4, 'STR', 17, '2021-03-24', '2021-04-03', '2021-06-07'),
	(36, 236, '2021-06-01', 1, 0.00, 8, 4, 'CAN', 0, NULL, NULL, NULL),
	(37, 237, '2021-06-02', 0, 5.35, 1, 9, 'PKG', 1, '2021-06-02', '2021-06-02', '2021-06-03'),
	(38, 238, '2021-06-02', 0, 3.40, 7, 3, 'STR', 1, '2021-06-02', '2021-06-02', '2021-06-02'),
	(39, 239, '2021-06-02', 0, 2.28, 7, 3, 'STR', 1, '2021-06-02', '2021-06-02', '2021-06-03'),
	(40, 240, '2021-06-03', 0, 4.99, 1, 9, 'PKG', 1, '2021-06-03', '2021-06-03', '2021-06-04'),
	(41, 241, '2021-06-04', 0, 2.87, 7, 3, 'STR', 1, '2021-06-04', '2021-06-04', '2021-06-05'),
	(42, 242, '2021-06-04', 0, 2.32, 7, 1, 'TMT', 1, '2021-06-12', '2021-06-12', '2021-06-14'),
	(43, 243, '2021-06-05', 0, 3.90, 7, 3, 'STR', 1, '2021-06-05', '2021-06-05', '2021-06-07'),
	(44, 244, '2021-06-07', 0, 5.46, 1, 9, 'PKG', 1, '2021-06-07', '2021-06-07', '2021-06-09'),
	(45, 245, '2021-06-07', 0, 3.33, 7, 3, 'STR', 1, '2021-06-07', '2021-06-07', '2021-06-09'),
	(46, 246, '2021-06-08', 0, 3.64, 7, 3, 'STR', 1, '2021-06-08', '2021-06-08', '2021-06-09'),
	(47, 247, '2021-06-09', 0, 3.77, 7, 3, 'STR', 1, '2021-06-09', '2021-06-09', '2021-06-11'),
	(48, 248, '2021-06-10', 0, 8.83, 7, 3, 'STR', 2, '2021-06-10', '2021-06-10', '2021-06-11'),
	(49, 249, '2021-06-11', 0, 6.88, 7, 3, 'STR', 2, '2021-06-11', '2021-06-11', '2021-06-14'),
	(50, 250, '2021-06-12', 0, 24.15, 4, 5, 'STR', 6, '2021-04-26', '2021-04-30', '2021-06-12'),
	(51, 251, '2021-06-12', 0, 35.98, 4, 5, 'STR', 8, '2021-05-03', '2021-05-10', '2021-06-12'),
	(52, 252, '2021-06-12', 0, 26.83, 4, 5, 'STR', 6, '2021-05-11', '2021-05-19', '2021-06-12'),
	(53, 253, '2021-06-12', 0, 8.66, 7, 3, 'STR', 2, '2021-06-12', '2021-06-12', '2021-06-15'),
	(54, 254, '2021-06-14', 0, 4.39, 7, 3, 'STR', 1, '2021-06-14', '2021-06-14', '2021-06-15'),
	(55, 255, '2021-06-14', 1, 0.00, 7, 1, 'CAN', 0, NULL, NULL, NULL),
	(56, 256, '2021-06-15', 0, 9.97, 7, 3, 'STR', 2, '2021-06-15', '2021-06-15', '2021-06-18'),
	(57, 257, '2021-06-15', 0, 9.71, 2, 10, 'TMT', 1, '2021-06-16', '2021-06-16', '2021-06-18'),
	(58, 258, '2021-06-16', 0, 8.38, 7, 3, 'STR', 2, '2021-06-16', '2021-06-16', '2021-06-18'),
	(59, 259, NULL, 1, 0.00, 5, 2, 'CAN', 0, NULL, NULL, NULL),
	(60, 260, NULL, 1, 0.00, 5, 2, 'CAN', 0, NULL, NULL, NULL),
	(61, 261, '2021-06-17', 0, 8.57, 7, 3, 'STR', 2, '2021-06-17', '2021-06-17', '2021-06-18'),
	(62, 262, '2021-06-18', 0, 4.54, 7, 3, 'STR', 1, '2021-06-18', '2021-06-18', '2021-06-25'),
	(63, 263, '2021-06-18', 0, 7.72, 7, 3, 'STR', 2, '2021-06-25', '2021-06-25', '2021-06-25'),
	(64, 264, '2021-06-21', 0, 12.12, 2, 10, 'TMT', 1, '2021-06-21', '2021-06-21', '2021-06-22'),
	(65, 265, '2021-06-24', 0, 7.28, 9, 8, 'PKG', 1, '2021-06-24', '2021-06-24', '2021-06-30'),
	(66, 266, '2021-06-25', 0, 9.78, 5, 2, 'TMT', 1, '2021-06-25', '2021-06-25', '2021-06-25'),
	(67, 267, '2021-06-25', 0, 2.18, 5, 2, 'TMT', 1, '2021-06-25', '2021-06-25', '2021-06-25'),
	(68, 268, '2021-06-25', 0, 7.59, 5, 2, 'TMT', 1, '2021-06-29', '2021-06-29', '2021-06-30'),
	(69, 269, '2021-06-26', 0, 9.12, 9, 8, 'PKG', 1, '2021-06-26', '2021-06-26', '2021-07-03'),
	(70, 270, '2021-06-29', 0, 4.37, 7, 3, 'STR', 1, '2021-06-29', '2021-06-29', '2021-07-01'),
	(71, 271, '2021-06-29', 0, 6.07, 5, 2, 'TMT', 1, '2021-07-01', '2021-07-01', '2021-07-02'),
	(72, 272, '2021-06-30', 0, 3.57, 7, 3, 'STR', 1, '2021-06-30', '2021-06-30', '2021-07-01'),
	(73, 273, '2021-07-01', 0, 3.90, 7, 3, 'STR', 1, '2021-07-01', '2021-07-01', '2021-07-03'),
	(74, 274, '2021-07-01', 0, 4.84, 7, 3, 'STR', 1, '2021-07-01', '2021-07-01', '2021-07-07'),
	(75, 275, '2021-07-03', 0, 3.99, 7, 3, 'STR', 1, '2021-07-03', '2021-07-03', '2021-07-07'),
	(76, 276, '2021-07-05', 1, 0.00, 5, 2, 'CAN', 0, NULL, NULL, NULL),
	(77, 277, '2021-07-07', 0, 3.58, 7, 3, 'STR', 1, '2021-07-09', '2021-07-09', '2021-07-12'),
	(78, 278, '2021-07-07', 0, 2.46, 6, 12, 'TMT', 1, '2021-07-08', '2021-07-08', '2021-07-08'),
	(79, 279, '2021-07-07', 0, 2.94, 6, 12, 'TMT', 1, '2021-07-09', '2021-07-09', '2021-07-10'),
	(80, 280, '2021-07-09', 0, 1.86, 6, 12, 'TMT', 1, '2021-07-10', '2021-07-10', '2021-07-10'),
	(81, 281, '2021-07-10', 0, 3.64, 7, 3, 'STR', 1, '2021-07-10', '2021-07-10', '2021-07-12'),
	(82, 282, '2021-07-10', 0, 3.61, 7, 3, 'STR', 1, '2021-07-10', '2021-07-10', '2021-07-12'),
	(83, 283, '2021-07-10', 0, 1.53, 6, 12, 'TMT', 1, '2021-07-12', '2021-07-12', '2021-07-13'),
	(84, 284, '2021-07-12', 0, 2.96, 7, 3, 'STR', 1, '2021-07-12', '2021-07-12', '2021-07-13'),
	(85, 285, '2021-07-12', 0, 4.49, 7, 3, 'STR', 1, '2021-07-12', '2021-07-12', '2021-07-13'),
	(86, 286, '2021-07-13', 0, 4.56, 7, 3, 'STR', 1, '2021-07-13', '2021-07-13', '2021-07-14'),
	(87, 287, '2021-07-13', 0, 4.02, 7, 3, 'STR', 1, '2021-07-13', '2021-07-13', '2021-07-14'),
	(88, 288, '2021-07-13', 0, 1.89, 6, 12, 'TMT', 1, '2021-07-13', '2021-07-13', '2021-07-15'),
	(89, 289, '2021-07-13', 0, 4.88, 7, 3, 'STR', 1, '2021-07-14', '2021-07-14', '2021-08-02'),
	(90, 290, '2021-07-14', 0, 5.23, 7, 3, 'STR', 1, '2021-07-15', '2021-07-15', '2021-08-02'),
	(91, 291, '2021-07-14', 0, 5.76, 5, 2, 'TMT', 1, '2021-07-14', '2021-07-14', '2021-07-14'),
	(92, 292, '2021-07-15', 0, 1.51, 6, 12, 'TMT', 1, '2021-07-15', '2021-07-15', '2021-08-03'),
	(93, 293, NULL, 1, 0.00, 3, NULL, 'CAN', 0, NULL, NULL, NULL),
	(94, 294, '2021-08-02', 0, 3.96, 7, 3, 'STR', 1, '2021-08-03', '2021-08-03', '2021-08-05'),
	(95, 295, '2021-08-02', 1, 0.00, 6, 12, 'CAN', 0, NULL, NULL, NULL),
	(96, 296, '2021-08-03', 0, 2.75, 7, 3, 'STR', 1, '2021-08-03', '2021-08-03', '2021-08-05'),
	(97, 297, '2021-08-03', 0, 3.39, 6, 13, 'STR', 1, '2021-08-03', '2021-08-03', '2021-08-04'),
	(98, 298, '2021-08-04', 0, 8.65, 7, 3, 'STR', 2, '2021-08-04', '2021-08-04', '2021-08-05'),
	(99, 299, '2021-08-04', 0, 1.82, 6, 14, 'STR', 1, '2021-08-04', '2021-08-04', '2021-08-05'),
	(100, 300, '2021-08-05', 0, 4.07, 7, 3, 'STR', 1, '2021-08-05', '2021-08-05', '2021-08-05'),
	(101, 401, '2021-08-05', 0, 2.28, 6, 13, 'STR', 1, '2021-08-05', '2021-08-05', '2021-08-05'),
	(102, 402, '2021-08-05', 0, 3.41, 7, 3, 'STR', 1, '2021-08-05', '2021-08-05', '2021-08-06'),
	(103, 403, '2021-08-06', 0, 4.79, 7, 3, 'STR', 1, '2021-08-06', '2021-08-06', '2021-08-06'),
	(104, 404, '2021-08-06', 0, 4.31, 7, 3, 'STR', 1, '2021-08-06', '2021-08-06', '2021-08-06'),
	(105, 405, '2021-08-06', 0, 1.77, 6, 12, 'TMT', 1, '2021-08-06', '2021-08-06', '2021-08-06'),
	(106, 406, '2021-08-06', 0, 1.48, 6, 12, 'TMT', 1, '2021-08-06', '2021-08-06', '2021-08-06'),
	(107, 407, '2021-08-06', 0, 4.29, 7, 6, 'STR', 1, '2021-08-07', '2021-08-07', '2021-08-07'),
	(108, 408, '2021-08-07', 0, 3.69, 7, 6, 'STR', 1, '2021-08-07', '2021-08-07', '2021-08-11'),
	(109, 409, '2021-08-09', 0, 1.64, 6, 12, 'TMT', 1, '2021-08-09', '2021-08-09', '2021-08-09'),
	(110, 410, '2021-08-09', 0, 4.42, 7, 6, 'STR', 1, '2021-08-09', '2021-08-09', '2021-08-11'),
	(111, 411, '2021-08-09', 0, 1.73, 6, 12, 'TMT', 1, '2021-08-09', '2021-08-09', '2021-08-09'),
	(112, 412, '2021-08-09', 0, 2.24, 6, 12, 'TMT', 1, '2021-08-10', '2021-08-10', '2021-08-10'),
	(113, 413, '2021-08-11', 0, 2.40, 7, 6, 'STR', 1, '2021-08-11', '2021-08-11', '2021-08-11'),
	(114, 414, '2021-08-11', 1, 0.00, 7, 6, 'CAN', 0, NULL, NULL, NULL),
	(115, 415, '2021-08-12', 0, 2.06, 6, 12, 'TMT', 1, '2021-08-12', '2021-08-12', '2021-08-14'),
	(116, 416, '2021-08-12', 0, 8.34, 9, 8, 'PKG', 1, '2021-08-02', '2021-08-02', '2021-08-19'),
	(117, 417, '2021-08-13', 0, 2.15, 6, 12, 'TMT', 1, '2021-08-13', '2021-08-13', '2021-08-14'),
	(118, 418, '2021-08-14', 0, 1.53, 6, 12, 'TMT', 1, '2021-08-14', '2021-08-14', '2021-08-14'),
	(119, 419, '2021-08-14', 0, 2.33, 6, 12, 'TMT', 1, '2021-08-14', '2021-08-14', '2021-08-16'),
	(120, 420, '2021-08-18', 0, 2.12, 6, 12, 'TMT', 1, '2021-08-18', '2021-08-18', '2021-08-19'),
	(121, 421, '2021-08-19', 0, 2.85, 6, 12, 'TMT', 1, '2021-08-19', '2021-08-19', '2021-08-23'),
	(122, 422, '2021-08-19', 0, 2.07, 6, 12, 'TMT', 1, '2021-08-20', '2021-08-20', '2021-08-23'),
	(123, 423, '2021-08-24', 0, 3.33, 6, 13, 'STR', 1, '2021-08-24', '2021-08-24', '2021-08-28'),
	(124, 424, '2021-08-26', 0, 6.31, 7, 6, 'STR', 1, '2021-08-26', '2021-08-26', '2021-08-28'),
	(125, 425, '2021-08-27', 0, 4.65, 7, 6, 'STR', 1, '2021-08-27', '2021-08-27', '2021-08-28'),
	(126, 426, '2021-08-28', 0, 3.41, 6, 14, 'STR', 1, '2021-08-28', '2021-08-28', '2021-09-04'),
	(127, 427, '2021-08-28', 0, 5.94, 7, 6, 'STR', 1, '2021-08-28', '2021-08-28', '2021-09-03'),
	(128, 428, '2021-08-31', 0, 2.90, 8, 11, 'PKG', 1, '2021-09-01', '2021-09-01', '2021-09-03'),
	(129, 429, '2021-09-03', 0, 5.24, 7, 6, 'STR', 1, '2021-09-03', '2021-09-03', '2021-09-03'),
	(130, 430, '2021-09-03', 0, 6.30, 7, 6, 'STR', 1, '2021-09-07', '2021-09-07', '2021-09-08'),
	(131, 431, '2021-09-04', 1, 0.00, 6, 14, 'CAN', 0, NULL, NULL, NULL),
	(132, 432, '2021-09-08', 0, 6.35, 7, 6, 'STR', 1, '2021-09-08', '2021-09-08', '2021-09-08'),
	(133, 433, '2021-09-09', 0, 5.74, 7, 6, 'STR', 1, '2021-09-09', '2021-09-09', '2021-09-13'),
	(134, 434, '2021-09-09', 0, 6.42, 7, 6, 'STR', 1, '2021-09-11', '2021-09-11', '2021-09-13'),
	(135, 435, '2021-09-09', 0, 1.50, 6, 12, 'TMT', 1, '2021-09-09', '2021-09-09', '2021-09-09'),
	(136, 436, '2021-09-11', 0, 2.36, 6, 12, 'TMT', 1, '2021-09-11', '2021-09-11', '2021-09-11'),
	(137, 437, '2021-09-13', 0, 2.07, 6, 12, 'TMT', 1, '2021-09-13', '2021-09-13', '2021-09-15'),
	(138, 438, '2021-09-13', 0, 6.38, 7, 6, 'STR', 1, '2021-09-13', '2021-09-13', '2021-09-14'),
	(139, 439, '2021-09-14', 0, 6.35, 7, 6, 'STR', 1, '2021-09-14', '2021-09-14', '2021-09-18'),
	(140, 440, '2021-09-14', 0, 5.53, 7, 6, 'STR', 1, '2021-09-15', '2021-09-15', '2021-09-18'),
	(141, 441, '2021-09-15', 0, 2.99, 6, 12, 'TMT', 1, '2021-09-15', '2021-09-15', '2021-09-16'),
	(142, 442, '2021-09-16', 0, 2.40, 6, 12, 'TMT', 1, '2021-09-16', '2021-09-16', '2021-09-16'),
	(143, 443, '2021-09-16', 0, 2.98, 2, 10, 'TMT', 1, '2021-09-16', '2021-09-16', NULL),
	(144, 444, '2021-09-18', 0, 0.00, 7, 6, 'STR', NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `rsv` ENABLE KEYS */;

-- Dumping structure for table sy.stock
DROP TABLE IF EXISTS `stock`;
CREATE TABLE IF NOT EXISTS `stock` (
  `sct_ref` int(11) DEFAULT NULL,
  `inward_qty` decimal(6,2) NOT NULL DEFAULT 0.00,
  KEY `FK_stock_contract` (`sct_ref`),
  CONSTRAINT `FK_stock_contract` FOREIGN KEY (`sct_ref`) REFERENCES `contract` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table sy.stock: ~14 rows (approximately)
DELETE FROM `stock`;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` (`sct_ref`, `inward_qty`) VALUES
	(NULL, 0.00),
	(1, 63.26),
	(2, 109.15),
	(3, 251.48),
	(4, 101.11),
	(5, 93.61),
	(6, 14.80),
	(8, 77.63),
	(9, 77.68),
	(10, 21.83),
	(11, 3.15),
	(12, 36.16),
	(13, 5.67),
	(14, 1.82);
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
