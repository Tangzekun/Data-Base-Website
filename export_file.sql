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
  PRIMARY KEY (`CRN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Course`
--

LOCK TABLES `Course` WRITE;
/*!40000 ALTER TABLE `Course` DISABLE KEYS */;
INSERT INTO `Course` VALUES (11087,'BI507','Bruce Bowerman','None','Graduate','Yes','4'),(11453,'CIS211','John Conery','SC','Undergraduate','Yes','4'),(11560,'CIS415','Joe Svenek','SC','Both','No','4'),(11571,'CIS451','Chris Wilson','None','Both','No','4'),(12838,'HIST443','David Luebke','AC','Both','No','4'),(12847,'HIST410','Carlos Aguirre','AL','Both','No','4'),(13733,'MATH256','Huaxin Lin','SC','Undergraduate','No','4'),(13965,'MATH351','Yuan xu','SC','Undergraduate','No','4'),(14678,'PSY607','Jennifer Pfeifer','None','Graduate','No','4'),(14865,'PSY201','Ulrich Mayr','SSC','Undergraduate','No','4'),(15346,'CLAS202','Mary Jaeger','AL','Undergraduate','No','4'),(15789,'CLAS110','Christopher Eckerman','IC','Undergraduate','No','2'),(17334,'PHYS607','Raymond Frey','None','Graduate','No','4'),(17893,'PHYS153','Timothy Jenkins','SC','Undergraduate','No','2'),(19456,'ANTH173','Frances White','IC','Undergraduate','No','2'),(19692,'AAD510','Jon Erlandson','SSC','Graduate','No','4');
/*!40000 ALTER TABLE `Course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Department`
--

DROP TABLE IF EXISTS `Department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Department` (
  `ID` int(11) NOT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `Code` varchar(45) DEFAULT NULL,
  `Head` varchar(45) DEFAULT NULL,
  `Faculty_num` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Department`
--

LOCK TABLES `Department` WRITE;
/*!40000 ALTER TABLE `Department` DISABLE KEYS */;
INSERT INTO `Department` VALUES (1001,'Computer Information and Science','CIS','Joe Sventek',26),(1002,'Department of History','HIST','David Luebke',33),(1003,'Department of Mathematics','MATH','Yuan Xu',61),(1004,'Department of Biology ','BI','Bruce Bowerman',62),(1005,'Department of Classics','CLAS','Christopher Eckerman',10),(1006,'Department of Physics','PHYS','Raymond Frey',35),(1007,'Department of Anthropology','ANTH','Frances White',25),(1008,'Department of Psychology','PSY','Ulrich Mayr',32);
/*!40000 ALTER TABLE `Department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Groups`
--

DROP TABLE IF EXISTS `Groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Groups` (
  `Name` varchar(30) NOT NULL,
  `Code` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Groups`
--

LOCK TABLES `Groups` WRITE;
/*!40000 ALTER TABLE `Groups` DISABLE KEYS */;
INSERT INTO `Groups` VALUES ('American Cultures','AC'),('Arts and Letters','AL'),('International Cultures','IC'),('Science','SC'),('Social Science','SSC');
/*!40000 ALTER TABLE `Groups` ENABLE KEYS */;
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
  `Email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Instructor_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Instructor`
--

LOCK TABLES `Instructor` WRITE;
/*!40000 ALTER TABLE `Instructor` DISABLE KEYS */;
INSERT INTO `Instructor` VALUES (200001,'Chris','Wilson','CIS','cwilson@cs.uoregon.edu'),(200002,'Joe','Svenek','CIS','jsventek@cs.uoregon.edu'),(300001,'Carlos','Aguirre','HIST','caguirre@uoregon.edu'),(300002,'David','Luebke','HIST','dluebke@uoregon.edu'),(400001,'Huaxin','Lin','MATH','hlin@uoregon.edu'),(400002,'Yuan','Xu','MATH','yuan@uoregon.edu'),(500001,'Bruce','Bowerman','BI','bowerman@uoregon.edu'),(500002,'John','Conery','BI','conery@uoregon.edu'),(600001,'Christopher','Eckerman','CLAS','eckerman@uoregon.edu'),(600002,'Mary','Jaeger','CLAS','maryjaeg@uoregon.edu'),(700001,'Raymond','Frey','PHYS','rayfrey@uoregon.edu'),(700002,'Timothy','Jenkins','PHYS','tjenkins@uoregon.edu'),(800001,'Frances ','White','ANTH','fwhite@uoregon.edu'),(800002,'Jon','Erlandson','ANTH','jerland@uoregon.edu'),(900001,'Ulrich','Mayr','PSY','mayr@uoregon.edu'),(900002,'Jennifer','Pfeifer','PSY','jpfeifer@uoregon.edu');
/*!40000 ALTER TABLE `Instructor` ENABLE KEYS */;
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
  `Course1` varchar(45) DEFAULT NULL,
  `Course2` varchar(45) DEFAULT NULL,
  `Course3` varchar(45) DEFAULT NULL,
  `Course4` varchar(45) DEFAULT NULL,
  `Course5` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Student_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Student`
--

LOCK TABLES `Student` WRITE;
/*!40000 ALTER TABLE `Student` DISABLE KEYS */;
INSERT INTO `Student` VALUES (951319001,'Zekun','Tang','CIS','Undergraduate','zekun@uoregon.edu','ANTH173','CIS15','CIS451',NULL,NULL),(951319002,'Erich','Alfsen','HIST','Undergraduate','ealfsen@uoregon.edu','HIST410','HIST443','PHYS153','MATH256',NULL),(951319003,'Sequoia ','Buchanan','BI','Graduate','sequoiab@uoregon.edu','BI507','ANTH173','MATH351','MATH256',NULL),(951319004,'Brad','Ferguson','ANTH','Undergraduate','bradf@uoregon.edu','ANTH173','HIST410','HIST443',NULL,NULL),(951319005,'Charlie','Vaughan','MATH','Undergraduate','ccv@uoregon.edu','MATH256','MATH351','PHYS153','CIS211','CLAS110'),(951319006,'Ellen','Eischen','CLAS','Undergraduate','eeischen@uoregon.edu','CLAS110','CLAS202','AAD510',NULL,NULL),(951319007,'McCall','Kochevar','PSY','Graduate','mccallk@uoregon.edu','PSY210','PSY607','AAD510',NULL,NULL),(951319008,'Brooke','Adams','PHSY','Graduate','badams7@uoregon.edu','PHSY153','PHSY607','PSY607',NULL,NULL),(951319009,'Tony','Weerd','CIS','Undergraduate','ldeweerd@uoregon.edu','CIS211','CIS415','CIS451','MATH256','MATH351'),(951319010,'Feather','Crawford','PHSY','Graduate','feather@uoregon.edu','PHSY153','PHSY607','MATH351','BI507',NULL);
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

-- Dump completed on 2015-12-06 14:31:35
