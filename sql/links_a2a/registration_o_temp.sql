-- MySQL dump 10.14  Distrib 5.5.68-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: links_a2a
-- ------------------------------------------------------
-- Server version	5.5.68-MariaDB

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
-- Table structure for table `registration_o_temp`
--

DROP TABLE IF EXISTS `registration_o_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registration_o_temp` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_registration` int(10) unsigned DEFAULT NULL,
  `id_source` int(10) unsigned DEFAULT NULL,
  `name_source` varchar(120) COLLATE utf8_bin DEFAULT NULL,
  `id_persist_source` int(10) unsigned DEFAULT NULL,
  `id_persist_registration` varchar(80) COLLATE utf8_bin DEFAULT NULL,
  `source_digital_original` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `id_orig_registration` int(10) unsigned DEFAULT NULL,
  `registration_maintype` tinyint(3) unsigned DEFAULT NULL,
  `registration_type` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `extract` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `registration_location` varchar(120) COLLATE utf8_bin DEFAULT NULL,
  `registration_church` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `registration_date` varchar(25) COLLATE utf8_bin DEFAULT NULL,
  `registration_day` tinyint(3) DEFAULT NULL,
  `registration_month` tinyint(3) DEFAULT NULL,
  `registration_year` smallint(5) DEFAULT NULL,
  `registration_seq` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `remarks` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_orig_registration` (`id_orig_registration`),
  KEY `id_registration` (`id_registration`)
) ENGINE=MyISAM AUTO_INCREMENT=13959062 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-16 10:49:58
