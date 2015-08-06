-- MySQL dump 10.13  Distrib 5.5.43, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: word_part
-- ------------------------------------------------------
-- Server version	5.5.43-0ubuntu0.14.04.1

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
-- Table structure for table `api_access`
--

DROP TABLE IF EXISTS `api_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_access` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `token` varchar(20) NOT NULL DEFAULT '',
  `username` varchar(20) NOT NULL DEFAULT '',
  `created` datetime NOT NULL,
  `active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_access`
--

LOCK TABLES `api_access` WRITE;
/*!40000 ALTER TABLE `api_access` DISABLE KEYS */;
INSERT INTO `api_access` VALUES (1,'ABC123','gene','2014-12-30 11:19:13',1);
/*!40000 ALTER TABLE `api_access` ENABLE KEYS */;
UNLOCK TABLES;

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=524 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fragment`
--

LOCK TABLES `fragment` WRITE;
/*!40000 ALTER TABLE `fragment` DISABLE KEYS */;
INSERT INTO `fragment` VALUES (1,'plagio(?=\\w)','oblique','greek'),(2,'pseudo(?=\\w)','false','greek'),(3,'eury(?=\\w)','wide','greek'),(4,'ortho(?=\\w)','straight, right angles','greek'),(5,'iso(?=\\w)','equal','greek'),(6,'multi(?=\\w)','many','latin'),(7,'endo(?=\\w)','within, inward','greek'),(8,'hygro(?=\\w)','wet, humid, damp, moist','greek'),(9,'hyl(?=\\w)','wood','greek'),(10,'hyper(?=\\w)','more than, above, higher','greek'),(11,'pros?(?=\\w)','positive','latin'),(12,'poly(?=\\w)','many','greek'),(13,'holo(?=\\w)','whole, complete, entire, total','greek'),(14,'necr(?=\\w)','dead','greek'),(15,'(?<=\\w)phile?','loving, thriving','greek'),(18,'bin(?=\\w)','two','latin'),(19,'bio(?=\\w)','life','greek'),(20,'(?<=\\w)ic','belonging','greek'),(21,'(?<=\\w)ly','like','middle english'),(22,'(?<=\\w)o(?=\\w)','combining',NULL),(23,'(?<=\\w)tic','possessing','greek'),(24,'(?<=\\w)y','like','middle english'),(25,'homo(?=\\w)','similar, alike, same','greek'),(26,'(?<=\\w)phob(?=\\w)','intolerant of, lacking, fearing','greek'),(28,'phot(?=\\w)','light','greek'),(29,'diplo(?=\\w)','double, twofold','greek'),(30,'tetra(?=\\w)','four, fourfold','greek'),(31,'re(?=\\w)','again, repeat','latin'),(32,'hal(?=\\w)','salty','greek'),(33,'(?<=\\w)gen','producing, produced by','latin'),(34,'geo(?=\\w)','earth, terrestrial','greek'),(35,'(?<=\\w)parous','producing','latin'),(36,'micro(?=\\w)','small, short','greek'),(40,'brachy(?=\\w)','short','greek'),(42,'octa(?=\\w)','eight, eightfold','greek'),(43,'(?<=\\w)oidea','zoological superfamily','greek'),(44,'(?<=\\w)oideae','zoological subfamily','greek'),(45,'(?<=\\w)log','know','greek'),(46,'tele?(?=\\w)','beyond','greek'),(47,'tach(?:eo|y)(?=\\w)','quick, fast','greek'),(48,'(?<=\\w)tax(?:is|y)?','arrangement (of)','greek'),(52,'therm(?=\\w)','heat, hot','greek'),(54,'troph(?=\\w)','nourishment, nutrition','greek'),(57,'(?<=\\w)type','image, type','latin'),(58,'tycho(?=\\w)','chance','greek'),(59,'(?<=\\w)al','relating to','latin'),(60,'(?<=\\w)i(?=\\w)','combining',NULL),(63,'(?<=\\w)morph','change','greek'),(65,'(?<=\\w)logy','discourse, study','latin'),(66,'quasi(?=\\w)','similar','latin'),(67,'an?(?=\\w)','not, without','greek'),(74,'(?<=\\w)acusis','hearing','greek'),(75,'ad(?=\\w)','at, increase, on, toward','greek'),(76,'aden(?=\\w)','gland','latin'),(77,'ab(?=\\w)','from, away','latin'),(78,'(?<=\\w)ac','pertaining to','latin'),(79,'acanth(?=\\w)','thorn, spine','greek'),(80,'acous(?=\\w)','hearing','greek'),(81,'acr(?=\\w)','sharp','latin'),(82,'ant(?=\\w)','opposite','latin'),(86,'(?<=\\w)ad','group, unit of a certain number','greek'),(87,'adip(?=\\w)','fatty tissue','latin'),(88,'(?<=\\w)a?emia','blood condition','greek'),(90,'aesthesi(?=\\w)','sensation','greek'),(92,'alb(?=\\w)','dull white, pale color','latin'),(93,'alge(?:si)?(?=\\w)','pain','greek'),(94,'(?<=\\w)algia','pain','greek'),(95,'algi?(?=\\w)','pain','greek'),(96,'all(?=\\w)','different, an addition','greek'),(97,'amb(?=\\w)','positioned on both sides','latin'),(98,'amni(?=\\w)','fetal sac','greek'),(99,'amph(?=\\w)','both sides','greek'),(100,'ana(?=\\w)','back, again, up','greek'),(101,'andr(?=\\w)','man','greek'),(102,'angi(?=\\w)','blood vessel','greek'),(103,'aniso(?=\\w)','unequal','greek'),(104,'an[ck]yl(?=\\w)','crooked or bent','greek'),(105,'ante(?=\\w)','in front','latin'),(106,'anti(?=\\w) ','against, opposed','latin'),(107,'apo(?=\\w)','away, separated, derived','greek'),(108,'arch(?=\\w)','first, primitive','latin'),(109,'arsen(?=\\w)','masculine','greek'),(110,'arteri(?=\\w)','artery','greek'),(111,'arthr(?=\\w)','joints, limbs','greek'),(112,'articul(?=\\w)','joint','latin'),(114,'(?<=\\w)ase','enzyme','greek'),(115,'(?<=\\w)asthenia','weakness','greek'),(116,'atel(?=\\w)','imperfect, incomplete',NULL),(117,'ather(?=\\w)','fatty deposit','greek'),(118,'(?<=\\w)ation','process','latin'),(119,'atri(?=\\w)','atrium','latin'),(120,'auri?(?:cul)?(?=\\w)','ear','latin'),(121,'aut(?=\\w)','self, same','greek'),(122,'aux(?=\\w)','increase, growth','greek'),(123,'axill(?=\\w)','armpit','latin'),(124,'azo(?=\\w)','nitrogenous compound','greek'),(125,'balano?(?=\\w)','penis, clitoridis','greek'),(126,'blast(?=\\w)','germ, bud','greek'),(127,'blephar(?=\\w)','eyelid','greek'),(128,'brac(?=\\w)','arm, support','latin'),(129,'brady(?=\\w)','slow','greek'),(130,'bronch(?=\\w)','airway','greek'),(131,'bucc(?=\\w)','cheek','latin'),(132,'burs(?=\\w)','pouch, purse','latin'),(135,'capill(?=\\w)','hair','latin'),(136,'capit(?=\\w)','head','latin'),(137,'carcin(?=\\w)','cancer','greek'),(138,'cardi(?=\\w)','heart','greek'),(139,'carp(?=\\w)','wrist','greek'),(140,'cata(?=\\w)','down, under','greek'),(141,'(?<=\\w)cele','pouching, hernia','greek'),(142,'(?<=\\w)centesis','surgical puncture','greek'),(143,'cephal(?=\\w)','head','latin'),(144,'cerat(?=\\w)','horn','greek'),(145,'cerebell(?=\\w)','cerebellum','latin'),(146,'cerebr(?=\\w)','brain','latin'),(147,'cervic(?=\\w)','neck, cervix','latin'),(148,'chem(?=\\w)','chemistry, drug','latin'),(149,'che?ir(?=\\w)','hand',NULL),(150,'chlor(?=\\w)','green','greek'),(151,'chol(?=\\w)','bile','greek'),(152,'cholecyst(?=\\w)','gallbladder','greek'),(153,'chondri?(?=\\w)','cartilage, gristle, granule, granular','greek'),(154,'chrom(?:at)?(?=\\w)','color','greek'),(155,'(?<=\\w)cid(?:al|e)','killing, destroying','latin'),(156,'cili(?=\\w)','eyelash, eyelid','latin'),(157,'circ(?:um)?(?=\\w)','around','latin'),(158,'cis(?=\\w)','this side, here','latin'),(159,'(?<=\\w)clast','break','latin'),(161,'col(?:on)?(?=\\w)','colon',NULL),(162,'colp(?=\\w)','vagina','greek'),(163,'co[mr]?(?=\\w)','with, together, in association','latin'),(164,'contra(?=\\w)','against','latin'),(165,'core?(?=\\w)','eye pupil','greek'),(166,'cornu?(?=\\w)','horn','latin'),(167,'coron(?=\\w)','crown','latin'),(168,'cost(?=\\w)','rib','latin'),(169,'cox(?=\\w)','hip','latin'),(170,'crani(?=\\w)','skull','latin'),(171,'(?<=\\w)crine','secrete','greek'),(172,'crin(?=\\w)','secrete','greek'),(173,'cryo(?=\\w)','cold','greek'),(175,'cyan(?=\\w)','blue','greek'),(176,'cycl(?=\\w)','circle, cycle','greek'),(177,'cyph(?=\\w)','bent','greek'),(178,'cyst(?=\\w)','bladder','greek'),(179,'cyt(?=\\w)','cell','greek'),(180,'(?<=\\w)cyte','cell','greek'),(189,'accipitr(?=\\w)','hawk','latin'),(190,'acer(?=\\w)','maple','latin'),(192,'acerb(?=\\w)','bitter','latin'),(193,'acerv(?=\\w)','heap','latin'),(194,'acet(?=\\w)','vinegar','latin'),(195,'acin(?=\\w)','berry','latin'),(196,'acu(?=\\w)','needle','latin'),(197,'aed(?=\\w)','building','latin'),(198,'[ei]qu(?=\\w)','even, level','latin'),(199,'aer(?=\\w)','ore','latin'),(200,'aev(?=\\w)','age, eon','latin'),(201,'[ae]gr(?=\\w)','field','latin'),(202,'al(?=\\w)','wing','latin'),(203,'alacr(?=\\w)','quick','latin'),(204,'ali(?=\\w)','other','latin'),(205,'ampl(?=\\w)','ample','latin'),(206,'angu(?=\\w)','snake','latin'),(207,'angul(?=\\w)','corner','latin'),(208,'anim(?=\\w)','breath, soul, life, mind, anger, spirit','latin'),(209,'[ae]nn(?=\\w)','year','latin'),(210,'anser(?=\\w)','goose','latin'),(211,'aqu(?=\\w)','water','latin'),(212,'aquil(?=\\w)','eagle','latin'),(213,'arbor(?=\\w)','tree','latin'),(214,'argent(?=\\w)','silver','latin'),(215,'arm(?=\\w)','weapon','latin'),(216,'art(?=\\w)','art, skill','latin'),(217,'(?<=\\w)ert','art, skill','latin'),(218,'asin(?=\\w)','donkey','latin'),(219,'asper(?=\\w)','rough','latin'),(220,'audac(?=\\w)','brave, bold','latin'),(221,'aur(?=\\w)','gold','latin'),(222,'avi(?:cul)?(?=\\w)','bird','latin'),(223,'avuncul(?=\\w)','uncle','latin'),(224,'axi(?=\\w)','axle','latin'),(225,'bac(?=\\w)','berry','latin'),(226,'bacill(?=\\w)','staff','latin'),(227,'barb(?=\\w)','beard','latin'),(228,'beat(?=\\w)','blessed','latin'),(229,'bell(?=\\w)','war, pretty','latin'),(230,'ben(?=\\w)','good','latin'),(231,'besti(?=\\w)','animal','latin'),(232,'bon(?=\\w)','good','latin'),(233,'melior(?=\\w)','better','latin'),(234,'optim(?=\\w)','best','latin'),(235,'bov(?=\\w)','cow','latin'),(236,'botul(?=\\w)','sausage','latin'),(237,'brev(?=\\w)','brief, short','latin'),(238,'bulb(?=\\w)','bulbous','latin'),(239,'bull(?=\\w)','bubble, flask','latin'),(240,'butyr(?=\\w)','butter','latin'),(241,'ca[bv]al(?=\\w)','horse','latin'),(242,'(?<=\\w)culc','heel','latin'),(243,'calc(?=\\w)','limestone, pebble','latin'),(244,'camer(?=\\w)','vault','latin'),(245,'camp(?=\\w)','field','latin'),(246,'candel(?=\\w)','candle','latin'),(247,'can(?=\\w)','dog','latin'),(248,'capr(?=\\w)','goat','latin'),(249,'caps(?:ul)?(?=\\w)','box, case','latin'),(250,'(?<=\\w)cipit','head','latin'),(251,'carbon(?=\\w)','coal','latin'),(252,'carcer(?=\\w)','jail','latin'),(253,'cardin(?=\\w)','hinge','latin'),(254,'carn(?=\\w)','flesh','latin'),(255,'cas(?=\\w)','house','latin'),(256,'case(?=\\w)','cheese','latin'),(257,'cast(?=\\w)','pure','latin'),(258,'(?<=\\w)cest','pure','latin'),(259,'caten(?=\\w)','chain','latin'),(260,'c(?:au|o)d(?=\\w)','tail','latin'),(261,'c(?:au|o)l(?=\\w)','stalk, stem','latin'),(262,'caus(?=\\w)','accusative, causality','latin'),(263,'(?<=\\w)cus','accusative, causality','latin'),(264,'cav(?=\\w)','hollow','latin'),(265,'celebr(?=\\w)','famous','latin'),(266,'celer(?=\\w)','quick','latin'),(267,'cent(?=\\w)','hundred','latin'),(268,'cer(?=\\w)','wax','latin'),(269,'cert(?=\\w)','certain','latin'),(270,'cerv(?=\\w)','deer','latin'),(271,'ceter(?=\\w)','other','latin'),(272,'ciner(?=\\w)','ashes','latin'),(273,'cirr(?=\\w)','curl, tentacle','latin'),(274,'citr(?=\\w)','on this side','latin'),(275,'civ(?=\\w)','citizen','latin'),(276,'clar(?=\\w)','clear','latin'),(277,'clav(?=\\w)','key','latin'),(278,'clement(?=\\w)','mild','latin'),(279,'codic(?=\\w)','codex','latin'),(280,'coll(?=\\w)','hill, neck','latin'),(281,'color(?=\\w)','color','latin'),(282,'col(?=\\w)','strainer','latin'),(283,'cord(?=\\w)','heart','latin'),(284,'corb(?=\\w)','basket','latin'),(285,'corp(?:or|uscul)?(?=\\w)','body','latin'),(286,'cortic(?=\\w)','bark, rind','latin'),(287,'corv(?=\\w)','raven','latin'),(288,'cras(?=\\w)','tomorrow','latin'),(289,'crass(?=\\w)','thick','latin'),(290,'cret(?=\\w)','chalk','latin'),(291,'cribr(?=\\w)','sieve','latin'),(292,'crimin(?=\\w)','criminal','latin'),(293,'crisp(?=\\w)','curled','latin'),(294,'crist(?=\\w)','crest','latin'),(295,'crur(?=\\w)','leg, shank','latin'),(296,'crust(?=\\w)','crust','latin'),(297,'cruc(?=\\w)','cross','latin'),(298,'culic(?=\\w)','gnat','latin'),(299,'culin(?=\\w)','kitchen','latin'),(300,'culp(?=\\w)','blame, fault','latin'),(301,'cune(?=\\w)','wedge','latin'),(302,'cur(?=\\w)','care','latin'),(303,'curt(?=\\w)','shortened','latin'),(304,'curv(?=\\w)','bent','latin'),(305,'cuspid(?=\\w)','tip','latin'),(306,'cut(?=\\w)','hide, skin','latin'),(307,'damn(?=\\w)','harm','latin'),(308,'(?<=\\w)demn','harm','latin'),(309,'dec[ei]m(?=\\w)','ten','latin'),(310,'decor(?=\\w)','decorate','latin'),(311,'dent(?=\\w)','tooth','latin'),(312,'dens(?=\\w)','thick','latin'),(313,'deter(?=\\w)','worse','latin'),(314,'de(?=\\w)','reversal, undoing, removing','latin'),(315,'dextr?(?=\\w)','right','latin'),(316,'die(?=\\w)','day','latin'),(317,'digit(?=\\w)','finger, toe','latin'),(318,'discip(?=\\w)','student','latin'),(319,'domin(?=\\w)','lord','latin'),(320,'dom(?=\\w)','house','latin'),(321,'dors(?=\\w)','back','latin'),(322,'dot(?=\\w)','dowry','latin'),(323,'dulc(?=\\w)','sweet','latin'),(324,'du(?=\\w)','two','latin'),(325,'duoden(?=\\w)','twelve','latin'),(326,'dur(?=\\w)','hard','latin'),(327,'ens(?=\\w)','sword','latin'),(328,'equ(?=\\w)','horse','latin'),(329,'eruc(?=\\w)','caterpillar','latin'),(330,'exter(?=\\w)','outer','latin'),(331,'extrem(?=\\w)','outmost','latin'),(332,'fab(?=\\w)','bean','latin'),(333,'fabr(?=\\w)','make','latin'),(334,'faen(?=\\w)','hay','latin'),(335,'falc(?=\\w)','sickle','latin'),(336,'fam(?=\\w)','hunger','latin'),(337,'fan(?=\\w)','temple','latin'),(338,'fasc(?=\\w)','bundle','latin'),(339,'fatu(?=\\w)','foolish, useless','latin'),(340,'fauc(?=\\w)','throat','latin'),(341,'(?<=\\w)foc','throat','latin'),(342,'febr(?=\\w)','fever','latin'),(343,'fel(?=\\w)','cat','latin'),(344,'felic(?=\\w)','happy','latin'),(345,'femin(?=\\w)','woman','latin'),(346,'femor(?=\\w)','thigh','latin'),(347,'fenestr(?=\\w)','window','latin'),(348,'feroc(?=\\w)','fierce','latin'),(349,'ferr(?=\\w)','iron','latin'),(350,'fer(?=\\w)','wild','latin'),(351,'feud(?=\\w)','fee','latin'),(352,'fic(?=\\w)','fig','latin'),(353,'fid(?=\\w)','faith, trust','latin'),(354,'fili(?=\\w)','daughter','latin'),(355,'fil(?=\\w)','thread','latin'),(356,'fin(?=\\w)','end, limit','latin'),(357,'firm(?=\\w)','firm','latin'),(358,'fisc(?=\\w)','basket','latin'),(359,'fistul(?=\\w)','pipe, tube','latin'),(360,'flacc(?=\\w)','flabby','latin'),(361,'flamm?(?=\\w)','flame','latin'),(362,'flav(?=\\w)','yellow','latin'),(363,'flocc(?=\\w)','tuft','latin'),(364,'flor(?=\\w)','flower','latin'),(365,'foc(?=\\w)','hearth','latin'),(366,'foli(?=\\w)','leaf','latin'),(367,'foll(?=\\w)','bellows','latin'),(368,'font(?=\\w)','fountain, spring','latin'),(369,'for(?=\\w)','outdoors','latin'),(370,'form(?=\\w)','shape','latin'),(371,'formic(?=\\w)','ant','latin'),(372,'fornic(?=\\w)','vault','latin'),(373,'fort(?=\\w)','luck, strong','latin'),(374,'fove(?=\\w)','shallow round depression','latin'),(375,'frate?r(?=\\w)','brother','latin'),(376,'fraud(?=\\w)','fraud','latin'),(377,'frequent(?=\\w)','often','latin'),(378,'front(?=\\w)','forehead','latin'),(379,'frust(?=\\w)','piece','latin'),(380,'frug(?=\\w)','fruit','latin'),(381,'fum(?=\\w)','smoke','latin'),(382,'fo?und(?=\\w)','bottom','latin'),(383,'fung(?=\\w)','mushroom','latin'),(384,'fun(?=\\w)','rope','latin'),(385,'furt?(?=\\w)','thief, theft','latin'),(386,'furc(?=\\w)','fork','latin'),(387,'fusc(?=\\w)','dark','latin'),(388,'fus(?=\\w)','spindle','latin'),(389,'gel(?=\\w)','gel','latin'),(390,'gen(?:u|icul)(?=\\w)','knee','latin'),(391,'gener(?=\\w)','birth, offspring, creation','latin'),(392,'germ(?:in)?(?=\\w)','germ','latin'),(393,'glaci(?=\\w)','ice','latin'),(394,'gladi(?=\\w)','sword','latin'),(395,'glut[ei]n(?=\\w)','glue','latin'),(396,'grad(?=\\w)','step','latin'),(397,'grand(?=\\w)','large','latin'),(398,'gran(?:ul)?(?=\\w)','grain','latin'),(399,'grat(?=\\w)','praise','latin'),(400,'grav(?=\\w)','heavy','latin'),(401,'greg(?=\\w)','flock, herd','latin'),(402,'gross(?=\\w)','thick','latin'),(403,'gust(?=\\w)','taste','latin'),(404,'gutt(?=\\w)','drop','latin'),(405,'guttur(?=\\w)','throat','latin'),(406,'ham(?=\\w)','hook','latin'),(407,'haren(?=\\w)','sand','latin'),(408,'hast(?=\\w)','spear','latin'),(409,'herb(?=\\w)','grass','latin'),(410,'her(?:ed|it)(?=\\w)','inherit','latin'),(411,'hiem(?=\\w)','winter','latin'),(412,'hirc(?=\\w)','goat','latin'),(413,'hom(?:in|uncul)?(?=\\w)','man','latin'),(414,'hum(?=\\w)','ground','latin'),(415,'honor(?=\\w)','honor','latin'),(416,'hort(?=\\w)','garden','latin'),(417,'host(?=\\w)','enemy','latin'),(418,'ign(?=\\w)','fire','latin'),(419,'imbecil(?=\\w)','weak','latin'),(420,'inan(?=\\w)','inane','latin'),(421,'inferior(?=\\w)','lower','latin'),(422,'infim(?=\\w)','lowest','latin'),(423,'inguin(?=\\w)','groin','latin'),(424,'insul(?=\\w)','island','latin'),(425,'inter(?:ior)?(?=\\w)','internal','latin'),(426,'intim(?=\\w)','internal','latin'),(427,'joc(?:ul)?(?=\\w)','jest','latin'),(428,'jud(?:ic)?(?=\\w)','judge','latin'),(429,'iug(?=\\w)','yoke','latin'),(430,'jur(?=\\w)','law, right','latin'),(431,'juven(?=\\w)','young','latin'),(432,'(?<=\\w)ile','capability, susceptibility','latin'),(433,'(?<=\\w)ia','state','latin'),(434,'(?<=\\w)[ai]ble','capable','latin'),(435,'(?<=\\w)ade','action, process','latin'),(436,'(?<=\\w)age','aggregate, process, outcome','latin'),(437,'(?<=\\w)i?an','provenance, membership','latin'),(438,'(?<=\\w)anc[ey]','state or quality','latin'),(439,'(?<=\\w)[aeo]ry','pertaining to, connected with','latin'),(440,'(?<=\\w)ician','occupation','latin'),(441,'(?<=\\w)cy','rank, office','latin'),(442,'(?<=\\w)cu?le','very small','latin'),(443,'(?<=\\w)dom','condition, state. domain, jurisdiction','latin'),(444,'(?<=\\w)ee','beneficiary','latin'),(445,'(?<=\\w)en','made of','latin'),(446,'(?<=\\w)enc[ey]','action, state of, quality',''),(447,'(?<=\\w)[eo]r','one who, that which','latin'),(448,'(?<=\\w)escent','inchoative','latin'),(449,'(?<=\\w)ese','native, language','latin'),(450,'juvin(?=\\w)','young','latin'),(451,'(?<=\\w)[eo]sis','action, process, condition','greek'),(452,'(?<=\\w)ess','female','latin'),(453,'(?<=\\w)et(?:te)?','small, group',''),(454,'(?<=\\w)fic','making, causing','latin'),(455,'aero?(?=\\w)','air','greek'),(456,'di(?=\\w)','two','greek'),(457,'dis(?=\\w)','apart, away','latin'),(458,'(?<=\\w)mobile','to move','latin'),(459,'mega(?=\\w)','large, great','greek'),(460,'(?<=\\w)lith','stone','greek'),(461,'meta(?=\\w)','with, across, after','greek'),(462,'climat(?=\\w)','slope','greek'),(463,'solec(?=\\w)','grammar','greek'),(464,'(?<=\\w)ism','action, state, condition','greek'),(465,'(?<=\\w)ist','maker, proscriber, owner','greek'),(466,'verm(?=\\w)','worm',''),(467,'(?<=\\w)fuge','stun',''),(469,'para(?=\\w)','above, beyond, beside, near',''),(470,'(?<=\\w)legal','law','latin'),(475,'XXX','qqq','foo'),(476,'(?<=\\w)ultimate','last',''),(477,'pen(?=\\w)','almost','latin'),(478,'diluv(?=\\w)','flood','latin'),(479,'(?<=\\w)ous','full of','latin'),(480,'phylo(?=\\w)','classification','greek'),(481,'gene?(?=\\w)','heredity','greek'),(482,'somn(?=\\w)','sleep','latin'),(483,'(?<=\\w)loq(?:uy)','speech','latin'),(484,'ambul(?=\\w)','walking','latin'),(485,'trop(?=\\w)','exhibiting behavior; turning, changing','greek'),(486,'ephemer(?=\\w)','short-lived, temporary','greek'),(487,'fulmin(?=\\w)','verbal attack','latin'),(488,'(?<=\\w)ate','having the specified thing','latin'),(489,'ridicul(?=\\w)','laughable, comical, amusing, absurd','latin'),(490,'(?<=\\w)escent','beginning to be; becoming','latin'),(491,'epi(?=\\w)','upon','greek'),(492,'(?<=\\w)phan','appear, display','greek'),(493,'plagio(?=\\w)','oblique','greek'),(494,'meso(?=\\w)','middle','greek'),(495,'sphyxi(?=\\w)','pulse','greek'),(496,'prot(?=\\w)','first','greek'),(497,'neo(?=\\w)','new','greek'),(498,'nepo(?=\\w)','nephew','latin'),(499,'(?<=\\w)saur','lizard','greek'),(500,'(?<=\\w)us','adjective-forming','latin'),(501,'raptor','thief','latin'),(502,'dino','terrible, awesome, mighty','greek'),(503,'klept','steal','greek'),(504,'(?<=\\w)mania','compulsion, obsession',''),(505,'veloci(?=\\w)','veloci','latin'),(506,'plur(?=\\w)','many, multiple','latin'),(507,'(?<=\\w)form','form, contour, figure, shape, appearance','latin'),(508,'pyr(?=\\w)','fire','greek'),(509,'(?<=\\w)tom','cut','greek'),(510,'e[ckx](?=\\w)','out','greek'),(511,'socio(?=\\w)','society','latin'),(512,'thylac(?=\\w)','pouch','greek'),(513,'carni(?=\\w)','flesh','latin'),(514,'(?<=\\w)fex','maker, performer','latin'),(515,'(?<=\\w)didact','teach','greek'),(516,'(?<=\\w)stance','stood',''),(517,'sub(?=\\w)','under',''),(518,'sym(?=\\w)','with, in company with, together with','greek'),(519,'(?<=\\w)plasm','cell or tissue substance','greek'),(520,'psych(?=\\w)','mind, mental','greek'),(521,'uni(?=\\w)','one','latin'),(522,'verse','turned','latin'),(523,'morph(?=\\w)','change','greek');
/*!40000 ALTER TABLE `fragment` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-06-28 20:55:34
