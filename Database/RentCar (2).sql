USE RentCar
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: rentcar
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `car`
--

DROP TABLE IF EXISTS `car`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `car` (
  `id_car` bigint NOT NULL AUTO_INCREMENT,
  `car_name` varchar(100) DEFAULT NULL,
  `seats` bigint DEFAULT NULL,
  `fuel` varchar(50) DEFAULT NULL,
  `transmission` varchar(50) DEFAULT NULL,
  `luggage` bigint DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `description` text,
  `rate` bigint DEFAULT NULL,
  `status` bigint DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  `price` bigint DEFAULT NULL,
  `year_of_manufacture` bigint DEFAULT NULL,
  `current_address` varchar(255) DEFAULT NULL,
  `car_type_id` bigint DEFAULT NULL,
  `car_brand_id` bigint DEFAULT NULL,
  `rent_id` bigint DEFAULT NULL,
  `district_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id_car`),
  KEY `car_type_id` (`car_type_id`),
  KEY `car_brand_id` (`car_brand_id`),
  KEY `rent_id` (`rent_id`),
  KEY `district_id` (`district_id`),
  CONSTRAINT `car_ibfk_1` FOREIGN KEY (`car_type_id`) REFERENCES `cartype` (`id`),
  CONSTRAINT `car_ibfk_2` FOREIGN KEY (`car_brand_id`) REFERENCES `carbrand` (`id`),
  CONSTRAINT `car_ibfk_3` FOREIGN KEY (`rent_id`) REFERENCES `rentinfor` (`rent_id`),
  CONSTRAINT `car_ibfk_4` FOREIGN KEY (`district_id`) REFERENCES `district` (`district_id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car`
--

LOCK TABLES `car` WRITE;
/*!40000 ALTER TABLE `car` DISABLE KEYS */;
INSERT INTO `car` VALUES (1,'Toyota Vios MT',4,'Gasoline','Manual',2,'ViosMT_White.png','Compact Sedan',NULL,NULL,'White',700000,2018,'P.Gia Thụy, Q.Long Biên',1,1,NULL,1),(2,'Toyota Vios AT',4,'Gasoline','Automatic',2,'ViosMT_White.png','Compact Sedan',NULL,NULL,'White',700000,2016,'Đống Đa, HN',1,1,NULL,2),(3,'Toyota Vios AT',4,'Gasoline','Automatic',2,'ViosMT_White.png','Compact Sedan',NULL,NULL,'White',800000,2017,'Hà Đông, Hà Nội',1,1,NULL,5),(4,'Toyota Innova MT',7,'Gasoline','Manual',4,'TOYOTA-INNOVA-MT_White.png','Minivan',NULL,NULL,'White',900000,2020,'829 Bạch Đằng, Hà Nội',5,1,NULL,3),(5,'Toyota Altis AT',5,'Gasoline','Automatic',2,'ToyotaAltis-AT_White.png','Compact Sedan',NULL,NULL,'White',900000,2016,'Đống Đa, Hà Nội',1,1,NULL,2),(6,'Toyota Innova MT',7,'Gasoline','Manual',4,'TOYOTA-INNOVA-MT_White.png','Minivan',NULL,NULL,'White',1000000,2018,'Cầu Giấy, Hà Nội',5,1,NULL,4),(7,'Toyota Fortuner MT',7,'Diesel','Manual',3,'ToyotaFortuner-MT_Black.png','Sport Utility Vehicle',NULL,NULL,'Black',1100000,2019,'P. Gia Thụy, Q. Long Biên',2,1,NULL,1),(8,'Toyota Fortuner AT',7,'Diesel','Automatic',3,'ToyotaFortuner-MT_Black.png','Sport Utility Vehicle',NULL,NULL,'Black',1100000,2016,'Hai Bà Trưng - Hà Nội',2,1,NULL,3),(9,'Toyota Innova AT',7,'Gasoline','Automatic',4,'TOYOTA-INNOVA-MT_White.png','Minivan',NULL,NULL,'White',1100000,2018,'Cầu Giấy, Hà Nội',5,1,NULL,4),(10,'Toyota Fortuner 2.4 Máy Dầu MT',7,'Diesel','Manual',3,'ToyotaFortuner-MT_Black.png','Sport Utility Vehicle',NULL,NULL,'Black',1100000,2017,'829 Bạch Đằng, Hà Nội',2,1,NULL,3),(11,'Honda City AT',5,'Gasoline','Automatic',2,'HondaCity-AT_White.png','Compact Sedan',NULL,NULL,'White',800000,2015,'Cầu Giấy, Hà Nội',1,2,NULL,4),(12,'Honda City AT',5,'Gasoline','Automatic',2,'HondaCity-AT_White.png','Compact Sedan',NULL,NULL,'White',800000,2016,'Đống Đa, Hà Nội',1,2,NULL,2),(13,'Honda City AT',5,'Gasoline','Manual',2,'HondaCity-AT_White.png','Compact Sedan',NULL,NULL,'White',800000,2018,'Đống Đa, Hà Nội',1,2,NULL,2),(14,'Honda City AT',5,'Gasoline','Manual',2,'HondaCity-AT_White.png','Compact Sedan',NULL,NULL,'White',850000,2019,'Cầu Giấy, Hà Nội',1,2,NULL,4),(15,'Honda City AT',5,'Gasoline','Manual',2,'HondaCity-AT_White.png','Compact Sedan',NULL,NULL,'White',850000,2019,'Hai Bà Trưng, Hà Nội',1,2,NULL,3),(16,'Honda Civic AT',5,'Gasoline','Automatic',2,'HondaCivic_Black.png','Compact Sedan',NULL,NULL,'Black',900000,2017,'Đống Đa, Hà Nội',1,2,NULL,2),(17,'Honda Civic AT',5,'Gasoline','Automatic',2,'HondaCivic_Black.png','Compact Sedan',NULL,NULL,'Black',950000,2018,'Hà Đông, Hà Nội',1,2,NULL,5),(18,'Honda Civic 1.8 E',5,'Gasoline','Automatic',2,'HondaCivic_Black.png','Compact Sedan',NULL,NULL,'Black',1000000,2018,'Hai Bà Trưng, Hà Nội',1,2,NULL,3),(19,'Honda Civic 1.8 E',5,'Gasoline','Automatic',2,'HondaCivic_Black.png','Compact Sedan',NULL,NULL,'Black',1100000,2020,'Hai Bà Trưng, Hà Nội',1,2,NULL,3),(20,'Honda Civic 1.8 E',5,'Gasoline','Automatic',2,'HondaCivic_Black.png','Compact Sedan',NULL,NULL,'Black',800000,2015,'Hai Bà Trưng, Hà Nội',1,2,NULL,3),(21,'Kia Morning 1.25 EXMT',4,'Gasoline','Manual',2,'KiaMorning_White.png','Minivan',NULL,NULL,'White',500000,2019,'Ao Sen, Hà Đông',5,3,NULL,5),(22,'Kia Morning AT',4,'Gasoline','Automatic',2,'KiaMorning_White.png','Minivan',NULL,NULL,'White',600000,2019,'Ao Sen, Hà Đông',5,3,NULL,5),(23,'Kia Soluto AT',5,'Gasoline','Automatic',2,'KiaSoluto_Black.png','Compact Sedan',NULL,NULL,'Black',800000,2021,'Cầu Giấy, Hà Nội',1,3,NULL,4),(24,'Kia Cerato AT',5,'Gasoline','Automatic',2,'KiaCerato_White.png','Compact Sedan',NULL,NULL,'White',900000,2020,'Hai Bà Trưng - Hà Nội',1,3,NULL,3),(25,'Kia K3 2.0 AT',5,'Gasoline','Automatic',2,'KiaK3_White.png','Compact Sedan',NULL,NULL,'White',900000,2016,'Hai Bà Trưng - Hà Nội',1,3,NULL,3),(26,'Kia K3 1.6 AT',5,'Gasoline','Automatic',2,'KiaK3_White.png','Compact Sedan',NULL,NULL,'White',900000,2016,'Hai Bà Trưng - Hà Nội',1,3,NULL,3),(27,'Kia Cerato AT',5,'Gasoline','Automatic',2,'KiaCerato_White.png','Compact Sedan',NULL,NULL,'White',1100000,2019,'Cầu Giấy, Hà Nội',1,3,NULL,4),(28,'Kia Sorento AT máy dầu',7,'Diesel','Automatic',4,'KiaSoluto_Black.png','Sport Utility Vehicle',NULL,NULL,'Black',1300000,2017,'Cầu Giấy, Hà Nội',2,3,NULL,4),(29,'Kia Soluto AT',5,'Gasoline','Automatic',2,'KiaSoluto_Black.png','Compact Sedan',NULL,NULL,'Black',700000,2017,'Hà Đông, Hà Nội',1,3,NULL,5),(30,'Kia Soluto AT',5,'Gasoline','Manual',2,'KiaSoluto_Black.png','Compact Sedan',NULL,NULL,'Black',600000,2016,'Hà Đông, Hà Nội',1,3,NULL,5),(31,'BMW520i',4,'Gasoline','Automatic',2,'BMW520i_Gray.png','Luxury Sedan',NULL,NULL,'Gray',3000000,2016,'Long Biên, Hà Nội',1,4,NULL,1),(32,'BMW430i',4,'Gasoline','Automatic',2,'BMW430i_Gray.png','Luxury Coupe',NULL,NULL,'Gray',4000000,2024,'Đống Đa, Hà Nội',4,4,NULL,2),(33,'BMW1Series',4,'Gasoline','Automatic',4,'BMW1Series_White.png','Luxury HatchBack',NULL,NULL,'White',3000000,2022,'Đống Đa, Hà Nội',3,4,NULL,2),(34,'BMWi8',4,'Diesel','Automatic',2,'BMWi8_Gray.png','Luxury Coupe',NULL,NULL,'Gray',4000000,2020,'Hà Đông, Hà Nội',4,4,NULL,5),(35,'BMW3Series',4,'Diesel','Automatic',4,'BMW3Series_Black.png','Luxury HatchBack',NULL,NULL,'Black',3000000,2022,'Đống Đa, Hà Nội',3,4,NULL,2),(36,'Mercedes-Benz C250 Exclusive',5,'Diesel','Automatic',2,'Mercedes-Benz-C250-Exclusive-2017_Blue.png','Luxury Sedan',NULL,NULL,'Blue',2280000,2018,'Đống Đa, Hà Nội',1,5,NULL,2),(37,'Mercedes-Benz C250 Exclusive',5,'Diesel','Automatic',2,'Mercedes-Benz-C250-Exclusive-2017_Blue.png','Luxury Sedan',NULL,NULL,'Blue',2000000,2015,'Cầu Giấy, Hà Nội',1,5,NULL,4),(38,'Mercedes-Benz CLE Couple',4,'Gasoline','Automatic',2,'MecCLE_Red.png','Luxury Coupe',NULL,NULL,'Red',2500000,2019,'Cầu Giấy, Hà Nội',1,5,NULL,4),(39,'Mercedes-Benz CLE Couple',4,'Gasoline','Automatic',2,'MecCLE_Red.png','Luxury Coupe',NULL,NULL,'Red',2700000,2020,'Cầu Giấy, Hà Nội',1,5,NULL,4),(40,'Mercedes-AMG-A35-2020',4,'Gasoline','Automatic',2,'Mercedes-AMG-A35-2020_Yallow.png','Luxury HatchBack',NULL,NULL,'Yellow',2800000,2019,'Hà Đông, Hà Nội',3,5,NULL,5),(41,'Hyundai Grand i10 Hatchback AT',4,'Gasoline','Automatic',3,'HyundaiGrand-i10_White.png','Hatchback',NULL,NULL,'White',600000,2018,'Cầu Giấy, Hà Nội',3,6,NULL,4),(42,'Hyundai Grand i10 Hatchback AT',4,'Gasoline','Automatic',3,'HyundaiGrand-i10_White.png','Hatchback',NULL,NULL,'White',600000,2019,'Cầu Giấy, Hà Nội',3,6,NULL,4),(43,'Hyundai Accent AT',5,'Gasoline','Automatic',2,'HyundaiAccent_Gray.png','Compact Sedan',NULL,NULL,'Gray',800000,2021,'Đống Đa, Hà Nội',1,6,NULL,2),(44,'Hyundai Accent AT',5,'Gasoline','Automatic',2,'HyundaiAccent_Gray.png','Compact Sedan',NULL,NULL,'Gray',800000,2020,'Cầu Giấy, Hà Nội',1,6,NULL,4),(45,'Hyundai i30 1.6 AT',5,'Gasoline','Automatic',2,'Hyundai-i30_White.png','Hatchback',NULL,NULL,'White',800000,2014,'Hai Bà Trưng, Hà Nội',3,6,NULL,3),(46,'Hyundai Accent 1.4 AT Special',5,'Gasoline','Automatic',2,'HuyndaiAccent_Gray.png','Compact Sedan',NULL,NULL,'Gray',950000,2021,'Cầu Giấy, Hà Nội',1,6,NULL,4),(47,'Hyundai Kona Full',5,'Gasoline','Automatic',2,'Hyundai Kona Full_Red.png','Sport Utility Vehicle',NULL,NULL,'Red',950000,2019,'Hai Bà Trưng, Hà Nội',2,6,NULL,3),(48,'Hyundai Tucson AT',5,'Gasoline','Automatic',2,'HyundaiTucson_Blue.png','Sport Utility Vehicle',NULL,NULL,'Blue',1000000,2016,'Long Biên, Hà Nội',2,6,NULL,1),(49,'Hyundai Elantra AT',5,'Gasoline','Automatic',2,'HyundaiElantra_White.png','Compact Sedan',NULL,NULL,'White',1000000,2018,'Long Biên, Hà Nội',1,6,NULL,1),(50,'Hyundai Santafe GAT',7,'Gasoline','Automatic',3,'Hyundai santa fe_White.png','Sport Utility Vehicle',NULL,NULL,'White',1300000,2016,'Hà Đông, Hà Nội',2,6,NULL,5),(51,'Vinfast Fadil Base',4,'Gasoline','Automatic',2,'Vinfast-Fadil-2020_White.png','Hatchback',NULL,NULL,'White',600000,2021,'Đống Đa, Hà Nội',3,7,NULL,2),(52,'Vinfast Lux A2.0 AT',4,'Gasoline','Automatic',2,'vinfast lux a2.0_Gray.png','Compact Sedan',NULL,NULL,'Gray',1000000,2021,'Hai Bà Trưng, Hà Nội',1,7,NULL,3),(53,'Vinfast Lux A2.0 Premium',4,'Gasoline','Automatic',2,'vinfast lux a2.0_Gray.png','Compact Sedan',NULL,NULL,'Gray',1300000,2021,'Hai Bà Trưng - Hà Nội',1,7,NULL,3),(54,'Vinfast Lux A2.0 AT',4,'Gasoline','Automatic',2,'vinfast lux a2.0_Gray.png','Compact Sedan',NULL,NULL,'Gray',130000,2021,'Thanh Xuân, Hà Nội',1,7,NULL,6),(55,'Vinfast Lux SA2.0 Plus',7,'Gasoline','Automatic',3,'vinfast-lux-sa2.0_White.png','Sport Utility Vehicle',NULL,NULL,'White',2000000,2021,'Thanh Xuân, Hà Nội',2,7,NULL,6),(56,'Nissan Navara 2.5 AT 4WD (VL)',5,'Gasoline','Automatic',3,'Nissan navara_White.png','Minivan',NULL,NULL,'White',800000,2014,'Thanh Xuân, Hà Nội',5,8,NULL,6),(57,'Nissan Sunny XV',5,'Gasoline','Automatic',2,'Nissan sunny_White.png','Compact Sedan',NULL,NULL,'White',800000,2017,'Thanh Xuân, Hà Nội',1,8,NULL,6),(58,'Nissan X-Trail 2.0 LE',7,'Gasoline','Automatic',2,'Nissan-x-trail_White.png','Sport Utility Vehicle',NULL,NULL,'White',900000,2018,'Thanh Xuân, Hà Nội',2,8,NULL,6),(59,'Nissan Navara AT 2WD',5,'Gasoline','Automatic',3,'Nissan navara_White.png','Minivan',NULL,NULL,'White',1000000,2017,'Hai Bà Trưng, Hà Nội',5,8,NULL,3),(60,'Nissan Terra 2.5 AT',7,'Gasoline','Automatic',3,'NissanTearra_White.png','Sport Utility Vehicle',NULL,NULL,'White',1300000,2019,'Hai Bà Trưng, Hà Nội',2,8,NULL,3);
/*!40000 ALTER TABLE `car` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carbrand`
--

DROP TABLE IF EXISTS `carbrand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carbrand` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carbrand`
--

LOCK TABLES `carbrand` WRITE;
/*!40000 ALTER TABLE `carbrand` DISABLE KEYS */;
INSERT INTO `carbrand` VALUES (1,'Toyota'),(2,'Honda'),(3,'Kia'),(4,'BMW'),(5,'Mercedes'),(6,'Hyundai'),(7,'VinFast'),(8,'Nissan');
/*!40000 ALTER TABLE `carbrand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cartype`
--

DROP TABLE IF EXISTS `cartype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cartype` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartype`
--

LOCK TABLES `cartype` WRITE;
/*!40000 ALTER TABLE `cartype` DISABLE KEYS */;
INSERT INTO `cartype` VALUES (1,'Sedan'),(2,'SUV'),(3,'Hatchback'),(4,'Coupe'),(5,'MVP');
/*!40000 ALTER TABLE `cartype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cartypebrand`
--

DROP TABLE IF EXISTS `cartypebrand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cartypebrand` (
  `car_type_id` bigint NOT NULL,
  `car_brand_id` bigint NOT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `car_type_id` (`car_type_id`),
  KEY `car_brand_id` (`car_brand_id`),
  CONSTRAINT `cartypebrand_ibfk_1` FOREIGN KEY (`car_type_id`) REFERENCES `cartype` (`id`),
  CONSTRAINT `cartypebrand_ibfk_2` FOREIGN KEY (`car_brand_id`) REFERENCES `carbrand` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartypebrand`
--

LOCK TABLES `cartypebrand` WRITE;
/*!40000 ALTER TABLE `cartypebrand` DISABLE KEYS */;
INSERT INTO `cartypebrand` VALUES (1,1,1),(1,2,2),(1,3,3),(1,4,4),(1,5,5),(1,6,6),(1,7,7),(1,8,8),(2,1,9),(2,2,10),(2,3,11),(2,4,12),(2,5,13),(2,6,14),(2,7,15),(2,8,16),(3,1,17),(3,2,18),(3,3,19),(3,4,20),(3,5,21),(3,6,22),(3,7,23),(3,8,24),(4,1,25),(4,2,26),(4,3,27),(4,4,28),(4,5,29),(4,6,30),(4,7,31),(4,8,32),(5,1,33),(5,2,34),(5,3,35),(5,4,36),(5,5,37),(5,6,38),(5,7,39),(5,8,40);
/*!40000 ALTER TABLE `cartypebrand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `message` text,
  `status` bigint DEFAULT NULL,
  `time_sent` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `district`
--

DROP TABLE IF EXISTS `district`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `district` (
  `district_id` bigint NOT NULL AUTO_INCREMENT,
  `district_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`district_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `district`
--

LOCK TABLES `district` WRITE;
/*!40000 ALTER TABLE `district` DISABLE KEYS */;
INSERT INTO `district` VALUES (1,'Long Biên'),(2,'Đống Đa'),(3,'Hai Bà Trưng'),(4,'Cầu Giấy'),(5,'Hà Đông'),(6,'Thanh Xuân');
/*!40000 ALTER TABLE `district` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rentinfor`
--

DROP TABLE IF EXISTS `rentinfor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rentinfor` (
  `rent_id` bigint NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(100) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `customer_note` text,
  `pick_up_date` date DEFAULT NULL,
  `pick_off_date` date DEFAULT NULL,
  `pick_up_location` varchar(255) DEFAULT NULL,
  `pick_off_location` varchar(255) DEFAULT NULL,
  `id_user` bigint DEFAULT NULL,
  `time_sent` date DEFAULT NULL,
  `status` bigint DEFAULT NULL,
  PRIMARY KEY (`rent_id`),
  KEY `id_user` (`id_user`),
  CONSTRAINT `rentinfor_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rentinfor`
--

LOCK TABLES `rentinfor` WRITE;
/*!40000 ALTER TABLE `rentinfor` DISABLE KEYS */;
/*!40000 ALTER TABLE `rentinfor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id_user` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `date_of_bird` date DEFAULT NULL,
  `role` bigint DEFAULT NULL,
  `status` bigint DEFAULT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'ducxyz','12345678','Nguyễn Huỳnh Đức','2004-07-04',0,NULL),(2,'hung123','abcd1234','Nguyễn Tuấn Lộc','2000-03-22',1,NULL),(3,'hong123','abcdefgh','Nguyễn Thị Hồng','2001-09-20',1,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-06 17:41:46
