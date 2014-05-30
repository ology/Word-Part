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
  `affix` varchar(50) NOT NULL DEFAULT '',
  `definition` varchar(255) NOT NULL DEFAULT '',
  `etymology` varchar(50) DEFAULT NULL,
  `pronunciation` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `part` (`affix`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fragment`
--

LOCK TABLES `fragment` WRITE;
/*!40000 ALTER TABLE `fragment` DISABLE KEYS */;
INSERT INTO `fragment` VALUES (1,'plagio(?=\\w)','oblique',NULL,NULL),(2,'pseudo(?=\\w)','false',NULL,NULL),(3,'eury(?=\\w)','wide',NULL,NULL),(4,'ortho(?=\\w)','straight, right angles',NULL,NULL),(5,'iso(?=\\w)','equal',NULL,NULL),(6,'multi(?=\\w)','many',NULL,NULL),(7,'endo(?=\\w)','within, inward',NULL,NULL),(8,'hygro(?=\\w)','wet, humid, damp, moist',NULL,NULL),(9,'hyl(?=\\w)','wood',NULL,NULL),(10,'hyper(?=\\w)','more than, above, higher',NULL,NULL),(11,'pros?(?=\\w)','positive',NULL,NULL),(12,'poly(?=\\w)','many',NULL,NULL),(13,'holo(?=\\w)','whole, complete, entire, total',NULL,NULL),(14,'nec(?=\\w)','not (of)',NULL,NULL),(15,'(?<=\\w)phil','loving, thriving',NULL,NULL),(18,'bi(?=\\w)','two',NULL,NULL),(19,'bio(?=\\w)','life',NULL,NULL),(20,'(?<=\\w)ic','belonging',NULL,NULL),(21,'(?<=\\w)ly','like',NULL,NULL),(22,'(?<=\\w)o(?=\\w)','combining',NULL,NULL),(23,'(?<=\\w)tic','possessing',NULL,NULL),(24,'(?<=\\w)y','like',NULL,NULL),(25,'homo(?=\\w)','similar, alike, same',NULL,NULL),(26,'(?<=\\w)phobic','intolerant of, lacking',NULL,NULL),(27,'phobo(?=\\w)','fear, negative',NULL,NULL),(28,'photo(?=\\w)','light',NULL,NULL),(29,'diplo(?=\\w)','double, twofold',NULL,NULL),(30,'tetra(?=\\w)','four, fourfold',NULL,NULL),(31,'re(?=\\w)','again, repeat',NULL,NULL),(32,'hal(?=\\w)','salty',NULL,NULL),(33,'(?<=\\w)genic','producing, produced by',NULL,NULL),(34,'geo(?=\\w)','earth, terrestrial',NULL,NULL),(35,'(?<=\\w)parous','producing',NULL,NULL),(36,'micro(?=\\w)','small, short',NULL,NULL),(39,'auto(?=\\w)','self, same',NULL,NULL),(40,'brachy(?=\\w)','short',NULL,NULL),(42,'octa(?=\\w)','eight, eightfold',NULL,NULL),(43,'(?<=\\w)oidea','zoological superfamily',NULL,NULL),(44,'(?<=\\w)oideae','zoological subfamily',NULL,NULL),(45,'(?<=\\w)log','know',NULL,NULL),(46,'tele(?=\\w)','beyond',NULL,NULL),(47,'tachy(?=\\w)','quick, fast',NULL,NULL),(48,'(?<=\\w)taxis','arrangement (of)',NULL,NULL),(49,'(?<=\\w)taxy','directed response',NULL,NULL),(52,'therm(?=\\w)','heat',NULL,NULL),(53,'trophic(?=\\w)','nourishment',NULL,NULL),(54,'trophe?(?=\\w)','mode of nutirition, nutrient used',NULL,NULL),(56,'triplo(?=\\w)','three, threefold',NULL,NULL),(57,'(?<=\\w)type','image, type',NULL,NULL),(58,'tycho(?=\\w)','chance',NULL,NULL),(59,'(?<=\\w)al','type',NULL,NULL),(60,'(?<=\\w)i(?=\\w)','combining',NULL,NULL),(63,'(?<=\\w)morph','change',NULL,NULL),(64,'ant','opposite',NULL,NULL),(65,'(?<=\\w)ology','discourse, study',NULL,NULL),(66,'quasi(?=\\w)','similar',NULL,NULL),(67,'an?(?=\\w)','not, without',NULL,NULL),(74,'(?<=\\w)acusis','hearing',NULL,NULL),(75,'ad(?=\\w)','at, increase, on, toward',NULL,NULL),(76,'aden(?=\\w)','gland',NULL,NULL),(77,'ab(?=\\w)','from, away',NULL,NULL),(78,'(?<=\\w)ac','pertaining to',NULL,NULL),(79,'acanth(?=\\w)','thorn, spine',NULL,NULL),(80,'acous(?=\\w)','hearing',NULL,NULL),(81,'acr(?=\\w)','extremity, topmost',NULL,NULL),(82,'ant(?=\\w)','opposite',NULL,NULL),(83,'xxx','xxx',NULL,NULL);
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

-- Dump completed on 2014-05-29 23:20:14
