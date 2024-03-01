-- phpMyAdmin SQL Dump
-- version 3.4.10.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 25, 2023 at 10:03 AM
-- Server version: 5.5.20
-- PHP Version: 5.3.10

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `hrmsproject`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=64 ;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can add permission', 2, 'add_permission'),
(5, 'Can change permission', 2, 'change_permission'),
(6, 'Can delete permission', 2, 'delete_permission'),
(7, 'Can add group', 3, 'add_group'),
(8, 'Can change group', 3, 'change_group'),
(9, 'Can delete group', 3, 'delete_group'),
(10, 'Can add user', 4, 'add_user'),
(11, 'Can change user', 4, 'change_user'),
(12, 'Can delete user', 4, 'delete_user'),
(13, 'Can add content type', 5, 'add_contenttype'),
(14, 'Can change content type', 5, 'change_contenttype'),
(15, 'Can delete content type', 5, 'delete_contenttype'),
(16, 'Can add session', 6, 'add_session'),
(17, 'Can change session', 6, 'change_session'),
(18, 'Can delete session', 6, 'delete_session'),
(19, 'Can add employee model', 7, 'add_employeemodel'),
(20, 'Can change employee model', 7, 'change_employeemodel'),
(21, 'Can delete employee model', 7, 'delete_employeemodel'),
(22, 'Can add contracts model', 8, 'add_contractsmodel'),
(23, 'Can change contracts model', 8, 'change_contractsmodel'),
(24, 'Can delete contracts model', 8, 'delete_contractsmodel'),
(25, 'Can add job model', 9, 'add_jobmodel'),
(26, 'Can change job model', 9, 'change_jobmodel'),
(27, 'Can delete job model', 9, 'delete_jobmodel'),
(28, 'Can add department model', 10, 'add_departmentmodel'),
(29, 'Can change department model', 10, 'change_departmentmodel'),
(30, 'Can delete department model', 10, 'delete_departmentmodel'),
(31, 'Can add resume model', 11, 'add_resumemodel'),
(32, 'Can change resume model', 11, 'change_resumemodel'),
(33, 'Can delete resume model', 11, 'delete_resumemodel'),
(34, 'Can add contract tag model', 12, 'add_contracttagmodel'),
(35, 'Can change contract tag model', 12, 'change_contracttagmodel'),
(36, 'Can delete contract tag model', 12, 'delete_contracttagmodel'),
(37, 'Can add employee tag model', 13, 'add_employeetagmodel'),
(38, 'Can change employee tag model', 13, 'change_employeetagmodel'),
(39, 'Can delete employee tag model', 13, 'delete_employeetagmodel'),
(40, 'Can add job tag model', 14, 'add_jobtagmodel'),
(41, 'Can change job tag model', 14, 'change_jobtagmodel'),
(42, 'Can delete job tag model', 14, 'delete_jobtagmodel'),
(43, 'Can add resume tag model', 15, 'add_resumetagmodel'),
(44, 'Can change resume tag model', 15, 'change_resumetagmodel'),
(45, 'Can delete resume tag model', 15, 'delete_resumetagmodel'),
(46, 'Can view employee model', 7, 'view_employeemodel'),
(47, 'Can view resume model', 11, 'view_resumemodel'),
(48, 'Can view contract model', 8, 'view_contractmodel'),
(49, 'Can View job model', 9, 'view_jobmodel'),
(50, 'Can view department model', 10, 'view_departmentmodel'),
(51, 'Can add expense model', 16, 'add_expensemodel'),
(52, 'Can change expense model', 16, 'change_expensemodel'),
(53, 'Can delete expense model', 16, 'delete_expensemodel'),
(55, 'Can add attendance model', 17, 'add_attendancemodel'),
(56, 'Can change attendance model', 17, 'change_attendancemodel'),
(57, 'Can delete attendance model', 17, 'delete_attendancemodel'),
(58, 'Can view attendance model', 17, 'view_attendancemodel'),
(59, 'Can view expense model', 16, 'view_expensemodel'),
(60, 'Can add payroll model', 18, 'add_payrollmodel'),
(61, 'Can change payroll model', 18, 'change_payrollmodel'),
(62, 'Can delete payroll model', 18, 'delete_payrollmodel'),
(63, 'Can view payroll model', 18, 'view_payrollmodel');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$100000$sJpaY9F5Mero$1H2FNxxs1CdrYXUwyrKDCxIOvEh41RO/0dGcPFi20BY=', '2023-04-25 08:36:59', 1, 'admin', 'Administer', '', 'admin@gmail.com', 1, 1, '2023-03-20 05:36:58'),
(2, 'pbkdf2_sha256$100000$f7rAhNn5k16O$E14B65Bjyc1i/IuYIi5CS+UyNNE7p5MnT9lhLanpPg4=', '2023-04-13 08:48:52', 0, 'viewuser', 'View', 'User', '', 0, 1, '2023-04-04 10:20:39'),
(3, 'pbkdf2_sha256$100000$9xRnMnKkbie9$tCBUbzdKGPzvlK/rbLAWHRRkj1RcCwaakSvj1T5I+94=', '2023-04-13 08:44:53', 0, 'normaluser', 'Normal', 'User', '', 0, 1, '2023-04-04 10:22:16'),
(5, 'pbkdf2_sha256$100000$NkjCugfN5mYJ$MG2wXS3U3IJdfDEfSgPwVA7DYNwMHzgtCn7RD23fl4Y=', '2023-04-13 08:42:53', 0, 'updateuser', 'Update', 'User', '', 0, 1, '2023-04-04 10:25:30'),
(6, 'pbkdf2_sha256$100000$7v4hIhIOUDDX$lcOYvFRX/6HDE8Ju4U24Cw1H6FbFGx9zIwf8zkVW578=', '2023-04-15 06:49:01', 0, 'deleteuser', 'Delete', 'User', '', 0, 1, '2023-04-04 10:27:05'),
(7, 'pbkdf2_sha256$100000$0I9u8OFxYGcZ$XUvhhSBj4xFQ30F/kNrjKCTv4p/+gvkz5C/Jutf7bjo=', '2023-04-23 05:39:43', 0, 'createuser', 'Create', 'User', '', 0, 1, '2023-04-04 11:27:25');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=67 ;

--
-- Dumping data for table `auth_user_user_permissions`
--

INSERT INTO `auth_user_user_permissions` (`id`, `user_id`, `permission_id`) VALUES
(1, 2, 46),
(2, 2, 47),
(3, 2, 48),
(4, 2, 49),
(5, 2, 50),
(64, 2, 58),
(65, 2, 59),
(66, 2, 63),
(22, 5, 20),
(23, 5, 23),
(24, 5, 26),
(25, 5, 29),
(16, 5, 32),
(17, 5, 46),
(18, 5, 47),
(19, 5, 48),
(20, 5, 49),
(21, 5, 50),
(58, 5, 52),
(59, 5, 56),
(60, 5, 58),
(61, 5, 59),
(62, 5, 61),
(63, 5, 63),
(32, 6, 21),
(33, 6, 24),
(34, 6, 27),
(35, 6, 30),
(26, 6, 33),
(27, 6, 46),
(28, 6, 47),
(29, 6, 48),
(30, 6, 49),
(31, 6, 50),
(52, 6, 53),
(53, 6, 57),
(54, 6, 58),
(55, 6, 59),
(56, 6, 62),
(57, 6, 63),
(41, 7, 19),
(42, 7, 22),
(43, 7, 25),
(44, 7, 28),
(45, 7, 31),
(36, 7, 46),
(37, 7, 47),
(38, 7, 48),
(39, 7, 49),
(40, 7, 50),
(46, 7, 51),
(47, 7, 55),
(48, 7, 58),
(49, 7, 59),
(50, 7, 60),
(51, 7, 63);

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=38 ;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2023-03-30 09:42:30', '1', 'employee', 1, '[{"added": {}}]', 12, 1),
(2, '2023-03-30 09:42:43', '2', 'subcontractor', 1, '[{"added": {}}]', 12, 1),
(3, '2023-03-30 09:43:05', '1', 'parttime', 1, '[{"added": {}}]', 13, 1),
(4, '2023-03-30 09:43:17', '2', 'fulltime', 1, '[{"added": {}}]', 13, 1),
(5, '2023-03-30 09:43:40', '1', 'open', 1, '[{"added": {}}]', 14, 1),
(6, '2023-03-30 09:43:46', '2', 'close', 1, '[{"added": {}}]', 14, 1),
(7, '2023-03-30 09:44:06', '1', 'firstinterview', 1, '[{"added": {}}]', 15, 1),
(8, '2023-03-30 09:44:18', '2', 'secondinterview', 1, '[{"added": {}}]', 15, 1),
(9, '2023-03-30 09:54:33', '3', 'Game tester', 2, '[{"changed": {"fields": ["department", "tags"]}}]', 9, 1),
(10, '2023-03-30 09:54:44', '2', 'junior developer', 2, '[{"changed": {"fields": ["department", "tags"]}}]', 9, 1),
(11, '2023-03-30 09:54:54', '1', 'Web developer', 2, '[{"changed": {"fields": ["department", "tags"]}}]', 9, 1),
(12, '2023-03-30 10:08:32', '2', 'junior developer', 2, '[{"changed": {"fields": ["tags"]}}]', 9, 1),
(13, '2023-03-30 10:08:42', '1', 'Web developer', 2, '[{"changed": {"fields": ["tags"]}}]', 9, 1),
(14, '2023-03-31 03:47:40', '1', 'Web developer', 1, '[{"added": {}}]', 9, 1),
(15, '2023-03-31 03:49:02', '1', 'Kyaw Kyaw', 1, '[{"added": {}}]', 7, 1),
(16, '2023-04-03 14:35:41', '1', 'admin', 2, '[{"changed": {"fields": ["first_name"]}}]', 4, 1),
(17, '2023-04-04 10:20:39', '2', 'Normaluser', 1, '[{"added": {}}]', 4, 1),
(18, '2023-04-04 10:21:28', '2', 'Normaluser', 2, '[{"changed": {"fields": ["first_name", "last_name", "user_permissions"]}}]', 4, 1),
(19, '2023-04-04 10:22:16', '3', 'viewuser', 1, '[{"added": {}}]', 4, 1),
(20, '2023-04-04 10:23:00', '3', 'normaluser2', 2, '[{"changed": {"fields": ["username"]}}]', 4, 1),
(21, '2023-04-04 10:23:16', '2', 'viewuser', 2, '[{"changed": {"fields": ["username", "first_name"]}}]', 4, 1),
(22, '2023-04-04 10:23:33', '3', 'normaluser', 2, '[{"changed": {"fields": ["username", "first_name", "last_name"]}}]', 4, 1),
(23, '2023-04-04 10:23:58', '4', 'createuser', 1, '[{"added": {}}]', 4, 1),
(24, '2023-04-04 10:24:51', '4', 'createuser', 2, '[{"changed": {"fields": ["first_name", "last_name", "user_permissions"]}}]', 4, 1),
(25, '2023-04-04 10:25:30', '5', 'updateuser', 1, '[{"added": {}}]', 4, 1),
(26, '2023-04-04 10:26:20', '5', 'updateuser', 2, '[{"changed": {"fields": ["first_name", "last_name", "user_permissions"]}}]', 4, 1),
(27, '2023-04-04 10:27:05', '6', 'deleteuser', 1, '[{"added": {}}]', 4, 1),
(28, '2023-04-04 10:28:06', '6', 'deleteuser', 2, '[{"changed": {"fields": ["first_name", "last_name", "user_permissions"]}}]', 4, 1),
(29, '2023-04-04 11:27:06', '4', 'createuser', 3, '', 4, 1),
(30, '2023-04-04 11:27:25', '7', 'createuser', 1, '[{"added": {}}]', 4, 1),
(31, '2023-04-04 11:28:08', '7', 'createuser', 2, '[{"changed": {"fields": ["first_name", "last_name", "user_permissions"]}}]', 4, 1),
(32, '2023-04-13 06:11:19', '7', 'createuser', 2, '[{"changed": {"fields": ["user_permissions"]}}]', 4, 1),
(33, '2023-04-13 06:12:06', '6', 'deleteuser', 2, '[{"changed": {"fields": ["user_permissions"]}}]', 4, 1),
(34, '2023-04-13 06:13:08', '5', 'updateuser', 2, '[{"changed": {"fields": ["user_permissions"]}}]', 4, 1),
(35, '2023-04-13 06:13:33', '2', 'viewuser', 2, '[{"changed": {"fields": ["user_permissions"]}}]', 4, 1),
(36, '2023-04-13 08:47:46', '2', 'viewuser', 2, '[{"changed": {"fields": ["password"]}}]', 4, 1),
(37, '2023-04-13 08:49:28', '7', 'createuser', 2, '[{"changed": {"fields": ["password"]}}]', 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(17, 'hr_attendance', 'attendancemodel'),
(8, 'hr_contracts', 'contractsmodel'),
(10, 'hr_departments', 'departmentmodel'),
(7, 'hr_employees', 'employeemodel'),
(16, 'hr_expense', 'expensemodel'),
(9, 'hr_jobs', 'jobmodel'),
(18, 'hr_payroll', 'payrollmodel'),
(11, 'hr_recruitments', 'resumemodel'),
(12, 'hr_tags', 'contracttagmodel'),
(13, 'hr_tags', 'employeetagmodel'),
(14, 'hr_tags', 'jobtagmodel'),
(15, 'hr_tags', 'resumetagmodel'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=52 ;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-03-20 05:34:38'),
(2, 'auth', '0001_initial', '2023-03-20 05:34:43'),
(3, 'admin', '0001_initial', '2023-03-20 05:34:44'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-03-20 05:34:44'),
(5, 'contenttypes', '0002_remove_content_type_name', '2023-03-20 05:34:45'),
(6, 'auth', '0002_alter_permission_name_max_length', '2023-03-20 05:34:45'),
(7, 'auth', '0003_alter_user_email_max_length', '2023-03-20 05:34:45'),
(8, 'auth', '0004_alter_user_username_opts', '2023-03-20 05:34:45'),
(9, 'auth', '0005_alter_user_last_login_null', '2023-03-20 05:34:46'),
(10, 'auth', '0006_require_contenttypes_0002', '2023-03-20 05:34:46'),
(11, 'auth', '0007_alter_validators_add_error_messages', '2023-03-20 05:34:46'),
(12, 'auth', '0008_alter_user_username_max_length', '2023-03-20 05:34:47'),
(13, 'auth', '0009_alter_user_last_name_max_length', '2023-03-20 05:34:47'),
(14, 'sessions', '0001_initial', '2023-03-20 05:34:48'),
(20, 'hr_departments', '0001_initial', '2023-03-29 08:28:05'),
(22, 'hr_tags', '0001_initial', '2023-03-30 09:38:54'),
(23, 'hr_departments', '0002_auto_20230330_1616', '2023-03-30 09:47:07'),
(26, 'hr_jobs', '0001_initial', '2023-03-30 13:04:10'),
(27, 'hr_jobs', '0002_auto_20230327_1125', '2023-03-30 13:04:10'),
(28, 'hr_jobs', '0003_auto_20230330_1616', '2023-03-30 13:04:11'),
(29, 'hr_employees', '0001_initial', '2023-03-30 13:16:21'),
(30, 'hr_employees', '0002_auto_20230330_1618', '2023-03-30 13:16:22'),
(31, 'hr_employees', '0003_auto_20230330_1625', '2023-03-30 13:16:22'),
(32, 'hr_employees', '0004_auto_20230330_1648', '2023-03-30 13:16:22'),
(33, 'hr_employees', '0005_auto_20230330_1951', '2023-03-30 13:21:27'),
(34, 'hr_employees', '0006_auto_20230403_2114', '2023-04-03 14:44:23'),
(35, 'hr_employees', '0007_auto_20230404_1431', '2023-04-04 08:02:15'),
(36, 'hr_recruitments', '0001_initial', '2023-04-04 08:02:17'),
(37, 'hr_recruitments', '0002_auto_20230404_1434', '2023-04-04 08:04:41'),
(38, 'hr_employees', '0008_auto_20230404_1437', '2023-04-04 08:07:20'),
(39, 'hr_contracts', '0001_initial', '2023-04-04 08:07:21'),
(40, 'hr_departments', '0003_auto_20230404_1437', '2023-04-04 08:07:56'),
(41, 'hr_employees', '0009_auto_20230404_1437', '2023-04-04 08:07:57'),
(42, 'hr_jobs', '0004_auto_20230404_1437', '2023-04-04 08:07:57'),
(43, 'hr_expense', '0001_initial', '2023-04-06 08:29:27'),
(44, 'hr_attendance', '0001_initial', '2023-04-11 14:53:03'),
(45, 'hr_attendance', '0002_auto_20230412_1501', '2023-04-12 08:31:28'),
(46, 'hr_departments', '0004_auto_20230412_2126', '2023-04-12 14:56:27'),
(47, 'hr_employees', '0010_auto_20230412_2126', '2023-04-12 14:56:27'),
(48, 'hr_expense', '0002_auto_20230412_2126', '2023-04-12 14:56:27'),
(49, 'hr_expense', '0003_auto_20230412_2138', '2023-04-12 15:09:07'),
(50, 'hr_payroll', '0001_initial', '2023-04-13 06:08:37'),
(51, 'hr_contracts', '0002_auto_20230324_2108', '2023-04-25 08:34:28');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('0xi0x7jluezvl2txd7fajwzaupf51ksn', 'YTRjZWNjZjAwZGM1NWQ2YzRlNDJmNzYyODIzN2UwNmVlYTQwZWI5MDp7Il9hdXRoX3VzZXJfaWQiOiI3IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4NDdhNDI0OTQ1MTk2NDZmMDhjNzdlNGMxNDZhYmM1MGEzMWExM2U5In0=', '2023-04-18 11:39:58'),
('1opbfhsminfkqf8wz291h7fyi3hk1ebv', 'YTM3NTlkMGY1MzQwZDkxN2U2ZGFkODNjMWU2MTAwMjdmMWQ0YjkzODp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhYTU3NjVhZDc5YmM5YWNhYmM3ZGIwMDg1MGQ1MjY3ZmU2ZGIxYTZjIn0=', '2023-04-27 08:44:54'),
('7n6kbb2xv7q628mmd3dwuw3aln2ao4m1', 'OGMzMDM2OWUzM2MwODU5ZjQ2ZWQ5Y2ZjZDQwMjYwNTJlODI5MWVjMjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzZTQzYTMzNmQ5MjNjNGIwODVhMzgyNDc3OGNmMjg2NWRkY2ViNTM1In0=', '2023-04-30 07:32:01'),
('8w5bku0brb8inflgm60iqt4cj0q3kv6m', 'OGMzMDM2OWUzM2MwODU5ZjQ2ZWQ5Y2ZjZDQwMjYwNTJlODI5MWVjMjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzZTQzYTMzNmQ5MjNjNGIwODVhMzgyNDc3OGNmMjg2NWRkY2ViNTM1In0=', '2023-04-18 11:37:31'),
('aneqeabc1r2npqmmil7tr537xoku0kdt', 'ODVkOTk1ZWM0YjdmYTE5NjU4MzkzZTY4MGJjYThjNzRmNjcwYmYxZDp7Il9hdXRoX3VzZXJfaWQiOiI3IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhMjMzMWU0NDRhY2I0MDBmYmVhNjY0YTA3YWY4ZjlmNDkyZDNhZGNlIn0=', '2023-04-27 08:49:54'),
('av94k2djmc5dkq1t6fo9jbj2clu7t8jw', 'OGMzMDM2OWUzM2MwODU5ZjQ2ZWQ5Y2ZjZDQwMjYwNTJlODI5MWVjMjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzZTQzYTMzNmQ5MjNjNGIwODVhMzgyNDc3OGNmMjg2NWRkY2ViNTM1In0=', '2023-04-13 09:42:07'),
('c5wckpa2ssld2wschxpqgs62uo3bsfay', 'OGMzMDM2OWUzM2MwODU5ZjQ2ZWQ5Y2ZjZDQwMjYwNTJlODI5MWVjMjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzZTQzYTMzNmQ5MjNjNGIwODVhMzgyNDc3OGNmMjg2NWRkY2ViNTM1In0=', '2023-04-13 09:54:13'),
('d9955h6c1et94ofrqtcip1laku2xdkoa', 'OGMzMDM2OWUzM2MwODU5ZjQ2ZWQ5Y2ZjZDQwMjYwNTJlODI5MWVjMjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzZTQzYTMzNmQ5MjNjNGIwODVhMzgyNDc3OGNmMjg2NWRkY2ViNTM1In0=', '2023-04-17 14:20:27'),
('kv9wecm6nkyb6gypxl506e5ig4pd6lj0', 'OGMzMDM2OWUzM2MwODU5ZjQ2ZWQ5Y2ZjZDQwMjYwNTJlODI5MWVjMjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzZTQzYTMzNmQ5MjNjNGIwODVhMzgyNDc3OGNmMjg2NWRkY2ViNTM1In0=', '2023-04-27 08:49:28'),
('l9e6huastl8uz8nkfjgksstndi9pa8z7', 'OGMzMDM2OWUzM2MwODU5ZjQ2ZWQ5Y2ZjZDQwMjYwNTJlODI5MWVjMjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzZTQzYTMzNmQ5MjNjNGIwODVhMzgyNDc3OGNmMjg2NWRkY2ViNTM1In0=', '2023-04-24 14:35:06'),
('uzkurqe1j7v9nm6d1lkpagftwstzb6ef', 'OGMzMDM2OWUzM2MwODU5ZjQ2ZWQ5Y2ZjZDQwMjYwNTJlODI5MWVjMjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzZTQzYTMzNmQ5MjNjNGIwODVhMzgyNDc3OGNmMjg2NWRkY2ViNTM1In0=', '2023-04-03 05:37:30'),
('x5zamfhnie3o6v9iilh6dsxqqmedo6af', 'OGMzMDM2OWUzM2MwODU5ZjQ2ZWQ5Y2ZjZDQwMjYwNTJlODI5MWVjMjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzZTQzYTMzNmQ5MjNjNGIwODVhMzgyNDc3OGNmMjg2NWRkY2ViNTM1In0=', '2023-04-27 14:37:02'),
('xp2sc7xuzn74tuiwqi8foq9ndgiky4cy', 'OGMzMDM2OWUzM2MwODU5ZjQ2ZWQ5Y2ZjZDQwMjYwNTJlODI5MWVjMjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzZTQzYTMzNmQ5MjNjNGIwODVhMzgyNDc3OGNmMjg2NWRkY2ViNTM1In0=', '2023-04-28 13:50:36');

-- --------------------------------------------------------

--
-- Table structure for table `hr_attendance_attendancemodel`
--

CREATE TABLE IF NOT EXISTS `hr_attendance_attendancemodel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `day` varchar(50) NOT NULL,
  `name` varchar(20) NOT NULL,
  `intime` varchar(20) NOT NULL,
  `outtime` varchar(20) NOT NULL,
  `status` varchar(50) NOT NULL,
  `reason` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `hr_attendance_attendancemodel`
--

INSERT INTO `hr_attendance_attendancemodel` (`id`, `date`, `day`, `name`, `intime`, `outtime`, `status`, `reason`) VALUES
(1, '2023-04-03', 'Monday', 'kyaw kyaw', '09:00', '05:00', 'Present', '-'),
(2, '2023-04-03', 'Monday', 'Aye Aye', '00:00', '00:00', 'Absent', 'sick'),
(3, '2023-04-03', 'Monday', 'Tun Tun', '09:00', '12:00', 'Half Day', 'trip'),
(4, '2023-04-03', 'Monday', 'U Aung Kyaw', '9:00', '5:00', 'Present', '-'),
(5, '2023-04-03', 'Monday', 'Ko Zaw', '9:00', '5:00', 'Present', '-'),
(6, '2023-04-03', 'Monday', 'Hla Hla', '9:00', '5:00', 'Present', '-');

-- --------------------------------------------------------

--
-- Table structure for table `hr_contracts_contractsmodel`
--

CREATE TABLE IF NOT EXISTS `hr_contracts_contractsmodel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `rank` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `note` longtext NOT NULL,
  `status` varchar(10) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `create_date` datetime NOT NULL,
  `attachment` varchar(100) NOT NULL,
  `employee_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hr_contracts_contrac_employee_id_46fa5050_fk_hr_employ` (`employee_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `hr_contracts_contractsmodel`
--

INSERT INTO `hr_contracts_contractsmodel` (`id`, `name`, `rank`, `start_date`, `end_date`, `note`, `status`, `is_active`, `create_date`, `attachment`, `employee_id`) VALUES
(2, 'Kyaw Kyaw''s contract', 4, '2016-08-10', '2023-08-10', 'Note', 'confirm', 1, '2016-08-10 09:00:00', 'images/contract1.jpg', 1),
(3, 'Tun Tun''s contract', 5, '2019-04-12', '2024-04-13', 'Note', 'confirm', 1, '2019-04-12 07:16:00', 'images/contract2.jpg', 3),
(4, 'aye aye''s contract', 6, '2021-01-10', '2025-01-10', 'Note', 'confirm', 1, '2021-01-10 09:00:00', 'images/contract3.jpg', 4),
(5, 'U Aung Kyaw''s contract', 10, '2022-09-06', '2029-09-06', 'Text', 'draft', 1, '2022-09-06 10:00:00', 'images/contract4.jpg', 5),
(6, 'Ko Zaw''s contract', 6, '2020-08-09', '2025-08-09', 'Text', 'confirm', 1, '2020-08-09 10:00:00', 'images/contract5.jpg', 6),
(7, 'Hla Hla''s contract', 7, '2021-09-09', '2025-09-09', 'Text', 'confirm', 1, '2021-09-09 11:00:00', 'images/contract6.jpg', 7);

-- --------------------------------------------------------

--
-- Table structure for table `hr_contracts_contractsmodel_tags`
--

CREATE TABLE IF NOT EXISTS `hr_contracts_contractsmodel_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contractsmodel_id` int(11) NOT NULL,
  `contracttagmodel_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hr_contracts_contractsmo_contractsmodel_id_contra_178444cd_uniq` (`contractsmodel_id`,`contracttagmodel_id`),
  KEY `hr_contracts_contrac_contracttagmodel_id_f825a90d_fk_hr_tags_c` (`contracttagmodel_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `hr_contracts_contractsmodel_tags`
--

INSERT INTO `hr_contracts_contractsmodel_tags` (`id`, `contractsmodel_id`, `contracttagmodel_id`) VALUES
(2, 2, 1),
(3, 3, 2),
(4, 4, 1),
(5, 5, 2),
(6, 6, 1),
(7, 7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `hr_departments_departmentmodel`
--

CREATE TABLE IF NOT EXISTS `hr_departments_departmentmodel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `sequence` int(11) NOT NULL,
  `meeting_date` date NOT NULL,
  `total_employees` varchar(20) NOT NULL,
  `note` longtext NOT NULL,
  `status` varchar(10) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `create_date` datetime NOT NULL,
  `attachment` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `hr_departments_departmentmodel`
--

INSERT INTO `hr_departments_departmentmodel` (`id`, `name`, `sequence`, `meeting_date`, `total_employees`, `note`, `status`, `is_active`, `create_date`, `attachment`) VALUES
(1, 'Web', 2, '2023-03-29', '12', 'web Department', 'Confirm', 1, '2023-03-29 08:31:00', 'images/web-development.jpg'),
(2, 'Mobile', 3, '2023-01-03', '6', 'Mobile Department', 'Confirm', 1, '2023-03-29 11:26:00', 'images/mobile-developer.jpg'),
(4, 'Gaming', 3, '2023-04-13', '3', 'Game', 'Confirm', 1, '2023-04-13 07:04:00', 'images/gaming_department.jpg'),
(5, 'Android', 4, '2022-02-12', '5', 'Android', 'Confirm', 1, '2022-02-12 13:00:00', 'images/Android-Application-Development.jpg'),
(6, 'IOS', 4, '2023-01-14', '9', 'IOS', 'Confirm', 1, '2023-01-14 14:00:00', 'images/ios-development.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `hr_employees_employeemodel`
--

CREATE TABLE IF NOT EXISTS `hr_employees_employeemodel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `age` int(11) NOT NULL,
  `birthday` date NOT NULL,
  `address` varchar(100) NOT NULL,
  `email` varchar(254) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `is_married` tinyint(1) NOT NULL,
  `joining_date` datetime NOT NULL,
  `image` varchar(100) NOT NULL,
  `job_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hr_employees_employe_job_id_21d5f4dd_fk_hr_jobs_j` (`job_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `hr_employees_employeemodel`
--

INSERT INTO `hr_employees_employeemodel` (`id`, `name`, `age`, `birthday`, `address`, `email`, `gender`, `is_married`, `joining_date`, `image`, `job_id`) VALUES
(1, 'Kyaw Kyaw', 24, '2000-02-05', 'Yangon', 'kyawkyaw@gmail.com', 'male', 0, '2023-03-31 03:42:00', 'images/profile1.jpg', 1),
(3, 'Tun Tun', 30, '1993-08-16', 'Yangon', 'tuntun@gmail.com', 'male', 1, '2022-05-09 14:20:00', 'images/profile7.jpg', 2),
(4, 'Aye Aye', 28, '1995-04-14', 'Mandalay', 'ayeaye@gmail.com', 'female', 0, '2023-03-25 14:27:00', 'images/profile6.jpg', 1),
(5, 'U Aung Kyaw', 50, '1973-04-15', 'Yangon', 'AungKyaw@gmail.com', 'male', 1, '2018-04-15 09:00:00', 'images/profile8.jpg', 7),
(6, 'Ko Zaw', 25, '1998-04-15', 'Yangon', 'kozaw@gmail.com', 'male', 0, '2022-04-15 09:00:00', 'images/profile4.jpg', 5),
(7, 'Hla Hla', 26, '1997-01-08', 'Yangon', 'hlahla@gmail.com', 'female', 0, '2023-04-10 09:00:00', 'images/profile2.jpg', 3);

-- --------------------------------------------------------

--
-- Table structure for table `hr_employees_employeemodel_tags`
--

CREATE TABLE IF NOT EXISTS `hr_employees_employeemodel_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employeemodel_id` int(11) NOT NULL,
  `employeetagmodel_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hr_employees_employeemod_employeemodel_id_employe_d1a0b3b2_uniq` (`employeemodel_id`,`employeetagmodel_id`),
  KEY `hr_employees_employe_employeetagmodel_id_7a194511_fk_hr_tags_e` (`employeetagmodel_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `hr_employees_employeemodel_tags`
--

INSERT INTO `hr_employees_employeemodel_tags` (`id`, `employeemodel_id`, `employeetagmodel_id`) VALUES
(3, 1, 1),
(1, 1, 2),
(4, 3, 2),
(5, 4, 2),
(6, 5, 2),
(7, 6, 2),
(8, 7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `hr_expense_expensemodel`
--

CREATE TABLE IF NOT EXISTS `hr_expense_expensemodel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itemname` varchar(20) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` varchar(20) NOT NULL,
  `amount` varchar(20) NOT NULL,
  `date` date NOT NULL,
  `category` varchar(50) NOT NULL,
  `employee` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `hr_expense_expensemodel`
--

INSERT INTO `hr_expense_expensemodel` (`id`, `itemname`, `quantity`, `price`, `amount`, `date`, `category`, `employee`) VALUES
(1, 'printer', 1, '300000', '300000', '2023-04-06', 'Office Supplies', 'kyaw kyaw'),
(2, 'Coffee 65g', 2, '3000', '6000', '2023-03-04', 'Food', 'Aye Aye'),
(3, 'Tissue box', 3, '1000', '3000', '2023-03-02', 'Office Supplies', 'Ko Zaw'),
(4, 'headache medicine', 1, '5000', '5000', '2023-03-07', 'Medicine', 'U Aung Kyaw'),
(5, 'Coca Cola', 5, '500', '2500', '2023-03-25', 'Food', 'Hla Hla'),
(6, 'loptop repair', 1, '30000', '30000', '2023-04-10', 'Repair', 'Aye Aye');

-- --------------------------------------------------------

--
-- Table structure for table `hr_jobs_jobmodel`
--

CREATE TABLE IF NOT EXISTS `hr_jobs_jobmodel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `sequence` int(11) NOT NULL,
  `open_date` date NOT NULL,
  `expected_salary` varchar(20) NOT NULL,
  `note` longtext NOT NULL,
  `status` varchar(10) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `create_date` datetime NOT NULL,
  `attachment` varchar(100) NOT NULL,
  `department_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hr_jobs_jobmodel_department_id_cac3ead6_fk_hr_depart` (`department_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `hr_jobs_jobmodel`
--

INSERT INTO `hr_jobs_jobmodel` (`id`, `name`, `sequence`, `open_date`, `expected_salary`, `note`, `status`, `is_active`, `create_date`, `attachment`, `department_id`) VALUES
(1, 'Web developer', 3, '2023-03-31', '200000', 'Note', 'draft', 0, '2023-03-31 03:46:00', 'images/webdeveloper.jpg', 1),
(2, 'Mobile Tester', 4, '2022-01-26', '300000', 'Tester', 'Confirm', 1, '2023-03-31 03:57:00', 'images/mobiletester.jpg', 2),
(3, 'Junior Developer', 4, '2019-04-07', '300000', 'developer', 'Confirm', 1, '2019-04-06 09:00:00', 'images/juniordeveloper.jpg', 1),
(5, 'Game Developer', 2, '2023-03-13', '300000', 'game', 'Confirm', 1, '2023-03-13 09:00:00', 'images/gamedeveloper.jpg', 4),
(6, 'App Developer', 5, '2022-04-12', '300000', 'Application', 'Confirm', 1, '2022-04-12 13:50:00', 'images/Mobile-App-Developer.jpg', 5),
(7, 'Software Tester', 4, '2022-02-11', '400000', 'tester', 'Confirm', 0, '2022-02-11 13:58:00', 'images/software_engineer.jpg', 6);

-- --------------------------------------------------------

--
-- Table structure for table `hr_jobs_jobmodel_tags`
--

CREATE TABLE IF NOT EXISTS `hr_jobs_jobmodel_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jobmodel_id` int(11) NOT NULL,
  `jobtagmodel_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hr_jobs_jobmodel_tags_jobmodel_id_jobtagmodel_id_ff8e3541_uniq` (`jobmodel_id`,`jobtagmodel_id`),
  KEY `hr_jobs_jobmodel_tag_jobtagmodel_id_4b42092e_fk_hr_tags_j` (`jobtagmodel_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `hr_jobs_jobmodel_tags`
--

INSERT INTO `hr_jobs_jobmodel_tags` (`id`, `jobmodel_id`, `jobtagmodel_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(5, 5, 1),
(6, 6, 1),
(7, 7, 2);

-- --------------------------------------------------------

--
-- Table structure for table `hr_payroll_payrollmodel`
--

CREATE TABLE IF NOT EXISTS `hr_payroll_payrollmodel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `salary` varchar(20) NOT NULL,
  `bonus` longtext NOT NULL,
  `mulct` varchar(50) NOT NULL,
  `total` varchar(50) NOT NULL,
  `pay_day` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `hr_payroll_payrollmodel`
--

INSERT INTO `hr_payroll_payrollmodel` (`id`, `name`, `salary`, `bonus`, `mulct`, `total`, `pay_day`) VALUES
(1, 'Kyaw Kyaw', '300000', '30000', '10000', '320000', '2023-04-01 17:00:00'),
(2, 'Aye Aye', '200000', '30000', '5000', '225000', '2023-04-01 16:50:00'),
(3, 'Tun Tun', '300000', '30000', '20000', '310000', '2023-04-01 17:01:00'),
(4, 'U Aung Kyaw', '400000', '20000', '0', '420000', '2023-04-01 16:30:00'),
(5, 'Ko Zaw', '300000', '30000', '10000', '320000', '2023-04-01 16:41:00'),
(6, 'Hla Hla', '300000', '20000', '5000', '315000', '2023-04-01 16:45:00');

-- --------------------------------------------------------

--
-- Table structure for table `hr_recruitments_resumemodel`
--

CREATE TABLE IF NOT EXISTS `hr_recruitments_resumemodel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `sequence` int(11) NOT NULL,
  `appointment_date` date NOT NULL,
  `note` longtext NOT NULL,
  `status` varchar(10) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `create_date` datetime NOT NULL,
  `attachment` varchar(100) NOT NULL,
  `employee_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hr_recruitments_resu_employee_id_7c5620ba_fk_hr_employ` (`employee_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `hr_recruitments_resumemodel`
--

INSERT INTO `hr_recruitments_resumemodel` (`id`, `name`, `sequence`, `appointment_date`, `note`, `status`, `is_active`, `create_date`, `attachment`, `employee_id`) VALUES
(1, 'Mobile Tester', 2, '2023-03-29', 'Tester', 'Confirm', 1, '2023-03-29 11:31:00', 'images/Mobile_tester.jpg', 1),
(3, 'Software Developer', 3, '2023-04-16', 'Software', 'Confirm', 1, '2023-04-14 13:30:00', 'images/softwaredeveloper.jpg', 5),
(4, 'Game Tester', 4, '2023-04-13', 'Game', 'Confirm', 1, '2023-04-13 13:46:00', 'images/gametester.jpg', 7),
(5, 'Senior Developer', 2, '2023-04-15', 'Developer', 'Confirm', 1, '2023-04-15 14:03:00', 'images/senior_developer.jpg', 6),
(6, 'web_security', 7, '2023-04-13', 'security', 'Confirm', 1, '2023-04-13 14:05:00', 'images/web_security.jpg', 3);

-- --------------------------------------------------------

--
-- Table structure for table `hr_recruitments_resumemodel_tags`
--

CREATE TABLE IF NOT EXISTS `hr_recruitments_resumemodel_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resumemodel_id` int(11) NOT NULL,
  `resumetagmodel_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hr_recruitments_resumemo_resumemodel_id_resumetag_a0f556bd_uniq` (`resumemodel_id`,`resumetagmodel_id`),
  KEY `hr_recruitments_resu_resumetagmodel_id_9aa835bb_fk_hr_tags_r` (`resumetagmodel_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `hr_recruitments_resumemodel_tags`
--

INSERT INTO `hr_recruitments_resumemodel_tags` (`id`, `resumemodel_id`, `resumetagmodel_id`) VALUES
(1, 1, 1),
(3, 3, 2),
(4, 4, 1),
(5, 5, 2),
(6, 6, 1);

-- --------------------------------------------------------

--
-- Table structure for table `hr_tags_contracttagmodel`
--

CREATE TABLE IF NOT EXISTS `hr_tags_contracttagmodel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `hr_tags_contracttagmodel`
--

INSERT INTO `hr_tags_contracttagmodel` (`id`, `name`) VALUES
(1, 'employee'),
(2, 'subcontractor');

-- --------------------------------------------------------

--
-- Table structure for table `hr_tags_employeetagmodel`
--

CREATE TABLE IF NOT EXISTS `hr_tags_employeetagmodel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `hr_tags_employeetagmodel`
--

INSERT INTO `hr_tags_employeetagmodel` (`id`, `name`) VALUES
(1, 'parttime'),
(2, 'fulltime');

-- --------------------------------------------------------

--
-- Table structure for table `hr_tags_jobtagmodel`
--

CREATE TABLE IF NOT EXISTS `hr_tags_jobtagmodel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `hr_tags_jobtagmodel`
--

INSERT INTO `hr_tags_jobtagmodel` (`id`, `name`) VALUES
(1, 'open'),
(2, 'close');

-- --------------------------------------------------------

--
-- Table structure for table `hr_tags_resumetagmodel`
--

CREATE TABLE IF NOT EXISTS `hr_tags_resumetagmodel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `hr_tags_resumetagmodel`
--

INSERT INTO `hr_tags_resumetagmodel` (`id`, `name`) VALUES
(1, 'firstinterview'),
(2, 'secondinterview');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `hr_contracts_contractsmodel`
--
ALTER TABLE `hr_contracts_contractsmodel`
  ADD CONSTRAINT `hr_contracts_contrac_employee_id_46fa5050_fk_hr_employ` FOREIGN KEY (`employee_id`) REFERENCES `hr_employees_employeemodel` (`id`);

--
-- Constraints for table `hr_contracts_contractsmodel_tags`
--
ALTER TABLE `hr_contracts_contractsmodel_tags`
  ADD CONSTRAINT `hr_contracts_contrac_contractsmodel_id_7b8d783b_fk_hr_contra` FOREIGN KEY (`contractsmodel_id`) REFERENCES `hr_contracts_contractsmodel` (`id`),
  ADD CONSTRAINT `hr_contracts_contrac_contracttagmodel_id_f825a90d_fk_hr_tags_c` FOREIGN KEY (`contracttagmodel_id`) REFERENCES `hr_tags_contracttagmodel` (`id`);

--
-- Constraints for table `hr_employees_employeemodel`
--
ALTER TABLE `hr_employees_employeemodel`
  ADD CONSTRAINT `hr_employees_employe_job_id_21d5f4dd_fk_hr_jobs_j` FOREIGN KEY (`job_id`) REFERENCES `hr_jobs_jobmodel` (`id`);

--
-- Constraints for table `hr_employees_employeemodel_tags`
--
ALTER TABLE `hr_employees_employeemodel_tags`
  ADD CONSTRAINT `hr_employees_employe_employeemodel_id_ba21c737_fk_hr_employ` FOREIGN KEY (`employeemodel_id`) REFERENCES `hr_employees_employeemodel` (`id`),
  ADD CONSTRAINT `hr_employees_employe_employeetagmodel_id_7a194511_fk_hr_tags_e` FOREIGN KEY (`employeetagmodel_id`) REFERENCES `hr_tags_employeetagmodel` (`id`);

--
-- Constraints for table `hr_jobs_jobmodel`
--
ALTER TABLE `hr_jobs_jobmodel`
  ADD CONSTRAINT `hr_jobs_jobmodel_department_id_cac3ead6_fk_hr_depart` FOREIGN KEY (`department_id`) REFERENCES `hr_departments_departmentmodel` (`id`);

--
-- Constraints for table `hr_jobs_jobmodel_tags`
--
ALTER TABLE `hr_jobs_jobmodel_tags`
  ADD CONSTRAINT `hr_jobs_jobmodel_tag_jobmodel_id_d91bee4f_fk_hr_jobs_j` FOREIGN KEY (`jobmodel_id`) REFERENCES `hr_jobs_jobmodel` (`id`),
  ADD CONSTRAINT `hr_jobs_jobmodel_tag_jobtagmodel_id_4b42092e_fk_hr_tags_j` FOREIGN KEY (`jobtagmodel_id`) REFERENCES `hr_tags_jobtagmodel` (`id`);

--
-- Constraints for table `hr_recruitments_resumemodel`
--
ALTER TABLE `hr_recruitments_resumemodel`
  ADD CONSTRAINT `hr_recruitments_resu_employee_id_7c5620ba_fk_hr_employ` FOREIGN KEY (`employee_id`) REFERENCES `hr_employees_employeemodel` (`id`);

--
-- Constraints for table `hr_recruitments_resumemodel_tags`
--
ALTER TABLE `hr_recruitments_resumemodel_tags`
  ADD CONSTRAINT `hr_recruitments_resu_resumemodel_id_fbefa5c8_fk_hr_recrui` FOREIGN KEY (`resumemodel_id`) REFERENCES `hr_recruitments_resumemodel` (`id`),
  ADD CONSTRAINT `hr_recruitments_resu_resumetagmodel_id_9aa835bb_fk_hr_tags_r` FOREIGN KEY (`resumetagmodel_id`) REFERENCES `hr_tags_resumetagmodel` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
