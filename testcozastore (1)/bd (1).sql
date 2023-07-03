-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: ecom
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `cdecli`
--

DROP TABLE IF EXISTS `cdecli`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cdecli` (
  `numcde` int NOT NULL,
  `numcli` int NOT NULL,
  PRIMARY KEY (`numcde`,`numcli`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdecli`
--

LOCK TABLES `cdecli` WRITE;
/*!40000 ALTER TABLE `cdecli` DISABLE KEYS */;
INSERT INTO `cdecli` VALUES (1,1);
/*!40000 ALTER TABLE `cdecli` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `numCli` int NOT NULL AUTO_INCREMENT,
  `nomCli` varchar(40) DEFAULT NULL,
  `prenomCli` varchar(40) DEFAULT NULL,
  `adrCli` varchar(100) DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  `pass` varchar(60) DEFAULT NULL,
  `role` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`numCli`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (4,'karim','zineb','meknes','zineb@gmail.com','123','Admin'),(17,'elmountasir','manal','kenitra','manal@gmail.com','0000','Visiteur'),(20,'karim','lina','rabat','lina@gmail.com','123','Visiteur');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commande`
--

DROP TABLE IF EXISTS `commande`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commande` (
  `numCde` int NOT NULL AUTO_INCREMENT,
  `nomCli` varchar(45) DEFAULT NULL,
  `adrCli` varchar(45) DEFAULT NULL,
  `dateCde` date DEFAULT NULL,
  PRIMARY KEY (`numCde`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commande`
--

LOCK TABLES `commande` WRITE;
/*!40000 ALTER TABLE `commande` DISABLE KEYS */;
INSERT INTO `commande` VALUES (1,'karim','meknes','2022-12-29'),(2,'karim','meknes','2023-01-10'),(3,'elmountasir','kenitra','2023-01-10');
/*!40000 ALTER TABLE `commande` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `famille`
--

DROP TABLE IF EXISTS `famille`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `famille` (
  `numFam` int NOT NULL,
  `nomFam` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`numFam`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `famille`
--

LOCK TABLES `famille` WRITE;
/*!40000 ALTER TABLE `famille` DISABLE KEYS */;
INSERT INTO `famille` VALUES (1,'Women'),(2,'Men'),(3,'Accessories');
/*!40000 ALTER TABLE `famille` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `procde`
--

DROP TABLE IF EXISTS `procde`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `procde` (
  `numcde` int NOT NULL AUTO_INCREMENT,
  `numpro` int NOT NULL,
  `nomPro` varchar(45) DEFAULT NULL,
  `qte` int DEFAULT NULL,
  PRIMARY KEY (`numcde`,`numpro`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `procde`
--

LOCK TABLES `procde` WRITE;
/*!40000 ALTER TABLE `procde` DISABLE KEYS */;
INSERT INTO `procde` VALUES (1,1,'t-shirt',1),(1,3,'t-shirt',1),(2,2,'chemise',1),(2,3,'manteau',2),(3,2,'chemise',1);
/*!40000 ALTER TABLE `procde` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produit`
--

DROP TABLE IF EXISTS `produit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produit` (
  `numPro` int NOT NULL,
  `puPro` decimal(10,0) DEFAULT NULL,
  `nomPro` varchar(50) DEFAULT NULL,
  `famPro` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`numPro`),
  KEY `famPro` (`famPro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produit`
--

LOCK TABLES `produit` WRITE;
/*!40000 ALTER TABLE `produit` DISABLE KEYS */;
INSERT INTO `produit` VALUES (1,100,'t-shirt','Women'),(2,150,'chemise','Women'),(3,200,'manteau','Women'),(5,150,'veste','Men'),(6,300,'pantalon','Women'),(7,250,'chemise grise','Men'),(8,300,'montre','Accessories'),(10,150,'cactus','Women');
/*!40000 ALTER TABLE `produit` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-10 22:02:14
