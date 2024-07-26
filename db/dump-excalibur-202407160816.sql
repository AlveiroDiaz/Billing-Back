-- MySQL dump 10.13  Distrib 8.0.35, for Win64 (x86_64)
--
-- Host: excalibur-1.c5aqom8mcn2u.us-east-2.rds.amazonaws.com    Database: excalibur
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

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';

--
-- Table structure for table `CAT_BRAND_VEHICLE`
--

DROP TABLE IF EXISTS `CAT_BRAND_VEHICLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CAT_BRAND_VEHICLE` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) DEFAULT NULL,
  `SLUG` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CAT_BRAND_VEHICLE`
--

LOCK TABLES `CAT_BRAND_VEHICLE` WRITE;
/*!40000 ALTER TABLE `CAT_BRAND_VEHICLE` DISABLE KEYS */;
INSERT INTO `CAT_BRAND_VEHICLE` VALUES (1,'Mazda','Mazda'),(2,'Chevrolet','Chevrolet'),(3,'Ford','Ford');
/*!40000 ALTER TABLE `CAT_BRAND_VEHICLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CAT_MODEL_VEHICLE`
--

DROP TABLE IF EXISTS `CAT_MODEL_VEHICLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CAT_MODEL_VEHICLE` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `ID_BRAND` bigint DEFAULT NULL,
  `NAME` varchar(100) DEFAULT NULL,
  `SLUG` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CAT_MODEL_VEHICLE`
--

LOCK TABLES `CAT_MODEL_VEHICLE` WRITE;
/*!40000 ALTER TABLE `CAT_MODEL_VEHICLE` DISABLE KEYS */;
INSERT INTO `CAT_MODEL_VEHICLE` VALUES (1,1,'323','323'),(2,1,'3','323'),(3,1,'6','323');
/*!40000 ALTER TABLE `CAT_MODEL_VEHICLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CAT_SERVICES`
--

DROP TABLE IF EXISTS `CAT_SERVICES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CAT_SERVICES` (
  `ID` bigint NOT NULL,
  `NAME` varchar(100) DEFAULT NULL,
  `DESCRIPTION` varchar(100) DEFAULT NULL,
  `PRICE` varchar(100) DEFAULT NULL,
  `TYPE_VEHICLE` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CAT_SERVICES`
--

LOCK TABLES `CAT_SERVICES` WRITE;
/*!40000 ALTER TABLE `CAT_SERVICES` DISABLE KEYS */;
/*!40000 ALTER TABLE `CAT_SERVICES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CAT_TYPE_VEHICLE`
--

DROP TABLE IF EXISTS `CAT_TYPE_VEHICLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CAT_TYPE_VEHICLE` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CAT_TYPE_VEHICLE`
--

LOCK TABLES `CAT_TYPE_VEHICLE` WRITE;
/*!40000 ALTER TABLE `CAT_TYPE_VEHICLE` DISABLE KEYS */;
INSERT INTO `CAT_TYPE_VEHICLE` VALUES (1,'Automovil'),(2,'Camion. 1'),(3,'Camion. 2'),(4,'Carry'),(5,'Escolar'),(6,'Moto'),(7,'Otro');
/*!40000 ALTER TABLE `CAT_TYPE_VEHICLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `README`
--

DROP TABLE IF EXISTS `README`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `README` (
  `id` int NOT NULL,
  `Message` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `Bitcoin_Address` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `README`
--

LOCK TABLES `README` WRITE;
/*!40000 ALTER TABLE `README` DISABLE KEYS */;
INSERT INTO `README` VALUES (1,'I have backed up all your databases. To recover them you must pay 0.008 BTC (Bitcoin) to this address: 17K9RDFnWVCxenra9yMQ8UCUazFDkfPPFb . eventlogsfinaktiva, excalibur After your payment email me at fjrusogm492@tutamail.com with your server IP (3.132.97.214) and transaction ID and you will get a download link to your backup. Emails without transaction ID and server IP will be ignored. ','17K9RDFnWVCxenra9yMQ8UCUazFDkfPPFb');
/*!40000 ALTER TABLE `README` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ROLES`
--

DROP TABLE IF EXISTS `ROLES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ROLES` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ROLES`
--

LOCK TABLES `ROLES` WRITE;
/*!40000 ALTER TABLE `ROLES` DISABLE KEYS */;
INSERT INTO `ROLES` VALUES (1,'CLIENT'),(2,'ADMIN'),(3,'EMPLOYEE');
/*!40000 ALTER TABLE `ROLES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SERVICES`
--

DROP TABLE IF EXISTS `SERVICES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SERVICES` (
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
  CONSTRAINT `services_cat_services_FK` FOREIGN KEY (`SERVICE`) REFERENCES `CAT_SERVICES` (`ID`),
  CONSTRAINT `services_users_FK` FOREIGN KEY (`WORKER_ID`) REFERENCES `USERS` (`ID`),
  CONSTRAINT `services_vehicles_FK` FOREIGN KEY (`VEHICLE`) REFERENCES `VEHICLES` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SERVICES`
--

LOCK TABLES `SERVICES` WRITE;
/*!40000 ALTER TABLE `SERVICES` DISABLE KEYS */;
/*!40000 ALTER TABLE `SERVICES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USERS`
--

DROP TABLE IF EXISTS `USERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USERS` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `EMAIL` varchar(100) DEFAULT NULL,
  `NAME` varchar(100) DEFAULT NULL,
  `SURNAME` varchar(100) DEFAULT NULL,
  `PHONE` bigint DEFAULT NULL,
  `ROLE` bigint DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `users_roles_FK` (`ROLE`),
  CONSTRAINT `users_roles_FK` FOREIGN KEY (`ROLE`) REFERENCES `ROLES` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USERS`
--

LOCK TABLES `USERS` WRITE;
/*!40000 ALTER TABLE `USERS` DISABLE KEYS */;
INSERT INTO `USERS` VALUES (2,'alveiro.diaz1@gmail.com','Alveiro','Diaz',3102581793,2),(3,NULL,'Alex','Perez',NULL,3),(4,NULL,'Martha','Albarran',3107884762,1),(5,NULL,'Betty','Pinzon',3112191050,1);
/*!40000 ALTER TABLE `USERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VEHICLES`
--

DROP TABLE IF EXISTS `VEHICLES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `VEHICLES` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `PLACA` varchar(100) DEFAULT NULL,
  `OWNER_ID` bigint DEFAULT NULL,
  `BRAND` varchar(100) DEFAULT NULL,
  `COLOR` varchar(100) DEFAULT NULL,
  `MODEL` varchar(100) DEFAULT NULL,
  `TYPE_VEHICLE` bigint DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `vehicles_cat_type_vehicle_FK` (`TYPE_VEHICLE`),
  CONSTRAINT `vehicles_cat_type_vehicle_FK` FOREIGN KEY (`TYPE_VEHICLE`) REFERENCES `CAT_TYPE_VEHICLE` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VEHICLES`
--

LOCK TABLES `VEHICLES` WRITE;
/*!40000 ALTER TABLE `VEHICLES` DISABLE KEYS */;
INSERT INTO `VEHICLES` VALUES (2,'RGX115',4,'Mazda','negro','323',1),(3,'RGX116',5,'Mazda','negro','323',1);
/*!40000 ALTER TABLE `VEHICLES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'excalibur'
--
/*!50003 DROP PROCEDURE IF EXISTS `SpGetActiveServices` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `SpGetActiveServices`()
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `SpGetModelsByBrand`(IN brandId bigint)
BEGIN
   SELECT cm.NAME AS name, cm.ID AS id

    FROM CAT_MODEL_VEHICLE cm

    WHERE cm.ID_BRAND = brandId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SpGetTotalServicesByCreationDate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `SpGetTotalServicesByCreationDate`(
    IN p_StartDate DATE,
    IN p_EndDate DATE,
    IN p_WorkerId INT
)
BEGIN
    SELECT 
        s.CREATION_DATE,
        SUM(cs.PRICE) as totalPrecio
    FROM 
        services s
    LEFT JOIN cat_services cs ON s.SERVICE = cs.ID
    WHERE 
        s.CREATION_DATE BETWEEN p_StartDate AND p_EndDate 
        AND (s.WORKER_ID = p_WorkerId OR p_WorkerId IS NULL)
    GROUP BY s.CREATION_DATE;
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `SpGetUserVehicles`(IN role VARCHAR(255), IN pageSize BIGINT, IN page BIGINT)
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
        USERS u
    JOIN ROLES r ON u.`ROLE` = r.ID
    left JOIN VEHICLES v ON u.ID = v.OWNER_ID
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
/*!50003 DROP PROCEDURE IF EXISTS `SpGetUserVehiclesByFilters` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `SpGetUserVehiclesByFilters`(
    IN role VARCHAR(255), 
    IN pageSize BIGINT,
    IN page BIGINT,
    IN searchName VARCHAR(255),
    IN searchPlaca VARCHAR(255),
    IN searchPhone VARCHAR(255)
)
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
        USERS u
    JOIN ROLES r ON u.`ROLE` = r.ID
    LEFT JOIN VEHICLES v ON u.ID = v.OWNER_ID
    WHERE

        r.NAME = role
        AND (searchName = 'null' OR (u.NAME LIKE CONCAT('%', searchName, '%') OR u.SURNAME LIKE CONCAT('%', searchName, '%')))
        AND (searchPlaca = 'null' OR (v.PLACA LIKE CONCAT('%', searchPlaca, '%')))
        AND (searchPhone = 'null' OR (u.PHONE LIKE CONCAT('%', searchPhone, '%')))

    GROUP BY
        u.ID
    LIMIT startRecord, pageSize;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-16  8:17:13
