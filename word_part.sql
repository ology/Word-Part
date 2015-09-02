-- MySQL dump 10.13  Distrib 5.5.44, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: word_part
-- ------------------------------------------------------
-- Server version	5.5.44-0ubuntu0.14.04.1

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
  `token` varchar(255) NOT NULL DEFAULT '',
  `username` varchar(20) NOT NULL DEFAULT '',
  `created` datetime NOT NULL,
  `active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_access`
--

LOCK TABLES `api_access` WRITE;
/*!40000 ALTER TABLE `api_access` DISABLE KEYS */;
INSERT INTO `api_access` VALUES (2,'{SSHA}f+Qdj5FlY1RsPhPW3GGw3pN2y9l/SrMz','gene','2015-08-28 00:00:00',1);
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `affix` (`affix`)
) ENGINE=InnoDB AUTO_INCREMENT=620 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fragment`
--

LOCK TABLES `fragment` WRITE;
/*!40000 ALTER TABLE `fragment` DISABLE KEYS */;
INSERT INTO `fragment` VALUES (1,'^an?(?=\\w)','not, without','greek'),(2,'e[cfx](?=\\w)','out of','latin'),(3,'(?<=\\w)i$','plural form','latin'),(4,'(?<=\\w)[ce]?y','quality, state, condition','latin'),(6,'ab(?=\\w)','away from; outside of','latin'),(7,'(?<=\\w)ac','one affected with','greek'),(8,'(?<=\\w)ad','a unit','greek'),(9,'ad(?=\\w)','near, at; toward, to, tendency, addition','latin'),(10,'(?<=\\w)ae?$','word terminator','greek'),(11,'(?<=\\w)al','of or pertaining to','latin'),(13,'al(?=l)','near, at. toward, to, tendency, addition','latin'),(15,'(?<=\\w)(?:ia|a)?n','of or pertaining to','latin'),(16,'(?<=\\w)ar','of, near, pertaining to','latin'),(17,'(?<=\\w)as','plural','latin'),(19,'(?<=\\w)ax','tendency, inclination to','latin'),(20,'bi(?=\\w)','two','latin'),(22,'co(?=\\w)','together, mutually, jointly','latin'),(23,'de(?=\\w)','reversal, undoing, removing','latin'),(24,'di(?=\\w)','two, twice','greek'),(25,'e[mn](?=\\w)','in, into, on, onto','latin'),(26,'(?<=\\w)er','action','other'),(27,'eu(?=\\w)','well, good','greek'),(28,'(?<=\\w)i?fy','make','latin'),(29,'(?<=\\w)ia','taxonomic name','greek'),(30,'(?<=\\w)ic','of or pertaining to','other'),(31,'il(?=l)','not','latin'),(32,'im(?=[bmp])','not','latin'),(33,'in(?=\\w)','in, into, towards, within','latin'),(34,'ir(?=r)','not','latin'),(35,'is(?=[aeiouy])','equal','greek'),(36,'ly(?=[aeiouy])','loosen, dissolve','greek'),(37,'my(?=\\w)','muscle','greek'),(38,'ob(?=\\w)','against; facing','latin'),(39,'(?<=\\w)on','basic, fundamental unit','greek'),(40,'oo(?=\\w)','egg, ovum','greek'),(41,'(?<=\\w)or','person who does something','other'),(42,'ot(?=\\w)','ear','greek'),(43,'re(?=\\w)','again, anew','latin'),(44,'(?<=\\w)um','singular grammatical number','latin'),(45,'un(?=\\w)','absent, lacking, not','other'),(46,'(?<=\\w)yl','wood, material','greek'),(47,'abs(?=[ct])','away from; outside of','latin'),(48,'a(?=[mpv])','away from; outside of','latin'),(49,'(?<=\\w)ade','denoting action','latin'),(50,'(?<=\\w)age','state, relationship; process, action, result','other'),(51,'(?<=\\w)i?ana','collection of things','latin'),(52,'ana(?=\\w)','up, on, again','greek'),(53,'ano(?=\\w)','anus','latin'),(54,'(?<=\\w)ant','agent','other'),(55,'ant(?=[aeiouy])','against, opposite of, reverse','greek'),(56,'apo(?=\\w)','away from, separate; without, lacking','greek'),(57,'arc(?=\\w)','bow','latin'),(58,'(?<=\\w)ary','of or pertaining to','latin'),(59,'(?<=\\w)ate','having property','latin'),(60,'aur(?=\\w)','gold','latin'),(61,'aut(?=[aeiouy])','oneself','greek'),(62,'bar[oy](?=\\w)','weight, pressure','greek'),(63,'bio(?=\\w)','life','greek'),(64,'(?<=\\w)bot','automaton','other'),(65,'cen(?=\\w)','most recent common','greek'),(66,'cis(?=\\w)','on this side of','latin'),(67,'col(?=l)','with','latin'),(68,'com(?=bmp)','with','latin'),(69,'co[ln](?=\\w)','with','latin'),(70,'cyt(?=\\w)','container, receptacle','greek'),(71,'dec(?=[aeiouy])','ten','greek'),(72,'dia(?=\\w)','through, across','greek'),(73,'dis(?=\\w)','reversal, removal; apart','latin'),(74,'duo(?=\\w)','two','latin'),(75,'dys(?=\\w)','bad','greek'),(76,'eco(?=\\w)','ecology, environment','greek'),(77,'ego(?=\\w)','relating to the self','latin'),(78,'(?<=\\w)eme','linguistic base unit','greek'),(79,'en[dt](?=\\w)','internal, within, inside','greek'),(80,'(?<=\\w)ent','causing, promoting, doing','latin'),(81,'epi(?=\\w)','above, over, on, in addition to','greek'),(82,'equ(?=\\w)','equal, balanced, identical','latin'),(83,'(?<=\\w)ess$','female form','greek'),(84,'exo(?=\\w)','outside, external','greek'),(85,'(?<=\\w)fex','maker, performer','latin'),(86,'(?<=\\w)fix','fasten','latin'),(87,'(?<=\\w)gen','producer of','greek'),(88,'geo(?=\\w)','earth','greek'),(89,'(?<=\\w)gon','plane figure','greek'),(91,'gon(?=\\w)','genitals','greek'),(92,'gyn(?=\\w)','woman','greek'),(93,'ha?em','blood','greek'),(94,'hex(?=[aeiouy])','six','greek'),(95,'hol(?=\\w)','whole','greek'),(96,'hyl(?=\\w)','matter, wood','greek'),(97,'hyo(?=\\w)','pig','greek'),(98,'(?<=\\w)ica','collection of things','latin'),(99,'(?<=\\w)ile','tending to, or capable of','latin'),(100,'(?<=\\w)ine','of or pertaining to, like','greek'),(101,'(?<=\\w)ing','gerund formation','other'),(102,'(?<=\\w)ion','action, process; state, condition','latin'),(103,'irid?(?=\\w)','relating to the iris','greek'),(104,'(?<=\\w)ism','principle, belief, movement','greek'),(105,'(?<=\\w)ist','person with a particular role','greek'),(106,'(?<=\\w)ite',' follower, adherent','latin'),(107,'(?<=\\w)ity','form nouns from adjectives','latin'),(108,'(?<=\\w)ium','setting where a given activity is carried out','latin'),(109,'(?<=\\w)(?:at)?ive','relating, belonging to, tending to','latin'),(110,'(?<=\\w)ize?','to make','greek'),(111,'(?<=\\w)let','diminutive','latin'),(112,'lip(?=\\w)','fat','greek'),(113,'(?<=\\w)log(?:ue)?','discourse','greek'),(114,'mal(?=\\w)','bad, badly','latin'),(115,'(?<=\\w)mer','part','greek'),(116,'mes(?=\\w)','middle','greek'),(117,'mon(?=\\w)','alone, only, sole, single','greek'),(118,'neo(?=\\w)','new','greek'),(119,'nom(?=\\w)','law, legislation','greek'),(120,'non(?=\\w)','not','latin'),(121,'(?<=\\w)nym','type of word or name','greek'),(122,'oct(?=[aeiouy])','eight','greek'),(123,'(?<=\\w)ode','way, path','greek'),(124,'(?<=\\w)oid','similar form, likeness of','greek'),(125,'(?<=\\w)oma(?:ta|s)?','disease, morbidity, tumor','greek'),(126,'(?<=\\w)ome','mass of something','greek'),(127,'omo(?=\\w)','shoulder, scapula','greek'),(128,'oro(?=\\w)','mouth','latin'),(129,'(?<=\\w)ory','of or pertaining to, serving for','latin'),(130,'(?<=\\w)ose','full of, like','latin'),(131,'oto(?=\\w)','ear-like','greek'),(132,'(?<=\\w)(?:ane|i)?ous','form adjectives from nouns','latin'),(133,'ovo(?=\\w)','egg, ova','latin'),(134,'oxo(?=\\w)','oxygen','greek'),(135,'oxy(?=\\w)','sharp, keen, acute, pungent, acid','greek'),(136,'pan(?:t|ta|to)?(?=\\w)','all','greek'),(137,'pen(?=\\w)','nearly, almost','latin'),(138,'per(?=\\w)','through, thoroughly, to destruction','latin'),(139,'(?<=\\w)pod','related to or resembling a foot','greek'),(140,'pod(?=\\w)','foot','greek'),(141,'pre(?=\\w)','before','latin'),(142,'pro(?=\\w)','agreeing with, supporting, favoring','latin'),(143,'pyo(?=\\w)','of or relating to pus','greek'),(144,'pyr(?=\\w)','fire, heat','greek'),(145,'sext?(?=\\w)','six','latin'),(146,'(?<=\\w)s[ei]s','action, process','greek'),(147,'(?<=\\w)sol','soil','latin'),(148,'sub(?=\\w)','under, beneath; subsidiary, secondary; almost, nearly','latin'),(149,'syl(?=l)','with, together','greek'),(150,'sym(?=[bmp])','identical; with, together; concomitant','greek'),(151,'syn(?=\\w)','identical; with, together; concomitant','greek'),(152,'tax(?=\\w)','order, arrangement','greek'),(153,'ter(?=\\w)','three','latin'),(154,'the(?=\\w)','god, diety','greek'),(155,'tox(?=[aeiouy])','poison','greek'),(156,'tri(?=\\w)','three','greek'),(157,'(?<=\\w)ule','diminutive','latin'),(158,'uni(?=\\w)','one','latin'),(159,'uro(?=\\w)','urine','greek'),(160,'vas(?=[aeiouy])','blood vessels, vascular system','latin'),(161,'xen(?=\\w)','foreign','greek'),(162,'xer(?=\\w)','dry','greek'),(163,'xyl(?=\\w)','wood','greek'),(164,'xyr(?=\\w)','razor','greek'),(165,'zoo(?=\\w)','animals','greek'),(166,'zyg(?=\\w)','union, pair','greek'),(167,'zym(?=\\w)','fermentation','greek'),(168,'(?<=\\w)phile?','loving, friendly, friend','greek'),(169,'(?<=\\w)phobe?','fear, hates, despises','greek'),(171,'(?<=\\w)acanth(?:us)?','spine','greek'),(172,'(?<=\\w)aceous','of, relating to, resembling','latin'),(173,'(?<=\\w)[ai]city','having the quality of','latin'),(174,'(?<=\\w)aemia','blood','greek'),(175,'(?<=\\w)agogue','someone who leads','greek'),(176,'(?<=\\w)agogy','leading','greek'),(177,'(?<=\\w)algia','pain, suffering','greek'),(178,'ambul','walk','latin'),(179,'(?<=\\w)andry','male mate, husband','greek'),(180,'(?<=\\w)angle','internal angles','latin'),(181,'(?<=\\w)ang(?:le|ular)','internal angles','latin'),(182,'(?<=\\w)anthropy','humanity','greek'),(183,'(?<=\\w)arium','place, device','latin'),(184,'(?<=\\w)aster','little, petty, partial, incomplete','latin'),(185,'(?<=\\w)astic','of or relating to','greek'),(186,'(?<=\\w)athlon','contest','greek'),(187,'(?<=\\w)atory','of, relating to, connected with; place of activity','latin'),(188,'(?<=[ai])bility','ability, inclination, suitability','latin'),(189,'(?<=\\w)blast','immature cell or tissue','greek'),(190,'(?<=\\w)cardia','heart','greek'),(191,'(?:en)?cephal','head, brain','greek'),(192,'(?<=\\w)chore','spread','greek'),(193,'(?<=\\w)clase','fracture','greek'),(194,'(?<=\\w)clast','breaks or destroys','greek'),(195,'cline?','slope','greek'),(196,'(?<=\\w)cocc','spherical microorganism','greek'),(197,'(?<=\\w)colous','habitat','greek'),(198,'(?<=\\w)cracy','rule','greek'),(199,'(?<=\\w)crasy','temperament, constituent pattern','greek'),(200,'(?<=\\w)cycle','circle','greek'),(201,'(?<=\\w)dipsia','thirst','greek'),(202,'(?<=\\w)drome','race course','greek'),(203,'(?<=\\w)dromous','running, moving','greek'),(204,'(?<=\\w)dynia','pain','greek'),(205,'(?<=\\w)ectomy','excision of; removal of','greek'),(206,'(?<=\\w)enchyma','cellular tissue','greek'),(207,'(?<=\\w)ergic','produced by; activated by','greek'),(208,'(?<=\\w)escence','process, state','latin'),(209,'(?<=\\w)escent','beginning to be, becoming; resembling','latin'),(210,'(?<=\\w)facient','causing','latin'),(211,'(?<=\\w)faction','production, process, making','latin'),(212,'(?<=\\w)ferous','producing, containing','latin'),(213,'(?<=\\w)fication','becoming','latin'),(214,'(?<=\\w)fugal','travelling out from','latin'),(215,'(?<=\\w)gamous','number or form of marriage; form of reproduction, or reproductive organs','greek'),(216,'(?<=\\w)genesis','origin; production','greek'),(217,'(?<=\\w)genic','producing, generating','greek'),(218,'(?<=\\w)gerous','bearing, producing','latin'),(219,'(?<=\\w)gnathous','jaw','greek'),(220,'(?<=\\w)graph','write','greek'),(221,'(?<=\\w)hedr','solid figures','greek'),(222,'(?<=\\w)iasis','pathological condition or process','latin'),(223,'(?<=\\w)iatr','physician','greek'),(224,'(?<=\\w)ismus','condition or system','latin'),(225,'(?<=\\w)ation','action or process','latin'),(226,'(?<=\\w)kinesis','movement, motion','greek'),(227,'(?<=\\w)lalia','abnormal or disordered forms of speech','greek'),(228,'(?<=\\w)latry','worship','greek'),(229,'(?<=\\w)lepsy','fit or seizure','greek'),(230,'(?<=\\w)leptic','condition of seizing','greek'),(231,'(?<=\\w)lingual','speaking, languages','latin'),(232,'(?<=\\w)loquy','speaking, speech','latin'),(233,'(?<=\\w)ly','decomposition or breakdown; dissolving; disintegration','greek'),(234,'(?<=\\w)machy','battle, fight','greek'),(235,'(?<=\\w)man(?:ce|cy|tic)','divination','greek'),(236,'(?<=\\w)merous','having parts','greek'),(237,'(?<=\\w)met(?:er|ric|ry)','measure','greek'),(238,'(?<=\\w)mobile','vehicle, movable','latin'),(239,'(?<=\\w)morph','shape, form, structure','greek'),(240,'(?<=\\w)mycete','mushroom, fungus','greek'),(241,'(?<=\\w)odont','toothed','greek'),(242,'(?<=\\w)o?ecious','arrangement of sexual organs','greek'),(243,'(?<=\\w)opsia','deficiencies of sight','greek'),(244,'(?<=\\w)parous','number of times a woman has given birth','latin'),(245,'(?<=\\w)partite','having the specified number of parts','latin'),(246,'(?<=\\w)pause','pause or discontinuance','greek'),(247,'(?<=\\w)pedia','learning','greek'),(248,'(?<=\\w)penia','deficiency','greek'),(249,'phag(?:e|ia|o|ous|y)','eats, consumes','greek'),(250,'(?<=\\w)phasia','disorders and phenomena relating to words and speech','greek'),(251,'(?<=\\w)phone?','sound','greek'),(252,'(?<=\\w)phore?','bearer or carrier of','greek'),(253,'(?<=\\w)phrenia','mental disorder','greek'),(254,'(?<=\\w)phyll?','leaf','greek'),(255,'(?<=\\w)phyte?','plant','greek'),(256,'(?<=\\w)plas(?:ia|y)','growth or formation','greek'),(257,'(?<=\\w)plast','small body, structure, particle, or granule','greek'),(258,'(?<=\\w)plasty','molding or shaping','greek'),(259,'(?<=\\w)pleg(?:ia|ic)','paralysis','greek'),(260,'(?<=\\w)poeia','making or creating','greek'),(261,'(?<=\\w)poiesis','production, creation or formation','greek'),(262,'(?<=\\w)polis','city','greek'),(263,'(?<=\\w)pter','wing','greek'),(264,'(?<=\\w)rrhagia','excessive discharge or haemorrhage','greek'),(265,'(?<=\\w)rrhaphy','suture','greek'),(266,'(?<=\\w)rrhea','flowing','greek'),(267,'(?<=\\w)rrhexis','rupture, splitting','greek'),(268,'(?<=\\w)saurus','dinosaur','greek'),(269,'(?<=\\w)scope?','viewing instrument','greek'),(270,'(?<=\\w)sophy','wisdom, knowledge, learning','greek'),(271,'(?<=\\w)sphere','ball, globe','greek'),(272,'(?<=\\w)stasis','slowing down, stopping','greek'),(273,'(?<=\\w)static','slowing down, stopping','greek'),(274,'(?<=\\w)style','having columns','greek'),(275,'(?<=\\w)therapy','treatment of disease or disability','greek'),(276,'(?<=\\w)therm','temperature','greek'),(277,'(?<=\\w)topia','paradise','greek'),(278,'(?<=\\w)treme','hole or aperture','greek'),(279,'(?<=\\w)trope?','turns, affects, changes, responses, moves','greek'),(280,'(?<=\\w)troph','pertaining to food or nourishment','greek'),(281,'(?<=\\w)vore?','habitually eating, feeding on','latin'),(282,'abdomin(?=\\w)','abdominal','latin'),(283,'acanth(?=\\w)','thorn','greek'),(284,'acaro(?=\\w)','mite','greek'),(285,'actin(?=\\w)','radial form','greek'),(286,'aedoe(?=\\w)','genitalia','greek'),(287,'a?eolo(?=\\w)','continuous change','greek'),(288,'ailuro(?=\\w)','cat','greek'),(289,'aleuro(?=\\w)','wheat flour','greek'),(290,'amelo(?=\\w)','tooth enamel','greek'),(291,'amphi(?=\\w)','both','greek'),(292,'anarch(?=\\w)','without authorities','greek'),(293,'andro(?=\\w)','human; male','greek'),(294,'anemo(?=\\w)','wind','greek'),(295,'angio(?=\\w)','blood or lymph vessels','greek'),(296,'aniso(?=\\w)','unequal','greek'),(297,'antero(?=\\w)','anterior, front, forward','latin'),(298,'antho(?=\\w)','flowers','greek'),(299,'anthropo(?=\\w)','men or people','greek'),(300,'apeiro(?=\\w)','infinite','greek'),(301,'archa?eo(?=\\w)','ancient, early, primitive','greek'),(302,'archi(?=\\w)','chief, highest, most important','greek'),(303,'argyr(?=\\w)','silver','greek'),(304,'arteri(?=\\w)','artery','greek'),(305,'arthro(?=\\w)','joint, articulation','greek'),(306,'astro(?=\\w)','celestial body','greek'),(307,'auriculo(?=\\w)','ear','latin'),(308,'bath(?:o|y)(?=\\w)','deep','greek'),(309,'biblio(?=\\w)','books','greek'),(310,'blasto(?=\\w)','bud, budding, germination','greek'),(311,'boreo(?=\\w)','northern','greek'),(312,'brachio(?=\\w)','arm','latin'),(313,'branchio(?=\\w)','gills of fish','greek'),(314,'brepho(?=\\w)','baby','greek'),(315,'bronch(?=\\w)','lungs','latin'),(316,'butyro(?=\\w)','butter','latin'),(317,'calli(?=\\w)','beautiful','greek'),(318,'capno(?=\\w)','smoke','greek'),(319,'cardio(?=\\w)','heart','greek'),(320,'carpo(?=\\w)','wrist; fruit','greek'),(321,'caudo(?=\\w)','tail-shaped','latin'),(322,'centi(?=\\w)','hundred; one-hundredth','latin'),(323,'[ck]erauno(?=\\w)','thunderbolt, thunder, lightning','greek'),(324,'cervic(?=\\w)','neck or cervical vertebrae','latin'),(325,'chalco(?=\\w)','copper, brass; ore','greek'),(326,'chem(?=[io])','chemicals or chemistry','greek'),(327,'chilia(?=\\w)','thousand','greek'),(328,'chion(?=\\w)','snow','greek'),(329,'chiro(?=\\w)','hand','greek'),(330,'chlamyd(?=[aeiouy])','outer covering','greek'),(331,'chlor(?=[aeiouy])','green','greek'),(332,'chole(?=\\w)','bile','greek'),(333,'chondro(?=\\w)','granular structure','greek'),(334,'chrom(?:at|o)?(?=\\w)','color','greek'),(335,'chron(?=\\w)','time','greek'),(336,'chrys(?=\\w)','gold','greek'),(337,'chylo(?=\\w)','animal or plant juice','greek'),(338,'circum(?=\\w)','around','latin'),(339,'cirro(?=\\w)','tendril','latin'),(340,'clad(?=[aeiouy])','branches of organisms','greek'),(341,'conico(?=\\w)','resembling a cone','greek'),(342,'contr[ao](?=\\w)','against','latin'),(343,'copro(?=\\w)','excrement, dung','greek'),(344,'cortico(?=\\w)','outer layer of an internal organ or body structure','latin'),(345,'cosmo(?=\\w)','universe, world','greek'),(346,'cranio(?=\\w)','skull of a vertebrate','greek'),(347,'crypto(?=\\w)','hidden, invisible; secret','greek'),(348,'cyclo(?=\\w)','circle; cycle','greek'),(349,'cysto(?=\\w)','cyst or sac; urinary bladder','greek'),(350,'dactyl(?=\\w)','finger, toe','greek'),(351,'(?<=\\w)kis','times','greek'),(352,'deipno(?=\\w)','dinner','greek'),(353,'dendr(?=\\w)','trees or branching','greek'),(354,'derm(?:a|at|ato|o)(?=\\w)','skin','greek'),(355,'desmo(?=\\w)','bonds, connections, or ligaments','greek'),(356,'deuter(?=[aeiouy])','second or secondary','greek'),(357,'diplo(?=\\w)','double','greek'),(358,'dodeca(?=\\w)','twelve','greek'),(359,'dolich(?=\\w)','long','greek'),(361,'electro(?=\\w)','electricity','greek'),(362,'embryo(?=\\w)','early stages of development','greek'),(363,'enantio(?=\\w)','opposite, opposed, opposing','greek'),(364,'ennea(?=\\w)','nine','greek'),(365,'entero(?=\\w)','intestines','greek'),(366,'entomo(?=\\w)','insect','greek'),(367,'ergat(?=[aeiouy])','worker','greek'),(368,'eroto(?=\\w)','sexual desire','greek'),(369,'erythr(?=\\w)','red','greek'),(370,'extra(?=\\w)','outside, beyond','latin'),(371,'femoro(?=\\w)','thighbone','latin'),(372,'ferr(?=[aeiouy])','iron','latin'),(373,'fronto(?=\\w)','frontal','latin'),(374,'gastr(?=[aeiouy])','stomach','greek'),(375,'genio(?=\\w)','chin','greek'),(377,'genito(?=\\w)','genitals','latin'),(378,'glo(?:ss|tt)(?=\\w)','tongue','greek'),(379,'gonio(?=\\w)','angles','greek'),(380,'gymno(?=\\w)','naked','greek'),(381,'gyna?eco(?=\\w)','woman, female','greek'),(382,'hagi(?=[aeiouy])','saints','greek'),(383,'haplo(?=\\w)','single; simple','greek'),(384,'hapto(?=\\w)','attachment or binding','greek'),(385,'hende[ck]a(?=\\w)','eleven','greek'),(386,'heort(?=\\w)','feast','greek'),(387,'hepato(?=\\w)','liver','greek'),(388,'herpet(?=\\w)','reptile','greek'),(389,'hetero(?=\\w)','other, different','greek'),(390,'(?<=\\w)[aio](?=\\w)','connector',''),(393,'hiero(?=\\w)','holy, sacred','greek'),(394,'historio(?=\\w)','history','greek'),(395,'hyalo(?=\\w)','glass','greek'),(396,'hyeto(?=\\w)','rain, rainfall','greek'),(397,'hyper(?=\\w)','over, above or beyond','greek'),(398,'hystero(?=\\w)','uterus','greek'),(399,'iatro(?=\\w)','doctor, physician','greek'),(400,'ichthy(?=\\w)','fish','greek'),(401,'icosa(?=\\w)','twenty','greek'),(402,'immuno(?=\\w)','immune systems and processes','latin'),(403,'infra(?=\\w)','below, beneath, inferior','latin'),(404,'inter(?=\\w)','among, between, amid, during, within, mutual, reciprocal','latin'),(405,'intra(?=\\w)','inside, within, interior, during','latin'),(406,'ischio(?=\\w)','hip joint','greek'),(407,'juxta(?=\\w)','near to, alongside, next to','latin'),(408,'kerat(?=\\w)','horn','greek'),(410,'klepto(?=\\w)','thief, stealing','greek'),(411,'konio(?=\\w)','dust','greek'),(412,'labio(?=\\w)','lips or labia','latin'),(413,'lamino(?=\\w)','layer','latin'),(414,'laparo(?=\\w)','flank, side','greek'),(415,'laryngo(?=\\w)','larynx','greek'),(416,'latero(?=\\w)','to the side','latin'),(417,'lepido(?=\\w)','scaly','greek'),(418,'lepro(?=\\w)','leprosy','latin'),(419,'leu[ck](?=\\w)','white, colourless','greek'),(420,'lexico(?=\\w)','words or speech','greek'),(421,'luteo(?=\\w)','orange-yellow','latin'),(422,'lymph(?=[aeiouy])','lymph, lymphoid or lymphatic tissues or vessels','latin'),(423,'macro(?=\\w)','large; long; inclusive','greek'),(424,'magico(?=\\w)','magical','latin'),(425,'magnet(?=\\w)','magnet, magnetic, magnetism','greek'),(426,'magni(?=\\w)','large, big','latin'),(427,'malaco(?=\\w)','mollusks','greek'),(428,'maxillo(?=\\w)','upper jaw','latin'),(429,'medico(?=\\w)','medical','latin'),(430,'medio(?=\\w)','middle','latin'),(431,'melano(?=\\w)','melanin','greek'),(432,'metallo(?=\\w)','metal','greek'),(433,'metro(?=\\w)','relating to the city','greek'),(434,'micto(?=\\w)','mixed','greek'),(435,'mnemo(?=\\w)','memory','greek'),(436,'morpho(?=\\w)','shape, form','greek'),(437,'multi(?=\\w)','many','latin'),(438,'myelo(?=\\w)','marrow or the spinal cord','greek'),(439,'myria(?=\\w)','innumerable','greek'),(440,'myrmeco(?=\\w)','ants','greek'),(441,'narco(?=\\w)','stupor, sleep, or a state of unconsciousness','greek'),(442,'necro(?=\\w)','death or dead tissue','latin'),(443,'nemat(?=\\w)','thread or filament','greek'),(444,'nephro(?=\\w)','kidneys','greek'),(445,'neuro(?=\\w)','nervous system','greek'),(446,'nucleo(?=\\w)','nuclei','latin'),(447,'ochlo(?=\\w)','crowds','greek'),(448,'oculo(?=\\w)','eyes','latin'),(449,'omphalo(?=\\w)','navel','greek'),(450,'oneir(?=\\w)','dream','greek'),(451,'onycho(?=\\w)','nail','greek'),(452,'ophi(?:d|o)(?=\\w)','snakes','greek'),(453,'ophthalmo(?=\\w)','eyes','greek'),(454,'ornith(?=\\w)','birds','greek'),(455,'osseo(?=\\w)','bone','latin'),(456,'osteo(?=\\w)','bone','greek'),(457,'pachy(?=\\w)','thick','greek'),(458,'palato(?=\\w)','roof of the mouth','latin'),(459,'paleo(?=\\w)','old; ancient; prehistoric; primitive','greek'),(460,'parthen(?=\\w)','virgin','greek'),(461,'patri(?=\\w)','father','greek'),(462,'pauci(?=\\w)','few','latin'),(463,'peloro(?=\\w)','huge monsters','greek'),(464,'perma(?=\\w)','permanent, everlasting, eternal','latin'),(465,'petro(?=\\w)','stone','greek'),(466,'phallo(?=\\w)','penis','greek'),(467,'pharmaco(?=\\w)','medication','greek'),(468,'pharyngo(?=\\w)','pharynx','greek'),(469,'pheno(?=\\w)','an observable characteristic','greek'),(470,'phlebo(?=\\w)','veins','greek'),(471,'phosph(?=[aeiouy])','bearing light','greek'),(472,'phren(?=\\w)','mind; diaphragm','greek'),(473,'phyco(?=\\w)','seaweed or algae','greek'),(474,'phyllo(?=\\w)','leaves','greek'),(475,'phylo(?=\\w)','tribes, races or phyla','greek'),(476,'physi(?=\\w)','nature; physical','greek'),(477,'phyto(?=\\w)','plants','greek'),(478,'pisci(?=\\w)','fish','latin'),(479,'pithec(?=\\w)','ape','greek'),(480,'plagio(?=\\w)','slanted, oblique','greek'),(481,'plan(?:i)(?=\\w)','flat, level, plane','latin'),(482,'platy(?=\\w)','relatively flat but wide','greek'),(483,'pleuro(?=\\w)','to the side; lateral','greek'),(484,'plumb(?=[aeiouy])','lead','latin'),(485,'pluri(?=\\w)','several','latin'),(486,'pluto(?=\\w)','wealth or money','greek'),(487,'pneumat(?=\\w)','spirit, air; gas','greek'),(488,'pneumon(?=\\w)','lung','greek'),(489,'pogono(?=\\w)','beard','greek'),(490,'poikilo(?=\\w)','variegated or variable','greek'),(491,'politico(?=\\w)','political','latin'),(492,'postero(?=\\w)','posterior, back','latin'),(493,'potam(?=\\w)','river','greek'),(494,'praseo(?=\\w)','green','greek'),(495,'preter(?=\\w)','beyond','latin'),(496,'procto(?=\\w)','colon, rectum, anus','greek'),(497,'proteo(?=\\w)','protein','greek'),(498,'protero(?=\\w)','first, earliest, early','greek'),(499,'proximo(?=\\w)','proximal location or vector','latin'),(500,'pseph(?=\\w)','pebble, small stone; voting, election; ballot box','greek'),(501,'pseud(?=\\w)','false, not genuine, fake','greek'),(502,'psych(?=\\w)','soul, mind','greek'),(503,'psychro(?=\\w)','cold','greek'),(504,'pterid(?=\\w)','fern','greek'),(505,'ptero(?=\\w)','wing or feather','greek'),(506,'purpureo(?=\\w)','purple','greek'),(507,'py[ck]no(?=\\w)','dense, thick','greek'),(508,'pyrrh(?=\\w)','red','greek'),(509,'quadr(?=[aeiouy])','four','latin'),(510,'quasi(?=\\w)','similar','latin'),(511,'quin(?:qu)?(?=\\w)','five','latin'),(512,'radio(?=\\w)','radiation; radio broadcasting; radius bone','latin'),(513,'recti(?=\\w)','straight','latin'),(514,'recto(?=\\w)','rectum','latin'),(515,'retro(?=\\w)','back or backward; behind; opposite direction','latin'),(516,'rhabd(?=\\w)','rodlike','greek'),(517,'rhizo(?=\\w)','roots','greek'),(518,'rhod(?=[aeiouy])','rose-colored','greek'),(519,'saccharo(?=\\w)','sugar','greek'),(520,'salpingo(?=\\w)','fallopian tubes','greek'),(521,'saur(?=[aeiouy])','lizard','greek'),(522,'scapulo(?=\\w)','scapula','latin'),(523,'schiz(?=[aeiouy])','split, cleft','greek'),(524,'scoto(?=\\w)','darkness','greek'),(525,'seismo(?=\\w)','earthquake','greek'),(526,'selen(?=\\w)','moon','greek'),(527,'semi(?=\\w)','half; partial, incomplete','latin'),(528,'semper(?=\\w)','always, unvarying','latin'),(529,'sesqui(?=\\w)','one and a half; ratio of 3 to 2','latin'),(530,'sider(?=[aeiouy])','stars or constellations','latin'),(531,'sidero(?=\\w)','iron, steel','greek'),(532,'socio(?=\\w)','society','latin'),(533,'spectro(?=\\w)','optical spectra','latin'),(534,'speleo?(?=\\w)','cave','greek'),(535,'spermato(?=\\w)','seeds, sperm','greek'),(536,'sphygm(?=\\w)','pulse, pulsation','greek'),(537,'spiro(?=\\w)','spirals or helices','latin'),(538,'spondyl(?=\\w)','spine','greek'),(539,'sporo(?=\\w)','spore','greek'),(540,'steno(?=\\w)','narrow or restricted','greek'),(541,'stereo(?=\\w)','solid, three-dimensional','greek'),(542,'steth(?=\\w)','chest','greek'),(543,'stomato(?=\\w)','mouth','greek'),(544,'strepto(?=\\w)','twisted','greek'),(545,'super(?=\\w)','above, over, or upon; superior','latin'),(546,'supra(?=\\w)','above, over, on top; greater than, transcending','latin'),(547,'tachy(?=\\w)','fast','greek'),(548,'techno(?=\\w)','technology','greek'),(549,'te[ck]n(?=\\w)','child','greek'),(550,'terato(?=\\w)','birth defects and similar abnormalities','greek'),(551,'tessara(?=\\w)','four','greek'),(552,'thalass(?=\\w)','sea','greek'),(553,'thanato(?=\\w)','death','greek'),(554,'thaumat(?=\\w)','miracle, wonder, marvel','greek'),(555,'theri(?=\\w)','wild animal','greek'),(556,'thermo(?=\\w)','heat','greek'),(557,'trachel(?=\\w)','neck or neck-like structure','greek'),(558,'tribo(?=\\w)','friction','greek'),(559,'tricho(?=\\w)','hair','greek'),(560,'triskaideka(?=\\w)','thirteen','greek'),(561,'tropho(?=\\w)','nourish, nourishment','greek'),(562,'trop(?=\\w)','changeability','greek'),(563,'tubul(?=\\w)','tubules or microtubules','latin'),(564,'turbo(?=\\w)','turbine-related; accelerated, more robust','latin'),(565,'typhl(?=\\w)','blind, blindness','greek'),(566,'ultra(?=\\w)','greater than normal quantity or importance; beyond, on the far side of','latin'),(567,'undeca(?=\\w)','eleven','greek'),(568,'utero(?=\\w)','womb','latin'),(569,'uvulo(?=\\w)','uvula','latin'),(570,'vagino(?=\\w)','vagina','latin'),(571,'ventr(?=[aeiouy])','abdomen','latin'),(572,'vertebro(?=\\w)','vertebra','latin'),(573,'vesico(?=\\w)','bladder','latin'),(574,'vibro(?=\\w)','vibration','latin'),(575,'video(?=\\w)','moving images','latin'),(576,'vig[ei]n(?=\\w)','twenty','latin'),(577,'viscero(?=\\w)','viscera','latin'),(578,'visco(?=\\w)','viscosity','latin'),(579,'vulvo(?=\\w)','vulva','latin'),(580,'xanth(?=[aeiouy])','yellow','greek'),(581,'acro(?=\\w)','sharp; tip; extremity; peak','greek'),(582,'aden(?=[aeiouy])','gland','greek'),(583,'adipo(?=\\w)','fat','latin'),(584,'aero(?=\\w)','air or aircraft','greek'),(585,'agr(?=[aeiouy])','agriculture','latin'),(586,'allo(?=\\w)','different, other','greek'),(587,'ambi(?=\\w)','both, on both sides','latin'),(588,'ante(?=\\w)','prior; in front of','latin'),(589,'aqua(?=\\w)','water','latin'),(590,'arch(?=\\w)','chief, highest, most extreme','greek'),(592,'areo(?=\\w)','Mars','greek'),(593,'arno(?=\\w)','lamb, sheep','greek'),(594,'aux(?=\\w)','growth or increase','latin'),(595,'bas[io](?=\\w)','base, forming a base','latin'),(596,'brady(?=\\w)','slow','greek'),(597,'caco(?=\\w)','bad, defective','greek'),(598,'cata(?=\\w)','down; reverse, backward, degenerative','greek'),(599,'cedr(?=\\w)','cedar','greek'),(600,'ceno(?=\\w)','new or recent','greek'),(601,'coen(?=\\w)','common','greek'),(602,'cryo(?=\\w)','cold, freezing','greek'),(603,'cyan(?=[aeiouy])','dark blue-green','greek'),(604,'cyno(?=\\w)','dog','greek'),(605,'dasy(?=\\w)','hairy, shaggy, dense','greek'),(607,'deci(?=\\w)','tenth part','latin'),(608,'demi(?=\\w)','half','latin'),(609,'demo(?=\\w)','people or society','greek'),(611,'digi(?=\\w)','fingers or toes; representing values as discrete numbers','latin'),(612,'dipl(?=[aeiouy])','double','greek'),(613,'dors(?=\\w)','back','latin'),(614,'ecto(?=\\w)','outside','greek'),(615,'ergo(?=\\w)','work','greek'),(616,'ethn(?=\\w)','race, classification of human beings','greek'),(617,'etho(?=\\w)','ethics','greek'),(618,'eury(?=\\w)','wide, broad','greek'),(619,'gam(?=[oy])','marriage','greek');
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

-- Dump completed on 2015-09-01 19:49:16
