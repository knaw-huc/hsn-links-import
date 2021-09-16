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
-- Table structure for table `person_o_temp`
--

DROP TABLE IF EXISTS `person_o_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person_o_temp` (
  `id_person` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_registration` int(10) unsigned DEFAULT NULL,
  `id_source` int(10) unsigned DEFAULT NULL,
  `registration_maintype` tinyint(3) unsigned DEFAULT NULL,
  `id_person_o` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `title_noble` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `title_other` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `firstname` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `alias_firstname` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `initials` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `patronym` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `prefix` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `familyname` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `alias_familyname` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `suffix` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `sex` char(1) COLLATE utf8_bin DEFAULT NULL,
  `religion` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `foundling` char(1) COLLATE utf8_bin DEFAULT NULL,
  `civil_status` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `role` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `occupation` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `location` varchar(120) COLLATE utf8_bin DEFAULT NULL,
  `age_literal` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `age_day` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `age_week` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `age_month` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `age_year` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `birth_date` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `birth_location` varchar(120) COLLATE utf8_bin DEFAULT NULL,
  `baptism_date` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `baptism_location` varchar(120) COLLATE utf8_bin DEFAULT NULL,
  `death` char(1) COLLATE utf8_bin DEFAULT NULL,
  `stillborn` varchar(3) COLLATE utf8_bin DEFAULT NULL,
  `funeral_date` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `death_date` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `death_location` varchar(120) COLLATE utf8_bin DEFAULT NULL,
  `mar_date` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `signature` varchar(25) COLLATE utf8_bin DEFAULT NULL,
  `mar_location` varchar(120) COLLATE utf8_bin DEFAULT NULL,
  `divorce_date` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `divorce_location` varchar(120) COLLATE utf8_bin DEFAULT NULL,
  `int_mar_date` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `pro_mar_date` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `attestation_date` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `attestation_location` varchar(120) COLLATE utf8_bin DEFAULT NULL,
  `departure_location` varchar(120) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id_person`),
  KEY `id_registration` (`id_registration`),
  KEY `id_person_o` (`id_person_o`)
) ENGINE=MyISAM AUTO_INCREMENT=44677064 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-16 10:50:13
