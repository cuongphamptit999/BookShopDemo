-- MySQL dump 10.13  Distrib 8.0.24, for Win64 (x86_64)
--
-- Host: localhost    Database: bookshop
-- ------------------------------------------------------
-- Server version	8.0.24

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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `role` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (2,'admin','123456','ROLE_USER'),(3,'user1','123456','ROLE_USER'),(4,'user2','123456','ROLE_USER'),(5,'user10','123456','ROLE_USER'),(6,'cuongkemcoi','123456','ROLE_USER'),(7,'user6','123456','ROLE_USER');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `id` int NOT NULL AUTO_INCREMENT,
  `city` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (2,'H?? N???i'),(3,'H?? N???i'),(4,'H???i D????ng'),(5,'H???i D????ng'),(6,'H?? N???i'),(7,'H?? N???i');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(1000) NOT NULL,
  `author` varchar(1000) NOT NULL,
  `year` int NOT NULL,
  `img` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (1,'H??nh trang v??o l???p 1','T???nh L??m',2000,'product6.jpg'),(2,'Who? Chuy???n k??? v??? doanh nh??n th??? gi???i - Bill Gate','Ahn Hyungmo',2010,'product7.jpg'),(3,'C??n b???ng c???m x??c','Fiona Slater',2005,'product8.jpg'),(4,'AI - Tr?? tu??? nh??n t???o','Lasse',2009,'product1.jpg'),(5,'Who? Chuy???n k??? v??? doanh nh??n th??? gi???i - Hillary Clinton','Ahn',2010,'product2.jpg'),(6,'Nh???t k?? doanh nh??n - Leonardo Da Vinci','Vivane',2021,'product3.jpg'),(7,'Th??? t??i th??m t??? - Nh???ng v??? ??n sinh v???t','Gakken',2007,'product4.jpg'),(8,'M?????i v???n c??u h???i v?? sao - C??u h???i v???n v???t','Xia',2010,'product5.jpg');
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookitem`
--

DROP TABLE IF EXISTS `bookitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookitem` (
  `bookId` int NOT NULL,
  `price` double NOT NULL,
  `amountStock` int NOT NULL,
  PRIMARY KEY (`bookId`),
  CONSTRAINT `bookitem_ibfk_1` FOREIGN KEY (`bookId`) REFERENCES `book` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookitem`
--

LOCK TABLES `bookitem` WRITE;
/*!40000 ALTER TABLE `bookitem` DISABLE KEYS */;
INSERT INTO `bookitem` VALUES (1,120000,196),(2,130000,196),(3,100000,198),(4,200000,197),(5,310000,199),(6,400000,200),(7,120000,200),(8,270000,200);
/*!40000 ALTER TABLE `bookitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boughtbookitem`
--

DROP TABLE IF EXISTS `boughtbookitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `boughtbookitem` (
  `id` int NOT NULL AUTO_INCREMENT,
  `amount` varchar(45) NOT NULL,
  `cartId` int NOT NULL,
  `bookItemId` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cartId` (`cartId`),
  KEY `bookItemId` (`bookItemId`),
  CONSTRAINT `boughtbookitem_ibfk_1` FOREIGN KEY (`cartId`) REFERENCES `cart` (`id`),
  CONSTRAINT `boughtbookitem_ibfk_2` FOREIGN KEY (`bookItemId`) REFERENCES `bookitem` (`bookId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boughtbookitem`
--

LOCK TABLES `boughtbookitem` WRITE;
/*!40000 ALTER TABLE `boughtbookitem` DISABLE KEYS */;
INSERT INTO `boughtbookitem` VALUES (3,'1',53,1),(4,'1',53,2),(5,'1',53,3),(6,'1',54,5),(7,'2',54,4);
/*!40000 ALTER TABLE `boughtbookitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dateCreate` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (53,'2021-09-08'),(54,'2021-09-08');
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fullName` varchar(100) NOT NULL,
  `mobile` varchar(100) NOT NULL,
  `addressId` int NOT NULL,
  `accountId` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `addressId` (`addressId`),
  KEY `accountId` (`accountId`),
  CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`addressId`) REFERENCES `address` (`id`),
  CONSTRAINT `customer_ibfk_2` FOREIGN KEY (`accountId`) REFERENCES `account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'C?????ng Ph???m','0123456789',2,2),(2,'Thu H??','0123456789',3,3),(3,'L?? H??ng','01234567891',4,4),(4,'Nguy??n Trung','0123456789',5,5),(5,'C?????ng Ph???m','0123456789',6,6),(6,'C?????ng Ph???m','0123456789',7,7);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customerId` int NOT NULL,
  `paymentId` int NOT NULL,
  `cartId` int NOT NULL,
  `shipmentId` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `paymentId` (`paymentId`),
  KEY `customerId` (`customerId`),
  KEY `cartId` (`cartId`),
  KEY `shipmentId` (`shipmentId`),
  CONSTRAINT `order_ibfk_2` FOREIGN KEY (`paymentId`) REFERENCES `payment` (`id`),
  CONSTRAINT `order_ibfk_3` FOREIGN KEY (`customerId`) REFERENCES `customer` (`id`),
  CONSTRAINT `order_ibfk_4` FOREIGN KEY (`cartId`) REFERENCES `cart` (`id`),
  CONSTRAINT `order_ibfk_5` FOREIGN KEY (`shipmentId`) REFERENCES `shipment` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (12,1,17,53,2),(13,1,18,54,2);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `paymentType` varchar(1000) NOT NULL,
  `allMoney` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (17,'Thanh to??n\r\n										tr???c ti???p khi nh???n h??ng',400000),(18,'Thanh to??n\r\n										tr???c ti???p khi nh???n h??ng',760000);
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipment`
--

DROP TABLE IF EXISTS `shipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shipment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipment`
--

LOCK TABLES `shipment` WRITE;
/*!40000 ALTER TABLE `shipment` DISABLE KEYS */;
INSERT INTO `shipment` VALUES (1,'V???n chuy???n nhanh','H?? N???i',100000),(2,'V???n chuy???n th?????ng','H?? N???i',50000);
/*!40000 ALTER TABLE `shipment` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-08 20:10:16
