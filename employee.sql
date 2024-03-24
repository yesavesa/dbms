-- MySQL dump 10.13  Distrib 8.3.0, for macos14 (arm64)
--
-- Host: localhost    Database: employee
-- ------------------------------------------------------
-- Server version	8.3.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `employee`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `employee` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `employee`;

--
-- Table structure for table `DEPARTMENT`
--

DROP TABLE IF EXISTS `DEPARTMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DEPARTMENT` (
  `DNO` varchar(20) NOT NULL,
  `DNAME` varchar(20) DEFAULT NULL,
  `MGRSTARTDATE` date DEFAULT NULL,
  `MGRSSN` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`DNO`),
  KEY `MGRSSN` (`MGRSSN`),
  CONSTRAINT `department_ibfk_1` FOREIGN KEY (`MGRSSN`) REFERENCES `EMPLOYEE` (`SSN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEPARTMENT`
--

LOCK TABLES `DEPARTMENT` WRITE;
/*!40000 ALTER TABLE `DEPARTMENT` DISABLE KEYS */;
INSERT INTO `DEPARTMENT` VALUES ('1','IT','2001-01-01','acs01'),('2','civ','2008-06-07','ci02'),('3','electric','2016-06-07','ec01'),('4','mech','2006-05-09','me03');
/*!40000 ALTER TABLE `DEPARTMENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DLOCATION`
--

DROP TABLE IF EXISTS `DLOCATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DLOCATION` (
  `DLOC` varchar(20) NOT NULL,
  `DNO` varchar(20) NOT NULL,
  PRIMARY KEY (`DNO`,`DLOC`),
  CONSTRAINT `dlocation_ibfk_1` FOREIGN KEY (`DNO`) REFERENCES `DEPARTMENT` (`DNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DLOCATION`
--

LOCK TABLES `DLOCATION` WRITE;
/*!40000 ALTER TABLE `DLOCATION` DISABLE KEYS */;
INSERT INTO `DLOCATION` VALUES ('bangalore','1'),('bangalore','2'),('mangalore','3'),('mysore','4');
/*!40000 ALTER TABLE `DLOCATION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EMPLOYEE`
--

DROP TABLE IF EXISTS `EMPLOYEE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EMPLOYEE` (
  `SSN` varchar(20) NOT NULL,
  `FNAME` varchar(20) DEFAULT NULL,
  `LNAME` varchar(20) DEFAULT NULL,
  `ADDRESS` varchar(100) DEFAULT NULL,
  `SEX` char(1) DEFAULT NULL,
  `SALARY` int DEFAULT NULL,
  `SUPERSSN` varchar(20) DEFAULT NULL,
  `DNO` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`SSN`),
  KEY `SUPERSSN` (`SUPERSSN`),
  KEY `DNO` (`DNO`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`SUPERSSN`) REFERENCES `EMPLOYEE` (`SSN`),
  CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`DNO`) REFERENCES `DEPARTMENT` (`DNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EMPLOYEE`
--

LOCK TABLES `EMPLOYEE` WRITE;
/*!40000 ALTER TABLE `EMPLOYEE` DISABLE KEYS */;
INSERT INTO `EMPLOYEE` VALUES ('acs01','EmployeeFirstName','EmployeeLastName','EmployeeAddress','M',0,'cs01','1'),('ci02','sanketh','elalli','mysoore','m',7500,NULL,NULL),('cs01','sourav','budke','hubli','m',4500,'acs01','4'),('ec01','mahi','hovale','bangalore','f',6500,'ci02','3'),('me03','taju','nadaf','mangalore','m',8500,'me03','1'),('me04','rimi','yeri','dharwad','f',9500,'me03','3');
/*!40000 ALTER TABLE `EMPLOYEE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROJECT`
--

DROP TABLE IF EXISTS `PROJECT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PROJECT` (
  `PNO` int NOT NULL,
  `PNAME` varchar(20) DEFAULT NULL,
  `PLOCATION` varchar(20) DEFAULT NULL,
  `DNO` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`PNO`),
  KEY `DNO` (`DNO`),
  CONSTRAINT `project_ibfk_1` FOREIGN KEY (`DNO`) REFERENCES `DEPARTMENT` (`DNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROJECT`
--

LOCK TABLES `PROJECT` WRITE;
/*!40000 ALTER TABLE `PROJECT` DISABLE KEYS */;
INSERT INTO `PROJECT` VALUES (100,'IOT','bangalore','1'),(101,'cloud_computing','canada','1'),(103,'IOT','dubai','1'),(105,'infrastructure','mangalore','2'),(106,'elctricity','hubli','3'),(107,'vehicle','dharwad','4');
/*!40000 ALTER TABLE `PROJECT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WORKS_ON`
--

DROP TABLE IF EXISTS `WORKS_ON`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `WORKS_ON` (
  `HOURS` int DEFAULT NULL,
  `SSN` varchar(20) NOT NULL,
  `PNO` int NOT NULL,
  PRIMARY KEY (`SSN`,`PNO`),
  KEY `PNO` (`PNO`),
  CONSTRAINT `works_on_ibfk_1` FOREIGN KEY (`SSN`) REFERENCES `EMPLOYEE` (`SSN`),
  CONSTRAINT `works_on_ibfk_2` FOREIGN KEY (`PNO`) REFERENCES `PROJECT` (`PNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WORKS_ON`
--

LOCK TABLES `WORKS_ON` WRITE;
/*!40000 ALTER TABLE `WORKS_ON` DISABLE KEYS */;
INSERT INTO `WORKS_ON` VALUES (2,'ci02',105),(9,'cs01',100),(7,'ec01',106),(5,'me03',107);
/*!40000 ALTER TABLE `WORKS_ON` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-24  9:30:48
