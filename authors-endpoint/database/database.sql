-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: seleniumdb
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authors` (
  `id` int NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
INSERT INTO `authors` VALUES (1,'Lorelai Gilmore','lorelai@example.com','1970-04-05'),(2,'Rory Gilmore','rory@example.com','1984-10-08'),(3,'Luke Danes','luke@example.com','1966-11-21'),(4,'Emily Gilmore','emily@example.com','1944-02-12'),(5,'Richard Gilmore','richard@example.com','1937-09-02'),(6,'Lane Kim','lane@example.com','1981-12-29'),(7,'Paris Geller','paris@example.com','1983-06-19'),(8,'Jess Mariano','jess@example.com','1981-07-15'),(9,'Dean Forester','dean@example.com','1980-03-14'),(10,'Sookie St. James','sookie@example.com','1973-05-27'),(11,'Christopher Hayden','chris@example.com','1968-08-17'),(12,'Liz Danes','liz@example.com','1968-05-03'),(13,'Michel Gerard','michel@example.com','1971-11-15'),(14,'Taylor Doose','taylor@example.com','1950-01-30'),(15,'Kirk Gleason','kirk@example.com','1974-09-27');
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `id` int NOT NULL,
  `author_id` int DEFAULT NULL,
  `isbn` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (1,1,'978-1234567890'),(2,2,'978-2345678901'),(3,3,'978-3456789012'),(4,4,'978-4567890123'),(5,5,'978-5678901234'),(6,6,'978-6789012345'),(7,7,'978-7890123456'),(8,8,'978-8901234567'),(9,9,'978-9012345678'),(10,10,'978-0123456789'),(11,11,'978-1122334455'),(12,12,'978-2233445566'),(13,13,'978-3344556677'),(14,14,'978-4455667788'),(15,15,'978-5566778899'),(16,1,'978-1234567800'),(17,2,'978-2345678911'),(18,3,'978-3456789022'),(19,4,'978-4567890133'),(20,5,'978-5678901244'),(21,6,'978-6789012355'),(22,7,'978-7890123466'),(23,8,'978-8901234577'),(24,9,'978-9012345688'),(25,10,'978-0123456799'),(26,11,'978-1122334466'),(27,12,'978-2233445577'),(28,13,'978-3344556688'),(29,14,'978-4455667799'),(30,15,'978-5566778800'),(31,1,'978-1234567811'),(32,2,'978-2345678922'),(33,3,'978-3456789033'),(34,4,'978-4567890144'),(35,5,'978-5678901255');
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logincredentials`
--

DROP TABLE IF EXISTS `logincredentials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logincredentials` (
  `username` varchar(30) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logincredentials`
--

LOCK TABLES `logincredentials` WRITE;
/*!40000 ALTER TABLE `logincredentials` DISABLE KEYS */;
INSERT INTO `logincredentials` VALUES ('subhashyarram2@gmail.com','12345'),('sus@gmail.com','12345'),('hari@gmail.com','12345'),('ramu@gmail.com','12345');
/*!40000 ALTER TABLE `logincredentials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale_items`
--

DROP TABLE IF EXISTS `sale_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sale_items` (
  `id` int NOT NULL,
  `book_id` int DEFAULT NULL,
  `customer_name` varchar(20) DEFAULT NULL,
  `item_price` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale_items`
--

LOCK TABLES `sale_items` WRITE;
/*!40000 ALTER TABLE `sale_items` DISABLE KEYS */;
INSERT INTO `sale_items` VALUES (1,1,'Alice',20,1),(2,2,'Bob',25,2),(3,3,'Charlie',30,1),(4,4,'David',15,3),(5,5,'Emma',40,1),(6,6,'Frank',35,2),(7,7,'Grace',20,1),(8,8,'Hannah',25,3),(9,9,'Ian',30,1),(10,10,'Julia',15,2),(11,11,'Kevin',40,1),(12,12,'Linda',35,2),(13,13,'Mike',20,1),(14,14,'Nancy',25,3),(15,15,'Oscar',30,1),(16,16,'Paula',15,2),(17,17,'Quincy',40,1),(18,18,'Rachel',35,2),(19,19,'Steve',20,1),(20,20,'Tina',25,3),(21,21,'Ursula',30,1),(22,22,'Victor',15,2),(23,23,'Wendy',40,1),(24,24,'Xavier',35,2),(25,25,'Yara',20,1),(26,26,'Zane',25,3),(27,27,'Amy',30,1),(28,28,'Ben',15,2),(29,29,'Cara',40,1),(30,30,'Dylan',35,2),(31,31,'Ella',20,1),(32,32,'Felix',25,3),(33,33,'Gina',30,1),(34,34,'Henry',15,2),(35,35,'Ivy',40,1),(36,1,'Jack',35,2),(37,2,'Karen',20,1),(38,3,'Leo',25,3),(39,4,'Mia',30,1),(40,5,'Noah',15,2);
/*!40000 ALTER TABLE `sale_items` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-13 23:26:26
