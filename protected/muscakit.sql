-- phpMyAdmin SQL Dump
-- version 4.2.5
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Jun 13, 2015 at 01:03 AM
-- Server version: 5.5.38
-- PHP Version: 5.5.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `musca`
--

-- --------------------------------------------------------

--
-- Table structure for table `c21_musca_config`
--

CREATE TABLE `c21_musca_config` (
`id` int(11) NOT NULL,
  `section` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `value` text,
  `description` text,
  `user_show` tinyint(1) DEFAULT '0'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=26 ;

--
-- Dumping data for table `c21_musca_config`
--

INSERT INTO `c21_musca_config` (`id`, `section`, `name`, `value`, `description`, `user_show`) VALUES
(24, 'email3', 'email3', 'hello@jacobmarcus.com3', 'Email3', 1);

-- --------------------------------------------------------

--
-- Table structure for table `c21_musca_i18n`
--

CREATE TABLE `c21_musca_i18n` (
`id` int(11) NOT NULL,
  `section` varchar(50) NOT NULL DEFAULT '',
  `label` varchar(255) DEFAULT NULL,
  `tag` varchar(50) NOT NULL DEFAULT '',
  `lang` varchar(2) NOT NULL DEFAULT '',
  `value` text,
  `value_tpl` text,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `html` tinyint(1) DEFAULT '0',
  `file` tinyint(1) DEFAULT NULL,
  `image` tinyint(1) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `crop` tinyint(1) DEFAULT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=261 ;

-- --------------------------------------------------------

--
-- Table structure for table `c21_musca_i18n_admin`
--

CREATE TABLE `c21_musca_i18n_admin` (
`id` int(11) NOT NULL,
  `section` varchar(50) NOT NULL DEFAULT '',
  `label` varchar(255) DEFAULT NULL,
  `tag` varchar(50) NOT NULL DEFAULT '',
  `lang` varchar(2) NOT NULL DEFAULT '',
  `value` text,
  `value_tpl` text,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `html` tinyint(1) DEFAULT '0',
  `file` tinyint(1) DEFAULT NULL,
  `image` tinyint(1) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `crop` tinyint(1) DEFAULT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=292 ;

--
-- Dumping data for table `c21_musca_i18n_admin`
--

INSERT INTO `c21_musca_i18n_admin` (`id`, `section`, `label`, `tag`, `lang`, `value`, `value_tpl`, `date_modified`, `html`, `file`, `image`, `width`, `height`, `crop`) VALUES
(88, 'grid', NULL, 'ec211f7c20af43e742bf2570c3cb84f9', 'en', 'Add', 'Add', '2015-04-29 12:35:38', 0, 0, 0, 0, 0, 0),
(89, 'grid', NULL, 'f2a6c498fb90ee345d997f888fce3b18', 'en', 'Delete', 'Delete', '2015-04-29 12:35:38', 0, 0, 0, 0, 0, 0),
(90, 'grid', NULL, 'b718adec73e04ce3ec720dd11a06a308', 'en', 'ID', 'ID', '2015-04-29 12:35:38', 0, 0, 0, 0, 0, 0),
(91, 'grid', NULL, '49ee3087348e8d44e1feda1917443987', 'en', 'Name', 'Name', '2015-04-29 12:35:38', 0, 0, 0, 0, 0, 0),
(92, 'grid', NULL, '31645929703e0ca8727296992f4dc763', 'en', 'ZW', 'ZW', '2015-04-29 12:35:38', 0, 0, 0, 0, 0, 0),
(93, 'grid', NULL, '9b9d8a976b42e0bd66381797644943d5', 'en', 'Published', 'Published', '2015-04-29 12:35:38', 0, 0, 0, 0, 0, 0),
(94, 'title', 'Page title', 'cedd9a309ce861a395757b43354b044c', 'en', 'CMS', 'CMS', '2015-04-29 12:35:38', 0, 0, 0, 0, 0, 0),
(95, 'menu', NULL, '0323de4f66a1700e2173e9bcdce02715', 'en', 'Logout', 'Logout', '2015-04-29 12:35:38', 0, 0, 0, 0, 0, 0),
(96, 'MuscaTranslation', NULL, '8957b8a4d2d2d8f7e4c5f7a4c365255f', 'en', 'Texts', 'Texts', '2015-04-29 12:35:38', 0, 0, 0, 0, 0, 0),
(97, 'menu', NULL, '7258e7251413465e0a3eb58094430bde', 'en', 'Administration', 'Administration', '2015-04-29 12:35:38', 0, 0, 0, 0, 0, 0),
(98, 'MuscaUser', NULL, 'c1ec1d62eafad32ca16fe4df49b9ca2f', 'en', 'Administrators', 'Administrators', '2015-04-29 12:35:38', 0, 0, 0, 0, 0, 0),
(99, 'MuscaConfigUser', NULL, '254f642527b45bc260048e30704edb39', 'en', 'Configuration', 'Configuration', '2015-04-29 12:35:38', 0, 0, 0, 0, 0, 0),
(100, 'MuscaTranslationAdmin', NULL, 'ef1949d748ebdd9d0bf4c14623ea4633', 'en', 'Admin Panel Texts', 'Admin Panel Texts', '2015-04-29 12:35:38', 0, 0, 0, 0, 0, 0),
(101, 'city', NULL, '97bf85fd1379c856f19a0421f2640fd8', 'en', 'Municipalities', 'Municipalities', '2015-04-29 12:35:38', 0, 0, 0, 0, 0, 0),
(102, 'listing', NULL, '13348442cc6a27032d2b4aa28b75a5d3', 'en', 'Search', 'Search', '2015-04-29 12:35:38', 0, 0, 0, 0, 0, 0),
(103, 'fields', NULL, '49ee3087348e8d44e1feda1917443987', 'en', 'Name', 'Name', '2015-04-29 12:35:38', 0, 0, 0, 0, 0, 0),
(104, 'grid', NULL, '24fcfb3f7a14f07f7e83903cb479b640', 'en', 'Showing records from', 'Showing records from', '2015-04-29 12:35:38', 0, 0, 0, 0, 0, 0),
(105, 'grid', NULL, '01b6e20344b68835c5ed1ddedf20d531', 'en', 'to', 'to', '2015-04-29 12:35:38', 0, 0, 0, 0, 0, 0),
(106, 'grid', NULL, 'da280aee8ae9c9103e07ec1a51a25e7e', 'en', 'in total)', 'in total)', '2015-04-29 12:35:38', 0, 0, 0, 0, 0, 0),
(107, 'grid', NULL, '21d104a54fc71a19a325c7305327f1d2', 'en', 'Processing...', 'Processing...', '2015-04-29 12:35:38', 0, 0, 0, 0, 0, 0),
(108, 'grid', NULL, '64959029acf7b169f8d972637b75b49e', 'en', 'No records', 'No records', '2015-04-29 12:35:38', 0, 0, 0, 0, 0, 0),
(109, 'grid', NULL, '5aaa4dbaa85d5dc3a7156ac9a69294a4', 'en', 'Error connecting', 'Error connecting', '2015-04-29 12:35:38', 0, 0, 0, 0, 0, 0),
(110, 'grid', NULL, 'c59519b5ec462f2faa3fd4fa713773dc', 'en', 'Are you sure that you want to delete selected items?', 'Are you sure that you want to delete selected items?', '2015-04-29 12:35:38', 0, 0, 0, 0, 0, 0),
(111, 'grid', NULL, '7dce122004969d56ae2e0245cb754d35', 'en', 'Edit', 'Edit', '2015-04-29 12:35:38', 0, 0, 0, 0, 0, 0),
(112, 'grid', NULL, '7fb4000a4014d63b690d0e064f5ba66d', 'en', 'Select at least one item', 'Select at least one item', '2015-04-29 12:35:38', 0, 0, 0, 0, 0, 0),
(113, 'grid', NULL, '4c41e0bd957698b58100a5c687d757d9', 'en', 'Select all', 'Select all', '2015-04-29 12:35:38', 0, 0, 0, 0, 0, 0),
(114, 'grid', NULL, '52e3ce2bc983012661c3c11fe8b0f8ce', 'en', 'Deselect all', 'Deselect all', '2015-04-29 12:35:38', 0, 0, 0, 0, 0, 0),
(115, 'grid', NULL, 'a13367a8e2a3f3bf4f3409079e3fdf87', 'en', 'Activate', 'Activate', '2015-04-29 12:35:38', 0, 0, 0, 0, 0, 0),
(116, 'grid', NULL, 'e443f03bb7afc36f5b972fa2d9912922', 'en', 'Are you sure that you want to activate selected items?', 'Are you sure that you want to activate selected items?', '2015-04-29 12:35:38', 0, 0, 0, 0, 0, 0),
(117, 'grid', NULL, 'a9555fd9adb4026033e4ffbb1009df60', 'en', 'Desactivate', 'Desactivate', '2015-04-29 12:35:38', 0, 0, 0, 0, 0, 0),
(118, 'grid', NULL, '730a018d93688dfc2aa0dea4171b95db', 'en', 'Are you sure that you want to desactivate selected items?', 'Are you sure that you want to desactivate selected items?', '2015-04-29 12:35:38', 0, 0, 0, 0, 0, 0),
(119, 'grid', NULL, '729a51874fe901b092899e9e8b31c97a', 'en', 'Are you sure?', 'Are you sure?', '2015-04-29 12:35:38', 0, 0, 0, 0, 0, 0),
(120, 'buttons', NULL, 'de68a52a2d6abaaf54b1b769128955aa', 'en', 'Change order', 'Change order', '2015-04-29 12:35:38', 0, 0, 0, 0, 0, 0),
(121, 'meta_tags', NULL, 'c7da501f54544eba6787960200d9efdb', 'en', 'CMS', 'CMS', '2015-04-29 12:38:07', 0, 0, 0, 0, 0, 0),
(122, 'login', NULL, 'f6039d44b29456b20f8f373155ae4973', 'en', 'Username', 'Username', '2015-04-29 12:38:07', 0, 0, 0, 0, 0, 0),
(123, 'login', NULL, 'dc647eb65e6711e155375218212b3964', 'en', 'Password', 'Password', '2015-04-29 12:38:07', 0, 0, 0, 0, 0, 0),
(124, 'login', NULL, 'f1851d5600eae616ee802a31ac74701b', 'en', 'Enter', 'Enter', '2015-04-29 12:38:07', 0, 0, 0, 0, 0, 0),
(125, 'grid', NULL, '3be2bd4f247e7e23c47bdbb19dbe04d4', 'en', 'Marka', 'Marka', '2015-04-29 12:48:43', 0, 0, 0, 0, 0, 0),
(126, 'grid', NULL, 'b0c6f9a220f0e27728a4b4a3f8267527', 'en', 'Marka2', 'Marka2', '2015-04-29 12:48:43', 0, 0, 0, 0, 0, 0),
(127, 'grid', NULL, 'ac8a0fe33c973918bb514636f8ca977f', 'en', 'Pojemność', 'Pojemność', '2015-04-29 12:48:43', 0, 0, 0, 0, 0, 0),
(128, 'grid', NULL, '6755e6b3457f9e8447566dab2996aaf1', 'en', 'Cena', 'Cena', '2015-04-29 12:48:43', 0, 0, 0, 0, 0, 0),
(129, 'CarBattery', NULL, 'd0145e41e824a1d5660b7f11c1064147', 'en', 'Akumulatory samochodowe', 'Akumulatory samochodowe', '2015-04-29 12:48:43', 0, 0, 0, 0, 0, 0),
(130, 'fields', NULL, 'b718adec73e04ce3ec720dd11a06a308', 'en', 'ID', 'ID', '2015-04-29 12:49:40', 0, 0, 0, 0, 0, 0),
(131, 'buttons', NULL, 'c9cc8cce247e49bae79f15173ce97354', 'en', 'Save', 'Save', '2015-04-29 12:50:26', 0, 0, 0, 0, 0, 0),
(132, 'buttons', NULL, '03c2e7e41ffc181a4e84080b4710e81e', 'en', 'New', 'New', '2015-04-29 12:50:26', 0, 0, 0, 0, 0, 0),
(133, 'files', NULL, 'd576b3f31ecb47819f16e1b5e97f6f39', 'en', 'Upload files.', 'Upload files.', '2015-04-29 12:50:26', 0, 0, 0, 0, 0, 0),
(134, 'files', NULL, 'e8ad02a20e571d931f064c2f7156f61d', 'en', 'Maximum file size is', 'Maximum file size is', '2015-04-29 12:50:26', 0, 0, 0, 0, 0, 0),
(135, 'gallery', NULL, '9663162ddcabd68ff421fe31894dcd1d', 'en', 'Upload images.', 'Upload images.', '2015-04-29 12:50:26', 0, 0, 0, 0, 0, 0),
(136, 'gallery', NULL, 'd0eb0dfd325363d0dd26e975e70fdb39', 'en', 'Images will be resized to', 'Images will be resized to', '2015-04-29 12:50:26', 0, 0, 0, 0, 0, 0),
(137, 'gallery', NULL, 'e8ad02a20e571d931f064c2f7156f61d', 'en', 'Maximum file size is', 'Maximum file size is', '2015-04-29 12:50:26', 0, 0, 0, 0, 0, 0),
(138, 'message', NULL, '0511ee0d41117aa7b4abaaf102aa513d', 'en', 'This field is required', 'This field is required', '2015-04-29 12:50:26', 0, 0, 0, 0, 0, 0),
(139, 'grid', NULL, '64d0f81e7e55284b343154baf1b62c2d', 'en', 'Numer', 'Numer', '2015-04-29 12:52:19', 0, 0, 0, 0, 0, 0),
(140, 'fields', NULL, '64d0f81e7e55284b343154baf1b62c2d', 'en', 'Numer', 'Numer', '2015-04-29 12:52:26', 0, 0, 0, 0, 0, 0),
(141, 'message', NULL, '0cb7de2c9a7540815be0589213aa5147', 'en', 'Data has been saved successfully.', 'Data has been saved successfully.', '2015-04-29 13:11:51', 0, 0, 0, 0, 0, 0),
(142, 'fields', NULL, 'be53a0541a6d36f6ecb879fa2c584b08', 'en', 'Image', 'Image', '2015-04-29 13:17:53', 0, 0, 0, 0, 0, 0),
(143, 'CarBattery', NULL, '7269874adaa89515dbab05dc72a2767d', 'en', 'Image will be resized to', 'Image will be resized to', '2015-04-29 13:17:53', 0, 0, 0, 0, 0, 0),
(144, 'CarBattery', NULL, 'e8ad02a20e571d931f064c2f7156f61d', 'en', 'Maximum file size is', 'Maximum file size is', '2015-04-29 13:17:53', 0, 0, 0, 0, 0, 0),
(145, 'CarBattery', NULL, '83b5a65e518c21ed0a5f2b383dd9b617', 'en', 'Delete image', 'Delete image', '2015-04-29 13:20:18', 0, 0, 0, 0, 0, 0),
(146, 'buttons', NULL, '72d6d7a1885885bb55a565fd1070581a', 'en', 'Import', 'Import', '2015-04-29 16:08:10', 0, 0, 0, 0, 0, 0),
(147, 'Import', NULL, '72d6d7a1885885bb55a565fd1070581a', 'en', 'Import', 'Import', '2015-04-29 16:10:39', 0, 0, 0, 0, 0, 0),
(148, 'buttons', NULL, '10ac3d04253ef7e1ddc73e6091c0cd55', 'en', 'Next', 'Next', '2015-04-29 16:13:03', 0, 0, 0, 0, 0, 0),
(149, 'buttons', NULL, '6a829a18ee779235b5f9539b12d9db8d', 'en', 'Import excel file', 'Import excel file', '2015-04-29 16:38:24', 0, 0, 0, 0, 0, 0),
(150, 'buttons', NULL, 'd65c7eafd4081d4438accc8867883d40', 'en', 'Import Excel file', 'Import Excel file', '2015-04-29 16:39:04', 0, 0, 0, 0, 0, 0),
(151, 'buttons', NULL, '91412465ea9169dfd901dd5e7c96dd99', 'en', 'Upload', 'Upload', '2015-04-29 16:40:58', 0, 0, 0, 0, 0, 0),
(152, 'buttons', NULL, 'c8cfbbbe4253e14390b2b14d7e60d9c8', 'en', 'Import data', 'Import data', '2015-04-29 16:41:26', 0, 0, 0, 0, 0, 0),
(153, 'message', NULL, '3a1610339242c13b8cd4f20b73d11b32', 'en', 'File "test import.xls" has been uploaded successfully.', 'File "test import.xls" has been uploaded successfully.', '2015-04-29 16:53:18', 0, 0, 0, 0, 0, 0),
(154, 'message', NULL, 'a8cfe1fd2ac573dd4c58c2c4fad53942', 'en', 'File "test import.xls" was successfully uploaded', 'File "test import.xls" was successfully uploaded', '2015-04-29 16:54:16', 0, 0, 0, 0, 0, 0),
(155, 'grid', NULL, 'f6039d44b29456b20f8f373155ae4973', 'en', 'Username', 'Username', '2015-04-29 17:12:38', 0, 0, 0, 0, 0, 0),
(156, 'grid', NULL, 'cb456215c3333db0551bd0788bc258c7', 'en', 'Activated', 'Activated', '2015-04-29 17:12:38', 0, 0, 0, 0, 0, 0),
(157, 'grid', NULL, '263ab2eac2168d940fe76675ef8b3081', 'en', 'Lang', 'Lang', '2015-04-29 17:12:40', 0, 0, 0, 0, 0, 0),
(158, 'grid', NULL, 'd2c24d59e0baff4d0155fbdf62590867', 'en', 'Section', 'Section', '2015-04-29 17:12:40', 0, 0, 0, 0, 0, 0),
(159, 'grid', NULL, 'b021df6aac4654c454f46c77646e745f', 'en', 'Label', 'Label', '2015-04-29 17:12:40', 0, 0, 0, 0, 0, 0),
(160, 'grid', NULL, '532220dbf680ea98d665427b145e72ca', 'en', 'Translated', 'Translated', '2015-04-29 17:12:40', 0, 0, 0, 0, 0, 0),
(161, 'grid', NULL, '0a52da7a03a6de3beefe54f8c03ad80d', 'en', 'Original', 'Original', '2015-04-29 17:12:40', 0, 0, 0, 0, 0, 0),
(162, 'grid', NULL, '35e0c8c0b180c95d4e122e55ed62cc64', 'en', 'Modified', 'Modified', '2015-04-29 17:12:40', 0, 0, 0, 0, 0, 0),
(163, 'MuscaTranslation', NULL, 'd2c24d59e0baff4d0155fbdf62590867', 'en', 'Section', 'Section', '2015-04-29 17:12:40', 0, 0, 0, 0, 0, 0),
(164, 'buttons', NULL, '13348442cc6a27032d2b4aa28b75a5d3', 'en', 'Search', 'Search', '2015-04-29 17:12:40', 0, 0, 0, 0, 0, 0),
(165, 'MuscaTranslation', NULL, '0b8d92bc19b720bb1065649535463409', 'en', 'Translations', 'Translations', '2015-04-29 17:12:40', 0, 0, 0, 0, 0, 0),
(166, '', NULL, '9cfefed8fb9497baa5cd519d7d2bb5d7', 'en', 'en', 'en', '2015-04-29 17:12:40', 0, 0, 0, 0, 0, 0),
(167, 'Import', NULL, '10ca23e32f3b644481fbaa20663e18f7', 'en', 'Akumulatory samochodowe: Import', 'Akumulatory samochodowe: Import', '2015-04-30 09:57:47', 0, 0, 0, 0, 0, 0),
(168, 'Import', NULL, '3bd8006abc9c07b2f65c3842426edb5f', 'en', 'Akumulatory samochodowe : Import', 'Akumulatory samochodowe : Import', '2015-04-30 10:00:54', 0, 0, 0, 0, 0, 0),
(169, 'Import', NULL, '512f25dd4a144869c1e208f9c5c15266', 'en', 'Akumulatory samochodowe - Import', 'Akumulatory samochodowe - Import', '2015-04-30 10:01:01', 0, 0, 0, 0, 0, 0),
(170, 'Import', NULL, 'bfe0371b65c5b9c6dcf4342673b13bf9', 'en', 'Akumulatory samochodowe / Import', 'Akumulatory samochodowe / Import', '2015-04-30 10:01:07', 0, 0, 0, 0, 0, 0),
(171, 'Import', NULL, '8e11b2f82410a6938ec023af47159a54', 'en', 'Import: akumulatory samochodowe', 'Import: akumulatory samochodowe', '2015-04-30 10:01:29', 0, 0, 0, 0, 0, 0),
(172, 'ImportCarBattery', NULL, '8e11b2f82410a6938ec023af47159a54', 'en', 'Import: akumulatory samochodowe', 'Import: akumulatory samochodowe', '2015-04-30 10:04:25', 0, 0, 0, 0, 0, 0),
(173, 'grid', NULL, '21e9789edc27955276dade14ef6e8507', 'en', 'Rodzaj poj.', 'Rodzaj poj.', '2015-04-30 10:38:48', 0, 0, 0, 0, 0, 0),
(174, 'grid', NULL, 'a559b87068921eec05086ce5485e9784', 'en', 'Model', 'Model', '2015-04-30 10:38:48', 0, 0, 0, 0, 0, 0),
(175, 'grid', NULL, '3cf27324117f8dd9ac97d71d36b1b06d', 'en', 'Rok', 'Rok', '2015-04-30 10:38:48', 0, 0, 0, 0, 0, 0),
(176, 'grid', NULL, '2a12d4c96a482593f2ebe7b75f50b7c7', 'en', 'Akumulator', 'Akumulator', '2015-04-30 10:38:48', 0, 0, 0, 0, 0, 0),
(177, 'Moto', NULL, '09b0a768728b3a865ce87d7b40c78f83', 'en', 'Motocykle', 'Motocykle', '2015-04-30 10:38:48', 0, 0, 0, 0, 0, 0),
(178, 'Moto', NULL, '7269874adaa89515dbab05dc72a2767d', 'en', 'Image will be resized to', 'Image will be resized to', '2015-04-30 10:40:04', 0, 0, 0, 0, 0, 0),
(179, 'Moto', NULL, 'e8ad02a20e571d931f064c2f7156f61d', 'en', 'Maximum file size is', 'Maximum file size is', '2015-04-30 10:40:04', 0, 0, 0, 0, 0, 0),
(180, 'message', NULL, '0befc1c96971a78a99b8516d18623a00', 'en', 'Data has been saved successfully', 'Data has been saved successfully', '2015-04-30 11:10:31', 0, 0, 0, 0, 0, 0),
(181, 'grid', NULL, 'b42f1990c0cee8758b64584877d69b93', 'en', 'ccm', 'ccm', '2015-04-30 11:20:05', 0, 0, 0, 0, 0, 0),
(182, 'grid', NULL, '7ef3855e1a2be1b4d7ebff419129f465', 'en', 'Rok prod.', 'Rok prod.', '2015-04-30 11:20:05', 0, 0, 0, 0, 0, 0),
(183, 'ImportMoto', NULL, '3a48578212be4028925a3c266470adc5', 'en', 'Import: motocykle', 'Import: motocykle', '2015-04-30 11:20:21', 0, 0, 0, 0, 0, 0),
(184, 'ImportMoto', NULL, '33b87533d04aaff8c0914129f8fc60e8', 'en', 'Motocykle: import', 'Motocykle: import', '2015-04-30 11:33:48', 0, 0, 0, 0, 0, 0),
(185, 'CarBatteryImport', NULL, '1fff9ed07af1ccb2fb4ca0fbcb7b8528', 'en', 'Akumulatory samochodowe: import', 'Akumulatory samochodowe: import', '2015-04-30 12:14:08', 0, 0, 0, 0, 0, 0),
(186, 'MotoImport', NULL, '33b87533d04aaff8c0914129f8fc60e8', 'en', 'Motocykle: import', 'Motocykle: import', '2015-04-30 12:15:06', 0, 0, 0, 0, 0, 0),
(187, 'MotoBattery', NULL, '60f8bfdf82710a34277fda13a3a0ac27', 'en', 'Akumulatory motocykolwe', 'Akumulatory motocykolwe', '2015-04-30 12:19:03', 0, 0, 0, 0, 0, 0),
(188, 'MotoBattery', NULL, '7269874adaa89515dbab05dc72a2767d', 'en', 'Image will be resized to', 'Image will be resized to', '2015-04-30 12:19:31', 0, 0, 0, 0, 0, 0),
(189, 'MotoBattery', NULL, 'e8ad02a20e571d931f064c2f7156f61d', 'en', 'Maximum file size is', 'Maximum file size is', '2015-04-30 12:19:31', 0, 0, 0, 0, 0, 0),
(190, 'MotoBattery', NULL, '83b5a65e518c21ed0a5f2b383dd9b617', 'en', 'Delete image', 'Delete image', '2015-04-30 12:21:22', 0, 0, 0, 0, 0, 0),
(191, 'MotoBatteryImport', NULL, '00bdcd27aad964fb072174ef19eca02e', 'en', 'Akumulatory motocyklowe: import', 'Akumulatory motocyklowe: import', '2015-04-30 12:28:02', 0, 0, 0, 0, 0, 0),
(192, 'grid', NULL, 'c2ea84331318265913c436726c9c4ff3', 'en', 'Typ', 'Typ', '2015-04-30 13:46:11', 0, 0, 0, 0, 0, 0),
(193, 'SpecialBattery', NULL, 'bef1e822ec5c8c7f51aa8016d504b850', 'en', 'Akumulatory specjane', 'Akumulatory specjane', '2015-04-30 13:46:11', 0, 0, 0, 0, 0, 0),
(194, 'SpecialBattery', NULL, '7269874adaa89515dbab05dc72a2767d', 'en', 'Image will be resized to', 'Image will be resized to', '2015-04-30 13:46:15', 0, 0, 0, 0, 0, 0),
(195, 'SpecialBattery', NULL, 'e8ad02a20e571d931f064c2f7156f61d', 'en', 'Maximum file size is', 'Maximum file size is', '2015-04-30 13:46:15', 0, 0, 0, 0, 0, 0),
(196, 'SpecialBattery', NULL, '83b5a65e518c21ed0a5f2b383dd9b617', 'en', 'Delete image', 'Delete image', '2015-04-30 13:46:32', 0, 0, 0, 0, 0, 0),
(197, 'SpecialBatteryImport', NULL, '00bdcd27aad964fb072174ef19eca02e', 'en', 'Akumulatory motocyklowe: import', 'Akumulatory motocyklowe: import', '2015-04-30 13:47:22', 0, 0, 0, 0, 0, 0),
(198, 'SpecialBatteryImport', NULL, 'e5ea4a4703fa3505ce80e5eb153f25fc', 'en', 'Akumulatory specjalne: import', 'Akumulatory specjalne: import', '2015-04-30 13:51:16', 0, 0, 0, 0, 0, 0),
(199, 'ElectricVehicle', NULL, 'fca4969617841a0080d8d46e466ee1d8', 'en', 'Pojazdy elektryczne', 'Pojazdy elektryczne', '2015-04-30 14:11:30', 0, 0, 0, 0, 0, 0),
(200, 'fields', NULL, 'a559b87068921eec05086ce5485e9784', 'en', 'Model', 'Model', '2015-04-30 14:11:30', 0, 0, 0, 0, 0, 0),
(201, 'ElectricVehicle', NULL, '7269874adaa89515dbab05dc72a2767d', 'en', 'Image will be resized to', 'Image will be resized to', '2015-04-30 14:12:30', 0, 0, 0, 0, 0, 0),
(202, 'ElectricVehicle', NULL, 'e8ad02a20e571d931f064c2f7156f61d', 'en', 'Maximum file size is', 'Maximum file size is', '2015-04-30 14:12:30', 0, 0, 0, 0, 0, 0),
(203, 'ElectricVehicle', NULL, '83b5a65e518c21ed0a5f2b383dd9b617', 'en', 'Delete image', 'Delete image', '2015-04-30 14:12:48', 0, 0, 0, 0, 0, 0),
(204, 'login', NULL, '0323de4f66a1700e2173e9bcdce02715', 'en', 'Logout', 'Logout', '2015-05-13 11:56:42', 0, 0, 0, 0, 0, 0),
(205, 'buttons', NULL, '0450d266974d92724ff4bacc3a51952e', 'en', 'Delete all', 'Delete all', '2015-05-13 11:56:42', 0, 0, 0, 0, 0, 0),
(206, 'buttons', NULL, '6932c591daccd90eb5ca73f217908a89', 'en', 'Generate thumbnails', 'Generate thumbnails', '2015-05-13 11:56:42', 0, 0, 0, 0, 0, 0),
(207, 'MuscaTranslation', NULL, 'a6bfac9070b89c1a9e61090402ca458d', 'en', 'Search for text', 'Search for text', '2015-05-13 11:57:23', 0, 0, 0, 0, 0, 0),
(208, 'MuscaTranslation', NULL, 'b1c94ca2fbc3e78fc30069c8d0f01680', 'en', 'All', 'All', '2015-05-13 11:57:23', 0, 0, 0, 0, 0, 0),
(209, 'MuscaTranslation', NULL, '4994a8ffeba4ac3140beb89e8d41f174', 'en', 'Language', 'Language', '2015-05-13 11:57:23', 0, 0, 0, 0, 0, 0),
(210, 'MuscaTranslation', NULL, 'd91c1c514f19642ce9d165800eccf198', 'en', 'Translated text', 'Translated text', '2015-05-13 11:57:23', 0, 0, 0, 0, 0, 0),
(211, 'MuscaTranslation', NULL, '900f866636ca9a4a158bafe7677aaba6', 'en', 'Original text', 'Original text', '2015-05-13 11:57:23', 0, 0, 0, 0, 0, 0),
(212, 'meta_tags', NULL, 'c7da501f54544eba6787960200d9efdb', 'pl', 'CMS', 'CMS', '2015-05-14 16:16:01', 0, 0, 0, 0, 0, 0),
(213, 'login', NULL, 'f6039d44b29456b20f8f373155ae4973', 'pl', 'Username', 'Username', '2015-05-14 16:16:01', 0, 0, 0, 0, 0, 0),
(214, 'login', NULL, 'dc647eb65e6711e155375218212b3964', 'pl', 'Password', 'Password', '2015-05-14 16:16:01', 0, 0, 0, 0, 0, 0),
(215, 'login', NULL, 'f1851d5600eae616ee802a31ac74701b', 'pl', 'Enter', 'Enter', '2015-05-14 16:16:01', 0, 0, 0, 0, 0, 0),
(216, 'grid', NULL, 'ec211f7c20af43e742bf2570c3cb84f9', 'pl', 'Add', 'Add', '2015-05-14 16:16:05', 0, 0, 0, 0, 0, 0),
(217, 'grid', NULL, 'f2a6c498fb90ee345d997f888fce3b18', 'pl', 'Delete', 'Delete', '2015-05-14 16:16:05', 0, 0, 0, 0, 0, 0),
(218, 'grid', NULL, '64d0f81e7e55284b343154baf1b62c2d', 'pl', 'Numer', 'Numer', '2015-05-14 16:16:05', 0, 0, 0, 0, 0, 0),
(219, 'grid', NULL, '3be2bd4f247e7e23c47bdbb19dbe04d4', 'pl', 'Marka', 'Marka', '2015-05-14 16:16:05', 0, 0, 0, 0, 0, 0),
(220, 'grid', NULL, 'b0c6f9a220f0e27728a4b4a3f8267527', 'pl', 'Marka2', 'Marka2', '2015-05-14 16:16:05', 0, 0, 0, 0, 0, 0),
(221, 'grid', NULL, 'ac8a0fe33c973918bb514636f8ca977f', 'pl', 'Pojemność', 'Pojemność', '2015-05-14 16:16:05', 0, 0, 0, 0, 0, 0),
(222, 'grid', NULL, '6755e6b3457f9e8447566dab2996aaf1', 'pl', 'Cena', 'Cena', '2015-05-14 16:16:05', 0, 0, 0, 0, 0, 0),
(223, 'title', 'Page title', 'cedd9a309ce861a395757b43354b044c', 'pl', 'CMS', 'CMS', '2015-05-14 16:16:06', 0, 0, 0, 0, 0, 0),
(224, 'login', NULL, '0323de4f66a1700e2173e9bcdce02715', 'pl', 'Logout', 'Logout', '2015-05-14 16:16:06', 0, 0, 0, 0, 0, 0),
(225, 'MuscaTranslation', NULL, '8957b8a4d2d2d8f7e4c5f7a4c365255f', 'pl', 'Texts', 'Texts', '2015-05-14 16:16:06', 0, 0, 0, 0, 0, 0),
(226, 'CarBattery', NULL, 'd0145e41e824a1d5660b7f11c1064147', 'pl', 'Akumulatory samochodowe', 'Akumulatory samochodowe', '2015-05-14 16:16:06', 0, 0, 0, 0, 0, 0),
(227, 'listing', NULL, '13348442cc6a27032d2b4aa28b75a5d3', 'pl', 'Search', 'Search', '2015-05-14 16:16:06', 0, 0, 0, 0, 0, 0),
(228, 'fields', NULL, '64d0f81e7e55284b343154baf1b62c2d', 'pl', 'Numer', 'Numer', '2015-05-14 16:16:06', 0, 0, 0, 0, 0, 0),
(229, 'grid', NULL, '24fcfb3f7a14f07f7e83903cb479b640', 'pl', 'Showing records from', 'Showing records from', '2015-05-14 16:16:06', 0, 0, 0, 0, 0, 0),
(230, 'grid', NULL, '01b6e20344b68835c5ed1ddedf20d531', 'pl', 'to', 'to', '2015-05-14 16:16:06', 0, 0, 0, 0, 0, 0),
(231, 'grid', NULL, 'da280aee8ae9c9103e07ec1a51a25e7e', 'pl', 'in total)', 'in total)', '2015-05-14 16:16:06', 0, 0, 0, 0, 0, 0),
(232, 'grid', NULL, '21d104a54fc71a19a325c7305327f1d2', 'pl', 'Processing...', 'Processing...', '2015-05-14 16:16:06', 0, 0, 0, 0, 0, 0),
(233, 'grid', NULL, '64959029acf7b169f8d972637b75b49e', 'pl', 'No records', 'No records', '2015-05-14 16:16:06', 0, 0, 0, 0, 0, 0),
(234, 'grid', NULL, '5aaa4dbaa85d5dc3a7156ac9a69294a4', 'pl', 'Error connecting', 'Error connecting', '2015-05-14 16:16:06', 0, 0, 0, 0, 0, 0),
(235, 'grid', NULL, 'c59519b5ec462f2faa3fd4fa713773dc', 'pl', 'Are you sure that you want to delete selected items?', 'Are you sure that you want to delete selected items?', '2015-05-14 16:16:06', 0, 0, 0, 0, 0, 0),
(236, 'grid', NULL, '7dce122004969d56ae2e0245cb754d35', 'pl', 'Edit', 'Edit', '2015-05-14 16:16:06', 0, 0, 0, 0, 0, 0),
(237, 'grid', NULL, '7fb4000a4014d63b690d0e064f5ba66d', 'pl', 'Select at least one item', 'Select at least one item', '2015-05-14 16:16:06', 0, 0, 0, 0, 0, 0),
(238, 'grid', NULL, '4c41e0bd957698b58100a5c687d757d9', 'pl', 'Select all', 'Select all', '2015-05-14 16:16:06', 0, 0, 0, 0, 0, 0),
(239, 'grid', NULL, '52e3ce2bc983012661c3c11fe8b0f8ce', 'pl', 'Deselect all', 'Deselect all', '2015-05-14 16:16:06', 0, 0, 0, 0, 0, 0),
(240, 'grid', NULL, 'a13367a8e2a3f3bf4f3409079e3fdf87', 'pl', 'Activate', 'Activate', '2015-05-14 16:16:06', 0, 0, 0, 0, 0, 0),
(241, 'grid', NULL, 'e443f03bb7afc36f5b972fa2d9912922', 'pl', 'Are you sure that you want to activate selected items?', 'Are you sure that you want to activate selected items?', '2015-05-14 16:16:06', 0, 0, 0, 0, 0, 0),
(242, 'grid', NULL, 'a9555fd9adb4026033e4ffbb1009df60', 'pl', 'Desactivate', 'Desactivate', '2015-05-14 16:16:06', 0, 0, 0, 0, 0, 0),
(243, 'grid', NULL, '730a018d93688dfc2aa0dea4171b95db', 'pl', 'Are you sure that you want to desactivate selected items?', 'Are you sure that you want to desactivate selected items?', '2015-05-14 16:16:06', 0, 0, 0, 0, 0, 0),
(244, 'grid', NULL, '729a51874fe901b092899e9e8b31c97a', 'pl', 'Are you sure?', 'Are you sure?', '2015-05-14 16:16:06', 0, 0, 0, 0, 0, 0),
(245, 'buttons', NULL, 'de68a52a2d6abaaf54b1b769128955aa', 'pl', 'Change order', 'Change order', '2015-05-14 16:16:06', 0, 0, 0, 0, 0, 0),
(246, 'buttons', NULL, 'd65c7eafd4081d4438accc8867883d40', 'pl', 'Import Excel file', 'Import Excel file', '2015-05-14 16:16:06', 0, 0, 0, 0, 0, 0),
(247, 'buttons', NULL, '0450d266974d92724ff4bacc3a51952e', 'pl', 'Delete all', 'Delete all', '2015-05-14 16:16:06', 0, 0, 0, 0, 0, 0),
(248, 'buttons', NULL, '6932c591daccd90eb5ca73f217908a89', 'pl', 'Generate thumbnails', 'Generate thumbnails', '2015-05-14 16:16:06', 0, 0, 0, 0, 0, 0),
(249, 'grid', NULL, 'b718adec73e04ce3ec720dd11a06a308', 'pl', 'ID', 'ID', '2015-05-14 16:16:10', 0, 0, 0, 0, 0, 0),
(250, 'grid', NULL, '263ab2eac2168d940fe76675ef8b3081', 'pl', 'Lang', 'Lang', '2015-05-14 16:16:10', 0, 0, 0, 0, 0, 0),
(251, 'grid', NULL, 'd2c24d59e0baff4d0155fbdf62590867', 'pl', 'Section', 'Section', '2015-05-14 16:16:10', 0, 0, 0, 0, 0, 0),
(252, 'grid', NULL, 'b021df6aac4654c454f46c77646e745f', 'pl', 'Label', 'Label', '2015-05-14 16:16:10', 0, 0, 0, 0, 0, 0),
(253, 'grid', NULL, '532220dbf680ea98d665427b145e72ca', 'pl', 'Translated', 'Translated', '2015-05-14 16:16:10', 0, 0, 0, 0, 0, 0),
(254, 'grid', NULL, '0a52da7a03a6de3beefe54f8c03ad80d', 'pl', 'Original', 'Original', '2015-05-14 16:16:10', 0, 0, 0, 0, 0, 0),
(255, 'grid', NULL, '35e0c8c0b180c95d4e122e55ed62cc64', 'pl', 'Modified', 'Modified', '2015-05-14 16:16:10', 0, 0, 0, 0, 0, 0),
(256, 'MuscaTranslation', NULL, 'd2c24d59e0baff4d0155fbdf62590867', 'pl', 'Section', 'Section', '2015-05-14 16:16:10', 0, 0, 0, 0, 0, 0),
(257, 'buttons', NULL, '13348442cc6a27032d2b4aa28b75a5d3', 'pl', 'Search', 'Search', '2015-05-14 16:16:10', 0, 0, 0, 0, 0, 0),
(258, 'buttons', NULL, 'c9cc8cce247e49bae79f15173ce97354', 'pl', 'Save', 'Save', '2015-05-14 16:16:10', 0, 0, 0, 0, 0, 0),
(259, 'MuscaTranslation', NULL, '0b8d92bc19b720bb1065649535463409', 'pl', 'Translations', 'Translations', '2015-05-14 16:16:10', 0, 0, 0, 0, 0, 0),
(260, '', NULL, '288404204e3d452229308317344a285d', 'pl', 'pl', 'pl', '2015-05-14 16:16:10', 0, 0, 0, 0, 0, 0),
(261, 'grid', NULL, 'c2ea84331318265913c436726c9c4ff3', 'pl', 'Typ', 'Typ', '2015-05-14 16:18:34', 0, 0, 0, 0, 0, 0),
(262, 'SpecialBattery', NULL, 'bef1e822ec5c8c7f51aa8016d504b850', 'pl', 'Akumulatory specjane', 'Akumulatory specjane', '2015-05-14 16:18:34', 0, 0, 0, 0, 0, 0),
(263, 'buttons', NULL, '03c2e7e41ffc181a4e84080b4710e81e', 'pl', 'New', 'New', '2015-05-14 16:30:52', 0, 0, 0, 0, 0, 0),
(264, 'fields', NULL, 'be53a0541a6d36f6ecb879fa2c584b08', 'pl', 'Image', 'Image', '2015-05-14 16:30:52', 0, 0, 0, 0, 0, 0),
(265, 'SpecialBattery', NULL, '7269874adaa89515dbab05dc72a2767d', 'pl', 'Image will be resized to', 'Image will be resized to', '2015-05-14 16:30:52', 0, 0, 0, 0, 0, 0),
(266, 'SpecialBattery', NULL, 'e8ad02a20e571d931f064c2f7156f61d', 'pl', 'Maximum file size is', 'Maximum file size is', '2015-05-14 16:30:52', 0, 0, 0, 0, 0, 0),
(267, 'message', NULL, '0511ee0d41117aa7b4abaaf102aa513d', 'pl', 'This field is required', 'This field is required', '2015-05-14 16:30:52', 0, 0, 0, 0, 0, 0),
(268, 'SpecialBattery', NULL, '83b5a65e518c21ed0a5f2b383dd9b617', 'pl', 'Delete image', 'Delete image', '2015-05-14 16:31:09', 0, 0, 0, 0, 0, 0),
(269, 'message', NULL, '0cb7de2c9a7540815be0589213aa5147', 'pl', 'Data has been saved successfully.', 'Data has been saved successfully.', '2015-05-14 16:31:09', 0, 0, 0, 0, 0, 0),
(270, 'CarBattery', NULL, '7269874adaa89515dbab05dc72a2767d', 'pl', 'Image will be resized to', 'Image will be resized to', '2015-05-15 10:54:21', 0, 0, 0, 0, 0, 0),
(271, 'CarBattery', NULL, 'e8ad02a20e571d931f064c2f7156f61d', 'pl', 'Maximum file size is', 'Maximum file size is', '2015-05-15 10:54:21', 0, 0, 0, 0, 0, 0),
(272, 'CarBattery', NULL, '83b5a65e518c21ed0a5f2b383dd9b617', 'pl', 'Delete image', 'Delete image', '2015-05-15 11:02:12', 0, 0, 0, 0, 0, 0),
(273, 'grid', NULL, 'a559b87068921eec05086ce5485e9784', 'pl', 'Model', 'Model', '2015-05-16 16:24:24', 0, 0, 0, 0, 0, 0),
(274, 'ElectricVehicle', NULL, 'fca4969617841a0080d8d46e466ee1d8', 'pl', 'Pojazdy elektryczne', 'Pojazdy elektryczne', '2015-05-16 16:24:24', 0, 0, 0, 0, 0, 0),
(275, 'fields', NULL, 'a559b87068921eec05086ce5485e9784', 'pl', 'Model', 'Model', '2015-05-16 16:24:24', 0, 0, 0, 0, 0, 0),
(276, 'ElectricVehicle', NULL, '83b5a65e518c21ed0a5f2b383dd9b617', 'pl', 'Delete image', 'Delete image', '2015-05-16 16:24:26', 0, 0, 0, 0, 0, 0),
(277, 'ElectricVehicle', NULL, '7269874adaa89515dbab05dc72a2767d', 'pl', 'Image will be resized to', 'Image will be resized to', '2015-05-16 16:24:26', 0, 0, 0, 0, 0, 0),
(278, 'ElectricVehicle', NULL, 'e8ad02a20e571d931f064c2f7156f61d', 'pl', 'Maximum file size is', 'Maximum file size is', '2015-05-16 16:24:26', 0, 0, 0, 0, 0, 0),
(279, 'MotoBattery', NULL, '60f8bfdf82710a34277fda13a3a0ac27', 'pl', 'Akumulatory motocykolwe', 'Akumulatory motocykolwe', '2015-05-16 21:05:11', 0, 0, 0, 0, 0, 0),
(280, 'grid', NULL, '21e9789edc27955276dade14ef6e8507', 'pl', 'Rodzaj poj.', 'Rodzaj poj.', '2015-05-16 21:05:28', 0, 0, 0, 0, 0, 0),
(281, 'grid', NULL, 'b42f1990c0cee8758b64584877d69b93', 'pl', 'ccm', 'ccm', '2015-05-16 21:05:28', 0, 0, 0, 0, 0, 0),
(282, 'grid', NULL, '7ef3855e1a2be1b4d7ebff419129f465', 'pl', 'Rok prod.', 'Rok prod.', '2015-05-16 21:05:28', 0, 0, 0, 0, 0, 0),
(283, 'grid', NULL, '2a12d4c96a482593f2ebe7b75f50b7c7', 'pl', 'Akumulator', 'Akumulator', '2015-05-16 21:05:28', 0, 0, 0, 0, 0, 0),
(284, 'Moto', NULL, '09b0a768728b3a865ce87d7b40c78f83', 'pl', 'Motocykle', 'Motocykle', '2015-05-16 21:05:28', 0, 0, 0, 0, 0, 0),
(285, 'MotoBattery', NULL, '7269874adaa89515dbab05dc72a2767d', 'pl', 'Image will be resized to', 'Image will be resized to', '2015-05-16 21:07:48', 0, 0, 0, 0, 0, 0),
(286, 'MotoBattery', NULL, 'e8ad02a20e571d931f064c2f7156f61d', 'pl', 'Maximum file size is', 'Maximum file size is', '2015-05-16 21:07:48', 0, 0, 0, 0, 0, 0),
(287, 'MotoImport', NULL, '33b87533d04aaff8c0914129f8fc60e8', 'pl', 'Motocykle: import', 'Motocykle: import', '2015-05-16 21:59:19', 0, 0, 0, 0, 0, 0),
(288, 'buttons', NULL, '10ac3d04253ef7e1ddc73e6091c0cd55', 'pl', 'Next', 'Next', '2015-05-16 21:59:19', 0, 0, 0, 0, 0, 0),
(289, 'MotoBattery', NULL, '83b5a65e518c21ed0a5f2b383dd9b617', 'pl', 'Delete image', 'Delete image', '2015-05-17 15:12:55', 0, 0, 0, 0, 0, 0),
(290, 'message', NULL, '0befc1c96971a78a99b8516d18623a00', 'pl', 'Data has been saved successfully', 'Data has been saved successfully', '2015-05-17 15:13:07', 0, 0, 0, 0, 0, 0),
(291, 'CarBatteryImport', NULL, '1fff9ed07af1ccb2fb4ca0fbcb7b8528', 'pl', 'Akumulatory samochodowe: import', 'Akumulatory samochodowe: import', '2015-05-25 11:44:34', 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `c21_musca_user`
--

CREATE TABLE `c21_musca_user` (
`id` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `c21_musca_user`
--

INSERT INTO `c21_musca_user` (`id`, `username`, `password`, `enabled`) VALUES
(2, 'demo', 'fe01ce2a7fbac8fafaed7c982a04e229', 1);

-- --------------------------------------------------------

--
-- Table structure for table `c21_sandbox`
--

CREATE TABLE `c21_sandbox` (
`id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pos` int(11) NOT NULL,
  `published` tinyint(1) NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pdf` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `c21_sandbox_files`
--

CREATE TABLE `c21_sandbox_files` (
`id` int(11) NOT NULL,
  `sandbox_id` int(11) NOT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `c21_musca_config`
--
ALTER TABLE `c21_musca_config`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `c21_musca_i18n`
--
ALTER TABLE `c21_musca_i18n`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `section` (`section`,`tag`,`lang`);

--
-- Indexes for table `c21_musca_i18n_admin`
--
ALTER TABLE `c21_musca_i18n_admin`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `section` (`section`,`tag`,`lang`);

--
-- Indexes for table `c21_musca_user`
--
ALTER TABLE `c21_musca_user`
 ADD PRIMARY KEY (`id`), ADD KEY `u` (`username`), ADD KEY `p` (`password`), ADD KEY `e` (`enabled`);

--
-- Indexes for table `c21_sandbox`
--
ALTER TABLE `c21_sandbox`
 ADD PRIMARY KEY (`id`), ADD KEY `name` (`name`,`pos`,`published`), ADD KEY `date` (`date`);

--
-- Indexes for table `c21_sandbox_files`
--
ALTER TABLE `c21_sandbox_files`
 ADD PRIMARY KEY (`id`), ADD KEY `sandbox_id` (`sandbox_id`,`pos`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `c21_musca_config`
--
ALTER TABLE `c21_musca_config`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `c21_musca_i18n`
--
ALTER TABLE `c21_musca_i18n`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=261;
--
-- AUTO_INCREMENT for table `c21_musca_i18n_admin`
--
ALTER TABLE `c21_musca_i18n_admin`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `c21_musca_user`
--
ALTER TABLE `c21_musca_user`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `c21_sandbox`
--
ALTER TABLE `c21_sandbox`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `c21_sandbox_files`
--
ALTER TABLE `c21_sandbox_files`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;