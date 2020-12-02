-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 02, 2020 at 07:21 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.11

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
(1, 'fsfssdfsar', 'fsfssdfsar', '<p>fsdfsdfdsdad</p>', '<p>sdfsdfsdf</p>', 'PUBLISHED', 'blogs/December2020/QfYRcMm4LOSurgOinVNg.jpg', 'sfsa', 'fsdf', 'fssfsf', '2020-12-01 12:10:00', '2020-12-01 13:30:51');

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
(2, 1, 2, NULL, NULL);

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
(9, 1, 10, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `blog_categories`
--

CREATE TABLE `blog_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog_categories`
--

INSERT INTO `blog_categories` (`id`, `category_name`, `slug`, `created_at`, `updated_at`, `name`) VALUES
(1, 'blog catogry1', 'blog-catogry1', '2020-12-01 12:14:17', '2020-12-01 12:14:17', ''),
(2, 'blog category 2', 'blog-category-2', '2020-12-01 12:14:31', '2020-12-01 12:14:31', '');

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
(10, 'امراض جلديه', '2020-12-01 17:16:08', '2020-12-01 17:16:08');

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
(44, 6, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(45, 6, 'author_id', 'text', 'Author', 1, 0, 0, 0, 0, 0, NULL, 2),
(46, 6, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 3),
(47, 6, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 4),
(48, 6, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 5),
(49, 6, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:pages,slug\"}}', 6),
(50, 6, 'meta_description', 'text', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 7),
(51, 6, 'meta_keywords', 'text', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 8),
(52, 6, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}', 9),
(53, 6, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 0, 0, 0, NULL, 10),
(54, 6, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, NULL, 11),
(55, 6, 'image', 'image', 'Page Image', 0, 1, 1, 1, 1, 1, NULL, 12),
(56, 8, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(57, 8, 'body', 'rich_text_box', 'Body', 1, 1, 1, 1, 1, 1, '{}', 2),
(58, 8, 'patient_name', 'text', 'Patient Name', 1, 1, 1, 1, 1, 1, '{}', 3),
(59, 8, 'dr_name', 'text', 'Dr Name', 1, 1, 1, 1, 1, 1, '{}', 4),
(60, 8, 'department', 'text', 'Department', 1, 1, 1, 1, 1, 1, '{}', 5),
(61, 8, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 6),
(62, 8, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(63, 10, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(64, 10, 'service_name', 'text', 'Service Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(65, 10, 'service_image', 'image', 'Service Image', 1, 1, 1, 1, 1, 1, '{}', 3),
(66, 10, 'service_bg_color', 'color', 'Service Bg Color', 1, 1, 1, 1, 1, 1, '{}', 4),
(67, 10, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 5),
(68, 10, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
(71, 14, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(72, 14, 'image', 'multiple_images', 'Image', 0, 1, 1, 1, 1, 1, '[\"image\\/jpeg\",\"image\\/png\",\"image\\/bmp\"]', 2),
(73, 14, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 3),
(74, 14, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
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
(133, 19, 'blog_belongstomany_blog_tag_relationship', 'relationship', 'blog tags', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\BlogTag\",\"table\":\"blog_tags\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"tag_name\",\"pivot_table\":\"blogs_tags_relation\",\"pivot\":\"1\",\"taggable\":\"on\"}', 14);

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
(6, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', NULL, '', '', 1, 0, NULL, '2020-11-18 19:17:31', '2020-11-18 19:17:31'),
(8, 'testimonials', 'testimonials', 'Testimonial', 'Testimonials', 'voyager-pen', 'App\\Models\\Testimonial', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-11-20 20:34:48', '2020-11-20 20:36:09'),
(10, 'services', 'services', 'Service', 'Services', 'voyager-pie-chart', 'App\\Models\\Service', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":\"service_name\"}', '2020-11-22 11:00:47', '2020-11-22 11:00:47'),
(14, 'serivce_items', 'serivce-items', 'Serivce Item', 'Serivce Items', NULL, 'App\\SerivceItem', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-11-22 13:44:25', '2020-11-22 14:32:05'),
(15, 'patient_guide_categories', 'patient-guide-categories', 'Patient Guide Category', 'Patient Guide Categories', NULL, 'App\\Models\\PatientGuideCategory', NULL, NULL, 'patient guide categories eg: for visitors, for patient...', 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":\"category_name\",\"scope\":null}', '2020-11-24 07:09:08', '2020-11-30 12:11:19'),
(16, 'patient_guids', 'patient-guids', 'Patient Guid', 'Patient Guids', NULL, 'App\\Models\\PatientGuid', NULL, NULL, 'patient guid', 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":\"title\",\"scope\":null}', '2020-11-24 08:33:46', '2020-11-24 08:41:05'),
(18, 'doctors', 'doctors', 'Doctor', 'Doctors', 'voyager-people', 'App\\Models\\Doctor', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":\"name\",\"scope\":null}', '2020-11-30 14:09:50', '2020-11-30 15:03:03'),
(19, 'blogs', 'blogs', 'Blog', 'Blogs', 'voyager-window-list', 'App\\Models\\Blog', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-12-01 11:41:14', '2020-12-01 13:10:13'),
(20, 'blog_tags', 'blog-tags', 'Tag', 'Tags', 'voyager-file-text', 'App\\Models\\BlogTag', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-12-01 11:45:59', '2020-12-01 13:09:31'),
(22, 'blog_categories', 'blog-categories', 'Blog Category', 'Blog Categories', NULL, 'App\\Models\\BlogCategory', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-12-01 11:47:27', '2020-12-01 12:08:58');

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
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 8, '2020-11-18 19:17:19', '2020-11-22 13:27:48', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 1, '2020-11-18 19:17:19', '2020-11-22 13:27:48', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 2, '2020-11-18 19:17:19', '2020-11-22 13:27:48', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 3, '2020-11-18 19:17:19', '2020-11-22 13:27:49', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 4, '2020-11-18 19:17:19', '2020-11-22 13:27:49', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 9, '2020-11-18 19:17:19', '2020-11-22 13:27:49', 'voyager.settings.index', NULL),
(11, 1, 'Categories', '', '_self', 'voyager-categories', NULL, NULL, 7, '2020-11-18 19:17:28', '2020-11-22 13:27:48', 'voyager.categories.index', NULL),
(12, 1, 'Posts', '', '_self', 'voyager-news', NULL, NULL, 5, '2020-11-18 19:17:30', '2020-11-22 13:27:48', 'voyager.posts.index', NULL),
(13, 1, 'Pages', '', '_self', 'voyager-file-text', NULL, NULL, 6, '2020-11-18 19:17:32', '2020-11-22 13:27:48', 'voyager.pages.index', NULL),
(14, 1, 'Hooks', '', '_self', 'voyager-hook', NULL, 5, 5, '2020-11-18 19:17:36', '2020-11-22 13:27:49', 'voyager.hooks', NULL),
(16, 1, 'Testimonials', '', '_self', 'voyager-pen', NULL, NULL, 10, '2020-11-20 20:34:49', '2020-11-22 13:27:49', 'voyager.testimonials.index', NULL),
(17, 1, 'Services', '', '_self', 'voyager-pie-chart', NULL, 29, 1, '2020-11-22 11:00:48', '2020-12-01 16:21:09', 'voyager.services.index', NULL),
(19, 1, 'Serivce Items', '', '_self', NULL, NULL, 29, 2, '2020-11-22 13:44:25', '2020-12-01 16:21:27', 'voyager.serivce-items.index', NULL),
(20, 1, ' Guide Categories', '', '_self', NULL, '#000000', 23, 1, '2020-11-24 07:09:08', '2020-11-29 10:21:32', 'voyager.patient-guide-categories.index', 'null'),
(21, 1, 'Patient Guids', '', '_self', NULL, NULL, 23, 2, '2020-11-24 08:33:46', '2020-11-29 10:21:34', 'voyager.patient-guids.index', NULL),
(23, 1, 'دليل المريض', '', '_self', 'voyager-book', '#000000', NULL, 11, '2020-11-29 10:20:11', '2020-12-01 16:21:27', NULL, ''),
(24, 1, 'Doctors', '', '_self', 'voyager-people', NULL, NULL, 12, '2020-11-30 14:09:52', '2020-12-01 16:21:27', 'voyager.doctors.index', NULL),
(25, 1, 'المدونه', '', '_self', 'voyager-window-list', '#000000', 28, 1, '2020-12-01 11:41:14', '2020-12-01 13:40:10', 'voyager.blogs.index', 'null'),
(26, 1, 'Tags', '', '_self', 'voyager-tag', '#000000', 28, 2, '2020-12-01 11:45:59', '2020-12-01 13:37:24', 'voyager.blog-tags.index', 'null'),
(27, 1, 'Blog Categories', '', '_self', 'voyager-categories', '#000000', 28, 3, '2020-12-01 11:47:27', '2020-12-01 13:38:04', 'voyager.blog-categories.index', 'null'),
(28, 1, 'المدونه', '', '_self', 'voyager-bag', '#000000', NULL, 13, '2020-12-01 13:36:14', '2020-12-01 16:21:27', NULL, ''),
(29, 1, 'الخدمات', '', '_self', 'voyager-bulb', '#000000', NULL, 14, '2020-12-01 16:20:43', '2020-12-01 16:21:27', NULL, '');

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
(44, '2020_12_01_150212_update_blog_tag_columns', 14);

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
(1, 1, 'ههتبهخ', 'تسبت تبتب ن سبت ب بن سنب', '<p>سيبا عتسابهسب اه&nbsp; يب</p>', NULL, 'hello-world', 'Yar Meta Description', 'Keyword1, Keyword2', 'ACTIVE', '2020-11-18 19:17:32', '2020-11-22 14:03:13'),
(2, 1, 'Home', 'Home Page', '', NULL, 'home', 'Home page', 'home', 'ACTIVE', '2020-11-20 15:57:15', '2020-11-22 14:03:02');

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
(2, 'للمرضي', 'patient-guide-categories/November2020/UWN22xoOlWwNt1Sk7tcJ.png', '#ff9100', '2020-11-24 08:44:00', '2020-11-24 08:45:14');

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
(52, 'browse_services', 'services', '2020-11-22 11:00:48', '2020-11-22 11:00:48'),
(53, 'read_services', 'services', '2020-11-22 11:00:48', '2020-11-22 11:00:48'),
(54, 'edit_services', 'services', '2020-11-22 11:00:48', '2020-11-22 11:00:48'),
(55, 'add_services', 'services', '2020-11-22 11:00:48', '2020-11-22 11:00:48'),
(56, 'delete_services', 'services', '2020-11-22 11:00:48', '2020-11-22 11:00:48'),
(62, 'browse_serivce_items', 'serivce_items', '2020-11-22 13:44:25', '2020-11-22 13:44:25'),
(63, 'read_serivce_items', 'serivce_items', '2020-11-22 13:44:25', '2020-11-22 13:44:25'),
(64, 'edit_serivce_items', 'serivce_items', '2020-11-22 13:44:25', '2020-11-22 13:44:25'),
(65, 'add_serivce_items', 'serivce_items', '2020-11-22 13:44:25', '2020-11-22 13:44:25'),
(66, 'delete_serivce_items', 'serivce_items', '2020-11-22 13:44:25', '2020-11-22 13:44:25'),
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
(101, 'delete_blog_categories', 'blog_categories', '2020-12-01 11:47:27', '2020-12-01 11:47:27');

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
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(66, 1),
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
(101, 1);

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
-- Table structure for table `serivce_items`
--

CREATE TABLE `serivce_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `service_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `service_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `service_bg_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `service_name`, `service_image`, `service_bg_color`, `created_at`, `updated_at`) VALUES
(1, 'المراكز الطبية', 'services/November2020/Rj6lrtk8kSJxslltBT1d.png', '#80ff00', '2020-11-22 11:39:00', '2020-11-30 08:03:23'),
(3, 'البرامج الطبيه', 'services/November2020/WxvmJ3GgPocglALeJS1L.png', '#b35c5c', '2020-11-30 08:06:36', '2020-11-30 08:06:36');

-- --------------------------------------------------------

--
-- Table structure for table `services_new`
--

CREATE TABLE `services_new` (
  `id` int(10) UNSIGNED NOT NULL,
  `service_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bg_color` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(2, 'site.description', 'Site Description', 'Site Description', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', '', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', NULL, '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', '', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'Moosa HospitalAdmin', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Welcome to Voyager. The Missing Admin for Laravel', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', '', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', 'AIzaSyD5Fk-uLeoP4ij79Z2G9LbhfOGq65ifEtY', '', 'text', 1, 'Admin');

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
(2, '<p>ckjdkdks k sdjksndjksa sjd askd ds</p>', 'njkcd', 'kds', 'nsjd', '2020-11-22 13:13:09', '2020-11-22 13:13:09');

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
(31, 'pages', 'title', 2, 'ar', 'الصفحة الرئسيه', '2020-11-20 15:57:15', '2020-11-20 15:57:15'),
(32, 'pages', 'slug', 2, 'ar', 'alsfhh-alresyh', '2020-11-20 15:57:15', '2020-11-20 15:57:15'),
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
(55, 'pages', 'title', 1, 'en', 'Hello World', '2020-11-21 20:07:50', '2020-11-21 20:07:50'),
(56, 'pages', 'body', 1, 'en', '<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2020-11-21 20:07:50', '2020-11-21 20:07:50'),
(57, 'pages', 'slug', 1, 'en', 'hello-world', '2020-11-21 20:07:50', '2020-11-21 20:07:50'),
(58, 'services', 'service_name', 1, 'en', 'Medical centers', '2020-11-22 11:39:59', '2020-11-30 08:03:23'),
(59, 'pages', 'title', 2, 'en', 'Home', '2020-11-22 13:09:59', '2020-11-22 13:09:59'),
(60, 'pages', 'slug', 2, 'en', 'home', '2020-11-22 13:09:59', '2020-11-22 13:09:59'),
(61, 'testimonials', 'body', 2, 'en', '<p>knsdadk kj ck</p>', '2020-11-22 13:13:09', '2020-11-22 13:13:09'),
(62, 'testimonials', 'patient_name', 2, 'en', 'n c', '2020-11-22 13:13:09', '2020-11-22 13:13:09'),
(63, 'testimonials', 'dr_name', 2, 'en', 'd jds', '2020-11-22 13:13:09', '2020-11-22 13:13:09'),
(64, 'testimonials', 'department', 2, 'en', 'ndjs', '2020-11-22 13:13:09', '2020-11-22 13:13:09'),
(66, 'data_rows', 'display_name', 71, 'en', 'Id', '2020-11-22 13:45:20', '2020-11-22 13:45:20'),
(67, 'data_rows', 'display_name', 72, 'en', 'Image', '2020-11-22 13:45:20', '2020-11-22 13:45:20'),
(68, 'data_types', 'display_name_singular', 14, 'en', 'Serivce Item', '2020-11-22 13:45:20', '2020-11-22 13:45:20'),
(69, 'data_types', 'display_name_plural', 14, 'en', 'Serivce Items', '2020-11-22 13:45:20', '2020-11-22 13:45:20'),
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
(193, 'blogs', 'content', 1, 'en', '<p>fsdfsdfds</p>', '2020-12-01 13:30:52', '2020-12-01 13:30:52'),
(194, 'blogs', 'excerpt', 1, 'en', '<p>sdfsdfsdf</p>', '2020-12-01 13:30:52', '2020-12-01 13:30:52'),
(195, 'menu_items', 'title', 28, 'en', 'Blog', '2020-12-01 13:36:14', '2020-12-01 13:36:14'),
(196, 'menu_items', 'title', 26, 'en', 'Tags', '2020-12-01 13:37:24', '2020-12-01 13:37:24'),
(197, 'menu_items', 'title', 27, 'en', 'Blog Categories', '2020-12-01 13:38:04', '2020-12-01 13:38:04'),
(198, 'menu_items', 'title', 25, 'en', 'Blog Items', '2020-12-01 13:39:09', '2020-12-01 13:40:10'),
(199, 'menu_items', 'title', 29, 'en', 'Services', '2020-12-01 16:20:44', '2020-12-01 16:20:44'),
(200, 'blog_tags', 'tag_name', 7, 'en', 'sergien', '2020-12-01 16:32:51', '2020-12-01 16:32:51');

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
(1, 1, 'Admin', 'admin@admin.com', 'users/default.png', NULL, '$2y$10$M7mgKziT4H9xUyRIwpiFuu.d2QQX97N76kr31ImbXluccZc/TEmi2', 'IdydY6xsgWRtsPRjOkFAAIpFrEupH8Crz15YzH6dhVyQ0wr37sFPidfdLmAV', '{\"locale\":\"en\"}', '2020-11-18 19:17:29', '2020-12-01 17:33:03'),
(2, 1, 'aziz', 'aziz@uppermedic.com', 'users/default.png', NULL, '$2y$10$VqHpymjsy1X.uxg0o.vmzeLUoLZadGXtkB3Z50mC/5y9dOWoqGA6y', NULL, '{\"locale\":\"en\"}', '2020-11-20 19:04:12', '2020-11-24 06:34:14');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

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
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

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
-- Indexes for table `serivce_items`
--
ALTER TABLE `serivce_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services_new`
--
ALTER TABLE `services_new`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `blogs_categories_relation`
--
ALTER TABLE `blogs_categories_relation`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `blogs_tags_relation`
--
ALTER TABLE `blogs_tags_relation`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `blog_categories`
--
ALTER TABLE `blog_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `blog_tags`
--
ALTER TABLE `blog_tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=134;

--
-- AUTO_INCREMENT for table `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

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
-- AUTO_INCREMENT for table `serivce_items`
--
ALTER TABLE `serivce_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `services_new`
--
ALTER TABLE `services_new`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=201;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
