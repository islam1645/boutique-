-- MariaDB dump 10.19  Distrib 10.4.22-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: Somdae
-- ------------------------------------------------------
-- Server version	10.4.22-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `Somdae`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `somdae` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `Somdae`;

--
-- Table structure for table `adresses`
--

DROP TABLE IF EXISTS `adresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adresse` varchar(255) NOT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  `ClientId` int(11) NOT NULL,
  `WilayaId` int(11) NOT NULL,
  `UserId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ClientId` (`ClientId`),
  KEY `WilayaId` (`WilayaId`),
  KEY `UserId` (`UserId`),
  CONSTRAINT `adresses_ibfk_1` FOREIGN KEY (`ClientId`) REFERENCES `clients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `adresses_ibfk_2` FOREIGN KEY (`WilayaId`) REFERENCES `wilayas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `adresses_ibfk_3` FOREIGN KEY (`UserId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adresses`
--

LOCK TABLES `adresses` WRITE;
/*!40000 ALTER TABLE `adresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `adresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autorisations`
--

DROP TABLE IF EXISTS `autorisations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `autorisations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `categorie` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nom` (`nom`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autorisations`
--

LOCK TABLES `autorisations` WRITE;
/*!40000 ALTER TABLE `autorisations` DISABLE KEYS */;
INSERT INTO `autorisations` VALUES (1,'ajouter-users','dfvfdv','','2022-05-10 16:14:30','2022-05-10 16:14:30'),(2,'read-users','','','2022-05-10 16:15:02','2022-05-10 16:15:02'),(3,'moddifier-users','','','2022-05-10 16:15:27','2022-05-10 16:15:27'),(4,'archiver-users','','','2022-05-10 16:15:40','2022-05-10 16:15:40'),(5,'ajouter-produits','','','2022-05-10 16:16:14','2022-05-10 16:16:14'),(6,'read-produits','','','2022-05-10 16:16:28','2022-05-10 16:16:28'),(7,'moddifier-produits','','','2022-05-10 16:16:39','2022-05-10 16:16:39'),(8,'archiver-produits','','','2022-05-10 16:17:01','2022-05-10 16:17:01'),(9,'ajouter-droits','','','2022-05-10 16:17:32','2022-05-10 16:17:32'),(10,'read-droits','','','2022-05-10 16:17:43','2022-05-10 16:17:43'),(11,'moddifier-droits','','','2022-05-10 16:17:53','2022-05-10 16:17:53'),(12,'archiver-droits','','','2022-05-10 16:18:19','2022-05-10 16:18:19'),(13,'ajouter-commandes','','','2022-05-10 16:18:47','2022-05-10 16:18:47'),(14,'read-commandes','','','2022-05-10 16:18:59','2022-05-10 16:18:59'),(15,'moddifier-commandes','','','2022-05-10 16:19:09','2022-05-10 16:19:09'),(16,'archiver-commandes','','','2022-05-10 16:19:21','2022-05-10 16:19:21'),(17,'ajouter-statistiques','','','2022-05-10 16:20:41','2022-05-10 16:20:41'),(18,'moddifier-statistiques','','','2022-05-10 16:20:56','2022-05-10 16:20:56'),(19,'read-statistiques','','','2022-05-10 16:21:12','2022-05-10 16:21:12'),(20,'archiver-statistiques','','','2022-05-10 16:21:23','2022-05-10 16:21:23');
/*!40000 ALTER TABLE `autorisations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autorisations_fonctions`
--

DROP TABLE IF EXISTS `autorisations_fonctions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `autorisations_fonctions` (
  `type` enum('own','all') DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `AutorisationId` int(11) NOT NULL,
  `ProfileId` int(11) NOT NULL,
  PRIMARY KEY (`AutorisationId`,`ProfileId`),
  KEY `ProfileId` (`ProfileId`),
  CONSTRAINT `autorisations_fonctions_ibfk_1` FOREIGN KEY (`AutorisationId`) REFERENCES `autorisations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `autorisations_fonctions_ibfk_2` FOREIGN KEY (`ProfileId`) REFERENCES `profiles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autorisations_fonctions`
--

LOCK TABLES `autorisations_fonctions` WRITE;
/*!40000 ALTER TABLE `autorisations_fonctions` DISABLE KEYS */;
INSERT INTO `autorisations_fonctions` VALUES ('all','2022-06-02 20:12:34','2022-06-02 20:12:34',1,1),('all','2022-06-02 09:19:59','2022-06-02 09:19:59',1,2),('all','2022-06-02 09:19:59','2022-06-02 09:19:59',2,2),('all','2022-06-02 09:19:59','2022-06-02 09:19:59',3,2),('all','2022-06-02 09:19:59','2022-06-02 09:19:59',4,2),('all','2022-06-02 09:19:59','2022-06-02 09:19:59',5,2),('all','2022-06-02 09:19:59','2022-06-02 09:19:59',6,2),('all','2022-06-02 09:19:59','2022-06-02 09:19:59',7,2),('all','2022-06-02 09:19:59','2022-06-02 09:19:59',8,2),('all','2022-06-02 09:19:59','2022-06-02 09:19:59',9,2),('all','2022-06-02 09:19:59','2022-06-02 09:19:59',10,2),('all','2022-06-02 09:19:59','2022-06-02 09:19:59',11,2),('all','2022-06-02 09:19:59','2022-06-02 09:19:59',12,2),('all','2022-06-02 09:19:59','2022-06-02 09:19:59',13,2),('all','2022-06-02 09:19:59','2022-06-02 09:19:59',14,2),('all','2022-06-02 09:19:59','2022-06-02 09:19:59',15,2),('all','2022-06-02 09:19:59','2022-06-02 09:19:59',16,2),('all','2022-06-02 09:19:59','2022-06-02 09:19:59',17,2),('all','2022-06-02 09:19:59','2022-06-02 09:19:59',18,2),('all','2022-06-02 09:19:59','2022-06-02 09:19:59',19,2),('all','2022-06-02 09:19:59','2022-06-02 09:19:59',20,2);
/*!40000 ALTER TABLE `autorisations_fonctions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cathegories`
--

DROP TABLE IF EXISTS `cathegories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cathegories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  `UserId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `UserId` (`UserId`),
  CONSTRAINT `cathegories_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cathegories`
--

LOCK TABLES `cathegories` WRITE;
/*!40000 ALTER TABLE `cathegories` DISABLE KEYS */;
INSERT INTO `cathegories` VALUES (1,'savon','2022-05-04 16:15:56','2022-05-04 16:15:56',NULL,1),(2,'Liquide vaisselle','2022-05-13 13:02:52','2022-05-13 13:02:52',NULL,1),(3,'Laquide machine','2022-05-13 13:03:30','2022-05-13 13:03:30',NULL,1),(4,'Lave sol','2022-05-13 13:03:41','2022-05-13 13:03:41',NULL,1),(5,'Adoucissant','2022-05-13 13:04:14','2022-05-13 13:04:14',NULL,1),(6,'Lessive bébé','2022-05-13 13:04:37','2022-05-13 13:04:37',NULL,1),(7,'Poudre milti-usage','2022-05-13 13:04:51','2022-05-13 13:04:51',NULL,1),(8,'Désinfectant','2022-05-13 13:06:32','2022-05-13 13:06:32',NULL,1);
/*!40000 ALTER TABLE `cathegories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entreprise` varchar(255) NOT NULL,
  `numero` varchar(255) NOT NULL,
  `numeroSecondaire` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  `UserId` int(11) NOT NULL,
  `TypeClientId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entreprise` (`entreprise`),
  UNIQUE KEY `numero` (`numero`),
  UNIQUE KEY `numeroSecondaire` (`numeroSecondaire`),
  KEY `UserId` (`UserId`),
  KEY `TypeClientId` (`TypeClientId`),
  CONSTRAINT `clients_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `clients_ibfk_2` FOREIGN KEY (`TypeClientId`) REFERENCES `typeclients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commandes`
--

DROP TABLE IF EXISTS `commandes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commandes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `vendu` tinyint(1) NOT NULL DEFAULT 0,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  `ClientId` int(11) DEFAULT NULL,
  `UserId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ClientId` (`ClientId`),
  KEY `UserId` (`UserId`),
  CONSTRAINT `commandes_ibfk_1` FOREIGN KEY (`ClientId`) REFERENCES `clients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `commandes_ibfk_2` FOREIGN KEY (`UserId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commandes`
--

LOCK TABLES `commandes` WRITE;
/*!40000 ALTER TABLE `commandes` DISABLE KEYS */;
INSERT INTO `commandes` VALUES (1,'2022-05-05 12:21:03',1,'2022-05-05 12:21:03','2022-05-05 13:37:37',NULL,NULL,2),(2,'2022-05-05 12:22:27',1,'2022-05-05 12:22:27','2022-05-05 13:35:34','2022-05-28 14:55:50',NULL,1),(3,'2022-05-05 12:22:45',1,'2022-05-05 12:22:45','2022-05-05 13:36:48',NULL,NULL,1),(4,'2022-05-09 18:07:21',1,'2022-05-09 18:07:21','2022-05-09 18:08:55','2022-06-02 20:28:01',NULL,1),(5,'2022-05-14 13:15:10',1,'2022-05-14 13:15:10','2022-05-28 14:51:30',NULL,NULL,1),(6,'2022-05-14 13:18:25',1,'2022-05-14 13:18:25','2022-05-28 14:57:24',NULL,NULL,1),(7,'2022-05-14 13:44:34',1,'2022-05-14 13:44:34','2022-06-02 12:45:58',NULL,NULL,1),(8,'2022-05-14 17:55:56',0,'2022-05-14 17:55:56','2022-05-14 17:55:56',NULL,NULL,1),(9,'2022-05-14 17:57:08',0,'2022-05-14 17:57:08','2022-05-14 17:57:08',NULL,NULL,1),(10,'2022-05-14 18:39:12',0,'2022-05-14 18:39:12','2022-05-14 18:39:12',NULL,NULL,1),(11,'2022-05-14 18:41:10',1,'2022-05-14 18:41:10','2022-05-21 15:07:09',NULL,NULL,1),(12,'2022-05-15 13:19:05',1,'2022-05-15 13:19:05','2022-05-15 13:24:21',NULL,NULL,1),(13,'2022-05-27 15:34:00',1,'2022-05-27 15:34:00','2022-06-02 09:24:53',NULL,NULL,1),(14,'2022-05-27 15:39:19',0,'2022-05-27 15:39:19','2022-05-27 15:39:19',NULL,NULL,1);
/*!40000 ALTER TABLE `commandes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedbacks`
--

DROP TABLE IF EXISTS `feedbacks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feedbacks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `adresse` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `lu` tinyint(1) NOT NULL DEFAULT 0,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedbacks`
--

LOCK TABLES `feedbacks` WRITE;
/*!40000 ALTER TABLE `feedbacks` DISABLE KEYS */;
/*!40000 ALTER TABLE `feedbacks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formules`
--

DROP TABLE IF EXISTS `formules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formules` (
  `quantite` int(10) unsigned NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  `undefined` int(11) NOT NULL,
  PRIMARY KEY (`undefined`),
  CONSTRAINT `formules_ibfk_1` FOREIGN KEY (`undefined`) REFERENCES `matieres` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formules`
--

LOCK TABLES `formules` WRITE;
/*!40000 ALTER TABLE `formules` DISABLE KEYS */;
/*!40000 ALTER TABLE `formules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matieres`
--

DROP TABLE IF EXISTS `matieres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matieres` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) NOT NULL,
  `quantite` int(10) unsigned NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matieres`
--

LOCK TABLES `matieres` WRITE;
/*!40000 ALTER TABLE `matieres` DISABLE KEYS */;
/*!40000 ALTER TABLE `matieres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payements`
--

DROP TABLE IF EXISTS `payements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `montant` decimal(10,0) NOT NULL,
  `date` datetime NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  `UserId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `UserId` (`UserId`),
  CONSTRAINT `payements_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payements`
--

LOCK TABLES `payements` WRITE;
/*!40000 ALTER TABLE `payements` DISABLE KEYS */;
INSERT INTO `payements` VALUES (1,200,'2022-05-30 19:58:41','2022-05-30 19:58:41','2022-05-30 19:58:41',NULL,2),(2,200,'2022-05-30 22:53:31','2022-05-30 22:53:31','2022-05-30 22:53:31',NULL,2),(3,200,'2022-05-30 22:55:35','2022-05-30 22:55:35','2022-05-30 22:55:35',NULL,2),(4,200,'2022-05-30 22:56:32','2022-05-30 22:56:32','2022-05-30 22:56:32',NULL,2),(5,200,'2022-05-30 22:57:59','2022-05-30 22:57:59','2022-05-30 22:57:59',NULL,2),(6,200,'2022-05-30 23:00:02','2022-05-30 23:00:02','2022-05-30 23:00:02',NULL,1),(7,200,'2022-05-30 23:02:59','2022-05-30 23:02:59','2022-05-30 23:02:59',NULL,1),(8,300,'2022-05-30 23:19:04','2022-05-30 23:19:04','2022-05-30 23:19:04',NULL,2),(9,300,'2022-05-30 23:20:17','2022-05-30 23:20:17','2022-05-30 23:20:17',NULL,2),(10,300,'2022-05-30 23:21:00','2022-05-30 23:21:00','2022-05-30 23:21:00',NULL,2),(11,300,'2022-05-30 23:24:03','2022-05-30 23:24:03','2022-05-30 23:24:03',NULL,2),(12,300,'2022-05-30 23:24:33','2022-05-30 23:24:33','2022-05-30 23:24:33',NULL,2),(13,300,'2022-05-30 23:38:34','2022-05-30 23:38:34','2022-05-30 23:38:34',NULL,2),(14,300,'2022-05-30 23:40:51','2022-05-30 23:40:51','2022-05-30 23:40:51',NULL,2),(15,300,'2022-05-30 23:53:07','2022-05-30 23:53:07','2022-05-30 23:53:07',NULL,2),(16,200,'2022-05-31 08:51:33','2022-05-31 08:51:33','2022-05-31 08:51:33',NULL,2),(19,500,'2022-05-31 08:59:43','2022-05-31 08:59:43','2022-05-31 08:59:43',NULL,1),(20,500,'2022-05-31 09:00:09','2022-05-31 09:00:09','2022-05-31 09:00:09',NULL,1);
/*!40000 ALTER TABLE `payements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payements_commande`
--

DROP TABLE IF EXISTS `payements_commande`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payements_commande` (
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `PayementId` int(11) NOT NULL,
  `CommandeId` int(11) NOT NULL,
  PRIMARY KEY (`PayementId`,`CommandeId`),
  KEY `CommandeId` (`CommandeId`),
  CONSTRAINT `payements_commande_ibfk_1` FOREIGN KEY (`PayementId`) REFERENCES `payements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `payements_commande_ibfk_2` FOREIGN KEY (`CommandeId`) REFERENCES `commandes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payements_commande`
--

LOCK TABLES `payements_commande` WRITE;
/*!40000 ALTER TABLE `payements_commande` DISABLE KEYS */;
INSERT INTO `payements_commande` VALUES ('2022-05-31 08:59:43','2022-05-31 08:59:43',19,11),('2022-05-31 09:00:09','2022-05-31 09:00:09',20,11);
/*!40000 ALTER TABLE `payements_commande` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payements_vente`
--

DROP TABLE IF EXISTS `payements_vente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payements_vente` (
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `PayementId` int(11) NOT NULL,
  `VenteId` int(11) NOT NULL,
  PRIMARY KEY (`PayementId`,`VenteId`),
  KEY `VenteId` (`VenteId`),
  CONSTRAINT `payements_vente_ibfk_1` FOREIGN KEY (`PayementId`) REFERENCES `payements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `payements_vente_ibfk_2` FOREIGN KEY (`VenteId`) REFERENCES `ventes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payements_vente`
--

LOCK TABLES `payements_vente` WRITE;
/*!40000 ALTER TABLE `payements_vente` DISABLE KEYS */;
/*!40000 ALTER TABLE `payements_vente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produits`
--

DROP TABLE IF EXISTS `produits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantite` int(10) unsigned NOT NULL,
  `description` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `prix` float unsigned NOT NULL,
  `poid` float unsigned NOT NULL,
  `contenance` int(10) unsigned NOT NULL,
  `remise` int(10) unsigned NOT NULL DEFAULT 0,
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  `cathegorieId` int(11) NOT NULL,
  `UserId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `cathegorieId` (`cathegorieId`),
  KEY `UserId` (`UserId`),
  CONSTRAINT `produits_ibfk_1` FOREIGN KEY (`cathegorieId`) REFERENCES `cathegories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `produits_ibfk_2` FOREIGN KEY (`UserId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produits`
--

LOCK TABLES `produits` WRITE;
/*!40000 ALTER TABLE `produits` DISABLE KEYS */;
INSERT INTO `produits` VALUES (2,2,'evervreeeeeeeeeeeeeeeeeee','efeferffr',200,10,5,0,0,'2022-05-04 16:16:34','2022-06-02 12:45:58',NULL,1,1),(3,2,'wScfwdsvwds','sdfger55445',50,50,5,0,0,'2022-05-15 14:54:54','2022-06-02 09:24:53',NULL,2,1),(4,2,'jnjknkini','5brtg',200,10,5,0,0,'2022-05-27 20:53:09','2022-05-27 20:53:09',NULL,1,1),(5,2,'vefrv','grtbgr',200,10,3,0,0,'2022-05-27 20:53:46','2022-05-27 20:53:46',NULL,4,2),(6,5,'vrfvrr','efvfrv5rf8v69r',50,8,6,0,0,'2022-05-27 20:54:19','2022-05-27 20:54:19',NULL,2,2),(7,20,'DCDFCFDF','DCE44',200,10,5,0,0,'2022-05-27 22:23:04','2022-05-27 22:23:04',NULL,2,2),(8,5,'dzcdecde','cdf4feve',20,6,3,0,0,'2022-05-28 00:15:52','2022-05-28 00:15:52',NULL,3,4),(9,20,'GYTGTYGYG','JNKNNHHUI',55,4,0,0,0,'2022-05-28 00:27:32','2022-05-28 00:27:32',NULL,4,1);
/*!40000 ALTER TABLE `produits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produits_commandes`
--

DROP TABLE IF EXISTS `produits_commandes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produits_commandes` (
  `quantite` int(10) unsigned NOT NULL,
  `prix` float NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `CommandeId` int(11) NOT NULL,
  `ProduitId` int(11) NOT NULL,
  PRIMARY KEY (`CommandeId`,`ProduitId`),
  KEY `ProduitId` (`ProduitId`),
  CONSTRAINT `produits_commandes_ibfk_1` FOREIGN KEY (`CommandeId`) REFERENCES `commandes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `produits_commandes_ibfk_2` FOREIGN KEY (`ProduitId`) REFERENCES `produits` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produits_commandes`
--

LOCK TABLES `produits_commandes` WRITE;
/*!40000 ALTER TABLE `produits_commandes` DISABLE KEYS */;
INSERT INTO `produits_commandes` VALUES (1,200,'2022-05-05 12:21:03','2022-05-05 12:21:03',1,2),(3,200,'2022-05-05 12:22:27','2022-05-05 12:22:27',2,2),(4,200,'2022-05-05 12:22:45','2022-05-05 12:22:45',3,2),(2,200,'2022-05-09 18:07:21','2022-05-09 18:07:21',4,2),(3,200,'2022-05-14 13:15:10','2022-05-14 13:15:10',5,2),(2,200,'2022-05-14 13:18:25','2022-05-14 13:18:25',6,2),(0,200,'2022-05-28 17:30:58','2022-05-28 17:30:58',6,5),(3,200,'2022-05-14 13:44:35','2022-05-14 13:44:35',7,2),(20,200,'2022-05-14 17:55:56','2022-05-14 17:55:56',8,2),(2,200,'2022-05-14 17:57:08','2022-05-14 17:57:08',9,2),(2,200,'2022-05-14 18:39:12','2022-05-14 18:39:12',10,2),(20,200,'2022-05-14 18:41:10','2022-05-14 18:41:10',11,2),(3,50,'2022-05-15 13:19:05','2022-05-15 13:19:05',12,3),(5,200,'2022-05-27 15:34:00','2022-05-27 15:34:00',13,2),(1,50,'2022-05-27 15:34:00','2022-05-27 15:34:00',13,3),(1,200,'2022-05-27 15:39:19','2022-05-27 15:39:19',14,2);
/*!40000 ALTER TABLE `produits_commandes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produits_ventes`
--

DROP TABLE IF EXISTS `produits_ventes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produits_ventes` (
  `quantite` int(10) unsigned NOT NULL,
  `prix` float NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `ProduitId` int(11) NOT NULL,
  `VenteId` int(11) NOT NULL,
  PRIMARY KEY (`ProduitId`,`VenteId`),
  KEY `VenteId` (`VenteId`),
  CONSTRAINT `produits_ventes_ibfk_1` FOREIGN KEY (`ProduitId`) REFERENCES `produits` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `produits_ventes_ibfk_2` FOREIGN KEY (`VenteId`) REFERENCES `ventes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produits_ventes`
--

LOCK TABLES `produits_ventes` WRITE;
/*!40000 ALTER TABLE `produits_ventes` DISABLE KEYS */;
/*!40000 ALTER TABLE `produits_ventes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `couleur` varchar(255) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES (1,'client','yechri','orange','','2022-04-27 03:09:55','2022-06-02 20:12:34',NULL),(2,'Admin','admin','vert','','2022-05-13 13:16:22','2022-06-02 09:19:59',NULL),(3,'Gerant','Gerant','jaune','','2022-05-13 13:16:46','2022-05-13 13:16:46',NULL);
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `typeclients`
--

DROP TABLE IF EXISTS `typeclients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `typeclients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `typeclients`
--

LOCK TABLES `typeclients` WRITE;
/*!40000 ALTER TABLE `typeclients` DISABLE KEYS */;
/*!40000 ALTER TABLE `typeclients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `typeproduits`
--

DROP TABLE IF EXISTS `typeproduits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `typeproduits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nom` (`nom`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `typeproduits`
--

LOCK TABLES `typeproduits` WRITE;
/*!40000 ALTER TABLE `typeproduits` DISABLE KEYS */;
/*!40000 ALTER TABLE `typeproduits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `numero` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  `ProfileId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `ProfileId` (`ProfileId`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`ProfileId`) REFERENCES `profiles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'allache','faten','faten@gmail.com','$2a$10$u/rTsHg6G.Iy48FX7J112eEF5/RNL7AN28EFXDXAFTlXPDHQvEwbe','59498498','2022-04-27 01:14:16','2022-04-27 01:14:16',NULL,2),(2,'nazzim','kadouche','nazzim@gmail.com','$2a$10$Dt/mPilbXgaM.yyAsqUcL.pPitEF1V94uCzRs.6wdooiBYWcuq.gG','59498498','2022-04-29 20:37:28','2022-04-29 20:37:28',NULL,1),(3,'test','t4558dhhf8','test@gmail.com','$2a$10$GvpQJJYjDwH5Ylr0vf.yOO8iYsGfRkVeC0rnxI4OKDS4w.xNoPmi2','59498498','2022-05-13 11:15:49','2022-05-13 11:15:49',NULL,1),(4,'frvr','rvrvr','dfvefv@gmail.com','$2a$10$vYq2EvRvPKUxrpnM8X9/cO5HvbK/IWvy3KBKm1AO79MNiybQoAQ02','59498498','2022-05-14 12:19:42','2022-05-14 12:19:42',NULL,1),(5,'mayor','Jesus','Jesus@gmail.com','$2a$10$bp31H/NBChe8tdxwlm.r9.pu5lRBtrmPUwenw82Zup0G2W8qrOxdG','55','2022-05-27 23:48:48','2022-05-27 23:48:48',NULL,2);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventes`
--

DROP TABLE IF EXISTS `ventes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ventes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `valide` tinyint(1) NOT NULL DEFAULT 0,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  `UserId` int(11) DEFAULT NULL,
  `ClientId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `UserId` (`UserId`),
  KEY `ClientId` (`ClientId`),
  CONSTRAINT `ventes_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `ventes_ibfk_2` FOREIGN KEY (`ClientId`) REFERENCES `clients` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventes`
--

LOCK TABLES `ventes` WRITE;
/*!40000 ALTER TABLE `ventes` DISABLE KEYS */;
/*!40000 ALTER TABLE `ventes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wilayas`
--

DROP TABLE IF EXISTS `wilayas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wilayas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wilaya` varchar(255) NOT NULL,
  `latitude` decimal(12,10) NOT NULL,
  `longitude` decimal(12,10) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wilaya` (`wilaya`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wilayas`
--

LOCK TABLES `wilayas` WRITE;
/*!40000 ALTER TABLE `wilayas` DISABLE KEYS */;
/*!40000 ALTER TABLE `wilayas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-03 14:01:03
