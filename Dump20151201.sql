CREATE DATABASE  IF NOT EXISTS `project` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `project`;
-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: localhost    Database: project
-- ------------------------------------------------------
-- Server version	5.6.26

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
-- Table structure for table `audit`
--

DROP TABLE IF EXISTS `audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audit` (
  `AID` int(5) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_CREATED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `WHO` int(5) NOT NULL,
  `DATA_BEFORE` varchar(100) DEFAULT NULL,
  `DATA_AFTER` varchar(100) DEFAULT NULL,
  `AUDIT_ACTION` varchar(10) NOT NULL,
  `ORIGIN_TABLE` varchar(20) NOT NULL,
  PRIMARY KEY (`AID`),
  KEY `WHO` (`WHO`),
  CONSTRAINT `fk_Student_to_Audit` FOREIGN KEY (`WHO`) REFERENCES `student` (`SID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit`
--

LOCK TABLES `audit` WRITE;
/*!40000 ALTER TABLE `audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hierarchy`
--

DROP TABLE IF EXISTS `hierarchy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hierarchy` (
  `HID` int(5) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_CREATED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `HCODE` varchar(10) DEFAULT NULL,
  `HNAME` varchar(50) DEFAULT NULL,
  `HPARENT` int(5) DEFAULT NULL,
  `REQUESTER` int(5) NOT NULL,
  `HLEVEL` int(2) DEFAULT NULL,
  PRIMARY KEY (`HID`),
  KEY `HPARENT` (`HPARENT`),
  CONSTRAINT `hierarchy_ibfk_1` FOREIGN KEY (`HPARENT`) REFERENCES `hierarchy` (`HID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hierarchy`
--

LOCK TABLES `hierarchy` WRITE;
/*!40000 ALTER TABLE `hierarchy` DISABLE KEYS */;
INSERT INTO `hierarchy` VALUES (1,'2015-11-05 11:52:57','UNCC','University of North Carolina at Charlotte',NULL,0,0);
/*!40000 ALTER TABLE `hierarchy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hrequests`
--

DROP TABLE IF EXISTS `hrequests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hrequests` (
  `RID` int(5) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_CREATED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `FLAG` varchar(10) NOT NULL,
  `HCODE` varchar(10) DEFAULT NULL,
  `HNAME` varchar(25) DEFAULT NULL,
  `HPARENT` int(5) DEFAULT NULL,
  `REQUESTER` int(5) DEFAULT NULL,
  PRIMARY KEY (`RID`),
  KEY `REQUESTER` (`REQUESTER`),
  CONSTRAINT `hrequests_ibfk_1` FOREIGN KEY (`REQUESTER`) REFERENCES `student` (`SID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hrequests`
--

LOCK TABLES `hrequests` WRITE;
/*!40000 ALTER TABLE `hrequests` DISABLE KEYS */;
/*!40000 ALTER TABLE `hrequests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pdocument`
--

DROP TABLE IF EXISTS `pdocument`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pdocument` (
  `DOCID` int(20) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_CREATED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `PID` int(20) DEFAULT NULL,
  `FILENAME` varchar(25) DEFAULT NULL,
  `CONTENT` blob,
  PRIMARY KEY (`DOCID`),
  KEY `PID` (`PID`),
  CONSTRAINT `pdocument_ibfk_1` FOREIGN KEY (`PID`) REFERENCES `post` (`PID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pdocument`
--

LOCK TABLES `pdocument` WRITE;
/*!40000 ALTER TABLE `pdocument` DISABLE KEYS */;
/*!40000 ALTER TABLE `pdocument` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pimage`
--

DROP TABLE IF EXISTS `pimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pimage` (
  `IMGID` int(20) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_CREATED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `PID` int(20) DEFAULT NULL,
  `FILENAME` varchar(25) DEFAULT NULL,
  `PATH` varchar(100) DEFAULT NULL,
  `CONTENT` blob,
  PRIMARY KEY (`IMGID`),
  UNIQUE KEY `PID` (`PID`),
  CONSTRAINT `pimage_ibfk_1` FOREIGN KEY (`PID`) REFERENCES `post` (`PID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pimage`
--

LOCK TABLES `pimage` WRITE;
/*!40000 ALTER TABLE `pimage` DISABLE KEYS */;
INSERT INTO `pimage` VALUES (1,'2015-12-01 04:57:16',1,'','posts/565d28ac27fc6.jpg',NULL),(2,'2015-12-01 05:00:21',5,'','posts/565d296545ba8.jpg',NULL),(3,'2015-12-01 05:05:36',6,'','posts/565d2aa07b2cf.jpg',NULL);
/*!40000 ALTER TABLE `pimage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post` (
  `PID` int(20) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_CREATED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `SID` int(5) DEFAULT NULL,
  `TYPE` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`PID`),
  KEY `SID` (`SID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (1,'2015-12-01 04:57:16',0,'image'),(2,'2015-12-01 04:57:26',0,'youtube_url'),(3,'2015-12-01 04:57:41',0,'youtube_url'),(4,'2015-12-01 05:00:12',5,'status'),(5,'2015-12-01 05:00:21',0,'image'),(6,'2015-12-01 05:05:36',0,'image');
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ptext`
--

DROP TABLE IF EXISTS `ptext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ptext` (
  `TXTID` int(20) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_CREATED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `PID` int(20) DEFAULT NULL,
  `CONTENT` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`TXTID`),
  KEY `PID` (`PID`),
  CONSTRAINT `ptext_ibfk_1` FOREIGN KEY (`PID`) REFERENCES `post` (`PID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ptext`
--

LOCK TABLES `ptext` WRITE;
/*!40000 ALTER TABLE `ptext` DISABLE KEYS */;
INSERT INTO `ptext` VALUES (1,'2015-12-01 05:00:12',4,'EFRWERFWER');
/*!40000 ALTER TABLE `ptext` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pvideo`
--

DROP TABLE IF EXISTS `pvideo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pvideo` (
  `VIDID` int(20) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_CREATED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `PID` int(20) DEFAULT NULL,
  `FILENAME` varchar(25) DEFAULT NULL,
  `CONTENT` text,
  PRIMARY KEY (`VIDID`),
  UNIQUE KEY `PID` (`PID`),
  CONSTRAINT `pvideo_ibfk_1` FOREIGN KEY (`PID`) REFERENCES `post` (`PID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pvideo`
--

LOCK TABLES `pvideo` WRITE;
/*!40000 ALTER TABLE `pvideo` DISABLE KEYS */;
INSERT INTO `pvideo` VALUES (1,'2015-12-01 04:57:26',2,'youtube','-VUH8oO3qqQ'),(2,'2015-12-01 04:57:41',3,'MN','qNnvL0ztJhA');
/*!40000 ALTER TABLE `pvideo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `SID` int(5) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_CREATED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ISADMIN` tinyint(1) DEFAULT '0',
  `SNAME` varchar(25) NOT NULL,
  `SPECIALIZATION` int(5) NOT NULL,
  `username` varchar(10) NOT NULL,
  `PASSWORD` varchar(20) NOT NULL,
  PRIMARY KEY (`SID`),
  UNIQUE KEY `username` (`username`),
  KEY `SPECIALIZATION` (`SPECIALIZATION`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`SPECIALIZATION`) REFERENCES `hierarchy` (`HID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (2,'2015-11-06 00:50:36',1,'Nik',1,'nb01','nb01'),(3,'2015-11-06 01:40:15',1,'Bhushan',1,'bd01','bd01'),(4,'2015-11-06 01:40:15',1,'Nikhil',1,'nb02','nb02'),(5,'2015-11-06 01:40:15',1,'Spandana',1,'sr01','sr01'),(6,'2015-11-06 01:40:15',1,'Sindhu',1,'sv01','sv01'),(7,'2015-11-06 04:57:51',1,'Suman',1,'sg01','sr01'),(8,'2015-11-07 02:02:55',1,'blah1',1,'errwe','bd01'),(9,'2015-11-07 02:02:55',1,'rwer',1,'erqeqw','nb02'),(10,'2015-11-07 02:02:55',1,'qwrqwr',1,'sdsdvsdf','sr01'),(11,'2015-11-07 02:39:07',1,'dwdwwdf',1,'fgssfggrnn','sv01'),(12,'2015-11-07 02:16:18',1,'dvrwg',1,'fgssfggfd','sr01');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER TRIG_STUDENT_BEFOREINSERT BEFORE INSERT ON STUDENT 
FOR EACH ROW
Insert into 
temp (WHO, DATA_BEFORE, DATA_AFTER, AUDIT_ACTION, ORIGIN_TABLE) 
values (001, NULL, 'new', 'insert', 'student') */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER TRIG_STUDENT_BEFOREUpdate BEFORE UPDATE ON STUDENT 
FOR EACH ROW
Insert into 
temp (WHO, DATA_BEFORE, DATA_AFTER, AUDIT_ACTION, ORIGIN_TABLE) 
values 
(001, 
(select concat(OLD.SID, ', ', OLD.TIMESTAMP_CREATED, ', ', OLD.ISADMIN, ', ', OLD.SNAME, ', ', OLD.SPECIALIZATION, ', ', OLD.USERNAME, ', ', OLD.PASSWORD) from student where SID = OLD.SID), 
(select concat(NEW.SID, ', ', NEW.TIMESTAMP_CREATED, ', ', NEW.ISADMIN, ', ', NEW.SNAME, ', ', NEW.SPECIALIZATION, ', ', NEW.USERNAME, ', ', NEW.PASSWORD) from student where SID = NEW.SID), 
"UPDATE", 'student') */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `student_hierarchy`
--

DROP TABLE IF EXISTS `student_hierarchy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_hierarchy` (
  `SID` int(5) NOT NULL DEFAULT '0',
  `HID` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`SID`,`HID`),
  KEY `HID` (`HID`),
  CONSTRAINT `student_hierarchy_ibfk_1` FOREIGN KEY (`SID`) REFERENCES `student` (`SID`),
  CONSTRAINT `student_hierarchy_ibfk_2` FOREIGN KEY (`HID`) REFERENCES `hierarchy` (`HID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_hierarchy`
--

LOCK TABLES `student_hierarchy` WRITE;
/*!40000 ALTER TABLE `student_hierarchy` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_hierarchy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temp`
--

DROP TABLE IF EXISTS `temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temp` (
  `AID` int(5) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_CREATED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `WHO` int(5) DEFAULT NULL,
  `DATA_BEFORE` varchar(100) DEFAULT NULL,
  `DATA_AFTER` varchar(100) DEFAULT NULL,
  `AUDIT_ACTION` varchar(10) DEFAULT NULL,
  `ORIGIN_TABLE` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`AID`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temp`
--

LOCK TABLES `temp` WRITE;
/*!40000 ALTER TABLE `temp` DISABLE KEYS */;
INSERT INTO `temp` VALUES (13,'2015-11-05 11:45:11',1,NULL,'new1','insert1','student1'),(14,'2015-11-05 11:46:44',1,NULL,'new1','insert1','student1'),(16,'2015-11-06 00:50:36',1,NULL,'new','insert','student'),(17,'2015-11-06 01:40:15',1,NULL,'new','insert','student'),(18,'2015-11-06 01:40:15',1,NULL,'new','insert','student'),(19,'2015-11-06 01:40:15',1,NULL,'new','insert','student'),(20,'2015-11-06 01:40:15',1,NULL,'new','insert','student'),(21,'2015-11-06 01:40:15',1,NULL,'new','insert','student'),(22,'2015-11-06 04:57:51',1,'72015-11-05 20:40:151Suman1sr01sr01','72015-11-05 20:40:151Suman1sg01sr01','UPDATE','student'),(23,'2015-11-07 02:02:55',1,NULL,'new','insert','student'),(24,'2015-11-07 02:02:55',1,NULL,'new','insert','student'),(25,'2015-11-07 02:02:55',1,NULL,'new','insert','student'),(26,'2015-11-07 02:02:55',1,NULL,'new','insert','student'),(27,'2015-11-07 02:02:55',1,NULL,'new','insert','student'),(28,'2015-11-07 02:16:18',1,'122015-11-06 21:02:551dvrwg1rgerhbhsr01','122015-11-06 21:02:551dvrwg1fgssfggfdsr01','UPDATE','student'),(29,'2015-11-07 02:39:07',1,'11, 2015-11-06 21:02:55, 1, dwdwwdf, 1, wrgwr, sv01','11, 2015-11-06 21:02:55, 1, dwdwwdf, 1, fgssfggrnn, sv01','UPDATE','student');
/*!40000 ALTER TABLE `temp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thread`
--

DROP TABLE IF EXISTS `thread`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `thread` (
  `TID` int(10) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_CREATED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `HID` int(5) NOT NULL DEFAULT '1',
  `SID` int(5) NOT NULL,
  PRIMARY KEY (`TID`),
  KEY `HID` (`HID`),
  KEY `SID` (`SID`),
  CONSTRAINT `thread_ibfk_1` FOREIGN KEY (`HID`) REFERENCES `hierarchy` (`HID`),
  CONSTRAINT `thread_ibfk_2` FOREIGN KEY (`SID`) REFERENCES `student` (`SID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thread`
--

LOCK TABLES `thread` WRITE;
/*!40000 ALTER TABLE `thread` DISABLE KEYS */;
/*!40000 ALTER TABLE `thread` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'project'
--

--
-- Dumping routines for database 'project'
--
/*!50003 DROP PROCEDURE IF EXISTS `enlist_students` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `enlist_students`(IN con varchar(20))
BEGIN
  SELECT * from student
  WHERE specialization = con;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-12-01  0:19:14
