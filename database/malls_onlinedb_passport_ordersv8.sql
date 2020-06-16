-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 16, 2020 at 08:59 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `malls_onlinedb_passport_ordersv8`
--

-- --------------------------------------------------------

--
-- Table structure for table `ads_category_for_area_ads`
--

CREATE TABLE `ads_category_for_area_ads` (
  `id` int(10) UNSIGNED NOT NULL,
  `area_ad_name_ar` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `area_ad_name_en` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ad_category_id` int(10) UNSIGNED NOT NULL,
  `area_ad_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ad_categories`
--

CREATE TABLE `ad_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `ad_category_name_en` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ad_category_name_ar` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `area_ads`
--

CREATE TABLE `area_ads` (
  `id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` int(10) UNSIGNED NOT NULL,
  `stock_product_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `order_id` int(10) UNSIGNED DEFAULT NULL,
  `is_ordered` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `stock_product_id`, `user_id`, `created_at`, `updated_at`, `order_id`, `is_ordered`) VALUES
(11, 42, 45, '2020-06-13 16:34:03', '2020-06-14 08:01:40', 23, 1),
(13, 44, 45, '2020-06-13 16:34:17', '2020-06-14 08:01:40', 23, 1),
(19, 66, 45, '2020-06-14 04:43:18', '2020-06-14 08:01:40', 23, 1),
(20, 66, 45, '2020-06-14 04:43:19', '2020-06-14 08:01:40', 23, 1),
(21, 55, 45, '2020-06-14 05:41:39', '2020-06-14 08:01:40', 23, 1),
(22, 55, 45, '2020-06-14 08:01:57', '2020-06-14 08:03:39', 24, 1),
(23, 67, 45, '2020-06-14 10:01:26', '2020-06-14 10:01:36', 25, 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_name_ar` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_name_en` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo_path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `max_price_new` int(11) DEFAULT NULL,
  `min_price_new` int(11) DEFAULT NULL,
  `max_price_old` int(11) DEFAULT NULL,
  `min_price_old` int(11) DEFAULT NULL,
  `mobile_site_photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tabe_site_photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pc_site_photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_pages` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size1_site_photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size2_site_photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size3_site_photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size4_site_photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size5_site_photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size6_site_photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_name_ar`, `category_name_en`, `photo_path`, `max_price_new`, `min_price_new`, `max_price_old`, `min_price_old`, `mobile_site_photo`, `tabe_site_photo`, `pc_site_photo`, `show_pages`, `size1_site_photo`, `size2_site_photo`, `size3_site_photo`, `size4_site_photo`, `size5_site_photo`, `size6_site_photo`) VALUES
(1, 'السنة', 'Year', 'images/1585801949.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'All Campaign', 'كل الحملات', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'رجالي', 'MAN', NULL, NULL, NULL, NULL, NULL, 'images/1590348295.jpeg', 'images/1590348283.jpeg', 'images/1590348282.jpeg', 'home_page', NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'نسائي', 'WOMAN', 'dddd', NULL, NULL, NULL, NULL, 'images/1590718243.png', 'images/1590718231.png', 'images/1590718238.png', 'home_page', NULL, NULL, NULL, NULL, NULL, NULL),
(5, 'Campaign Category', 'اقسام الحملات', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 'ولادي', 'Kids', NULL, NULL, NULL, NULL, NULL, 'images/1590718519.png', 'images/1590718507.png', 'images/1590718514.png', 'home_page', NULL, NULL, NULL, NULL, NULL, NULL),
(7, 'اللون', 'color', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 'مواصفات المنتج', 'product options', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 'اصفر', 'Yallow', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 'وكالات', 'Brands', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, 'زارا', 'Zara', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, 'أحمر', 'RED', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, 'ازرق', 'ازرق', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'الصفحة الرئيسية', NULL, NULL, NULL, NULL, NULL, NULL),
(15, 'اسود', 'اسود', 'images/1590341662.jpg', NULL, NULL, NULL, NULL, NULL, 'images/1590343204.jpg', 'images/1590343208.jpg', 'الصفحة الرئيسية', NULL, NULL, NULL, NULL, NULL, NULL),
(16, 'ساعات', 'watches', NULL, NULL, NULL, NULL, NULL, 'images/1590348548.jpeg', 'images/1590348541.jpeg', 'images/1590348545.jpeg', 'home_page', NULL, NULL, NULL, NULL, NULL, NULL),
(18, 'زهور', 'FLOWERS', NULL, NULL, NULL, NULL, NULL, 'images/1590720202.png', 'images/1590720193.png', 'images/1590720197.png', 'home_page', NULL, NULL, NULL, NULL, NULL, NULL),
(19, 'اكسسوارات', 'ACCESSORIES', NULL, NULL, NULL, NULL, NULL, 'images/1590720241.png', 'images/1590720231.png', 'images/1590720236.png', 'home_page', NULL, NULL, NULL, NULL, NULL, NULL),
(20, 'العناية بالجمال', 'BEUATY', NULL, NULL, NULL, NULL, NULL, 'images/1590720140.png', 'images/1590720127.png', 'images/1590720136.png', 'home_page', NULL, NULL, NULL, NULL, NULL, NULL),
(21, 'اوت ليت', 'OULET', NULL, NULL, NULL, NULL, NULL, 'images/1590718896.png', 'images/1590718886.png', 'images/1590718892.png', 'home_page', NULL, NULL, NULL, NULL, NULL, NULL),
(22, 'عطورات', 'PERFUMES', NULL, NULL, NULL, NULL, NULL, 'images/1590720089.png', 'images/1590720081.png', 'images/1590720085.png', 'home_page', NULL, NULL, NULL, NULL, NULL, NULL),
(23, 'أحذية وحقائب', 'S&B', NULL, NULL, NULL, NULL, NULL, 'images/1590720056.png', 'images/1590720047.png', 'images/1590720052.png', 'home_page', NULL, NULL, NULL, NULL, NULL, NULL),
(24, 'log', 'log', NULL, NULL, NULL, NULL, NULL, 'images/1590761329.png', 'images/1590761314.png', 'images/1590761325.png', 'log', NULL, NULL, NULL, NULL, NULL, NULL),
(25, 'القائمة الرئيسية', 'Nav bar', NULL, NULL, NULL, NULL, NULL, 'images/1590761329.png', 'images/1590761314.png', 'images/1590761325.png', 'main_nav_bar', NULL, NULL, NULL, NULL, NULL, NULL),
(26, 'مول التخفيضات', 'Outlet  Mall', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'nav_bar', NULL, NULL, NULL, NULL, NULL, NULL),
(27, 'سيدات', 'Ladies', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'nav_bar', NULL, NULL, NULL, NULL, NULL, NULL),
(28, 'رجال', 'Men', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'nav_bar', NULL, NULL, NULL, NULL, NULL, NULL),
(29, 'عطورات', 'Perfumes', NULL, NULL, NULL, NULL, NULL, 'images/1590761329.png', 'images/1590761314.png', 'images/1590761325.png', 'nav_bar', NULL, NULL, NULL, NULL, NULL, NULL),
(30, 'جمال', 'Beauty', NULL, NULL, NULL, NULL, NULL, 'images/1590761329.png', 'images/1590761314.png', 'images/1590761325.png', 'nav_bar', NULL, NULL, NULL, NULL, NULL, NULL),
(31, 'احذية', 'Shoes', NULL, NULL, NULL, NULL, NULL, 'images/1590761329.png', 'images/1590761314.png', 'images/1590761325.png', 'nav_bar', NULL, NULL, NULL, NULL, NULL, NULL),
(32, 'حقائب', 'Bags', NULL, NULL, NULL, NULL, NULL, 'images/1590761329.png', 'images/1590761314.png', 'images/1590761325.png', 'nav_bar', NULL, NULL, NULL, NULL, NULL, NULL),
(33, 'ساعات', 'Watches', NULL, NULL, NULL, NULL, NULL, 'images/1590761329.png', 'images/1590761314.png', 'images/1590761325.png', 'nav_bar', NULL, NULL, NULL, NULL, NULL, NULL),
(34, 'متنوع', 'Others', NULL, NULL, NULL, NULL, NULL, 'images/1590761329.png', 'images/1590761314.png', 'images/1590761325.png', 'nav_bar', NULL, NULL, NULL, NULL, NULL, NULL),
(35, 'مول السيدات', 'women\'s mall', NULL, NULL, NULL, NULL, NULL, 'images/1590761329.png', 'images/1590761314.png', 'images/1590761325.png', 'nav_bar', NULL, NULL, NULL, NULL, NULL, NULL),
(36, 'مول الرجال', 'Men\'s  Mall', NULL, NULL, NULL, NULL, NULL, 'images/1590761329.png', 'images/1590761314.png', 'images/1590761325.png', 'nav_bar', NULL, NULL, NULL, NULL, NULL, NULL),
(37, 'مول الصغار', 'Kids\'s   Mall', NULL, NULL, NULL, NULL, NULL, 'images/1590761329.png', 'images/1590761314.png', 'images/1590761325.png', 'nav_bar', NULL, NULL, NULL, NULL, NULL, NULL),
(38, 'مول العطورات', 'Perfumes \'s Mall', NULL, NULL, NULL, NULL, NULL, 'images/1590761329.png', 'images/1590761314.png', 'images/1590761325.png', 'nav_bar', NULL, NULL, NULL, NULL, NULL, NULL),
(39, 'مول الجمال', 'Beauty\'s Mall', NULL, NULL, NULL, NULL, NULL, 'images/1590761329.png', 'images/1590761314.png', 'images/1590761325.png', 'nav_bar', NULL, NULL, NULL, NULL, NULL, NULL),
(40, 'مول الأحذية والحقائب', 'Shoes & Bags  Mall', NULL, NULL, NULL, NULL, NULL, 'images/1590761329.png', 'images/1590761314.png', 'images/1590761325.png', 'nav_bar', NULL, NULL, NULL, NULL, NULL, NULL),
(41, 'مول الساعات', 'Watches\'s Mall', NULL, NULL, NULL, NULL, NULL, 'images/1590761329.png', 'images/1590761314.png', 'images/1590761325.png', 'nav_bar', NULL, NULL, NULL, NULL, NULL, NULL),
(42, 'مول المتنوعات', 'Big\'s Mall', NULL, NULL, NULL, NULL, NULL, 'images/1590761329.png', 'images/1590761314.png', 'images/1590761325.png', 'nav_bar', NULL, NULL, NULL, NULL, NULL, NULL),
(43, 'فساتين', 'Dresses', NULL, NULL, NULL, NULL, NULL, 'images/1590761329.png', 'images/1590761314.png', 'images/1590761325.png', 'nav_bar', NULL, NULL, NULL, NULL, NULL, NULL),
(44, 'قمصان', 'Shirts', NULL, NULL, NULL, NULL, NULL, 'images/1590761329.png', 'images/1590761314.png', 'images/1590761325.png', 'nav_bar', NULL, NULL, NULL, NULL, NULL, NULL),
(45, 'قمصان', 'T - Shirts & Bloues', NULL, NULL, NULL, NULL, NULL, 'images/1590761329.png', 'images/1590761314.png', 'images/1590761325.png', 'nav_bar', NULL, NULL, NULL, NULL, NULL, NULL),
(46, 'معاطف وسترات', 'Coats & Jacket', NULL, NULL, NULL, NULL, NULL, 'images/1590761329.png', 'images/1590761314.png', 'images/1590761325.png', 'nav_bar', NULL, NULL, NULL, NULL, NULL, NULL),
(47, 'قمصان', 'Shirts', NULL, NULL, NULL, NULL, NULL, 'images/1590761329.png', 'images/1590761314.png', 'images/1590761325.png', 'nav_bar', NULL, NULL, NULL, NULL, NULL, NULL),
(48, 'تي شيرتات وبلوزات', 'T - Shirts & Bloues', NULL, NULL, NULL, NULL, NULL, 'images/1590761329.png', 'images/1590761314.png', 'images/1590761325.png', 'nav_bar', NULL, NULL, NULL, NULL, NULL, NULL),
(49, 'معاطف وسترات', 'Coats & Jacket', NULL, NULL, NULL, NULL, NULL, 'images/1590761329.png', 'images/1590761314.png', 'images/1590761325.png', 'nav_bar', NULL, NULL, NULL, NULL, NULL, NULL),
(50, 'المراهقون (10-16 سنة)', 'TEENS (10-16 YRS)', NULL, NULL, NULL, NULL, NULL, 'images/1590761329.png', 'images/1590761314.png', 'images/1590761325.png', 'nav_bar', NULL, NULL, NULL, NULL, NULL, NULL),
(51, 'مراهقات', 'TEEN GIRL', NULL, NULL, NULL, NULL, NULL, 'images/1590761329.png', 'images/1590761314.png', 'images/1590761325.png', 'nav_bar', NULL, NULL, NULL, NULL, NULL, NULL),
(52, 'مراهقين', 'TEEN BOY', NULL, NULL, NULL, NULL, NULL, 'images/1590761329.png', 'images/1590761314.png', 'images/1590761325.png', 'nav_bar', NULL, NULL, NULL, NULL, NULL, NULL),
(53, 'بي بي', 'BABY (0-36 MTH)', NULL, NULL, NULL, NULL, NULL, 'images/1590761329.png', 'images/1590761314.png', 'images/1590761325.png', 'nav_bar', NULL, NULL, NULL, NULL, NULL, NULL),
(54, 'فساتين', 'Dresses', NULL, NULL, NULL, NULL, NULL, 'images/1590761329.png', 'images/1590761314.png', 'images/1590761325.png', 'nav_bar', NULL, NULL, NULL, NULL, NULL, NULL),
(55, 'قمصان', 'Shirts', NULL, NULL, NULL, NULL, NULL, 'images/1590761329.png', 'images/1590761314.png', 'images/1590761325.png', 'nav_bar', NULL, NULL, NULL, NULL, NULL, NULL),
(56, 'قمصان', 'Shirts', NULL, NULL, NULL, NULL, NULL, 'images/1590761329.png', 'images/1590761314.png', 'images/1590761325.png', 'nav_bar', NULL, NULL, NULL, NULL, NULL, NULL),
(57, 'الفتيات', 'GIRLS', NULL, NULL, NULL, NULL, NULL, 'images/1590761329.png', 'images/1590761314.png', 'images/1590761325.png', 'nav_bar', NULL, NULL, NULL, NULL, NULL, NULL),
(58, 'أولاد', 'BOYS', NULL, NULL, NULL, NULL, NULL, 'images/1590761329.png', 'images/1590761314.png', 'images/1590761325.png', 'nav_bar', NULL, NULL, NULL, NULL, NULL, NULL),
(59, 'أطفال (2-12 سنة)', 'KIDS (2-12 YRS)', NULL, NULL, NULL, NULL, NULL, 'images/1590761329.png', 'images/1590761314.png', 'images/1590761325.png', 'nav_bar', NULL, NULL, NULL, NULL, NULL, NULL),
(60, 'قمصان', 'Shirts', NULL, NULL, NULL, NULL, NULL, 'images/1590761329.png', 'images/1590761314.png', 'images/1590761325.png', 'nav_bar', NULL, NULL, NULL, NULL, NULL, NULL),
(61, 'قمصان', 'Shirts', NULL, NULL, NULL, NULL, NULL, 'images/1590761329.png', 'images/1590761314.png', 'images/1590761325.png', 'nav_bar', NULL, NULL, NULL, NULL, NULL, NULL),
(62, 'بي بي بنات', 'BABY GIRLS', NULL, NULL, NULL, NULL, NULL, 'images/1590761329.png', 'images/1590761314.png', 'images/1590761325.png', 'nav_bar', NULL, NULL, NULL, NULL, NULL, NULL),
(63, 'بي بي صبيان', 'BABY BOYS', NULL, NULL, NULL, NULL, NULL, 'images/1590761329.png', 'images/1590761314.png', 'images/1590761325.png', 'nav_bar', NULL, NULL, NULL, NULL, NULL, NULL),
(64, 'قمصان', 'Shirts', NULL, NULL, NULL, NULL, NULL, 'images/1590761329.png', 'images/1590761314.png', 'images/1590761325.png', 'nav_bar', NULL, NULL, NULL, NULL, NULL, NULL),
(65, 'قمصان', 'Shirts', NULL, NULL, NULL, NULL, NULL, 'images/1590761329.png', 'images/1590761314.png', 'images/1590761325.png', 'nav_bar', NULL, NULL, NULL, NULL, NULL, NULL),
(66, 'لانجري', 'Lingerie', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'home_page', NULL, NULL, NULL, NULL, NULL, NULL),
(67, 'كحلي', 'Dark blue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(68, 'XL', 'XL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(69, 'قياسات', 'قياسات', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(70, '2XL', '2XL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(71, '3XL', '3XL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(72, 'ابيض', 'white', NULL, NULL, NULL, NULL, NULL, NULL, 'images/1590343204.jpg', 'images/1590343208.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `category_2_category`
--

CREATE TABLE `category_2_category` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL,
  `son_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category_2_category`
--

INSERT INTO `category_2_category` (`id`, `parent_id`, `son_id`) VALUES
(3, 2, 5),
(4, 5, 4),
(5, 5, 3),
(6, 5, 6),
(7, 8, 7),
(8, 8, 7),
(9, 7, 9),
(11, 10, 11),
(12, 7, 12),
(13, 7, 12),
(14, 7, 12),
(15, 7, 12),
(16, 7, 12),
(17, 5, 18),
(18, 5, 16),
(19, 5, 19),
(20, 5, 19),
(21, 5, 20),
(22, 5, 20),
(23, 5, 21),
(24, 5, 21),
(25, 5, 23),
(26, 5, 22),
(27, 5, 22),
(28, 25, 26),
(29, 25, 26),
(30, 26, 27),
(31, 26, 28),
(39, 26, 34),
(40, 26, 29),
(41, 26, 30),
(42, 26, 32),
(43, 26, 31),
(44, 26, 33),
(45, 26, 33),
(47, 26, 29),
(48, 25, 35),
(51, 25, 36),
(52, 25, 37),
(53, 25, 38),
(54, 25, 35),
(55, 25, 39),
(56, 25, 40),
(57, 25, 41),
(58, 25, 42),
(59, 35, 43),
(60, 35, 44),
(61, 35, 45),
(62, 35, 46),
(63, 36, 47),
(64, 36, 48),
(65, 36, 49),
(67, 36, 47),
(68, 37, 50),
(70, 37, 50),
(72, 50, 51),
(73, 50, 51),
(74, 50, 52),
(75, 37, 53),
(76, 51, 54),
(77, 51, 55),
(78, 52, 56),
(79, 37, 59),
(80, 59, 57),
(81, 59, 58),
(82, 57, 60),
(83, 58, 61),
(84, 53, 62),
(85, 53, 63),
(86, 62, 64),
(87, 63, 65),
(88, 35, 66),
(89, 7, 67),
(90, 69, 68),
(91, 69, 70),
(92, 69, 71),
(95, 7, 13),
(96, 7, 15),
(97, 7, 13),
(98, 7, 72),
(99, 3, 36);

-- --------------------------------------------------------

--
-- Table structure for table `category_region`
--

CREATE TABLE `category_region` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `region_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category_region`
--

INSERT INTO `category_region` (`id`, `category_id`, `region_id`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `favorite_ads`
--

CREATE TABLE `favorite_ads` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `favorite_ads`
--

INSERT INTO `favorite_ads` (`id`, `product_id`, `user_id`, `created_at`, `updated_at`) VALUES
(3, 71, 37, '2020-06-12 15:50:51', '2020-06-12 15:50:51'),
(4, 70, 37, '2020-06-12 15:51:37', '2020-06-12 15:51:37'),
(5, 55, 37, '2020-06-13 07:38:18', '2020-06-13 07:38:18'),
(6, 72, 45, '2020-06-13 15:15:01', '2020-06-13 15:15:01'),
(16, 69, 45, '2020-06-13 17:13:49', '2020-06-13 17:13:49');

-- --------------------------------------------------------

--
-- Table structure for table `latlong_regions`
--

CREATE TABLE `latlong_regions` (
  `id` int(10) UNSIGNED NOT NULL,
  `region_lat` double(8,2) NOT NULL,
  `region_long` double(8,2) NOT NULL,
  `region_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `latlong_regions`
--

INSERT INTO `latlong_regions` (`id`, `region_lat`, `region_long`, `region_id`) VALUES
(1, 34.94, 38.45, 1);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(157, '2014_10_12_000000_create_user_types', 1),
(158, '2014_10_12_010000_create_users_table', 1),
(159, '2014_10_12_100000_create_password_resets_table', 1),
(160, '2019_08_19_000000_create_failed_jobs_table', 1),
(161, '2020_02_15_235804_create_ad_categories', 1),
(162, '2020_02_16_120820_create_notifications', 1),
(163, '2020_02_16_191100_create_area_ads', 1),
(164, '2020_02_16_191239_create_ads_category_for_area_ads', 1),
(165, '2020_02_17_062320_create_users_rating_details', 1),
(166, '2020_03_08_132924_create_region_types', 1),
(167, '2020_03_08_133306_create_regions', 1),
(168, '2020_03_08_161333_create_latlong_regions', 1),
(169, '2020_03_08_170000_create_products', 1),
(170, '2020_03_08_171000_create_products_photos', 1),
(171, '2020_03_08_171100_create_favorite_ads', 1),
(172, '2020_03_08_171110_create_special_ad', 1),
(173, '2020_03_08_171111_create_previewds', 1),
(174, '2020_03_19_061044_create_categories', 1),
(175, '2020_03_19_061637_create_category_product', 1),
(176, '2020_03_27_063305_create_category_2_category', 1),
(177, '2020_03_31_210400_create_category_region', 1),
(178, '2016_06_01_000001_create_oauth_auth_codes_table', 2),
(179, '2016_06_01_000002_create_oauth_access_tokens_table', 2),
(180, '2016_06_01_000003_create_oauth_refresh_tokens_table', 2),
(181, '2016_06_01_000004_create_oauth_clients_table', 2),
(182, '2016_06_01_000005_create_oauth_personal_access_clients_table', 2),
(183, '2020_05_31_170927_create_sessions_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(10) UNSIGNED NOT NULL,
  `notification_note` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('02e66e32fc7bc6436e745a95b53f07b3fce5cd7834d7acf903ef89e1304384e3f73268ea838d0b3a', 45, 6, 'MyApp', '[\"user\"]', 0, '2020-06-10 17:02:03', '2020-06-10 17:02:03', '2021-06-10 20:02:03'),
('08ee2cdc690816dab6a0e50a8ffc8970921262598e7b28b697051ecf5458ffd186c20d52bcd32b2e', NULL, 3, NULL, '[]', 0, '2019-10-03 06:11:50', '2019-10-03 06:11:50', '2020-10-03 09:11:50'),
('0a4f10e07b273a62da0d15b9504f24c92e665683078a87e3a4dedce95c4de434a125263ee1ae5049', 45, 6, 'MyApp', '[\"user\"]', 0, '2020-06-10 16:43:38', '2020-06-10 16:43:38', '2021-06-10 19:43:38'),
('0a54a56fd15def269aa9071d8fab12d13fafd180d8605440efa7bdba67970e2813bdc2e00e48a6bb', 44, 6, 'MyApp', '[\"user\"]', 0, '2020-06-10 07:36:13', '2020-06-10 07:36:13', '2021-06-10 10:36:13'),
('11ae1a18492c93db6c0fef79c798b6938a6ea67476b202683fd91fef595ba3eddde943876c9d53c3', 41, 6, 'MyApp', '[\"user\"]', 0, '2020-06-06 04:02:46', '2020-06-06 04:02:46', '2021-06-06 07:02:46'),
('181dc780ab3452242fc7a6cc5d3e124318313230b5088081c555c81069165a33a98eecf8da93bd7c', 32, 6, 'MyApp', '[\"*\"]', 0, '2019-11-26 05:36:21', '2019-11-26 05:36:21', '2020-11-26 07:36:21'),
('20175197ac1c97549d89b13a44707cb81ec65cf708b87a177c553328218b85986c3d59da0745a981', 32, 6, 'MyApp', '[\"user\"]', 0, '2019-10-09 15:43:43', '2019-10-09 15:43:43', '2020-10-09 18:43:43'),
('211a134d205df022abb3ebccd504b62831cf44647d72da538ecd1c8c4c3ed8b02f6055bbef191b93', 7, 6, 'MyApp', '[\"employeer\"]', 0, '2019-10-19 09:13:24', '2019-10-19 09:13:24', '2020-10-19 12:13:24'),
('22f156fea2b529ceae55a625f64f0d66b03ed7ae65a8fb7d7e915458a511a0e46160487d453336c6', 7, 6, 'MyApp', '[\"employeer\"]', 0, '2019-10-19 09:15:34', '2019-10-19 09:15:34', '2020-10-19 12:15:34'),
('26adc3b5deaf1ddc3505978b2366a007e5a589c3e8a5d39c3e345d6812d1959318ae35e98e837ad5', 43, 6, 'MyApp', '[\"user\"]', 0, '2020-06-06 06:15:51', '2020-06-06 06:15:51', '2021-06-06 09:15:51'),
('28cbd2f0bce894b7befb09976f6914aa8fb26a06436a5c464eb3b2667a8a56af0672734dafc3abde', 19, 6, 'MyApp', '[\"*\"]', 0, '2019-10-20 03:55:01', '2019-10-20 03:55:01', '2020-10-20 06:55:01'),
('292edc07b97517c8f325b2d13f957d72542fe91bb9dbbd48761d2fa51686808585a63332dcc1a11c', 25, 6, 'MyApp', '[\"*\"]', 0, '2019-10-20 04:00:27', '2019-10-20 04:00:27', '2020-10-20 07:00:27'),
('29f3da57f9ca4e7c9126ae7b199a7cd7fd69a1288cb4e220caacafda388d6332881e0f3a7d36e4f4', 45, 6, 'MyApp', '[\"user\"]', 0, '2020-06-10 16:44:47', '2020-06-10 16:44:47', '2021-06-10 19:44:47'),
('2b6a128e234bf78bfb719fdff46e1879ac98df9e31e3f5141873488e3a21ca95d13c85f66b558d4e', 46, 6, 'MyApp', '[\"user\"]', 0, '2020-06-15 09:53:29', '2020-06-15 09:53:29', '2021-06-15 12:53:29'),
('2e43cd375cd85e06a0ac5006258bd6d5eada89caf5433d5f7606b3de9451a039502cb4b9f5f45dc5', 22, 6, 'MyApp', '[\"*\"]', 0, '2019-10-20 03:57:22', '2019-10-20 03:57:22', '2020-10-20 06:57:22'),
('31837db7d638cd757f304a2467bdeb4ff1dfce887cae77987223dd31db95aaece03d18ce42cb2df8', 40, 6, 'MyApp', '[\"user\"]', 0, '2020-06-06 04:02:36', '2020-06-06 04:02:36', '2021-06-06 07:02:36'),
('31ff12c0020191378126d544b429479d7aa8e0c3fce952c1347cdc167ef4c440ce745ac5fa3db37e', 28, 6, 'MyApp', '[\"*\"]', 0, '2019-10-20 05:00:10', '2019-10-20 05:00:10', '2020-10-20 08:00:10'),
('32e0870ea8d0bc53ebcb8aedc5bf72e2887ebe24a4e4f61a8f9511fa6a30c1a5d8cf58e59a1f8449', 33, 6, 'MyApp', '[\"*\"]', 0, '2019-12-10 08:37:27', '2019-12-10 08:37:27', '2020-12-10 10:37:27'),
('37cd13755d5fc21d9b5e29ea33d90d6324489f1c522cd44a7b5f84f468f75ed6112ae8282130e01c', 8, 6, 'MyApp', '[\"*\"]', 0, '2019-10-20 03:46:56', '2019-10-20 03:46:56', '2020-10-20 06:46:56'),
('3b04b311a30cdc85c2f19e1dca1232cce73790073927ced209e4521a36468778bd2c5647c256e3fc', 3, 6, 'MyApp', '[\"user\"]', 0, '2019-10-17 06:40:28', '2019-10-17 06:40:28', '2020-10-17 09:40:28'),
('3b288c6e04ea47a6494f6a3c44ef934146abc89abb7437a5acfb84f56a21736ceb846fdf999270fa', 7, 6, 'MyApp', '[\"user\"]', 0, '2019-10-19 08:59:21', '2019-10-19 08:59:21', '2020-10-19 11:59:21'),
('3cbaa3562a6c73bf35d336b2411414c7783bc5ca206fde5e621134b29fc8d48b8f2040a47bbca653', 43, 6, 'MyApp', '[\"user\"]', 0, '2020-06-06 06:09:14', '2020-06-06 06:09:14', '2021-06-06 09:09:14'),
('3e8bfecee6efd134a4cd2601898758ff7b349ba001066f14968155e9006377da9a0efdb7ec7f25ed', 45, 6, 'MyApp', '[\"user\"]', 0, '2020-06-10 16:56:24', '2020-06-10 16:56:24', '2021-06-10 19:56:24'),
('3fa0f8cff6646961d5cdfa659a51759fac764cd2695f13de434f21f054a982e7284b0d25b8789fc5', 43, 6, 'MyApp', '[\"user\"]', 0, '2020-06-06 06:10:03', '2020-06-06 06:10:03', '2021-06-06 09:10:03'),
('402bca895fc031cd1e0f5941af72922400bb547cf7668d4ae3e8e2b7dcd9c0f217dcb7707356b58e', 45, 6, 'MyApp', '[\"user\"]', 0, '2020-06-10 15:04:44', '2020-06-10 15:04:44', '2021-06-10 18:04:44'),
('41eed7e4651ec774e40cdb110eb648da66b6f405c9fd4ccc72c1c5b5974649f319e995afa3491131', 7, 6, 'MyApp', '[\"user\"]', 0, '2019-10-19 09:11:53', '2019-10-19 09:11:53', '2020-10-19 12:11:53'),
('475cc2c3506c3ae7b2efb3f2ef21d86fca3fe838d64936c5f7d5b160f4c224048e33e23a7904b4d6', 42, 6, 'MyApp', '[\"user\"]', 0, '2020-06-06 04:03:01', '2020-06-06 04:03:01', '2021-06-06 07:03:01'),
('49116477a500f77caf74f426f71fe6419eee5a37d9c609d19a9384c7668ef3010d95aa6a9c342aaa', 27, 6, 'MyApp', '[\"user\"]', 0, '2019-10-05 07:33:35', '2019-10-05 07:33:35', '2020-10-05 10:33:35'),
('49a20b863bb3fd1c353401fdfa5cd9622d60c75a0d1049b6e60c5741d08ab70f112cdce979feded7', 35, 6, 'MyApp', '[\"user\"]', 0, '2020-06-05 16:05:12', '2020-06-05 16:05:12', '2021-06-05 19:05:12'),
('4aa83e455a54b4e33042b56c862d1c600043c740cd93cb4b35a14a979483de9340308bb10a05f906', 45, 6, 'MyApp', '[\"user\"]', 0, '2020-06-10 16:53:41', '2020-06-10 16:53:41', '2021-06-10 19:53:41'),
('4f8fe454b41a036d6894650d4caf6b223c1be7d6b3fe41ae422d0cda27a28d143482cb028ba80c90', 1, 6, 'MyApp', '[\"user\"]', 0, '2019-10-11 15:53:00', '2019-10-11 15:53:00', '2020-10-11 18:53:00'),
('563fca1c31b46dd9f228465494a7297a7acd868ae6a9d402ed0545385bf6837d0ac1f5df7f356e03', NULL, 3, NULL, '[]', 0, '2019-10-03 06:19:14', '2019-10-03 06:19:14', '2020-10-03 09:19:14'),
('579d9f187e7e0a70b19e4fd5766bf2be3b380b87ee2ed98f946d4a8ecc125a372f836f5b06de16d9', 43, 6, 'MyApp', '[\"user\"]', 0, '2020-06-06 06:03:37', '2020-06-06 06:03:37', '2021-06-06 09:03:37'),
('591ec26a4de3aa14b4b7f78e5b40471c327b7f8c93eddd0f474225ed041cfa66b0648a68a08db2e6', 45, 6, 'MyApp', '[\"user\"]', 0, '2020-06-10 15:07:07', '2020-06-10 15:07:07', '2021-06-10 18:07:07'),
('5e7778d779a9baac8cfaa0060eaaf726bc59220dad69f89d2d2e8e7cc1833a685360317d7a8c3d02', 36, 6, 'MyApp', '[\"user\"]', 0, '2020-06-05 16:10:13', '2020-06-05 16:10:13', '2021-06-05 19:10:13'),
('623815d5ef71b331457de44e9c6f94fbec7d468036aa91f1453e861ec4dead986d7feff4e64fc3d2', 45, 6, 'MyApp', '[\"user\"]', 0, '2020-06-10 18:08:49', '2020-06-10 18:08:49', '2021-06-10 21:08:49'),
('67bcbb53ad99af09134d73cf6f550de546965c0c76b1698253fc3e64d0079b1a1b64df86092ae52e', 45, 6, 'MyApp', '[\"user\"]', 0, '2020-06-10 17:51:33', '2020-06-10 17:51:33', '2021-06-10 20:51:33'),
('691c66a7b0c3be9230bb9b3c8e867faca15be64085fa5ca1d103e170bbe44e17a67976ea84a9fc94', 7, 6, 'MyApp', '[\"user\"]', 0, '2019-10-20 03:35:01', '2019-10-20 03:35:01', '2020-10-20 06:35:01'),
('6b40213a1dd758de1481a0cfc8b5f8b4c8db2df7950de740315c6770bd4a480518d497aaa2b1c2ab', 27, 6, 'MyApp', '[\"user\"]', 0, '2019-10-20 04:03:05', '2019-10-20 04:03:05', '2020-10-20 07:03:05'),
('6c95bba80181fde74ba59cbae9a06119240b1c25ced9e8a936c1bb165dc08e78ecc6a0c1cb5a5f54', 6, 6, 'MyApp', '[\"user\",\"employeer\"]', 0, '2019-10-19 08:52:06', '2019-10-19 08:52:06', '2020-10-19 11:52:06'),
('6f3d7ba03eac97f31e75645fe4ed6c2c83d6cb14ccb8c79f9883ce95a7d51ecfb0388fbd1032c058', 45, 6, 'MyApp', '[\"user\"]', 0, '2020-06-10 16:57:56', '2020-06-10 16:57:56', '2021-06-10 19:57:56'),
('6f877617ec599567ce10301259560c757fd47569d0b9c30cacf62a30c6b2aef077633a1ecb6fce2f', 45, 6, 'MyApp', '[\"user\"]', 0, '2020-06-10 16:42:31', '2020-06-10 16:42:31', '2021-06-10 19:42:31'),
('7039f53f390927f258136d03d15e0da25b907aff175cbfec25310a42ad9d53d6fd411b22927fc9b9', 45, 6, 'MyApp', '[\"user\"]', 0, '2020-06-10 14:25:08', '2020-06-10 14:25:08', '2021-06-10 17:25:08'),
('70ffb269cfe89c27c600729992f03934680c86b53d1e618be3a40211354e3421535a2bebf62d9d35', 45, 6, 'MyApp', '[\"user\"]', 0, '2020-06-10 17:09:28', '2020-06-10 17:09:28', '2021-06-10 20:09:28'),
('775d5e2214f5fc817529aab49be9aa7332662b606c5eecda6a20ffcca48aacfab5253c95d347a525', 1, 6, 'MyApp', '[\"user\"]', 0, '2019-10-11 16:07:59', '2019-10-11 16:07:59', '2020-10-11 19:07:59'),
('780a66160bfb8c8ae3bc7ccceebc2808c32140d56818b5e2a4576dd5bb6edfd70f75a665a857535e', 38, 6, 'MyApp', '[\"user\"]', 0, '2020-06-06 03:47:22', '2020-06-06 03:47:22', '2021-06-06 06:47:22'),
('79036831b7ef27c80e191b7ba5ebb8066736941fa8842c9024f94a9d89e0da3dfe2c76e1c3fe22b1', 45, 6, 'MyApp', '[\"user\"]', 0, '2020-06-10 15:04:20', '2020-06-10 15:04:20', '2021-06-10 18:04:20'),
('79a8c7a72ac5c13eac10bbab28a68a98b700bfce4a766aa1bc7cb63c1412ae471438693adbd949ce', 45, 6, 'MyApp', '[\"user\"]', 0, '2020-06-10 16:45:18', '2020-06-10 16:45:18', '2021-06-10 19:45:18'),
('7b139a9911d93d1972d3a0250eec0ec7e8cb4291903b97f0cd1e3835c12710aece5b7f35ac44e7e6', 33, 6, 'MyApp', '[\"admin\"]', 0, '2019-12-10 17:16:09', '2019-12-10 17:16:09', '2020-12-10 19:16:09'),
('7cad897dd54fed283f2597edf03fa93051b127fbab01d127d91e0244a55d546bd2931817f500e384', 43, 6, 'MyApp', '[\"user\"]', 0, '2020-06-06 06:10:55', '2020-06-06 06:10:55', '2021-06-06 09:10:55'),
('7cc945352c611fdd1fc5d4a9a584eba0ee7ac24128bd2947416f9d29240ae1252bd072ec6b42526f', 45, 6, 'MyApp', '[\"user\"]', 0, '2020-06-10 17:07:16', '2020-06-10 17:07:16', '2021-06-10 20:07:16'),
('7e9c1aad22a01117f6ddbcec77d9f31e1b0c60d3eabc4067cf40296829c408fa2177fd8755d9c4a4', 45, 6, 'MyApp', '[\"user\"]', 0, '2020-06-10 17:08:18', '2020-06-10 17:08:18', '2021-06-10 20:08:18'),
('7fbcfdd113a66afd5b886420f02e489ebac91caa1c20e456f74d6694f48900b7da9102607df66ab1', 39, 6, 'MyApp', '[\"user\"]', 0, '2020-06-06 04:02:18', '2020-06-06 04:02:18', '2021-06-06 07:02:18'),
('7fc361200f49c6c7dcc1b1196b42d3bc0e0bf370b4313a65ef3e8dcc87871afe3f851dbe9e4a1b6c', 45, 6, 'MyApp', '[\"user\"]', 0, '2020-06-10 17:07:39', '2020-06-10 17:07:39', '2021-06-10 20:07:39'),
('90a6670e89769982148ebb6a84639aef071493ae1af2496c01f5a8f41da1156825603dce50529575', 26, 6, 'MyApp', '[\"*\"]', 0, '2019-10-20 04:01:14', '2019-10-20 04:01:14', '2020-10-20 07:01:14'),
('90d4bcb0d4ac8fd523896c47a0239733099082df88d2af25c2b9c9a3bc361acbc6ba2c94e9183220', 45, 6, 'MyApp', '[\"user\"]', 0, '2020-06-10 16:58:32', '2020-06-10 16:58:32', '2021-06-10 19:58:32'),
('949e191bb0be7fcd5c9d05e5d58d7a0809683ef3914a97196e1a566e8208648f58683099417e5968', 45, 6, 'MyApp', '[\"user\"]', 0, '2020-06-10 15:09:03', '2020-06-10 15:09:03', '2021-06-10 18:09:03'),
('94ec980396c897d5df340dec683ed97a8a18f21be533254e4d35893bba0da8c89cd4e641da0cf3ba', 45, 6, 'MyApp', '[\"user\"]', 0, '2020-06-10 14:47:04', '2020-06-10 14:47:04', '2021-06-10 17:47:04'),
('965de0cb22df28ed942ef830edad2a41ec163d62916a3ee0dd5b867de8832471ca68bf01208ecc2c', 46, 6, 'MyApp', '[\"user\"]', 0, '2020-06-15 09:23:08', '2020-06-15 09:23:08', '2021-06-15 12:23:08'),
('96dc1f4b732d1881e477066a726f1a8c38bbfaeee471c865696f22185e70323f5d9a712fa28f8feb', 29, 6, 'MyApp', '[\"*\"]', 0, '2019-11-13 07:08:49', '2019-11-13 07:08:49', '2020-11-13 09:08:49'),
('9daf97d13dd06efb54a6470b71c4e86d0de8947f495d1bd0c54225646cfe027b1f9c41884ccb22b4', 7, 6, 'MyApp', '[\"user\"]', 0, '2019-10-20 03:19:01', '2019-10-20 03:19:01', '2020-10-20 06:19:01'),
('9ee6b999d57783e84f6fd12acaad23667f6dfbcf9e36c0fdfbddec47f0d43c52d53776243c7688b7', NULL, 3, NULL, '[]', 0, '2019-10-03 19:08:32', '2019-10-03 19:08:32', '2020-10-03 22:08:32'),
('a02a8b7397e2d48f4c1be06c0914fd7187a8b412e92b2ab3de6b1eee084fac5feba6f2c894712967', 43, 6, 'MyApp', '[\"user\"]', 0, '2020-06-06 06:15:17', '2020-06-06 06:15:17', '2021-06-06 09:15:17'),
('a4528979c3399996db08b6dfdef0866aa04c750b51175b7a8942c75a818e24050d41a3863d573683', 23, 6, 'MyApp', '[\"*\"]', 0, '2019-10-20 03:58:38', '2019-10-20 03:58:38', '2020-10-20 06:58:38'),
('a503c77e2a942ba7729f58036c26ea85bb16230f4416151eae20d37895ceab501ec1d73d3462324d', 33, 6, 'MyApp', '[\"user\"]', 0, '2019-10-09 15:49:39', '2019-10-09 15:49:39', '2020-10-09 18:49:39'),
('a5426cd1632486dd1416b78ffda4f02f063260275ee8e522a0600bddebfa186157aceaf564f6eee5', 33, 6, 'MyApp', '[\"admin\"]', 0, '2019-12-10 17:15:25', '2019-12-10 17:15:25', '2020-12-10 19:15:25'),
('a5d143928cea086989720fcdbca41502e61931defa05b3b0f974584ddfc0eeb4f00cdabab60e8acb', 35, 6, 'MyApp', '[\"user\"]', 0, '2019-10-11 04:11:19', '2019-10-11 04:11:19', '2020-10-11 07:11:19'),
('a62bc8fba67bbd2feac49d4fbc05eeb08e26424bc079e0b8e6151a0d99a2cb852ef9efdf8010de2f', 26, 6, 'MyApp', '[\"employeer\"]', 0, '2019-10-05 07:32:08', '2019-10-05 07:32:08', '2020-10-05 10:32:08'),
('a7c9401a6b7ce689f6940cc2b58b7d1f445e68cc487057454fa8be9ce8ac63911b07d6ad6b47c312', 45, 6, 'MyApp', '[\"user\"]', 0, '2020-06-10 15:06:31', '2020-06-10 15:06:31', '2021-06-10 18:06:31'),
('a8df639f7ff5a2287ce7037208044b08ca4d4e0e55bcbd1b81913cc5c9fc299d88789eec8eb42da3', 24, 6, 'MyApp', '[\"*\"]', 0, '2019-10-20 03:59:18', '2019-10-20 03:59:18', '2020-10-20 06:59:18'),
('a9b39a6d768cf82dd02e008d2883aa35428b8914451f6f70c9f2a97dc9e697f3cf7caff6ad26cf61', 46, 6, 'MyApp', '[\"user\"]', 0, '2020-06-15 09:23:43', '2020-06-15 09:23:43', '2021-06-15 12:23:43'),
('aa67740f26b4a8db2abd7675424b601809cbea4bfa06a3f4837048c4e25431be3fc883851fff4811', 36, 6, 'MyApp', '[\"user\"]', 0, '2019-10-11 07:31:23', '2019-10-11 07:31:23', '2020-10-11 10:31:23'),
('aa8dfb2ac0f4572ac851c7e6d88bd52214b8caee89cde4f27b0631eb03aa875ba0e18ecd6e2bee90', 1, 6, 'MyApp', '[\"employeer\"]', 0, '2019-10-11 17:11:24', '2019-10-11 17:11:24', '2020-10-11 20:11:24'),
('ab4c98d56d5c3516c4957259aa72188febb5aa9f04d20534f59996983c76f69c271ac41bcc813df4', 43, 6, 'MyApp', '[\"user\"]', 0, '2020-06-06 06:13:20', '2020-06-06 06:13:20', '2021-06-06 09:13:20'),
('abf527a03b668e8e5bb22207a04849a71a9db667c8b05d4e59d9b46a42c43698aeb20b0251cbbd18', 45, 6, 'MyApp', '[\"user\"]', 0, '2020-06-10 07:39:11', '2020-06-10 07:39:11', '2021-06-10 10:39:11'),
('ae996c9d400363f2330a87a9a2d098a86ffacd9fbfd1ff9125172bec85e899c0ca6876a0291c5d2f', 45, 6, 'MyApp', '[\"user\"]', 0, '2020-06-10 16:55:07', '2020-06-10 16:55:07', '2021-06-10 19:55:07'),
('b176489e14284e160e9e35c134390b87ada7c7b59d448a0427330e49812c831e808f7765da7b5394', 4, 6, 'MyApp', '[\"user\"]', 0, '2019-10-19 05:37:35', '2019-10-19 05:37:35', '2020-10-19 08:37:35'),
('b335dced797ca4f9317198aba2aa2be11512a18c6ba81d5462be423a12c91fe387d1dfe7f397eaef', NULL, 3, NULL, '[]', 0, '2019-10-04 04:41:10', '2019-10-04 04:41:10', '2020-10-04 07:41:10'),
('b982e4497ad226525d1a9222235014de8191d553f5f0426f1f91f33abbe512182ada717493c3861f', 43, 6, 'MyApp', '[\"user\"]', 0, '2020-06-06 06:02:12', '2020-06-06 06:02:12', '2021-06-06 09:02:12'),
('ba80f2a5568a97ceb61e3cb82b96d6e3aaa7766477d2d725ce5a415ffd94c3b863ec49b20f848ab8', 34, 6, 'MyApp', '[\"user\"]', 0, '2020-06-05 15:26:51', '2020-06-05 15:26:51', '2021-06-05 18:26:51'),
('bd598e3fd446adb60dd2394513c33c503790c0fb1dd54b603fb836a84938d5e665f82326af9e628f', 1, 6, 'MyApp', '[\"employeer\"]', 0, '2019-10-11 17:33:36', '2019-10-11 17:33:36', '2020-10-11 20:33:36'),
('bf17adfe3b1bd9b57dc2d73bc4a3b5ab1993e37b2d9be29cbfb4547510b953b25170550c351f49bc', 1, 6, 'MyApp', '[\"employeer\"]', 0, '2019-10-11 16:09:36', '2019-10-11 16:09:36', '2020-10-11 19:09:36'),
('bfd50729f6d966b3fbeba2f90ad1de6580925dc0b5e4b7ca0ca7403de5de1205d2fb60f6045f7d40', 45, 6, 'MyApp', '[\"user\"]', 0, '2020-06-10 16:54:17', '2020-06-10 16:54:17', '2021-06-10 19:54:17'),
('c4bc0a3c6c4c13c3f7c97159d3c851c2c046c60dd195c96014bc9654b83708eb714a2a383c1f9ed7', 45, 6, 'MyApp', '[\"user\"]', 0, '2020-06-10 14:46:29', '2020-06-10 14:46:29', '2021-06-10 17:46:29'),
('c5a7c5d3de6a5a6aa3dbb11e87f51d7f7a7c7e37c1d8dc43220d950c201df7d6922a4d6d878af2e6', 45, 6, 'MyApp', '[\"user\"]', 0, '2020-06-10 12:42:13', '2020-06-10 12:42:13', '2021-06-10 15:42:13'),
('c5c492b3de0c74b96407e2c0ca28e075a2601dc8f0091d2a03aba77df6fd7af5edd65129cc7d80d6', 7, 6, 'MyApp', '[\"employeer\"]', 0, '2019-10-19 09:18:27', '2019-10-19 09:18:27', '2020-10-19 12:18:27'),
('c67ddb30780d20326fbce53bbe4fae55f10a3f50ee28495f7047b6b1011f3c7a1e97537bf096ef8b', 24, 6, 'MyApp', '[]', 0, '2019-10-05 03:58:18', '2019-10-05 03:58:18', '2020-10-05 06:58:18'),
('c82adc43c15f259c574f1780a87f79f9441b44ef135cf7ccdfe52f3b21d516c91e982b99b7c4f1bc', NULL, 3, NULL, '[]', 0, '2019-10-03 06:21:21', '2019-10-03 06:21:21', '2020-10-03 09:21:21'),
('c995f601e0486bbc8cefcae210300825e58a74745776d60bdb7318e27f7b70ec6ec56286374bebb0', 45, 6, 'MyApp', '[\"user\"]', 0, '2020-06-10 07:38:56', '2020-06-10 07:38:56', '2021-06-10 10:38:56'),
('cd2aeb60c1360e1ed944d3a716364e7c553c6c1f2e67720a579611d2181379f052da0451ed4308b5', 45, 6, 'MyApp', '[\"user\"]', 0, '2020-06-10 17:10:24', '2020-06-10 17:10:24', '2021-06-10 20:10:24'),
('cf2e058088410a449c352f83a7b5c16572b7033cf63c013b55302024a7fa5d16483d3ffb82f781ac', 45, 6, 'MyApp', '[\"user\"]', 0, '2020-06-10 17:05:37', '2020-06-10 17:05:37', '2021-06-10 20:05:37'),
('d0f61f57bceb68847b1fcc189c0ffd79a2f2fd95617641f102f7f8a29802379a674964ba79eee30b', 2, 6, 'MyApp', '[\"user\"]', 0, '2019-10-15 15:52:31', '2019-10-15 15:52:31', '2020-10-15 18:52:31'),
('d394b5743dec63bde6072b9268c13a17f7cfa40129d4671594d645e488845ef01f413fceda035bf6', 30, 6, 'MyApp', '[\"*\"]', 0, '2019-11-13 07:09:03', '2019-11-13 07:09:03', '2020-11-13 09:09:03'),
('d8465d7ef46d3462f912917d599d9cf44ad21b3f4c0b2361cf8b5fd0299d8be4f08f388d99e79ba1', 45, 6, 'MyApp', '[\"user\"]', 0, '2020-06-10 17:09:01', '2020-06-10 17:09:01', '2021-06-10 20:09:01'),
('d91dc0635643303faf33714bcc11101d735f5338f5fbe83066ff05860b3a62f4d86eae5289576b44', 7, 6, 'MyApp', '[\"user\"]', 0, '2019-10-19 09:18:55', '2019-10-19 09:18:55', '2020-10-19 12:18:55'),
('dad9a33af290784b78fe4c185f58051c2726d61bd17585ce6e80b9098575ab34b3d82fc97f7d58c7', 25, 6, 'MyApp', '[\"*\"]', 0, '2019-10-05 04:51:58', '2019-10-05 04:51:58', '2020-10-05 07:51:58'),
('db1a32ed65752e417b553da4eed74fda7afb8bb105240e73e4df31dd64c5457dab8ba170a06e238f', 1, 6, 'MyApp', '[\"employeer\"]', 0, '2019-10-11 17:34:32', '2019-10-11 17:34:32', '2020-10-11 20:34:32'),
('dc127677afc1e40fac3afea000bb9b5e6922772a3f9016b3f5e909629feefde6d93a3abb4cd57f39', 45, 6, 'MyApp', '[\"user\"]', 0, '2020-06-10 16:42:37', '2020-06-10 16:42:37', '2021-06-10 19:42:37'),
('e1dce0d2273855539e4f9040bc1d73b60234d02b633183f4cd35705cc40dcb4f871b98ec85cf51f5', 45, 6, 'MyApp', '[\"user\"]', 0, '2020-06-10 16:34:27', '2020-06-10 16:34:27', '2021-06-10 19:34:27'),
('e5105776518c6062bdcc66940d7c535c7c991a7ff372b83597081df7acaa2964b982fb5b77e38cdc', 37, 6, 'MyApp', '[\"user\"]', 0, '2020-06-05 16:11:41', '2020-06-05 16:11:41', '2021-06-05 19:11:41'),
('e84fe20661d4a72a93bde0bc9dd3773ef52c7a4eacac85241e03d77f7243e94771a35ccc58537391', 43, 6, 'MyApp', '[\"user\"]', 0, '2020-06-06 06:03:08', '2020-06-06 06:03:08', '2021-06-06 09:03:08'),
('e8cc0186d0a6dd47f05346b0e6c42a250169b7af0141f52bd9332f6692ae1e2bb3d8b77b172219a0', 45, 6, 'MyApp', '[\"user\"]', 0, '2020-06-10 17:05:11', '2020-06-10 17:05:11', '2021-06-10 20:05:11'),
('e912ad4734b11c120f1e4e3d67644338e87231cd70a3c4092ea7a35423322e1b83902c7161a666f9', 45, 6, 'MyApp', '[\"user\"]', 0, '2020-06-10 14:47:13', '2020-06-10 14:47:13', '2021-06-10 17:47:13'),
('ea8040729b2ec78626621511bd82e8c42b02ace84f7ff8892cee25c733c48b407fbbbf139d4d3919', 45, 6, 'MyApp', '[\"user\"]', 0, '2020-06-10 16:44:15', '2020-06-10 16:44:15', '2021-06-10 19:44:15'),
('ecc22d1f7bceab99b5b2e910119ee9e6974ac6a16efb1315202ba0876075fe1d998a3671a468754a', 45, 6, 'MyApp', '[\"user\"]', 0, '2020-06-10 15:04:26', '2020-06-10 15:04:26', '2021-06-10 18:04:26'),
('efcc0af00d598fe628911997468018f7bc8d5e9ffdc47df948e5f32b7116b6e0733d7f2c18c319a2', 30, 6, 'MyApp', '[\"user\"]', 0, '2019-10-09 04:17:16', '2019-10-09 04:17:16', '2020-10-09 07:17:16'),
('f10fc844fc0cc786e7aab93f0e87543e10d4c7afa4dbffcb786a2caced58b30aa9ac8d9f20052977', 31, 6, 'MyApp', '[\"*\"]', 0, '2019-11-16 09:48:36', '2019-11-16 09:48:36', '2020-11-16 11:48:36'),
('f67d6ea8eff5da1a0174feae874ac0e2bd7e332d4e83e549bad096700c2eceabf005ac62cb5782c1', 1, 6, 'MyApp', '[\"employeer\"]', 0, '2019-10-11 17:34:00', '2019-10-11 17:34:00', '2020-10-11 20:34:00'),
('fa71d33ab8f4e11bdc9677a3d2c3e693d2f0a5ad3a4f5f9945bc0c7a66d6d55f5799f14a0f1dbf6e', 45, 6, 'MyApp', '[\"user\"]', 0, '2020-06-10 12:45:40', '2020-06-10 12:45:40', '2021-06-10 15:45:40');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'Lspw3K4sVQm0F6a1wtN1la2cOfrYlp7GEtCGpcM5', 'http://localhost', 1, 0, 0, '2019-10-03 03:20:20', '2019-10-03 03:20:20'),
(2, NULL, 'Laravel Password Grant Client', 'L9p0BctqlvWUlGLHJie1GPs16nMVsd8lZSTXK3MO', 'http://localhost', 0, 1, 0, '2019-10-03 03:20:20', '2019-10-03 03:20:20'),
(3, 0, 'clientyaser', '3BAFuDcuGxrCPs48QRp6OSzsMzFUkF2t1btS8syF', 'http://localhost/auth/callback', 0, 0, 0, '2019-10-03 05:52:10', '2019-10-03 05:52:10'),
(4, NULL, 'Laravel Personal Access Client', 'fw77Oxs5UA2PjUYQ1j2ulV4ivkIDiKqUjTehR9UQ', 'http://localhost', 1, 0, 0, '2019-10-03 19:06:57', '2019-10-03 19:06:57'),
(5, NULL, 'Laravel Password Grant Client', 'Yn9eK1L05lfqUAx5gJOBmx724JkqDRRRlWmQefwD', 'http://localhost', 0, 1, 0, '2019-10-03 19:06:57', '2019-10-03 19:06:57'),
(6, NULL, 'Laravel Personal Access Client', 'IgIzoFdMJ9gkZwzNeyxpPF2h1RbTJN5EEk4N1Ujq', 'http://localhost', 1, 0, 0, '2019-10-05 02:51:31', '2019-10-05 02:51:31'),
(7, NULL, 'Laravel Password Grant Client', 'MIR2NUC80xIDk1HqA8lz7OtQADOc0lXltWokXkBu', 'http://localhost', 0, 1, 0, '2019-10-05 02:51:31', '2019-10-05 02:51:31'),
(8, 11, 'test', 'xjiOZx4WVjI378nTklgk5vSMVlW2BEod5Jwf8fPP', 'http://localhost/auth/callback', 0, 0, 0, '2019-10-09 15:50:00', '2019-10-09 15:50:00');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2019-10-03 03:20:20', '2019-10-03 03:20:20'),
(2, 4, '2019-10-03 19:06:57', '2019-10-03 19:06:57'),
(3, 6, '2019-10-05 02:51:31', '2019-10-05 02:51:31');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `product_id`, `user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(23, 0, 45, '2020-06-14 08:01:40', '2020-06-14 08:01:40', NULL),
(24, 0, 45, '2020-06-14 08:03:39', '2020-06-14 08:03:39', NULL),
(25, 0, 45, '2020-06-14 10:01:36', '2020-06-14 10:01:36', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `previewd_products`
--

CREATE TABLE `previewd_products` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `start_date_on_site` datetime DEFAULT NULL,
  `views` int(11) DEFAULT NULL,
  `price` float UNSIGNED NOT NULL,
  `showed_price` float UNSIGNED DEFAULT NULL,
  `milage` int(11) DEFAULT NULL,
  `make_date` datetime DEFAULT NULL,
  `regesteration_date` datetime(6) DEFAULT NULL,
  `dealer_rating` smallint(6) DEFAULT NULL,
  `note_ar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_en` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fuel_Economy` int(11) DEFAULT NULL,
  `newprice` float UNSIGNED DEFAULT NULL,
  `vin` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stock` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Features_and_options` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `make_location` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_for_advertise` smallint(6) DEFAULT NULL,
  `is_for_saving` smallint(6) DEFAULT NULL,
  `is_notified` smallint(6) DEFAULT NULL,
  `ccengine` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nonumber` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `summaryofcare` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_ar` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_en` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phonenumber` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uploaded_photo_path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `whats_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_deleted` smallint(6) DEFAULT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` smallint(6) DEFAULT NULL,
  `number_of_views` int(11) DEFAULT NULL,
  `description_text` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `region_id` int(10) UNSIGNED DEFAULT NULL,
  `ad_category_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `total_product_in_stocks_number` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `start_date_on_site`, `views`, `price`, `showed_price`, `milage`, `make_date`, `regesteration_date`, `dealer_rating`, `note_ar`, `note_en`, `fuel_Economy`, `newprice`, `vin`, `stock`, `Features_and_options`, `make_location`, `is_for_advertise`, `is_for_saving`, `is_notified`, `ccengine`, `nonumber`, `summaryofcare`, `name_ar`, `name_en`, `email`, `phonenumber`, `uploaded_photo_path`, `whats_phone`, `is_deleted`, `username`, `address`, `is_active`, `number_of_views`, `description_text`, `region_id`, `ad_category_id`, `user_id`, `created_at`, `updated_at`, `deleted_at`, `total_product_in_stocks_number`) VALUES
(60, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, 'note_ar', 'note_en', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'name_ar', 'name_en', 'email', 'phonenumber', NULL, 'whats_phone', NULL, NULL, 'address', NULL, NULL, 'description_text', NULL, NULL, NULL, '2020-05-23 18:06:41', '2020-06-06 14:46:22', '2020-06-06 14:46:22', NULL),
(63, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, 'note_ar', 'note_en', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'name_ar', 'name_en', 'email', 'phonenumber', NULL, 'whats_phone', NULL, NULL, 'address', NULL, NULL, 'description_text', NULL, NULL, NULL, '2020-05-23 18:10:35', '2020-06-06 14:53:59', '2020-06-06 14:53:59', NULL),
(64, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, 'note_ar', 'note_en', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'name_ar', 'name_en', 'email', 'phonenumber', NULL, 'whats_phone', NULL, NULL, 'address', NULL, NULL, 'description_text', NULL, NULL, NULL, '2020-05-23 18:10:55', '2020-06-06 15:00:07', '2020-06-06 15:00:07', NULL),
(65, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, 'note_ar', 'note_en', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'name_ar', 'name_en', 'email', 'phonenumber', NULL, 'whats_phone', NULL, NULL, 'address', NULL, NULL, 'description_text', NULL, NULL, NULL, '2020-05-23 18:11:11', '2020-06-06 15:00:54', '2020-06-06 15:00:54', NULL),
(66, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, 'note_ar', 'note_en', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'name_ar', 'name_en', 'email', 'phonenumber', NULL, 'whats_phone', NULL, NULL, 'address', NULL, NULL, 'description_text', NULL, NULL, NULL, '2020-05-23 18:11:14', '2020-06-06 15:02:35', '2020-06-06 15:02:35', NULL),
(67, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, 'note_ar', 'note_en', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'name_ar', 'name_en', 'email', 'phonenumber', NULL, 'whats_phone', NULL, NULL, 'address', NULL, NULL, 'description_text', NULL, NULL, NULL, '2020-05-23 18:11:22', '2020-06-06 15:02:59', '2020-06-06 15:02:59', NULL),
(68, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'قميص ساتان تركي', 'Turkish satin shirt', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-06 11:52:05', '2020-06-06 11:52:05', NULL, NULL),
(69, NULL, NULL, 4, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'قميص رجالي', 'Men\'s T Shirt', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-06 18:28:12', '2020-06-06 18:28:12', NULL, NULL),
(70, NULL, NULL, 4, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'تي شيرت امبوريو ارماني للرجال', 'Emporio Armani Men\'s T Shirt', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-06 23:39:57', '2020-06-06 23:39:57', NULL, NULL),
(71, NULL, NULL, 4, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'تي شيرت امبوريو ارماني للرجال', 'Emporio Armani Men\'s T Shirt', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-06 23:44:16', '2020-06-06 23:44:16', NULL, NULL),
(72, NULL, NULL, 4, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'تي شيرت  للرجال', 'Men\'s T Shirt', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-06 23:46:35', '2020-06-06 23:46:35', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `products_photos`
--

CREATE TABLE `products_photos` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_photo_path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_4_listing` smallint(6) DEFAULT NULL,
  `is_4_detail` smallint(6) DEFAULT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products_photos`
--

INSERT INTO `products_photos` (`id`, `product_photo_path`, `is_4_listing`, `is_4_detail`, `product_id`, `category_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(103, 'images/1590266122.jpg', NULL, NULL, 60, 9, '2020-05-23 18:06:41', '2020-06-06 14:46:22', '2020-06-06 14:46:22'),
(104, 'images/1590266126.jpg', NULL, NULL, 60, 9, '2020-05-23 18:06:41', '2020-06-06 14:46:22', '2020-06-06 14:46:22'),
(105, 'images/1590266136.jpg', NULL, NULL, 60, 12, '2020-05-23 18:06:41', '2020-06-06 14:46:22', '2020-06-06 14:46:22'),
(106, 'images/1590266140.jpg', NULL, NULL, 60, 12, '2020-05-23 18:06:41', '2020-06-06 14:46:22', '2020-06-06 14:46:22'),
(107, 'images/1590266122.jpg', NULL, NULL, 63, 9, '2020-05-23 18:10:35', '2020-06-06 14:53:59', '2020-06-06 14:53:59'),
(108, 'images/1590266126.jpg', NULL, NULL, 63, 9, '2020-05-23 18:10:35', '2020-06-06 14:53:59', '2020-06-06 14:53:59'),
(109, 'images/1590266136.jpg', NULL, NULL, 63, 12, '2020-05-23 18:10:35', '2020-06-06 14:53:59', '2020-06-06 14:53:59'),
(110, 'images/1590266140.jpg', NULL, NULL, 63, 12, '2020-05-23 18:10:35', '2020-06-06 14:53:59', '2020-06-06 14:53:59'),
(111, 'images/1590266122.jpg', NULL, NULL, 64, 9, '2020-05-23 18:10:55', '2020-06-06 15:00:07', '2020-06-06 15:00:07'),
(112, 'images/1590266126.jpg', NULL, NULL, 64, 9, '2020-05-23 18:10:55', '2020-06-06 15:00:07', '2020-06-06 15:00:07'),
(113, 'images/1590266136.jpg', NULL, NULL, 64, 12, '2020-05-23 18:10:55', '2020-06-06 15:00:07', '2020-06-06 15:00:07'),
(114, 'images/1590266140.jpg', NULL, NULL, 64, 12, '2020-05-23 18:10:55', '2020-06-06 15:00:07', '2020-06-06 15:00:07'),
(115, 'images/1590266122.jpg', NULL, NULL, 65, 9, '2020-05-23 18:11:11', '2020-06-06 15:00:54', '2020-06-06 15:00:54'),
(116, 'images/1590266126.jpg', NULL, NULL, 65, 9, '2020-05-23 18:11:11', '2020-06-06 15:00:54', '2020-06-06 15:00:54'),
(117, 'images/1590266136.jpg', NULL, NULL, 65, 12, '2020-05-23 18:11:11', '2020-06-06 15:00:54', '2020-06-06 15:00:54'),
(118, 'images/1590266140.jpg', NULL, NULL, 65, 12, '2020-05-23 18:11:11', '2020-06-06 15:00:54', '2020-06-06 15:00:54'),
(119, 'images/1590266122.jpg', NULL, NULL, 66, 9, '2020-05-23 18:11:14', '2020-06-06 15:02:35', '2020-06-06 15:02:35'),
(120, 'images/1590266126.jpg', NULL, NULL, 66, 9, '2020-05-23 18:11:14', '2020-06-06 15:02:35', '2020-06-06 15:02:35'),
(121, 'images/1590266136.jpg', NULL, NULL, 66, 12, '2020-05-23 18:11:14', '2020-06-06 15:02:35', '2020-06-06 15:02:35'),
(122, 'images/1590266140.jpg', NULL, NULL, 66, 12, '2020-05-23 18:11:14', '2020-06-06 15:02:35', '2020-06-06 15:02:35'),
(123, 'images/1590266122.jpg', NULL, NULL, 67, 9, '2020-05-23 18:11:22', '2020-06-06 15:02:59', '2020-06-06 15:02:59'),
(124, 'images/1590266126.jpg', NULL, NULL, 67, 9, '2020-05-23 18:11:22', '2020-06-06 15:02:59', '2020-06-06 15:02:59'),
(125, 'images/1590266136.jpg', NULL, NULL, 67, 12, '2020-05-23 18:11:22', '2020-06-06 15:02:59', '2020-06-06 15:02:59'),
(126, 'images/1590266140.jpg', NULL, NULL, 67, 12, '2020-05-23 18:11:22', '2020-06-06 15:02:59', '2020-06-06 15:02:59'),
(127, 'images/1591455076.jpeg', NULL, NULL, 68, 67, '2020-06-06 11:52:05', '2020-06-06 11:52:05', NULL),
(128, 'images/1591478681.jpg', NULL, NULL, 69, 15, '2020-06-06 18:28:12', '2020-06-06 18:28:12', NULL),
(129, 'images/1591478684.jpg', NULL, NULL, 69, 15, '2020-06-06 18:28:12', '2020-06-06 18:28:12', NULL),
(130, 'images/1591478687.jpg', NULL, NULL, 69, 15, '2020-06-06 18:28:12', '2020-06-06 18:28:12', NULL),
(131, 'images/1591478691.jpg', NULL, NULL, 69, 15, '2020-06-06 18:28:12', '2020-06-06 18:28:12', NULL),
(132, 'images/1591497249.jpg', NULL, NULL, 70, 15, '2020-06-06 23:39:57', '2020-06-06 23:39:57', NULL),
(133, 'images/1591497284.jpg', NULL, NULL, 70, 72, '2020-06-06 23:39:57', '2020-06-06 23:39:57', NULL),
(134, 'images/1591497314.jpg', NULL, NULL, 70, 12, '2020-06-06 23:39:57', '2020-06-06 23:39:57', NULL),
(135, 'images/1591497333.jpg', NULL, NULL, 70, 67, '2020-06-06 23:39:57', '2020-06-06 23:39:57', NULL),
(136, 'images/1591497670.jpg', NULL, NULL, 71, 67, '2020-06-06 23:44:16', '2020-06-06 23:44:16', NULL),
(137, 'images/1591497674.jpg', NULL, NULL, 71, 67, '2020-06-06 23:44:16', '2020-06-06 23:44:16', NULL),
(138, 'images/1591497691.jpg', NULL, NULL, 71, 72, '2020-06-06 23:44:16', '2020-06-06 23:44:16', NULL),
(139, 'images/1591497706.jpg', NULL, NULL, 71, 15, '2020-06-06 23:44:16', '2020-06-06 23:44:16', NULL),
(140, 'images/1591497717.jpg', NULL, NULL, 71, 15, '2020-06-06 23:44:16', '2020-06-06 23:44:16', NULL),
(141, 'images/1591497907.jpg', NULL, NULL, 72, 72, '2020-06-06 23:46:35', '2020-06-06 23:46:35', NULL),
(142, 'images/1591497910.jpg', NULL, NULL, 72, 72, '2020-06-06 23:46:35', '2020-06-06 23:46:35', NULL),
(143, 'images/1591497913.jpg', NULL, NULL, 72, 72, '2020-06-06 23:46:35', '2020-06-06 23:46:35', NULL),
(144, 'images/1591497919.jpg', NULL, NULL, 72, 72, '2020-06-06 23:46:35', '2020-06-06 23:46:35', NULL),
(145, 'images/1591497925.jpg', NULL, NULL, 72, 72, '2020-06-06 23:46:35', '2020-06-06 23:46:35', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_filter_categories`
--

CREATE TABLE `product_filter_categories` (
  `category_id` int(10) UNSIGNED NOT NULL,
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_filter_categories`
--

INSERT INTO `product_filter_categories` (`category_id`, `id`, `product_id`, `updated_at`, `created_at`) VALUES
(3, 42, 60, '2020-05-23 18:06:41', '2020-05-23 18:06:41'),
(9, 43, 60, '2020-05-23 18:06:41', '2020-05-23 18:06:41'),
(5, 44, 63, '2020-05-23 18:10:35', '2020-05-23 18:10:35'),
(9, 45, 63, '2020-05-23 18:10:35', '2020-05-23 18:10:35'),
(5, 46, 64, '2020-05-23 18:10:55', '2020-05-23 18:10:55'),
(9, 47, 64, '2020-05-23 18:10:55', '2020-05-23 18:10:55'),
(5, 48, 65, '2020-05-23 18:11:11', '2020-05-23 18:11:11'),
(9, 49, 65, '2020-05-23 18:11:11', '2020-05-23 18:11:11'),
(5, 50, 66, '2020-05-23 18:11:14', '2020-05-23 18:11:14'),
(9, 51, 66, '2020-05-23 18:11:14', '2020-05-23 18:11:14'),
(5, 52, 67, '2020-05-23 18:11:22', '2020-05-23 18:11:22'),
(9, 53, 67, '2020-05-23 18:11:22', '2020-05-23 18:11:22'),
(66, 54, 68, '2020-06-06 11:52:05', '2020-06-06 11:52:05'),
(36, 55, 69, '2020-06-06 18:28:12', '2020-06-06 18:28:12'),
(47, 56, 69, '2020-06-06 18:28:12', '2020-06-06 18:28:12'),
(47, 57, 70, '2020-06-06 23:39:57', '2020-06-06 23:39:57'),
(48, 58, 70, '2020-06-06 23:39:57', '2020-06-06 23:39:57'),
(47, 59, 71, '2020-06-06 23:44:16', '2020-06-06 23:44:16'),
(48, 60, 71, '2020-06-06 23:44:16', '2020-06-06 23:44:16'),
(47, 61, 72, '2020-06-06 23:46:35', '2020-06-06 23:46:35'),
(48, 62, 72, '2020-06-06 23:46:35', '2020-06-06 23:46:35');

-- --------------------------------------------------------

--
-- Table structure for table `regions`
--

CREATE TABLE `regions` (
  `id` int(10) UNSIGNED NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_verified_from_us` tinyint(4) NOT NULL,
  `parent_region_id` int(11) DEFAULT NULL,
  `region_name_ar` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `region_name_en` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `region_type_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `regions`
--

INSERT INTO `regions` (`id`, `description`, `is_verified_from_us`, `parent_region_id`, `region_name_ar`, `region_name_en`, `region_type_id`) VALUES
(1, 'sadaxc', 1, 0, 'سوريا', 'Syria', 1);

-- --------------------------------------------------------

--
-- Table structure for table `region_types`
--

CREATE TABLE `region_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `region_type_name_ar` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `region_type_name_en` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_verified_from_us` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `region_types`
--

INSERT INTO `region_types` (`id`, `region_type_name_ar`, `region_type_name_en`, `is_verified_from_us`) VALUES
(1, 'دولة', 'Country', 1);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'main admin', NULL, NULL),
(2, 'employeer', 'employeer', NULL, NULL),
(3, 'user', 'user', NULL, NULL),
(4, 'sub admin', 'sub admin', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`id`, `role_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 3, 7, '2019-10-19 08:59:21', '2019-10-19 08:59:21'),
(2, 1, 26, '2019-10-20 04:01:14', '2019-10-20 04:01:14'),
(3, 3, 27, '2019-10-20 04:03:05', '2019-10-20 04:03:05'),
(4, 1, 28, '2019-10-20 05:00:10', '2019-10-20 05:00:10'),
(5, 1, 29, '2019-11-13 07:08:49', '2019-11-13 07:08:49'),
(6, 1, 30, '2019-11-13 07:09:03', '2019-11-13 07:09:03'),
(7, 1, 31, '2019-11-16 09:48:36', '2019-11-16 09:48:36'),
(8, 1, 32, '2019-11-26 05:36:21', '2019-11-26 05:36:21'),
(9, 1, 33, '2019-12-10 08:37:27', '2019-12-10 08:37:27'),
(10, 3, 34, '2020-06-05 15:26:51', '2020-06-05 15:26:51'),
(11, 3, 35, '2020-06-05 16:05:12', '2020-06-05 16:05:12'),
(12, 3, 36, '2020-06-05 16:10:13', '2020-06-05 16:10:13'),
(13, 3, 37, '2020-06-05 16:11:41', '2020-06-05 16:11:41'),
(14, 3, 38, '2020-06-06 03:47:22', '2020-06-06 03:47:22'),
(15, 3, 39, '2020-06-06 04:02:18', '2020-06-06 04:02:18'),
(16, 3, 40, '2020-06-06 04:02:36', '2020-06-06 04:02:36'),
(17, 3, 41, '2020-06-06 04:02:46', '2020-06-06 04:02:46'),
(18, 3, 42, '2020-06-06 04:03:01', '2020-06-06 04:03:01'),
(19, 3, 43, '2020-06-06 06:02:12', '2020-06-06 06:02:12'),
(20, 3, 44, '2020-06-10 07:36:13', '2020-06-10 07:36:13'),
(21, 3, 45, '2020-06-10 07:38:56', '2020-06-10 07:38:56'),
(22, 3, 46, '2020-06-15 09:23:08', '2020-06-15 09:23:08');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `special_ads`
--

CREATE TABLE `special_ads` (
  `id` int(10) UNSIGNED NOT NULL,
  `priority` int(11) NOT NULL,
  `finish_date` date NOT NULL,
  `paid_price` int(11) NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `ad_category_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stocks`
--

CREATE TABLE `stocks` (
  `address` varchar(191) DEFAULT NULL,
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `stocks`
--

INSERT INTO `stocks` (`address`, `id`, `name`, `created_at`, `updated_at`) VALUES
('بجانب مول ال.. ', 1, 'المستودع المركزي', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `stock_products`
--

CREATE TABLE `stock_products` (
  `id` int(10) UNSIGNED NOT NULL,
  `number_in_stock` int(10) UNSIGNED NOT NULL,
  `number_in_cart` int(11) DEFAULT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `stock_id` int(10) UNSIGNED NOT NULL,
  `is_finished` tinyint(4) DEFAULT NULL,
  `created_at` timestamp(4) NULL DEFAULT NULL,
  `updated_at` timestamp(4) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `stock_products`
--

INSERT INTO `stock_products` (`id`, `number_in_stock`, `number_in_cart`, `product_id`, `stock_id`, `is_finished`, `created_at`, `updated_at`, `deleted_at`) VALUES
(29, 2, NULL, 63, 1, NULL, '2020-05-23 18:10:35.0000', '2020-06-06 14:53:59.0000', '2020-06-06 14:53:59'),
(30, 3, NULL, 63, 1, NULL, '2020-05-23 18:10:35.0000', '2020-06-06 14:53:59.0000', '2020-06-06 14:53:59'),
(31, 2, NULL, 64, 1, NULL, '2020-05-23 18:10:55.0000', '2020-06-06 15:00:07.0000', '2020-06-06 15:00:07'),
(32, 3, NULL, 64, 1, NULL, '2020-05-23 18:10:55.0000', '2020-06-06 15:00:07.0000', '2020-06-06 15:00:07'),
(33, 2, NULL, 65, 1, NULL, '2020-05-23 18:11:11.0000', '2020-06-06 15:00:54.0000', '2020-06-06 15:00:54'),
(34, 3, NULL, 65, 1, NULL, '2020-05-23 18:11:11.0000', '2020-06-06 15:00:54.0000', '2020-06-06 15:00:54'),
(35, 2, NULL, 66, 1, NULL, '2020-05-23 18:11:14.0000', '2020-06-06 15:02:35.0000', '2020-06-06 15:02:35'),
(36, 3, NULL, 66, 1, NULL, '2020-05-23 18:11:14.0000', '2020-06-06 15:02:35.0000', '2020-06-06 15:02:35'),
(37, 2, NULL, 67, 1, NULL, '2020-05-23 18:11:22.0000', '2020-06-06 15:02:59.0000', '2020-06-06 15:02:59'),
(38, 3, NULL, 67, 1, NULL, '2020-05-23 18:11:22.0000', '2020-06-06 15:02:59.0000', '2020-06-06 15:02:59'),
(39, 2, NULL, 68, 1, NULL, '2020-06-06 11:52:05.0000', '2020-06-06 11:52:05.0000', NULL),
(40, 2, NULL, 68, 1, NULL, '2020-06-06 11:52:05.0000', '2020-06-06 11:52:05.0000', NULL),
(41, 2, NULL, 68, 1, NULL, '2020-06-06 11:52:05.0000', '2020-06-06 11:52:05.0000', NULL),
(42, 2, 2, 69, 1, NULL, '2020-06-06 18:28:12.0000', '2020-06-13 17:13:30.0000', NULL),
(43, 2, 2, 69, 1, NULL, '2020-06-06 18:28:12.0000', '2020-06-13 17:13:44.0000', NULL),
(44, 2, 2, 69, 1, NULL, '2020-06-06 18:28:12.0000', '2020-06-13 17:13:47.0000', NULL),
(45, 2, NULL, 70, 1, NULL, '2020-06-06 23:39:57.0000', '2020-06-06 23:39:57.0000', NULL),
(46, 2, NULL, 70, 1, NULL, '2020-06-06 23:39:57.0000', '2020-06-06 23:39:57.0000', NULL),
(47, 2, NULL, 70, 1, NULL, '2020-06-06 23:39:57.0000', '2020-06-06 23:39:57.0000', NULL),
(48, 2, NULL, 70, 1, NULL, '2020-06-06 23:39:57.0000', '2020-06-06 23:39:57.0000', NULL),
(49, 2, NULL, 70, 1, NULL, '2020-06-06 23:39:57.0000', '2020-06-06 23:39:57.0000', NULL),
(50, 0, NULL, 70, 1, NULL, '2020-06-06 23:39:57.0000', '2020-06-06 23:39:57.0000', NULL),
(51, 2, NULL, 70, 1, NULL, '2020-06-06 23:39:57.0000', '2020-06-06 23:39:57.0000', NULL),
(52, 2, NULL, 70, 1, NULL, '2020-06-06 23:39:57.0000', '2020-06-06 23:39:57.0000', NULL),
(53, 2, NULL, 70, 1, NULL, '2020-06-06 23:39:57.0000', '2020-06-06 23:39:57.0000', NULL),
(54, 0, NULL, 70, 1, NULL, '2020-06-06 23:39:57.0000', '2020-06-06 23:39:57.0000', NULL),
(55, 2, 2, 70, 1, NULL, '2020-06-06 23:39:57.0000', '2020-06-14 08:01:57.0000', NULL),
(56, 0, NULL, 70, 1, NULL, '2020-06-06 23:39:57.0000', '2020-06-06 23:39:57.0000', NULL),
(57, 2, NULL, 71, 1, NULL, '2020-06-06 23:44:16.0000', '2020-06-06 23:44:16.0000', NULL),
(58, 2, NULL, 71, 1, NULL, '2020-06-06 23:44:16.0000', '2020-06-06 23:44:16.0000', NULL),
(59, 2, 2, 71, 1, NULL, '2020-06-06 23:44:16.0000', '2020-06-14 04:29:28.0000', NULL),
(60, 2, NULL, 71, 1, NULL, '2020-06-06 23:44:16.0000', '2020-06-06 23:44:16.0000', NULL),
(61, 2, NULL, 71, 1, NULL, '2020-06-06 23:44:16.0000', '2020-06-06 23:44:16.0000', NULL),
(62, 2, NULL, 71, 1, NULL, '2020-06-06 23:44:16.0000', '2020-06-06 23:44:16.0000', NULL),
(63, 2, NULL, 71, 1, NULL, '2020-06-06 23:44:16.0000', '2020-06-06 23:44:16.0000', NULL),
(64, 2, NULL, 71, 1, NULL, '2020-06-06 23:44:16.0000', '2020-06-06 23:44:16.0000', NULL),
(65, 2, NULL, 71, 1, NULL, '2020-06-06 23:44:16.0000', '2020-06-06 23:44:16.0000', NULL),
(66, 2, 2, 72, 1, NULL, '2020-06-06 23:46:35.0000', '2020-06-14 04:43:19.0000', NULL),
(67, 2, 1, 72, 1, NULL, '2020-06-06 23:46:35.0000', '2020-06-14 10:01:26.0000', NULL),
(68, 2, NULL, 72, 1, NULL, '2020-06-06 23:46:35.0000', '2020-06-06 23:46:35.0000', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `stock_product_categories`
--

CREATE TABLE `stock_product_categories` (
  `category_id` int(10) UNSIGNED NOT NULL,
  `id` int(10) UNSIGNED NOT NULL,
  `stock_product_id` int(10) UNSIGNED NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `stock_product_categories`
--

INSERT INTO `stock_product_categories` (`category_id`, `id`, `stock_product_id`, `updated_at`, `created_at`) VALUES
(3, 33, 29, '2020-05-23 18:10:35', '2020-05-23 18:10:35'),
(12, 34, 29, '2020-05-23 18:10:35', '2020-05-23 18:10:35'),
(9, 35, 30, '2020-05-23 18:10:35', '2020-05-23 18:10:35'),
(4, 36, 30, '2020-05-23 18:10:35', '2020-05-23 18:10:35'),
(3, 37, 31, '2020-05-23 18:10:55', '2020-05-23 18:10:55'),
(12, 38, 31, '2020-05-23 18:10:55', '2020-05-23 18:10:55'),
(9, 39, 32, '2020-05-23 18:10:55', '2020-05-23 18:10:55'),
(4, 40, 32, '2020-05-23 18:10:55', '2020-05-23 18:10:55'),
(3, 41, 33, '2020-05-23 18:11:11', '2020-05-23 18:11:11'),
(12, 42, 33, '2020-05-23 18:11:11', '2020-05-23 18:11:11'),
(9, 43, 34, '2020-05-23 18:11:11', '2020-05-23 18:11:11'),
(4, 44, 34, '2020-05-23 18:11:11', '2020-05-23 18:11:11'),
(3, 45, 35, '2020-05-23 18:11:14', '2020-05-23 18:11:14'),
(12, 46, 35, '2020-05-23 18:11:14', '2020-05-23 18:11:14'),
(9, 47, 36, '2020-05-23 18:11:14', '2020-05-23 18:11:14'),
(4, 48, 36, '2020-05-23 18:11:14', '2020-05-23 18:11:14'),
(3, 49, 37, '2020-05-23 18:11:22', '2020-05-23 18:11:22'),
(12, 50, 37, '2020-05-23 18:11:22', '2020-05-23 18:11:22'),
(9, 51, 38, '2020-05-23 18:11:22', '2020-05-23 18:11:22'),
(4, 52, 38, '2020-05-23 18:11:22', '2020-05-23 18:11:22'),
(68, 53, 39, '2020-06-06 11:52:05', '2020-06-06 11:52:05'),
(67, 54, 39, '2020-06-06 11:52:05', '2020-06-06 11:52:05'),
(70, 55, 40, '2020-06-06 11:52:05', '2020-06-06 11:52:05'),
(67, 56, 40, '2020-06-06 11:52:05', '2020-06-06 11:52:05'),
(71, 57, 41, '2020-06-06 11:52:05', '2020-06-06 11:52:05'),
(67, 58, 41, '2020-06-06 11:52:05', '2020-06-06 11:52:05'),
(70, 59, 42, '2020-06-06 18:28:12', '2020-06-06 18:28:12'),
(15, 60, 42, '2020-06-06 18:28:12', '2020-06-06 18:28:12'),
(15, 61, 43, '2020-06-06 18:28:12', '2020-06-06 18:28:12'),
(71, 62, 43, '2020-06-06 18:28:12', '2020-06-06 18:28:12'),
(68, 63, 44, '2020-06-06 18:28:12', '2020-06-06 18:28:12'),
(15, 64, 44, '2020-06-06 18:28:12', '2020-06-06 18:28:12'),
(72, 65, 45, '2020-06-06 23:39:57', '2020-06-06 23:39:57'),
(68, 66, 45, '2020-06-06 23:39:57', '2020-06-06 23:39:57'),
(70, 67, 46, '2020-06-06 23:39:57', '2020-06-06 23:39:57'),
(72, 68, 46, '2020-06-06 23:39:57', '2020-06-06 23:39:57'),
(71, 69, 47, '2020-06-06 23:39:57', '2020-06-06 23:39:57'),
(72, 70, 47, '2020-06-06 23:39:57', '2020-06-06 23:39:57'),
(68, 71, 48, '2020-06-06 23:39:57', '2020-06-06 23:39:57'),
(67, 72, 48, '2020-06-06 23:39:57', '2020-06-06 23:39:57'),
(70, 73, 49, '2020-06-06 23:39:57', '2020-06-06 23:39:57'),
(67, 74, 49, '2020-06-06 23:39:57', '2020-06-06 23:39:57'),
(71, 75, 50, '2020-06-06 23:39:57', '2020-06-06 23:39:57'),
(67, 76, 50, '2020-06-06 23:39:57', '2020-06-06 23:39:57'),
(68, 77, 51, '2020-06-06 23:39:57', '2020-06-06 23:39:57'),
(15, 78, 51, '2020-06-06 23:39:57', '2020-06-06 23:39:57'),
(70, 79, 52, '2020-06-06 23:39:57', '2020-06-06 23:39:57'),
(15, 80, 52, '2020-06-06 23:39:57', '2020-06-06 23:39:57'),
(71, 81, 53, '2020-06-06 23:39:57', '2020-06-06 23:39:57'),
(15, 82, 53, '2020-06-06 23:39:57', '2020-06-06 23:39:57'),
(12, 83, 54, '2020-06-06 23:39:57', '2020-06-06 23:39:57'),
(68, 84, 54, '2020-06-06 23:39:57', '2020-06-06 23:39:57'),
(70, 85, 55, '2020-06-06 23:39:57', '2020-06-06 23:39:57'),
(12, 86, 55, '2020-06-06 23:39:57', '2020-06-06 23:39:57'),
(71, 87, 56, '2020-06-06 23:39:57', '2020-06-06 23:39:57'),
(12, 88, 56, '2020-06-06 23:39:57', '2020-06-06 23:39:57'),
(15, 89, 57, '2020-06-06 23:44:16', '2020-06-06 23:44:16'),
(68, 90, 57, '2020-06-06 23:44:16', '2020-06-06 23:44:16'),
(70, 91, 58, '2020-06-06 23:44:16', '2020-06-06 23:44:16'),
(15, 92, 58, '2020-06-06 23:44:16', '2020-06-06 23:44:16'),
(71, 93, 59, '2020-06-06 23:44:16', '2020-06-06 23:44:16'),
(15, 94, 59, '2020-06-06 23:44:16', '2020-06-06 23:44:16'),
(72, 95, 60, '2020-06-06 23:44:16', '2020-06-06 23:44:16'),
(71, 96, 60, '2020-06-06 23:44:16', '2020-06-06 23:44:16'),
(70, 97, 61, '2020-06-06 23:44:16', '2020-06-06 23:44:16'),
(72, 98, 61, '2020-06-06 23:44:16', '2020-06-06 23:44:16'),
(68, 99, 62, '2020-06-06 23:44:16', '2020-06-06 23:44:16'),
(72, 100, 62, '2020-06-06 23:44:16', '2020-06-06 23:44:16'),
(67, 101, 63, '2020-06-06 23:44:16', '2020-06-06 23:44:16'),
(68, 102, 63, '2020-06-06 23:44:16', '2020-06-06 23:44:16'),
(67, 103, 64, '2020-06-06 23:44:16', '2020-06-06 23:44:16'),
(70, 104, 64, '2020-06-06 23:44:16', '2020-06-06 23:44:16'),
(67, 105, 65, '2020-06-06 23:44:16', '2020-06-06 23:44:16'),
(71, 106, 65, '2020-06-06 23:44:16', '2020-06-06 23:44:16'),
(72, 107, 66, '2020-06-06 23:46:35', '2020-06-06 23:46:35'),
(68, 108, 66, '2020-06-06 23:46:35', '2020-06-06 23:46:35'),
(72, 109, 67, '2020-06-06 23:46:35', '2020-06-06 23:46:35'),
(70, 110, 67, '2020-06-06 23:46:35', '2020-06-06 23:46:35'),
(72, 111, 68, '2020-06-06 23:46:35', '2020-06-06 23:46:35'),
(71, 112, 68, '2020-06-06 23:46:35', '2020-06-06 23:46:35');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `provider_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `verified` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `verification_token` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `surname` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthdate` timestamp NULL DEFAULT NULL,
  `gender` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `provider_name`, `provider_id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `verified`, `verification_token`, `created_at`, `updated_at`, `avatar`, `mobile_phone`, `surname`, `birthdate`, `gender`, `address`) VALUES
(1, NULL, NULL, 'ahmad', '11111@gg.com', NULL, '$2y$10$IOQ36X88oxMY04KXe85OguOGFozj9oiq0zS3PJmH2jn.6ZrX5V2DW', NULL, '0', NULL, '2019-10-11 15:53:00', '2019-10-11 15:53:00', NULL, NULL, NULL, NULL, NULL, NULL),
(2, NULL, NULL, 'yaser', 'yaser@yaser.yas', NULL, '$2y$10$P.7usJoHgjHMMrNjZukga.QuE0u5y9.S9uIvNCrR0Z5fFBuq2EOwS', NULL, '0', NULL, '2019-10-15 15:52:31', '2019-10-15 15:52:31', NULL, NULL, NULL, NULL, NULL, NULL),
(3, NULL, NULL, 'yaser1', 'yase1r@yaser.yas', NULL, '$2y$10$iL5GusS9DkWgeLpZpSrUwuTrf6aPR8zCli6ey1AmZ2rVuzvh1boxm', NULL, '0', NULL, '2019-10-17 06:40:27', '2019-10-17 06:40:27', NULL, NULL, NULL, NULL, NULL, NULL),
(4, NULL, NULL, 'yaser', 'yaser@ee.com', NULL, '$2y$10$6VCI1LB9.3G4VEo3xS3gP.Lj6t5qgq3AjUs4HDfOpJHk2mwPPDySW', NULL, '0', NULL, '2019-10-19 05:37:35', '2019-10-19 05:37:35', NULL, NULL, NULL, NULL, NULL, NULL),
(6, NULL, NULL, 'yaser1', 'yaser1@ee.com', NULL, '$2y$10$7Gdt2fxDsDJ8hFqwaECabOVqQTaXrMCtXCh9a2CftttbgMHWHwwoi', NULL, '0', NULL, '2019-10-19 08:52:06', '2019-10-19 08:52:06', NULL, NULL, NULL, NULL, NULL, NULL),
(7, NULL, NULL, 'yaser13', 'yaser31@ee.com', NULL, '$2y$10$.7e7ba/Mb3p150mKAhuvLeTtKT3R.FEiOZ7cBm.fAomHBCLV1Zm7m', NULL, '0', NULL, '2019-10-19 08:59:21', '2019-10-19 08:59:21', NULL, NULL, NULL, NULL, NULL, NULL),
(8, NULL, NULL, 'yaseradmin', 'yaseradmin@ee.com', NULL, '$2y$10$drlJu1IFIIGqKTbmQJtryePT6sXjVR7iMOObaL0oXTcYBJ0UB2ote', NULL, '0', NULL, '2019-10-20 03:46:56', '2019-10-20 03:46:56', NULL, NULL, NULL, NULL, NULL, NULL),
(16, NULL, NULL, 'yaseradmin1', 'yaseradmin1@ee.com', NULL, '$2y$10$gf0GskTnptNlo09Hyf6cN.2Pi2p9isV54GBxeo3NDoOBgPzASf23S', NULL, '0', NULL, '2019-10-20 03:53:11', '2019-10-20 03:53:11', NULL, NULL, NULL, NULL, NULL, NULL),
(17, NULL, NULL, 'yaseradmin1', 'yaseradmin11@ee.com', NULL, '$2y$10$vb1GIY6KY/IAuvZ/55yLoODFX5WTLvZ5BE.QHsGpkyxs9T9H5xAye', NULL, '0', NULL, '2019-10-20 03:53:29', '2019-10-20 03:53:29', NULL, NULL, NULL, NULL, NULL, NULL),
(18, NULL, NULL, 'yaseradmin1', 'yaseradmin121@ee.com', NULL, '$2y$10$nesJEnIB1Rm5Vwjl2JkE/uALKXeNS8NJqmAtDvcgv9MVcpQ6p7cBO', NULL, '0', NULL, '2019-10-20 03:54:38', '2019-10-20 03:54:38', NULL, NULL, NULL, NULL, NULL, NULL),
(19, NULL, NULL, 'yaseradmin1', 'yaseradmin2121@ee.com', NULL, '$2y$10$EbcdrqS2V..O136baA4mh.IXPaNPcwURw.UyNinZ50FS3h463pXYe', NULL, '0', NULL, '2019-10-20 03:55:01', '2019-10-20 03:55:01', NULL, NULL, NULL, NULL, NULL, NULL),
(20, NULL, NULL, 'yaseradmin1', 'yaseradminw2121@ee.com', NULL, '$2y$10$jQg9xTR4IvHJvwBNFifWueVuKUa2IPzivf0mJn325dVNPBPxZv7tm', NULL, '0', NULL, '2019-10-20 03:55:32', '2019-10-20 03:55:32', NULL, NULL, NULL, NULL, NULL, NULL),
(21, NULL, NULL, 'yaseradmin1', 'yaseradmindw2121@ee.com', NULL, '$2y$10$O.X.WGjem9rL6fdbxLXBHuQk5Ct1KxiNpUPTWLHAJGZZnTHOdEyUK', NULL, '0', NULL, '2019-10-20 03:55:48', '2019-10-20 03:55:48', NULL, NULL, NULL, NULL, NULL, NULL),
(22, NULL, NULL, 'yaseradmin1', 'yaseradmiendw2121@ee.com', NULL, '$2y$10$nKzb9ZBENUQY5GQjVQeO9efG4dh.4gi69e.bFiXBSDYLIc8VY1G.W', NULL, '0', NULL, '2019-10-20 03:57:21', '2019-10-20 03:57:21', NULL, NULL, NULL, NULL, NULL, NULL),
(23, NULL, NULL, 'yaseradmin1', 'yaseradmidendw2121@ee.com', NULL, '$2y$10$A3R7pdrxmlJpBSt6vYmr7ueqixwrVeQcLWdocw7VUDtscdteFL0w.', NULL, '0', NULL, '2019-10-20 03:58:38', '2019-10-20 03:58:38', NULL, NULL, NULL, NULL, NULL, NULL),
(24, NULL, NULL, 'yaseradmin1', 'yaseraddmidendw2121@ee.com', NULL, '$2y$10$LsSK0F9rBiKqXFIy7qf02ee/vLj8wxWlAA4uA7g7f/tuDsRMruZRS', NULL, '0', NULL, '2019-10-20 03:59:18', '2019-10-20 03:59:18', NULL, NULL, NULL, NULL, NULL, NULL),
(25, NULL, NULL, 'yaseradmin1', 'yasedraddmidendw2121@ee.com', NULL, '$2y$10$dOpnwT2UFXNHq4aiiCiRv.dDP.JR9Dhk8gdwgbodt9/c5eUTbt7tO', NULL, '0', NULL, '2019-10-20 04:00:27', '2019-10-20 04:00:27', NULL, NULL, NULL, NULL, NULL, NULL),
(26, NULL, NULL, 'yaseradmin1', 'yasedradddmidendw2121@ee.com', NULL, '$2y$10$8VB1aMALUZv1iwaUp9xubepNv7mD70O1h2u.BU/3BzYjm5b.w5G6W', NULL, '0', NULL, '2019-10-20 04:01:13', '2019-10-20 04:01:13', NULL, NULL, NULL, NULL, NULL, NULL),
(27, NULL, NULL, 'yaseradmin1', 'yasesdradddmidendw2121@ee.com', NULL, '$2y$10$FPwwCm5m.kV59K.2NHU31ewlkFQ7vfAACzIyMwfH1VVjU.3UkariK', NULL, '0', NULL, '2019-10-20 04:03:05', '2019-10-20 04:03:05', NULL, NULL, NULL, NULL, NULL, NULL),
(28, NULL, NULL, 'yaseradmin1', 'yaser_admin@ee.com', NULL, '$2y$10$.LE8vVvtsEQvY8vUi4ithuHIwme/ywjJMXD69AThD8jIM2kizojC6', NULL, '0', NULL, '2019-10-20 05:00:09', '2019-10-20 05:00:09', NULL, NULL, NULL, NULL, NULL, NULL),
(29, NULL, NULL, 'yaser111', 'yaser111@yaser.yas', NULL, '$2y$10$zIe/Uhn.0IzggWAbaKx7L.m2CSKfHAqXJ5Og5lxMZhLr.JFzlj/be', NULL, '0', NULL, '2019-11-13 07:08:49', '2019-11-13 07:08:49', NULL, NULL, NULL, NULL, NULL, NULL),
(30, NULL, NULL, 'yaser111', 'yaser11551@yaser.yas', NULL, '$2y$10$5AhIOXtc0DNjHBHc3xp4tevTuckunXRQWktMC3dAfXtngiTPHObZS', NULL, '0', NULL, '2019-11-13 07:09:03', '2019-11-13 07:09:03', NULL, NULL, NULL, NULL, NULL, NULL),
(31, NULL, NULL, 'y454', '444rr@gmail.com', NULL, '$2y$10$au5.QZh/EHC.xGxbXdnAbOc7cfvlU1Y05y5igOd/tNKNMubKw3SbG', NULL, '0', NULL, '2019-11-16 09:48:35', '2019-11-16 09:48:35', NULL, NULL, NULL, NULL, NULL, NULL),
(32, NULL, NULL, 'yaser', 'omran@ff.com', NULL, '$2y$10$x7vYUDEKCOkbvldxO1em0OJW9ByGmI9m92pDZO5lgqTSQnb1qhPZi', NULL, '0', NULL, '2019-11-26 05:36:21', '2019-11-26 05:36:21', NULL, NULL, NULL, NULL, NULL, NULL),
(33, NULL, NULL, 'yasss', 'ahmad12345@eee.com', NULL, '$2y$10$Z5Gts2u2OiPb2zp9TXlc1ek.0n0mi/Nc616jBniU2xRQQiY09TLPG', NULL, '0', NULL, '2019-12-10 08:37:27', '2019-12-10 08:37:27', NULL, NULL, NULL, NULL, NULL, NULL),
(34, NULL, NULL, 'yaser', '1dss23dwswds4d56@rrr.com', NULL, '$2y$10$cypURfZPc8WQ6oRXOT90UuPgSW15o5SI.OSuAX2AT.oQW5O9ukJ8W', NULL, '0', NULL, '2020-06-05 15:26:51', '2020-06-05 15:26:51', NULL, '23232323', NULL, '2020-06-03 21:00:00', 'man', NULL),
(35, NULL, NULL, 'dfdf yaser omran', 'engineeryadddseromeeran@gmail.com', NULL, '$2y$10$aZklhTclrKzEb2zztTQf9O9m7HOLLTY5sExS5NK0hyqLFkuAsF49S', NULL, '0', NULL, '2020-06-05 16:05:12', '2020-06-05 16:05:12', NULL, '2232323', 'yaser omran', '2020-06-03 21:00:00', 'male', NULL),
(36, NULL, NULL, 'dfdf yaser omran', 'engineeryaserofffmeeran@gmail.com', NULL, '$2y$10$IKU8ZQUtWx1DoNSBF.242OFTuJTa2PTvenjNEQBDOHxScOY1DsePS', NULL, '0', NULL, '2020-06-05 16:10:13', '2020-06-05 16:10:13', NULL, '343434', 'yaser omran', '2020-06-03 21:00:00', 'male', NULL),
(37, NULL, NULL, 'yaser', 'engineeryaseromeera333n@gmail.com', NULL, '$2y$10$Ai9QTNvcZYwYGy2AeHfyTeo4C4VZudpxPe3tH5fJ.xIS50RUJUGVe', NULL, '0', NULL, '2020-06-05 16:11:41', '2020-06-06 03:46:12', NULL, '34343434', 'omran', '2020-06-03 21:00:00', 'male', 'aleppo'),
(38, NULL, NULL, 'yaser', 'e1ngineeryaseromeeran123456@gmail.co', NULL, '$2y$10$kpRNeNHgGcIPhiqYa9lgd.BZxkvZ/3sF4LFZB10zDABFuaY/Rbyoi', NULL, '0', NULL, '2020-06-06 03:47:22', '2020-06-06 03:47:31', NULL, '2342323', 'omran', '2020-06-03 21:00:00', 'male', 'aleppo'),
(39, NULL, NULL, 'dfdf yaser omran', 'engineeryeeaserom2222ran@gmail.com', NULL, '$2y$10$Zyix.L1JxE3n1LrHcbryvOVA6d4Pr6d/alsk5kFH3yCippyK1Q/q6', NULL, '0', NULL, '2020-06-06 04:02:18', '2020-06-06 04:02:18', NULL, '343431111', 'yaser omran', '2020-06-03 21:00:00', 'male', NULL),
(40, NULL, NULL, 'dfdf yaser omran', 'engineeryeeaddserom2222ran@gmail.com', NULL, '$2y$10$zpdRB0SSAjgURCl5LEWdpOeG3TNaLC7VBwEpfFif.BrDHdVK6PWlK', NULL, '0', NULL, '2020-06-06 04:02:36', '2020-06-06 04:02:36', NULL, '343431111', 'yaser omran', '2020-06-03 21:00:00', 'male', NULL),
(41, NULL, NULL, 'dfdf yaser omran', 'enginseeryeeaddserom2222ran@gmail.com', NULL, '$2y$10$U2ZbWqgrMR0d5VAaYWrn9uc/QFeUQts0kOGlATPqPk/Onf7kwcHwu', NULL, '0', NULL, '2020-06-06 04:02:46', '2020-06-06 04:02:46', NULL, '343431111', 'yaser omran', '2020-06-03 21:00:00', 'male', NULL),
(42, NULL, NULL, 'dfdf yaser omran', 'engineeryaseromeeran@gmail.com', NULL, '$2y$10$6g7VRx79LibZIWxhix7/RO8Ec7D3Qmz6F4FIt7Gp4WdHInrWQP9qG', NULL, '0', NULL, '2020-06-06 04:03:01', '2020-06-06 04:03:01', NULL, '3434343', 'yaser omran', '2020-06-03 21:00:00', 'male', NULL),
(43, NULL, NULL, 'yaser', '12ss23dwswds4d56@rrr.com', NULL, '$2y$10$gvL59sekBQ02QsHUs1whB.Ovu/CxQrM2lx/huYlClHwOYyZDHasYm', NULL, '0', NULL, '2020-06-06 06:02:12', '2020-06-06 06:15:32', NULL, '23232323', 'omran', '2020-06-03 21:00:00', 'male', 'Al hamadania'),
(44, NULL, NULL, 'dfdf yaser omran', 'engineeryaseromeeran111111@gmail.com', NULL, '$2y$10$qfOcYgCvOCCdVyUKqUPaZOYkJhAjMeO/KQFFaG.c6ZjfV1UWbb27C', NULL, '0', NULL, '2020-06-10 07:36:13', '2020-06-10 07:36:13', NULL, '4343434', 'yaser omran', '2020-06-03 21:00:00', 'male', NULL),
(45, NULL, NULL, 'dfdf yaser omran', 'e111111@gmail.com', NULL, '$2y$10$g5TxQPPgBAnCCdA0ZbBTtemPGD/BfK2yofhMBNXCfDTcQE1k/jxTy', NULL, '0', NULL, '2020-06-10 07:38:55', '2020-06-10 07:38:55', NULL, '232323', 'yaser omran', '2020-06-03 21:00:00', 'male', NULL),
(46, NULL, NULL, 'dfdf yaser omran', 'engineeryaseromeeran1234@gmail.com', NULL, '$2y$10$Mn7KIke1aicXpCHlJZnjAenrByZzXH0.IPNO3p7NuqgUf4zSRJsWm', NULL, '0', NULL, '2020-06-15 09:23:08', '2020-06-15 09:23:08', NULL, '23423232323', 'yaser omran', '2020-06-03 21:00:00', 'male', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users_rating_details`
--

CREATE TABLE `users_rating_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `rated_user_id` int(10) UNSIGNED NOT NULL,
  `rating_user_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_types`
--

CREATE TABLE `user_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_type_name_ar` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_type_name_en` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `leads_limit_number` int(11) NOT NULL,
  `vehicle_limit_number` int(11) NOT NULL,
  `is_receives_web_and_app_notifications` smallint(6) NOT NULL,
  `is_receives_regular_email_leads` smallint(6) NOT NULL,
  `is_advertise_on_top_advertising_panel` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ads_category_for_area_ads`
--
ALTER TABLE `ads_category_for_area_ads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ads_category_for_area_ads_ad_category_id_foreign` (`ad_category_id`),
  ADD KEY `ads_category_for_area_ads_area_ad_id_foreign` (`area_ad_id`);

--
-- Indexes for table `ad_categories`
--
ALTER TABLE `ad_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ad_categories_ad_category_name_en_unique` (`ad_category_name_en`),
  ADD UNIQUE KEY `ad_categories_ad_category_name_ar_unique` (`ad_category_name_ar`);

--
-- Indexes for table `area_ads`
--
ALTER TABLE `area_ads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_order2_id` (`order_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_2_category`
--
ALTER TABLE `category_2_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_2_category_parent_id_foreign` (`parent_id`),
  ADD KEY `category_2_category_son_id_foreign` (`son_id`);

--
-- Indexes for table `category_region`
--
ALTER TABLE `category_region`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_region_category_id_foreign` (`category_id`),
  ADD KEY `category_region_region_id_foreign` (`region_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `favorite_ads`
--
ALTER TABLE `favorite_ads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `favorite_ads_product_id_foreign1` (`product_id`),
  ADD KEY `favorite_ads_user_id_foreign11` (`user_id`);

--
-- Indexes for table `latlong_regions`
--
ALTER TABLE `latlong_regions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `latlong_regions_region_id_foreign` (`region_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_user_id_foreign` (`user_id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `previewd_products`
--
ALTER TABLE `previewd_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `previewds_product_id_foreign` (`product_id`),
  ADD KEY `previewds_user_id_foreign` (`user_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_region_id_foreign` (`region_id`),
  ADD KEY `products_ad_category_id_foreign` (`ad_category_id`),
  ADD KEY `products_user_id_foreign` (`user_id`);

--
-- Indexes for table `products_photos`
--
ALTER TABLE `products_photos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_photos_product_id_foreign` (`product_id`),
  ADD KEY `products_photos_category_id_foreign` (`category_id`);

--
-- Indexes for table `product_filter_categories`
--
ALTER TABLE `product_filter_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_filter_category_product_id_foreign` (`product_id`),
  ADD KEY `product_filter_category_category_id_foreign` (`category_id`);

--
-- Indexes for table `regions`
--
ALTER TABLE `regions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `regions_region_type_id_foreign` (`region_type_id`);

--
-- Indexes for table `region_types`
--
ALTER TABLE `region_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_user_user_id_foreign` (`user_id`),
  ADD KEY `role_user_role_id_foreign` (`role_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD UNIQUE KEY `sessions_id_unique` (`id`);

--
-- Indexes for table `special_ads`
--
ALTER TABLE `special_ads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `special_ads_product_id_foreign` (`product_id`),
  ADD KEY `special_ads_ad_category_id_foreign` (`ad_category_id`);

--
-- Indexes for table `stocks`
--
ALTER TABLE `stocks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stock_products`
--
ALTER TABLE `stock_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stock_products_product_id_foreign` (`product_id`),
  ADD KEY `stock_products_stock_id_foreign` (`stock_id`);

--
-- Indexes for table `stock_product_categories`
--
ALTER TABLE `stock_product_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stock_products_stock_product_id_foreign` (`stock_product_id`),
  ADD KEY `stock_product_categories_categories_categoriy_id_foreign` (`category_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `users_rating_details`
--
ALTER TABLE `users_rating_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_rating_details_rated_user_id_foreign` (`rated_user_id`),
  ADD KEY `users_rating_details_rating_user_id_foreign` (`rating_user_id`);

--
-- Indexes for table `user_types`
--
ALTER TABLE `user_types`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ads_category_for_area_ads`
--
ALTER TABLE `ads_category_for_area_ads`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ad_categories`
--
ALTER TABLE `ad_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `area_ads`
--
ALTER TABLE `area_ads`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `category_2_category`
--
ALTER TABLE `category_2_category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT for table `category_region`
--
ALTER TABLE `category_region`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `favorite_ads`
--
ALTER TABLE `favorite_ads`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `latlong_regions`
--
ALTER TABLE `latlong_regions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=184;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `previewd_products`
--
ALTER TABLE `previewd_products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `products_photos`
--
ALTER TABLE `products_photos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=146;

--
-- AUTO_INCREMENT for table `product_filter_categories`
--
ALTER TABLE `product_filter_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `regions`
--
ALTER TABLE `regions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `region_types`
--
ALTER TABLE `region_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `role_user`
--
ALTER TABLE `role_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `special_ads`
--
ALTER TABLE `special_ads`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stocks`
--
ALTER TABLE `stocks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `stock_products`
--
ALTER TABLE `stock_products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `stock_product_categories`
--
ALTER TABLE `stock_product_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `users_rating_details`
--
ALTER TABLE `users_rating_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_types`
--
ALTER TABLE `user_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ads_category_for_area_ads`
--
ALTER TABLE `ads_category_for_area_ads`
  ADD CONSTRAINT `ads_category_for_area_ads_ad_category_id_foreign` FOREIGN KEY (`ad_category_id`) REFERENCES `ad_categories` (`id`),
  ADD CONSTRAINT `ads_category_for_area_ads_area_ad_id_foreign` FOREIGN KEY (`area_ad_id`) REFERENCES `area_ads` (`id`);

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_order2_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Constraints for table `category_2_category`
--
ALTER TABLE `category_2_category`
  ADD CONSTRAINT `category_2_category_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `category_2_category_son_id_foreign` FOREIGN KEY (`son_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `category_region`
--
ALTER TABLE `category_region`
  ADD CONSTRAINT `category_region_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `category_region_region_id_foreign` FOREIGN KEY (`region_id`) REFERENCES `regions` (`id`);

--
-- Constraints for table `latlong_regions`
--
ALTER TABLE `latlong_regions`
  ADD CONSTRAINT `latlong_regions_region_id_foreign` FOREIGN KEY (`region_id`) REFERENCES `regions` (`id`);

--
-- Constraints for table `products_photos`
--
ALTER TABLE `products_photos`
  ADD CONSTRAINT `products_photos_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_photos_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `product_filter_categories`
--
ALTER TABLE `product_filter_categories`
  ADD CONSTRAINT `product_filter_category_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `product_filter_category_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `regions`
--
ALTER TABLE `regions`
  ADD CONSTRAINT `regions_region_type_id_foreign` FOREIGN KEY (`region_type_id`) REFERENCES `region_types` (`id`);

--
-- Constraints for table `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `special_ads`
--
ALTER TABLE `special_ads`
  ADD CONSTRAINT `special_ads_ad_category_id_foreign` FOREIGN KEY (`ad_category_id`) REFERENCES `ad_categories` (`id`),
  ADD CONSTRAINT `special_ads_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `stock_products`
--
ALTER TABLE `stock_products`
  ADD CONSTRAINT `stock_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `stock_products_stock_id_foreign` FOREIGN KEY (`stock_id`) REFERENCES `stocks` (`id`);

--
-- Constraints for table `stock_product_categories`
--
ALTER TABLE `stock_product_categories`
  ADD CONSTRAINT `stock_product_categories_categories_categoriy_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `stock_products_stock_product_id_foreign` FOREIGN KEY (`stock_product_id`) REFERENCES `stock_products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
