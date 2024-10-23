-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 23, 2024 at 09:33 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `printing_service`
--

-- --------------------------------------------------------

--
-- Table structure for table `delivery_centers`
--

CREATE TABLE `delivery_centers` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `contact_number` varchar(20) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `delivery_centers`
--

INSERT INTO `delivery_centers` (`id`, `name`, `contact_number`, `price`) VALUES
(1, 'Delivery Center A', '123456789', 5.00),
(2, 'Delivery Center B', '987654321', 7.50),
(3, 'ahmed center ', '012011111', 78.00),
(4, 'shinawy', '01202144478', 10.00),
(5, 'abo ahned', '01005473984', 12.00),
(6, 'makertttt', '01202144478', 10.00),
(7, 'prand', '0120', 10.00),
(8, 'prand', '0120', 10.00),
(9, 'prand', '0120', 10.00);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` enum('new','printed','delivered','Cancelled','Pending') DEFAULT 'new',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `file_path` varchar(255) DEFAULT NULL,
  `printed_at` datetime DEFAULT NULL,
  `delivered_at` datetime DEFAULT NULL,
  `execution_time_printed` int(11) DEFAULT NULL,
  `execution_time_delivered` int(11) DEFAULT NULL,
  `cancellation_reason` varchar(255) DEFAULT NULL,
  `printing_center_id` int(11) DEFAULT NULL,
  `delivery_center_id` int(11) DEFAULT NULL,
  `pending_at` datetime DEFAULT NULL,
  `total_price` decimal(10,2) DEFAULT 0.00,
  `printing_price` decimal(10,2) DEFAULT 0.00,
  `delivery_price` decimal(10,2) DEFAULT 0.00,
  `quantity` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `status`, `created_at`, `updated_at`, `file_path`, `printed_at`, `delivered_at`, `execution_time_printed`, `execution_time_delivered`, `cancellation_reason`, `printing_center_id`, `delivery_center_id`, `pending_at`, `total_price`, `printing_price`, `delivery_price`, `quantity`) VALUES
(1, 7, 'Cancelled', '2024-10-19 09:04:53', '2024-10-21 10:49:54', 'FileUploads/q.pdf', '2024-10-20 22:00:49', '2024-10-20 22:00:48', 1729335791, 1729335906, 'cankrk', NULL, NULL, NULL, 0.00, 0.00, 0.00, 1),
(2, 7, 'printed', '2024-10-19 09:05:00', '2024-10-19 11:07:39', 'FileUploads/fatoora manual.pdf', '2024-10-19 14:07:39', '2024-10-19 14:00:59', 1729336059, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 1),
(3, 9, 'delivered', '2024-10-19 11:08:01', '2024-10-19 11:13:54', 'FileUploads/روتين التسعين يوم في تسعين دقيقة.pdf', '2024-10-19 14:08:52', '2024-10-19 14:13:54', 1729336132, 2024, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 1),
(4, 9, 'new', '2024-10-19 11:13:49', '2024-10-19 15:15:27', 'FileUploads/fares muhammad.pdf', '2024-10-19 15:41:00', '2024-10-19 14:28:01', 2024, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 1),
(5, 9, '', '2024-10-19 11:27:57', '2024-10-21 12:30:11', 'FileUploads/Top 50 Plus Networking Interview Questions and Answers for 2024 - GeeksforGeeks.pdf', '2024-10-19 14:29:40', '2024-10-19 15:04:00', NULL, NULL, 'it', 2, 1, NULL, 0.00, 0.00, 0.00, 1),
(6, 9, '', '2024-10-19 12:10:55', '2024-10-19 12:31:28', 'FileUploads/whatsapp-icon-design_23-2147918676.avif', NULL, NULL, NULL, NULL, 'tt', NULL, NULL, NULL, 0.00, 0.00, 0.00, 1),
(7, 9, 'Cancelled', '2024-10-19 12:31:22', '2024-10-21 10:49:33', 'FileUploads/روتين التسعين يوم في تسعين دقيقة.pdf', '2024-10-21 12:49:28', '2024-10-21 12:49:11', 163086, 3, 'cancel', NULL, NULL, NULL, 0.00, 0.00, 0.00, 1),
(8, 7, 'new', '2024-10-20 19:01:54', '2024-10-20 19:01:54', 'FileUploads/WhatsApp Image 2024-09-10 at 16.32.47_6c05f64c.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 1),
(9, 7, 'delivered', '2024-10-20 20:05:46', '2024-10-20 20:20:03', 'FileUploads/لقاء مع مؤلف.pdf', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0.00, 0.00, 0.00, 1),
(10, 7, 'Pending', '2024-10-20 20:13:22', '2024-10-20 20:13:22', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0.00, 0.00, 0.00, 1),
(11, 8, 'Cancelled', '2024-10-20 20:13:39', '2024-10-20 20:34:45', NULL, NULL, NULL, NULL, NULL, 'y', 1, 1, NULL, 0.00, 0.00, 0.00, 1),
(12, 8, 'Pending', '2024-10-20 20:13:44', '2024-10-20 20:13:44', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0.00, 0.00, 0.00, 1),
(13, 8, 'Pending', '2024-10-20 20:14:37', '2024-10-20 20:14:37', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0.00, 0.00, 0.00, 1),
(14, 8, 'printed', '2024-10-20 20:18:18', '2024-10-20 20:18:55', '12222222222222222222', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0.00, 0.00, 0.00, 1),
(15, 8, 'Pending', '2024-10-20 20:18:20', '2024-10-20 20:18:20', '12222222222222222222', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 1),
(16, 7, 'delivered', '2024-10-20 20:20:21', '2024-10-20 20:22:00', 'FileUploads/منهجية_مقترحة_للقراءة_في_العلوم_الإنسانية_لطالب_العلم_الشرعي.pdf', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0.00, 0.00, 0.00, 1),
(17, 8, 'Pending', '2024-10-20 20:20:24', '2024-10-20 20:20:24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 1),
(18, 9, 'Pending', '2024-10-21 10:50:10', '2024-10-21 10:50:10', 'ffff', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 1),
(19, 9, 'Pending', '2024-10-21 10:50:16', '2024-10-21 10:50:16', 'ffff', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 1),
(20, 7, 'Pending', '2024-10-21 10:59:20', '2024-10-21 10:59:20', 'FileUploads/courses.pdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 1),
(21, 8, 'Pending', '2024-10-21 10:59:40', '2024-10-21 10:59:40', 'FileUploads/Courses links (1).pdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 1),
(22, 8, 'Pending', '2024-10-21 10:59:55', '2024-10-21 10:59:55', 'FileUploads/Courses links (1).pdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 1),
(23, 10, 'printed', '2024-10-21 11:01:16', '2024-10-21 12:01:59', 'FileUploads/الله جل جلاله.. كيف لا يحب؟.pdf', '2024-10-21 15:01:59', NULL, 1729512119, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 1),
(24, 10, 'delivered', '2024-10-21 11:01:58', '2024-10-21 11:02:46', 'FileUploads/Grey White Black Minimalist CV Resume.pdf', '2024-10-21 13:02:34', '2024-10-21 13:02:46', -3564, 12, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 1),
(25, 10, 'Pending', '2024-10-21 11:02:03', '2024-10-22 20:42:17', 'FileUploads/Grey White Black Minimalist CV Resume.pdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-22 23:42:17', 0.00, 0.00, 0.00, 1),
(26, 8, 'printed', '2024-10-21 11:03:35', '2024-10-22 20:41:54', 'FileUploads/Courses links (1).pdf', '2024-10-22 23:41:54', NULL, 1729629714, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 1),
(27, 10, 'delivered', '2024-10-21 11:04:02', '2024-10-21 11:40:18', 'FileUploads/AWS notebook.pdf', '2024-10-21 14:40:02', '2024-10-21 14:40:18', 2160, 16, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 1),
(28, 10, 'printed', '2024-10-21 11:04:06', '2024-10-21 11:29:28', 'FileUploads/AWS notebook.pdf', '2024-10-21 13:29:28', '2024-10-21 13:15:40', -2078, 44, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 1),
(29, 10, 'printed', '2024-10-21 11:29:49', '2024-10-21 11:31:09', 'FileUploads/e-invoice-engineer.pdf', '2024-10-21 13:31:09', NULL, -3520, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 1),
(30, 10, 'printed', '2024-10-21 11:29:54', '2024-10-21 11:32:15', 'FileUploads/e-invoice-engineer.pdf', '2024-10-21 13:32:15', NULL, -3459, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 1),
(31, 9, 'delivered', '2024-10-21 11:43:55', '2024-10-21 11:58:46', 'FileUploads/Untitleds.jpg', '2024-10-21 14:50:50', '2024-10-21 14:58:46', 415, 476, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 1),
(32, 9, 'delivered', '2024-10-21 11:44:06', '2024-10-21 12:17:00', 'FileUploads/Untitleds.jpg', '2024-10-21 15:16:31', '2024-10-21 15:16:41', 1729512991, 10, NULL, 1, 1, NULL, 0.00, 0.00, 0.00, 1),
(33, 8, 'new', '2024-10-21 12:04:36', '2024-10-21 12:04:36', 'FileUploads/good lin.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 1),
(34, 8, 'new', '2024-10-21 12:04:41', '2024-10-21 12:04:41', 'FileUploads/good lin.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 1),
(35, 10, 'Cancelled', '2024-10-21 12:05:03', '2024-10-21 12:06:24', 'FileUploads/Fatoora_Portal_User_Manual_Arabic.pdf', '2024-10-21 15:06:05', '2024-10-21 15:06:20', 8, 15, NULL, NULL, NULL, '2024-10-21 15:05:57', 0.00, 0.00, 0.00, 1),
(36, 10, 'Cancelled', '2024-10-21 12:05:06', '2024-10-21 12:06:46', 'FileUploads/Fatoora_Portal_User_Manual_Arabic.pdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 1),
(37, 11, 'new', '2024-10-21 12:07:50', '2024-10-21 12:07:50', 'FileUploads/sended req.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 1),
(38, 11, 'new', '2024-10-21 12:08:04', '2024-10-21 12:08:04', 'FileUploads/20230519_ZATCA_Electronic_Invoice_Security_Features_Implementation_Standards_vF.pdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 1),
(39, 11, 'Cancelled', '2024-10-21 12:08:21', '2024-10-21 12:41:23', 'FileUploads/sended req.png', '2024-10-21 15:40:43', '2024-10-21 15:41:05', 26, 22, 'gjhkjnl', 3, 1, '2024-10-21 15:40:17', 0.00, 0.00, 0.00, 1),
(40, 11, 'printed', '2024-10-21 12:08:34', '2024-10-21 12:23:14', 'FileUploads/New Text Document.txt', '2024-10-21 15:23:14', NULL, 880, NULL, NULL, NULL, NULL, '2024-10-21 15:23:04', 0.00, 0.00, 0.00, 1),
(41, 11, 'printed', '2024-10-21 12:09:15', '2024-10-23 10:32:52', 'FileUploads/منهجية_مقترحة_للقراءة_في_العلوم_الإنسانية_لطالب_العلم_الشرعي.pdf', '2024-10-21 15:22:18', NULL, 783, NULL, NULL, 5, 3, '2024-10-21 15:09:33', 0.00, 0.00, 0.00, 1),
(42, 11, 'delivered', '2024-10-21 12:09:25', '2024-10-21 12:21:36', 'FileUploads/منهجية_مقترحة_للقراءة_في_العلوم_الإنسانية_لطالب_العلم_الشرعي.pdf', '2024-10-21 15:21:19', '2024-10-21 15:21:23', 714, 4, NULL, 3, 2, NULL, 0.00, 0.00, 0.00, 1),
(43, 8, 'new', '2024-10-21 12:22:04', '2024-10-21 12:22:04', 'FileUploads/AWS notebook.pdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 1),
(44, 8, 'printed', '2024-10-21 12:22:07', '2024-10-22 20:21:36', 'FileUploads/AWS notebook.pdf', '2024-10-22 23:21:15', NULL, 5, NULL, NULL, 1, 1, '2024-10-22 23:21:10', 0.00, 0.00, 0.00, 1),
(45, 11, 'Cancelled', '2024-10-21 12:27:27', '2024-10-23 10:32:42', 'FileUploads/CCNA Interview questions -1.pdf', '2024-10-21 15:29:27', '2024-10-21 15:29:41', 10, 14, '', 4, 3, '2024-10-21 15:29:17', 0.00, 0.00, 0.00, 1),
(46, 12, 'new', '2024-10-21 12:43:19', '2024-10-21 12:43:19', 'FileUploads/منهجية_مقترحة_للقراءة_في_العلوم_الإنسانية_لطالب_العلم_الشرعي.pdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 1),
(47, 12, 'new', '2024-10-21 12:43:46', '2024-10-21 12:43:46', 'FileUploads/e-invoice-engineer.pdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 1),
(48, 12, 'delivered', '2024-10-21 12:43:49', '2024-10-21 19:59:17', 'FileUploads/e-invoice-engineer.pdf', '2024-10-21 22:59:08', '2024-10-21 22:59:17', 7, 9, NULL, NULL, NULL, '2024-10-21 22:59:01', 0.00, 0.00, 0.00, 1),
(49, 12, 'new', '2024-10-21 19:58:43', '2024-10-21 19:58:43', 'FileUploads/افتن.pdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 1),
(50, 12, 'delivered', '2024-10-21 19:58:46', '2024-10-23 10:27:13', 'FileUploads/افتن.pdf', '2024-10-21 23:32:24', '2024-10-21 23:32:27', 4, 3, NULL, 4, 3, '2024-10-21 23:32:20', 0.00, 0.00, 0.00, 1),
(51, 7, 'new', '2024-10-22 08:20:07', '2024-10-22 08:20:07', 'FileUploads/Untitleda.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 1),
(52, 7, 'new', '2024-10-22 08:20:12', '2024-10-22 08:20:12', 'FileUploads/Untitleda.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 1),
(53, 10, 'new', '2024-10-22 09:04:25', '2024-10-22 09:04:25', 'FileUploads/لقاء مع مؤلف.pdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 1),
(54, 10, 'new', '2024-10-22 09:04:28', '2024-10-22 09:04:28', 'FileUploads/لقاء مع مؤلف.pdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 1),
(55, 7, 'new', '2024-10-22 09:16:47', '2024-10-22 09:16:47', 'FileUploads/AWS notebook.pdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 1),
(56, 8, 'new', '2024-10-22 09:18:28', '2024-10-22 09:18:28', 'FileUploads/افتن.pdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 1),
(57, 8, 'new', '2024-10-22 09:18:41', '2024-10-22 09:18:41', 'FileUploads/مهارات المذاكرة الفعالة.pdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 1),
(58, 9, 'new', '2024-10-22 09:18:58', '2024-10-22 09:18:58', 'FileUploads/CCNA Hand Note.pdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 1),
(59, 8, 'new', '2024-10-22 09:22:13', '2024-10-22 09:22:13', 'FileUploads/AWS notebook.pdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 1),
(60, 7, 'new', '2024-10-22 09:23:42', '2024-10-23 14:16:23', 'FileUploads/Technical Tracks Catalog.pdf', NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, 442.00, 435.00, 7.00, 3),
(61, 10, 'printed', '2024-10-22 09:31:59', '2024-10-23 14:11:09', 'FileUploads/Technical Tracks Catalog.pdf', '2024-10-23 17:11:09', '2024-10-23 17:11:01', 14, 3, NULL, 2, 2, '2024-10-23 17:10:55', 587.00, 580.00, 7.00, 4),
(62, 8, 'delivered', '2024-10-22 09:32:06', '2024-10-23 12:53:12', 'FileUploads/Top 50 Plus Networking Interview Questions and Answers for 2024 - GeeksforGeeks.pdf', NULL, '2024-10-23 15:53:12', NULL, 1729687992, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 1),
(63, 7, 'Pending', '2024-10-22 09:32:23', '2024-10-23 19:17:15', 'FileUploads/لقاء مع مؤلف.pdf', NULL, NULL, NULL, NULL, NULL, 5, 1, '2024-10-23 22:17:15', 0.00, 0.00, 5.00, 1),
(64, 13, 'printed', '2024-10-22 09:40:00', '2024-10-23 13:20:18', 'FileUploads/_Gold Simple Good Morning WhatsApp Status Your Story .png', '2024-10-23 15:08:50', '2024-10-23 14:59:39', 56776, 56223, 'uu', 2, 2, '2024-10-22 23:22:34', 297.50, 290.00, 7.50, 1),
(65, 13, 'delivered', '2024-10-22 09:40:58', '2024-10-22 20:16:41', 'FileUploads/مهارات المذاكرة الفعالة.pdf', '2024-10-22 23:16:13', '2024-10-22 23:16:41', 1729628173, 28, NULL, 1, 1, NULL, 0.00, 0.00, 0.00, 1),
(66, 7, 'delivered', '2024-10-22 20:17:14', '2024-10-22 20:22:12', 'FileUploads/AWS notebook.pdf', '2024-10-22 23:17:21', '2024-10-22 23:22:12', 1729628241, 291, NULL, 1, 1, NULL, 0.00, 0.00, 0.00, 1),
(67, 8, 'Cancelled', '2024-10-22 20:23:01', '2024-10-23 12:59:37', 'FileUploads/روتين التسعين يوم في تسعين دقيقة.pdf', '2024-10-23 15:58:54', '2024-10-23 15:58:58', 58646, 4, NULL, 4, 3, '2024-10-22 23:41:28', 0.00, 0.00, 0.00, 1),
(68, 13, 'Pending', '2024-10-23 13:22:53', '2024-10-23 13:39:15', 'FileUploads/AWS notebook.pdf', NULL, NULL, NULL, NULL, NULL, 1, 2, '2024-10-23 16:23:02', 82.50, 75.00, 7.50, 1),
(69, 11, 'Cancelled', '2024-10-23 13:39:34', '2024-10-23 14:11:41', 'FileUploads/fares muhammad.pdf', NULL, NULL, NULL, NULL, NULL, 1, 3, '2024-10-23 16:50:49', 288.00, 210.00, 78.00, 14),
(70, 8, 'Cancelled', '2024-10-23 13:58:16', '2024-10-23 15:11:00', 'FileUploads/AWS notebook.pdf', '2024-10-23 17:07:48', '2024-10-23 17:09:36', 404, 108, NULL, 3, 5, '2024-10-23 17:01:04', 42.00, 30.00, 12.00, 3),
(71, 13, 'new', '2024-10-23 15:22:15', '2024-10-23 15:22:15', 'FileUploads/Untitleds.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 1),
(72, 9, 'new', '2024-10-23 15:22:57', '2024-10-23 17:30:02', 'FileUploads/Untitleds.jpg', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 245.00, 240.00, 5.00, 2),
(73, 7, 'new', '2024-10-23 19:04:39', '2024-10-23 19:06:52', 'FileUploads/AWS notebook.pdf', NULL, NULL, NULL, NULL, NULL, 2, 7, NULL, 445.00, 435.00, 10.00, 3);

-- --------------------------------------------------------

--
-- Table structure for table `order_issues`
--

CREATE TABLE `order_issues` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `issue_description` text NOT NULL,
  `reason` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_issues`
--

INSERT INTO `order_issues` (`id`, `order_id`, `issue_description`, `reason`, `created_at`) VALUES
(1, 1, 'errer', 'error', '2024-10-19 10:27:49'),
(2, 7, 'errergff', 'ffffffffffg', '2024-10-19 15:24:22'),
(3, 1, 'terhroijoijeoirgy', 'yjtjyjtyj', '2024-10-20 19:22:01'),
(4, 1, 'terhroijoijeoirgy', 'yjtjyjtyj', '2024-10-20 19:22:06'),
(5, 1, 'errereeeeeeeee', 'eeeeeeeeeeeeee', '2024-10-20 19:26:09'),
(6, 1, 'fares', 'fares', '2024-10-20 19:26:18'),
(7, 1, 'fares', 'fares', '2024-10-20 19:32:04'),
(8, 1, 'fares', 'fares', '2024-10-20 19:46:19'),
(9, 1, 'fares', 'fares', '2024-10-20 19:46:23'),
(10, 1, 'fares', 'fares', '2024-10-20 19:46:25'),
(11, 1, 'fares', 'fares', '2024-10-20 19:46:26'),
(12, 7, 'errer', 'yyyyyyy', '2024-10-21 10:49:40'),
(13, 27, 'fares', 'ee', '2024-10-21 11:40:54'),
(14, 27, 'fares', 'ee', '2024-10-21 11:41:01'),
(15, 27, 'fares', 'ee', '2024-10-21 11:41:52'),
(16, 30, 'errer', 'yyyyyyy', '2024-10-21 11:42:01'),
(17, 40, 'fares', 'yyyyyyy', '2024-10-21 12:25:20'),
(18, 40, 'fares', 'yyyyyyy', '2024-10-21 12:26:38'),
(19, 39, 'print', 'ffff', '2024-10-21 12:41:42'),
(20, 52, 'hi', 'hi', '2024-10-22 08:20:30'),
(21, 67, 'cancelled', 'its cancelled for not deliverd', '2024-10-22 20:41:09'),
(22, 67, 'errer', 'ffffffffffg', '2024-10-23 11:08:04'),
(23, 64, 'fares', 'eeeeeeeeeeeeee', '2024-10-23 12:08:41'),
(24, 67, 'errergff', 'fares', '2024-10-23 12:59:19');

-- --------------------------------------------------------

--
-- Table structure for table `order_tracking`
--

CREATE TABLE `order_tracking` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `status` enum('new','printed','delivered') NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `printing_centers`
--

CREATE TABLE `printing_centers` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `contact_number` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `printing_centers`
--

INSERT INTO `printing_centers` (`id`, `name`, `contact_number`) VALUES
(1, 'shbt', '123456789'),
(2, 'life', '10111213145'),
(3, 'haithm shinawy', '012040000000000000'),
(4, 'maker', '2222222'),
(5, 'maker', '2222222'),
(6, 'maker', '01202144478'),
(7, 'maker', '01202144478'),
(8, 'paper', '000000000'),
(9, 'paper', '000000000'),
(10, 'makersssssss', '01202144478'),
(11, 'paperههه', '01202144478'),
(12, 'yyyyyyyyyyyy', '0000000'),
(13, 'shinawypx', '01202144478'),
(14, 'maker89', 'ffffff');

-- --------------------------------------------------------

--
-- Table structure for table `print_order`
--

CREATE TABLE `print_order` (
  `id` int(11) NOT NULL,
  `order_id` varchar(50) NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `order_details` text DEFAULT NULL,
  `file_path` varchar(255) NOT NULL,
  `paper_type` varchar(50) DEFAULT NULL,
  `count` int(11) DEFAULT 1,
  `print_center` varchar(100) DEFAULT NULL,
  `delivery_center` varchar(100) DEFAULT NULL,
  `status` enum('Pending','Printed','Delivered','Cancelled') DEFAULT 'Pending',
  `total_price` decimal(10,2) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `printed_at` datetime DEFAULT NULL,
  `delivered_at` datetime DEFAULT NULL,
  `execution_time_printed` time DEFAULT NULL,
  `execution_time_delivered` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `printing_center_id` int(11) DEFAULT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `printing_center_id`, `product_name`, `product_price`) VALUES
(2, 2, 'a489', 145.00),
(3, 1, 'hr', 1000.00),
(4, 3, 'a1', 10.00),
(5, 4, 'pa', 10.00),
(6, 4, 'hypeeee', 150.00),
(7, 5, 'pa', 10.00),
(8, 5, 'hypeeee', 150.00),
(9, 6, 'a1', 10.00),
(10, 6, 'pa', 100.00),
(11, 6, 'pae', 1000.00),
(12, 7, 'a1', 10.00),
(13, 7, 'pa', 100.00),
(14, 7, 'pae', 1500.00),
(15, 1, '147', 1458.00),
(26, 1, 'mabara', 10.00),
(27, 11, 'A44', 10.00),
(34, 13, 'A4', 10.00),
(35, NULL, 'vvvvvvvvvvvvvvvvvvvvvvvvvv', 0.01),
(37, 12, 'vvvvvvvvvvvvvvvvvvvvvvvvvv', 0.01),
(38, 12, 'vvvvvvvvvvvvvvvvvvvvvvvvvv', 0.01),
(39, 14, 'ffffffff', 1.00);

-- --------------------------------------------------------

--
-- Table structure for table `uploads`
--

CREATE TABLE `uploads` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `upload_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `uploads`
--

INSERT INTO `uploads` (`id`, `user_id`, `file_name`, `file_path`, `upload_date`) VALUES
(22, 8, 'CCNA Hand Note.pdf', 'FileUploads/CCNA Hand Note.pdf', '2024-10-18 20:33:52'),
(23, 9, 'لقاء مع مؤلف.pdf', 'FileUploads/لقاء مع مؤلف.pdf', '2024-10-19 11:27:04'),
(24, 7, 'q.pdf', 'FileUploads/q.pdf', '2024-10-19 11:57:26'),
(25, 7, 'q.pdf', 'FileUploads/q.pdf', '2024-10-19 12:04:53'),
(26, 7, 'fatoora manual.pdf', 'FileUploads/fatoora manual.pdf', '2024-10-19 12:05:00'),
(27, 9, 'روتين التسعين يوم في تسعين دقيقة.pdf', 'FileUploads/روتين التسعين يوم في تسعين دقيقة.pdf', '2024-10-19 14:08:01'),
(28, 9, 'fares muhammad.pdf', 'FileUploads/fares muhammad.pdf', '2024-10-19 14:13:49'),
(29, 9, 'Top 50 Plus Networking Interview Questions and Answers for 2024 - GeeksforGeeks.pdf', 'FileUploads/Top 50 Plus Networking Interview Questions and Answers for 2024 - GeeksforGeeks.pdf', '2024-10-19 14:27:57'),
(30, 9, 'whatsapp-icon-design_23-2147918676.avif', 'FileUploads/whatsapp-icon-design_23-2147918676.avif', '2024-10-19 15:10:55'),
(31, 9, 'روتين التسعين يوم في تسعين دقيقة.pdf', 'FileUploads/روتين التسعين يوم في تسعين دقيقة.pdf', '2024-10-19 15:31:22'),
(32, 7, 'WhatsApp Image 2024-09-10 at 16.32.47_6c05f64c.jpg', 'FileUploads/WhatsApp Image 2024-09-10 at 16.32.47_6c05f64c.jpg', '2024-10-20 22:01:54'),
(33, 7, 'لقاء مع مؤلف.pdf', 'FileUploads/لقاء مع مؤلف.pdf', '2024-10-20 23:05:46'),
(34, 7, 'منهجية_مقترحة_للقراءة_في_العلوم_الإنسانية_لطالب_العلم_الشرعي.pdf', 'FileUploads/منهجية_مقترحة_للقراءة_في_العلوم_الإنسانية_لطالب_العلم_الشرعي.pdf', '2024-10-20 23:20:21'),
(35, 10, 'الله جل جلاله.. كيف لا يحب؟.pdf', 'FileUploads/الله جل جلاله.. كيف لا يحب؟.pdf', '2024-10-21 14:01:16'),
(36, 11, 'sended req.png', 'FileUploads/sended req.png', '2024-10-21 15:07:50'),
(37, 11, 'CCNA Interview questions -1.pdf', 'FileUploads/CCNA Interview questions -1.pdf', '2024-10-21 15:27:27'),
(38, 12, 'منهجية_مقترحة_للقراءة_في_العلوم_الإنسانية_لطالب_العلم_الشرعي.pdf', 'FileUploads/منهجية_مقترحة_للقراءة_في_العلوم_الإنسانية_لطالب_العلم_الشرعي.pdf', '2024-10-21 15:43:19'),
(39, 13, '_Gold Simple Good Morning WhatsApp Status Your Story .png', 'FileUploads/_Gold Simple Good Morning WhatsApp Status Your Story .png', '2024-10-22 12:40:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` varchar(255) NOT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `phone`, `address`, `is_admin`) VALUES
(7, 'fares', 'fares@gmail.com', '$2y$10$dY2lMjqKhtaB/RHOpXXlUeR5IpBjHSQdAl9WqnidaEOtegDS4Euiy', '01202144478', '0', 1),
(8, 'hitam', 'hithamab@yahoo.com', '$2y$10$Ux9pA3O61ZyPq4hicFKol.6ok0H2hhNp/l5YGqCGn3DAH1P6RKrR2', '01202144478', 'zagazig ', 0),
(9, 'fares muhammad', 'faresahlawy12@gmail.com', '$2y$10$Erw44IhhM2AO/FUGDK6KweCbSik3QTVQbD6L.Q.nSIAeBYBvmqyY.', '01202144478', '0', 1),
(10, 'tamer123', 'tamer@gmail.com', '$2y$10$BgU8I.3PjEcjYIJcWFPEKe8sZS9Chg4.yFXyih3T9q3iV/QZd3giS', '01202144478', '0', 0),
(11, 'hussien', 'hus@gmail.com', '$2y$10$5PyOryikomciUyUZLD8ld.lz32gIjeA1TNwNCwvg0qCtCiWCaNbne', '01202144478', '0', 0),
(12, 'mustafah', 'mustafah@gmail.com', '$2y$10$n9Z96cSuTd84MZz4WrpdzeUIegbijtl8K3TTZLKmwe13wkBmJtftm', '01202144478', '0', 0),
(13, 'rania', 'rania@gmail.com', '$2y$10$gZ1beSQFbDlXslT6NLj11eyA3t1GDCJ0d7bPKnkEVdJqpbSC0lKlO', '012021', '0', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `delivery_centers`
--
ALTER TABLE `delivery_centers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `fk_printing_center` (`printing_center_id`),
  ADD KEY `fk_delivery_center` (`delivery_center_id`);

--
-- Indexes for table `order_issues`
--
ALTER TABLE `order_issues`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `order_tracking`
--
ALTER TABLE `order_tracking`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `printing_centers`
--
ALTER TABLE `printing_centers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `print_order`
--
ALTER TABLE `print_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `printing_center_id` (`printing_center_id`);

--
-- Indexes for table `uploads`
--
ALTER TABLE `uploads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `delivery_centers`
--
ALTER TABLE `delivery_centers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT for table `order_issues`
--
ALTER TABLE `order_issues`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `order_tracking`
--
ALTER TABLE `order_tracking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `printing_centers`
--
ALTER TABLE `printing_centers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `print_order`
--
ALTER TABLE `print_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `uploads`
--
ALTER TABLE `uploads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_delivery_center` FOREIGN KEY (`delivery_center_id`) REFERENCES `delivery_centers` (`id`),
  ADD CONSTRAINT `fk_printing_center` FOREIGN KEY (`printing_center_id`) REFERENCES `printing_centers` (`id`),
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `order_issues`
--
ALTER TABLE `order_issues`
  ADD CONSTRAINT `order_issues_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_tracking`
--
ALTER TABLE `order_tracking`
  ADD CONSTRAINT `order_tracking_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`printing_center_id`) REFERENCES `printing_centers` (`id`);

--
-- Constraints for table `uploads`
--
ALTER TABLE `uploads`
  ADD CONSTRAINT `uploads_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
