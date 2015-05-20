-- MySQL dump 10.13  Distrib 5.5.41, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: mmov
-- ------------------------------------------------------
-- Server version	5.5.41-0ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `mmov_assets`
--

DROP TABLE IF EXISTS `mmov_assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmov_assets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set parent.',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `level` int(10) unsigned NOT NULL COMMENT 'The cached level in the nested tree.',
  `name` varchar(50) NOT NULL COMMENT 'The unique name for the asset.\n',
  `title` varchar(100) NOT NULL COMMENT 'The descriptive title for the asset.',
  `rules` varchar(5120) NOT NULL COMMENT 'JSON encoded access control.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_asset_name` (`name`),
  KEY `idx_lft_rgt` (`lft`,`rgt`),
  KEY `idx_parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mmov_assets`
--

LOCK TABLES `mmov_assets` WRITE;
/*!40000 ALTER TABLE `mmov_assets` DISABLE KEYS */;
INSERT INTO `mmov_assets` VALUES (1,0,0,143,0,'root.1','Root Asset','{\"core.login.site\":{\"6\":1,\"2\":1},\"core.login.admin\":{\"6\":1},\"core.login.offline\":{\"6\":1},\"core.admin\":{\"8\":1},\"core.manage\":{\"7\":1},\"core.create\":{\"6\":1,\"3\":1},\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1},\"core.edit.own\":{\"6\":1,\"3\":1}}'),(2,1,1,2,1,'com_admin','com_admin','{}'),(3,1,3,6,1,'com_banners','com_banners','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(4,1,7,8,1,'com_cache','com_cache','{\"core.admin\":{\"7\":1},\"core.manage\":{\"7\":1}}'),(5,1,9,10,1,'com_checkin','com_checkin','{\"core.admin\":{\"7\":1},\"core.manage\":{\"7\":1}}'),(6,1,11,12,1,'com_config','com_config','{}'),(7,1,13,16,1,'com_contact','com_contact','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.own\":[]}'),(8,1,17,46,1,'com_content','com_content','{\"core.admin\":{\"7\":1},\"core.options\":[],\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(9,1,47,48,1,'com_cpanel','com_cpanel','{}'),(10,1,49,50,1,'com_installer','com_installer','{\"core.admin\":[],\"core.manage\":{\"7\":0},\"core.delete\":{\"7\":0},\"core.edit.state\":{\"7\":0}}'),(11,1,51,52,1,'com_languages','com_languages','{\"core.admin\":{\"7\":1},\"core.manage\":[],\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(12,1,53,54,1,'com_login','com_login','{}'),(13,1,55,56,1,'com_mailto','com_mailto','{}'),(14,1,57,58,1,'com_massmail','com_massmail','{}'),(15,1,59,60,1,'com_media','com_media','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":{\"5\":1}}'),(16,1,61,62,1,'com_menus','com_menus','{\"core.admin\":{\"7\":1},\"core.manage\":[],\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(17,1,63,64,1,'com_messages','com_messages','{\"core.admin\":{\"7\":1},\"core.manage\":{\"7\":1}}'),(18,1,65,104,1,'com_modules','com_modules','{\"core.admin\":{\"7\":1},\"core.manage\":[],\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(19,1,105,108,1,'com_newsfeeds','com_newsfeeds','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.own\":[]}'),(20,1,109,110,1,'com_plugins','com_plugins','{\"core.admin\":{\"7\":1},\"core.manage\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(21,1,111,112,1,'com_redirect','com_redirect','{\"core.admin\":{\"7\":1},\"core.manage\":[]}'),(22,1,113,114,1,'com_search','com_search','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1}}'),(23,1,115,116,1,'com_templates','com_templates','{\"core.admin\":{\"7\":1},\"core.manage\":[],\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(24,1,117,120,1,'com_users','com_users','{\"core.admin\":{\"7\":1},\"core.manage\":[],\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(25,1,121,124,1,'com_weblinks','com_weblinks','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(26,1,125,126,1,'com_wrapper','com_wrapper','{}'),(27,8,18,45,2,'com_content.category.2','Uncategorised','{\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.own\":[]}'),(28,3,4,5,2,'com_banners.category.3','Uncategorised','{\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(29,7,14,15,2,'com_contact.category.4','Uncategorised','{\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.own\":[]}'),(30,19,106,107,2,'com_newsfeeds.category.5','Uncategorised','{\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.own\":[]}'),(31,25,122,123,2,'com_weblinks.category.6','Uncategorised','{\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.own\":[]}'),(32,24,118,119,1,'com_users.category.7','Uncategorised','{\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(33,1,127,128,1,'com_finder','com_finder','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1}}'),(34,1,129,130,1,'com_joomlaupdate','com_joomlaupdate','{\"core.admin\":[],\"core.manage\":[],\"core.delete\":[],\"core.edit.state\":[]}'),(35,1,131,132,1,'com_tags','com_tags','{\"core.admin\":[],\"core.manage\":[],\"core.manage\":[],\"core.delete\":[],\"core.edit.state\":[]}'),(36,1,133,134,1,'com_contenthistory','com_contenthistory','{}'),(37,1,135,136,1,'com_ajax','com_ajax','{}'),(38,1,137,138,1,'com_postinstall','com_postinstall','{}'),(39,18,66,67,2,'com_modules.module.1','Main Menu','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(40,18,68,69,2,'com_modules.module.2','Login','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(41,18,70,71,2,'com_modules.module.3','Popular Articles','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(42,18,72,73,2,'com_modules.module.4','Recently Added Articles','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(43,18,74,75,2,'com_modules.module.8','Toolbar','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(44,18,76,77,2,'com_modules.module.9','Quick Icons','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(45,18,78,79,2,'com_modules.module.10','Logged-in Users','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(46,18,80,81,2,'com_modules.module.12','Admin Menu','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(47,18,82,83,2,'com_modules.module.13','Admin Submenu','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(48,18,84,85,2,'com_modules.module.14','User Status','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(49,18,86,87,2,'com_modules.module.15','Title','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(50,18,88,89,2,'com_modules.module.16','Login Form','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"module.edit.frontend\":[]}'),(51,18,90,91,2,'com_modules.module.17','Breadcrumbs','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(52,18,92,93,2,'com_modules.module.79','Multilanguage status','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(53,18,94,95,2,'com_modules.module.86','Joomla Version','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(54,27,19,20,3,'com_content.article.1','Cargar Datos','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}'),(55,27,21,22,3,'com_content.article.2','Cheques Devueltos','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}'),(56,18,96,97,2,'com_modules.module.87','Form Maker Module',''),(57,1,139,140,1,'com_formmaker','com_formmaker','{}'),(58,18,98,99,2,'com_modules.module.88','Menu Cargas','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}'),(59,1,141,142,1,'com_breezingforms','breezingforms','{}'),(60,18,100,101,2,'com_modules.module.89','BreezingForms',''),(61,27,23,24,3,'com_content.article.3','destacado','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}'),(62,18,102,103,2,'com_modules.module.90','Upload','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"module.edit.frontend\":[]}'),(63,27,25,26,3,'com_content.article.4','Nosotros','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}'),(64,27,27,28,3,'com_content.article.5','Egresos Administrativos','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}'),(65,27,29,30,3,'com_content.article.6','Reposición de Caja Chica','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}'),(66,27,31,32,3,'com_content.article.7','Datos Guardados','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}'),(67,27,33,34,3,'com_content.article.8','Error al Guardar','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}'),(68,27,35,36,3,'com_content.article.9','Supervision','{\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1}}'),(69,27,37,38,3,'com_content.article.10','Fianza','{\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1}}'),(70,27,39,40,3,'com_content.article.11','Construcción','{\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1}}'),(71,27,41,42,3,'com_content.article.12','Pasivos Laborales','{\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1}}'),(72,27,43,44,3,'com_content.article.13','Subir Archivos','{\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1}}');
/*!40000 ALTER TABLE `mmov_assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mmov_associations`
--

DROP TABLE IF EXISTS `mmov_associations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmov_associations` (
  `id` int(11) NOT NULL COMMENT 'A reference to the associated item.',
  `context` varchar(50) NOT NULL COMMENT 'The context of the associated item.',
  `key` char(32) NOT NULL COMMENT 'The key for the association computed from an md5 on associated ids.',
  PRIMARY KEY (`context`,`id`),
  KEY `idx_key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mmov_associations`
--

LOCK TABLES `mmov_associations` WRITE;
/*!40000 ALTER TABLE `mmov_associations` DISABLE KEYS */;
/*!40000 ALTER TABLE `mmov_associations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mmov_banner_clients`
--

DROP TABLE IF EXISTS `mmov_banner_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmov_banner_clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `contact` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `extrainfo` text NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `metakey` text NOT NULL,
  `own_prefix` tinyint(4) NOT NULL DEFAULT '0',
  `metakey_prefix` varchar(255) NOT NULL DEFAULT '',
  `purchase_type` tinyint(4) NOT NULL DEFAULT '-1',
  `track_clicks` tinyint(4) NOT NULL DEFAULT '-1',
  `track_impressions` tinyint(4) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`),
  KEY `idx_own_prefix` (`own_prefix`),
  KEY `idx_metakey_prefix` (`metakey_prefix`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mmov_banner_clients`
--

LOCK TABLES `mmov_banner_clients` WRITE;
/*!40000 ALTER TABLE `mmov_banner_clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `mmov_banner_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mmov_banner_tracks`
--

DROP TABLE IF EXISTS `mmov_banner_tracks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmov_banner_tracks` (
  `track_date` datetime NOT NULL,
  `track_type` int(10) unsigned NOT NULL,
  `banner_id` int(10) unsigned NOT NULL,
  `count` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`track_date`,`track_type`,`banner_id`),
  KEY `idx_track_date` (`track_date`),
  KEY `idx_track_type` (`track_type`),
  KEY `idx_banner_id` (`banner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mmov_banner_tracks`
--

LOCK TABLES `mmov_banner_tracks` WRITE;
/*!40000 ALTER TABLE `mmov_banner_tracks` DISABLE KEYS */;
/*!40000 ALTER TABLE `mmov_banner_tracks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mmov_banners`
--

DROP TABLE IF EXISTS `mmov_banners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmov_banners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `imptotal` int(11) NOT NULL DEFAULT '0',
  `impmade` int(11) NOT NULL DEFAULT '0',
  `clicks` int(11) NOT NULL DEFAULT '0',
  `clickurl` varchar(200) NOT NULL DEFAULT '',
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `custombannercode` varchar(2048) NOT NULL,
  `sticky` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `params` text NOT NULL,
  `own_prefix` tinyint(1) NOT NULL DEFAULT '0',
  `metakey_prefix` varchar(255) NOT NULL DEFAULT '',
  `purchase_type` tinyint(4) NOT NULL DEFAULT '-1',
  `track_clicks` tinyint(4) NOT NULL DEFAULT '-1',
  `track_impressions` tinyint(4) NOT NULL DEFAULT '-1',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `reset` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `language` char(7) NOT NULL DEFAULT '',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_state` (`state`),
  KEY `idx_own_prefix` (`own_prefix`),
  KEY `idx_metakey_prefix` (`metakey_prefix`),
  KEY `idx_banner_catid` (`catid`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mmov_banners`
--

LOCK TABLES `mmov_banners` WRITE;
/*!40000 ALTER TABLE `mmov_banners` DISABLE KEYS */;
/*!40000 ALTER TABLE `mmov_banners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mmov_breezingforms`
--

DROP TABLE IF EXISTS `mmov_breezingforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmov_breezingforms` (
  `id` int(11) NOT NULL,
  `language` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mmov_breezingforms`
--

LOCK TABLES `mmov_breezingforms` WRITE;
/*!40000 ALTER TABLE `mmov_breezingforms` DISABLE KEYS */;
/*!40000 ALTER TABLE `mmov_breezingforms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mmov_categories`
--

DROP TABLE IF EXISTS `mmov_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmov_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `lft` int(11) NOT NULL DEFAULT '0',
  `rgt` int(11) NOT NULL DEFAULT '0',
  `level` int(10) unsigned NOT NULL DEFAULT '0',
  `path` varchar(255) NOT NULL DEFAULT '',
  `extension` varchar(50) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `description` mediumtext NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `metadesc` varchar(1024) NOT NULL COMMENT 'The meta description for the page.',
  `metakey` varchar(1024) NOT NULL COMMENT 'The meta keywords for the page.',
  `metadata` varchar(2048) NOT NULL COMMENT 'JSON encoded metadata properties.',
  `created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `language` char(7) NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `cat_idx` (`extension`,`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_path` (`path`),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mmov_categories`
--

LOCK TABLES `mmov_categories` WRITE;
/*!40000 ALTER TABLE `mmov_categories` DISABLE KEYS */;
INSERT INTO `mmov_categories` VALUES (1,0,0,0,13,0,'','system','ROOT','root','','',1,0,'0000-00-00 00:00:00',1,'{}','','','{}',42,'2011-01-01 00:00:01',0,'0000-00-00 00:00:00',0,'*',1),(2,27,1,1,2,1,'uncategorised','com_content','Uncategorised','uncategorised','','',1,0,'0000-00-00 00:00:00',1,'{\"category_layout\":\"\",\"image\":\"\"}','','','{\"author\":\"\",\"robots\":\"\"}',42,'2011-01-01 00:00:01',0,'0000-00-00 00:00:00',0,'*',1),(3,28,1,3,4,1,'uncategorised','com_banners','Uncategorised','uncategorised','','',1,0,'0000-00-00 00:00:00',1,'{\"category_layout\":\"\",\"image\":\"\"}','','','{\"author\":\"\",\"robots\":\"\"}',42,'2011-01-01 00:00:01',0,'0000-00-00 00:00:00',0,'*',1),(4,29,1,5,6,1,'uncategorised','com_contact','Uncategorised','uncategorised','','',1,0,'0000-00-00 00:00:00',1,'{\"category_layout\":\"\",\"image\":\"\"}','','','{\"author\":\"\",\"robots\":\"\"}',42,'2011-01-01 00:00:01',0,'0000-00-00 00:00:00',0,'*',1),(5,30,1,7,8,1,'uncategorised','com_newsfeeds','Uncategorised','uncategorised','','',1,0,'0000-00-00 00:00:00',1,'{\"category_layout\":\"\",\"image\":\"\"}','','','{\"author\":\"\",\"robots\":\"\"}',42,'2011-01-01 00:00:01',0,'0000-00-00 00:00:00',0,'*',1),(6,31,1,9,10,1,'uncategorised','com_weblinks','Uncategorised','uncategorised','','',1,0,'0000-00-00 00:00:00',1,'{\"category_layout\":\"\",\"image\":\"\"}','','','{\"author\":\"\",\"robots\":\"\"}',42,'2011-01-01 00:00:01',0,'0000-00-00 00:00:00',0,'*',1),(7,32,1,11,12,1,'uncategorised','com_users','Uncategorised','uncategorised','','',1,0,'0000-00-00 00:00:00',1,'{\"category_layout\":\"\",\"image\":\"\"}','','','{\"author\":\"\",\"robots\":\"\"}',42,'2011-01-01 00:00:01',0,'0000-00-00 00:00:00',0,'*',1);
/*!40000 ALTER TABLE `mmov_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mmov_contact_details`
--

DROP TABLE IF EXISTS `mmov_contact_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmov_contact_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `con_position` varchar(255) DEFAULT NULL,
  `address` text,
  `suburb` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `postcode` varchar(100) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `misc` mediumtext,
  `image` varchar(255) DEFAULT NULL,
  `email_to` varchar(255) DEFAULT NULL,
  `default_con` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `catid` int(11) NOT NULL DEFAULT '0',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `mobile` varchar(255) NOT NULL DEFAULT '',
  `webpage` varchar(255) NOT NULL DEFAULT '',
  `sortname1` varchar(255) NOT NULL,
  `sortname2` varchar(255) NOT NULL,
  `sortname3` varchar(255) NOT NULL,
  `language` char(7) NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `metadata` text NOT NULL,
  `featured` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Set if article is featured.',
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`published`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mmov_contact_details`
--

LOCK TABLES `mmov_contact_details` WRITE;
/*!40000 ALTER TABLE `mmov_contact_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `mmov_contact_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mmov_content`
--

DROP TABLE IF EXISTS `mmov_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmov_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `title` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `introtext` mediumtext NOT NULL,
  `fulltext` mediumtext NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `images` text NOT NULL,
  `urls` text NOT NULL,
  `attribs` varchar(5120) NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `metadata` text NOT NULL,
  `featured` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Set if article is featured.',
  `language` char(7) NOT NULL COMMENT 'The language code for the article.',
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mmov_content`
--

LOCK TABLES `mmov_content` WRITE;
/*!40000 ALTER TABLE `mmov_content` DISABLE KEYS */;
INSERT INTO `mmov_content` VALUES (1,54,'Cargar Datos','cargar-datos','<p>En este lugar puede cargar nueva información.</p>','',1,2,'2015-01-19 14:20:06',961,'','2015-01-27 15:46:24',961,0,'0000-00-00 00:00:00','2015-01-19 14:20:06','0000-00-00 00:00:00','{\"image_intro\":\"\",\"float_intro\":\"\",\"image_intro_alt\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}','{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}','{\"show_title\":\"0\",\"link_titles\":\"0\",\"show_tags\":\"0\",\"show_intro\":\"0\",\"info_block_position\":\"\",\"show_category\":\"0\",\"link_category\":\"0\",\"show_parent_category\":\"0\",\"link_parent_category\":\"0\",\"show_author\":\"0\",\"link_author\":\"0\",\"show_create_date\":\"0\",\"show_modify_date\":\"0\",\"show_publish_date\":\"0\",\"show_item_navigation\":\"0\",\"show_icons\":\"0\",\"show_print_icon\":\"0\",\"show_email_icon\":\"0\",\"show_vote\":\"0\",\"show_hits\":\"0\",\"show_noauth\":\"0\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_layout\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}',33,12,'','',1,131,'{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}',0,'*',''),(2,55,'Cheques Devueltos','cheques-devueltos','<p>{source}<span style=\"font-family: courier new, courier, monospace;\"><br />&lt;!-- You can place html anywhere within the source tags --&gt;</span></p>\r\n<p> </p>\r\n<p style=\"font-size: 12.1599998474121px; line-height: 15.8079996109009px;\"> <span style=\"color: #000080; font-family: source-code-pro, Consolas, monospace; font-size: 15px; line-height: 16.5px; white-space: pre; background-color: #eeeeee;\">&lt;</span><span class=\"title\" style=\"box-sizing: border-box; color: #000080; font-family: source-code-pro, Consolas, monospace; font-size: 15px; line-height: 16.5px; white-space: pre; background-color: #eeeeee;\">link</span><span style=\"font-family: \'courier new\', courier, monospace; font-size: 12.1599998474121px; line-height: 15.8079996109009px;\"> </span><span class=\"attribute\" style=\"box-sizing: border-box; color: #008080; font-family: source-code-pro, Consolas, monospace; font-size: 15px; line-height: 16.5px; white-space: pre; background-color: #eeeeee;\">rel</span><span style=\"color: #000080; font-family: source-code-pro, Consolas, monospace; font-size: 15px; line-height: 16.5px; white-space: pre; background-color: #eeeeee;\">=</span><span class=\"value\" style=\"box-sizing: border-box; color: #dd1144; font-family: source-code-pro, Consolas, monospace; font-size: 15px; line-height: 16.5px; white-space: pre; background-color: #eeeeee;\">\"stylesheet\"</span><span style=\"font-family: \'courier new\', courier, monospace; font-size: 12.1599998474121px; line-height: 15.8079996109009px;\"> </span><span class=\"attribute\" style=\"box-sizing: border-box; color: #008080; font-family: source-code-pro, Consolas, monospace; font-size: 15px; line-height: 16.5px; white-space: pre; background-color: #eeeeee;\">href</span><span style=\"color: #000080; font-family: source-code-pro, Consolas, monospace; font-size: 15px; line-height: 16.5px; white-space: pre; background-color: #eeeeee;\">=</span><span class=\"value\" style=\"box-sizing: border-box; color: #dd1144; font-family: source-code-pro, Consolas, monospace; font-size: 15px; line-height: 16.5px; white-space: pre; background-color: #eeeeee;\">\"//code.jquery.com/ui/1.11.3/themes/smoothness/jquery-ui.css\"</span><span style=\"color: #000080; font-family: source-code-pro, Consolas, monospace; font-size: 15px; line-height: 16.5px; white-space: pre; background-color: #eeeeee;\">&gt;</span></p>\r\n<p style=\"font-size: 12.1599998474121px; line-height: 15.8079996109009px;\"><span style=\"font-family: courier new, courier, monospace;\"> <span class=\"tag\" style=\"box-sizing: border-box; color: #000080; font-family: source-code-pro, Consolas, monospace; font-size: 15px; line-height: 16.5px; white-space: pre; background-color: #eeeeee;\">&lt;<span class=\"title\" style=\"box-sizing: border-box;\">script</span> <span class=\"attribute\" style=\"box-sizing: border-box; color: #008080;\">src</span>=<span class=\"value\" style=\"box-sizing: border-box; color: #dd1144;\">\"//code.jquery.com/ui/1.11.3/jquery-ui.js\"</span>&gt;</span><span class=\"tag\" style=\"box-sizing: border-box; color: #000080; font-family: source-code-pro, Consolas, monospace; font-size: 15px; line-height: 16.5px; white-space: pre; background-color: #eeeeee;\">&lt;/<span class=\"title\" style=\"box-sizing: border-box;\">script</span>&gt;</span></span></p>\r\n<p style=\"font-size: 12.1599998474121px; line-height: 15.8079996109009px;\"><span style=\"font-family: courier new, courier, monospace;\">&lt;script src=\"my_js/jquery.numeric.js\"&gt;&lt;/script&gt;</span></p>\r\n<p style=\"font-size: 12.1599998474121px; line-height: 15.8079996109009px;\"><span style=\"font-family: courier new, courier, monospace;\">&lt;script src=\"my_js/general.js\"&gt;&lt;/script&gt;</span></p>\r\n<p> </p>\r\n<p style=\"font-size: 12.1599998474121px; line-height: 15.8079996109009px;\"> </p>\r\n<p><span style=\"font-family: courier new, courier, monospace;\">&lt;link rel=\"stylesheet\" href=\"my_css/personal_style.css\" type=\"text/css\"&gt;</span></p>\r\n<p> </p>\r\n<p><span style=\"font-family: courier new, courier, monospace;\">&lt;script src=\'../../my_js/cheques_devueltos.js\'&gt;&lt;/script&gt;</span></p>\r\n<p><span style=\"font-family: courier new, courier, monospace;\"><br /></span>{/source}</p>\r\n<form class=\"per-form\" action=\"../../php/cheques_devueltos.php\" method=\"POST\" name=\"form_chequesDevueltos\">\r\n<div>\r\n<div>\r\n<h3>Datos del Cheque</h3>\r\n<hr />\r\n<p class=\"my_p\"><label>Fecha Devolución</label></p>\r\n<input class=\"my_input\" name=\"dat_fechaCheque\" required=\"\" type=\"text\" /><br />\r\n<p class=\"my_p\"><label>Banco Emisor</label></p>\r\n<select id=\"sel_bancoCheque\" name=\"sel_bancoCheque\" required=\"\">\r\n<option value=\"-1\">Seleccione...</option>\r\n</select><br />\r\n<p class=\"my_p\"><label>Numero de Cheque</label></p>\r\n<input class=\"my_input\" maxlength=\"8\" name=\"num_numCheque\" required=\"\" type=\"text\" /><br />\r\n<p class=\"my_p\"><label>Monto</label></p>\r\n<input class=\"my_input\" name=\"num_montoCheque\" required=\"\" step=\"0.01\" type=\"number\" /><br />\r\n<p class=\"my_p\"><label>PDV</label></p>\r\n<select id=\"sel_pdv\" class=\"my_input\" name=\"sel_pdv\">\r\n<option value=\"-1\">Seleccione...</option>\r\n</select><br />\r\n<p class=\"my_p\"><label>Cuenta</label></p>\r\n<select id=\"sel_cuentaCheque\" class=\"my_input\" name=\"sel_cuentaCheque\">\r\n<option value=\"-1\">Seleccione...</option>\r\n</select><br />\r\n<p class=\"my_p\"><label>Ingresar Reposición?</label></p>\r\n<input name=\"che_repo\" type=\"checkbox\" /></div>\r\n<div id=\"div_repo\">\r\n<h3>Datos de Reposición</h3>\r\n<hr />\r\n<p class=\"my_p\"><label>Banco</label></p>\r\n<select id=\"sel_banco\" name=\"sel_banco\">\r\n<option value=\"-1\">Seleccione...</option>\r\n</select><br />\r\n<p class=\"my_p\"><label>Forma de Pago</label></p>\r\n<select id=\"sel_forma\" class=\"my_input\" name=\"sel_forma\">\r\n<option value=\"-1\">Seleccione...</option>\r\n</select><br />\r\n<p class=\"my_p\"><label>Numero de Cheque</label></p>\r\n<input class=\"my_input\" disabled=\"disabled\" maxlength=\"8\" name=\"num_numChequeRepo\" required=\"\" type=\"text\" /><br />\r\n<p class=\"my_p\"><label>Referencia</label></p>\r\n<input class=\"my_input\" name=\"num_voucher\" required=\"\" type=\"number\" /><br />\r\n<p class=\"my_p\"><label>Monto</label></p>\r\n<input class=\"my_input\" name=\"num_montoRepo\" step=\"0.01\" type=\"number\" /><br />\r\n<p class=\"my_p\"><label>Fecha</label></p>\r\n<input class=\"my_input\" name=\"dat_fechaRepo\" required=\"\" type=\"text\" /> <br />\r\n<p class=\"my_p\"><label>Cuenta</label></p>\r\n<select id=\"sel_cuenta\" class=\"my_input\" name=\"sel_cuenta\">\r\n<option value=\"-1\">Seleccione...</option>\r\n</select></div>\r\n</div>\r\n<hr /><input type=\"submit\" value=\"Guardar\" /></form>','',1,2,'2015-01-19 16:21:17',961,'','2015-03-05 21:43:28',961,0,'0000-00-00 00:00:00','2015-01-19 16:21:17','0000-00-00 00:00:00','{\"image_intro\":\"\",\"float_intro\":\"\",\"image_intro_alt\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}','{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}','{\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_layout\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}',125,11,'','',1,370,'{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}',0,'*',''),(3,61,'destacado','destacado','<p>este es un articulo destacado</p>','',1,2,'2015-01-28 18:52:03',961,'','2015-01-28 18:52:16',961,0,'0000-00-00 00:00:00','2015-01-28 18:52:03','0000-00-00 00:00:00','{\"image_intro\":\"\",\"float_intro\":\"\",\"image_intro_alt\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}','{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}','{\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_layout\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}',2,10,'','',1,5,'{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}',0,'*',''),(4,63,'Nosotros','nosotros','','',1,2,'2015-01-29 21:37:38',961,'','0000-00-00 00:00:00',0,0,'0000-00-00 00:00:00','2015-01-29 21:37:38','0000-00-00 00:00:00','{\"image_intro\":\"\",\"float_intro\":\"\",\"image_intro_alt\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}','{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}','{\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_layout\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}',1,9,'','',1,7,'{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}',0,'*',''),(5,64,'Egresos Administrativos','egresos-administrativos','<p>{source}<span style=\"font-family: courier new, courier, monospace;\"><br /></span></p>\r\n<p> <span style=\"color: #000080; font-family: source-code-pro, Consolas, monospace; font-size: 15px; line-height: 16.5px; white-space: pre; background-color: #eeeeee;\">&lt;</span><span class=\"title\" style=\"box-sizing: border-box; color: #000080; font-family: source-code-pro, Consolas, monospace; font-size: 15px; line-height: 16.5px; white-space: pre; background-color: #eeeeee;\">link</span><span style=\"font-family: \'courier new\', courier, monospace; font-size: 12.1599998474121px; line-height: 15.8079996109009px;\"> </span><span class=\"attribute\" style=\"box-sizing: border-box; color: #008080; font-family: source-code-pro, Consolas, monospace; font-size: 15px; line-height: 16.5px; white-space: pre; background-color: #eeeeee;\">rel</span><span style=\"color: #000080; font-family: source-code-pro, Consolas, monospace; font-size: 15px; line-height: 16.5px; white-space: pre; background-color: #eeeeee;\">=</span><span class=\"value\" style=\"box-sizing: border-box; color: #dd1144; font-family: source-code-pro, Consolas, monospace; font-size: 15px; line-height: 16.5px; white-space: pre; background-color: #eeeeee;\">\"stylesheet\"</span><span style=\"font-family: \'courier new\', courier, monospace; font-size: 12.1599998474121px; line-height: 15.8079996109009px;\"> </span><span class=\"attribute\" style=\"box-sizing: border-box; color: #008080; font-family: source-code-pro, Consolas, monospace; font-size: 15px; line-height: 16.5px; white-space: pre; background-color: #eeeeee;\">href</span><span style=\"color: #000080; font-family: source-code-pro, Consolas, monospace; font-size: 15px; line-height: 16.5px; white-space: pre; background-color: #eeeeee;\">=</span><span class=\"value\" style=\"box-sizing: border-box; color: #dd1144; font-family: source-code-pro, Consolas, monospace; font-size: 15px; line-height: 16.5px; white-space: pre; background-color: #eeeeee;\">\"//code.jquery.com/ui/1.11.3/themes/smoothness/jquery-ui.css\"</span><span style=\"color: #000080; font-family: source-code-pro, Consolas, monospace; font-size: 15px; line-height: 16.5px; white-space: pre; background-color: #eeeeee;\">&gt;</span></p>\r\n<p style=\"font-size: 12.1599998474121px; line-height: 15.8079996109009px;\"><span style=\"font-family: courier new, courier, monospace;\"> <span class=\"tag\" style=\"box-sizing: border-box; color: #000080; font-family: source-code-pro, Consolas, monospace; font-size: 15px; line-height: 16.5px; white-space: pre; background-color: #eeeeee;\">&lt;<span class=\"title\" style=\"box-sizing: border-box;\">script</span> <span class=\"attribute\" style=\"box-sizing: border-box; color: #008080;\">src</span>=<span class=\"value\" style=\"box-sizing: border-box; color: #dd1144;\">\"//code.jquery.com/ui/1.11.3/jquery-ui.js\"</span>&gt;</span><span class=\"tag\" style=\"box-sizing: border-box; color: #000080; font-family: source-code-pro, Consolas, monospace; font-size: 15px; line-height: 16.5px; white-space: pre; background-color: #eeeeee;\">&lt;/<span class=\"title\" style=\"box-sizing: border-box;\">script</span>&gt;</span></span></p>\r\n<p style=\"font-size: 12.1599998474121px; line-height: 15.8079996109009px;\"><span style=\"font-family: courier new, courier, monospace;\">&lt;script src=\"my_js/jquery.numeric.js\"&gt;&lt;/script&gt;</span></p>\r\n<p style=\"font-size: 12.1599998474121px; line-height: 15.8079996109009px;\"><span style=\"font-family: courier new, courier, monospace;\"><span style=\"font-size: 12.1599998474121px; line-height: 15.8079996109009px;\">&lt;script src=\"my_js/general.js\"&gt;&lt;/script&gt;</span></span></p>\r\n<p> </p>\r\n<p class=\"my_p\"><label><span style=\"font-family: courier new, courier, monospace;\"><br />&lt;script language=\"javascript\" src=\"my_js/egresos_administrativos.js\" type=\"text/javascript\"&gt;<br /> // You can place JavaScript like this<br /> <br />&lt;/script&gt;</span></label></p>\r\n<p class=\"my_p\"> </p>\r\n<p class=\"my_p\"><span style=\"font-family: Consolas, MingLiU, \'Courier New\', monospace; font-size: 15px; line-height: 21px; background-color: #eeeeee;\">&lt;link rel=\"stylesheet\" href=\"my_css/personal_style.css\" type=\"text/css\"&gt;</span></p>\r\n<p class=\"my_p\"><label><span style=\"font-family: courier new, courier, monospace;\"><br /></span>{/source}</label></p>\r\n<form id=\"form_egresos\" class=\"per-form\" action=\"../../php/egresos_administrativos.php\" method=\"post\" name=\"form_egresos\"><hr />\r\n<div>\r\n<div>\r\n<p><label>Cuenta</label></p>\r\n<select id=\"sel_cuenta\" title=\"Seleccione la cuenta de donde se origina el egreso\" name=\"sel_cuenta\">\r\n<option selected=\"selected\" value=\"-1\">Seleccione...</option>\r\n</select><br />\r\n<p class=\"my_p\"><label>Fecha</label></p>\r\n<input name=\"dat_fecha\" readonly=\"readonly\" required=\"\" type=\"text\" /> <br />\r\n<p class=\"my_p\"><label>Concepto</label></p>\r\n<input title=\"ingrese el concepto del egreso\" name=\"tex_concepto\" required=\"\" type=\"text\" /> <br />\r\n<p class=\"my_p\"><label>Numero de Cheque</label></p>\r\n<input style=\"width: 50px !important;\" maxlength=\"3\" name=\"tex_pre_num_cheque\" required=\"\" type=\"text\" placeholder=\"xxx\" /> <input style=\"width: 122px !important;\" maxlength=\"5\" name=\"tex_post_num_cheque\" readonly=\"readonly\" required=\"\" type=\"text\" />\r\n<p class=\"my_p\"><label>Anular Cheque?</label></p>\r\n<input name=\"che_anular\" type=\"checkbox\" /></div>\r\n<div>\r\n<p class=\"my_p\"><label>Receptor</label></p>\r\n<input title=\"ingrese a nombre de quien esta el cheque\" name=\"tex_receptor\" required=\"\" type=\"text\" /> <br />\r\n<p class=\"my_p\"><label>Monto</label></p>\r\n<input title=\"ingrese el monto del cheque\" name=\"tex_monto\" required=\"\" type=\"text\" /> <br />\r\n<p class=\"my_p\"><label>Emisor del Cheque</label></p>\r\n<input title=\"ingrese la persona que emitio el cheque\" name=\"tex_emisor\" required=\"\" type=\"text\" /><br />\r\n<p class=\"my_p\"><label>Item</label></p>\r\n<select id=\"sel_item\" title=\"Seleccione la categoria del egreso\" name=\"sel_item\">\r\n<option value=\"-1\">Seleccione...</option>\r\n</select></div>\r\n</div>\r\n<br /><br /><hr /><input name=\"sub_guardar\" type=\"submit\" value=\"Guardar\" /></form>','',1,2,'2015-02-18 17:11:10',961,'','2015-03-06 15:45:04',961,961,'2015-03-06 15:45:04','2015-02-18 17:11:10','0000-00-00 00:00:00','{\"image_intro\":\"\",\"float_intro\":\"\",\"image_intro_alt\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}','{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}','{\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_layout\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}',107,8,'','',2,415,'{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}',0,'*',''),(6,65,'Reposición de Caja Chica','reposicion-de-caja-chica','<p>{source}<span style=\"font-family: courier new, courier, monospace;\"><br /></span></p>\r\n<p><span style=\"font-family: courier new, courier, monospace;\"><span style=\"color: #000080; font-family: source-code-pro, Consolas, monospace; font-size: 15px; line-height: 16.5px; white-space: pre; background-color: #eeeeee;\">&lt;</span><span class=\"title\" style=\"box-sizing: border-box; color: #000080; font-family: source-code-pro, Consolas, monospace; font-size: 15px; line-height: 16.5px; white-space: pre; background-color: #eeeeee;\">link</span> <span class=\"attribute\" style=\"box-sizing: border-box; color: #008080; font-family: source-code-pro, Consolas, monospace; font-size: 15px; line-height: 16.5px; white-space: pre; background-color: #eeeeee;\">rel</span><span style=\"color: #000080; font-family: source-code-pro, Consolas, monospace; font-size: 15px; line-height: 16.5px; white-space: pre; background-color: #eeeeee;\">=</span><span class=\"value\" style=\"box-sizing: border-box; color: #dd1144; font-family: source-code-pro, Consolas, monospace; font-size: 15px; line-height: 16.5px; white-space: pre; background-color: #eeeeee;\">\"stylesheet\"</span> <span class=\"attribute\" style=\"box-sizing: border-box; color: #008080; font-family: source-code-pro, Consolas, monospace; font-size: 15px; line-height: 16.5px; white-space: pre; background-color: #eeeeee;\">href</span><span style=\"color: #000080; font-family: source-code-pro, Consolas, monospace; font-size: 15px; line-height: 16.5px; white-space: pre; background-color: #eeeeee;\">=</span><span class=\"value\" style=\"box-sizing: border-box; color: #dd1144; font-family: source-code-pro, Consolas, monospace; font-size: 15px; line-height: 16.5px; white-space: pre; background-color: #eeeeee;\">\"//code.jquery.com/ui/1.11.3/themes/smoothness/jquery-ui.css\"</span><span style=\"color: #000080; font-family: source-code-pro, Consolas, monospace; font-size: 15px; line-height: 16.5px; white-space: pre; background-color: #eeeeee;\">&gt;</span></span></p>\r\n<p><span style=\"font-family: courier new, courier, monospace;\"> <span class=\"tag\" style=\"box-sizing: border-box; color: #000080; font-family: source-code-pro, Consolas, monospace; font-size: 15px; line-height: 16.5px; white-space: pre; background-color: #eeeeee;\">&lt;<span class=\"title\" style=\"box-sizing: border-box;\">script</span> <span class=\"attribute\" style=\"box-sizing: border-box; color: #008080;\">src</span>=<span class=\"value\" style=\"box-sizing: border-box; color: #dd1144;\">\"//code.jquery.com/ui/1.11.3/jquery-ui.js\"</span>&gt;</span><span class=\"tag\" style=\"box-sizing: border-box; color: #000080; font-family: source-code-pro, Consolas, monospace; font-size: 15px; line-height: 16.5px; white-space: pre; background-color: #eeeeee;\">&lt;/<span class=\"title\" style=\"box-sizing: border-box;\">script</span>&gt;</span></span></p>\r\n<p><span style=\"font-family: courier new, courier, monospace;\">&lt;script src=\"my_js/jquery.numeric.js\"&gt;&lt;/script&gt;<br />&lt;link rel=\"stylesheet\" href=\"my_css/personal_style.css\" type=\"text/css\"&gt;</span></p>\r\n<p> </p>\r\n<p> </p>\r\n<p><span class=\"tag\" style=\"box-sizing: border-box; color: #000080; font-family: source-code-pro, Consolas, monospace; font-size: 15px; line-height: 16.5px; white-space: pre; background-color: #eeeeee;\"><span style=\"color: #333333; font-family: \'courier new\', courier, monospace; font-size: 12.1599998474121px; line-height: 15.8079996109009px; white-space: normal; background-color: #ffffff;\"><span style=\"font-size: 12.1599998474121px; line-height: 15.8079996109009px;\">&lt;script src=\"my_js/general.js\"&gt;&lt;/script&gt;</span></span></span></p>\r\n<p><span style=\"font-family: courier new, courier, monospace;\"><span style=\"font-size: 12.1599998474121px; line-height: 15.8079996109009px;\">&lt;script src=\"my_js/validaciones.js\"&gt;&lt;/script&gt;</span></span></p>\r\n<p><span style=\"font-family: courier new, courier, monospace;\">&lt;script src=\"my_js/agregar_cajachica.js\"&gt;&lt;/script&gt;</span></p>\r\n<p> </p>\r\n<p><span style=\"font-family: courier new, courier, monospace;\"><br /></span>{/source}</p>\r\n<hr /><form class=\"per-form\" action=\"../../php/reposicion_caja_chica.php\" method=\"post\" name=\"form_cajaChica\">\r\n<div>\r\n<div>\r\n<p class=\"my_p\"><label>Fecha</label></p>\r\n<input id=\"dat_fecha_repo\" class=\"my_input\" name=\"dat_fecha_repo\" readonly=\"readonly\" type=\"text\" /> <br />\r\n<p id=\"img_agregar\"> </p>\r\n<div class=\"div_table\">\r\n<table id=\"tab_gastosCajaChica\" class=\"per-table\" cellspacing=\"0px\">\r\n<thead>\r\n<tr><th>Item</th><th>Fecha</th><th>N° Factura/Nota</th><th>Concepto</th><th>Monto</th><th>Exento</th><th>Monto Exento</th><th>Monto Base</th><th>Monto IVA</th><th>Item</th><th> </th></tr>\r\n</thead>\r\n</table>\r\n</div>\r\n<hr /><input disabled=\"disabled\" name=\"sub_guardar\" type=\"submit\" value=\"Guardar\" /></div>\r\n</div>\r\n</form>','',1,2,'2015-02-18 17:42:11',961,'','2015-03-06 15:43:38',961,0,'0000-00-00 00:00:00','2015-02-18 17:42:11','0000-00-00 00:00:00','{\"image_intro\":\"\",\"float_intro\":\"\",\"image_intro_alt\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}','{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}','{\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_layout\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}',59,7,'','',2,368,'{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}',0,'*',''),(7,66,'Datos Guardados','datos-guardados','<h1 style=\"text-align: center; color: #5bb75b;\"><strong>{source}<span style=\"font-family: courier new, courier, monospace;\"><br />&lt;!-- You can place html anywhere within the source tags --&gt;<br /><br /><br />&lt;script language=\"javascript\" type=\"text/javascript\"&gt;<br /> // You can place JavaScript like this<br /> <br /> function redireccionar(){</span></strong></h1>\r\n<h1 style=\"text-align: center; color: #5bb75b;\"> </h1>\r\n<pre class=\"default prettyprint prettyprinted\" style=\"margin-top: 0px; padding: 5px; border: 0px; font-size: 13px; overflow: auto; width: auto; max-height: 600px; font-family: Consolas, Menlo, Monaco, \'Lucida Console\', \'Liberation Mono\', \'DejaVu Sans Mono\', \'Bitstream Vera Sans Mono\', \'Courier New\', monospace, sans-serif; color: #393318; word-wrap: normal; font-weight: normal; text-align: left; background-color: #eeeeee;\"><code style=\"margin: 0px; padding: 0px; border: 0px; font-family: Consolas, Menlo, Monaco, \'Lucida Console\', \'Liberation Mono\', \'DejaVu Sans Mono\', \'Bitstream Vera Sans Mono\', \'Courier New\', monospace, sans-serif; white-space: inherit;\"><span class=\"kwd\" style=\"margin: 0px; padding: 0px; border: 0px; color: #00008b;\">var</span><span class=\"pln\" style=\"margin: 0px; padding: 0px; border: 0px; color: #000000;\"> oldURL </span><span class=\"pun\" style=\"margin: 0px; padding: 0px; border: 0px; color: #000000;\">=</span><span class=\"pln\" style=\"margin: 0px; padding: 0px; border: 0px; color: #000000;\"> <span style=\"color: #333333; font-family: Menlo, Monaco, Consolas, \'Courier New\', monospace; line-height: 1.42857143; white-space: inherit; background-color: #f4f4f4;\">location.href;</span><br /></span>\r\n<span class=\"kwd\" style=\"margin: 0px; padding: 0px; border: 0px; color: #00008b;\">var</span><span class=\"pln\" style=\"margin: 0px; padding: 0px; border: 0px; color: #000000;\"> index </span><span class=\"pun\" style=\"margin: 0px; padding: 0px; border: 0px; color: #000000;\">=</span> <span class=\"lit\" style=\"margin: 0px; padding: 0px; border: 0px; color: #800000;\">0</span><span class=\"pun\" style=\"margin: 0px; padding: 0px; border: 0px; color: #000000;\">;</span>\r\n<span class=\"kwd\" style=\"margin: 0px; padding: 0px; border: 0px; color: #00008b;\">var</span><span class=\"pln\" style=\"margin: 0px; padding: 0px; border: 0px; color: #000000;\"> newURL </span><span class=\"pun\" style=\"margin: 0px; padding: 0px; border: 0px; color: #000000;\">=</span><span class=\"pln\" style=\"margin: 0px; padding: 0px; border: 0px; color: #000000;\"> oldURL</span><span class=\"pun\" style=\"margin: 0px; padding: 0px; border: 0px; color: #000000;\">;</span><span class=\"pln\" style=\"margin: 0px; padding: 0px; border: 0px; color: #000000;\">\r\nindex </span><span class=\"pun\" style=\"margin: 0px; padding: 0px; border: 0px; color: #000000;\">=</span><span class=\"pln\" style=\"margin: 0px; padding: 0px; border: 0px; color: #000000;\"> oldURL</span><span class=\"pun\" style=\"margin: 0px; padding: 0px; border: 0px; color: #000000;\">.</span><span class=\"pln\" style=\"margin: 0px; padding: 0px; border: 0px; color: #000000;\">indexOf</span><span class=\"pun\" style=\"margin: 0px; padding: 0px; border: 0px; color: #000000;\">(</span><span class=\"str\" style=\"margin: 0px; padding: 0px; border: 0px; color: #800000;\">\'?\'</span><span class=\"pun\" style=\"margin: 0px; padding: 0px; border: 0px; color: #000000;\">);</span>\r\n<span class=\"kwd\" style=\"margin: 0px; padding: 0px; border: 0px; color: #00008b;\">if</span><span class=\"pun\" style=\"margin: 0px; padding: 0px; border: 0px; color: #000000;\">(</span><span class=\"pln\" style=\"margin: 0px; padding: 0px; border: 0px; color: #000000;\">index </span><span class=\"pun\" style=\"margin: 0px; padding: 0px; border: 0px; color: #000000;\">==</span> <span class=\"pun\" style=\"margin: 0px; padding: 0px; border: 0px; color: #000000;\">-</span><span class=\"lit\" style=\"margin: 0px; padding: 0px; border: 0px; color: #800000;\">1</span><span class=\"pun\" style=\"margin: 0px; padding: 0px; border: 0px; color: #000000;\">){</span><span class=\"pln\" style=\"margin: 0px; padding: 0px; border: 0px; color: #000000;\">\r\n    index </span><span class=\"pun\" style=\"margin: 0px; padding: 0px; border: 0px; color: #000000;\">=</span><span class=\"pln\" style=\"margin: 0px; padding: 0px; border: 0px; color: #000000;\"> oldURL</span><span class=\"pun\" style=\"margin: 0px; padding: 0px; border: 0px; color: #000000;\">.</span><span class=\"pln\" style=\"margin: 0px; padding: 0px; border: 0px; color: #000000;\">indexOf</span><span class=\"pun\" style=\"margin: 0px; padding: 0px; border: 0px; color: #000000;\">(</span><span class=\"str\" style=\"margin: 0px; padding: 0px; border: 0px; color: #800000;\">\'#\'</span><span class=\"pun\" style=\"margin: 0px; padding: 0px; border: 0px; color: #000000;\">);</span>\r\n<span class=\"pun\" style=\"margin: 0px; padding: 0px; border: 0px; color: #000000;\">}</span>\r\n<span class=\"kwd\" style=\"margin: 0px; padding: 0px; border: 0px; color: #00008b;\">if</span><span class=\"pun\" style=\"margin: 0px; padding: 0px; border: 0px; color: #000000;\">(</span><span class=\"pln\" style=\"margin: 0px; padding: 0px; border: 0px; color: #000000;\">index </span><span class=\"pun\" style=\"margin: 0px; padding: 0px; border: 0px; color: #000000;\">!=</span> <span class=\"pun\" style=\"margin: 0px; padding: 0px; border: 0px; color: #000000;\">-</span><span class=\"lit\" style=\"margin: 0px; padding: 0px; border: 0px; color: #800000;\">1</span><span class=\"pun\" style=\"margin: 0px; padding: 0px; border: 0px; color: #000000;\">){</span><span class=\"pln\" style=\"margin: 0px; padding: 0px; border: 0px; color: #000000;\">\r\n    newURL </span><span class=\"pun\" style=\"margin: 0px; padding: 0px; border: 0px; color: #000000;\">=</span><span class=\"pln\" style=\"margin: 0px; padding: 0px; border: 0px; color: #000000;\"> oldURL</span><span class=\"pun\" style=\"margin: 0px; padding: 0px; border: 0px; color: #000000;\">.</span><span class=\"pln\" style=\"margin: 0px; padding: 0px; border: 0px; color: #000000;\">substring</span><span class=\"pun\" style=\"margin: 0px; padding: 0px; border: 0px; color: #000000;\">(</span><span class=\"lit\" style=\"margin: 0px; padding: 0px; border: 0px; color: #800000;\">0</span><span class=\"pun\" style=\"margin: 0px; padding: 0px; border: 0px; color: #000000;\">,</span><span class=\"pln\" style=\"margin: 0px; padding: 0px; border: 0px; color: #000000;\"> index</span><span class=\"pun\" style=\"margin: 0px; padding: 0px; border: 0px; color: #000000;\">);</span>\r\n<span class=\"pun\" style=\"margin: 0px; padding: 0px; border: 0px; color: #000000;\">}<br /><br /></span></code></pre>\r\n<h1 style=\"text-align: center; color: #5bb75b;\"><strong><span style=\"font-family: courier new, courier, monospace;\"><br /> window.location=newURL;<br />} <br />setTimeout (\"</span></strong><strong style=\"line-height: 15.8079996109009px;\"><span style=\"font-family: courier new, courier, monospace;\">redireccionar</span></strong><strong style=\"line-height: 1.3em;\"><span style=\"font-family: courier new, courier, monospace;\">();\", 5000); </span></strong></h1>\r\n<h1 style=\"text-align: center; color: #5bb75b;\"><strong><span style=\"font-family: courier new, courier, monospace;\">&lt;/script&gt;<br /><br /></span>{/source}Datos Guardados Con Éxito!</strong></h1>','',1,2,'2015-02-20 16:13:22',961,'','2015-02-23 19:21:15',961,0,'0000-00-00 00:00:00','2015-02-20 16:13:22','0000-00-00 00:00:00','{\"image_intro\":\"\",\"float_intro\":\"\",\"image_intro_alt\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}','{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}','{\"show_title\":\"0\",\"link_titles\":\"\",\"show_tags\":\"0\",\"show_intro\":\"0\",\"info_block_position\":\"\",\"show_category\":\"0\",\"link_category\":\"\",\"show_parent_category\":\"0\",\"link_parent_category\":\"\",\"show_author\":\"0\",\"link_author\":\"\",\"show_create_date\":\"0\",\"show_modify_date\":\"0\",\"show_publish_date\":\"0\",\"show_item_navigation\":\"0\",\"show_icons\":\"0\",\"show_print_icon\":\"0\",\"show_email_icon\":\"0\",\"show_vote\":\"0\",\"show_hits\":\"0\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_layout\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}',16,6,'','',1,64,'{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}',0,'*',''),(8,67,'Error al Guardar','error-al-guardar','<h1 style=\"text-align: center; color: #bd362f;\">{source}<span style=\"font-family: courier new, courier, monospace;\"><br />&lt;!-- You can place html anywhere within the source tags --&gt;<br /><br /><br />&lt;script language=\"javascript\" type=\"text/javascript\"&gt;<br /> function atras(){<br /> history.back();<br /> }<br /> <br /><span style=\"color: #000000; font-family: Consolas, \'courier new\'; font-size: 15px; font-weight: normal; line-height: 17.25px; text-align: start;\">setTimeout</span>(\'atras();\', 5000);<br /> <br />&lt;/script&gt;<br /><br /></span>{/source}Error Al Guardar Los Datos!</h1>','',1,2,'2015-02-23 21:11:33',961,'','2015-02-23 21:21:40',961,0,'0000-00-00 00:00:00','2015-02-23 21:11:33','0000-00-00 00:00:00','{\"image_intro\":\"\",\"float_intro\":\"\",\"image_intro_alt\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}','{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}','{\"show_title\":\"0\",\"link_titles\":\"0\",\"show_tags\":\"0\",\"show_intro\":\"0\",\"info_block_position\":\"\",\"show_category\":\"0\",\"link_category\":\"0\",\"show_parent_category\":\"0\",\"link_parent_category\":\"0\",\"show_author\":\"0\",\"link_author\":\"0\",\"show_create_date\":\"0\",\"show_modify_date\":\"0\",\"show_publish_date\":\"0\",\"show_item_navigation\":\"0\",\"show_icons\":\"0\",\"show_print_icon\":\"0\",\"show_email_icon\":\"0\",\"show_vote\":\"0\",\"show_hits\":\"0\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_layout\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}',5,5,'','',1,12,'{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}',0,'*',''),(9,68,'Supervision','supervision','<p>{source}<span style=\"font-family: courier new, courier, monospace;\"><br /></span></p>\r\n<p> <span style=\"font-size: 12.1599998474121px; line-height: 15.8079996109009px;\"> </span><span style=\"color: #000080; font-family: source-code-pro, Consolas, monospace; font-size: 15px; line-height: 16.5px; white-space: pre; background-color: #eeeeee;\">&lt;</span><span class=\"title\" style=\"box-sizing: border-box; color: #000080; font-family: source-code-pro, Consolas, monospace; font-size: 15px; line-height: 16.5px; white-space: pre; background-color: #eeeeee;\">link</span><span style=\"font-family: \'courier new\', courier, monospace; font-size: 12.1599998474121px; line-height: 15.8079996109009px;\"> </span><span class=\"attribute\" style=\"box-sizing: border-box; color: #008080; font-family: source-code-pro, Consolas, monospace; font-size: 15px; line-height: 16.5px; white-space: pre; background-color: #eeeeee;\">rel</span><span style=\"color: #000080; font-family: source-code-pro, Consolas, monospace; font-size: 15px; line-height: 16.5px; white-space: pre; background-color: #eeeeee;\">=</span><span class=\"value\" style=\"box-sizing: border-box; color: #dd1144; font-family: source-code-pro, Consolas, monospace; font-size: 15px; line-height: 16.5px; white-space: pre; background-color: #eeeeee;\">\"stylesheet\"</span><span style=\"font-family: \'courier new\', courier, monospace; font-size: 12.1599998474121px; line-height: 15.8079996109009px;\"> </span><span class=\"attribute\" style=\"box-sizing: border-box; color: #008080; font-family: source-code-pro, Consolas, monospace; font-size: 15px; line-height: 16.5px; white-space: pre; background-color: #eeeeee;\">href</span><span style=\"color: #000080; font-family: source-code-pro, Consolas, monospace; font-size: 15px; line-height: 16.5px; white-space: pre; background-color: #eeeeee;\">=</span><span class=\"value\" style=\"box-sizing: border-box; color: #dd1144; font-family: source-code-pro, Consolas, monospace; font-size: 15px; line-height: 16.5px; white-space: pre; background-color: #eeeeee;\">\"//code.jquery.com/ui/1.11.3/themes/smoothness/jquery-ui.css\"</span><span style=\"color: #000080; font-family: source-code-pro, Consolas, monospace; font-size: 15px; line-height: 16.5px; white-space: pre; background-color: #eeeeee;\">&gt;</span></p>\r\n<p style=\"font-size: 12.1599998474121px; line-height: 15.8079996109009px;\"><span style=\"font-family: courier new, courier, monospace;\"> <span class=\"tag\" style=\"box-sizing: border-box; color: #000080; font-family: source-code-pro, Consolas, monospace; font-size: 15px; line-height: 16.5px; white-space: pre; background-color: #eeeeee;\">&lt;<span class=\"title\" style=\"box-sizing: border-box;\">script</span> <span class=\"attribute\" style=\"box-sizing: border-box; color: #008080;\">src</span>=<span class=\"value\" style=\"box-sizing: border-box; color: #dd1144;\">\"//code.jquery.com/ui/1.11.3/jquery-ui.js\"</span>&gt;</span><span class=\"tag\" style=\"box-sizing: border-box; color: #000080; font-family: source-code-pro, Consolas, monospace; font-size: 15px; line-height: 16.5px; white-space: pre; background-color: #eeeeee;\">&lt;/<span class=\"title\" style=\"box-sizing: border-box;\">script</span>&gt;</span></span></p>\r\n<p style=\"font-size: 12.1599998474121px; line-height: 15.8079996109009px;\"><span style=\"font-family: courier new, courier, monospace;\">&lt;script src=\"my_js/jquery.numeric.js\"&gt;&lt;/script&gt;</span></p>\r\n<p style=\"font-size: 12.1599998474121px; line-height: 15.8079996109009px;\"><span style=\"font-family: courier new, courier, monospace;\">&lt;script src=\"my_js/general.js\"&gt;&lt;/script&gt;</span></p>\r\n<p class=\"my_p\"><label><span style=\"font-family: courier new, courier, monospace;\">&lt;script src=\"my_js/jquery.sumoselect.js\"&gt;&lt;/script&gt;<br />&lt;script language=\"javascript\" src=\"my_js/supervision.js\" type=\"text/javascript\"&gt;</span></label></p>\r\n<p class=\"my_p\"> </p>\r\n<p class=\"my_p\"> </p>\r\n<p class=\"my_p\"><span style=\"font-family: \'courier new\', courier, monospace;\">   &lt;link href=\"</span><span style=\"font-family: Consolas, MingLiU, \'Courier New\', monospace; font-size: 15px; line-height: 21px; background-color: #eeeeee;\">my_css/</span><span style=\"font-family: \'courier new\', courier, monospace; font-size: 12.1599998474121px; line-height: 1.3em;\">sumoselect.css\" rel=\"stylesheet\" /&gt;</span></p>\r\n<p class=\"my_p\"><span style=\"font-family: \'courier new\', courier, monospace;\">   &lt;style type=\"text/css\"&gt;</span></p>\r\n<p class=\"my_p\"><span style=\"font-family: \'courier new\', courier, monospace;\">        p,div,ul,li{padding:0px; margin:0px;}</span></p>\r\n<p class=\"my_p\"> </p>\r\n<p class=\"my_p\"><span style=\"font-family: \'courier new\', courier, monospace;\">    &lt;/style&gt;</span></p>\r\n<p> </p>\r\n<p class=\"my_p\"><label><span style=\"font-family: courier new, courier, monospace;\"> // You can place JavaScript like this<br /> <br />&lt;/script&gt;</span></label></p>\r\n<p class=\"my_p\"> </p>\r\n<p class=\"my_p\"><span style=\"font-family: Consolas, MingLiU, \'Courier New\', monospace; font-size: 15px; line-height: 21px; background-color: #eeeeee;\">&lt;link rel=\"stylesheet\" href=\"my_css/personal_style.css\" type=\"text/css\"&gt;</span></p>\r\n<p class=\"my_p\"><label><span style=\"font-family: courier new, courier, monospace;\"><br /></span>{/source}</label></p>\r\n<form id=\"form_supervision\" class=\"per-form\" action=\"../../php/supervision.php\" method=\"post\" name=\"form_supervision\"><hr />\r\n<div>\r\n<div>\r\n<p class=\"my_p\"><label>Fecha</label></p>\r\n<input name=\"dat_fecha\" required=\"\" type=\"text\" /> <br />\r\n<p class=\"my_p\"><label>Ruta</label></p>\r\n<select id=\"sel_ruta\" name=\"sel_ruta\">\r\n<option disabled=\"disabled\" selected=\"selected\" value=\"-1\">Seleccione...</option>\r\n</select></div>\r\n<div>\r\n<p class=\"my_p\"><label>Ciudad</label></p>\r\n<input title=\"ingrese la ciudad\" name=\"tex_ciudad\" required=\"\" type=\"text\" /> <br />\r\n<p class=\"my_p\"><label>Sector</label></p>\r\n<input title=\"ingrese el sector\" name=\"tex_sector\" required=\"\" type=\"text\" />\r\n<p class=\"my_p\"><label>Supervisor</label></p>\r\n<select id=\"sel_supervisor\" name=\"sel_supervisor\">\r\n<option selected=\"selected\" value=\"-1\">Seleccione...</option>\r\n</select></div>\r\n</div>\r\n<p id=\"img_agregar\"> </p>\r\n<div class=\"div_table\">\r\n<table id=\"tab_supervisiones\" class=\"per-table\" cellspacing=\"0px\">\r\n<thead>\r\n<tr><th>Item</th><th>Nombre del PDV</th><th>Fecha Ult. Sup.</th><th>Fecha Ult. Venta</th><th>Monto Ult. Venta</th><th>Productos</th><th> </th></tr>\r\n</thead>\r\n</table>\r\n</div>\r\n<hr /><input disabled=\"disabled\" name=\"sub_guardar\" type=\"submit\" value=\"Guardar\" /></form>','',1,2,'2015-02-26 14:08:52',961,'','2015-03-06 15:36:53',961,0,'0000-00-00 00:00:00','2015-02-26 14:08:52','0000-00-00 00:00:00','{\"image_intro\":\"\",\"float_intro\":\"\",\"image_intro_alt\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}','{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}','{\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_layout\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}',63,4,'','',2,158,'{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}',0,'*',''),(10,69,'Fianza','fianza','<p>{source}<span style=\"font-family: courier new, courier, monospace;\"><br />&lt;!-- You can place html anywhere within the source tags --&gt;<br /></span></p>\r\n<p style=\"font-size: 12.1599998474121px; line-height: 15.8079996109009px;\"> <span style=\"font-size: 12.1599998474121px; line-height: 15.8079996109009px;\"> </span><span style=\"color: #000080; font-family: source-code-pro, Consolas, monospace; font-size: 15px; line-height: 16.5px; white-space: pre; background-color: #eeeeee;\">&lt;</span><span class=\"title\" style=\"box-sizing: border-box; color: #000080; font-family: source-code-pro, Consolas, monospace; font-size: 15px; line-height: 16.5px; white-space: pre; background-color: #eeeeee;\">link</span><span style=\"font-family: \'courier new\', courier, monospace; font-size: 12.1599998474121px; line-height: 15.8079996109009px;\"> </span><span class=\"attribute\" style=\"box-sizing: border-box; color: #008080; font-family: source-code-pro, Consolas, monospace; font-size: 15px; line-height: 16.5px; white-space: pre; background-color: #eeeeee;\">rel</span><span style=\"color: #000080; font-family: source-code-pro, Consolas, monospace; font-size: 15px; line-height: 16.5px; white-space: pre; background-color: #eeeeee;\">=</span><span class=\"value\" style=\"box-sizing: border-box; color: #dd1144; font-family: source-code-pro, Consolas, monospace; font-size: 15px; line-height: 16.5px; white-space: pre; background-color: #eeeeee;\">\"stylesheet\"</span><span style=\"font-family: \'courier new\', courier, monospace; font-size: 12.1599998474121px; line-height: 15.8079996109009px;\"> </span><span class=\"attribute\" style=\"box-sizing: border-box; color: #008080; font-family: source-code-pro, Consolas, monospace; font-size: 15px; line-height: 16.5px; white-space: pre; background-color: #eeeeee;\">href</span><span style=\"color: #000080; font-family: source-code-pro, Consolas, monospace; font-size: 15px; line-height: 16.5px; white-space: pre; background-color: #eeeeee;\">=</span><span class=\"value\" style=\"box-sizing: border-box; color: #dd1144; font-family: source-code-pro, Consolas, monospace; font-size: 15px; line-height: 16.5px; white-space: pre; background-color: #eeeeee;\">\"//code.jquery.com/ui/1.11.3/themes/smoothness/jquery-ui.css\"</span><span style=\"color: #000080; font-family: source-code-pro, Consolas, monospace; font-size: 15px; line-height: 16.5px; white-space: pre; background-color: #eeeeee;\">&gt;</span></p>\r\n<p style=\"font-size: 12.1599998474121px; line-height: 15.8079996109009px;\"><span style=\"font-family: courier new, courier, monospace;\"> <span class=\"tag\" style=\"box-sizing: border-box; color: #000080; font-family: source-code-pro, Consolas, monospace; font-size: 15px; line-height: 16.5px; white-space: pre; background-color: #eeeeee;\">&lt;<span class=\"title\" style=\"box-sizing: border-box;\">script</span> <span class=\"attribute\" style=\"box-sizing: border-box; color: #008080;\">src</span>=<span class=\"value\" style=\"box-sizing: border-box; color: #dd1144;\">\"//code.jquery.com/ui/1.11.3/jquery-ui.js\"</span>&gt;</span><span class=\"tag\" style=\"box-sizing: border-box; color: #000080; font-family: source-code-pro, Consolas, monospace; font-size: 15px; line-height: 16.5px; white-space: pre; background-color: #eeeeee;\">&lt;/<span class=\"title\" style=\"box-sizing: border-box;\">script</span>&gt;</span></span></p>\r\n<p style=\"font-size: 12.1599998474121px; line-height: 15.8079996109009px;\"><span style=\"font-family: courier new, courier, monospace;\"><span class=\"tag\" style=\"box-sizing: border-box; color: #000080; font-family: source-code-pro, Consolas, monospace; font-size: 15px; line-height: 16.5px; white-space: pre; background-color: #eeeeee;\"><span style=\"color: #333333; font-family: \'courier new\', courier, monospace; font-size: 12.1599998474121px; line-height: 15.8079996109009px; white-space: normal; background-color: #ffffff;\"> </span><span class=\"tag\" style=\"box-sizing: border-box; color: #000080; font-family: source-code-pro, Consolas, monospace; font-size: 15px; line-height: 16.5px; white-space: pre; background-color: #eeeeee;\">&lt;<span class=\"title\" style=\"box-sizing: border-box;\">script</span> <span class=\"attribute\" style=\"box-sizing: border-box; color: #008080;\">src</span>=<span class=\"value\" style=\"box-sizing: border-box; color: #dd1144;\">\"https://jquery-ui.googlecode.com/svn-history/r3982/trunk/ui/i18n/jquery.ui.datepicker-es.js\"</span>&gt;</span><span class=\"tag\" style=\"box-sizing: border-box; color: #000080; font-family: source-code-pro, Consolas, monospace; font-size: 15px; line-height: 16.5px; white-space: pre; background-color: #eeeeee;\">&lt;/<span class=\"title\" style=\"box-sizing: border-box;\">script</span>&gt;</span></span></span></p>\r\n<p> </p>\r\n<p style=\"font-size: 12.1599998474121px; line-height: 15.8079996109009px;\"><span style=\"font-family: courier new, courier, monospace;\">&lt;script src=\"my_js/jquery.numeric.js\"&gt;&lt;/script&gt;</span></p>\r\n<p style=\"font-size: 12.1599998474121px; line-height: 15.8079996109009px;\"><span style=\"font-family: courier new, courier, monospace;\">&lt;script src=\"my_js/general.js\"&gt;&lt;/script&gt;</span></p>\r\n<p><span style=\"font-family: courier new, courier, monospace;\"><br />&lt;script language=\"javascript\" src=\"my_js/fianza.js\" type=\"text/javascript\"&gt;<br /> // You can place JavaScript like this<br /> <br />&lt;/script&gt;<br /><span style=\"font-family: Consolas, MingLiU, \'Courier New\', monospace; font-size: 15px; line-height: 21px; background-color: #eeeeee;\">&lt;link rel=\"stylesheet\" href=\"my_css/personal_style.css\" type=\"text/css\"&gt;</span><br /></span>{/source}</p>\r\n<hr /><form id=\"form_fianza\" class=\"per-form\" action=\"../../php/fianza.php\" method=\"POST\">\r\n<div>\r\n<div>\r\n<p class=\"my_p\"><label>Vendedor</label></p>\r\n<select id=\"sel_dti\" name=\"sel_dti\">\r\n<option selected=\"selected\" value=\"-1\">Seleccione..</option>\r\n</select><br />\r\n<p class=\"my_p\"><label>Mes de la comision</label></p>\r\n<input name=\"dat_fecha_comision\" required=\"\" type=\"text\" /><br />\r\n<p class=\"my_p\"><label>Monto Comision</label></p>\r\n<input name=\"tex_monto\" required=\"\" type=\"text\" /></div>\r\n</div>\r\n<hr /><input type=\"submit\" value=\"Guardar\" /></form>','',1,2,'2015-02-27 18:40:43',961,'','2015-03-06 15:36:13',961,0,'0000-00-00 00:00:00','2015-02-27 18:40:43','0000-00-00 00:00:00','{\"image_intro\":\"\",\"float_intro\":\"\",\"image_intro_alt\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}','{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}','{\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_layout\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}',33,3,'','',2,64,'{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}',0,'*',''),(11,70,'Construcción','construccion','<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"images/my_img/construccion.jpg\" alt=\"\" width=\"712\" height=\"533\" /></p>','',1,2,'2015-02-27 20:44:26',961,'','2015-02-27 20:47:38',961,0,'0000-00-00 00:00:00','2015-02-27 20:44:26','0000-00-00 00:00:00','{\"image_intro\":\"\",\"float_intro\":\"\",\"image_intro_alt\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}','{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}','{\"show_title\":\"0\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_layout\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}',5,2,'','',1,6,'{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}',0,'*',''),(12,71,'Pasivos Laborales','pasivos-laborales','<p>{source}</p>\r\n<p> <span style=\"font-size: 12.1599998474121px; line-height: 15.8079996109009px;\"> </span><span style=\"font-size: 12.1599998474121px; line-height: 15.8079996109009px;\"> </span><span style=\"color: #000080; font-family: source-code-pro, Consolas, monospace; font-size: 15px; line-height: 16.5px; white-space: pre; background-color: #eeeeee;\">&lt;</span><span class=\"title\" style=\"box-sizing: border-box; color: #000080; font-family: source-code-pro, Consolas, monospace; font-size: 15px; line-height: 16.5px; white-space: pre; background-color: #eeeeee;\">link</span><span style=\"font-family: \'courier new\', courier, monospace; font-size: 12.1599998474121px; line-height: 15.8079996109009px;\"> </span><span class=\"attribute\" style=\"box-sizing: border-box; color: #008080; font-family: source-code-pro, Consolas, monospace; font-size: 15px; line-height: 16.5px; white-space: pre; background-color: #eeeeee;\">rel</span><span style=\"color: #000080; font-family: source-code-pro, Consolas, monospace; font-size: 15px; line-height: 16.5px; white-space: pre; background-color: #eeeeee;\">=</span><span class=\"value\" style=\"box-sizing: border-box; color: #dd1144; font-family: source-code-pro, Consolas, monospace; font-size: 15px; line-height: 16.5px; white-space: pre; background-color: #eeeeee;\">\"stylesheet\"</span><span style=\"font-family: \'courier new\', courier, monospace; font-size: 12.1599998474121px; line-height: 15.8079996109009px;\"> </span><span class=\"attribute\" style=\"box-sizing: border-box; color: #008080; font-family: source-code-pro, Consolas, monospace; font-size: 15px; line-height: 16.5px; white-space: pre; background-color: #eeeeee;\">href</span><span style=\"color: #000080; font-family: source-code-pro, Consolas, monospace; font-size: 15px; line-height: 16.5px; white-space: pre; background-color: #eeeeee;\">=</span><span class=\"value\" style=\"box-sizing: border-box; color: #dd1144; font-family: source-code-pro, Consolas, monospace; font-size: 15px; line-height: 16.5px; white-space: pre; background-color: #eeeeee;\">\"//code.jquery.com/ui/1.11.3/themes/smoothness/jquery-ui.css\"</span><span style=\"color: #000080; font-family: source-code-pro, Consolas, monospace; font-size: 15px; line-height: 16.5px; white-space: pre; background-color: #eeeeee;\">&gt;</span></p>\r\n<p style=\"font-size: 12.1599998474121px; line-height: 15.8079996109009px;\"><span style=\"font-family: courier new, courier, monospace;\"> <span class=\"tag\" style=\"box-sizing: border-box; color: #000080; font-family: source-code-pro, Consolas, monospace; font-size: 15px; line-height: 16.5px; white-space: pre; background-color: #eeeeee;\">&lt;<span class=\"title\" style=\"box-sizing: border-box;\">script</span> <span class=\"attribute\" style=\"box-sizing: border-box; color: #008080;\">src</span>=<span class=\"value\" style=\"box-sizing: border-box; color: #dd1144;\">\"//code.jquery.com/ui/1.11.3/jquery-ui.js\"</span>&gt;</span><span class=\"tag\" style=\"box-sizing: border-box; color: #000080; font-family: source-code-pro, Consolas, monospace; font-size: 15px; line-height: 16.5px; white-space: pre; background-color: #eeeeee;\">&lt;/<span class=\"title\" style=\"box-sizing: border-box;\">script</span>&gt;</span></span></p>\r\n<p style=\"font-size: 12.1599998474121px; line-height: 15.8079996109009px;\"><span style=\"font-family: courier new, courier, monospace;\"><span class=\"tag\" style=\"box-sizing: border-box; color: #000080; font-family: source-code-pro, Consolas, monospace; font-size: 15px; line-height: 16.5px; white-space: pre; background-color: #eeeeee;\"><span style=\"color: #333333; font-family: \'courier new\', courier, monospace; font-size: 12.1599998474121px; line-height: 15.8079996109009px; white-space: normal; background-color: #ffffff;\"> </span><span class=\"tag\" style=\"box-sizing: border-box; color: #000080; font-family: source-code-pro, Consolas, monospace; font-size: 15px; line-height: 16.5px; white-space: pre; background-color: #eeeeee;\">&lt;<span class=\"title\" style=\"box-sizing: border-box;\">script</span> <span class=\"attribute\" style=\"box-sizing: border-box; color: #008080;\">src</span>=<span class=\"value\" style=\"box-sizing: border-box; color: #dd1144;\">\"https://jquery-ui.googlecode.com/svn-history/r3982/trunk/ui/i18n/jquery.ui.datepicker-es.js\"</span>&gt;</span><span class=\"tag\" style=\"box-sizing: border-box; color: #000080; font-family: source-code-pro, Consolas, monospace; font-size: 15px; line-height: 16.5px; white-space: pre; background-color: #eeeeee;\">&lt;/<span class=\"title\" style=\"box-sizing: border-box;\">script</span>&gt;</span></span></span></p>\r\n<p style=\"font-size: 12.1599998474121px; line-height: 15.8079996109009px;\"> </p>\r\n<p style=\"font-size: 12.1599998474121px; line-height: 15.8079996109009px;\"><span style=\"font-family: courier new, courier, monospace;\">&lt;script src=\"my_js/jquery.numeric.js\"&gt;&lt;/script&gt;</span></p>\r\n<p style=\"font-size: 12.1599998474121px; line-height: 15.8079996109009px;\"><span style=\"font-family: courier new, courier, monospace;\">&lt;script src=\"my_js/general.js\"&gt;&lt;/script&gt;</span></p>\r\n<p><span style=\"font-family: courier new, courier, monospace;\"> </span></p>\r\n<p>&lt;link rel=\"stylesheet\" href=\"my_css/personal_style.css\" type=\"text/css\"&gt;</p>\r\n<p> &lt;script src=\"my_js/pasivos_laborales.js\"&gt;&lt;/script&gt;</p>\r\n<!-- You can place html anywhere within the source tags -->\r\n<p>{/source}</p>\r\n<hr /><form id=\"form_pasivos\" class=\"per-form\" action=\"../../php/pasivos_laborales.php\" method=\"POST\">\r\n<div>\r\n<div>\r\n<p class=\"my_p\"><label>Empleado</label></p>\r\n<select id=\"sel_empleado\" name=\"sel_empleado\">\r\n<option selected=\"selected\" value=\"-1\">Seleccione..</option>\r\n</select><br />\r\n<p class=\"my_p\"><label>Mes</label></p>\r\n<input name=\"dat_mes\" readonly=\"readonly\" required=\"\" type=\"text\" /><br />\r\n<p class=\"my_p\"><label>Sueldo</label></p>\r\n<input name=\"tex_sueldo\" required=\"\" type=\"text\" /><br />\r\n<p class=\"my_p\"><label>Comision</label></p>\r\n<input name=\"tex_comision\" required=\"\" type=\"text\" /></div>\r\n<div>\r\n<p class=\"my_p\"><label>Bono Vacacional</label></p>\r\n<input name=\"tex_vacacional\" required=\"\" type=\"text\" /><br />\r\n<p class=\"my_p\"><label>Utilidades</label></p>\r\n<input name=\"tex_utilidades\" required=\"\" type=\"text\" /> <br />\r\n<p class=\"my_p\"><label>Días de Salario</label></p>\r\n<input name=\"tex_dias\" required=\"\" type=\"text\" /></div>\r\n</div>\r\n<hr /><input type=\"submit\" value=\"Guardar\" /></form>','',1,2,'2015-03-02 13:49:44',961,'','2015-03-06 15:34:30',961,0,'0000-00-00 00:00:00','2015-03-02 13:49:44','0000-00-00 00:00:00','{\"image_intro\":\"\",\"float_intro\":\"\",\"image_intro_alt\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}','{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}','{\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_layout\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}',26,1,'','',2,42,'{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}',0,'*',''),(13,72,'Subir Archivos','subir-archivos','<p>{source}</p>\r\n<p> </p>\r\n<p>&lt;link rel=\"stylesheet\" href=\"my_css/personal_style.css\" type=\"text/css\"&gt;</p>\r\n<p> </p>\r\n<!-- You can place html anywhere within the source tags -->\r\n<p>{/source}</p>\r\n<hr /><form class=\"per-form\" action=\"../php/subir_archivos.php\" enctype=\"multipart/form-data\" method=\"post\">\r\n<div>\r\n<div>\r\n<p><label>Proceso:</label></p>\r\n<select id=\"sel_proceso\" name=\"sel_proceso\">\r\n<option value=\"-1\">Seleccione...</option>\r\n</select><input name=\"MAX_FILE_SIZE\" type=\"hidden\" value=\"100000\" /> <br /> <br />\r\n<p><label>Enviar un nuevo archivo:</label></p>\r\n<input name=\"userfile\" type=\"file\" /></div>\r\n</div>\r\n<input type=\"submit\" value=\"Enviar\" /></form>','',1,2,'2015-03-02 16:50:43',961,'','2015-03-05 18:33:44',961,0,'0000-00-00 00:00:00','2015-03-02 16:50:43','0000-00-00 00:00:00','{\"image_intro\":\"\",\"float_intro\":\"\",\"image_intro_alt\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}','{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}','{\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_layout\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}',13,0,'','',2,17,'{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}',0,'*','');
/*!40000 ALTER TABLE `mmov_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mmov_content_frontpage`
--

DROP TABLE IF EXISTS `mmov_content_frontpage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmov_content_frontpage` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mmov_content_frontpage`
--

LOCK TABLES `mmov_content_frontpage` WRITE;
/*!40000 ALTER TABLE `mmov_content_frontpage` DISABLE KEYS */;
/*!40000 ALTER TABLE `mmov_content_frontpage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mmov_content_rating`
--

DROP TABLE IF EXISTS `mmov_content_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmov_content_rating` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `rating_sum` int(10) unsigned NOT NULL DEFAULT '0',
  `rating_count` int(10) unsigned NOT NULL DEFAULT '0',
  `lastip` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mmov_content_rating`
--

LOCK TABLES `mmov_content_rating` WRITE;
/*!40000 ALTER TABLE `mmov_content_rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `mmov_content_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mmov_content_types`
--

DROP TABLE IF EXISTS `mmov_content_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmov_content_types` (
  `type_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type_title` varchar(255) NOT NULL DEFAULT '',
  `type_alias` varchar(255) NOT NULL DEFAULT '',
  `table` varchar(255) NOT NULL DEFAULT '',
  `rules` text NOT NULL,
  `field_mappings` text NOT NULL,
  `router` varchar(255) NOT NULL DEFAULT '',
  `content_history_options` varchar(5120) DEFAULT NULL COMMENT 'JSON string for com_contenthistory options',
  PRIMARY KEY (`type_id`),
  KEY `idx_alias` (`type_alias`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mmov_content_types`
--

LOCK TABLES `mmov_content_types` WRITE;
/*!40000 ALTER TABLE `mmov_content_types` DISABLE KEYS */;
INSERT INTO `mmov_content_types` VALUES (1,'Article','com_content.article','{\"special\":{\"dbtable\":\"#__content\",\"key\":\"id\",\"type\":\"Content\",\"prefix\":\"JTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}','','{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"state\",\"core_alias\":\"alias\",\"core_created_time\":\"created\",\"core_modified_time\":\"modified\",\"core_body\":\"introtext\", \"core_hits\":\"hits\",\"core_publish_up\":\"publish_up\",\"core_publish_down\":\"publish_down\",\"core_access\":\"access\", \"core_params\":\"attribs\", \"core_featured\":\"featured\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"images\", \"core_urls\":\"urls\", \"core_version\":\"version\", \"core_ordering\":\"ordering\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"catid\", \"core_xreference\":\"xreference\", \"asset_id\":\"asset_id\"}, \"special\":{\"fulltext\":\"fulltext\"}}','ContentHelperRoute::getArticleRoute','{\"formFile\":\"administrator\\/components\\/com_content\\/models\\/forms\\/article.xml\", \"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\"],\"ignoreChanges\":[\"modified_by\", \"modified\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\"],\"convertToInt\":[\"publish_up\", \"publish_down\", \"featured\", \"ordering\"],\"displayLookup\":[{\"sourceColumn\":\"catid\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"created_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"} ]}'),(2,'Weblink','com_weblinks.weblink','{\"special\":{\"dbtable\":\"#__weblinks\",\"key\":\"id\",\"type\":\"Weblink\",\"prefix\":\"WeblinksTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}','','{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"state\",\"core_alias\":\"alias\",\"core_created_time\":\"created\",\"core_modified_time\":\"modified\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"publish_up\",\"core_publish_down\":\"publish_down\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"featured\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"images\", \"core_urls\":\"urls\", \"core_version\":\"version\", \"core_ordering\":\"ordering\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"catid\", \"core_xreference\":\"xreference\", \"asset_id\":\"null\"}, \"special\":{}}','WeblinksHelperRoute::getWeblinkRoute','{\"formFile\":\"administrator\\/components\\/com_weblinks\\/models\\/forms\\/weblink.xml\", \"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\",\"featured\",\"images\"], \"ignoreChanges\":[\"modified_by\", \"modified\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\"], \"convertToInt\":[\"publish_up\", \"publish_down\", \"featured\", \"ordering\"], \"displayLookup\":[{\"sourceColumn\":\"catid\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"created_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"} ]}'),(3,'Contact','com_contact.contact','{\"special\":{\"dbtable\":\"#__contact_details\",\"key\":\"id\",\"type\":\"Contact\",\"prefix\":\"ContactTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}','','{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"name\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created\",\"core_modified_time\":\"modified\",\"core_body\":\"address\", \"core_hits\":\"hits\",\"core_publish_up\":\"publish_up\",\"core_publish_down\":\"publish_down\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"featured\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"image\", \"core_urls\":\"webpage\", \"core_version\":\"version\", \"core_ordering\":\"ordering\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"catid\", \"core_xreference\":\"xreference\", \"asset_id\":\"null\"}, \"special\":{\"con_position\":\"con_position\",\"suburb\":\"suburb\",\"state\":\"state\",\"country\":\"country\",\"postcode\":\"postcode\",\"telephone\":\"telephone\",\"fax\":\"fax\",\"misc\":\"misc\",\"email_to\":\"email_to\",\"default_con\":\"default_con\",\"user_id\":\"user_id\",\"mobile\":\"mobile\",\"sortname1\":\"sortname1\",\"sortname2\":\"sortname2\",\"sortname3\":\"sortname3\"}}','ContactHelperRoute::getContactRoute','{\"formFile\":\"administrator\\/components\\/com_contact\\/models\\/forms\\/contact.xml\",\"hideFields\":[\"default_con\",\"checked_out\",\"checked_out_time\",\"version\",\"xreference\"],\"ignoreChanges\":[\"modified_by\", \"modified\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\"],\"convertToInt\":[\"publish_up\", \"publish_down\", \"featured\", \"ordering\"], \"displayLookup\":[ {\"sourceColumn\":\"created_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"catid\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"} ] }'),(4,'Newsfeed','com_newsfeeds.newsfeed','{\"special\":{\"dbtable\":\"#__newsfeeds\",\"key\":\"id\",\"type\":\"Newsfeed\",\"prefix\":\"NewsfeedsTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}','','{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"name\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created\",\"core_modified_time\":\"modified\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"publish_up\",\"core_publish_down\":\"publish_down\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"featured\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"images\", \"core_urls\":\"link\", \"core_version\":\"version\", \"core_ordering\":\"ordering\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"catid\", \"core_xreference\":\"xreference\", \"asset_id\":\"null\"}, \"special\":{\"numarticles\":\"numarticles\",\"cache_time\":\"cache_time\",\"rtl\":\"rtl\"}}','NewsfeedsHelperRoute::getNewsfeedRoute','{\"formFile\":\"administrator\\/components\\/com_newsfeeds\\/models\\/forms\\/newsfeed.xml\",\"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\"],\"ignoreChanges\":[\"modified_by\", \"modified\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\"],\"convertToInt\":[\"publish_up\", \"publish_down\", \"featured\", \"ordering\"],\"displayLookup\":[{\"sourceColumn\":\"catid\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"created_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"} ]}'),(5,'User','com_users.user','{\"special\":{\"dbtable\":\"#__users\",\"key\":\"id\",\"type\":\"User\",\"prefix\":\"JTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}','','{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"name\",\"core_state\":\"null\",\"core_alias\":\"username\",\"core_created_time\":\"registerdate\",\"core_modified_time\":\"lastvisitDate\",\"core_body\":\"null\", \"core_hits\":\"null\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"access\":\"null\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"null\", \"core_language\":\"null\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"null\", \"core_ordering\":\"null\", \"core_metakey\":\"null\", \"core_metadesc\":\"null\", \"core_catid\":\"null\", \"core_xreference\":\"null\", \"asset_id\":\"null\"}, \"special\":{}}','UsersHelperRoute::getUserRoute',''),(6,'Article Category','com_content.category','{\"special\":{\"dbtable\":\"#__categories\",\"key\":\"id\",\"type\":\"Category\",\"prefix\":\"JTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}','','{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"parent_id\", \"core_xreference\":\"null\", \"asset_id\":\"asset_id\"}, \"special\":{\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\",\"extension\":\"extension\",\"note\":\"note\"}}','ContentHelperRoute::getCategoryRoute','{\"formFile\":\"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml\", \"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\",\"lft\",\"rgt\",\"level\",\"path\",\"extension\"], \"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"],\"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"parent_id\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}]}'),(7,'Contact Category','com_contact.category','{\"special\":{\"dbtable\":\"#__categories\",\"key\":\"id\",\"type\":\"Category\",\"prefix\":\"JTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}','','{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"parent_id\", \"core_xreference\":\"null\", \"asset_id\":\"asset_id\"}, \"special\":{\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\",\"extension\":\"extension\",\"note\":\"note\"}}','ContactHelperRoute::getCategoryRoute','{\"formFile\":\"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml\", \"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\",\"lft\",\"rgt\",\"level\",\"path\",\"extension\"], \"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"],\"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"parent_id\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}]}'),(8,'Newsfeeds Category','com_newsfeeds.category','{\"special\":{\"dbtable\":\"#__categories\",\"key\":\"id\",\"type\":\"Category\",\"prefix\":\"JTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}','','{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"parent_id\", \"core_xreference\":\"null\", \"asset_id\":\"asset_id\"}, \"special\":{\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\",\"extension\":\"extension\",\"note\":\"note\"}}','NewsfeedsHelperRoute::getCategoryRoute','{\"formFile\":\"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml\", \"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\",\"lft\",\"rgt\",\"level\",\"path\",\"extension\"], \"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"],\"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"parent_id\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}]}'),(9,'Weblinks Category','com_weblinks.category','{\"special\":{\"dbtable\":\"#__categories\",\"key\":\"id\",\"type\":\"Category\",\"prefix\":\"JTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}','','{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"parent_id\", \"core_xreference\":\"null\", \"asset_id\":\"asset_id\"}, \"special\":{\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\",\"extension\":\"extension\",\"note\":\"note\"}}','WeblinksHelperRoute::getCategoryRoute','{\"formFile\":\"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml\", \"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\",\"lft\",\"rgt\",\"level\",\"path\",\"extension\"], \"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"],\"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"parent_id\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}]}'),(10,'Tag','com_tags.tag','{\"special\":{\"dbtable\":\"#__tags\",\"key\":\"tag_id\",\"type\":\"Tag\",\"prefix\":\"TagsTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}','','{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"featured\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"images\", \"core_urls\":\"urls\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"null\", \"core_xreference\":\"null\", \"asset_id\":\"null\"}, \"special\":{\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\"}}','TagsHelperRoute::getTagRoute','{\"formFile\":\"administrator\\/components\\/com_tags\\/models\\/forms\\/tag.xml\", \"hideFields\":[\"checked_out\",\"checked_out_time\",\"version\", \"lft\", \"rgt\", \"level\", \"path\", \"urls\", \"publish_up\", \"publish_down\"],\"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"],\"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}, {\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}, {\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}]}'),(11,'Banner','com_banners.banner','{\"special\":{\"dbtable\":\"#__banners\",\"key\":\"id\",\"type\":\"Banner\",\"prefix\":\"BannersTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}','','{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"name\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created\",\"core_modified_time\":\"modified\",\"core_body\":\"description\", \"core_hits\":\"null\",\"core_publish_up\":\"publish_up\",\"core_publish_down\":\"publish_down\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"images\", \"core_urls\":\"link\", \"core_version\":\"version\", \"core_ordering\":\"ordering\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"catid\", \"core_xreference\":\"null\", \"asset_id\":\"null\"}, \"special\":{\"imptotal\":\"imptotal\", \"impmade\":\"impmade\", \"clicks\":\"clicks\", \"clickurl\":\"clickurl\", \"custombannercode\":\"custombannercode\", \"cid\":\"cid\", \"purchase_type\":\"purchase_type\", \"track_impressions\":\"track_impressions\", \"track_clicks\":\"track_clicks\"}}','','{\"formFile\":\"administrator\\/components\\/com_banners\\/models\\/forms\\/banner.xml\", \"hideFields\":[\"checked_out\",\"checked_out_time\",\"version\", \"reset\"],\"ignoreChanges\":[\"modified_by\", \"modified\", \"checked_out\", \"checked_out_time\", \"version\", \"imptotal\", \"impmade\", \"reset\"], \"convertToInt\":[\"publish_up\", \"publish_down\", \"ordering\"], \"displayLookup\":[{\"sourceColumn\":\"catid\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}, {\"sourceColumn\":\"cid\",\"targetTable\":\"#__banner_clients\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}, {\"sourceColumn\":\"created_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"modified_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"} ]}'),(12,'Banners Category','com_banners.category','{\"special\":{\"dbtable\":\"#__categories\",\"key\":\"id\",\"type\":\"Category\",\"prefix\":\"JTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}','','{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"parent_id\", \"core_xreference\":\"null\", \"asset_id\":\"asset_id\"}, \"special\": {\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\",\"extension\":\"extension\",\"note\":\"note\"}}','','{\"formFile\":\"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml\", \"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\",\"lft\",\"rgt\",\"level\",\"path\",\"extension\"], \"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"], \"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"parent_id\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}]}'),(13,'Banner Client','com_banners.client','{\"special\":{\"dbtable\":\"#__banner_clients\",\"key\":\"id\",\"type\":\"Client\",\"prefix\":\"BannersTable\"}}','','','','{\"formFile\":\"administrator\\/components\\/com_banners\\/models\\/forms\\/client.xml\", \"hideFields\":[\"checked_out\",\"checked_out_time\"], \"ignoreChanges\":[\"checked_out\", \"checked_out_time\"], \"convertToInt\":[], \"displayLookup\":[]}'),(14,'User Notes','com_users.note','{\"special\":{\"dbtable\":\"#__user_notes\",\"key\":\"id\",\"type\":\"Note\",\"prefix\":\"UsersTable\"}}','','','','{\"formFile\":\"administrator\\/components\\/com_users\\/models\\/forms\\/note.xml\", \"hideFields\":[\"checked_out\",\"checked_out_time\", \"publish_up\", \"publish_down\"],\"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\"], \"convertToInt\":[\"publish_up\", \"publish_down\"],\"displayLookup\":[{\"sourceColumn\":\"catid\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}, {\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}, {\"sourceColumn\":\"user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}, {\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}]}'),(15,'User Notes Category','com_users.category','{\"special\":{\"dbtable\":\"#__categories\",\"key\":\"id\",\"type\":\"Category\",\"prefix\":\"JTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}','','{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"parent_id\", \"core_xreference\":\"null\", \"asset_id\":\"asset_id\"}, \"special\":{\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\",\"extension\":\"extension\",\"note\":\"note\"}}','','{\"formFile\":\"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml\", \"hideFields\":[\"checked_out\",\"checked_out_time\",\"version\",\"lft\",\"rgt\",\"level\",\"path\",\"extension\"], \"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"], \"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}, {\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"parent_id\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}]}'),(16,'BreezingForms','com_breezingforms.form','','','','BreezingformsHelperRoute::getFormRoute',NULL);
/*!40000 ALTER TABLE `mmov_content_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mmov_contentitem_tag_map`
--

DROP TABLE IF EXISTS `mmov_contentitem_tag_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmov_contentitem_tag_map` (
  `type_alias` varchar(255) NOT NULL DEFAULT '',
  `core_content_id` int(10) unsigned NOT NULL COMMENT 'PK from the core content table',
  `content_item_id` int(11) NOT NULL COMMENT 'PK from the content type table',
  `tag_id` int(10) unsigned NOT NULL COMMENT 'PK from the tag table',
  `tag_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Date of most recent save for this tag-item',
  `type_id` mediumint(8) NOT NULL COMMENT 'PK from the content_type table',
  UNIQUE KEY `uc_ItemnameTagid` (`type_id`,`content_item_id`,`tag_id`),
  KEY `idx_tag_type` (`tag_id`,`type_id`),
  KEY `idx_date_id` (`tag_date`,`tag_id`),
  KEY `idx_tag` (`tag_id`),
  KEY `idx_type` (`type_id`),
  KEY `idx_core_content_id` (`core_content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Maps items from content tables to tags';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mmov_contentitem_tag_map`
--

LOCK TABLES `mmov_contentitem_tag_map` WRITE;
/*!40000 ALTER TABLE `mmov_contentitem_tag_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `mmov_contentitem_tag_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mmov_core_log_searches`
--

DROP TABLE IF EXISTS `mmov_core_log_searches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmov_core_log_searches` (
  `search_term` varchar(128) NOT NULL DEFAULT '',
  `hits` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mmov_core_log_searches`
--

LOCK TABLES `mmov_core_log_searches` WRITE;
/*!40000 ALTER TABLE `mmov_core_log_searches` DISABLE KEYS */;
/*!40000 ALTER TABLE `mmov_core_log_searches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mmov_extensions`
--

DROP TABLE IF EXISTS `mmov_extensions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmov_extensions` (
  `extension_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `type` varchar(20) NOT NULL,
  `element` varchar(100) NOT NULL,
  `folder` varchar(100) NOT NULL,
  `client_id` tinyint(3) NOT NULL,
  `enabled` tinyint(3) NOT NULL DEFAULT '1',
  `access` int(10) unsigned NOT NULL DEFAULT '1',
  `protected` tinyint(3) NOT NULL DEFAULT '0',
  `manifest_cache` text NOT NULL,
  `params` text NOT NULL,
  `custom_data` text NOT NULL,
  `system_data` text NOT NULL,
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) DEFAULT '0',
  `state` int(11) DEFAULT '0',
  PRIMARY KEY (`extension_id`),
  KEY `element_clientid` (`element`,`client_id`),
  KEY `element_folder_clientid` (`element`,`folder`,`client_id`),
  KEY `extension` (`type`,`element`,`folder`,`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10026 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mmov_extensions`
--

LOCK TABLES `mmov_extensions` WRITE;
/*!40000 ALTER TABLE `mmov_extensions` DISABLE KEYS */;
INSERT INTO `mmov_extensions` VALUES (1,'com_mailto','component','com_mailto','',0,1,1,1,'{\"name\":\"com_mailto\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2015 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_MAILTO_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mailto\"}','','','',0,'0000-00-00 00:00:00',0,0),(2,'com_wrapper','component','com_wrapper','',0,1,1,1,'{\"name\":\"com_wrapper\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2015 Open Source Matters. All rights reserved.\\n\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_WRAPPER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"wrapper\"}','','','',0,'0000-00-00 00:00:00',0,0),(3,'com_admin','component','com_admin','',1,1,1,1,'{\"name\":\"com_admin\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_ADMIN_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(4,'com_banners','component','com_banners','',1,1,1,0,'{\"name\":\"com_banners\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_BANNERS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"banners\"}','{\"purchase_type\":\"3\",\"track_impressions\":\"0\",\"track_clicks\":\"0\",\"metakey_prefix\":\"\",\"save_history\":\"1\",\"history_limit\":10}','','',0,'0000-00-00 00:00:00',0,0),(5,'com_cache','component','com_cache','',1,1,1,1,'{\"name\":\"com_cache\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_CACHE_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(6,'com_categories','component','com_categories','',1,1,1,1,'{\"name\":\"com_categories\",\"type\":\"component\",\"creationDate\":\"December 2007\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_CATEGORIES_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(7,'com_checkin','component','com_checkin','',1,1,1,1,'{\"name\":\"com_checkin\",\"type\":\"component\",\"creationDate\":\"Unknown\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_CHECKIN_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(8,'com_contact','component','com_contact','',1,1,1,0,'{\"name\":\"com_contact\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_CONTACT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contact\"}','{\"show_contact_category\":\"hide\",\"save_history\":\"1\",\"history_limit\":10,\"show_contact_list\":\"0\",\"presentation_style\":\"sliders\",\"show_name\":\"1\",\"show_position\":\"1\",\"show_email\":\"0\",\"show_street_address\":\"1\",\"show_suburb\":\"1\",\"show_state\":\"1\",\"show_postcode\":\"1\",\"show_country\":\"1\",\"show_telephone\":\"1\",\"show_mobile\":\"1\",\"show_fax\":\"1\",\"show_webpage\":\"1\",\"show_misc\":\"1\",\"show_image\":\"1\",\"image\":\"\",\"allow_vcard\":\"0\",\"show_articles\":\"0\",\"show_profile\":\"0\",\"show_links\":\"0\",\"linka_name\":\"\",\"linkb_name\":\"\",\"linkc_name\":\"\",\"linkd_name\":\"\",\"linke_name\":\"\",\"contact_icons\":\"0\",\"icon_address\":\"\",\"icon_email\":\"\",\"icon_telephone\":\"\",\"icon_mobile\":\"\",\"icon_fax\":\"\",\"icon_misc\":\"\",\"show_headings\":\"1\",\"show_position_headings\":\"1\",\"show_email_headings\":\"0\",\"show_telephone_headings\":\"1\",\"show_mobile_headings\":\"0\",\"show_fax_headings\":\"0\",\"allow_vcard_headings\":\"0\",\"show_suburb_headings\":\"1\",\"show_state_headings\":\"1\",\"show_country_headings\":\"1\",\"show_email_form\":\"1\",\"show_email_copy\":\"1\",\"banned_email\":\"\",\"banned_subject\":\"\",\"banned_text\":\"\",\"validate_session\":\"1\",\"custom_reply\":\"0\",\"redirect\":\"\",\"show_category_crumb\":\"0\",\"metakey\":\"\",\"metadesc\":\"\",\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}','','',0,'0000-00-00 00:00:00',0,0),(9,'com_cpanel','component','com_cpanel','',1,1,1,1,'{\"name\":\"com_cpanel\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_CPANEL_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(10,'com_installer','component','com_installer','',1,1,1,1,'{\"name\":\"com_installer\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_INSTALLER_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(11,'com_languages','component','com_languages','',1,1,1,1,'{\"name\":\"com_languages\",\"type\":\"component\",\"creationDate\":\"2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_LANGUAGES_XML_DESCRIPTION\",\"group\":\"\"}','{\"administrator\":\"es-ES\",\"site\":\"es-ES\"}','','',0,'0000-00-00 00:00:00',0,0),(12,'com_login','component','com_login','',1,1,1,1,'{\"name\":\"com_login\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_LOGIN_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(13,'com_media','component','com_media','',1,1,0,1,'{\"name\":\"com_media\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_MEDIA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"media\"}','{\"upload_extensions\":\"bmp,csv,doc,gif,ico,jpg,jpeg,odg,odp,ods,odt,pdf,png,ppt,swf,txt,xcf,xls,BMP,CSV,DOC,GIF,ICO,JPG,JPEG,ODG,ODP,ODS,ODT,PDF,PNG,PPT,SWF,TXT,XCF,XLS\",\"upload_maxsize\":\"10\",\"file_path\":\"images\",\"image_path\":\"images\",\"restrict_uploads\":\"1\",\"allowed_media_usergroup\":\"3\",\"check_mime\":\"1\",\"image_extensions\":\"bmp,gif,jpg,png\",\"ignore_extensions\":\"\",\"upload_mime\":\"image\\/jpeg,image\\/gif,image\\/png,image\\/bmp,application\\/x-shockwave-flash,application\\/msword,application\\/excel,application\\/pdf,application\\/powerpoint,text\\/plain,application\\/x-zip\",\"upload_mime_illegal\":\"text\\/html\"}','','',0,'0000-00-00 00:00:00',0,0),(14,'com_menus','component','com_menus','',1,1,1,1,'{\"name\":\"com_menus\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_MENUS_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(15,'com_messages','component','com_messages','',1,1,1,1,'{\"name\":\"com_messages\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_MESSAGES_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(16,'com_modules','component','com_modules','',1,1,1,1,'{\"name\":\"com_modules\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_MODULES_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(17,'com_newsfeeds','component','com_newsfeeds','',1,1,1,0,'{\"name\":\"com_newsfeeds\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_NEWSFEEDS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"newsfeeds\"}','{\"newsfeed_layout\":\"_:default\",\"save_history\":\"1\",\"history_limit\":5,\"show_feed_image\":\"1\",\"show_feed_description\":\"1\",\"show_item_description\":\"1\",\"feed_character_count\":\"0\",\"feed_display_order\":\"des\",\"float_first\":\"right\",\"float_second\":\"right\",\"show_tags\":\"1\",\"category_layout\":\"_:default\",\"show_category_title\":\"1\",\"show_description\":\"1\",\"show_description_image\":\"1\",\"maxLevel\":\"-1\",\"show_empty_categories\":\"0\",\"show_subcat_desc\":\"1\",\"show_cat_items\":\"1\",\"show_cat_tags\":\"1\",\"show_base_description\":\"1\",\"maxLevelcat\":\"-1\",\"show_empty_categories_cat\":\"0\",\"show_subcat_desc_cat\":\"1\",\"show_cat_items_cat\":\"1\",\"filter_field\":\"1\",\"show_pagination_limit\":\"1\",\"show_headings\":\"1\",\"show_articles\":\"0\",\"show_link\":\"1\",\"show_pagination\":\"1\",\"show_pagination_results\":\"1\"}','','',0,'0000-00-00 00:00:00',0,0),(18,'com_plugins','component','com_plugins','',1,1,1,1,'{\"name\":\"com_plugins\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_PLUGINS_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(19,'com_search','component','com_search','',1,1,1,0,'{\"name\":\"com_search\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_SEARCH_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"search\"}','{\"enabled\":\"0\",\"show_date\":\"1\"}','','',0,'0000-00-00 00:00:00',0,0),(20,'com_templates','component','com_templates','',1,1,1,1,'{\"name\":\"com_templates\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_TEMPLATES_XML_DESCRIPTION\",\"group\":\"\"}','{\"template_positions_display\":\"0\",\"upload_limit\":\"2\",\"image_formats\":\"gif,bmp,jpg,jpeg,png\",\"source_formats\":\"txt,less,ini,xml,js,php,css\",\"font_formats\":\"woff,ttf,otf\",\"compressed_formats\":\"zip\"}','','',0,'0000-00-00 00:00:00',0,0),(21,'com_weblinks','component','com_weblinks','',1,1,1,0,'{\"name\":\"com_weblinks\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2014 Open Source Matters. All rights reserved.\\n\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_WEBLINKS_XML_DESCRIPTION\",\"group\":\"\"}','{\"target\":\"0\",\"save_history\":\"1\",\"history_limit\":5,\"count_clicks\":\"1\",\"icons\":1,\"link_icons\":\"\",\"float_first\":\"right\",\"float_second\":\"right\",\"show_tags\":\"1\",\"category_layout\":\"_:default\",\"show_category_title\":\"1\",\"show_description\":\"1\",\"show_description_image\":\"1\",\"maxLevel\":\"-1\",\"show_empty_categories\":\"0\",\"show_subcat_desc\":\"1\",\"show_cat_num_links\":\"1\",\"show_cat_tags\":\"1\",\"show_base_description\":\"1\",\"maxLevelcat\":\"-1\",\"show_empty_categories_cat\":\"0\",\"show_subcat_desc_cat\":\"1\",\"show_cat_num_links_cat\":\"1\",\"filter_field\":\"1\",\"show_pagination_limit\":\"1\",\"show_headings\":\"0\",\"show_link_description\":\"1\",\"show_link_hits\":\"1\",\"show_pagination\":\"2\",\"show_pagination_results\":\"1\",\"show_feed_link\":\"1\"}','','',0,'0000-00-00 00:00:00',0,0),(22,'com_content','component','com_content','',1,1,0,1,'{\"name\":\"com_content\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_CONTENT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"content\"}','{\"article_layout\":\"_:default\",\"show_title\":\"1\",\"link_titles\":\"0\",\"show_intro\":\"0\",\"info_block_position\":\"0\",\"show_category\":\"0\",\"link_category\":\"0\",\"show_parent_category\":\"0\",\"link_parent_category\":\"0\",\"show_author\":\"0\",\"link_author\":\"0\",\"show_create_date\":\"0\",\"show_modify_date\":\"0\",\"show_publish_date\":\"0\",\"show_item_navigation\":\"0\",\"show_vote\":\"0\",\"show_readmore\":\"1\",\"show_readmore_title\":\"1\",\"readmore_limit\":\"100\",\"show_tags\":\"1\",\"show_icons\":\"0\",\"show_print_icon\":\"0\",\"show_email_icon\":\"0\",\"show_hits\":\"0\",\"show_noauth\":\"0\",\"urls_position\":\"0\",\"show_publishing_options\":\"1\",\"show_article_options\":\"1\",\"save_history\":\"1\",\"history_limit\":10,\"show_urls_images_frontend\":\"0\",\"show_urls_images_backend\":\"1\",\"targeta\":0,\"targetb\":0,\"targetc\":0,\"float_intro\":\"left\",\"float_fulltext\":\"left\",\"category_layout\":\"_:blog\",\"show_category_heading_title_text\":\"1\",\"show_category_title\":\"0\",\"show_description\":\"0\",\"show_description_image\":\"0\",\"maxLevel\":\"1\",\"show_empty_categories\":\"0\",\"show_no_articles\":\"1\",\"show_subcat_desc\":\"1\",\"show_cat_num_articles\":\"0\",\"show_cat_tags\":\"1\",\"show_base_description\":\"1\",\"maxLevelcat\":\"-1\",\"show_empty_categories_cat\":\"0\",\"show_subcat_desc_cat\":\"1\",\"show_cat_num_articles_cat\":\"1\",\"num_leading_articles\":\"1\",\"num_intro_articles\":\"4\",\"num_columns\":\"2\",\"num_links\":\"4\",\"multi_column_order\":\"0\",\"show_subcategory_content\":\"0\",\"show_pagination_limit\":\"1\",\"filter_field\":\"hide\",\"show_headings\":\"1\",\"list_show_date\":\"0\",\"date_format\":\"\",\"list_show_hits\":\"1\",\"list_show_author\":\"1\",\"orderby_pri\":\"order\",\"orderby_sec\":\"rdate\",\"order_date\":\"published\",\"show_pagination\":\"2\",\"show_pagination_results\":\"1\",\"show_featured\":\"show\",\"show_feed_link\":\"1\",\"feed_summary\":\"0\",\"feed_show_readmore\":\"0\"}','','',0,'0000-00-00 00:00:00',0,0),(23,'com_config','component','com_config','',1,1,0,1,'{\"name\":\"com_config\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_CONFIG_XML_DESCRIPTION\",\"group\":\"\"}','{\"filters\":{\"1\":{\"filter_type\":\"NH\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"9\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"6\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"7\":{\"filter_type\":\"NONE\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"2\":{\"filter_type\":\"NH\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"3\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"4\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"5\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"8\":{\"filter_type\":\"NONE\",\"filter_tags\":\"\",\"filter_attributes\":\"\"}}}','','',0,'0000-00-00 00:00:00',0,0),(24,'com_redirect','component','com_redirect','',1,1,0,1,'{\"name\":\"com_redirect\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_REDIRECT_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(25,'com_users','component','com_users','',1,1,0,1,'{\"name\":\"com_users\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_USERS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"users\"}','{\"allowUserRegistration\":\"1\",\"new_usertype\":\"2\",\"guest_usergroup\":\"9\",\"sendpassword\":\"1\",\"useractivation\":\"1\",\"mail_to_admin\":\"0\",\"captcha\":\"\",\"frontend_userparams\":\"1\",\"site_language\":\"0\",\"change_login_name\":\"0\",\"reset_count\":\"10\",\"reset_time\":\"1\",\"minimum_length\":\"4\",\"minimum_integers\":\"0\",\"minimum_symbols\":\"0\",\"minimum_uppercase\":\"0\",\"save_history\":\"1\",\"history_limit\":5,\"mailSubjectPrefix\":\"\",\"mailBodySuffix\":\"\"}','','',0,'0000-00-00 00:00:00',0,0),(27,'com_finder','component','com_finder','',1,1,0,0,'{\"name\":\"com_finder\",\"type\":\"component\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_FINDER_XML_DESCRIPTION\",\"group\":\"\"}','{\"show_description\":\"1\",\"description_length\":255,\"allow_empty_query\":\"0\",\"show_url\":\"1\",\"show_advanced\":\"1\",\"expand_advanced\":\"0\",\"show_date_filters\":\"0\",\"highlight_terms\":\"1\",\"opensearch_name\":\"\",\"opensearch_description\":\"\",\"batch_size\":\"50\",\"memory_table_limit\":30000,\"title_multiplier\":\"1.7\",\"text_multiplier\":\"0.7\",\"meta_multiplier\":\"1.2\",\"path_multiplier\":\"2.0\",\"misc_multiplier\":\"0.3\",\"stemmer\":\"snowball\"}','','',0,'0000-00-00 00:00:00',0,0),(28,'com_joomlaupdate','component','com_joomlaupdate','',1,1,0,1,'{\"name\":\"com_joomlaupdate\",\"type\":\"component\",\"creationDate\":\"February 2012\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2014 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_JOOMLAUPDATE_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(29,'com_tags','component','com_tags','',1,1,1,1,'{\"name\":\"com_tags\",\"type\":\"component\",\"creationDate\":\"December 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.1.0\",\"description\":\"COM_TAGS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"tags\"}','{\"tag_layout\":\"_:default\",\"save_history\":\"1\",\"history_limit\":5,\"show_tag_title\":\"0\",\"tag_list_show_tag_image\":\"0\",\"tag_list_show_tag_description\":\"0\",\"tag_list_image\":\"\",\"show_tag_num_items\":\"0\",\"tag_list_orderby\":\"title\",\"tag_list_orderby_direction\":\"ASC\",\"show_headings\":\"0\",\"tag_list_show_date\":\"0\",\"tag_list_show_item_image\":\"0\",\"tag_list_show_item_description\":\"0\",\"tag_list_item_maximum_characters\":0,\"return_any_or_all\":\"1\",\"include_children\":\"0\",\"maximum\":200,\"tag_list_language_filter\":\"all\",\"tags_layout\":\"_:default\",\"all_tags_orderby\":\"title\",\"all_tags_orderby_direction\":\"ASC\",\"all_tags_show_tag_image\":\"0\",\"all_tags_show_tag_descripion\":\"0\",\"all_tags_tag_maximum_characters\":20,\"all_tags_show_tag_hits\":\"0\",\"filter_field\":\"1\",\"show_pagination_limit\":\"1\",\"show_pagination\":\"2\",\"show_pagination_results\":\"1\",\"tag_field_ajax_mode\":\"1\",\"show_feed_link\":\"1\"}','','',0,'0000-00-00 00:00:00',0,0),(30,'com_contenthistory','component','com_contenthistory','',1,1,1,0,'{\"name\":\"com_contenthistory\",\"type\":\"component\",\"creationDate\":\"May 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.2.0\",\"description\":\"COM_CONTENTHISTORY_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contenthistory\"}','','','',0,'0000-00-00 00:00:00',0,0),(31,'com_ajax','component','com_ajax','',1,1,1,0,'{\"name\":\"com_ajax\",\"type\":\"component\",\"creationDate\":\"August 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.2.0\",\"description\":\"COM_AJAX_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"ajax\"}','','','',0,'0000-00-00 00:00:00',0,0),(32,'com_postinstall','component','com_postinstall','',1,1,1,1,'{\"name\":\"com_postinstall\",\"type\":\"component\",\"creationDate\":\"September 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.2.0\",\"description\":\"COM_POSTINSTALL_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(101,'SimplePie','library','simplepie','',0,1,1,1,'{\"name\":\"SimplePie\",\"type\":\"library\",\"creationDate\":\"2004\",\"author\":\"SimplePie\",\"copyright\":\"Copyright (c) 2004-2009, Ryan Parman and Geoffrey Sneddon\",\"authorEmail\":\"\",\"authorUrl\":\"http:\\/\\/simplepie.org\\/\",\"version\":\"1.2\",\"description\":\"LIB_SIMPLEPIE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"simplepie\"}','','','',0,'0000-00-00 00:00:00',0,0),(102,'phputf8','library','phputf8','',0,1,1,1,'{\"name\":\"phputf8\",\"type\":\"library\",\"creationDate\":\"2006\",\"author\":\"Harry Fuecks\",\"copyright\":\"Copyright various authors\",\"authorEmail\":\"hfuecks@gmail.com\",\"authorUrl\":\"http:\\/\\/sourceforge.net\\/projects\\/phputf8\",\"version\":\"0.5\",\"description\":\"LIB_PHPUTF8_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"phputf8\"}','','','',0,'0000-00-00 00:00:00',0,0),(103,'Joomla! Platform','library','joomla','',0,1,1,1,'{\"name\":\"Joomla! Platform\",\"type\":\"library\",\"creationDate\":\"2008\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"http:\\/\\/www.joomla.org\",\"version\":\"13.1\",\"description\":\"LIB_JOOMLA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"joomla\"}','{\"mediaversion\":\"0411e61ddfc55be006587ef7e79f98f2\"}','','',0,'0000-00-00 00:00:00',0,0),(104,'IDNA Convert','library','idna_convert','',0,1,1,1,'{\"name\":\"IDNA Convert\",\"type\":\"library\",\"creationDate\":\"2004\",\"author\":\"phlyLabs\",\"copyright\":\"2004-2011 phlyLabs Berlin, http:\\/\\/phlylabs.de\",\"authorEmail\":\"phlymail@phlylabs.de\",\"authorUrl\":\"http:\\/\\/phlylabs.de\",\"version\":\"0.8.0\",\"description\":\"LIB_IDNA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"idna_convert\"}','','','',0,'0000-00-00 00:00:00',0,0),(105,'FOF','library','fof','',0,1,1,1,'{\"name\":\"FOF\",\"type\":\"library\",\"creationDate\":\"2014-11-28 11:21:40\",\"author\":\"Nicholas K. Dionysopoulos \\/ Akeeba Ltd\",\"copyright\":\"(C)2011-2014 Nicholas K. Dionysopoulos\",\"authorEmail\":\"nicholas@akeebabackup.com\",\"authorUrl\":\"https:\\/\\/www.akeebabackup.com\",\"version\":\"2.4.1\",\"description\":\"LIB_FOF_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"fof\"}','','','',0,'0000-00-00 00:00:00',0,0),(106,'PHPass','library','phpass','',0,1,1,1,'{\"name\":\"PHPass\",\"type\":\"library\",\"creationDate\":\"2004-2006\",\"author\":\"Solar Designer\",\"copyright\":\"\",\"authorEmail\":\"solar@openwall.com\",\"authorUrl\":\"http:\\/\\/www.openwall.com\\/phpass\\/\",\"version\":\"0.3\",\"description\":\"LIB_PHPASS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"phpass\"}','','','',0,'0000-00-00 00:00:00',0,0),(200,'mod_articles_archive','module','mod_articles_archive','',0,1,1,0,'{\"name\":\"mod_articles_archive\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_ARTICLES_ARCHIVE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_articles_archive\"}','','','',0,'0000-00-00 00:00:00',0,0),(201,'mod_articles_latest','module','mod_articles_latest','',0,1,1,0,'{\"name\":\"mod_articles_latest\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_LATEST_NEWS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_articles_latest\"}','','','',0,'0000-00-00 00:00:00',0,0),(202,'mod_articles_popular','module','mod_articles_popular','',0,1,1,0,'{\"name\":\"mod_articles_popular\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_POPULAR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_articles_popular\"}','','','',0,'0000-00-00 00:00:00',0,0),(203,'mod_banners','module','mod_banners','',0,1,1,0,'{\"name\":\"mod_banners\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_BANNERS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_banners\"}','','','',0,'0000-00-00 00:00:00',0,0),(204,'mod_breadcrumbs','module','mod_breadcrumbs','',0,1,1,1,'{\"name\":\"mod_breadcrumbs\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_BREADCRUMBS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_breadcrumbs\"}','','','',0,'0000-00-00 00:00:00',0,0),(205,'mod_custom','module','mod_custom','',0,1,1,1,'{\"name\":\"mod_custom\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_CUSTOM_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_custom\"}','','','',0,'0000-00-00 00:00:00',0,0),(206,'mod_feed','module','mod_feed','',0,1,1,0,'{\"name\":\"mod_feed\",\"type\":\"module\",\"creationDate\":\"July 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_FEED_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_feed\"}','','','',0,'0000-00-00 00:00:00',0,0),(207,'mod_footer','module','mod_footer','',0,1,1,0,'{\"name\":\"mod_footer\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_FOOTER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_footer\"}','','','',0,'0000-00-00 00:00:00',0,0),(208,'mod_login','module','mod_login','',0,1,1,1,'{\"name\":\"mod_login\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_LOGIN_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_login\"}','','','',0,'0000-00-00 00:00:00',0,0),(209,'mod_menu','module','mod_menu','',0,1,1,1,'{\"name\":\"mod_menu\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_MENU_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_menu\"}','','','',0,'0000-00-00 00:00:00',0,0),(210,'mod_articles_news','module','mod_articles_news','',0,1,1,0,'{\"name\":\"mod_articles_news\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_ARTICLES_NEWS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_articles_news\"}','','','',0,'0000-00-00 00:00:00',0,0),(211,'mod_random_image','module','mod_random_image','',0,1,1,0,'{\"name\":\"mod_random_image\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_RANDOM_IMAGE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_random_image\"}','','','',0,'0000-00-00 00:00:00',0,0),(212,'mod_related_items','module','mod_related_items','',0,1,1,0,'{\"name\":\"mod_related_items\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_RELATED_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_related_items\"}','','','',0,'0000-00-00 00:00:00',0,0),(213,'mod_search','module','mod_search','',0,1,1,0,'{\"name\":\"mod_search\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_SEARCH_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_search\"}','','','',0,'0000-00-00 00:00:00',0,0),(214,'mod_stats','module','mod_stats','',0,1,1,0,'{\"name\":\"mod_stats\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_STATS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_stats\"}','','','',0,'0000-00-00 00:00:00',0,0),(215,'mod_syndicate','module','mod_syndicate','',0,1,1,1,'{\"name\":\"mod_syndicate\",\"type\":\"module\",\"creationDate\":\"May 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_SYNDICATE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_syndicate\"}','','','',0,'0000-00-00 00:00:00',0,0),(216,'mod_users_latest','module','mod_users_latest','',0,1,1,0,'{\"name\":\"mod_users_latest\",\"type\":\"module\",\"creationDate\":\"December 2009\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_USERS_LATEST_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_users_latest\"}','','','',0,'0000-00-00 00:00:00',0,0),(217,'mod_weblinks','module','mod_weblinks','',0,1,1,0,'{\"name\":\"mod_weblinks\",\"type\":\"module\",\"creationDate\":\"July 2009\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_WEBLINKS_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(218,'mod_whosonline','module','mod_whosonline','',0,1,1,0,'{\"name\":\"mod_whosonline\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_WHOSONLINE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_whosonline\"}','','','',0,'0000-00-00 00:00:00',0,0),(219,'mod_wrapper','module','mod_wrapper','',0,1,1,0,'{\"name\":\"mod_wrapper\",\"type\":\"module\",\"creationDate\":\"October 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_WRAPPER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_wrapper\"}','','','',0,'0000-00-00 00:00:00',0,0),(220,'mod_articles_category','module','mod_articles_category','',0,1,1,0,'{\"name\":\"mod_articles_category\",\"type\":\"module\",\"creationDate\":\"February 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_ARTICLES_CATEGORY_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_articles_category\"}','','','',0,'0000-00-00 00:00:00',0,0),(221,'mod_articles_categories','module','mod_articles_categories','',0,1,1,0,'{\"name\":\"mod_articles_categories\",\"type\":\"module\",\"creationDate\":\"February 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_ARTICLES_CATEGORIES_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_articles_categories\"}','','','',0,'0000-00-00 00:00:00',0,0),(222,'mod_languages','module','mod_languages','',0,1,1,1,'{\"name\":\"mod_languages\",\"type\":\"module\",\"creationDate\":\"February 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_LANGUAGES_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_languages\"}','','','',0,'0000-00-00 00:00:00',0,0),(223,'mod_finder','module','mod_finder','',0,1,0,0,'{\"name\":\"mod_finder\",\"type\":\"module\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_FINDER_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(300,'mod_custom','module','mod_custom','',1,1,1,1,'{\"name\":\"mod_custom\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_CUSTOM_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_custom\"}','','','',0,'0000-00-00 00:00:00',0,0),(301,'mod_feed','module','mod_feed','',1,1,1,0,'{\"name\":\"mod_feed\",\"type\":\"module\",\"creationDate\":\"July 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_FEED_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_feed\"}','','','',0,'0000-00-00 00:00:00',0,0),(302,'mod_latest','module','mod_latest','',1,1,1,0,'{\"name\":\"mod_latest\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_LATEST_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_latest\"}','','','',0,'0000-00-00 00:00:00',0,0),(303,'mod_logged','module','mod_logged','',1,1,1,0,'{\"name\":\"mod_logged\",\"type\":\"module\",\"creationDate\":\"January 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_LOGGED_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_logged\"}','','','',0,'0000-00-00 00:00:00',0,0),(304,'mod_login','module','mod_login','',1,1,1,1,'{\"name\":\"mod_login\",\"type\":\"module\",\"creationDate\":\"March 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_LOGIN_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_login\"}','','','',0,'0000-00-00 00:00:00',0,0),(305,'mod_menu','module','mod_menu','',1,1,1,0,'{\"name\":\"mod_menu\",\"type\":\"module\",\"creationDate\":\"March 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_MENU_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_menu\"}','','','',0,'0000-00-00 00:00:00',0,0),(307,'mod_popular','module','mod_popular','',1,1,1,0,'{\"name\":\"mod_popular\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_POPULAR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_popular\"}','','','',0,'0000-00-00 00:00:00',0,0),(308,'mod_quickicon','module','mod_quickicon','',1,1,1,1,'{\"name\":\"mod_quickicon\",\"type\":\"module\",\"creationDate\":\"Nov 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_QUICKICON_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_quickicon\"}','','','',0,'0000-00-00 00:00:00',0,0),(309,'mod_status','module','mod_status','',1,1,1,0,'{\"name\":\"mod_status\",\"type\":\"module\",\"creationDate\":\"Feb 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_STATUS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_status\"}','','','',0,'0000-00-00 00:00:00',0,0),(310,'mod_submenu','module','mod_submenu','',1,1,1,0,'{\"name\":\"mod_submenu\",\"type\":\"module\",\"creationDate\":\"Feb 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_SUBMENU_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_submenu\"}','','','',0,'0000-00-00 00:00:00',0,0),(311,'mod_title','module','mod_title','',1,1,1,0,'{\"name\":\"mod_title\",\"type\":\"module\",\"creationDate\":\"Nov 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_TITLE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_title\"}','','','',0,'0000-00-00 00:00:00',0,0),(312,'mod_toolbar','module','mod_toolbar','',1,1,1,1,'{\"name\":\"mod_toolbar\",\"type\":\"module\",\"creationDate\":\"Nov 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_TOOLBAR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_toolbar\"}','','','',0,'0000-00-00 00:00:00',0,0),(313,'mod_multilangstatus','module','mod_multilangstatus','',1,1,1,0,'{\"name\":\"mod_multilangstatus\",\"type\":\"module\",\"creationDate\":\"September 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_MULTILANGSTATUS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_multilangstatus\"}','{\"cache\":\"0\"}','','',0,'0000-00-00 00:00:00',0,0),(314,'mod_version','module','mod_version','',1,1,1,0,'{\"name\":\"mod_version\",\"type\":\"module\",\"creationDate\":\"January 2012\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_VERSION_XML_DESCRIPTION\",\"group\":\"\"}','{\"format\":\"short\",\"product\":\"1\",\"cache\":\"0\"}','','',0,'0000-00-00 00:00:00',0,0),(315,'mod_stats_admin','module','mod_stats_admin','',1,1,1,0,'{\"name\":\"mod_stats_admin\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_STATS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_stats_admin\"}','{\"serverinfo\":\"0\",\"siteinfo\":\"0\",\"counter\":\"0\",\"increase\":\"0\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\"}','','',0,'0000-00-00 00:00:00',0,0),(316,'mod_tags_popular','module','mod_tags_popular','',0,1,1,0,'{\"name\":\"mod_tags_popular\",\"type\":\"module\",\"creationDate\":\"January 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.1.0\",\"description\":\"MOD_TAGS_POPULAR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_tags_popular\"}','{\"maximum\":\"5\",\"timeframe\":\"alltime\",\"owncache\":\"1\"}','','',0,'0000-00-00 00:00:00',0,0),(317,'mod_tags_similar','module','mod_tags_similar','',0,1,1,0,'{\"name\":\"mod_tags_similar\",\"type\":\"module\",\"creationDate\":\"January 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.1.0\",\"description\":\"MOD_TAGS_SIMILAR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_tags_similar\"}','{\"maximum\":\"5\",\"matchtype\":\"any\",\"owncache\":\"1\"}','','',0,'0000-00-00 00:00:00',0,0),(400,'plg_authentication_gmail','plugin','gmail','authentication',0,0,1,0,'{\"name\":\"plg_authentication_gmail\",\"type\":\"plugin\",\"creationDate\":\"February 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_GMAIL_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"gmail\"}','{\"applysuffix\":\"0\",\"suffix\":\"\",\"verifypeer\":\"1\",\"user_blacklist\":\"\"}','','',0,'0000-00-00 00:00:00',1,0),(401,'plg_authentication_joomla','plugin','joomla','authentication',0,1,1,1,'{\"name\":\"plg_authentication_joomla\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_AUTH_JOOMLA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"joomla\"}','','','',0,'0000-00-00 00:00:00',0,0),(402,'plg_authentication_ldap','plugin','ldap','authentication',0,0,1,0,'{\"name\":\"plg_authentication_ldap\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_LDAP_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"ldap\"}','{\"host\":\"\",\"port\":\"389\",\"use_ldapV3\":\"0\",\"negotiate_tls\":\"0\",\"no_referrals\":\"0\",\"auth_method\":\"bind\",\"base_dn\":\"\",\"search_string\":\"\",\"users_dn\":\"\",\"username\":\"admin\",\"password\":\"bobby7\",\"ldap_fullname\":\"fullName\",\"ldap_email\":\"mail\",\"ldap_uid\":\"uid\"}','','',0,'0000-00-00 00:00:00',3,0),(403,'plg_content_contact','plugin','contact','content',0,1,1,0,'{\"name\":\"plg_content_contact\",\"type\":\"plugin\",\"creationDate\":\"January 2014\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.2.2\",\"description\":\"PLG_CONTENT_CONTACT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contact\"}','','','',0,'0000-00-00 00:00:00',1,0),(404,'plg_content_emailcloak','plugin','emailcloak','content',0,1,1,0,'{\"name\":\"plg_content_emailcloak\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_CONTENT_EMAILCLOAK_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"emailcloak\"}','{\"mode\":\"1\"}','','',0,'0000-00-00 00:00:00',1,0),(406,'plg_content_loadmodule','plugin','loadmodule','content',0,1,1,0,'{\"name\":\"plg_content_loadmodule\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_LOADMODULE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"loadmodule\"}','{\"style\":\"xhtml\"}','','',0,'2011-09-18 15:22:50',0,0),(407,'plg_content_pagebreak','plugin','pagebreak','content',0,1,1,0,'{\"name\":\"plg_content_pagebreak\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_CONTENT_PAGEBREAK_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"pagebreak\"}','{\"title\":\"1\",\"multipage_toc\":\"1\",\"showall\":\"1\"}','','',0,'0000-00-00 00:00:00',4,0),(408,'plg_content_pagenavigation','plugin','pagenavigation','content',0,1,1,0,'{\"name\":\"plg_content_pagenavigation\",\"type\":\"plugin\",\"creationDate\":\"January 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_PAGENAVIGATION_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"pagenavigation\"}','{\"position\":\"1\"}','','',0,'0000-00-00 00:00:00',5,0),(409,'plg_content_vote','plugin','vote','content',0,1,1,0,'{\"name\":\"plg_content_vote\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_VOTE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"vote\"}','','','',0,'0000-00-00 00:00:00',6,0),(410,'plg_editors_codemirror','plugin','codemirror','editors',0,1,1,1,'{\"name\":\"plg_editors_codemirror\",\"type\":\"plugin\",\"creationDate\":\"28 March 2011\",\"author\":\"Marijn Haverbeke\",\"copyright\":\"Copyright (C) 2014 by Marijn Haverbeke <marijnh@gmail.com> and others\",\"authorEmail\":\"marijnh@gmail.com\",\"authorUrl\":\"http:\\/\\/codemirror.net\\/\",\"version\":\"4.12\",\"description\":\"PLG_CODEMIRROR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"codemirror\"}','{\"lineNumbers\":\"1\",\"lineWrapping\":\"1\",\"matchTags\":\"1\",\"matchBrackets\":\"1\",\"marker-gutter\":\"1\",\"autoCloseTags\":\"1\",\"autoCloseBrackets\":\"1\",\"autoFocus\":\"1\",\"theme\":\"default\",\"tabmode\":\"indent\"}','','',0,'0000-00-00 00:00:00',1,0),(411,'plg_editors_none','plugin','none','editors',0,1,1,1,'{\"name\":\"plg_editors_none\",\"type\":\"plugin\",\"creationDate\":\"September 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_NONE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"none\"}','','','',0,'0000-00-00 00:00:00',2,0),(412,'plg_editors_tinymce','plugin','tinymce','editors',0,1,1,0,'{\"name\":\"plg_editors_tinymce\",\"type\":\"plugin\",\"creationDate\":\"2005-2014\",\"author\":\"Moxiecode Systems AB\",\"copyright\":\"Moxiecode Systems AB\",\"authorEmail\":\"N\\/A\",\"authorUrl\":\"tinymce.moxiecode.com\",\"version\":\"4.1.7\",\"description\":\"PLG_TINY_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"tinymce\"}','{\"mode\":\"1\",\"skin\":\"0\",\"mobile\":\"0\",\"entity_encoding\":\"raw\",\"lang_mode\":\"1\",\"text_direction\":\"ltr\",\"content_css\":\"1\",\"content_css_custom\":\"\",\"relative_urls\":\"1\",\"newlines\":\"0\",\"invalid_elements\":\"script,applet,iframe\",\"extended_elements\":\"\",\"html_height\":\"550\",\"html_width\":\"750\",\"resizing\":\"1\",\"element_path\":\"1\",\"fonts\":\"1\",\"paste\":\"1\",\"searchreplace\":\"1\",\"insertdate\":\"1\",\"colors\":\"1\",\"table\":\"1\",\"smilies\":\"1\",\"hr\":\"1\",\"link\":\"1\",\"media\":\"1\",\"print\":\"1\",\"directionality\":\"1\",\"fullscreen\":\"1\",\"alignment\":\"1\",\"visualchars\":\"1\",\"visualblocks\":\"1\",\"nonbreaking\":\"1\",\"template\":\"1\",\"blockquote\":\"1\",\"wordcount\":\"1\",\"advlist\":\"1\",\"autosave\":\"1\",\"contextmenu\":\"1\",\"inlinepopups\":\"1\",\"custom_plugin\":\"\",\"custom_button\":\"\"}','','',0,'0000-00-00 00:00:00',3,0),(413,'plg_editors-xtd_article','plugin','article','editors-xtd',0,1,1,0,'{\"name\":\"plg_editors-xtd_article\",\"type\":\"plugin\",\"creationDate\":\"October 2009\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_ARTICLE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"article\"}','','','',0,'0000-00-00 00:00:00',1,0),(414,'plg_editors-xtd_image','plugin','image','editors-xtd',0,1,1,0,'{\"name\":\"plg_editors-xtd_image\",\"type\":\"plugin\",\"creationDate\":\"August 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_IMAGE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"image\"}','','','',0,'0000-00-00 00:00:00',2,0),(415,'plg_editors-xtd_pagebreak','plugin','pagebreak','editors-xtd',0,1,1,0,'{\"name\":\"plg_editors-xtd_pagebreak\",\"type\":\"plugin\",\"creationDate\":\"August 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_EDITORSXTD_PAGEBREAK_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"pagebreak\"}','','','',0,'0000-00-00 00:00:00',3,0),(416,'plg_editors-xtd_readmore','plugin','readmore','editors-xtd',0,1,1,0,'{\"name\":\"plg_editors-xtd_readmore\",\"type\":\"plugin\",\"creationDate\":\"March 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_READMORE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"readmore\"}','','','',0,'0000-00-00 00:00:00',4,0),(417,'plg_search_categories','plugin','categories','search',0,1,1,0,'{\"name\":\"plg_search_categories\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SEARCH_CATEGORIES_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"categories\"}','{\"search_limit\":\"50\",\"search_content\":\"1\",\"search_archived\":\"1\"}','','',0,'0000-00-00 00:00:00',0,0),(418,'plg_search_contacts','plugin','contacts','search',0,1,1,0,'{\"name\":\"plg_search_contacts\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SEARCH_CONTACTS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contacts\"}','{\"search_limit\":\"50\",\"search_content\":\"1\",\"search_archived\":\"1\"}','','',0,'0000-00-00 00:00:00',0,0),(419,'plg_search_content','plugin','content','search',0,1,1,0,'{\"name\":\"plg_search_content\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SEARCH_CONTENT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"content\"}','{\"search_limit\":\"50\",\"search_content\":\"1\",\"search_archived\":\"1\"}','','',0,'0000-00-00 00:00:00',0,0),(420,'plg_search_newsfeeds','plugin','newsfeeds','search',0,1,1,0,'{\"name\":\"plg_search_newsfeeds\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SEARCH_NEWSFEEDS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"newsfeeds\"}','{\"search_limit\":\"50\",\"search_content\":\"1\",\"search_archived\":\"1\"}','','',0,'0000-00-00 00:00:00',0,0),(421,'plg_search_weblinks','plugin','weblinks','search',0,1,1,0,'{\"name\":\"plg_search_weblinks\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SEARCH_WEBLINKS_XML_DESCRIPTION\",\"group\":\"\"}','{\"search_limit\":\"50\",\"search_content\":\"1\",\"search_archived\":\"1\"}','','',0,'0000-00-00 00:00:00',0,0),(422,'plg_system_languagefilter','plugin','languagefilter','system',0,0,1,1,'{\"name\":\"plg_system_languagefilter\",\"type\":\"plugin\",\"creationDate\":\"July 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SYSTEM_LANGUAGEFILTER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"languagefilter\"}','','','',0,'0000-00-00 00:00:00',1,0),(423,'plg_system_p3p','plugin','p3p','system',0,1,1,0,'{\"name\":\"plg_system_p3p\",\"type\":\"plugin\",\"creationDate\":\"September 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_P3P_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"p3p\"}','{\"headers\":\"NOI ADM DEV PSAi COM NAV OUR OTRo STP IND DEM\"}','','',0,'0000-00-00 00:00:00',2,0),(424,'plg_system_cache','plugin','cache','system',0,0,1,1,'{\"name\":\"plg_system_cache\",\"type\":\"plugin\",\"creationDate\":\"February 2007\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_CACHE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"cache\"}','{\"browsercache\":\"0\",\"cachetime\":\"15\"}','','',0,'0000-00-00 00:00:00',9,0),(425,'plg_system_debug','plugin','debug','system',0,1,1,0,'{\"name\":\"plg_system_debug\",\"type\":\"plugin\",\"creationDate\":\"December 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_DEBUG_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"debug\"}','{\"profile\":\"1\",\"queries\":\"1\",\"memory\":\"1\",\"language_files\":\"1\",\"language_strings\":\"1\",\"strip-first\":\"1\",\"strip-prefix\":\"\",\"strip-suffix\":\"\"}','','',0,'0000-00-00 00:00:00',4,0),(426,'plg_system_log','plugin','log','system',0,1,1,1,'{\"name\":\"plg_system_log\",\"type\":\"plugin\",\"creationDate\":\"April 2007\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_LOG_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"log\"}','','','',0,'0000-00-00 00:00:00',5,0),(427,'plg_system_redirect','plugin','redirect','system',0,0,1,1,'{\"name\":\"plg_system_redirect\",\"type\":\"plugin\",\"creationDate\":\"April 2009\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_REDIRECT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"redirect\"}','','','',0,'0000-00-00 00:00:00',6,0),(428,'plg_system_remember','plugin','remember','system',0,1,1,1,'{\"name\":\"plg_system_remember\",\"type\":\"plugin\",\"creationDate\":\"April 2007\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_REMEMBER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"remember\"}','','','',0,'0000-00-00 00:00:00',7,0),(429,'plg_system_sef','plugin','sef','system',0,1,1,0,'{\"name\":\"plg_system_sef\",\"type\":\"plugin\",\"creationDate\":\"December 2007\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SEF_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"sef\"}','','','',0,'0000-00-00 00:00:00',8,0),(430,'plg_system_logout','plugin','logout','system',0,1,1,1,'{\"name\":\"plg_system_logout\",\"type\":\"plugin\",\"creationDate\":\"April 2009\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SYSTEM_LOGOUT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"logout\"}','','','',0,'0000-00-00 00:00:00',3,0),(431,'plg_user_contactcreator','plugin','contactcreator','user',0,0,1,0,'{\"name\":\"plg_user_contactcreator\",\"type\":\"plugin\",\"creationDate\":\"August 2009\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_CONTACTCREATOR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contactcreator\"}','{\"autowebpage\":\"\",\"category\":\"34\",\"autopublish\":\"0\"}','','',0,'0000-00-00 00:00:00',1,0),(432,'plg_user_joomla','plugin','joomla','user',0,1,1,0,'{\"name\":\"plg_user_joomla\",\"type\":\"plugin\",\"creationDate\":\"December 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_USER_JOOMLA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"joomla\"}','{\"strong_passwords\":\"1\",\"autoregister\":\"1\"}','','',0,'0000-00-00 00:00:00',2,0),(433,'plg_user_profile','plugin','profile','user',0,0,1,0,'{\"name\":\"plg_user_profile\",\"type\":\"plugin\",\"creationDate\":\"January 2008\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_USER_PROFILE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"profile\"}','{\"register-require_address1\":\"1\",\"register-require_address2\":\"1\",\"register-require_city\":\"1\",\"register-require_region\":\"1\",\"register-require_country\":\"1\",\"register-require_postal_code\":\"1\",\"register-require_phone\":\"1\",\"register-require_website\":\"1\",\"register-require_favoritebook\":\"1\",\"register-require_aboutme\":\"1\",\"register-require_tos\":\"1\",\"register-require_dob\":\"1\",\"profile-require_address1\":\"1\",\"profile-require_address2\":\"1\",\"profile-require_city\":\"1\",\"profile-require_region\":\"1\",\"profile-require_country\":\"1\",\"profile-require_postal_code\":\"1\",\"profile-require_phone\":\"1\",\"profile-require_website\":\"1\",\"profile-require_favoritebook\":\"1\",\"profile-require_aboutme\":\"1\",\"profile-require_tos\":\"1\",\"profile-require_dob\":\"1\"}','','',0,'0000-00-00 00:00:00',0,0),(434,'plg_extension_joomla','plugin','joomla','extension',0,1,1,1,'{\"name\":\"plg_extension_joomla\",\"type\":\"plugin\",\"creationDate\":\"May 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_EXTENSION_JOOMLA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"joomla\"}','','','',0,'0000-00-00 00:00:00',1,0),(435,'plg_content_joomla','plugin','joomla','content',0,1,1,0,'{\"name\":\"plg_content_joomla\",\"type\":\"plugin\",\"creationDate\":\"November 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_CONTENT_JOOMLA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"joomla\"}','','','',0,'0000-00-00 00:00:00',0,0),(436,'plg_system_languagecode','plugin','languagecode','system',0,0,1,0,'{\"name\":\"plg_system_languagecode\",\"type\":\"plugin\",\"creationDate\":\"November 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SYSTEM_LANGUAGECODE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"languagecode\"}','','','',0,'0000-00-00 00:00:00',10,0),(437,'plg_quickicon_joomlaupdate','plugin','joomlaupdate','quickicon',0,1,1,1,'{\"name\":\"plg_quickicon_joomlaupdate\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_QUICKICON_JOOMLAUPDATE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"joomlaupdate\"}','','','',0,'0000-00-00 00:00:00',0,0),(438,'plg_quickicon_extensionupdate','plugin','extensionupdate','quickicon',0,1,1,1,'{\"name\":\"plg_quickicon_extensionupdate\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_QUICKICON_EXTENSIONUPDATE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"extensionupdate\"}','','','',0,'0000-00-00 00:00:00',0,0),(439,'plg_captcha_recaptcha','plugin','recaptcha','captcha',0,0,1,0,'{\"name\":\"plg_captcha_recaptcha\",\"type\":\"plugin\",\"creationDate\":\"December 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.4.0\",\"description\":\"PLG_CAPTCHA_RECAPTCHA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"recaptcha\"}','{\"public_key\":\"\",\"private_key\":\"\",\"theme\":\"clean\"}','','',0,'0000-00-00 00:00:00',0,0),(440,'plg_system_highlight','plugin','highlight','system',0,1,1,0,'{\"name\":\"plg_system_highlight\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SYSTEM_HIGHLIGHT_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',7,0),(441,'plg_content_finder','plugin','finder','content',0,0,1,0,'{\"name\":\"plg_content_finder\",\"type\":\"plugin\",\"creationDate\":\"December 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_CONTENT_FINDER_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(442,'plg_finder_categories','plugin','categories','finder',0,1,1,0,'{\"name\":\"plg_finder_categories\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_FINDER_CATEGORIES_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"categories\"}','','','',0,'0000-00-00 00:00:00',1,0),(443,'plg_finder_contacts','plugin','contacts','finder',0,1,1,0,'{\"name\":\"plg_finder_contacts\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_FINDER_CONTACTS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contacts\"}','','','',0,'0000-00-00 00:00:00',2,0),(444,'plg_finder_content','plugin','content','finder',0,1,1,0,'{\"name\":\"plg_finder_content\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_FINDER_CONTENT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"content\"}','','','',0,'0000-00-00 00:00:00',3,0),(445,'plg_finder_newsfeeds','plugin','newsfeeds','finder',0,1,1,0,'{\"name\":\"plg_finder_newsfeeds\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_FINDER_NEWSFEEDS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"newsfeeds\"}','','','',0,'0000-00-00 00:00:00',4,0),(446,'plg_finder_weblinks','plugin','weblinks','finder',0,1,1,0,'{\"name\":\"plg_finder_weblinks\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_FINDER_WEBLINKS_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',5,0),(447,'plg_finder_tags','plugin','tags','finder',0,1,1,0,'{\"name\":\"plg_finder_tags\",\"type\":\"plugin\",\"creationDate\":\"February 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_FINDER_TAGS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"tags\"}','','','',0,'0000-00-00 00:00:00',0,0),(448,'plg_twofactorauth_totp','plugin','totp','twofactorauth',0,0,1,0,'{\"name\":\"plg_twofactorauth_totp\",\"type\":\"plugin\",\"creationDate\":\"August 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.2.0\",\"description\":\"PLG_TWOFACTORAUTH_TOTP_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"totp\"}','','','',0,'0000-00-00 00:00:00',0,0),(449,'plg_authentication_cookie','plugin','cookie','authentication',0,1,1,0,'{\"name\":\"plg_authentication_cookie\",\"type\":\"plugin\",\"creationDate\":\"July 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_AUTH_COOKIE_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(450,'plg_twofactorauth_yubikey','plugin','yubikey','twofactorauth',0,0,1,0,'{\"name\":\"plg_twofactorauth_yubikey\",\"type\":\"plugin\",\"creationDate\":\"September 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.2.0\",\"description\":\"PLG_TWOFACTORAUTH_YUBIKEY_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"yubikey\"}','','','',0,'0000-00-00 00:00:00',0,0),(451,'plg_search_tags','plugin','tags','search',0,1,1,0,'{\"name\":\"plg_search_tags\",\"type\":\"plugin\",\"creationDate\":\"March 2014\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SEARCH_TAGS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"tags\"}','{\"search_limit\":\"50\",\"show_tagged_items\":\"1\"}','','',0,'0000-00-00 00:00:00',0,0),(503,'beez3','template','beez3','',0,1,1,0,'{\"name\":\"beez3\",\"type\":\"template\",\"creationDate\":\"25 November 2009\",\"author\":\"Angie Radtke\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters, Inc. All rights reserved.\",\"authorEmail\":\"a.radtke@derauftritt.de\",\"authorUrl\":\"http:\\/\\/www.der-auftritt.de\",\"version\":\"3.1.0\",\"description\":\"TPL_BEEZ3_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"templateDetails\"}','{\"wrapperSmall\":\"53\",\"wrapperLarge\":\"72\",\"sitetitle\":\"\",\"sitedescription\":\"\",\"navposition\":\"center\",\"templatecolor\":\"nature\"}','','',0,'0000-00-00 00:00:00',0,0),(504,'hathor','template','hathor','',1,1,1,0,'{\"name\":\"hathor\",\"type\":\"template\",\"creationDate\":\"May 2010\",\"author\":\"Andrea Tarr\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters, Inc. All rights reserved.\",\"authorEmail\":\"hathor@tarrconsulting.com\",\"authorUrl\":\"http:\\/\\/www.tarrconsulting.com\",\"version\":\"3.0.0\",\"description\":\"TPL_HATHOR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"templateDetails\"}','{\"showSiteName\":\"0\",\"colourChoice\":\"0\",\"boldText\":\"0\"}','','',0,'0000-00-00 00:00:00',0,0),(506,'protostar','template','protostar','',0,1,1,0,'{\"name\":\"protostar\",\"type\":\"template\",\"creationDate\":\"4\\/30\\/2012\",\"author\":\"Kyle Ledbetter\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters, Inc. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"\",\"version\":\"1.0\",\"description\":\"TPL_PROTOSTAR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"templateDetails\"}','{\"templateColor\":\"\",\"logoFile\":\"\",\"googleFont\":\"1\",\"googleFontName\":\"Open+Sans\",\"fluidContainer\":\"0\"}','','',0,'0000-00-00 00:00:00',0,0),(507,'isis','template','isis','',1,1,1,0,'{\"name\":\"isis\",\"type\":\"template\",\"creationDate\":\"3\\/30\\/2012\",\"author\":\"Kyle Ledbetter\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters, Inc. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"\",\"version\":\"1.0\",\"description\":\"TPL_ISIS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"templateDetails\"}','{\"templateColor\":\"\",\"logoFile\":\"\"}','','',0,'0000-00-00 00:00:00',0,0),(600,'English (en-GB)','language','en-GB','',0,1,1,1,'{\"name\":\"English (en-GB)\",\"type\":\"language\",\"creationDate\":\"2013-03-07\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.4.0\",\"description\":\"en-GB site language\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(601,'English (en-GB)','language','en-GB','',1,1,1,1,'{\"name\":\"English (en-GB)\",\"type\":\"language\",\"creationDate\":\"2013-03-07\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.4.0\",\"description\":\"en-GB administrator language\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(700,'files_joomla','file','joomla','',0,1,1,1,'{\"name\":\"files_joomla\",\"type\":\"file\",\"creationDate\":\"February 2015\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2015 Open Source Matters. All rights reserved\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.4.0\",\"description\":\"FILES_JOOMLA_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(801,'weblinks','package','pkg_weblinks','',0,1,1,0,'','','','',0,'0000-00-00 00:00:00',0,0),(10000,'es-ES_joomla_lang_full_3.4.0v1','language','es-ES','',0,1,0,0,'{\"name\":\"es-ES_joomla_lang_full_3.4.0v1\",\"type\":\"language\",\"creationDate\":\"25\\/02\\/2015\",\"author\":\"Spanish Translation Team: Comunidad Joomla\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters, Inc. All rights reserved.\",\"authorEmail\":\"info@comunidadjoomla.org\",\"authorUrl\":\"http:\\/\\/www.comunidadjoomla.org\",\"version\":\"3.4.0.1\",\"description\":\"es-ESsite language\",\"group\":\"\",\"filename\":\"install\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(10001,'es-ES_joomla_lang_full_3.4.0v1','language','es-ES','',1,1,0,0,'{\"name\":\"es-ES_joomla_lang_full_3.4.0v1\",\"type\":\"language\",\"creationDate\":\"25\\/02\\/2015\",\"author\":\"Spanish Translation Team: Comunidad Joomla\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters, Inc. All rights reserved.\",\"authorEmail\":\"info@comunidadjoomla.org\",\"authorUrl\":\"http:\\/\\/www.comunidadjoomla.org\",\"version\":\"3.4.0.1\",\"description\":\"es-ESsite language\",\"group\":\"\",\"filename\":\"install\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(10002,'es-ES_joomla_lang_full_3.4.0v1','package','pkg_es-ES','',0,1,1,0,'{\"name\":\"es-ES_joomla_lang_full_3.4.0v1\",\"type\":\"package\",\"creationDate\":\"25\\/02\\/2015\",\"author\":\"Spanish Translation Team: Comunidad Joomla\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters, Inc. All rights reserved.\",\"authorEmail\":\"info@comunidadjoomla.org\",\"authorUrl\":\"http:\\/\\/www.comunidadjoomla.org\",\"version\":\"3.4.0.1\",\"description\":\"<div style=\\\"text-align:left;\\\"><h2>Successfully installed the spanish language pack for Joomla! 3.4.0.<\\/h2><p><\\/p><p>Please report any bugs or issues at the Comunidad Joomla! <a href=\\\"http:\\/\\/foro.comunidadjoomla.org\\/traduccion-ext\\/\\\" target=\\\"_blank\\\">Translation forum<\\/a><\\/p><p><\\/p><p>Translated by: <a href=\\\"http:\\/\\/www.comunidadjoomla.org\\\" target=\\\"_blank\\\" title=\\\"\\\">The spanish translation team of Comunidad Joomla!<\\/a><\\/p><h2>El paquete en espa\\u00f1ol para Joomla! 3.4.0 se ha instalado correctamente.<\\/h2><p><\\/p><p>Por favor, reporte cualquier bug o asunto relacionado a nuestro <a href=\\\"http:\\/\\/foro.comunidadjoomla.org\\/traduccion-ext\\/\\\" target=\\\"_blank\\\">Foro de traducciones<\\/a><\\/p><p><\\/p><p>Traducci\\u00f3n: <a href=\\\"http:\\/\\/www.comunidadjoomla.org\\\" target=\\\"_blank\\\" title=\\\"\\\">El equipo de traducci\\u00f3n de Comunidad Joomla!<\\/a><\\/p><\\/div>\",\"group\":\"\",\"filename\":\"pkg_es-ES\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(10003,'DirectPHP','plugin','DirectPHP','content',0,1,1,0,'{\"name\":\"DirectPHP\",\"type\":\"plugin\",\"creationDate\":\"Oct 2011\",\"author\":\"kksou\",\"copyright\":\"(C) kksou.com. All Rights Reserved.\",\"authorEmail\":\"support@kksou.com\",\"authorUrl\":\"www.kksou.com\\/php-gtk2\\/\",\"version\":\"3.0\",\"description\":\"This plugin allows direct embedding of PHP commands right inside Joomla content page for dynamic contents. To see examples of using this plugin, please refer to: http:\\/\\/www.kksou.com\\/php-gtk2\\/Joomla\\/DirectPHP-plugin.php\",\"group\":\"\"}','{\"using_no_editor\":\"0\",\"block_list\":\"basename, chgrp, chmod, chown, clearstatcache, copy, delete, dirname, disk_free_space, disk_total_space, diskfreespace, fclose, feof, fflush, fgetc, fgetcsv, fgets, fgetss, file_exists, file_get_contents, file_put_contents, file, fileatime, filectime, filegroup, fileinode, filemtime, fileowner, fileperms, filesize, filetype, flock, fnmatch, fopen, fpassthru, fputcsv, fputs, fread, fscanf, fseek, fstat, ftell, ftruncate, fwrite, glob, lchgrp, lchown, link, linkinfo, lstat, move_uploaded_file, opendir, parse_ini_file, pathinfo, pclose, popen, readfile, readdir, readllink, realpath, rename, rewind, rmdir, set_file_buffer, stat, symlink, tempnam, tmpfile, touch, umask, unlink, fsockopen, system, exec, passthru, escapeshellcmd, pcntl_exec, proc_open, proc_close, mkdir, rmdir\"}','','',0,'0000-00-00 00:00:00',0,0),(10004,'Content - Load Form Maker','plugin','loadformmaker','content',0,1,1,0,'{\"name\":\"Content - Load Form Maker\",\"type\":\"plugin\",\"creationDate\":\"February 2012\",\"author\":\"Web Dorado\",\"copyright\":\"Copyright (C) 2014 Web-Dorado.com. All rights reserved.\",\"authorEmail\":\"info@web-dorado.com\",\"authorUrl\":\"http:\\/\\/www.Web-Dorado.com\",\"version\":\"3.5.3\",\"description\":\"\\tForm Maker is a modern and advanced tool for creating Joomla! forms easily and fast.\\n\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(10005,'Form Maker Module','module','mod_formmaker','',0,1,0,0,'{\"name\":\"Form Maker Module\",\"type\":\"module\",\"creationDate\":\"January 2011\",\"author\":\"Web-Dorado\",\"copyright\":\"Copyright (C) 2014 Web-Dorado.com All rights reserved.\",\"authorEmail\":\"info@web-dorado.com\",\"authorUrl\":\"http:\\/\\/www.web-dorado.com\\/\",\"version\":\"3.5.3\",\"description\":\"\\t\\tForm Maker is a modern and advanced tool for creating Joomla! forms easily and fast.\",\"group\":\"\"}','[]','','',0,'0000-00-00 00:00:00',0,0),(10006,'com_formmaker','component','com_formmaker','',1,1,0,0,'{\"name\":\"COM_FORMMAKER\",\"type\":\"component\",\"creationDate\":\"September 2011\",\"author\":\"Web Dorado\",\"copyright\":\"Copyright (C) 2013 Web-Dorado.com All rights reserved.\",\"authorEmail\":\"info@web-dorado.com\",\"authorUrl\":\"http:\\/\\/web-dorado.com\\/\",\"version\":\"3.5.3\",\"description\":\"\\n\\t\\tForm Maker is a modern and advanced tool for creating Joomla! forms easily and fast.\\n\\t\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(10007,'formmaker','package','pkg_formmaker','',0,1,1,0,'{\"name\":\"Form Maker\",\"type\":\"package\",\"creationDate\":\"September 2011\",\"author\":\"Web Dorado\",\"copyright\":\"Copyright (C) 2014 Web-Dorado.com All rights reserved.\",\"authorEmail\":\"info@web-dorado.com\",\"authorUrl\":\"http:\\/\\/web-dorado.com\\/\",\"version\":\"3.5.3\",\"description\":\"\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(10008,'plg_installer_webinstaller','plugin','webinstaller','installer',0,1,1,0,'{\"name\":\"plg_installer_webinstaller\",\"type\":\"plugin\",\"creationDate\":\"18 December 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"1.0.5\",\"description\":\"PLG_INSTALLER_WEBINSTALLER_XML_DESCRIPTION\",\"group\":\"\"}','{\"tab_position\":\"0\"}','','',0,'0000-00-00 00:00:00',0,0),(10009,'TravelAgent','template','travelagent','',0,1,1,0,'{\"name\":\"Travel Agent\",\"type\":\"template\",\"creationDate\":\"January 2015\",\"author\":\"JoomlaSaver\",\"copyright\":\"JoomlaSaver 2013\",\"authorEmail\":\"mail@joomlasaver.com\",\"authorUrl\":\"http:\\/\\/www.joomlasaver.com\",\"version\":\"1.0\",\"description\":\"<div style=\\\"border:1px solid #c0c0c0; padding:15px; text-align:center; margin:0 auto;\\\">Travel Agent<br \\/>Joomla 2.5 & 3.3 Templates<br \\/>GNU\\/GPL License<br \\/><br \\/>Visit <a href=\\\"http:\\/\\/www.joomlasaver.com\\\">JoomlaSaver<\\/a><br \\/>Contact <a href=\\\"mailto:mail@joomlasaver.com\\\">JoomlaSaver<\\/a><\\/div>\",\"group\":\"\"}','{\"logo\":\"templates\\/travelagent\\/images\\/logo.png\",\"responsive\":\"yes\",\"fontfamily\":\"fontfamily1\",\"centerposition\":\"centerright\",\"expand\":\"no\",\"showheader\":\"yes\",\"bannerwidth\":\"fix\",\"copyright\":\"\",\"jqueryactive\":\"yes\",\"unsetjoomjs\":\"yes\",\"unsetbootstrap\":\"yes\"}','','',0,'0000-00-00 00:00:00',0,0),(10010,'breezingforms','component','com_breezingforms','',1,1,0,0,'{\"name\":\"BreezingForms\",\"type\":\"component\",\"creationDate\":\"2014-11-25\",\"author\":\"Markus Bopp - Crosstec GmbH & Co. KG | Until FacileForms Version 1.4.7: Peter Koch\",\"copyright\":\"This Joomla! component is released under the GNU\\/GPL license\",\"authorEmail\":\"markus.bopp@crosstec.de\",\"authorUrl\":\"www.crosstec.de\",\"version\":\"Lite (build 906)\",\"description\":\"Installation successful. Next find BreezingForms in the Components menu, and continue with step 2 of the installation process.\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(10011,'BreezingForms','module','mod_breezingforms','',0,1,0,0,'{\"name\":\"BreezingForms\",\"type\":\"module\",\"creationDate\":\"November 2013\",\"author\":\"Markus Bopp - Crosstec Solutions | Until Version 1.4.7: Peter Koch\",\"copyright\":\"This Joomla! component is released under the GNU\\/GPL license\",\"authorEmail\":\"markus.bopp@crosstec.de\",\"authorUrl\":\"www.crosstec.de\",\"version\":\"1.8.4\",\"description\":\"\\n\\t\\tEnter the form name for displaying in the desired module position.\\n    \",\"group\":\"\"}','{\"ff_mod_name\":\"\",\"ff_mod_page\":\"1\",\"ff_mod_editable\":\"0\",\"ff_mod_editable_override\":\"0\",\"ff_mod_frame\":\"0\",\"ff_mod_border\":\"0\",\"ff_mod_align\":\"1\",\"ff_mod_left\":\"0\",\"ff_mod_top\":\"0\",\"ff_mod_parprv\":\"\",\"ff_mod_parpub\":\"\",\"moduleclass_sfx\":\"\",\"owncache\":\"0\"}','','',0,'0000-00-00 00:00:00',0,0),(10012,'BreezingForms','plugin','breezingforms','content',0,0,1,0,'{\"name\":\"BreezingForms\",\"type\":\"plugin\",\"creationDate\":\"August 2012\",\"author\":\"Markus Bopp - Crosstec Solutions | Until Version 1.4.7: Peter Koch\",\"copyright\":\"This Joomla! component is released under the GNU\\/GPL license\",\"authorEmail\":\"markus.bopp@crosstec.de\",\"authorUrl\":\"www.crosstec.de\",\"version\":\"1.8\",\"description\":\"\\n\\t\\n<h3>BreezingForms<\\/h3>\\n\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t<h2>BreezingForms Plugin: Displays forms inline in articles<\\/h2>\\n<h3>Requirements:<\\/h3><ul>\\n\\n<li>The BreezingForms component must also be installed (same version)<\\/li>\\n<li>The bot must be published<\\/li>\\n<\\/ul>\\n<h3>Pattern syntax:<\\/h3><code><pre>\\n\\t{ BreezingForms : <em>formname<\\/em> [, <em>page<\\/em>, <em>border<\\/em>, <em>urlparams<\\/em>, <em>suffix<\\/em> ] }\\n\\n<\\/pre><\\/code><h3>Parameter description:<\\/h3><code><pre>\\n\\tBreezingForms : This tag must be present literally and in exact upper\\/lowercase.\\n\\t<em>formname<\\/em>    : The name of the form to include, also in exact upper\\/lowercase.\\n\\t<em>page<\\/em>        : The starting page number.   Defaults to 1 when omitted.\\n\\t<em>border<\\/em>      : 0=no border, 1=with border. Defaults to 1 when omitted.\\n\\t<em>urlparams<\\/em>   : Parameters to pass in URL style (no commas or closing brackets allowed).\\n\\t<em>suffix<\\/em>      : Suffix appended to all CSS class names in the form.\\n\\n<\\/pre><\\/code><h3>Examples:<\\/h3><code><pre>\\n\\t{ BreezingForms : SampleContactForm }\\n\\t{ BreezingForms : MyVeryForm, 2 }\\n\\t{ BreezingForms : AnotherForm, 1, 0, &amp;amp;ff_param_xy=123&amp;amp;ff_param_foo=bar }\\n\\t{BreezingForms:testform,,,&amp;amp;ff_param_foo=bar,mysuffix}\\n<\\/pre><\\/code>But attention with the following one. Basicly it would work, but when\\nusing a WYSIWYG editor, it will insert linebreaks as <code>&lt;br\\/&gt;<\\/code>\\nand the bot will no longer recognize the pattern:<code><pre>\\n\\t{\\n\\t\\tBreezingForms:\\n\\n\\t\\t\\tAnotherForm,\\n\\t\\t\\t1,\\n\\t\\t\\t0,\\n\\t\\t\\t&amp;amp;ff_param_xy=123&amp;amp;ff_param_foo=bar\\n\\t}\\n<\\/pre><\\/code>\\n\\n\\n    \",\"group\":\"\"}','{\"load_in_iframe\":\"0\"}','','',0,'0000-00-00 00:00:00',0,0),(10013,'Simple File Upload v1.3 (for Joomla 3)','module','mod_simplefileuploadv1.3','',0,1,0,0,'{\"name\":\"Simple File Upload v1.3 (for Joomla 3)\",\"type\":\"module\",\"creationDate\":\"January 2011\",\"author\":\"Anders Wasen\",\"copyright\":\"Copyright (C) 2011-2012 Anders Was\\u00e9n. All rights reserved.\",\"authorEmail\":\"awasen@gmail.com\",\"authorUrl\":\"wasen.net\",\"version\":\"1.3\",\"description\":\"A simple upload module. Will allow a user to upload a file to the given folder fetched from the parameter settings.\",\"group\":\"\"}','{\"upload_donate\":\"\",\"upload_location\":\".\\/images\\/\",\"upload_maxsize\":\"100000\",\"upload_capthca\":\"0\",\"upload_capthcacase\":\"0\",\"upload_capthcacasemsg\":\"0\",\"upload_email\":\"\",\"upload_emailmsg\":\"0\",\"upload_emailhtml\":\"1\",\"upload_filetypes\":\"image\\/gif;image\\/jpeg;image\\/pjpeg;image\\/png;image\\/x-png\",\"upload_blacklist\":\".php .php3 .php4 .php5 .php6 .phtml .pl .py .jsp .asp .htm .html .shtml .sh .cgi .exe .bat .cmd\",\"upload_doubleext\":\"1\",\"upload_phpext\":\"1\",\"upload_gifcomment\":\"1\",\"upload_fileexist\":\"2\",\"upload_multi\":\"0\",\"upload_maxmulti\":\"\",\"upload_startmulti\":\"\"}','','',0,'0000-00-00 00:00:00',0,0),(10014,'joom','template','joom','',0,1,1,0,'{\"name\":\"joom\",\"type\":\"template\",\"creationDate\":\"January 2015\",\"author\":\"Web-Komp\",\"copyright\":\"Copyright (C) Web-Komp\",\"authorEmail\":\"biuro@web-komp.eu\",\"authorUrl\":\"http:\\/\\/www.web-komp.eu\",\"version\":\"1.0.0\",\"description\":\"Joom! Template for Joomla 3.X. Template Develop by www.web-komp.eu Template that has been built on a Warp framework 7 by Yootheme, using the latest techniques in HTML5 CSS3 LESS\",\"group\":\"\"}','{\"config\":\"\"}','','',0,'0000-00-00 00:00:00',0,0),(10015,'JA T3 Framework','plugin','jat3','system',0,1,1,0,'{\"name\":\"JA T3 Framework\",\"type\":\"plugin\",\"creationDate\":\"14 March 2014\",\"author\":\"www.JoomlArt.com\",\"copyright\":\"Copyright (C), J.O.O.M Solutions Co., Ltd. All Rights Reserved.\",\"authorEmail\":\"webmaster@joomlart.com\",\"authorUrl\":\"http:\\/\\/www.joomlart.com\",\"version\":\"2.7.1\",\"description\":\"\\n\\t\\n\\t\\t<h1>T3 Framework - JoomlArt Template Framework for Joomla 2.5 and Joomla 3.2<\\/h1>\\n\\t\\t<div style=\'font-weight: normal\'>\\n\\t\\t<p><span style=\'color: #ff6600;\'>\\n\\t\\t<strong>Features:<\\/strong><\\/span>\\n\\t\\tThis plugin is required for JA T3 Framework based templates to work.<\\/p>\\n\\t\\t\\n\\t\\t<strong><span style=\'color: #ff0000;\'>Usage Instruction:<\\/span><\\/strong><br \\/>\\n\\t\\t<ul>\\n\\t\\t<li>Enable the JA T3 plugin in Plugin manager<\\/li>\\n\\t\\t<\\/ul>\\n\\t\\t<strong><span style=\'color: #ff0000;\'>Upgrade Method:<\\/span><br \\/><\\/strong>\\n\\t\\t<ul>\\n\\t\\t  <li>You can install new version directly over this version. Uninstallation is not required. <\\/li>\\n\\t\\t  <li>Follow upgrade instructions and backup site \\/ plugin before upgrading<\\/li>\\n\\t\\t  <\\/ul>\\n\\t\\n\\t\\t<span style=\'color: #008000;\'><strong>Links:<\\/strong><\\/span><br \\/>\\n\\t\\t<ul>\\n\\t\\t<li><a target=\\\"_blank\\\" href=\\\"http:\\/\\/wiki.joomlart.com\\/wiki\\/JA_T3_Framework_2\\/Overview\\\">Wiki Userguide<\\/a><\\/li>\\n\\t\\t <li><a target=\'_blank\' href=\'http:\\/\\/update.joomlart.com\\/\'>Updates &amp; Versions<\\/a><\\/li>\\n\\t\\t <li><a target=\'_blank\' href=\'http:\\/\\/www.joomlart.com\\/forums\\/forumdisplay.php?241\'>JA T3 Framework Forum<\\/a><\\/li>\\n\\t\\t<\\/ul>\\n\\t\\t<p>Copyright 2004 - 2013 <a href=\'http:\\/\\/www.joomlart.com\\/\' title=\'Visit Joomlart.com!\'>JoomlArt.com<\\/a>.<\\/p>\\n\\t\\t<\\/div>\\n\\t\\t\\n\\t\\t\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',1000,0),(10016,'JA Typo','plugin','jatypo','system',0,0,1,0,'{\"name\":\"JA Typo\",\"type\":\"plugin\",\"creationDate\":\"20 Dec 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.6\",\"description\":\"\\n\\t\\n\\t<div style=\'text-align: left;\'>\\n\\t<h1>JA Typo Plugin for Joomla! 2.5<\\/h1>\\n\\t<p><span style=\\\"color: #ff6600;\\\"><strong>Features:<\\/strong><\\/span><\\/p>\\n\\t<img border=\\\"0\\\" alt=\\\"JA Typography Plugin\\\" src=\\\"http:\\/\\/asset.joomlart.com\\/images\\/stories\\/extensions\\/joomla\\/jaec_typo_plg.png\\\" style=\\\"float: left;\\\">\\n\\tBonus Typography styles for your content. Choose styles right from your editor window. \\n\\tColorful buttons, tables, forms, tags, headings, lists, badges, icons, CSS3 buttons and more styles will come up...\\n\\t<p><strong><span style=\\\"color: #ff0000;\\\">Important Instruction:<\\/span><br \\/><\\/strong><\\/p>\\n\\t<ul><li>Install JA Typo Button Plugin for this to be seen in the Editor<\\/li>\\n\\t<li>You can use many types to load from a popup<\\/li>\\n\\t<\\/ul>\\n\\t<p><strong><span style=\\\"color: #ff0000;\\\">Upgrade Method:<\\/span><br \\/><\\/strong><\\/p>\\n\\t<ol><li>You can install new version directly over this version. Uninstallation is not required. Backup any customized files before upgrading.<\\/li><\\/ol>\\n\\t<p><span style=\\\"color: #008000;\\\"><strong>Links :<\\/strong><\\/span><\\/p>\\n\\t<ul>\\n\\t<li><a target=\\\"_blank\\\" href=\\\"http:\\/\\/www.joomlart.com\\/forums\\/showthread.php?49821\\\">General Userguide<\\/a><\\/li>\\n\\t\\t <li><a target=\'_blank\' href=\'http:\\/\\/update.joomlart.com\\/\'>Updates &amp; Versions<\\/a><\\/li>\\n\\t<\\/ul>\\n\\t<p>Copyright 2004 - 2012 <a href=\\\"http:\\/\\/www.joomlart.com\\/\\\" title=\\\"Visit Joomlart.com!\\\">JoomlArt.com<\\/a>.<\\/p>\\n\\t<\\/div>\\n\\t\\n\\t\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(10017,'ext_auto','template','ext_auto','',0,1,1,0,'{\"name\":\"ext_auto\",\"type\":\"template\",\"creationDate\":\"August 2011\",\"author\":\"http:\\/\\/platinum-joomla-templates.com\\/\",\"copyright\":\"Copyright (C) 2011-2015 Platinum-Joomla-Templates.com. All Rights Reserved.\",\"authorEmail\":\"platinum.joomla.templates@gmail.com\",\"authorUrl\":\"http:\\/\\/platinum-joomla-templates.com\\/\",\"version\":\"1.2\",\"description\":\"\\n\\t\\n\\t\\t<div align=\\\"center\\\">\\n\\t\\t\\t<div class=\\\"alert alert-success\\\" style=\\\"background-color:#DFF0D8;border-color:#D6E9C6;color: #468847;padding: 1px 0;\\\">\\t\\t\\t\\n\\t\\t\\t\\t<p> <\\/p>\\t\\t\\t\\t\\n\\t\\t\\t\\t<p>Copyright 2011 - 2015 <a href=\'http:\\/\\/platinum-joomla-templates.com\\/\' title=\'Visit Platinum-Joomla-Templates.com!\'>Platinum-Joomla-Templates.com<\\/a>.<\\/p>\\n\\t\\t\\t\\t<p> <\\/p>\\t\\n\\t\\t\\t<\\/div>\\n\\t\\t\\t<style>table.adminform{width: 100%;}<\\/style>\\n\\t\\t<\\/div>\\n\\t\\t\\n\\t\\t\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(10018,'ext_auto','package','pkg_ext_auto','',0,1,1,0,'{\"name\":\"EXT Auto Package\",\"type\":\"package\",\"creationDate\":\"04\\/03\\/2014\",\"author\":\"Platinum-Joomla-Templates.com\",\"copyright\":\"Copyright (C) 2011-2015 Platinum-Joomla-Templates.com. All Rights Reserved.\",\"authorEmail\":\"platinum.joomla.templates@gmail.com\",\"authorUrl\":\"http:\\/\\/platinum-joomla-templates.com\\/\",\"version\":\"1.0\",\"description\":\"\\t\\n\\t\\n\\t\\t<div align=\\\"center\\\">\\n\\t\\t\\t<div class=\\\"alert alert-success\\\" style=\\\"background-color:#DFF0D8;border-color:#D6E9C6;color: #468847;padding: 1px 0;\\\">\\t\\t\\t\\n\\t\\t\\t\\t<p> <\\/p>\\n\\t\\t\\t\\t<span style=\\\"color:#FF0000\\\">Note: Templates requires T3 plugin to be installed and enabled.<\\/span><p><\\/p>\\n\\t\\t\\t\\t<p>Copyright 2011 - 2015 <a href=\'http:\\/\\/platinum-joomla-templates.com\\/\' title=\'Visit Platinum-Joomla-Templates.com!\'>Platinum-Joomla-Templates.com<\\/a>.<\\/p>\\n\\t\\t\\t<\\/div>\\n\\t\\t\\t<style>table.adminform{width: 100%;}<\\/style>\\n\\t\\t<\\/div>\\n\\t\\t\\n\\t\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(10019,'lt_industrial_onepage','template','lt_industrial_onepage','',0,1,1,0,'{\"name\":\"lt_industrial_onepage\",\"type\":\"template\",\"creationDate\":\"May 2014\",\"author\":\"LTheme.com\",\"copyright\":\"Copyright (C) 2010 - 2014 LTheme.com. All rights reserved.\",\"authorEmail\":\"admin@ltheme.com\",\"authorUrl\":\"http:\\/\\/www.ltheme.com\",\"version\":\"1.0\",\"description\":\"\\n        \\n            <h3>LT Industrial - Onepage Joomla! Template<\\/h3>\\n        \\n    \",\"group\":\"\"}','{\"layout_width\":\"1170\",\"layout_type\":\"responsive\",\"logo_type\":\"image\",\"logo_position\":\"logo\",\"logo_type_text\":\"LT Industrial \",\"logo_type_slogan\":\"Joomla! Industrial template\",\"logo_width\":\"115\",\"logo_height\":\"70\",\"preset\":\"preset1\",\"preset1_title\":\"#333333\",\"preset1_bg\":\"#ffffff\",\"preset1_text\":\"#666666\",\"preset1_link\":\"#0db3c7\",\"preset2_title\":\"#333333\",\"preset2_bg\":\"#ffffff\",\"preset2_text\":\"#444444\",\"preset2_link\":\"#f7ca18\",\"preset3_title\":\"#333333\",\"preset3_bg\":\"#ffffff\",\"preset3_text\":\"#666666\",\"preset3_link\":\"#20c55a\",\"preset4_title\":\"#333333\",\"preset4_bg\":\"#ffffff\",\"preset4_text\":\"#666666\",\"preset4_link\":\"#304559\",\"preset5_title\":\"#333333\",\"preset5_bg\":\"#ffffff\",\"preset5_text\":\"#666666\",\"preset5_link\":\"#ef4836\",\"preset6_title\":\"#333333\",\"preset6_bg\":\"#ffffff\",\"preset6_text\":\"#666666\",\"preset6_link\":\"#913D88\",\"menu\":\"mainmenu\",\"menutype\":\"mega\",\"menu_col_width\":\"200\",\"show_menu_image\":\"1\",\"menu_image_position\":\"1\",\"submenu_position\":\"0\",\"init_x\":\"0\",\"init_y\":\"0\",\"sub_x\":\"0\",\"sub_y\":\"0\",\"body_font\":\"Raleway\",\"header_font\":\"Raleway\",\"header_selectors\":\"\",\"other_font\":\"\",\"cache_time\":\"60\",\"compress_css\":\"0\",\"compress_js\":\"0\",\"enable_ga\":\"0\",\"ga_code\":\"\",\"loadjquery\":\"0\",\"loadfromcdn\":\"0\",\"hide_component_area\":\"0\"}','','',0,'0000-00-00 00:00:00',0,0),(10020,'System - Helix Framework','plugin','helix','system',0,0,1,0,'{\"name\":\"System - Helix Framework\",\"type\":\"plugin\",\"creationDate\":\"March 2011\",\"author\":\"JoomShaper.com\",\"copyright\":\"Copyright (C) 2010 - 2014 JoomShaper. All rights reserved.\",\"authorEmail\":\"support@joomshaper.com\",\"authorUrl\":\"www.joomshaper.com\",\"version\":\"2.1.8\",\"description\":\"Helix Framework - JoomShaper Template Framework for Joomla 2.5 and 3.X\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(10022,'PLG_SYSTEM_SOURCERER','plugin','sourcerer','system',0,1,1,0,'{\"name\":\"PLG_SYSTEM_SOURCERER\",\"type\":\"plugin\",\"creationDate\":\"February 2015\",\"author\":\"NoNumber (Peter van Westen)\",\"copyright\":\"Copyright \\u00a9 2015 NoNumber All Rights Reserved\",\"authorEmail\":\"peter@nonumber.nl\",\"authorUrl\":\"http:\\/\\/www.nonumber.nl\",\"version\":\"4.4.9FREE\",\"description\":\"PLG_SYSTEM_SOURCERER_DESC\",\"group\":\"\",\"filename\":\"sourcerer\"}','','','',0,'0000-00-00 00:00:00',0,0),(10023,'PLG_EDITORS-XTD_SOURCERER','plugin','sourcerer','editors-xtd',0,1,1,0,'{\"name\":\"PLG_EDITORS-XTD_SOURCERER\",\"type\":\"plugin\",\"creationDate\":\"February 2015\",\"author\":\"NoNumber (Peter van Westen)\",\"copyright\":\"Copyright \\u00a9 2015 NoNumber All Rights Reserved\",\"authorEmail\":\"peter@nonumber.nl\",\"authorUrl\":\"http:\\/\\/www.nonumber.nl\",\"version\":\"4.4.9FREE\",\"description\":\"PLG_EDITORS-XTD_SOURCERER_DESC\",\"group\":\"\",\"filename\":\"sourcerer\"}','','','',0,'0000-00-00 00:00:00',0,0),(10024,'eorisis_jquery','plugin','eorisis_jquery','system',0,1,1,0,'{\"name\":\"eorisis_jquery\",\"type\":\"plugin\",\"creationDate\":\"2 March 2015\",\"author\":\"eorisis.com\",\"copyright\":\"Copyright (C) 2012-2015 eorisis. All Rights Reserved.\",\"authorEmail\":\"info@eorisis.com\",\"authorUrl\":\"http:\\/\\/eorisis.com\",\"version\":\"1.3.4\",\"description\":\"PLG_SYSTEM_EORISIS_JQUERY_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"eorisis_jquery\"}','{\"jq_lib_area\":\"1\",\"jq_lib_state\":\"2\",\"jq_lib_version_choice\":\"1\",\"jq_lib_source_latest\":\"1\",\"jq_lib_source_specific\":\"1\",\"jq_lib_source_specific_cdn\":\"1\",\"jq_lib_version\":\"1.11.2\",\"jq_lib_custom_version_type\":\"1\",\"jq_lib_cdn_fallback\":\"0\",\"migrate\":\"1\",\"migrate_version\":\"1.2.1\",\"migrate_source\":\"1\",\"migrate_source_cdn\":\"1\",\"migrate_cdn_fallback\":\"0\",\"ui_area\":\"0\",\"ui_state\":\"2\",\"ui_elem\":\"js\",\"ui_theme\":\"ui-lightness\",\"ui_version\":\"1.9.2\",\"ui_source\":\"1\",\"ui_source_cdn\":\"1\",\"ui_cdn_fallback\":\"0\",\"ui_custom\":\"0\",\"tb_area\":\"0\",\"tb_state\":\"2\",\"tb_elem\":\"js\",\"tb_theme\":\"0\",\"tb_version\":\"2.3.2\",\"tb_source\":\"1\",\"tb_source_cdn\":\"1\",\"tb_cdn_fallback\":\"0\",\"chosen_area\":\"0\",\"chosen_state\":\"2\",\"chosen_version\":\"0.9.12\",\"chosen_source\":\"1\",\"chosen_source_cdn\":\"1\",\"chosen_cdn_fallback\":\"0\",\"easing_area\":\"0\",\"easing_source\":\"1\",\"easing_source_cdn\":\"1\",\"easing_cdn_fallback\":\"0\",\"custom_area\":\"1\",\"custom_js\":\"0\",\"custom_css\":\"0\",\"remove_area\":\"1\",\"remove_js\":\"0\",\"remove_css\":\"0\",\"no_conflict\":\"1\",\"css_order\":\"1\",\"css_media_type\":\"null\",\"custom_cdn\":\"0\",\"custom_cdn_urls\":\"1\",\"local_urls\":\"1\",\"scheme\":\"auto\",\"domain_fqdn\":\"1\",\"curl_useragent\":\"0\",\"curl_useragent_txt\":\"Mozilla\\/5.0 (X11; Ubuntu; Linux x86_64; rv:35.0) Gecko\\/20100101 Firefox\\/35.0\"}','','',0,'0000-00-00 00:00:00',0,0),(10025,'PLG_SYSTEM_NNFRAMEWORK','plugin','nnframework','system',0,1,1,0,'{\"name\":\"PLG_SYSTEM_NNFRAMEWORK\",\"type\":\"plugin\",\"creationDate\":\"February 2015\",\"author\":\"NoNumber (Peter van Westen)\",\"copyright\":\"Copyright \\u00a9 2015 NoNumber All Rights Reserved\",\"authorEmail\":\"peter@nonumber.nl\",\"authorUrl\":\"http:\\/\\/www.nonumber.nl\",\"version\":\"15.2.11\",\"description\":\"PLG_SYSTEM_NNFRAMEWORK_DESC\",\"group\":\"\",\"filename\":\"nnframework\"}','','','',0,'0000-00-00 00:00:00',0,0);
/*!40000 ALTER TABLE `mmov_extensions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mmov_facileforms_compmenus`
--

DROP TABLE IF EXISTS `mmov_facileforms_compmenus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmov_facileforms_compmenus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `package` varchar(30) NOT NULL DEFAULT '',
  `parent` int(11) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `img` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `page` int(11) NOT NULL DEFAULT '1',
  `frame` tinyint(1) NOT NULL DEFAULT '0',
  `border` tinyint(1) NOT NULL DEFAULT '0',
  `params` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mmov_facileforms_compmenus`
--

LOCK TABLES `mmov_facileforms_compmenus` WRITE;
/*!40000 ALTER TABLE `mmov_facileforms_compmenus` DISABLE KEYS */;
/*!40000 ALTER TABLE `mmov_facileforms_compmenus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mmov_facileforms_config`
--

DROP TABLE IF EXISTS `mmov_facileforms_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmov_facileforms_config` (
  `id` varchar(30) NOT NULL DEFAULT '',
  `value` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mmov_facileforms_config`
--

LOCK TABLES `mmov_facileforms_config` WRITE;
/*!40000 ALTER TABLE `mmov_facileforms_config` DISABLE KEYS */;
INSERT INTO `mmov_facileforms_config` VALUES ('archived','0'),('arealarge','20'),('areamedium','12'),('areasmall','4'),('cellnewline','1'),('compress','1'),('csvdelimiter',';'),('csvquote','\"'),('emailadr','henry.martinez@estelio.com'),('enable_classic','0'),('exported','0'),('formname',''),('formpkg','QuickModeForms'),('getprovider','0'),('gridcolor1','#e0e0ff'),('gridcolor2','#ffe0e0'),('gridshow','1'),('gridsize','10'),('images','{mossite}/components/com_breezingforms/images'),('limitdesc','100'),('livesite','0'),('menupkg',''),('movepixels','10'),('piecepkg',''),('scriptpkg',''),('stylesheet','1'),('uploads','{mospath}/media/breezingforms/uploads'),('viewed','0'),('wysiwyg','0');
/*!40000 ALTER TABLE `mmov_facileforms_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mmov_facileforms_elements`
--

DROP TABLE IF EXISTS `mmov_facileforms_elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmov_facileforms_elements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form` int(11) NOT NULL DEFAULT '0',
  `page` int(11) NOT NULL DEFAULT '1',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(50) NOT NULL DEFAULT '',
  `class1` varchar(30) DEFAULT NULL,
  `class2` varchar(30) DEFAULT NULL,
  `logging` tinyint(1) NOT NULL DEFAULT '1',
  `posx` int(11) DEFAULT NULL,
  `posxmode` tinyint(1) NOT NULL DEFAULT '0',
  `posy` int(11) DEFAULT NULL,
  `posymode` tinyint(1) NOT NULL DEFAULT '0',
  `width` int(11) DEFAULT NULL,
  `widthmode` tinyint(1) NOT NULL DEFAULT '0',
  `height` int(11) DEFAULT NULL,
  `heightmode` tinyint(1) NOT NULL DEFAULT '0',
  `flag1` tinyint(1) NOT NULL DEFAULT '0',
  `flag2` tinyint(1) NOT NULL DEFAULT '0',
  `data1` text,
  `data2` text,
  `data3` text,
  `script1cond` tinyint(1) NOT NULL DEFAULT '0',
  `script1id` int(11) DEFAULT NULL,
  `script1code` text,
  `script1flag1` tinyint(1) NOT NULL DEFAULT '0',
  `script1flag2` tinyint(1) NOT NULL DEFAULT '0',
  `script2cond` tinyint(1) NOT NULL DEFAULT '0',
  `script2id` int(11) DEFAULT NULL,
  `script2code` text,
  `script2flag1` tinyint(1) NOT NULL DEFAULT '0',
  `script2flag2` tinyint(1) NOT NULL DEFAULT '0',
  `script2flag3` tinyint(1) NOT NULL DEFAULT '0',
  `script2flag4` tinyint(1) NOT NULL DEFAULT '0',
  `script2flag5` tinyint(1) NOT NULL DEFAULT '0',
  `script3cond` tinyint(1) NOT NULL DEFAULT '0',
  `script3id` int(11) DEFAULT NULL,
  `script3code` text,
  `script3msg` text,
  `mailback` tinyint(1) NOT NULL DEFAULT '0',
  `mailbackfile` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mmov_facileforms_elements`
--

LOCK TABLES `mmov_facileforms_elements` WRITE;
/*!40000 ALTER TABLE `mmov_facileforms_elements` DISABLE KEYS */;
INSERT INTO `mmov_facileforms_elements` VALUES (1,1,1,1,1,'f_devolucion','Fecha Devolución','Calendar','','',1,0,0,0,0,20,0,20,0,0,0,'...','','',0,0,'',0,0,0,0,'',0,0,0,0,0,0,1,'','',0,''),(6,1,1,0,1,'bfFakeName','bfFakeTitle','','','',0,0,0,40,0,20,0,20,0,0,0,'','','',0,0,'',0,0,1,41,'',0,0,0,0,0,0,0,'','',0,''),(7,1,1,0,1,'bfFakeName2','bfFakeTitle2','','','',0,0,0,80,0,20,0,20,0,0,0,'','','',0,0,'',0,0,1,23,'',0,0,0,0,0,0,0,'','',0,''),(8,1,1,0,1,'bfFakeName3','bfFakeTitle3','','','',0,0,0,120,0,20,0,20,0,0,0,'','','',0,0,'',0,0,1,40,'',0,0,0,0,0,0,0,'','',0,''),(9,1,1,0,1,'bfFakeName4','bfFakeTitle4','','','',0,0,0,160,0,20,0,20,0,0,0,'','','',0,0,'',0,0,1,38,'',0,0,0,0,0,0,0,'','',0,'');
/*!40000 ALTER TABLE `mmov_facileforms_elements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mmov_facileforms_forms`
--

DROP TABLE IF EXISTS `mmov_facileforms_forms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmov_facileforms_forms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alt_mailfrom` text,
  `alt_fromname` text,
  `mb_alt_mailfrom` text,
  `mb_alt_fromname` text,
  `mailchimp_email_field` varchar(255) NOT NULL DEFAULT '',
  `mailchimp_checkbox_field` varchar(255) NOT NULL DEFAULT '',
  `mailchimp_api_key` varchar(255) NOT NULL DEFAULT '',
  `mailchimp_list_id` varchar(255) NOT NULL DEFAULT '',
  `mailchimp_double_optin` tinyint(1) NOT NULL DEFAULT '1',
  `mailchimp_mergevars` text,
  `mailchimp_text_html_mobile_field` varchar(255) NOT NULL DEFAULT '',
  `mailchimp_send_errors` tinyint(1) NOT NULL DEFAULT '0',
  `mailchimp_update_existing` tinyint(1) NOT NULL DEFAULT '0',
  `mailchimp_replace_interests` tinyint(1) NOT NULL DEFAULT '0',
  `mailchimp_send_welcome` tinyint(1) NOT NULL DEFAULT '0',
  `mailchimp_default_type` varchar(255) NOT NULL DEFAULT 'text',
  `mailchimp_delete_member` tinyint(1) NOT NULL DEFAULT '0',
  `mailchimp_send_goodbye` tinyint(1) NOT NULL DEFAULT '1',
  `mailchimp_send_notify` tinyint(1) NOT NULL DEFAULT '1',
  `mailchimp_unsubscribe_field` varchar(255) NOT NULL DEFAULT '',
  `salesforce_token` varchar(255) NOT NULL DEFAULT '',
  `salesforce_username` varchar(255) NOT NULL DEFAULT '',
  `salesforce_password` varchar(255) NOT NULL DEFAULT '',
  `salesforce_type` varchar(255) NOT NULL DEFAULT '',
  `salesforce_fields` text,
  `salesforce_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `dropbox_email` varchar(255) NOT NULL DEFAULT '',
  `dropbox_password` varchar(255) NOT NULL DEFAULT '',
  `dropbox_folder` text,
  `dropbox_submission_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `dropbox_submission_types` varchar(255) NOT NULL DEFAULT 'pdf',
  `tags_content` text NOT NULL,
  `tags_content_template` mediumtext NOT NULL,
  `tags_content_template_default_element` int(11) NOT NULL DEFAULT '0',
  `tags_form` text NOT NULL,
  `tags_content_default_category` int(11) NOT NULL DEFAULT '0',
  `tags_content_default_state` int(11) NOT NULL DEFAULT '1',
  `tags_content_default_access` int(11) NOT NULL DEFAULT '1',
  `tags_content_default_language` varchar(7) NOT NULL DEFAULT '*',
  `tags_content_default_featured` int(11) NOT NULL DEFAULT '0',
  `tags_content_default_publishup` varchar(255) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `tags_content_default_publishdown` varchar(255) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `autoheight` tinyint(1) NOT NULL DEFAULT '0',
  `package` varchar(30) NOT NULL DEFAULT '',
  `template_code` longtext NOT NULL,
  `template_code_processed` longtext NOT NULL,
  `template_areas` longtext NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `runmode` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `custom_mail_subject` varchar(255) NOT NULL DEFAULT '',
  `mb_custom_mail_subject` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  `class1` varchar(30) DEFAULT NULL,
  `class2` varchar(30) DEFAULT NULL,
  `width` int(11) NOT NULL DEFAULT '0',
  `widthmode` tinyint(1) NOT NULL DEFAULT '0',
  `height` int(11) NOT NULL DEFAULT '0',
  `heightmode` tinyint(1) NOT NULL DEFAULT '0',
  `pages` int(11) NOT NULL DEFAULT '1',
  `emailntf` tinyint(1) NOT NULL DEFAULT '1',
  `mb_emailntf` tinyint(1) NOT NULL DEFAULT '1',
  `emaillog` tinyint(1) NOT NULL DEFAULT '1',
  `mb_emaillog` tinyint(1) NOT NULL DEFAULT '1',
  `emailxml` tinyint(1) NOT NULL DEFAULT '0',
  `mb_emailxml` tinyint(1) NOT NULL DEFAULT '0',
  `email_type` tinyint(1) NOT NULL DEFAULT '0',
  `mb_email_type` tinyint(1) NOT NULL DEFAULT '0',
  `email_custom_template` text,
  `mb_email_custom_template` text,
  `email_custom_html` tinyint(1) NOT NULL DEFAULT '0',
  `mb_email_custom_html` tinyint(1) NOT NULL DEFAULT '0',
  `emailadr` text,
  `dblog` tinyint(1) NOT NULL DEFAULT '1',
  `script1cond` tinyint(1) NOT NULL DEFAULT '0',
  `script1id` int(11) DEFAULT NULL,
  `script1code` text,
  `script2cond` tinyint(1) NOT NULL DEFAULT '0',
  `script2id` int(11) DEFAULT NULL,
  `script2code` text,
  `piece1cond` tinyint(1) NOT NULL DEFAULT '0',
  `piece1id` int(11) DEFAULT NULL,
  `piece1code` text,
  `piece2cond` tinyint(1) NOT NULL DEFAULT '0',
  `piece2id` int(11) DEFAULT NULL,
  `piece2code` text,
  `piece3cond` tinyint(1) NOT NULL DEFAULT '0',
  `piece3id` int(11) DEFAULT NULL,
  `piece3code` text,
  `piece4cond` tinyint(1) NOT NULL DEFAULT '0',
  `piece4id` int(11) DEFAULT NULL,
  `piece4code` text,
  `prevmode` tinyint(1) NOT NULL DEFAULT '2',
  `prevwidth` int(11) DEFAULT NULL,
  `filter_state` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mmov_facileforms_forms`
--

LOCK TABLES `mmov_facileforms_forms` WRITE;
/*!40000 ALTER TABLE `mmov_facileforms_forms` DISABLE KEYS */;
INSERT INTO `mmov_facileforms_forms` VALUES (1,NULL,NULL,NULL,NULL,'','','','',1,NULL,'',0,0,0,0,'text',0,1,1,'','','','','',NULL,0,'','',NULL,0,'pdf','','',0,'',0,1,1,'*',0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,'QuickModeForms','eyJhdHRyaWJ1dGVzIjp7ImNsYXNzIjoiYmZRdWlja01vZGVSb290Q2xhc3MiLCJpZCI6ImJmUXVpY2tNb2RlUm9vdCIsIm1kYXRhIjoie1widHlwZVwiOiBcInJvb3RcIn0ifSwicHJvcGVydGllcyI6eyJ0eXBlIjoicm9vdCIsInRpdGxlIjoiQ2hlcXVlcyBEZXZ1ZWx0b3MiLCJuYW1lIjoiY2hlcXVlc0RldnVlbHRvcyIsInJvbGxvdmVyIjp0cnVlLCJyb2xsb3ZlckNvbG9yIjoiI2ZmYyIsInRvZ2dsZUZpZWxkcyI6IiIsImRlc2NyaXB0aW9uIjoicGVybWl0ZSBjYXJnYXIgbG9zIGRhdG9zIGRlIGxvcyBjaGVxdWVzIGRldnVlbHRvcyIsIm1haWxOb3RpZmljYXRpb24iOmZhbHNlLCJtYWlsUmVjaXBpZW50IjoiIiwic3VibWl0SW5jbHVkZSI6dHJ1ZSwic3VibWl0TGFiZWwiOiJHdWFyZGFyIiwiY2FuY2VsSW5jbHVkZSI6dHJ1ZSwiY2FuY2VsTGFiZWwiOiJDYW5jZWxhciIsInBhZ2luZ0luY2x1ZGUiOnRydWUsInBhZ2luZ05leHRMYWJlbCI6IlNpZy4iLCJwYWdpbmdQcmV2TGFiZWwiOiJBdHJhcyIsInRoZW1lIjoiZGVmYXVsdCIsInRoZW1lYm9vdHN0cmFwIjoiIiwidGhlbWVib290c3RyYXBiZWZvcmUiOiIiLCJ0aGVtZWJvb3RzdHJhcExhYmVsVG9wIjpmYWxzZSwidGhlbWVib290c3RyYXBUaGVtZUVuZ2luZSI6ImJvb3RzdHJhcCIsInRoZW1lYm9vdHN0cmFwVXNlSGVyb1VuaXQiOmZhbHNlLCJ0aGVtZWJvb3RzdHJhcFVzZVdlbGwiOmZhbHNlLCJ0aGVtZWJvb3RzdHJhcFVzZVByb2dyZXNzIjpmYWxzZSwidGhlbWV1c2Vib290c3RyYXBsZWdhY3kiOmZhbHNlLCJmYWRlSW4iOmZhbHNlLCJsYXN0UGFnZVRoYW5rWW91Ijp0cnVlLCJzdWJtaXR0ZWRTY3JpcHRDb25kaWR0aW9uIjotMSwic3VibWl0dGVkU2NyaXB0Q29kZSI6IiIsInVzZUVycm9yQWxlcnRzIjpmYWxzZSwidXNlRGVmYXVsdEVycm9ycyI6dHJ1ZSwidXNlQmFsbG9vbkVycm9ycyI6ZmFsc2UsImRpc2FibGVKUXVlcnkiOmZhbHNlLCJqb29tbGFIaW50IjpmYWxzZSwibW9iaWxlRW5hYmxlZCI6ZmFsc2UsImZvcmNlTW9iaWxlIjpmYWxzZSwiZm9yY2VNb2JpbGVVcmwiOiJpbmRleC5waHAiLCJ0aXRsZV90cmFuc2xhdGlvbiI6IiIsInN1Ym1pdExhYmVsX3RyYW5zbGF0aW9uIjoiIiwiY2FuY2VsTGFiZWxfdHJhbnNsYXRpb24iOiIiLCJwYWdpbmdOZXh0TGFiZWxfdHJhbnNsYXRpb24iOiIiLCJwYWdpbmdQcmV2TGFiZWxfdHJhbnNsYXRpb24iOiIiLCJ0aGVtZWJvb3RzdHJhcHZhcnMiOiIifSwic3RhdGUiOiJvcGVuIiwiZGF0YSI6eyJ0aXRsZSI6IkNoZXF1ZXMgRGV2dWVsdG9zIiwiaWNvbiI6Ii4uXC9hZG1pbmlzdHJhdG9yXC9jb21wb25lbnRzXC9jb21fYnJlZXppbmdmb3Jtc1wvbGlicmFyaWVzXC9qcXVlcnlcL3RoZW1lc1wvcXVpY2ttb2RlXC9pXC9pY29uX2Zvcm0ucG5nIn0sImNoaWxkcmVuIjpbeyJhdHRyaWJ1dGVzIjp7ImNsYXNzIjoiYmZRdWlja01vZGVQYWdlQ2xhc3MiLCJpZCI6ImJmUXVpY2tNb2RlUGFnZTEiLCJtZGF0YSI6IntcImRlbGV0YWJsZVwiOiB0cnVlLCBcInR5cGVcIjogXCJwYWdlXCJ9In0sInByb3BlcnRpZXMiOnsidHlwZSI6InBhZ2UiLCJwYWdlTnVtYmVyIjoxLCJwYWdlSW50cm8iOiIifSwic3RhdGUiOiJvcGVuIiwiZGF0YSI6eyJ0aXRsZSI6IlBhZ2UgMSIsImljb24iOiIuLlwvYWRtaW5pc3RyYXRvclwvY29tcG9uZW50c1wvY29tX2JyZWV6aW5nZm9ybXNcL2xpYnJhcmllc1wvanF1ZXJ5XC90aGVtZXNcL3F1aWNrbW9kZVwvaVwvaWNvbl9wYWdlLnBuZyJ9LCJjaGlsZHJlbiI6W3siYXR0cmlidXRlcyI6eyJjbGFzcyI6ImJmUXVpY2tNb2RlU2VjdGlvbkNsYXNzIiwiaWQiOiJiZlF1aWNrTW9kZVNlY3Rpb242NzA0NSIsIm1kYXRhIjoie1wiZGVsZXRhYmxlXCI6IHRydWUsIFwidHlwZVwiOiBcInNlY3Rpb25cIn0ifSwicHJvcGVydGllcyI6eyJiZlR5cGUiOiJub3JtYWwiLCJ0eXBlIjoic2VjdGlvbiIsImRpc3BsYXlUeXBlIjoiYnJlYWtzIiwidGl0bGUiOiJ1bnRpdGxlZCBzZWN0aW9uIiwibmFtZSI6ImJmUXVpY2tNb2RlU2VjdGlvbjY3MDQ1IiwiZGVzY3JpcHRpb24iOiIiLCJvZmYiOmZhbHNlfSwic3RhdGUiOiJvcGVuIiwiZGF0YSI6eyJ0aXRsZSI6InVudGl0bGVkIHNlY3Rpb24iLCJpY29uIjoiLi5cL2FkbWluaXN0cmF0b3JcL2NvbXBvbmVudHNcL2NvbV9icmVlemluZ2Zvcm1zXC9saWJyYXJpZXNcL2pxdWVyeVwvdGhlbWVzXC9xdWlja21vZGVcL2lcL2ljb25fc2VjdGlvbi5wbmcifSwiY2hpbGRyZW4iOlt7ImF0dHJpYnV0ZXMiOnsiY2xhc3MiOiJiZlF1aWNrTW9kZUVsZW1lbnRDbGFzcyIsImlkIjoiZl9kZXZvbHVjaW9uIiwibWRhdGEiOiJ7XCJkZWxldGFibGVcIjogdHJ1ZSwgXCJ0eXBlXCI6IFwiZWxlbWVudFwifSJ9LCJkYXRhIjp7InRpdGxlIjoiRmVjaGEgRGV2b2x1Y2lcdTAwZjNuIiwiaWNvbiI6Ii4uXC9hZG1pbmlzdHJhdG9yXC9jb21wb25lbnRzXC9jb21fYnJlZXppbmdmb3Jtc1wvbGlicmFyaWVzXC9qcXVlcnlcL3RoZW1lc1wvcXVpY2ttb2RlXC9pXC9pY29uX2NhbGVuZGFyLnBuZyJ9LCJwcm9wZXJ0aWVzIjp7InR5cGUiOiJlbGVtZW50IiwiYmZUeXBlIjoiYmZDYWxlbmRhciIsImxhYmVsIjoiRmVjaGEgRGV2b2x1Y2lcdTAwZjNuIiwibGFiZWxQb3NpdGlvbiI6ImxlZnQiLCJiZk5hbWUiOiJmX2Rldm9sdWNpb24iLCJkYklkIjoxLCJvcmRlck51bWJlciI6LTEsInRhYkluZGV4IjoiLTEiLCJsb2dnaW5nIjp0cnVlLCJoaWRlTGFiZWwiOmZhbHNlLCJyZXF1aXJlZCI6dHJ1ZSwiaGludCI6IiIsIm9mZiI6ZmFsc2UsInJlYWRvbmx5IjpmYWxzZSwiZm9ybWF0IjoiJWRcLyVtXC8lWSIsInZhbHVlIjoiLi4uIiwic2l6ZSI6IiIsInZhbGlkYXRpb25Db25kaXRpb24iOjAsInZhbGlkYXRpb25JZCI6IjEiLCJ2YWxpZGF0aW9uQ29kZSI6IiIsInZhbGlkYXRpb25NZXNzYWdlIjoiIiwidmFsaWRhdGlvbkZ1bmN0aW9uTmFtZSI6IiIsImluaXRDb25kaXRpb24iOjAsImluaXRJZCI6MCwiaW5pdENvZGUiOiIiLCJpbml0RnVuY3Rpb25OYW1lIjoiIiwiaW5pdEZvcm1FbnRyeSI6MCwiaW5pdFBhZ2VFbnRyeSI6MCwiYWN0aW9uQ29uZGl0aW9uIjowLCJhY3Rpb25JZCI6MCwiYWN0aW9uQ29kZSI6IiIsImFjdGlvbkZ1bmN0aW9uTmFtZSI6IiIsImFjdGlvbkNsaWNrIjowLCJhY3Rpb25CbHVyIjowLCJhY3Rpb25DaGFuZ2UiOjAsImFjdGlvbkZvY3VzIjowLCJhY3Rpb25TZWxlY3QiOjAsImhpZGVJbk1haWxiYWNrIjpmYWxzZSwiZm9ybWF0X3RyYW5zbGF0aW9uIjoiIiwidmFsdWVfdHJhbnNsYXRpb24iOiIiLCJoaW50X3RyYW5zbGF0aW9uIjoiIiwibGFiZWxfdHJhbnNsYXRpb24iOiIiLCJ2YWxpZGF0aW9uTWVzc2FnZV90cmFuc2xhdGlvbiI6IiJ9fV19XX1dfQ==','QuickMode','[{\"elements\":[{\"element\":null,\"bfType\":\"Calendar\",\"elementType\":\"\",\"options\":{\"readonly\":false},\"data1\":\"...\",\"data2\":\"\",\"data3\":\"\",\"script1cond\":0,\"script1id\":0,\"script1code\":\"\",\"script1flag1\":0,\"script1flag2\":0,\"script2cond\":0,\"script2id\":0,\"script2code\":\"\",\"script2flag1\":0,\"script2flag2\":0,\"script2flag3\":0,\"script2flag4\":0,\"script2flag5\":0,\"script3cond\":0,\"script3id\":\"1\",\"script3code\":\"\",\"script3msg\":\"\",\"functionNameScript1\":\"\",\"functionNameScript2\":\"\",\"functionNameScript3\":\"\",\"flag1\":0,\"flag2\":0,\"mailback\":0,\"mailbackfile\":\"\",\"title\":\"Fecha Devoluci\\u00f3n\",\"name\":\"f_devolucion\",\"page\":\"1\",\"orderNumber\":1,\"dbId\":1,\"appElementOrderId\":0,\"id\":0,\"logging\":true,\"qId\":\"f_devolucion\",\"internalType\":\"bfCalendar\",\"tabIndex\":\"-1\",\"hideInMailback\":false},{\"element\":null,\"bfType\":\"\",\"elementType\":\"\",\"options\":[],\"data1\":\"\",\"data2\":\"\",\"data3\":\"\",\"script1cond\":0,\"script1id\":0,\"script1code\":\"\",\"script1flag1\":0,\"script1flag2\":0,\"script2cond\":1,\"script2id\":\"41\",\"script2code\":\"\",\"script2flag1\":0,\"script2flag2\":0,\"script2flag3\":0,\"script2flag4\":0,\"script2flag5\":0,\"script3cond\":0,\"script3id\":0,\"script3code\":\"\",\"script3msg\":\"\",\"functionNameScript1\":\"\",\"functionNameScript2\":\"\",\"functionNameScript3\":\"\",\"flag1\":0,\"flag2\":0,\"mailback\":0,\"mailbackfile\":\"\",\"title\":\"bfFakeTitle\",\"name\":\"bfFakeName\",\"page\":1,\"orderNumber\":0,\"dbId\":6,\"appElementOrderId\":0,\"id\":0,\"logging\":0,\"qId\":0,\"internalType\":\"\"},{\"element\":null,\"bfType\":\"\",\"elementType\":\"\",\"options\":[],\"data1\":\"\",\"data2\":\"\",\"data3\":\"\",\"script1cond\":0,\"script1id\":0,\"script1code\":\"\",\"script1flag1\":0,\"script1flag2\":0,\"script2cond\":1,\"script2id\":\"23\",\"script2code\":\"\",\"script2flag1\":0,\"script2flag2\":0,\"script2flag3\":0,\"script2flag4\":0,\"script2flag5\":0,\"script3cond\":0,\"script3id\":0,\"script3code\":\"\",\"script3msg\":\"\",\"functionNameScript1\":\"\",\"functionNameScript2\":\"\",\"functionNameScript3\":\"\",\"flag1\":0,\"flag2\":0,\"mailback\":0,\"mailbackfile\":\"\",\"title\":\"bfFakeTitle2\",\"name\":\"bfFakeName2\",\"page\":1,\"orderNumber\":0,\"dbId\":7,\"appElementOrderId\":0,\"id\":0,\"logging\":0,\"qId\":0,\"internalType\":\"\"},{\"element\":null,\"bfType\":\"\",\"elementType\":\"\",\"options\":[],\"data1\":\"\",\"data2\":\"\",\"data3\":\"\",\"script1cond\":0,\"script1id\":0,\"script1code\":\"\",\"script1flag1\":0,\"script1flag2\":0,\"script2cond\":1,\"script2id\":\"40\",\"script2code\":\"\",\"script2flag1\":0,\"script2flag2\":0,\"script2flag3\":0,\"script2flag4\":0,\"script2flag5\":0,\"script3cond\":0,\"script3id\":0,\"script3code\":\"\",\"script3msg\":\"\",\"functionNameScript1\":\"\",\"functionNameScript2\":\"\",\"functionNameScript3\":\"\",\"flag1\":0,\"flag2\":0,\"mailback\":0,\"mailbackfile\":\"\",\"title\":\"bfFakeTitle3\",\"name\":\"bfFakeName3\",\"page\":1,\"orderNumber\":0,\"dbId\":8,\"appElementOrderId\":0,\"id\":0,\"logging\":0,\"qId\":0,\"internalType\":\"\"},{\"element\":null,\"bfType\":\"\",\"elementType\":\"\",\"options\":[],\"data1\":\"\",\"data2\":\"\",\"data3\":\"\",\"script1cond\":0,\"script1id\":0,\"script1code\":\"\",\"script1flag1\":0,\"script1flag2\":0,\"script2cond\":1,\"script2id\":\"38\",\"script2code\":\"\",\"script2flag1\":0,\"script2flag2\":0,\"script2flag3\":0,\"script2flag4\":0,\"script2flag5\":0,\"script3cond\":0,\"script3id\":0,\"script3code\":\"\",\"script3msg\":\"\",\"functionNameScript1\":\"\",\"functionNameScript2\":\"\",\"functionNameScript3\":\"\",\"flag1\":0,\"flag2\":0,\"mailback\":0,\"mailbackfile\":\"\",\"title\":\"bfFakeTitle4\",\"name\":\"bfFakeName4\",\"page\":1,\"orderNumber\":0,\"dbId\":9,\"appElementOrderId\":0,\"id\":0,\"logging\":0,\"qId\":0,\"internalType\":\"\"}],\"elementCount\":1}]',0,1,0,'chequesDevueltos','','','Cheques Devueltos','permite cargar los datos de los cheques devueltos','',NULL,400,0,500,0,1,0,1,1,1,0,0,0,0,NULL,NULL,0,0,'',1,0,NULL,NULL,0,NULL,NULL,0,NULL,NULL,0,NULL,NULL,0,NULL,NULL,0,NULL,NULL,2,NULL,'');
/*!40000 ALTER TABLE `mmov_facileforms_forms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mmov_facileforms_integrator_criteria_fixed`
--

DROP TABLE IF EXISTS `mmov_facileforms_integrator_criteria_fixed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmov_facileforms_integrator_criteria_fixed` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rule_id` int(11) NOT NULL,
  `reference_column` varchar(255) NOT NULL,
  `operator` varchar(255) NOT NULL,
  `fixed_value` text NOT NULL,
  `andor` varchar(3) NOT NULL DEFAULT 'AND',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mmov_facileforms_integrator_criteria_fixed`
--

LOCK TABLES `mmov_facileforms_integrator_criteria_fixed` WRITE;
/*!40000 ALTER TABLE `mmov_facileforms_integrator_criteria_fixed` DISABLE KEYS */;
/*!40000 ALTER TABLE `mmov_facileforms_integrator_criteria_fixed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mmov_facileforms_integrator_criteria_form`
--

DROP TABLE IF EXISTS `mmov_facileforms_integrator_criteria_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmov_facileforms_integrator_criteria_form` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rule_id` int(11) NOT NULL,
  `reference_column` varchar(255) NOT NULL,
  `operator` varchar(255) NOT NULL,
  `element_id` varchar(255) NOT NULL,
  `andor` varchar(3) NOT NULL DEFAULT 'AND',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mmov_facileforms_integrator_criteria_form`
--

LOCK TABLES `mmov_facileforms_integrator_criteria_form` WRITE;
/*!40000 ALTER TABLE `mmov_facileforms_integrator_criteria_form` DISABLE KEYS */;
/*!40000 ALTER TABLE `mmov_facileforms_integrator_criteria_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mmov_facileforms_integrator_criteria_joomla`
--

DROP TABLE IF EXISTS `mmov_facileforms_integrator_criteria_joomla`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmov_facileforms_integrator_criteria_joomla` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rule_id` int(11) NOT NULL,
  `reference_column` varchar(255) NOT NULL,
  `operator` varchar(255) NOT NULL,
  `joomla_object` varchar(255) NOT NULL,
  `andor` varchar(3) NOT NULL DEFAULT 'AND',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mmov_facileforms_integrator_criteria_joomla`
--

LOCK TABLES `mmov_facileforms_integrator_criteria_joomla` WRITE;
/*!40000 ALTER TABLE `mmov_facileforms_integrator_criteria_joomla` DISABLE KEYS */;
/*!40000 ALTER TABLE `mmov_facileforms_integrator_criteria_joomla` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mmov_facileforms_integrator_items`
--

DROP TABLE IF EXISTS `mmov_facileforms_integrator_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmov_facileforms_integrator_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rule_id` int(11) NOT NULL,
  `element_id` int(11) NOT NULL,
  `reference_column` varchar(255) NOT NULL,
  `code` text NOT NULL,
  `published` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mmov_facileforms_integrator_items`
--

LOCK TABLES `mmov_facileforms_integrator_items` WRITE;
/*!40000 ALTER TABLE `mmov_facileforms_integrator_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `mmov_facileforms_integrator_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mmov_facileforms_integrator_rules`
--

DROP TABLE IF EXISTS `mmov_facileforms_integrator_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmov_facileforms_integrator_rules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `form_id` int(11) NOT NULL,
  `reference_table` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL DEFAULT 'insert',
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `finalize_code` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mmov_facileforms_integrator_rules`
--

LOCK TABLES `mmov_facileforms_integrator_rules` WRITE;
/*!40000 ALTER TABLE `mmov_facileforms_integrator_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `mmov_facileforms_integrator_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mmov_facileforms_packages`
--

DROP TABLE IF EXISTS `mmov_facileforms_packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmov_facileforms_packages` (
  `id` varchar(30) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `version` varchar(30) NOT NULL DEFAULT '',
  `created` varchar(20) NOT NULL DEFAULT '',
  `title` varchar(50) NOT NULL DEFAULT '',
  `author` varchar(50) NOT NULL DEFAULT '',
  `email` varchar(50) NOT NULL DEFAULT '',
  `url` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(100) NOT NULL DEFAULT '',
  `copyright` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mmov_facileforms_packages`
--

LOCK TABLES `mmov_facileforms_packages` WRITE;
/*!40000 ALTER TABLE `mmov_facileforms_packages` DISABLE KEYS */;
INSERT INTO `mmov_facileforms_packages` VALUES ('','mypck_001','0.0.1','2005-07-31 22:21:23','My First Package','My Name','my.name@my.domain','http://www.my.domain','This is the first package that I created','This FacileForms package is released under the GNU/GPL license'),('FF','stdlib.english','1.8','2012-09-21 11:50:15','BreezingForms-Standard Piece and Script Libraries','Markus Bopp','markus.bopp@crosstec.de','http://www.crosstec.de','These are the standard BreezingForms script and piece libraries.','This BreezingForms package is released under the GNU/GPL license');
/*!40000 ALTER TABLE `mmov_facileforms_packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mmov_facileforms_pieces`
--

DROP TABLE IF EXISTS `mmov_facileforms_pieces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmov_facileforms_pieces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `package` varchar(30) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  `type` varchar(30) NOT NULL DEFAULT '',
  `code` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mmov_facileforms_pieces`
--

LOCK TABLES `mmov_facileforms_pieces` WRITE;
/*!40000 ALTER TABLE `mmov_facileforms_pieces` DISABLE KEYS */;
INSERT INTO `mmov_facileforms_pieces` VALUES (1,1,'FF','ff_addCustomCSSFile','Add custom CSS File','Adds a custom css file to the form. To choose a css file, execute this piece and call the function ff_addCustomCSSFile(\'path/to/css/file\') with the RELATIVE (not full!) path to your joomla installation.\r\nDo not forget to call $this->execPieceByName(\'ff_InitLib\') before!\r\n\r\nExample:\r\n\r\nglobal $mainframe;\r\n\r\n$this->execPieceByName(\'ff_InitLib\');\r\n$this->execPieceByName(\'ff_addCustomCSSFile\');\r\n\r\nff_addCustomCSSFile(\'templates/\' . $mainframe->getTemplate() . \'/css/template.css\');','Before Form','function ff_addCustomCSSFile($path){\r\n	if(file_exists(JPATH_SITE . \'/\' . $path)){\r\n		JFactory::getDocument()->addStyleSheet(JURI::root() . $path);\r\n	}\r\n}'),(2,1,'FF','ff_Constants','Constansts definitions','Library constants definitions','Before Form','define(\'FF_DIE\',       \'_ff_die_on_errors_\');\r\ndefine(\'FF_DONTDIE\',   \'_ff_stay_alive_\');\r\ndefine(\'FF_IGNOREDIE\', \'_ff_ignore_if_dying_\');\r\n\r\ndefine(\'FF_ARRAY\',     \'_ff_return_as_array_\');\r\ndefine(\'FF_LIST\',      \'_ff_return_as_list_\');\r\ndefine(\'FF_SLIST\',     \'_ff_return_as_slist_\');\r\ndefine(\'FF_DLIST\',     \'_ff_return_as_dlist_\');\r\n\r\ndefine(\'FF_NOTRIM\',    1);\r\ndefine(\'FF_ALLOWHTML\', 2);\r\ndefine(\'FF_ALLOWRAW\',  4);'),(3,1,'FF','ff_die','Terminate form gracefully','Gracefully terminates the form and shows a message plus opionally a \r\nCONTINUE button for further redirection.\r\n\r\nCall:\r\n\r\n    ff_die($message=null, $action=\'stop\', $target=\'\', $params=\'\', $label=\'Continue\');\r\n    return;\r\n\r\n    $message = A message to display. If no message is provided, it will\r\n               display:\r\n\r\n                    Fatal error in $formname, processing stopped.\r\n\r\n    $action  = \'stop\' : Dont show a CONTINUE button (default)\r\n               \'self\' : Redirect to the same form\r\n               \'form\' : Redirect to another form \r\n               \'page\' : Redirect to another page of this site\r\n               \'home\' : Redirect to homepage of the site\r\n               \'url\'  : Redirect to a url\r\n\r\n    $target  = Target name/url for \'form\', \'page\' and \'url\'\r\n\r\n    $params  = Additional parameters for \'self\' and \'form\'\r\n\r\n    $label   = Text for the continue button\r\n\r\nExamples:\r\n\r\n    // Display standard message without continue button\r\n    ff_die(); \r\n\r\n    // Display message without continue button\r\n    ff_die(\'Sorry, cannot continue for some reason.\');\r\n\r\n    // Display standard message and return to same form with a parameter\r\n    ff_die(null, \'self\', \'&ff_param_foo=bar\');\r\n\r\n    // Redirect to another form\r\n    ff_die(\'Guess you are hungry now...\', \'form\', \'SamplePizzaShop\', null, \'Order\');\r\n\r\n    // Redirect to another site page\r\n    ff_die(\r\n        \'Something strange has happened!\', \r\n        \'page\', \r\n        \'index.php?option=com_content&task=section&id=1&Itemid=2\'\r\n    );','Untyped','function ff_die($message=\'\', $action=\'stop\', $target=\'\', $params=\'\', $label=\'Continue\')\r\n{\r\n    global $ff_processor;\r\n    if ($ff_processor->dying) return;\r\n\r\n    ob_end_clean();\r\n    $form =& $ff_processor->formrow;\r\n    if (!$message) \r\n        $message = \r\n            \"<strong>Fatal error in $form->name, form processing halted.</strong>\";\r\n    switch ($action) {\r\n        case \'self\': $url = ff_makeSelfUrl($params); break;\r\n        case \'form\': $url = ff_makeFormUrl($target, $params); break;\r\n        case \'page\': $url = ff_makePageUrl($target); break;\r\n        case \'home\': $url = \"{mossite}\"; break;\r\n        case \'url\' : $url = $target; break;\r\n        default    : $url = \'\';\r\n    } // switch\r\n    if ($form->class1 != \'\') echo \'<div class=\"\'.$form->class1.\'\">\'.nl();\r\n    echo($message.\'<br/><br/><br/>\'.nl());\r\n    if ($url) {\r\n        if (!$ff_processor->inline) echo \'<form action=\"#redirect\">\'.nl();\r\n        if ($ff_processor->inframe) $t = \'parent\'; else $t = \'document\';\r\n        echo \'<input type=\"button\" class=\"button\" value=\"\'.$label.\'\"\'.\r\n             \' onClick=\"\'.$t.\'.location.href=\\\'\'.htmlentities($url,ENT_QUOTES).\'\\\';\"\'.\r\n             \'/>\'.nl();\r\n        if (!$ff_processor->inline) echo \'</form>\'.nl();\r\n    } // if\r\n    if ($form->class1 != \'\') echo \'</div>\'.nl();\r\n    unset($form);\r\n    ob_start();\r\n    $ff_processor->suicide();\r\n} // ff_die'),(4,1,'FF','ff_DisableFormTrace','Disable tracing at view time','Disables tracing for use as before form piece','Before Form','//+trace dis'),(5,1,'FF','ff_DisableSubmitTrace','Disable tracing at submit time','Disables tracing for use as begin submit piece','Begin Submit','//+trace dis'),(6,1,'FF','ff_dying','Query live status','Query if form is dying','Untyped','//+trace max none\r\nfunction ff_dying()\r\n{\r\n    global $ff_processor; \r\n    return $ff_processor->dying;\r\n} // ff_dying'),(7,1,'FF','ff_expString','String export','Export string function: escapes special characters in c-codes','Untyped','function ff_expString($text)\r\n{\r\n    return expstring($text);\r\n} // ff_expString'),(8,1,'FF','ff_getPageByNameX','Get page # by element name','Gets the page number by the name of an element. \r\nTypically used to redirect to a certain page in a before form piece \r\nas \r\n\r\n    $this->page = ff_getPageByName(\'elementname\');','Untyped','function ff_getPageByName($name)\r\n{\r\n    global $ff_processor;\r\n    foreach($ff_processor->rows as $row)\r\n        if ($row->name==$name)\r\n            return $row->page;\r\n    return null;\r\n} // ff_getPageByName'),(9,1,'FF','ff_getParam','Get GET/POST parameter','Direct replacement for mosGetParam. ff_getParam will attempt to filter \r\nout parameters that are targeted to another form on the same page.','Untyped','function ff_getParam($name, $default=null, $mask=0)\r\n{\r\n    global $ff_request;\r\n    if (substr($name,0,9)==\'ff_param_\') {\r\n        if (!isset($ff_request[$name])) return $default;\r\n        $val = $ff_request[$name];\r\n    } else {\r\n        if (!isset($_REQUEST[$name])) return $default;\r\n        $val = $_REQUEST[$name];\r\n    } // if\r\n    $dotrim = ($mask & FF_NOTRIM)==0;\r\n    $dostrp = ($mask & FF_ALLOWHTML)==0;\r\n    $addsla = ($mask & FF_ALLOWRAW)==0 && !get_magic_quotes_gpc();\r\n    $remsla = ($mask & FF_ALLOWRAW)!=0 && get_magic_quotes_gpc();\r\n    if (is_array($val)) {\r\n        $cnt = count($val);\r\n        for ($v = 0; $v < $cnt; $v++)\r\n            if (is_string($val[$v])) {\r\n                if ($dotrim) $val[$v] = trim($val[$v]);\r\n                if ($dostrp) $val[$v] = strip_tags($val[$v]);\r\n                if ($addsla) $val[$v] = addslashes($val[$v]);\r\n                if ($remsla) $val[$v] = stripslashes($val[$v]);\r\n            } // if\r\n    } else {\r\n        if (is_string($val)) {\r\n            if ($dotrim) $val = trim($val);\r\n            if ($dostrp) $val = strip_tags($val);\r\n            if ($addsla) $val = addslashes($val);\r\n            if ($remsla) $val = stripslashes($val);\r\n        } // if\r\n    } // if\r\n    return $val;\r\n} // ff_getParam'),(10,1,'FF','ff_getSubmit','Get submited data','Returns submitdata either as scalar, array or list. In case of list the values\r\nare returned as a string with the values concatenated by comma.\r\n\r\nExamples:\r\n\r\n// Get as scalar: Optionally pass a default value as second parameter.\r\n// If no default is provided, it will return NULL if no value was submitted\r\n\r\n    $myval = ff_getSubmit(\'myvar\');        // return NULL if not submitted\r\n\r\n    $myval = ff_getSubmit(\'myvar\',1);      // return 1 if not submitted\r\n\r\n    $myval = ff_getSubmit(\'myvar\',\'foo\');  // return \'foo\' if not submitted\r\n\r\n    ff_query(\r\n        \"insert into #__mytable(id, name) \".\r\n        \"values (\'\".\r\n            ff_getSubmit(\'id\').\", \".\r\n            ff_getSubmit(\'name\',\'unknown\').\r\n        \"\')\"\r\n    );\r\n\r\n// Get as array: Pass FF_ARRAY as second Parameter\r\n\r\n    $myarr = $ff_getSubmit(\'myarr\', FF_ARRAY);\r\n\r\n    foreach ($myarr as $myval) ...\r\n\r\n// Get as list: Pass either FF_LIST, FF_SLIST or FF_DLIST as 2nd parameter.\r\n\r\n    // FF_LIST will return numeric data unquoted and strings in single quotes:\r\n    //    1,2,\'a\',4\r\n\r\n    // FF_SLIST will return all data single quoted:\r\n    //    \'1\',\'2\',\'a\',\'4\'\r\n\r\n    // FF_DLIST will return all data double quoted:\r\n    //    \"1\",\"2\",\"a\",\"4\"\r\n\r\n    ff_query(\r\n        \"delete from #__mytable \".\r\n        \"where id in (\".ff_getSubmit(\'itemlist\',FF_LIST).\")\"\r\n    );','Untyped','function ff_getSubmit($name, $default=null)\r\n{\r\n    global $ff_processor;\r\n\r\n    switch ((string)$default) {\r\n        case FF_ARRAY: $value = array(); break;\r\n        case FF_LIST : \r\n        case FF_SLIST:\r\n        case FF_DLIST: $value = \'\'; break;\r\n        default      : $value = $default;\r\n    } // switch\r\n    foreach ($ff_processor->submitdata as $data)\r\n        if ($data[_FF_DATA_NAME]==$name) {\r\n            $q = \'\';\r\n            switch ((string)$default) {\r\n                case FF_ARRAY:\r\n                    $value[] = $data[_FF_DATA_VALUE];\r\n                    break;\r\n                case FF_SLIST:\r\n                    $q = \"\'\";\r\n                case FF_DLIST:\r\n                    if ($q==\'\') $q = \'\"\';\r\n                case FF_LIST:\r\n                    if ($q==\'\' && !is_numeric($data[_FF_DATA_VALUE])) $q = \"\'\";\r\n                    if ($value!=\'\') $value.=\',\';\r\n                    $value .= $q.$data[_FF_DATA_VALUE].$q;\r\n                    break;\r\n                default:\r\n                    return $data[_FF_DATA_VALUE];\r\n            } // switch\r\n         } // if\r\n    return $value;\r\n} // ff_getSubmit'),(11,1,'FF','ff_impString','String import','Import string function: unescapes c-coded characters of a string','Untyped','function ff_impString($text)\r\n{\r\n    return impstring($text);\r\n} // ff_impString'),(12,1,'FF','ff_InitLib','Init Library','A collection of useful functions for use in form pieces. \r\n\r\nInclude by: \r\n\r\n    $this->execPieceByName(\'ff_InitLib\');','Before Form','//+trace high none\r\nif (!defined(\'FF_DIE\'))                    $this->execPieceByName(\'ff_Constants\');\r\nif (!function_exists(\'ff_expstring\'))      $this->execPieceByName(\'ff_expstring\');\r\nif (!function_exists(\'ff_makePageUrl\'))    $this->execPieceByName(\'ff_makePageUrl\');\r\nif (!function_exists(\'ff_makeFormUrl\'))    $this->execPieceByName(\'ff_makeFormUrl\');\r\nif (!function_exists(\'ff_makeSelfUrl\'))    $this->execPieceByName(\'ff_makeSelfUrl\');\r\nif (!function_exists(\'ff_die\'))            $this->execPieceByName(\'ff_die\');\r\nif (!function_exists(\'ff_dying\'))          $this->execPieceByName(\'ff_dying\');\r\nif (!function_exists(\'ff_redirect\'))       $this->execPieceByName(\'ff_redirect\');\r\nif (!function_exists(\'ff_redirectParent\')) $this->execPieceByName(\'ff_redirectParentX\');\r\nif (!function_exists(\'ff_redirectPage\'))   $this->execPieceByName(\'ff_redirectPage\');\r\nif (!function_exists(\'ff_redirectForm\'))   $this->execPieceByName(\'ff_redirectForm\');\r\nif (!function_exists(\'ff_redirectSelf\'))   $this->execPieceByName(\'ff_redirectSelf\');\r\nif (!function_exists(\'ff_setChecked\'))     $this->execPieceByName(\'ff_setCheckedX\');\r\nif (!function_exists(\'ff_setSelected\'))    $this->execPieceByName(\'ff_setSelectedX\');\r\nif (!function_exists(\'ff_setValue\'))       $this->execPieceByName(\'ff_setValueX\');\r\nif (!function_exists(\'ff_getPageByName\'))  $this->execPieceByName(\'ff_getPageByNameX\');\r\nif (!function_exists(\'ff_getParam\'))       $this->execPieceByName(\'ff_getParam\');\r\nif (!function_exists(\'ff_getSubmit\'))      $this->execPieceByName(\'ff_getSubmit\');\r\nif (!function_exists(\'ff_impString\'))      $this->execPieceByName(\'ff_impString\');\r\nif (!function_exists(\'ff_expString\'))      $this->execPieceByName(\'ff_expString\');\r\nif (!function_exists(\'ff_securityImage\'))  $this->execPieceByName(\'ff_securityImage\');\r\nif (!function_exists(\'ff_select\'))         $this->execPieceByName(\'ff_select\');\r\nif (!function_exists(\'ff_selectValue\'))    $this->execPieceByName(\'ff_selectValue\');\r\nif (!function_exists(\'ff_query\'))          $this->execPieceByName(\'ff_query\');\r\nif (!function_exists(\'ff_markdown\'))       $this->execPieceByName(\'ff_markdown\');'),(13,1,'FF','ff_makeFormUrl','Make URL to other form','Redirects to another facile form. \r\n\r\nCall: \r\n\r\n    $url = ff_makeFormUrl($name, $params = \'\');\r\n\r\nExample:\r\n\r\n    $url = ff_makeFormUrl(\r\n       \'OtherForm\', \r\n       \'&ff_param_email=\'.urlencode($email)\r\n    );','Untyped','function ff_makeFormUrl($name, $params=\'\')\r\n{\r\n    global $ff_processor, $ff_otherparams;\r\n    $url = \'\';\r\n    switch ($ff_processor->runmode) {\r\n        case 2: // preview\r\n        case 1: // backend\r\n            $url .= \'administrator/index2.php?option=com_breezingforms&act=run\'.\r\n                    \'&ff_name=\'.urlencode($name);\r\n            if ($ff_processor->inframe) $url .= \'&ff_frame=1\';\r\n            if ($ff_processor->border) $url .= \'&ff_border=1\';\r\n            break;\r\n        default: // frontend\r\n            $url .= \'index.php?ff_name=\'.urlencode($name);\r\n            if ($ff_otherparams[\'option\'] == \'com_breezingforms\') {\r\n                reset($ff_otherparams);\r\n                while (list($prop, $val) = each($ff_otherparams))\r\n                    $url .= \'&\'.urlencode($prop).\'=\'.urlencode($val);\r\n            } else\r\n                $url .= \'&option=com_breezingforms\';\r\n            if ($ff_processor->target > 1) $url .= \'&ff_target=\'.$ff_processor->target;\r\n            if ($ff_processor->inframe) $url .= \'&ff_frame=1\';\r\n            if ($ff_processor->border) $url .= \'&ff_border=1\';\r\n            if ($ff_processor->align !=1) $url .= \'&ff_align=\'.$ff_processor->align;\r\n            if ($ff_processor->top>0) $url .= \'&ff_top=\'.$ff_processor->top;\r\n    } // switch\r\n    return ff_makePageUrl($url. $params);\r\n} // ff_makeFormUrl'),(14,1,'FF','ff_makePageUrl','Make URL to other page','Builds an URL to another mambo page\r\n\r\nCall: \r\n\r\n    $url = ff_makePageUrl($params = \'\');\r\n\r\nExample:\r\n\r\n    $url = ff_makePageUrl(\r\n        \'index.php?option=com_content&task=blogsection&id=0&Itemid=39\'\r\n    );','Untyped','function ff_makePageUrl($params=\'\')\r\n{\r\n    $url = \'{mossite}\';\r\n    if ($params != \'\') {\r\n        $len = strlen($url);\r\n        if ($len > 0 && $url{$len-1} != \'/\') $url .= \'/\';\r\n        $url .= $params;\r\n    } // if\r\n    return $url;\r\n} // ff_makePageUrl'),(15,1,'FF','ff_makeSelfUrl','Make URL to same form','Make an URL to the same form. \r\n\r\nCall: \r\n\r\n    $url = ff_makeSelfUrl($params = \'\');\r\n\r\nExample:\r\n\r\n    $url = ff_makeSelfUrl(\'&ff_param_email=\'.urlencode($email));','Untyped','function ff_makeSelfUrl($params=\'\')\r\n{\r\n    global $ff_processor;\r\n    return ff_makeFormUrl($ff_processor->formrow->name, $params);\r\n} // ff_makeSelfUrl'),(16,1,'FF','ff_query','Non-select queries against db','Execute a simple db query.\r\n\r\nInclude by one of:\r\n\r\n    $this->execPieceByName(\'ff_InitUtilities\');\r\n    $this->execPieceByName(\'ff_SubmitUtilities\');\r\n    if (!function_exists(\'ff_query\')) $this->execPieceByName(\'ff_query\');\r\n\r\nCall syntax:\r\n\r\n    [$newid = ] ff_query($sql [, $insert = 0]);\r\n\r\n    $sql:    Sql statement to call\r\n    $insert: 1 = return key of auto column when inserting rows\r\n    $newid:  The key of the new row.','Untyped','function ff_query($sql, $insert=false, $error=FF_DIE)\r\n{\r\n    global $ff_processor;\r\n    $database = JFactory::getDBO();\r\n    if ($ff_processor->dying && $error!=FF_IGNOREDIE) return -1;\r\n    $database->setQuery($sql);\r\n    $database->query();\r\n    if ($database->getErrorNum()) {\r\n        $dienow = $error==FF_DIE;\r\n        $error = $database->stderr();\r\n        if ($dienow) ff_die($error);\r\n    } else {\r\n        $error = null;\r\n        if ($insert) return $database->insertid();\r\n    } // if\r\n    return 0;\r\n} // ff_query'),(17,1,'FF','ff_redirect','Basic redirection','Basic redirection routine supporting multiple targets and methods.\r\n\r\nCall:\r\n \r\nff_redirect($url [, $target=\'self\' , $method=\'post\'])\r\n\r\n    $url    = The url to redirect to including the parameters appended.\r\n\r\n    $target = \'top\', \'parent\', \'self\' or \'blank\'\r\n\r\n              \'top\'    = redirect to the top browser window\r\n              \'parent\' = redirect to the parent frame\r\n              \'self\'   = redirect in the same frame (the default)\r\n              \'blank\'  = redirect to a new browser window \r\n                         (blank works with post method only)\r\n\r\n    $method = \'post\' or \'get\'. The default is \'post\'.\r\n\r\n    Example:\r\n\r\n       ff_redirect(\r\n          \'http://mysite.net/index.php?option=xxx&Itemid=33\',\r\n          \'top\'\r\n       );','Untyped','function ff_redirect($url, $target=\'self\', $method=\'post\')\r\n{\r\n    global $ff_processor, $ff_request;\r\n    if ($ff_processor->dying) return;\r\n\r\n    ob_end_clean();\r\n    switch (strtolower($method)) {\r\n        case \'get\': {\r\n            switch (strtolower($target)) {\r\n                case \'top\'   :\r\n                case \'parent\': break;\r\n                default      : $target = \'document\';\r\n            } // switch\r\n            echo \'<script type=\"text/javascript\">\'.nl().\r\n                 \'<!--\'.nl().\r\n                 \"onload=function() { \".$target.\".location.href=\'\".$url.\"\'; }\".nl().\r\n                 \'-->\'.nl().\r\n                 \'</script>\'.nl().\r\n                 \'</body>\'.nl();\r\n            break;\r\n        } // url\r\n        default: { // post\r\n            $pos = strpos($url,\'?\');\r\n            $ff_request = array();\r\n            if ($pos === false)\r\n                $action = $url;\r\n            else {\r\n                $action = substr($url,0,$pos);\r\n                addRequestParams(substr($url, $pos+1));\r\n            } // if\r\n            switch (strtolower($target)) {\r\n                case \'blank\' : $target = \' target=\"_blank\"\';  break;\r\n                case \'top\'   : $target = \' target=\"_top\"\';    break;\r\n                case \'parent\': $target = \' target=\"_parent\"\'; break;\r\n                default      : $target = \' target=\"_self\"\';\r\n            } // switch\r\n            echo \'<script language=\"javascript\" type=\"text/javascript\">\'.nl().\r\n                 \'<!--\'.nl().\r\n                 \'onload = function() { document.ff_redirect.submit(); }\'.nl().\r\n                 \'-->\'.nl().\r\n                 \'</script>\'.nl().\r\n                 \'<form action=\"\'.$action.\'\" \'.\r\n                  \'method=\"post\" \'.\r\n                  \'name=\"ff_redirect\" id=\"ff_redirect\" \'.\r\n                  \'enctype=\"multipart/form-data\"\'.\r\n                  $target.\r\n                 \'>\'.nl();\r\n            while (list($prop, $val) = each($ff_request))\r\n                echo \'<input type=\"hidden\" name=\"\'.$prop.\'\" \'.\r\n                            \'value=\"\'.htmlentities(urldecode($val)).\'\"/>\'.nl();\r\n            echo \'</form>\'.nl().\r\n                 \'</body>\'.nl();\r\n        } // post\r\n    } // switch\r\n    exit;\r\n} // ff_redirect'),(18,1,'FF','ff_redirectForm','Redirect to other form','Redirects to another facile form. \r\n\r\nCall: \r\n\r\n    ff_redirectForm($name, $params = \'\');\r\n\r\nExample:\r\n\r\n    ff_redirectForm(\r\n        $this, \r\n       \'SecondForm\', \r\n       \'&ff_param_email=\'.urlencode($email)\r\n    );','Untyped','function ff_redirectForm($name, $params=\'\', $method=\'post\')\r\n{\r\n    ff_redirectParent(ff_makeFormUrl($name, $params), $method);\r\n} // ff_redirectForm'),(19,1,'FF','ff_redirectPage','Redirect to other page','Redirects to another mambo page. \r\n\r\nCall: \r\n\r\n    ff_redirectPage($params = \'\');\r\n\r\nExample:\r\n\r\n    ff_redirectPage(\r\n        \'index.php?option=com_content&task=blogsection&id=0&Itemid=39\'\r\n    );','Untyped','function ff_redirectPage($params=\'\', $method=\'post\')\r\n{\r\n    ff_redirectParent(ff_makePageUrl($params), $method);\r\n} // ff_redirectPage'),(20,1,'FF','ff_redirectParentX','Redirect to parent window','Redirects to the parent window when runing in iframe, otherwise to self. \r\n\r\nff_redirectParent($url [, $method=\'post\'])\r\n\r\n    $url    = The url to redirect to including the parameters appended.\r\n\r\n    $method = \'post\' or \'url\'. The default is \'post\'.\r\n\r\n    Example:\r\n\r\n       ff_redirectParent(\r\n          \'http://mysite.net/index.php?option=xxx&Itemid=33\',\r\n          \'url\'\r\n       );','Untyped','function ff_redirectParent($url, $method = \'post\')\r\n{\r\n    global $ff_processor;\r\n    if ($ff_processor->inframe) $target = \'parent\'; else $target = \'self\'; \r\n    ff_redirect($url, $target, $method);\r\n} // ff_redirectParent'),(21,1,'FF','ff_redirectSelf','Redirect to same form','Redirects to the same form. \r\n\r\nCall: \r\n\r\n    ff_redirectSelf($params = \'\');\r\n\r\nExample:\r\n\r\n    ff_redirectSelf(\'&ff_param_email=\'.urlencode($email));','Untyped','function ff_redirectSelf($params=\'\', $method=\'post\')\r\n{\r\n    ff_redirectParent(ff_makeSelfUrl($params), $method);\r\n} // ff_redirectSelf'),(22,1,'FF','ff_securityImage','Security Image','Create code to display the security image','Untyped','global $ff_seccode;\r\n\r\nif (!isset($this->record_id)) { $ff_seccode = null; }\r\n\r\nfunction ff_securityImage()\r\n{\r\n    global $ff_comsite, $ff_seccode;\r\n    if (!isset($ff_seccode)) { \r\n        mt_srand((double)microtime()*1000000);\r\n        $ff_seccode = mt_rand(10000, 99999);\r\n        JFactory::getSession()->set(\'ff_seccode\', $ff_seccode);\r\n    } // if\r\n\r\n    return \'<img src=\"\'.JURI::root().\'ff_secimage.php?option=com_breezingforms&showSecImage=true\" title=\"\" alt=\"\" />\';\r\n} // ff_securityImage'),(23,1,'FF','ff_select','Select rows from db','Execute a select query\r\n\r\nInclude by one of:\r\n\r\n    $this->execPieceByName(\'ff_InitUtilities\');\r\n    $this->execPieceByName(\'ff_SubmitUtilities\');\r\n    if (!function_exists(\'ff_select\')) $this->execPieceByName(\'ff_select\');\r\n\r\nCall syntax:\r\n\r\n    $rows = ff_select($sql);\r\n\r\n    $sql:    Sql SELECT-statement to call\r\n    $rows:   List of row objects','Untyped','function ff_select($sql, $error=FF_DIE)\r\n{\r\n    $database = JFactory::getDBO();\r\n    $database->setQuery($sql);\r\n    $rows = $database->loadObjectList();\r\n    if ($database->getErrorNum()) {\r\n        $dienow = $error==FF_DIE;\r\n        $error = $database->stderr();\r\n        $rows = array();\r\n        if ($dienow) ff_die($error);\r\n    } else\r\n        $error = null;\r\n    return $rows;\r\n} // ff_select'),(24,1,'FF','ff_selectValue','Select single value from db','Execute query to read a single value\r\n\r\nInclude by one of:\r\n\r\n    $this->execPieceByName(\'ff_InitUtilities\');\r\n    $this->execPieceByName(\'ff_SubmitUtilities\');\r\n    if (!function_exists(\'ff_selectValue\')) $this->execPieceByName(\'ff_selectValue\');\r\n\r\nCall syntax:\r\n\r\n    $value = ff_selectValue($sql);\r\n\r\n    $sql:    Sql SELECT-statement to call\r\n    $value:  The value returned by the database','Untyped','function ff_selectValue($sql, $def=null, $error=FF_DIE)\r\n{\r\n    $database = JFactory::getDBO();\r\n    $database->setQuery($sql);\r\n    $value = $database->loadResult();\r\n    if ($database->getErrorNum()) {\r\n        $dienow = $error==FF_DIE;\r\n        $error = $database->stderr();\r\n        if ($dienow) ff_die($error);\r\n    } else {\r\n        $error = null;\r\n        if ($value) return $value;\r\n    } // if\r\n    return $def;\r\n} // ff_selectValue'),(25,1,'FF','ff_setCheckedX','Set checkbox/radiobutton checked','Set a radio button or checkbox checked. \r\n\r\nCall: \r\n\r\n    ff_setChecked(\'name\', \'value\');','Untyped','function ff_setChecked($name, $value)\r\n{\r\n    global $ff_processor;\r\n    for ($r = 0; $r < $ff_processor->rowcount; $r++) {\r\n        $row =& $ff_processor->rows[$r];\r\n        if ($row->name==$name && $row->data1==$value)\r\n            $row->flag1 = 1;\r\n        unset($row);\r\n    } // for\r\n} // ff_setChecked'),(26,1,'FF','ff_setSelectedX','Set a select list option to *selected*','Sets a select list option to selected. \r\n\r\nCall: \r\n\r\n    ff_setSelected(\'name\', \'value\');','Untyped','function ff_setSelected($name, $value)\r\n{\r\n    global $ff_processor;\r\n    for ($r = 0; $r < $ff_processor->rowcount; $r++) {\r\n        $row =& $ff_processor->rows[$r];\r\n        if ($row->name==$name)\r\n            $row->data2 =\r\n                preg_replace(\r\n                    \'/(^|\\r\\n|\\n)(0|1);([^;]*);(\'.$value.\')($|\\r\\n|\\n)/\',\r\n                    \'${1}1;${3};${4}${5}\',\r\n                    $row->data2\r\n                );\r\n        unset($row);\r\n    } // for\r\n} // ff_setSelected'),(27,1,'FF','ff_setValueX','Set text, textarea, hidden value','Set value of a Static Text, Text, Textarea or Hidden Input. \r\n\r\nCall: \r\n\r\n    ff_setValue(\'name\', \'value\');','Untyped','function ff_setValue($name, $value)\r\n{\r\n    global $ff_processor;\r\n    for ($r = 0; $r < $ff_processor->rowcount; $r++) {\r\n        $row =& $ff_processor->rows[$r];\r\n        if ($row->name==$name)\r\n            $row->data1 = $value;\r\n        unset($row);\r\n    } // for\r\n} // ff_setValue'),(28,1,'FF','Markdown','Original Markdown Processor','Converts text marked up by \'Markdown\' into HTML.\r\n\r\nPlease use ff_markdown() in forms instead of Markdown()','Untyped','#\r\n# Markdown  -  A text-to-HTML conversion tool for web writers\r\n#\r\n# Copyright (c) 2004-2005 John Gruber\r\n# <http://daringfireball.net/projects/markdown/>\r\n#\r\n# Copyright (c) 2004-2005 Michel Fortin - PHP Port\r\n# <http://www.michelf.com/projects/php-markdown/>\r\n#\r\n\r\nglobal	$MarkdownPHPVersion, $MarkdownSyntaxVersion,\r\n		$md_empty_element_suffix, $md_tab_width,\r\n		$md_nested_brackets_depth, $md_nested_brackets,\r\n		$md_escape_table, $md_backslash_escape_table,\r\n		$md_list_level;\r\n\r\n$MarkdownPHPVersion    = \'1.0.1b\'; # Mon 6 Jun 2005\r\n$MarkdownSyntaxVersion = \'1.0.1\';  # Sun 12 Dec 2004\r\n\r\n\r\n#\r\n# Global default settings:\r\n#\r\n$md_empty_element_suffix = \" />\";     # Change to \">\" for HTML output\r\n$md_tab_width = 4;\r\n\r\n#\r\n# WordPress settings:\r\n#\r\n$md_wp_posts    = true;  # Set to false to remove Markdown from posts.\r\n$md_wp_comments = true;  # Set to false to remove Markdown from comments.\r\n\r\n\r\n# -- WordPress Plugin Interface -----------------------------------------------\r\n/*\r\nPlugin Name: Markdown\r\nPlugin URI: http://www.michelf.com/projects/php-markdown/\r\nDescription: <a href=\"http://daringfireball.net/projects/markdown/syntax\">Markdown syntax</a> allows you to write using an easy-to-read, easy-to-write plain text format. Based on the original Perl version by <a href=\"http://daringfireball.net/\">John Gruber</a>. <a href=\"http://www.michelf.com/projects/php-markdown/\">More...</a>\r\nVersion: 1.0.1b\r\nAuthor: Michel Fortin\r\nAuthor URI: http://www.michelf.com/\r\n*/\r\nif (isset($wp_version)) {\r\n	# More details about how it works here:\r\n	# <http://www.michelf.com/weblog/2005/wordpress-text-flow-vs-markdown/>\r\n\r\n	# Post content and excerpts\r\n	if ($md_wp_posts) {\r\n		remove_filter(\'the_content\',  \'wpautop\');\r\n		remove_filter(\'the_excerpt\',  \'wpautop\');\r\n		add_filter(\'the_content\',     \'Markdown\', 6);\r\n		add_filter(\'get_the_excerpt\', \'Markdown\', 6);\r\n		add_filter(\'get_the_excerpt\', \'trim\', 7);\r\n		add_filter(\'the_excerpt\',     \'md_add_p\');\r\n		add_filter(\'the_excerpt_rss\', \'md_strip_p\');\r\n\r\n		remove_filter(\'content_save_pre\',  \'balanceTags\', 50);\r\n		remove_filter(\'excerpt_save_pre\',  \'balanceTags\', 50);\r\n		add_filter(\'the_content\',  	  \'balanceTags\', 50);\r\n		add_filter(\'get_the_excerpt\', \'balanceTags\', 9);\r\n\r\n		function md_add_p($text) {\r\n			if (strlen($text) == 0) return;\r\n			if (strcasecmp(substr($text, -3), \'<p>\') == 0) return $text;\r\n			return \'<p>\'.$text.\'</p>\';\r\n		}\r\n		function md_strip_p($t) { return preg_replace(\'{</?[pP]>}\', \'\', $t); }\r\n	}\r\n\r\n	# Comments\r\n	if ($md_wp_comments) {\r\n		remove_filter(\'comment_text\', \'wpautop\');\r\n		remove_filter(\'comment_text\', \'make_clickable\');\r\n		add_filter(\'pre_comment_content\', \'Markdown\', 6);\r\n		add_filter(\'pre_comment_content\', \'md_hide_tags\', 8);\r\n		add_filter(\'pre_comment_content\', \'md_show_tags\', 12);\r\n		add_filter(\'get_comment_text\',    \'Markdown\', 6);\r\n		add_filter(\'get_comment_excerpt\', \'Markdown\', 6);\r\n		add_filter(\'get_comment_excerpt\', \'md_strip_p\', 7);\r\n\r\n		global $md_hidden_tags;\r\n		$md_hidden_tags = array(\r\n			\'<p>\'	=> md5(\'<p>\'),		\'</p>\'	=> md5(\'</p>\'),\r\n			\'<pre>\'	=> md5(\'<pre>\'),	\'</pre>\'=> md5(\'</pre>\'),\r\n			\'<ol>\'	=> md5(\'<ol>\'),		\'</ol>\'	=> md5(\'</ol>\'),\r\n			\'<ul>\'	=> md5(\'<ul>\'),		\'</ul>\'	=> md5(\'</ul>\'),\r\n			\'<li>\'	=> md5(\'<li>\'),		\'</li>\'	=> md5(\'</li>\'),\r\n			);\r\n\r\n		function md_hide_tags($text) {\r\n			global $md_hidden_tags;\r\n			return str_replace(array_keys($md_hidden_tags),\r\n								array_values($md_hidden_tags), $text);\r\n		}\r\n		function md_show_tags($text) {\r\n			global $md_hidden_tags;\r\n			return str_replace(array_values($md_hidden_tags),\r\n								array_keys($md_hidden_tags), $text);\r\n		}\r\n	}\r\n}\r\n\r\n\r\n# -- bBlog Plugin Info --------------------------------------------------------\r\nfunction identify_modifier_markdown() {\r\n	global $MarkdownPHPVersion;\r\n	return array(\r\n		\'name\'			=> \'markdown\',\r\n		\'type\'			=> \'modifier\',\r\n		\'nicename\'		=> \'Markdown\',\r\n		\'description\'	=> \'A text-to-HTML conversion tool for web writers\',\r\n		\'authors\'		=> \'Michel Fortin and John Gruber\',\r\n		\'licence\'		=> \'GPL\',\r\n		\'version\'		=> $MarkdownPHPVersion,\r\n		\'help\'			=> \'<a href=\"http://daringfireball.net/projects/markdown/syntax\">Markdown syntax</a> allows you to write using an easy-to-read, easy-to-write plain text format. Based on the original Perl version by <a href=\"http://daringfireball.net/\">John Gruber</a>. <a href=\"http://www.michelf.com/projects/php-markdown/\">More...</a>\'\r\n	);\r\n}\r\n\r\n# -- Smarty Modifier Interface ------------------------------------------------\r\nfunction smarty_modifier_markdown($text) {\r\n	return Markdown($text);\r\n}\r\n\r\n# -- Textile Compatibility Mode -----------------------------------------------\r\n# Rename this file to \"classTextile.php\" and it can replace Textile anywhere.\r\nif (strcasecmp(substr(__FILE__, -16), \"classTextile.php\") == 0) {\r\n	# Try to include PHP SmartyPants. Should be in the same directory.\r\n	@include_once \'smartypants.php\';\r\n	# Fake Textile class. It calls Markdown instead.\r\n	class Textile {\r\n		function TextileThis($text, $lite=\'\', $encode=\'\', $noimage=\'\', $strict=\'\') {\r\n			if ($lite == \'\' && $encode == \'\')   $text = Markdown($text);\r\n			if (function_exists(\'SmartyPants\')) $text = SmartyPants($text);\r\n			return $text;\r\n		}\r\n	}\r\n}\r\n\r\n\r\n\r\n#\r\n# Globals:\r\n#\r\n\r\n# Regex to match balanced [brackets].\r\n# Needed to insert a maximum bracked depth while converting to PHP.\r\n$md_nested_brackets_depth = 6;\r\n$md_nested_brackets =\r\n	str_repeat(\'(?>[^\\[\\]]+|\\[\', $md_nested_brackets_depth).\r\n	str_repeat(\'\\])*\', $md_nested_brackets_depth);\r\n\r\n# Table of hash values for escaped characters:\r\n$md_escape_table = array(\r\n	\"\\\\\" => md5(\"\\\\\"),\r\n	\"`\" => md5(\"`\"),\r\n	\"*\" => md5(\"*\"),\r\n	\"_\" => md5(\"_\"),\r\n	\"{\" => md5(\"{\"),\r\n	\"}\" => md5(\"}\"),\r\n	\"[\" => md5(\"[\"),\r\n	\"]\" => md5(\"]\"),\r\n	\"(\" => md5(\"(\"),\r\n	\")\" => md5(\")\"),\r\n	\">\" => md5(\">\"),\r\n	\"#\" => md5(\"#\"),\r\n	\"+\" => md5(\"+\"),\r\n	\"-\" => md5(\"-\"),\r\n	\".\" => md5(\".\"),\r\n	\"!\" => md5(\"!\")\r\n);\r\n# Create an identical table but for escaped characters.\r\n$md_backslash_escape_table;\r\nforeach ($md_escape_table as $key => $char)\r\n	$md_backslash_escape_table[\"\\\\$key\"] = $char;\r\n\r\n\r\nfunction Markdown($text) {\r\n#\r\n# Main function. The order in which other subs are called here is\r\n# essential. Link and image substitutions need to happen before\r\n# _EscapeSpecialCharsWithinTagAttributes(), so that any *\'s or _\'s in the <a>\r\n# and <img> tags get encoded.\r\n#\r\n	# Clear the global hashes. If we don\'t clear these, you get conflicts\r\n	# from other articles when generating a page which contains more than\r\n	# one article (e.g. an index page that shows the N most recent\r\n	# articles):\r\n	global $md_urls, $md_titles, $md_html_blocks;\r\n	$md_urls = array();\r\n	$md_titles = array();\r\n	$md_html_blocks = array();\r\n\r\n	# Standardize line endings:\r\n	#   DOS to Unix and Mac to Unix\r\n	$text = str_replace(array(\"\\r\\n\", \"\\r\"), \"\\n\", $text);\r\n\r\n	# Make sure $text ends with a couple of newlines:\r\n	$text .= \"\\n\\n\";\r\n\r\n	# Convert all tabs to spaces.\r\n	$text = _Detab($text);\r\n\r\n	# Strip any lines consisting only of spaces and tabs.\r\n	# This makes subsequent regexen easier to write, because we can\r\n	# match consecutive blank lines with /\\n+/ instead of something\r\n	# contorted like /[ \\t]*\\n+/ .\r\n	$text = preg_replace(\'/^[ \\t]+$/m\', \'\', $text);\r\n\r\n	# Turn block-level HTML blocks into hash entries\r\n	$text = _HashHTMLBlocks($text);\r\n\r\n	# Strip link definitions, store in hashes.\r\n	$text = _StripLinkDefinitions($text);\r\n\r\n	$text = _RunBlockGamut($text);\r\n\r\n	$text = _UnescapeSpecialChars($text);\r\n\r\n	return $text . \"\\n\";\r\n}\r\n\r\n\r\nfunction _StripLinkDefinitions($text) {\r\n#\r\n# Strips link definitions from text, stores the URLs and titles in\r\n# hash references.\r\n#\r\n	global $md_tab_width;\r\n	$less_than_tab = $md_tab_width - 1;\r\n\r\n	# Link defs are in the form: ^[id]: url \"optional title\"\r\n	$text = preg_replace_callback(\'{\r\n						^[ ]{0,\'.$less_than_tab.\'}\\[(.+)\\]:	# id = $1\r\n						  [ \\t]*\r\n						  \\n?				# maybe *one* newline\r\n						  [ \\t]*\r\n						<?(\\S+?)>?			# url = $2\r\n						  [ \\t]*\r\n						  \\n?				# maybe one newline\r\n						  [ \\t]*\r\n						(?:\r\n							(?<=\\s)			# lookbehind for whitespace\r\n							[\"(]\r\n							(.+?)			# title = $3\r\n							[\")]\r\n							[ \\t]*\r\n						)?	# title is optional\r\n						(?:\\n+|\\Z)\r\n		}xm\',\r\n		\'_StripLinkDefinitions_callback\',\r\n		$text);\r\n	return $text;\r\n}\r\nfunction _StripLinkDefinitions_callback($matches) {\r\n	global $md_urls, $md_titles;\r\n	$link_id = strtolower($matches[1]);\r\n	$md_urls[$link_id] = _EncodeAmpsAndAngles($matches[2]);\r\n	if (isset($matches[3]))\r\n		$md_titles[$link_id] = str_replace(\'\"\', \'&quot;\', $matches[3]);\r\n	return \'\'; # String that will replace the block\r\n}\r\n\r\n\r\nfunction _HashHTMLBlocks($text) {\r\n	global $md_tab_width;\r\n	$less_than_tab = $md_tab_width - 1;\r\n\r\n	# Hashify HTML blocks:\r\n	# We only want to do this for block-level HTML tags, such as headers,\r\n	# lists, and tables. That\'s because we still want to wrap <p>s around\r\n	# \"paragraphs\" that are wrapped in non-block-level tags, such as anchors,\r\n	# phrase emphasis, and spans. The list of tags we\'re looking for is\r\n	# hard-coded:\r\n	$block_tags_a = \'p|div|h[1-6]|blockquote|pre|table|dl|ol|ul|\'.\r\n					\'script|noscript|form|fieldset|iframe|math|ins|del\';\r\n	$block_tags_b = \'p|div|h[1-6]|blockquote|pre|table|dl|ol|ul|\'.\r\n					\'script|noscript|form|fieldset|iframe|math\';\r\n\r\n	# First, look for nested blocks, e.g.:\r\n	# 	<div>\r\n	# 		<div>\r\n	# 		tags for inner block must be indented.\r\n	# 		</div>\r\n	# 	</div>\r\n	#\r\n	# The outermost tags must start at the left margin for this to match, and\r\n	# the inner nested divs must be indented.\r\n	# We need to do this before the next, more liberal match, because the next\r\n	# match will start at the first `<div>` and stop at the first `</div>`.\r\n	$text = preg_replace_callback(\"{\r\n				(						# save in $1\r\n					^					# start of line  (with /m)\r\n					<($block_tags_a)	# start tag = $2\r\n					\\\\b					# word break\r\n					(.*\\\\n)*?			# any number of lines, minimally matching\r\n					</\\\\2>				# the matching end tag\r\n					[ \\\\t]*				# trailing spaces/tabs\r\n					(?=\\\\n+|\\\\Z)	# followed by a newline or end of document\r\n				)\r\n		}xm\",\r\n		\'_HashHTMLBlocks_callback\',\r\n		$text);\r\n\r\n	#\r\n	# Now match more liberally, simply from `\\n<tag>` to `</tag>\\n`\r\n	#\r\n	$text = preg_replace_callback(\"{\r\n				(						# save in $1\r\n					^					# start of line  (with /m)\r\n					<($block_tags_b)	# start tag = $2\r\n					\\\\b					# word break\r\n					(.*\\\\n)*?			# any number of lines, minimally matching\r\n					.*</\\\\2>				# the matching end tag\r\n					[ \\\\t]*				# trailing spaces/tabs\r\n					(?=\\\\n+|\\\\Z)	# followed by a newline or end of document\r\n				)\r\n		}xm\",\r\n		\'_HashHTMLBlocks_callback\',\r\n		$text);\r\n\r\n	# Special case just for <hr />. It was easier to make a special case than\r\n	# to make the other regex more complicated.\r\n	$text = preg_replace_callback(\'{\r\n				(?:\r\n					(?<=\\n\\n)		# Starting after a blank line\r\n					|				# or\r\n					\\A\\n?			# the beginning of the doc\r\n				)\r\n				(						# save in $1\r\n					[ ]{0,\'.$less_than_tab.\'}\r\n					<(hr)				# start tag = $2\r\n					\\b					# word break\r\n					([^<>])*?			#\r\n					/?>					# the matching end tag\r\n					[ \\t]*\r\n					(?=\\n{2,}|\\Z)		# followed by a blank line or end of document\r\n				)\r\n		}x\',\r\n		\'_HashHTMLBlocks_callback\',\r\n		$text);\r\n\r\n	# Special case for standalone HTML comments:\r\n	$text = preg_replace_callback(\'{\r\n				(?:\r\n					(?<=\\n\\n)		# Starting after a blank line\r\n					|				# or\r\n					\\A\\n?			# the beginning of the doc\r\n				)\r\n				(						# save in $1\r\n					[ ]{0,\'.$less_than_tab.\'}\r\n					(?s:\r\n						<!\r\n						(--.*?--\\s*)+\r\n						>\r\n					)\r\n					[ \\t]*\r\n					(?=\\n{2,}|\\Z)		# followed by a blank line or end of document\r\n				)\r\n			}x\',\r\n			\'_HashHTMLBlocks_callback\',\r\n			$text);\r\n\r\n	return $text;\r\n}\r\nfunction _HashHTMLBlocks_callback($matches) {\r\n	global $md_html_blocks;\r\n	$text = $matches[1];\r\n	$key = md5($text);\r\n	$md_html_blocks[$key] = $text;\r\n	return \"\\n\\n$key\\n\\n\"; # String that will replace the block\r\n}\r\n\r\n\r\nfunction _RunBlockGamut($text) {\r\n#\r\n# These are all the transformations that form block-level\r\n# tags like paragraphs, headers, and list items.\r\n#\r\n	global $md_empty_element_suffix;\r\n\r\n	$text = _DoHeaders($text);\r\n\r\n	# Do Horizontal Rules:\r\n	$text = preg_replace(\r\n		array(\'{^[ ]{0,2}([ ]?\\*[ ]?){3,}[ \\t]*$}mx\',\r\n			  \'{^[ ]{0,2}([ ]? -[ ]?){3,}[ \\t]*$}mx\',\r\n			  \'{^[ ]{0,2}([ ]? _[ ]?){3,}[ \\t]*$}mx\'),\r\n		\"\\n<hr$md_empty_element_suffix\\n\",\r\n		$text);\r\n\r\n	$text = _DoLists($text);\r\n	$text = _DoCodeBlocks($text);\r\n	$text = _DoBlockQuotes($text);\r\n\r\n	# We already ran _HashHTMLBlocks() before, in Markdown(), but that\r\n	# was to escape raw HTML in the original Markdown source. This time,\r\n	# we\'re escaping the markup we\'ve just created, so that we don\'t wrap\r\n	# <p> tags around block-level tags.\r\n	$text = _HashHTMLBlocks($text);\r\n	$text = _FormParagraphs($text);\r\n\r\n	return $text;\r\n}\r\n\r\n\r\nfunction _RunSpanGamut($text) {\r\n#\r\n# These are all the transformations that occur *within* block-level\r\n# tags like paragraphs, headers, and list items.\r\n#\r\n	global $md_empty_element_suffix;\r\n\r\n	$text = _DoCodeSpans($text);\r\n\r\n	$text = _EscapeSpecialChars($text);\r\n\r\n	# Process anchor and image tags. Images must come first,\r\n	# because ![foo][f] looks like an anchor.\r\n	$text = _DoImages($text);\r\n	$text = _DoAnchors($text);\r\n\r\n	# Make links out of things like `<http://example.com/>`\r\n	# Must come after _DoAnchors(), because you can use < and >\r\n	# delimiters in inline links like [this](<url>).\r\n	$text = _DoAutoLinks($text);\r\n	$text = _EncodeAmpsAndAngles($text);\r\n	$text = _DoItalicsAndBold($text);\r\n\r\n	# Do hard breaks:\r\n	$text = preg_replace(\'/ {2,}\\n/\', \"<br$md_empty_element_suffix\\n\", $text);\r\n\r\n	return $text;\r\n}\r\n\r\n\r\nfunction _EscapeSpecialChars($text) {\r\n	global $md_escape_table;\r\n	$tokens = _TokenizeHTML($text);\r\n\r\n	$text = \'\';   # rebuild $text from the tokens\r\n#	$in_pre = 0;  # Keep track of when we\'re inside <pre> or <code> tags.\r\n#	$tags_to_skip = \"!<(/?)(?:pre|code|kbd|script|math)[\\s>]!\";\r\n\r\n	foreach ($tokens as $cur_token) {\r\n		if ($cur_token[0] == \'tag\') {\r\n			# Within tags, encode * and _ so they don\'t conflict\r\n			# with their use in Markdown for italics and strong.\r\n			# We\'re replacing each such character with its\r\n			# corresponding MD5 checksum value; this is likely\r\n			# overkill, but it should prevent us from colliding\r\n			# with the escape values by accident.\r\n			$cur_token[1] = str_replace(array(\'*\', \'_\'),\r\n				array($md_escape_table[\'*\'], $md_escape_table[\'_\']),\r\n				$cur_token[1]);\r\n			$text .= $cur_token[1];\r\n		} else {\r\n			$t = $cur_token[1];\r\n			$t = _EncodeBackslashEscapes($t);\r\n			$text .= $t;\r\n		}\r\n	}\r\n	return $text;\r\n}\r\n\r\n\r\nfunction _DoAnchors($text) {\r\n#\r\n# Turn Markdown link shortcuts into XHTML <a> tags.\r\n#\r\n	global $md_nested_brackets;\r\n	#\r\n	# First, handle reference-style links: [link text] [id]\r\n	#\r\n	$text = preg_replace_callback(\"{\r\n		(					# wrap whole match in $1\r\n		  \\\\[\r\n			($md_nested_brackets)	# link text = $2\r\n		  \\\\]\r\n\r\n		  [ ]?				# one optional space\r\n		  (?:\\\\n[ ]*)?		# one optional newline followed by spaces\r\n\r\n		  \\\\[\r\n			(.*?)		# id = $3\r\n		  \\\\]\r\n		)\r\n		}xs\",\r\n		\'_DoAnchors_reference_callback\', $text);\r\n\r\n	#\r\n	# Next, inline-style links: [link text](url \"optional title\")\r\n	#\r\n	$text = preg_replace_callback(\"{\r\n		(				# wrap whole match in $1\r\n		  \\\\[\r\n			($md_nested_brackets)	# link text = $2\r\n		  \\\\]\r\n		  \\\\(			# literal paren\r\n			[ \\\\t]*\r\n			<?(.*?)>?	# href = $3\r\n			[ \\\\t]*\r\n			(			# $4\r\n			  ([\'\\\"])	# quote char = $5\r\n			  (.*?)		# Title = $6\r\n			  \\\\5		# matching quote\r\n			)?			# title is optional\r\n		  \\\\)\r\n		)\r\n		}xs\",\r\n		\'_DoAnchors_inline_callback\', $text);\r\n\r\n	return $text;\r\n}\r\nfunction _DoAnchors_reference_callback($matches) {\r\n	global $md_urls, $md_titles, $md_escape_table;\r\n	$whole_match = $matches[1];\r\n	$link_text   = $matches[2];\r\n	$link_id     = strtolower($matches[3]);\r\n\r\n	if ($link_id == \"\") {\r\n		$link_id = strtolower($link_text); # for shortcut links like [this][].\r\n	}\r\n\r\n	if (isset($md_urls[$link_id])) {\r\n		$url = $md_urls[$link_id];\r\n		# We\'ve got to encode these to avoid conflicting with italics/bold.\r\n		$url = str_replace(array(\'*\', \'_\'),\r\n						   array($md_escape_table[\'*\'], $md_escape_table[\'_\']),\r\n						   $url);\r\n		$result = \"<a href=\\\"$url\\\"\";\r\n		if ( isset( $md_titles[$link_id] ) ) {\r\n			$title = $md_titles[$link_id];\r\n			$title = str_replace(array(\'*\',     \'_\'),\r\n								 array($md_escape_table[\'*\'],\r\n									   $md_escape_table[\'_\']), $title);\r\n			$result .=  \" title=\\\"$title\\\"\";\r\n		}\r\n		$result .= \">$link_text</a>\";\r\n	}\r\n	else {\r\n		$result = $whole_match;\r\n	}\r\n	return $result;\r\n}\r\nfunction _DoAnchors_inline_callback($matches) {\r\n	global $md_escape_table;\r\n	$whole_match	= $matches[1];\r\n	$link_text		= $matches[2];\r\n	$url			= $matches[3];\r\n	$title			=& $matches[6];\r\n\r\n	# We\'ve got to encode these to avoid conflicting with italics/bold.\r\n	$url = str_replace(array(\'*\', \'_\'),\r\n					   array($md_escape_table[\'*\'], $md_escape_table[\'_\']),\r\n					   $url);\r\n	$result = \"<a href=\\\"$url\\\"\";\r\n	if (isset($title)) {\r\n		$title = str_replace(\'\"\', \'&quot;\', $title);\r\n		$title = str_replace(array(\'*\', \'_\'),\r\n							 array($md_escape_table[\'*\'], $md_escape_table[\'_\']),\r\n							 $title);\r\n		$result .=  \" title=\\\"$title\\\"\";\r\n	}\r\n\r\n	$result .= \">$link_text</a>\";\r\n\r\n	return $result;\r\n}\r\n\r\n\r\nfunction _DoImages($text) {\r\n#\r\n# Turn Markdown image shortcuts into <img> tags.\r\n#\r\n	global $md_nested_brackets;\r\n\r\n	#\r\n	# First, handle reference-style labeled images: ![alt text][id]\r\n	#\r\n	$text = preg_replace_callback(\'{\r\n		(				# wrap whole match in $1\r\n		  !\\[\r\n			(\'.$md_nested_brackets.\')		# alt text = $2\r\n		  \\]\r\n\r\n		  [ ]?				# one optional space\r\n		  (?:\\n[ ]*)?		# one optional newline followed by spaces\r\n\r\n		  \\[\r\n			(.*?)		# id = $3\r\n		  \\]\r\n\r\n		)\r\n		}xs\',\r\n		\'_DoImages_reference_callback\', $text);\r\n\r\n	#\r\n	# Next, handle inline images:  ![alt text](url \"optional title\")\r\n	# Don\'t forget: encode * and _\r\n\r\n	$text = preg_replace_callback(\'{\r\n		(				# wrap whole match in $1\r\n		  !\\[\r\n			(\'.$md_nested_brackets.\')		# alt text = $2\r\n		  \\]\r\n		  \\(			# literal paren\r\n			[ \\t]*\r\n			<?(\\S+?)>?	# src url = $3\r\n			[ \\t]*\r\n			(			# $4\r\n			  ([\\\'\"])	# quote char = $5\r\n			  (.*?)		# title = $6\r\n			  \\5		# matching quote\r\n			  [ \\t]*\r\n			)?			# title is optional\r\n		  \\)\r\n		)\r\n		}xs\',\r\n		\'_DoImages_inline_callback\', $text);\r\n\r\n	return $text;\r\n}\r\nfunction _DoImages_reference_callback($matches) {\r\n	global $md_urls, $md_titles, $md_empty_element_suffix, $md_escape_table;\r\n	$whole_match = $matches[1];\r\n	$alt_text    = $matches[2];\r\n	$link_id     = strtolower($matches[3]);\r\n\r\n	if ($link_id == \"\") {\r\n		$link_id = strtolower($alt_text); # for shortcut links like ![this][].\r\n	}\r\n\r\n	$alt_text = str_replace(\'\"\', \'&quot;\', $alt_text);\r\n	if (isset($md_urls[$link_id])) {\r\n		$url = $md_urls[$link_id];\r\n		# We\'ve got to encode these to avoid conflicting with italics/bold.\r\n		$url = str_replace(array(\'*\', \'_\'),\r\n						   array($md_escape_table[\'*\'], $md_escape_table[\'_\']),\r\n						   $url);\r\n		$result = \"<img src=\\\"$url\\\" alt=\\\"$alt_text\\\"\";\r\n		if (isset($md_titles[$link_id])) {\r\n			$title = $md_titles[$link_id];\r\n			$title = str_replace(array(\'*\', \'_\'),\r\n								 array($md_escape_table[\'*\'],\r\n									   $md_escape_table[\'_\']), $title);\r\n			$result .=  \" title=\\\"$title\\\"\";\r\n		}\r\n		$result .= $md_empty_element_suffix;\r\n	}\r\n	else {\r\n		# If there\'s no such link ID, leave intact:\r\n		$result = $whole_match;\r\n	}\r\n\r\n	return $result;\r\n}\r\nfunction _DoImages_inline_callback($matches) {\r\n	global $md_empty_element_suffix, $md_escape_table;\r\n	$whole_match	= $matches[1];\r\n	$alt_text		= $matches[2];\r\n	$url			= $matches[3];\r\n	$title			= \'\';\r\n	if (isset($matches[6])) {\r\n		$title		= $matches[6];\r\n	}\r\n\r\n	$alt_text = str_replace(\'\"\', \'&quot;\', $alt_text);\r\n	$title    = str_replace(\'\"\', \'&quot;\', $title);\r\n	# We\'ve got to encode these to avoid conflicting with italics/bold.\r\n	$url = str_replace(array(\'*\', \'_\'),\r\n					   array($md_escape_table[\'*\'], $md_escape_table[\'_\']),\r\n					   $url);\r\n	$result = \"<img src=\\\"$url\\\" alt=\\\"$alt_text\\\"\";\r\n	if (isset($title)) {\r\n		$title = str_replace(array(\'*\', \'_\'),\r\n							 array($md_escape_table[\'*\'], $md_escape_table[\'_\']),\r\n							 $title);\r\n		$result .=  \" title=\\\"$title\\\"\"; # $title already quoted\r\n	}\r\n	$result .= $md_empty_element_suffix;\r\n\r\n	return $result;\r\n}\r\n\r\n\r\nfunction _DoHeaders($text) {\r\n	# Setext-style headers:\r\n	#	  Header 1\r\n	#	  ========\r\n	#\r\n	#	  Header 2\r\n	#	  --------\r\n	#\r\n	$text = preg_replace(\r\n		array(\'{ ^(.+)[ \\t]*\\n=+[ \\t]*\\n+ }emx\',\r\n			  \'{ ^(.+)[ \\t]*\\n-+[ \\t]*\\n+ }emx\'),\r\n		array(\"\'<h1>\'._RunSpanGamut(_UnslashQuotes(\'\\\\1\')).\'</h1>\\n\\n\'\",\r\n			  \"\'<h2>\'._RunSpanGamut(_UnslashQuotes(\'\\\\1\')).\'</h2>\\n\\n\'\"),\r\n		$text);\r\n\r\n	# atx-style headers:\r\n	#	# Header 1\r\n	#	## Header 2\r\n	#	## Header 2 with closing hashes ##\r\n	#	...\r\n	#	###### Header 6\r\n	#\r\n	$text = preg_replace(\"{\r\n			^(\\\\#{1,6})	# $1 = string of #\'s\r\n			[ \\\\t]*\r\n			(.+?)		# $2 = Header text\r\n			[ \\\\t]*\r\n			\\\\#*			# optional closing #\'s (not counted)\r\n			\\\\n+\r\n		}xme\",\r\n		\"\'<h\'.strlen(\'\\\\1\').\'>\'._RunSpanGamut(_UnslashQuotes(\'\\\\2\')).\'</h\'.strlen(\'\\\\1\').\'>\\n\\n\'\",\r\n		$text);\r\n\r\n	return $text;\r\n}\r\n\r\n\r\nfunction _DoLists($text) {\r\n#\r\n# Form HTML ordered (numbered) and unordered (bulleted) lists.\r\n#\r\n	global $md_tab_width, $md_list_level;\r\n	$less_than_tab = $md_tab_width - 1;\r\n\r\n	# Re-usable patterns to match list item bullets and number markers:\r\n	$marker_ul  = \'[*+-]\';\r\n	$marker_ol  = \'\\d+[.]\';\r\n	$marker_any = \"(?:$marker_ul|$marker_ol)\";\r\n\r\n	$markers = array($marker_ul, $marker_ol);\r\n\r\n	foreach ($markers as $marker) {\r\n		# Re-usable pattern to match any entirel ul or ol list:\r\n		$whole_list = \'\r\n			(								# $1 = whole list\r\n			  (								# $2\r\n				[ ]{0,\'.$less_than_tab.\'}\r\n				(\'.$marker.\')				# $3 = first list item marker\r\n				[ \\t]+\r\n			  )\r\n			  (?s:.+?)\r\n			  (								# $4\r\n				  \\z\r\n				|\r\n				  \\n{2,}\r\n				  (?=\\S)\r\n				  (?!						# Negative lookahead for another list item marker\r\n					[ \\t]*\r\n					\'.$marker.\'[ \\t]+\r\n				  )\r\n			  )\r\n			)\r\n		\'; // mx\r\n\r\n		# We use a different prefix before nested lists than top-level lists.\r\n		# See extended comment in _ProcessListItems().\r\n\r\n		if ($md_list_level) {\r\n			$text = preg_replace_callback(\'{\r\n					^\r\n					\'.$whole_list.\'\r\n				}mx\',\r\n				\'_DoLists_callback_top\', $text);\r\n		}\r\n		else {\r\n			$text = preg_replace_callback(\'{\r\n					(?:(?<=\\n\\n)|\\A\\n?)\r\n					\'.$whole_list.\'\r\n				}mx\',\r\n				\'_DoLists_callback_nested\', $text);\r\n		}\r\n	}\r\n\r\n	return $text;\r\n}\r\nfunction _DoLists_callback_top($matches) {\r\n	# Re-usable patterns to match list item bullets and number markers:\r\n	$marker_ul  = \'[*+-]\';\r\n	$marker_ol  = \'\\d+[.]\';\r\n	$marker_any = \"(?:$marker_ul|$marker_ol)\";\r\n\r\n	$list = $matches[1];\r\n	$list_type = preg_match(\"/$marker_ul/\", $matches[3]) ? \"ul\" : \"ol\";\r\n\r\n	$marker_any = ( $list_type == \"ul\" ? $marker_ul : $marker_ol );\r\n\r\n	# Turn double returns into triple returns, so that we can make a\r\n	# paragraph for the last item in a list, if necessary:\r\n	$list = preg_replace(\"/\\n{2,}/\", \"\\n\\n\\n\", $list);\r\n	$result = _ProcessListItems($list, $marker_any);\r\n\r\n	# Trim any trailing whitespace, to put the closing `</$list_type>`\r\n	# up on the preceding line, to get it past the current stupid\r\n	# HTML block parser. This is a hack to work around the terrible\r\n	# hack that is the HTML block parser.\r\n	$result = rtrim($result);\r\n	$result = \"<$list_type>\" . $result . \"</$list_type>\\n\";\r\n	return $result;\r\n}\r\nfunction _DoLists_callback_nested($matches) {\r\n	# Re-usable patterns to match list item bullets and number markers:\r\n	$marker_ul  = \'[*+-]\';\r\n	$marker_ol  = \'\\d+[.]\';\r\n	$marker_any = \"(?:$marker_ul|$marker_ol)\";\r\n\r\n	$list = $matches[1];\r\n	$list_type = preg_match(\"/$marker_ul/\", $matches[3]) ? \"ul\" : \"ol\";\r\n\r\n	$marker_any = ( $list_type == \"ul\" ? $marker_ul : $marker_ol );\r\n\r\n	# Turn double returns into triple returns, so that we can make a\r\n	# paragraph for the last item in a list, if necessary:\r\n	$list = preg_replace(\"/\\n{2,}/\", \"\\n\\n\\n\", $list);\r\n	$result = _ProcessListItems($list, $marker_any);\r\n	$result = \"<$list_type>\\n\" . $result . \"</$list_type>\\n\";\r\n	return $result;\r\n}\r\n\r\n\r\nfunction _ProcessListItems($list_str, $marker_any) {\r\n#\r\n#	Process the contents of a single ordered or unordered list, splitting it\r\n#	into individual list items.\r\n#\r\n	global $md_list_level;\r\n\r\n	# The $md_list_level global keeps track of when we\'re inside a list.\r\n	# Each time we enter a list, we increment it; when we leave a list,\r\n	# we decrement. If it\'s zero, we\'re not in a list anymore.\r\n	#\r\n	# We do this because when we\'re not inside a list, we want to treat\r\n	# something like this:\r\n	#\r\n	#		I recommend upgrading to version\r\n	#		8. Oops, now this line is treated\r\n	#		as a sub-list.\r\n	#\r\n	# As a single paragraph, despite the fact that the second line starts\r\n	# with a digit-period-space sequence.\r\n	#\r\n	# Whereas when we\'re inside a list (or sub-list), that line will be\r\n	# treated as the start of a sub-list. What a kludge, huh? This is\r\n	# an aspect of Markdown\'s syntax that\'s hard to parse perfectly\r\n	# without resorting to mind-reading. Perhaps the solution is to\r\n	# change the syntax rules such that sub-lists must start with a\r\n	# starting cardinal number; e.g. \"1.\" or \"a.\".\r\n\r\n	$md_list_level++;\r\n\r\n	# trim trailing blank lines:\r\n	$list_str = preg_replace(\"/\\n{2,}\\\\z/\", \"\\n\", $list_str);\r\n\r\n	$list_str = preg_replace_callback(\'{\r\n		(\\n)?							# leading line = $1\r\n		(^[ \\t]*)						# leading whitespace = $2\r\n		(\'.$marker_any.\') [ \\t]+		# list marker = $3\r\n		((?s:.+?)						# list item text   = $4\r\n		(\\n{1,2}))\r\n		(?= \\n* (\\z | \\2 (\'.$marker_any.\') [ \\t]+))\r\n		}xm\',\r\n		\'_ProcessListItems_callback\', $list_str);\r\n\r\n	$md_list_level--;\r\n	return $list_str;\r\n}\r\nfunction _ProcessListItems_callback($matches) {\r\n	$item = $matches[4];\r\n	$leading_line =& $matches[1];\r\n	$leading_space =& $matches[2];\r\n\r\n	if ($leading_line || preg_match(\'/\\n{2,}/\', $item)) {\r\n		$item = _RunBlockGamut(_Outdent($item));\r\n	}\r\n	else {\r\n		# Recursion for sub-lists:\r\n		$item = _DoLists(_Outdent($item));\r\n		$item = preg_replace(\'/\\n+$/\', \'\', $item);\r\n		$item = _RunSpanGamut($item);\r\n	}\r\n\r\n	return \"<li>\" . $item . \"</li>\\n\";\r\n}\r\n\r\n\r\nfunction _DoCodeBlocks($text) {\r\n#\r\n#	Process Markdown `<pre><code>` blocks.\r\n#\r\n	global $md_tab_width;\r\n	$text = preg_replace_callback(\"{\r\n			(?:\\\\n\\\\n|\\\\A)\r\n			(	            # $1 = the code block -- one or more lines, starting with a space/tab\r\n			  (?:\r\n				(?:[ ]\\{$md_tab_width} | \\\\t)  # Lines must start with a tab or a tab-width of spaces\r\n				.*\\\\n+\r\n			  )+\r\n			)\r\n			((?=^[ ]{0,$md_tab_width}\\\\S)|\\\\Z)	# Lookahead for non-space at line-start, or end of doc\r\n		}xm\",\r\n		\'_DoCodeBlocks_callback\', $text);\r\n\r\n	return $text;\r\n}\r\nfunction _DoCodeBlocks_callback($matches) {\r\n	$codeblock = $matches[1];\r\n\r\n	$codeblock = _EncodeCode(_Outdent($codeblock));\r\n//	$codeblock = _Detab($codeblock);\r\n	# trim leading newlines and trailing whitespace\r\n	$codeblock = preg_replace(array(\'/\\A\\n+/\', \'/\\s+\\z/\'), \'\', $codeblock);\r\n\r\n	$result = \"\\n\\n<pre><code>\" . $codeblock . \"\\n</code></pre>\\n\\n\";\r\n\r\n	return $result;\r\n}\r\n\r\n\r\nfunction _DoCodeSpans($text) {\r\n#\r\n# 	*	Backtick quotes are used for <code></code> spans.\r\n#\r\n# 	*	You can use multiple backticks as the delimiters if you want to\r\n# 		include literal backticks in the code span. So, this input:\r\n#\r\n#		  Just type ``foo `bar` baz`` at the prompt.\r\n#\r\n#	  	Will translate to:\r\n#\r\n#		  <p>Just type <code>foo `bar` baz</code> at the prompt.</p>\r\n#\r\n#		There\'s no arbitrary limit to the number of backticks you\r\n#		can use as delimters. If you need three consecutive backticks\r\n#		in your code, use four for delimiters, etc.\r\n#\r\n#	*	You can use spaces to get literal backticks at the edges:\r\n#\r\n#		  ... type `` `bar` `` ...\r\n#\r\n#	  	Turns to:\r\n#\r\n#		  ... type <code>`bar`</code> ...\r\n#\r\n	$text = preg_replace_callback(\'@\r\n			(?<!\\\\\\)	# Character before opening ` can\\\'t be a backslash\r\n			(`+)		# $1 = Opening run of `\r\n			(.+?)		# $2 = The code block\r\n			(?<!`)\r\n			\\1			# Matching closer\r\n			(?!`)\r\n		@xs\',\r\n		\'_DoCodeSpans_callback\', $text);\r\n\r\n	return $text;\r\n}\r\nfunction _DoCodeSpans_callback($matches) {\r\n	$c = $matches[2];\r\n	$c = preg_replace(\'/^[ \\t]*/\', \'\', $c); # leading whitespace\r\n	$c = preg_replace(\'/[ \\t]*$/\', \'\', $c); # trailing whitespace\r\n	$c = _EncodeCode($c);\r\n	return \"<code>$c</code>\";\r\n}\r\n\r\n\r\nfunction _EncodeCode($_) {\r\n#\r\n# Encode/escape certain characters inside Markdown code runs.\r\n# The point is that in code, these characters are literals,\r\n# and lose their special Markdown meanings.\r\n#\r\n	global $md_escape_table;\r\n\r\n	# Encode all ampersands; HTML entities are not\r\n	# entities within a Markdown code span.\r\n	$_ = str_replace(\'&\', \'&amp;\', $_);\r\n\r\n	# Do the angle bracket song and dance:\r\n	$_ = str_replace(array(\'<\',    \'>\'),\r\n					 array(\'&lt;\', \'&gt;\'), $_);\r\n\r\n	# Now, escape characters that are magic in Markdown:\r\n	$_ = str_replace(array_keys($md_escape_table),\r\n					 array_values($md_escape_table), $_);\r\n\r\n	return $_;\r\n}\r\n\r\n\r\nfunction _DoItalicsAndBold($text) {\r\n	# <strong> must go first:\r\n	$text = preg_replace(\'{\r\n			(						# $1: Marker\r\n				(?<!\\*\\*) \\*\\* |	#     (not preceded by two chars of\r\n				(?<!__)   __		#      the same marker)\r\n			)\r\n			(?=\\S) 					# Not followed by whitespace\r\n			(?!\\1)					#   or two others marker chars.\r\n			(						# $2: Content\r\n				(?:\r\n					[^*_]+?			# Anthing not em markers.\r\n				|\r\n									# Balence any regular emphasis inside.\r\n					([*_]) (?=\\S) .+? (?<=\\S) \\3	# $3: em char (* or _)\r\n				|\r\n					(?! \\1 ) .		# Allow unbalenced * and _.\r\n				)+?\r\n			)\r\n			(?<=\\S) \\1				# End mark not preceded by whitespace.\r\n		}sx\',\r\n		\'<strong>\\2</strong>\', $text);\r\n	# Then <em>:\r\n	$text = preg_replace(\r\n		\'{ ( (?<!\\*)\\* | (?<!_)_ ) (?=\\S) (?! \\1) (.+?) (?<=\\S) \\1 }sx\',\r\n		\'<em>\\2</em>\', $text);\r\n\r\n	return $text;\r\n}\r\n\r\n\r\nfunction _DoBlockQuotes($text) {\r\n	$text = preg_replace_callback(\'/\r\n		  (								# Wrap whole match in $1\r\n			(\r\n			  ^[ \\t]*>[ \\t]?			# \">\" at the start of a line\r\n				.+\\n					# rest of the first line\r\n			  (.+\\n)*					# subsequent consecutive lines\r\n			  \\n*						# blanks\r\n			)+\r\n		  )\r\n		/xm\',\r\n		\'_DoBlockQuotes_callback\', $text);\r\n\r\n	return $text;\r\n}\r\nfunction _DoBlockQuotes_callback($matches) {\r\n	$bq = $matches[1];\r\n	# trim one level of quoting - trim whitespace-only lines\r\n	$bq = preg_replace(array(\'/^[ \\t]*>[ \\t]?/m\', \'/^[ \\t]+$/m\'), \'\', $bq);\r\n	$bq = _RunBlockGamut($bq);		# recurse\r\n\r\n	$bq = preg_replace(\'/^/m\', \"  \", $bq);\r\n	# These leading spaces screw with <pre> content, so we need to fix that:\r\n	$bq = preg_replace_callback(\'{(\\s*<pre>.+?</pre>)}sx\',\r\n								\'_DoBlockQuotes_callback2\', $bq);\r\n\r\n	return \"<blockquote>\\n$bq\\n</blockquote>\\n\\n\";\r\n}\r\nfunction _DoBlockQuotes_callback2($matches) {\r\n	$pre = $matches[1];\r\n	$pre = preg_replace(\'/^  /m\', \'\', $pre);\r\n	return $pre;\r\n}\r\n\r\n\r\nfunction _FormParagraphs($text) {\r\n#\r\n#	Params:\r\n#		$text - string to process with html <p> tags\r\n#\r\n	global $md_html_blocks;\r\n\r\n	# Strip leading and trailing lines:\r\n	$text = preg_replace(array(\'/\\A\\n+/\', \'/\\n+\\z/\'), \'\', $text);\r\n\r\n	$grafs = preg_split(\'/\\n{2,}/\', $text, -1, PREG_SPLIT_NO_EMPTY);\r\n\r\n	#\r\n	# Wrap <p> tags.\r\n	#\r\n	foreach ($grafs as $key => $value) {\r\n		if (!isset( $md_html_blocks[$value] )) {\r\n			$value = _RunSpanGamut($value);\r\n			$value = preg_replace(\'/^([ \\t]*)/\', \'<p>\', $value);\r\n			$value .= \"</p>\";\r\n			$grafs[$key] = $value;\r\n		}\r\n	}\r\n\r\n	#\r\n	# Unhashify HTML blocks\r\n	#\r\n	foreach ($grafs as $key => $value) {\r\n		if (isset( $md_html_blocks[$value] )) {\r\n			$grafs[$key] = $md_html_blocks[$value];\r\n		}\r\n	}\r\n\r\n	return implode(\"\\n\\n\", $grafs);\r\n}\r\n\r\n\r\nfunction _EncodeAmpsAndAngles($text) {\r\n# Smart processing for ampersands and angle brackets that need to be encoded.\r\n\r\n	# Ampersand-encoding based entirely on Nat Irons\'s Amputator MT plugin:\r\n	#   http://bumppo.net/projects/amputator/\r\n	$text = preg_replace(\'/&(?!#?[xX]?(?:[0-9a-fA-F]+|\\w+);)/\',\r\n						 \'&amp;\', $text);;\r\n\r\n	# Encode naked <\'s\r\n	$text = preg_replace(\'{<(?![a-z/?\\$!])}i\', \'&lt;\', $text);\r\n\r\n	return $text;\r\n}\r\n\r\n\r\nfunction _EncodeBackslashEscapes($text) {\r\n#\r\n#	Parameter:  String.\r\n#	Returns:    The string, with after processing the following backslash\r\n#				escape sequences.\r\n#\r\n	global $md_escape_table, $md_backslash_escape_table;\r\n	# Must process escaped backslashes first.\r\n	return str_replace(array_keys($md_backslash_escape_table),\r\n					   array_values($md_backslash_escape_table), $text);\r\n}\r\n\r\n\r\nfunction _DoAutoLinks($text) {\r\n	$text = preg_replace(\"!<((https?|ftp):[^\'\\\">\\\\s]+)>!\",\r\n						 \'<a href=\"\\1\">\\1</a>\', $text);\r\n\r\n	# Email addresses: <address@domain.foo>\r\n	$text = preg_replace(\'{\r\n		<\r\n        (?:mailto:)?\r\n		(\r\n			[-.\\w]+\r\n			\\@\r\n			[-a-z0-9]+(\\.[-a-z0-9]+)*\\.[a-z]+\r\n		)\r\n		>\r\n		}exi\',\r\n		\"_EncodeEmailAddress(_UnescapeSpecialChars(_UnslashQuotes(\'\\\\1\')))\",\r\n		$text);\r\n\r\n	return $text;\r\n}\r\n\r\n\r\nfunction _EncodeEmailAddress($addr) {\r\n#\r\n#	Input: an email address, e.g. \"foo@example.com\"\r\n#\r\n#	Output: the email address as a mailto link, with each character\r\n#		of the address encoded as either a decimal or hex entity, in\r\n#		the hopes of foiling most address harvesting spam bots. E.g.:\r\n#\r\n#	  <a href=\"&#x6D;&#97;&#105;&#108;&#x74;&#111;:&#102;&#111;&#111;&#64;&#101;\r\n#		x&#x61;&#109;&#x70;&#108;&#x65;&#x2E;&#99;&#111;&#109;\">&#102;&#111;&#111;\r\n#		&#64;&#101;x&#x61;&#109;&#x70;&#108;&#x65;&#x2E;&#99;&#111;&#109;</a>\r\n#\r\n#	Based by a filter by Matthew Wickline, posted to the BBEdit-Talk\r\n#	mailing list: <http://tinyurl.com/yu7ue>\r\n#\r\n	$addr = \"mailto:\" . $addr;\r\n	$length = strlen($addr);\r\n\r\n	# leave \':\' alone (to spot mailto: later)\r\n	$addr = preg_replace_callback(\'/([^\\:])/\',\r\n								  \'_EncodeEmailAddress_callback\', $addr);\r\n\r\n	$addr = \"<a href=\\\"$addr\\\">$addr</a>\";\r\n	# strip the mailto: from the visible part\r\n	$addr = preg_replace(\'/\">.+?:/\', \'\">\', $addr);\r\n\r\n	return $addr;\r\n}\r\nfunction _EncodeEmailAddress_callback($matches) {\r\n	$char = $matches[1];\r\n	$r = rand(0, 100);\r\n	# roughly 10% raw, 45% hex, 45% dec\r\n	# \'@\' *must* be encoded. I insist.\r\n	if ($r > 90 && $char != \'@\') return $char;\r\n	if ($r < 45) return \'&#x\'.dechex(ord($char)).\';\';\r\n	return \'&#\'.ord($char).\';\';\r\n}\r\n\r\n\r\nfunction _UnescapeSpecialChars($text) {\r\n#\r\n# Swap back in all the special characters we\'ve hidden.\r\n#\r\n	global $md_escape_table;\r\n	return str_replace(array_values($md_escape_table),\r\n					   array_keys($md_escape_table), $text);\r\n}\r\n\r\n\r\n# _TokenizeHTML is shared between PHP Markdown and PHP SmartyPants.\r\n# We only define it if it is not already defined.\r\nif (!function_exists(\'_TokenizeHTML\')) :\r\nfunction _TokenizeHTML($str) {\r\n#\r\n#   Parameter:  String containing HTML markup.\r\n#   Returns:    An array of the tokens comprising the input\r\n#               string. Each token is either a tag (possibly with nested,\r\n#               tags contained therein, such as <a href=\"<MTFoo>\">, or a\r\n#               run of text between tags. Each element of the array is a\r\n#               two-element array; the first is either \'tag\' or \'text\';\r\n#               the second is the actual value.\r\n#\r\n#\r\n#   Regular expression derived from the _tokenize() subroutine in\r\n#   Brad Choate\'s MTRegex plugin.\r\n#   <http://www.bradchoate.com/past/mtregex.php>\r\n#\r\n	$index = 0;\r\n	$tokens = array();\r\n\r\n	$match = \'(?s:<!(?:--.*?--\\s*)+>)|\'.	# comment\r\n			 \'(?s:<\\?.*?\\?>)|\'.				# processing instruction\r\n			 								# regular tags\r\n			 \'(?:<[/!$]?[-a-zA-Z0-9:]+\\b(?>[^\"\\\'>]+|\"[^\"]*\"|\\\'[^\\\']*\\\')*>)\';\r\n\r\n	$parts = preg_split(\"{($match)}\", $str, -1, PREG_SPLIT_DELIM_CAPTURE);\r\n\r\n	foreach ($parts as $part) {\r\n		if (++$index % 2 && $part != \'\')\r\n			$tokens[] = array(\'text\', $part);\r\n		else\r\n			$tokens[] = array(\'tag\', $part);\r\n	}\r\n\r\n	return $tokens;\r\n}\r\nendif;\r\n\r\n\r\nfunction _Outdent($text) {\r\n#\r\n# Remove one level of line-leading tabs or spaces\r\n#\r\n	global $md_tab_width;\r\n	return preg_replace(\"/^(\\\\t|[ ]{1,$md_tab_width})/m\", \"\", $text);\r\n}\r\n\r\n\r\nfunction _Detab($text) {\r\n#\r\n# Replace tabs with the appropriate amount of space.\r\n#\r\n	global $md_tab_width;\r\n\r\n	# For each line we separate the line in blocks delemited by\r\n	# tab characters. Then we reconstruct every line by adding the\r\n	# appropriate number of space between each blocks.\r\n\r\n	$lines = explode(\"\\n\", $text);\r\n	$text = \"\";\r\n\r\n	foreach ($lines as $line) {\r\n		# Split in blocks.\r\n		$blocks = explode(\"\\t\", $line);\r\n		# Add each blocks to the line.\r\n		$line = $blocks[0];\r\n		unset($blocks[0]); # Do not add first block twice.\r\n		foreach ($blocks as $block) {\r\n			# Calculate amount of space, insert spaces, insert block.\r\n			$amount = $md_tab_width - strlen($line) % $md_tab_width;\r\n			$line .= str_repeat(\" \", $amount) . $block;\r\n		}\r\n		$text .= \"$line\\n\";\r\n	}\r\n	return $text;\r\n}\r\n\r\n\r\nfunction _UnslashQuotes($text) {\r\n#\r\n#	This function is useful to remove automaticaly slashed double quotes\r\n#	when using preg_replace and evaluating an expression.\r\n#	Parameter:  String.\r\n#	Returns:    The string with any slash-double-quote (\\\") sequence replaced\r\n#				by a single double quote.\r\n#\r\n	return str_replace(\'\\\"\', \'\"\', $text);\r\n}\r\n\r\n\r\n/*\r\n\r\nPHP Markdown\r\n============\r\n\r\nDescription\r\n-----------\r\n\r\nThis is a PHP translation of the original Markdown formatter written in\r\nPerl by John Gruber.\r\n\r\nMarkdown is a text-to-HTML filter; it translates an easy-to-read /\r\neasy-to-write structured text format into HTML. Markdown\'s text format\r\nis most similar to that of plain text email, and supports features such\r\nas headers, *emphasis*, code blocks, blockquotes, and links.\r\n\r\nMarkdown\'s syntax is designed not as a generic markup language, but\r\nspecifically to serve as a front-end to (X)HTML. You can use span-level\r\nHTML tags anywhere in a Markdown document, and you can use block level\r\nHTML tags (like <div> and <table> as well).\r\n\r\nFor more information about Markdown\'s syntax, see:\r\n\r\n<http://daringfireball.net/projects/markdown/>\r\n\r\n\r\nBugs\r\n----\r\n\r\nTo file bug reports please send email to:\r\n\r\n<michel.fortin@michelf.com>\r\n\r\nPlease include with your report: (1) the example input; (2) the output you\r\nexpected; (3) the output Markdown actually produced.\r\n\r\n\r\nVersion History\r\n---------------\r\n\r\nSee the readme file for detailed release notes for this version.\r\n\r\n1.0.1b - 6 Jun 2005\r\n\r\n1.0.1a - 15 Apr 2005\r\n\r\n1.0.1 - 16 Dec 2004\r\n\r\n1.0 - 21 Aug 2004\r\n\r\n\r\nAuthor & Contributors\r\n---------------------\r\n\r\nOriginal Perl version by John Gruber\r\n<http://daringfireball.net/>\r\n\r\nPHP port and other contributions by Michel Fortin\r\n<http://www.michelf.com/>\r\n\r\n\r\nCopyright and License\r\n---------------------\r\n\r\nCopyright (c) 2004-2005 Michel Fortin\r\n<http://www.michelf.com/>\r\nAll rights reserved.\r\n\r\nCopyright (c) 2003-2004 John Gruber\r\n<http://daringfireball.net/>\r\nAll rights reserved.\r\n\r\nRedistribution and use in source and binary forms, with or without\r\nmodification, are permitted provided that the following conditions are\r\nmet:\r\n\r\n*	Redistributions of source code must retain the above copyright notice,\r\n	this list of conditions and the following disclaimer.\r\n\r\n*	Redistributions in binary form must reproduce the above copyright\r\n	notice, this list of conditions and the following disclaimer in the\r\n	documentation and/or other materials provided with the distribution.\r\n\r\n*	Neither the name \"Markdown\" nor the names of its contributors may\r\n	be used to endorse or promote products derived from this software\r\n	without specific prior written permission.\r\n\r\nThis software is provided by the copyright holders and contributors \"as\r\nis\" and any express or implied warranties, including, but not limited\r\nto, the implied warranties of merchantability and fitness for a\r\nparticular purpose are disclaimed. In no event shall the copyright owner\r\nor contributors be liable for any direct, indirect, incidental, special,\r\nexemplary, or consequential damages (including, but not limited to,\r\nprocurement of substitute goods or services; loss of use, data, or\r\nprofits; or business interruption) however caused and on any theory of\r\nliability, whether in contract, strict liability, or tort (including\r\nnegligence or otherwise) arising in any way out of the use of this\r\nsoftware, even if advised of the possibility of such damage.\r\n\r\n*/');
/*!40000 ALTER TABLE `mmov_facileforms_pieces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mmov_facileforms_records`
--

DROP TABLE IF EXISTS `mmov_facileforms_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmov_facileforms_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `submitted` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `form` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `ip` varchar(30) NOT NULL DEFAULT '',
  `browser` varchar(255) NOT NULL DEFAULT '',
  `opsys` varchar(255) NOT NULL DEFAULT '',
  `provider` varchar(255) NOT NULL DEFAULT '',
  `viewed` tinyint(1) NOT NULL DEFAULT '0',
  `exported` tinyint(1) NOT NULL DEFAULT '0',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `username` varchar(255) NOT NULL DEFAULT '',
  `user_full_name` varchar(255) NOT NULL DEFAULT '',
  `paypal_tx_id` varchar(255) NOT NULL DEFAULT '',
  `paypal_payment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `paypal_testaccount` tinyint(1) NOT NULL DEFAULT '0',
  `paypal_download_tries` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mmov_facileforms_records`
--

LOCK TABLES `mmov_facileforms_records` WRITE;
/*!40000 ALTER TABLE `mmov_facileforms_records` DISABLE KEYS */;
INSERT INTO `mmov_facileforms_records` VALUES (1,'2015-01-27 19:23:09',1,'Cheques Devueltos','chequesDevueltos','::1','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.91 Safari/537.36','win','Desconocido',0,0,0,0,'-','-','','0000-00-00 00:00:00',0,0),(2,'2015-01-27 19:23:28',1,'Cheques Devueltos','chequesDevueltos','::1','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.91 Safari/537.36','win','Desconocido',1,0,0,0,'-','-','','0000-00-00 00:00:00',0,0);
/*!40000 ALTER TABLE `mmov_facileforms_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mmov_facileforms_scripts`
--

DROP TABLE IF EXISTS `mmov_facileforms_scripts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmov_facileforms_scripts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `package` varchar(30) NOT NULL DEFAULT '',
  `name` varchar(30) NOT NULL DEFAULT '',
  `title` varchar(50) NOT NULL DEFAULT '',
  `description` text,
  `type` varchar(30) NOT NULL DEFAULT '',
  `code` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mmov_facileforms_scripts`
--

LOCK TABLES `mmov_facileforms_scripts` WRITE;
/*!40000 ALTER TABLE `mmov_facileforms_scripts` DISABLE KEYS */;
INSERT INTO `mmov_facileforms_scripts` VALUES (1,1,'FF','ff_anychecked','Any Checked','Validate that any radio button or checkbox of a group is checked.','Element Validation','function ff_anychecked(element, message)\r\n{\r\n    // get plain name\r\n   // alert(document.ff_form52[\'ff_nm_bfQuickMode6303958[]\']);\r\n   // alert(document.getElementById(element.id).id);\r\n    var name = \'\';\r\n    if(!element.name){\r\n    	if(element.length && element.length != 0){\r\n           name = element[0].name;\r\n           var cnt = 0;\r\n           for (var i = 0; i < element.length; i++)\r\n             if (element[i].name==name) \r\n              if (element[i].checked) cnt++;                      \r\n           if (cnt==0) {\r\n            ff_validationFocus(element[0].name);\r\n            if (message==\'\') message = \"Please check or select \"+name+\".\\n\";\r\n            return message;\r\n           } // if \r\n\r\n        } else {\r\n           return \'\';\r\n        }\r\n    } else {\r\n      name = element.name;\r\n      if (name.substr(0,6) == \'ff_nm_\') name = name.substring(6,name.length-2);\r\n\r\n      // loop through elements and count selections\r\n      var cnt = 0;\r\n      for (var i = 0; i < ff_elements.length; i++)\r\n        if (ff_elements[i][2]==name) \r\n            if (ff_getElementByIndex(i).checked) cnt++;\r\n\r\n      // if none selected, emitt error\r\n      if (cnt==0) {\r\n        ff_validationFocus(element.name);\r\n        if (message==\'\') message = \"Please check or select \"+name+\".\\n\";\r\n        return message;\r\n      } // if\r\n    }\r\n    \r\n    return \'\';\r\n} // ff_anychecked'),(2,1,'FF','ff_checked','Checked','Validate that radio button or checkbox is checked.','Element Validation','function ff_checked(element, message)\r\n{\r\n    if (element.checked) \r\n        return \'\'; \r\n    else {\r\n        if (message==\'\') message = element.name+\" is not checked.\\n\";\r\n        ff_validationFocus(element.name);\r\n        return message;\r\n    } \r\n}'),(3,1,'FF','ff_checkedValue','Get checked value','Get value of the currently checked radiobutton.','Untyped','function ff_checkedValue(name)\r\n{\r\n    // loop through elements and find checked\r\n    for (i = 0; i < ff_elements.length; i++)\r\n        if (ff_elements[i][2]==name) {\r\n            e = ff_getElementByIndex(i);\r\n            if (e.checked) return e.value;\r\n        } // if \r\n    return \'\';\r\n} // ff_checkedValue'),(4,1,'FF','ff_countQuerySelections','Count Query Selections','Counts how many checkboxes/radiobuttons are checked/selected in a query list element','Untyped','function ff_countQuerySelections(name)\r\n{\r\n    var id = ff_getIdByName(name);\r\n    var cnt = ff_queryRows[id].length;\r\n    var pagesize = ff_queryPageSize[id];\r\n    if (pagesize>0) {\r\n        var currpage = ff_queryCurrPage[id];\r\n        var p;\r\n        for (p = 1; p < currpage; p++) cnt -= pagesize;\r\n        if (cnt > pagesize) cnt = pagesize;\r\n    } // if\r\n    var curr;\r\n    var sels = 0;\r\n    for (curr = 0; curr < cnt; curr++)\r\n        if (document.getElementById(\'ff_cb\'+id+\'_\'+curr).checked) sels++;\r\n    return sels;\r\n} // ff_countQuerySelections'),(5,1,'FF','ff_dollaramount2dp','Dollar Amount with 2 Decimal Places','Validate that a dollar amount with two decimal places is entered.','Element Validation','function ff_dollaramount2dp(element, message)\r\n{\r\n    var ex  = /^\\d+$|^\\d+\\.\\d{2}$/;\r\n    if (!ex.test(element.value)) {\r\n        if (message==\'\') message = element.name+\" must be a number with two decimal places.\\n\";\r\n        ff_validationFocus(element.name);\r\n        return message;\r\n    } // if\r\n    return \'\';\r\n} // ff_dollaramount2dp'),(6,1,'FF','ff_expString','String export','Export string function: escapes special characters of a string','Untyped','function ff_expString(text)\r\n{\r\n    text = trim(text);\r\n    var i;\r\n    var o = \'\';\r\n    for(i = 0; i < text.length; i++) {\r\n        c = text.charAt(i);\r\n        switch(c) {\r\n            case \';\' : o += \'\\\\x3B\'; break;\r\n            case \',\' : o += \'\\\\x2C\'; break;\r\n            case \'&\' : o += \'\\\\x26\'; break;\r\n            case \'<\' : o += \'\\\\x3C\'; break;\r\n            case \'>\' : o += \'\\\\x3E\'; break;\r\n            case \'\\\'\': o += \'\\\\x27\'; break;\r\n            case \'\\\\\': o += \'\\\\x5C\'; break;\r\n            case \'\"\' : o += \'\\\\x22\'; break;\r\n            case \'\\n\': o += \'\\\\n\'; break;\r\n            case \'\\r\': o += \'\\\\r\'; break;\r\n            default: o += c;\r\n        } // switch\r\n    } // for\r\n    return o;\r\n} // expString'),(7,1,'FF','ff_flashupload_not_empty','Flash Upload Not Empty (QuickMode only!)','Validates if a flash upload is empty or not.','Element Validation','function ff_flashupload_not_empty(element, message)\r\n{\r\n    if(typeof bfSummarizers == \"undefined\") { alert(\"Flash upload validation only available in QuickMode!\"); return \'\'}\r\n    if(JQuery(\'#bfFlashFileQueue\'+element.id.split(\'ff_elem\')[1]).html() != \'\') return \'\';\r\n    if (message==\'\') message = \"Please enter \"+element.name+\".\\n\";\r\n    ff_validationFocus(element.name);\r\n    return message;\r\n} // ff_valuenotempty'),(8,1,'FF','ff_getfocus','Get focus','Get the focus. Usually this is for the first element of the form/page.','Element Init','function ff_getfocus(element,condition)\r\n{\r\n    if(!element.name){\r\n    	if(element.length && element.length != 0){\r\n    		element[0].focus();\r\n    	}\r\n    }else{\r\n    	element.focus();\r\n    }\r\n}'),(9,1,'FF','ff_getQuerySelectedRows','Get Query Selected Rows','Returns the selected rows in a 2-dimensional array','Untyped','function ff_getQuerySelectedRows(name)\r\n{\r\n    var id = ff_getIdByName(name);\r\n    var rcnt = ff_queryRows[id].length;\r\n    var cnt = rcnt;\r\n    var pagesize = ff_queryPageSize[id];\r\n    if (pagesize>0) {\r\n        var currpage = ff_queryCurrPage[id];\r\n        var p;\r\n        for (p = 1; p < currpage; p++) cnt -= pagesize;\r\n        if (cnt > pagesize) cnt = pagesize;\r\n    } // if\r\n    var curr, r;\r\n    var selcnt = 0;\r\n    var sels = new Array;\r\n    for (curr = 0; curr < cnt; curr++) {\r\n        var elem = document.getElementById(\'ff_cb\'+id+\'_\'+curr);\r\n        if (elem.checked) {\r\n            var ident = elem.value;\r\n            for (r = 0; r < rcnt; r++)\r\n                if (ff_queryRows[id][r][0] == ident) {\r\n                    sels[selcnt++] = ff_queryRows[id][r];\r\n                    break;\r\n                } // if\r\n        } // if\r\n    } // for\r\n    return sels;\r\n} // ff_getQuerySelectedRows'),(10,1,'FF','ff_getQuerySelections','Get Query Selected ID\'s','Returns the column values of the checked/selected checkboxes/radiobuttons in an array','Untyped','function ff_getQuerySelections(name)\r\n{\r\n    var id = ff_getIdByName(name);\r\n    var cnt = ff_queryRows[id].length;\r\n    var pagesize = ff_queryPageSize[id];\r\n    if (pagesize>0) {\r\n        var currpage = ff_queryCurrPage[id];\r\n        var p;\r\n        for (p = 1; p < currpage; p++) cnt -= pagesize;\r\n        if (cnt > pagesize) cnt = pagesize;\r\n    } // if\r\n    var curr;\r\n    var selcnt = 0;\r\n    var sels = new Array;\r\n    for (curr = 0; curr < cnt; curr++) {\r\n        var elem = document.getElementById(\'ff_cb\'+id+\'_\'+curr);\r\n        if (elem.checked) \r\n            sels[selcnt++] = elem.value;\r\n    } // for\r\n    return sels;\r\n} // ff_getQuerySelections'),(11,1,'FF','ff_htmlvaluenotempty','HTML Texteditor Not Empty','Checks if an HTML editor element is empty or not','Element Validation','function ff_htmlvaluenotempty( element, message ){\r\n    \r\n    if( typeof bf_htmltextareanames == \"undefined\" ) return \'\';\r\n\r\n    var content = \"\";\r\n\r\n    for(var i = 0; i < bf_htmltextareanames.length; i++){\r\n      if( element.name == bf_htmltextareanames[i] ) {\r\n          eval(\"content = \" + bf_htmltextareas[i]);\r\n          break;\r\n      }\r\n    }\r\n    if (JQuery.trim(content) == \"\") {\r\n        if (message==\'\') message = element.name+\" must not be empty.\\n\";\r\n        return message;\r\n    } // if\r\n    return \'\';\r\n}'),(12,1,'FF','ff_impString','String import','Import string function: unescapes c-coded characters of a string','Untyped','function ff_impString(text)\r\n{\r\n    var str = \'\';\r\n    var ss = 0;\r\n    var s;\r\n    var tl = text.length;\r\n    var hexdigs = \"0123456789abcdefABCDEF\";\r\n    while (ss < tl) {\r\n        s = text.charAt(ss++);\r\n        if (s == \'\\\\\') {\r\n            if (ss < tl) s = text.charAt(ss++); else s = 0;\r\n            switch (s) {\r\n                case 0   : break;\r\n                case \'e\' : str += \'\\33\'; break;\r\n                case \'t\' : str += \'\\t\'; break;\r\n                case \'r\' : str += \'\\r\'; break;\r\n                case \'n\' : str += \'\\n\'; break;\r\n                case \'f\' : str += \'\\f\'; break;\r\n                case \'x\' : {\r\n                    if (ss < tl) s = text.charAt(ss++); else s = 0;\r\n                    var ch = \'\';\r\n                    while (hexdigs.indexOf(s)>=0 && ch.length < 2) {\r\n                        ch += s;\r\n                        if (ss < tl) s = text.charAt(ss++); else s = 0;\r\n                    } // while\r\n                    while (ch.length < 2) ch = \'0\'+ch;\r\n                    str += unescape(\'%\'+ch);\r\n                    if (s) ss--;\r\n                    break;\r\n                }\r\n                default:\r\n                    str += s;\r\n            } // switch\r\n        } else\r\n            str += s;\r\n    } // while\r\n    return str;\r\n} // impString'),(13,1,'FF','ff_integer','Integer Number','Validate that an integer value is entered.','Element Validation','function ff_integer(element, message)\r\n{\r\n    var ex  = /(^-?\\d\\d*$)/;\r\n    if (!ex.test(element.value)) {\r\n        if (message==\'\') message = element.name+\" must be integer.\\n\";\r\n        ff_validationFocus(element.name);\r\n        return message;\r\n    } // if\r\n    return \'\';\r\n} // ff_integer'),(14,1,'FF','ff_integeramount','Positive Integer','Validate that an positive integer value is entered.','Element Validation','function ff_integeramount(element, message)\r\n{\r\n    var ex  = /(^-?\\d\\d*$)/;\r\n    if (!ex.test(element.value)) {\r\n        if (message==\'\') message = element.name+\" must be integer.\\n\";\r\n        ff_validationFocus(element.name);\r\n        return message;\r\n    } // if\r\n    return \'\';\r\n} // ff_integeramount'),(15,1,'FF','ff_integer_or_empty','Integer or empty','Validate that either an integer value or nothing is entered.','Element Validation','function ff_integer_or_empty(element, message)\r\n{\r\n    if (element.value != \'\') {\r\n        var ex  = /(^-?\\d\\d*$)/;\r\n        if (!ex.test(element.value)) {\r\n            if (message==\'\') message = element.name+\" must be integer.\\n\";\r\n            ff_validationFocus(element.name);\r\n            return message;\r\n        } // if\r\n    } // if\r\n    return \'\';\r\n} // ff_integer_or_empty'),(16,1,'FF','ff_nextpage','Next page','Switchs to the next page.','Element Action','function ff_nextpage(element, action)\r\n{\r\n    if (ff_currentpage < ff_lastpage) {\r\n        ff_switchpage(ff_currentpage+1);\r\n        self.scrollTo(0,0);\r\n    }\r\n} // ff_nextpage'),(17,1,'FF','ff_page1','Page 1','Switches to the first page.','Element Action','function ff_page1(element, action)\r\n{\r\n    ff_switchpage(1);\r\n} // ff_page1'),(18,1,'FF','ff_page2','Page 2','Switches to the second page.','Element Action','function ff_page2(element, action)\r\n{\r\n    if (ff_lastpage >= 2) ff_switchpage(2);\r\n} // ff_page2'),(19,1,'FF','ff_page3','Page 3','Switches to the third page.','Element Action','function ff_page3(element, action)\r\n{\r\n    if (ff_lastpage >= 3) ff_switchpage(3);\r\n} // ff_page3'),(20,1,'FF','ff_previouspage','Previous page','Switches to the previous page.','Element Action','function ff_previouspage(element, action)\r\n{\r\n    if (ff_currentpage > 1){\r\n        ff_switchpage(ff_currentpage-1);\r\n        self.scrollTo(0,0);\r\n    }\r\n} // ff_previouspage'),(21,1,'FF','ff_real','Real Number','Validate that a real number is entered.','Element Validation','function ff_real(element, message)\r\n{\r\n    var ex  = /(^-?\\d\\d*\\.?\\d*$)/;\r\n    if (!ex.test(element.value)) {\r\n        if (message==\'\') message = element.name+\" must be a number.\\n\";\r\n        ff_validationFocus(element.name);\r\n        return message;\r\n    } // if\r\n    return \'\';\r\n} // ff_real'),(22,1,'FF','ff_realamount','Positive Real Number','Validate that a positive real number is entered.','Element Validation','function ff_realamount(element, message)\r\n{\r\n    var ex  = /(^\\d\\d*\\.?\\d*$)/;\r\n    if (!ex.test(element.value)) {\r\n        if (message==\'\') message = element.name+\" must be a number.\\n\";\r\n        ff_validationFocus(element.name);\r\n        return message;\r\n    } // if\r\n    return \'\';\r\n} // ff_realamount'),(23,1,'FF','ff_resetForm','Reset form','Reset all form inputs to the initial values.','Element Action','function ff_resetForm(element, action)\r\n{\r\n    eval(\'document.\'+ff_processor.form_id).reset();\r\n} // ff_resetForm'),(24,1,'FF','ff_securitycode_entered','Security code entered','Check that a security code was entered.','Element Validation','function ff_securitycode_entered(element, message)\r\n{\r\n    var ex  = /(^\\d{5}$)/;\r\n    if (!ex.test(element.value)) {\r\n        if (message==\'\') message = \"Security code must be entered as five digits.\\n\";\r\n        ff_validationFocus(element.name);\r\n        return message;\r\n    } // if\r\n    return \'\';\r\n} // ff_securitycode_entered'),(25,1,'FF','ff_securitycode_ok','Security code ok','Check that a valid security code was entered.','Element Validation','function ff_securitycode_ok(element, message)\r\n{\r\n<?php\r\n    global $ff_seccode;\r\n    if (!isset($ff_seccode)) { \r\n        mt_srand((double)microtime()*1000000);\r\n        $ff_seccode = mt_rand(10000, 99999);\r\n        JFactory::getSession()->set(\'ff_seccode\', $ff_seccode);\r\n    } // if\r\n    $enc = array();\r\n    mt_srand((double)microtime()*1000000);\r\n    for ($i = 0; $i < 256; $i++) $enc[] = mt_rand(0, 255);\r\n    $seccode = (string)$ff_seccode;\r\n    $hash = \'\';\r\n    $ini = $ff_seccode % 240;\r\n    for ($i = 0; $i < 5; $i++) {\r\n        $d = $ini+intval($seccode{$i});\r\n        for ($j = 0; $j < 7; $j++) $d = $enc[$d];\r\n        $hash .= $d;\r\n        $ini = ($ini+$d) % 240;\r\n    } // for\r\n    return\r\n        \"var enc = \".$this->expJsValue($enc).\";\\n\".\r\n        \"var seccode = new String(element.value);\\n\".\r\n        \"if (seccode.length==5) {\\n\".\r\n        \"    var hash = \'\';\\n\".\r\n        \"    var ini = parseInt(element.value) % 240;\\n\".\r\n        \"    var i, j;\\n\".\r\n        \"    for (i = 0; i < 5; i++) {\\n\".\r\n        \"        var d = ini+parseInt(seccode.charAt(i));\\n\".\r\n        \"        for (j = 0; j < 7; j++) d = enc[d];\\n\".\r\n        \"        hash += d;\\n\".\r\n        \"        ini = (ini+d) % 240;\\n\".\r\n        \"    } // for\\n\".\r\n        \"    if (hash == \'$hash\') return \'\';\\n\". \r\n        \"} // if\\n\".\r\n        \"if (message==\'\') message = \\\"Security code is missing or wrong.\\\\n\\\";\\n\".\r\n        \"ff_validationFocus(element.name);\\n\".\r\n        \"return message;\\n\";\r\n?>\r\n} // ff_securitycode_ok'),(26,1,'FF','ff_selectedValues','Get selected values as list','Get values of selected options of a select list as list:\r\n\r\nx = ff_selectedValues(\'myselectlist\');\r\n// x = green,red','Untyped','function ff_selectedValues(name)\r\n{\r\n    vals = \'\';\r\n    opts = ff_getElementByName(name).options;\r\n    for (o = 0; o < opts.length; o++)\r\n        if (opts[o].selected) {\r\n            if (vals != \'\') vals += \',\';\r\n            vals += opts[o].value;\r\n        } // if\r\n    return vals;\r\n} // ff_selectedValues'),(27,1,'FF','ff_setChecked','Set radiobutton checked','Set a radiobutton checked/unchecked','Untyped','function ff_setChecked(name, value, checked)\r\n{\r\n    if (arguments.length<3) checked = true;\r\n    for (var i = 0; i < ff_elements.length; i++)\r\n        if (ff_elements[i][2]==name) {\r\n            var e = ff_getElementByIndex(i);\r\n            if (e.value == value) {\r\n                e.checked = checked;\r\n                break;\r\n            } // if\r\n        } // if\r\n} // ff_setChecked'),(28,1,'FF','ff_setSelected','Select options of  select list','Select options in a Select List element.\r\n\r\nff_setSelected(\'mylist\', \'green\'); // select green in single or multi mode, unselect all other options\r\nff_setSelected(\'mylist\', \'red,green\'); // select red and green in multi mode, unselect all other options','Untyped','function ff_setSelected(name, list)\r\n{\r\n    ids = list.split(\',\')\r\n    opts = ff_getElementByName(name).options;\r\n    for (o = 0; o < opts.length; o++) {\r\n        state = false;\r\n        for (i = 0; i < ids.length; i++) \r\n            if (ids[i]==opts[o].value) {\r\n                state = true;\r\n                break;\r\n            } // if\r\n        opts[o].selected = state;\r\n    } // for\r\n} // ff_setSelected'),(29,1,'FF','ff_showaction','Show action','Displays the element action.','Element Action','function ff_showaction(element, action)\r\n{\r\n   alert(\'Action \'+action+\' performed by element \'+element.id);\r\n}'),(30,1,'FF','ff_showelementinit','Show element initialization','Display the element initialization (mainly for debugging)','Element Init','function ff_showelementinit(element,condition)\r\n{\r\n    if(!element.name)\r\n    	if(element.length && element.length != 0)\r\n    		alert(\'Initialization of \'+element[0].name+\' at \'+condition);\r\n    else\r\n    	alert(\'Initialization of \'+element.name+\' at \'+condition);\r\n}'),(31,1,'FF','ff_showforminit','Show form initialization','Show when form initialization is run (for debugging)','Form Init','function ff_showforminit()\r\n{\r\n    alert(\'Form initialization\');\r\n}'),(32,1,'FF','ff_showsubmitted','Show submitted status','Display submit status as user feedback.','Form Submitted','function ff_showsubmitted(status, message)\r\n{\r\n    alert(message);\r\n} // ff_showsubmitted'),(33,1,'FF','ff_showvalidation','Show element validation','Display element validation (for debugging)','Element Validation','function ff_showvalidation(element, message)\r\n{\r\n    alert(\'Validation of \'+element.name+\" with message: \\n\"+message);\r\n    return \'\';\r\n}'),(34,1,'FF','ff_submittedhome','Return to homepage','Display submit status and then return to the home page of the site.','Form Submitted','function ff_submittedhome(status, message)\r\n{\r\n    alert(message+\"\\nYou will be redirected to the home page now.\");\r\n    ff_returnHome();\r\n} // ff_submittedhome'),(35,1,'FF','ff_unchecked','Unchecked','Validate that radio button or checkbox is unchecked.','Element Validation','function ff_unchecked(element, message)\r\n{\r\n    if (!element.checked) \r\n        return \'\'; \r\n    else {\r\n        if (message==\'\') message = element.name+\" is checked.\\n\";\r\n        ff_validationFocus(element.name);\r\n        return message;\r\n    } // if\r\n} // ff_unchecked'),(36,1,'FF','ff_validate_date_DDMMYYYY','Validate Date DD/MM/YYYY format','Validates that the date in a textfield is correctly formatted in DD/MM/YYYY format.\r\nCan be used with a textfield element and/or the Calendar element.','Element Validation','function ff_validate_date_DDMMYYYY(element, message)\r\n{\r\n   // Regular expression used to check if date is in correct format\r\n   var pattern = /[0-3][0-9]\\/(0|1)[0-9]\\/(19|20)[0-9]{2}/;\r\n   if(pattern.test(element.value))\r\n   {\r\n      var date_array = element.value.split(\'/\');\r\n      var day = date_array[0];\r\n\r\n      // Attention! Javascript consider months in the range 0 - 11\r\n      var month = date_array[1] - 1;\r\n      var year = date_array[2];\r\n\r\n      // This instruction will create a date object\r\n      source_date = new Date(year,month,day);\r\n\r\n      if(year != source_date.getFullYear())\r\n      {\r\n         return message == \'\' ? \'Element \' + element.name + \' failed my test\' : message;\r\n      }\r\n\r\n      if(month != source_date.getMonth())\r\n      {\r\n         return message == \'\' ? \'Element \' + element.name + \' failed my test\' : message;\r\n      }\r\n\r\n      if(day != source_date.getDate())\r\n      {\r\n         return message == \'\' ? \'Element \' + element.name + \' failed my test\' : message;\r\n      }\r\n   }\r\n   else\r\n   {\r\n      return message == \'\' ? \'Element \' + element.name + \' failed my test\' : message;\r\n   }\r\n\r\n   return \'\';\r\n}'),(37,1,'FF','ff_validate_form','Validate form','Validates the form and displays the result.','Element Action','function ff_validate_form(element, action)\r\n{\r\n    if(typeof bfUseErrorAlerts != \'undefined\'){\r\n     JQuery(\".bfErrorMessage\").html(\'\');\r\n     JQuery(\".bfErrorMessage\").css(\"display\",\"none\");\r\n    }\r\n    error = ff_validation(0);\r\n    if (error != \'\') {\r\n        if(typeof bfUseErrorAlerts == \'undefined\'){\r\n           alert(error);\r\n        } else {\r\n           bfShowErrors(error);\r\n        }\r\n        ff_validationFocus(\'\');\r\n    } else\r\n        alert(\'All inputs are valid.\');\r\n} // ff_validate_form'),(38,1,'FF','ff_validate_nextpage','Validate and next page','Validates the current page, and if everything is ok is switches to the next page.','Element Action','function ff_validate_nextpage(element, action)\r\n{\r\n    if(typeof bfUseErrorAlerts != \'undefined\'){\r\n     JQuery(\".bfErrorMessage\").html(\'\');\r\n     JQuery(\".bfErrorMessage\").css(\"display\",\"none\");\r\n    }\r\n\r\n    error = ff_validation(ff_currentpage);\r\n    if (error != \'\') {\r\n       if(typeof bfUseErrorAlerts == \'undefined\'){\r\n           alert(error);\r\n        } else {\r\n           bfShowErrors(error);\r\n        }\r\n        ff_validationFocus(\'\');\r\n    } else {\r\n        ff_switchpage(ff_currentpage+1);\r\n        self.scrollTo(0,0);   \r\n    }\r\n} // ff_validate_nextpage'),(39,1,'FF','ff_validate_page','Validate page','Validates the current page and displays the result.','Element Action','function ff_validate_page(element, action)\r\n{\r\n    if(typeof bfUseErrorAlerts != \'undefined\'){\r\n     JQuery(\".bfErrorMessage\").html(\'\');\r\n     JQuery(\".bfErrorMessage\").css(\"display\",\"none\");\r\n    }\r\n    error = ff_validation(ff_currentpage);\r\n    if (error != \'\') {\r\n        if(typeof bfUseErrorAlerts == \'undefined\'){\r\n           alert(error);\r\n        } else {\r\n           bfShowErrors(error);\r\n        }\r\n        ff_validationFocus(\'\');\r\n    } else\r\n        alert(\'All inputs are valid.\');\r\n} // ff_validate_page'),(40,1,'FF','ff_validate_prevpage','Validate previous page','Validates the current page and switches to the previous page if all is ok','Element Action','function ff_validate_prevpage(element, action)\r\n{\r\n    if(typeof bfUseErrorAlerts != \'undefined\'){\r\n     JQuery(\".bfErrorMessage\").html(\'\');\r\n     JQuery(\".bfErrorMessage\").css(\"display\",\"none\");\r\n    }\r\n\r\n    error = ff_validation(ff_currentpage);\r\n    if (error != \'\') {\r\n       if(typeof bfUseErrorAlerts == \'undefined\'){\r\n           alert(error);\r\n        } else {\r\n           bfShowErrors(error);\r\n        }\r\n        ff_validationFocus(\'\');\r\n    } else{\r\n    	if(ff_currentpage > 1){\r\n	 ff_switchpage(ff_currentpage-1);\r\n	 self.scrollTo(0,0);\r\n        }\r\n    }\r\n} // ff_validate_prevpage'),(41,1,'FF','ff_validate_submit','Validate and submit form','Validates the whole form, and if everything is ok it submits the form.','Element Action','function ff_validate_submit(element, action)\r\n{\r\n    if(typeof bfUseErrorAlerts != \'undefined\'){\r\n     JQuery(\".bfErrorMessage\").html(\'\');\r\n     JQuery(\".bfErrorMessage\").css(\"display\",\"none\");\r\n    }\r\n    error = ff_validation(0);\r\n    if (error != \'\') {\r\n\r\n        if(typeof bfUseErrorAlerts == \'undefined\'){\r\n           alert(error);\r\n        } else {\r\n           bfShowErrors(error);\r\n        }\r\n        ff_validationFocus();\r\n    } else\r\n        ff_submitForm();\r\n} // ff_validate_submit'),(42,1,'FF','ff_validemail','Valid email','Validate entry of a valid email (syntax check only)','Element Validation','function ff_validemail(element, message)\r\n{\r\n    var check =\r\n    /^([a-zA-Z0-9_\\.\\-])+\\@(([a-zA-Z0-9\\-])+\\.)+([a-zA-Z0-9]{2,4})+$/;\r\n    if (!check.test(element.value)){\r\n        if (message==\'\') message = element.name+\" is no valid email address.\\n\";\r\n        ff_validationFocus(element.name);\r\n        return message;\r\n    } // if\r\n    return \'\';\r\n} // ff_validemail'),(43,1,'FF','ff_validemail_repeat','Validate Email repeat','Checks if the field value is a valid email address and has a second counterpart that has an equal value.\r\nThe 2nd email field must be named \"FIELDNAME_repeat\"!','Element Validation','function ff_validemail_repeat(element, message)\r\n{\r\n    var check =\r\n    /^([a-zA-Z0-9_\\.\\-])+\\@(([a-zA-Z0-9\\-])+\\.)+([a-zA-Z0-9]{2,4})+$/;\r\n    if (!check.test(element.value)){\r\n        if (message==\'\') message = element.name+\" is no valid email address.\\n\";\r\n        ff_validationFocus(element.name);\r\n        return message;\r\n    } // if\r\n	\r\n    try{\r\n	    var repeat = element.name.split(\"ff_nm_\")[1].split(\"[]\")[0];\r\n	\r\n	    if(!ff_getElementByName(repeat + \'_repeat\')){\r\n	     	if (message==\'\') message = repeat+\" has no repeat email field.\\n\";\r\n	        ff_validationFocus(element.name);\r\n	        return message;\r\n	    } else {\r\n	        if(ff_getElementByName(repeat + \'_repeat\').value != element.value){\r\n	           if (message==\'\') message = element.name+\" and \" + repeat + \"_repeat do not match.\\n\";\r\n	           ff_validationFocus(repeat + \'_repeat\');\r\n	           return message;\r\n	        }\r\n	    }\r\n    }catch(e){\r\n        return e.description;\r\n    }\r\n\r\n    return \'\';\r\n} // ff_validemail'),(44,1,'FF','ff_valuenotempty','Value not empty','Validate that value is not empty.','Element Validation','function ff_valuenotempty(element, message)\r\n{\r\n    if (element.value!=\'\') return \'\'; \r\n    if (message==\'\') message = \"Please enter \"+element.name+\".\\n\";\r\n    ff_validationFocus(element.name);\r\n    return message;\r\n} // ff_valuenotempty');
/*!40000 ALTER TABLE `mmov_facileforms_scripts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mmov_facileforms_subrecords`
--

DROP TABLE IF EXISTS `mmov_facileforms_subrecords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmov_facileforms_subrecords` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `record` int(11) NOT NULL DEFAULT '0',
  `element` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(255) NOT NULL DEFAULT '',
  `value` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mmov_facileforms_subrecords`
--

LOCK TABLES `mmov_facileforms_subrecords` WRITE;
/*!40000 ALTER TABLE `mmov_facileforms_subrecords` DISABLE KEYS */;
INSERT INTO `mmov_facileforms_subrecords` VALUES (1,2,1,'Fecha Devolución','f_devolucion','Calendar','27/01/2015');
/*!40000 ALTER TABLE `mmov_facileforms_subrecords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mmov_finder_filters`
--

DROP TABLE IF EXISTS `mmov_finder_filters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmov_finder_filters` (
  `filter_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL,
  `created_by_alias` varchar(255) NOT NULL,
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `map_count` int(10) unsigned NOT NULL DEFAULT '0',
  `data` text NOT NULL,
  `params` mediumtext,
  PRIMARY KEY (`filter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mmov_finder_filters`
--

LOCK TABLES `mmov_finder_filters` WRITE;
/*!40000 ALTER TABLE `mmov_finder_filters` DISABLE KEYS */;
/*!40000 ALTER TABLE `mmov_finder_filters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mmov_finder_links`
--

DROP TABLE IF EXISTS `mmov_finder_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmov_finder_links` (
  `link_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL,
  `route` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `indexdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `md5sum` varchar(32) DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `state` int(5) DEFAULT '1',
  `access` int(5) DEFAULT '0',
  `language` varchar(8) NOT NULL,
  `publish_start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `list_price` double unsigned NOT NULL DEFAULT '0',
  `sale_price` double unsigned NOT NULL DEFAULT '0',
  `type_id` int(11) NOT NULL,
  `object` mediumblob NOT NULL,
  PRIMARY KEY (`link_id`),
  KEY `idx_type` (`type_id`),
  KEY `idx_title` (`title`),
  KEY `idx_md5` (`md5sum`),
  KEY `idx_url` (`url`(75)),
  KEY `idx_published_list` (`published`,`state`,`access`,`publish_start_date`,`publish_end_date`,`list_price`),
  KEY `idx_published_sale` (`published`,`state`,`access`,`publish_start_date`,`publish_end_date`,`sale_price`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mmov_finder_links`
--

LOCK TABLES `mmov_finder_links` WRITE;
/*!40000 ALTER TABLE `mmov_finder_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `mmov_finder_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mmov_finder_links_terms0`
--

DROP TABLE IF EXISTS `mmov_finder_links_terms0`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmov_finder_links_terms0` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mmov_finder_links_terms0`
--

LOCK TABLES `mmov_finder_links_terms0` WRITE;
/*!40000 ALTER TABLE `mmov_finder_links_terms0` DISABLE KEYS */;
/*!40000 ALTER TABLE `mmov_finder_links_terms0` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mmov_finder_links_terms1`
--

DROP TABLE IF EXISTS `mmov_finder_links_terms1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmov_finder_links_terms1` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mmov_finder_links_terms1`
--

LOCK TABLES `mmov_finder_links_terms1` WRITE;
/*!40000 ALTER TABLE `mmov_finder_links_terms1` DISABLE KEYS */;
/*!40000 ALTER TABLE `mmov_finder_links_terms1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mmov_finder_links_terms2`
--

DROP TABLE IF EXISTS `mmov_finder_links_terms2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmov_finder_links_terms2` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mmov_finder_links_terms2`
--

LOCK TABLES `mmov_finder_links_terms2` WRITE;
/*!40000 ALTER TABLE `mmov_finder_links_terms2` DISABLE KEYS */;
/*!40000 ALTER TABLE `mmov_finder_links_terms2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mmov_finder_links_terms3`
--

DROP TABLE IF EXISTS `mmov_finder_links_terms3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmov_finder_links_terms3` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mmov_finder_links_terms3`
--

LOCK TABLES `mmov_finder_links_terms3` WRITE;
/*!40000 ALTER TABLE `mmov_finder_links_terms3` DISABLE KEYS */;
/*!40000 ALTER TABLE `mmov_finder_links_terms3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mmov_finder_links_terms4`
--

DROP TABLE IF EXISTS `mmov_finder_links_terms4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmov_finder_links_terms4` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mmov_finder_links_terms4`
--

LOCK TABLES `mmov_finder_links_terms4` WRITE;
/*!40000 ALTER TABLE `mmov_finder_links_terms4` DISABLE KEYS */;
/*!40000 ALTER TABLE `mmov_finder_links_terms4` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mmov_finder_links_terms5`
--

DROP TABLE IF EXISTS `mmov_finder_links_terms5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmov_finder_links_terms5` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mmov_finder_links_terms5`
--

LOCK TABLES `mmov_finder_links_terms5` WRITE;
/*!40000 ALTER TABLE `mmov_finder_links_terms5` DISABLE KEYS */;
/*!40000 ALTER TABLE `mmov_finder_links_terms5` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mmov_finder_links_terms6`
--

DROP TABLE IF EXISTS `mmov_finder_links_terms6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmov_finder_links_terms6` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mmov_finder_links_terms6`
--

LOCK TABLES `mmov_finder_links_terms6` WRITE;
/*!40000 ALTER TABLE `mmov_finder_links_terms6` DISABLE KEYS */;
/*!40000 ALTER TABLE `mmov_finder_links_terms6` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mmov_finder_links_terms7`
--

DROP TABLE IF EXISTS `mmov_finder_links_terms7`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmov_finder_links_terms7` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mmov_finder_links_terms7`
--

LOCK TABLES `mmov_finder_links_terms7` WRITE;
/*!40000 ALTER TABLE `mmov_finder_links_terms7` DISABLE KEYS */;
/*!40000 ALTER TABLE `mmov_finder_links_terms7` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mmov_finder_links_terms8`
--

DROP TABLE IF EXISTS `mmov_finder_links_terms8`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmov_finder_links_terms8` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mmov_finder_links_terms8`
--

LOCK TABLES `mmov_finder_links_terms8` WRITE;
/*!40000 ALTER TABLE `mmov_finder_links_terms8` DISABLE KEYS */;
/*!40000 ALTER TABLE `mmov_finder_links_terms8` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mmov_finder_links_terms9`
--

DROP TABLE IF EXISTS `mmov_finder_links_terms9`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmov_finder_links_terms9` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mmov_finder_links_terms9`
--

LOCK TABLES `mmov_finder_links_terms9` WRITE;
/*!40000 ALTER TABLE `mmov_finder_links_terms9` DISABLE KEYS */;
/*!40000 ALTER TABLE `mmov_finder_links_terms9` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mmov_finder_links_termsa`
--

DROP TABLE IF EXISTS `mmov_finder_links_termsa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmov_finder_links_termsa` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mmov_finder_links_termsa`
--

LOCK TABLES `mmov_finder_links_termsa` WRITE;
/*!40000 ALTER TABLE `mmov_finder_links_termsa` DISABLE KEYS */;
/*!40000 ALTER TABLE `mmov_finder_links_termsa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mmov_finder_links_termsb`
--

DROP TABLE IF EXISTS `mmov_finder_links_termsb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmov_finder_links_termsb` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mmov_finder_links_termsb`
--

LOCK TABLES `mmov_finder_links_termsb` WRITE;
/*!40000 ALTER TABLE `mmov_finder_links_termsb` DISABLE KEYS */;
/*!40000 ALTER TABLE `mmov_finder_links_termsb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mmov_finder_links_termsc`
--

DROP TABLE IF EXISTS `mmov_finder_links_termsc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmov_finder_links_termsc` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mmov_finder_links_termsc`
--

LOCK TABLES `mmov_finder_links_termsc` WRITE;
/*!40000 ALTER TABLE `mmov_finder_links_termsc` DISABLE KEYS */;
/*!40000 ALTER TABLE `mmov_finder_links_termsc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mmov_finder_links_termsd`
--

DROP TABLE IF EXISTS `mmov_finder_links_termsd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmov_finder_links_termsd` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mmov_finder_links_termsd`
--

LOCK TABLES `mmov_finder_links_termsd` WRITE;
/*!40000 ALTER TABLE `mmov_finder_links_termsd` DISABLE KEYS */;
/*!40000 ALTER TABLE `mmov_finder_links_termsd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mmov_finder_links_termse`
--

DROP TABLE IF EXISTS `mmov_finder_links_termse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmov_finder_links_termse` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mmov_finder_links_termse`
--

LOCK TABLES `mmov_finder_links_termse` WRITE;
/*!40000 ALTER TABLE `mmov_finder_links_termse` DISABLE KEYS */;
/*!40000 ALTER TABLE `mmov_finder_links_termse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mmov_finder_links_termsf`
--

DROP TABLE IF EXISTS `mmov_finder_links_termsf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmov_finder_links_termsf` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mmov_finder_links_termsf`
--

LOCK TABLES `mmov_finder_links_termsf` WRITE;
/*!40000 ALTER TABLE `mmov_finder_links_termsf` DISABLE KEYS */;
/*!40000 ALTER TABLE `mmov_finder_links_termsf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mmov_finder_taxonomy`
--

DROP TABLE IF EXISTS `mmov_finder_taxonomy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmov_finder_taxonomy` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `state` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `access` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ordering` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `state` (`state`),
  KEY `ordering` (`ordering`),
  KEY `access` (`access`),
  KEY `idx_parent_published` (`parent_id`,`state`,`access`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mmov_finder_taxonomy`
--

LOCK TABLES `mmov_finder_taxonomy` WRITE;
/*!40000 ALTER TABLE `mmov_finder_taxonomy` DISABLE KEYS */;
INSERT INTO `mmov_finder_taxonomy` VALUES (1,0,'ROOT',0,0,0);
/*!40000 ALTER TABLE `mmov_finder_taxonomy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mmov_finder_taxonomy_map`
--

DROP TABLE IF EXISTS `mmov_finder_taxonomy_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmov_finder_taxonomy_map` (
  `link_id` int(10) unsigned NOT NULL,
  `node_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`node_id`),
  KEY `link_id` (`link_id`),
  KEY `node_id` (`node_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mmov_finder_taxonomy_map`
--

LOCK TABLES `mmov_finder_taxonomy_map` WRITE;
/*!40000 ALTER TABLE `mmov_finder_taxonomy_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `mmov_finder_taxonomy_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mmov_finder_terms`
--

DROP TABLE IF EXISTS `mmov_finder_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmov_finder_terms` (
  `term_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `weight` float unsigned NOT NULL DEFAULT '0',
  `soundex` varchar(75) NOT NULL,
  `links` int(10) NOT NULL DEFAULT '0',
  `language` char(3) NOT NULL DEFAULT '',
  PRIMARY KEY (`term_id`),
  UNIQUE KEY `idx_term` (`term`),
  KEY `idx_term_phrase` (`term`,`phrase`),
  KEY `idx_stem_phrase` (`stem`,`phrase`),
  KEY `idx_soundex_phrase` (`soundex`,`phrase`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mmov_finder_terms`
--

LOCK TABLES `mmov_finder_terms` WRITE;
/*!40000 ALTER TABLE `mmov_finder_terms` DISABLE KEYS */;
/*!40000 ALTER TABLE `mmov_finder_terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mmov_finder_terms_common`
--

DROP TABLE IF EXISTS `mmov_finder_terms_common`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmov_finder_terms_common` (
  `term` varchar(75) NOT NULL,
  `language` varchar(3) NOT NULL,
  KEY `idx_word_lang` (`term`,`language`),
  KEY `idx_lang` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mmov_finder_terms_common`
--

LOCK TABLES `mmov_finder_terms_common` WRITE;
/*!40000 ALTER TABLE `mmov_finder_terms_common` DISABLE KEYS */;
INSERT INTO `mmov_finder_terms_common` VALUES ('a','en'),('about','en'),('after','en'),('ago','en'),('all','en'),('am','en'),('an','en'),('and','en'),('ani','en'),('any','en'),('are','en'),('aren\'t','en'),('as','en'),('at','en'),('be','en'),('but','en'),('by','en'),('for','en'),('from','en'),('get','en'),('go','en'),('how','en'),('if','en'),('in','en'),('into','en'),('is','en'),('isn\'t','en'),('it','en'),('its','en'),('me','en'),('more','en'),('most','en'),('must','en'),('my','en'),('new','en'),('no','en'),('none','en'),('not','en'),('noth','en'),('nothing','en'),('of','en'),('off','en'),('often','en'),('old','en'),('on','en'),('onc','en'),('once','en'),('onli','en'),('only','en'),('or','en'),('other','en'),('our','en'),('ours','en'),('out','en'),('over','en'),('page','en'),('she','en'),('should','en'),('small','en'),('so','en'),('some','en'),('than','en'),('thank','en'),('that','en'),('the','en'),('their','en'),('theirs','en'),('them','en'),('then','en'),('there','en'),('these','en'),('they','en'),('this','en'),('those','en'),('thus','en'),('time','en'),('times','en'),('to','en'),('too','en'),('true','en'),('under','en'),('until','en'),('up','en'),('upon','en'),('use','en'),('user','en'),('users','en'),('veri','en'),('version','en'),('very','en'),('via','en'),('want','en'),('was','en'),('way','en'),('were','en'),('what','en'),('when','en'),('where','en'),('whi','en'),('which','en'),('who','en'),('whom','en'),('whose','en'),('why','en'),('wide','en'),('will','en'),('with','en'),('within','en'),('without','en'),('would','en'),('yes','en'),('yet','en'),('you','en'),('your','en'),('yours','en');
/*!40000 ALTER TABLE `mmov_finder_terms_common` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mmov_finder_tokens`
--

DROP TABLE IF EXISTS `mmov_finder_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmov_finder_tokens` (
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `weight` float unsigned NOT NULL DEFAULT '1',
  `context` tinyint(1) unsigned NOT NULL DEFAULT '2',
  `language` char(3) NOT NULL DEFAULT '',
  KEY `idx_word` (`term`),
  KEY `idx_context` (`context`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mmov_finder_tokens`
--

LOCK TABLES `mmov_finder_tokens` WRITE;
/*!40000 ALTER TABLE `mmov_finder_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `mmov_finder_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mmov_finder_tokens_aggregate`
--

DROP TABLE IF EXISTS `mmov_finder_tokens_aggregate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmov_finder_tokens_aggregate` (
  `term_id` int(10) unsigned NOT NULL,
  `map_suffix` char(1) NOT NULL,
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `term_weight` float unsigned NOT NULL,
  `context` tinyint(1) unsigned NOT NULL DEFAULT '2',
  `context_weight` float unsigned NOT NULL,
  `total_weight` float unsigned NOT NULL,
  `language` char(3) NOT NULL DEFAULT '',
  KEY `token` (`term`),
  KEY `keyword_id` (`term_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mmov_finder_tokens_aggregate`
--

LOCK TABLES `mmov_finder_tokens_aggregate` WRITE;
/*!40000 ALTER TABLE `mmov_finder_tokens_aggregate` DISABLE KEYS */;
/*!40000 ALTER TABLE `mmov_finder_tokens_aggregate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mmov_finder_types`
--

DROP TABLE IF EXISTS `mmov_finder_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmov_finder_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `mime` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mmov_finder_types`
--

LOCK TABLES `mmov_finder_types` WRITE;
/*!40000 ALTER TABLE `mmov_finder_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `mmov_finder_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mmov_formmaker`
--

DROP TABLE IF EXISTS `mmov_formmaker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmov_formmaker` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(127) NOT NULL,
  `mail` varchar(128) NOT NULL,
  `form_front` longtext NOT NULL,
  `theme` int(11) NOT NULL,
  `javascript` text NOT NULL,
  `submit_text` longtext NOT NULL,
  `url` varchar(200) NOT NULL,
  `submit_text_type` tinyint(4) NOT NULL DEFAULT '1',
  `script_mail` text NOT NULL,
  `script_mail_user` text NOT NULL,
  `counter` int(11) NOT NULL,
  `published` int(11) NOT NULL DEFAULT '1',
  `label_order` text NOT NULL,
  `label_order_current` text NOT NULL,
  `article_id` int(11) NOT NULL,
  `pagination` varchar(128) NOT NULL,
  `show_title` varchar(128) NOT NULL,
  `show_numbers` varchar(128) NOT NULL,
  `public_key` varchar(50) NOT NULL,
  `private_key` varchar(50) NOT NULL,
  `recaptcha_theme` varchar(20) NOT NULL,
  `paypal_mode` int(2) NOT NULL,
  `checkout_mode` varchar(20) NOT NULL,
  `paypal_email` varchar(50) NOT NULL,
  `payment_currency` varchar(20) NOT NULL,
  `tax` float NOT NULL,
  `form_fields` text NOT NULL,
  `savedb` tinyint(4) NOT NULL DEFAULT '1',
  `sendemail` tinyint(4) NOT NULL DEFAULT '1',
  `requiredmark` varchar(20) NOT NULL DEFAULT '*',
  `mail_from` varchar(128) NOT NULL,
  `mail_from_name` varchar(128) NOT NULL,
  `reply_to` varchar(128) NOT NULL,
  `send_to` varchar(128) NOT NULL,
  `autogen_layout` tinyint(4) NOT NULL DEFAULT '1',
  `custom_front` longtext NOT NULL,
  `mail_from_user` varchar(128) NOT NULL,
  `mail_from_name_user` varchar(128) NOT NULL,
  `reply_to_user` varchar(128) NOT NULL,
  `condition` text NOT NULL,
  `mail_cc` varchar(128) NOT NULL,
  `mail_cc_user` varchar(128) NOT NULL,
  `mail_bcc` varchar(128) NOT NULL,
  `mail_bcc_user` varchar(128) NOT NULL,
  `mail_subject` varchar(128) NOT NULL,
  `mail_subject_user` varchar(128) NOT NULL,
  `mail_mode` tinyint(4) NOT NULL DEFAULT '1',
  `mail_mode_user` tinyint(4) NOT NULL DEFAULT '1',
  `mail_attachment` tinyint(4) NOT NULL DEFAULT '1',
  `mail_attachment_user` tinyint(4) NOT NULL DEFAULT '1',
  `user_id` varchar(220) NOT NULL,
  `sortable` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mmov_formmaker`
--

LOCK TABLES `mmov_formmaker` WRITE;
/*!40000 ALTER TABLE `mmov_formmaker` DISABLE KEYS */;
INSERT INTO `mmov_formmaker` VALUES (1,'Contact','','<div class=\"wdform-page-and-images\" style=\"display:table; border-top:0px solid black;\"><div id=\"form_id_tempform_view1\" class=\"wdform_page\" page_title=\"Untitled page\" next_title=\"Next\" next_type=\"text\" next_class=\"wdform-page-button\" next_checkable=\"false\" previous_title=\"Previous\" previous_type=\"text\" previous_class=\"wdform-page-button\" previous_checkable=\"false\"><div class=\"wdform_section\"><div class=\"wdform_column\"><div wdid=\"1\" class=\"wdform_row\">%1 - Name:%</div><div wdid=\"2\" class=\"wdform_row\">%2 - E-mail:%</div><div wdid=\"3\" class=\"wdform_row\">%3 - Subject:%</div><div wdid=\"4\" class=\"wdform_row\">%4 - Message:%</div><div wdid=\"5\" class=\"wdform_row\">%5 - type_submit_reset_5%</div></div></div><div valign=\"top\" class=\"wdform_footer\" style=\"width: 100%;\"><div style=\"width: 100%;\"><div style=\"width: 100%; display: table;\"><div style=\"display: table-row-group;\"><div id=\"form_id_temppage_nav1\" style=\"display: table-row;\"></div></div></div></div></div></div></div>',1,'// Occurs before the form is loaded\r\nfunction before_load()\r\n{\r\n\r\n}\r\n\r\n// Occurs just before submitting  the form\r\nfunction before_submit()\r\n{\r\n\r\n}\r\n\r\n// Occurs just before resetting the form\r\nfunction before_reset()\r\n{\r\n\r\n}','','',0,'%all%','%all%',6,1,'1#**id**#Name:#**label**#type_name#****#2#**id**#E-mail:#**label**#type_submitter_mail#****#3#**id**#Subject:#**label**#type_text#****#4#**id**#Message:#**label**#type_textarea#****#5#**id**#type_submit_reset_5#**label**#type_submit_reset#****#','1#**id**#Name:#**label**#type_name#****#2#**id**#E-mail:#**label**#type_submitter_mail#****#3#**id**#Subject:#**label**#type_text#****#4#**id**#Message:#**label**#type_textarea#****#5#**id**#type_submit_reset_5#**label**#type_submit_reset#****#',0,'none','false','true','','','',0,'','','USD',0,'1*:*id*:*type_name*:*type*:*Name:*:*w_field_label*:*60*:*w_field_label_size*:*left*:*w_field_label_pos*:*****:*w_first_val*:*****:*w_title*:*Title***First***Last***Middle*:*w_mini_labels*:*100*:*w_size*:*normal*:*w_name_format*:*yes*:*w_required*:*no*:*w_unique*:**:*w_class*:**:*new_field*:*2*:*id*:*type_submitter_mail*:*type*:*E-mail:*:*w_field_label*:*60*:*w_field_label_size*:*left*:*w_field_label_pos*:*200*:*w_size*:**:*w_first_val*:**:*w_title*:*no*:*w_required*:**:*w_unique*:**:*w_class*:**:*new_field*:*3*:*id*:*type_text*:*type*:*Subject:*:*w_field_label*:*60*:*w_field_label_size*:*left*:*w_field_label_pos*:*200*:*w_size*:**:*w_first_val*:**:*w_title*:*no*:*w_required*:*no*:*w_unique*:**:*new_field*:*4*:*id*:*type_textarea*:*type*:*Message:*:*w_field_label*:*60*:*w_field_label_size*:*left*:*w_field_label_pos*:*200*:*w_size_w*:*100*:*w_size_h*:**:*w_first_val*:**:*w_title*:*no*:*w_required*:*no*:*w_unique*:**:*w_class*:**:*new_field*:*5*:*id*:*type_submit_reset*:*type*:*type_submit_reset_5*:*w_field_label*:*Submit*:*w_submit_title*:*Reset*:*w_reset_title*:**:*w_class*:*true*:*w_act*:**:*new_field*:*',1,1,'*','','','','',1,'','','','','','','','','','','',1,1,1,1,'1,2,3,4,5,6,7,8,9,',1,0),(2,'Fill Form To Get Admission','','<div class=\"wdform-page-and-images\" style=\"display:table; border-top:0px solid black;\"><div id=\"form_id_tempform_view1\" class=\"wdform_page\" page_title=\"Untitled page\" next_title=\"Next\" next_type=\"text\" next_class=\"wdform-page-button\" next_checkable=\"false\" previous_title=\"Previous\" previous_type=\"text\" previous_class=\"wdform-page-button\" previous_checkable=\"false\"><div class=\"wdform_section\"><div class=\"wdform_column\"><div wdid=\"1\" class=\"wdform_row\">%1 - Name:%</div><div wdid=\"2\" class=\"wdform_row\">%2 - E-mail:%</div><div wdid=\"4\" class=\"wdform_row\">%4 - Phone Number:%</div><div wdid=\"5\" class=\"wdform_row\">%5 - SELECT COLLEGE%</div><div wdid=\"6\" class=\"wdform_row\">%6 - OTHER SPECIFY HERE%</div><div wdid=\"7\" class=\"wdform_row\">%7 - Word Verification:%</div><div wdid=\"8\" class=\"wdform_row\">%8 - type_submit_reset_8%</div></div></div><div valign=\"top\" class=\"wdform_footer\" style=\"width: 100%;\"><div style=\"width: 100%;\"><div style=\"width: 100%; display: table;\"><div style=\"display: table-row-group;\"><div id=\"form_id_temppage_nav1\" style=\"display: table-row;\"></div></div></div></div></div></div></div>',8,'// Occurs before the form is loaded\r\nfunction before_load()\r\n{\r\n\r\n}\r\n\r\n// Occurs just before submitting  the form\r\nfunction before_submit()\r\n{\r\n\r\n}\r\n\r\n// Occurs just before resetting the form\r\nfunction before_reset()\r\n{\r\n\r\n}','','',0,'%all%','%all%',9,1,'1#**id**#Name:#**label**#type_name#****#2#**id**#E-mail:#**label**#type_submitter_mail#****#4#**id**#Phone Number:#**label**#type_number#****#5#**id**#SELECT COLLEGE#**label**#type_own_select#****#6#**id**#OTHER SPECIFY HERE#**label**#type_text#****#7#**id**#Word Verification:#**label**#type_captcha#****#8#**id**#type_submit_reset_8#**label**#type_submit_reset#****#','1#**id**#Name:#**label**#type_name#****#2#**id**#E-mail:#**label**#type_submitter_mail#****#4#**id**#Phone Number:#**label**#type_number#****#5#**id**#SELECT COLLEGE#**label**#type_own_select#****#6#**id**#OTHER SPECIFY HERE#**label**#type_text#****#7#**id**#Word Verification:#**label**#type_captcha#****#8#**id**#type_submit_reset_8#**label**#type_submit_reset#****#',0,'none','false','true','','','',0,'','','USD',0,'1*:*id*:*type_name*:*type*:*Name:*:*w_field_label*:*160*:*w_field_label_size*:*left*:*w_field_label_pos*:***********:*w_first_val*:***********:*w_title*:*Title***First***Last***Middle*:*w_mini_labels*:*100*:*w_size*:*extended*:*w_name_format*:*no*:*w_required*:*no*:*w_unique*:**:*w_class*:**:*new_field*:*2*:*id*:*type_submitter_mail*:*type*:*E-mail:*:*w_field_label*:*160*:*w_field_label_size*:*left*:*w_field_label_pos*:*200*:*w_size*:**:*w_first_val*:**:*w_title*:*yes*:*w_required*:**:*w_unique*:**:*w_class*:**:*new_field*:*4*:*id*:*type_number*:*type*:*Phone Number:*:*w_field_label*:*160*:*w_field_label_size*:*left*:*w_field_label_pos*:*200*:*w_size*:**:*w_first_val*:**:*w_title*:*no*:*w_required*:*no*:*w_unique*:**:*w_class*:**:*new_field*:*5*:*id*:*type_own_select*:*type*:*SELECT COLLEGE*:*w_field_label*:*160*:*w_field_label_size*:*left*:*w_field_label_pos*:*200*:*w_size*:**** GGSCMT,KHARAR*** DOABA KHARAR *** CAMBRIDGE COLLEGE FATEHGARH *** INDOGLOBAL *** QUEST COLLEGE *** UNIVERSAL ,LALRU *** OTHER PLEASE SPECIFY BELOW *:*w_choices*:*true***false***false***false***false***false***false***false*:*w_choices_checked*:*true***false***false***false***false***false***false***false*:*w_choices_disabled*:*yes*:*w_required*:*wdform_select*:*w_class*:**:*new_field*:*6*:*id*:*type_text*:*type*:*OTHER SPECIFY HERE*:*w_field_label*:*160*:*w_field_label_size*:*left*:*w_field_label_pos*:*200*:*w_size*:**:*w_first_val*:**:*w_title*:*no*:*w_required*:*no*:*w_unique*:**:*new_field*:*7*:*id*:*type_captcha*:*type*:*Word Verification:*:*w_field_label*:*160*:*w_field_label_size*:*left*:*w_field_label_pos*:*6*:*w_digit*:**:*w_class*:**:*new_field*:*8*:*id*:*type_submit_reset*:*type*:*type_submit_reset_8*:*w_field_label*:*Submit*:*w_submit_title*:*Reset*:*w_reset_title*:**:*w_class*:*true*:*w_act*:**:*new_field*:*',1,1,'*','','','','',1,'','','','','','','','','','','',1,1,1,1,'1,2,3,4,5,6,7,8,9,',1,0),(3,'Camp Registration Form','','<div class=\"wdform-page-and-images\" style=\"display:table; border-top:0px solid black;\"><div id=\"form_id_tempform_view1\" class=\"wdform_page\" page_title=\"Untitled page\" next_title=\"Next\" next_type=\"text\" next_class=\"wdform-page-button\" next_checkable=\"false\" previous_title=\"Previous\" previous_type=\"text\" previous_class=\"wdform-page-button\" previous_checkable=\"false\"><div class=\"wdform_section\"><div class=\"wdform_column\"><div wdid=\"1\" class=\"wdform_row\">%1 - Camper Name:%</div><div wdid=\"2\" class=\"wdform_row\">%2 - Camper Age Group:%</div><div wdid=\"3\" class=\"wdform_row\">%3 - Desire Cabin:%</div><div wdid=\"4\" class=\"wdform_row\">%4 - Does any one have allergies?%</div><div wdid=\"5\" class=\"wdform_row\">%5 - Has the camper been camping before?%</div><div wdid=\"6\" class=\"wdform_row\">%6 - Any questions or concern:%</div><div wdid=\"7\" class=\"wdform_row\">%7 - type_submit_reset_7%</div></div></div><div valign=\"top\" class=\"wdform_footer\" style=\"width: 100%;\"><div style=\"width: 100%;\"><div style=\"width: 100%; display: table;\"><div style=\"display: table-row-group;\"><div id=\"form_id_temppage_nav1\" style=\"display: table-row;\"></div></div></div></div></div></div></div>',15,'// Occurs before the form is loaded\r\nfunction before_load()\r\n{\r\n\r\n}\r\n\r\n// Occurs just before submitting  the form\r\nfunction before_submit()\r\n{\r\n\r\n}\r\n\r\n// Occurs just before resetting the form\r\nfunction before_reset()\r\n{\r\n\r\n}','','',0,'%all%','%all%',8,1,'1#**id**#Camper Name:#**label**#type_name#****#2#**id**#Camper Age Group:#**label**#type_own_select#****#3#**id**#Desire Cabin:#**label**#type_radio#****#4#**id**#Does any one have allergies?#**label**#type_radio#****#5#**id**#Has the camper been camping before?#**label**#type_radio#****#6#**id**#Any questions or concern:#**label**#type_textarea#****#7#**id**#type_submit_reset_7#**label**#type_submit_reset#****#','1#**id**#Camper Name:#**label**#type_name#****#2#**id**#Camper Age Group:#**label**#type_own_select#****#3#**id**#Desire Cabin:#**label**#type_radio#****#4#**id**#Does any one have allergies?#**label**#type_radio#****#5#**id**#Has the camper been camping before?#**label**#type_radio#****#6#**id**#Any questions or concern:#**label**#type_textarea#****#7#**id**#type_submit_reset_7#**label**#type_submit_reset#****#',0,'none','false','true','','','',0,'','','USD',0,'1*:*id*:*type_name*:*type*:*Camper Name:*:*w_field_label*:*250*:*w_field_label_size*:*left*:*w_field_label_pos*:*****:*w_first_val*:*****:*w_title*:*Title***First***Last***Middle*:*w_mini_labels*:*100*:*w_size*:*normal*:*w_name_format*:*no*:*w_required*:*no*:*w_unique*:**:*w_class*:**:*new_field*:*2*:*id*:*type_own_select*:*type*:*Camper Age Group:*:*w_field_label*:*250*:*w_field_label_size*:*left*:*w_field_label_pos*:*200*:*w_size*:****6-8***8-12***12-15*:*w_choices*:*true***false***false***false*:*w_choices_checked*:*true***false***false***false*:*w_choices_disabled*:*no*:*w_required*:*wdform_select*:*w_class*:**:*new_field*:*3*:*id*:*type_radio*:*type*:*Desire Cabin:*:*w_field_label*:*250*:*w_field_label_size*:*left*:*w_field_label_pos*:*ver*:*w_flow*:*Cabin 1***Cabin 2***Cabin 3***Cabin 4***Cabin 5***Cabin 6***Cabin 7*:*w_choices*:*false***false***false***false***false***false***false*:*w_choices_checked*:*1*:*w_rowcol*:*no*:*w_required*:*no*:*w_randomize*:*no*:*w_allow_other*:*0*:*w_allow_other_num*:**:*w_class*:**:*new_field*:*4*:*id*:*type_radio*:*type*:*Does any one have allergies?*:*w_field_label*:*250*:*w_field_label_size*:*left*:*w_field_label_pos*:*ver*:*w_flow*:*Yes***No*:*w_choices*:*false***false*:*w_choices_checked*:*1*:*w_rowcol*:*no*:*w_required*:*no*:*w_randomize*:*no*:*w_allow_other*:*0*:*w_allow_other_num*:**:*w_class*:**:*new_field*:*5*:*id*:*type_radio*:*type*:*Has the camper been camping before?*:*w_field_label*:*250*:*w_field_label_size*:*left*:*w_field_label_pos*:*ver*:*w_flow*:*Yes***No*:*w_choices*:*false***false*:*w_choices_checked*:*1*:*w_rowcol*:*no*:*w_required*:*no*:*w_randomize*:*no*:*w_allow_other*:*0*:*w_allow_other_num*:**:*w_class*:**:*new_field*:*6*:*id*:*type_textarea*:*type*:*Any questions or concern:*:*w_field_label*:*250*:*w_field_label_size*:*left*:*w_field_label_pos*:*200*:*w_size_w*:*100*:*w_size_h*:**:*w_first_val*:**:*w_title*:*no*:*w_required*:*no*:*w_unique*:**:*w_class*:**:*new_field*:*7*:*id*:*type_submit_reset*:*type*:*type_submit_reset_7*:*w_field_label*:*Submit*:*w_submit_title*:*Reset*:*w_reset_title*:**:*w_class*:*false*:*w_act*:**:*new_field*:*',1,1,'*','','','','',1,'','','','','','','','','','','',1,1,1,1,'1,2,3,4,5,6,7,8,9,',1,0),(4,'Business Demographic Survey','','<div class=\"wdform-page-and-images\" style=\"display:table; border-top:0px solid black;\"><div id=\"form_id_tempform_view1\" class=\"wdform_page\" page_title=\"Untitled page\" next_title=\"Next\" next_type=\"text\" next_class=\"wdform-page-button\" next_checkable=\"false\" previous_title=\"Previous\" previous_type=\"text\" previous_class=\"wdform-page-button\" previous_checkable=\"false\"><div class=\"wdform_section\"><div class=\"wdform_column\"></div></div><div wdid=\"1\" type=\"type_section_break\" class=\"wdform_tr_section_break\">%1 - custom_1%</div><div class=\"wdform_section\"><div class=\"wdform_column\"><div wdid=\"2\" class=\"wdform_row\">%2 - <b>What is your employment status?</b>%</div><div wdid=\"3\" class=\"wdform_row\">%3 - <b>What is your level of education?</b>%</div><div wdid=\"4\" class=\"wdform_row\">%4 - <b>In which industry do you work?</b>%</div><div wdid=\"5\" class=\"wdform_row\">%5 - <b>What is the annual revenue of your company?</b>%</div><div wdid=\"6\" class=\"wdform_row\">%6 - Word Verification:%</div><div wdid=\"7\" class=\"wdform_row\">%7 - type_submit_reset_7%</div></div></div><div valign=\"top\" class=\"wdform_footer\" style=\"width: 100%;\"><div style=\"width: 100%;\"><div style=\"width: 100%; display: table;\"><div style=\"display: table-row-group;\"><div id=\"form_id_temppage_nav1\" style=\"display: table-row;\"></div></div></div></div></div></div></div>',10,'// Occurs before the form is loaded\r\nfunction before_load()\r\n{\r\n\r\n}\r\n\r\n// Occurs just before submitting  the form\r\nfunction before_submit()\r\n{\r\n\r\n}\r\n\r\n// Occurs just before resetting the form\r\nfunction before_reset()\r\n{\r\n\r\n}','','',1,'<p>%all%</p>','<p>%all%</p>',8,1,'2#**id**#What is your employment status?#**label**#type_radio#****#3#**id**#What is your level of education?#**label**#type_radio#****#4#**id**#In which industry do you work?#**label**#type_own_select#****#5#**id**#What is the annual revenue of your company?#**label**#type_radio#****#6#**id**#Word Verification:#**label**#type_captcha#****#7#**id**#type_submit_reset_7#**label**#type_submit_reset#****#','2#**id**#What is your employment status?#**label**#type_radio#****#3#**id**#What is your level of education?#**label**#type_radio#****#4#**id**#In which industry do you work?#**label**#type_own_select#****#5#**id**#What is the annual revenue of your company?#**label**#type_radio#****#6#**id**#Word Verification:#**label**#type_captcha#****#7#**id**#type_submit_reset_7#**label**#type_submit_reset#****#',0,'none','false','true','','','',0,'','','USD',0,'1*:*id*:*type_section_break*:*type*:*custom_1*:*w_field_label*:*<h2 id=\"header_1\" style=\"font-size: 1.285714286rem; font-family: \'Open Sans\', Helvetica, Arial, sans-serif; color: rgb(68, 68, 68); clear: both; line-height: 1.6; margin: 1.714285714rem 0px;\">Business Demographic Survey</h2><p style=\"line-height: 1.714285714; margin: 0px 0px 1.714285714rem; color: rgb(68, 68, 68); font-family: \'Open Sans\', Helvetica, Arial, sans-serif; font-size: 14px;\"></p><div id=\"subHeader_1\" style=\"color: rgb(68, 68, 68); font-family: \'Open Sans\', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 14px;\">Thank you for joining our business demographic survey. Please give us your feedback by filling in the information bellow.</div><p><br></p>*:*w_editor*:**:*new_field*:*2*:*id*:*type_radio*:*type*:*<b>What is your employment status?</b>*:*w_field_label*:*600*:*w_field_label_size*:*top*:*w_field_label_pos*:*ver*:*w_flow*:*Employed full time***Trade or Vocational degree***Not employed, but looking for work***Not employed and not looking for work***Retired***Student***Homemaker***Prefer not to answer*:*w_choices*:*false***false***false***false***false***false***false***false*:*w_choices_checked*:*1*:*w_rowcol*:*no*:*w_required*:*no*:*w_randomize*:*no*:*w_allow_other*:*0*:*w_allow_other_num*:**:*w_class*:**:*new_field*:*3*:*id*:*type_radio*:*type*:*<b>What is your level of education?</b>*:*w_field_label*:*600*:*w_field_label_size*:*top*:*w_field_label_pos*:*ver*:*w_flow*:*Some high school***High school graduate or equivalent***Trade or Vocational Degree***Some college***Associate degree***Bachelor\'s degree***Graduate or Professional degree***Prefer not to answer*:*w_choices*:*false***false***false***false***false***false***false***false*:*w_choices_checked*:*1*:*w_rowcol*:*no*:*w_required*:*no*:*w_randomize*:*no*:*w_allow_other*:*0*:*w_allow_other_num*:**:*w_class*:**:*new_field*:*4*:*id*:*type_own_select*:*type*:*<b>In which industry do you work?</b>*:*w_field_label*:*500*:*w_field_label_size*:*top*:*w_field_label_pos*:*200*:*w_size*:****option 1***option 2***option 3*:*w_choices*:*true***false***false***false*:*w_choices_checked*:*true***false***false***false*:*w_choices_disabled*:*no*:*w_required*:*wdform_select*:*w_class*:**:*new_field*:*5*:*id*:*type_radio*:*type*:*<b>What is the annual revenue of your company?</b>*:*w_field_label*:*600*:*w_field_label_size*:*top*:*w_field_label_pos*:*ver*:*w_flow*:*Under $10,000***$10,001 to $50,000***$50,001 to $100,000***$100,001 to $500,000***$500,001 to $1 Million***$1 Million to $10 Million***$10 Million to $50 Million***$50 Million to $100 Million***Over $100 Million*:*w_choices*:*false***false***false***false***false***false***false***false***false*:*w_choices_checked*:*1*:*w_rowcol*:*no*:*w_required*:*no*:*w_randomize*:*no*:*w_allow_other*:*0*:*w_allow_other_num*:**:*w_class*:**:*new_field*:*6*:*id*:*type_captcha*:*type*:*Word Verification:*:*w_field_label*:*500*:*w_field_label_size*:*top*:*w_field_label_pos*:*6*:*w_digit*:**:*w_class*:**:*new_field*:*7*:*id*:*type_submit_reset*:*type*:*type_submit_reset_7*:*w_field_label*:*Submit*:*w_submit_title*:*Reset*:*w_reset_title*:**:*w_class*:*false*:*w_act*:**:*new_field*:*',1,1,'*','','','','',1,'','','','','','','','','','','',1,1,1,1,'1,2,3,4,5,6,7,8,9,',1,0),(5,'Register Your Business','','<div class=\"wdform-page-and-images\" style=\"display:table; border-top:0px solid black;\"><div id=\"form_id_tempform_view1\" class=\"wdform_page\" page_title=\"Untitled page\" next_title=\"Next\" next_type=\"text\" next_class=\"wdform-page-button\" next_checkable=\"false\" previous_title=\"Previous\" previous_type=\"text\" previous_class=\"wdform-page-button\" previous_checkable=\"false\"><div class=\"wdform_section\"><div class=\"wdform_column\"><div wdid=\"1\" class=\"wdform_row\">%1 - Business Owner %</div><div wdid=\"2\" class=\"wdform_row\">%2 - Business Name%</div><div wdid=\"3\" class=\"wdform_row\">%3 - E-mail%</div><div wdid=\"4\" class=\"wdform_row\">%4 - Address:%</div><div wdid=\"10\" class=\"wdform_row\">%10 - Type of Business%</div><div wdid=\"11\" class=\"wdform_row\">%11 - Message%</div><div wdid=\"12\" class=\"wdform_row\">%12 - type_submit_reset_12%</div></div></div><div valign=\"top\" class=\"wdform_footer\" style=\"width: 100%;\"><div style=\"width: 100%;\"><div style=\"width: 100%; display: table;\"><div style=\"display: table-row-group;\"><div id=\"form_id_temppage_nav1\" style=\"display: table-row;\"></div></div></div></div></div></div></div>',26,'// Occurs before the form is loaded\r\nfunction before_load()\r\n{\r\n\r\n}\r\n\r\n// Occurs just before submitting  the form\r\nfunction before_submit()\r\n{\r\n\r\n}\r\n\r\n// Occurs just before resetting the form\r\nfunction before_reset()\r\n{\r\n\r\n}','','',0,'%all%','%all%',13,1,'1#**id**#Business Owner #**label**#type_name#****#2#**id**#Business Name#**label**#type_text#****#3#**id**#E-mail#**label**#type_submitter_mail#****#4#**id**#Street Address#**label**#type_address#****#5#**id**#Street Address Line 2#**label**#type_address#****#6#**id**#City#**label**#type_address#****#7#**id**#State / Province / Region#**label**#type_address#****#8#**id**#Postal / Zip Code#**label**#type_address#****#9#**id**#Country#**label**#type_address#****#10#**id**#Type of Business#**label**#type_own_select#****#11#**id**#Message#**label**#type_textarea#****#12#**id**#type_submit_reset_12#**label**#type_submit_reset#****#','1#**id**#Business Owner #**label**#type_name#****#2#**id**#Business Name#**label**#type_text#****#3#**id**#E-mail#**label**#type_submitter_mail#****#4#**id**#Street Address#**label**#type_address#****#5#**id**#Street Address Line 2#**label**#type_address#****#6#**id**#City#**label**#type_address#****#7#**id**#State / Province / Region#**label**#type_address#****#8#**id**#Postal / Zip Code#**label**#type_address#****#9#**id**#Country#**label**#type_address#****#10#**id**#Type of Business#**label**#type_own_select#****#11#**id**#Message#**label**#type_textarea#****#12#**id**#type_submit_reset_12#**label**#type_submit_reset#****#',0,'none','false','true','','','',0,'','','USD',0,'1*:*id*:*type_name*:*type*:*Business Owner *:*w_field_label*:*150*:*w_field_label_size*:*left*:*w_field_label_pos*:*****:*w_first_val*:*****:*w_title*:*Title***First***Last***Middle*:*w_mini_labels*:*100*:*w_size*:*normal*:*w_name_format*:*yes*:*w_required*:*no*:*w_unique*:**:*w_class*:**:*new_field*:*2*:*id*:*type_text*:*type*:*Business Name*:*w_field_label*:*150*:*w_field_label_size*:*left*:*w_field_label_pos*:*200*:*w_size*:**:*w_first_val*:**:*w_title*:*yes*:*w_required*:*no*:*w_unique*:**:*new_field*:*3*:*id*:*type_submitter_mail*:*type*:*E-mail*:*w_field_label*:*150*:*w_field_label_size*:*left*:*w_field_label_pos*:*200*:*w_size*:**:*w_first_val*:**:*w_title*:*yes*:*w_required*:**:*w_unique*:**:*w_class*:**:*new_field*:*4*:*id*:*type_address*:*type*:*Address:*:*w_field_label*:*150*:*w_field_label_size*:*left*:*w_field_label_pos*:*300*:*w_size*:*Street Address***Street Address Line 2***City***State / Province / Region***Postal / Zip Code***Country*:*w_mini_labels*:*no***no***no***no***no***no*:*w_disabled_fields*:*no*:*w_required*:*wdform_address*:*w_class*:**:*new_field*:*10*:*id*:*type_own_select*:*type*:*Type of Business*:*w_field_label*:*150*:*w_field_label_size*:*left*:*w_field_label_pos*:*200*:*w_size*:*Select value***option 1***option 2*:*w_choices*:*true***false***false*:*w_choices_checked*:*true***false***false*:*w_choices_disabled*:*yes*:*w_required*:*wdform_select*:*w_class*:**:*new_field*:*11*:*id*:*type_textarea*:*type*:*Message*:*w_field_label*:*150*:*w_field_label_size*:*left*:*w_field_label_pos*:*200*:*w_size_w*:*100*:*w_size_h*:**:*w_first_val*:**:*w_title*:*no*:*w_required*:*no*:*w_unique*:**:*w_class*:**:*new_field*:*12*:*id*:*type_submit_reset*:*type*:*type_submit_reset_12*:*w_field_label*:*Submit*:*w_submit_title*:*Reset*:*w_reset_title*:**:*w_class*:*false*:*w_act*:**:*new_field*:*',1,1,'*','','','','',1,'','','','','','','','','','','',1,1,1,1,'1,2,3,4,5,6,7,8,9,',1,0),(6,'Cupcake Order Form','','<div class=\"wdform-page-and-images\" style=\"display:table; border-top:0px solid black;\"><div id=\"form_id_tempform_view1\" class=\"wdform_page\" page_title=\"Untitled page\" next_title=\"Next\" next_type=\"text\" next_class=\"wdform-page-button\" next_checkable=\"false\" previous_title=\"Previous\" previous_type=\"text\" previous_class=\"wdform-page-button\" previous_checkable=\"false\"><div class=\"wdform_section\"><div class=\"wdform_column\"><div wdid=\"1\" class=\"wdform_row\">%1 - Date%</div><div wdid=\"2\" class=\"wdform_row\">%2 - Name%</div><div wdid=\"3\" class=\"wdform_row\">%3 - E-mail:%</div><div wdid=\"4\" class=\"wdform_row\">%4 - <b>Cupcakes <br> Flavors (1 doz. minimum)</b>%</div><div wdid=\"5\" class=\"wdform_row\">%5 - Quantity%</div><div wdid=\"6\" class=\"wdform_row\">%6 - Details (if any)%</div><div wdid=\"7\" class=\"wdform_row\">%7 - type_submit_reset_7%</div></div></div><div valign=\"top\" class=\"wdform_footer\" style=\"width: 100%;\"><div style=\"width: 100%;\"><div style=\"width: 100%; display: table;\"><div style=\"display: table-row-group;\"><div id=\"form_id_temppage_nav1\" style=\"display: table-row;\"></div></div></div></div></div></div></div>',6,'// Occurs before the form is loaded\r\nfunction before_load()\r\n{\r\n\r\n}\r\n\r\n// Occurs just before submitting  the form\r\nfunction before_submit()\r\n{\r\n\r\n}\r\n\r\n// Occurs just before resetting the form\r\nfunction before_reset()\r\n{\r\n\r\n}','','',0,'%all%','%all%',8,1,'1#**id**#Date#**label**#type_date#****#2#**id**#Name#**label**#type_name#****#3#**id**#E-mail:#**label**#type_submitter_mail#****#4#**id**#Cupcakes  Flavors (1 doz. minimum)#**label**#type_checkbox#****#5#**id**#Quantity#**label**#type_own_select#****#6#**id**#Details (if any)#**label**#type_textarea#****#7#**id**#type_submit_reset_7#**label**#type_submit_reset#****#','1#**id**#Date#**label**#type_date#****#2#**id**#Name#**label**#type_name#****#3#**id**#E-mail:#**label**#type_submitter_mail#****#4#**id**#Cupcakes  Flavors (1 doz. minimum)#**label**#type_checkbox#****#5#**id**#Quantity#**label**#type_own_select#****#6#**id**#Details (if any)#**label**#type_textarea#****#7#**id**#type_submit_reset_7#**label**#type_submit_reset#****#',0,'none','false','true','','','',0,'','','USD',0,'1*:*id*:*type_date*:*type*:*Date*:*w_field_label*:*150*:*w_field_label_size*:*left*:*w_field_label_pos*:**:*w_date*:*yes*:*w_required*:**:*w_class*:*%Y-%m-%d*:*w_format*:*...*:*w_but_val*:**:*new_field*:*2*:*id*:*type_name*:*type*:*Name*:*w_field_label*:*150*:*w_field_label_size*:*left*:*w_field_label_pos*:*****:*w_first_val*:*****:*w_title*:*Title***First***Last***Middle*:*w_mini_labels*:*100*:*w_size*:*normal*:*w_name_format*:*yes*:*w_required*:*no*:*w_unique*:**:*w_class*:**:*new_field*:*3*:*id*:*type_submitter_mail*:*type*:*E-mail:*:*w_field_label*:*150*:*w_field_label_size*:*left*:*w_field_label_pos*:*200*:*w_size*:**:*w_first_val*:**:*w_title*:*yes*:*w_required*:**:*w_unique*:**:*w_class*:**:*new_field*:*4*:*id*:*type_checkbox*:*type*:*<b>Cupcakes <br> Flavors (1 doz. minimum)</b>*:*w_field_label*:*150*:*w_field_label_size*:*left*:*w_field_label_pos*:*ver*:*w_flow*:*Red Velvet ($150.00 TTD)***Vanilla ($100.00 TTD)***Chocolate ($120.00 TTD)***Guinness ($150.00 TTD)***Coconut ($120.00 TTD)***Lemon ($100.00 TTD)***Chocolate Mint ($120.00 TTD)*:*w_choices*:*false***false***false***false***false***false***false*:*w_choices_checked*:*1*:*w_rowcol*:*no*:*w_required*:*no*:*w_randomize*:*no*:*w_allow_other*:*0*:*w_allow_other_num*:**:*w_class*:**:*new_field*:*5*:*id*:*type_own_select*:*type*:*Quantity*:*w_field_label*:*150*:*w_field_label_size*:*left*:*w_field_label_pos*:*50*:*w_size*:****1***2***3***4***5***6***7***8***9***10*:*w_choices*:*true***false***false***false***false***false***false***false***false***false***false*:*w_choices_checked*:*true***false***false***false***false***false***false***false***false***false***false*:*w_choices_disabled*:*no*:*w_required*:*wdform_select*:*w_class*:**:*new_field*:*6*:*id*:*type_textarea*:*type*:*Details (if any)*:*w_field_label*:*150*:*w_field_label_size*:*left*:*w_field_label_pos*:*200*:*w_size_w*:*100*:*w_size_h*:**:*w_first_val*:**:*w_title*:*no*:*w_required*:*no*:*w_unique*:**:*w_class*:**:*new_field*:*7*:*id*:*type_submit_reset*:*type*:*type_submit_reset_7*:*w_field_label*:*Submit*:*w_submit_title*:*Reset*:*w_reset_title*:**:*w_class*:*false*:*w_act*:**:*new_field*:*',1,1,'*','','','','',1,'','','','','','','','','','','',1,1,1,1,'1,2,3,4,5,6,7,8,9,',1,0),(7,'Seminar Evaluation Survey','','<div class=\"wdform-page-and-images\" style=\"display:table; border-top:0px solid black;\"><div id=\"form_id_tempform_view1\" class=\"wdform_page\" page_title=\"Untitled page\" next_title=\"Next\" next_type=\"text\" next_class=\"wdform-page-button\" next_checkable=\"false\" previous_title=\"Previous\" previous_type=\"text\" previous_class=\"wdform-page-button\" previous_checkable=\"false\"><div class=\"wdform_section\"><div class=\"wdform_column\"></div></div><div wdid=\"1\" type=\"type_section_break\" class=\"wdform_tr_section_break\">%1 - custom_1%</div><div class=\"wdform_section\"><div class=\"wdform_column\"><div wdid=\"2\" class=\"wdform_row\">%2 - <b>Company</b>%</div><div wdid=\"3\" class=\"wdform_row\">%3 - <b>Occupation</b>%</div><div wdid=\"4\" class=\"wdform_row\">%4 - <b>Was it worth its money?</b>%</div><div wdid=\"5\" class=\"wdform_row\">%5 - <b>On average how would you rate the seminar?</b>%</div><div wdid=\"6\" class=\"wdform_row\">%6 - type_submit_reset_6%</div></div></div><div valign=\"top\" class=\"wdform_footer\" style=\"width: 100%;\"><div style=\"width: 100%;\"><div style=\"width: 100%; display: table;\"><div style=\"display: table-row-group;\"><div id=\"form_id_temppage_nav1\" style=\"display: table-row;\"></div></div></div></div></div></div></div>',16,'// Occurs before the form is loaded\r\nfunction before_load()\r\n{\r\n\r\n}\r\n\r\n// Occurs just before submitting  the form\r\nfunction before_submit()\r\n{\r\n\r\n}\r\n\r\n// Occurs just before resetting the form\r\nfunction before_reset()\r\n{\r\n\r\n}','','',0,'%all%','%all%',7,1,'2#**id**#Company#**label**#type_text#****#3#**id**#Occupation#**label**#type_text#****#4#**id**#Was it worth its money?#**label**#type_radio#****#5#**id**#On average how would you rate the seminar?#**label**#type_radio#****#6#**id**#type_submit_reset_6#**label**#type_submit_reset#****#','2#**id**#Company#**label**#type_text#****#3#**id**#Occupation#**label**#type_text#****#4#**id**#Was it worth its money?#**label**#type_radio#****#5#**id**#On average how would you rate the seminar?#**label**#type_radio#****#6#**id**#type_submit_reset_6#**label**#type_submit_reset#****#',0,'none','false','true','','','',0,'','','USD',0,'1*:*id*:*type_section_break*:*type*:*custom_1*:*w_field_label*:*<h1 id=\"header_1\" style=\"font-size: 1.5rem; font-family: \'Open Sans\', Helvetica, Arial, sans-serif; color: rgb(68, 68, 68); clear: both; line-height: 1.5; margin: 1.714285714rem 0px;\">Seminar Evaluation Survey</h1><div id=\"subHeader_1\" style=\"color: rgb(68, 68, 68); font-family: \'Open Sans\', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 14px;\">Please take a few minutes to complete this evaluation survey</div>*:*w_editor*:**:*new_field*:*2*:*id*:*type_text*:*type*:*<b>Company</b>*:*w_field_label*:*150*:*w_field_label_size*:*top*:*w_field_label_pos*:*200*:*w_size*:**:*w_first_val*:**:*w_title*:*no*:*w_required*:*no*:*w_unique*:**:*new_field*:*3*:*id*:*type_text*:*type*:*<b>Occupation</b>*:*w_field_label*:*150*:*w_field_label_size*:*top*:*w_field_label_pos*:*200*:*w_size*:**:*w_first_val*:**:*w_title*:*no*:*w_required*:*no*:*w_unique*:**:*new_field*:*4*:*id*:*type_radio*:*type*:*<b>Was it worth its money?</b>*:*w_field_label*:*200*:*w_field_label_size*:*top*:*w_field_label_pos*:*ver*:*w_flow*:*Yes***No*:*w_choices*:*false***false*:*w_choices_checked*:*1*:*w_rowcol*:*no*:*w_required*:*no*:*w_randomize*:*no*:*w_allow_other*:*0*:*w_allow_other_num*:**:*w_class*:**:*new_field*:*5*:*id*:*type_radio*:*type*:*<b>On average how would you rate the seminar?</b>*:*w_field_label*:*400*:*w_field_label_size*:*top*:*w_field_label_pos*:*ver*:*w_flow*:*Very good***Good***Neutral***Bad***Very bad*:*w_choices*:*false***false***false***false***false*:*w_choices_checked*:*1*:*w_rowcol*:*no*:*w_required*:*no*:*w_randomize*:*no*:*w_allow_other*:*0*:*w_allow_other_num*:**:*w_class*:**:*new_field*:*6*:*id*:*type_submit_reset*:*type*:*type_submit_reset_6*:*w_field_label*:*Submit*:*w_submit_title*:*Reset*:*w_reset_title*:**:*w_class*:*false*:*w_act*:**:*new_field*:*',1,1,'*','','','','',1,'','','','','','','','','','','',1,1,1,1,'1,2,3,4,5,6,7,8,9,',1,0),(8,'Restaurant Evaluation Survey','','<div class=\"wdform-page-and-images\" style=\"display:table; border-top:0px solid black;\"><div id=\"form_id_tempform_view1\" class=\"wdform_page\" page_title=\"Untitled page\" next_title=\"Next\" next_type=\"text\" next_class=\"wdform-page-button\" next_checkable=\"false\" previous_title=\"Previous\" previous_type=\"text\" previous_class=\"wdform-page-button\" previous_checkable=\"false\"><div class=\"wdform_section\"><div class=\"wdform_column\"></div></div><div wdid=\"1\" type=\"type_section_break\" class=\"wdform_tr_section_break\">%1 - custom_1%</div><div class=\"wdform_section\"><div class=\"wdform_column\"><div wdid=\"2\" class=\"wdform_row\">%2 - Day Visited:%</div><div wdid=\"3\" class=\"wdform_row\">%3 - <b>Dine In / Take Out:</b>%</div><div wdid=\"4\" class=\"wdform_row\">%4 - <b>Food Quality:</b>%</div><div wdid=\"5\" class=\"wdform_row\">%5 - <b>Speed of Service:</b>%</div><div wdid=\"6\" class=\"wdform_row\">%6 - <b>Any comments, questions or suggestions?</b>%</div><div wdid=\"7\" class=\"wdform_row\">%7 - type_submit_reset_7%</div></div></div><div valign=\"top\" class=\"wdform_footer\" style=\"width: 100%;\"><div style=\"width: 100%;\"><div style=\"width: 100%; display: table;\"><div style=\"display: table-row-group;\"><div id=\"form_id_temppage_nav1\" style=\"display: table-row;\"></div></div></div></div></div></div></div>',21,'// Occurs before the form is loaded\r\nfunction before_load()\r\n{\r\n\r\n}\r\n\r\n// Occurs just before submitting  the form\r\nfunction before_submit()\r\n{\r\n\r\n}\r\n\r\n// Occurs just before resetting the form\r\nfunction before_reset()\r\n{\r\n\r\n}','','',0,'%all%','%all%',8,1,'2#**id**#Day Visited:#**label**#type_date#****#3#**id**#Dine In / Take Out:#**label**#type_radio#****#4#**id**#Food Quality:#**label**#type_radio#****#5#**id**#Speed of Service:#**label**#type_radio#****#6#**id**#Any comments, questions or suggestions?#**label**#type_textarea#****#7#**id**#type_submit_reset_7#**label**#type_submit_reset#****#','2#**id**#Day Visited:#**label**#type_date#****#3#**id**#Dine In / Take Out:#**label**#type_radio#****#4#**id**#Food Quality:#**label**#type_radio#****#5#**id**#Speed of Service:#**label**#type_radio#****#6#**id**#Any comments, questions or suggestions?#**label**#type_textarea#****#7#**id**#type_submit_reset_7#**label**#type_submit_reset#****#',0,'none','false','true','','','',0,'','','USD',0,'1*:*id*:*type_section_break*:*type*:*custom_1*:*w_field_label*:*<h2 id=\"header_21\" style=\"font-size: 1.285714286rem; font-family: \'Open Sans\', Helvetica, Arial, sans-serif; color: rgb(68, 68, 68); clear: both; line-height: 1.6; margin: 1.714285714rem 0px;\">Restaurant Evaluation Survey</h2><div id=\"subHeader_21\" style=\"color: rgb(68, 68, 68); font-family: \'Open Sans\', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 14px;\">Please let us know how was the food and service.</div><p><br></p>*:*w_editor*:**:*new_field*:*2*:*id*:*type_date*:*type*:*Day Visited:*:*w_field_label*:*150*:*w_field_label_size*:*left*:*w_field_label_pos*:**:*w_date*:*no*:*w_required*:**:*w_class*:*%Y-%m-%d*:*w_format*:*...*:*w_but_val*:**:*new_field*:*3*:*id*:*type_radio*:*type*:*<b>Dine In / Take Out:</b>*:*w_field_label*:*150*:*w_field_label_size*:*left*:*w_field_label_pos*:*ver*:*w_flow*:*Dine In***Dine Out*:*w_choices*:*false***false*:*w_choices_checked*:*1*:*w_rowcol*:*no*:*w_required*:*no*:*w_randomize*:*no*:*w_allow_other*:*0*:*w_allow_other_num*:**:*w_class*:**:*new_field*:*4*:*id*:*type_radio*:*type*:*<b>Food Quality:</b>*:*w_field_label*:*150*:*w_field_label_size*:*left*:*w_field_label_pos*:*ver*:*w_flow*:*Excellent***Good***Average***Dissatisfied*:*w_choices*:*false***false***false***false*:*w_choices_checked*:*1*:*w_rowcol*:*no*:*w_required*:*no*:*w_randomize*:*no*:*w_allow_other*:*0*:*w_allow_other_num*:**:*w_class*:**:*new_field*:*5*:*id*:*type_radio*:*type*:*<b>Speed of Service:</b>*:*w_field_label*:*150*:*w_field_label_size*:*left*:*w_field_label_pos*:*ver*:*w_flow*:*Excellent***Good***Average***Dissatisfied*:*w_choices*:*false***false***false***false*:*w_choices_checked*:*1*:*w_rowcol*:*no*:*w_required*:*no*:*w_randomize*:*no*:*w_allow_other*:*0*:*w_allow_other_num*:**:*w_class*:**:*new_field*:*6*:*id*:*type_textarea*:*type*:*<b>Any comments, questions or suggestions?</b>*:*w_field_label*:*300*:*w_field_label_size*:*top*:*w_field_label_pos*:*300*:*w_size_w*:*100*:*w_size_h*:**:*w_first_val*:**:*w_title*:*no*:*w_required*:*no*:*w_unique*:**:*w_class*:**:*new_field*:*7*:*id*:*type_submit_reset*:*type*:*type_submit_reset_7*:*w_field_label*:*Submit*:*w_submit_title*:*Reset*:*w_reset_title*:**:*w_class*:*false*:*w_act*:**:*new_field*:*',1,1,'*','','','','',1,'','','','','','','','','','','',1,1,1,1,'1,2,3,4,5,6,7,8,9,',1,0),(9,'Product Survey','','<div class=\"wdform-page-and-images\" style=\"display:table; border-top:0px solid black;\"><div id=\"form_id_tempform_view1\" class=\"wdform_page\" page_title=\"Untitled page\" next_title=\"Next\" next_type=\"text\" next_class=\"wdform-page-button\" next_checkable=\"false\" previous_title=\"Previous\" previous_type=\"text\" previous_class=\"wdform-page-button\" previous_checkable=\"false\"><div class=\"wdform_section\"><div class=\"wdform_column\"></div></div><div wdid=\"1\" type=\"type_section_break\" class=\"wdform_tr_section_break\">%1 - custom_1%</div><div class=\"wdform_section\"><div class=\"wdform_column\"><div wdid=\"2\" class=\"wdform_row\">%2 - 1. Please indicate if you agree or disagree with the following statements%</div><div wdid=\"3\" class=\"wdform_row\">%3 - 2. How likely are you to recommend [Product/Service] to a friend or co-worker?%</div><div wdid=\"4\" class=\"wdform_row\">%4 - 3. What is the amount you would ever pay for a product like ours%</div><div wdid=\"5\" class=\"wdform_row\">%5 - 4. Please rate the product %</div><div wdid=\"6\" class=\"wdform_row\">%6 - type_submit_reset_6%</div></div></div><div valign=\"top\" class=\"wdform_footer\" style=\"width: 100%;\"><div style=\"width: 100%;\"><div style=\"width: 100%; display: table;\"><div style=\"display: table-row-group;\"><div id=\"form_id_temppage_nav1\" style=\"display: table-row;\"></div></div></div></div></div></div></div>',29,'// Occurs before the form is loaded\r\nfunction before_load()\r\n{\r\n\r\n}\r\n\r\n// Occurs just before submitting  the form\r\nfunction before_submit()\r\n{\r\n\r\n}\r\n\r\n// Occurs just before resetting the form\r\nfunction before_reset()\r\n{\r\n\r\n}','','',0,'%all%','%all%',7,1,'2#**id**#1. Please indicate if you agree or disagree with the following statements#**label**#type_matrix#****#3#**id**#2. How likely are you to recommend [Product/Service] to a friend or co-worker?#**label**#type_scale_rating#****#4#**id**#3. What is the amount you would ever pay for a product like ours#**label**#type_range#****#5#**id**#4. Please rate the product #**label**#type_star_rating#****#6#**id**#type_submit_reset_6#**label**#type_submit_reset#****#','2#**id**#1. Please indicate if you agree or disagree with the following statements#**label**#type_matrix#****#3#**id**#2. How likely are you to recommend [Product/Service] to a friend or co-worker?#**label**#type_scale_rating#****#4#**id**#3. What is the amount you would ever pay for a product like ours#**label**#type_range#****#5#**id**#4. Please rate the product #**label**#type_star_rating#****#6#**id**#type_submit_reset_6#**label**#type_submit_reset#****#',0,'none','false','true','','','',0,'','','USD',0,'1*:*id*:*type_section_break*:*type*:*custom_1*:*w_field_label*:*<h1 class=\"sg-title\" data-mce-style=\"font-size: 2.2em; color: #fff; font-weight: normal; line-height: normal;\" style=\"font-size: 2.2em; font-weight: normal; color: rgb(255, 255, 255); line-height: normal;\">Product Survey</h1>*:*w_editor*:**:*new_field*:*2*:*id*:*type_matrix*:*type*:*1. Please indicate if you agree or disagree with the following statements*:*w_field_label*:*600*:*w_field_label_size*:*top*:*w_field_label_pos*:*radio*:*w_field_input_type*:****Product is affordable***Product is valuable***Product is better<br> than other products on<br> the market***Product is easy to use*:*w_rows*:****Strongly Disagree***Disagree***Neutral***Agree***Strongly Agree*:*w_columns*:*no*:*w_required*:*wdform_matrix*:*w_class*:**:*new_field*:*3*:*id*:*type_scale_rating*:*type*:*2. How likely are you to recommend [Product/Service] to a friend or co-worker?*:*w_field_label*:*600*:*w_field_label_size*:*top*:*w_field_label_pos*:*Will not recommend  ***  I will recommend*:*w_mini_labels*:*5*:*w_scale_amount*:*no*:*w_required*:*wdform_scale_rating*:*w_class*:**:*new_field*:*4*:*id*:*type_range*:*type*:*3. What is the amount you would ever pay for a product like ours*:*w_field_label*:*600*:*w_field_label_size*:*top*:*w_field_label_pos*:*40*:*w_field_range_width*:*1*:*w_field_range_step*:*null*:*w_field_value1*:*null*:*w_field_value2*:*From***To*:*w_mini_labels*:*no*:*w_required*:**:*w_class*:**:*new_field*:*5*:*id*:*type_star_rating*:*type*:*4. Please rate the product *:*w_field_label*:*150*:*w_field_label_size*:*top*:*w_field_label_pos*:*yellow*:*w_field_label_col*:*10*:*w_star_amount*:*no*:*w_required*:*wdform_star_rating*:*w_class*:**:*new_field*:*6*:*id*:*type_submit_reset*:*type*:*type_submit_reset_6*:*w_field_label*:*Submit*:*w_submit_title*:*Reset*:*w_reset_title*:**:*w_class*:*true*:*w_act*:**:*new_field*:*',1,1,'*','','','','',1,'','','','','','','','','','','',1,1,1,1,'1,2,3,4,5,6,7,8,9,',1,0),(12,'Cheques Devueltos','','<div class=\"wdform-page-and-images\" style=\"display:table; border-top:0px solid black;\"><div id=\"form_id_tempform_view1\" class=\"wdform_page\" page_title=\"Untitled page\" next_title=\"Next\" next_type=\"text\" next_class=\"wdform-page-button\" next_checkable=\"false\" previous_title=\"Previous\" previous_type=\"text\" previous_class=\"wdform-page-button\" previous_checkable=\"false\"><div class=\"wdform_section\"><div class=\"wdform_column ui-sortable\"><div wdid=\"3\" class=\"wdform_row\">%3 - Fecha Devolución:%</div><div wdid=\"2\" class=\"wdform_row\">%2 - Banco Emisor:%</div><div wdid=\"5\" class=\"wdform_row\">%5 - Número de Cheque%</div><div wdid=\"6\" class=\"wdform_row\">%6 - Monto:%</div><div wdid=\"7\" class=\"wdform_row\">%7 - PDV:%</div><div wdid=\"8\" class=\"wdform_row\">%8 - DTI:%</div><div wdid=\"9\" class=\"wdform_row\">%9 - custom_9%</div></div></div><div valign=\"top\" class=\"wdform_footer\" style=\"width: 100%;\"><div style=\"width: 100%;\"><div style=\"width: 100%; display: table;\"><div style=\"display: table-row-group;\"><div id=\"form_id_temppage_nav1\" style=\"display: table-row;\"></div></div></div></div></div></div></div>',3,'// Occurs before the form is loaded\r\n\r\nfunction before_load()\r\n\r\n{\r\n\r\n\r\n\r\n}\r\n\r\n\r\n\r\n// Occurs just before submitting  the form\r\n\r\nfunction before_submit()\r\n\r\n{\r\n\r\n\r\n\r\n}\r\n\r\n\r\n\r\n// Occurs just before resetting the form\r\n\r\nfunction before_reset()\r\n\r\n{\r\n\r\n\r\n\r\n}','','',1,'%all%','%all%',10,1,'3#**id**#Fecha Devolución:#**label**#type_date#****#2#**id**#Banco Emisor:#**label**#type_text#****#5#**id**#Número de Cheque#**label**#type_number#****#6#**id**#Monto:#**label**#type_number#****#7#**id**#PDV:#**label**#type_own_select#****#8#**id**#DTI:#**label**#type_own_select#****#9#**id**#custom_9#**label**#type_editor#****#1#**id**#Fecha: #**label**#type_date#****#','3#**id**#Fecha Devolución:#**label**#type_date#****#2#**id**#Banco Emisor:#**label**#type_text#****#5#**id**#Número de Cheque#**label**#type_number#****#6#**id**#Monto:#**label**#type_number#****#7#**id**#PDV:#**label**#type_own_select#****#8#**id**#DTI:#**label**#type_own_select#****#9#**id**#custom_9#**label**#type_editor#****#',0,'none','false','true','','','',0,'','','USD',0,'3*:*id*:*type_date*:*type*:*Fecha Devolución:*:*w_field_label*:*100*:*w_field_label_size*:*left*:*w_field_label_pos*:**:*w_date*:*yes*:*w_required*:**:*w_class*:*%d-%m-%Y*:*w_format*:*...*:*w_but_val*:**:*new_field*:*2*:*id*:*type_text*:*type*:*Banco Emisor:*:*w_field_label*:*100*:*w_field_label_size*:*left*:*w_field_label_pos*:*200*:*w_size*:**:*w_first_val*:**:*w_title*:*yes*:*w_required*:*no*:*w_unique*:**:*new_field*:*5*:*id*:*type_number*:*type*:*Número de Cheque*:*w_field_label*:*100*:*w_field_label_size*:*left*:*w_field_label_pos*:*200*:*w_size*:**:*w_first_val*:**:*w_title*:*yes*:*w_required*:*no*:*w_unique*:**:*w_class*:**:*new_field*:*6*:*id*:*type_number*:*type*:*Monto:*:*w_field_label*:*100*:*w_field_label_size*:*left*:*w_field_label_pos*:*200*:*w_size*:**:*w_first_val*:**:*w_title*:*yes*:*w_required*:*no*:*w_unique*:**:*w_class*:**:*new_field*:*7*:*id*:*type_own_select*:*type*:*PDV:*:*w_field_label*:*100*:*w_field_label_size*:*left*:*w_field_label_pos*:*200*:*w_size*:*Select value***option 1***option 2***[pdv:nombre]*:*w_choices*:*true***false***false***false*:*w_choices_checked*:*true***false***false***false*:*w_choices_disabled*:*yes*:*w_required*:*no*:*w_value_disabled*:****option 1***option 2***[pdv:nombre]*:*w_choices_value*:**********[][where_order_by][`idPDV` asc][db_info][localhost@@@wdfhostwdf@@@3306@@@wdfportwdf@@@mmov@@@wdfusernamewdf@@@12345@@@wdfpasswordwdf@@@mmov_dw@@@wdfdatabasewdf@@@]*:*w_choices_params*:*wdform_select*:*w_class*:**:*new_field*:*8*:*id*:*type_own_select*:*type*:*DTI:*:*w_field_label*:*100*:*w_field_label_size*:*left*:*w_field_label_pos*:*200*:*w_size*:*Select value***option 1***option 2***[dti:nombre]*:*w_choices*:*true***false***false***false*:*w_choices_checked*:*true***false***false***false*:*w_choices_disabled*:*yes*:*w_required*:*no*:*w_value_disabled*:****option 1***option 2***[dti:nombre]*:*w_choices_value*:**********[][where_order_by][`idDTI` asc][db_info][localhost@@@wdfhostwdf@@@3306@@@wdfportwdf@@@mmov@@@wdfusernamewdf@@@12345@@@wdfpasswordwdf@@@mmov_dw@@@wdfdatabasewdf@@@]*:*w_choices_params*:*wdform_select*:*w_class*:**:*new_field*:*9*:*id*:*type_editor*:*type*:*custom_9*:*w_field_label*:*<hr><p><br></p>*:*w_editor*:**:*new_field*:*',1,1,'*','','','','',1,'','','','','','','','','','','',1,1,1,1,'',1,961);
/*!40000 ALTER TABLE `mmov_formmaker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mmov_formmaker_blocked`
--

DROP TABLE IF EXISTS `mmov_formmaker_blocked`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmov_formmaker_blocked` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mmov_formmaker_blocked`
--

LOCK TABLES `mmov_formmaker_blocked` WRITE;
/*!40000 ALTER TABLE `mmov_formmaker_blocked` DISABLE KEYS */;
/*!40000 ALTER TABLE `mmov_formmaker_blocked` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mmov_formmaker_query`
--

DROP TABLE IF EXISTS `mmov_formmaker_query`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmov_formmaker_query` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_id` int(11) NOT NULL,
  `query` text NOT NULL,
  `details` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mmov_formmaker_query`
--

LOCK TABLES `mmov_formmaker_query` WRITE;
/*!40000 ALTER TABLE `mmov_formmaker_query` DISABLE KEYS */;
/*!40000 ALTER TABLE `mmov_formmaker_query` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mmov_formmaker_sessions`
--

DROP TABLE IF EXISTS `mmov_formmaker_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmov_formmaker_sessions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `form_id` int(20) NOT NULL,
  `group_id` int(20) NOT NULL,
  `ip` varchar(20) NOT NULL,
  `ord_date` datetime NOT NULL,
  `ord_last_modified` datetime NOT NULL,
  `status` varchar(50) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `mobile_phone` varchar(255) NOT NULL,
  `fax` varchar(255) NOT NULL,
  `address` varchar(300) NOT NULL,
  `paypal_info` text NOT NULL,
  `without_paypal_info` text NOT NULL,
  `ipn` varchar(20) NOT NULL,
  `checkout_method` varchar(20) NOT NULL,
  `tax` float NOT NULL,
  `shipping` float NOT NULL,
  `shipping_type` varchar(200) NOT NULL,
  `read` int(11) NOT NULL,
  `total` float NOT NULL,
  `currency` varchar(24) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mmov_formmaker_sessions`
--

LOCK TABLES `mmov_formmaker_sessions` WRITE;
/*!40000 ALTER TABLE `mmov_formmaker_sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mmov_formmaker_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mmov_formmaker_submits`
--

DROP TABLE IF EXISTS `mmov_formmaker_submits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmov_formmaker_submits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_id` int(11) NOT NULL,
  `element_label` varchar(128) NOT NULL,
  `element_value` varchar(600) NOT NULL,
  `group_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `ip` varchar(200) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mmov_formmaker_submits`
--

LOCK TABLES `mmov_formmaker_submits` WRITE;
/*!40000 ALTER TABLE `mmov_formmaker_submits` DISABLE KEYS */;
/*!40000 ALTER TABLE `mmov_formmaker_submits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mmov_formmaker_themes`
--

DROP TABLE IF EXISTS `mmov_formmaker_themes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmov_formmaker_themes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `css` text NOT NULL,
  `default` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mmov_formmaker_themes`
--

LOCK TABLES `mmov_formmaker_themes` WRITE;
/*!40000 ALTER TABLE `mmov_formmaker_themes` DISABLE KEYS */;
/*!40000 ALTER TABLE `mmov_formmaker_themes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mmov_formmaker_views`
--

DROP TABLE IF EXISTS `mmov_formmaker_views`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmov_formmaker_views` (
  `form_id` int(11) NOT NULL,
  `views` int(50) NOT NULL,
  PRIMARY KEY (`form_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mmov_formmaker_views`
--

LOCK TABLES `mmov_formmaker_views` WRITE;
/*!40000 ALTER TABLE `mmov_formmaker_views` DISABLE KEYS */;
INSERT INTO `mmov_formmaker_views` VALUES (1,0),(2,0),(3,0),(4,0),(5,0),(6,0),(7,0),(8,0),(9,0),(12,22);
/*!40000 ALTER TABLE `mmov_formmaker_views` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mmov_languages`
--

DROP TABLE IF EXISTS `mmov_languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmov_languages` (
  `lang_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang_code` char(7) NOT NULL,
  `title` varchar(50) NOT NULL,
  `title_native` varchar(50) NOT NULL,
  `sef` varchar(50) NOT NULL,
  `image` varchar(50) NOT NULL,
  `description` varchar(512) NOT NULL,
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `sitename` varchar(1024) NOT NULL DEFAULT '',
  `published` int(11) NOT NULL DEFAULT '0',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`lang_id`),
  UNIQUE KEY `idx_sef` (`sef`),
  UNIQUE KEY `idx_image` (`image`),
  UNIQUE KEY `idx_langcode` (`lang_code`),
  KEY `idx_access` (`access`),
  KEY `idx_ordering` (`ordering`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mmov_languages`
--

LOCK TABLES `mmov_languages` WRITE;
/*!40000 ALTER TABLE `mmov_languages` DISABLE KEYS */;
INSERT INTO `mmov_languages` VALUES (1,'en-GB','English (UK)','English (UK)','en','en','','','','',1,1,1);
/*!40000 ALTER TABLE `mmov_languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mmov_menu`
--

DROP TABLE IF EXISTS `mmov_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmov_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menutype` varchar(24) NOT NULL COMMENT 'The type of menu this item belongs to. FK to #__menu_types.menutype',
  `title` varchar(255) NOT NULL COMMENT 'The display title of the menu item.',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'The SEF alias of the menu item.',
  `note` varchar(255) NOT NULL DEFAULT '',
  `path` varchar(1024) NOT NULL COMMENT 'The computed path of the menu item based on the alias field.',
  `link` varchar(1024) NOT NULL COMMENT 'The actually link the menu item refers to.',
  `type` varchar(16) NOT NULL COMMENT 'The type of link: Component, URL, Alias, Separator',
  `published` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'The published state of the menu link.',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '1' COMMENT 'The parent menu item in the menu tree.',
  `level` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The relative level in the tree.',
  `component_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to #__extensions.id',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to #__users.id',
  `checked_out_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'The time the menu item was checked out.',
  `browserNav` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'The click behaviour of the link.',
  `access` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The access level required to view the menu item.',
  `img` varchar(255) NOT NULL COMMENT 'The image of the menu item.',
  `template_style_id` int(10) unsigned NOT NULL DEFAULT '0',
  `params` text NOT NULL COMMENT 'JSON encoded data for the menu item.',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `home` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Indicates if this menu item is the home or default page.',
  `language` char(7) NOT NULL DEFAULT '',
  `client_id` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_client_id_parent_id_alias_language` (`client_id`,`parent_id`,`alias`,`language`),
  KEY `idx_componentid` (`component_id`,`menutype`,`published`,`access`),
  KEY `idx_menutype` (`menutype`),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`),
  KEY `idx_path` (`path`(255)),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mmov_menu`
--

LOCK TABLES `mmov_menu` WRITE;
/*!40000 ALTER TABLE `mmov_menu` DISABLE KEYS */;
INSERT INTO `mmov_menu` VALUES (1,'','Menu_Item_Root','root','','','','',1,0,0,0,0,'0000-00-00 00:00:00',0,0,'',0,'',0,107,0,'*',0),(2,'menu','com_banners','Banners','','Banners','index.php?option=com_banners','component',0,1,1,4,0,'0000-00-00 00:00:00',0,0,'class:banners',0,'',1,10,0,'*',1),(3,'menu','com_banners','Banners','','Banners/Banners','index.php?option=com_banners','component',0,2,2,4,0,'0000-00-00 00:00:00',0,0,'class:banners',0,'',2,3,0,'*',1),(4,'menu','com_banners_categories','Categories','','Banners/Categories','index.php?option=com_categories&extension=com_banners','component',0,2,2,6,0,'0000-00-00 00:00:00',0,0,'class:banners-cat',0,'',4,5,0,'*',1),(5,'menu','com_banners_clients','Clients','','Banners/Clients','index.php?option=com_banners&view=clients','component',0,2,2,4,0,'0000-00-00 00:00:00',0,0,'class:banners-clients',0,'',6,7,0,'*',1),(6,'menu','com_banners_tracks','Tracks','','Banners/Tracks','index.php?option=com_banners&view=tracks','component',0,2,2,4,0,'0000-00-00 00:00:00',0,0,'class:banners-tracks',0,'',8,9,0,'*',1),(7,'menu','com_contact','Contacts','','Contacts','index.php?option=com_contact','component',0,1,1,8,0,'0000-00-00 00:00:00',0,0,'class:contact',0,'',11,16,0,'*',1),(8,'menu','com_contact','Contacts','','Contacts/Contacts','index.php?option=com_contact','component',0,7,2,8,0,'0000-00-00 00:00:00',0,0,'class:contact',0,'',12,13,0,'*',1),(9,'menu','com_contact_categories','Categories','','Contacts/Categories','index.php?option=com_categories&extension=com_contact','component',0,7,2,6,0,'0000-00-00 00:00:00',0,0,'class:contact-cat',0,'',14,15,0,'*',1),(10,'menu','com_messages','Messaging','','Messaging','index.php?option=com_messages','component',0,1,1,15,0,'0000-00-00 00:00:00',0,0,'class:messages',0,'',17,22,0,'*',1),(11,'menu','com_messages_add','New Private Message','','Messaging/New Private Message','index.php?option=com_messages&task=message.add','component',0,10,2,15,0,'0000-00-00 00:00:00',0,0,'class:messages-add',0,'',18,19,0,'*',1),(12,'menu','com_messages_read','Read Private Message','','Messaging/Read Private Message','index.php?option=com_messages','component',0,10,2,15,0,'0000-00-00 00:00:00',0,0,'class:messages-read',0,'',20,21,0,'*',1),(13,'menu','com_newsfeeds','News Feeds','','News Feeds','index.php?option=com_newsfeeds','component',0,1,1,17,0,'0000-00-00 00:00:00',0,0,'class:newsfeeds',0,'',23,28,0,'*',1),(14,'menu','com_newsfeeds_feeds','Feeds','','News Feeds/Feeds','index.php?option=com_newsfeeds','component',0,13,2,17,0,'0000-00-00 00:00:00',0,0,'class:newsfeeds',0,'',24,25,0,'*',1),(15,'menu','com_newsfeeds_categories','Categories','','News Feeds/Categories','index.php?option=com_categories&extension=com_newsfeeds','component',0,13,2,6,0,'0000-00-00 00:00:00',0,0,'class:newsfeeds-cat',0,'',26,27,0,'*',1),(16,'menu','com_redirect','Redirect','','Redirect','index.php?option=com_redirect','component',0,1,1,24,0,'0000-00-00 00:00:00',0,0,'class:redirect',0,'',29,30,0,'*',1),(17,'menu','com_search','Basic Search','','Basic Search','index.php?option=com_search','component',0,1,1,19,0,'0000-00-00 00:00:00',0,0,'class:search',0,'',31,32,0,'*',1),(18,'menu','com_weblinks','Weblinks','','Weblinks','index.php?option=com_weblinks','component',0,1,1,21,0,'0000-00-00 00:00:00',0,0,'class:weblinks',0,'',33,38,0,'*',1),(19,'menu','com_weblinks_links','Links','','Weblinks/Links','index.php?option=com_weblinks','component',0,18,2,21,0,'0000-00-00 00:00:00',0,0,'class:weblinks',0,'',34,35,0,'*',1),(20,'menu','com_weblinks_categories','Categories','','Weblinks/Categories','index.php?option=com_categories&extension=com_weblinks','component',0,18,2,6,0,'0000-00-00 00:00:00',0,0,'class:weblinks-cat',0,'',36,37,0,'*',1),(21,'menu','com_finder','Smart Search','','Smart Search','index.php?option=com_finder','component',0,1,1,27,0,'0000-00-00 00:00:00',0,0,'class:finder',0,'',39,40,0,'*',1),(22,'menu','com_joomlaupdate','Joomla! Update','','Joomla! Update','index.php?option=com_joomlaupdate','component',1,1,1,28,0,'0000-00-00 00:00:00',0,0,'class:joomlaupdate',0,'',41,42,0,'*',1),(23,'main','com_tags','Tags','','Tags','index.php?option=com_tags','component',0,1,1,29,0,'0000-00-00 00:00:00',0,1,'class:tags',0,'',43,44,0,'',1),(24,'main','com_postinstall','Post-installation messages','','Post-installation messages','index.php?option=com_postinstall','component',0,1,1,32,0,'0000-00-00 00:00:00',0,1,'class:postinstall',0,'',45,46,0,'*',1),(101,'mainmenu','Home','home','','home','index.php?option=com_content&view=featured','component',1,1,1,22,0,'0000-00-00 00:00:00',0,1,'',0,'{\"featured_categories\":[\"\"],\"layout_type\":\"blog\",\"num_leading_articles\":\"\",\"num_intro_articles\":\"\",\"num_columns\":\"\",\"num_links\":\"\",\"multi_column_order\":\"\",\"orderby_pri\":\"\",\"orderby_sec\":\"\",\"order_date\":\"\",\"show_pagination\":\"\",\"show_pagination_results\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_readmore\":\"\",\"show_readmore_title\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"show_feed_link\":\"\",\"feed_summary\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":\"1\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0,\"mega_showtitle\":\"1\",\"mega_desc\":\"\",\"mega_cols\":\"1\",\"mega_group\":\"0\",\"mega_width\":\"\",\"mega_colw\":\"\",\"mega_colxw\":\"\",\"mega_class\":\"\",\"mega_subcontent\":\"0\"}',47,48,1,'*',0),(102,'mainmenu','Cargar Datos','cargar-datos','','cargar-datos','#','url',1,1,1,0,0,'0000-00-00 00:00:00',0,2,'',0,'{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"mega_showtitle\":\"1\",\"mega_desc\":\"\",\"mega_cols\":\"1\",\"mega_group\":\"0\",\"mega_width\":\"\",\"mega_colw\":\"\",\"mega_colxw\":\"\",\"mega_class\":\"\",\"mega_subcontent\":\"0\"}',49,62,0,'*',0),(103,'mainmenu','Subir Archivo','subir-archivo','','subir-archivo','index.php?option=com_content&view=article&id=13','component',1,1,1,22,0,'0000-00-00 00:00:00',0,2,'',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":\"0\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0,\"mega_showtitle\":\"1\",\"mega_desc\":\"\",\"mega_cols\":\"1\",\"mega_group\":\"0\",\"mega_width\":\"\",\"mega_colw\":\"\",\"mega_colxw\":\"\",\"mega_class\":\"\",\"mega_subcontent\":\"0\"}',63,64,0,'*',0),(104,'main','COM_FORMMAKER_MENU','com-formmaker-menu','','com-formmaker-menu','index.php?option=com_formmaker','component',0,1,1,10006,0,'0000-00-00 00:00:00',0,1,'components/com_formmaker/images/FormMakerLogo-16.png',0,'',65,78,0,'',1),(105,'main','COM_FORMS_MENU','com-forms-menu','','com-formmaker-menu/com-forms-menu','index.php?option=com_formmaker&task=forms','component',0,104,2,10006,0,'0000-00-00 00:00:00',0,1,'components/com_formmaker/images/FormMakerLogo-16.png',0,'',66,67,0,'',1),(106,'main','COM_SUBMISSIONS_MENU','com-submissions-menu','','com-formmaker-menu/com-submissions-menu','index.php?option=com_formmaker&task=submits','component',0,104,2,10006,0,'0000-00-00 00:00:00',0,1,'components/com_formmaker/images/FormMakerLogo-16.png',0,'',68,69,0,'',1),(107,'main','COM_THEMES_MENU','com-themes-menu','','com-formmaker-menu/com-themes-menu','index.php?option=com_formmaker&task=themes','component',0,104,2,10006,0,'0000-00-00 00:00:00',0,1,'components/com_formmaker/images/FormMakerLogo-16.png',0,'',70,71,0,'',1),(108,'main','COM_BLOCKED_IPS_MENU','com-blocked-ips-menu','','com-formmaker-menu/com-blocked-ips-menu','index.php?option=com_formmaker&task=blocked_ips','component',0,104,2,10006,0,'0000-00-00 00:00:00',0,1,'components/com_formmaker/images/FormMakerLogo-16.png',0,'',72,73,0,'',1),(109,'main','COM_EXTENSIONS_MENU','com-extensions-menu','','com-formmaker-menu/com-extensions-menu','index.php?option=com_formmaker&task=extensions','component',0,104,2,10006,0,'0000-00-00 00:00:00',0,1,'components/com_formmaker/images/FormMakerLogo-16.png',0,'',74,75,0,'',1),(110,'main','COM_FEATURED_PLUGINS_MENU','com-featured-plugins-menu','','com-formmaker-menu/com-featured-plugins-menu','index.php?option=com_formmaker&task=featured_plugins','component',0,104,2,10006,0,'0000-00-00 00:00:00',0,1,'components/com_formmaker/images/FormMakerLogo-16.png',0,'',76,77,0,'',1),(112,'main','BreezingForms','BreezingForms','','breezingforms','index.php?option=com_breezingforms','component',0,1,1,10010,0,'0000-00-00 00:00:00',0,1,'class:component',0,'',81,96,0,'',1),(113,'main','COM_BREEZINGFORMS_MANAGE_RECORDS','Manage Records','','breezingforms/com-breezingforms-manage-records','index.php?option=com_breezingforms&act=managerecs','component',0,112,2,10010,0,'0000-00-00 00:00:00',0,1,'components/com_breezingforms/images/js/ThemeOffice/checkin.png',0,'',82,83,0,'',1),(114,'main','COM_BREEZINGFORMS_MANAGE_FORMS','Manage Forms','','breezingforms/com-breezingforms-manage-forms','index.php?option=com_breezingforms&act=manageforms','component',0,112,2,10010,0,'0000-00-00 00:00:00',0,1,'components/com_breezingforms/images/js/ThemeOffice/content.png',0,'',84,85,0,'',1),(115,'main','COM_BREEZINGFORMS_MANAGE_SCRIPTS','Manage Scripts','','breezingforms/com-breezingforms-manage-scripts','index.php?option=com_breezingforms&act=managescripts','component',0,112,2,10010,0,'0000-00-00 00:00:00',0,1,'components/com_breezingforms/images/js/ThemeOffice/controlpanel.png',0,'',86,87,0,'',1),(116,'main','COM_BREEZINGFORMS_MANAGE_PIECES','Manage Pieces','','breezingforms/com-breezingforms-manage-pieces','index.php?option=com_breezingforms&act=managepieces','component',0,112,2,10010,0,'0000-00-00 00:00:00',0,1,'components/com_breezingforms/images/js/ThemeOffice/controlpanel.png',0,'',88,89,0,'',1),(117,'main','COM_BREEZINGFORMS_INTEGRATOR','Integrator','','breezingforms/com-breezingforms-integrator','index.php?option=com_breezingforms&act=integrate','component',0,112,2,10010,0,'0000-00-00 00:00:00',0,1,'components/com_breezingforms/images/js/ThemeOffice/controlpanel.png',0,'',90,91,0,'',1),(118,'main','COM_BREEZINGFORMS_MANAGE_BACKEND_MENUS','Manage Backend Menus','','breezingforms/com-breezingforms-manage-backend-menus','index.php?option=com_breezingforms&act=managemenus','component',0,112,2,10010,0,'0000-00-00 00:00:00',0,1,'components/com_breezingforms/images/js/ThemeOffice/mainmenu.png',0,'',92,93,0,'',1),(119,'main','COM_BREEZINGFORMS_CONFIGURATION','Configuration','','breezingforms/com-breezingforms-configuration','index.php?option=com_breezingforms&act=configuration','component',0,112,2,10010,0,'0000-00-00 00:00:00',0,1,'components/com_breezingforms/images/js/ThemeOffice/config.png',0,'',94,95,0,'',1),(123,'mainmenu','About','about','','about','index.php?option=com_content&view=article&id=4','component',0,1,1,22,0,'0000-00-00 00:00:00',0,1,'',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0,\"mega_showtitle\":\"1\",\"mega_desc\":\"\",\"mega_cols\":\"1\",\"mega_group\":\"0\",\"mega_width\":\"\",\"mega_colw\":\"\",\"mega_colxw\":\"\",\"mega_class\":\"\",\"mega_subcontent\":\"0\"}',103,104,0,'*',0),(125,'mainmenu','Reposición de Caja Chica','reposicion-de-caja-chica','','cargar-datos/reposicion-de-caja-chica','index.php?option=com_content&view=article&id=6','component',1,102,2,22,0,'0000-00-00 00:00:00',0,1,'',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":\"0\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0,\"mega_showtitle\":\"1\",\"mega_desc\":\"\",\"mega_cols\":\"1\",\"mega_group\":\"0\",\"mega_width\":\"\",\"mega_colw\":\"\",\"mega_colxw\":\"\",\"mega_class\":\"\",\"mega_subcontent\":\"0\"}',50,51,0,'*',0),(126,'mainmenu','Egresos Administrativos','egresos-administrativos','','cargar-datos/egresos-administrativos','index.php?option=com_content&view=article&id=5','component',1,102,2,22,0,'0000-00-00 00:00:00',0,1,'',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0,\"mega_showtitle\":\"1\",\"mega_desc\":\"\",\"mega_cols\":\"1\",\"mega_group\":\"0\",\"mega_width\":\"\",\"mega_colw\":\"\",\"mega_colxw\":\"\",\"mega_class\":\"\",\"mega_subcontent\":\"0\"}',52,53,0,'*',0),(127,'mainmenu','Cheques Devueltos','cheques-devueltos','','cargar-datos/cheques-devueltos','index.php?option=com_content&view=article&id=2','component',1,102,2,22,0,'0000-00-00 00:00:00',0,1,'',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0,\"mega_showtitle\":\"1\",\"mega_desc\":\"\",\"mega_cols\":\"1\",\"mega_group\":\"0\",\"mega_width\":\"\",\"mega_colw\":\"\",\"mega_colxw\":\"\",\"mega_class\":\"\",\"mega_subcontent\":\"0\"}',54,55,0,'*',0),(128,'mainmenu','Supervisión','supervision','','cargar-datos/supervision','index.php?option=com_content&view=article&id=9','component',1,102,2,22,0,'0000-00-00 00:00:00',0,1,'',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":\"0\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0,\"mega_showtitle\":\"1\",\"mega_desc\":\"\",\"mega_cols\":\"1\",\"mega_group\":\"0\",\"mega_width\":\"\",\"mega_colw\":\"\",\"mega_colxw\":\"\",\"mega_class\":\"\",\"mega_subcontent\":\"0\"}',56,57,0,'*',0),(129,'mainmenu','Fianza','fianza','','cargar-datos/fianza','index.php?option=com_content&view=article&id=10','component',1,102,2,22,0,'0000-00-00 00:00:00',0,1,'',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":\"0\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0,\"mega_showtitle\":\"1\",\"mega_desc\":\"\",\"mega_cols\":\"1\",\"mega_group\":\"0\",\"mega_width\":\"\",\"mega_colw\":\"\",\"mega_colxw\":\"\",\"mega_class\":\"\",\"mega_subcontent\":\"0\"}',58,59,0,'*',0),(130,'mainmenu','Pasivos Laborales','pasivos-laborales','','cargar-datos/pasivos-laborales','index.php?option=com_content&view=article&id=12','component',1,102,2,22,0,'0000-00-00 00:00:00',0,1,'',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":\"0\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0,\"mega_showtitle\":\"1\",\"mega_desc\":\"\",\"mega_cols\":\"1\",\"mega_group\":\"0\",\"mega_width\":\"\",\"mega_colw\":\"\",\"mega_colxw\":\"\",\"mega_class\":\"\",\"mega_subcontent\":\"0\"}',60,61,0,'*',0);
/*!40000 ALTER TABLE `mmov_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mmov_menu_types`
--

DROP TABLE IF EXISTS `mmov_menu_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmov_menu_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menutype` varchar(24) NOT NULL,
  `title` varchar(48) NOT NULL,
  `description` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_menutype` (`menutype`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mmov_menu_types`
--

LOCK TABLES `mmov_menu_types` WRITE;
/*!40000 ALTER TABLE `mmov_menu_types` DISABLE KEYS */;
INSERT INTO `mmov_menu_types` VALUES (1,'mainmenu','Main Menu','The main menu for the site');
/*!40000 ALTER TABLE `mmov_menu_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mmov_messages`
--

DROP TABLE IF EXISTS `mmov_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmov_messages` (
  `message_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id_from` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id_to` int(10) unsigned NOT NULL DEFAULT '0',
  `folder_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `date_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `priority` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  PRIMARY KEY (`message_id`),
  KEY `useridto_state` (`user_id_to`,`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mmov_messages`
--

LOCK TABLES `mmov_messages` WRITE;
/*!40000 ALTER TABLE `mmov_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `mmov_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mmov_messages_cfg`
--

DROP TABLE IF EXISTS `mmov_messages_cfg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmov_messages_cfg` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cfg_name` varchar(100) NOT NULL DEFAULT '',
  `cfg_value` varchar(255) NOT NULL DEFAULT '',
  UNIQUE KEY `idx_user_var_name` (`user_id`,`cfg_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mmov_messages_cfg`
--

LOCK TABLES `mmov_messages_cfg` WRITE;
/*!40000 ALTER TABLE `mmov_messages_cfg` DISABLE KEYS */;
/*!40000 ALTER TABLE `mmov_messages_cfg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mmov_modules`
--

DROP TABLE IF EXISTS `mmov_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmov_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `title` varchar(100) NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `position` varchar(50) NOT NULL DEFAULT '',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `module` varchar(50) DEFAULT NULL,
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `showtitle` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `params` text NOT NULL,
  `client_id` tinyint(4) NOT NULL DEFAULT '0',
  `language` char(7) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `published` (`published`,`access`),
  KEY `newsfeeds` (`module`,`published`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mmov_modules`
--

LOCK TABLES `mmov_modules` WRITE;
/*!40000 ALTER TABLE `mmov_modules` DISABLE KEYS */;
INSERT INTO `mmov_modules` VALUES (1,39,'Main Menu','','',1,'toolbar',961,'2015-03-05 15:35:47','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_menu',1,1,'{\"menutype\":\"mainmenu\",\"base\":\"\",\"startLevel\":\"1\",\"endLevel\":\"0\",\"showAllChildren\":\"0\",\"tag_id\":\"\",\"class_sfx\":\"\",\"window_open\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"_menu\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"itemid\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}',0,'*'),(2,40,'Login','','',1,'login',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_login',1,1,'',1,'*'),(3,41,'Popular Articles','','',3,'cpanel',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_popular',3,1,'{\"count\":\"5\",\"catid\":\"\",\"user_id\":\"0\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\",\"automatic_title\":\"1\"}',1,'*'),(4,42,'Recently Added Articles','','',4,'cpanel',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_latest',3,1,'{\"count\":\"5\",\"ordering\":\"c_dsc\",\"catid\":\"\",\"user_id\":\"0\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\",\"automatic_title\":\"1\"}',1,'*'),(8,43,'Toolbar','','',1,'toolbar',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_toolbar',3,1,'',1,'*'),(9,44,'Quick Icons','','',1,'icon',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_quickicon',3,1,'',1,'*'),(10,45,'Logged-in Users','','',2,'cpanel',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_logged',3,1,'{\"count\":\"5\",\"name\":\"1\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\",\"automatic_title\":\"1\"}',1,'*'),(12,46,'Admin Menu','','',1,'menu',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_menu',3,1,'{\"layout\":\"\",\"moduleclass_sfx\":\"\",\"shownew\":\"1\",\"showhelp\":\"1\",\"cache\":\"0\"}',1,'*'),(13,47,'Admin Submenu','','',1,'submenu',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_submenu',3,1,'',1,'*'),(14,48,'User Status','','',2,'status',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_status',3,1,'',1,'*'),(15,49,'Title','','',1,'title',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_title',3,1,'',1,'*'),(16,50,'Login Form','','',1,'user8',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_login',1,1,'{\"pretext\":\"\",\"posttext\":\"\",\"login\":\"\",\"logout\":\"\",\"greeting\":\"1\",\"name\":\"0\",\"usesecure\":\"0\",\"usetext\":\"0\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}',0,'*'),(17,51,'Breadcrumbs','','',1,'position-2',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_breadcrumbs',1,1,'{\"moduleclass_sfx\":\"\",\"showHome\":\"1\",\"homeText\":\"\",\"showComponent\":\"1\",\"separator\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"itemid\"}',0,'*'),(79,52,'Multilanguage status','','',1,'status',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,'mod_multilangstatus',3,1,'{\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\"}',1,'*'),(86,53,'Joomla Version','','',1,'footer',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_version',3,1,'{\"format\":\"short\",\"product\":\"1\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\"}',1,'*'),(87,56,'Form Maker Module','','',0,'',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,'mod_formmaker',1,1,'',0,'*'),(89,60,'BreezingForms','','',0,'',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,'mod_breezingforms',1,1,'',0,'*'),(90,62,'Upload','','',1,'right',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,'mod_simplefileuploadv1.3',1,1,'{\"upload_location\":\"\\/var\\/www\\/html\\/Joomla3\\/uploads\",\"upload_maxsize\":\"100000\",\"upload_capthca\":\"1\",\"upload_capthcacase\":\"0\",\"upload_capthcacasemsg\":\"0\",\"upload_email\":\"\",\"upload_emailmsg\":\"0\",\"upload_emailhtml\":\"1\",\"upload_filetypes\":\"text\\/plain;image\\/gif;image\\/jpeg;image\\/pjpeg;image\\/png;image\\/x-png\",\"upload_blacklist\":\".php .php3 .php4 .php5 .php6 .phtml .pl .py .jsp .asp .htm .html .shtml .sh .cgi .exe .bat .cmd\",\"upload_doubleext\":\"0\",\"upload_phpext\":\"1\",\"upload_gifcomment\":\"1\",\"upload_fileexist\":\"2\",\"upload_multi\":\"0\",\"upload_maxmulti\":\"\",\"upload_startmulti\":\"\",\"upload_useformsfields\":\"0\",\"upload_formfields\":\"Label;Date\",\"upload_formfieldsfile\":\"\",\"upload_formfieldsdiv\":\"|\",\"upload_showdircontent\":\"0\",\"upload_disablegdlib\":\"0\",\"upload_disablegdthreshold\":\"0\",\"upload_username\":\"\",\"upload_password\":\"\",\"upload_jqueryinclude\":\"0\",\"upload_jquery\":\"1\",\"upload_nohtmlencoding\":\"0\",\"upload_replacetag\":\"0\",\"upload_unzip\":\"0\",\"upload_mailfrom\":\"noreply@simplefileupload.com\",\"upload_redirect\":\"\",\"upload_stdbrowse\":\"0\",\"upload_filewidth\":\"12\",\"upload_capthcaheight\":\"40\",\"upload_capthcawidth\":\"120\",\"upload_capthcabg\":\"120-192\",\"upload_bgcolor\":\"#e8edf1\",\"upload_popshowpath\":\"0\",\"upload_popcaptchamsg\":\"1\",\"upload_popshowbytes\":\"0\",\"upload_showerrmsg\":\"1\",\"upload_maximgwidth\":\"\",\"upload_maximgheight\":\"\",\"upload_compressimg\":\"\",\"upload_thumbcreate\":\"0\",\"upload_thumbsize\":\"40x40\",\"upload_thumbname\":\"sfuthumb\",\"sfu_autorefreshsfl\":\"0\",\"moduleclass_sfx\":\"\",\"upload_debug\":\"0\",\"upload_usernameddir\":\"0\",\"upload_usernameddirdefault\":\"0\",\"upload_userlocation\":\".\\/users\\/\",\"upload_createdir\":\"0\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}',0,'*');
/*!40000 ALTER TABLE `mmov_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mmov_modules_menu`
--

DROP TABLE IF EXISTS `mmov_modules_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmov_modules_menu` (
  `moduleid` int(11) NOT NULL DEFAULT '0',
  `menuid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`moduleid`,`menuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mmov_modules_menu`
--

LOCK TABLES `mmov_modules_menu` WRITE;
/*!40000 ALTER TABLE `mmov_modules_menu` DISABLE KEYS */;
INSERT INTO `mmov_modules_menu` VALUES (1,0),(2,0),(3,0),(4,0),(6,0),(7,0),(8,0),(9,0),(10,0),(12,0),(13,0),(14,0),(15,0),(16,0),(17,0),(79,0),(86,0),(88,102),(88,111),(88,120),(88,121),(88,124),(90,103);
/*!40000 ALTER TABLE `mmov_modules_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mmov_newsfeeds`
--

DROP TABLE IF EXISTS `mmov_newsfeeds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmov_newsfeeds` (
  `catid` int(11) NOT NULL DEFAULT '0',
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `link` varchar(200) NOT NULL DEFAULT '',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `numarticles` int(10) unsigned NOT NULL DEFAULT '1',
  `cache_time` int(10) unsigned NOT NULL DEFAULT '3600',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `rtl` tinyint(4) NOT NULL DEFAULT '0',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `language` char(7) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `metadata` text NOT NULL,
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `description` text NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `images` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`published`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mmov_newsfeeds`
--

LOCK TABLES `mmov_newsfeeds` WRITE;
/*!40000 ALTER TABLE `mmov_newsfeeds` DISABLE KEYS */;
/*!40000 ALTER TABLE `mmov_newsfeeds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mmov_overrider`
--

DROP TABLE IF EXISTS `mmov_overrider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmov_overrider` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `constant` varchar(255) NOT NULL,
  `string` text NOT NULL,
  `file` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mmov_overrider`
--

LOCK TABLES `mmov_overrider` WRITE;
/*!40000 ALTER TABLE `mmov_overrider` DISABLE KEYS */;
/*!40000 ALTER TABLE `mmov_overrider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mmov_postinstall_messages`
--

DROP TABLE IF EXISTS `mmov_postinstall_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmov_postinstall_messages` (
  `postinstall_message_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `extension_id` bigint(20) NOT NULL DEFAULT '700' COMMENT 'FK to #__extensions',
  `title_key` varchar(255) NOT NULL DEFAULT '' COMMENT 'Lang key for the title',
  `description_key` varchar(255) NOT NULL DEFAULT '' COMMENT 'Lang key for description',
  `action_key` varchar(255) NOT NULL DEFAULT '',
  `language_extension` varchar(255) NOT NULL DEFAULT 'com_postinstall' COMMENT 'Extension holding lang keys',
  `language_client_id` tinyint(3) NOT NULL DEFAULT '1',
  `type` varchar(10) NOT NULL DEFAULT 'link' COMMENT 'Message type - message, link, action',
  `action_file` varchar(255) DEFAULT '' COMMENT 'RAD URI to the PHP file containing action method',
  `action` varchar(255) DEFAULT '' COMMENT 'Action method name or URL',
  `condition_file` varchar(255) DEFAULT NULL COMMENT 'RAD URI to file holding display condition method',
  `condition_method` varchar(255) DEFAULT NULL COMMENT 'Display condition method, must return boolean',
  `version_introduced` varchar(50) NOT NULL DEFAULT '3.2.0' COMMENT 'Version when this message was introduced',
  `enabled` tinyint(3) NOT NULL DEFAULT '1',
  PRIMARY KEY (`postinstall_message_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mmov_postinstall_messages`
--

LOCK TABLES `mmov_postinstall_messages` WRITE;
/*!40000 ALTER TABLE `mmov_postinstall_messages` DISABLE KEYS */;
INSERT INTO `mmov_postinstall_messages` VALUES (1,700,'PLG_TWOFACTORAUTH_TOTP_POSTINSTALL_TITLE','PLG_TWOFACTORAUTH_TOTP_POSTINSTALL_BODY','PLG_TWOFACTORAUTH_TOTP_POSTINSTALL_ACTION','plg_twofactorauth_totp',1,'action','site://plugins/twofactorauth/totp/postinstall/actions.php','twofactorauth_postinstall_action','site://plugins/twofactorauth/totp/postinstall/actions.php','twofactorauth_postinstall_condition','3.2.0',0),(2,700,'COM_CPANEL_MSG_EACCELERATOR_TITLE','COM_CPANEL_MSG_EACCELERATOR_BODY','COM_CPANEL_MSG_EACCELERATOR_BUTTON','com_cpanel',1,'action','admin://components/com_admin/postinstall/eaccelerator.php','admin_postinstall_eaccelerator_action','admin://components/com_admin/postinstall/eaccelerator.php','admin_postinstall_eaccelerator_condition','3.2.0',1),(3,700,'COM_CPANEL_WELCOME_BEGINNERS_TITLE','COM_CPANEL_WELCOME_BEGINNERS_MESSAGE','','com_cpanel',1,'message','','','','','3.2.0',0),(4,700,'COM_CPANEL_MSG_PHPVERSION_TITLE','COM_CPANEL_MSG_PHPVERSION_BODY','','com_cpanel',1,'message','','','admin://components/com_admin/postinstall/phpversion.php','admin_postinstall_phpversion_condition','3.2.2',1),(5,700,'COM_CPANEL_MSG_HTACCESS_TITLE','COM_CPANEL_MSG_HTACCESS_BODY','','com_cpanel',1,'message','','','admin://components/com_admin/postinstall/htaccess.php','admin_postinstall_htaccess_condition','3.4.0',1),(6,700,'COM_CPANEL_MSG_ROBOTS_TITLE','COM_CPANEL_MSG_ROBOTS_BODY','','com_cpanel',1,'message','','','','','3.3.0',1);
/*!40000 ALTER TABLE `mmov_postinstall_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mmov_redirect_links`
--

DROP TABLE IF EXISTS `mmov_redirect_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmov_redirect_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `old_url` varchar(255) NOT NULL,
  `new_url` varchar(255) DEFAULT NULL,
  `referer` varchar(150) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(4) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `header` smallint(3) NOT NULL DEFAULT '301',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_link_old` (`old_url`),
  KEY `idx_link_modifed` (`modified_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mmov_redirect_links`
--

LOCK TABLES `mmov_redirect_links` WRITE;
/*!40000 ALTER TABLE `mmov_redirect_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `mmov_redirect_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mmov_schemas`
--

DROP TABLE IF EXISTS `mmov_schemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmov_schemas` (
  `extension_id` int(11) NOT NULL,
  `version_id` varchar(20) NOT NULL,
  PRIMARY KEY (`extension_id`,`version_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mmov_schemas`
--

LOCK TABLES `mmov_schemas` WRITE;
/*!40000 ALTER TABLE `mmov_schemas` DISABLE KEYS */;
INSERT INTO `mmov_schemas` VALUES (700,'3.4.0-2015-01-21');
/*!40000 ALTER TABLE `mmov_schemas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mmov_session`
--

DROP TABLE IF EXISTS `mmov_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmov_session` (
  `session_id` varchar(200) NOT NULL DEFAULT '',
  `client_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `guest` tinyint(4) unsigned DEFAULT '1',
  `time` varchar(14) DEFAULT '',
  `data` mediumtext,
  `userid` int(11) DEFAULT '0',
  `username` varchar(150) DEFAULT '',
  PRIMARY KEY (`session_id`),
  KEY `userid` (`userid`),
  KEY `time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mmov_session`
--

LOCK TABLES `mmov_session` WRITE;
/*!40000 ALTER TABLE `mmov_session` DISABLE KEYS */;
INSERT INTO `mmov_session` VALUES ('iqpjajh33pceoickipt5n4c352',0,0,'1425657555','__default|a:8:{s:15:\"session.counter\";i:199;s:19:\"session.timer.start\";i:1425647346;s:18:\"session.timer.last\";i:1425657554;s:17:\"session.timer.now\";i:1425657555;s:22:\"session.client.browser\";s:102:\"Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36\";s:8:\"registry\";O:24:\"Joomla\\Registry\\Registry\":1:{s:7:\"\\0\\0\\0data\";O:8:\"stdClass\":1:{s:5:\"users\";O:8:\"stdClass\":1:{s:5:\"login\";O:8:\"stdClass\":1:{s:4:\"form\";O:8:\"stdClass\":2:{s:6:\"return\";s:20:\"index.php?Itemid=101\";s:4:\"data\";a:0:{}}}}}}s:4:\"user\";O:5:\"JUser\":28:{s:9:\"\\0\\0\\0isRoot\";b:0;s:2:\"id\";s:3:\"962\";s:4:\"name\";s:9:\"Visitante\";s:8:\"username\";s:9:\"visitante\";s:5:\"email\";s:25:\"henry.martinezd@gmail.com\";s:8:\"password\";s:60:\"$2y$10$/2YwioSh6uy4zuHOlYUvG.3.SOdXYxVZshcUWnpKz0AUa9vzfc6L.\";s:14:\"password_clear\";s:0:\"\";s:5:\"block\";s:1:\"0\";s:9:\"sendEmail\";s:1:\"1\";s:12:\"registerDate\";s:19:\"2015-01-19 15:46:23\";s:13:\"lastvisitDate\";s:19:\"2015-03-05 21:08:06\";s:10:\"activation\";s:0:\"\";s:6:\"params\";s:92:\"{\"admin_style\":\"\",\"admin_language\":\"\",\"language\":\"\",\"editor\":\"\",\"helpsite\":\"\",\"timezone\":\"\"}\";s:6:\"groups\";a:2:{i:1;s:1:\"1\";i:2;s:1:\"2\";}s:5:\"guest\";i:0;s:13:\"lastResetTime\";s:19:\"0000-00-00 00:00:00\";s:10:\"resetCount\";s:1:\"0\";s:12:\"requireReset\";s:1:\"0\";s:10:\"\\0\\0\\0_params\";O:24:\"Joomla\\Registry\\Registry\":1:{s:7:\"\\0\\0\\0data\";O:8:\"stdClass\":6:{s:11:\"admin_style\";s:0:\"\";s:14:\"admin_language\";s:0:\"\";s:8:\"language\";s:0:\"\";s:6:\"editor\";s:0:\"\";s:8:\"helpsite\";s:0:\"\";s:8:\"timezone\";s:0:\"\";}}s:14:\"\\0\\0\\0_authGroups\";a:2:{i:0;i:1;i:2;i:2;}s:14:\"\\0\\0\\0_authLevels\";a:3:{i:0;i:1;i:1;i:1;i:2;i:2;}s:15:\"\\0\\0\\0_authActions\";N;s:12:\"\\0\\0\\0_errorMsg\";N;s:13:\"\\0\\0\\0userHelper\";O:18:\"JUserWrapperHelper\":0:{}s:10:\"\\0\\0\\0_errors\";a:0:{}s:3:\"aid\";i:0;s:6:\"otpKey\";s:0:\"\";s:4:\"otep\";s:0:\"\";}s:13:\"session.token\";s:32:\"b803566bacb7514cc3fd44a1941152b9\";}',962,'visitante'),('m7deil9pe2niuku3tcbso4hg15',1,0,'1425657546','__default|a:8:{s:15:\"session.counter\";i:139;s:19:\"session.timer.start\";i:1425647559;s:18:\"session.timer.last\";i:1425656704;s:17:\"session.timer.now\";i:1425657546;s:22:\"session.client.browser\";s:102:\"Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36\";s:8:\"registry\";O:24:\"Joomla\\Registry\\Registry\":1:{s:7:\"\\0\\0\\0data\";O:8:\"stdClass\":3:{s:11:\"application\";O:8:\"stdClass\":1:{s:4:\"lang\";s:0:\"\";}s:13:\"com_installer\";O:8:\"stdClass\":2:{s:7:\"message\";s:0:\"\";s:17:\"extension_message\";s:0:\"\";}s:11:\"com_content\";O:8:\"stdClass\":1:{s:4:\"edit\";O:8:\"stdClass\":1:{s:7:\"article\";O:8:\"stdClass\":2:{s:2:\"id\";a:1:{i:0;i:5;}s:4:\"data\";N;}}}}}s:4:\"user\";O:5:\"JUser\":28:{s:9:\"\\0\\0\\0isRoot\";b:1;s:2:\"id\";s:3:\"961\";s:4:\"name\";s:10:\"Super User\";s:8:\"username\";s:7:\"estelio\";s:5:\"email\";s:26:\"henry.martinez@estelio.com\";s:8:\"password\";s:60:\"$2y$10$VCW07acpN.x6mHmvPsDxheOo5TAyGhqBr7DnUixq9q581TiYArfi.\";s:14:\"password_clear\";s:0:\"\";s:5:\"block\";s:1:\"0\";s:9:\"sendEmail\";s:1:\"1\";s:12:\"registerDate\";s:19:\"2015-01-16 21:31:45\";s:13:\"lastvisitDate\";s:19:\"2015-03-05 21:43:36\";s:10:\"activation\";s:1:\"0\";s:6:\"params\";s:0:\"\";s:6:\"groups\";a:1:{i:8;s:1:\"8\";}s:5:\"guest\";i:0;s:13:\"lastResetTime\";s:19:\"0000-00-00 00:00:00\";s:10:\"resetCount\";s:1:\"0\";s:12:\"requireReset\";s:1:\"0\";s:10:\"\\0\\0\\0_params\";O:24:\"Joomla\\Registry\\Registry\":1:{s:7:\"\\0\\0\\0data\";O:8:\"stdClass\":0:{}}s:14:\"\\0\\0\\0_authGroups\";a:2:{i:0;i:1;i:1;i:8;}s:14:\"\\0\\0\\0_authLevels\";a:5:{i:0;i:1;i:1;i:1;i:2;i:2;i:3;i:3;i:4;i:6;}s:15:\"\\0\\0\\0_authActions\";N;s:12:\"\\0\\0\\0_errorMsg\";N;s:13:\"\\0\\0\\0userHelper\";O:18:\"JUserWrapperHelper\":0:{}s:10:\"\\0\\0\\0_errors\";a:0:{}s:3:\"aid\";i:0;s:6:\"otpKey\";s:0:\"\";s:4:\"otep\";s:0:\"\";}s:13:\"session.token\";s:32:\"8715ee9e6cf6f69f1c62789e40c6ec3e\";}',961,'estelio');
/*!40000 ALTER TABLE `mmov_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mmov_tags`
--

DROP TABLE IF EXISTS `mmov_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmov_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `lft` int(11) NOT NULL DEFAULT '0',
  `rgt` int(11) NOT NULL DEFAULT '0',
  `level` int(10) unsigned NOT NULL DEFAULT '0',
  `path` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `description` mediumtext NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `metadesc` varchar(1024) NOT NULL COMMENT 'The meta description for the page.',
  `metakey` varchar(1024) NOT NULL COMMENT 'The meta keywords for the page.',
  `metadata` varchar(2048) NOT NULL COMMENT 'JSON encoded metadata properties.',
  `created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `images` text NOT NULL,
  `urls` text NOT NULL,
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `language` char(7) NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `tag_idx` (`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_path` (`path`),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mmov_tags`
--

LOCK TABLES `mmov_tags` WRITE;
/*!40000 ALTER TABLE `mmov_tags` DISABLE KEYS */;
INSERT INTO `mmov_tags` VALUES (1,0,0,1,0,'','ROOT','root','','',1,0,'0000-00-00 00:00:00',1,'','','','',0,'2011-01-01 00:00:01','',0,'0000-00-00 00:00:00','','',0,'*',1,'0000-00-00 00:00:00','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `mmov_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mmov_template_styles`
--

DROP TABLE IF EXISTS `mmov_template_styles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmov_template_styles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `template` varchar(50) NOT NULL DEFAULT '',
  `client_id` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `home` char(7) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_template` (`template`),
  KEY `idx_home` (`home`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mmov_template_styles`
--

LOCK TABLES `mmov_template_styles` WRITE;
/*!40000 ALTER TABLE `mmov_template_styles` DISABLE KEYS */;
INSERT INTO `mmov_template_styles` VALUES (4,'beez3',0,'0','Beez3 - Default','{\"wrapperSmall\":53,\"wrapperLarge\":72,\"logo\":\"images\\/joomla_black.gif\",\"sitetitle\":\"Joomla!\",\"sitedescription\":\"Open Source Content Management\",\"navposition\":\"left\",\"bootstrap\":\"\",\"templatecolor\":\"personal\",\"headerImage\":\"\",\"backgroundcolor\":\"#eeeeee\"}'),(5,'hathor',1,'0','Hathor - Default','{\"showSiteName\":\"0\",\"colourChoice\":\"\",\"boldText\":\"0\"}'),(7,'protostar',0,'0','protostar - Default','{\"templateColor\":\"#0088cc\",\"templateBackgroundColor\":\"#f4f6f7\",\"logoFile\":\"\",\"sitetitle\":\"\",\"sitedescription\":\"\",\"googleFont\":\"1\",\"googleFontName\":\"Open+Sans\",\"fluidContainer\":\"0\"}'),(8,'isis',1,'1','isis - Default','{\"templateColor\":\"\",\"logoFile\":\"\"}'),(9,'travelagent',0,'0','TravelAgent - Predeterminado','{\"logo\":\"templates\\/travelagent\\/images\\/logo.png\",\"responsive\":\"yes\",\"fontfamily\":\"fontfamily2\",\"centerposition\":\"centerleft\",\"expand\":\"true\",\"showheader\":\"yes\",\"bannerwidth\":\"fix\",\"copyright\":\"Estelio S.A\",\"jqueryactive\":\"yes\",\"unsetjoomjs\":\"yes\",\"unsetbootstrap\":\"yes\"}'),(10,'joom',0,'0','joom - Predeterminado','{\"config\":\"\"}'),(11,'ext_auto',0,'1','ext_auto - Predeterminado','{}'),(12,'lt_industrial_onepage',0,'0','lt_industrial_onepage - Predeterminado','{\"layout_width\":\"1170\",\"layout_type\":\"responsive\",\"logo_type\":\"image\",\"logo_position\":\"logo\",\"logo_type_text\":\"LT Industrial \",\"logo_type_slogan\":\"Joomla! Industrial template\",\"logo_width\":\"115\",\"logo_height\":\"70\",\"preset\":\"preset1\",\"preset1_title\":\"#333333\",\"preset1_bg\":\"#ffffff\",\"preset1_text\":\"#666666\",\"preset1_link\":\"#0db3c7\",\"preset2_title\":\"#333333\",\"preset2_bg\":\"#ffffff\",\"preset2_text\":\"#444444\",\"preset2_link\":\"#f7ca18\",\"preset3_title\":\"#333333\",\"preset3_bg\":\"#ffffff\",\"preset3_text\":\"#666666\",\"preset3_link\":\"#20c55a\",\"preset4_title\":\"#333333\",\"preset4_bg\":\"#ffffff\",\"preset4_text\":\"#666666\",\"preset4_link\":\"#304559\",\"preset5_title\":\"#333333\",\"preset5_bg\":\"#ffffff\",\"preset5_text\":\"#666666\",\"preset5_link\":\"#ef4836\",\"preset6_title\":\"#333333\",\"preset6_bg\":\"#ffffff\",\"preset6_text\":\"#666666\",\"preset6_link\":\"#913D88\",\"menu\":\"mainmenu\",\"menutype\":\"mega\",\"menu_col_width\":\"200\",\"show_menu_image\":\"1\",\"menu_image_position\":\"1\",\"submenu_position\":\"0\",\"init_x\":\"0\",\"init_y\":\"0\",\"sub_x\":\"0\",\"sub_y\":\"0\",\"body_font\":\"Raleway\",\"header_font\":\"Raleway\",\"header_selectors\":\"\",\"other_font\":\"\",\"cache_time\":\"60\",\"compress_css\":\"0\",\"compress_js\":\"0\",\"enable_ga\":\"0\",\"ga_code\":\"\",\"loadjquery\":\"0\",\"loadfromcdn\":\"0\",\"hide_component_area\":\"0\"}');
/*!40000 ALTER TABLE `mmov_template_styles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mmov_ucm_base`
--

DROP TABLE IF EXISTS `mmov_ucm_base`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmov_ucm_base` (
  `ucm_id` int(10) unsigned NOT NULL,
  `ucm_item_id` int(10) NOT NULL,
  `ucm_type_id` int(11) NOT NULL,
  `ucm_language_id` int(11) NOT NULL,
  PRIMARY KEY (`ucm_id`),
  KEY `idx_ucm_item_id` (`ucm_item_id`),
  KEY `idx_ucm_type_id` (`ucm_type_id`),
  KEY `idx_ucm_language_id` (`ucm_language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mmov_ucm_base`
--

LOCK TABLES `mmov_ucm_base` WRITE;
/*!40000 ALTER TABLE `mmov_ucm_base` DISABLE KEYS */;
/*!40000 ALTER TABLE `mmov_ucm_base` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mmov_ucm_content`
--

DROP TABLE IF EXISTS `mmov_ucm_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmov_ucm_content` (
  `core_content_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `core_type_alias` varchar(255) NOT NULL DEFAULT '' COMMENT 'FK to the content types table',
  `core_title` varchar(255) NOT NULL,
  `core_alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `core_body` mediumtext NOT NULL,
  `core_state` tinyint(1) NOT NULL DEFAULT '0',
  `core_checked_out_time` varchar(255) NOT NULL DEFAULT '',
  `core_checked_out_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `core_access` int(10) unsigned NOT NULL DEFAULT '0',
  `core_params` text NOT NULL,
  `core_featured` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `core_metadata` varchar(2048) NOT NULL COMMENT 'JSON encoded metadata properties.',
  `core_created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `core_created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `core_created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `core_modified_user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Most recent user that modified',
  `core_modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `core_language` char(7) NOT NULL,
  `core_publish_up` datetime NOT NULL,
  `core_publish_down` datetime NOT NULL,
  `core_content_item_id` int(10) unsigned DEFAULT NULL COMMENT 'ID from the individual type table',
  `asset_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to the #__assets table.',
  `core_images` text NOT NULL,
  `core_urls` text NOT NULL,
  `core_hits` int(10) unsigned NOT NULL DEFAULT '0',
  `core_version` int(10) unsigned NOT NULL DEFAULT '1',
  `core_ordering` int(11) NOT NULL DEFAULT '0',
  `core_metakey` text NOT NULL,
  `core_metadesc` text NOT NULL,
  `core_catid` int(10) unsigned NOT NULL DEFAULT '0',
  `core_xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `core_type_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`core_content_id`),
  KEY `tag_idx` (`core_state`,`core_access`),
  KEY `idx_access` (`core_access`),
  KEY `idx_alias` (`core_alias`),
  KEY `idx_language` (`core_language`),
  KEY `idx_title` (`core_title`),
  KEY `idx_modified_time` (`core_modified_time`),
  KEY `idx_created_time` (`core_created_time`),
  KEY `idx_content_type` (`core_type_alias`),
  KEY `idx_core_modified_user_id` (`core_modified_user_id`),
  KEY `idx_core_checked_out_user_id` (`core_checked_out_user_id`),
  KEY `idx_core_created_user_id` (`core_created_user_id`),
  KEY `idx_core_type_id` (`core_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Contains core content data in name spaced fields';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mmov_ucm_content`
--

LOCK TABLES `mmov_ucm_content` WRITE;
/*!40000 ALTER TABLE `mmov_ucm_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `mmov_ucm_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mmov_ucm_history`
--

DROP TABLE IF EXISTS `mmov_ucm_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmov_ucm_history` (
  `version_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ucm_item_id` int(10) unsigned NOT NULL,
  `ucm_type_id` int(10) unsigned NOT NULL,
  `version_note` varchar(255) NOT NULL DEFAULT '' COMMENT 'Optional version name',
  `save_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `editor_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `character_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Number of characters in this version.',
  `sha1_hash` varchar(50) NOT NULL DEFAULT '' COMMENT 'SHA1 hash of the version_data column.',
  `version_data` mediumtext NOT NULL COMMENT 'json-encoded string of version data',
  `keep_forever` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0=auto delete; 1=keep',
  PRIMARY KEY (`version_id`),
  KEY `idx_ucm_item_id` (`ucm_type_id`,`ucm_item_id`),
  KEY `idx_save_date` (`save_date`)
) ENGINE=InnoDB AUTO_INCREMENT=348 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mmov_ucm_history`
--

LOCK TABLES `mmov_ucm_history` WRITE;
/*!40000 ALTER TABLE `mmov_ucm_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `mmov_ucm_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mmov_update_sites`
--

DROP TABLE IF EXISTS `mmov_update_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmov_update_sites` (
  `update_site_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT '',
  `type` varchar(20) DEFAULT '',
  `location` text NOT NULL,
  `enabled` int(11) DEFAULT '0',
  `last_check_timestamp` bigint(20) DEFAULT '0',
  `extra_query` varchar(1000) DEFAULT '',
  PRIMARY KEY (`update_site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='Update Sites';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mmov_update_sites`
--

LOCK TABLES `mmov_update_sites` WRITE;
/*!40000 ALTER TABLE `mmov_update_sites` DISABLE KEYS */;
INSERT INTO `mmov_update_sites` VALUES (1,'Joomla! Core','collection','http://update.joomla.org/core/list.xml',1,1425647576,''),(2,'Joomla! Extension Directory','collection','http://update.joomla.org/jed/list.xml',1,1425647576,''),(3,'Accredited Joomla! Translations','collection','http://update.joomla.org/language/translationlist_3.xml',1,1425647574,''),(4,'Joomla! Update Component Update Site','extension','http://update.joomla.org/core/extensions/com_joomlaupdate.xml',1,1425647574,''),(5,'WebInstaller Update Site','extension','http://appscdn.joomla.org/webapps/jedapps/webinstaller.xml',0,0,''),(6,'','collection','http://update.joomlart.com/service/tracking/list.xml',1,1425647574,''),(7,'System - Helix Framework','extension','http://www.joomshaper.com/updates/plg_system_helix.xml',1,1425647574,''),(8,'NoNumber Sourcerer','extension','http://download.nonumber.nl/updates.php?e=sourcerer&type=.zip',1,1425647574,''),(9,'Weblinks Update Site','extension','https://raw.githubusercontent.com/joomla-extensions/weblinks/master/manifest.xml',1,1425647574,''),(10,'eorisis: jQuery','extension','http://eorisis.com/updates/eorisis-jquery/extension.xml',1,1425647574,'');
/*!40000 ALTER TABLE `mmov_update_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mmov_update_sites_extensions`
--

DROP TABLE IF EXISTS `mmov_update_sites_extensions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmov_update_sites_extensions` (
  `update_site_id` int(11) NOT NULL DEFAULT '0',
  `extension_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`update_site_id`,`extension_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Links extensions to update sites';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mmov_update_sites_extensions`
--

LOCK TABLES `mmov_update_sites_extensions` WRITE;
/*!40000 ALTER TABLE `mmov_update_sites_extensions` DISABLE KEYS */;
INSERT INTO `mmov_update_sites_extensions` VALUES (1,700),(2,700),(3,600),(3,10002),(4,28),(5,10008),(6,10015),(7,10020),(9,801),(10,10024);
/*!40000 ALTER TABLE `mmov_update_sites_extensions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mmov_updates`
--

DROP TABLE IF EXISTS `mmov_updates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmov_updates` (
  `update_id` int(11) NOT NULL AUTO_INCREMENT,
  `update_site_id` int(11) DEFAULT '0',
  `extension_id` int(11) DEFAULT '0',
  `name` varchar(100) DEFAULT '',
  `description` text NOT NULL,
  `element` varchar(100) DEFAULT '',
  `type` varchar(20) DEFAULT '',
  `folder` varchar(20) DEFAULT '',
  `client_id` tinyint(3) DEFAULT '0',
  `version` varchar(32) DEFAULT '',
  `data` text NOT NULL,
  `detailsurl` text NOT NULL,
  `infourl` text NOT NULL,
  `extra_query` varchar(1000) DEFAULT '',
  PRIMARY KEY (`update_id`)
) ENGINE=InnoDB AUTO_INCREMENT=284 DEFAULT CHARSET=utf8 COMMENT='Available Updates';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mmov_updates`
--

LOCK TABLES `mmov_updates` WRITE;
/*!40000 ALTER TABLE `mmov_updates` DISABLE KEYS */;
INSERT INTO `mmov_updates` VALUES (1,3,0,'Dutch','','pkg_nl-NL','package','',0,'3.4.0.1','','http://update.joomla.org/language/details3/nl-NL_details.xml','',''),(2,3,0,'Estonian','','pkg_et-EE','package','',0,'3.3.4.1','','http://update.joomla.org/language/details3/et-EE_details.xml','',''),(3,3,0,'Italian','','pkg_it-IT','package','',0,'3.4.0.1','','http://update.joomla.org/language/details3/it-IT_details.xml','',''),(4,3,0,'Korean','','pkg_ko-KR','package','',0,'3.4.0.1','','http://update.joomla.org/language/details3/ko-KR_details.xml','',''),(5,3,0,'Latvian','','pkg_lv-LV','package','',0,'3.3.6.1','','http://update.joomla.org/language/details3/lv-LV_details.xml','',''),(6,3,0,'Macedonian','','pkg_mk-MK','package','',0,'3.4.0.1','','http://update.joomla.org/language/details3/mk-MK_details.xml','',''),(7,3,0,'Norwegian Bokmal','','pkg_nb-NO','package','',0,'3.2.2.1','','http://update.joomla.org/language/details3/nb-NO_details.xml','',''),(8,3,0,'Persian','','pkg_fa-IR','package','',0,'3.3.6.1','','http://update.joomla.org/language/details3/fa-IR_details.xml','',''),(9,3,0,'Polish','','pkg_pl-PL','package','',0,'3.3.4.1','','http://update.joomla.org/language/details3/pl-PL_details.xml','',''),(10,3,0,'Portuguese','','pkg_pt-PT','package','',0,'3.3.3.1','','http://update.joomla.org/language/details3/pt-PT_details.xml','',''),(11,3,0,'Russian','','pkg_ru-RU','package','',0,'3.3.6.2','','http://update.joomla.org/language/details3/ru-RU_details.xml','',''),(12,3,0,'Slovak','','pkg_sk-SK','package','',0,'3.4.0.1','','http://update.joomla.org/language/details3/sk-SK_details.xml','',''),(13,3,0,'Swedish','','pkg_sv-SE','package','',0,'3.4.0.1','','http://update.joomla.org/language/details3/sv-SE_details.xml','',''),(14,3,0,'Syriac','','pkg_sy-IQ','package','',0,'3.4.0.1','','http://update.joomla.org/language/details3/sy-IQ_details.xml','',''),(15,3,0,'Tamil','','pkg_ta-IN','package','',0,'3.4.0.2','','http://update.joomla.org/language/details3/ta-IN_details.xml','',''),(16,3,0,'Thai','','pkg_th-TH','package','',0,'3.4.0.2','','http://update.joomla.org/language/details3/th-TH_details.xml','',''),(17,3,0,'Turkish','','pkg_tr-TR','package','',0,'3.4.0.1','','http://update.joomla.org/language/details3/tr-TR_details.xml','',''),(18,3,0,'Ukrainian','','pkg_uk-UA','package','',0,'3.3.3.15','','http://update.joomla.org/language/details3/uk-UA_details.xml','',''),(19,3,0,'Uyghur','','pkg_ug-CN','package','',0,'3.3.0.1','','http://update.joomla.org/language/details3/ug-CN_details.xml','',''),(20,3,0,'Albanian','','pkg_sq-AL','package','',0,'3.1.1.1','','http://update.joomla.org/language/details3/sq-AL_details.xml','',''),(21,3,0,'Hindi','','pkg_hi-IN','package','',0,'3.3.6.1','','http://update.joomla.org/language/details3/hi-IN_details.xml','',''),(22,3,0,'Portuguese Brazil','','pkg_pt-BR','package','',0,'3.4.0.3','','http://update.joomla.org/language/details3/pt-BR_details.xml','',''),(23,3,0,'Serbian Latin','','pkg_sr-YU','package','',0,'3.4.0.1','','http://update.joomla.org/language/details3/sr-YU_details.xml','',''),(24,3,0,'Bosnian','','pkg_bs-BA','package','',0,'3.3.6.1','','http://update.joomla.org/language/details3/bs-BA_details.xml','',''),(25,3,0,'Serbian Cyrillic','','pkg_sr-RS','package','',0,'3.4.0.1','','http://update.joomla.org/language/details3/sr-RS_details.xml','',''),(26,3,0,'Vietnamese','','pkg_vi-VN','package','',0,'3.2.1.1','','http://update.joomla.org/language/details3/vi-VN_details.xml','',''),(27,3,0,'Bahasa Indonesia','','pkg_id-ID','package','',0,'3.3.0.2','','http://update.joomla.org/language/details3/id-ID_details.xml','',''),(28,3,0,'Finnish','','pkg_fi-FI','package','',0,'3.4.0.1','','http://update.joomla.org/language/details3/fi-FI_details.xml','',''),(29,3,0,'Swahili','','pkg_sw-KE','package','',0,'3.4.0.2','','http://update.joomla.org/language/details3/sw-KE_details.xml','',''),(30,3,0,'Montenegrin','','pkg_srp-ME','package','',0,'3.3.1.1','','http://update.joomla.org/language/details3/srp-ME_details.xml','',''),(31,3,0,'EnglishCA','','pkg_en-CA','package','',0,'3.3.6.1','','http://update.joomla.org/language/details3/en-CA_details.xml','',''),(32,3,0,'FrenchCA','','pkg_fr-CA','package','',0,'3.3.6.1','','http://update.joomla.org/language/details3/fr-CA_details.xml','',''),(33,3,0,'Welsh','','pkg_cy-GB','package','',0,'3.3.0.1','','http://update.joomla.org/language/details3/cy-GB_details.xml','',''),(34,3,0,'Sinhala','','pkg_si-LK','package','',0,'3.3.1.1','','http://update.joomla.org/language/details3/si-LK_details.xml','',''),(35,6,0,'JA Amazon S3 for joomla 16','','com_com_jaamazons3','file','',0,'1.0.0','','http://update.joomlart.com/service/tracking/j16/com_com_jaamazons3.xml','',''),(36,6,0,'JA Extenstion Manager Component j16','','com_com_jaextmanager','file','',0,'1.0.1','','http://update.joomlart.com/service/tracking/j16/com_com_jaextmanager.xml','',''),(37,6,0,'JA Amazon S3 for joomla 2.5 & 3.x','','com_jaamazons3','component','',1,'2.5.6','','http://update.joomlart.com/service/tracking/j16/com_jaamazons3.xml','',''),(38,6,0,'JA Comment Package for Joomla 2.5 & 3.3','','com_jacomment','component','',1,'2.5.4','','http://update.joomlart.com/service/tracking/j16/com_jacomment.xml','',''),(39,6,0,'JA Extenstion Manager Component for J25 & J3','','com_jaextmanager','component','',1,'2.6.0','','http://update.joomlart.com/service/tracking/j16/com_jaextmanager.xml','',''),(40,6,0,'JA Google Storage Package for J2.5 & J3.0','','com_jagooglestorage','component','',1,'1.0.0','','http://update.joomlart.com/service/tracking/j16/com_jagooglestorage.xml','',''),(41,6,0,'JA Job Board Package For J25','','com_jajobboard','component','',1,'1.0.6','','http://update.joomlart.com/service/tracking/j16/com_jajobboard.xml','',''),(42,6,0,'JA K2 Filter Package for J25 & J3.3','','com_jak2filter','component','',1,'1.1.8','','http://update.joomlart.com/service/tracking/j16/com_jak2filter.xml','',''),(43,6,0,'JA K2 Filter Package for J25 & J30','','com_jak2fiter','component','',1,'1.0.4','','http://update.joomlart.com/service/tracking/j16/com_jak2fiter.xml','',''),(44,6,0,'JA Showcase component for Joomla 1.7','','com_jashowcase','component','',1,'1.1.0','','http://update.joomlart.com/service/tracking/j16/com_jashowcase.xml','',''),(45,6,0,'JA Voice Package for Joomla 2.5 & 3.x','','com_javoice','component','',1,'1.1.0','','http://update.joomlart.com/service/tracking/j16/com_javoice.xml','',''),(46,6,0,'JA Appolio Theme for EasyBlog','','easyblog_theme_appolio','custom','',0,'1.0.0','','http://update.joomlart.com/service/tracking/j16/easyblog_theme_appolio.xml','',''),(47,6,0,'JA Biz Theme for EasyBlog','','easyblog_theme_biz','custom','',0,'1.0.1','','http://update.joomlart.com/service/tracking/j16/easyblog_theme_biz.xml','',''),(48,6,0,'JA Bookshop Theme for EasyBlog','','easyblog_theme_bookshop','custom','',0,'1.0.2','','http://update.joomlart.com/service/tracking/j16/easyblog_theme_bookshop.xml','',''),(49,6,0,'JA Decor Theme for EasyBlog','','easyblog_theme_decor','custom','',0,'1.0.1','','http://update.joomlart.com/service/tracking/j16/easyblog_theme_decor.xml','',''),(50,6,0,'Theme Fixel for Easyblog J25 & J32','','easyblog_theme_fixel','custom','',0,'1.0.2','','http://update.joomlart.com/service/tracking/j16/easyblog_theme_fixel.xml','',''),(51,6,0,'Theme Magz for Easyblog J25 & J32','','easyblog_theme_magz','custom','',0,'1.0.2','','http://update.joomlart.com/service/tracking/j16/easyblog_theme_magz.xml','',''),(52,6,0,'JA Muzic Theme for EasyBlog','','easyblog_theme_muzic','custom','',0,'1.0.1','','http://update.joomlart.com/service/tracking/j16/easyblog_theme_muzic.xml','',''),(53,6,0,'JA Obelisk Theme for EasyBlog','','easyblog_theme_obelisk','custom','',0,'1.0.3','','http://update.joomlart.com/service/tracking/j16/easyblog_theme_obelisk.xml','',''),(54,6,0,'JA Sugite Theme for EasyBlog','','easyblog_theme_sugite','custom','',0,'1.0.0','','http://update.joomlart.com/service/tracking/j16/easyblog_theme_sugite.xml','',''),(55,6,0,'JA Anion template for Joomla 2.5','','ja_anion','template','',0,'2.5.4','','http://update.joomlart.com/service/tracking/j16/ja_anion.xml','',''),(56,6,0,'JA Appolio Template','','ja_appolio','template','',0,'1.1.2','','http://update.joomlart.com/service/tracking/j16/ja_appolio.xml','',''),(57,6,0,'JA Argo Template for J25 & J33','','ja_argo','template','',0,'1.1.1','','http://update.joomlart.com/service/tracking/j16/ja_argo.xml','',''),(58,6,0,'JA Beranis Template','','ja_beranis','template','',0,'1.1.1','','http://update.joomlart.com/service/tracking/j16/ja_beranis.xml','',''),(59,6,0,'JA Bistro Template for Joomla 2.5','','ja_bistro','template','',0,'2.5.4','','http://update.joomlart.com/service/tracking/j16/ja_bistro.xml','',''),(60,6,0,'JA Blazes Template for J25 & J31','','ja_blazes','template','',0,'2.5.5','','http://update.joomlart.com/service/tracking/j16/ja_blazes.xml','',''),(61,6,0,'JA Bookshop Template','','ja_bookshop','template','',0,'1.1.2','','http://update.joomlart.com/service/tracking/j16/ja_bookshop.xml','',''),(62,6,0,'JA Brisk Template for J25 & J33','','ja_brisk','template','',0,'1.1.1','','http://update.joomlart.com/service/tracking/j16/ja_brisk.xml','',''),(63,6,0,'JA Business Template for Joomla 2.5','','ja_business','template','',0,'2.5.5','','http://update.joomlart.com/service/tracking/j16/ja_business.xml','',''),(64,6,0,'JA Cloris Template for Joomla 2.5.x','','ja_cloris','template','',0,'2.5.3','','http://update.joomlart.com/service/tracking/j16/ja_cloris.xml','',''),(65,6,0,'JA Community PLus Template for Joomla 2.5','','ja_community_plus','template','',0,'2.5.3','','http://update.joomlart.com/service/tracking/j16/ja_community_plus.xml','',''),(66,6,0,'JA Decor Template','','ja_decor','template','',0,'1.1.2','','http://update.joomlart.com/service/tracking/j16/ja_decor.xml','',''),(67,6,0,'JA Droid Template for Joomla 2.5','','ja_droid','template','',0,'2.5.4','','http://update.joomlart.com/service/tracking/j16/ja_droid.xml','',''),(68,6,0,'JA Edenite Template for J25 & J30','','ja_edenite','template','',0,'2.5.4','','http://update.joomlart.com/service/tracking/j16/ja_edenite.xml','',''),(69,6,0,'JA Elastica Template for J25 & J32','','ja_elastica','template','',0,'2.5.4','','http://update.joomlart.com/service/tracking/j16/ja_elastica.xml','',''),(70,6,0,'JA Erio Template for Joomla 2.5 & 3.1','','ja_erio','template','',0,'2.5.4','','http://update.joomlart.com/service/tracking/j16/ja_erio.xml','',''),(71,6,0,'Ja Events Template for Joomla 2.5','','ja_events','template','',0,'2.5.5','','http://update.joomlart.com/service/tracking/j16/ja_events.xml','',''),(72,6,0,'JA Fubix Template for J25 & J33','','ja_fubix','template','',0,'1.1.1','','http://update.joomlart.com/service/tracking/j16/ja_fubix.xml','',''),(73,6,0,'JA Graphite Template for Joomla 2.5','','ja_graphite','template','',0,'2.5.6','','http://update.joomlart.com/service/tracking/j16/ja_graphite.xml','',''),(74,6,0,'JA Hawkstore Template','','ja_hawkstore','template','',0,'1.1.0','','http://update.joomlart.com/service/tracking/j16/ja_hawkstore.xml','',''),(75,6,0,'JA Ironis Template for Joomla 2.5 & 3.1','','ja_ironis','template','',0,'2.5.5','','http://update.joomlart.com/service/tracking/j16/ja_ironis.xml','',''),(76,6,0,'JA Jason template','','ja_jason','template','',0,'1.0.0','','http://update.joomlart.com/service/tracking/j16/ja_jason.xml','',''),(77,6,0,'JA Kranos Template for J25 & J30','','ja_kranos','template','',0,'2.5.6','','http://update.joomlart.com/service/tracking/j16/ja_kranos.xml','',''),(78,6,0,'JA Lens Template for Joomla 2.5 & 3.1','','ja_lens','template','',0,'1.0.6','','http://update.joomlart.com/service/tracking/j16/ja_lens.xml','',''),(79,6,0,'Ja Lime Template for Joomla 2.5 & J31','','ja_lime','template','',0,'2.5.4','','http://update.joomlart.com/service/tracking/j16/ja_lime.xml','',''),(80,6,0,'JA Magz Template for J25 & J33','','ja_magz','template','',0,'1.1.1','','http://update.joomlart.com/service/tracking/j16/ja_magz.xml','',''),(81,6,0,'JA Medicare Template','','ja_medicare','template','',0,'1.1.2','','http://update.joomlart.com/service/tracking/j16/ja_medicare.xml','',''),(82,6,0,'JA Mendozite Template for J25 & J32','','ja_mendozite','template','',0,'1.0.6','','http://update.joomlart.com/service/tracking/j16/ja_mendozite.xml','',''),(83,6,0,'JA Mero Template for J25 & J32','','ja_mero','template','',0,'1.1.1','','http://update.joomlart.com/service/tracking/j16/ja_mero.xml','',''),(84,6,0,'JA Mers Template for J25 & J32','','ja_mers','template','',0,'1.0.7','','http://update.joomlart.com/service/tracking/j16/ja_mers.xml','',''),(85,6,0,'JA Methys Template for Joomla 2.5','','ja_methys','template','',0,'2.5.6','','http://update.joomlart.com/service/tracking/j16/ja_methys.xml','',''),(86,6,0,'Ja Minisite Template for Joomla 2.5','','ja_minisite','template','',0,'2.5.4','','http://update.joomlart.com/service/tracking/j16/ja_minisite.xml','',''),(87,6,0,'JA Mitius Template','','ja_mitius','template','',0,'1.1.1','','http://update.joomlart.com/service/tracking/j16/ja_mitius.xml','',''),(88,6,0,'JA Mixmaz Template','','ja_mixmaz','template','',0,'1.0.3','','http://update.joomlart.com/service/tracking/j16/ja_mixmaz.xml','',''),(89,6,0,'JA Nex Template for J25 & J30','','ja_nex','template','',0,'2.5.9','','http://update.joomlart.com/service/tracking/j16/ja_nex.xml','',''),(90,6,0,'JA Nex T3 Template','','ja_nex_t3','template','',0,'1.1.1','','http://update.joomlart.com/service/tracking/j16/ja_nex_t3.xml','',''),(91,6,0,'JA Norite Template for J2.5 & J31','','ja_norite','template','',0,'2.5.4','','http://update.joomlart.com/service/tracking/j16/ja_norite.xml','',''),(92,6,0,'JA Nuevo template','','ja_nuevo','template','',0,'1.0.1','','http://update.joomlart.com/service/tracking/j16/ja_nuevo.xml','',''),(93,6,0,'JA Obelisk Template','','ja_obelisk','template','',0,'1.1.1','','http://update.joomlart.com/service/tracking/j16/ja_obelisk.xml','',''),(94,6,0,'JA Onepage Template','','ja_onepage','template','',0,'1.1.1','','http://update.joomlart.com/service/tracking/j16/ja_onepage.xml','',''),(95,6,0,'JA ores template for Joomla 2.5 & 3.1','','ja_ores','template','',0,'2.5.4','','http://update.joomlart.com/service/tracking/j16/ja_ores.xml','',''),(96,6,0,'JA Orisite Template  for J25 & J32','','ja_orisite','template','',0,'1.1.6','','http://update.joomlart.com/service/tracking/j16/ja_orisite.xml','',''),(97,6,0,'JA Playmag Template','','ja_playmag','template','',0,'1.1.1','','http://update.joomlart.com/service/tracking/j16/ja_playmag.xml','',''),(98,6,0,'JA Portfolio Real Estate template for Joomla 1.6.x','','ja_portfolio','file','',0,'1.0.0 beta','','http://update.joomlart.com/service/tracking/j16/ja_portfolio.xml','',''),(99,6,0,'JA Portfolio Template for Joomla 2.5','','ja_portfolio_real_estate','template','',0,'2.5.5','','http://update.joomlart.com/service/tracking/j16/ja_portfolio_real_estate.xml','',''),(100,6,0,'JA Puresite Template for J25 & J31','','ja_puresite','template','',0,'1.0.7','','http://update.joomlart.com/service/tracking/j16/ja_puresite.xml','',''),(101,6,0,'JA Purity II template for Joomla 2.5 & 3.2','','ja_purity_ii','template','',0,'2.5.5','','http://update.joomlart.com/service/tracking/j16/ja_purity_ii.xml','',''),(102,6,0,'JA Pyro Template for Joomla 2.5','','ja_pyro','template','',0,'2.5.4','','http://update.joomlart.com/service/tracking/j16/ja_pyro.xml','',''),(103,6,0,'JA Rasite Template for J2.5 & J31','','ja_rasite','template','',0,'2.5.4','','http://update.joomlart.com/service/tracking/j16/ja_rasite.xml','',''),(104,6,0,'JA Rave Template for Joomla 2.5','','ja_rave','template','',0,'2.5.4','','http://update.joomlart.com/service/tracking/j16/ja_rave.xml','',''),(105,6,0,'JA Smashboard Template','','ja_smashboard','template','',0,'1.1.1','','http://update.joomlart.com/service/tracking/j16/ja_smashboard.xml','',''),(106,6,0,'JA Social Template for Joomla 2.5','','ja_social','template','',0,'2.5.8','','http://update.joomlart.com/service/tracking/j16/ja_social.xml','',''),(107,6,0,'JA Social T3 Template for J25 & J33','','ja_social_ii','template','',0,'1.1.1','','http://update.joomlart.com/service/tracking/j16/ja_social_ii.xml','',''),(108,6,0,'JA Sugite Template','','ja_sugite','template','',0,'1.1.3','','http://update.joomlart.com/service/tracking/j16/ja_sugite.xml','',''),(109,6,0,'JA System Pager Plugin for J25 & J30','','ja_system_japager','plugin','ja_system_japager',0,'1.0.4','','http://update.joomlart.com/service/tracking/j16/ja_system_japager.xml','',''),(110,6,0,'JA T3V2 Blank Template','','ja_t3_blank','template','',0,'2.5.8','','http://update.joomlart.com/service/tracking/j16/ja_t3_blank.xml','',''),(111,6,0,'JA T3 Blank template for joomla 1.6','','ja_t3_blank_j16','template','',0,'1.0.0 Beta','','http://update.joomlart.com/service/tracking/j16/ja_t3_blank_j16.xml','',''),(112,6,0,'JA Blank Template for T3v3','','ja_t3v3_blank','template','',0,'1.0.1','','http://update.joomlart.com/service/tracking/j16/ja_t3v3_blank.xml','',''),(113,6,0,'JA Teline III  Template for Joomla 1.6','','ja_teline_iii','file','',0,'1.0.0 Beta','','http://update.joomlart.com/service/tracking/j16/ja_teline_iii.xml','',''),(114,6,0,'JA Teline IV Template for J2.5 and J3.2','','ja_teline_iv','template','',0,'2.5.4','','http://update.joomlart.com/service/tracking/j16/ja_teline_iv.xml','',''),(115,6,0,'JA Teline IV T3 Template','','ja_teline_iv_t3','template','',0,'1.1.1','','http://update.joomlart.com/service/tracking/j16/ja_teline_iv_t3.xml','',''),(116,6,0,'JA Tiris Template for J25 & J30','','ja_tiris','template','',0,'2.5.6','','http://update.joomlart.com/service/tracking/j16/ja_tiris.xml','',''),(117,6,0,'JA Travel Template for Joomla 2.5 & 3.0','','ja_travel','template','',0,'2.5.5','','http://update.joomlart.com/service/tracking/j16/ja_travel.xml','',''),(118,6,0,'JA University Template for J25 & J32','','ja_university','template','',0,'1.0.6','','http://update.joomlart.com/service/tracking/j16/ja_university.xml','',''),(119,6,0,'JA University T3 template','','ja_university_t3','template','',0,'1.0.0','','http://update.joomlart.com/service/tracking/j16/ja_university_t3.xml','',''),(120,6,0,'JA Vintas Template for J25 & J31','','ja_vintas','template','',0,'1.0.3','','http://update.joomlart.com/service/tracking/j16/ja_vintas.xml','',''),(121,6,0,'JA Wall Template for J25 & J33','','ja_wall','template','',0,'1.2.0','','http://update.joomlart.com/service/tracking/j16/ja_wall.xml','',''),(122,6,0,'JA ZiteTemplate','','ja_zite','template','',0,'1.0.5','','http://update.joomlart.com/service/tracking/j16/ja_zite.xml','',''),(123,6,0,'JA Bookmark plugin for Joomla 1.6.x','','jabookmark','file','',0,'1.0.0','','http://update.joomlart.com/service/tracking/j16/jabookmark.xml','',''),(124,6,0,'JA Comment plugin for Joomla 1.6.x','','jacomment','file','',0,'1.0.0','','http://update.joomlart.com/service/tracking/j16/jacomment.xml','',''),(125,6,0,'JA Comment Off Plugin for Joomla 1.6','','jacommentoff','file','',0,'1.0.1','','http://update.joomlart.com/service/tracking/j16/jacommentoff.xml','',''),(126,6,0,'JA Comment On Plugin for Joomla 1.6','','jacommenton','file','',0,'1.0.1','','http://update.joomlart.com/service/tracking/j16/jacommenton.xml','',''),(127,6,0,'JA Content Extra Fields for Joomla 1.6','','jacontentextrafields','file','',0,'1.0.0','','http://update.joomlart.com/service/tracking/j16/jacontentextrafields.xml','',''),(128,6,0,'JA Disqus Debate Echo plugin for Joomla 1.6.x','','jadisqus_debate_echo','file','',0,'1.0.0','','http://update.joomlart.com/service/tracking/j16/jadisqus_debate_echo.xml','',''),(129,6,0,'JA System Google Map plugin for Joomla 1.6.x','','jagooglemap','file','',0,'1.0.0','','http://update.joomlart.com/service/tracking/j16/jagooglemap.xml','',''),(130,6,0,'JA Google Translate plugin for Joomla 1.6.x','','jagoogletranslate','plugin','',0,'1.0.0','','http://update.joomlart.com/service/tracking/j16/jagoogletranslate.xml','',''),(131,6,0,'JA Highslide plugin for Joomla 1.6.x','','jahighslide','plugin','',0,'1.0.0','','http://update.joomlart.com/service/tracking/j16/jahighslide.xml','',''),(132,6,0,'JA K2 Search Plugin for Joomla 2.5','','jak2_filter','plugin','',0,'1.0.0 Alpha','','http://update.joomlart.com/service/tracking/j16/jak2_filter.xml','',''),(133,6,0,'JA K2 Extra Fields Plugin for Joomla 2.5','','jak2_indexing','plugin','',0,'1.0.0 Alpha','','http://update.joomlart.com/service/tracking/j16/jak2_indexing.xml','',''),(134,6,0,'JA Load module Plugin for Joomla 2.5','','jaloadmodule','plugin','jaloadmodule',0,'2.5.1','','http://update.joomlart.com/service/tracking/j16/jaloadmodule.xml','',''),(135,6,0,'JA System Nrain plugin for Joomla 1.6.x','','janrain','file','',0,'1.0.0','','http://update.joomlart.com/service/tracking/j16/janrain.xml','',''),(136,6,0,'JA Popup plugin for Joomla 1.6','','japopup','file','',0,'1.0.1','','http://update.joomlart.com/service/tracking/j16/japopup.xml','',''),(137,6,0,'JA System Social plugin for Joomla 1.7','','jasocial','file','',0,'1.0.4','','http://update.joomlart.com/service/tracking/j16/jasocial.xml','',''),(138,6,0,'JA T3 System plugin for Joomla 1.6','','jat3','plugin','',0,'1.0.0 Beta','','http://update.joomlart.com/service/tracking/j16/jat3.xml','',''),(139,6,0,'JA Tabs plugin for Joomla 1.6.x','','jatabs','plugin','jatabs',0,'2.5.6','','http://update.joomlart.com/service/tracking/j16/jatabs.xml','',''),(140,6,0,'JA Typo plugin For Joomla 1.6','','jatypo','plugin','jatypo',0,'1.0.0','','http://update.joomlart.com/service/tracking/j16/jatypo.xml','',''),(141,6,0,'Jomsocial Theme 3.x for JA Social','','jomsocial_theme_social','custom','',0,'3.2.x','','http://update.joomlart.com/service/tracking/j16/jomsocial_theme_social.xml','',''),(142,6,0,'JA Jomsocial theme for Joomla 2.5','','jomsocial_theme_social_j16','file','',0,'2.5.1','','http://update.joomlart.com/service/tracking/j16/jomsocial_theme_social_j16.xml','',''),(143,6,0,'JA Jomsocial theme for Joomla 2.5','','jomsocial_theme_social_j16_26','custom','',0,'2.5.4','','http://update.joomlart.com/service/tracking/j16/jomsocial_theme_social_j16_26.xml','',''),(144,6,0,'JShopping Template for Ja Orisite','','jshopping_theme_orisite','file','',0,'1.0.0','','http://update.joomlart.com/service/tracking/j16/jshopping_theme_orisite.xml','',''),(145,6,0,'JA Tiris Jshopping theme for J25 & J30','','jshopping_theme_tiris','custom','',0,'2.5.4','','http://update.joomlart.com/service/tracking/j16/jshopping_theme_tiris.xml','',''),(146,6,0,'Theme for Jshopping j17','','jshopping_theme_tiris_j17','file','',0,'1.0.0','','http://update.joomlart.com/service/tracking/j16/jshopping_theme_tiris_j17.xml','',''),(147,6,0,'JA Kranos kunena theme for Joomla 2.5','','kunena_theme_kranos_j17','custom','',0,'1.0.2','','http://update.joomlart.com/service/tracking/j16/kunena_theme_kranos_j17.xml','',''),(148,6,0,'Kunena Template for JA Mendozite','','kunena_theme_mendozite','custom','',0,'1.0.4','','http://update.joomlart.com/service/tracking/j16/kunena_theme_mendozite.xml','',''),(149,6,0,'JA Mitius Kunena Theme for Joomla 25 ','','kunena_theme_mitius','custom','',0,'1.0.0','','http://update.joomlart.com/service/tracking/j16/kunena_theme_mitius.xml','',''),(150,6,0,'Kunena theme for JA Nex J2.5','','kunena_theme_nex_j17','custom','',0,'1.0.1','','http://update.joomlart.com/service/tracking/j16/kunena_theme_nex_j17.xml','',''),(151,6,0,'Kunena theme for JA Nex T3','','kunena_theme_nex_t3','custom','',0,'1.0.3','','http://update.joomlart.com/service/tracking/j16/kunena_theme_nex_t3.xml','',''),(152,6,0,'Kunena Template for Ja Orisite','','kunena_theme_orisite','custom','',0,'1.0.2','','http://update.joomlart.com/service/tracking/j16/kunena_theme_orisite.xml','',''),(153,6,0,'Kunena theme for ja PlayMag','','kunena_theme_playmag','custom','',0,'1.1.1','','http://update.joomlart.com/service/tracking/j16/kunena_theme_playmag.xml','',''),(154,6,0,'Kunena theme for JA Social T3','','kunena_theme_social','custom','',0,'1.1.0','','http://update.joomlart.com/service/tracking/j16/kunena_theme_social.xml','',''),(155,6,0,'Kunena theme for Joomla 2.5','','kunena_theme_social_j16','custom','',0,'2.5.1','','http://update.joomlart.com/service/tracking/j16/kunena_theme_social_j16.xml','',''),(156,6,0,'JA Tiris kunena theme for Joomla 2.5','','kunena_theme_tiris_j16','custom','',0,'2.5.3','','http://update.joomlart.com/service/tracking/j16/kunena_theme_tiris_j16.xml','',''),(157,6,0,'JA Bookshop Theme for Mijoshop','','mijoshop_theme_bookshop','custom','',0,'1.0.3','','http://update.joomlart.com/service/tracking/j16/mijoshop_theme_bookshop.xml','',''),(158,6,0,'JA Decor Theme for Mijoshop','','mijoshop_theme_decor','custom','',0,'1.0.2','','http://update.joomlart.com/service/tracking/j16/mijoshop_theme_decor.xml','',''),(159,6,0,'JA ACM Module','','mod_ja_acm','module','',0,'2.0.5','','http://update.joomlart.com/service/tracking/j16/mod_ja_acm.xml','',''),(160,6,0,'JA Jobs Tags module for Joomla 2.5','','mod_ja_jobs_tags','module','',0,'1.0.3','','http://update.joomlart.com/service/tracking/j16/mod_ja_jobs_tags.xml','',''),(161,6,0,'JA Accordion Module for J25 & J33','','mod_jaaccordion','module','',0,'2.5.8','','http://update.joomlart.com/service/tracking/j16/mod_jaaccordion.xml','',''),(162,6,0,'JA Animation module for Joomla 2.5 & 3.2','','mod_jaanimation','module','',0,'2.5.3','','http://update.joomlart.com/service/tracking/j16/mod_jaanimation.xml','',''),(163,6,0,'JA Bulletin Module for J25 & J3','','mod_jabulletin','module','',0,'2.5.9','','http://update.joomlart.com/service/tracking/j16/mod_jabulletin.xml','',''),(164,6,0,'JA Latest Comment Module for Joomla 2.5 & 3.3','','mod_jaclatest_comments','module','',0,'2.5.4','','http://update.joomlart.com/service/tracking/j16/mod_jaclatest_comments.xml','',''),(165,6,0,'JA Content Popup Module for J25 & J33','','mod_jacontentpopup','module','',0,'1.1.1','','http://update.joomlart.com/service/tracking/j16/mod_jacontentpopup.xml','',''),(166,6,0,'JA Content Scroll module for Joomla 1.6','','mod_jacontentscroll','file','',0,'1.0.0','','http://update.joomlart.com/service/tracking/j16/mod_jacontentscroll.xml','',''),(167,6,0,'JA Contenslider module for Joomla 1.6','','mod_jacontentslide','file','',0,'1.0.0','','http://update.joomlart.com/service/tracking/j16/mod_jacontentslide.xml','',''),(168,6,0,'JA Content Slider Module for J25 & J33','','mod_jacontentslider','module','',0,'2.7.1','','http://update.joomlart.com/service/tracking/j16/mod_jacontentslider.xml','',''),(169,6,0,'JA CountDown Module for J25 & J33','','mod_jacountdown','module','',0,'1.0.5','','http://update.joomlart.com/service/tracking/j16/mod_jacountdown.xml','',''),(170,6,0,'JA Facebook Activity Module for J25 & J30','','mod_jafacebookactivity','module','',0,'2.5.5','','http://update.joomlart.com/service/tracking/j16/mod_jafacebookactivity.xml','',''),(171,6,0,'JA Facebook Like Box Module for J25 & J30','','mod_jafacebooklikebox','module','',0,'2.5.9','','http://update.joomlart.com/service/tracking/j16/mod_jafacebooklikebox.xml','',''),(172,6,0,'JA Featured Employer module for Joomla 2.5','','mod_jafeatured_employer','module','',0,'1.0.3','','http://update.joomlart.com/service/tracking/j16/mod_jafeatured_employer.xml','',''),(173,6,0,'JA Filter Jobs module for Joomla 2.5','','mod_jafilter_jobs','module','',0,'1.0.4','','http://update.joomlart.com/service/tracking/j16/mod_jafilter_jobs.xml','',''),(174,6,0,'JA flowlist module for Joomla 2.5 & 3.0','','mod_jaflowlist','module','',0,'1.0.1','','http://update.joomlart.com/service/tracking/j16/mod_jaflowlist.xml','',''),(175,6,0,'JAEC Halloween Module for Joomla 2.5 & 3','','mod_jahalloween','module','',0,'1.0.1','','http://update.joomlart.com/service/tracking/j16/mod_jahalloween.xml','',''),(176,6,0,'JA Image Hotspot Module for Joomla 2.5 & 3.3','','mod_jaimagehotspot','module','',0,'1.0.7','','http://update.joomlart.com/service/tracking/j16/mod_jaimagehotspot.xml','',''),(177,6,0,'JA static module for Joomla 2.5','','mod_jajb_statistic','module','',0,'1.0.1','','http://update.joomlart.com/service/tracking/j16/mod_jajb_statistic.xml','',''),(178,6,0,'JA Jobboard Menu module for Joomla 2.5','','mod_jajobboard_menu','module','',0,'1.0.5','','http://update.joomlart.com/service/tracking/j16/mod_jajobboard_menu.xml','',''),(179,6,0,'JA Jobs Counter module for Joomla 2.5','','mod_jajobs_counter','module','',0,'1.0.4','','http://update.joomlart.com/service/tracking/j16/mod_jajobs_counter.xml','',''),(180,6,0,'JA Jobs Map module for Joomla 2.5','','mod_jajobs_map','module','',0,'1.0.5','','http://update.joomlart.com/service/tracking/j16/mod_jajobs_map.xml','',''),(181,6,0,'JA K2 Fillter Module for Joomla 2.5','','mod_jak2_filter','module','',0,'1.0.0 Alpha','','http://update.joomlart.com/service/tracking/j16/mod_jak2_filter.xml','',''),(182,6,0,'JA K2 Filter Module for J25 & J3.3','','mod_jak2filter','module','',0,'1.1.8','','http://update.joomlart.com/service/tracking/j16/mod_jak2filter.xml','',''),(183,6,0,'JA K2 Timeline','','mod_jak2timeline','module','',0,'1.0.1','','http://update.joomlart.com/service/tracking/j16/mod_jak2timeline.xml','',''),(184,6,0,'JA Latest Resumes module for Joomla 2.5','','mod_jalatest_resumes','module','',0,'1.0.3','','http://update.joomlart.com/service/tracking/j16/mod_jalatest_resumes.xml','',''),(185,6,0,'JA List Employer module for Joomla 2.5','','mod_jalist_employers','module','',0,'1.0.3','','http://update.joomlart.com/service/tracking/j16/mod_jalist_employers.xml','',''),(186,6,0,'JA List Jobs module for Joomla 2.5','','mod_jalist_jobs','module','',0,'1.0.2','','http://update.joomlart.com/service/tracking/j16/mod_jalist_jobs.xml','',''),(187,6,0,'JA List Resumes module for Joomla 2.5','','mod_jalist_resumes','module','',0,'1.0.2','','http://update.joomlart.com/service/tracking/j16/mod_jalist_resumes.xml','',''),(188,6,0,'JA Login module for J25 & J33','','mod_jalogin','module','',0,'2.6.4','','http://update.joomlart.com/service/tracking/j16/mod_jalogin.xml','',''),(189,6,0,'JA Masshead Module for J25 & J33','','mod_jamasshead','module','',0,'2.6.0','','http://update.joomlart.com/service/tracking/j16/mod_jamasshead.xml','',''),(190,6,0,'JA News Featured Module for J25 & J33','','mod_janews_featured','module','',0,'2.6.0','','http://update.joomlart.com/service/tracking/j16/mod_janews_featured.xml','',''),(191,6,0,'JA Newsflash module for Joomla 1.6.x','','mod_janewsflash','module','',0,'1.0.0','','http://update.joomlart.com/service/tracking/j16/mod_janewsflash.xml','',''),(192,6,0,'JA Newsmoo module for Joomla 1.6.x','','mod_janewsmoo','module','',0,'1.0.0','','http://update.joomlart.com/service/tracking/j16/mod_janewsmoo.xml','',''),(193,6,0,'JA News Pro Module for J25 & J33','','mod_janewspro','module','',0,'2.6.1','','http://update.joomlart.com/service/tracking/j16/mod_janewspro.xml','',''),(194,6,0,'JA Newsticker Module for J25 & J33','','mod_janewsticker','module','',0,'2.6.1','','http://update.joomlart.com/service/tracking/j16/mod_janewsticker.xml','',''),(195,6,0,'JA Quick Contact Module for J25 & J33','','mod_jaquickcontact','module','',0,'2.5.8','','http://update.joomlart.com/service/tracking/j16/mod_jaquickcontact.xml','',''),(196,6,0,'JA Recent Viewed Jobs module for Joomla 2.5','','mod_jarecent_viewed_jobs','module','',0,'1.0.1','','http://update.joomlart.com/service/tracking/j16/mod_jarecent_viewed_jobs.xml','',''),(197,6,0,'JA SideNews Module for J25 & J33','','mod_jasidenews','module','',0,'2.6.6','','http://update.joomlart.com/service/tracking/j16/mod_jasidenews.xml','',''),(198,6,0,'JA Slideshow Module for J25 & J33','','mod_jaslideshow','module','',0,'2.7.4','','http://update.joomlart.com/service/tracking/j16/mod_jaslideshow.xml','',''),(199,6,0,'JA Slideshow Lite Module for J25 & J3.3','','mod_jaslideshowlite','module','',0,'1.2.2','','http://update.joomlart.com/service/tracking/j16/mod_jaslideshowlite.xml','',''),(200,6,0,'JA Soccerway Module for J25 & J33','','mod_jasoccerway','module','',0,'1.0.4','','http://update.joomlart.com/service/tracking/j16/mod_jasoccerway.xml','',''),(201,6,0,'JA Social Locker module','','mod_jasocial_locker','module','',0,'1.0.0','','http://update.joomlart.com/service/tracking/j16/mod_jasocial_locker.xml','',''),(202,6,0,'JA Tab module for Joomla 2.5','','mod_jatabs','module','',0,'1.0.2','','http://update.joomlart.com/service/tracking/j16/mod_jatabs.xml','',''),(203,6,0,'JA Toppanel Module for Joomla 2.5 & Joomla 3.3','','mod_jatoppanel','module','',0,'2.5.7','','http://update.joomlart.com/service/tracking/j16/mod_jatoppanel.xml','',''),(204,6,0,'JA Twitter Module for J25 & J3.3','','mod_jatwitter','module','',0,'2.6.2','','http://update.joomlart.com/service/tracking/j16/mod_jatwitter.xml','',''),(205,6,0,'JA List of Voices Module for J2.5 & J3.x','','mod_javlist_voices','module','',0,'1.1.0','','http://update.joomlart.com/service/tracking/j16/mod_javlist_voices.xml','',''),(206,6,0,'JA VMProducts Module','','mod_javmproducts','module','',0,'1.0.2','','http://update.joomlart.com/service/tracking/j16/mod_javmproducts.xml','',''),(207,6,0,'JA Voice  Work Flow Module for J2.5 & J3.x','','mod_javwork_flow','module','',0,'1.1.0','','http://update.joomlart.com/service/tracking/j16/mod_javwork_flow.xml','',''),(208,6,0,'JA Amazon S3 Button Plugin for joomla 2.5 & 3.1','','jaamazons3','plugin','button',0,'1.0.1','','http://update.joomlart.com/service/tracking/j16/plg_button_jaamazons3.xml','',''),(209,6,0,'JA AVTracklist Button plugin for J2.5 & J3.3','','jaavtracklist','plugin','button',0,'1.0.1','','http://update.joomlart.com/service/tracking/j16/plg_button_jaavtracklist.xml','',''),(210,6,0,'JA Comment Off Plugin for Joomla 2.5 & 3.3','','jacommentoff','plugin','button',0,'2.5.3','','http://update.joomlart.com/service/tracking/j16/plg_button_jacommentoff.xml','',''),(211,6,0,'JA Comment On Plugin for Joomla 2.5 & 3.3','','jacommenton','plugin','button',0,'2.5.2','','http://update.joomlart.com/service/tracking/j16/plg_button_jacommenton.xml','',''),(212,6,0,'JA Amazon S3 System plugin for joomla 2.5 & 3.1','','plg_jaamazons3','plugin','plg_jaamazons3',0,'2.5.2','','http://update.joomlart.com/service/tracking/j16/plg_jaamazons3.xml','',''),(213,6,0,'JA AVTracklist plugin for J2.5 & J3.3','','plg_jaavtracklist','plugin','plg_jaavtracklist',0,'1.0.3','','http://update.joomlart.com/service/tracking/j16/plg_jaavtracklist.xml','',''),(214,6,0,'JA Bookmark plugin for J2.5 & J3.2','','plg_jabookmark','plugin','plg_jabookmark',0,'2.5.8','','http://update.joomlart.com/service/tracking/j16/plg_jabookmark.xml','',''),(215,6,0,'JA Comment Plugin for Joomla 2.5 & 3.3','','plg_jacomment','plugin','plg_jacomment',0,'2.5.4','','http://update.joomlart.com/service/tracking/j16/plg_jacomment.xml','',''),(216,6,0,'JA Disqus Debate Echo plugin for J2.5 & J3.2','','debate_echo','plugin','jadisqus',0,'2.6.2','','http://update.joomlart.com/service/tracking/j16/plg_jadisqus_debate_echo.xml','',''),(217,6,0,'JA Google Storage Plugin for j25 & j30','','plg_jagooglestorage','plugin','plg_jagooglestorage',0,'1.0.0','','http://update.joomlart.com/service/tracking/j16/plg_jagooglestorage.xml','',''),(218,6,0,'JA Translate plugin for Joomla 1.6.x','','plg_jagoogletranslate','file','',0,'1.0.0','','http://update.joomlart.com/service/tracking/j16/plg_jagoogletranslate.xml','',''),(219,6,0,'JA Thumbnail Plugin for J25 & J3','','plg_jathumbnail','plugin','plg_jathumbnail',0,'2.5.9','','http://update.joomlart.com/service/tracking/j16/plg_jathumbnail.xml','',''),(220,6,0,'JA Tooltips plugin for Joomla 1.6.x','','plg_jatooltips','plugin','',0,'1.0.0','','http://update.joomlart.com/service/tracking/j16/plg_jatooltips.xml','',''),(221,6,0,'JA Typo Button Plugin for J25 & J32','','plg_jatypobutton','plugin','plg_jatypobutton',0,'2.5.9','','http://update.joomlart.com/service/tracking/j16/plg_jatypobutton.xml','',''),(222,6,0,'JA K2 Filter Plg for J25 & J3.2','','jak2filter','plugin','k2',0,'1.1.8','','http://update.joomlart.com/service/tracking/j16/plg_k2_jak2filter.xml','',''),(223,6,0,'JA K2 Timeline Plugin','','jak2timeline','plugin','k2',0,'1.0.0','','http://update.joomlart.com/service/tracking/j16/plg_k2_jak2timeline.xml','',''),(224,6,0,'Multi Capcha Engine Plugin for J25 & J32','','captcha_engine','plugin','multiple',0,'2.5.3','','http://update.joomlart.com/service/tracking/j16/plg_multiple_captcha_engine.xml','',''),(225,6,0,'JA JobBoard Payment Plugin Authorize for Joomla 2.5','','plg_payment_jajb_authorize_25','custom','',0,'1.0.0','','http://update.joomlart.com/service/tracking/j16/plg_payment_jajb_authorize_25.xml','',''),(226,6,0,'JA JobBoard Payment Plugin MoneyBooker for Joomla 2.5','','plg_payment_jajb_moneybooker_25','custom','',0,'1.0.0','','http://update.joomlart.com/service/tracking/j16/plg_payment_jajb_moneybooker_25.xml','',''),(227,6,0,'JA JobBoard Payment Plugin Paypal for Joomla 2.5','','plg_payment_jajb_paypal_25','custom','',0,'1.0.0','','http://update.joomlart.com/service/tracking/j16/plg_payment_jajb_paypal_25.xml','',''),(228,6,0,'JA JobBoard Payment Plugin BankWire for Joomla 2.5','','plg_payment_jajb_wirebank_25','custom','',0,'1.0.0','','http://update.joomlart.com/service/tracking/j16/plg_payment_jajb_wirebank_25.xml','',''),(229,6,0,'JA Search Comment Plugin for Joomla J2.5 & 3.0','','jacomment','plugin','search',0,'2.5.2','','http://update.joomlart.com/service/tracking/j16/plg_search_jacomment.xml','',''),(230,6,0,'JA Search Jobs plugin for Joomla 2.5','','jajob','plugin','search',0,'1.0.0 stable','','http://update.joomlart.com/service/tracking/j16/plg_search_jajob.xml','',''),(231,6,0,'JA System Comment Plugin for Joomla 2.5 & 3.3','','jacomment','plugin','system',0,'2.5.4','','http://update.joomlart.com/service/tracking/j16/plg_system_jacomment.xml','',''),(232,6,0,'JA Content Extra Fields for Joomla 2.5','','jacontentextrafields','plugin','system',0,'2.5.1','','http://update.joomlart.com/service/tracking/j16/plg_system_jacontentextrafields.xml','',''),(233,6,0,'JA System Google Map plugin for J2.5 & J3.3','','jagooglemap','plugin','system',0,'2.5.8','','http://update.joomlart.com/service/tracking/j16/plg_system_jagooglemap.xml','',''),(234,6,0,'JAEC PLG System Jobboad Jomsocial Synchonization','','jajb_jomsocial','plugin','system',0,'1.0.0','','http://update.joomlart.com/service/tracking/j16/plg_system_jajb_jomsocial.xml','',''),(235,6,0,'JA System Lazyload Plugin for J25 & J32','','jalazyload','plugin','system',0,'1.0.6','','http://update.joomlart.com/service/tracking/j16/plg_system_jalazyload.xml','',''),(236,6,0,'JA System Nrain Plugin for Joomla 2.5 & 3.3','','janrain','plugin','system',0,'2.5.4','','http://update.joomlart.com/service/tracking/j16/plg_system_janrain.xml','',''),(237,6,0,'JA Popup Plugin for J25 & J33','','japopup','plugin','system',0,'2.6.2','','http://update.joomlart.com/service/tracking/j16/plg_system_japopup.xml','',''),(238,6,0,'JA System Social Plugin for Joomla 2.5 & 3.0','','jasocial','plugin','system',0,'2.5.4','','http://update.joomlart.com/service/tracking/j16/plg_system_jasocial.xml','',''),(239,6,0,'JA System Social Feed Plugin for J25 & J3.3','','jasocial_feed','plugin','system',0,'1.1.9','','http://update.joomlart.com/service/tracking/j16/plg_system_jasocial_feed.xml','',''),(240,6,0,'JA T3v3 System Plugin','','jat3v3','plugin','system',0,'1.0.3','','http://update.joomlart.com/service/tracking/j16/plg_system_jat3v3.xml','',''),(241,6,0,'JA Tabs Plugin for J25 & J3.3','','jatabs','plugin','system',0,'2.6.5','','http://update.joomlart.com/service/tracking/j16/plg_system_jatabs.xml','',''),(242,6,0,'T3 System Plugin','','t3','plugin','system',0,'2.4.5','','http://update.joomlart.com/service/tracking/j16/plg_system_t3.xml','',''),(243,6,0,'T3 Blank Template','','t3_blank','template','',0,'2.1.8','','http://update.joomlart.com/service/tracking/j16/t3_blank.xml','',''),(244,6,0,'T3 B3 Blank Template','','t3_bs3_blank','template','',0,'2.1.4','','http://update.joomlart.com/service/tracking/j16/t3_bs3_blank.xml','',''),(245,6,0,'JA Teline III Template for Joomla 2.5','','teline_iii','template','',0,'2.5.3','','http://update.joomlart.com/service/tracking/j16/teline_iii.xml','',''),(246,6,0,'Thirdparty Extensions Compatibility Bundle','','thirdparty_exts_compatibility','custom','',0,'1.0.0','','http://update.joomlart.com/service/tracking/j16/thirdparty_exts_compatibility.xml','',''),(247,6,0,'Uber Template','','uber','template','',0,'2.0.3','','http://update.joomlart.com/service/tracking/j16/uber.xml','',''),(248,6,0,'T3 B3 Blank Template','','t3_bs3_blank','template','',0,'2.1.8','','http://update.joomlart.com/service/tracking/j30/t3_bs3_blank.xml','',''),(249,6,0,'JA K2 v3 Filter package for J33','','com_jak2v3filter','component','',1,'3.0.0 preview ','','http://update.joomlart.com/service/tracking/j31/com_jak2v3filter.xml','',''),(250,6,0,'JA Multilingual Component for J25 & J3','','com_jalang','component','',1,'1.0.6','','http://update.joomlart.com/service/tracking/j31/com_jalang.xml','',''),(251,6,0,'JA Sugite Theme for EasyBlog','','easyblog_theme_sugite','custom','',0,'1.1.1','','http://update.joomlart.com/service/tracking/j31/easyblog_theme_sugite.xml','',''),(252,6,0,'JA Biz Template','','ja_biz','template','',0,'1.1.3','','http://update.joomlart.com/service/tracking/j31/ja_biz.xml','',''),(253,6,0,'JA Cago template','','ja_cago','template','',0,'1.0.0','','http://update.joomlart.com/service/tracking/j31/ja_cago.xml','',''),(254,6,0,'JA Cagox template','','ja_cagox','template','',0,'1.0.0','','http://update.joomlart.com/service/tracking/j31/ja_cagox.xml','',''),(255,6,0,'JA Fixel Template','','ja_fixel','template','',0,'1.1.1','','http://update.joomlart.com/service/tracking/j31/ja_fixel.xml','',''),(256,6,0,'JA Hotel Template','','ja_hotel','template','',0,'1.0.1','','http://update.joomlart.com/service/tracking/j31/ja_hotel.xml','',''),(257,6,0,'JA Muzic Template for J25 & J33','','ja_muzic','template','',0,'1.1.1','','http://update.joomlart.com/service/tracking/j31/ja_muzic.xml','',''),(258,6,0,'JA Teline V Template','','ja_teline_v','template','',0,'1.0.2','','http://update.joomlart.com/service/tracking/j31/ja_teline_v.xml','',''),(259,6,0,'Theme Fixel for JShopping J25 & J32','','jshopping_theme_fixel','custom','',0,'1.0.4','','http://update.joomlart.com/service/tracking/j31/jshopping_theme_fixel.xml','',''),(260,6,0,'JA Google Chart Module','','mod_jagooglechart','module','',0,'1.0.1','','http://update.joomlart.com/service/tracking/j31/mod_jagooglechart.xml','',''),(261,6,0,'JA K2 v3 Filter Module for J33','','mod_jak2v3filter','module','',0,'3.0.0 preview ','','http://update.joomlart.com/service/tracking/j31/mod_jak2v3filter.xml','',''),(262,6,0,'JA Promo Bar module','','mod_japromobar','module','',0,'1.0.1','','http://update.joomlart.com/service/tracking/j31/mod_japromobar.xml','',''),(263,6,0,'Ja Yahoo Finance','','mod_jayahoo_finance','module','',0,'1.0.0','','http://update.joomlart.com/service/tracking/j31/mod_jayahoo_finance.xml','',''),(264,6,0,'Ja Yahoo Weather','','mod_jayahoo_weather','module','',0,'1.0.1','','http://update.joomlart.com/service/tracking/j31/mod_jayahoo_weather.xml','',''),(265,6,0,'Plugin Ajax JA Content Type','','jacontenttype','plugin','ajax',0,'1.0.0 Beta','','http://update.joomlart.com/service/tracking/j31/plg_ajax_jacontenttype.xml','',''),(266,6,0,'JA K2 v3 Filter Plugin for J33','','jak2v3filter','plugin','k2',0,'3.0.0 preview ','','http://update.joomlart.com/service/tracking/j31/plg_k2_jak2v3filter.xml','',''),(267,6,0,'Plugin JA Content Type','','jacontenttype','plugin','system',0,'1.0.2','','http://update.joomlart.com/service/tracking/j31/plg_system_jacontenttype.xml','',''),(268,6,0,'Purity III Template','','purity_iii','template','',0,'1.1.2','','http://update.joomlart.com/service/tracking/j31/purity_iii.xml','',''),(269,6,0,'Sample package for Uber App','','uber_app','sample_package','',0,'2.0.2','','http://update.joomlart.com/service/tracking/j31/uber_app.xml','',''),(270,6,0,'Sample package for Uber Business','','uber_business','sample_package','',0,'2.0.2','','http://update.joomlart.com/service/tracking/j31/uber_business.xml','',''),(271,6,0,'Sample package for Uber Charity','','uber_charity','sample_package','',0,'2.0.2','','http://update.joomlart.com/service/tracking/j31/uber_charity.xml','',''),(272,6,0,'Sample package for Uber Church','','uber_church','sample_package','',0,'2.0.2','','http://update.joomlart.com/service/tracking/j31/uber_church.xml','',''),(273,6,0,'Sample package for Uber Construction','','uber_construction','sample_package','',0,'2.0.2','','http://update.joomlart.com/service/tracking/j31/uber_construction.xml','',''),(274,6,0,'Sample package for Uber Corporate','','uber_corporate','sample_package','',0,'2.0.2','','http://update.joomlart.com/service/tracking/j31/uber_corporate.xml','',''),(275,6,0,'Sample package for Uber Gym','','uber_gym','sample_package','',0,'2.0.2','','http://update.joomlart.com/service/tracking/j31/uber_gym.xml','',''),(276,6,0,'Sample package for Uber Home','','uber_home','sample_package','',0,'2.0.2','','http://update.joomlart.com/service/tracking/j31/uber_home.xml','',''),(277,6,0,'Sample package for Uber Lawyer','','uber_lawyer','sample_package','',0,'2.0.2','','http://update.joomlart.com/service/tracking/j31/uber_lawyer.xml','',''),(278,6,0,'Sample package for Uber Music','','uber_music','sample_package','',0,'2.0.2','','http://update.joomlart.com/service/tracking/j31/uber_music.xml','',''),(279,6,0,'Sample package for Uber Restaurant','','uber_restaurant','sample_package','',0,'2.0.2','','http://update.joomlart.com/service/tracking/j31/uber_restaurant.xml','',''),(280,6,0,'Sample package for Uber Spa','','uber_spa','sample_package','',0,'2.0.2','','http://update.joomlart.com/service/tracking/j31/uber_spa.xml','',''),(281,6,0,'Sample package for Uber University','','uber_university','sample_package','',0,'2.0.2','','http://update.joomlart.com/service/tracking/j31/uber_university.xml','',''),(282,6,0,'Sample package for Uber Wedding','','uber_wedding','sample_package','',0,'2.0.2','','http://update.joomlart.com/service/tracking/j31/uber_wedding.xml','',''),(283,9,0,'Weblinks Extension Package','Joomla! CMS Weblinks Package','pkg_weblinks','package','',1,'3.4.0','','https://raw.githubusercontent.com/joomla-extensions/weblinks/master/manifest.xml','https://github.com/joomla-extensions/weblinks','');
/*!40000 ALTER TABLE `mmov_updates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mmov_user_keys`
--

DROP TABLE IF EXISTS `mmov_user_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmov_user_keys` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `series` varchar(255) NOT NULL,
  `invalid` tinyint(4) NOT NULL,
  `time` varchar(200) NOT NULL,
  `uastring` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `series` (`series`),
  UNIQUE KEY `series_2` (`series`),
  UNIQUE KEY `series_3` (`series`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mmov_user_keys`
--

LOCK TABLES `mmov_user_keys` WRITE;
/*!40000 ALTER TABLE `mmov_user_keys` DISABLE KEYS */;
/*!40000 ALTER TABLE `mmov_user_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mmov_user_notes`
--

DROP TABLE IF EXISTS `mmov_user_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmov_user_notes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(100) NOT NULL DEFAULT '',
  `body` text NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_user_id` int(10) unsigned NOT NULL,
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `review_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_category_id` (`catid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mmov_user_notes`
--

LOCK TABLES `mmov_user_notes` WRITE;
/*!40000 ALTER TABLE `mmov_user_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `mmov_user_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mmov_user_profiles`
--

DROP TABLE IF EXISTS `mmov_user_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmov_user_profiles` (
  `user_id` int(11) NOT NULL,
  `profile_key` varchar(100) NOT NULL,
  `profile_value` text NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `idx_user_id_profile_key` (`user_id`,`profile_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Simple user profile storage table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mmov_user_profiles`
--

LOCK TABLES `mmov_user_profiles` WRITE;
/*!40000 ALTER TABLE `mmov_user_profiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `mmov_user_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mmov_user_usergroup_map`
--

DROP TABLE IF EXISTS `mmov_user_usergroup_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmov_user_usergroup_map` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Foreign Key to #__users.id',
  `group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Foreign Key to #__usergroups.id',
  PRIMARY KEY (`user_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mmov_user_usergroup_map`
--

LOCK TABLES `mmov_user_usergroup_map` WRITE;
/*!40000 ALTER TABLE `mmov_user_usergroup_map` DISABLE KEYS */;
INSERT INTO `mmov_user_usergroup_map` VALUES (961,8),(962,1),(962,2),(963,2);
/*!40000 ALTER TABLE `mmov_user_usergroup_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mmov_usergroups`
--

DROP TABLE IF EXISTS `mmov_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmov_usergroups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Adjacency List Reference Id',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `title` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_usergroup_parent_title_lookup` (`parent_id`,`title`),
  KEY `idx_usergroup_title_lookup` (`title`),
  KEY `idx_usergroup_adjacency_lookup` (`parent_id`),
  KEY `idx_usergroup_nested_set_lookup` (`lft`,`rgt`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mmov_usergroups`
--

LOCK TABLES `mmov_usergroups` WRITE;
/*!40000 ALTER TABLE `mmov_usergroups` DISABLE KEYS */;
INSERT INTO `mmov_usergroups` VALUES (1,0,1,18,'Public'),(2,1,8,15,'Registered'),(3,2,9,14,'Author'),(4,3,10,13,'Editor'),(5,4,11,12,'Publisher'),(6,1,4,7,'Manager'),(7,6,5,6,'Administrator'),(8,1,16,17,'Super Users'),(9,1,2,3,'Guest');
/*!40000 ALTER TABLE `mmov_usergroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mmov_users`
--

DROP TABLE IF EXISTS `mmov_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmov_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `username` varchar(150) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  `block` tinyint(4) NOT NULL DEFAULT '0',
  `sendEmail` tinyint(4) DEFAULT '0',
  `registerDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lastvisitDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `activation` varchar(100) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  `lastResetTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Date of last password reset',
  `resetCount` int(11) NOT NULL DEFAULT '0' COMMENT 'Count of password resets since lastResetTime',
  `otpKey` varchar(1000) NOT NULL DEFAULT '' COMMENT 'Two factor authentication encrypted keys',
  `otep` varchar(1000) NOT NULL DEFAULT '' COMMENT 'One time emergency passwords',
  `requireReset` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Require user to reset password on next login',
  PRIMARY KEY (`id`),
  KEY `idx_name` (`name`),
  KEY `idx_block` (`block`),
  KEY `username` (`username`),
  KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=964 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mmov_users`
--

LOCK TABLES `mmov_users` WRITE;
/*!40000 ALTER TABLE `mmov_users` DISABLE KEYS */;
INSERT INTO `mmov_users` VALUES (961,'Super User','estelio','henry.martinez@estelio.com','$2y$10$VCW07acpN.x6mHmvPsDxheOo5TAyGhqBr7DnUixq9q581TiYArfi.',0,1,'2015-01-16 21:31:45','2015-03-06 13:12:53','0','','0000-00-00 00:00:00',0,'','',0),(962,'Visitante','visitante','henry.martinezd@gmail.com','$2y$10$/2YwioSh6uy4zuHOlYUvG.3.SOdXYxVZshcUWnpKz0AUa9vzfc6L.',0,1,'2015-01-19 15:46:23','2015-03-06 13:09:14','','{\"admin_style\":\"\",\"admin_language\":\"\",\"language\":\"\",\"editor\":\"\",\"helpsite\":\"\",\"timezone\":\"\"}','0000-00-00 00:00:00',0,'','',0),(963,'Gestor','gestor','gestor@estelio.com','$2y$10$Uc.GWPFsPVvnx3w7xvVPueMXt9yGt3tq2YoI5lhS7B9Ajn4CZK5Ai',0,0,'2015-02-27 20:37:58','0000-00-00 00:00:00','','{\"admin_style\":\"\",\"admin_language\":\"\",\"language\":\"\",\"editor\":\"\",\"helpsite\":\"\",\"timezone\":\"\"}','0000-00-00 00:00:00',0,'','',0);
/*!40000 ALTER TABLE `mmov_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mmov_viewlevels`
--

DROP TABLE IF EXISTS `mmov_viewlevels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmov_viewlevels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `title` varchar(100) NOT NULL DEFAULT '',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `rules` varchar(5120) NOT NULL COMMENT 'JSON encoded access control.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_assetgroup_title_lookup` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mmov_viewlevels`
--

LOCK TABLES `mmov_viewlevels` WRITE;
/*!40000 ALTER TABLE `mmov_viewlevels` DISABLE KEYS */;
INSERT INTO `mmov_viewlevels` VALUES (1,'Public',0,'[1]'),(2,'Registered',1,'[6,2,8]'),(3,'Special',2,'[6,3,8]'),(5,'Guest',0,'[9]'),(6,'Super Users',0,'[8]');
/*!40000 ALTER TABLE `mmov_viewlevels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mmov_weblinks`
--

DROP TABLE IF EXISTS `mmov_weblinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mmov_weblinks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `catid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(250) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `url` varchar(250) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `hits` int(11) NOT NULL DEFAULT '0',
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `access` int(11) NOT NULL DEFAULT '1',
  `params` text NOT NULL,
  `language` char(7) NOT NULL DEFAULT '',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `metadata` text NOT NULL,
  `featured` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Set if link is featured.',
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `images` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mmov_weblinks`
--

LOCK TABLES `mmov_weblinks` WRITE;
/*!40000 ALTER TABLE `mmov_weblinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `mmov_weblinks` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-03-06 14:18:06