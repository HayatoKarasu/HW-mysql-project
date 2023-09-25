-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: beauty_salons
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `текст_отзыва` varchar(500) NOT NULL,
  `дата_добавления_отзыва` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `salon_id` int DEFAULT NULL,
  `master_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `salon_id` (`salon_id`),
  KEY `master_id` (`master_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`salon_id`) REFERENCES `salons` (`id`),
  CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`master_id`) REFERENCES `masters` (`id`),
  CONSTRAINT `comments_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,'Все отлично!','2023-09-25 20:12:44',1,1,1),(2,'Косэлёк, косэлёк! Какой такой косэлёк!','2023-09-25 20:12:44',2,2,2);
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipments`
--

DROP TABLE IF EXISTS `equipments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `название_оборудования` varchar(50) NOT NULL,
  `salon_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `salon_id` (`salon_id`),
  CONSTRAINT `equipments_ibfk_1` FOREIGN KEY (`salon_id`) REFERENCES `salons` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipments`
--

LOCK TABLES `equipments` WRITE;
/*!40000 ALTER TABLE `equipments` DISABLE KEYS */;
INSERT INTO `equipments` VALUES (1,'Ножницы',1),(2,'Бритва',2);
/*!40000 ALTER TABLE `equipments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipments_servise`
--

DROP TABLE IF EXISTS `equipments_servise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipments_servise` (
  `equipment_id` int NOT NULL,
  `servise_id` int NOT NULL,
  PRIMARY KEY (`equipment_id`,`servise_id`),
  KEY `servise_id` (`servise_id`),
  CONSTRAINT `equipments_servise_ibfk_1` FOREIGN KEY (`equipment_id`) REFERENCES `equipments` (`id`),
  CONSTRAINT `equipments_servise_ibfk_2` FOREIGN KEY (`servise_id`) REFERENCES `servise` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipments_servise`
--

LOCK TABLES `equipments_servise` WRITE;
/*!40000 ALTER TABLE `equipments_servise` DISABLE KEYS */;
INSERT INTO `equipments_servise` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `equipments_servise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `masters`
--

DROP TABLE IF EXISTS `masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `masters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `фамилия_мастера` varchar(50) NOT NULL,
  `имя_мастера` varchar(50) NOT NULL,
  `телефон_мастера` varchar(15) NOT NULL,
  `salon_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `salon_id` (`salon_id`),
  CONSTRAINT `masters_ibfk_1` FOREIGN KEY (`salon_id`) REFERENCES `salons` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `masters`
--

LOCK TABLES `masters` WRITE;
/*!40000 ALTER TABLE `masters` DISABLE KEYS */;
INSERT INTO `masters` VALUES (1,'Барашкина','Ольга','8(888)888-88-88',1),(2,'Овечкина','Светлана','9(999)999-99-99',2);
/*!40000 ALTER TABLE `masters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `masters_servise`
--

DROP TABLE IF EXISTS `masters_servise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `masters_servise` (
  `master_id` int NOT NULL,
  `servise_id` int NOT NULL,
  PRIMARY KEY (`master_id`,`servise_id`),
  KEY `servise_id` (`servise_id`),
  CONSTRAINT `masters_servise_ibfk_1` FOREIGN KEY (`master_id`) REFERENCES `masters` (`id`),
  CONSTRAINT `masters_servise_ibfk_2` FOREIGN KEY (`servise_id`) REFERENCES `servise` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `masters_servise`
--

LOCK TABLES `masters_servise` WRITE;
/*!40000 ALTER TABLE `masters_servise` DISABLE KEYS */;
INSERT INTO `masters_servise` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `masters_servise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registrations`
--

DROP TABLE IF EXISTS `registrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `дата_и_время_записи` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `salon_id` int DEFAULT NULL,
  `master_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `salon_id` (`salon_id`),
  KEY `master_id` (`master_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `registrations_ibfk_1` FOREIGN KEY (`salon_id`) REFERENCES `salons` (`id`),
  CONSTRAINT `registrations_ibfk_2` FOREIGN KEY (`master_id`) REFERENCES `masters` (`id`),
  CONSTRAINT `registrations_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registrations`
--

LOCK TABLES `registrations` WRITE;
/*!40000 ALTER TABLE `registrations` DISABLE KEYS */;
INSERT INTO `registrations` VALUES (1,'2023-09-25 12:00:00',1,1,1),(2,'2023-09-25 13:00:00',2,2,2);
/*!40000 ALTER TABLE `registrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registrations_servise`
--

DROP TABLE IF EXISTS `registrations_servise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registrations_servise` (
  `registration_id` int NOT NULL,
  `servise_id` int NOT NULL,
  PRIMARY KEY (`registration_id`,`servise_id`),
  KEY `servise_id` (`servise_id`),
  CONSTRAINT `registrations_servise_ibfk_1` FOREIGN KEY (`registration_id`) REFERENCES `registrations` (`id`),
  CONSTRAINT `registrations_servise_ibfk_2` FOREIGN KEY (`servise_id`) REFERENCES `servise` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registrations_servise`
--

LOCK TABLES `registrations_servise` WRITE;
/*!40000 ALTER TABLE `registrations_servise` DISABLE KEYS */;
INSERT INTO `registrations_servise` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `registrations_servise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salons`
--

DROP TABLE IF EXISTS `salons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salons` (
  `id` int NOT NULL AUTO_INCREMENT,
  `название_салона` varchar(50) NOT NULL,
  `адрес_салона` varchar(50) NOT NULL,
  `телефон_салона` varchar(15) NOT NULL,
  `график_работы_салона` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salons`
--

LOCK TABLES `salons` WRITE;
/*!40000 ALTER TABLE `salons` DISABLE KEYS */;
INSERT INTO `salons` VALUES (1,'Рога и копыта','Москва, ул. Кукушкина, д. 12','5(555)555-55-55','с 09:00 до 21:00'),(2,'Ну и рожа у тебя, Шарапов','Москва, ул. Сойкина, д. 56','4(444)444-44-44','с 12:00 до 18:00');
/*!40000 ALTER TABLE `salons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salons_servise`
--

DROP TABLE IF EXISTS `salons_servise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salons_servise` (
  `salon_id` int NOT NULL,
  `servise_id` int NOT NULL,
  PRIMARY KEY (`salon_id`,`servise_id`),
  KEY `servise_id` (`servise_id`),
  CONSTRAINT `salons_servise_ibfk_1` FOREIGN KEY (`salon_id`) REFERENCES `salons` (`id`),
  CONSTRAINT `salons_servise_ibfk_2` FOREIGN KEY (`servise_id`) REFERENCES `servise` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salons_servise`
--

LOCK TABLES `salons_servise` WRITE;
/*!40000 ALTER TABLE `salons_servise` DISABLE KEYS */;
INSERT INTO `salons_servise` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `salons_servise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salons_users`
--

DROP TABLE IF EXISTS `salons_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salons_users` (
  `salon_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`salon_id`,`user_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `salons_users_ibfk_1` FOREIGN KEY (`salon_id`) REFERENCES `salons` (`id`),
  CONSTRAINT `salons_users_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salons_users`
--

LOCK TABLES `salons_users` WRITE;
/*!40000 ALTER TABLE `salons_users` DISABLE KEYS */;
INSERT INTO `salons_users` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `salons_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servise`
--

DROP TABLE IF EXISTS `servise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servise` (
  `id` int NOT NULL AUTO_INCREMENT,
  `вид_услуги` varchar(50) NOT NULL,
  `цена_услуги` int unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servise`
--

LOCK TABLES `servise` WRITE;
/*!40000 ALTER TABLE `servise` DISABLE KEYS */;
INSERT INTO `servise` VALUES (1,'Стрижка',300),(2,'Бритье',500);
/*!40000 ALTER TABLE `servise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `фамилия_клиента` varchar(50) NOT NULL,
  `имя_клиента` varchar(50) NOT NULL,
  `телефон_клиента` varchar(15) NOT NULL,
  `дата_рождения_клиента` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Быков','Кондрат','7(777)777-77-77','1990-01-02'),(2,'Сапрыкин','Костя','6(666)666-66-66','1991-03-04');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-25 20:22:48
