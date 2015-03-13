-- phpMyAdmin SQL Dump
-- version 4.0.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 26, 2013 at 02:31 PM
-- Server version: 5.0.92-community-log
-- PHP Version: 5.3.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `marcus_placczarnieckiego`
--

-- --------------------------------------------------------

--
-- Table structure for table `musca_auth`
--

DROP TABLE IF EXISTS `musca_auth`;
CREATE TABLE IF NOT EXISTS `musca_auth` (
  `id_auth` int(11) NOT NULL auto_increment,
  `name` varchar(100) default NULL,
  `username` varchar(20) default NULL,
  `password` varchar(50) default NULL,
  `enabled` tinyint(1) default NULL,
  `id_auth_rol` int(11) NOT NULL default '1',
  `indelible` tinyint(1) default '0',
  PRIMARY KEY  (`id_auth`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `musca_auth`
--

INSERT INTO `musca_auth` (`id_auth`, `name`, `username`, `password`, `enabled`, `id_auth_rol`, `indelible`) VALUES
(1, 'Musca', 'musca', '1d886fdd3d849d2e84cfef6260626c635da06057', 1, 1, 1),
(2, 'Demo', 'demo', '89e495e7941cf9e40e6980d14a16bf023ccd4c91', 1, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `musca_auth_rol`
--

DROP TABLE IF EXISTS `musca_auth_rol`;
CREATE TABLE IF NOT EXISTS `musca_auth_rol` (
  `id_auth_rol` int(11) NOT NULL auto_increment,
  `name` varchar(100) collate utf8_unicode_ci default NULL,
  `description` tinytext collate utf8_unicode_ci,
  `enabled` tinyint(1) default '1',
  PRIMARY KEY  (`id_auth_rol`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `musca_auth_rol`
--

INSERT INTO `musca_auth_rol` (`id_auth_rol`, `name`, `description`, `enabled`) VALUES
(2, 'Administrador', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `musca_config`
--

DROP TABLE IF EXISTS `musca_config`;
CREATE TABLE IF NOT EXISTS `musca_config` (
  `id_config` int(11) NOT NULL auto_increment,
  `section` varchar(50) NOT NULL default '',
  `name` varchar(50) NOT NULL default '',
  `value` text,
  `description` text,
  `user_show` tinyint(1) default '0',
  PRIMARY KEY  (`id_config`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=26 ;

--
-- Dumping data for table `musca_config`
--

INSERT INTO `musca_config` (`id_config`, `section`, `name`, `value`, `description`, `user_show`) VALUES
(24, 'email', 'email', 'hello@jacobmarcus.com', 'Email', 1);

-- --------------------------------------------------------

--
-- Table structure for table `musca_i18n`
--

DROP TABLE IF EXISTS `musca_i18n`;
CREATE TABLE IF NOT EXISTS `musca_i18n` (
  `id_i18n` int(11) NOT NULL auto_increment,
  `section` varchar(50) NOT NULL default '',
  `detail` varchar(50) default NULL,
  `tag` varchar(50) NOT NULL default '',
  `lang` varchar(2) NOT NULL default '',
  `value` text,
  `value_tpl` text,
  `date_modified` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `seen` int(11) default '0',
  `html` tinyint(1) default '0',
  `file` tinyint(1) default NULL,
  `image` tinyint(1) default NULL,
  `width` int(11) default NULL,
  `height` int(11) default NULL,
  `crop` tinyint(1) default NULL,
  `admin` tinyint(1) NOT NULL,
  PRIMARY KEY  (`id_i18n`),
  UNIQUE KEY `section` (`section`,`tag`,`lang`),
  KEY `admin` (`admin`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=61 ;

--
-- Dumping data for table `musca_i18n`
--

INSERT INTO `musca_i18n` (`id_i18n`, `section`, `detail`, `tag`, `lang`, `value`, `value_tpl`, `date_modified`, `seen`, `html`, `file`, `image`, `width`, `height`, `crop`, `admin`) VALUES
(1, 'index', '', '3d6bf328b3ddec3f26f1355943c36941', 'en', 'page title', 'page title', '2013-11-20 01:20:19', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(2, 'index', '', '3d6bf328b3ddec3f26f1355943c36941', 'es', 'page title', 'page title', '2013-11-20 01:20:19', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(3, 'index', '', '3d6bf328b3ddec3f26f1355943c36941', 'pl', 'page title', 'page title', '2013-11-20 01:20:19', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(4, 'index', '', '648e867e764be130f6d604824924139c', 'en', 'meta description', 'meta description', '2013-11-20 01:20:19', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(5, 'index', '', '648e867e764be130f6d604824924139c', 'es', 'meta description', 'meta description', '2013-11-20 01:20:19', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(6, 'index', '', '648e867e764be130f6d604824924139c', 'pl', 'meta description', 'meta description', '2013-11-20 01:20:19', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(7, 'index', '', '8b1a9953c4611296a827abf8c47804d7', 'en', 'Yo man!', 'Hello', '2013-11-20 01:21:09', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(8, 'index', '', '8b1a9953c4611296a827abf8c47804d7', 'es', 'Hola hombre!', 'Hello', '2013-11-20 01:21:56', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(9, 'index', '', '8b1a9953c4611296a827abf8c47804d7', 'pl', 'Siema ziom!', 'Hello', '2013-11-20 02:29:20', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(10, 'error', '', '4f4adcbf8c6f66dcfc8a3282ac2bf10a', 'en', '404', '404', '2013-11-20 01:23:49', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(11, 'error', '', '4f4adcbf8c6f66dcfc8a3282ac2bf10a', 'es', '404', '404', '2013-11-20 01:23:49', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(12, 'error', '', '4f4adcbf8c6f66dcfc8a3282ac2bf10a', 'pl', '404', '404', '2013-11-20 01:23:49', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(13, 'error', '', 'e6616b01b62d6ee8f9901f912bf1ff79', 'en', 'Ain''t no page at this address, captain!', 'Ain''t no page at this address, captain!', '2013-11-20 01:23:49', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(14, 'error', '', 'e6616b01b62d6ee8f9901f912bf1ff79', 'es', 'Ain''t no page at this address, captain!', 'Ain''t no page at this address, captain!', '2013-11-20 01:23:49', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(15, 'error', '', 'e6616b01b62d6ee8f9901f912bf1ff79', 'pl', 'Ain''t no page at this address, captain!', 'Ain''t no page at this address, captain!', '2013-11-20 01:23:49', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(22, 'menu', '', '6c7195551da0802a39b5e2bc7187df54', 'en', 'Toggle navigation', 'Toggle navigation', '2013-11-25 19:29:00', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(23, 'menu', '', '6c7195551da0802a39b5e2bc7187df54', 'es', 'Toggle navigation', 'Toggle navigation', '2013-11-25 19:29:00', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(24, 'menu', '', '6c7195551da0802a39b5e2bc7187df54', 'pl', 'Toggle navigation', 'Toggle navigation', '2013-11-25 19:29:00', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(25, 'menu', '', '8cf04a9734132302f96da8e113e80ce5', 'en', 'Home', 'Home', '2013-11-25 19:29:00', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(26, 'menu', '', '8cf04a9734132302f96da8e113e80ce5', 'es', 'Home', 'Home', '2013-11-25 19:29:00', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(27, 'menu', '', '8cf04a9734132302f96da8e113e80ce5', 'pl', 'Home', 'Home', '2013-11-25 19:29:00', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(28, 'menu', '', '068f80c7519d0528fb08e82137a72131', 'en', 'Products', 'Products', '2013-11-25 19:29:00', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(29, 'menu', '', '068f80c7519d0528fb08e82137a72131', 'es', 'Products', 'Products', '2013-11-25 19:29:00', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(30, 'menu', '', '068f80c7519d0528fb08e82137a72131', 'pl', 'Products', 'Products', '2013-11-25 19:29:00', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(31, 'menu', '', '4f4adcbf8c6f66dcfc8a3282ac2bf10a', 'en', '404', '404', '2013-11-25 19:29:00', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(32, 'menu', '', '4f4adcbf8c6f66dcfc8a3282ac2bf10a', 'es', '404', '404', '2013-11-25 19:29:00', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(33, 'menu', '', '4f4adcbf8c6f66dcfc8a3282ac2bf10a', 'pl', '404', '404', '2013-11-25 19:29:00', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(34, 'page', '', '648e867e764be130f6d604824924139c', 'en', 'meta description', 'meta description', '2013-11-25 19:45:18', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(35, 'page', '', '648e867e764be130f6d604824924139c', 'es', 'meta description', 'meta description', '2013-11-25 19:45:18', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(36, 'page', '', '648e867e764be130f6d604824924139c', 'pl', 'meta description', 'meta description', '2013-11-25 19:45:18', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(37, 'menu', '', '345961c0e804d1a3dd5749d853390a35', 'en', 'Tjurar', 'Tjurar', '2013-11-25 20:11:36', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(38, 'menu', '', '345961c0e804d1a3dd5749d853390a35', 'es', 'Tjurar', 'Tjurar', '2013-11-25 20:11:36', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(39, 'menu', '', '345961c0e804d1a3dd5749d853390a35', 'pl', 'Tjurar', 'Tjurar', '2013-11-25 20:11:36', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(40, 'menu', '', '126035287b107775dc9dd4bf76725c94', 'en', 'Förkortningar', 'Förkortningar', '2013-11-25 20:11:36', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(41, 'menu', '', '126035287b107775dc9dd4bf76725c94', 'es', 'Förkortningar', 'Förkortningar', '2013-11-25 20:11:36', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(42, 'menu', '', '126035287b107775dc9dd4bf76725c94', 'pl', 'Förkortningar', 'Förkortningar', '2013-11-25 20:11:36', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(43, 'menu', '', 'c32672504d7285bf8b04f393c2796c52', 'en', 'Gamla tjurar', 'Gamla tjurar', '2013-11-25 20:11:36', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(44, 'menu', '', 'c32672504d7285bf8b04f393c2796c52', 'es', 'Gamla tjurar', 'Gamla tjurar', '2013-11-25 20:11:36', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(45, 'menu', '', 'c32672504d7285bf8b04f393c2796c52', 'pl', 'Gamla tjurar', 'Gamla tjurar', '2013-11-25 20:11:36', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(46, 'menu', '', 'c809e26bf6fe98be3888695f3e08e262', 'en', 'Om oss', 'Om oss', '2013-11-25 20:11:36', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(47, 'menu', '', 'c809e26bf6fe98be3888695f3e08e262', 'es', 'Om oss', 'Om oss', '2013-11-25 20:11:36', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(48, 'menu', '', 'c809e26bf6fe98be3888695f3e08e262', 'pl', 'Om oss', 'Om oss', '2013-11-25 20:11:36', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(49, 'menu', '', '3691308f2a4c2f6983f2880d32e29c84', 'en', 'ss', 'ss', '2013-11-25 20:11:36', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(50, 'menu', '', '3691308f2a4c2f6983f2880d32e29c84', 'es', 'ss', 'ss', '2013-11-25 20:11:36', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(51, 'menu', '', '3691308f2a4c2f6983f2880d32e29c84', 'pl', 'ss', 'ss', '2013-11-25 20:11:36', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(52, 'menu', '', 'ddbac82a201a23d4737376af67b8e79d', 'en', 'ooooooo', 'ooooooo', '2013-11-25 20:11:36', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(53, 'menu', '', 'ddbac82a201a23d4737376af67b8e79d', 'es', 'ooooooo', 'ooooooo', '2013-11-25 20:11:36', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(54, 'menu', '', 'ddbac82a201a23d4737376af67b8e79d', 'pl', 'ooooooo', 'ooooooo', '2013-11-25 20:11:36', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(55, 'product', '', '3d6bf328b3ddec3f26f1355943c36941', 'en', 'page title', 'page title', '2013-11-25 20:15:30', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(56, 'product', '', '3d6bf328b3ddec3f26f1355943c36941', 'es', 'page title', 'page title', '2013-11-25 20:15:30', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(57, 'product', '', '3d6bf328b3ddec3f26f1355943c36941', 'pl', 'page title', 'page title', '2013-11-25 20:15:30', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(58, 'product', '', '648e867e764be130f6d604824924139c', 'en', 'meta description', 'meta description', '2013-11-25 20:15:30', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(59, 'product', '', '648e867e764be130f6d604824924139c', 'es', 'meta description', 'meta description', '2013-11-25 20:15:30', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(60, 'product', '', '648e867e764be130f6d604824924139c', 'pl', 'meta description', 'meta description', '2013-11-25 20:15:30', 0, 0, NULL, NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `musca_i18n_admin`
--

DROP TABLE IF EXISTS `musca_i18n_admin`;
CREATE TABLE IF NOT EXISTS `musca_i18n_admin` (
  `id_i18n` int(11) NOT NULL auto_increment,
  `section` varchar(50) NOT NULL default '',
  `detail` varchar(50) default NULL,
  `tag` varchar(50) NOT NULL default '',
  `lang` varchar(2) NOT NULL default '',
  `value` text,
  `value_tpl` text,
  `date_modified` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `seen` int(11) default '0',
  `html` tinyint(1) default '0',
  `file` tinyint(1) default NULL,
  `image` tinyint(1) default NULL,
  `width` int(11) default NULL,
  `height` int(11) default NULL,
  `crop` tinyint(1) default NULL,
  PRIMARY KEY  (`id_i18n`),
  UNIQUE KEY `section` (`section`,`tag`,`lang`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=659 ;

--
-- Dumping data for table `musca_i18n_admin`
--

INSERT INTO `musca_i18n_admin` (`id_i18n`, `section`, `detail`, `tag`, `lang`, `value`, `value_tpl`, `date_modified`, `seen`, `html`, `file`, `image`, `width`, `height`, `crop`) VALUES
(6, 'meta_tags', '', 'c7da501f54544eba6787960200d9efdb', 'en', 'CMS', 'CMS', '2013-11-01 14:02:32', 0, 0, NULL, NULL, NULL, NULL, NULL),
(10, 'musca_translation', '', '0b8d92bc19b720bb1065649535463409', 'en', 'Translations', 'Translations', '2013-11-01 14:02:32', 0, 0, NULL, NULL, NULL, NULL, NULL),
(12, 'musca_auth', '', 'c1ec1d62eafad32ca16fe4df49b9ca2f', 'en', 'Administrators', 'Administrators', '2013-11-01 14:02:32', 0, 0, NULL, NULL, NULL, NULL, NULL),
(408, 'fields', '', '49ee3087348e8d44e1feda1917443987', 'pl', 'Name', 'Name', '2013-11-05 20:54:06', 0, 0, NULL, NULL, NULL, NULL, NULL),
(14, 'musca_translation_admin', '', '98bef4cbc575d67f36a26d066450cc9d', 'en', 'Admin Translations', 'Admin Translations', '2013-11-01 14:02:32', 0, 0, NULL, NULL, NULL, NULL, NULL),
(15, 'musca_auth_rol', '', 'a5cd3ed116608dac017f14c046ea56bf', 'en', 'Roles', 'Roles', '2013-11-01 14:02:32', 0, 0, NULL, NULL, NULL, NULL, NULL),
(23, 'musca_translation_admin', '', '7dce122004969d56ae2e0245cb754d35', 'en', 'Edit', 'Edit', '2013-11-01 14:02:36', 0, 0, NULL, NULL, NULL, NULL, NULL),
(24, 'musca_translation_admin', '', 'f2a6c498fb90ee345d997f888fce3b18', 'en', 'Delete', 'Delete', '2013-11-01 14:02:36', 0, 0, NULL, NULL, NULL, NULL, NULL),
(25, 'musca_translation_admin', '', '4c41e0bd957698b58100a5c687d757d9', 'en', 'Select all', 'Select all', '2013-11-01 14:02:36', 0, 0, NULL, NULL, NULL, NULL, NULL),
(26, 'musca_translation_admin', '', '52e3ce2bc983012661c3c11fe8b0f8ce', 'en', 'Deselect all', 'Deselect all', '2013-11-01 14:02:36', 0, 0, NULL, NULL, NULL, NULL, NULL),
(28, 'musca_translation_admin', '', '5185d96d6658228fe3b0e99c120165b0', 'en', 'Edit whole section', 'Edit whole section', '2013-11-01 14:02:36', 0, 0, NULL, NULL, NULL, NULL, NULL),
(29, 'musca_translation_admin', '', 'd2c24d59e0baff4d0155fbdf62590867', 'en', 'Section', 'Section', '2013-11-01 14:02:36', 0, 0, NULL, NULL, NULL, NULL, NULL),
(30, 'musca_translation_admin', '', 'a76f1ff1e2d5161f8106ba04b6e58c9e', 'en', 'Translate from', 'Translate from', '2013-11-01 14:02:36', 0, 0, NULL, NULL, NULL, NULL, NULL),
(31, 'musca_translation_admin', '', '9cfefed8fb9497baa5cd519d7d2bb5d7', 'en', 'en', 'en', '2013-11-01 14:02:36', 0, 0, NULL, NULL, NULL, NULL, NULL),
(32, 'musca_translation_admin', '', 'f40f0a146b015acb0b4c5f5e933d8055', 'en', 'Translate to', 'Translate to', '2013-11-01 14:02:36', 0, 0, NULL, NULL, NULL, NULL, NULL),
(33, 'musca_translation_admin', '', 'a6bfac9070b89c1a9e61090402ca458d', 'en', 'Search for text', 'Search for text', '2013-11-01 14:02:36', 0, 0, NULL, NULL, NULL, NULL, NULL),
(34, 'musca_translation_admin', '', 'b1c94ca2fbc3e78fc30069c8d0f01680', 'en', 'All', 'All', '2013-11-01 14:02:36', 0, 0, NULL, NULL, NULL, NULL, NULL),
(35, 'musca_translation_admin', '', '4994a8ffeba4ac3140beb89e8d41f174', 'en', 'Language', 'Language', '2013-11-01 14:02:36', 0, 0, NULL, NULL, NULL, NULL, NULL),
(36, 'musca_translation_admin', '', 'd91c1c514f19642ce9d165800eccf198', 'en', 'Translated text', 'Translated text', '2013-11-01 14:02:36', 0, 0, NULL, NULL, NULL, NULL, NULL),
(37, 'musca_translation_admin', '', '900f866636ca9a4a158bafe7677aaba6', 'en', 'Original text', 'Original text', '2013-11-01 14:02:36', 0, 0, NULL, NULL, NULL, NULL, NULL),
(51, 'musca_translation_admin', '', '3a08e2e340ab29fd9263af48193cbf8e', 'en', 'Languages', 'Languages', '2013-11-01 14:02:36', 0, 0, NULL, NULL, NULL, NULL, NULL),
(58, 'buttons', '', 'c9cc8cce247e49bae79f15173ce97354', 'en', 'Save', 'Save', '2013-11-01 15:20:19', 0, 0, NULL, NULL, NULL, NULL, NULL),
(59, 'buttons', '', '0557fa923dcee4d0f86b1409f5c2167f', 'en', 'Back', 'Back', '2013-11-01 14:05:38', 0, 0, NULL, NULL, NULL, NULL, NULL),
(60, 'buttons', '', '03c2e7e41ffc181a4e84080b4710e81e', 'en', 'New', 'New', '2013-11-01 14:05:38', 0, 0, NULL, NULL, NULL, NULL, NULL),
(61, 'musca_lang_admin', '', '4e140ba723a03baa6948340bf90e2ef6', 'en', 'Name:', 'Name:', '2013-11-01 14:05:38', 0, 0, NULL, NULL, NULL, NULL, NULL),
(62, 'message', '', '0511ee0d41117aa7b4abaaf102aa513d', 'en', 'This field is required', 'This field is required', '2013-11-01 14:05:38', 0, 0, NULL, NULL, NULL, NULL, NULL),
(63, 'message', '', '0cb7de2c9a7540815be0589213aa5147', 'en', 'Data has been saved successfully.', 'Data has been saved successfully.', '2013-11-01 14:07:11', 0, 0, NULL, NULL, NULL, NULL, NULL),
(73, 'meta_tags', '', 'c7da501f54544eba6787960200d9efdb', 'es', 'CMS', 'CMS', '2013-11-01 14:07:24', 0, 0, NULL, NULL, NULL, NULL, NULL),
(393, 'musca_lang', '', '3a08e2e340ab29fd9263af48193cbf8e', 'pl', 'Languages', 'Languages', '2013-11-01 15:48:41', 0, 0, NULL, NULL, NULL, NULL, NULL),
(77, 'musca_translation', '', '0b8d92bc19b720bb1065649535463409', 'es', 'Translations', 'Translations', '2013-11-01 14:07:24', 0, 0, NULL, NULL, NULL, NULL, NULL),
(79, 'musca_auth', '', 'c1ec1d62eafad32ca16fe4df49b9ca2f', 'es', 'Administrators', 'Administrators', '2013-11-01 14:07:24', 0, 0, NULL, NULL, NULL, NULL, NULL),
(407, 'fields', '', '49ee3087348e8d44e1feda1917443987', 'en', 'Name', 'Name', '2013-11-05 20:54:06', 0, 0, NULL, NULL, NULL, NULL, NULL),
(81, 'musca_translation_admin', '', '98bef4cbc575d67f36a26d066450cc9d', 'es', 'Admin Translations', 'Admin Translations', '2013-11-01 14:07:24', 0, 0, NULL, NULL, NULL, NULL, NULL),
(82, 'musca_auth_rol', '', 'a5cd3ed116608dac017f14c046ea56bf', 'es', 'Roles', 'Roles', '2013-11-01 14:07:24', 0, 0, NULL, NULL, NULL, NULL, NULL),
(392, 'musca_lang', '', '3a08e2e340ab29fd9263af48193cbf8e', 'en', 'Languages', 'Languages', '2013-11-01 15:48:41', 0, 0, NULL, NULL, NULL, NULL, NULL),
(99, 'buttons', '', 'c9cc8cce247e49bae79f15173ce97354', 'es', 'Save', 'Save', '2013-11-01 15:20:19', 0, 0, NULL, NULL, NULL, NULL, NULL),
(100, 'buttons', '', '0557fa923dcee4d0f86b1409f5c2167f', 'es', 'Back', 'Back', '2013-11-01 14:07:31', 0, 0, NULL, NULL, NULL, NULL, NULL),
(101, 'buttons', '', '03c2e7e41ffc181a4e84080b4710e81e', 'es', 'New', 'New', '2013-11-01 14:07:31', 0, 0, NULL, NULL, NULL, NULL, NULL),
(102, 'musca_lang_admin', '', '4e140ba723a03baa6948340bf90e2ef6', 'es', 'Name:', 'Name:', '2013-11-01 14:07:31', 0, 0, NULL, NULL, NULL, NULL, NULL),
(103, 'message', '', '0511ee0d41117aa7b4abaaf102aa513d', 'es', 'This field is required', 'This field is required', '2013-11-01 14:07:31', 0, 0, NULL, NULL, NULL, NULL, NULL),
(104, 'message', '', '0cb7de2c9a7540815be0589213aa5147', 'es', 'Data has been saved successfully.', 'Data has been saved successfully.', '2013-11-01 14:07:33', 0, 0, NULL, NULL, NULL, NULL, NULL),
(105, 'message', '', '0cb7de2c9a7540815be0589213aa5147', 'pl', 'Data has been saved successfully.', 'Data has been saved successfully.', '2013-11-01 14:07:33', 0, 0, NULL, NULL, NULL, NULL, NULL),
(116, 'musca_translation', '', '7dce122004969d56ae2e0245cb754d35', 'es', 'Edit', 'Edit', '2013-11-01 14:07:40', 0, 0, NULL, NULL, NULL, NULL, NULL),
(117, 'musca_translation', '', '7dce122004969d56ae2e0245cb754d35', 'en', 'Edit', 'Edit', '2013-11-01 14:07:40', 0, 0, NULL, NULL, NULL, NULL, NULL),
(118, 'musca_translation', '', '7dce122004969d56ae2e0245cb754d35', 'pl', 'Edit', 'Edit', '2013-11-01 14:07:40', 0, 0, NULL, NULL, NULL, NULL, NULL),
(119, 'musca_translation', '', 'f2a6c498fb90ee345d997f888fce3b18', 'es', 'Delete', 'Delete', '2013-11-01 14:07:40', 0, 0, NULL, NULL, NULL, NULL, NULL),
(120, 'musca_translation', '', 'f2a6c498fb90ee345d997f888fce3b18', 'en', 'Delete', 'Delete', '2013-11-01 14:07:40', 0, 0, NULL, NULL, NULL, NULL, NULL),
(121, 'musca_translation', '', 'f2a6c498fb90ee345d997f888fce3b18', 'pl', 'Delete', 'Delete', '2013-11-01 14:07:40', 0, 0, NULL, NULL, NULL, NULL, NULL),
(122, 'musca_translation', '', '4c41e0bd957698b58100a5c687d757d9', 'es', 'Select all', 'Select all', '2013-11-01 14:07:40', 0, 0, NULL, NULL, NULL, NULL, NULL),
(123, 'musca_translation', '', '4c41e0bd957698b58100a5c687d757d9', 'en', 'Select all', 'Select all', '2013-11-01 14:07:40', 0, 0, NULL, NULL, NULL, NULL, NULL),
(124, 'musca_translation', '', '4c41e0bd957698b58100a5c687d757d9', 'pl', 'Select all', 'Select all', '2013-11-01 14:07:40', 0, 0, NULL, NULL, NULL, NULL, NULL),
(125, 'musca_translation', '', '52e3ce2bc983012661c3c11fe8b0f8ce', 'es', 'Deselect all', 'Deselect all', '2013-11-01 14:07:40', 0, 0, NULL, NULL, NULL, NULL, NULL),
(126, 'musca_translation', '', '52e3ce2bc983012661c3c11fe8b0f8ce', 'en', 'Deselect all', 'Deselect all', '2013-11-01 14:07:40', 0, 0, NULL, NULL, NULL, NULL, NULL),
(127, 'musca_translation', '', '52e3ce2bc983012661c3c11fe8b0f8ce', 'pl', 'Deselect all', 'Deselect all', '2013-11-01 14:07:40', 0, 0, NULL, NULL, NULL, NULL, NULL),
(128, 'musca_translation', '', '5185d96d6658228fe3b0e99c120165b0', 'es', 'Edit whole section', 'Edit whole section', '2013-11-01 14:07:40', 0, 0, NULL, NULL, NULL, NULL, NULL),
(129, 'musca_translation', '', '5185d96d6658228fe3b0e99c120165b0', 'en', 'Edit whole section', 'Edit whole section', '2013-11-01 14:07:40', 0, 0, NULL, NULL, NULL, NULL, NULL),
(130, 'musca_translation', '', '5185d96d6658228fe3b0e99c120165b0', 'pl', 'Edit whole section', 'Edit whole section', '2013-11-01 14:07:40', 0, 0, NULL, NULL, NULL, NULL, NULL),
(131, 'musca_translation', '', 'd2c24d59e0baff4d0155fbdf62590867', 'es', 'Section', 'Section', '2013-11-01 14:07:40', 0, 0, NULL, NULL, NULL, NULL, NULL),
(132, 'musca_translation', '', 'd2c24d59e0baff4d0155fbdf62590867', 'en', 'Section', 'Section', '2013-11-01 14:07:40', 0, 0, NULL, NULL, NULL, NULL, NULL),
(133, 'musca_translation', '', 'd2c24d59e0baff4d0155fbdf62590867', 'pl', 'Section', 'Section', '2013-11-01 14:07:40', 0, 0, NULL, NULL, NULL, NULL, NULL),
(134, 'musca_translation', '', 'a76f1ff1e2d5161f8106ba04b6e58c9e', 'es', 'Translate from', 'Translate from', '2013-11-01 14:07:40', 0, 0, NULL, NULL, NULL, NULL, NULL),
(135, 'musca_translation', '', 'a76f1ff1e2d5161f8106ba04b6e58c9e', 'en', 'Translate from', 'Translate from', '2013-11-01 14:07:40', 0, 0, NULL, NULL, NULL, NULL, NULL),
(136, 'musca_translation', '', 'a76f1ff1e2d5161f8106ba04b6e58c9e', 'pl', 'Translate from', 'Translate from', '2013-11-01 14:07:40', 0, 0, NULL, NULL, NULL, NULL, NULL),
(137, 'musca_translation', '', '12470fe406d44017d96eab37dd65fc14', 'es', 'es', 'es', '2013-11-01 14:07:40', 0, 0, NULL, NULL, NULL, NULL, NULL),
(138, 'musca_translation', '', '12470fe406d44017d96eab37dd65fc14', 'en', 'es', 'es', '2013-11-01 14:07:40', 0, 0, NULL, NULL, NULL, NULL, NULL),
(139, 'musca_translation', '', '12470fe406d44017d96eab37dd65fc14', 'pl', 'es', 'es', '2013-11-01 14:07:40', 0, 0, NULL, NULL, NULL, NULL, NULL),
(140, 'musca_translation', '', '9cfefed8fb9497baa5cd519d7d2bb5d7', 'es', 'en', 'en', '2013-11-01 14:07:40', 0, 0, NULL, NULL, NULL, NULL, NULL),
(141, 'musca_translation', '', '9cfefed8fb9497baa5cd519d7d2bb5d7', 'en', 'en', 'en', '2013-11-01 14:07:40', 0, 0, NULL, NULL, NULL, NULL, NULL),
(142, 'musca_translation', '', '9cfefed8fb9497baa5cd519d7d2bb5d7', 'pl', 'en', 'en', '2013-11-01 14:07:40', 0, 0, NULL, NULL, NULL, NULL, NULL),
(143, 'musca_translation', '', '288404204e3d452229308317344a285d', 'es', 'pl', 'pl', '2013-11-01 14:07:40', 0, 0, NULL, NULL, NULL, NULL, NULL),
(144, 'musca_translation', '', '288404204e3d452229308317344a285d', 'en', 'pl', 'pl', '2013-11-01 14:07:40', 0, 0, NULL, NULL, NULL, NULL, NULL),
(145, 'musca_translation', '', '288404204e3d452229308317344a285d', 'pl', 'pl', 'pl', '2013-11-01 14:07:40', 0, 0, NULL, NULL, NULL, NULL, NULL),
(146, 'musca_translation', '', 'f40f0a146b015acb0b4c5f5e933d8055', 'es', 'Translate to', 'Translate to', '2013-11-01 14:07:40', 0, 0, NULL, NULL, NULL, NULL, NULL),
(147, 'musca_translation', '', 'f40f0a146b015acb0b4c5f5e933d8055', 'en', 'Translate to', 'Translate to', '2013-11-01 14:07:40', 0, 0, NULL, NULL, NULL, NULL, NULL),
(148, 'musca_translation', '', 'f40f0a146b015acb0b4c5f5e933d8055', 'pl', 'Translate to', 'Translate to', '2013-11-01 14:07:40', 0, 0, NULL, NULL, NULL, NULL, NULL),
(149, 'musca_translation', '', 'a6bfac9070b89c1a9e61090402ca458d', 'es', 'Search for text', 'Search for text', '2013-11-01 14:07:40', 0, 0, NULL, NULL, NULL, NULL, NULL),
(150, 'musca_translation', '', 'a6bfac9070b89c1a9e61090402ca458d', 'en', 'Search for text', 'Search for text', '2013-11-01 14:07:40', 0, 0, NULL, NULL, NULL, NULL, NULL),
(151, 'musca_translation', '', 'a6bfac9070b89c1a9e61090402ca458d', 'pl', 'Search for text', 'Search for text', '2013-11-01 14:07:40', 0, 0, NULL, NULL, NULL, NULL, NULL),
(152, 'musca_translation', '', 'b1c94ca2fbc3e78fc30069c8d0f01680', 'es', 'All', 'All', '2013-11-01 14:07:40', 0, 0, NULL, NULL, NULL, NULL, NULL),
(153, 'musca_translation', '', 'b1c94ca2fbc3e78fc30069c8d0f01680', 'en', 'All', 'All', '2013-11-01 14:07:40', 0, 0, NULL, NULL, NULL, NULL, NULL),
(154, 'musca_translation', '', 'b1c94ca2fbc3e78fc30069c8d0f01680', 'pl', 'All', 'All', '2013-11-01 14:07:40', 0, 0, NULL, NULL, NULL, NULL, NULL),
(155, 'musca_translation', '', '4994a8ffeba4ac3140beb89e8d41f174', 'es', 'Language', 'Language', '2013-11-01 14:07:40', 0, 0, NULL, NULL, NULL, NULL, NULL),
(156, 'musca_translation', '', '4994a8ffeba4ac3140beb89e8d41f174', 'en', 'Language', 'Language', '2013-11-01 14:07:40', 0, 0, NULL, NULL, NULL, NULL, NULL),
(157, 'musca_translation', '', '4994a8ffeba4ac3140beb89e8d41f174', 'pl', 'Language', 'Language', '2013-11-01 14:07:40', 0, 0, NULL, NULL, NULL, NULL, NULL),
(158, 'musca_translation', '', 'd91c1c514f19642ce9d165800eccf198', 'es', 'Translated text', 'Translated text', '2013-11-01 14:07:40', 0, 0, NULL, NULL, NULL, NULL, NULL),
(159, 'musca_translation', '', 'd91c1c514f19642ce9d165800eccf198', 'en', 'Translated text', 'Translated text', '2013-11-01 14:07:40', 0, 0, NULL, NULL, NULL, NULL, NULL),
(160, 'musca_translation', '', 'd91c1c514f19642ce9d165800eccf198', 'pl', 'Translated text', 'Translated text', '2013-11-01 14:07:40', 0, 0, NULL, NULL, NULL, NULL, NULL),
(161, 'musca_translation', '', '900f866636ca9a4a158bafe7677aaba6', 'es', 'Original text', 'Original text', '2013-11-01 14:07:40', 0, 0, NULL, NULL, NULL, NULL, NULL),
(162, 'musca_translation', '', '900f866636ca9a4a158bafe7677aaba6', 'en', 'Original text', 'Original text', '2013-11-01 14:07:40', 0, 0, NULL, NULL, NULL, NULL, NULL),
(163, 'musca_translation', '', '900f866636ca9a4a158bafe7677aaba6', 'pl', 'Original text', 'Original text', '2013-11-01 14:07:40', 0, 0, NULL, NULL, NULL, NULL, NULL),
(164, 'musca_translation', '', '3a08e2e340ab29fd9263af48193cbf8e', 'es', 'Languages', 'Languages', '2013-11-01 14:07:41', 0, 0, NULL, NULL, NULL, NULL, NULL),
(165, 'musca_translation', '', '3a08e2e340ab29fd9263af48193cbf8e', 'en', 'Languages', 'Languages', '2013-11-01 14:07:41', 0, 0, NULL, NULL, NULL, NULL, NULL),
(166, 'musca_translation', '', '3a08e2e340ab29fd9263af48193cbf8e', 'pl', 'Languages', 'Languages', '2013-11-01 14:07:41', 0, 0, NULL, NULL, NULL, NULL, NULL),
(167, 'musca_translation_admin', '', '12470fe406d44017d96eab37dd65fc14', 'es', 'es', 'es', '2013-11-01 14:08:00', 0, 0, NULL, NULL, NULL, NULL, NULL),
(168, 'musca_translation_admin', '', '12470fe406d44017d96eab37dd65fc14', 'en', 'es', 'es', '2013-11-01 14:08:00', 0, 0, NULL, NULL, NULL, NULL, NULL),
(169, 'musca_translation_admin', '', '12470fe406d44017d96eab37dd65fc14', 'pl', 'es', 'es', '2013-11-01 14:08:00', 0, 0, NULL, NULL, NULL, NULL, NULL),
(170, 'musca_translation_admin', '', '288404204e3d452229308317344a285d', 'es', 'pl', 'pl', '2013-11-01 14:08:00', 0, 0, NULL, NULL, NULL, NULL, NULL),
(171, 'musca_translation_admin', '', '288404204e3d452229308317344a285d', 'en', 'pl', 'pl', '2013-11-01 14:08:00', 0, 0, NULL, NULL, NULL, NULL, NULL),
(172, 'musca_translation_admin', '', '288404204e3d452229308317344a285d', 'pl', 'pl', 'pl', '2013-11-01 14:08:00', 0, 0, NULL, NULL, NULL, NULL, NULL),
(391, 'musca_lang', '', '3a08e2e340ab29fd9263af48193cbf8e', 'es', 'Languages', 'Languages', '2013-11-01 15:48:41', 0, 0, NULL, NULL, NULL, NULL, NULL),
(416, 'musca_auth', '', 'c365c226cdad73c3f859da630a9e9f72', 'en', 'Repeat password:', 'Repeat password:', '2013-11-05 20:54:06', 0, 0, NULL, NULL, NULL, NULL, NULL),
(417, 'musca_auth', '', 'c365c226cdad73c3f859da630a9e9f72', 'pl', 'Repeat password:', 'Repeat password:', '2013-11-05 20:54:06', 0, 0, NULL, NULL, NULL, NULL, NULL),
(415, 'musca_auth', '', 'c365c226cdad73c3f859da630a9e9f72', 'es', 'Repeat password:', 'Repeat password:', '2013-11-05 20:54:06', 0, 0, NULL, NULL, NULL, NULL, NULL),
(197, 'buttons', '', '7dce122004969d56ae2e0245cb754d35', 'es', 'Edit', 'Edit', '2013-11-01 14:08:47', 0, 0, NULL, NULL, NULL, NULL, NULL),
(198, 'buttons', '', '7dce122004969d56ae2e0245cb754d35', 'en', 'Edit', 'Edit', '2013-11-01 14:08:47', 0, 0, NULL, NULL, NULL, NULL, NULL),
(199, 'buttons', '', '7dce122004969d56ae2e0245cb754d35', 'pl', 'Edytuj', 'Edit', '2013-11-01 15:21:29', 0, 0, NULL, NULL, NULL, NULL, NULL),
(215, 'musca_lang', '', '49ee3087348e8d44e1feda1917443987', 'es', 'Name', 'Name', '2013-11-01 14:25:15', 0, 0, NULL, NULL, NULL, NULL, NULL),
(216, 'musca_lang', '', '49ee3087348e8d44e1feda1917443987', 'en', 'Name', 'Name', '2013-11-01 14:25:15', 0, 0, NULL, NULL, NULL, NULL, NULL),
(217, 'musca_lang', '', '49ee3087348e8d44e1feda1917443987', 'pl', 'Name', 'Name', '2013-11-01 14:25:15', 0, 0, NULL, NULL, NULL, NULL, NULL),
(218, 'musca_lang', '', '5b512ee8a59deb284ad0a6a035ba10b1', 'es', 'ISO', 'ISO', '2013-11-01 14:25:37', 0, 0, NULL, NULL, NULL, NULL, NULL),
(219, 'musca_lang', '', '5b512ee8a59deb284ad0a6a035ba10b1', 'en', 'ISO', 'ISO', '2013-11-01 14:25:37', 0, 0, NULL, NULL, NULL, NULL, NULL),
(220, 'musca_lang', '', '5b512ee8a59deb284ad0a6a035ba10b1', 'pl', 'ISO', 'ISO', '2013-11-01 14:25:37', 0, 0, NULL, NULL, NULL, NULL, NULL),
(221, 'musca_lang', '', '69cfbec9733834d43666fcb9de4e28b2', 'es', 'Activted in translations', 'Activted in translations', '2013-11-01 14:25:37', 0, 0, NULL, NULL, NULL, NULL, NULL),
(222, 'musca_lang', '', '69cfbec9733834d43666fcb9de4e28b2', 'en', 'Activted in translations', 'Activted in translations', '2013-11-01 14:25:37', 0, 0, NULL, NULL, NULL, NULL, NULL),
(223, 'musca_lang', '', '69cfbec9733834d43666fcb9de4e28b2', 'pl', 'Activted in translations', 'Activted in translations', '2013-11-01 14:25:37', 0, 0, NULL, NULL, NULL, NULL, NULL),
(224, 'musca_lang', '', 'ba40dd7af3f8f64cbe446a4b8fc822c8', 'es', 'Activted in app', 'Activted in app', '2013-11-01 14:25:37', 0, 0, NULL, NULL, NULL, NULL, NULL),
(225, 'musca_lang', '', 'ba40dd7af3f8f64cbe446a4b8fc822c8', 'en', 'Activted in app', 'Activted in app', '2013-11-01 14:25:37', 0, 0, NULL, NULL, NULL, NULL, NULL),
(226, 'musca_lang', '', 'ba40dd7af3f8f64cbe446a4b8fc822c8', 'pl', 'Activted in app', 'Activted in app', '2013-11-01 14:25:37', 0, 0, NULL, NULL, NULL, NULL, NULL),
(227, 'musca_lang', '', '0b8d92bc19b720bb1065649535463409', 'es', 'Translations', 'Translations', '2013-11-01 14:28:00', 0, 0, NULL, NULL, NULL, NULL, NULL),
(228, 'musca_lang', '', '0b8d92bc19b720bb1065649535463409', 'en', 'Translations', 'Translations', '2013-11-01 14:28:00', 0, 0, NULL, NULL, NULL, NULL, NULL),
(229, 'musca_lang', '', '0b8d92bc19b720bb1065649535463409', 'pl', 'Translations', 'Translations', '2013-11-01 14:28:00', 0, 0, NULL, NULL, NULL, NULL, NULL),
(230, 'musca_lang', '', '0aa2c1a68fb1df94a6be51218450c02e', 'es', 'Activated in Translations', 'Activated in Translations', '2013-11-01 14:28:00', 0, 0, NULL, NULL, NULL, NULL, NULL),
(231, 'musca_lang', '', '0aa2c1a68fb1df94a6be51218450c02e', 'en', 'Activated in Translations', 'Activated in Translations', '2013-11-01 14:28:00', 0, 0, NULL, NULL, NULL, NULL, NULL),
(232, 'musca_lang', '', '0aa2c1a68fb1df94a6be51218450c02e', 'pl', 'Activated in Translations', 'Activated in Translations', '2013-11-01 14:28:00', 0, 0, NULL, NULL, NULL, NULL, NULL),
(233, 'musca_lang', '', 'c6e190b284633c48e39e55049da3cce8', 'es', 'Web', 'Web', '2013-11-01 14:28:00', 0, 0, NULL, NULL, NULL, NULL, NULL),
(234, 'musca_lang', '', 'c6e190b284633c48e39e55049da3cce8', 'en', 'Web', 'Web', '2013-11-01 14:28:00', 0, 0, NULL, NULL, NULL, NULL, NULL),
(235, 'musca_lang', '', 'c6e190b284633c48e39e55049da3cce8', 'pl', 'Web', 'Web', '2013-11-01 14:28:00', 0, 0, NULL, NULL, NULL, NULL, NULL),
(242, 'musca_lang', '', '7a1920d61156abc05a60135aefe8bc67', 'es', 'Default', 'Default', '2013-11-01 14:29:49', 0, 0, NULL, NULL, NULL, NULL, NULL),
(243, 'musca_lang', '', '7a1920d61156abc05a60135aefe8bc67', 'en', 'Default', 'Default', '2013-11-01 14:29:49', 0, 0, NULL, NULL, NULL, NULL, NULL),
(244, 'musca_lang', '', '7a1920d61156abc05a60135aefe8bc67', 'pl', 'Default', 'Default', '2013-11-01 14:29:49', 0, 0, NULL, NULL, NULL, NULL, NULL),
(250, 'meta_tags', '', 'c7da501f54544eba6787960200d9efdb', 'pl', 'CMS', 'CMS', '2013-11-01 14:41:03', 0, 0, NULL, NULL, NULL, NULL, NULL),
(254, 'musca_translation', '', '0b8d92bc19b720bb1065649535463409', 'pl', 'Translations', 'Translations', '2013-11-01 14:41:03', 0, 0, NULL, NULL, NULL, NULL, NULL),
(256, 'musca_auth', '', 'c1ec1d62eafad32ca16fe4df49b9ca2f', 'pl', 'Administratorzy', 'Administrators', '2013-11-05 20:53:52', 0, 0, NULL, NULL, NULL, NULL, NULL),
(406, 'fields', '', '49ee3087348e8d44e1feda1917443987', 'es', 'Name', 'Name', '2013-11-05 20:54:06', 0, 0, NULL, NULL, NULL, NULL, NULL),
(258, 'musca_translation_admin', '', '98bef4cbc575d67f36a26d066450cc9d', 'pl', 'Admin Translations', 'Admin Translations', '2013-11-01 14:41:03', 0, 0, NULL, NULL, NULL, NULL, NULL),
(259, 'musca_auth_rol', '', 'a5cd3ed116608dac017f14c046ea56bf', 'pl', 'Roles', 'Roles', '2013-11-01 14:41:03', 0, 0, NULL, NULL, NULL, NULL, NULL),
(646, 'grid', '', 'a240fa27925a635b08dc28c9e4f9216d', 'pl', 'Order', 'Order', '2013-11-26 12:27:32', 0, 0, NULL, NULL, NULL, NULL, NULL),
(647, 'grid', '', '49ee3087348e8d44e1feda1917443987', 'en', 'Name', 'Name', '2013-11-26 12:27:32', 0, 0, NULL, NULL, NULL, NULL, NULL),
(648, 'grid', '', '49ee3087348e8d44e1feda1917443987', 'es', 'Name', 'Name', '2013-11-26 12:27:32', 0, 0, NULL, NULL, NULL, NULL, NULL),
(649, 'grid', '', '49ee3087348e8d44e1feda1917443987', 'pl', 'Name', 'Name', '2013-11-26 12:27:32', 0, 0, NULL, NULL, NULL, NULL, NULL),
(650, 'grid', '', '9b9d8a976b42e0bd66381797644943d5', 'en', 'Published', 'Published', '2013-11-26 12:27:32', 0, 0, NULL, NULL, NULL, NULL, NULL),
(651, 'grid', '', '9b9d8a976b42e0bd66381797644943d5', 'es', 'Published', 'Published', '2013-11-26 12:27:32', 0, 0, NULL, NULL, NULL, NULL, NULL),
(652, 'grid', '', '9b9d8a976b42e0bd66381797644943d5', 'pl', 'Published', 'Published', '2013-11-26 12:27:32', 0, 0, NULL, NULL, NULL, NULL, NULL),
(653, 'grid', '', '8f9bfe9d1345237cb3b2b205864da075', 'en', 'User', 'User', '2013-11-26 13:27:46', 0, 0, NULL, NULL, NULL, NULL, NULL),
(654, 'grid', '', '8f9bfe9d1345237cb3b2b205864da075', 'es', 'User', 'User', '2013-11-26 13:27:46', 0, 0, NULL, NULL, NULL, NULL, NULL),
(655, 'grid', '', '8f9bfe9d1345237cb3b2b205864da075', 'pl', 'User', 'User', '2013-11-26 13:27:46', 0, 0, NULL, NULL, NULL, NULL, NULL),
(656, 'grid', '', 'cb456215c3333db0551bd0788bc258c7', 'en', 'Activated', 'Activated', '2013-11-26 13:27:46', 0, 0, NULL, NULL, NULL, NULL, NULL),
(657, 'grid', '', 'cb456215c3333db0551bd0788bc258c7', 'es', 'Activated', 'Activated', '2013-11-26 13:27:46', 0, 0, NULL, NULL, NULL, NULL, NULL),
(658, 'grid', '', 'cb456215c3333db0551bd0788bc258c7', 'pl', 'Activated', 'Activated', '2013-11-26 13:27:46', 0, 0, NULL, NULL, NULL, NULL, NULL),
(277, 'musca_translation_admin', '', '7dce122004969d56ae2e0245cb754d35', 'es', 'Edit', 'Edit', '2013-11-01 14:41:22', 0, 0, NULL, NULL, NULL, NULL, NULL),
(278, 'musca_translation_admin', '', '7dce122004969d56ae2e0245cb754d35', 'pl', 'Edit', 'Edit', '2013-11-01 14:41:22', 0, 0, NULL, NULL, NULL, NULL, NULL),
(279, 'musca_translation_admin', '', 'f2a6c498fb90ee345d997f888fce3b18', 'es', 'Delete', 'Delete', '2013-11-01 14:41:22', 0, 0, NULL, NULL, NULL, NULL, NULL),
(280, 'musca_translation_admin', '', 'f2a6c498fb90ee345d997f888fce3b18', 'pl', 'Delete', 'Delete', '2013-11-01 14:41:22', 0, 0, NULL, NULL, NULL, NULL, NULL),
(281, 'musca_translation_admin', '', '4c41e0bd957698b58100a5c687d757d9', 'es', 'Select all', 'Select all', '2013-11-01 14:41:22', 0, 0, NULL, NULL, NULL, NULL, NULL),
(282, 'musca_translation_admin', '', '4c41e0bd957698b58100a5c687d757d9', 'pl', 'Select all', 'Select all', '2013-11-01 14:41:22', 0, 0, NULL, NULL, NULL, NULL, NULL),
(283, 'musca_translation_admin', '', '52e3ce2bc983012661c3c11fe8b0f8ce', 'es', 'Deselect all', 'Deselect all', '2013-11-01 14:41:22', 0, 0, NULL, NULL, NULL, NULL, NULL),
(284, 'musca_translation_admin', '', '52e3ce2bc983012661c3c11fe8b0f8ce', 'pl', 'Deselect all', 'Deselect all', '2013-11-01 14:41:22', 0, 0, NULL, NULL, NULL, NULL, NULL),
(287, 'musca_translation_admin', '', '5185d96d6658228fe3b0e99c120165b0', 'es', 'Edit whole section', 'Edit whole section', '2013-11-01 14:41:22', 0, 0, NULL, NULL, NULL, NULL, NULL),
(288, 'musca_translation_admin', '', '5185d96d6658228fe3b0e99c120165b0', 'pl', 'Edit whole section', 'Edit whole section', '2013-11-01 14:41:22', 0, 0, NULL, NULL, NULL, NULL, NULL),
(289, 'musca_translation_admin', '', 'd2c24d59e0baff4d0155fbdf62590867', 'es', 'Section', 'Section', '2013-11-01 14:41:22', 0, 0, NULL, NULL, NULL, NULL, NULL),
(290, 'musca_translation_admin', '', 'd2c24d59e0baff4d0155fbdf62590867', 'pl', 'Section', 'Section', '2013-11-01 14:41:22', 0, 0, NULL, NULL, NULL, NULL, NULL),
(291, 'musca_translation_admin', '', 'a76f1ff1e2d5161f8106ba04b6e58c9e', 'es', 'Translate from', 'Translate from', '2013-11-01 14:41:22', 0, 0, NULL, NULL, NULL, NULL, NULL),
(292, 'musca_translation_admin', '', 'a76f1ff1e2d5161f8106ba04b6e58c9e', 'pl', 'Translate from', 'Translate from', '2013-11-01 14:41:22', 0, 0, NULL, NULL, NULL, NULL, NULL),
(293, 'musca_translation_admin', '', '9cfefed8fb9497baa5cd519d7d2bb5d7', 'es', 'en', 'en', '2013-11-01 14:41:22', 0, 0, NULL, NULL, NULL, NULL, NULL),
(294, 'musca_translation_admin', '', '9cfefed8fb9497baa5cd519d7d2bb5d7', 'pl', 'en', 'en', '2013-11-01 14:41:22', 0, 0, NULL, NULL, NULL, NULL, NULL),
(295, 'musca_translation_admin', '', 'f40f0a146b015acb0b4c5f5e933d8055', 'es', 'Translate to', 'Translate to', '2013-11-01 14:41:22', 0, 0, NULL, NULL, NULL, NULL, NULL),
(296, 'musca_translation_admin', '', 'f40f0a146b015acb0b4c5f5e933d8055', 'pl', 'Translate to', 'Translate to', '2013-11-01 14:41:22', 0, 0, NULL, NULL, NULL, NULL, NULL),
(297, 'musca_translation_admin', '', 'a6bfac9070b89c1a9e61090402ca458d', 'es', 'Search for text', 'Search for text', '2013-11-01 14:41:22', 0, 0, NULL, NULL, NULL, NULL, NULL),
(298, 'musca_translation_admin', '', 'a6bfac9070b89c1a9e61090402ca458d', 'pl', 'Search for text', 'Search for text', '2013-11-01 14:41:22', 0, 0, NULL, NULL, NULL, NULL, NULL),
(299, 'musca_translation_admin', '', 'b1c94ca2fbc3e78fc30069c8d0f01680', 'es', 'All', 'All', '2013-11-01 14:41:22', 0, 0, NULL, NULL, NULL, NULL, NULL),
(300, 'musca_translation_admin', '', 'b1c94ca2fbc3e78fc30069c8d0f01680', 'pl', 'All', 'All', '2013-11-01 14:41:22', 0, 0, NULL, NULL, NULL, NULL, NULL),
(301, 'musca_translation_admin', '', '4994a8ffeba4ac3140beb89e8d41f174', 'es', 'Language', 'Language', '2013-11-01 14:41:22', 0, 0, NULL, NULL, NULL, NULL, NULL),
(302, 'musca_translation_admin', '', '4994a8ffeba4ac3140beb89e8d41f174', 'pl', 'Language', 'Language', '2013-11-01 14:41:22', 0, 0, NULL, NULL, NULL, NULL, NULL),
(303, 'musca_translation_admin', '', 'd91c1c514f19642ce9d165800eccf198', 'es', 'Translated text', 'Translated text', '2013-11-01 14:41:22', 0, 0, NULL, NULL, NULL, NULL, NULL),
(304, 'musca_translation_admin', '', 'd91c1c514f19642ce9d165800eccf198', 'pl', 'Translated text', 'Translated text', '2013-11-01 14:41:22', 0, 0, NULL, NULL, NULL, NULL, NULL),
(305, 'musca_translation_admin', '', '900f866636ca9a4a158bafe7677aaba6', 'es', 'Original text', 'Original text', '2013-11-01 14:41:22', 0, 0, NULL, NULL, NULL, NULL, NULL),
(306, 'musca_translation_admin', '', '900f866636ca9a4a158bafe7677aaba6', 'pl', 'Original text', 'Original text', '2013-11-01 14:41:22', 0, 0, NULL, NULL, NULL, NULL, NULL),
(307, 'musca_translation_admin', '', '3a08e2e340ab29fd9263af48193cbf8e', 'es', 'Languages', 'Languages', '2013-11-01 14:41:22', 0, 0, NULL, NULL, NULL, NULL, NULL),
(308, 'musca_translation_admin', '', '3a08e2e340ab29fd9263af48193cbf8e', 'pl', 'Languages', 'Languages', '2013-11-01 14:41:22', 0, 0, NULL, NULL, NULL, NULL, NULL),
(387, 'musca_translation_admin', '', '0bc4a3be4522f97d7820b4aede8f9afa', 'pl', 'Administration Translations', 'Administration Translations', '2013-11-01 15:44:20', 0, 0, NULL, NULL, NULL, NULL, NULL),
(386, 'musca_translation_admin', '', '0bc4a3be4522f97d7820b4aede8f9afa', 'en', 'Administration Translations', 'Administration Translations', '2013-11-01 15:44:20', 0, 0, NULL, NULL, NULL, NULL, NULL),
(385, 'musca_translation_admin', '', '0bc4a3be4522f97d7820b4aede8f9afa', 'es', 'Administration Translations', 'Administration Translations', '2013-11-01 15:44:20', 0, 0, NULL, NULL, NULL, NULL, NULL),
(315, 'buttons', '', 'c9cc8cce247e49bae79f15173ce97354', 'pl', 'Zapisz', 'Save', '2013-11-01 15:20:19', 0, 0, NULL, NULL, NULL, NULL, NULL),
(316, 'buttons', '', '0557fa923dcee4d0f86b1409f5c2167f', 'pl', 'Wstecz', 'Back', '2013-11-01 15:21:29', 0, 0, NULL, NULL, NULL, NULL, NULL),
(317, 'buttons', '', '03c2e7e41ffc181a4e84080b4710e81e', 'pl', 'Nowy', 'New', '2013-11-01 15:21:29', 0, 0, NULL, NULL, NULL, NULL, NULL),
(318, 'musca_lang_admin', '', '49ee3087348e8d44e1feda1917443987', 'es', 'Name', 'Name', '2013-11-01 14:52:28', 0, 0, NULL, NULL, NULL, NULL, NULL),
(319, 'musca_lang_admin', '', '49ee3087348e8d44e1feda1917443987', 'en', 'Name', 'Name', '2013-11-01 14:52:28', 0, 0, NULL, NULL, NULL, NULL, NULL),
(320, 'musca_lang_admin', '', '49ee3087348e8d44e1feda1917443987', 'pl', 'Name', 'Name', '2013-11-01 14:52:28', 0, 0, NULL, NULL, NULL, NULL, NULL),
(321, 'musca_lang_admin', '', '5b512ee8a59deb284ad0a6a035ba10b1', 'es', 'ISO', 'ISO', '2013-11-01 14:52:28', 0, 0, NULL, NULL, NULL, NULL, NULL),
(322, 'musca_lang_admin', '', '5b512ee8a59deb284ad0a6a035ba10b1', 'en', 'ISO', 'ISO', '2013-11-01 14:52:28', 0, 0, NULL, NULL, NULL, NULL, NULL),
(323, 'musca_lang_admin', '', '5b512ee8a59deb284ad0a6a035ba10b1', 'pl', 'ISO', 'ISO', '2013-11-01 14:52:28', 0, 0, NULL, NULL, NULL, NULL, NULL),
(324, 'musca_lang_admin', '', '0b8d92bc19b720bb1065649535463409', 'es', 'Translations', 'Translations', '2013-11-01 14:52:28', 0, 0, NULL, NULL, NULL, NULL, NULL),
(325, 'musca_lang_admin', '', '0b8d92bc19b720bb1065649535463409', 'en', 'Translations', 'Translations', '2013-11-01 14:52:28', 0, 0, NULL, NULL, NULL, NULL, NULL),
(326, 'musca_lang_admin', '', '0b8d92bc19b720bb1065649535463409', 'pl', 'Translations', 'Translations', '2013-11-01 14:52:28', 0, 0, NULL, NULL, NULL, NULL, NULL),
(327, 'musca_lang_admin', '', '0aa2c1a68fb1df94a6be51218450c02e', 'es', 'Activated in Translations', 'Activated in Translations', '2013-11-01 14:52:28', 0, 0, NULL, NULL, NULL, NULL, NULL),
(328, 'musca_lang_admin', '', '0aa2c1a68fb1df94a6be51218450c02e', 'en', 'Activated in Translations', 'Activated in Translations', '2013-11-01 14:52:28', 0, 0, NULL, NULL, NULL, NULL, NULL),
(329, 'musca_lang_admin', '', '0aa2c1a68fb1df94a6be51218450c02e', 'pl', 'Activated in Translations', 'Activated in Translations', '2013-11-01 14:52:28', 0, 0, NULL, NULL, NULL, NULL, NULL),
(330, 'musca_lang_admin', '', 'c6e190b284633c48e39e55049da3cce8', 'es', 'Web', 'Web', '2013-11-01 14:52:28', 0, 0, NULL, NULL, NULL, NULL, NULL),
(331, 'musca_lang_admin', '', 'c6e190b284633c48e39e55049da3cce8', 'en', 'Web', 'Web', '2013-11-01 14:52:28', 0, 0, NULL, NULL, NULL, NULL, NULL),
(332, 'musca_lang_admin', '', 'c6e190b284633c48e39e55049da3cce8', 'pl', 'Web', 'Web', '2013-11-01 14:52:28', 0, 0, NULL, NULL, NULL, NULL, NULL),
(333, 'musca_lang_admin', '', '7a1920d61156abc05a60135aefe8bc67', 'es', 'Default', 'Default', '2013-11-01 14:52:28', 0, 0, NULL, NULL, NULL, NULL, NULL),
(334, 'musca_lang_admin', '', '7a1920d61156abc05a60135aefe8bc67', 'en', 'Default', 'Default', '2013-11-01 14:52:28', 0, 0, NULL, NULL, NULL, NULL, NULL),
(335, 'musca_lang_admin', '', '7a1920d61156abc05a60135aefe8bc67', 'pl', 'Default', 'Default', '2013-11-01 14:52:28', 0, 0, NULL, NULL, NULL, NULL, NULL),
(336, 'message', '', '0511ee0d41117aa7b4abaaf102aa513d', 'pl', 'This field is required', 'This field is required', '2013-11-01 14:52:28', 0, 0, NULL, NULL, NULL, NULL, NULL),
(337, 'buttons', '', 'de68a52a2d6abaaf54b1b769128955aa', 'es', 'Change order', 'Change order', '2013-11-01 14:54:52', 0, 0, NULL, NULL, NULL, NULL, NULL),
(338, 'buttons', '', 'de68a52a2d6abaaf54b1b769128955aa', 'en', 'Change order', 'Change order', '2013-11-01 14:54:52', 0, 0, NULL, NULL, NULL, NULL, NULL),
(339, 'buttons', '', 'de68a52a2d6abaaf54b1b769128955aa', 'pl', 'Zmień kolejność', 'Change order', '2013-11-01 15:21:29', 0, 0, NULL, NULL, NULL, NULL, NULL),
(340, 'set_order', '', '08717e0273e4c457262a61246728edd7', 'es', 'Drag & drop to change order', 'Drag & drop to change order', '2013-11-01 15:01:49', 0, 0, NULL, NULL, NULL, NULL, NULL),
(341, 'set_order', '', '08717e0273e4c457262a61246728edd7', 'en', 'Drag & drop to change order', 'Drag & drop to change order', '2013-11-01 15:01:49', 0, 0, NULL, NULL, NULL, NULL, NULL),
(342, 'set_order', '', '08717e0273e4c457262a61246728edd7', 'pl', 'Drag & drop to change order', 'Drag & drop to change order', '2013-11-01 15:01:49', 0, 0, NULL, NULL, NULL, NULL, NULL),
(343, 'musca_translation', '', 'c9cc8cce247e49bae79f15173ce97354', 'es', 'Save', 'Save', '2013-11-01 15:07:26', 0, 0, NULL, NULL, NULL, NULL, NULL),
(344, 'musca_translation', '', 'c9cc8cce247e49bae79f15173ce97354', 'en', 'Save', 'Save', '2013-11-01 15:07:26', 0, 0, NULL, NULL, NULL, NULL, NULL),
(345, 'musca_translation', '', 'c9cc8cce247e49bae79f15173ce97354', 'pl', 'Save', 'Save', '2013-11-01 15:07:26', 0, 0, NULL, NULL, NULL, NULL, NULL),
(346, 'musca_translation', '', '0557fa923dcee4d0f86b1409f5c2167f', 'es', 'Back', 'Back', '2013-11-01 15:07:26', 0, 0, NULL, NULL, NULL, NULL, NULL),
(347, 'musca_translation', '', '0557fa923dcee4d0f86b1409f5c2167f', 'en', 'Back', 'Back', '2013-11-01 15:07:26', 0, 0, NULL, NULL, NULL, NULL, NULL),
(348, 'musca_translation', '', '0557fa923dcee4d0f86b1409f5c2167f', 'pl', 'Back', 'Back', '2013-11-01 15:07:26', 0, 0, NULL, NULL, NULL, NULL, NULL),
(349, 'musca_translation', '', 'f15c1cae7882448b3fb0404682e17e61', 'es', 'Content', 'Content', '2013-11-01 15:07:26', 0, 0, NULL, NULL, NULL, NULL, NULL),
(350, 'musca_translation', '', 'f15c1cae7882448b3fb0404682e17e61', 'en', 'Content', 'Content', '2013-11-01 15:07:26', 0, 0, NULL, NULL, NULL, NULL, NULL),
(351, 'musca_translation', '', 'f15c1cae7882448b3fb0404682e17e61', 'pl', 'Content', 'Content', '2013-11-01 15:07:26', 0, 0, NULL, NULL, NULL, NULL, NULL),
(352, 'musca_translation_admin', '', 'c9cc8cce247e49bae79f15173ce97354', 'es', 'Save', 'Save', '2013-11-01 15:20:14', 0, 0, NULL, NULL, NULL, NULL, NULL),
(353, 'musca_translation_admin', '', 'c9cc8cce247e49bae79f15173ce97354', 'en', 'Save', 'Save', '2013-11-01 15:20:14', 0, 0, NULL, NULL, NULL, NULL, NULL),
(354, 'musca_translation_admin', '', 'c9cc8cce247e49bae79f15173ce97354', 'pl', 'Save', 'Save', '2013-11-01 15:20:14', 0, 0, NULL, NULL, NULL, NULL, NULL),
(355, 'musca_translation_admin', '', '0557fa923dcee4d0f86b1409f5c2167f', 'es', 'Back', 'Back', '2013-11-01 15:20:14', 0, 0, NULL, NULL, NULL, NULL, NULL),
(356, 'musca_translation_admin', '', '0557fa923dcee4d0f86b1409f5c2167f', 'en', 'Back', 'Back', '2013-11-01 15:20:14', 0, 0, NULL, NULL, NULL, NULL, NULL),
(357, 'musca_translation_admin', '', '0557fa923dcee4d0f86b1409f5c2167f', 'pl', 'Back', 'Back', '2013-11-01 15:20:14', 0, 0, NULL, NULL, NULL, NULL, NULL),
(358, 'musca_translation_admin', '', 'f15c1cae7882448b3fb0404682e17e61', 'es', 'Content', 'Content', '2013-11-01 15:20:14', 0, 0, NULL, NULL, NULL, NULL, NULL),
(359, 'musca_translation_admin', '', 'f15c1cae7882448b3fb0404682e17e61', 'en', 'Content', 'Content', '2013-11-01 15:20:14', 0, 0, NULL, NULL, NULL, NULL, NULL),
(360, 'musca_translation_admin', '', 'f15c1cae7882448b3fb0404682e17e61', 'pl', 'Content', 'Content', '2013-11-01 15:20:14', 0, 0, NULL, NULL, NULL, NULL, NULL),
(361, 'login', '', 'f6039d44b29456b20f8f373155ae4973', 'es', 'Username', 'Username', '2013-11-01 15:31:49', 0, 0, NULL, NULL, NULL, NULL, NULL),
(362, 'login', '', 'f6039d44b29456b20f8f373155ae4973', 'en', 'Username', 'Username', '2013-11-01 15:31:49', 0, 0, NULL, NULL, NULL, NULL, NULL),
(363, 'login', '', 'f6039d44b29456b20f8f373155ae4973', 'pl', 'Username', 'Username', '2013-11-01 15:31:49', 0, 0, NULL, NULL, NULL, NULL, NULL),
(364, 'login', '', 'dc647eb65e6711e155375218212b3964', 'es', 'Password', 'Password', '2013-11-01 15:31:49', 0, 0, NULL, NULL, NULL, NULL, NULL),
(365, 'login', '', 'dc647eb65e6711e155375218212b3964', 'en', 'Password', 'Password', '2013-11-01 15:31:49', 0, 0, NULL, NULL, NULL, NULL, NULL),
(366, 'login', '', 'dc647eb65e6711e155375218212b3964', 'pl', 'Password', 'Password', '2013-11-01 15:31:49', 0, 0, NULL, NULL, NULL, NULL, NULL),
(367, 'login', '', 'f1851d5600eae616ee802a31ac74701b', 'es', 'Enter', 'Enter', '2013-11-01 15:31:49', 0, 0, NULL, NULL, NULL, NULL, NULL),
(368, 'login', '', 'f1851d5600eae616ee802a31ac74701b', 'en', 'Enter', 'Enter', '2013-11-01 15:31:49', 0, 0, NULL, NULL, NULL, NULL, NULL),
(369, 'login', '', 'f1851d5600eae616ee802a31ac74701b', 'pl', 'Enter', 'Enter', '2013-11-01 15:31:49', 0, 0, NULL, NULL, NULL, NULL, NULL),
(413, 'musca_auth', '', 'b341a59d5636ed3d6a819137495b08a0', 'en', 'Password:', 'Password:', '2013-11-05 20:54:06', 0, 0, NULL, NULL, NULL, NULL, NULL),
(414, 'musca_auth', '', 'b341a59d5636ed3d6a819137495b08a0', 'pl', 'Password:', 'Password:', '2013-11-05 20:54:06', 0, 0, NULL, NULL, NULL, NULL, NULL),
(412, 'musca_auth', '', 'b341a59d5636ed3d6a819137495b08a0', 'es', 'Password:', 'Password:', '2013-11-05 20:54:06', 0, 0, NULL, NULL, NULL, NULL, NULL),
(410, 'musca_auth', '', '051672911a3f1f05efba78a553ef6fe2', 'en', 'Login:', 'Login:', '2013-11-05 20:54:06', 0, 0, NULL, NULL, NULL, NULL, NULL),
(411, 'musca_auth', '', '051672911a3f1f05efba78a553ef6fe2', 'pl', 'Login:', 'Login:', '2013-11-05 20:54:06', 0, 0, NULL, NULL, NULL, NULL, NULL),
(409, 'musca_auth', '', '051672911a3f1f05efba78a553ef6fe2', 'es', 'Login:', 'Login:', '2013-11-05 20:54:06', 0, 0, NULL, NULL, NULL, NULL, NULL),
(403, 'musca_configuration_user', '', 'f4f70727dc34561dfde1a3c529b6205c', 'es', 'Settings', 'Settings', '2013-11-05 20:40:20', 0, 0, NULL, NULL, NULL, NULL, NULL),
(404, 'musca_configuration_user', '', 'f4f70727dc34561dfde1a3c529b6205c', 'en', 'Settings', 'Settings', '2013-11-05 20:40:20', 0, 0, NULL, NULL, NULL, NULL, NULL),
(405, 'musca_configuration_user', '', 'f4f70727dc34561dfde1a3c529b6205c', 'pl', 'Ustawienia', 'Settings', '2013-11-05 20:53:11', 0, 0, NULL, NULL, NULL, NULL, NULL),
(418, 'musca_auth', '', '6340db22f588a2b4847d27dcba4c2693', 'es', 'Role:', 'Role:', '2013-11-05 20:54:07', 0, 0, NULL, NULL, NULL, NULL, NULL),
(419, 'musca_auth', '', '6340db22f588a2b4847d27dcba4c2693', 'en', 'Role:', 'Role:', '2013-11-05 20:54:07', 0, 0, NULL, NULL, NULL, NULL, NULL),
(420, 'musca_auth', '', '6340db22f588a2b4847d27dcba4c2693', 'pl', 'Role:', 'Role:', '2013-11-05 20:54:07', 0, 0, NULL, NULL, NULL, NULL, NULL),
(421, 'musca_auth', '', '3ccc3075ff24baea8bc9064fa4aa8164', 'es', 'Activated:', 'Activated:', '2013-11-05 20:54:07', 0, 0, NULL, NULL, NULL, NULL, NULL),
(422, 'musca_auth', '', '3ccc3075ff24baea8bc9064fa4aa8164', 'en', 'Activated:', 'Activated:', '2013-11-05 20:54:07', 0, 0, NULL, NULL, NULL, NULL, NULL),
(423, 'musca_auth', '', '3ccc3075ff24baea8bc9064fa4aa8164', 'pl', 'Activated:', 'Activated:', '2013-11-05 20:54:07', 0, 0, NULL, NULL, NULL, NULL, NULL),
(424, 'musca_auth', '', '867cee98fdd724e7d5bc87f61ce657bc', 'es', 'Passwords do not match', 'Passwords do not match', '2013-11-05 20:54:07', 0, 0, NULL, NULL, NULL, NULL, NULL),
(425, 'musca_auth', '', '867cee98fdd724e7d5bc87f61ce657bc', 'en', 'Passwords do not match', 'Passwords do not match', '2013-11-05 20:54:07', 0, 0, NULL, NULL, NULL, NULL, NULL),
(426, 'musca_auth', '', '867cee98fdd724e7d5bc87f61ce657bc', 'pl', 'Passwords do not match', 'Passwords do not match', '2013-11-05 20:54:07', 0, 0, NULL, NULL, NULL, NULL, NULL),
(427, 'musca_configuration', '', 'f4f70727dc34561dfde1a3c529b6205c', 'es', 'Settings', 'Settings', '2013-11-05 20:54:56', 0, 0, NULL, NULL, NULL, NULL, NULL),
(428, 'musca_configuration', '', 'f4f70727dc34561dfde1a3c529b6205c', 'en', 'Settings', 'Settings', '2013-11-05 20:54:56', 0, 0, NULL, NULL, NULL, NULL, NULL),
(429, 'musca_configuration', '', 'f4f70727dc34561dfde1a3c529b6205c', 'pl', 'Settings', 'Settings', '2013-11-05 20:54:56', 0, 0, NULL, NULL, NULL, NULL, NULL),
(430, 'musca_configuration', '', '5ff9df198222a96f26bf2cb279d83bd8', 'es', 'User:', 'User:', '2013-11-05 20:58:04', 0, 0, NULL, NULL, NULL, NULL, NULL),
(431, 'musca_configuration', '', '5ff9df198222a96f26bf2cb279d83bd8', 'en', 'User:', 'User:', '2013-11-05 20:58:04', 0, 0, NULL, NULL, NULL, NULL, NULL),
(432, 'musca_configuration', '', '5ff9df198222a96f26bf2cb279d83bd8', 'pl', 'User:', 'User:', '2013-11-05 20:58:04', 0, 0, NULL, NULL, NULL, NULL, NULL),
(442, 'musca_lang_admin', '', '6a04382f1001d2635b344a0873a4b085', 'es', 'Administration Languages', 'Administration Languages', '2013-11-06 01:19:19', 0, 0, NULL, NULL, NULL, NULL, NULL),
(443, 'musca_lang_admin', '', '6a04382f1001d2635b344a0873a4b085', 'en', 'Administration Languages', 'Administration Languages', '2013-11-06 01:19:19', 0, 0, NULL, NULL, NULL, NULL, NULL),
(444, 'musca_lang_admin', '', '6a04382f1001d2635b344a0873a4b085', 'pl', 'Administration Languages', 'Administration Languages', '2013-11-06 01:19:19', 0, 0, NULL, NULL, NULL, NULL, NULL),
(449, 'fields', '', 'b5a7adde1af5c87d7fd797b6245c2a39', 'en', 'Description', 'Description', '2013-11-20 01:32:20', 0, 0, NULL, NULL, NULL, NULL, NULL),
(450, 'fields', '', 'b5a7adde1af5c87d7fd797b6245c2a39', 'es', 'Description', 'Description', '2013-11-20 01:32:20', 0, 0, NULL, NULL, NULL, NULL, NULL),
(451, 'fields', '', 'b5a7adde1af5c87d7fd797b6245c2a39', 'pl', 'Description', 'Description', '2013-11-20 01:32:20', 0, 0, NULL, NULL, NULL, NULL, NULL),
(452, 'fields', '', 'cb456215c3333db0551bd0788bc258c7', 'en', 'Activated', 'Activated', '2013-11-20 01:32:20', 0, 0, NULL, NULL, NULL, NULL, NULL),
(453, 'fields', '', 'cb456215c3333db0551bd0788bc258c7', 'es', 'Activated', 'Activated', '2013-11-20 01:32:20', 0, 0, NULL, NULL, NULL, NULL, NULL),
(454, 'fields', '', 'cb456215c3333db0551bd0788bc258c7', 'pl', 'Activated', 'Activated', '2013-11-20 01:32:20', 0, 0, NULL, NULL, NULL, NULL, NULL),
(645, 'grid', '', 'a240fa27925a635b08dc28c9e4f9216d', 'es', 'Order', 'Order', '2013-11-26 12:27:32', 0, 0, NULL, NULL, NULL, NULL, NULL),
(644, 'grid', '', 'a240fa27925a635b08dc28c9e4f9216d', 'en', 'Order', 'Order', '2013-11-26 12:27:32', 0, 0, NULL, NULL, NULL, NULL, NULL),
(458, 'fields', '', 'be53a0541a6d36f6ecb879fa2c584b08', 'en', 'Image', 'Image', '2013-11-20 01:32:20', 0, 0, NULL, NULL, NULL, NULL, NULL),
(459, 'fields', '', 'be53a0541a6d36f6ecb879fa2c584b08', 'es', 'Image', 'Image', '2013-11-20 01:32:20', 0, 0, NULL, NULL, NULL, NULL, NULL),
(460, 'fields', '', 'be53a0541a6d36f6ecb879fa2c584b08', 'pl', 'Image', 'Image', '2013-11-20 01:32:20', 0, 0, NULL, NULL, NULL, NULL, NULL),
(643, 'menu', '', '7258e7251413465e0a3eb58094430bde', 'pl', 'Administration', 'Administration', '2013-11-26 12:25:42', 0, 0, NULL, NULL, NULL, NULL, NULL),
(642, 'menu', '', '7258e7251413465e0a3eb58094430bde', 'es', 'Administration', 'Administration', '2013-11-26 12:25:42', 0, 0, NULL, NULL, NULL, NULL, NULL),
(641, 'menu', '', '7258e7251413465e0a3eb58094430bde', 'en', 'Administration', 'Administration', '2013-11-26 12:25:42', 0, 0, NULL, NULL, NULL, NULL, NULL),
(640, 'sandbox', '', '2652eec977dcb2a5aea85f5bec235b05', 'pl', 'Sandbox', 'Sandbox', '2013-11-26 12:25:42', 0, 0, NULL, NULL, NULL, NULL, NULL),
(639, 'sandbox', '', '2652eec977dcb2a5aea85f5bec235b05', 'es', 'Sandbox', 'Sandbox', '2013-11-26 12:25:42', 0, 0, NULL, NULL, NULL, NULL, NULL),
(638, 'sandbox', '', '2652eec977dcb2a5aea85f5bec235b05', 'en', 'Sandbox', 'Sandbox', '2013-11-26 12:25:42', 0, 0, NULL, NULL, NULL, NULL, NULL),
(637, 'menu', '', '0323de4f66a1700e2173e9bcdce02715', 'pl', 'Logout', 'Logout', '2013-11-26 12:25:42', 0, 0, NULL, NULL, NULL, NULL, NULL),
(636, 'menu', '', '0323de4f66a1700e2173e9bcdce02715', 'es', 'Logout', 'Logout', '2013-11-26 12:25:42', 0, 0, NULL, NULL, NULL, NULL, NULL),
(635, 'menu', '', '0323de4f66a1700e2173e9bcdce02715', 'en', 'Logout', 'Logout', '2013-11-26 12:25:42', 0, 0, NULL, NULL, NULL, NULL, NULL),
(470, 'gallery', '', '5c93310dd0291e121181e830cdda892e', 'en', 'Gallery', 'Gallery', '2013-11-20 01:32:20', 0, 0, NULL, NULL, NULL, NULL, NULL),
(471, 'gallery', '', '5c93310dd0291e121181e830cdda892e', 'es', 'Gallery', 'Gallery', '2013-11-20 01:32:20', 0, 0, NULL, NULL, NULL, NULL, NULL),
(472, 'gallery', '', '5c93310dd0291e121181e830cdda892e', 'pl', 'Gallery', 'Gallery', '2013-11-20 01:32:20', 0, 0, NULL, NULL, NULL, NULL, NULL),
(473, 'gallery', '', 'd0eb0dfd325363d0dd26e975e70fdb39', 'en', 'Images will be resized to', 'Images will be resized to', '2013-11-20 01:32:20', 0, 0, NULL, NULL, NULL, NULL, NULL),
(474, 'gallery', '', 'd0eb0dfd325363d0dd26e975e70fdb39', 'es', 'Images will be resized to', 'Images will be resized to', '2013-11-20 01:32:20', 0, 0, NULL, NULL, NULL, NULL, NULL),
(475, 'gallery', '', 'd0eb0dfd325363d0dd26e975e70fdb39', 'pl', 'Images will be resized to', 'Images will be resized to', '2013-11-20 01:32:20', 0, 0, NULL, NULL, NULL, NULL, NULL),
(476, 'gallery', '', 'e8ad02a20e571d931f064c2f7156f61d', 'en', 'Maximum file size is', 'Maximum file size is', '2013-11-20 01:32:20', 0, 0, NULL, NULL, NULL, NULL, NULL),
(477, 'gallery', '', 'e8ad02a20e571d931f064c2f7156f61d', 'es', 'Maximum file size is', 'Maximum file size is', '2013-11-20 01:32:20', 0, 0, NULL, NULL, NULL, NULL, NULL),
(478, 'gallery', '', 'e8ad02a20e571d931f064c2f7156f61d', 'pl', 'Maximum file size is', 'Maximum file size is', '2013-11-20 01:32:20', 0, 0, NULL, NULL, NULL, NULL, NULL),
(479, 'fields', '', '9b9d8a976b42e0bd66381797644943d5', 'en', 'Published', 'Published', '2013-11-20 01:34:45', 0, 0, NULL, NULL, NULL, NULL, NULL),
(480, 'fields', '', '9b9d8a976b42e0bd66381797644943d5', 'es', 'Published', 'Published', '2013-11-20 01:34:45', 0, 0, NULL, NULL, NULL, NULL, NULL),
(481, 'fields', '', '9b9d8a976b42e0bd66381797644943d5', 'pl', 'Published', 'Published', '2013-11-20 01:34:45', 0, 0, NULL, NULL, NULL, NULL, NULL),
(482, 'gallery', '', 'a240fa27925a635b08dc28c9e4f9216d', 'en', 'Order', 'Order', '2013-11-20 01:50:22', 0, 0, NULL, NULL, NULL, NULL, NULL),
(483, 'gallery', '', 'a240fa27925a635b08dc28c9e4f9216d', 'es', 'Order', 'Order', '2013-11-20 01:50:22', 0, 0, NULL, NULL, NULL, NULL, NULL),
(484, 'gallery', '', 'a240fa27925a635b08dc28c9e4f9216d', 'pl', 'Order', 'Order', '2013-11-20 01:50:22', 0, 0, NULL, NULL, NULL, NULL, NULL),
(485, 'gallery', '', '83b5a65e518c21ed0a5f2b383dd9b617', 'en', 'Delete image', 'Delete image', '2013-11-20 01:50:22', 0, 0, NULL, NULL, NULL, NULL, NULL),
(486, 'gallery', '', '83b5a65e518c21ed0a5f2b383dd9b617', 'es', 'Delete image', 'Delete image', '2013-11-20 01:50:22', 0, 0, NULL, NULL, NULL, NULL, NULL),
(487, 'gallery', '', '83b5a65e518c21ed0a5f2b383dd9b617', 'pl', 'Delete image', 'Delete image', '2013-11-20 01:50:22', 0, 0, NULL, NULL, NULL, NULL, NULL),
(488, 'buttons', '', '7258e7251413465e0a3eb58094430bde', 'en', 'Administration', 'Administration', '2013-11-23 18:13:37', 0, 0, NULL, NULL, NULL, NULL, NULL),
(489, 'buttons', '', '7258e7251413465e0a3eb58094430bde', 'es', 'Administration', 'Administration', '2013-11-23 18:13:37', 0, 0, NULL, NULL, NULL, NULL, NULL),
(490, 'buttons', '', '7258e7251413465e0a3eb58094430bde', 'pl', 'Administration', 'Administration', '2013-11-23 18:13:37', 0, 0, NULL, NULL, NULL, NULL, NULL),
(491, 'musca_configuration_user', '', '254f642527b45bc260048e30704edb39', 'en', 'Configuration', 'Configuration', '2013-11-23 18:14:56', 0, 0, NULL, NULL, NULL, NULL, NULL),
(492, 'musca_configuration_user', '', '254f642527b45bc260048e30704edb39', 'es', 'Configuration', 'Configuration', '2013-11-23 18:14:56', 0, 0, NULL, NULL, NULL, NULL, NULL),
(493, 'musca_configuration_user', '', '254f642527b45bc260048e30704edb39', 'pl', 'Configuration', 'Configuration', '2013-11-23 18:14:56', 0, 0, NULL, NULL, NULL, NULL, NULL),
(494, 'musca_configuration', '', '254f642527b45bc260048e30704edb39', 'en', 'Configuration', 'Configuration', '2013-11-23 18:15:02', 0, 0, NULL, NULL, NULL, NULL, NULL),
(495, 'musca_configuration', '', '254f642527b45bc260048e30704edb39', 'es', 'Configuration', 'Configuration', '2013-11-23 18:15:02', 0, 0, NULL, NULL, NULL, NULL, NULL),
(496, 'musca_configuration', '', '254f642527b45bc260048e30704edb39', 'pl', 'Configuration', 'Configuration', '2013-11-23 18:15:02', 0, 0, NULL, NULL, NULL, NULL, NULL),
(497, 'musca_translation_admin', '', '0b8d92bc19b720bb1065649535463409', 'en', 'Translations', 'Translations', '2013-11-23 18:20:33', 0, 0, NULL, NULL, NULL, NULL, NULL),
(498, 'musca_translation_admin', '', '0b8d92bc19b720bb1065649535463409', 'es', 'Translations', 'Translations', '2013-11-23 18:20:33', 0, 0, NULL, NULL, NULL, NULL, NULL),
(499, 'musca_translation_admin', '', '0b8d92bc19b720bb1065649535463409', 'pl', 'Translations', 'Translations', '2013-11-23 18:20:33', 0, 0, NULL, NULL, NULL, NULL, NULL),
(500, 'buttons', '', '13348442cc6a27032d2b4aa28b75a5d3', 'en', 'Search', 'Search', '2013-11-23 18:35:23', 0, 0, NULL, NULL, NULL, NULL, NULL),
(501, 'buttons', '', '13348442cc6a27032d2b4aa28b75a5d3', 'es', 'Search', 'Search', '2013-11-23 18:35:23', 0, 0, NULL, NULL, NULL, NULL, NULL),
(502, 'buttons', '', '13348442cc6a27032d2b4aa28b75a5d3', 'pl', 'Search', 'Search', '2013-11-23 18:35:23', 0, 0, NULL, NULL, NULL, NULL, NULL),
(503, 'product', '', '068f80c7519d0528fb08e82137a72131', 'en', 'Products', 'Products', '2013-11-25 15:48:21', 0, 0, NULL, NULL, NULL, NULL, NULL),
(504, 'product', '', '068f80c7519d0528fb08e82137a72131', 'es', 'Products', 'Products', '2013-11-25 15:48:21', 0, 0, NULL, NULL, NULL, NULL, NULL),
(505, 'product', '', '068f80c7519d0528fb08e82137a72131', 'pl', 'Products', 'Products', '2013-11-25 15:48:21', 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `musca_i18n_admin` (`id_i18n`, `section`, `detail`, `tag`, `lang`, `value`, `value_tpl`, `date_modified`, `seen`, `html`, `file`, `image`, `width`, `height`, `crop`) VALUES
(506, 'product', '', '453aceb005ceaf54a47da15fee8b2a26', 'en', 'Pages', 'Pages', '2013-11-25 15:48:21', 0, 0, NULL, NULL, NULL, NULL, NULL),
(507, 'product', '', '453aceb005ceaf54a47da15fee8b2a26', 'es', 'Pages', 'Pages', '2013-11-25 15:48:21', 0, 0, NULL, NULL, NULL, NULL, NULL),
(508, 'product', '', '453aceb005ceaf54a47da15fee8b2a26', 'pl', 'Pages', 'Pages', '2013-11-25 15:48:21', 0, 0, NULL, NULL, NULL, NULL, NULL),
(509, 'product', '', 'deb10517653c255364175796ace3553f', 'en', 'Product', 'Product', '2013-11-25 15:48:24', 0, 0, NULL, NULL, NULL, NULL, NULL),
(510, 'product', '', 'deb10517653c255364175796ace3553f', 'es', 'Product', 'Product', '2013-11-25 15:48:24', 0, 0, NULL, NULL, NULL, NULL, NULL),
(511, 'product', '', 'deb10517653c255364175796ace3553f', 'pl', 'Product', 'Product', '2013-11-25 15:48:24', 0, 0, NULL, NULL, NULL, NULL, NULL),
(515, 'page', '', '453aceb005ceaf54a47da15fee8b2a26', 'en', 'Pages', 'Pages', '2013-11-25 15:48:27', 0, 0, NULL, NULL, NULL, NULL, NULL),
(516, 'page', '', '453aceb005ceaf54a47da15fee8b2a26', 'es', 'Pages', 'Pages', '2013-11-25 15:48:27', 0, 0, NULL, NULL, NULL, NULL, NULL),
(517, 'page', '', '453aceb005ceaf54a47da15fee8b2a26', 'pl', 'Pages', 'Pages', '2013-11-25 15:48:27', 0, 0, NULL, NULL, NULL, NULL, NULL),
(518, 'page', '', '70a4bc2672e2e3912e6476a2bd7ba29b', 'en', 'Parent page', 'Parent page', '2013-11-25 15:48:27', 0, 0, NULL, NULL, NULL, NULL, NULL),
(519, 'page', '', '70a4bc2672e2e3912e6476a2bd7ba29b', 'es', 'Parent page', 'Parent page', '2013-11-25 15:48:27', 0, 0, NULL, NULL, NULL, NULL, NULL),
(520, 'page', '', '70a4bc2672e2e3912e6476a2bd7ba29b', 'pl', 'Parent page', 'Parent page', '2013-11-25 15:48:27', 0, 0, NULL, NULL, NULL, NULL, NULL),
(521, 'page', '', '49ee3087348e8d44e1feda1917443987', 'en', 'Name', 'Name', '2013-11-25 15:48:34', 0, 0, NULL, NULL, NULL, NULL, NULL),
(522, 'page', '', '49ee3087348e8d44e1feda1917443987', 'es', 'Name', 'Name', '2013-11-25 15:48:34', 0, 0, NULL, NULL, NULL, NULL, NULL),
(523, 'page', '', '49ee3087348e8d44e1feda1917443987', 'pl', 'Name', 'Name', '2013-11-25 15:48:34', 0, 0, NULL, NULL, NULL, NULL, NULL),
(524, 'page', '', '0c908588520b3ef787bce443fc2b507c', 'en', 'Slug', 'Slug', '2013-11-25 15:48:34', 0, 0, NULL, NULL, NULL, NULL, NULL),
(525, 'page', '', '0c908588520b3ef787bce443fc2b507c', 'es', 'Slug', 'Slug', '2013-11-25 15:48:34', 0, 0, NULL, NULL, NULL, NULL, NULL),
(526, 'page', '', '0c908588520b3ef787bce443fc2b507c', 'pl', 'Slug', 'Slug', '2013-11-25 15:48:34', 0, 0, NULL, NULL, NULL, NULL, NULL),
(527, 'page', '', '9b9d8a976b42e0bd66381797644943d5', 'en', 'Published', 'Published', '2013-11-25 15:48:34', 0, 0, NULL, NULL, NULL, NULL, NULL),
(528, 'page', '', '9b9d8a976b42e0bd66381797644943d5', 'es', 'Published', 'Published', '2013-11-25 15:48:34', 0, 0, NULL, NULL, NULL, NULL, NULL),
(529, 'page', '', '9b9d8a976b42e0bd66381797644943d5', 'pl', 'Published', 'Published', '2013-11-25 15:48:34', 0, 0, NULL, NULL, NULL, NULL, NULL),
(530, 'page', '', 'be53a0541a6d36f6ecb879fa2c584b08', 'en', 'Image', 'Image', '2013-11-25 15:48:34', 0, 0, NULL, NULL, NULL, NULL, NULL),
(531, 'page', '', 'be53a0541a6d36f6ecb879fa2c584b08', 'es', 'Image', 'Image', '2013-11-25 15:48:34', 0, 0, NULL, NULL, NULL, NULL, NULL),
(532, 'page', '', 'be53a0541a6d36f6ecb879fa2c584b08', 'pl', 'Image', 'Image', '2013-11-25 15:48:34', 0, 0, NULL, NULL, NULL, NULL, NULL),
(533, 'page', '', '7269874adaa89515dbab05dc72a2767d', 'en', 'Image will be resized to', 'Image will be resized to', '2013-11-25 15:48:34', 0, 0, NULL, NULL, NULL, NULL, NULL),
(534, 'page', '', '7269874adaa89515dbab05dc72a2767d', 'es', 'Image will be resized to', 'Image will be resized to', '2013-11-25 15:48:34', 0, 0, NULL, NULL, NULL, NULL, NULL),
(535, 'page', '', '7269874adaa89515dbab05dc72a2767d', 'pl', 'Image will be resized to', 'Image will be resized to', '2013-11-25 15:48:34', 0, 0, NULL, NULL, NULL, NULL, NULL),
(536, 'page', '', 'e8ad02a20e571d931f064c2f7156f61d', 'en', 'Maximum file size is', 'Maximum file size is', '2013-11-25 15:48:34', 0, 0, NULL, NULL, NULL, NULL, NULL),
(537, 'page', '', 'e8ad02a20e571d931f064c2f7156f61d', 'es', 'Maximum file size is', 'Maximum file size is', '2013-11-25 15:48:34', 0, 0, NULL, NULL, NULL, NULL, NULL),
(538, 'page', '', 'e8ad02a20e571d931f064c2f7156f61d', 'pl', 'Maximum file size is', 'Maximum file size is', '2013-11-25 15:48:34', 0, 0, NULL, NULL, NULL, NULL, NULL),
(539, 'page', '', '0b79795d3efc95b9976c7c5b933afce2', 'en', 'Introduction', 'Introduction', '2013-11-25 15:48:34', 0, 0, NULL, NULL, NULL, NULL, NULL),
(540, 'page', '', '0b79795d3efc95b9976c7c5b933afce2', 'es', 'Introduction', 'Introduction', '2013-11-25 15:48:34', 0, 0, NULL, NULL, NULL, NULL, NULL),
(541, 'page', '', '0b79795d3efc95b9976c7c5b933afce2', 'pl', 'Introduction', 'Introduction', '2013-11-25 15:48:34', 0, 0, NULL, NULL, NULL, NULL, NULL),
(542, 'page', '', 'f15c1cae7882448b3fb0404682e17e61', 'en', 'Content', 'Content', '2013-11-25 15:48:34', 0, 0, NULL, NULL, NULL, NULL, NULL),
(543, 'page', '', 'f15c1cae7882448b3fb0404682e17e61', 'es', 'Content', 'Content', '2013-11-25 15:48:34', 0, 0, NULL, NULL, NULL, NULL, NULL),
(544, 'page', '', 'f15c1cae7882448b3fb0404682e17e61', 'pl', 'Content', 'Content', '2013-11-25 15:48:34', 0, 0, NULL, NULL, NULL, NULL, NULL),
(545, 'page', '', '83b5a65e518c21ed0a5f2b383dd9b617', 'en', 'Delete image', 'Delete image', '2013-11-25 15:49:23', 0, 0, NULL, NULL, NULL, NULL, NULL),
(546, 'page', '', '83b5a65e518c21ed0a5f2b383dd9b617', 'es', 'Delete image', 'Delete image', '2013-11-25 15:49:23', 0, 0, NULL, NULL, NULL, NULL, NULL),
(547, 'page', '', '83b5a65e518c21ed0a5f2b383dd9b617', 'pl', 'Delete image', 'Delete image', '2013-11-25 15:49:23', 0, 0, NULL, NULL, NULL, NULL, NULL),
(548, 'product', '', '44749712dbec183e983dcd78a7736c41', 'en', 'Date', 'Date', '2013-11-25 17:36:22', 0, 0, NULL, NULL, NULL, NULL, NULL),
(549, 'product', '', '44749712dbec183e983dcd78a7736c41', 'es', 'Date', 'Date', '2013-11-25 17:36:22', 0, 0, NULL, NULL, NULL, NULL, NULL),
(550, 'product', '', '44749712dbec183e983dcd78a7736c41', 'pl', 'Date', 'Date', '2013-11-25 17:36:22', 0, 0, NULL, NULL, NULL, NULL, NULL),
(551, 'product', '', '7269874adaa89515dbab05dc72a2767d', 'en', 'Image will be resized to', 'Image will be resized to', '2013-11-25 17:36:22', 0, 0, NULL, NULL, NULL, NULL, NULL),
(552, 'product', '', '7269874adaa89515dbab05dc72a2767d', 'es', 'Image will be resized to', 'Image will be resized to', '2013-11-25 17:36:22', 0, 0, NULL, NULL, NULL, NULL, NULL),
(553, 'product', '', '7269874adaa89515dbab05dc72a2767d', 'pl', 'Image will be resized to', 'Image will be resized to', '2013-11-25 17:36:22', 0, 0, NULL, NULL, NULL, NULL, NULL),
(554, 'product', '', 'e8ad02a20e571d931f064c2f7156f61d', 'en', 'Maximum file size is', 'Maximum file size is', '2013-11-25 17:36:22', 0, 0, NULL, NULL, NULL, NULL, NULL),
(555, 'product', '', 'e8ad02a20e571d931f064c2f7156f61d', 'es', 'Maximum file size is', 'Maximum file size is', '2013-11-25 17:36:22', 0, 0, NULL, NULL, NULL, NULL, NULL),
(556, 'product', '', 'e8ad02a20e571d931f064c2f7156f61d', 'pl', 'Maximum file size is', 'Maximum file size is', '2013-11-25 17:36:22', 0, 0, NULL, NULL, NULL, NULL, NULL),
(557, 'product', '', '83b5a65e518c21ed0a5f2b383dd9b617', 'en', 'Delete image', 'Delete image', '2013-11-25 18:56:59', 0, 0, NULL, NULL, NULL, NULL, NULL),
(558, 'product', '', '83b5a65e518c21ed0a5f2b383dd9b617', 'es', 'Delete image', 'Delete image', '2013-11-25 18:56:59', 0, 0, NULL, NULL, NULL, NULL, NULL),
(559, 'product', '', '83b5a65e518c21ed0a5f2b383dd9b617', 'pl', 'Delete image', 'Delete image', '2013-11-25 18:56:59', 0, 0, NULL, NULL, NULL, NULL, NULL),
(560, 'grid', '', 'ec211f7c20af43e742bf2570c3cb84f9', 'en', 'Add', 'Add', '2013-11-26 12:23:02', 0, 0, NULL, NULL, NULL, NULL, NULL),
(561, 'grid', '', 'ec211f7c20af43e742bf2570c3cb84f9', 'es', 'Add', 'Add', '2013-11-26 12:23:02', 0, 0, NULL, NULL, NULL, NULL, NULL),
(562, 'grid', '', 'ec211f7c20af43e742bf2570c3cb84f9', 'pl', 'Add', 'Add', '2013-11-26 12:23:02', 0, 0, NULL, NULL, NULL, NULL, NULL),
(563, 'grid', '', '7dce122004969d56ae2e0245cb754d35', 'en', 'Edit', 'Edit', '2013-11-26 12:23:02', 0, 0, NULL, NULL, NULL, NULL, NULL),
(564, 'grid', '', '7dce122004969d56ae2e0245cb754d35', 'es', 'Edit', 'Edit', '2013-11-26 12:23:02', 0, 0, NULL, NULL, NULL, NULL, NULL),
(565, 'grid', '', '7dce122004969d56ae2e0245cb754d35', 'pl', 'Edit', 'Edit', '2013-11-26 12:23:02', 0, 0, NULL, NULL, NULL, NULL, NULL),
(566, 'grid', '', 'f2a6c498fb90ee345d997f888fce3b18', 'en', 'Delete', 'Delete', '2013-11-26 12:23:02', 0, 0, NULL, NULL, NULL, NULL, NULL),
(567, 'grid', '', 'f2a6c498fb90ee345d997f888fce3b18', 'es', 'Delete', 'Delete', '2013-11-26 12:23:02', 0, 0, NULL, NULL, NULL, NULL, NULL),
(568, 'grid', '', 'f2a6c498fb90ee345d997f888fce3b18', 'pl', 'Delete', 'Delete', '2013-11-26 12:23:02', 0, 0, NULL, NULL, NULL, NULL, NULL),
(569, 'grid', '', '4c41e0bd957698b58100a5c687d757d9', 'en', 'Select all', 'Select all', '2013-11-26 12:23:02', 0, 0, NULL, NULL, NULL, NULL, NULL),
(570, 'grid', '', '4c41e0bd957698b58100a5c687d757d9', 'es', 'Select all', 'Select all', '2013-11-26 12:23:02', 0, 0, NULL, NULL, NULL, NULL, NULL),
(571, 'grid', '', '4c41e0bd957698b58100a5c687d757d9', 'pl', 'Select all', 'Select all', '2013-11-26 12:23:02', 0, 0, NULL, NULL, NULL, NULL, NULL),
(572, 'grid', '', '52e3ce2bc983012661c3c11fe8b0f8ce', 'en', 'Deselect all', 'Deselect all', '2013-11-26 12:23:02', 0, 0, NULL, NULL, NULL, NULL, NULL),
(573, 'grid', '', '52e3ce2bc983012661c3c11fe8b0f8ce', 'es', 'Deselect all', 'Deselect all', '2013-11-26 12:23:02', 0, 0, NULL, NULL, NULL, NULL, NULL),
(574, 'grid', '', '52e3ce2bc983012661c3c11fe8b0f8ce', 'pl', 'Deselect all', 'Deselect all', '2013-11-26 12:23:02', 0, 0, NULL, NULL, NULL, NULL, NULL),
(575, 'grid', '', 'b718adec73e04ce3ec720dd11a06a308', 'en', 'ID', 'ID', '2013-11-26 12:23:25', 0, 0, NULL, NULL, NULL, NULL, NULL),
(576, 'grid', '', 'b718adec73e04ce3ec720dd11a06a308', 'es', 'ID', 'ID', '2013-11-26 12:23:25', 0, 0, NULL, NULL, NULL, NULL, NULL),
(577, 'grid', '', 'b718adec73e04ce3ec720dd11a06a308', 'pl', 'ID', 'ID', '2013-11-26 12:23:25', 0, 0, NULL, NULL, NULL, NULL, NULL),
(578, 'grid', '', '263ab2eac2168d940fe76675ef8b3081', 'en', 'Lang', 'Lang', '2013-11-26 12:23:25', 0, 0, NULL, NULL, NULL, NULL, NULL),
(579, 'grid', '', '263ab2eac2168d940fe76675ef8b3081', 'es', 'Lang', 'Lang', '2013-11-26 12:23:25', 0, 0, NULL, NULL, NULL, NULL, NULL),
(580, 'grid', '', '263ab2eac2168d940fe76675ef8b3081', 'pl', 'Lang', 'Lang', '2013-11-26 12:23:25', 0, 0, NULL, NULL, NULL, NULL, NULL),
(581, 'grid', '', 'd2c24d59e0baff4d0155fbdf62590867', 'en', 'Section', 'Section', '2013-11-26 12:23:25', 0, 0, NULL, NULL, NULL, NULL, NULL),
(582, 'grid', '', 'd2c24d59e0baff4d0155fbdf62590867', 'es', 'Section', 'Section', '2013-11-26 12:23:25', 0, 0, NULL, NULL, NULL, NULL, NULL),
(583, 'grid', '', 'd2c24d59e0baff4d0155fbdf62590867', 'pl', 'Section', 'Section', '2013-11-26 12:23:25', 0, 0, NULL, NULL, NULL, NULL, NULL),
(584, 'grid', '', 'a254c25adc7d10d7e9c4889484f875a5', 'en', 'Detail', 'Detail', '2013-11-26 12:23:25', 0, 0, NULL, NULL, NULL, NULL, NULL),
(585, 'grid', '', 'a254c25adc7d10d7e9c4889484f875a5', 'es', 'Detail', 'Detail', '2013-11-26 12:23:25', 0, 0, NULL, NULL, NULL, NULL, NULL),
(586, 'grid', '', 'a254c25adc7d10d7e9c4889484f875a5', 'pl', 'Detail', 'Detail', '2013-11-26 12:23:25', 0, 0, NULL, NULL, NULL, NULL, NULL),
(587, 'grid', '', '532220dbf680ea98d665427b145e72ca', 'en', 'Translated', 'Translated', '2013-11-26 12:23:25', 0, 0, NULL, NULL, NULL, NULL, NULL),
(588, 'grid', '', '532220dbf680ea98d665427b145e72ca', 'es', 'Translated', 'Translated', '2013-11-26 12:23:25', 0, 0, NULL, NULL, NULL, NULL, NULL),
(589, 'grid', '', '532220dbf680ea98d665427b145e72ca', 'pl', 'Translated', 'Translated', '2013-11-26 12:23:25', 0, 0, NULL, NULL, NULL, NULL, NULL),
(590, 'grid', '', '0a52da7a03a6de3beefe54f8c03ad80d', 'en', 'Original', 'Original', '2013-11-26 12:23:25', 0, 0, NULL, NULL, NULL, NULL, NULL),
(591, 'grid', '', '0a52da7a03a6de3beefe54f8c03ad80d', 'es', 'Original', 'Original', '2013-11-26 12:23:25', 0, 0, NULL, NULL, NULL, NULL, NULL),
(592, 'grid', '', '0a52da7a03a6de3beefe54f8c03ad80d', 'pl', 'Original', 'Original', '2013-11-26 12:23:25', 0, 0, NULL, NULL, NULL, NULL, NULL),
(593, 'grid', '', '35e0c8c0b180c95d4e122e55ed62cc64', 'en', 'Modified', 'Modified', '2013-11-26 12:23:25', 0, 0, NULL, NULL, NULL, NULL, NULL),
(594, 'grid', '', '35e0c8c0b180c95d4e122e55ed62cc64', 'es', 'Modified', 'Modified', '2013-11-26 12:23:25', 0, 0, NULL, NULL, NULL, NULL, NULL),
(595, 'grid', '', '35e0c8c0b180c95d4e122e55ed62cc64', 'pl', 'Modified', 'Modified', '2013-11-26 12:23:25', 0, 0, NULL, NULL, NULL, NULL, NULL),
(596, 'grid', '', '24fcfb3f7a14f07f7e83903cb479b640', 'en', 'Showing records from', 'Showing records from', '2013-11-26 12:23:25', 0, 0, NULL, NULL, NULL, NULL, NULL),
(597, 'grid', '', '24fcfb3f7a14f07f7e83903cb479b640', 'es', 'Showing records from', 'Showing records from', '2013-11-26 12:23:25', 0, 0, NULL, NULL, NULL, NULL, NULL),
(598, 'grid', '', '24fcfb3f7a14f07f7e83903cb479b640', 'pl', 'Showing records from', 'Showing records from', '2013-11-26 12:23:25', 0, 0, NULL, NULL, NULL, NULL, NULL),
(599, 'grid', '', '01b6e20344b68835c5ed1ddedf20d531', 'en', 'to', 'to', '2013-11-26 12:23:25', 0, 0, NULL, NULL, NULL, NULL, NULL),
(600, 'grid', '', '01b6e20344b68835c5ed1ddedf20d531', 'es', 'to', 'to', '2013-11-26 12:23:25', 0, 0, NULL, NULL, NULL, NULL, NULL),
(601, 'grid', '', '01b6e20344b68835c5ed1ddedf20d531', 'pl', 'to', 'to', '2013-11-26 12:23:25', 0, 0, NULL, NULL, NULL, NULL, NULL),
(602, 'grid', '', 'da280aee8ae9c9103e07ec1a51a25e7e', 'en', 'in total)', 'in total)', '2013-11-26 12:23:25', 0, 0, NULL, NULL, NULL, NULL, NULL),
(603, 'grid', '', 'da280aee8ae9c9103e07ec1a51a25e7e', 'es', 'in total)', 'in total)', '2013-11-26 12:23:25', 0, 0, NULL, NULL, NULL, NULL, NULL),
(604, 'grid', '', 'da280aee8ae9c9103e07ec1a51a25e7e', 'pl', 'in total)', 'in total)', '2013-11-26 12:23:25', 0, 0, NULL, NULL, NULL, NULL, NULL),
(605, 'grid', '', '21d104a54fc71a19a325c7305327f1d2', 'en', 'Processing...', 'Processing...', '2013-11-26 12:23:25', 0, 0, NULL, NULL, NULL, NULL, NULL),
(606, 'grid', '', '21d104a54fc71a19a325c7305327f1d2', 'es', 'Processing...', 'Processing...', '2013-11-26 12:23:25', 0, 0, NULL, NULL, NULL, NULL, NULL),
(607, 'grid', '', '21d104a54fc71a19a325c7305327f1d2', 'pl', 'Processing...', 'Processing...', '2013-11-26 12:23:25', 0, 0, NULL, NULL, NULL, NULL, NULL),
(608, 'grid', '', '64959029acf7b169f8d972637b75b49e', 'en', 'No records', 'No records', '2013-11-26 12:23:25', 0, 0, NULL, NULL, NULL, NULL, NULL),
(609, 'grid', '', '64959029acf7b169f8d972637b75b49e', 'es', 'No records', 'No records', '2013-11-26 12:23:25', 0, 0, NULL, NULL, NULL, NULL, NULL),
(610, 'grid', '', '64959029acf7b169f8d972637b75b49e', 'pl', 'No records', 'No records', '2013-11-26 12:23:25', 0, 0, NULL, NULL, NULL, NULL, NULL),
(611, 'grid', '', '5aaa4dbaa85d5dc3a7156ac9a69294a4', 'en', 'Error connecting', 'Error connecting', '2013-11-26 12:23:25', 0, 0, NULL, NULL, NULL, NULL, NULL),
(612, 'grid', '', '5aaa4dbaa85d5dc3a7156ac9a69294a4', 'es', 'Error connecting', 'Error connecting', '2013-11-26 12:23:25', 0, 0, NULL, NULL, NULL, NULL, NULL),
(613, 'grid', '', '5aaa4dbaa85d5dc3a7156ac9a69294a4', 'pl', 'Error connecting', 'Error connecting', '2013-11-26 12:23:25', 0, 0, NULL, NULL, NULL, NULL, NULL),
(614, 'grid', '', 'c59519b5ec462f2faa3fd4fa713773dc', 'en', 'Are you sure that you want to delete selected items?', 'Are you sure that you want to delete selected items?', '2013-11-26 12:23:25', 0, 0, NULL, NULL, NULL, NULL, NULL),
(615, 'grid', '', 'c59519b5ec462f2faa3fd4fa713773dc', 'es', 'Are you sure that you want to delete selected items?', 'Are you sure that you want to delete selected items?', '2013-11-26 12:23:25', 0, 0, NULL, NULL, NULL, NULL, NULL),
(616, 'grid', '', 'c59519b5ec462f2faa3fd4fa713773dc', 'pl', 'Are you sure that you want to delete selected items?', 'Are you sure that you want to delete selected items?', '2013-11-26 12:23:25', 0, 0, NULL, NULL, NULL, NULL, NULL),
(617, 'grid', '', '7fb4000a4014d63b690d0e064f5ba66d', 'en', 'Select at least one item', 'Select at least one item', '2013-11-26 12:23:25', 0, 0, NULL, NULL, NULL, NULL, NULL),
(618, 'grid', '', '7fb4000a4014d63b690d0e064f5ba66d', 'es', 'Select at least one item', 'Select at least one item', '2013-11-26 12:23:25', 0, 0, NULL, NULL, NULL, NULL, NULL),
(619, 'grid', '', '7fb4000a4014d63b690d0e064f5ba66d', 'pl', 'Select at least one item', 'Select at least one item', '2013-11-26 12:23:25', 0, 0, NULL, NULL, NULL, NULL, NULL),
(620, 'grid', '', 'a13367a8e2a3f3bf4f3409079e3fdf87', 'en', 'Activate', 'Activate', '2013-11-26 12:23:25', 0, 0, NULL, NULL, NULL, NULL, NULL),
(621, 'grid', '', 'a13367a8e2a3f3bf4f3409079e3fdf87', 'es', 'Activate', 'Activate', '2013-11-26 12:23:25', 0, 0, NULL, NULL, NULL, NULL, NULL),
(622, 'grid', '', 'a13367a8e2a3f3bf4f3409079e3fdf87', 'pl', 'Activate', 'Activate', '2013-11-26 12:23:25', 0, 0, NULL, NULL, NULL, NULL, NULL),
(623, 'grid', '', 'e443f03bb7afc36f5b972fa2d9912922', 'en', 'Are you sure that you want to activate selected items?', 'Are you sure that you want to activate selected items?', '2013-11-26 12:23:25', 0, 0, NULL, NULL, NULL, NULL, NULL),
(624, 'grid', '', 'e443f03bb7afc36f5b972fa2d9912922', 'es', 'Are you sure that you want to activate selected items?', 'Are you sure that you want to activate selected items?', '2013-11-26 12:23:25', 0, 0, NULL, NULL, NULL, NULL, NULL),
(625, 'grid', '', 'e443f03bb7afc36f5b972fa2d9912922', 'pl', 'Are you sure that you want to activate selected items?', 'Are you sure that you want to activate selected items?', '2013-11-26 12:23:25', 0, 0, NULL, NULL, NULL, NULL, NULL),
(626, 'grid', '', 'a9555fd9adb4026033e4ffbb1009df60', 'en', 'Desactivate', 'Desactivate', '2013-11-26 12:23:25', 0, 0, NULL, NULL, NULL, NULL, NULL),
(627, 'grid', '', 'a9555fd9adb4026033e4ffbb1009df60', 'es', 'Desactivate', 'Desactivate', '2013-11-26 12:23:25', 0, 0, NULL, NULL, NULL, NULL, NULL),
(628, 'grid', '', 'a9555fd9adb4026033e4ffbb1009df60', 'pl', 'Desactivate', 'Desactivate', '2013-11-26 12:23:25', 0, 0, NULL, NULL, NULL, NULL, NULL),
(629, 'grid', '', '730a018d93688dfc2aa0dea4171b95db', 'en', 'Are you sure that you want to desactivate selected items?', 'Are you sure that you want to desactivate selected items?', '2013-11-26 12:23:25', 0, 0, NULL, NULL, NULL, NULL, NULL),
(630, 'grid', '', '730a018d93688dfc2aa0dea4171b95db', 'es', 'Are you sure that you want to desactivate selected items?', 'Are you sure that you want to desactivate selected items?', '2013-11-26 12:23:25', 0, 0, NULL, NULL, NULL, NULL, NULL),
(631, 'grid', '', '730a018d93688dfc2aa0dea4171b95db', 'pl', 'Are you sure that you want to desactivate selected items?', 'Are you sure that you want to desactivate selected items?', '2013-11-26 12:23:25', 0, 0, NULL, NULL, NULL, NULL, NULL),
(632, 'grid', '', '729a51874fe901b092899e9e8b31c97a', 'en', 'Are you sure?', 'Are you sure?', '2013-11-26 12:23:25', 0, 0, NULL, NULL, NULL, NULL, NULL),
(633, 'grid', '', '729a51874fe901b092899e9e8b31c97a', 'es', 'Are you sure?', 'Are you sure?', '2013-11-26 12:23:25', 0, 0, NULL, NULL, NULL, NULL, NULL),
(634, 'grid', '', '729a51874fe901b092899e9e8b31c97a', 'pl', 'Are you sure?', 'Are you sure?', '2013-11-26 12:23:25', 0, 0, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `page`
--

DROP TABLE IF EXISTS `page`;
CREATE TABLE IF NOT EXISTS `page` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) collate utf8_unicode_ci default NULL,
  `content` text collate utf8_unicode_ci,
  `intro` text collate utf8_unicode_ci,
  `image` varchar(255) collate utf8_unicode_ci default NULL,
  `slug` varchar(255) collate utf8_unicode_ci default NULL,
  `parent_id` int(11) default NULL,
  `pos` int(11) default NULL,
  `enabled` tinyint(4) default '1',
  PRIMARY KEY  (`id`),
  KEY `parent` (`parent_id`),
  KEY `pos` (`pos`),
  KEY `url` (`slug`),
  KEY `en` (`enabled`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=13 ;

--
-- Dumping data for table `page`
--

INSERT INTO `page` (`id`, `name`, `content`, `intro`, `image`, `slug`, `parent_id`, `pos`, `enabled`) VALUES
(1, 'Tjurar', '', '', '', 'tjurar', 0, 2, 1),
(5, 'Om oss', '<p class="intro">Vi &auml;r ett glatt g&auml;ng kointresserade som vill f&ouml;rmedla det b&auml;sta fr&aring;n tysk holstein till svenska g&aring;rdar, Kristian och Karolina H&aring;rsmar, Leif B&ouml;rjesson, Ann Nilsson och Anita H&auml;gg heter vi. L&auml;s mer under <a href="http://127.0.0.1:8080/toros/html/contact.php">Kontakt</a>. Vi jobbar sj&auml;lva imj&ouml;lkproduktion p&aring; ett eller annat s&auml;tt och delar g&auml;rna med oss av v&aring;ra erfarenheter.</p>\r\n<p><img class="content-img pull-right" src="http://127.0.0.1:8080/toros/html/assets/img/examples/lev-karta.jpg" alt="lev-karta" width="350" height="335" /></p>\r\n<h3>Tj&auml;nster och produkter</h3>\r\n<p>GGI Sweden erbjuder objektiv avelsr&aring;dgivning med hj&auml;lp av kokontroll och Genv&auml;gen. Sperma fr&aring;n tysk Holstein och Brown Swiss, italiensk Brown Swiss och brittisk Ayrshire. Kl&ouml;vv&aring;rdsprodukter fr&aring;n Intra Care, effektivamot eksem, limax och &ouml;vriga sjukdomar som drabbar v&aring;ra kor, f&aring;r och h&auml;star. Bolusar fr&aring;n Animax med sp&aring;r&auml;mnen som ger piggare kalvar, f&ouml;rebygger fertilitetsproblem mm. Vi f&ouml;rmedlar dessutom kalvhyddor, mj&ouml;lkmobil, &Ouml;jebyamman och reservdelar till den.</p>\r\n<p>GGI,GermanGenetic International &auml;r v&aring;r huvuddistribut&ouml;r av tjurar och &auml;r en f&ouml;rs&auml;ljningsorganisation &auml;gd av nio tjurationer (se karta). Fr&aring;n 1,5 miljoner stamboksf&ouml;rda svarta Holsteinkor och 160 000 r&ouml;da Holsteinkor f&aring;r vi ett brett tjurmaterial att v&auml;lja ifr&aring;n.</p>', '<p>vvvvvvv</p>', NULL, 'om-oss', 0, 1, 1),
(6, 'Förkortningar', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur rutrum aliquet interdum. Donec cursus lobortis tempus. Suspendisse potenti.</p>\r\n<ul>\r\n<li>Phasellus eu nisl ut metus mattis rhoncus.</li>\r\n<li>Aliquam ultricies mauris sit amet aliquet fringilla.</li>\r\n<li>Fusce sed justo fermentum, placerat erat ac, lacinia metus.</li>\r\n<li>Suspendisse dapibus neque eu nulla lobortis, eu molestie dui euismod.</li>\r\n<li>Morbi a nibh non erat adipiscing semper congue vitae felis.</li>\r\n</ul>', '', NULL, 'forkortningar', 1, 1, 1),
(7, 'Gamla tjurar', '<p class="intro">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur rutrum aliquet interdum. Donec cursus lobortis tempus. Suspendisse potenti.</p>\r\n<p><a href="http://127.0.0.1:8080/toros/html/tjurar-gamla-tjurar.php#">Ladda ner en excel-fil h&auml;r</a></p>', '', NULL, 'gamla-tjurar', 1, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(200) default '',
  `description` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `enabled` tinyint(1) default NULL,
  `pos` int(11) default '0',
  PRIMARY KEY  (`id`),
  KEY `date` (`date`),
  KEY `enabled` (`enabled`),
  KEY `pos` (`pos`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `description`, `image`, `date`, `enabled`, `pos`) VALUES
(6, 'zzzzzzz', '', 'p1202573.jpg', '2013-09-02', 0, 6),
(9, 'ssssssss', '', '', '2013-09-30', 1, 1),
(10, 'ssssssss', '', '', '2013-09-30', 1, 2),
(11, 'ssssssss', '', '', '2013-09-30', 1, 3),
(12, 'ssssss', '', '', '2013-09-30', 1, 4),
(17, 'test', '', 'oso_polar_1925.jpg', '2013-11-25', 1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `product_gallery`
--

DROP TABLE IF EXISTS `product_gallery`;
CREATE TABLE IF NOT EXISTS `product_gallery` (
  `id` int(11) NOT NULL auto_increment,
  `product_id` int(11) NOT NULL,
  `image` varchar(255) collate utf8_unicode_ci default NULL,
  `pos` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `pos` (`pos`),
  KEY `fk_event_gallery_event1_idx` (`product_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;

--
-- Dumping data for table `product_gallery`
--

INSERT INTO `product_gallery` (`id`, `product_id`, `image`, `pos`) VALUES
(6, 7, '.jpeg', 0),
(8, 17, 'oso_polar.jpg', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_i18n`
--

DROP TABLE IF EXISTS `product_i18n`;
CREATE TABLE IF NOT EXISTS `product_i18n` (
  `id` int(11) NOT NULL,
  `lang` varchar(2) NOT NULL default '',
  `field` varchar(50) NOT NULL default '',
  `value` text,
  PRIMARY KEY  (`id`,`lang`,`field`),
  KEY `id_sandbox` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_i18n`
--

INSERT INTO `product_i18n` (`id`, `lang`, `field`, `value`) VALUES
(3, 'es', 'description', '<p>d</p>'),
(3, 'es', 'name', 'koto'),
(4, 'es', 'description', '<p>yoyo</p>'),
(4, 'es', 'name', 'toto'),
(5, 'es', 'description', '<p>ooooooooo</p>'),
(5, 'es', 'name', 'dupa'),
(6, 'es', 'description', '<p>ooooooooo</p>'),
(6, 'es', 'name', 'zzzzzzz'),
(7, 'en', 'description', '<p><img src="http://jacobmarcus.com/musca/content/files/ocdc_pixel.jpg" alt="ocdc_pixel" /></p>'),
(7, 'en', 'name', 'test'),
(7, 'es', 'description', '<p>xxx</p>'),
(7, 'es', 'name', 'test'),
(7, 'pl', 'description', '<p>plplplp</p>'),
(7, 'pl', 'name', 'test'),
(8, 'en', 'description', ''),
(8, 'en', 'name', 'aaa'),
(8, 'es', 'description', ''),
(8, 'es', 'name', 'test'),
(8, 'pl', 'description', ''),
(8, 'pl', 'name', ''),
(9, 'es', 'description', ''),
(9, 'es', 'name', 'test'),
(10, 'es', 'description', ''),
(10, 'es', 'name', 'test'),
(12, 'en', 'description', ''),
(12, 'en', 'name', ''),
(12, 'es', 'description', '<p>ssssssssss</p>'),
(12, 'es', 'name', 'ssssss'),
(13, 'en', 'description', ''),
(13, 'en', 'name', 'test 5'),
(13, 'es', 'description', ''),
(13, 'es', 'name', ''),
(13, 'pl', 'description', ''),
(13, 'pl', 'name', ''),
(14, 'en', 'description', ''),
(14, 'en', 'name', 'www'),
(14, 'es', 'description', ''),
(14, 'es', 'name', ''),
(14, 'pl', 'description', ''),
(14, 'pl', 'name', ''),
(15, 'en', 'description', ''),
(15, 'en', 'name', 'o'),
(15, 'es', 'description', ''),
(15, 'es', 'name', ''),
(15, 'pl', 'description', ''),
(15, 'pl', 'name', ''),
(16, 'en', 'description', ''),
(16, 'en', 'name', 'e'),
(16, 'es', 'description', ''),
(16, 'es', 'name', ''),
(16, 'pl', 'description', ''),
(16, 'pl', 'name', ''),
(17, 'en', 'description', '<p>test</p>'),
(17, 'en', 'name', 'test'),
(17, 'es', 'description', ''),
(17, 'es', 'name', ''),
(17, 'pl', 'description', ''),
(17, 'pl', 'name', '');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
         