-- MySQL dump 10.13  Distrib 5.6.17, for osx10.6 (x86_64)
--
-- Host: localhost    Database: word_part
-- ------------------------------------------------------
-- Server version	5.6.17

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
-- Current Database: `word_part`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `word_part` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `word_part`;

--
-- Table structure for table `fragment`
--

DROP TABLE IF EXISTS `fragment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fragment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `prefix` varchar(50) DEFAULT NULL,
  `affix` varchar(50) NOT NULL DEFAULT '',
  `suffix` varchar(50) DEFAULT NULL,
  `definition` varchar(255) NOT NULL DEFAULT '',
  `etymology` varchar(50) DEFAULT NULL,
  `pronunciation` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `part` (`affix`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fragment`
--

LOCK TABLES `fragment` WRITE;
/*!40000 ALTER TABLE `fragment` DISABLE KEYS */;
INSERT INTO `fragment` VALUES (1,NULL,'plagio','(?=\\w)','oblique',NULL,NULL),(2,NULL,'pseudo','(?=\\w)','false',NULL,NULL),(3,NULL,'eury','(?=\\w)','wide',NULL,NULL),(4,NULL,'ortho','(?=\\w)','straight, right angles',NULL,NULL),(5,NULL,'iso','(?=\\w)','equal',NULL,NULL),(6,NULL,'multi','(?=\\w)','many',NULL,NULL),(7,NULL,'endo','(?=\\w)','within, inward',NULL,NULL),(8,NULL,'hygro','(?=\\w)','wet, humid, damp, moist',NULL,NULL),(9,NULL,'hyl','(?=\\w)','wood',NULL,NULL),(10,NULL,'hyper','(?=\\w)','more than, above, higher',NULL,NULL),(11,NULL,'pros?','(?=\\w)','positive',NULL,NULL),(12,NULL,'poly','(?=\\w)','many',NULL,NULL),(13,NULL,'holo','(?=\\w)','whole, complete, entire, total',NULL,NULL),(14,NULL,'nec','(?=\\w)','not (of)',NULL,NULL),(15,'(?<=\\w)','phil',NULL,'loving, thriving',NULL,NULL),(16,NULL,'a','(?=\\w)','not, opposite',NULL,NULL),(17,NULL,'ab','(?=\\w)','away',NULL,NULL),(18,NULL,'bi','(?=\\w)','two',NULL,NULL),(19,NULL,'bio','(?=\\w)','life',NULL,NULL),(20,'(?<=\\w)','ic',NULL,'belonging',NULL,NULL),(21,'(?<=\\w)','ly',NULL,'like',NULL,NULL),(22,'(?<=\\w)','o','(?=\\w)','combining',NULL,NULL),(23,'(?<=\\w)','tic',NULL,'possessing',NULL,NULL),(24,'(?<=\\w)','y',NULL,'like',NULL,NULL),(25,NULL,'homo','(?=\\w)','similar, alike, same',NULL,NULL),(26,'(?<=\\w)','phobic',NULL,'intolerant of, lacking',NULL,NULL),(27,NULL,'phobo','(?=\\w)','fear, negative',NULL,NULL),(28,NULL,'photo','(?=\\w)','light',NULL,NULL),(29,NULL,'diplo','(?=\\w)','double, twofold',NULL,NULL),(30,NULL,'tetra','(?=\\w)','four, fourfold',NULL,NULL),(31,NULL,'re','(?=\\w)','again, repeat',NULL,NULL),(32,NULL,'hal','(?=\\w)','salty',NULL,NULL),(33,'(?<=\\w)','genic',NULL,'producing, produced by',NULL,NULL),(34,NULL,'geo','(?=\\w)','earth, terrestrial',NULL,NULL),(35,'(?<=\\w)','parous',NULL,'producing',NULL,NULL),(36,NULL,'micro','(?=\\w)','small, short',NULL,NULL),(39,NULL,'auto','(?=\\w)','self, same',NULL,NULL),(40,NULL,'brachy','(?=\\w)','short',NULL,NULL),(42,NULL,'octa','(?=\\w)','eight, eightfold',NULL,NULL),(43,'(?<=\\w)','oidea',NULL,'zoological superfamily',NULL,NULL),(44,'(?<=\\w)','oideae',NULL,'zoological subfamily',NULL,NULL),(45,'(?<=\\w)','log',NULL,'know',NULL,NULL),(46,NULL,'tele','(?=\\w)','beyond',NULL,NULL),(47,NULL,'tachy','(?=\\w)','quick, fast',NULL,NULL),(48,'(?<=\\w)','taxis',NULL,'arrangement (of)',NULL,NULL),(49,'(?<=\\w)','taxy',NULL,'directed response',NULL,NULL),(52,NULL,'therm','(?=\\w)','heat',NULL,NULL),(53,NULL,'trophic','(?=\\w)','nourishment',NULL,NULL),(54,NULL,'trophe?','(?=\\w)','mode of nutirition, nutrient used',NULL,NULL),(56,NULL,'triplo','(?=\\w)','three, threefold',NULL,NULL),(57,'(?<=\\w)','type',NULL,'image, type',NULL,NULL),(58,NULL,'tycho','(?=\\w)','chance',NULL,NULL),(59,'(?<=\\w)','al',NULL,'type',NULL,NULL),(60,'(?<=\\w)','i','(?=\\w)','combining',NULL,NULL),(63,'(?<=\\w)','morph',NULL,'change',NULL,NULL),(64,NULL,'ant','(?=\\w)','opposite',NULL,NULL),(65,'(?<=\\w)','ology',NULL,'discourse, study',NULL,NULL),(66,NULL,'quasi','(?=\\w)','similar',NULL,NULL);
/*!40000 ALTER TABLE `fragment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'word_part'
--

--
-- Dumping routines for database 'word_part'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-05-25 10:04:17
