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
  PRIMARY KEY (`id`),
  UNIQUE KEY `part` (`affix`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fragment`
--

LOCK TABLES `fragment` WRITE;
/*!40000 ALTER TABLE `fragment` DISABLE KEYS */;
INSERT INTO `fragment` VALUES (1,'plagio(?=\\w)','oblique',NULL),(2,'pseudo(?=\\w)','false',NULL),(3,'eury(?=\\w)','wide',NULL),(4,'ortho(?=\\w)','straight, right angles',NULL),(5,'iso(?=\\w)','equal',NULL),(6,'multi(?=\\w)','many',NULL),(7,'endo(?=\\w)','within, inward',NULL),(8,'hygro(?=\\w)','wet, humid, damp, moist',NULL),(9,'hyl(?=\\w)','wood',NULL),(10,'hyper(?=\\w)','more than, above, higher',NULL),(11,'pros?(?=\\w)','positive',NULL),(12,'poly(?=\\w)','many',NULL),(13,'holo(?=\\w)','whole, complete, entire, total',NULL),(14,'nec(?=\\w)','not (of)',NULL),(15,'(?<=\\w)phil','loving, thriving',NULL),(18,'bi(?=\\w)','two',NULL),(19,'bio(?=\\w)','life',NULL),(20,'(?<=\\w)ic','belonging',NULL),(21,'(?<=\\w)ly','like',NULL),(22,'(?<=\\w)o(?=\\w)','combining',NULL),(23,'(?<=\\w)tic','possessing',NULL),(24,'(?<=\\w)y','like',NULL),(25,'homo(?=\\w)','similar, alike, same',NULL),(26,'(?<=\\w)phobic','intolerant of, lacking',NULL),(27,'phobo(?=\\w)','fear, negative',NULL),(28,'photo(?=\\w)','light',NULL),(29,'diplo(?=\\w)','double, twofold',NULL),(30,'tetra(?=\\w)','four, fourfold',NULL),(31,'re(?=\\w)','again, repeat',NULL),(32,'hal(?=\\w)','salty',NULL),(33,'(?<=\\w)genic','producing, produced by',NULL),(34,'geo(?=\\w)','earth, terrestrial',NULL),(35,'(?<=\\w)parous','producing',NULL),(36,'micro(?=\\w)','small, short',NULL),(39,'auto(?=\\w)','self, same',NULL),(40,'brachy(?=\\w)','short',NULL),(42,'octa(?=\\w)','eight, eightfold',NULL),(43,'(?<=\\w)oidea','zoological superfamily',NULL),(44,'(?<=\\w)oideae','zoological subfamily',NULL),(45,'(?<=\\w)log','know',NULL),(46,'tele(?=\\w)','beyond',NULL),(47,'tachy(?=\\w)','quick, fast',NULL),(48,'(?<=\\w)taxis','arrangement (of)',NULL),(49,'(?<=\\w)taxy','directed response',NULL),(52,'therm(?=\\w)','heat',NULL),(53,'trophic(?=\\w)','nourishment',NULL),(54,'trophe?(?=\\w)','mode of nutirition, nutrient used',NULL),(56,'triplo(?=\\w)','three, threefold',NULL),(57,'(?<=\\w)type','image, type',NULL),(58,'tycho(?=\\w)','chance',NULL),(59,'(?<=\\w)al','type',NULL),(60,'(?<=\\w)i(?=\\w)','combining',NULL),(63,'(?<=\\w)morph','change',NULL),(64,'ant','opposite',NULL),(65,'(?<=\\w)ology','discourse, study',NULL),(66,'quasi(?=\\w)','similar',NULL),(67,'an?(?=\\w)','not, without',NULL),(74,'(?<=\\w)acusis','hearing',NULL),(75,'ad(?=\\w)','at, increase, on, toward',NULL),(76,'aden(?=\\w)','gland',NULL),(77,'ab(?=\\w)','from, away',NULL),(78,'(?<=\\w)ac','pertaining to',NULL),(79,'acanth(?=\\w)','thorn, spine',NULL),(80,'acous(?=\\w)','hearing',NULL),(81,'acr(?=\\w)','extremity, topmost',NULL),(82,'ant(?=\\w)','opposite',NULL),(86,'(?<=\\w)ad','toward',NULL),(87,'adip(?=\\w)','fatty tissue',NULL),(88,'(?<=\\w)aemia','blood condition',NULL),(89,'aer(?=\\w)','air, gas',NULL),(90,'aesthesi(?=\\w)','sensation',NULL),(92,'alb(?=\\w)','white or pale color',NULL),(93,'alge(?:si)?(?=\\w)','pain',NULL),(94,'(?<=\\w)algia','pain',NULL),(95,'algi?(?=\\w)','pain',NULL),(96,'all(?=\\w)','different, an addition',NULL),(97,'amb(?=\\w)','positioned on both sides',NULL),(98,'amni(?=\\w)','fetal sac',NULL),(99,'amph(?=\\w)','both sides',NULL),(100,'ana(?=\\w)','back, again, up',NULL),(101,'andr(?=\\w)','man',NULL);
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

-- Dump completed on 2014-05-30  7:46:45
