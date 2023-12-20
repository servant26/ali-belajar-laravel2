-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 20, 2023 at 10:02 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel_msib`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(48, '2014_10_12_000000_create_users_table', 1),
(49, '2014_10_12_100000_create_password_resets_table', 1),
(50, '2019_08_19_000000_create_failed_jobs_table', 1),
(51, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(52, '2023_11_14_182058_create_product_categories_table', 1),
(53, '2023_11_14_182131_create_products_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pengguna`
--

CREATE TABLE `pengguna` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(64) DEFAULT NULL,
  `last_login_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `group_id` int(11) NOT NULL,
  `is_active` enum('active','inactive') NOT NULL DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `product_code` varchar(20) DEFAULT NULL,
  `is_active` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `price` int(11) NOT NULL DEFAULT 0,
  `unit` varchar(100) NOT NULL DEFAULT 'pcs',
  `discount_amount` decimal(15,2) DEFAULT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `link` text DEFAULT NULL,
  `image` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `product_name`, `category_id`, `product_code`, `is_active`, `created_at`, `updated_at`, `created_by`, `updated_by`, `description`, `price`, `unit`, `discount_amount`, `stock`, `link`, `image`) VALUES
(10, 'Super Mario Bros Wonder', 10, NULL, 'active', '2023-12-20 00:28:51', '2023-12-20 00:28:51', NULL, NULL, 'Game 1', 930960, 'pcs', NULL, 30, 'https://www.nintendo.com/us/store/products/super-mario-bros-wonder-switch/', 'images/1703060931.jpg'),
(11, 'Red Dead Redemption', 10, NULL, 'active', '2023-12-20 00:33:59', '2023-12-20 00:33:59', NULL, NULL, 'Game 2', 775777, 'pcs', NULL, 25, 'https://www.nintendo.com/us/store/products/red-dead-redemption-switch/', 'images/1703061239.jpg'),
(12, 'The Legend of Zelda TOTK', 11, NULL, 'active', '2023-12-20 00:36:50', '2023-12-20 00:37:04', NULL, NULL, 'Game 3', 1086095, 'pcs', NULL, 60, 'https://www.nintendo.com/us/store/products/the-legend-of-zelda-tears-of-the-kingdom-switch/', 'images/1703061410.jpg'),
(13, 'NFS Hot Pursuit', 12, NULL, 'active', '2023-12-20 00:40:23', '2023-12-20 00:40:23', NULL, NULL, 'Game 4', 620480, 'pcs', NULL, 35, 'https://www.nintendo.com/us/store/products/need-for-speed-hot-pursuit-remastered-switch/', 'images/1703061623.jpg'),
(14, 'Xenoblade Chronicles', 13, NULL, 'active', '2023-12-20 00:42:20', '2023-12-20 00:42:20', NULL, NULL, 'Game 5', 931050, 'pcs', NULL, 90, 'https://www.nintendo.com/us/store/products/xenoblade-chronicles-definitive-edition-switch/', 'images/1703061740.jpg'),
(15, 'Hogwarts Legacy', 13, NULL, 'active', '2023-12-20 00:44:37', '2023-12-20 00:50:40', NULL, NULL, 'Game 6', 1086225, 'pcs', NULL, 125, 'https://www.nintendo.com/us/store/products/hogwarts-legacy-switch/', 'images/1703061877.jpg'),
(16, 'EA FC', 14, NULL, 'active', '2023-12-20 00:46:33', '2023-12-20 00:50:24', NULL, NULL, 'Game 7', 931059, 'pcs', NULL, 50, 'https://www.nintendo.com/us/store/products/ea-sports-fc-24-switch/', 'images/1703061993.jpg'),
(17, 'NBA', 14, NULL, 'active', '2023-12-20 00:49:27', '2023-12-20 00:49:27', NULL, NULL, 'Game 8', 931059, 'pcs', NULL, 20, 'https://www.nintendo.com/us/store/products/nba-2k23-switch/', 'images/1703062167.jpg'),
(18, 'The Legend of Zelda BOTW', 11, NULL, 'active', '2023-12-20 00:51:59', '2023-12-20 00:51:59', NULL, NULL, 'Game 9', 931059, 'pcs', NULL, 70, 'https://www.nintendo.com/us/store/products/the-legend-of-zelda-breath-of-the-wild-switch/', 'images/1703062319.jpg'),
(19, 'BORUTO STORM CONNECTIONS', 10, NULL, 'active', '2023-12-20 00:53:45', '2023-12-20 00:54:14', NULL, NULL, 'Game 10', 931059, 'pcs', NULL, 100, 'https://www.nintendo.com/us/store/products/naruto-x-boruto-ultimate-ninja-storm-connections-switch/', 'images/1703062425.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE `product_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `is_active` enum('active','inactive') NOT NULL DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`id`, `category_name`, `created_at`, `updated_at`, `created_by`, `updated_by`, `is_active`) VALUES
(10, 'Action', '2023-12-20 00:18:39', '2023-12-20 00:18:39', NULL, NULL, 'active'),
(11, 'Adventure', '2023-12-20 00:18:47', '2023-12-20 00:18:47', NULL, NULL, 'active'),
(12, 'Racing', '2023-12-20 00:19:11', '2023-12-20 00:19:11', NULL, NULL, 'active'),
(13, 'RPG', '2023-12-20 00:19:29', '2023-12-20 00:19:29', NULL, NULL, 'active'),
(14, 'Sports', '2023-12-20 00:19:43', '2023-12-20 00:19:43', NULL, NULL, 'active');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'client'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `role`) VALUES
(1, 'Admin', 'admin@gmail.com', NULL, '12345678', NULL, '2023-12-19 23:34:41', '2023-12-19 23:34:41', 'admin'),
(3, 'Ali Khatami', 'alirpl2643@gmail.com', NULL, '12345678', NULL, '2023-12-20 01:00:46', '2023-12-20 01:00:46', 'client');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_category_id_foreign` (`category_id`);

--
-- Indexes for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `pengguna`
--
ALTER TABLE `pengguna`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `product_categories` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
