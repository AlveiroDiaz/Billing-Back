-- MySQL dump 10.13  Distrib 8.0.35, for Win64 (x86_64)
--
-- Host: excalibur-db-excalibur-app.g.aivencloud.com    Database: dbexcalibur
-- ------------------------------------------------------
-- Server version	8.0.35

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '716d9dee-fa2e-11ef-ad5d-c6ce95821f8c:1-56,
c9c0ab32-e8d7-11ef-85c3-96a876f04a81:1-121,
dc299f1a-d3c4-11ef-a669-520516b37722:1-231';

--
-- Table structure for table `assignments`
--

DROP TABLE IF EXISTS `assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assignments` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `reservation_id` bigint NOT NULL,
  `worker_id` bigint NOT NULL,
  `workspace_id` bigint NOT NULL,
  `assigned_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `reservation_id` (`reservation_id`),
  KEY `worker_id` (`worker_id`),
  KEY `workspace_id` (`workspace_id`),
  CONSTRAINT `assignments_ibfk_2` FOREIGN KEY (`worker_id`) REFERENCES `users` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `assignments_ibfk_3` FOREIGN KEY (`workspace_id`) REFERENCES `workspaces` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignments`
--

LOCK TABLES `assignments` WRITE;
/*!40000 ALTER TABLE `assignments` DISABLE KEYS */;
INSERT INTO `assignments` VALUES (1,1,37,1,'2025-01-19 11:31:18'),(2,2,37,1,'2025-01-19 11:31:18'),(3,2,8,1,'2025-01-19 11:31:18'),(4,20,37,1,'2025-02-12 03:41:03'),(5,21,8,1,'2025-02-12 03:42:49'),(6,22,8,1,'2025-02-12 03:43:48'),(7,23,37,1,'2025-02-12 05:14:31'),(8,24,8,1,'2025-02-14 01:19:55'),(9,25,37,1,'2025-02-14 01:22:35'),(10,26,8,1,'2025-02-14 02:19:33'),(11,27,8,1,'2025-03-06 13:13:38'),(12,28,8,1,'2025-03-06 23:26:54'),(13,29,8,1,'2025-03-07 00:38:31'),(14,30,37,1,'2025-03-07 00:47:20');
/*!40000 ALTER TABLE `assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cat_brand_vehicle`
--

DROP TABLE IF EXISTS `cat_brand_vehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cat_brand_vehicle` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) DEFAULT NULL,
  `SLUG` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_brand_vehicle`
--

LOCK TABLES `cat_brand_vehicle` WRITE;
/*!40000 ALTER TABLE `cat_brand_vehicle` DISABLE KEYS */;
INSERT INTO `cat_brand_vehicle` VALUES (1,'MAZDA','MAZDA'),(2,'HYUNDAI','HYN');
/*!40000 ALTER TABLE `cat_brand_vehicle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cat_model_vehicle`
--

DROP TABLE IF EXISTS `cat_model_vehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cat_model_vehicle` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `ID_BRAND` bigint DEFAULT NULL,
  `NAME` varchar(100) DEFAULT NULL,
  `SLUG` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_model_vehicle`
--

LOCK TABLES `cat_model_vehicle` WRITE;
/*!40000 ALTER TABLE `cat_model_vehicle` DISABLE KEYS */;
INSERT INTO `cat_model_vehicle` VALUES (1,1,'323','323'),(2,2,'Tucson','tuc');
/*!40000 ALTER TABLE `cat_model_vehicle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cat_services`
--

DROP TABLE IF EXISTS `cat_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cat_services` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) DEFAULT NULL,
  `DESCRIPTION` varchar(100) DEFAULT NULL,
  `PRICE` bigint DEFAULT NULL,
  `TYPE_VEHICLE` bigint DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_services`
--

LOCK TABLES `cat_services` WRITE;
/*!40000 ALTER TABLE `cat_services` DISABLE KEYS */;
INSERT INTO `cat_services` VALUES (1,'Juagado','Juagado',15000,1),(2,'General sin motor','General sin motor',40000,1),(3,'General motor','General motor',50000,1),(4,'Vapor','Vapor',60000,1),(5,'Juagado','Juagado',22000,2),(6,'General sin motor','General sin motor',50000,2),(7,'General motor','General motor',70000,2),(8,'Vapor','Vapor',80000,2),(9,'Juagado','Juagado',25000,3),(10,'General sin motor','General sin motor',60000,3),(11,'General motor','General motor',80000,3),(12,'Vapor','Vapor',90000,3),(13,'Juagado','Juagado',15000,1),(14,'General sin motor','General sin motor',40000,1),(15,'General motor','General motor',50000,1),(16,'Vapor','Vapor',60000,1),(17,'Juagado','Juagado',22000,2),(18,'General sin motor','General sin motor',50000,2),(19,'General motor','General motor',70000,2),(20,'Vapor','Vapor',80000,2),(21,'Juagado','Juagado',25000,3),(22,'General sin motor','General sin motor',60000,3),(23,'General motor','General motor',80000,3),(24,'Vapor','Vapor',90000,3);
/*!40000 ALTER TABLE `cat_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cat_type_vehicle`
--

DROP TABLE IF EXISTS `cat_type_vehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cat_type_vehicle` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_type_vehicle`
--

LOCK TABLES `cat_type_vehicle` WRITE;
/*!40000 ALTER TABLE `cat_type_vehicle` DISABLE KEYS */;
INSERT INTO `cat_type_vehicle` VALUES (1,'Automovil'),(2,'Camion. 1'),(3,'Camion. 2'),(4,'Carry'),(5,'Escolar'),(6,'Moto'),(7,'Otro');
/*!40000 ALTER TABLE `cat_type_vehicle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservations`
--

DROP TABLE IF EXISTS `reservations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `vehicle_id` bigint NOT NULL,
  `service_id` bigint NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `duration` int NOT NULL,
  `status` enum('PENDING','CONFIRMED','CANCELED','COMPLETED') NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `vehicle_id` (`vehicle_id`),
  KEY `service_id` (`service_id`),
  CONSTRAINT `reservations_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `reservations_ibfk_2` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `reservations_ibfk_3` FOREIGN KEY (`service_id`) REFERENCES `cat_services` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservations`
--

LOCK TABLES `reservations` WRITE;
/*!40000 ALTER TABLE `reservations` DISABLE KEYS */;
INSERT INTO `reservations` VALUES (30,38,13,3,'2025-03-07','10:00:00',60,'CONFIRMED','2025-03-07 00:47:20'),(31,38,13,3,'2025-03-07','10:00:00',60,'PENDING','2025-03-07 00:49:33');
/*!40000 ALTER TABLE `reservations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'CLIENT'),(2,'ADMIN'),(3,'EMPLOYEE');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `WORKER_ID` bigint DEFAULT NULL,
  `SERVICE` bigint DEFAULT NULL,
  `CREATION_DATE` datetime DEFAULT NULL,
  `STATUS` varchar(100) DEFAULT NULL,
  `VEHICLE` bigint DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `services_vehicles_FK` (`VEHICLE`),
  KEY `services_users_FK` (`WORKER_ID`),
  KEY `services_cat_services_FK` (`SERVICE`),
  CONSTRAINT `services_cat_services_FK` FOREIGN KEY (`SERVICE`) REFERENCES `cat_services` (`ID`),
  CONSTRAINT `services_users_FK` FOREIGN KEY (`WORKER_ID`) REFERENCES `users` (`ID`),
  CONSTRAINT `services_vehicles_FK` FOREIGN KEY (`VEHICLE`) REFERENCES `vehicles` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES (1,2,1,'2024-01-12 00:00:00','FINISHED',1),(2,2,1,'2024-01-12 00:00:00','FINISHED',2),(3,2,1,'2024-01-10 00:00:00','FINISHED',1),(4,2,1,'2024-01-07 00:00:00','FINISHED',1),(5,2,1,'2024-01-05 00:00:00','FINISHED',1),(6,2,1,'2024-01-07 00:00:00','FINISHED',1),(7,2,1,'2024-01-07 00:00:00','FINISHED',1),(8,2,1,'2024-01-07 00:00:00','FINISHED',1),(9,2,1,'2024-01-07 00:00:00','FINISHED',1),(10,2,1,'2024-01-07 00:00:00','FINISHED',1),(11,2,1,'2024-01-07 00:00:00','FINISHED',1),(12,2,1,'2024-01-07 00:00:00','FINISHED',1),(13,2,1,'2024-01-07 00:00:00','FINISHED',1),(14,2,1,'2024-01-07 00:00:00','FINISHED',1),(15,2,1,'2024-01-07 00:00:00','FINISHED',1),(16,2,1,'2024-01-07 00:00:00','FINISHED',1),(17,2,1,'2024-01-07 00:00:00','FINISHED',1),(18,2,1,'2024-01-07 00:00:00','FINISHED',1),(19,2,1,'2024-01-07 00:00:00','FINISHED',1),(20,2,1,'2024-01-07 00:00:00','FINISHED',1),(21,2,1,'2024-01-07 00:00:00','FINISHED',1),(22,2,1,'2024-01-07 00:00:00','FINISHED',1),(23,2,1,'2024-01-07 00:00:00','FINISHED',1),(24,2,1,'2024-01-07 00:00:00','FINISHED',1),(25,2,1,'2024-01-07 00:00:00','FINISHED',1),(26,2,1,'2024-01-07 00:00:00','FINISHED',1),(27,2,1,'2024-01-07 00:00:00','FINISHED',1),(28,2,1,'2024-01-07 00:00:00','FINISHED',1),(29,2,1,'2024-01-07 00:00:00','FINISHED',1),(30,2,1,'2024-01-07 00:00:00','FINISHED',1),(31,2,1,'2024-01-07 00:00:00','FINISHED',1),(32,2,1,'2024-01-30 00:00:00','FINISHED',2),(33,2,8,'2025-01-16 08:49:08','FINISHED',1),(34,2,1,'2025-01-16 20:58:17','FINISHED',6),(35,10,5,'2025-01-16 22:36:35','FINISHED',7),(36,2,1,'2025-01-17 08:13:25','FINISHED',6),(37,2,2,'2025-01-17 17:04:31','FINISHED',10),(38,37,2,'2025-01-18 21:20:43','FINISHED',11),(39,9,2,'2025-02-11 22:18:58','FINISHED',12),(40,8,2,'2025-02-11 23:09:05','FINISHED',12),(41,8,3,'2025-02-11 23:16:21','FINISHED',11),(42,37,1,'2025-02-12 00:15:27','FINISHED',14),(43,8,4,'2025-02-13 20:21:34','FINISHED',12),(44,37,14,'2025-02-13 20:30:37','FINISHED',13),(45,37,4,'2025-02-13 20:31:50','FINISHED',13),(46,37,2,'2025-02-13 20:53:50','FINISHED',13),(47,8,4,'2025-02-14 13:00:00','ACTIVE',12),(48,8,2,'2025-02-14 12:00:00','RESERVED',14),(49,8,7,'2025-02-13 22:52:31','ACTIVE',1),(50,10,8,'2025-02-13 22:53:53','ACTIVE',15),(51,37,3,'2025-03-07 10:00:00','RESERVATE',13);
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `EMAIL` varchar(100) DEFAULT NULL,
  `NAME` varchar(100) DEFAULT NULL,
  `SURNAME` varchar(100) DEFAULT NULL,
  `PHONE` bigint DEFAULT NULL,
  `ROLE` bigint DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `users_roles_FK` (`ROLE`),
  CONSTRAINT `users_roles_FK` FOREIGN KEY (`ROLE`) REFERENCES `roles` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,NULL,'Alveiro','Cero',3102581790,1),(2,NULL,'Admin','Admin',NULL,3),(3,'Alveiro','Uno','D',3109803791,NULL),(4,'Alveiro.dos@yopmail.con','Alveiro','Diaz',3107892370,NULL),(5,'Alveiro.tres@yopmail.com','Alveiro','Tres',7273733,NULL),(6,'Alveiro.tres@yopmail.com','Alveiro','Tres',7273733,NULL),(7,'Alveiro.tres@yopmail.com','Alveiro','Tres',7273733,NULL),(8,'Mono','Rodriguez','Bdb',666348,3),(9,'Hola','Hh','Hhh',7777777777,3),(10,'Hola','Hh','Hhh',7777777777,3),(11,'Hola','Hh','Hhh',7777777777,3),(12,'Hola@bola.com','Hh','Hhh',7777777777,3),(13,NULL,'Paula','Rojas',3203449577,1),(14,NULL,'Space','Diaz',3198097893,1),(15,NULL,'fdasfadsff','fdsafda',5354353453,1),(16,NULL,'Pedro','Infante',4343534566,1),(17,NULL,'Pedro','Infante',4343534562,1),(18,NULL,'Pedro','Infante',4343534560,1),(19,NULL,'Pedro','Infante',4343534521,1),(20,NULL,'Este','Test',9998777777,1),(23,NULL,'fdsfdsaf','fsdafasdfasd',4324234234,1),(24,NULL,'Test','Addd',5345243534,1),(25,NULL,'Pedro','Infante',4343534521,1),(26,NULL,'Este','Test',9998777777,1),(27,NULL,'Pedro','Infante',4343534521,1),(28,NULL,'Este','Test',9998777777,1),(29,NULL,'Este','Test2',9998777777,1),(30,'alveiro.diaz1@gmail.com','Alveiro','Diaz',3102453234,2),(31,'alveiro123@yopmail.com','Al','Test',321444546,1),(32,'autolavadoelingles@gmail.com','Martha','Albarran',3107884763,1),(33,'excaliburappdos@gmail.com','Excalibur','App',3217494373,1),(34,NULL,'Mario','Tierra',3217347845,1),(35,'paula.rojas@liceocervantes.edu.co','Paula','Camila',3203449577,1),(36,'efenriquezm@gmail.com','Elkyn','Enríquez',3022481072,1),(37,'Mario@costeño.com','Mario','Costeño',3201749345,3),(38,'excaliburapp4@gmail.com','Excalibur','App',3214324564,1),(39,NULL,'Mario','Andrez',3264528742,1),(40,'juliocesar@yopmail.com','Julio','Cesar',3102584154,3);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicles`
--

DROP TABLE IF EXISTS `vehicles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicles` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `PLACA` varchar(100) DEFAULT NULL,
  `OWNER_ID` bigint DEFAULT NULL,
  `BRAND` varchar(100) DEFAULT NULL,
  `COLOR` varchar(100) DEFAULT NULL,
  `MODEL` varchar(100) DEFAULT NULL,
  `TYPE_VEHICLE` bigint DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `vehicles_cat_type_vehicle_FK` (`TYPE_VEHICLE`),
  CONSTRAINT `vehicles_cat_type_vehicle_FK` FOREIGN KEY (`TYPE_VEHICLE`) REFERENCES `cat_type_vehicle` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicles`
--

LOCK TABLES `vehicles` WRITE;
/*!40000 ALTER TABLE `vehicles` DISABLE KEYS */;
INSERT INTO `vehicles` VALUES (1,'RGX115',1,'HYUNDAI','negro','Tucson',2),(2,'RHX115',1,'MAZDA','negro','323',1),(3,'AAA111',13,'HYUNDAI','negro','Tucson',1),(4,'AER894',23,'MAZDA','negro','323',1),(5,'CCC234',24,'MAZDA','negro','323',1),(6,'PDF345',32,'MAZDA','negro','323',1),(7,'HDB284',35,'MAZDA','negro','323',2),(8,'GYR564',32,'HYUNDAI','negro','Tucson',2),(9,'GYR564',32,'HYUNDAI','negro','Tucson',2),(10,'JDB126',36,'MAZDA','red','323',1),(11,'UPD123',38,'MAZDA','#9c9adb','323',1),(12,'POR123',38,'MAZDA','red','323',1),(13,'PDK345',38,'HYUNDAI','green','Tucson',1),(14,'UVX123',33,'MAZDA','negro','323',1),(15,'RFD112',39,'HYUNDAI','negro','Tucson',2);
/*!40000 ALTER TABLE `vehicles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vouchers`
--

DROP TABLE IF EXISTS `vouchers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vouchers` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `USER_ID` bigint NOT NULL,
  `AMOUNT` decimal(10,2) NOT NULL,
  `STATUS` enum('pending','paid') DEFAULT 'pending',
  `CREATED_AT` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `USER_ID` (`USER_ID`),
  CONSTRAINT `vouchers_ibfk_1` FOREIGN KEY (`USER_ID`) REFERENCES `users` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vouchers`
--

LOCK TABLES `vouchers` WRITE;
/*!40000 ALTER TABLE `vouchers` DISABLE KEYS */;
INSERT INTO `vouchers` VALUES (1,2,12000.00,'pending','2025-03-11 04:21:28');
/*!40000 ALTER TABLE `vouchers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `worker_schedules`
--

DROP TABLE IF EXISTS `worker_schedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `worker_schedules` (
  `id` bigint NOT NULL,
  `worker_id` bigint NOT NULL,
  `day` enum('MONDAY','TUESDAY','WEDNESDAY','THURSDAY','FRIDAY','SATURDAY','SUNDAY') NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  PRIMARY KEY (`id`),
  KEY `worker_id` (`worker_id`),
  CONSTRAINT `worker_schedules_ibfk_1` FOREIGN KEY (`worker_id`) REFERENCES `users` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `worker_schedules`
--

LOCK TABLES `worker_schedules` WRITE;
/*!40000 ALTER TABLE `worker_schedules` DISABLE KEYS */;
INSERT INTO `worker_schedules` VALUES (1,37,'MONDAY','08:00:00','18:00:00'),(2,37,'TUESDAY','08:00:00','18:00:00'),(3,37,'WEDNESDAY','08:00:00','18:00:00'),(4,37,'THURSDAY','08:00:00','18:00:00'),(5,37,'FRIDAY','08:00:00','18:00:00'),(6,37,'SATURDAY','08:00:00','18:00:00'),(7,8,'MONDAY','08:00:00','18:00:00'),(8,8,'TUESDAY','08:00:00','18:00:00'),(9,8,'WEDNESDAY','08:00:00','18:00:00'),(10,8,'THURSDAY','08:00:00','18:00:00'),(11,8,'FRIDAY','08:00:00','18:00:00'),(12,8,'SATURDAY','11:00:00','18:00:00'),(13,8,'SUNDAY','11:00:00','18:00:00'),(14,37,'SUNDAY','08:00:00','18:00:00');
/*!40000 ALTER TABLE `worker_schedules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workspaces`
--

DROP TABLE IF EXISTS `workspaces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workspaces` (
  `id` bigint NOT NULL,
  `name` varchar(50) NOT NULL,
  `capacity` int DEFAULT '1',
  `status` enum('AVAILABLE','OCCUPIED','MAINTENANCE') DEFAULT 'AVAILABLE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workspaces`
--

LOCK TABLES `workspaces` WRITE;
/*!40000 ALTER TABLE `workspaces` DISABLE KEYS */;
INSERT INTO `workspaces` VALUES (1,'Lavamar',8,'AVAILABLE');
/*!40000 ALTER TABLE `workspaces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'dbexcalibur'
--
/*!50003 DROP PROCEDURE IF EXISTS `GetAvailableHoursAndUsersByDate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER="excalibur"@"%" PROCEDURE "GetAvailableHoursAndUsersByDate"(
    IN input_date DATE -- Fecha específica
)
BEGIN
    -- Crear tabla temporal con el rango de horas (08:00 - 18:00)
    CREATE TEMPORARY TABLE TempHours (
        hour TIME PRIMARY KEY
    );

    -- Insertar el rango de horas
    SET @start_hour = '08:00:00';
    SET @end_hour = '18:00:00';
    WHILE @start_hour <= @end_hour DO
        INSERT INTO TempHours (hour) VALUES (@start_hour);
        SET @start_hour = ADDTIME(@start_hour, '01:00:00'); -- Incrementar por 1 hora
    END WHILE;

    -- Crear una tabla temporal para almacenar los usuarios disponibles por hora
    CREATE TEMPORARY TABLE TempAvailableUsersByHour (
        hour TIME,
        user_id INT,
        email VARCHAR(255),
        first_name VARCHAR(255),
        last_name VARCHAR(255),
        phone VARCHAR(20),
        role INT,
        PRIMARY KEY (hour, user_id) -- Cada combinación hora-usuario es única
    );

    -- Insertar los usuarios disponibles para cada hora
    INSERT INTO TempAvailableUsersByHour (hour, user_id, email, first_name, last_name, phone, role)
    SELECT 
        h.hour,
        u.ID AS user_id,
        u.email,
        u.name AS first_name,
        u.surname AS last_name,
        u.phone,
        u.ROLE AS role
    FROM 
        TempHours h
    CROSS JOIN 
        users u
    WHERE 
        u.ROLE = 3 -- Solo operadores
        AND NOT EXISTS (
            -- Usuarios sin reservas en la fecha y hora actuales
            SELECT 1
            FROM assignments a
            JOIN reservations r ON a.reservation_id = r.id
            WHERE a.worker_id = u.ID
              AND r.date = input_date
              AND r.time = h.hour
        )
        AND EXISTS (
            -- Usuarios con horarios disponibles para la hora específica
            SELECT 1
            FROM worker_schedules ws
            WHERE ws.worker_id = u.ID
              AND ws.day = DAYNAME(input_date)
              AND ws.start_time <= h.hour
              AND ws.end_time > h.hour
        );

    -- Retornar las horas disponibles junto con los usuarios en formato JSON
    SELECT 
    h.hour AS available_hour,
    JSON_ARRAYAGG(
        JSON_OBJECT(
            'id', au.user_id,
            'last_name', au.last_name,
            'first_name', au.first_name
        )
    ) AS available_users
FROM 
    TempHours h
JOIN  -- Cambiar LEFT JOIN por JOIN para excluir horas sin usuarios disponibles
    TempAvailableUsersByHour au ON h.hour = au.hour
GROUP BY 
    h.hour;

    -- Limpiar tablas temporales
    DROP TEMPORARY TABLE IF EXISTS TempHours;
    DROP TEMPORARY TABLE IF EXISTS TempAvailableUsersByHour;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAvailableUsersAndCapacityByDate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER="excalibur"@"%" PROCEDURE "GetAvailableUsersAndCapacityByDate"(
    IN input_date DATE,        -- Fecha específica
    IN input_time TIME         -- Hora específica
)
BEGIN
    -- Crear tabla temporal para almacenar la capacidad disponible de los workspaces
    CREATE TEMPORARY TABLE TempAvailableCapacity (
        workspace_id INT PRIMARY KEY, -- Clave primaria requerida
        workspace_name VARCHAR(255),
        available_capacity INT
    )
    AS
    SELECT 
        w.id AS workspace_id,
        w.name AS workspace_name,
        (w.capacity - IFNULL((
            SELECT COUNT(*)
            FROM assignments a
            JOIN reservations r ON a.reservation_id = r.id
            WHERE a.workspace_id = w.id
              AND r.date = input_date
              AND r.time = input_time
        ), 0)) AS available_capacity
    FROM workspaces w;

    -- Crear tabla temporal para almacenar los usuarios disponibles
    CREATE TEMPORARY TABLE TempAvailableUsers (
        id INT PRIMARY KEY, -- Clave primaria requerida
        email VARCHAR(255),
        first_name VARCHAR(255),
        last_name VARCHAR(255),
        phone VARCHAR(20),
        role INT,
        worker_id INT
    )
    AS
    SELECT 
        u.ID AS id,
        u.email,
        u.name AS first_name,
        u.surname AS last_name,
        u.phone,
        u.ROLE AS role,
        u.ID AS worker_id
    FROM 
        users u
    WHERE 
        u.ROLE = 3 -- Solo usuarios con rol 3 (operadores)
        AND (
            -- Usuarios sin asignaciones en la fecha y hora dadas
            NOT EXISTS (
                SELECT 1
                FROM assignments a
                JOIN reservations r ON a.reservation_id = r.id
                WHERE a.worker_id = u.ID
                  AND r.date = input_date
                  AND r.time = input_time
            )
        )
        AND EXISTS (
            -- Usuarios con horarios disponibles a esa hora
            SELECT 1
            FROM worker_schedules ws
            WHERE ws.worker_id = u.ID
              AND ws.day = DAYNAME(input_date) -- Día de la semana basado en la fecha
              AND ws.start_time <= input_time
              AND ws.end_time > input_time
        );

    -- Retornar los usuarios y espacios disponibles
    SELECT 
        u.*, 
        t.workspace_id, 
        t.workspace_name, 
        t.available_capacity
    FROM 
        TempAvailableUsers u
    LEFT JOIN 
        TempAvailableCapacity t ON t.available_capacity > 0 -- Solo unir con espacios disponibles
    ORDER BY 
        t.workspace_name;

    -- Eliminar tablas temporales
    DROP TEMPORARY TABLE IF EXISTS TempAvailableCapacity;
    DROP TEMPORARY TABLE IF EXISTS TempAvailableUsers;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getReservationsAdmin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER="excalibur"@"%" PROCEDURE "getReservationsAdmin"(
    IN p_userId BIGINT,
    IN p_status VARCHAR(50),
    IN p_page INT,
    IN p_size INT
)
BEGIN
    -- Variables locales para el tamaño de página y el offset calculado
    DECLARE v_size INT DEFAULT 10;  -- Cantidad de registros por página
    DECLARE v_offset INT DEFAULT 0; -- Offset calculado

    -- Si los valores son NULL, se asignan valores por defecto
    IF p_size IS NOT NULL THEN SET v_size = p_size; END IF;
    IF p_page IS NOT NULL AND p_page > 1 THEN 
        SET v_offset = (p_page - 1) * v_size; 
    END IF;

    -- Consulta con paginación
    SELECT 
        cs.NAME AS nameService,
        cs.ID  AS idService,
        cs.PRICE AS priceService, 
        v.PLACA AS placa,
        a.worker_id AS workerId,
        r.*
    FROM reservations r 
    LEFT JOIN cat_services cs ON cs.id = r.service_id
    LEFT JOIN vehicles v ON v.ID = r.vehicle_id
    LEFT JOIN assignments a ON a.reservation_id = r.id
    WHERE (p_userId IS NULL OR r.user_id = p_userId)
      AND (p_status IS NULL OR r.status = p_status)
    ORDER BY r.created_at DESC
    LIMIT v_size OFFSET v_offset;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SpCreateReservation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER="excalibur"@"%" PROCEDURE "SpCreateReservation"(
    IN p_CLIENT_ID BIGINT,
    IN p_VEHICLE_ID BIGINT,
    IN p_SERVICE_ID BIGINT,
    IN p_DATE_RESERVATION DATE,
    IN p_TIME_RESERVATION TIME,
    IN p_TIME_SERVICE INT,
    IN p_STATUS VARCHAR(20)
)
BEGIN
    DECLARE v_RESERVATION_ID BIGINT;
    DECLARE v_WORKER_ID BIGINT;
    DECLARE v_DAY_OF_WEEK INT;

    -- Obtener el día de la semana (1=Lunes, 7=Domingo)
    SET v_DAY_OF_WEEK = DAYOFWEEK(p_DATE_RESERVATION);

    -- Insertar la reserva
    INSERT INTO reservations (user_id, vehicle_id, service_id, date, time, duration, status, created_at)
    VALUES (
        p_CLIENT_ID,              
        p_VEHICLE_ID,              
        p_SERVICE_ID,              
        p_DATE_RESERVATION,     
        p_TIME_RESERVATION,       
        p_TIME_SERVICE,               
        p_STATUS,        
        CURRENT_TIMESTAMP 
    );

    -- Obtener el ID de la reserva recién creada
    SET v_RESERVATION_ID = LAST_INSERT_ID();

    -- Seleccionar un trabajador disponible al azar que no esté asignado a otra reserva en ese horario
    SELECT ws.worker_id 
    INTO v_WORKER_ID
    FROM worker_schedules ws
    WHERE ws.day = v_DAY_OF_WEEK -- Coincide el día de la reserva con el horario del trabajador
      AND ws.start_time <= p_TIME_RESERVATION
      AND ws.end_time >= ADDTIME(p_TIME_RESERVATION, SEC_TO_TIME(p_TIME_SERVICE * 60))
      AND NOT EXISTS (
          SELECT 1 
          FROM assignments a
          JOIN reservations r ON a.reservation_id = r.id
          WHERE a.worker_id = ws.worker_id
          AND r.date = p_DATE_RESERVATION
          AND (
              -- Se superpone con otra reserva
              (r.time <= p_TIME_RESERVATION AND ADDTIME(r.time, SEC_TO_TIME(r.duration * 60)) > p_TIME_RESERVATION) 
              OR 
              (p_TIME_RESERVATION <= r.time AND ADDTIME(p_TIME_RESERVATION, SEC_TO_TIME(p_TIME_SERVICE * 60)) > r.time)
          )
      )
    ORDER BY RAND()
    LIMIT 1;

    -- Si encontró un trabajador disponible, insertarlo en assignments
    IF v_WORKER_ID IS NOT NULL THEN
        INSERT INTO assignments (reservation_id, worker_id, workspace_id, assigned_at)
        VALUES (v_RESERVATION_ID, v_WORKER_ID,1, NOW());
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

-- insufficient privileges to SHOW CREATE PROCEDURE `SpGetActiveServices`
-- does excalibur have permissions on mysql.proc?

