-- MySQL dump 10.13  Distrib 5.6.22, for osx10.8 (x86_64)
--
-- Host: 127.0.0.1    Database: CIS451_final_project
-- ------------------------------------------------------
-- Server version	5.7.9

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
-- Table structure for table `Building`
--

DROP TABLE IF EXISTS `Building`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Building` (
  `Building_Code` varchar(45) NOT NULL,
  `Building_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Building_Code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Building`
--

LOCK TABLES `Building` WRITE;
/*!40000 ALTER TABLE `Building` DISABLE KEYS */;
INSERT INTO `Building` VALUES ('CHA','Chapman'),('CON','Condon'),('DES','Deschutes'),('EMU','Erb_Memorial_Union'),('FEN','Fenton'),('KLA',NULL),('LA','Lawrence'),('LIL','Lillis'),('MCK','Mckennize'),('STB','Klamath');
/*!40000 ALTER TABLE `Building` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Class_time`
--

DROP TABLE IF EXISTS `Class_time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Class_time` (
  `Init` varchar(45) NOT NULL,
  `Date` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Init`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Class_time`
--

LOCK TABLES `Class_time` WRITE;
/*!40000 ALTER TABLE `Class_time` DISABLE KEYS */;
INSERT INTO `Class_time` VALUES ('F',NULL),('M','Monday'),('R','Thursday'),('T','Tuesday'),('W','Friday');
/*!40000 ALTER TABLE `Class_time` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Course`
--

DROP TABLE IF EXISTS `Course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Course` (
  `CRN` int(11) NOT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `Instructor` varchar(45) DEFAULT NULL,
  `Group` varchar(45) DEFAULT NULL,
  `Level` varchar(45) DEFAULT NULL,
  `On_line` varchar(45) DEFAULT NULL,
  `Credits` varchar(45) DEFAULT NULL,
  `Location` varchar(45) DEFAULT NULL,
  `Time` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`CRN`),
  KEY `Course_to_Login_idx` (`Name`),
  KEY `Course_to_Building_idx` (`Location`),
  KEY `Course_to_Class_time_idx` (`Time`),
  KEY `Course_to_Group_idx` (`Group`),
  CONSTRAINT `Course_to_Building` FOREIGN KEY (`Location`) REFERENCES `Building` (`Building_Code`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Course_to_Class_time` FOREIGN KEY (`Time`) REFERENCES `Class_time` (`Init`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Course_to_Group` FOREIGN KEY (`Group`) REFERENCES `Group` (`Code`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Course`
--

LOCK TABLES `Course` WRITE;
/*!40000 ALTER TABLE `Course` DISABLE KEYS */;
INSERT INTO `Course` VALUES (11087,'BI507','Bruce Bowerman','None','Graduate','Yes','4','EMU','M'),(11453,'CIS211','John Conery','SC','Undergraduate','Yes','4','LIL','T'),(11560,'CIS415','Joe Svenek','SC','Both','No','4','DES','W'),(11571,'CIS451','Chris Wilson','None','Both','No','4','CHA','R'),(12838,'HIST443','David Luebke','AC','Both','No','4','STB','F'),(12847,'HIST410','Carlos Aguirre','AL','Both','No','4','LA','M'),(13733,'MATH256','Huaxin Lin','SC','Undergraduate','No','4','MCK','T'),(13965,'MATH351','Yuan xu','SC','Undergraduate','No','4','FEN','W'),(14678,'PSY607','Jennifer Pfeifer','None','Graduate','No','4','CON','R'),(14865,'PSY201','Ulrich Mayr','SSC','Undergraduate','No','4','KLA','F'),(15346,'CLAS202','Mary Jaeger','AL','Undergraduate','No','4','LIL','R'),(15789,'CLAS110','Christopher Eckerman','IC','Undergraduate','No','2','DES','W'),(17334,'PHYS607','Raymond Frey','None','Graduate','No','4','STB','T'),(17893,'PHYS153','Timothy Jenkins','SC','Undergraduate','No','2','LA','M'),(19456,'ANTH173','Frances White','IC','Undergraduate','No','2','DES','F'),(19692,'AAD510','Jon Erlandson','SSC','Graduate','No','4','EMU','F');
/*!40000 ALTER TABLE `Course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Department`
--

DROP TABLE IF EXISTS `Department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Department` (
  `Code` varchar(45) NOT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `Head` varchar(45) DEFAULT NULL,
  `Faculty_num` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Department`
--

LOCK TABLES `Department` WRITE;
/*!40000 ALTER TABLE `Department` DISABLE KEYS */;
INSERT INTO `Department` VALUES ('ANTH','Department of Anthropology','Frances Whites',''),('BI','Department of Biology','Bruce Bowerman',NULL),('CIS','Computer Information and Science','Joe Sventek','26'),('CLAS','Department of Classics','Christopher Eckerman',NULL),('HIST','Department of History','David Luebke',NULL),('MATH','Department of Mathmatics','Yuan Xu',NULL),('PHYS','Department of Physics','Raymond Frey',NULL),('PSY','Department of Psychology','Ulrich Mayr',NULL);
/*!40000 ALTER TABLE `Department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Group`
--

DROP TABLE IF EXISTS `Group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Group` (
  `Code` varchar(45) NOT NULL,
  `Name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Group`
--

LOCK TABLES `Group` WRITE;
/*!40000 ALTER TABLE `Group` DISABLE KEYS */;
INSERT INTO `Group` VALUES ('AC','American Cultures'),('AL','Arts and Letters'),('IC','International Cultures'),('None','None'),('SC','Science'),('SSC','Social Science');
/*!40000 ALTER TABLE `Group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Instructor`
--

DROP TABLE IF EXISTS `Instructor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Instructor` (
  `Instructor_ID` int(11) NOT NULL,
  `Fname` varchar(45) DEFAULT NULL,
  `Lname` varchar(45) DEFAULT NULL,
  `Department` varchar(45) DEFAULT NULL,
  `Office` varchar(45) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Instructor_ID`),
  KEY `Instuctor_to_Building_idx` (`Office`),
  KEY `Instructor_to_Department_idx` (`Department`),
  CONSTRAINT `Instructor_to_Department` FOREIGN KEY (`Department`) REFERENCES `Department` (`Code`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Instuctor_to_Building` FOREIGN KEY (`Office`) REFERENCES `Building` (`Building_Code`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Instructor`
--

LOCK TABLES `Instructor` WRITE;
/*!40000 ALTER TABLE `Instructor` DISABLE KEYS */;
INSERT INTO `Instructor` VALUES (200001,'Chris','Wilson','CIS','DES','cwilson@cs.uoregon.edu'),(200002,'Joe','Svenek','CIS','DES','jsventek@cs.uoregon.edu'),(300001,'Carlos','Aguirre','HIST','EMU','caguirre@uoregon.edu'),(300002,'David','Luebke','HIST','EMU','dluebke@uoregon.edu'),(400001,'Huaxin','Lin','MATH','LIL','hlin@uoregon.edu'),(400002,'Yuan','Xu','MATH','CHA','yuan@uoregon.edu'),(500001,'Bruce','Bowerman','BI','STB','bowerman@uoregon.edu'),(500002,'John','Conery','BI','LA','conery@uoregon.edu'),(600001,'Christopher','Eckerman','CLAS','MCK','eckerman@uoregon.edu'),(600002,'Mary','Jaeger','CLAS','FEN','maryjaeg@uoregon.edu'),(700001,'Raymond','Frey','PHYS','CON','rayfrey@uoregon.edu'),(700002,'Timothy','Jenkins','PHYS','KLA','tjenkins@uoregon.edu'),(800001,'Frances','White','ANTH','CHA','fwhite@uoregon.edu'),(800002,'Jon','Erlandson','ANTH','STB','jerland@uoregon.edu'),(900001,'Ulrich','Mayr','PSY','MCK','mayr@uoregon.edu'),(900002,'Jennifer','Pfeifer','PSY','EMU','jpfeifer@uoregon.edu');
/*!40000 ALTER TABLE `Instructor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Login`
--

DROP TABLE IF EXISTS `Login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Login` (
  `Student_id` int(11) NOT NULL,
  `Course_name` varchar(45) NOT NULL,
  PRIMARY KEY (`Student_id`,`Course_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Login`
--

LOCK TABLES `Login` WRITE;
/*!40000 ALTER TABLE `Login` DISABLE KEYS */;
INSERT INTO `Login` VALUES (951319001,'ANTH173'),(951319001,'CIS415'),(951319001,'CIS451'),(951319002,'HIST410'),(951319002,'HIST443'),(951319002,'MATH256'),(951319002,'PHYS153'),(951319003,'ANTH173'),(951319003,'BI507'),(951319003,'MATH256'),(951319003,'MATH351'),(951319004,'ANTH173'),(951319004,'HIST410'),(951319004,'HIST443'),(951319005,'CIS211'),(951319005,'CLAS110'),(951319005,'MATH256'),(951319005,'MATH351'),(951319005,'PHYS153'),(951319006,'AAD510'),(951319006,'CLAS110'),(951319006,'CLAS202'),(951319007,'CIS210'),(951319007,'PHSY153'),(951319007,'PHSY607'),(951319008,'CIS211'),(951319008,'CIS415'),(951319008,'CIS451'),(951319009,'CIS211'),(951319009,'CIS415'),(951319009,'CIS451'),(951319009,'MATH256'),(951319009,'MATH351'),(951319010,'BI507'),(951319010,'MATH351'),(951319010,'PHSY153'),(951319010,'PHSY607');
/*!40000 ALTER TABLE `Login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Major`
--

DROP TABLE IF EXISTS `Major`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Major` (
  `Init` varchar(45) NOT NULL,
  `Name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Init`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Major`
--

LOCK TABLES `Major` WRITE;
/*!40000 ALTER TABLE `Major` DISABLE KEYS */;
INSERT INTO `Major` VALUES ('ANTH','Anthropology'),('BI','Biology'),('CIS','Computer Science'),('CLAS','Classics'),('HIST','History'),('MATH','Mathmatics'),('PHSY','Physcis'),('PSY','Psychology');
/*!40000 ALTER TABLE `Major` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Student`
--

DROP TABLE IF EXISTS `Student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Student` (
  `Student_ID` int(11) NOT NULL,
  `Fname` varchar(45) DEFAULT NULL,
  `Lname` varchar(45) DEFAULT NULL,
  `Major` varchar(45) DEFAULT NULL,
  `Level` varchar(45) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Student_ID`),
  KEY `Student_to_Major_idx` (`Major`),
  CONSTRAINT `Student_to_Login` FOREIGN KEY (`Student_ID`) REFERENCES `Login` (`Student_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Student_to_Major` FOREIGN KEY (`Major`) REFERENCES `Major` (`Init`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Student`
--

LOCK TABLES `Student` WRITE;
/*!40000 ALTER TABLE `Student` DISABLE KEYS */;
INSERT INTO `Student` VALUES (951319001,'Zekun','Tang','CIS','Undergraduate','zekun@uoregon.edu'),(951319002,'Erich','Alfsen','HIST','Undergraduate','ealfsen@uoregon.edu'),(951319003,'Sequoia ','Buchanan','BI','Graduate','sequoiab@uoregon.edu'),(951319004,'Brad','Ferguson','ANTH','Undergraduate','bradf@uoregon.edu'),(951319005,'Charlie','Vaughan','MATH','Undergraduate','ccv@uoregon.edu'),(951319006,'Ellen','Eischen','CLAS','Undergraduate','eeischen@uoregon.edu'),(951319007,'McCall','Kochevar','PSY','Graduate','mccallk@uoregon.edu'),(951319008,'Brooke','Adams','PHSY','Graduate','badams7@uoregon.edu'),(951319009,'Tony','Weerd','CIS','Undergraduate','ldeweerd@uoregon.edu'),(951319010,'Feather','Crawford','PHSY','Graduate','feather@uoregon.edu');
/*!40000 ALTER TABLE `Student` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-12-09 16:22:25
