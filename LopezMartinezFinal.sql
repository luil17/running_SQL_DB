CREATE DATABASE  IF NOT EXISTS `running_database` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `running_database`;
-- MySQL dump 10.13  Distrib 8.0.46, for macos26.4 (arm64)
--
-- Host: 127.0.0.1    Database: running_database
-- ------------------------------------------------------
-- Server version	8.0.46

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Athletes`
--

DROP TABLE IF EXISTS `Athletes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Athletes` (
  `AthleteID` int NOT NULL AUTO_INCREMENT,
  `First_Name` varchar(50) NOT NULL,
  `Last_Name` varchar(50) NOT NULL,
  `Age` tinyint NOT NULL,
  `Gender` varchar(15) DEFAULT 'Not specified',
  `Email` varchar(150) DEFAULT NULL,
  `HometownID` int NOT NULL,
  PRIMARY KEY (`AthleteID`),
  KEY `LocationID` (`HometownID`),
  CONSTRAINT `LocationID` FOREIGN KEY (`HometownID`) REFERENCES `Location` (`LocationID`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Athletes`
--

LOCK TABLES `Athletes` WRITE;
/*!40000 ALTER TABLE `Athletes` DISABLE KEYS */;
INSERT INTO `Athletes` VALUES (12,'Sarah','Smit',28,'Female','sconnor@example.com',2),(13,'Marcus','Jack',35,'Male','marcus8888@example.com',3),(14,'Chris','Barn',24,'Female','echen@example.com',4),(15,'David','Miller',42,'Non-binary ','miller@example.com',5),(16,'Jessica','Davis',31,'Female','davis@example.com',1),(17,'Michael','Wilson',29,'Male','mw12345@example.com',2),(18,'Anna','Taylor',22,'Non-binary ','ataylor@lol.com',3),(19,'James','Anderson',38,'Male','jamesand@mail.com',4),(20,'Laura','Thomas',27,'Non-binary ','lthomas@example.com',5),(21,'Robert','Jack',19,'Male','jackson@example.net',1),(22,'Olivia','White',26,'Female','owhite@example.com',2);
/*!40000 ALTER TABLE `Athletes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Location`
--

DROP TABLE IF EXISTS `Location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Location` (
  `LocationID` int NOT NULL AUTO_INCREMENT,
  `City` varchar(50) NOT NULL,
  `State` varchar(50) NOT NULL,
  PRIMARY KEY (`LocationID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Location`
--

LOCK TABLES `Location` WRITE;
/*!40000 ALTER TABLE `Location` DISABLE KEYS */;
INSERT INTO `Location` VALUES (1,'Des Moines','Iowa'),(2,'Chicago','Illinois'),(3,'Austin','Texas'),(4,'Boston','Massachusetts'),(5,'Denver','Colorado');
/*!40000 ALTER TABLE `Location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Race`
--

DROP TABLE IF EXISTS `Race`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Race` (
  `RaceID` int NOT NULL AUTO_INCREMENT,
  `Race_Name` varchar(60) NOT NULL,
  `Race_Distance` decimal(5,2) NOT NULL,
  `LocationID` int NOT NULL,
  `Race_Date` date NOT NULL,
  `RaceCost` decimal(6,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`RaceID`),
  KEY `LocationID` (`LocationID`),
  CONSTRAINT `race_ibfk_1` FOREIGN KEY (`LocationID`) REFERENCES `Location` (`LocationID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Race`
--

LOCK TABLES `Race` WRITE;
/*!40000 ALTER TABLE `Race` DISABLE KEYS */;
INSERT INTO `Race` VALUES (1,'Capital City Marathon',26.20,1,'2026-10-18',115.00),(2,'Windy City Half',13.10,2,'2026-09-15',85.00),(3,'Texas 10K',6.20,3,'2026-11-12',45.00),(4,'Boston Qualifier 5K',3.10,4,'2026-04-19',35.00),(5,'5 Mile Dash',1.00,5,'2026-08-20',25.00),(6,'Turkey Trot 5k',3.10,1,'2026-11-26',30.00);
/*!40000 ALTER TABLE `Race` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Registrations`
--

DROP TABLE IF EXISTS `Registrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Registrations` (
  `RegistrationID` int NOT NULL AUTO_INCREMENT,
  `AthleteID` int NOT NULL,
  `BibNumber` int NOT NULL,
  `RaceID` int NOT NULL,
  PRIMARY KEY (`RegistrationID`),
  KEY `AthleteID` (`AthleteID`),
  KEY `RaceID` (`RaceID`),
  CONSTRAINT `registrations_ibfk_1` FOREIGN KEY (`AthleteID`) REFERENCES `Athletes` (`AthleteID`),
  CONSTRAINT `registrations_ibfk_2` FOREIGN KEY (`RaceID`) REFERENCES `Race` (`RaceID`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Registrations`
--

LOCK TABLES `Registrations` WRITE;
/*!40000 ALTER TABLE `Registrations` DISABLE KEYS */;
INSERT INTO `Registrations` VALUES (25,12,1001,1),(26,13,1002,2),(27,14,1003,3),(28,15,1004,4),(29,16,1005,5),(30,17,1006,6),(31,18,1007,1),(32,19,1008,2),(33,20,1009,3),(34,21,1010,4),(35,22,1011,5);
/*!40000 ALTER TABLE `Registrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Results`
--

DROP TABLE IF EXISTS `Results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Results` (
  `ResultID` int NOT NULL AUTO_INCREMENT,
  `RegistrationID` int NOT NULL,
  `StartTime` time NOT NULL,
  `FinishTime` time NOT NULL,
  `Runner_Status` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`ResultID`),
  KEY `RegistrationID` (`RegistrationID`),
  CONSTRAINT `results_ibfk_1` FOREIGN KEY (`RegistrationID`) REFERENCES `Registrations` (`RegistrationID`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Results`
--

LOCK TABLES `Results` WRITE;
/*!40000 ALTER TABLE `Results` DISABLE KEYS */;
INSERT INTO `Results` VALUES (36,25,'08:00:00','12:15:30','Finished'),(37,26,'07:30:00','09:25:45','Finished'),(38,27,'09:00:00','09:55:10','Finished'),(39,28,'08:00:00','08:24:15','Finished'),(40,29,'10:00:00','10:07:30','Finished'),(41,30,'08:30:00','08:58:20','Finished'),(42,31,'08:00:00','00:00:00','DNF'),(43,32,'07:30:00','09:40:12','Finished'),(44,33,'00:00:00','00:00:00','DNS'),(45,34,'08:00:00','08:29:45','Finished'),(46,35,'10:00:00','10:08:15','Finished');
/*!40000 ALTER TABLE `Results` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-08-05 23:47:27
