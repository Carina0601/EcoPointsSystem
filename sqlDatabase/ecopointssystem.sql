-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 10, 2026 at 04:59 PM
-- Server version: 9.1.0
-- PHP Version: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecopointssystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `achievement`
--

DROP TABLE IF EXISTS `achievement`;
CREATE TABLE IF NOT EXISTS `achievement` (
  `ach_id` varchar(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` enum('Badge','E-certificate') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `source` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `challenge_id` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  PRIMARY KEY (`ach_id`),
  UNIQUE KEY `ach_id` (`ach_id`),
  KEY `challenge_id` (`challenge_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `achievement`
--

INSERT INTO `achievement` (`ach_id`, `name`, `type`, `source`, `challenge_id`, `is_deleted`) VALUES
('ACH001', 'Ocean Saver', 'Badge', 'uploads/achievements/badges/ACH001.png', 'CL002', 0),
('ACH002', 'Paper Master', 'Badge', 'uploads/achievements/badges/ACH002.png', 'CL003', 0),
('ACH003', 'Eco Explorer', 'Badge', 'uploads/achievements/badges/ACH003.png', 'CL001', 0),
('ACH004', 'Glass Guardian', 'E-certificate', 'uploads/achievements/e-certificates/ACH004.png', 'CL004', 0),
('ACH005', 'UNESCO Warrior', 'Badge', 'uploads/achievements/badges/ACH005.png', 'CL005', 0);

-- --------------------------------------------------------

--
-- Table structure for table `achievement_history`
--

DROP TABLE IF EXISTS `achievement_history`;
CREATE TABLE IF NOT EXISTS `achievement_history` (
  `ach_history_id` varchar(10) NOT NULL,
  `challenger_id` varchar(10) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `ach_id` varchar(10) NOT NULL,
  PRIMARY KEY (`ach_history_id`),
  UNIQUE KEY `ach_history_id` (`ach_history_id`),
  KEY `challenger_id` (`challenger_id`),
  KEY `ach_id` (`ach_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `achievement_history`
--

INSERT INTO `achievement_history` (`ach_history_id`, `challenger_id`, `date`, `time`, `ach_id`) VALUES
('AH001', 'C001', '2026-01-09', '06:44:20', 'ACH005'),
('AH002', 'C001', '2026-01-09', '14:46:26', 'ACH002'),
('AH003', 'C002', '2026-01-09', '14:47:12', 'ACH004'),
('AH004', 'C006', '2026-01-09', '14:48:58', 'ACH004');

-- --------------------------------------------------------

--
-- Table structure for table `announcement`
--

DROP TABLE IF EXISTS `announcement`;
CREATE TABLE IF NOT EXISTS `announcement` (
  `ann_id` varchar(10) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `file_path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `created_at` date NOT NULL,
  `admin_id` varchar(10) NOT NULL,
  PRIMARY KEY (`ann_id`),
  UNIQUE KEY `ann_id` (`ann_id`),
  KEY `admin_id` (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `announcement`
--

INSERT INTO `announcement` (`ann_id`, `title`, `content`, `file_path`, `created_at`, `admin_id`) VALUES
('ANN001', 'New Monthly Eco Challenge is Live!', 'The latest Eco Challenge has officially begun! Earn points by completing recycling tasks, joining eco-friendly events, and making small, sustainable changes in your daily routine. Check the “Challenges” section to get started today!', NULL, '2025-12-23', 'A001'),
('ANN002', 'System Maintenance Notice', 'The Eco Points System will undergo scheduled maintenance on 11/12/2025 at 12.00 AM. During this period, submissions and point claims may be temporarily unavailable. We appreciate your patience and understanding.', NULL, '2025-12-25', 'A002'),
('ANN003', 'New Rewards Added to the Store!', 'We’ve expanded our Rewards section with new eco-friendly gifts, vouchers, and merchandise. Redeem your Eco Points for items that support a sustainable lifestyle. Visit the Reward Store to browse the latest additions!', 'uploads/announcements/ANN003.png', '2025-12-26', 'A003'),
('ANN004', 'Congratulations to Our Eco Heroes!', 'A round of applause to all participants who completed last month’s Eco Challenges! Your dedication helped us achieve an impressive recycling total. Check the leaderboard to see the top performers and aim for the next milestone!', 'uploads/announcements/ANN004.webp', '2025-12-27', 'A004'),
('ANN005', 'Scheduled System Downtime for Performance Upgrade', 'To ensure smoother performance and better accuracy in point calculations, the Eco Points System will be undergoing a planned maintenance session on 1/1/2026 from 3.00 PM to 4.00 PM.\r\nDuring this period, users may not be able to submit challenges, view point balances, or access the Rewards section.\r\nWe recommend completing any urgent submissions before the downtime begins.\r\nThank you for your patience as we work to improve your experience and keep our system running efficiently!', NULL, '2025-12-30', 'A005');

-- --------------------------------------------------------

--
-- Table structure for table `challenge`
--

DROP TABLE IF EXISTS `challenge`;
CREATE TABLE IF NOT EXISTS `challenge` (
  `challenge_id` varchar(10) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `type` enum('Event','Recycling') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `points` int NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `partner_id` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `no_of_times` int DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  PRIMARY KEY (`challenge_id`),
  UNIQUE KEY `challenge_id` (`challenge_id`),
  UNIQUE KEY `challenge_id_2` (`challenge_id`),
  KEY `partner_id` (`partner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `challenge`
--

INSERT INTO `challenge` (`challenge_id`, `name`, `type`, `points`, `start_date`, `end_date`, `partner_id`, `no_of_times`, `is_deleted`) VALUES
('CL001', 'Attending 10 Sustainability Events', 'Event', 200, '2025-12-20', NULL, NULL, 10, 0),
('CL002', 'Recycle 10kg of Plastic', 'Recycling', 270, '2025-12-20', NULL, NULL, NULL, 0),
('CL003', 'Recycle 5kg of Paper', 'Recycling', 120, '2025-12-20', NULL, NULL, NULL, 0),
('CL004', 'Recycle 5kg of Glass at Sri Petaling Recycling Centre', 'Recycling', 100, '2025-12-27', '2026-02-01', 'P001', NULL, 0),
('CL005', 'Attending UNESCO Earth Day Cleanup Event', 'Event', 50, '2025-12-25', '2026-01-25', 'P003', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `challenger`
--

DROP TABLE IF EXISTS `challenger`;
CREATE TABLE IF NOT EXISTS `challenger` (
  `challenger_id` varchar(10) NOT NULL,
  `group` enum('Student','Staff') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `total_points` int NOT NULL,
  PRIMARY KEY (`challenger_id`),
  UNIQUE KEY `challenger_id` (`challenger_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `challenger`
--

INSERT INTO `challenger` (`challenger_id`, `group`, `total_points`) VALUES
('C001', 'Student', 5),
('C002', 'Student', 125),
('C003', 'Staff', 100),
('C004', 'Staff', 50),
('C005', 'Student', 75),
('C006', 'Staff', 340),
('C007', 'Student', 0);

-- --------------------------------------------------------

--
-- Table structure for table `challenge_participation`
--

DROP TABLE IF EXISTS `challenge_participation`;
CREATE TABLE IF NOT EXISTS `challenge_participation` (
  `participation_id` varchar(10) NOT NULL,
  `challenger_id` varchar(10) NOT NULL,
  `challenge_id` varchar(10) NOT NULL,
  `status` enum('Joined','Completed') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `joined_date` date NOT NULL,
  `completion_date` date DEFAULT NULL,
  `current_progress` decimal(10,2) NOT NULL,
  PRIMARY KEY (`participation_id`),
  UNIQUE KEY `participation_id` (`participation_id`),
  KEY `challenger_id` (`challenger_id`),
  KEY `challenge_id` (`challenge_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `challenge_participation`
--

INSERT INTO `challenge_participation` (`participation_id`, `challenger_id`, `challenge_id`, `status`, `joined_date`, `completion_date`, `current_progress`) VALUES
('CP001', 'C001', 'CL001', 'Joined', '2026-01-09', NULL, 10.00),
('CP002', 'C001', 'CL003', 'Completed', '2026-01-09', '2026-01-09', 100.00),
('CP003', 'C001', 'CL005', 'Completed', '2026-01-09', '2026-01-09', 100.00),
('CP004', 'C001', 'CL002', 'Joined', '2026-01-09', NULL, 50.00),
('CP005', 'C001', 'CL004', 'Joined', '2026-01-09', NULL, 0.00),
('CP006', 'C002', 'CL002', 'Joined', '2026-01-09', NULL, 30.00),
('CP007', 'C002', 'CL004', 'Completed', '2026-01-09', '2026-01-09', 100.00),
('CP008', 'C002', 'CL001', 'Joined', '2026-01-09', NULL, 10.00),
('CP009', 'C002', 'CL005', 'Joined', '2026-01-09', NULL, 0.00),
('CP010', 'C003', 'CL001', 'Joined', '2026-01-09', NULL, 0.00),
('CP011', 'C003', 'CL002', 'Joined', '2026-01-09', NULL, 0.00),
('CP012', 'C003', 'CL004', 'Joined', '2026-01-09', NULL, 80.00),
('CP013', 'C006', 'CL002', 'Joined', '2026-01-09', NULL, 30.00),
('CP014', 'C006', 'CL004', 'Completed', '2026-01-09', '2026-01-09', 100.00),
('CP015', 'C006', 'CL003', 'Joined', '2026-01-09', NULL, 0.00),
('CP016', 'C006', 'CL001', 'Joined', '2026-01-09', NULL, 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `point_history`
--

DROP TABLE IF EXISTS `point_history`;
CREATE TABLE IF NOT EXISTS `point_history` (
  `pt_history_id` varchar(10) NOT NULL,
  `challenger_id` varchar(10) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `points` int NOT NULL,
  `transaction_type` enum('Earn','Spend') NOT NULL,
  `source_type` enum('Challenge','Reward','Recycling','Daily Quiz') NOT NULL,
  `challenge_id` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `reward_id` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `recycle_history_id` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `quiz_id` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`pt_history_id`),
  UNIQUE KEY `pt_history_id` (`pt_history_id`),
  KEY `challenger_id` (`challenger_id`),
  KEY `challenge_id` (`challenge_id`),
  KEY `reward_id` (`reward_id`),
  KEY `recycle_history_id` (`recycle_history_id`),
  KEY `quiz_id` (`quiz_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `point_history`
--

INSERT INTO `point_history` (`pt_history_id`, `challenger_id`, `date`, `time`, `points`, `transaction_type`, `source_type`, `challenge_id`, `reward_id`, `recycle_history_id`, `quiz_id`) VALUES
('PH001', 'C001', '2026-01-09', '06:07:22', 10, 'Earn', 'Daily Quiz', NULL, NULL, NULL, 'Q001'),
('PH002', 'C006', '2026-01-09', '06:42:25', 10, 'Earn', 'Daily Quiz', NULL, NULL, NULL, 'Q001'),
('PH003', 'C001', '2026-01-09', '06:44:20', 50, 'Earn', 'Challenge', 'CL005', NULL, NULL, NULL),
('PH004', 'C001', '2026-01-09', '14:46:26', 200, 'Earn', 'Recycling', NULL, NULL, 'RH001', NULL),
('PH005', 'C001', '2026-01-09', '14:46:26', 120, 'Earn', 'Challenge', 'CL003', NULL, NULL, NULL),
('PH006', 'C001', '2026-01-09', '14:47:03', 75, 'Earn', 'Recycling', NULL, NULL, 'RH002', NULL),
('PH007', 'C002', '2026-01-09', '14:47:12', 150, 'Earn', 'Recycling', NULL, NULL, 'RH003', NULL),
('PH008', 'C002', '2026-01-09', '14:47:12', 100, 'Earn', 'Challenge', 'CL004', NULL, NULL, NULL),
('PH009', 'C002', '2026-01-09', '14:47:37', 100, 'Earn', 'Recycling', NULL, NULL, 'RH004', NULL),
('PH010', 'C003', '2026-01-09', '14:47:44', 40, 'Earn', 'Recycling', NULL, NULL, 'RH005', NULL),
('PH011', 'C006', '2026-01-09', '14:47:58', 75, 'Earn', 'Recycling', NULL, NULL, 'RH006', NULL),
('PH012', 'C006', '2026-01-09', '14:48:58', 105, 'Earn', 'Recycling', NULL, NULL, 'RH007', NULL),
('PH013', 'C006', '2026-01-09', '14:48:58', 100, 'Earn', 'Challenge', 'CL004', NULL, NULL, NULL),
('PH014', 'C002', '2026-01-09', '14:50:36', 75, 'Earn', 'Recycling', NULL, NULL, 'RH008', NULL),
('PH015', 'C001', '2026-01-09', '14:50:45', 50, 'Earn', 'Recycling', NULL, NULL, 'RH009', NULL),
('PH016', 'C003', '2026-01-09', '14:50:53', 60, 'Earn', 'Recycling', NULL, NULL, 'RH010', NULL),
('PH017', 'C004', '2026-01-09', '14:51:30', 40, 'Earn', 'Recycling', NULL, NULL, 'RH011', NULL),
('PH018', 'C005', '2026-01-09', '14:51:38', 75, 'Earn', 'Recycling', NULL, NULL, 'RH012', NULL),
('PH019', 'C001', '2026-01-09', '14:52:12', 500, 'Spend', 'Reward', NULL, 'RW002', NULL, NULL),
('PH020', 'C002', '2026-01-09', '14:53:40', 300, 'Spend', 'Reward', NULL, 'RW005', NULL, NULL),
('PH021', 'C004', '2026-01-09', '07:01:42', 10, 'Earn', 'Daily Quiz', NULL, NULL, NULL, 'Q001');

-- --------------------------------------------------------

--
-- Table structure for table `proof`
--

DROP TABLE IF EXISTS `proof`;
CREATE TABLE IF NOT EXISTS `proof` (
  `proof_id` varchar(10) NOT NULL,
  `challenger_id` varchar(10) NOT NULL,
  `challenge_id` varchar(10) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `status` enum('Pending','Approved','Rejected') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `file_path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`proof_id`),
  UNIQUE KEY `proof_id` (`proof_id`),
  KEY `challenger_id` (`challenger_id`),
  KEY `challenge_id` (`challenge_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `proof`
--

INSERT INTO `proof` (`proof_id`, `challenger_id`, `challenge_id`, `date`, `time`, `status`, `file_path`) VALUES
('PR001', 'C001', 'CL001', '2025-12-19', '15:38:11', 'Approved', 'uploads/proofs/PR001.pdf'),
('PR002', 'C002', 'CL001', '2025-12-25', '15:21:11', 'Approved', 'uploads/proofs/PR002.pdf'),
('PR003', 'C001', 'CL005', '2025-12-23', '22:51:36', 'Approved', 'uploads/proofs/PR003.pdf'),
('PR004', 'C003', 'CL001', '2025-12-24', '11:55:39', 'Rejected', 'uploads/proofs/PR004.pdf'),
('PR005', 'C002', 'CL001', '2025-12-27', '20:45:39', 'Rejected', 'uploads/proofs/PR005.pdf'),
('PR006', 'C002', 'CL001', '2026-01-09', '06:39:38', 'Rejected', 'uploads/proofs/PR006.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `proposal`
--

DROP TABLE IF EXISTS `proposal`;
CREATE TABLE IF NOT EXISTS `proposal` (
  `proposal_id` varchar(10) NOT NULL,
  `title` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `file_path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `partner_id` varchar(10) NOT NULL,
  `status` enum('Pending','Approved','Rejected') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`proposal_id`),
  UNIQUE KEY `proposal_id` (`proposal_id`),
  KEY `partner_id` (`partner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `proposal`
--

INSERT INTO `proposal` (`proposal_id`, `title`, `date`, `description`, `file_path`, `partner_id`, `status`) VALUES
('PP001', 'Recycle 5kg of Glass at Sri Petaling Recycling Centre', '2025-12-11', 'Participants are required to collect and recycle at least 5kg of glass bottles or jars at the Sri Petaling Recycling Centre. This challenge promotes responsible waste management and reduces landfill burden in the local community.', 'uploads/proposals/PP001.docx', 'P001', 'Approved'),
('PP002', 'Attend the UNESCO Earth Day Cleanup Event', '2025-12-15', 'Join the annual UNESCO Earth Day Cleanup Event, where volunteers gather to remove waste from parks, riversides, and shared public spaces. Participants must register at the event booth and submit a photo of their participation certificates. Completing this challenge contributes to global environmental conservation efforts while raising awareness for Earth Day.', 'uploads/proposals/PP002.docx', 'P002', 'Approved'),
('PP003', 'Plant a Tree in Your Community', '2025-12-23', 'Support biodiversity by planting a tree at a designated green area or approved location. Participants should upload a photo of the planted sapling, the location, and the date. This challenge helps expand green spaces and encourages long-term environmental stewardship.', 'uploads/proposals/PP003.docx', 'P003', 'Pending'),
('PP004', 'Car-Free Day: Walk or Cycle to School/Work', '2025-12-27', 'Reduce carbon emissions by choosing a sustainable commute! For one day, participants must walk, cycle, or use public transport instead of personal vehicles. Submit a short reflection or photo of your eco-friendly commute. Bonus points are awarded for creative or long-distance participation.', 'uploads/proposals/PP004.docx', 'P004', 'Rejected');

-- --------------------------------------------------------

--
-- Table structure for table `quiz`
--

DROP TABLE IF EXISTS `quiz`;
CREATE TABLE IF NOT EXISTS `quiz` (
  `quiz_id` varchar(10) NOT NULL,
  `title` varchar(255) NOT NULL,
  `date_active` date NOT NULL,
  `points` int NOT NULL,
  `question_text` text NOT NULL,
  `option1` varchar(255) NOT NULL,
  `option2` varchar(255) NOT NULL,
  `option3` varchar(255) NOT NULL,
  `option4` varchar(255) NOT NULL,
  `correct_option` varchar(255) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  PRIMARY KEY (`quiz_id`),
  UNIQUE KEY `quiz_id` (`quiz_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `quiz`
--

INSERT INTO `quiz` (`quiz_id`, `title`, `date_active`, `points`, `question_text`, `option1`, `option2`, `option3`, `option4`, `correct_option`, `is_deleted`) VALUES
('Q001', 'Renewable Energy Sources', '2026-01-09', 10, 'Which of the following is a renewable energy source?', 'Coal', 'Oil', 'Solar', 'Natural Gas', 'Option 3', 0),
('Q002', 'Sustainable Water Use', '2026-01-10', 10, 'What is the most effective way to conserve water at home?', 'Leaving taps running while brushing teeth', 'Fixing leaks and using low-flow fixtures', 'Washing cars daily with a hose', 'Filling the pool weekly', 'Option 2', 0),
('Q003', 'Recycling Awareness', '2026-01-11', 10, 'Which item can typically not be recycled in most curbside recycling programs?', 'Aluminum cans', 'Cardboard boxes', 'Plastic bags', 'Glass bottles', 'Option 3', 0),
('Q004', 'Sustainable Transportation', '2026-01-12', 10, 'Which mode of transport is considered the most environmentally friendly for reducing carbon emissions?', 'Private car', 'Airplane', 'Public bus', 'Motorcycle', 'Option 3', 0),
('Q005', 'Food Sustainability', '2026-01-13', 10, 'Which practice helps reduce food waste at home?', 'Cooking more than needed', 'Storing leftovers properly and using them', 'Buying food impulsively', 'Throwing away slightly old produce', 'Option 2', 0);

-- --------------------------------------------------------

--
-- Table structure for table `quiz_attempt`
--

DROP TABLE IF EXISTS `quiz_attempt`;
CREATE TABLE IF NOT EXISTS `quiz_attempt` (
  `attempt_id` varchar(10) NOT NULL,
  `quiz_id` varchar(10) NOT NULL,
  `challenger_id` varchar(10) NOT NULL,
  `result` enum('Correct','Incorrect') NOT NULL,
  `attempt_date` date NOT NULL,
  PRIMARY KEY (`attempt_id`),
  UNIQUE KEY `attempt_id` (`attempt_id`),
  KEY `quiz_id` (`quiz_id`),
  KEY `challenger_id` (`challenger_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `quiz_attempt`
--

INSERT INTO `quiz_attempt` (`attempt_id`, `quiz_id`, `challenger_id`, `result`, `attempt_date`) VALUES
('QA001', 'Q001', 'C001', 'Correct', '2026-01-09'),
('QA002', 'Q001', 'C002', 'Incorrect', '2026-01-09'),
('QA003', 'Q001', 'C003', 'Incorrect', '2026-01-09'),
('QA004', 'Q001', 'C006', 'Correct', '2026-01-09'),
('QA005', 'Q001', 'C004', 'Correct', '2026-01-09');

-- --------------------------------------------------------

--
-- Table structure for table `recyclable`
--

DROP TABLE IF EXISTS `recyclable`;
CREATE TABLE IF NOT EXISTS `recyclable` (
  `recyclable_id` varchar(10) NOT NULL,
  `type` varchar(50) NOT NULL,
  `points_per_kg` int NOT NULL,
  `is_deleted` tinyint NOT NULL,
  PRIMARY KEY (`recyclable_id`),
  UNIQUE KEY `recyclable_id` (`recyclable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `recyclable`
--

INSERT INTO `recyclable` (`recyclable_id`, `type`, `points_per_kg`, `is_deleted`) VALUES
('R001', 'Paper', 20, 0),
('R002', 'Glass', 15, 0),
('R003', 'Plastic', 25, 0);

-- --------------------------------------------------------

--
-- Table structure for table `recycling_centre`
--

DROP TABLE IF EXISTS `recycling_centre`;
CREATE TABLE IF NOT EXISTS `recycling_centre` (
  `centre_id` varchar(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `contact_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(50) NOT NULL,
  `operation_hour` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `recycle_admin_id` varchar(10) NOT NULL,
  `file_path` text NOT NULL,
  `is_deleted` tinyint NOT NULL,
  PRIMARY KEY (`centre_id`),
  UNIQUE KEY `centre_id` (`centre_id`),
  KEY `recycle_admin_id` (`recycle_admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `recycling_centre`
--

INSERT INTO `recycling_centre` (`centre_id`, `name`, `contact_no`, `address`, `email`, `operation_hour`, `recycle_admin_id`, `file_path`, `is_deleted`) VALUES
('RC001', 'Sri Petaling Recycling Centre', '03-5524 9810', '23, Jalan Radin Bagus 7, Bandar Baru Sri Petaling, 57000 Kuala Lumpur', 'recylingcentresp@gmail.com', '11.00AM - 6.00PM', 'RA001', 'images/recyclingCentrePIC/RC001.png', 0),
('RC002', 'Bukit Jalil GreenCycle Centre', '03-8994 3271', 'Lot 15, Jalan 17/155C, Bukit Jalil Integrated Park, 57000 Kuala Lumpur', 'info@greenbukitjalil.my', '10.00AM - 5.00PM', 'RA002', 'images/recyclingCentrePIC/RC002.png', 0),
('RC003', 'Taman OUG Eco Collection Point', '03-7782 6640', '28, Jalan Hujan Gerimis 2, Taman OUG, 58200 Kuala Lumpur', 'oug.eco@myrecyclecentre.org', '10.00AM - 5.30PM', 'RA003', 'images/recyclingCentrePIC/RC003.png', 0),
('RC004', 'Taman Muhibbah Community Recycling Station', '03-9145 2033', 'No. 6, Jalan Muhibbah 4, Taman Muhibbah, 58200 Kuala Lumpur', 'muhibbah.recycle@greenhub.my', '9.00AM - 4.30PM', 'RA004', 'images/recyclingCentrePIC/RC004.png', 0),
('RC005', 'Sungai Besi EcoDrive Recycling Hub', '03-9226 4479', '12, Jalan 1/149J, Sungai Besi, 57100 Kuala Lumpur', 'sgbesi.ecodrive@greenworks.my', '11.00AM - 5.30PM', 'RA005', 'images/recyclingCentrePIC/RC005.png', 0);

-- --------------------------------------------------------

--
-- Table structure for table `recycling_challenge`
--

DROP TABLE IF EXISTS `recycling_challenge`;
CREATE TABLE IF NOT EXISTS `recycling_challenge` (
  `challenge_id` varchar(10) NOT NULL,
  `rec_centre_id` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `recyclable_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `weight_kg` decimal(10,2) NOT NULL,
  PRIMARY KEY (`challenge_id`),
  KEY `challenge_id` (`challenge_id`),
  KEY `rec_centre_id` (`rec_centre_id`),
  KEY `recyclable_type` (`recyclable_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `recycling_challenge`
--

INSERT INTO `recycling_challenge` (`challenge_id`, `rec_centre_id`, `recyclable_type`, `weight_kg`) VALUES
('CL002', NULL, 'R003', 10.00),
('CL003', NULL, 'R001', 5.00),
('CL004', 'RC001', 'R002', 5.00);

-- --------------------------------------------------------

--
-- Table structure for table `recycling_history`
--

DROP TABLE IF EXISTS `recycling_history`;
CREATE TABLE IF NOT EXISTS `recycling_history` (
  `recycle_history_id` varchar(10) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `recyclable_id` varchar(10) NOT NULL,
  `weight_kg` decimal(10,2) NOT NULL,
  `centre_id` varchar(10) NOT NULL,
  `challenger_id` varchar(10) NOT NULL,
  PRIMARY KEY (`recycle_history_id`),
  UNIQUE KEY `recycle_history_id` (`recycle_history_id`),
  KEY `recyclable_id` (`recyclable_id`),
  KEY `centre_id` (`centre_id`),
  KEY `challenger_id` (`challenger_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `recycling_history`
--

INSERT INTO `recycling_history` (`recycle_history_id`, `date`, `time`, `recyclable_id`, `weight_kg`, `centre_id`, `challenger_id`) VALUES
('RH001', '2026-01-09', '14:46:26', 'R001', 10.00, 'RC001', 'C001'),
('RH002', '2026-01-09', '14:47:03', 'R003', 3.00, 'RC001', 'C001'),
('RH003', '2026-01-09', '14:47:12', 'R002', 10.00, 'RC001', 'C002'),
('RH004', '2026-01-09', '14:47:37', 'R001', 5.00, 'RC001', 'C002'),
('RH005', '2026-01-09', '14:47:44', 'R001', 2.00, 'RC001', 'C003'),
('RH006', '2026-01-09', '14:47:58', 'R003', 3.00, 'RC001', 'C006'),
('RH007', '2026-01-09', '14:48:58', 'R002', 7.00, 'RC001', 'C006'),
('RH008', '2026-01-09', '14:50:36', 'R003', 3.00, 'RC001', 'C002'),
('RH009', '2026-01-09', '14:50:45', 'R003', 2.00, 'RC001', 'C001'),
('RH010', '2026-01-09', '14:50:53', 'R002', 4.00, 'RC001', 'C003'),
('RH011', '2026-01-09', '14:51:30', 'R001', 2.00, 'RC001', 'C004'),
('RH012', '2026-01-09', '14:51:38', 'R003', 3.00, 'RC001', 'C005');

-- --------------------------------------------------------

--
-- Table structure for table `reward`
--

DROP TABLE IF EXISTS `reward`;
CREATE TABLE IF NOT EXISTS `reward` (
  `reward_id` varchar(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `stock` int NOT NULL,
  `points` int NOT NULL,
  `file_path` text NOT NULL,
  `is_deleted` tinyint NOT NULL,
  PRIMARY KEY (`reward_id`),
  UNIQUE KEY `reward_id` (`reward_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `reward`
--

INSERT INTO `reward` (`reward_id`, `name`, `stock`, `points`, `file_path`, `is_deleted`) VALUES
('RW001', 'Eco Badge', 200, 500, 'images/rewardsPIC/RW001.png', 0),
('RW002', 'Eco Keychain', 199, 500, 'images/rewardsPIC/RW002.png', 0),
('RW003', 'Eco Tote Bag', 100, 800, 'images/rewardsPIC/RW003.jpg', 0),
('RW004', 'Eco Cap', 100, 1000, 'images/rewardsPIC/RW004.jpg', 0),
('RW005', 'Bila Bila Mart RM5 Discount Voucher', 499, 300, 'images/rewardsPIC/RW005.png', 0),
('RW006', 'Eco T-Shirt', 100, 1200, 'images/rewardsPIC/RW006.jpg', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `user_id` varchar(10) NOT NULL,
  `role` enum('Challenger','Admin','Recycling Centre Admin','Partner') NOT NULL,
  `name` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(50) NOT NULL,
  `contact_no` varchar(50) NOT NULL,
  `is_deleted` tinyint NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `role`, `name`, `username`, `password`, `email`, `contact_no`, `is_deleted`) VALUES
('A001', 'Admin', 'Aiden Loh', 'aidenloh', '$2y$10$4d/2I.xQubnYOQsNHxis5.U4TV3RYOy1bKc.EbZH79WifY4XAynRy', 'aidenloh@gmail.com', '0128736284', 0),
('A002', 'Admin', 'Chloe Tan', 'chloetan', '$2y$10$Ac0SbbJo2dWMqg9YLivdnOR377jsXFdXcBJd9aGdkp8s/YM/2c73W', 'chloetan@gmail.com', '0128738889', 0),
('A003', 'Admin', 'Ethan Yap', 'ethanyap', '$2y$10$8ClBMYhZY60xvqZfOYYIludknOayaf7NJ9w4xXTApqNa.OZimNhwS', 'ethanyap@gmail.com', '0129283788', 0),
('A004', 'Admin', 'Jasmine Ong', 'jasmineong', '$2y$10$z1CGY2c897KVKDvBD18xRuSC3P7EtGaO9dVWch1oWlJATiOW7d/tm', 'jasmine@gmail.com', '0198652738', 0),
('A005', 'Admin', 'Ryan Lim', 'ryanlim', '$2y$10$K7.ITeCdUJ4mFiwOCUo.OOqQVOGbOh3.4siCi/VDPTwYKZPCI2S6O', 'ryan192@gmail.com', '0182736877', 0),
('C001', 'Challenger', 'Aisyah Farhana', 'aisyahh', '$2y$10$nnEInHjKDpHLBsphGmBqBezS/gu8lAs.nqWZzbWzsXMLTnOrRkbGi', 'aisyahfarhana@gmail.com', '0128736823', 0),
('C002', 'Challenger', 'Daniel Wong', 'danielwong', '$2y$10$EHVFKuDou33xWhZ5hNDY4.3lRGuHPgvQKMb/p3MTVqYwXHDjRHwVi', 'danielwong@gmail.com', '0192637824', 0),
('C003', 'Challenger', 'Mei Ling Chong', 'meiling', '$2y$10$/X1/KFCA1J0OOydN/kurCewXAHKd9ZtXwzDOyoKV9OetMRuUZMFGy', 'meilingchong12@gmail.com', '0173273321', 0),
('C004', 'Challenger', 'Hafiz Rahman', 'hafizzz123', '$2y$10$xdH8hjvZckd16NgAXG92teLuErpSHunzfPDv1XTqiNKa79ZnuvmOW', 'hafizrahman@gmail.com', '0193728372', 0),
('C005', 'Challenger', 'mary', 'maryy', '$2y$10$VStirgIy661VJIeFc2ud0.cIOmQa27LCa8.zGaaQA2I0CHR.i6bCq', 'mary@gmail.com', '0128382893', 0),
('C006', 'Challenger', 'Coreen', 'coreennn', '$2y$10$4XuTHrrqRb.0BfgUQEv80.usajlD.zCsVRZgxX/Ke2Z8ZDjX0lFI.', 'coreenkhor6@gmail.com', '0192738726', 0),
('C007', 'Challenger', 'Raymond', 'raymond', '$2y$10$8sVyLzmrHabrDZ.vFTiF6OG72mcqKcgKeCevu2CUkBsqwuncfrIGi', 'raymond@gmail.com', '0129382749', 0),
('P001', 'Partner', 'Mei Xin Lee', 'meixinlee', '$2y$10$8ZdXOrtgISf5GEd3KOAhmOGwKhy65qLMKZZu.4TmB/2FyJt98I40a', 'meixinlee@gmail.com', '0123768782', 0),
('P002', 'Partner', 'Daniel Chua', 'danielchua', '$2y$10$bKgIoKvalZ/xTLPsKQuk5ehjdSnLCo/eWzeFLrl63kJKikGEQsBka', 'danielchua@gmail.com', '0187268754', 0),
('P003', 'Partner', 'Sophia Chee', 'sophiachee', '$2y$10$W82MB3hgR4yVma9k.PuZd.S9nDfcpuhy5XRXNxx1bZ9BkvClKIIwu', 'sophiachee@gmail.com', '0192836519', 0),
('P004', 'Partner', 'Jordan Teh', 'jordanteh', '$2y$10$R0jheVjHCB1tO4jltZQ0xerDtpPEAmb1UE859ypWzsXU9XuAlMGVu', 'jordan@gmail.com', '0123456789', 0),
('P005', 'Partner', 'Valerie Goh', 'valeriee', '$2y$10$ejVtJRzcwnXQNGzOfV8hmu5Q2uDCierZkkscz4cGHv2mUCTiEidOG', 'valeriegoh@gmail.com', '0123872976', 0),
('RA001', 'Recycling Centre Admin', 'Isaac Wong', 'isaacwong', '$2y$10$80lUUv1n.oMHSiGwJ60RQ.QlEgvpbWj4vLOuUL7ZpVwaqVyYCek7q', 'issacwong@gmail.com', '0127363928', 0),
('RA002', 'Recycling Centre Admin', 'Natalie Ho', 'natalieho', '$2y$10$RxgQdJ5RoH.Nk.G0BCgwReUa9mYo5DrB0x0vNsGJYKPJ26u6TWABu', 'natalie@gmail.com', '0128379837', 0),
('RA003', 'Recycling Centre Admin', 'Darren Foo', 'darrenfoo', '$2y$10$cNAlpV9qaZT08ryoI0HqbuKktSVGQGx82bFsFiLgY4R3JGPjK6djy', 'darrenfoo@gmail.com', '0198273842', 0),
('RA004', 'Recycling Centre Admin', 'Felicia Yew', 'feliciayew', '$2y$10$eUmTUwZgXdLOYq1hgaXTUurs0E49x1nmkFZ0Q8qqlf3faE6B/Hmjy', 'feliciayew@gmail.com', '0192837652', 0),
('RA005', 'Recycling Centre Admin', 'Marcus Heng', 'marcusheng', '$2y$10$pzkvz2hVyiqcM8OKxmKAn.dBs7nXU2GxKWgGdpjsZoFROsKEY2iza', 'marcusheng@gmail.com', '0129374923', 0);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `achievement`
--
ALTER TABLE `achievement`
  ADD CONSTRAINT `challenge_id1` FOREIGN KEY (`challenge_id`) REFERENCES `challenge` (`challenge_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `achievement_history`
--
ALTER TABLE `achievement_history`
  ADD CONSTRAINT `ach_id` FOREIGN KEY (`ach_id`) REFERENCES `achievement` (`ach_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `challenger_id1` FOREIGN KEY (`challenger_id`) REFERENCES `challenger` (`challenger_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `announcement`
--
ALTER TABLE `announcement`
  ADD CONSTRAINT `admin_id` FOREIGN KEY (`admin_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `challenge`
--
ALTER TABLE `challenge`
  ADD CONSTRAINT `partner_id1` FOREIGN KEY (`partner_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `challenger`
--
ALTER TABLE `challenger`
  ADD CONSTRAINT `challenger_id3` FOREIGN KEY (`challenger_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `challenge_participation`
--
ALTER TABLE `challenge_participation`
  ADD CONSTRAINT `challenge_id4` FOREIGN KEY (`challenge_id`) REFERENCES `challenge` (`challenge_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `challenger_id4` FOREIGN KEY (`challenger_id`) REFERENCES `challenger` (`challenger_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `point_history`
--
ALTER TABLE `point_history`
  ADD CONSTRAINT `challenge_id2` FOREIGN KEY (`challenge_id`) REFERENCES `challenge` (`challenge_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `challenger_id2` FOREIGN KEY (`challenger_id`) REFERENCES `challenger` (`challenger_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `quiz_id` FOREIGN KEY (`quiz_id`) REFERENCES `quiz` (`quiz_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `recycle_history_id` FOREIGN KEY (`recycle_history_id`) REFERENCES `recycling_history` (`recycle_history_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `reward_id` FOREIGN KEY (`reward_id`) REFERENCES `reward` (`reward_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `proof`
--
ALTER TABLE `proof`
  ADD CONSTRAINT `challenge_id` FOREIGN KEY (`challenge_id`) REFERENCES `challenge` (`challenge_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `challenger_id` FOREIGN KEY (`challenger_id`) REFERENCES `challenger` (`challenger_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `proposal`
--
ALTER TABLE `proposal`
  ADD CONSTRAINT `partner_id` FOREIGN KEY (`partner_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `quiz_attempt`
--
ALTER TABLE `quiz_attempt`
  ADD CONSTRAINT `challenger_id5` FOREIGN KEY (`challenger_id`) REFERENCES `challenger` (`challenger_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `quiz_id1` FOREIGN KEY (`quiz_id`) REFERENCES `quiz` (`quiz_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `recycling_centre`
--
ALTER TABLE `recycling_centre`
  ADD CONSTRAINT `recycle_admin_id` FOREIGN KEY (`recycle_admin_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `recycling_challenge`
--
ALTER TABLE `recycling_challenge`
  ADD CONSTRAINT `challenge_id3` FOREIGN KEY (`challenge_id`) REFERENCES `challenge` (`challenge_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `rec_centre_id` FOREIGN KEY (`rec_centre_id`) REFERENCES `recycling_centre` (`centre_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `recyclable_type` FOREIGN KEY (`recyclable_type`) REFERENCES `recyclable` (`recyclable_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `recycling_history`
--
ALTER TABLE `recycling_history`
  ADD CONSTRAINT `challenger_id6` FOREIGN KEY (`challenger_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `recyclable_id` FOREIGN KEY (`recyclable_id`) REFERENCES `recyclable` (`recyclable_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `recycling_centre_id` FOREIGN KEY (`centre_id`) REFERENCES `recycling_centre` (`centre_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
