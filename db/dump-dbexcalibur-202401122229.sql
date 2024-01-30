-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: dbexcalibur
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_services`
--

LOCK TABLES `cat_services` WRITE;
/*!40000 ALTER TABLE `cat_services` DISABLE KEYS */;
INSERT INTO `cat_services` VALUES (1,'Juagado int','Juagado int',12000,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES (1,2,1,'2024-01-12 00:00:00','ACTIVE',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,NULL,'Alveiro','Cero',3102581790,1),(2,NULL,'Admin','Admin',NULL,3);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicles`
--

LOCK TABLES `vehicles` WRITE;
/*!40000 ALTER TABLE `vehicles` DISABLE KEYS */;
INSERT INTO `vehicles` VALUES (1,'RGX115',1,'HYUNDAI','negro','Tucson',2),(2,'RHX115',1,'MAZDA','negro','323',1);
/*!40000 ALTER TABLE `vehicles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'dbexcalibur'
--
/*!50003 DROP PROCEDURE IF EXISTS `SpGetActiveServices` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SpGetActiveServices`()
begin
	select 
		u.NAME as NAME_WORKER, 
		v.PLACA as PLACA,
		v.BRAND as BRAND,
		uo.NAME as NAME_OWNER,
		uo.SURNAME as SURNAME_OWNER,
		uo.PHONE as PHONE_OWNER,
		cs.NAME as NAME_SERVICE,
		cs.PRICE as PRICE_SERVICE
	from services s
	left join vehicles v on s.VEHICLE = v.ID
	left join users u on s.WORKER_ID = u.ID
	left join users uo on v.OWNER_ID = uo.ID
	left join cat_services cs on s.SERVICE = cs.ID
	where status = "ACTIVE";
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SpGetModelsByBrand` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SpGetModelsByBrand`(in brandId bigint)
begin
	 SELECT cm.NAME AS name, cm.ID AS id
    FROM cat_model_vehicle cm
    WHERE cm.ID_BRAND = brandId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SpGetUserVehicles` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SpGetUserVehicles`(IN role VARCHAR(255), IN pageSize BIGINT, IN page BIGINT)
BEGIN
   DECLARE startRecord INT;
    SET page = page + 1; -- Incrementar page en 1
    SET startRecord = (page - 1) * pageSize;

    SELECT
        u.NAME,
        u.SURNAME,
        u.PHONE,
        u.ID,
        GROUP_CONCAT(DISTINCT v.BRAND) AS BRANDS,
        GROUP_CONCAT(DISTINCT v.PLACA) AS PLACAS
    FROM
        users u
    JOIN roles r ON u.`ROLE` = r.ID
    left JOIN vehicles v ON u.ID = v.OWNER_ID
    WHERE
        r.NAME = role
    GROUP BY
        u.ID
    LIMIT startRecord, pageSize;
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

-- Dump completed on 2024-01-12 22:29:47
