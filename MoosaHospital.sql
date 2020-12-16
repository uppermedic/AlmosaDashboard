-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 16, 2020 at 06:05 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `MoosaHospital`
--

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `title`, `slug`, `content`, `excerpt`, `status`, `image`, `seo_title`, `meta_description`, `meta_keywords`, `created_at`, `updated_at`) VALUES
(1, 'fsfssdfsar', 'fsfssdfsar', '<p>blog</p>', '<p>sdfsdfsdf</p>', 'PUBLISHED', 'blogs/December2020/QfYRcMm4LOSurgOinVNg.jpg', 'sfsa', 'fsdf', 'fssfsf', '2020-12-01 12:10:00', '2020-12-15 12:15:42'),
(2, 'بلوج عربي', 'blwj-arby', '<p>محتوي عربي</p>', '', 'PUBLISHED', 'blogs/December2020/TxpslN48mbeqvIyjwZvE.jpg', 'meta title', 'meta des', 'health', '2020-12-04 21:13:00', '2020-12-15 13:51:28');

-- --------------------------------------------------------

--
-- Table structure for table `blogs_categories_relation`
--

CREATE TABLE `blogs_categories_relation` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `blog_id` int(11) NOT NULL,
  `blog_category_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blogs_categories_relation`
--

INSERT INTO `blogs_categories_relation` (`id`, `blog_id`, `blog_category_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(2, 1, 2, NULL, NULL),
(3, 2, 1, NULL, NULL),
(4, 2, 2, NULL, NULL),
(5, 2, 4, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `blogs_tags_relation`
--

CREATE TABLE `blogs_tags_relation` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `blog_id` int(11) NOT NULL,
  `blog_tag_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blogs_tags_relation`
--

INSERT INTO `blogs_tags_relation` (`id`, `blog_id`, `blog_tag_id`, `created_at`, `updated_at`) VALUES
(7, 1, 8, NULL, NULL),
(8, 1, 9, NULL, NULL),
(9, 1, 10, NULL, NULL),
(10, 1, 11, NULL, NULL),
(11, 2, 3, NULL, NULL),
(12, 2, 12, NULL, NULL),
(13, 2, 13, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `blog_categories`
--

CREATE TABLE `blog_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog_categories`
--

INSERT INTO `blog_categories` (`id`, `category_name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'blog catogry1', 'blog-catogry1', '2020-12-01 12:14:17', '2020-12-01 12:14:17'),
(2, 'blog category 2', 'blog-category-2', '2020-12-01 12:14:31', '2020-12-01 12:14:31'),
(4, 'الصحة', 'health', '2020-12-04 21:10:57', '2020-12-04 21:10:57');

-- --------------------------------------------------------

--
-- Table structure for table `blog_tags`
--

CREATE TABLE `blog_tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tag_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog_tags`
--

INSERT INTO `blog_tags` (`id`, `tag_name`, `created_at`, `updated_at`) VALUES
(1, 'tag1', '2020-12-01 12:21:56', '2020-12-01 12:21:56'),
(2, 'tag2', '2020-12-01 13:05:47', '2020-12-01 13:05:47'),
(3, 'tag3', '2020-12-01 13:05:55', '2020-12-01 13:05:55'),
(4, 'tag4', '2020-12-01 13:12:05', '2020-12-01 13:12:05'),
(5, 'tag5ar', '2020-12-01 13:12:00', '2020-12-01 13:30:08'),
(6, 'تكميم', '2020-12-01 13:12:48', '2020-12-01 13:12:48'),
(7, 'جراحة', '2020-12-01 16:32:51', '2020-12-01 16:32:51'),
(8, 'جراحه', '2020-12-01 17:11:18', '2020-12-01 17:11:18'),
(9, 'اعصاب', '2020-12-01 17:11:27', '2020-12-01 17:11:27'),
(10, 'امراض جلديه', '2020-12-01 17:16:08', '2020-12-01 17:16:08'),
(11, 'tag66', '2020-12-04 20:25:15', '2020-12-04 20:25:15'),
(12, 'tagfm5', '2020-12-04 21:12:52', '2020-12-04 21:12:52'),
(13, 'الصحة', '2020-12-04 21:13:06', '2020-12-04 21:13:06');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `order`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 'Category 1jhh', 'category-1hg', '2020-11-18 19:17:29', '2020-12-01 08:15:36'),
(2, NULL, 1, 'Category 2', 'category-2', '2020-11-18 19:17:29', '2020-11-18 19:17:29');

-- --------------------------------------------------------

--
-- Table structure for table `communities`
--

CREATE TABLE `communities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `communities`
--

INSERT INTO `communities` (`id`, `title`, `slug`, `thumbnail`, `image`, `color`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'power of art ar', 'power-of-art-en', 'communities/doctor.jpg', '[\"communities\\/December2020\\/OkoNah5kmQf1fvEMKwkT.jpg\"]', '#dd6767', NULL, '2020-12-10 08:22:00', '2020-12-10 08:32:51');

-- --------------------------------------------------------

--
-- Table structure for table `communities_objectives_relations`
--

CREATE TABLE `communities_objectives_relations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `community_id` bigint(20) UNSIGNED NOT NULL,
  `objective_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `communities_objectives_relations`
--

INSERT INTO `communities_objectives_relations` (`id`, `community_id`, `objective_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `communities_participating_relations`
--

CREATE TABLE `communities_participating_relations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `community_id` bigint(20) UNSIGNED NOT NULL,
  `participating_group_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `communities_participating_relations`
--

INSERT INTO `communities_participating_relations` (`id`, `community_id`, `participating_group_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `community_contents`
--

CREATE TABLE `community_contents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `images` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `community_contents`
--

INSERT INTO `community_contents` (`id`, `name`, `title`, `content`, `images`, `video`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'content for pwer of art community', 'objectives ar', '<p>content ar</p>', 'community-contents/doctor1.jpg', NULL, NULL, '2020-12-10 08:30:39', '2020-12-10 08:30:39');

-- --------------------------------------------------------

--
-- Table structure for table `community_content_relation`
--

CREATE TABLE `community_content_relation` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `community_id` bigint(20) UNSIGNED NOT NULL,
  `community_content_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `community_content_relation`
--

INSERT INTO `community_content_relation` (`id`, `community_id`, `community_content_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `browse` tinyint(1) NOT NULL DEFAULT 1,
  `read` tinyint(1) NOT NULL DEFAULT 1,
  `edit` tinyint(1) NOT NULL DEFAULT 1,
  `add` tinyint(1) NOT NULL DEFAULT 1,
  `delete` tinyint(1) NOT NULL DEFAULT 1,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, NULL, 3),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, NULL, 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, NULL, 5),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 6),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, NULL, 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, NULL, 12),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
(21, 1, 'role_id', 'text', 'Role', 1, 1, 1, 1, 1, 1, NULL, 9),
(22, 4, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(23, 4, 'parent_id', 'select_dropdown', 'Parent', 0, 0, 1, 1, 1, 1, '{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}', 2),
(24, 4, 'order', 'text', 'Order', 1, 1, 1, 1, 1, 1, '{\"default\":1}', 3),
(25, 4, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 4),
(26, 4, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\"}}', 5),
(27, 4, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, NULL, 6),
(28, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(29, 5, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
(30, 5, 'author_id', 'text', 'Author', 1, 0, 1, 1, 0, 1, '{}', 2),
(31, 5, 'category_id', 'select_multiple', 'Category', 0, 0, 1, 1, 1, 0, '{}', 3),
(32, 5, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, '{}', 4),
(33, 5, 'excerpt', 'text_area', 'Excerpt', 0, 0, 1, 1, 1, 1, '{}', 5),
(34, 5, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, '{}', 6),
(35, 5, 'image', 'image', 'Post Image', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 7),
(36, 5, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:posts,slug\"}}', 8),
(37, 5, 'meta_description', 'text_area', 'Meta Description', 0, 0, 1, 1, 1, 1, '{}', 9),
(38, 5, 'meta_keywords', 'text_area', 'Meta Keywords', 0, 0, 1, 1, 1, 1, '{}', 10),
(39, 5, 'status', 'select_multiple', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}', 11),
(40, 5, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 12),
(41, 5, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 13),
(42, 5, 'seo_title', 'text', 'SEO Title', 0, 1, 1, 1, 1, 1, '{}', 14),
(43, 5, 'featured', 'checkbox', 'Featured', 1, 1, 1, 1, 1, 1, '{}', 15),
(44, 6, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
(45, 6, 'author_id', 'text', 'Author', 1, 0, 0, 0, 0, 0, '{}', 2),
(46, 6, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, '{}', 3),
(47, 6, 'excerpt', 'text_area', 'Excerpt', 0, 0, 1, 1, 1, 1, '{}', 4),
(48, 6, 'body', 'rich_text_box', 'Body', 0, 0, 1, 1, 1, 1, '{}', 5),
(49, 6, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:pages,slug\"}}', 6),
(50, 6, 'meta_description', 'text', 'Meta Description', 0, 0, 1, 1, 1, 1, '{}', 7),
(51, 6, 'meta_keywords', 'text', 'Meta Keywords', 0, 0, 1, 1, 1, 1, '{}', 8),
(52, 6, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}', 9),
(53, 6, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 10),
(54, 6, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 11),
(55, 6, 'image', 'image', 'Page Image', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1920\",\"height\":null},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 12),
(56, 8, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(57, 8, 'body', 'rich_text_box', 'Body', 1, 1, 1, 1, 1, 1, '{}', 2),
(58, 8, 'patient_name', 'text', 'Patient Name', 1, 1, 1, 1, 1, 1, '{}', 3),
(59, 8, 'dr_name', 'text', 'Dr Name', 1, 1, 1, 1, 1, 1, '{}', 4),
(60, 8, 'department', 'text', 'Department', 1, 1, 1, 1, 1, 1, '{}', 5),
(61, 8, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 6),
(62, 8, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(75, 15, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(76, 15, 'category_name', 'text', 'Category Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(77, 15, 'bg_image', 'image', 'Image', 1, 1, 1, 1, 1, 1, '{}', 3),
(78, 15, 'bg_color', 'color', 'Color', 1, 1, 1, 1, 1, 1, '{}', 4),
(79, 15, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 5),
(80, 15, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
(81, 16, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 2),
(82, 16, 'content', 'rich_text_box', 'Content', 1, 0, 1, 1, 1, 1, '{}', 3),
(83, 16, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 4),
(84, 16, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
(85, 16, 'patient_guide_category_id', 'text', 'Patient Guide Category', 1, 1, 1, 1, 1, 1, '{}', 6),
(86, 16, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, '{}', 1),
(87, 16, 'patient_guid_belongsto_patient_guide_category_relationship', 'relationship', 'patient_guide_categories', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\PatientGuideCategory\",\"table\":\"patient_guide_categories\",\"type\":\"belongsTo\",\"column\":\"patient_guide_category_id\",\"key\":\"id\",\"label\":\"category_name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 7),
(95, 18, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(96, 18, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\",\"forceUpdate\":true}}', 2),
(97, 18, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 3),
(98, 18, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, '{}', 4),
(99, 18, 'qualifications', 'markdown_editor', 'Qualifications', 1, 0, 1, 1, 1, 1, '{}', 5),
(100, 18, 'current_positions', 'markdown_editor', 'Current Positions', 1, 0, 1, 1, 1, 1, '{}', 6),
(101, 18, 'facebook', 'text', 'Facebook', 0, 0, 1, 1, 1, 1, '{}', 7),
(102, 18, 'twitter', 'text', 'Twitter', 0, 0, 1, 1, 1, 1, '{}', 8),
(103, 18, 'linkedin', 'text', 'Linkedin', 0, 0, 1, 1, 1, 1, '{}', 9),
(104, 18, 'website_url', 'text', 'Website Url', 0, 0, 1, 1, 1, 1, '{}', 10),
(105, 18, 'whatsapp_number', 'text', 'Whatsapp Number', 0, 0, 1, 1, 1, 1, '{}', 11),
(106, 18, 'image', 'media_picker', 'Image', 1, 0, 1, 1, 1, 1, '{\"max\":1,\"min\":1,\"allowed\":[\"image\\/jpeg\",\"image\\/png\",\"image\\/bmp\"]}', 12),
(107, 18, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 13),
(108, 18, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 14),
(109, 5, 'post_hasmany_category_relationship', 'relationship', 'categories', 0, 1, 1, 1, 1, 1, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Category\",\"table\":\"categories\",\"type\":\"hasMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 16),
(110, 19, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(111, 19, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, '{}', 2),
(112, 19, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:blogs,slug\"}}', 3),
(113, 19, 'content', 'rich_text_box', 'Content', 1, 0, 1, 1, 1, 1, '{}', 4),
(114, 19, 'excerpt', 'rich_text_box', 'Excerpt', 1, 0, 1, 1, 1, 1, '{}', 5),
(115, 19, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}', 6),
(116, 19, 'image', 'image', 'Image', 0, 1, 1, 1, 1, 1, '{\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 7),
(117, 19, 'seo_title', 'text', 'Seo Title', 0, 0, 1, 1, 1, 1, '{}', 8),
(118, 19, 'meta_description', 'text', 'Meta Description', 1, 0, 1, 1, 1, 1, '{}', 9),
(119, 19, 'meta_keywords', 'text', 'Meta Keywords', 1, 0, 1, 1, 1, 1, '{}', 10),
(120, 19, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 1, 0, 1, '{}', 11),
(121, 19, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 12),
(122, 20, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(123, 20, 'tag_name', 'text', 'Tag Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(125, 20, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 4),
(126, 20, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
(127, 22, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(128, 22, 'category_name', 'text', 'Category Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(129, 22, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"category_name\",\"forceUpdate\":true}}', 3),
(130, 22, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 4),
(131, 22, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
(132, 19, 'blog_belongstomany_blog_category_relationship', 'relationship', 'blog categories', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\BlogCategory\",\"table\":\"blog_categories\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"category_name\",\"pivot_table\":\"blogs_categories_relation\",\"pivot\":\"1\",\"taggable\":\"0\"}', 13),
(133, 19, 'blog_belongstomany_blog_tag_relationship', 'relationship', 'blog tags', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\BlogTag\",\"table\":\"blog_tags\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"tag_name\",\"pivot_table\":\"blogs_tags_relation\",\"pivot\":\"1\",\"taggable\":\"on\"}', 14),
(134, 23, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(135, 23, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\",\"messages\":{\"required\":\"This :attribute field is a must.\"}}}', 2),
(136, 23, 'url', 'text', 'Url', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|url\",\"messages\":{\"required\":\"This :attribute field is a must.\",\"url\":\"please write valide url\"}}}', 3),
(137, 23, 'image', 'media_picker', 'Image', 1, 0, 1, 1, 1, 1, '{\"quality\":\"90%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 4),
(138, 23, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 5),
(139, 23, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
(140, 24, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(141, 24, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\",\"messages\":{\"required\":\"This :attribute field is a must.\"}}}', 2),
(142, 24, 'images', 'media_picker', 'Images', 1, 0, 1, 1, 1, 1, '{\"max\":20,\"min\":1,\"expanded\":true,\"show_folders\":true,\"show_toolbar\":true,\"allow_upload\":true,\"allow_move\":true,\"allow_delete\":true,\"allow_create_folder\":true,\"allow_rename\":true,\"allow_crop\":true,\"allowed\":[],\"hide_thumbnails\":false,\"quality\":90}', 3),
(143, 24, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 4),
(144, 24, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
(145, 25, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(146, 25, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\",\"messages\":{\"required\":\"This :attribute field is a must.\"}}}', 2),
(147, 25, 'video_url', 'text', 'Video Url', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|url\",\"messages\":{\"required\":\"This :attribute field is a must.\",\"url\":\"please wrte valide video url\"}}}', 3),
(148, 25, 'bg_image', 'image', 'Background Image', 1, 1, 1, 1, 1, 1, '{}', 4),
(149, 25, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 5),
(150, 25, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
(151, 27, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(152, 27, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\",\"messages\":{\"required\":\" :attribute required\"}}}', 2),
(153, 27, 'start_date', 'date', 'Start Date', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\",\"messages\":{\"required\":\" :attribute required\"}}}', 3),
(154, 27, 'end_date', 'date', 'End Date', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\",\"messages\":{\"required\":\" :attribute required\"}}}', 4),
(155, 27, 'cost', 'number', 'التكلفه', 0, 0, 1, 1, 1, 1, '{}', 5),
(156, 27, 'image', 'image', 'Image', 1, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":null},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 6),
(157, 27, 'content', 'rich_text_box', 'Description', 1, 0, 1, 1, 1, 1, '{}', 7),
(158, 27, 'speaker_name', 'text', 'Speaker Name', 1, 0, 1, 1, 1, 1, '{}', 8),
(159, 27, 'location', 'text', 'Location', 0, 0, 1, 1, 1, 1, '{}', 9),
(160, 27, 'phone', 'text', 'Contact Phone', 0, 0, 1, 1, 1, 1, '{}', 10),
(161, 27, 'email', 'text', 'Contact Email', 0, 0, 1, 1, 1, 1, '{}', 11),
(162, 27, 'attendance', 'number', 'Attendance', 1, 1, 1, 0, 0, 1, '{}', 12),
(164, 27, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 0, 0, 0, 0, '{}', 14),
(165, 27, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 15),
(166, 27, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 16),
(167, 27, 'event_hasone_event_category_relationship', 'relationship', 'نوع الحدث', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\EventCategory\",\"table\":\"event_categories\",\"type\":\"belongsTo\",\"column\":\"event_category_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"blog_categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 17),
(168, 29, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(169, 29, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\",\"messages\":{\"required\":\":attribute required\"}}}', 2),
(170, 29, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 0, 0, 0, 1, '{}', 3),
(171, 29, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 4),
(172, 29, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
(173, 27, 'event_category_id', 'text', 'Event Category Id', 0, 1, 1, 1, 1, 1, '{}', 16),
(174, 31, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(175, 31, 'firstName', 'text', 'FirstName', 1, 1, 1, 1, 1, 1, '{}', 2),
(176, 31, 'lastName', 'text', 'LastName', 1, 0, 1, 1, 1, 1, '{}', 4),
(177, 31, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, '{}', 5),
(178, 31, 'city', 'text', 'City', 1, 1, 1, 1, 1, 1, '{}', 6),
(179, 31, 'phone', 'text', 'Phone', 1, 1, 1, 1, 1, 1, '{}', 7),
(180, 31, 'event_id', 'number', 'Event Id', 1, 1, 1, 1, 1, 1, '{}', 3),
(181, 31, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 0, 0, 0, 1, '{}', 8),
(182, 31, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 9),
(183, 31, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 10),
(184, 31, 'event_attendance_belongsto_event_relationship', 'relationship', 'events', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Event\",\"table\":\"events\",\"type\":\"belongsTo\",\"column\":\"event_id\",\"key\":\"id\",\"label\":\"title\",\"pivot_table\":\"blog_categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 11),
(185, 33, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(186, 33, 'title', 'text', 'Topic name', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\",\"messages\":{\"required\":\"this field requiered\"}}}', 3),
(187, 33, 'lecture_title', 'text', 'Lecture Title', 1, 1, 1, 1, 1, 1, '{}', 4),
(188, 33, 'start', 'time', 'Start', 1, 1, 1, 1, 1, 1, '{}', 5),
(189, 33, 'end', 'time', 'End', 1, 1, 1, 1, 1, 1, '{}', 6),
(190, 33, 'event_id', 'number', 'Event Id', 1, 1, 1, 1, 1, 1, '{}', 2),
(191, 33, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 0, 0, 0, 1, '{}', 7),
(192, 33, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 8),
(193, 33, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 9),
(194, 33, 'event_timeline_belongsto_event_relationship', 'relationship', 'events', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Event\",\"table\":\"events\",\"type\":\"belongsTo\",\"column\":\"event_id\",\"key\":\"id\",\"label\":\"title\",\"pivot_table\":\"blog_categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 10),
(195, 34, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(196, 34, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, '{}', 2),
(197, 34, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true}}', 3),
(198, 34, 'color', 'color', 'Color', 1, 1, 1, 1, 1, 1, '{\"description\":\"background color of title\"}', 4),
(199, 34, 'thumbnail', 'image', 'Thumbnail', 1, 1, 1, 1, 1, 1, '{\"quality\":\"90%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 5),
(200, 34, 'image', 'image', 'Image', 1, 0, 1, 1, 1, 1, '{}', 6),
(201, 34, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 1, 1, 1, 1, '{}', 7),
(202, 34, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 8),
(203, 34, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 9),
(204, 35, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(205, 35, 'service_category_id', 'number', 'Service Category Id', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\",\"messages\":{\"required\":\"please select a service category\"}}}', 2),
(206, 35, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true}}', 4),
(207, 35, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\",\"messages\":{\"required\":\"please :attribute is required\"}}}', 3),
(208, 35, 'excerpt', 'rich_text_box', 'Excerpt', 1, 0, 1, 1, 1, 1, '{}', 6),
(209, 35, 'content', 'rich_text_box', 'Content', 1, 0, 1, 1, 1, 1, '{}', 7),
(210, 35, 'icon', 'media_picker', 'Icon', 1, 0, 1, 1, 1, 1, '{}', 8),
(211, 35, 'color', 'color', 'Color', 1, 0, 1, 1, 1, 1, '{}', 9),
(212, 35, 'thumbnail', 'media_picker', 'Thumbnail', 1, 0, 1, 1, 1, 1, '{\"quality\":\"90%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 10),
(213, 35, 'image', 'media_picker', 'Image', 1, 0, 1, 1, 1, 1, '{\"max\":1,\"min\":1,\"show_folders\":true,\"show_toolbar\":true,\"allow_upload\":true,\"allow_move\":true,\"allow_delete\":true,\"allow_create_folder\":true,\"allow_rename\":true,\"allow_crop\":true,\"hide_thumbnails\":false,\"quality\":90}', 11),
(214, 35, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 0, 0, 0, 1, '{}', 12),
(215, 35, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 1, 0, 1, '{}', 13),
(216, 35, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 14),
(217, 35, 'service_belongsto_service_category_relationship', 'relationship', 'service categories', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\ServiceCategory\",\"table\":\"service_categories\",\"type\":\"belongsTo\",\"column\":\"service_category_id\",\"key\":\"id\",\"label\":\"title\",\"pivot_table\":\"blog_categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 5),
(218, 37, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(219, 37, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\",\"messages\":{\"required\":\"this :attribute is required\"}}}', 3),
(220, 37, 'color', 'color', 'Color', 1, 0, 1, 1, 1, 1, '{\"description\":\"background color of section title\"}', 5),
(221, 37, 'icon', 'media_picker', 'Icon', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"nullable\"},\"max\":1,\"min\":0,\"show_folders\":true,\"show_toolbar\":true,\"allow_upload\":true,\"allow_move\":true,\"allow_delete\":true,\"allow_create_folder\":true,\"allow_rename\":true,\"allow_crop\":true,\"allowed\":[],\"hide_thumbnails\":false,\"quality\":90}', 6),
(222, 37, 'service_id', 'number', 'Service Id', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\",\"messages\":{\"required\":\"please select a service\"}}}', 2),
(223, 37, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 1, 0, 0, 1, '{}', 7),
(224, 37, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 8),
(225, 37, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 9),
(226, 37, 'service_section_belongsto_service_relationship', 'relationship', 'services', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Service\",\"table\":\"services\",\"type\":\"belongsTo\",\"column\":\"service_id\",\"key\":\"id\",\"label\":\"title\",\"pivot_table\":\"blog_categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 4),
(227, 39, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(228, 39, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\",\"messages\":{\"required\":\"this :attribute is required\"}}}', 3),
(229, 39, 'content', 'rich_text_box', 'Content', 1, 0, 1, 1, 1, 1, '{}', 5),
(230, 39, 'section_id', 'text', 'Section Id', 1, 0, 0, 0, 0, 1, '{\"validation\":{\"rule\":\"required\",\"messages\":{\"required\":\"please select a section\"}}}', 2),
(231, 39, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 1, 0, 0, 1, '{}', 6),
(232, 39, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 7),
(233, 39, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 8),
(235, 35, 'service_belongstomany_doctor_relationship', 'relationship', 'Shoose Physicians', 0, 1, 1, 1, 1, 1, '{\"descripion\":\"choose phiscians for this service ,can be null\",\"model\":\"App\\\\Models\\\\Doctor\",\"table\":\"doctors\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"services_physicians_relation\",\"pivot\":\"1\",\"taggable\":\"0\"}', 15),
(236, 40, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(237, 40, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\",\"messages\":{\"required\":\"this :attribute is required.\"}}}', 2),
(238, 40, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true}}', 3),
(239, 40, 'thumbnail', 'media_picker', 'Thumbnail', 1, 0, 1, 1, 1, 1, '{}', 4),
(240, 40, 'image', 'multiple_images', 'Image', 1, 0, 1, 1, 1, 1, '{}', 5),
(241, 40, 'color', 'color', 'Color', 1, 1, 1, 1, 1, 1, '{}', 6),
(242, 40, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 1, 0, 0, 1, '{}', 7),
(243, 40, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 8),
(244, 40, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 9),
(245, 41, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(246, 41, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|unique:community_contents,name\",\"messages\":{\"required\":\"this :attribute is required\",\"unique\":\"this :attribute is unique change to another name\"}}}', 2),
(247, 41, 'title', 'text', 'Title', 0, 1, 1, 1, 1, 1, '{}', 3),
(248, 41, 'content', 'rich_text_box', 'Content', 0, 0, 1, 1, 1, 1, '{}', 4),
(249, 41, 'images', 'media_picker', 'Images', 0, 0, 1, 1, 1, 1, '{}', 5),
(250, 41, 'video', 'text', 'Video url', 0, 0, 1, 1, 1, 1, '{}', 6),
(251, 41, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 1, 0, 0, 1, '{}', 7),
(252, 41, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 8),
(253, 41, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 9),
(254, 40, 'community_belongstomany_community_content_relationship', 'relationship', 'community contents', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\CommunityContent\",\"table\":\"community_contents\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"community_content_relation\",\"pivot\":\"1\",\"taggable\":\"0\"}', 10),
(255, 42, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(256, 42, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\",\"messgaes\":{\"required\":\"this :attribute is required\"}}}', 2),
(257, 42, 'icon', 'media_picker', 'Icon', 1, 0, 1, 1, 1, 1, '{\"max\":1,\"min\":1}', 3),
(258, 42, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 4),
(259, 42, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
(260, 43, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(261, 43, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\",\"messages\":{\"required\":\"this :attribute is required\"}}}', 2),
(262, 43, 'image', 'media_picker', 'Image', 1, 0, 1, 1, 1, 1, '{}', 3),
(263, 43, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 0, 0, 0, 1, '{}', 4),
(264, 43, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 5),
(265, 43, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
(266, 40, 'community_belongstomany_objective_relationship', 'relationship', 'objectives', 0, 1, 1, 1, 1, 1, '{\"description\":\"select objectives of the community (is optional)\",\"model\":\"App\\\\Models\\\\Objective\",\"table\":\"objectives\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"title\",\"pivot_table\":\"communities_objectives_relations\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
(267, 40, 'community_belongstomany_participating_group_relationship', 'relationship', 'participating_groups', 0, 1, 1, 1, 1, 1, '{\"description\":\"select participation group of the community (is optional)\",\"model\":\"App\\\\Models\\\\ParticipatingGroup\",\"table\":\"participating_groups\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"title\",\"pivot_table\":\"communities_participating_relations\",\"pivot\":\"1\",\"taggable\":\"0\"}', 12),
(268, 44, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(269, 44, 'title', 'text', 'Title', 0, 1, 1, 1, 1, 1, '{}', 3),
(270, 44, 'content', 'rich_text_box', 'Content', 0, 1, 1, 1, 1, 1, '{}', 4),
(271, 44, 'image', 'media_picker', 'Image', 0, 1, 1, 1, 1, 1, '{}', 5),
(273, 44, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 7),
(274, 44, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 8),
(276, 44, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 0, 0, 0, 1, '{}', 9),
(277, 44, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(279, 6, 'page_belongstomany_page_content_relationship', 'relationship', 'page_contents', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\PageContent\",\"table\":\"page_contents\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"page_content_relation\",\"pivot\":\"1\",\"taggable\":\"0\"}', 13);

-- --------------------------------------------------------

--
-- Table structure for table `data_types`
--

CREATE TABLE `data_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT 0,
  `server_side` tinyint(4) NOT NULL DEFAULT 0,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', '', 1, 0, NULL, '2020-11-18 19:17:17', '2020-11-18 19:17:17'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2020-11-18 19:17:17', '2020-11-18 19:17:17'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', '', 1, 0, NULL, '2020-11-18 19:17:17', '2020-11-18 19:17:17'),
(4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', NULL, '', '', 1, 0, NULL, '2020-11-18 19:17:28', '2020-11-18 19:17:28'),
(5, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2020-11-18 19:17:29', '2020-12-01 11:09:24'),
(6, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'App\\Models\\Page', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2020-11-18 19:17:31', '2020-12-16 11:56:31'),
(8, 'testimonials', 'testimonials', 'Testimonial', 'Testimonials', 'voyager-pen', 'App\\Models\\Testimonial', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-11-20 20:34:48', '2020-11-20 20:36:09'),
(15, 'patient_guide_categories', 'patient-guide-categories', 'Patient Guide Category', 'Patient Guide Categories', NULL, 'App\\Models\\PatientGuideCategory', NULL, NULL, 'patient guide categories eg: for visitors, for patient...', 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":\"category_name\",\"scope\":null}', '2020-11-24 07:09:08', '2020-11-30 12:11:19'),
(16, 'patient_guids', 'patient-guids', 'Patient Guid', 'Patient Guids', NULL, 'App\\Models\\PatientGuid', NULL, NULL, 'patient guid', 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":\"title\",\"scope\":null}', '2020-11-24 08:33:46', '2020-11-24 08:41:05'),
(18, 'doctors', 'doctors', 'Doctor', 'Doctors', 'voyager-people', 'App\\Models\\Doctor', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":\"name\",\"scope\":null}', '2020-11-30 14:09:50', '2020-11-30 15:03:03'),
(19, 'blogs', 'blogs', 'Blog', 'Blogs', 'voyager-window-list', 'App\\Models\\Blog', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-12-01 11:41:14', '2020-12-01 13:10:13'),
(20, 'blog_tags', 'blog-tags', 'Tag', 'Tags', 'voyager-file-text', 'App\\Models\\BlogTag', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-12-01 11:45:59', '2020-12-01 13:09:31'),
(22, 'blog_categories', 'blog-categories', 'Blog Category', 'Blog Categories', NULL, 'App\\Models\\BlogCategory', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-12-01 11:47:27', '2020-12-01 12:08:58'),
(23, 'hakeem_magazines', 'hakeem-magazines', 'Hakeem Magazine', 'Hakeem Magazines', 'voyager-window-list', 'App\\Models\\HakeemMagazine', NULL, NULL, NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2020-12-02 05:27:17', '2020-12-02 05:27:17'),
(24, 'photo_galleries', 'photo-galleries', 'Photo Gallery', 'Photo Galleries', 'voyager-photo', 'App\\Models\\PhotoGallery', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-12-02 06:06:44', '2020-12-02 06:28:13'),
(25, 'video_galleries', 'video-galleries', 'Video Gallery', 'Video Galleries', 'voyager-video', 'App\\Models\\VideoGallery', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2020-12-02 07:15:39', '2020-12-02 07:15:39'),
(27, 'events', 'events', 'حدث', 'الأحداث', 'voyager-activity', 'App\\Models\\Event', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-12-04 16:07:38', '2020-12-04 19:02:55'),
(29, 'event_categories', 'event-categories', 'Event Category', 'Event Categories', 'voyager-categories', 'App\\Models\\EventCategory', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-12-04 16:58:04', '2020-12-04 17:41:03'),
(31, 'event_attendances', 'event-attendances', 'Event Attendance', 'Event Attendances', 'voyager-people', 'App\\Models\\EventAttendance', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-12-04 19:18:50', '2020-12-04 19:23:29'),
(33, 'event_timelines', 'event-timelines', 'Event Timeline', 'Event Timelines', 'voyager-alarm-clock', 'App\\Models\\EventTimeline', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-12-04 19:57:53', '2020-12-04 20:08:24'),
(34, 'service_categories', 'service-categories', 'Service Category', 'Service Categories', 'voyager-leaf', 'App\\Models\\ServiceCategory', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null}', '2020-12-07 14:31:58', '2020-12-07 14:31:58'),
(35, 'services', 'services', 'Service', 'Services', 'voyager-bubble-hear', 'App\\Models\\Service', NULL, NULL, NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2020-12-07 14:44:28', '2020-12-08 07:12:44'),
(37, 'service_sections', 'service-sections', 'Service Section', 'Service Sections', 'voyager-pie-chart', 'App\\Models\\ServiceSection', NULL, NULL, NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2020-12-07 14:56:03', '2020-12-08 06:51:25'),
(39, 'service_section_items', 'service-section-items', 'Section Item', 'Section Items', 'voyager-paperclip', 'App\\Models\\ServiceSectionItem', NULL, 'App\\Http\\Controllers\\Voyager\\ServiceSectionsItemsController', NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2020-12-07 15:09:30', '2020-12-09 08:22:36'),
(40, 'communities', 'communities', 'Community', 'Communities', 'voyager-rocket', 'App\\Models\\Community', NULL, NULL, NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2020-12-09 14:19:28', '2020-12-10 10:50:14'),
(41, 'community_contents', 'community-contents', 'Community Content', 'Community Contents', 'voyager-droplet', 'App\\Models\\CommunityContent', NULL, NULL, NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-12-09 14:31:39', '2020-12-10 08:30:15'),
(42, 'objectives', 'objectives', 'Objective', 'Objectives', 'voyager-leaf', 'App\\Models\\Objective', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2020-12-10 09:46:27', '2020-12-10 09:46:27'),
(43, 'participating_groups', 'participating-groups', 'Participating Group', 'Participating Groups', NULL, 'App\\Models\\ParticipatingGroup', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2020-12-10 09:52:56', '2020-12-10 09:52:56'),
(44, 'page_contents', 'page-contents', 'Page Content', 'Page Contents', 'voyager-news', 'App\\Models\\PageContent', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-12-13 12:29:47', '2020-12-16 13:27:11');

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qualifications` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `current_positions` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `facebook` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `whatsapp_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'doctor.jpg',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`id`, `slug`, `name`, `title`, `qualifications`, `current_positions`, `facebook`, `twitter`, `linkedin`, `website_url`, `whatsapp_number`, `image`, `created_at`, `updated_at`) VALUES
(1, 'd-aymn-tntawy', 'د.أيمن طنطاوي', 'Consultant Invasive Cardiologist', 'interventional cardiology , Adult Vascular Diseases , cardiovascular medicine', 'interventional cardiology , Adult Vascular Diseases , cardiovascular medicine', NULL, NULL, NULL, NULL, NULL, 'doctors/doctor1.jpg', '2020-11-30 14:17:00', '2020-11-30 14:35:13'),
(2, 'd-ahmd-almsry', 'د. أحمد المصري', 'استشاري أمراض القلب والاوعية الدموية', 'امراض القلب والاوعية الدموية ، خبره طويلة في مجال الرعاية المركزة العامة و الامراض الباطنية ', 'استشاري أمراض القلب والاوعية الدموية', 'facebook.com', 'twitter.com', 'linkedin.com', NULL, '01458741133', 'doctors/احمد-مبروك--395x465.jpg', '2020-11-30 14:56:00', '2020-11-30 14:57:53');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `cost` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `speaker_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attendance` int(11) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `event_category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `title`, `start_date`, `end_date`, `cost`, `image`, `content`, `speaker_name`, `location`, `phone`, `email`, `attendance`, `deleted_at`, `created_at`, `updated_at`, `event_category_id`) VALUES
(1, 'الحدث الاول ', '2020-12-30', '2020-12-31', '109', 'events/December2020/RPLHgsyhFw7RHzLd3j9K.png', '<p>ماذا يهدف هذا الحدث</p>', 'ا.د احمد', '12 ش المملكة', '2154874542', 'info@google.com', 0, NULL, '2020-12-04 17:56:00', '2020-12-04 20:56:38', 2);

-- --------------------------------------------------------

--
-- Table structure for table `event_attendances`
--

CREATE TABLE `event_attendances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `firstName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `event_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `event_attendances`
--

INSERT INTO `event_attendances` (`id`, `firstName`, `lastName`, `email`, `city`, `phone`, `event_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'aziz', 'adel', 'aziz@emil.com', 'cairo', '21547877', 1, NULL, '2020-12-04 19:24:26', '2020-12-04 19:24:26');

-- --------------------------------------------------------

--
-- Table structure for table `event_categories`
--

CREATE TABLE `event_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `event_categories`
--

INSERT INTO `event_categories` (`id`, `name`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'صحة', NULL, '2020-12-04 17:38:25', '2020-12-04 17:38:25'),
(2, 'كورسات', NULL, '2020-12-04 17:39:04', '2020-12-04 17:39:04'),
(3, 'المؤتمرات', NULL, '2020-12-04 17:39:52', '2020-12-04 17:39:52');

-- --------------------------------------------------------

--
-- Table structure for table `event_timelines`
--

CREATE TABLE `event_timelines` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lecture_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start` time NOT NULL,
  `end` time NOT NULL,
  `event_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `event_timelines`
--

INSERT INTO `event_timelines` (`id`, `title`, `lecture_title`, `start`, `end`, `event_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'اليوم الاول', ' المحاضرة الاولي', '13:00:00', '17:00:00', 1, NULL, '2020-12-04 20:09:00', '2020-12-04 20:58:03');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hakeem_magazines`
--

CREATE TABLE `hakeem_magazines` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hakeem_magazines`
--

INSERT INTO `hakeem_magazines` (`id`, `title`, `url`, `image`, `created_at`, `updated_at`) VALUES
(1, 'مجله موسي العدد الاول', 'https://issuu.com/al-moosa/docs/2-th-1-', 'hakeem-magazines/2019-08-27.jpg', '2020-12-02 05:32:00', '2020-12-02 05:34:12');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2020-11-18 19:17:18', '2020-11-18 19:17:18'),
(2, 'mainMenu', '2020-11-18 19:42:52', '2020-11-18 19:42:52');

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2020-11-18 19:17:19', '2020-11-18 19:17:19', 'voyager.dashboard', NULL),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 4, '2020-11-18 19:17:19', '2020-11-22 13:27:48', 'voyager.media.index', NULL),
(3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 3, '2020-11-18 19:17:19', '2020-11-18 19:17:19', 'voyager.users.index', NULL),
(4, 1, 'الادوار', '', '_self', 'voyager-lock', '#000000', NULL, 2, '2020-11-18 19:17:19', '2020-11-20 20:26:28', 'voyager.roles.index', 'null'),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 8, '2020-11-18 19:17:19', '2020-12-13 12:34:21', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 1, '2020-11-18 19:17:19', '2020-11-22 13:27:48', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 2, '2020-11-18 19:17:19', '2020-11-22 13:27:48', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 3, '2020-11-18 19:17:19', '2020-11-22 13:27:49', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 4, '2020-11-18 19:17:19', '2020-11-22 13:27:49', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 9, '2020-11-18 19:17:19', '2020-12-13 12:34:21', 'voyager.settings.index', NULL),
(11, 1, 'Categories', '', '_self', 'voyager-categories', NULL, NULL, 7, '2020-11-18 19:17:28', '2020-12-13 12:34:21', 'voyager.categories.index', NULL),
(12, 1, 'Posts', '', '_self', 'voyager-news', NULL, NULL, 5, '2020-11-18 19:17:30', '2020-11-22 13:27:48', 'voyager.posts.index', NULL),
(13, 1, 'الصفحات', '', '_self', 'voyager-file-text', '#000000', 49, 1, '2020-11-18 19:17:32', '2020-12-13 12:34:21', 'voyager.pages.index', 'null'),
(14, 1, 'Hooks', '', '_self', 'voyager-hook', NULL, 5, 5, '2020-11-18 19:17:36', '2020-11-22 13:27:49', 'voyager.hooks', NULL),
(16, 1, 'Testimonials', '', '_self', 'voyager-pen', NULL, NULL, 10, '2020-11-20 20:34:49', '2020-12-13 12:34:22', 'voyager.testimonials.index', NULL),
(20, 1, ' Guide Categories', '', '_self', NULL, '#000000', 23, 1, '2020-11-24 07:09:08', '2020-11-29 10:21:32', 'voyager.patient-guide-categories.index', 'null'),
(21, 1, 'Patient Guids', '', '_self', NULL, NULL, 23, 2, '2020-11-24 08:33:46', '2020-11-29 10:21:34', 'voyager.patient-guids.index', NULL),
(23, 1, 'دليل المريض', '', '_self', 'voyager-book', '#000000', NULL, 11, '2020-11-29 10:20:11', '2020-12-13 12:34:22', NULL, ''),
(24, 1, 'Doctors', '', '_self', 'voyager-people', NULL, NULL, 12, '2020-11-30 14:09:52', '2020-12-13 12:34:22', 'voyager.doctors.index', NULL),
(25, 1, 'المدونه', '', '_self', 'voyager-window-list', '#000000', 28, 1, '2020-12-01 11:41:14', '2020-12-01 13:40:10', 'voyager.blogs.index', 'null'),
(26, 1, 'Tags', '', '_self', 'voyager-tag', '#000000', 28, 2, '2020-12-01 11:45:59', '2020-12-01 13:37:24', 'voyager.blog-tags.index', 'null'),
(27, 1, 'Blog Categories', '', '_self', 'voyager-categories', '#000000', 28, 3, '2020-12-01 11:47:27', '2020-12-01 13:38:04', 'voyager.blog-categories.index', 'null'),
(28, 1, 'المدونه', '', '_self', 'voyager-bag', '#000000', NULL, 13, '2020-12-01 13:36:14', '2020-12-13 12:34:22', NULL, ''),
(29, 1, 'الخدمات', '', '_self', 'voyager-bulb', '#000000', NULL, 14, '2020-12-01 16:20:43', '2020-12-13 12:34:22', NULL, ''),
(30, 1, 'مجله حكيم', '', '_self', 'voyager-window-list', '#000000', 33, 1, '2020-12-02 05:27:18', '2020-12-02 07:21:54', 'voyager.hakeem-magazines.index', 'null'),
(31, 1, 'معرض الصور', '', '_self', 'voyager-photo', '#000000', 33, 2, '2020-12-02 06:06:44', '2020-12-02 07:21:27', 'voyager.photo-galleries.index', 'null'),
(32, 1, 'الفديوهات', '', '_self', 'voyager-video', '#000000', 33, 3, '2020-12-02 07:15:40', '2020-12-02 07:22:11', 'voyager.video-galleries.index', 'null'),
(33, 1, 'المركز الاعلامي', '', '_self', 'voyager-play', '#000000', NULL, 15, '2020-12-02 07:21:04', '2020-12-13 12:34:22', NULL, ''),
(34, 1, 'الاحداث', '', '_self', 'voyager-activity', '#000000', 36, 1, '2020-12-04 16:07:39', '2020-12-04 19:20:51', 'voyager.events.index', 'null'),
(35, 1, 'انواع الحدث', '', '_self', 'voyager-categories', '#000000', 36, 2, '2020-12-04 16:58:04', '2020-12-04 17:44:28', 'voyager.event-categories.index', 'null'),
(36, 1, 'تدريب و تعلم', '', '_self', 'voyager-certificate', '#000000', NULL, 16, '2020-12-04 17:44:12', '2020-12-13 12:34:22', NULL, ''),
(37, 1, 'المشتركين', '', '_self', 'voyager-people', '#000000', 36, 3, '2020-12-04 19:18:50', '2020-12-04 19:20:32', 'voyager.event-attendances.index', 'null'),
(38, 1, 'Event Timelines', '', '_self', 'voyager-alarm-clock', NULL, 36, 4, '2020-12-04 19:57:53', '2020-12-04 19:58:21', 'voyager.event-timelines.index', NULL),
(39, 1, 'Service Categories', '', '_self', 'voyager-leaf', NULL, 29, 1, '2020-12-07 14:31:59', '2020-12-07 16:17:38', 'voyager.service-categories.index', NULL),
(40, 1, 'Services', '', '_self', 'voyager-bubble-hear', NULL, 29, 2, '2020-12-07 14:44:28', '2020-12-07 16:17:55', 'voyager.services.index', NULL),
(41, 1, 'Service Sections', '', '_self', 'voyager-pie-chart', NULL, 29, 3, '2020-12-07 14:56:03', '2020-12-07 16:18:06', 'voyager.service-sections.index', NULL),
(42, 1, 'Section Items', '', '_self', 'voyager-window-list', '#000000', 29, 4, '2020-12-07 15:09:30', '2020-12-07 16:19:06', 'voyager.service-section-items.index', 'null'),
(43, 1, 'المبادرات', '', '_self', 'voyager-fire', '#000000', 45, 1, '2020-12-09 14:19:29', '2020-12-09 14:36:56', 'voyager.communities.index', 'null'),
(44, 1, 'محتوي المبادرات', '', '_self', 'voyager-droplet', '#000000', 45, 2, '2020-12-09 14:31:39', '2020-12-09 14:37:29', 'voyager.community-contents.index', 'null'),
(45, 1, 'المبادرات', '', '_self', 'voyager-puzzle', '#000000', NULL, 17, '2020-12-09 14:35:05', '2020-12-13 12:34:22', NULL, ''),
(46, 1, 'أهداف المبادرة', '', '_self', 'voyager-leaf', '#000000', 45, 3, '2020-12-10 09:46:28', '2020-12-10 10:32:48', 'voyager.objectives.index', 'null'),
(47, 1, 'الفئات المشاركه', '', '_self', 'voyager-bolt', '#000000', 45, 4, '2020-12-10 09:52:56', '2020-12-10 10:32:56', 'voyager.participating-groups.index', 'null'),
(48, 1, 'محتوي الصفاحات', '', '_self', 'voyager-news', '#000000', 49, 2, '2020-12-13 12:29:47', '2020-12-13 12:34:21', 'voyager.page-contents.index', 'null'),
(49, 1, 'الصفحات', '', '_self', 'voyager-file-text', '#000000', NULL, 6, '2020-12-13 12:33:07', '2020-12-13 12:34:21', NULL, '');

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_01_000000_add_voyager_user_fields', 1),
(4, '2016_01_01_000000_create_data_types_table', 1),
(5, '2016_05_19_173453_create_menu_table', 1),
(6, '2016_10_21_190000_create_roles_table', 1),
(7, '2016_10_21_190000_create_settings_table', 1),
(8, '2016_11_30_135954_create_permission_table', 1),
(9, '2016_11_30_141208_create_permission_role_table', 1),
(10, '2016_12_26_201236_data_types__add__server_side', 1),
(11, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(12, '2017_01_14_005015_create_translations_table', 1),
(13, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(14, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(15, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(16, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(17, '2017_08_05_000000_add_group_to_settings_table', 1),
(18, '2017_11_26_013050_add_user_role_relationship', 1),
(19, '2017_11_26_015000_create_user_roles_table', 1),
(20, '2018_03_11_000000_add_user_settings', 1),
(21, '2018_03_14_000000_add_details_to_data_types_table', 1),
(22, '2018_03_16_000000_make_settings_value_nullable', 1),
(23, '2019_08_19_000000_create_failed_jobs_table', 1),
(24, '2016_01_01_000000_create_pages_table', 2),
(25, '2016_01_01_000000_create_posts_table', 2),
(26, '2016_02_15_204651_create_categories_table', 2),
(27, '2017_04_11_000000_alter_post_nullable_fields_table', 2),
(28, '2020_11_20_222844_create_testimonials_table', 3),
(29, '2020_11_22_124725_create_services_table', 4),
(30, '2020_11_24_090154_create_patient_guide_categories_table', 5),
(31, '2020_11_24_095226_create_patient_guids_table', 6),
(32, '2020_11_24_101133_ultr_table_patient_guids_table', 7),
(33, '2020_11_29_110159_create_visitors_guids_table', 8),
(34, '2020_11_29_111534_ulter_visitor_guid_table', 9),
(35, '2020_11_30_152128_create_doctors_table', 10),
(36, '2020_12_01_130501_create_blog_categories_table', 11),
(37, '2020_12_01_130524_create_blog_tags_table', 11),
(38, '2020_12_01_130540_create_blogs_table', 11),
(39, '2020_12_01_132550_create_blogs_categories_relation_table', 11),
(40, '2020_12_01_132808_create_blogs__tags_relation_table', 11),
(41, '2020_12_01_140204_rename_blog_ctegories_name_column', 12),
(42, '2020_12_01_140445_rename_blog_tags_name_column', 12),
(43, '2020_12_01_150031_update_blog_tag_columns', 13),
(44, '2020_12_01_150212_update_blog_tag_columns', 14),
(45, '2020_12_02_070828_create_hakeem_magazines_table', 15),
(46, '2020_12_02_075728_create_photo_galleries_table', 16),
(47, '2020_12_02_090633_create_video_galleries_table', 17),
(48, '2020_12_02_102923_create_events_table', 18),
(49, '2020_12_02_120125_create_event_categories_table', 19),
(50, '2020_12_02_123913_create_event_attendances_table', 20),
(51, '2020_12_02_150314_create_events_table', 21),
(52, '2020_12_02_151254_create_event_attendances_table', 22),
(53, '2020_12_02_151616_create_event_categories_table', 22),
(54, '2020_12_02_151736_create_event_timelines_table', 22),
(55, '2020_12_07_150603_create_service_categories_table', 23),
(56, '2020_12_07_151310_create_services_table', 23),
(57, '2020_12_07_155017_create_service_sections_table', 23),
(58, '2020_12_07_160151_create_service_section_items_table', 23),
(59, '2020_12_07_175138_create_serices_physicians_relation_table', 24),
(60, '2020_12_09_155254_create_communities_table', 25),
(61, '2020_12_09_155802_create_community_contents_table', 25),
(62, '2020_12_09_160522_create_community_content_relation_table', 25),
(63, '2020_12_10_110531_create_objectives_table', 26),
(64, '2020_12_10_112720_create_participating_groups_table', 26),
(65, '2020_12_10_115528_create_community_objects_table', 27),
(66, '2020_12_10_115649_create_community_participating_table', 27),
(67, '2020_12_10_123415_create_communities_objectives_relations_table', 28),
(68, '2020_12_10_123457_create_communities_participating_relations_table', 28),
(69, '2020_12_13_142100_create_page_contents_table', 29),
(70, '2020_12_16_102935_create_page_content_relation_table', 30);

-- --------------------------------------------------------

--
-- Table structure for table `objectives`
--

CREATE TABLE `objectives` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `objectives`
--

INSERT INTO `objectives` (`id`, `title`, `icon`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'art ar', 'objectives/doctor.jpg', '2020-12-10 11:11:42', '2020-12-10 11:11:42', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
(3, 1, 'من نحن', 'e', '<p>محتوي عربي</p>', 'pages/December2020/0Ve6olKx9HGrJc9bfZYL.png', 'lk', 'ميتا', 'ميتا', 'ACTIVE', '2020-12-16 08:40:32', '2020-12-16 12:38:55'),
(4, 1, 'الرئسيه', 'نبذة مختصرة عن الرئسيه', '', 'pages/December2020/IsyhU0ZzRqIMthG3qUtS.png', 'الرئسيه', 'ميتا بالعربي', 'الرئسيه,مستشفي الموسي,اختر طبيبك', 'ACTIVE', '2020-12-16 11:11:02', '2020-12-16 11:56:51'),
(5, 1, 'الخدمات', 'نبذة مختصرة عربي', '<p>محتوي الصفحة عربي</p>', NULL, 'خدمات', 'ميتا عربي', 'خدمات', 'ACTIVE', '2020-12-16 14:11:06', '2020-12-16 14:11:06');

-- --------------------------------------------------------

--
-- Table structure for table `page_contents`
--

CREATE TABLE `page_contents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `page_contents`
--

INSERT INTO `page_contents` (`id`, `title`, `content`, `image`, `created_at`, `updated_at`, `deleted_at`, `name`) VALUES
(1, 'لماذا مستشفي موسي', '<p>محتوي بالعربي</p>', NULL, '2020-12-16 08:23:00', '2020-12-16 08:52:39', NULL, 'why moosa block'),
(2, 'مرحبا بك في مستشفي الموسي ', '<p>المحتوي عربي</p>', NULL, '2020-12-16 08:26:00', '2020-12-16 08:52:10', NULL, 'welcome to moosa block'),
(3, 'الروية', '<p>محتوي عربي</p>', NULL, '2020-12-16 13:27:00', '2020-12-16 13:28:23', NULL, 'vision');

-- --------------------------------------------------------

--
-- Table structure for table `page_content_relation`
--

CREATE TABLE `page_content_relation` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `page_id` bigint(20) UNSIGNED NOT NULL,
  `page_content_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `page_content_relation`
--

INSERT INTO `page_content_relation` (`id`, `page_id`, `page_content_id`) VALUES
(1, 2, 1),
(2, 2, 2),
(3, 4, 1),
(4, 4, 2),
(5, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `participating_groups`
--

CREATE TABLE `participating_groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `participating_groups`
--

INSERT INTO `participating_groups` (`id`, `title`, `image`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'participAting group ar', 'participating-groups/doctor.jpg', NULL, '2020-12-10 11:12:30', '2020-12-10 11:12:30');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `patient_guide_categories`
--

CREATE TABLE `patient_guide_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bg_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bg_color` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `patient_guide_categories`
--

INSERT INTO `patient_guide_categories` (`id`, `category_name`, `bg_image`, `bg_color`, `created_at`, `updated_at`) VALUES
(1, 'للزائرين', 'patient-guide-categories/November2020/PGrmJlOdSeD6Eta8VNzo.png', '#bd3d3d', '2020-11-24 07:17:00', '2020-11-24 07:18:11'),
(2, 'للمرضي', 'patient-guide-categories/November2020/UWN22xoOlWwNt1Sk7tcJ.png', '#00ff1c', '2020-11-24 08:44:00', '2020-12-04 21:01:50');

-- --------------------------------------------------------

--
-- Table structure for table `patient_guids`
--

CREATE TABLE `patient_guids` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `patient_guide_category_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `patient_guids`
--

INSERT INTO `patient_guids` (`id`, `content`, `created_at`, `updated_at`, `patient_guide_category_id`, `title`) VALUES
(1, '<p style=\"margin-right: 20px; line-height: 19px; text-align: right;\"><strong>وثيقة حقوق ومسؤوليات المريض والأسرة</strong><br /><br />كونك مريضًا مهمًا في مستشفى الموسى التخصصي (ASH) ، تتمتع أنت وعائلتك بالحقوق التالية:<br /><br />(تُمنح حقوق الأطفال وكبار السن والمرضى غير القادرين على ممارسة حقوقهم لأسرهم / أولياء أمورهم):<br /><br />لديك الحق في فهم واستخدام جميع حقوقك: (ستتلقى نسخة مكتوبة من هذه الحقوق من مكتب الاستقبال أو مكتب التسجيل أو طاقم التمريض). إذا لم تفهمها لأي سبب من الأسباب ، يرجى الاتصال بمكتب علاقات المرضى وطلب المساعدة بما في ذلك المترجم الفوري.</p>', '2020-11-24 08:43:00', '2020-11-24 08:47:24', 2, 'حقوق المريض والأسرة'),
(2, '<div class=\"main-content\">\n<div class=\"container\">\n<div class=\"row\">\n<div class=\"col-md-12\">\n<div class=\"page-content\">\n<div class=\"doc-sec-content\">\n<p>يؤمن مستشفى الموسى التخصصي بأهمية دعم و مشاركة الأسرة والأصدقاء في عملية شفاء المريض ويقدر مدى أهمية تحديد أوقات لزيارة المرضى كأداة للمساعدة في تحقيق ذلك.</p>\n<p>&nbsp;</p>\n<p><strong>مواعيد زيارة المرضى:</strong></p>\n<p>من الساعة 12 ظهراً إلى 1 ظهراً</p>\n<p>و من الساعة 6 مساءً إلى 7 مساءً</p>\n</div>\n<p>&nbsp;</p>\n<div class=\"doc-sec-content\">\n<p><strong>لا يوجد زيارات للعناية المركزة</strong></p>\n</div>\n<div style=\"text-align: center;\"><a href=\"https://almoosahospital.org/ar/visiting-hours-policies/%d8%b3%d9%8a%d8%a7%d8%b3%d8%a9-%d8%a7%d9%84%d8%b2%d9%8a%d8%a7%d8%b1%d8%a7%d8%aa-%d9%84%d9%80-%d8%a7%d9%84%d8%b2%d8%a7%d8%a6%d8%b1-%d9%88%d8%a7%d9%84%d8%a3%d8%b3%d8%b1%d8%a9-%d9%88%d8%b4/\"><strong><span style=\"font-size: 14pt;\">إضغط هنا لمشاهدة سياسة الزيارات لـ &ldquo;الزائر والأسرة وشريك الرعاية&rdquo; خلال جائحة كورونا</span></strong></a></div>\n</div>\n</div>\n</div>\n</div>\n</div>', '2020-11-29 09:52:00', '2020-12-01 16:25:53', 1, 'ساعات الزيارة');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2020-11-18 19:17:19', '2020-11-18 19:17:19'),
(2, 'browse_bread', NULL, '2020-11-18 19:17:20', '2020-11-18 19:17:20'),
(3, 'browse_database', NULL, '2020-11-18 19:17:20', '2020-11-18 19:17:20'),
(4, 'browse_media', NULL, '2020-11-18 19:17:20', '2020-11-18 19:17:20'),
(5, 'browse_compass', NULL, '2020-11-18 19:17:20', '2020-11-18 19:17:20'),
(6, 'browse_menus', 'menus', '2020-11-18 19:17:20', '2020-11-18 19:17:20'),
(7, 'read_menus', 'menus', '2020-11-18 19:17:20', '2020-11-18 19:17:20'),
(8, 'edit_menus', 'menus', '2020-11-18 19:17:20', '2020-11-18 19:17:20'),
(9, 'add_menus', 'menus', '2020-11-18 19:17:20', '2020-11-18 19:17:20'),
(10, 'delete_menus', 'menus', '2020-11-18 19:17:21', '2020-11-18 19:17:21'),
(11, 'browse_roles', 'roles', '2020-11-18 19:17:21', '2020-11-18 19:17:21'),
(12, 'read_roles', 'roles', '2020-11-18 19:17:21', '2020-11-18 19:17:21'),
(13, 'edit_roles', 'roles', '2020-11-18 19:17:21', '2020-11-18 19:17:21'),
(14, 'add_roles', 'roles', '2020-11-18 19:17:21', '2020-11-18 19:17:21'),
(15, 'delete_roles', 'roles', '2020-11-18 19:17:21', '2020-11-18 19:17:21'),
(16, 'browse_users', 'users', '2020-11-18 19:17:21', '2020-11-18 19:17:21'),
(17, 'read_users', 'users', '2020-11-18 19:17:21', '2020-11-18 19:17:21'),
(18, 'edit_users', 'users', '2020-11-18 19:17:21', '2020-11-18 19:17:21'),
(19, 'add_users', 'users', '2020-11-18 19:17:21', '2020-11-18 19:17:21'),
(20, 'delete_users', 'users', '2020-11-18 19:17:21', '2020-11-18 19:17:21'),
(21, 'browse_settings', 'settings', '2020-11-18 19:17:21', '2020-11-18 19:17:21'),
(22, 'read_settings', 'settings', '2020-11-18 19:17:21', '2020-11-18 19:17:21'),
(23, 'edit_settings', 'settings', '2020-11-18 19:17:21', '2020-11-18 19:17:21'),
(24, 'add_settings', 'settings', '2020-11-18 19:17:21', '2020-11-18 19:17:21'),
(25, 'delete_settings', 'settings', '2020-11-18 19:17:21', '2020-11-18 19:17:21'),
(26, 'browse_categories', 'categories', '2020-11-18 19:17:28', '2020-11-18 19:17:28'),
(27, 'read_categories', 'categories', '2020-11-18 19:17:28', '2020-11-18 19:17:28'),
(28, 'edit_categories', 'categories', '2020-11-18 19:17:28', '2020-11-18 19:17:28'),
(29, 'add_categories', 'categories', '2020-11-18 19:17:29', '2020-11-18 19:17:29'),
(30, 'delete_categories', 'categories', '2020-11-18 19:17:29', '2020-11-18 19:17:29'),
(31, 'browse_posts', 'posts', '2020-11-18 19:17:30', '2020-11-18 19:17:30'),
(32, 'read_posts', 'posts', '2020-11-18 19:17:30', '2020-11-18 19:17:30'),
(33, 'edit_posts', 'posts', '2020-11-18 19:17:30', '2020-11-18 19:17:30'),
(34, 'add_posts', 'posts', '2020-11-18 19:17:30', '2020-11-18 19:17:30'),
(35, 'delete_posts', 'posts', '2020-11-18 19:17:30', '2020-11-18 19:17:30'),
(36, 'browse_pages', 'pages', '2020-11-18 19:17:32', '2020-11-18 19:17:32'),
(37, 'read_pages', 'pages', '2020-11-18 19:17:32', '2020-11-18 19:17:32'),
(38, 'edit_pages', 'pages', '2020-11-18 19:17:32', '2020-11-18 19:17:32'),
(39, 'add_pages', 'pages', '2020-11-18 19:17:32', '2020-11-18 19:17:32'),
(40, 'delete_pages', 'pages', '2020-11-18 19:17:32', '2020-11-18 19:17:32'),
(41, 'browse_hooks', NULL, '2020-11-18 19:17:36', '2020-11-18 19:17:36'),
(47, 'browse_testimonials', 'testimonials', '2020-11-20 20:34:48', '2020-11-20 20:34:48'),
(48, 'read_testimonials', 'testimonials', '2020-11-20 20:34:48', '2020-11-20 20:34:48'),
(49, 'edit_testimonials', 'testimonials', '2020-11-20 20:34:48', '2020-11-20 20:34:48'),
(50, 'add_testimonials', 'testimonials', '2020-11-20 20:34:49', '2020-11-20 20:34:49'),
(51, 'delete_testimonials', 'testimonials', '2020-11-20 20:34:49', '2020-11-20 20:34:49'),
(67, 'browse_patient_guide_categories', 'patient_guide_categories', '2020-11-24 07:09:08', '2020-11-24 07:09:08'),
(68, 'read_patient_guide_categories', 'patient_guide_categories', '2020-11-24 07:09:08', '2020-11-24 07:09:08'),
(69, 'edit_patient_guide_categories', 'patient_guide_categories', '2020-11-24 07:09:08', '2020-11-24 07:09:08'),
(70, 'add_patient_guide_categories', 'patient_guide_categories', '2020-11-24 07:09:08', '2020-11-24 07:09:08'),
(71, 'delete_patient_guide_categories', 'patient_guide_categories', '2020-11-24 07:09:08', '2020-11-24 07:09:08'),
(72, 'browse_patient_guids', 'patient_guids', '2020-11-24 08:33:46', '2020-11-24 08:33:46'),
(73, 'read_patient_guids', 'patient_guids', '2020-11-24 08:33:46', '2020-11-24 08:33:46'),
(74, 'edit_patient_guids', 'patient_guids', '2020-11-24 08:33:46', '2020-11-24 08:33:46'),
(75, 'add_patient_guids', 'patient_guids', '2020-11-24 08:33:46', '2020-11-24 08:33:46'),
(76, 'delete_patient_guids', 'patient_guids', '2020-11-24 08:33:46', '2020-11-24 08:33:46'),
(82, 'browse_doctors', 'doctors', '2020-11-30 14:09:52', '2020-11-30 14:09:52'),
(83, 'read_doctors', 'doctors', '2020-11-30 14:09:52', '2020-11-30 14:09:52'),
(84, 'edit_doctors', 'doctors', '2020-11-30 14:09:52', '2020-11-30 14:09:52'),
(85, 'add_doctors', 'doctors', '2020-11-30 14:09:52', '2020-11-30 14:09:52'),
(86, 'delete_doctors', 'doctors', '2020-11-30 14:09:52', '2020-11-30 14:09:52'),
(87, 'browse_blogs', 'blogs', '2020-12-01 11:41:14', '2020-12-01 11:41:14'),
(88, 'read_blogs', 'blogs', '2020-12-01 11:41:14', '2020-12-01 11:41:14'),
(89, 'edit_blogs', 'blogs', '2020-12-01 11:41:14', '2020-12-01 11:41:14'),
(90, 'add_blogs', 'blogs', '2020-12-01 11:41:14', '2020-12-01 11:41:14'),
(91, 'delete_blogs', 'blogs', '2020-12-01 11:41:14', '2020-12-01 11:41:14'),
(92, 'browse_blog_tags', 'blog_tags', '2020-12-01 11:45:59', '2020-12-01 11:45:59'),
(93, 'read_blog_tags', 'blog_tags', '2020-12-01 11:45:59', '2020-12-01 11:45:59'),
(94, 'edit_blog_tags', 'blog_tags', '2020-12-01 11:45:59', '2020-12-01 11:45:59'),
(95, 'add_blog_tags', 'blog_tags', '2020-12-01 11:45:59', '2020-12-01 11:45:59'),
(96, 'delete_blog_tags', 'blog_tags', '2020-12-01 11:45:59', '2020-12-01 11:45:59'),
(97, 'browse_blog_categories', 'blog_categories', '2020-12-01 11:47:27', '2020-12-01 11:47:27'),
(98, 'read_blog_categories', 'blog_categories', '2020-12-01 11:47:27', '2020-12-01 11:47:27'),
(99, 'edit_blog_categories', 'blog_categories', '2020-12-01 11:47:27', '2020-12-01 11:47:27'),
(100, 'add_blog_categories', 'blog_categories', '2020-12-01 11:47:27', '2020-12-01 11:47:27'),
(101, 'delete_blog_categories', 'blog_categories', '2020-12-01 11:47:27', '2020-12-01 11:47:27'),
(102, 'browse_hakeem_magazines', 'hakeem_magazines', '2020-12-02 05:27:17', '2020-12-02 05:27:17'),
(103, 'read_hakeem_magazines', 'hakeem_magazines', '2020-12-02 05:27:17', '2020-12-02 05:27:17'),
(104, 'edit_hakeem_magazines', 'hakeem_magazines', '2020-12-02 05:27:17', '2020-12-02 05:27:17'),
(105, 'add_hakeem_magazines', 'hakeem_magazines', '2020-12-02 05:27:17', '2020-12-02 05:27:17'),
(106, 'delete_hakeem_magazines', 'hakeem_magazines', '2020-12-02 05:27:17', '2020-12-02 05:27:17'),
(107, 'browse_photo_galleries', 'photo_galleries', '2020-12-02 06:06:44', '2020-12-02 06:06:44'),
(108, 'read_photo_galleries', 'photo_galleries', '2020-12-02 06:06:44', '2020-12-02 06:06:44'),
(109, 'edit_photo_galleries', 'photo_galleries', '2020-12-02 06:06:44', '2020-12-02 06:06:44'),
(110, 'add_photo_galleries', 'photo_galleries', '2020-12-02 06:06:44', '2020-12-02 06:06:44'),
(111, 'delete_photo_galleries', 'photo_galleries', '2020-12-02 06:06:44', '2020-12-02 06:06:44'),
(112, 'browse_video_galleries', 'video_galleries', '2020-12-02 07:15:40', '2020-12-02 07:15:40'),
(113, 'read_video_galleries', 'video_galleries', '2020-12-02 07:15:40', '2020-12-02 07:15:40'),
(114, 'edit_video_galleries', 'video_galleries', '2020-12-02 07:15:40', '2020-12-02 07:15:40'),
(115, 'add_video_galleries', 'video_galleries', '2020-12-02 07:15:40', '2020-12-02 07:15:40'),
(116, 'delete_video_galleries', 'video_galleries', '2020-12-02 07:15:40', '2020-12-02 07:15:40'),
(117, 'browse_events', 'events', '2020-12-04 16:07:39', '2020-12-04 16:07:39'),
(118, 'read_events', 'events', '2020-12-04 16:07:39', '2020-12-04 16:07:39'),
(119, 'edit_events', 'events', '2020-12-04 16:07:39', '2020-12-04 16:07:39'),
(120, 'add_events', 'events', '2020-12-04 16:07:39', '2020-12-04 16:07:39'),
(121, 'delete_events', 'events', '2020-12-04 16:07:39', '2020-12-04 16:07:39'),
(122, 'browse_event_categories', 'event_categories', '2020-12-04 16:58:04', '2020-12-04 16:58:04'),
(123, 'read_event_categories', 'event_categories', '2020-12-04 16:58:04', '2020-12-04 16:58:04'),
(124, 'edit_event_categories', 'event_categories', '2020-12-04 16:58:04', '2020-12-04 16:58:04'),
(125, 'add_event_categories', 'event_categories', '2020-12-04 16:58:04', '2020-12-04 16:58:04'),
(126, 'delete_event_categories', 'event_categories', '2020-12-04 16:58:04', '2020-12-04 16:58:04'),
(127, 'browse_event_attendances', 'event_attendances', '2020-12-04 19:18:50', '2020-12-04 19:18:50'),
(128, 'read_event_attendances', 'event_attendances', '2020-12-04 19:18:50', '2020-12-04 19:18:50'),
(129, 'edit_event_attendances', 'event_attendances', '2020-12-04 19:18:50', '2020-12-04 19:18:50'),
(130, 'add_event_attendances', 'event_attendances', '2020-12-04 19:18:50', '2020-12-04 19:18:50'),
(131, 'delete_event_attendances', 'event_attendances', '2020-12-04 19:18:50', '2020-12-04 19:18:50'),
(132, 'browse_event_timelines', 'event_timelines', '2020-12-04 19:57:53', '2020-12-04 19:57:53'),
(133, 'read_event_timelines', 'event_timelines', '2020-12-04 19:57:53', '2020-12-04 19:57:53'),
(134, 'edit_event_timelines', 'event_timelines', '2020-12-04 19:57:53', '2020-12-04 19:57:53'),
(135, 'add_event_timelines', 'event_timelines', '2020-12-04 19:57:53', '2020-12-04 19:57:53'),
(136, 'delete_event_timelines', 'event_timelines', '2020-12-04 19:57:53', '2020-12-04 19:57:53'),
(137, 'browse_service_categories', 'service_categories', '2020-12-07 14:31:58', '2020-12-07 14:31:58'),
(138, 'read_service_categories', 'service_categories', '2020-12-07 14:31:59', '2020-12-07 14:31:59'),
(139, 'edit_service_categories', 'service_categories', '2020-12-07 14:31:59', '2020-12-07 14:31:59'),
(140, 'add_service_categories', 'service_categories', '2020-12-07 14:31:59', '2020-12-07 14:31:59'),
(141, 'delete_service_categories', 'service_categories', '2020-12-07 14:31:59', '2020-12-07 14:31:59'),
(142, 'browse_services', 'services', '2020-12-07 14:44:28', '2020-12-07 14:44:28'),
(143, 'read_services', 'services', '2020-12-07 14:44:28', '2020-12-07 14:44:28'),
(144, 'edit_services', 'services', '2020-12-07 14:44:28', '2020-12-07 14:44:28'),
(145, 'add_services', 'services', '2020-12-07 14:44:28', '2020-12-07 14:44:28'),
(146, 'delete_services', 'services', '2020-12-07 14:44:28', '2020-12-07 14:44:28'),
(147, 'browse_service_sections', 'service_sections', '2020-12-07 14:56:03', '2020-12-07 14:56:03'),
(148, 'read_service_sections', 'service_sections', '2020-12-07 14:56:03', '2020-12-07 14:56:03'),
(149, 'edit_service_sections', 'service_sections', '2020-12-07 14:56:03', '2020-12-07 14:56:03'),
(150, 'add_service_sections', 'service_sections', '2020-12-07 14:56:03', '2020-12-07 14:56:03'),
(151, 'delete_service_sections', 'service_sections', '2020-12-07 14:56:03', '2020-12-07 14:56:03'),
(152, 'browse_service_section_items', 'service_section_items', '2020-12-07 15:09:30', '2020-12-07 15:09:30'),
(153, 'read_service_section_items', 'service_section_items', '2020-12-07 15:09:30', '2020-12-07 15:09:30'),
(154, 'edit_service_section_items', 'service_section_items', '2020-12-07 15:09:30', '2020-12-07 15:09:30'),
(155, 'add_service_section_items', 'service_section_items', '2020-12-07 15:09:30', '2020-12-07 15:09:30'),
(156, 'delete_service_section_items', 'service_section_items', '2020-12-07 15:09:30', '2020-12-07 15:09:30'),
(157, 'browse_communities', 'communities', '2020-12-09 14:19:29', '2020-12-09 14:19:29'),
(158, 'read_communities', 'communities', '2020-12-09 14:19:29', '2020-12-09 14:19:29'),
(159, 'edit_communities', 'communities', '2020-12-09 14:19:29', '2020-12-09 14:19:29'),
(160, 'add_communities', 'communities', '2020-12-09 14:19:29', '2020-12-09 14:19:29'),
(161, 'delete_communities', 'communities', '2020-12-09 14:19:29', '2020-12-09 14:19:29'),
(162, 'browse_community_contents', 'community_contents', '2020-12-09 14:31:39', '2020-12-09 14:31:39'),
(163, 'read_community_contents', 'community_contents', '2020-12-09 14:31:39', '2020-12-09 14:31:39'),
(164, 'edit_community_contents', 'community_contents', '2020-12-09 14:31:39', '2020-12-09 14:31:39'),
(165, 'add_community_contents', 'community_contents', '2020-12-09 14:31:39', '2020-12-09 14:31:39'),
(166, 'delete_community_contents', 'community_contents', '2020-12-09 14:31:39', '2020-12-09 14:31:39'),
(167, 'browse_objectives', 'objectives', '2020-12-10 09:46:27', '2020-12-10 09:46:27'),
(168, 'read_objectives', 'objectives', '2020-12-10 09:46:27', '2020-12-10 09:46:27'),
(169, 'edit_objectives', 'objectives', '2020-12-10 09:46:27', '2020-12-10 09:46:27'),
(170, 'add_objectives', 'objectives', '2020-12-10 09:46:27', '2020-12-10 09:46:27'),
(171, 'delete_objectives', 'objectives', '2020-12-10 09:46:27', '2020-12-10 09:46:27'),
(172, 'browse_participating_groups', 'participating_groups', '2020-12-10 09:52:56', '2020-12-10 09:52:56'),
(173, 'read_participating_groups', 'participating_groups', '2020-12-10 09:52:56', '2020-12-10 09:52:56'),
(174, 'edit_participating_groups', 'participating_groups', '2020-12-10 09:52:56', '2020-12-10 09:52:56'),
(175, 'add_participating_groups', 'participating_groups', '2020-12-10 09:52:56', '2020-12-10 09:52:56'),
(176, 'delete_participating_groups', 'participating_groups', '2020-12-10 09:52:56', '2020-12-10 09:52:56'),
(177, 'browse_page_contents', 'page_contents', '2020-12-13 12:29:47', '2020-12-13 12:29:47'),
(178, 'read_page_contents', 'page_contents', '2020-12-13 12:29:47', '2020-12-13 12:29:47'),
(179, 'edit_page_contents', 'page_contents', '2020-12-13 12:29:47', '2020-12-13 12:29:47'),
(180, 'add_page_contents', 'page_contents', '2020-12-13 12:29:47', '2020-12-13 12:29:47'),
(181, 'delete_page_contents', 'page_contents', '2020-12-13 12:29:47', '2020-12-13 12:29:47');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(47, 1),
(47, 2),
(48, 1),
(48, 2),
(49, 1),
(49, 2),
(50, 1),
(51, 1),
(67, 1),
(68, 1),
(69, 1),
(70, 1),
(71, 1),
(72, 1),
(73, 1),
(74, 1),
(75, 1),
(76, 1),
(82, 1),
(83, 1),
(84, 1),
(85, 1),
(86, 1),
(87, 1),
(88, 1),
(89, 1),
(90, 1),
(91, 1),
(92, 1),
(93, 1),
(94, 1),
(95, 1),
(96, 1),
(97, 1),
(98, 1),
(99, 1),
(100, 1),
(101, 1),
(102, 1),
(103, 1),
(104, 1),
(105, 1),
(106, 1),
(107, 1),
(108, 1),
(109, 1),
(110, 1),
(111, 1),
(112, 1),
(113, 1),
(114, 1),
(115, 1),
(116, 1),
(117, 1),
(118, 1),
(119, 1),
(120, 1),
(121, 1),
(122, 1),
(123, 1),
(124, 1),
(125, 1),
(126, 1),
(127, 1),
(128, 1),
(129, 1),
(130, 1),
(131, 1),
(132, 1),
(133, 1),
(134, 1),
(135, 1),
(136, 1),
(137, 1),
(138, 1),
(139, 1),
(140, 1),
(141, 1),
(142, 1),
(143, 1),
(144, 1),
(145, 1),
(146, 1),
(147, 1),
(148, 1),
(149, 1),
(150, 1),
(151, 1),
(152, 1),
(153, 1),
(154, 1),
(155, 1),
(156, 1),
(157, 1),
(158, 1),
(159, 1),
(160, 1),
(161, 1),
(162, 1),
(163, 1),
(164, 1),
(165, 1),
(166, 1),
(167, 1),
(168, 1),
(169, 1),
(170, 1),
(171, 1),
(172, 1),
(173, 1),
(174, 1),
(175, 1),
(176, 1),
(177, 1),
(178, 1),
(179, 1),
(180, 1),
(181, 1);

-- --------------------------------------------------------

--
-- Table structure for table `photo_galleries`
--

CREATE TABLE `photo_galleries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `images` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `photo_galleries`
--

INSERT INTO `photo_galleries` (`id`, `title`, `images`, `created_at`, `updated_at`) VALUES
(1, 'البرج الشمالي', '[\"photo-galleries/4q08qWig.jpeg\",\"photo-galleries/C5ORsx5g-scaled.jpeg\"]', '2020-12-02 06:29:00', '2020-12-04 21:00:06');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `author_id`, `category_id`, `title`, `seo_title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `featured`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'تبخستبخسب هب تسخبسخ ', '', 'This is the excerpt for the Lorem Ipsum Post', '<p>This is the body of the lorem ipsum post</p>', 'posts/November2020/t8Dv9zZIktNhvo1ptTux.png', 'tbkhstbkhsb-hb-tskhbskh', 'This is the meta description', 'keyword1, keyword2, keyword3', 'DRAFT', 0, '2020-11-18 19:17:31', '2020-12-01 10:20:20'),
(2, 1, 1, 'My Sample Postbgfj', '', 'This is the excerpt for the sample Post', '<p>This is the body for the sample pos</p>\n<p style=\"padding-left: 80px;\"><img style=\"float: left;\" src=\"http://localhost:8000/storage/posts/December2020/doctor.jpg\" alt=\"\" width=\"200\" height=\"227\" />kyh</p>\n<p>t, which includes the body.</p>\n<h2>We can use all kinds of form</h2>\n<h2>at!</h2>\n<p>And include a bunch of other stuff</p>\n<p>dgdgdgdgd</p>\n<p>hkfhshogh dhvdoighoi</p>', 'posts/post2.jpg', 'my-sample-postbgfj', 'Meta Description for sample post', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2020-11-18 19:17:31', '2020-12-01 10:16:40'),
(3, 0, NULL, 'Latest Post', NULL, 'This is the excerpt for the latest post', '<p>This is the body for the latest post</p>', 'posts/post3.jpg', 'latest-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2020-11-18 19:17:31', '2020-11-18 19:17:31'),
(4, 0, NULL, 'Yarr Post', NULL, 'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.', '<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>', 'posts/post4.jpg', 'yarr-post', 'this be a meta descript', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2020-11-18 19:17:31', '2020-11-18 19:17:31');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2020-11-18 19:17:19', '2020-11-18 19:17:19'),
(2, 'user', 'Normal User', '2020-11-18 19:17:19', '2020-11-18 19:17:19');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `service_category_id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `service_category_id`, `slug`, `title`, `excerpt`, `content`, `icon`, `color`, `thumbnail`, `image`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 2, 'test-ar-jkk', 'test ar jkk ', '<p>nj</p>', '<p>k</p>', 'services/December2020/qup2XPqJZCUVC3svFZDg.jpg', '#000000', 'services/doctor1.jpg', 'services/doctor1.jpg', NULL, '2020-12-07 16:33:00', '2020-12-13 12:01:57'),
(2, 2, 'shshy', 'ششي', '<p>ؤشؤ</p>', '<p>ؤش</p>', 'services/December2020/G3KHCBBWlENKNMWCiWU6.jpg', '#ca2727', 'services/doctor1.jpg', 'services/November2020/WxvmJ3GgPocglALeJS1L.png', NULL, '2020-12-08 07:11:00', '2020-12-13 12:01:42');

-- --------------------------------------------------------

--
-- Table structure for table `services_physicians_relation`
--

CREATE TABLE `services_physicians_relation` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `service_id` bigint(20) UNSIGNED NOT NULL,
  `doctor_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `services_physicians_relation`
--

INSERT INTO `services_physicians_relation` (`id`, `service_id`, `doctor_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(2, 1, 2, NULL, NULL),
(3, 2, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `service_categories`
--

CREATE TABLE `service_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `service_categories`
--

INSERT INTO `service_categories` (`id`, `title`, `slug`, `color`, `thumbnail`, `image`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'برامج طبيه', 'medical-programs', '#61c6f5', 'service-categories/December2020/zwRdG5J5yChyshQ5R8Gm.jpg', 'service-categories/December2020/7vUYEsbk9q2Tz2OL9B81.jpg', NULL, '2020-12-07 16:22:00', '2020-12-16 14:57:24'),
(2, 'المراكز الطبيه', 'medical-centers', '#bc9d9d', 'service-categories/December2020/6uOSpaSfB2P8bGTkxToE.jpg', 'service-categories/December2020/Cf7H0sWrdSLutNi0ep2Q.jpg', NULL, '2020-12-09 14:45:00', '2020-12-13 11:59:05');

-- --------------------------------------------------------

--
-- Table structure for table `service_sections`
--

CREATE TABLE `service_sections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `service_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `service_sections`
--

INSERT INTO `service_sections` (`id`, `title`, `color`, `icon`, `service_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'consultant cardiologist', '#ee2121', NULL, 1, NULL, '2020-12-08 06:53:28', '2020-12-08 06:53:28'),
(2, 'غقعغ', '#d30f0f', NULL, 1, NULL, '2020-12-08 07:14:46', '2020-12-08 07:14:46');

-- --------------------------------------------------------

--
-- Table structure for table `service_section_items`
--

CREATE TABLE `service_section_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `section_id` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `service_section_items`
--

INSERT INTO `service_section_items` (`id`, `title`, `content`, `section_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Day 17', '<p>dnjnjknk</p>', 1, NULL, '2020-12-08 12:03:00', '2020-12-09 09:00:59'),
(6, 'نمءةرنرمؤء', '<p>knfjsndfsjs</p>', 1, NULL, '2020-12-09 10:10:00', '2020-12-10 07:46:58');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'Moosa Hospital', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Site Description', '', 'text', 3, 'Site'),
(3, 'site.logo', 'Site Logo', 'settings/December2020/VteqQZtEsgyjMSObyorn.jpg', '', 'image', 23, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', NULL, '', 'text', 24, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', '', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'Moosa HospitalAdmin', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Welcome to Voyager. The Missing Admin for Laravel', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', '', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', 'AIzaSyD5Fk-uLeoP4ij79Z2G9LbhfOGq65ifEtY', '', 'text', 1, 'Admin'),
(11, 'hospital.single_bed', 'Single Bed', '2541', NULL, 'text', 6, 'hospital'),
(12, 'hospital.doctor', 'Doctor', '5521', NULL, 'text', 7, 'hospital'),
(13, 'hospital.surgery', 'Surgery', '56362', NULL, 'text', 8, 'hospital'),
(14, 'hospital.patients', 'Patients', '8451', NULL, 'text', 9, 'hospital'),
(15, 'contact-us.addess', 'Address', 'الظهران|حي الفيصل الحساء ص. المربع 5098 المنطقة الشرقية |المملكة السعوديه', NULL, 'text', 10, 'Contact Us'),
(16, 'contact-us.location_url', 'Location URL', 'https://map.com', NULL, 'text', 12, 'Contact Us'),
(17, 'contact-us.emergency_number', 'Emergency Number', '00925412541', NULL, 'text', 13, 'Contact Us'),
(18, 'contact-us.contact_phone', 'Contact Phone', '0125558454', NULL, 'text', 14, 'Contact Us'),
(19, 'contact-us.conact_email', 'Contact Email', 'info@moosahospital.com', NULL, 'text', 26, 'Contact Us'),
(20, 'footer.wellcome_title', 'Wellcome Title', 'welcome to alMoosa hospital ar', NULL, 'text', 15, 'Footer'),
(21, 'footer.wellcome_content', 'Wellcome Content', 'welcome msg ar', NULL, 'text_area', 16, 'Footer'),
(22, 'footer.facebook', 'Facebook URL', 'https://facebook.com', '{\r\n    \"validation\":{\r\n        \"rule\":\"url\",\r\n        \"messages\":{\r\n            \"url\":\"please write valid url\"\r\n        }\r\n    }\r\n}', 'text', 17, 'Footer'),
(23, 'footer.twitter_url', 'Twitter URL', NULL, '{\r\n    \"validation\":{\r\n        \"rule\":\"url\",\r\n        \"messages\":{\r\n            \"url\":\"please write valid url\"\r\n        }\r\n    }\r\n}', 'text', 18, 'Footer'),
(24, 'footer.instagram_url', 'Instagram URL', NULL, NULL, 'text', 19, 'Footer'),
(25, 'footer.linkedin_url', 'Linkedin URL', NULL, NULL, 'text', 20, 'Footer'),
(26, 'footer.youtube_url', 'YouTube URL', NULL, NULL, 'text', 21, 'Footer'),
(27, 'site.second_logo', 'Second Logo', '', NULL, 'image', 25, 'Site'),
(28, 'site.third_logo', 'Third Logo', '', NULL, 'image', 27, 'Site'),
(29, 'site.site_title_en', 'Site Title en', NULL, NULL, 'text', 2, 'Site'),
(31, 'contact-us.addess_en', 'Address en', 'address en', NULL, 'text', 11, 'Contact Us'),
(32, 'site.description_en', 'description en', NULL, NULL, 'text', 22, 'Site'),
(34, 'footer.welcome_title_en', 'Welcome Title en', 'welcome title en', NULL, 'text', 28, 'Footer'),
(35, 'footer.welcome_content_en', 'Welcome Content en', 'welcome msg en', NULL, 'text_area', 29, 'Footer');

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `patient_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dr_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `department` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `testimonials`
--

INSERT INTO `testimonials` (`id`, `body`, `patient_name`, `dr_name`, `department`, `created_at`, `updated_at`) VALUES
(1, '<p><strong>بهسبتسخب&nbsp; تخهسبست&nbsp; هتسبت ه ستخبسخبت خسبخست خب خ&nbsp;&nbsp; ب سببسب بس ب<br /></strong></p>', 'بسبقصب  ب', 'بسيصثب بس', 'سبس بس ', '2020-11-20 20:37:00', '2020-11-20 20:48:47'),
(2, '<p>ckjdkdks k sdjksndjksa sjd askd ds</p>', 'njkcd', 'kds', 'nsjd', '2020-11-22 13:13:00', '2020-12-04 20:53:34');

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `translations`
--

INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
(1, 'data_types', 'display_name_singular', 5, 'pt', 'Post', '2020-11-18 19:17:32', '2020-11-18 19:17:32'),
(2, 'data_types', 'display_name_singular', 6, 'pt', 'Página', '2020-11-18 19:17:32', '2020-11-18 19:17:32'),
(3, 'data_types', 'display_name_singular', 1, 'pt', 'Utilizador', '2020-11-18 19:17:33', '2020-11-18 19:17:33'),
(4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2020-11-18 19:17:33', '2020-11-18 19:17:33'),
(5, 'data_types', 'display_name_singular', 2, 'pt', 'Menu', '2020-11-18 19:17:33', '2020-11-18 19:17:33'),
(6, 'data_types', 'display_name_singular', 3, 'pt', 'Função', '2020-11-18 19:17:33', '2020-11-18 19:17:33'),
(7, 'data_types', 'display_name_plural', 5, 'pt', 'Posts', '2020-11-18 19:17:33', '2020-11-18 19:17:33'),
(8, 'data_types', 'display_name_plural', 6, 'pt', 'Páginas', '2020-11-18 19:17:33', '2020-11-18 19:17:33'),
(9, 'data_types', 'display_name_plural', 1, 'pt', 'Utilizadores', '2020-11-18 19:17:33', '2020-11-18 19:17:33'),
(10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2020-11-18 19:17:33', '2020-11-18 19:17:33'),
(11, 'data_types', 'display_name_plural', 2, 'pt', 'Menus', '2020-11-18 19:17:33', '2020-11-18 19:17:33'),
(12, 'data_types', 'display_name_plural', 3, 'pt', 'Funções', '2020-11-18 19:17:33', '2020-11-18 19:17:33'),
(13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2020-11-18 19:17:33', '2020-11-18 19:17:33'),
(14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2020-11-18 19:17:33', '2020-11-18 19:17:33'),
(15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2020-11-18 19:17:33', '2020-11-18 19:17:33'),
(16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2020-11-18 19:17:33', '2020-11-18 19:17:33'),
(17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2020-11-18 19:17:34', '2020-11-18 19:17:34'),
(18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2020-11-18 19:17:34', '2020-11-18 19:17:34'),
(19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2020-11-18 19:17:34', '2020-11-18 19:17:34'),
(20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2020-11-18 19:17:34', '2020-11-18 19:17:34'),
(21, 'menu_items', 'title', 2, 'pt', 'Media', '2020-11-18 19:17:34', '2020-11-18 19:17:34'),
(22, 'menu_items', 'title', 12, 'pt', 'Publicações', '2020-11-18 19:17:34', '2020-11-18 19:17:34'),
(23, 'menu_items', 'title', 3, 'pt', 'Utilizadores', '2020-11-18 19:17:34', '2020-11-18 19:17:34'),
(24, 'menu_items', 'title', 11, 'pt', 'Categorias', '2020-11-18 19:17:34', '2020-11-18 19:17:34'),
(25, 'menu_items', 'title', 13, 'pt', 'Páginas', '2020-11-18 19:17:34', '2020-11-18 19:17:34'),
(26, 'menu_items', 'title', 4, 'pt', 'Funções', '2020-11-18 19:17:34', '2020-11-18 19:17:34'),
(27, 'menu_items', 'title', 5, 'pt', 'Ferramentas', '2020-11-18 19:17:34', '2020-11-18 19:17:34'),
(28, 'menu_items', 'title', 6, 'pt', 'Menus', '2020-11-18 19:17:34', '2020-11-18 19:17:34'),
(29, 'menu_items', 'title', 7, 'pt', 'Base de dados', '2020-11-18 19:17:34', '2020-11-18 19:17:34'),
(30, 'menu_items', 'title', 10, 'pt', 'Configurações', '2020-11-18 19:17:34', '2020-11-18 19:17:34'),
(33, 'posts', 'title', 1, 'en', 'Lorem Ipsum Post', '2020-11-20 16:02:44', '2020-11-20 16:02:44'),
(34, 'posts', 'excerpt', 1, 'en', 'This is the excerpt for the Lorem Ipsum Post', '2020-11-20 16:02:44', '2020-11-20 16:02:44'),
(35, 'posts', 'body', 1, 'en', '<p>This is the body of the lorem ipsum post</p>', '2020-11-20 16:02:44', '2020-11-20 16:02:44'),
(36, 'posts', 'slug', 1, 'en', 'lorem-ipsum-post', '2020-11-20 16:02:44', '2020-11-20 16:02:44'),
(37, 'posts', 'meta_description', 1, 'en', 'This is the meta description', '2020-11-20 16:02:44', '2020-11-20 16:02:44'),
(38, 'posts', 'meta_keywords', 1, 'en', 'keyword1, keyword2, keyword3', '2020-11-20 16:02:44', '2020-11-20 16:02:44'),
(41, 'menu_items', 'title', 4, 'en', 'Roles', '2020-11-20 20:26:28', '2020-11-20 20:26:28'),
(42, 'data_rows', 'display_name', 56, 'en', 'Id', '2020-11-20 20:36:09', '2020-11-20 20:36:09'),
(43, 'data_rows', 'display_name', 57, 'en', 'Body', '2020-11-20 20:36:09', '2020-11-20 20:36:09'),
(44, 'data_rows', 'display_name', 58, 'en', 'Patient Name', '2020-11-20 20:36:09', '2020-11-20 20:36:09'),
(45, 'data_rows', 'display_name', 59, 'en', 'Dr Name', '2020-11-20 20:36:09', '2020-11-20 20:36:09'),
(46, 'data_rows', 'display_name', 60, 'en', 'Department', '2020-11-20 20:36:09', '2020-11-20 20:36:09'),
(47, 'data_rows', 'display_name', 61, 'en', 'Created At', '2020-11-20 20:36:09', '2020-11-20 20:36:09'),
(48, 'data_rows', 'display_name', 62, 'en', 'Updated At', '2020-11-20 20:36:09', '2020-11-20 20:36:09'),
(49, 'data_types', 'display_name_singular', 8, 'en', 'Testimonial', '2020-11-20 20:36:09', '2020-11-20 20:36:09'),
(50, 'data_types', 'display_name_plural', 8, 'en', 'Testimonials', '2020-11-20 20:36:09', '2020-11-20 20:36:09'),
(51, 'testimonials', 'body', 1, 'en', '<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem</p>', '2020-11-20 20:48:47', '2020-11-20 20:48:47'),
(52, 'testimonials', 'patient_name', 1, 'en', 'Helop', '2020-11-20 20:48:47', '2020-11-20 20:48:47'),
(53, 'testimonials', 'dr_name', 1, 'en', 'Dr-aziz adel', '2020-11-20 20:48:47', '2020-11-20 20:48:47'),
(54, 'testimonials', 'department', 1, 'en', 'Sersion', '2020-11-20 20:48:47', '2020-11-20 20:48:47'),
(58, 'services', 'service_name', 1, 'en', 'Medical centers', '2020-11-22 11:39:59', '2020-11-30 08:03:23'),
(61, 'testimonials', 'body', 2, 'en', '<p>knsdadk kj ck</p>', '2020-11-22 13:13:09', '2020-11-22 13:13:09'),
(62, 'testimonials', 'patient_name', 2, 'en', 'n c', '2020-11-22 13:13:09', '2020-11-22 13:13:09'),
(63, 'testimonials', 'dr_name', 2, 'en', 'd jds', '2020-11-22 13:13:09', '2020-11-22 13:13:09'),
(64, 'testimonials', 'department', 2, 'en', 'ndjs', '2020-11-22 13:13:09', '2020-11-22 13:13:09'),
(66, 'data_rows', 'display_name', 71, 'en', 'Id', '2020-11-22 13:45:20', '2020-11-22 13:45:20'),
(67, 'data_rows', 'display_name', 72, 'en', 'Image', '2020-11-22 13:45:20', '2020-11-22 13:45:20'),
(70, 'data_rows', 'display_name', 73, 'en', 'Created At', '2020-11-22 14:27:14', '2020-11-22 14:27:14'),
(71, 'data_rows', 'display_name', 74, 'en', 'Updated At', '2020-11-22 14:27:14', '2020-11-22 14:27:14'),
(72, 'patient_guide_categories', 'category_name', 1, 'en', 'For Visitors', '2020-11-24 07:17:25', '2020-11-24 07:17:25'),
(73, 'data_rows', 'display_name', 81, 'en', 'Id', '2020-11-24 08:38:35', '2020-11-24 08:38:35'),
(74, 'data_rows', 'display_name', 82, 'en', 'Content', '2020-11-24 08:38:35', '2020-11-24 08:38:35'),
(75, 'data_rows', 'display_name', 83, 'en', 'Created At', '2020-11-24 08:38:35', '2020-11-24 08:38:35'),
(76, 'data_rows', 'display_name', 84, 'en', 'Updated At', '2020-11-24 08:38:35', '2020-11-24 08:38:35'),
(77, 'data_rows', 'display_name', 85, 'en', 'Patient Guide Category', '2020-11-24 08:38:35', '2020-11-24 08:38:35'),
(78, 'data_rows', 'display_name', 86, 'en', 'Title', '2020-11-24 08:38:35', '2020-11-24 08:38:35'),
(79, 'data_rows', 'display_name', 87, 'en', 'patient_guide_categories', '2020-11-24 08:38:35', '2020-11-24 08:38:35'),
(80, 'data_types', 'display_name_singular', 16, 'en', 'Patient Guid', '2020-11-24 08:38:35', '2020-11-24 08:38:35'),
(81, 'data_types', 'display_name_plural', 16, 'en', 'Patient Guids', '2020-11-24 08:38:35', '2020-11-24 08:38:35'),
(82, 'patient_guids', 'title', 1, 'en', 'Patient and Family Rights', '2020-11-24 08:43:57', '2020-11-24 08:43:57'),
(83, 'patient_guids', 'content', 1, 'en', '<p><span style=\"font-size: 18pt;\"><strong>PATIENT AND FAMILY BILL OF RIGHTS AND RESPONSIBILITIES</strong></span></p>\n<p><strong>&nbsp;</strong></p>\n<p><strong><span style=\"font-size: 14pt;\">Being a valued patient in Almoosa Specialist Hospital (ASH), you and your family have the following Rights:</span></strong></p>\n<p>&nbsp;</p>\n<p>(Rights of Children, Old people and Patients not able to practice their rights, will be granted to their families/ guardians):</p>\n<p>&nbsp;</p>\n<ol>\n<li>You have the right to understand and use all your rights: (You will receive a written copy of these rights from the Reception, Registration Office or Nursing Staff). If, for any reason, you did not understand them, please contact Patient Relation Office asks for help including interpreter.</li>\n</ol>\n<p>&nbsp;</p>\n<ol start=\"2\">\n<li>You have the right to receive impartial care without discrimination including request for pastoral services or similar request respecting your values and spiritual I religious beliefs from all authorized hospital staff. This shall be subject to availability without interfering with other patient&rsquo;s safety, ASH work environment and without contradiction with ASH rules &amp; regulations.</li>\n</ol>\n<p>&nbsp;</p>\n<ol start=\"3\">\n<li>You have the right to receive a comprehensive Medical Care, with the aim of reaching proper diagnosis and treatment of illness and injury.</li>\n</ol>\n<p>&nbsp;</p>\n<ol start=\"4\">\n<li>You have the right to receive an immediate emergency care whenever needed with no delay.</li>\n</ol>\n<p>&nbsp;</p>\n<ol start=\"5\">\n<li>You have the right to know the identity of the physician or other practitioner responsible for your care.</li>\n</ol>\n<p>&nbsp;</p>\n<ol start=\"6\">\n<li>You have the right to receive comprehensive information in a manner you can understand (from attending physician) about the diagnosis, proposed treatment, any change in your health status and the cause of these changes. Alternative treatments, potential benefits and drawbacks to the proposed treatment, likelihood of successful treatment, possible problems related to recovery and possible results of non-treatment.</li>\n</ol>\n<p>&nbsp;</p>\n<ol start=\"7\">\n<li>You have the right to have an interpreter (if available) if the language barrier presents a problem of understanding the details of your care and the treatment provided to you.</li>\n</ol>\n<p>&nbsp;</p>\n<ol start=\"8\">\n<li>You have the right to give your written General Consent for treatment when you enter the hospital.</li>\n</ol>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<ol start=\"9\">\n<li>You have the right to give your written consent before surgical, invasive procedures, anesthesia, the use of blood and its products and any other high-risk procedures and treatments <strong><u>and for research participation</u></strong>.</li>\n</ol>\n<p>&nbsp;</p>\n<ol start=\"10\">\n<li>You have the right to receive all information that you needed before giving your consent for any proposed procedure or treatment. This information should include the benefits, available alternatives and the possible risks of the procedure or the treatment.</li>\n</ol>\n<p>&nbsp;</p>\n<ol start=\"11\">\n<li>You have the right to participate in care decisions. ASH encourages Patients, Parents or legal Guardians to participate in planning and implementing treatment with nurses and physicians to the extent they wish.</li>\n</ol>\n<p>&nbsp;</p>\n<ol start=\"12\">\n<li>You have the right to maintain your need for privacy for all examinations, procedures, clinical interviews, transport, treatments and the confidentiality of all of your information.</li>\n</ol>\n<p>&nbsp;</p>\n<ol start=\"13\">\n<li>You have the right to choose the treating physician (depending on availability). In addition to the right to reject the treating physician upon furnishing a genuine reason. Also, you have the right to ask for secondary opinion without fear of any compromise, in case of complications expected or unexpected, unsatisfied results of treatment or in making risky decision in management. <strong><u>In addition, you have the choice to have face to face consultation or virtual consultation through ASH application.</u></strong></li>\n</ol>\n<p>&nbsp;</p>\n<ol start=\"14\">\n<li>You have the right to refuse the treatment (if you would like to) and to be informed of the medical consequences due to your refusal, accordingly you will sign a form prepared to that effect and leave the hospital.</li>\n</ol>\n<p>&nbsp;</p>\n<ol start=\"15\">\n<li>You have the right to refuse examination or observation by trainee not directly responsible for your care. In such case, they should have the permission of the patient to be present during case discussion, consultation, examination and treatment.</li>\n</ol>\n<p>&nbsp;</p>\n<ol start=\"16\">\n<li>You have the right to be protected from Physical, verbal and psychological assault.</li>\n</ol>\n<p>&nbsp;</p>\n<ol start=\"17\">\n<li>You have the right to receive information from the organization that supports your choice to donate organs and other tissues. This information includes potential benefits and Risks. Call Toll free number #8001245500 and you will receive the full information that supports your choice from the Saudi Center for Organ Donation.</li>\n</ol>\n<p>&nbsp;</p>\n<ol start=\"18\">\n<li>According to Hospital Policies and Procedures, depending on availability and your health status, you have the right to have a family member or a guardian or care partner as companion (if needed). However, due to some medical reasons, certain units will not allow this such as ICU, Nursery, etc.</li>\n</ol>\n<p>&nbsp;</p>\n<ol start=\"19\">\n<li>You have the right to receive a complete explanation of the need to be transferred to another Treatment Center and all reasonable alternative to such a transfer.The</li>\n</ol>\n<p>institution to which the patient is to be transferred must accept the patient before he or she is transferred.</p>\n<p>&nbsp;</p>\n<ol start=\"20\">\n<li>You have the rights to complaint at any time through Patient Relation Office (contact internal number: 1423, mobile: 0552952660) without any fear of reprisals about the care and services you are receiving and the hospital should responds to you. Patients whether inpatients and outpatients can contact Personal Relation Office to give complaints and suggestions about services and have them addressed to the concerned department.</li>\n</ol>\n<p>&nbsp;</p>\n<ol start=\"21\">\n<li>You have the right to view your medical record under the supervision of the doctor or the medical team, who is in charge of your treatment and according to the hospital policy &amp; regulations, through the office of patient relation.</li>\n</ol>\n<p>&nbsp;</p>\n<ol start=\"22\">\n<li>The organization respects and supports patient&rsquo;s right to appropriate assessment and pain management and provides education for patients and their families about pain and pain management.</li>\n</ol>\n<p>&nbsp;</p>\n<ol start=\"23\">\n<li>ASH is committed to provide (End of life care) for the dying patient with</li>\n</ol>\n<p>Respectful and compassionate care and respects his unique needs.</p>\n<p>&nbsp;</p>\n<ol start=\"24\">\n<li>You have the right to obtain a Medical&nbsp; Reports and a&nbsp; copy&nbsp; of&nbsp; the</li>\n</ol>\n<p>Medical test results from the Medical Reports Section (if you would like to) for which the hospital at no additional charges, however this will only be applied for the 1st time for which the hospital will charge you.</p>\n<p>&nbsp;</p>\n<ol start=\"25\">\n<li>You have the right to receive an itemized bill and explanation of all charges regardless it is paid by the patient or by another source.</li>\n</ol>\n<p>&nbsp;</p>\n<ol start=\"26\">\n<li>You have the right to receive written Discharge Instructions or Plan from the nursing team. This plan will highlight treatment follow up and medical instructions of how to take care of yourself.</li>\n</ol>\n<p>&nbsp;</p>\n<p><span style=\"font-size: 14pt;\"><strong>Patients and family in the ASH, have the following responsibilities:</strong></span></p>\n<p>&nbsp;</p>\n<ol>\n<li>Respect and value the hospital rules and regulations while paying a visit or approaching for consultations.</li>\n</ol>\n<p>&nbsp;</p>\n<ol start=\"2\">\n<li>Show consideration for others and deal with other patients and staff with respect.</li>\n</ol>\n<p>&nbsp;</p>\n<ol start=\"3\">\n<li>Respect the privacy of other patients.</li>\n</ol>\n<p>&nbsp;</p>\n<ol start=\"4\">\n<li>Provide complete and accurate information about the present complaints, past illness, hospitalization, treatment, and any known sensitivity to medication and any other matter relating to your health.</li>\n</ol>\n<p>&nbsp;</p>\n<ol start=\"5\">\n<li>Follow the health care provider&rsquo;s instructions.</li>\n</ol>\n<p>&nbsp;</p>\n<ol start=\"6\">\n<li>Accept responsibility for refusing treatment or not following treatment plan even after explaining the risk of not following it.</li>\n</ol>\n<p>&nbsp;</p>\n<ol start=\"7\">\n<li>Avoid any delay in taking appointment from the appointment office.</li>\n</ol>\n<p>&nbsp;</p>\n<ol start=\"8\">\n<li>Attend the appointment on time and if you want to cancel it, inform the appointment section 48 hours in advance.</li>\n</ol>\n<p>&nbsp;</p>\n<ol start=\"9\">\n<li>Respect the priority given to the emergency cases.</li>\n</ol>\n<p>&nbsp;</p>\n<ol start=\"10\">\n<li>The patient is responsible for his role in assisting the ASH facility staff in the control of excessive noise, smoking and visitor&rsquo;s regulation and control.</li>\n</ol>\n<p>&nbsp;</p>\n<ol start=\"11\">\n<li>Ensure that financial obligations of your health care are fulfilled promptly</li>\n</ol>\n<p>(If it exists).</p>\n<p>&nbsp;</p>\n<ol start=\"12\">\n<li>Give the requested samples and make the medical checkups on time with no delay.</li>\n</ol>\n<p>&nbsp;</p>\n<ol start=\"13\">\n<li>Avoid bringing valuable personal things to the hospital since the hospital is not</li>\n</ol>\n<p>Responsible for keeping them. However, in any emergency cases and unaccompanied admissions, you will have their valuables recorded in the Patients Valuable Receipt by the nurse in the presence of the patient and manager on duty and obtained their signature as patient&rsquo;s valuable policy &amp; procedures.</p>\n<p>&nbsp;</p>\n<ol start=\"14\">\n<li>The patient and/or his/her family are responsible for being respectful of the property of ASH facility and other persons in the healthcare facility.</li>\n</ol>\n<p>&nbsp;</p>', '2020-11-24 08:43:57', '2020-11-24 08:43:57'),
(84, 'patient_guide_categories', 'category_name', 2, 'en', 'For Patient', '2020-11-24 08:45:14', '2020-11-24 08:45:14'),
(85, 'data_rows', 'display_name', 88, 'en', 'Id', '2020-11-29 09:31:25', '2020-11-29 09:31:25'),
(86, 'data_rows', 'display_name', 89, 'en', 'Title', '2020-11-29 09:31:25', '2020-11-29 09:31:25'),
(87, 'data_rows', 'display_name', 90, 'en', 'Content', '2020-11-29 09:31:25', '2020-11-29 09:31:25'),
(88, 'data_rows', 'display_name', 91, 'en', 'Created At', '2020-11-29 09:31:25', '2020-11-29 09:31:25'),
(89, 'data_rows', 'display_name', 92, 'en', 'Updated At', '2020-11-29 09:31:25', '2020-11-29 09:31:25'),
(90, 'data_rows', 'display_name', 93, 'en', 'Patient Guide Category Id', '2020-11-29 09:31:25', '2020-11-29 09:31:25'),
(91, 'data_rows', 'display_name', 94, 'en', 'patient_guide_categories', '2020-11-29 09:31:25', '2020-11-29 09:31:25'),
(94, 'visitors_guids', 'title', 1, 'en', 'Visiting Hours & Policies', '2020-11-29 09:34:49', '2020-11-29 09:34:49'),
(95, 'visitors_guids', 'content', 1, 'en', '<div class=\"main-content\">\n<div class=\"container\">\n<div class=\"row\">\n<div class=\"col-md-12\">\n<div class=\"page-content\">\n<p>AlMoosa Specialist Hospital understands that Family and Friend&rsquo;s support are important to patient&rsquo;s healing and value the Patient-Directed Visiting Hours as a tool to help achieve it.</p>\n<p>&nbsp;</p>\n<p><strong>Patient Visiting Hours:</strong></p>\n<p>From 12 pm to 1 pm</p>\n<p>And from 6 pm to 7 pm</p>\n<p>&nbsp;</p>\n<p><strong>No intensive care visits</strong></p>\n<p>&nbsp;</p>\n<p style=\"text-align: center;\"><strong><span style=\"font-size: 14pt;\"><a href=\"https://almoosahospital.org/visiting-hours-policies/visitor-family-and-care-partner-restrictions-related-to-covid-19-pandemic/\">Click Here to Read: Visitor, Family, and Care Partner Restrictions Related to COVID-19 Pandemic</a></span></strong></p>\n</div>\n</div>\n</div>\n</div>\n</div>', '2020-11-29 09:34:49', '2020-11-29 09:34:49'),
(96, 'menu_items', 'title', 20, 'en', ' Guide Categories', '2020-11-29 09:49:53', '2020-11-29 09:49:53'),
(97, 'patient_guids', 'title', 2, 'en', 'Visiting Hours & Policies', '2020-11-29 09:52:34', '2020-11-29 09:52:34'),
(98, 'patient_guids', 'content', 2, 'en', '<div class=\"main-content\">\n<div class=\"container\">\n<div class=\"row\">\n<div class=\"col-md-12\">\n<div class=\"page-content\">\n<p>AlMoosa Specialist Hospital understands that Family and Friend&rsquo;s support are important to patient&rsquo;s healing and value the Patient-Directed Visiting Hours as a tool to help achieve it.</p>\n<p>&nbsp;</p>\n<p><strong>Patient Visiting Hours:</strong></p>\n<p>From 12 pm to 1 pm</p>\n<p>And from 6 pm to 7 pm</p>\n<p>&nbsp;</p>\n<p><strong>No intensive care visits</strong></p>\n<p>&nbsp;</p>\n<p style=\"text-align: center;\"><strong><span style=\"font-size: 14pt;\"><a href=\"https://almoosahospital.org/visiting-hours-policies/visitor-family-and-care-partner-restrictions-related-to-covid-19-pandemic/\">Click Here to Read: Visitor, Family, and Care Partner Restrictions Related to COVID-19 Pandemic</a></span></strong></p>\n</div>\n</div>\n</div>\n</div>\n</div>', '2020-11-29 09:52:34', '2020-11-29 09:52:34'),
(99, 'menu_items', 'title', 23, 'en', 'Patient Guid', '2020-11-29 10:20:12', '2020-11-29 10:20:12'),
(100, 'services', 'service_name', 3, 'en', 'Medical Programs', '2020-11-30 08:06:36', '2020-11-30 08:06:36'),
(101, 'data_rows', 'display_name', 75, 'en', 'Id', '2020-11-30 12:09:25', '2020-11-30 12:09:25'),
(102, 'data_rows', 'display_name', 76, 'en', 'Category Name', '2020-11-30 12:09:25', '2020-11-30 12:09:25'),
(103, 'data_rows', 'display_name', 77, 'en', 'Image', '2020-11-30 12:09:25', '2020-11-30 12:09:25'),
(104, 'data_rows', 'display_name', 78, 'en', 'Color', '2020-11-30 12:09:25', '2020-11-30 12:09:25'),
(105, 'data_rows', 'display_name', 79, 'en', 'Created At', '2020-11-30 12:09:25', '2020-11-30 12:09:25'),
(106, 'data_rows', 'display_name', 80, 'en', 'Updated At', '2020-11-30 12:09:25', '2020-11-30 12:09:25'),
(107, 'data_types', 'display_name_singular', 15, 'en', 'Patient Guide Category', '2020-11-30 12:09:25', '2020-11-30 12:09:25'),
(108, 'data_types', 'display_name_plural', 15, 'en', 'Patient Guide Categories', '2020-11-30 12:09:25', '2020-11-30 12:09:25'),
(109, 'data_rows', 'display_name', 95, 'en', 'Id', '2020-11-30 14:25:03', '2020-11-30 14:25:03'),
(110, 'data_rows', 'display_name', 96, 'en', 'Slug', '2020-11-30 14:25:03', '2020-11-30 14:25:03'),
(111, 'data_rows', 'display_name', 97, 'en', 'Name', '2020-11-30 14:25:03', '2020-11-30 14:25:03'),
(112, 'data_rows', 'display_name', 98, 'en', 'Title', '2020-11-30 14:25:03', '2020-11-30 14:25:03'),
(113, 'data_rows', 'display_name', 99, 'en', 'Qualifications', '2020-11-30 14:25:03', '2020-11-30 14:25:03'),
(114, 'data_rows', 'display_name', 100, 'en', 'Current Positions', '2020-11-30 14:25:03', '2020-11-30 14:25:03'),
(115, 'data_rows', 'display_name', 101, 'en', 'Facebook', '2020-11-30 14:25:03', '2020-11-30 14:25:03'),
(116, 'data_rows', 'display_name', 102, 'en', 'Twitter', '2020-11-30 14:25:03', '2020-11-30 14:25:03'),
(117, 'data_rows', 'display_name', 103, 'en', 'Linkedin', '2020-11-30 14:25:03', '2020-11-30 14:25:03'),
(118, 'data_rows', 'display_name', 104, 'en', 'Website Url', '2020-11-30 14:25:03', '2020-11-30 14:25:03'),
(119, 'data_rows', 'display_name', 105, 'en', 'Whatsapp Number', '2020-11-30 14:25:03', '2020-11-30 14:25:03'),
(120, 'data_rows', 'display_name', 106, 'en', 'Image', '2020-11-30 14:25:03', '2020-11-30 14:25:03'),
(121, 'data_rows', 'display_name', 107, 'en', 'Created At', '2020-11-30 14:25:03', '2020-11-30 14:25:03'),
(122, 'data_rows', 'display_name', 108, 'en', 'Updated At', '2020-11-30 14:25:03', '2020-11-30 14:25:03'),
(123, 'data_types', 'display_name_singular', 18, 'en', 'Doctor', '2020-11-30 14:25:03', '2020-11-30 14:25:03'),
(124, 'data_types', 'display_name_plural', 18, 'en', 'Doctors', '2020-11-30 14:25:03', '2020-11-30 14:25:03'),
(125, 'doctors', 'slug', 1, 'en', 'dr-ayman-tantawy', '2020-11-30 14:35:13', '2020-11-30 14:35:13'),
(126, 'doctors', 'name', 1, 'en', 'Dr. Ayman Tantawy', '2020-11-30 14:35:13', '2020-11-30 14:35:13'),
(127, 'doctors', 'title', 1, 'en', 'Consultant Invasive Cardiologist', '2020-11-30 14:35:13', '2020-11-30 14:35:13'),
(128, 'doctors', 'qualifications', 1, 'en', '<p>&nbsp;</p>\n<table>\n<tbody>\n<tr>\n<td>&nbsp;</td>\n<td>interventional cardiology , Adult Vascular Diseases , cardiovascular medicine</td>\n</tr>\n</tbody>\n</table>', '2020-11-30 14:35:13', '2020-11-30 14:35:13'),
(129, 'doctors', 'current_positions', 1, 'en', 'interventional cardiology , Adult Vascular Diseases , cardiovascular medicine', '2020-11-30 14:35:13', '2020-11-30 14:35:13'),
(130, 'doctors', 'slug', 2, 'en', 'dr-ahmed-elmasry', '2020-11-30 14:57:53', '2020-11-30 14:57:53'),
(131, 'doctors', 'name', 2, 'en', 'Dr. Ahmed Elmasry', '2020-11-30 14:57:53', '2020-11-30 14:57:53'),
(132, 'doctors', 'title', 2, 'en', 'consultant cardiologist', '2020-11-30 14:57:53', '2020-11-30 14:57:53'),
(133, 'doctors', 'qualifications', 2, 'en', ' 	cardiology consultant  ', '2020-11-30 14:57:53', '2020-11-30 14:57:53'),
(134, 'doctors', 'current_positions', 2, 'en', ' 	cardiology consultant ', '2020-11-30 14:57:53', '2020-11-30 14:57:53'),
(135, 'categories', 'name', 1, 'en', 'Category 1', '2020-12-01 08:15:36', '2020-12-01 08:15:36'),
(136, 'categories', 'slug', 1, 'en', 'category-1', '2020-12-01 08:15:36', '2020-12-01 08:15:36'),
(137, 'posts', 'title', 2, 'en', 'My Sample Post', '2020-12-01 10:15:28', '2020-12-01 10:15:28'),
(138, 'posts', 'excerpt', 2, 'en', 'This is the excerpt for the sample Post', '2020-12-01 10:15:28', '2020-12-01 10:15:28'),
(139, 'posts', 'body', 2, 'en', '<p>This is the body for the sample post, which includes the body.</p>\n<h2>We can use all kinds of format!</h2>\n<p>And include a bunch of other stuff.</p>', '2020-12-01 10:15:28', '2020-12-01 10:15:28'),
(140, 'posts', 'slug', 2, 'en', 'my-sample-post', '2020-12-01 10:15:28', '2020-12-01 10:15:28'),
(141, 'posts', 'meta_description', 2, 'en', 'Meta Description for sample post', '2020-12-01 10:15:28', '2020-12-01 10:15:28'),
(142, 'posts', 'meta_keywords', 2, 'en', 'keyword1, keyword2, keyword3', '2020-12-01 10:15:28', '2020-12-01 10:15:28'),
(143, 'data_rows', 'display_name', 29, 'en', 'ID', '2020-12-01 10:23:28', '2020-12-01 10:23:28'),
(144, 'data_rows', 'display_name', 30, 'en', 'Author', '2020-12-01 10:23:28', '2020-12-01 10:23:28'),
(145, 'data_rows', 'display_name', 31, 'en', 'Category', '2020-12-01 10:23:28', '2020-12-01 10:23:28'),
(146, 'data_rows', 'display_name', 32, 'en', 'Title', '2020-12-01 10:23:28', '2020-12-01 10:23:28'),
(147, 'data_rows', 'display_name', 42, 'en', 'SEO Title', '2020-12-01 10:23:28', '2020-12-01 10:23:28'),
(148, 'data_rows', 'display_name', 33, 'en', 'Excerpt', '2020-12-01 10:23:28', '2020-12-01 10:23:28'),
(149, 'data_rows', 'display_name', 34, 'en', 'Body', '2020-12-01 10:23:28', '2020-12-01 10:23:28'),
(150, 'data_rows', 'display_name', 35, 'en', 'Post Image', '2020-12-01 10:23:28', '2020-12-01 10:23:28'),
(151, 'data_rows', 'display_name', 36, 'en', 'Slug', '2020-12-01 10:23:28', '2020-12-01 10:23:28'),
(152, 'data_rows', 'display_name', 37, 'en', 'Meta Description', '2020-12-01 10:23:28', '2020-12-01 10:23:28'),
(153, 'data_rows', 'display_name', 38, 'en', 'Meta Keywords', '2020-12-01 10:23:28', '2020-12-01 10:23:28'),
(154, 'data_rows', 'display_name', 39, 'en', 'Status', '2020-12-01 10:23:28', '2020-12-01 10:23:28'),
(155, 'data_rows', 'display_name', 43, 'en', 'Featured', '2020-12-01 10:23:28', '2020-12-01 10:23:28'),
(156, 'data_rows', 'display_name', 40, 'en', 'Created At', '2020-12-01 10:23:28', '2020-12-01 10:23:28'),
(157, 'data_rows', 'display_name', 41, 'en', 'Updated At', '2020-12-01 10:23:28', '2020-12-01 10:23:28'),
(158, 'data_types', 'display_name_singular', 5, 'en', 'Post', '2020-12-01 10:23:28', '2020-12-01 10:23:28'),
(159, 'data_types', 'display_name_plural', 5, 'en', 'Posts', '2020-12-01 10:23:28', '2020-12-01 10:23:28'),
(160, 'data_rows', 'display_name', 109, 'en', 'categories', '2020-12-01 11:01:23', '2020-12-01 11:01:23'),
(161, 'data_rows', 'display_name', 110, 'en', 'Id', '2020-12-01 11:53:23', '2020-12-01 11:53:23'),
(162, 'data_rows', 'display_name', 111, 'en', 'Title', '2020-12-01 11:53:23', '2020-12-01 11:53:23'),
(163, 'data_rows', 'display_name', 112, 'en', 'Slug', '2020-12-01 11:53:23', '2020-12-01 11:53:23'),
(164, 'data_rows', 'display_name', 113, 'en', 'Content', '2020-12-01 11:53:23', '2020-12-01 11:53:23'),
(165, 'data_rows', 'display_name', 114, 'en', 'Excerpt', '2020-12-01 11:53:23', '2020-12-01 11:53:23'),
(166, 'data_rows', 'display_name', 115, 'en', 'Status', '2020-12-01 11:53:23', '2020-12-01 11:53:23'),
(167, 'data_rows', 'display_name', 116, 'en', 'Image', '2020-12-01 11:53:23', '2020-12-01 11:53:23'),
(168, 'data_rows', 'display_name', 117, 'en', 'Seo Title', '2020-12-01 11:53:23', '2020-12-01 11:53:23'),
(169, 'data_rows', 'display_name', 118, 'en', 'Meta Description', '2020-12-01 11:53:23', '2020-12-01 11:53:23'),
(170, 'data_rows', 'display_name', 119, 'en', 'Meta Keywords', '2020-12-01 11:53:23', '2020-12-01 11:53:23'),
(171, 'data_rows', 'display_name', 120, 'en', 'Created At', '2020-12-01 11:53:23', '2020-12-01 11:53:23'),
(172, 'data_rows', 'display_name', 121, 'en', 'Updated At', '2020-12-01 11:53:23', '2020-12-01 11:53:23'),
(173, 'data_rows', 'display_name', 132, 'en', 'blog_categories', '2020-12-01 11:53:23', '2020-12-01 11:53:23'),
(174, 'data_types', 'display_name_singular', 19, 'en', 'Blog', '2020-12-01 11:53:23', '2020-12-01 11:53:23'),
(175, 'data_types', 'display_name_plural', 19, 'en', 'Blogs', '2020-12-01 11:53:23', '2020-12-01 11:53:23'),
(176, 'data_rows', 'display_name', 127, 'en', 'Id', '2020-12-01 12:08:58', '2020-12-01 12:08:58'),
(177, 'data_rows', 'display_name', 128, 'en', 'Category Name', '2020-12-01 12:08:58', '2020-12-01 12:08:58'),
(178, 'data_rows', 'display_name', 129, 'en', 'Slug', '2020-12-01 12:08:58', '2020-12-01 12:08:58'),
(179, 'data_rows', 'display_name', 130, 'en', 'Created At', '2020-12-01 12:08:58', '2020-12-01 12:08:58'),
(180, 'data_rows', 'display_name', 131, 'en', 'Updated At', '2020-12-01 12:08:58', '2020-12-01 12:08:58'),
(181, 'data_types', 'display_name_singular', 22, 'en', 'Blog Category', '2020-12-01 12:08:58', '2020-12-01 12:08:58'),
(182, 'data_types', 'display_name_plural', 22, 'en', 'Blog Categories', '2020-12-01 12:08:58', '2020-12-01 12:08:58'),
(183, 'data_rows', 'display_name', 122, 'en', 'Id', '2020-12-01 12:09:30', '2020-12-01 12:09:30'),
(184, 'data_rows', 'display_name', 123, 'en', 'Tag Name', '2020-12-01 12:09:30', '2020-12-01 12:09:30'),
(185, 'data_rows', 'display_name', 124, 'en', 'Slug', '2020-12-01 12:09:30', '2020-12-01 12:09:30'),
(186, 'data_rows', 'display_name', 125, 'en', 'Created At', '2020-12-01 12:09:30', '2020-12-01 12:09:30'),
(187, 'data_rows', 'display_name', 126, 'en', 'Updated At', '2020-12-01 12:09:30', '2020-12-01 12:09:30'),
(188, 'data_types', 'display_name_singular', 20, 'en', 'Tag', '2020-12-01 12:09:30', '2020-12-01 12:09:30'),
(189, 'data_types', 'display_name_plural', 20, 'en', 'Tags', '2020-12-01 12:09:30', '2020-12-01 12:09:30'),
(190, 'data_rows', 'display_name', 133, 'en', 'blog_tags', '2020-12-01 12:19:38', '2020-12-01 12:19:38'),
(191, 'blog_tags', 'tag_name', 5, 'en', 'tag5', '2020-12-01 13:30:08', '2020-12-01 13:30:08'),
(192, 'blogs', 'title', 1, 'en', 'fsfssdfs', '2020-12-01 13:30:52', '2020-12-01 13:30:52'),
(193, 'blogs', 'content', 1, 'en', '<p>blog</p>', '2020-12-01 13:30:52', '2020-12-15 12:15:42'),
(194, 'blogs', 'excerpt', 1, 'en', '<p>blog excerpt</p>', '2020-12-01 13:30:52', '2020-12-15 12:15:42'),
(195, 'menu_items', 'title', 28, 'en', 'Blog', '2020-12-01 13:36:14', '2020-12-01 13:36:14'),
(196, 'menu_items', 'title', 26, 'en', 'Tags', '2020-12-01 13:37:24', '2020-12-01 13:37:24'),
(197, 'menu_items', 'title', 27, 'en', 'Blog Categories', '2020-12-01 13:38:04', '2020-12-01 13:38:04'),
(198, 'menu_items', 'title', 25, 'en', 'Blog Items', '2020-12-01 13:39:09', '2020-12-01 13:40:10'),
(199, 'menu_items', 'title', 29, 'en', 'Services', '2020-12-01 16:20:44', '2020-12-01 16:20:44'),
(200, 'blog_tags', 'tag_name', 7, 'en', 'sergien', '2020-12-01 16:32:51', '2020-12-01 16:32:51'),
(201, 'hakeem_magazines', 'title', 1, 'en', 'moosa magazine ', '2020-12-02 05:32:26', '2020-12-04 20:59:24'),
(202, 'data_rows', 'display_name', 140, 'en', 'Id', '2020-12-02 06:07:31', '2020-12-02 06:07:31'),
(203, 'data_rows', 'display_name', 141, 'en', 'Title', '2020-12-02 06:07:31', '2020-12-02 06:07:31'),
(204, 'data_rows', 'display_name', 142, 'en', 'Images', '2020-12-02 06:07:31', '2020-12-02 06:07:31'),
(205, 'data_rows', 'display_name', 143, 'en', 'Created At', '2020-12-02 06:07:31', '2020-12-02 06:07:31'),
(206, 'data_rows', 'display_name', 144, 'en', 'Updated At', '2020-12-02 06:07:31', '2020-12-02 06:07:31'),
(207, 'data_types', 'display_name_singular', 24, 'en', 'Photo Gallery', '2020-12-02 06:07:31', '2020-12-02 06:07:31'),
(208, 'data_types', 'display_name_plural', 24, 'en', 'Photo Galleries', '2020-12-02 06:07:31', '2020-12-02 06:07:31'),
(209, 'menu_items', 'title', 31, 'en', 'Photo Galleries', '2020-12-02 06:08:36', '2020-12-02 06:08:36'),
(210, 'photo_galleries', 'title', 1, 'en', 'left tower k', '2020-12-02 06:29:35', '2020-12-04 21:00:25'),
(211, 'video_galleries', 'title', 1, 'en', 'When should you get a diabetes test to make sure you are safe and free of infection?', '2020-12-02 07:19:04', '2020-12-02 07:19:04'),
(212, 'menu_items', 'title', 33, 'en', 'Media Center', '2020-12-02 07:21:04', '2020-12-02 07:21:04'),
(213, 'menu_items', 'title', 30, 'en', 'Hakeem Magazines', '2020-12-02 07:21:54', '2020-12-02 07:21:54'),
(214, 'menu_items', 'title', 32, 'en', 'Video Galleries', '2020-12-02 07:22:11', '2020-12-02 07:22:11'),
(215, 'data_rows', 'display_name', 151, 'en', 'Id', '2020-12-04 16:11:59', '2020-12-04 16:11:59'),
(216, 'data_rows', 'display_name', 152, 'en', 'Title', '2020-12-04 16:11:59', '2020-12-04 16:11:59'),
(217, 'data_rows', 'display_name', 153, 'en', 'Start Date', '2020-12-04 16:11:59', '2020-12-04 16:11:59'),
(218, 'data_rows', 'display_name', 154, 'en', 'End Date', '2020-12-04 16:11:59', '2020-12-04 16:11:59'),
(219, 'data_rows', 'display_name', 155, 'en', 'Cost', '2020-12-04 16:11:59', '2020-12-04 16:11:59'),
(220, 'data_rows', 'display_name', 156, 'en', 'Image', '2020-12-04 16:11:59', '2020-12-04 16:11:59'),
(221, 'data_rows', 'display_name', 157, 'en', 'Description', '2020-12-04 16:11:59', '2020-12-04 16:11:59'),
(222, 'data_rows', 'display_name', 158, 'en', 'Speaker Name', '2020-12-04 16:11:59', '2020-12-04 16:11:59'),
(223, 'data_rows', 'display_name', 159, 'en', 'Location', '2020-12-04 16:11:59', '2020-12-04 16:11:59'),
(224, 'data_rows', 'display_name', 160, 'en', 'Contact Phone', '2020-12-04 16:11:59', '2020-12-04 16:11:59'),
(225, 'data_rows', 'display_name', 161, 'en', 'Contact Email', '2020-12-04 16:11:59', '2020-12-04 16:11:59'),
(226, 'data_rows', 'display_name', 162, 'en', 'Attendance', '2020-12-04 16:11:59', '2020-12-04 16:11:59'),
(227, 'data_rows', 'display_name', 163, 'en', 'Category Id', '2020-12-04 16:11:59', '2020-12-04 16:11:59'),
(228, 'data_rows', 'display_name', 164, 'en', 'Deleted At', '2020-12-04 16:11:59', '2020-12-04 16:11:59'),
(229, 'data_rows', 'display_name', 165, 'en', 'Created At', '2020-12-04 16:11:59', '2020-12-04 16:11:59'),
(230, 'data_rows', 'display_name', 166, 'en', 'Updated At', '2020-12-04 16:11:59', '2020-12-04 16:11:59'),
(231, 'data_rows', 'display_name', 167, 'en', 'event categories', '2020-12-04 16:11:59', '2020-12-04 16:12:46'),
(232, 'data_types', 'display_name_singular', 27, 'en', 'Event', '2020-12-04 16:11:59', '2020-12-04 16:11:59'),
(233, 'data_types', 'display_name_plural', 27, 'en', 'Events', '2020-12-04 16:11:59', '2020-12-04 16:11:59'),
(234, 'event_categories', 'name', 1, 'en', 'Health', '2020-12-04 17:38:25', '2020-12-04 17:38:25'),
(235, 'event_categories', 'name', 2, 'en', 'cources', '2020-12-04 17:39:05', '2020-12-04 17:39:05'),
(236, 'event_categories', 'name', 3, 'en', 'Confernces', '2020-12-04 17:39:52', '2020-12-04 17:39:52'),
(237, 'data_rows', 'display_name', 168, 'en', 'Id', '2020-12-04 17:41:03', '2020-12-04 17:41:03'),
(238, 'data_rows', 'display_name', 169, 'en', 'Name', '2020-12-04 17:41:03', '2020-12-04 17:41:03'),
(239, 'data_rows', 'display_name', 170, 'en', 'Deleted At', '2020-12-04 17:41:03', '2020-12-04 17:41:03'),
(240, 'data_rows', 'display_name', 171, 'en', 'Created At', '2020-12-04 17:41:03', '2020-12-04 17:41:03'),
(241, 'data_rows', 'display_name', 172, 'en', 'Updated At', '2020-12-04 17:41:03', '2020-12-04 17:41:03'),
(242, 'data_types', 'display_name_singular', 29, 'en', 'Event Category', '2020-12-04 17:41:03', '2020-12-04 17:41:03'),
(243, 'data_types', 'display_name_plural', 29, 'en', 'Event Categories', '2020-12-04 17:41:03', '2020-12-04 17:41:03'),
(244, 'menu_items', 'title', 35, 'en', 'Event Categories', '2020-12-04 17:42:09', '2020-12-04 17:42:09'),
(245, 'menu_items', 'title', 36, 'en', 'Training & Education', '2020-12-04 17:44:12', '2020-12-04 17:44:12'),
(246, 'events', 'title', 1, 'en', 'event title 1', '2020-12-04 17:56:13', '2020-12-04 20:56:38'),
(247, 'events', 'content', 1, 'en', '<h2><span style=\"color: #3366ff;\"><strong>event description</strong></span></h2>', '2020-12-04 17:56:13', '2020-12-04 17:56:13'),
(248, 'events', 'speaker_name', 1, 'en', 'Dr.Ahmed', '2020-12-04 17:56:13', '2020-12-04 17:56:13'),
(249, 'events', 'location', 1, 'en', '125 st london', '2020-12-04 17:56:13', '2020-12-04 17:56:13'),
(250, 'menu_items', 'title', 37, 'en', 'Event Attendances', '2020-12-04 19:20:32', '2020-12-04 19:20:32'),
(251, 'menu_items', 'title', 34, 'en', 'Events', '2020-12-04 19:20:51', '2020-12-04 19:20:51'),
(252, 'data_rows', 'display_name', 174, 'en', 'Id', '2020-12-04 19:23:29', '2020-12-04 19:23:29'),
(253, 'data_rows', 'display_name', 175, 'en', 'FirstName', '2020-12-04 19:23:29', '2020-12-04 19:23:29'),
(254, 'data_rows', 'display_name', 176, 'en', 'LastName', '2020-12-04 19:23:29', '2020-12-04 19:23:29'),
(255, 'data_rows', 'display_name', 177, 'en', 'Email', '2020-12-04 19:23:29', '2020-12-04 19:23:29'),
(256, 'data_rows', 'display_name', 178, 'en', 'City', '2020-12-04 19:23:29', '2020-12-04 19:23:29'),
(257, 'data_rows', 'display_name', 179, 'en', 'Phone', '2020-12-04 19:23:29', '2020-12-04 19:23:29'),
(258, 'data_rows', 'display_name', 180, 'en', 'Event Id', '2020-12-04 19:23:29', '2020-12-04 19:23:29'),
(259, 'data_rows', 'display_name', 181, 'en', 'Deleted At', '2020-12-04 19:23:29', '2020-12-04 19:23:29'),
(260, 'data_rows', 'display_name', 182, 'en', 'Created At', '2020-12-04 19:23:29', '2020-12-04 19:23:29'),
(261, 'data_rows', 'display_name', 183, 'en', 'Updated At', '2020-12-04 19:23:29', '2020-12-04 19:23:29'),
(262, 'data_rows', 'display_name', 184, 'en', 'events', '2020-12-04 19:23:29', '2020-12-04 19:23:29'),
(263, 'data_types', 'display_name_singular', 31, 'en', 'Event Attendance', '2020-12-04 19:23:29', '2020-12-04 19:23:29'),
(264, 'data_types', 'display_name_plural', 31, 'en', 'Event Attendances', '2020-12-04 19:23:29', '2020-12-04 19:23:29'),
(265, 'data_rows', 'display_name', 185, 'en', 'Id', '2020-12-04 20:04:00', '2020-12-04 20:04:00'),
(266, 'data_rows', 'display_name', 186, 'en', 'Title', '2020-12-04 20:04:00', '2020-12-04 20:04:00'),
(267, 'data_rows', 'display_name', 187, 'en', 'Lecture Title', '2020-12-04 20:04:00', '2020-12-04 20:04:00'),
(268, 'data_rows', 'display_name', 188, 'en', 'Start', '2020-12-04 20:04:00', '2020-12-04 20:04:00'),
(269, 'data_rows', 'display_name', 189, 'en', 'End', '2020-12-04 20:04:00', '2020-12-04 20:04:00'),
(270, 'data_rows', 'display_name', 190, 'en', 'Event Id', '2020-12-04 20:04:00', '2020-12-04 20:04:00'),
(271, 'data_rows', 'display_name', 191, 'en', 'Deleted At', '2020-12-04 20:04:00', '2020-12-04 20:04:00'),
(272, 'data_rows', 'display_name', 192, 'en', 'Created At', '2020-12-04 20:04:00', '2020-12-04 20:04:00'),
(273, 'data_rows', 'display_name', 193, 'en', 'Updated At', '2020-12-04 20:04:00', '2020-12-04 20:04:00'),
(274, 'data_rows', 'display_name', 194, 'en', 'events', '2020-12-04 20:04:00', '2020-12-04 20:04:00'),
(275, 'data_types', 'display_name_singular', 33, 'en', 'Event Timeline', '2020-12-04 20:04:00', '2020-12-04 20:04:00'),
(276, 'data_types', 'display_name_plural', 33, 'en', 'Event Timelines', '2020-12-04 20:04:00', '2020-12-04 20:04:00'),
(277, 'event_timelines', 'title', 1, 'en', 'day1', '2020-12-04 20:19:22', '2020-12-04 20:19:22'),
(278, 'event_timelines', 'lecture_title', 1, 'en', 'lecture 1', '2020-12-04 20:19:22', '2020-12-04 20:19:22'),
(280, 'blog_categories', 'category_name', 4, 'en', 'health', '2020-12-04 21:10:57', '2020-12-04 21:10:57'),
(281, 'blogs', 'title', 2, 'en', 'blog in en', '2020-12-04 21:13:49', '2020-12-04 21:13:49'),
(282, 'data_rows', 'display_name', 204, 'en', 'Id', '2020-12-07 14:46:14', '2020-12-07 14:46:14'),
(283, 'data_rows', 'display_name', 205, 'en', 'Service Category Id', '2020-12-07 14:46:14', '2020-12-07 14:46:14'),
(284, 'data_rows', 'display_name', 206, 'en', 'Slug', '2020-12-07 14:46:14', '2020-12-07 14:46:14'),
(285, 'data_rows', 'display_name', 207, 'en', 'Title', '2020-12-07 14:46:14', '2020-12-07 14:46:14'),
(286, 'data_rows', 'display_name', 208, 'en', 'Excerpt', '2020-12-07 14:46:14', '2020-12-07 14:46:14'),
(287, 'data_rows', 'display_name', 209, 'en', 'Content', '2020-12-07 14:46:14', '2020-12-07 14:46:14'),
(288, 'data_rows', 'display_name', 210, 'en', 'Icon', '2020-12-07 14:46:14', '2020-12-07 14:46:14'),
(289, 'data_rows', 'display_name', 211, 'en', 'Color', '2020-12-07 14:46:14', '2020-12-07 14:46:14'),
(290, 'data_rows', 'display_name', 212, 'en', 'Thumbnail', '2020-12-07 14:46:14', '2020-12-07 14:46:14'),
(291, 'data_rows', 'display_name', 213, 'en', 'Image', '2020-12-07 14:46:14', '2020-12-07 14:46:14'),
(292, 'data_rows', 'display_name', 214, 'en', 'Deleted At', '2020-12-07 14:46:14', '2020-12-07 14:46:14'),
(293, 'data_rows', 'display_name', 215, 'en', 'Created At', '2020-12-07 14:46:14', '2020-12-07 14:46:14'),
(294, 'data_rows', 'display_name', 216, 'en', 'Updated At', '2020-12-07 14:46:14', '2020-12-07 14:46:14'),
(295, 'data_rows', 'display_name', 217, 'en', 'service_categories', '2020-12-07 14:46:14', '2020-12-07 14:46:14'),
(296, 'data_types', 'display_name_singular', 35, 'en', 'Service', '2020-12-07 14:46:14', '2020-12-07 14:46:14'),
(297, 'data_types', 'display_name_plural', 35, 'en', 'Services', '2020-12-07 14:46:14', '2020-12-07 14:46:14'),
(298, 'data_rows', 'display_name', 218, 'en', 'Id', '2020-12-07 15:00:12', '2020-12-07 15:00:12'),
(299, 'data_rows', 'display_name', 219, 'en', 'Title', '2020-12-07 15:00:12', '2020-12-07 15:00:12'),
(300, 'data_rows', 'display_name', 220, 'en', 'Color', '2020-12-07 15:00:12', '2020-12-07 15:00:12'),
(301, 'data_rows', 'display_name', 221, 'en', 'Icon', '2020-12-07 15:00:12', '2020-12-07 15:00:12'),
(302, 'data_rows', 'display_name', 222, 'en', 'Service Id', '2020-12-07 15:00:12', '2020-12-07 15:00:12'),
(303, 'data_rows', 'display_name', 223, 'en', 'Deleted At', '2020-12-07 15:00:12', '2020-12-07 15:00:12'),
(304, 'data_rows', 'display_name', 224, 'en', 'Created At', '2020-12-07 15:00:12', '2020-12-07 15:00:12'),
(305, 'data_rows', 'display_name', 225, 'en', 'Updated At', '2020-12-07 15:00:12', '2020-12-07 15:00:12'),
(306, 'data_rows', 'display_name', 226, 'en', 'services', '2020-12-07 15:00:12', '2020-12-07 15:00:12'),
(307, 'data_types', 'display_name_singular', 37, 'en', 'Service Section', '2020-12-07 15:00:12', '2020-12-07 15:00:12'),
(308, 'data_types', 'display_name_plural', 37, 'en', 'Service Sections', '2020-12-07 15:00:12', '2020-12-07 15:00:12'),
(309, 'data_rows', 'display_name', 227, 'en', 'Id', '2020-12-07 15:12:52', '2020-12-07 15:12:52'),
(310, 'data_rows', 'display_name', 228, 'en', 'Title', '2020-12-07 15:12:52', '2020-12-07 15:12:52'),
(311, 'data_rows', 'display_name', 229, 'en', 'Content', '2020-12-07 15:12:52', '2020-12-07 15:12:52'),
(312, 'data_rows', 'display_name', 230, 'en', 'Section Id', '2020-12-07 15:12:52', '2020-12-07 15:12:52'),
(313, 'data_rows', 'display_name', 231, 'en', 'Deleted At', '2020-12-07 15:12:52', '2020-12-07 15:12:52'),
(314, 'data_rows', 'display_name', 232, 'en', 'Created At', '2020-12-07 15:12:52', '2020-12-07 15:12:52'),
(315, 'data_rows', 'display_name', 233, 'en', 'Updated At', '2020-12-07 15:12:52', '2020-12-07 15:12:52'),
(316, 'data_rows', 'display_name', 234, 'en', 'service_sections', '2020-12-07 15:12:52', '2020-12-07 15:12:52'),
(317, 'data_types', 'display_name_singular', 39, 'en', 'Section Item', '2020-12-07 15:12:52', '2020-12-07 15:12:52'),
(318, 'data_types', 'display_name_plural', 39, 'en', 'Section Items', '2020-12-07 15:12:52', '2020-12-07 15:12:52'),
(319, 'data_rows', 'display_name', 235, 'en', 'doctors', '2020-12-07 16:14:48', '2020-12-07 16:14:48'),
(320, 'menu_items', 'title', 42, 'en', 'Section Items', '2020-12-07 16:19:06', '2020-12-07 16:19:06'),
(321, 'service_categories', 'title', 1, 'en', 'medical programs', '2020-12-07 16:22:09', '2020-12-07 16:22:09'),
(322, 'services', 'title', 1, 'en', 'test en', '2020-12-07 16:33:42', '2020-12-07 16:33:42'),
(323, 'services', 'excerpt', 1, 'en', '<p>test</p>', '2020-12-07 16:33:42', '2020-12-07 16:33:42'),
(324, 'services', 'content', 1, 'en', '<p>test</p>', '2020-12-07 16:33:42', '2020-12-07 16:33:42'),
(325, 'service_sections', 'title', 1, 'en', 'test', '2020-12-08 06:53:28', '2020-12-08 06:53:28'),
(326, 'service_section_items', 'title', 1, 'en', 'Day 1', '2020-12-09 08:24:56', '2020-12-09 08:24:56'),
(327, 'service_section_items', 'content', 1, 'en', '<p>dnjnjknk</p>', '2020-12-09 08:24:56', '2020-12-09 08:24:56'),
(328, 'data_rows', 'display_name', 236, 'en', 'Id', '2020-12-09 14:21:00', '2020-12-09 14:21:00'),
(329, 'data_rows', 'display_name', 237, 'en', 'Title', '2020-12-09 14:21:00', '2020-12-09 14:21:00'),
(330, 'data_rows', 'display_name', 238, 'en', 'Slug', '2020-12-09 14:21:00', '2020-12-09 14:21:00'),
(331, 'data_rows', 'display_name', 239, 'en', 'Thumbnail', '2020-12-09 14:21:00', '2020-12-09 14:21:00'),
(332, 'data_rows', 'display_name', 240, 'en', 'Image', '2020-12-09 14:21:00', '2020-12-09 14:21:00'),
(333, 'data_rows', 'display_name', 241, 'en', 'Color', '2020-12-09 14:21:00', '2020-12-09 14:21:00'),
(334, 'data_rows', 'display_name', 242, 'en', 'Deleted At', '2020-12-09 14:21:00', '2020-12-09 14:21:00'),
(335, 'data_rows', 'display_name', 243, 'en', 'Created At', '2020-12-09 14:21:00', '2020-12-09 14:21:00'),
(336, 'data_rows', 'display_name', 244, 'en', 'Updated At', '2020-12-09 14:21:00', '2020-12-09 14:21:00'),
(337, 'data_types', 'display_name_singular', 40, 'en', 'Community', '2020-12-09 14:21:01', '2020-12-09 14:21:01'),
(338, 'data_types', 'display_name_plural', 40, 'en', 'Communities', '2020-12-09 14:21:01', '2020-12-09 14:21:01'),
(339, 'menu_items', 'title', 45, 'en', 'community', '2020-12-09 14:35:06', '2020-12-09 14:35:06'),
(340, 'menu_items', 'title', 43, 'en', 'Communities', '2020-12-09 14:36:37', '2020-12-09 14:36:37'),
(341, 'menu_items', 'title', 44, 'en', 'Community Contents', '2020-12-09 14:37:29', '2020-12-09 14:37:29'),
(342, 'service_categories', 'title', 2, 'en', 'Medical Centers', '2020-12-09 14:45:26', '2020-12-13 11:59:05'),
(343, 'service_section_items', 'title', 6, 'en', 'ldnldastet', '2020-12-09 14:57:11', '2020-12-09 14:57:11'),
(344, 'service_section_items', 'content', 6, 'en', '<p>knfjsndfsjs</p>', '2020-12-09 14:57:11', '2020-12-09 14:57:11'),
(345, 'communities', 'title', 1, 'en', 'power of art en', '2020-12-10 08:22:18', '2020-12-10 08:22:18'),
(346, 'data_rows', 'display_name', 254, 'en', 'community_contents', '2020-12-10 08:26:55', '2020-12-10 08:26:55'),
(347, 'data_rows', 'display_name', 245, 'en', 'Id', '2020-12-10 08:30:15', '2020-12-10 08:30:15'),
(348, 'data_rows', 'display_name', 246, 'en', 'Name', '2020-12-10 08:30:15', '2020-12-10 08:30:15'),
(349, 'data_rows', 'display_name', 247, 'en', 'Title', '2020-12-10 08:30:15', '2020-12-10 08:30:15'),
(350, 'data_rows', 'display_name', 248, 'en', 'Content', '2020-12-10 08:30:15', '2020-12-10 08:30:15'),
(351, 'data_rows', 'display_name', 249, 'en', 'Images', '2020-12-10 08:30:15', '2020-12-10 08:30:15'),
(352, 'data_rows', 'display_name', 250, 'en', 'Video', '2020-12-10 08:30:15', '2020-12-10 08:30:15'),
(353, 'data_rows', 'display_name', 251, 'en', 'Deleted At', '2020-12-10 08:30:15', '2020-12-10 08:30:15'),
(354, 'data_rows', 'display_name', 252, 'en', 'Created At', '2020-12-10 08:30:15', '2020-12-10 08:30:15'),
(355, 'data_rows', 'display_name', 253, 'en', 'Updated At', '2020-12-10 08:30:15', '2020-12-10 08:30:15'),
(356, 'data_types', 'display_name_singular', 41, 'en', 'Community Content', '2020-12-10 08:30:15', '2020-12-10 08:30:15'),
(357, 'data_types', 'display_name_plural', 41, 'en', 'Community Contents', '2020-12-10 08:30:15', '2020-12-10 08:30:15'),
(358, 'menu_items', 'title', 47, 'en', 'Participating Groups', '2020-12-10 10:32:16', '2020-12-10 10:32:16'),
(359, 'menu_items', 'title', 46, 'en', 'Objectives', '2020-12-10 10:32:38', '2020-12-10 10:32:38');
INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
(360, 'data_rows', 'display_name', 266, 'en', 'objectives', '2020-12-10 10:50:14', '2020-12-10 10:50:14'),
(361, 'data_rows', 'display_name', 267, 'en', 'participating_groups', '2020-12-10 10:50:14', '2020-12-10 10:50:14'),
(362, 'objectives', 'title', 1, 'en', 'art en', '2020-12-10 11:11:42', '2020-12-10 11:11:42'),
(363, 'participating_groups', 'title', 1, 'en', 'participAting group en', '2020-12-10 11:12:30', '2020-12-10 11:12:30'),
(364, 'services', 'title', 2, 'en', 'ششي', '2020-12-13 12:01:42', '2020-12-13 12:01:42'),
(365, 'services', 'excerpt', 2, 'en', '<p>ؤشؤ</p>', '2020-12-13 12:01:42', '2020-12-13 12:01:42'),
(366, 'services', 'content', 2, 'en', '<p>ؤش</p>', '2020-12-13 12:01:42', '2020-12-13 12:01:42'),
(367, 'menu_items', 'title', 13, 'en', 'Pages', '2020-12-13 12:32:29', '2020-12-13 12:32:29'),
(368, 'menu_items', 'title', 49, 'en', 'Pages', '2020-12-13 12:33:07', '2020-12-13 12:33:07'),
(369, 'menu_items', 'title', 48, 'en', 'Page Contents', '2020-12-13 12:33:45', '2020-12-13 12:33:45'),
(370, 'blogs', 'content', 2, 'en', '<p>content en</p>', '2020-12-15 13:51:28', '2020-12-15 13:51:28'),
(371, 'page_contents', 'title', 1, 'en', 'why moosa hospital', '2020-12-16 08:23:42', '2020-12-16 08:23:42'),
(372, 'page_contents', 'content', 1, 'en', 'content en', '2020-12-16 08:23:42', '2020-12-16 08:23:42'),
(373, 'page_contents', 'title', 2, 'en', 'welcome to moosa hospital', '2020-12-16 08:26:53', '2020-12-16 08:26:53'),
(374, 'page_contents', 'content', 2, 'en', '<p>content en</p>', '2020-12-16 08:26:53', '2020-12-16 08:52:10'),
(375, 'data_rows', 'display_name', 44, 'en', 'ID', '2020-12-16 08:38:30', '2020-12-16 08:38:30'),
(376, 'data_rows', 'display_name', 45, 'en', 'Author', '2020-12-16 08:38:30', '2020-12-16 08:38:30'),
(377, 'data_rows', 'display_name', 46, 'en', 'Title', '2020-12-16 08:38:30', '2020-12-16 08:38:30'),
(378, 'data_rows', 'display_name', 47, 'en', 'Excerpt', '2020-12-16 08:38:30', '2020-12-16 08:38:30'),
(379, 'data_rows', 'display_name', 48, 'en', 'Body', '2020-12-16 08:38:30', '2020-12-16 08:38:30'),
(380, 'data_rows', 'display_name', 55, 'en', 'Page Image', '2020-12-16 08:38:30', '2020-12-16 08:38:30'),
(381, 'data_rows', 'display_name', 49, 'en', 'Slug', '2020-12-16 08:38:30', '2020-12-16 08:38:30'),
(382, 'data_rows', 'display_name', 50, 'en', 'Meta Description', '2020-12-16 08:38:30', '2020-12-16 08:38:30'),
(383, 'data_rows', 'display_name', 51, 'en', 'Meta Keywords', '2020-12-16 08:38:30', '2020-12-16 08:38:30'),
(384, 'data_rows', 'display_name', 52, 'en', 'Status', '2020-12-16 08:38:30', '2020-12-16 08:38:30'),
(385, 'data_rows', 'display_name', 53, 'en', 'Created At', '2020-12-16 08:38:30', '2020-12-16 08:38:30'),
(386, 'data_rows', 'display_name', 54, 'en', 'Updated At', '2020-12-16 08:38:30', '2020-12-16 08:38:30'),
(387, 'data_types', 'display_name_singular', 6, 'en', 'Page', '2020-12-16 08:38:30', '2020-12-16 08:38:30'),
(388, 'data_types', 'display_name_plural', 6, 'en', 'Pages', '2020-12-16 08:38:30', '2020-12-16 08:38:30'),
(389, 'pages', 'title', 3, 'en', 'about', '2020-12-16 08:41:43', '2020-12-16 08:41:43'),
(390, 'pages', 'body', 3, 'en', '<p>content en</p>', '2020-12-16 08:41:43', '2020-12-16 08:41:43'),
(391, 'pages', 'slug', 3, 'en', 'about', '2020-12-16 08:41:43', '2020-12-16 08:41:43'),
(392, 'pages', 'excerpt', 3, 'en', 'en', '2020-12-16 08:43:15', '2020-12-16 08:43:15'),
(393, 'data_rows', 'display_name', 268, 'en', 'Id', '2020-12-16 08:50:46', '2020-12-16 08:50:46'),
(394, 'data_rows', 'display_name', 269, 'en', 'Title', '2020-12-16 08:50:46', '2020-12-16 08:50:46'),
(395, 'data_rows', 'display_name', 270, 'en', 'Content', '2020-12-16 08:50:46', '2020-12-16 08:50:46'),
(396, 'data_rows', 'display_name', 271, 'en', 'Image', '2020-12-16 08:50:46', '2020-12-16 08:50:46'),
(397, 'data_rows', 'display_name', 272, 'en', 'Page Id', '2020-12-16 08:50:46', '2020-12-16 08:50:46'),
(398, 'data_rows', 'display_name', 273, 'en', 'Created At', '2020-12-16 08:50:46', '2020-12-16 08:50:46'),
(399, 'data_rows', 'display_name', 274, 'en', 'Updated At', '2020-12-16 08:50:46', '2020-12-16 08:50:46'),
(400, 'data_rows', 'display_name', 275, 'en', 'pages', '2020-12-16 08:50:46', '2020-12-16 08:50:46'),
(401, 'data_types', 'display_name_singular', 44, 'en', 'Page Content', '2020-12-16 08:50:46', '2020-12-16 08:50:46'),
(402, 'data_types', 'display_name_plural', 44, 'en', 'Page Contents', '2020-12-16 08:50:46', '2020-12-16 08:50:46'),
(403, 'data_rows', 'display_name', 276, 'en', 'Deleted At', '2020-12-16 08:51:13', '2020-12-16 08:51:13'),
(404, 'data_rows', 'display_name', 277, 'en', 'Name', '2020-12-16 08:51:13', '2020-12-16 08:51:13'),
(405, 'data_rows', 'display_name', 278, 'en', 'page_contents', '2020-12-16 08:56:37', '2020-12-16 08:56:37'),
(409, 'pages', 'title', 4, 'en', 'hpme', '2020-12-16 11:11:02', '2020-12-16 11:11:02'),
(410, 'pages', 'excerpt', 4, 'en', 'home excerpt ', '2020-12-16 11:11:02', '2020-12-16 11:11:02'),
(411, 'pages', 'slug', 4, 'en', 'home', '2020-12-16 11:11:02', '2020-12-16 11:11:02'),
(412, 'pages', 'meta_description', 4, 'en', 'Home page meta description', '2020-12-16 11:11:02', '2020-12-16 11:11:02'),
(413, 'pages', 'meta_keywords', 4, 'en', 'home,hospital,choose your doctor', '2020-12-16 11:11:02', '2020-12-16 11:11:02'),
(414, 'data_rows', 'display_name', 279, 'en', 'page_contents', '2020-12-16 11:56:31', '2020-12-16 11:56:31'),
(415, 'pages', 'meta_description', 3, 'en', 'ميتا', '2020-12-16 12:38:55', '2020-12-16 12:38:55'),
(416, 'pages', 'meta_keywords', 3, 'en', 'ميتا', '2020-12-16 12:38:55', '2020-12-16 12:38:55'),
(417, 'page_contents', 'title', 3, 'en', 'vision', '2020-12-16 13:28:23', '2020-12-16 13:28:23'),
(418, 'page_contents', 'content', 3, 'en', '<p>vision content en</p>', '2020-12-16 13:28:23', '2020-12-16 13:28:23'),
(419, 'pages', 'title', 5, 'en', 'Services', '2020-12-16 14:11:06', '2020-12-16 14:11:06'),
(420, 'pages', 'excerpt', 5, 'en', 'excerpt en', '2020-12-16 14:11:06', '2020-12-16 14:11:06'),
(421, 'pages', 'body', 5, 'en', '<p>body en</p>', '2020-12-16 14:11:06', '2020-12-16 14:11:06'),
(422, 'pages', 'slug', 5, 'en', 'services', '2020-12-16 14:11:06', '2020-12-16 14:11:06'),
(423, 'pages', 'meta_description', 5, 'en', 'meta description', '2020-12-16 14:11:06', '2020-12-16 14:11:06'),
(424, 'pages', 'meta_keywords', 5, 'en', 'services', '2020-12-16 14:11:06', '2020-12-16 14:11:06'),
(425, 'service_categories', 'slug', 1, 'en', 'medical-programs', '2020-12-16 15:04:24', '2020-12-16 15:04:24'),
(426, 'service_categories', 'slug', 2, 'en', 'medical-centers', '2020-12-16 15:04:41', '2020-12-16 15:04:41');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
(1, 1, 'Admin', 'admin@admin.com', 'users/default.png', NULL, '$2y$10$M7mgKziT4H9xUyRIwpiFuu.d2QQX97N76kr31ImbXluccZc/TEmi2', '7NbeQgrM1VmFEjENqadDeYMXHhEGwAS7vmUDotPdo7g86hfwPJphUTo1TcFJ', '{\"locale\":\"en\"}', '2020-11-18 19:17:29', '2020-12-08 13:38:49'),
(2, 1, 'aziz', 'aziz@uppermedic.com', 'users/default.png', NULL, '$2y$10$VqHpymjsy1X.uxg0o.vmzeLUoLZadGXtkB3Z50mC/5y9dOWoqGA6y', NULL, '{\"locale\":\"en\"}', '2020-11-20 19:04:12', '2020-11-24 06:34:14');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `video_galleries`
--

CREATE TABLE `video_galleries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `video_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bg_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `video_galleries`
--

INSERT INTO `video_galleries` (`id`, `title`, `video_url`, `bg_image`, `created_at`, `updated_at`) VALUES
(1, 'متى يجب عليك عمل فحص للسكري للتأكد من سلامتك وخلوك من الإصابة ؟', 'https://www.youtube.com/watch?v=1R0QKbX2_a0', 'video-galleries/December2020/Df9zomtdb85FUcAA4j1a.jpg', '2020-12-02 07:19:00', '2020-12-04 21:00:49');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `blogs_slug_unique` (`slug`);

--
-- Indexes for table `blogs_categories_relation`
--
ALTER TABLE `blogs_categories_relation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blogs_tags_relation`
--
ALTER TABLE `blogs_tags_relation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `blog_categories_slug_unique` (`slug`);

--
-- Indexes for table `blog_tags`
--
ALTER TABLE `blog_tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `communities`
--
ALTER TABLE `communities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `communities_objectives_relations`
--
ALTER TABLE `communities_objectives_relations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `communities_objectives_relations_community_id_foreign` (`community_id`),
  ADD KEY `communities_objectives_relations_objective_id_foreign` (`objective_id`);

--
-- Indexes for table `communities_participating_relations`
--
ALTER TABLE `communities_participating_relations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `communities_participating_relations_community_id_foreign` (`community_id`),
  ADD KEY `communities_participating_relations_participating_id_foreign` (`participating_group_id`);

--
-- Indexes for table `community_contents`
--
ALTER TABLE `community_contents`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `community_contents_name_unique` (`name`);

--
-- Indexes for table `community_content_relation`
--
ALTER TABLE `community_content_relation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `community_content_relation_community_id_foreign` (`community_id`),
  ADD KEY `community_content_relation_community_content_id_foreign` (`community_content_id`);

--
-- Indexes for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Indexes for table `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `doctors_slug_unique` (`slug`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `event_attendances`
--
ALTER TABLE `event_attendances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_attendances_event_id_foreign` (`event_id`);

--
-- Indexes for table `event_categories`
--
ALTER TABLE `event_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `event_timelines`
--
ALTER TABLE `event_timelines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_timelines_event_id_foreign` (`event_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `hakeem_magazines`
--
ALTER TABLE `hakeem_magazines`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `objectives`
--
ALTER TABLE `objectives`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Indexes for table `page_contents`
--
ALTER TABLE `page_contents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page_content_relation`
--
ALTER TABLE `page_content_relation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `participating_groups`
--
ALTER TABLE `participating_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `patient_guide_categories`
--
ALTER TABLE `patient_guide_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patient_guids`
--
ALTER TABLE `patient_guids`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Indexes for table `photo_galleries`
--
ALTER TABLE `photo_galleries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services_physicians_relation`
--
ALTER TABLE `services_physicians_relation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `services_physicians_relation_service_id_foreign` (`service_id`),
  ADD KEY `services_physicians_relation_doctor_id_foreign` (`doctor_id`);

--
-- Indexes for table `service_categories`
--
ALTER TABLE `service_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_sections`
--
ALTER TABLE `service_sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `service_sections_service_id_foreign` (`service_id`);

--
-- Indexes for table `service_section_items`
--
ALTER TABLE `service_section_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `service_section_items_section_id_foreign` (`section_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- Indexes for table `video_galleries`
--
ALTER TABLE `video_galleries`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `blogs_categories_relation`
--
ALTER TABLE `blogs_categories_relation`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `blogs_tags_relation`
--
ALTER TABLE `blogs_tags_relation`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `blog_categories`
--
ALTER TABLE `blog_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `blog_tags`
--
ALTER TABLE `blog_tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `communities`
--
ALTER TABLE `communities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `communities_objectives_relations`
--
ALTER TABLE `communities_objectives_relations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `communities_participating_relations`
--
ALTER TABLE `communities_participating_relations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `community_contents`
--
ALTER TABLE `community_contents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `community_content_relation`
--
ALTER TABLE `community_content_relation`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=280;

--
-- AUTO_INCREMENT for table `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `event_attendances`
--
ALTER TABLE `event_attendances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `event_categories`
--
ALTER TABLE `event_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `event_timelines`
--
ALTER TABLE `event_timelines`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hakeem_magazines`
--
ALTER TABLE `hakeem_magazines`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `objectives`
--
ALTER TABLE `objectives`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `page_contents`
--
ALTER TABLE `page_contents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `page_content_relation`
--
ALTER TABLE `page_content_relation`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `participating_groups`
--
ALTER TABLE `participating_groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `patient_guide_categories`
--
ALTER TABLE `patient_guide_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `patient_guids`
--
ALTER TABLE `patient_guids`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=182;

--
-- AUTO_INCREMENT for table `photo_galleries`
--
ALTER TABLE `photo_galleries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `services_physicians_relation`
--
ALTER TABLE `services_physicians_relation`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `service_categories`
--
ALTER TABLE `service_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `service_sections`
--
ALTER TABLE `service_sections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `service_section_items`
--
ALTER TABLE `service_section_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=427;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `video_galleries`
--
ALTER TABLE `video_galleries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `communities_objectives_relations`
--
ALTER TABLE `communities_objectives_relations`
  ADD CONSTRAINT `communities_objectives_relations_community_id_foreign` FOREIGN KEY (`community_id`) REFERENCES `communities` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `communities_objectives_relations_objective_id_foreign` FOREIGN KEY (`objective_id`) REFERENCES `objectives` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `communities_participating_relations`
--
ALTER TABLE `communities_participating_relations`
  ADD CONSTRAINT `communities_participating_relations_community_id_foreign` FOREIGN KEY (`community_id`) REFERENCES `communities` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `communities_participating_relations_participating_id_foreign` FOREIGN KEY (`participating_group_id`) REFERENCES `participating_groups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `community_content_relation`
--
ALTER TABLE `community_content_relation`
  ADD CONSTRAINT `community_content_relation_community_content_id_foreign` FOREIGN KEY (`community_content_id`) REFERENCES `community_contents` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `community_content_relation_community_id_foreign` FOREIGN KEY (`community_id`) REFERENCES `communities` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `event_attendances`
--
ALTER TABLE `event_attendances`
  ADD CONSTRAINT `event_attendances_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`);

--
-- Constraints for table `event_timelines`
--
ALTER TABLE `event_timelines`
  ADD CONSTRAINT `event_timelines_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `services_physicians_relation`
--
ALTER TABLE `services_physicians_relation`
  ADD CONSTRAINT `services_physicians_relation_doctor_id_foreign` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `services_physicians_relation_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `service_sections`
--
ALTER TABLE `service_sections`
  ADD CONSTRAINT `service_sections_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `service_section_items`
--
ALTER TABLE `service_section_items`
  ADD CONSTRAINT `service_section_items_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `service_sections` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
