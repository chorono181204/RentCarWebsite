-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: rentcar
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
  `district_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id_car`),
  KEY `car_type_id` (`car_type_id`),
  KEY `car_brand_id` (`car_brand_id`),
  KEY `district_id` (`district_id`),
  CONSTRAINT `car_ibfk_1` FOREIGN KEY (`car_type_id`) REFERENCES `cartype` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `car_ibfk_2` FOREIGN KEY (`car_brand_id`) REFERENCES `carbrand` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `car_ibfk_4` FOREIGN KEY (`district_id`) REFERENCES `district` (`district_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car`
--

LOCK TABLES `car` WRITE;
/*!40000 ALTER TABLE `car` DISABLE KEYS */;
INSERT INTO `car` VALUES (2,'Toyota Vios AT',4,'Gasoline','Automatic',2,'ViosMT_White.png','Compact Sedan',NULL,0,'White',700000,2016,'Đống Đa, HN',1,1,2),(3,'Toyota Vios AT',4,'Gasoline','Automatic',2,'ViosMT_White.png','Compact Sedan',NULL,1,'White',800000,2017,'Hà Đông, Hà Nội',1,1,5),(4,'Toyota Innova MT',7,'Gasoline','Manual',4,'TOYOTA-INNOVA-MT_White.png','Minivan',NULL,0,'White',900000,2020,'829 Bạch Đằng, Hà Nội',5,1,3),(5,'Toyota Altis AT',5,'Gasoline','Automatic',2,'ToyotaAltis-AT_White.png','Compact Sedan',NULL,0,'White',900000,2016,'Đống Đa, Hà Nội',1,1,2),(6,'Toyota Innova MT',7,'Gasoline','Manual',4,'TOYOTA-INNOVA-MT_White.png','Minivan',NULL,0,'White',1000000,2018,'Cầu Giấy, Hà Nội',5,1,4),(7,'Toyota Fortuner MT',7,'Diesel','Manual',3,'ToyotaFortuner-MT_Black.png','Sport Utility Vehicle',NULL,0,'Black',1100000,2019,'P. Gia Thụy, Q. Long Biên',2,1,1),(8,'Toyota Fortuner AT',7,'Diesel','Automatic',3,'ToyotaFortuner-MT_Black.png','Sport Utility Vehicle',NULL,0,'Black',1100000,2016,'Hai Bà Trưng - Hà Nội',2,1,3),(9,'Toyota Innova AT',7,'Gasoline','Automatic',4,'TOYOTA-INNOVA-MT_White.png','Minivan',NULL,1,'White',1100000,2018,'Cầu Giấy, Hà Nội',5,1,4),(10,'Toyota Fortuner 2.4 Máy Dầu MT',7,'Diesel','Manual',3,'ToyotaFortuner-MT_Black.png','Sport Utility Vehicle',NULL,1,'Black',1100000,2017,'829 Bạch Đằng, Hà Nội',2,1,3),(11,'Honda City AT',5,'Gasoline','Automatic',2,'HondaCity-AT_White.png','Compact Sedan',NULL,0,'White',800000,2015,'Cầu Giấy, Hà Nội',1,2,4),(12,'Honda City AT',5,'Gasoline','Automatic',2,'HondaCity-AT_White.png','Compact Sedan',NULL,0,'White',800000,2016,'Đống Đa, Hà Nội',1,2,2),(13,'Honda City AT',5,'Gasoline','Manual',2,'HondaCity-AT_White.png','Compact Sedan',NULL,0,'White',800000,2018,'Đống Đa, Hà Nội',1,2,2),(14,'Honda City AT',5,'Gasoline','Manual',2,'HondaCity-AT_White.png','Compact Sedan',NULL,0,'White',850000,2019,'Cầu Giấy, Hà Nội',1,2,4),(15,'Honda City AT',5,'Gasoline','Manual',2,'HondaCity-AT_White.png','Compact Sedan',NULL,0,'White',850000,2019,'Hai Bà Trưng, Hà Nội',1,2,3),(16,'Honda Civic AT',5,'Gasoline','Automatic',2,'HondaCivic_Black.png','Compact Sedan',NULL,0,'Black',900000,2017,'Đống Đa, Hà Nội',1,2,2),(17,'Honda Civic AT',5,'Gasoline','Automatic',2,'HondaCivic_Black.png','Compact Sedan',NULL,0,'Black',950000,2018,'Hà Đông, Hà Nội',1,2,5),(18,'Honda Civic 1.8 E',5,'Gasoline','Automatic',2,'HondaCivic_Black.png','Compact Sedan',NULL,0,'Black',1000000,2018,'Hai Bà Trưng, Hà Nội',1,2,3),(19,'Honda Civic 1.8 E',5,'Gasoline','Automatic',2,'HondaCivic_Black.png','Compact Sedan',NULL,0,'Black',1100000,2020,'Hai Bà Trưng, Hà Nội',1,2,3),(20,'Honda Civic 1.8 E',5,'Gasoline','Automatic',2,'HondaCivic_Black.png','Compact Sedan',NULL,0,'Black',800000,2015,'Hai Bà Trưng, Hà Nội',1,2,3),(21,'Kia Morning 1.25 EXMT',4,'Gasoline','Manual',2,'KiaMorning_White.png','Minivan',NULL,0,'White',500000,2019,'Ao Sen, Hà Đông',5,3,5),(22,'Kia Morning AT',4,'Gasoline','Automatic',2,'KiaMorning_White.png','Minivan',NULL,0,'White',600000,2019,'Ao Sen, Hà Đông',5,3,5),(23,'Kia Soluto AT',5,'Gasoline','Automatic',2,'KiaSoluto_Black.png','Compact Sedan',NULL,0,'Black',800000,2021,'Cầu Giấy, Hà Nội',1,3,4),(24,'Kia Cerato AT',5,'Gasoline','Automatic',2,'KiaCerato_White.png','Compact Sedan',NULL,0,'White',900000,2020,'Hai Bà Trưng - Hà Nội',1,3,3),(25,'Kia K3 2.0 AT',5,'Gasoline','Automatic',2,'KiaK3_White.png','Compact Sedan',NULL,0,'White',900000,2016,'Hai Bà Trưng - Hà Nội',1,3,3),(26,'Kia K3 1.6 AT',5,'Gasoline','Automatic',2,'KiaK3_White.png','Compact Sedan',NULL,0,'White',900000,2016,'Hai Bà Trưng - Hà Nội',1,3,3),(27,'Kia Cerato AT',5,'Gasoline','Automatic',2,'KiaCerato_White.png','Compact Sedan',NULL,0,'White',1100000,2019,'Cầu Giấy, Hà Nội',1,3,4),(28,'Kia Sorento AT máy dầu',7,'Diesel','Automatic',4,'KiaSoluto_Black.png','Sport Utility Vehicle',NULL,0,'Black',1300000,2017,'Cầu Giấy, Hà Nội',2,3,4),(29,'Kia Soluto AT',5,'Gasoline','Automatic',2,'KiaSoluto_Black.png','Compact Sedan',NULL,0,'Black',700000,2017,'Hà Đông, Hà Nội',1,3,5),(30,'Kia Soluto AT',5,'Gasoline','Manual',2,'KiaSoluto_Black.png','Compact Sedan',NULL,0,'Black',600000,2016,'Hà Đông, Hà Nội',1,3,5),(31,'BMW520i',4,'Gasoline','Automatic',2,'BMW520i_Gray.png','Luxury Sedan',NULL,0,'Gray',3000000,2016,'Long Biên, Hà Nội',1,4,1),(32,'BMW430i',4,'Gasoline','Automatic',2,'BMW430i_Gray.png','Luxury Coupe',NULL,0,'Gray',4000000,2024,'Đống Đa, Hà Nội',4,4,2),(33,'BMW1Series',4,'Gasoline','Automatic',4,'BMW1Series_White.png','Luxury HatchBack',NULL,0,'White',3000000,2022,'Đống Đa, Hà Nội',3,4,2),(34,'BMWi8',4,'Diesel','Automatic',2,'BMWi8_Gray.png','Luxury Coupe',NULL,0,'Gray',4000000,2020,'Hà Đông, Hà Nội',4,4,5),(35,'BMW3Series',4,'Diesel','Automatic',4,'BMW3Series_Black.png','Luxury HatchBack',NULL,0,'Black',3000000,2022,'Đống Đa, Hà Nội',3,4,2),(36,'Mercedes-Benz C250 Exclusive',5,'Diesel','Automatic',2,'Mercedes-Benz-C250-Exclusive-2017_Blue.png','Luxury Sedan',NULL,1,'Blue',2280000,2018,'Đống Đa, Hà Nội',1,5,2),(37,'Mercedes-Benz C250 Exclusive',5,'Diesel','Automatic',2,'Mercedes-Benz-C250-Exclusive-2017_Blue.png','Luxury Sedan',NULL,0,'Blue',2000000,2015,'Cầu Giấy, Hà Nội',1,5,4),(38,'Mercedes-Benz CLE Couple',4,'Gasoline','Automatic',2,'MecCLE_Red.png','Luxury Coupe',NULL,0,'Red',2500000,2019,'Cầu Giấy, Hà Nội',1,5,4),(39,'Mercedes-Benz CLE Couple',4,'Gasoline','Automatic',2,'MecCLE_Red.png','Luxury Coupe',NULL,0,'Red',2700000,2020,'Cầu Giấy, Hà Nội',1,5,4),(40,'Mercedes-AMG-A35-2020',4,'Gasoline','Automatic',2,'Mercedes-AMG-A35-2020_Yallow.png','Luxury HatchBack',NULL,0,'Yellow',2800000,2019,'Hà Đông, Hà Nội',3,5,5),(41,'Hyundai Grand i10 Hatchback AT',4,'Gasoline','Automatic',3,'HyundaiGrand-i10_White.png','Hatchback',NULL,0,'White',600000,2018,'Cầu Giấy, Hà Nội',3,6,4),(42,'Hyundai Grand i10 Hatchback AT',4,'Gasoline','Automatic',3,'HyundaiGrand-i10_White.png','Hatchback',NULL,0,'White',600000,2019,'Cầu Giấy, Hà Nội',3,6,4),(43,'Hyundai Accent AT',5,'Gasoline','Automatic',2,'HyundaiAccent_Gray.png','Compact Sedan',NULL,0,'Gray',800000,2021,'Đống Đa, Hà Nội',1,6,2),(44,'Hyundai Accent AT',5,'Gasoline','Automatic',2,'HyundaiAccent_Gray.png','Compact Sedan',NULL,0,'Gray',800000,2020,'Cầu Giấy, Hà Nội',1,6,4),(45,'Hyundai i30 1.6 AT',5,'Gasoline','Automatic',2,'Hyundai-i30_White.png','Hatchback',NULL,0,'White',800000,2014,'Hai Bà Trưng, Hà Nội',3,6,3),(46,'Hyundai Accent 1.4 AT Special',5,'Gasoline','Automatic',2,'HyundaiAccent_Gray.png','Compact Sedan',NULL,0,'Gray',950000,2021,'Cầu Giấy, Hà Nội',1,6,4),(47,'Hyundai Kona Full',5,'Gasoline','Automatic',2,'HyundaiKonaFull_Red.png','Sport Utility Vehicle',NULL,0,'Red',950000,2019,'Hai Bà Trưng, Hà Nội',2,6,3),(48,'Hyundai Tucson AT',5,'Gasoline','Automatic',2,'HyundaiTucson_Blue.png','Sport Utility Vehicle',NULL,0,'Blue',1000000,2016,'Long Biên, Hà Nội',2,6,1),(49,'Hyundai Elantra AT',5,'Gasoline','Automatic',2,'HyundaiElantra_White.png','Compact Sedan',NULL,0,'White',1000000,2018,'Long Biên, Hà Nội',1,6,1),(50,'Hyundai Santafe GAT',7,'Gasoline','Automatic',3,'Hyundaisantafe_White.png','Sport Utility Vehicle',NULL,0,'White',1300000,2016,'Hà Đông, Hà Nội',2,6,5),(51,'Vinfast Fadil Base',4,'Gasoline','Automatic',2,'Vinfast-Fadil-2020_White.png','Hatchback',NULL,0,'White',600000,2021,'Đống Đa, Hà Nội',3,7,2),(52,'Vinfast Lux A2.0 AT',4,'Gasoline','Automatic',2,'vinfastluxa2.0_Gray.png','Compact Sedan',NULL,0,'Gray',1000000,2021,'Hai Bà Trưng, Hà Nội',1,7,3),(53,'Vinfast Lux A2.0 Premium',4,'Gasoline','Automatic',2,'vinfastluxa2.0_Gray.png','Compact Sedan',NULL,0,'Gray',1300000,2021,'Hai Bà Trưng - Hà Nội',1,7,3),(54,'Vinfast Lux A2.0 AT',4,'Gasoline','Automatic',2,'vinfastluxa2.0_Gray.png','Compact Sedan',NULL,0,'Gray',130000,2021,'Thanh Xuân, Hà Nội',1,7,6),(55,'Vinfast Lux SA2.0 Plus',7,'Gasoline','Automatic',3,'vinfast-lux-sa2.0_White.png','Sport Utility Vehicle',NULL,0,'White',2000000,2021,'Thanh Xuân, Hà Nội',2,7,6),(56,'Nissan Navara 2.5 AT 4WD (VL)',5,'Gasoline','Automatic',3,'Nissannavara_White.png','Minivan',NULL,0,'White',800000,2014,'Thanh Xuân, Hà Nội',5,8,6),(57,'Nissan Sunny XV',5,'Gasoline','Automatic',2,'Nissansunny_White.png','Compact Sedan',NULL,0,'White',800000,2017,'Thanh Xuân, Hà Nội',1,8,6),(58,'Nissan X-Trail 2.0 LE',7,'Gasoline','Automatic',2,'Nissan-x-trail_White.png','Sport Utility Vehicle',NULL,0,'White',900000,2018,'Thanh Xuân, Hà Nội',2,8,6),(59,'Nissan Navara AT 2WD',5,'Gasoline','Automatic',3,'Nissannavara_White.png','Minivan',NULL,0,'White',1000000,2017,'Hai Bà Trưng, Hà Nội',5,8,3),(60,'Nissan Terra 2.5 AT',7,'Gasoline','Automatic',3,'NissanTearra_White.png','Sport Utility Vehicle',NULL,0,'White',1300000,2019,'Hai Bà Trưng, Hà Nội',2,8,3),(64,'Toyota fortuner',1,'Diesel','Manual',6,'BMW3Series_Black.png','abc',5,0,'black',1500000,2024,'Khương Hạ',2,1,6),(65,'Toyota fortuner MT',6,'Diesel','m',6,'ToyotaFortuner-MT_Black.png','abc',5,0,'black',1500000,2024,'Khương Hạ',2,1,6);
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
  CONSTRAINT `cartypebrand_ibfk_1` FOREIGN KEY (`car_type_id`) REFERENCES `cartype` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cartypebrand_ibfk_2` FOREIGN KEY (`car_brand_id`) REFERENCES `carbrand` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
INSERT INTO `contact` VALUES (1,'Ngô Văn Bộ','huy.hoang9988@gmail.com','ABC',' ELCA is a leading Swiss Information Technology Services Company56 years of global history, 26 years of growth in Vietnam, 7 countries, 14 cities, 2000+ experts. ',0,'2024-11-26'),(2,'Dương Nhật Minh','cphuong.linh321@gmail.comom','ABC','ELCA is a leading Swiss Information Technology Services Company56 years of global history, 26 years of growth in Vietnam, 7 countries, 14 cities, 2000+ experts.',0,'2024-11-26'),(3,'Vũ Nguyễn Đức Thắng','vndt@gmail.com','ABC','ELCA is a leading Swiss Information Technology...',0,'2024-11-26'),(4,'Nguyễn Văn A','nguyenvana@gmail.com','XYZ','Lorem ipsum dolor sit amet...',1,'2024-11-27'),(5,'Trần Thị B','tranthib@gmail.com','DEF','Consectetur adipiscing elit...',0,'2024-11-28'),(6,'Lê Minh C','leminhc@gmail.com','GHI','Sed do eiusmod tempor incididunt...',1,'2024-11-29'),(7,'Phạm Hoàng D','phamhoangd@gmail.com','JKL','Ut labore et dolore magna aliqua...',0,'2024-11-30'),(8,'Đặng Hương E','danghuonge@gmail.com','MNO','Excepteur sint occaecat cupidatat...',1,'2024-12-01'),(9,'Hoàng Nam F','hoangnamf@gmail.com','PQR','Duis aute irure dolor in reprehenderit...',0,'2024-12-02'),(10,'Lê Bảo G','lebaog@gmail.com','STU','In voluptate velit esse cillum dolore...',1,'2024-12-03'),(11,'Trương Ánh H','truonganhh@gmail.com','VWX','Eu fugiat nulla pariatur...',0,'2024-12-04'),(12,'Bùi Minh I','buiminhi@gmail.com','YZA','Excepteur sint occaecat cupidatat non proident...',1,'2024-12-05'),(13,'Ngô Thị J','ngothij@gmail.com','BCD','Sunt in culpa qui officia deserunt mollit anim...',0,'2024-12-06'),(14,'Phan Tuấn K','phantuank@gmail.com','EFG','Lorem ipsum dolor sit amet, consectetur...',1,'2024-12-07'),(15,'Hồ Minh L','hominhl@gmail.com','HIJ','Ut enim ad minim veniam...',0,'2024-12-08'),(16,'Đỗ Kim M','dokim.m@gmail.com','LMN','Quis nostrud exercitation ullamco laboris...',1,'2024-12-09');
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
  `pick_time` varchar(55) DEFAULT NULL,
  `status` bigint DEFAULT NULL,
  `id_car` bigint NOT NULL,
  `rent_price` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`rent_id`),
  KEY `id_user` (`id_user`),
  KEY `rentinfor_ibfk_3_idx` (`id_car`),
  CONSTRAINT `rentinfor_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rentinfor_ibfk_3` FOREIGN KEY (`id_car`) REFERENCES `car` (`id_car`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rentinfor`
--

LOCK TABLES `rentinfor` WRITE;
/*!40000 ALTER TABLE `rentinfor` DISABLE KEYS */;
INSERT INTO `rentinfor` VALUES (3,'Trần Bình Minh','0988840133','tran.binh@example.com','Note for user ','2024-12-04','2024-12-07','Location 78','Location 33',3,'8:42',1,9,'3300000'),(4,'Phạm Thị Hương','0986053375','pham.huong@example.com','Note for user ','2024-12-02','2024-12-06','Location 81','Location 81',4,'15:44',1,58,'3600000'),(5,'Hoàng Minh Nam','0987617377','hoang.nam@example.com','Note for user ','2024-12-04','2024-12-07','Location 7','Location 39',5,'18:34',0,40,'8400000'),(6,'Nguyễn Hải Linh','0983017416','nguyen.linh@example.com','Note for user ','2024-12-04','2024-12-12','Location 71','Location 60',6,'21:43',1,18,'8000000'),(7,'Vũ Khánh Khang','0989811531','vu.khang@example.com','Note for user ','2024-12-07','2024-12-10','Location 92','Location 6',7,'12:27',0,25,'2700000'),(8,'Phạm Ngọc Nga','0987567053','pham.nga@example.com','Note for user ','2024-12-05','2024-12-09','Location 17','Location 46',8,'19:38',0,54,'520000'),(9,'Trần Văn Tân','0985934813','tran.tan@example.com','Note for user ','2024-12-06','2024-12-10','Location 37','Location 42',9,'0:50',0,30,'2400000'),(10,'Lê Thị Thảo','0982963822','le.thao@example.com','Note for user ','2024-12-05','2024-12-10','Location 59','Location 5',10,'11:16',0,52,'5000000'),(11,'Nguyễn Quang Huy','09854360','nguyen.quang@example.com','Note for user ','2024-12-08','2024-12-16','Location 9','Location 75',11,'12:18',1,38,'20000000'),(12,'Đỗ Thị Mai','0981194516','do.mai@example.com','Note for user ','2024-12-03','2024-12-09','Location 69','Location 7',12,'6:13',1,23,'4800000'),(13,'Hoàng Văn Thắng','0987218016','hoang.thang@example.com','Note for user ','2024-11-22','2024-12-25','Location 38','Location 28',13,'6:25',0,49,'33000000'),(14,'Ngô Thị Hằng','0988074260','ngo.hang@example.com','Note for user ','2024-12-01','2024-12-04','Location 65','Location 27',14,'9:12',1,22,'1800000'),(15,'Bùi Văn Thịnh','0989092045','bui.thinh@example.com','Note for user ','2024-12-02','2024-12-07','Location 69','Location 97',15,'19:07',0,58,'4500000'),(16,'Thắng Vũ Nguyễn Đức','0346775319','aaa@gmail.com','','2024-11-14','2024-11-16','hn','hn',NULL,'12:00 am',0,19,'2200000'),(20,'Thắng Vũ Nguyễn Đức','0346775319','miumiu181204@gmail.com','','2024-11-23','2024-11-27','hn','hn',NULL,'12:00 am',0,3,'3200000'),(23,'Thắng Vũ Nguyễn Đức','0346775319','aaa3333@gmail.com','','2024-11-30','2024-12-02','Hà nam','Hà nam',17,'12:30am',0,10,'2200000');
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
  `email` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'nguyen_anh','$2a$10$UzyLwgdkHJcVBeSW8OcQk.4xUAZ8XZ8vdXQz2GYlzVfK8myV8hKki','Nguyễn Văn Anh','1990-05-14',0,1,'nguyen.anh@example.com'),(3,'tran_binh','$2a$10$0x8NMDIrJhXRh5QvFyWoEO33FM0oTmgIwaOAGpqy.KIfvx3iDScEq','Trần Bình Minh','1993-03-07',1,1,'tran.binh@example.com'),(4,'pham_huong','$2a$10$EvPGyPT//B/TVzfPEZ1GsO7/0AW.S5pM7sY4.Ygb.Gu9Vmet8WVzi','Phạm Thị Hương','1987-08-29',1,1,'pham.huong@example.com'),(5,'hoang_nam','$2a$10$LVyiJy6mpsdup/6FLQaL7.3UGjREiQBjqAdO6OIskyu0cywjB9A7S','Hoàng Minh Nam','1992-12-11',1,1,'hoang.nam@example.com'),(6,'nguyen_linh','$2a$10$T.GMO64UUjmShl9J5RDAUeno6ftT69KlKcDXh0JuPFOFfKeRpnVli','Nguyễn Hải Linh','1995-01-15',1,1,'nguyen.linh@example.com'),(7,'vu_khang','$2a$10$W9KfL7VIMm5SM/S7/0dHKO.6fV0.um2RZKZqVTrL1.jPkIi5JP./u','Vũ Khánh Khang','1988-06-25',1,1,'vu.khang@example.com'),(8,'pham_nga','$2a$10$KC96CuuNnEiavd1Ym3xnTeUhyZql1Bj70C8TktktAu8.fICee90C6','Phạm Ngọc Nga','1997-09-30',1,1,'pham.nga@example.com'),(9,'tran_tan','$2a$10$ad5Susw7tDJTmwOlZ0EhTO4tI2YJeyKe2WJ.I9ass/JIsyX0Fz3Ui','Trần Văn Tân','1990-11-03',1,1,'tran.tan@example.com'),(10,'le_thao','$2a$10$olnDqYh99EDEwXWt2WhP8.CH7xORJ9z8icySOykNpjOIdUkp3blU2','Lê Thị Thảo','1994-02-17',1,1,'le.thao@example.com'),(11,'nguyen_quang','$2a$10$7jcfBubXapatNgpkWCmi0ObnwrNl10/yPh6Hl9tiXfhqRljiCRwUS','Nguyễn Quang Huy','1989-07-14',1,1,'nguyen.quang@example.com'),(12,'do_mai','$2a$10$MDAMs6uCn/C.8Wy759o1.O9fGoiYV33JcSoDNKTGdZLl64dMXxA/C','Đỗ Thị Mai','1996-03-22',1,1,'do.mai@example.com'),(13,'hoang_thang','$2a$10$NaJd7QPYwtiY5eSgupxe1.XprJhfOiT0wGqs4Zdm0SB2Pj6DNonRK','Hoàng Văn Thắng','1991-10-12',1,1,'hoang.thang@example.com'),(14,'ngo_hang','$2a$10$.hcw915vYW8rs46v5xoePei91MziJnBwWFuHQ7B/e2w8hM7agxtli','Ngô Thị Hằng','1998-05-25',1,1,'ngo.hang@example.com'),(15,'bui_thinh','$2a$10$bVOH/sRESyb6/Gq7lkDvvO5MN6QgquWtsS/f1pjLZo6QbVL/K6bi6','Bùi Văn Thịnh','1993-04-18',1,1,'bui.thinh@example.com'),(17,'admin','$2a$10$RrAcCSIzUGHtwsvJ4kuSZup/ep.1Ix/xjQPdfSykQrwNYv6ccp.Vm','admin','2024-11-14',0,1,'aaa3333@gmail.com'),(18,'thang123','123','Thắng Vũ Nguyễn Đức','2024-11-13',0,NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'rentcar'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-30  2:31:10
