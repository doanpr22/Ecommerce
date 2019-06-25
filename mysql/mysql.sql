-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: localhost    Database: e_commerce1
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CategoryName` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'iPhone','iphone đẳng cấp của thương hiệu'),(2,'Samsung',NULL),(3,'OPPO','Chuyên gia sefi'),(11,'Nokia',NULL),(12,'Xiaomi',NULL),(13,'Vsmart',NULL),(14,'HuaWei',NULL),(15,'Vivo',NULL);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creditcard`
--

DROP TABLE IF EXISTS `creditcard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `creditcard` (
  `id` int(11) NOT NULL,
  `amount` decimal(10,0) NOT NULL,
  `password` varchar(45) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `PIN` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creditcard`
--

LOCK TABLES `creditcard` WRITE;
/*!40000 ALTER TABLE `creditcard` DISABLE KEYS */;
INSERT INTO `creditcard` VALUES (1,100000000,'123456','thanh','123456');
/*!40000 ALTER TABLE `creditcard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderdestails`
--

DROP TABLE IF EXISTS `orderdestails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `orderdestails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderId` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product` (`productId`),
  KEY `FKafsgqp5a69rusqjuis58csxgn_idx` (`orderId`),
  CONSTRAINT `FKafsgqp5a69rusqjuis58csxgn` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`),
  CONSTRAINT `FKnp6qqe4tur5feu0xp3k14dr5b` FOREIGN KEY (`productId`) REFERENCES `product` (`id`),
  CONSTRAINT `fk-order` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`),
  CONSTRAINT `fk_product` FOREIGN KEY (`productId`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdestails`
--

LOCK TABLES `orderdestails` WRITE;
/*!40000 ALTER TABLE `orderdestails` DISABLE KEYS */;
INSERT INTO `orderdestails` VALUES (1,53,56,1),(2,57,56,1),(3,58,32,1),(4,59,32,1),(5,60,56,1),(6,61,56,1),(7,62,42,1),(8,63,29,1),(9,64,32,1),(10,65,49,1),(11,66,56,1),(12,67,32,1),(13,68,32,1),(14,69,46,1),(15,70,32,1),(16,71,32,1),(17,72,32,1),(18,73,56,1),(22,76,49,1),(23,76,46,1),(25,78,56,1),(27,80,56,1),(29,82,58,1),(30,83,56,1),(31,84,56,2),(32,85,58,1),(35,86,48,1),(36,87,40,1),(38,89,56,1);
/*!40000 ALTER TABLE `orderdestails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `orderDate` date DEFAULT NULL,
  `shipDate` date DEFAULT NULL,
  `paymentTypeId` int(11) DEFAULT NULL,
  `customerName` varchar(45) DEFAULT NULL,
  `customerEmail` varchar(45) DEFAULT NULL,
  `customerPhone` varchar(45) DEFAULT NULL,
  `creditcardId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk-User_idx` (`userId`),
  KEY `fk_paymenttype_idx` (`paymentTypeId`),
  KEY `card_idx` (`creditcardId`),
  CONSTRAINT `FK7px9c0h2waq4jgfwm4uiegcqi` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  CONSTRAINT `FKe3n3xis9vckv2r8g14ktl7qo3` FOREIGN KEY (`creditcardId`) REFERENCES `creditcard` (`id`),
  CONSTRAINT `FKhmhwcro817sm58d9hnab3clye` FOREIGN KEY (`creditcardId`) REFERENCES `creditcard` (`id`),
  CONSTRAINT `FKm4g6tsd67mnlj922ygfgs6x4t` FOREIGN KEY (`paymentTypeId`) REFERENCES `paymenttype` (`id`),
  CONSTRAINT `card` FOREIGN KEY (`creditcardId`) REFERENCES `creditcard` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (48,3,'2019-06-19',NULL,NULL,NULL,NULL,NULL,NULL),(49,NULL,'2019-06-19',NULL,NULL,'Trần Trần','bathanh@gmailx.om','0832383219',NULL),(50,NULL,'2019-06-19',NULL,NULL,'Trần Trần','bathanh@gmailx.om','0832383219',NULL),(51,NULL,'2019-06-19',NULL,NULL,'Trần Trần','bathanh@gmail.com','0832383219',NULL),(52,NULL,'2019-06-19',NULL,NULL,'Trần Thanh','bathanh@gmailx.om','0832383219',NULL),(53,NULL,'2019-06-19',NULL,NULL,'Trần Bá Thanh','bathanh@gmail.com','0832383219',NULL),(54,NULL,'2019-06-19',NULL,NULL,'Trần Thanh','bathanh@gmailx.om','0832383219',NULL),(55,NULL,'2019-06-19',NULL,NULL,'Trần Thanh','bathanh@gmailx.om','0832383219',NULL),(56,NULL,'2019-06-19',NULL,NULL,'Trần thsb','bathanh@gmail.com','3434343',NULL),(57,NULL,'2019-06-19',NULL,NULL,'Trần Thanh','bathanh@gmail.com','3434343',NULL),(58,NULL,'2019-06-19',NULL,NULL,'Trần Bá Thanh','bathanh@gmailx.om','0832383219',NULL),(59,NULL,'2019-06-19',NULL,NULL,'Trần ','','',NULL),(60,NULL,'2019-06-19',NULL,NULL,'Đoàn Cường','3434343434','34343434',NULL),(61,NULL,'2019-06-19',NULL,NULL,'Đoàn Cường','bathanh@gmailx.om','0832383219',NULL),(62,NULL,'2019-06-19',NULL,NULL,'Trần Cường','bathanh@gmail.com','34343434',NULL),(63,NULL,'2019-06-19',NULL,NULL,'Đoàn Cường','bathanh@gmail.com','0832383219',NULL),(64,NULL,'2019-06-19',NULL,NULL,'Trần Bá Thanh','bathanh@gmailx.om','0832383219',NULL),(65,NULL,'2019-06-19',NULL,NULL,'Trần Bá Thanh','bathanh@gmailx.om','0832383219',NULL),(66,NULL,'2019-06-19',NULL,NULL,'Trần Bá Thanh','bathanh@gmailx.om','0832383219',NULL),(67,NULL,'2019-06-19',NULL,NULL,'Trần Bá ','','',NULL),(68,NULL,'2019-06-19',NULL,NULL,'Trần Bá Cường','bathanh@gmailx.om','0832383219',NULL),(69,NULL,'2019-06-19',NULL,NULL,'Trần Bá ','','',NULL),(70,NULL,'2019-06-19',NULL,NULL,'Đoàn ','','',NULL),(71,NULL,'2019-06-19',NULL,NULL,'Đoàn Thanh','','',NULL),(72,NULL,'2019-06-19',NULL,NULL,'Trần Bá Thanh','','',NULL),(73,NULL,'2019-06-19',NULL,NULL,'Ok rồi bạn ơi ','','',NULL),(74,3,'2019-06-19',NULL,NULL,NULL,NULL,NULL,NULL),(75,3,'2019-06-19',NULL,NULL,NULL,NULL,NULL,NULL),(76,10,'2019-06-19',NULL,1,NULL,NULL,NULL,NULL),(77,3,'2019-06-19',NULL,NULL,NULL,NULL,NULL,NULL),(78,3,'2019-06-19',NULL,NULL,NULL,NULL,NULL,NULL),(79,3,'2019-06-19',NULL,NULL,NULL,NULL,NULL,NULL),(80,14,'2019-06-19',NULL,2,NULL,NULL,NULL,NULL),(81,3,'2019-06-19',NULL,NULL,NULL,NULL,NULL,NULL),(82,NULL,'2019-06-19',NULL,NULL,'Trần Bá Thanh','bathanh@gmailx.om','0832383219',NULL),(83,NULL,'2019-06-19',NULL,NULL,'Trần Cường','bathanh@gmail.com','0832383219',NULL),(84,45,'2019-06-19',NULL,NULL,NULL,NULL,NULL,NULL),(85,45,'2019-06-19',NULL,NULL,NULL,NULL,NULL,NULL),(86,45,'2019-06-19',NULL,NULL,NULL,NULL,NULL,NULL),(87,NULL,'2019-06-19',NULL,NULL,'Trần Bá ','','',NULL),(88,3,'2019-06-19',NULL,NULL,NULL,NULL,NULL,NULL),(89,3,'2019-06-19',NULL,NULL,NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paymenttype`
--

DROP TABLE IF EXISTS `paymenttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `paymenttype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paymentType` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paymenttype`
--

LOCK TABLES `paymenttype` WRITE;
/*!40000 ALTER TABLE `paymenttype` DISABLE KEYS */;
INSERT INTO `paymenttype` VALUES (1,'Chuyển khoản'),(2,'Trực tiếp'),(3,'Trả góp');
/*!40000 ALTER TABLE `paymenttype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producers`
--

DROP TABLE IF EXISTS `producers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `producers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ProducerName` varchar(255) DEFAULT NULL,
  `ProducerAddress` varchar(255) DEFAULT NULL,
  `ProducerEmail` varchar(50) DEFAULT NULL,
  `ProducerPhone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producers`
--

LOCK TABLES `producers` WRITE;
/*!40000 ALTER TABLE `producers` DISABLE KEYS */;
INSERT INTO `producers` VALUES (1,'FPT','91 Quang Trung','abc@Gmail.com','098594848'),(2,'IViettech',NULL,NULL,NULL);
/*!40000 ALTER TABLE `producers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ProductName` varchar(255) DEFAULT NULL,
  `CategoryId` int(11) DEFAULT NULL,
  `UnitPrice` double DEFAULT NULL,
  `UrlImage` varchar(255) DEFAULT NULL,
  `Producerid` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK42iy97xlo64j31dslbn36vmyh` (`CategoryId`),
  KEY `FKcalbkaiophoms02n6aidvl54u` (`Producerid`),
  CONSTRAINT `FK42iy97xlo64j31dslbn36vmyh` FOREIGN KEY (`CategoryId`) REFERENCES `category` (`id`),
  CONSTRAINT `FKcalbkaiophoms02n6aidvl54u` FOREIGN KEY (`Producerid`) REFERENCES `producers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (26,'Samsung Galaxy S10+',2,16890000,'/image\\FPT\\Samsung\\Samsung Galaxy S10+\\1TB\\12 GB\\đen\\636863636051023338_ss-galaxy-s10-plus-den-1.jfif',1,'Nâng tầm nhiếp ảnh ở cả camera trước và sau; hệ điều hành Android 9 Pie mới nhất cùng hiệu năng mạnh mẽ, Nokia 8.1 đáp ứng mọi sự kỳ vọng của người dùng.'),(28,'Oppo Reno 10x Zoom',3,2099000,'/image\\FPT\\OPPO\\Oppo Reno 10x Zoom\\256 GB\\8 GB\\den\\636955294219361298_oppo-reno-10x-zoom-den-1.png',1,'Với OPPO Reno 10x Zoom, bạn có thể quan sát thế giới từ một góc nhìn hoàn toàn mới với công nghệ camera \"siêu đỉnh\".'),(29,'iPhone 7',1,13990000,'/image\\FPT\\iPhone\\iPhone 7\\32 GB\\3 GB\\vang\\636836628988322696_ip7-plus-vang-1.jfif',1,'iPhone 7 lÃ  cháº¥t'),(31,'Oppo Reno 10x Zoom',3,2099000,'/image\\FPT\\OPPO\\Oppo Reno 10x Zoom\\256 GB\\8 GB\\den\\636955294219361298_oppo-reno-10x-zoom-den-1.png',1,' Điện thoại 3 camera đầu tiên của Samsung đã xuất hiện, Galaxy A7 2018 mang đến cảm hứng bất tận cho người dùng khi nhiếp ảnh với những điều trên cả mong đợi.'),(32,'iPhone X',1,23900000,'/image\\FPT\\iPhone\\iPhone X\\64 GB\\4 GB\\đỏ\\636748771945393060_iPhone-Xs-Max-gold-1.jfif',1,'iPhone Xs Max 64GB là chiếc iPhone có màn hình lớn nhất từ trước đến nay, mang đến những trải nghiệm tuyệt vời về màn hình và thời lượng pin.'),(38,'OPPO F11',3,7999000,'/image\\FPT\\OPPO\\OPPO F11\\64 GB\\6 GB\\Xanh\\636888737679482202_oppo-f11-xanh-1.jfif',1,'Với chiếc điện thoại F11, OPPO cho thấy sự thấu hiểu khách hàng đến mức tối đa khi họ mang tới cho sản phẩm này những công nghệ và tính năng vượt trội hoàn toàn so với mức giá bán ra'),(40,'iPhone 8 Plus',1,17990000,'/image\\IViettech\\iPhone\\iPhone 8 Plus\\64 GB\\4 GB\\vang\\636459060591822074_1.jpg',2,'Apple bất ngờ ra mắt bộ đôi iPhone 8 và iPhone 8 Plus tạo ra cơn bão mới càn quét hết các bảng xếp hạng siêu phẩm. Như thường lệ, iPhone 8 Plus từ thiết kế cho tới tính năng đều mang đến cho người dùng những trải nghiệm thú vị tuyệt vời không thể bỏ lỡ.'),(42,'Samsung Galaxy S10+',2,23990000,'/image\\FPT\\Samsung\\Samsung Galaxy S10+\\1TB\\12 GB\\đen\\636863636051023338_ss-galaxy-s10-plus-den-1.jfif',1,' Samsung S10+ 1TB không chỉ là bản có cấu hình siêu “khủng” với 1TB bộ nhớ trong, 12GB RAM, mà đây còn là một tác phẩm nghệ thuật đích thực với thiết kế bằng gốm Ceramic đặc biệt.'),(43,'Nokia 6.1 Plus',11,4490000,'/image\\IViettech\\Nokia\\Nokia 6.1 Plus\\64 GB\\4 GB\\Đen\\636737264632784078_nokia6Plus-den-1.jpg',2,'Nokia 6.1 Plus sẽ kể nên những câu chuyện trong cuộc sống của bạn với camera kép AI tuyệt vời, vi xử lý Snapdragon 636 mạnh mẽ và màn hình tràn viền kiểu mới.'),(46,'Xiaomi Mi 9',12,7290000,'/image\\IViettech\\Xiaomi\\Xiaomi Mi 9\\64 GB\\6 GB\\Xanh\\636928415238970301_xiaomi-mi-9-xanh-1.jfif',2,'Nâng tầm nhiếp ảnh ở cả camera trước và sau; hệ điều hành Android 9 Pie mới nhất cùng hiệu năng mạnh mẽ, Nokia 8.1 đáp ứng mọi sự kỳ vọng của người dùng.'),(48,'Xiaomi Mi 8',12,5990000,'/image\\IViettech\\Xiaomi\\Xiaomi Mi 8\\64 GB\\4 GB\\đen\\636821310626759278_xiaomi-mi8-lite-64g-den-1.jfif',2,'Một siêu phẩm với thiết kế nổi bật, camera xuất sắc và cấu hình vô cùng mạnh mẽ, Xiaomi Mi 8 Lite là chiếc điện thoại mang trên mình tất cả những gì bạn cần.'),(49,'Samsung Galaxy A50',2,6990000,'/image\\IViettech\\Samsung\\Samsung Galaxy A50\\64 GB\\4 GB\\Đen\\636880892473841431_ss-galaxy-a50-den-1.jfif',2,'Tận hưởng tất cả những công nghệ mới nhất trong tầm giá hấp dẫn, Samsung Galaxy A50 sở hữu cảm biến vân tay trong màn hình, 3 camera và nhiều hơn thế nữa.'),(53,'Vsmart Active 1+',13,5790000,'/image\\FPT\\Vsmart\\Vsmart Active 1+\\64 GB\\6 GB\\Hồng\\636801168764977606_vsmart-active1-plus-hong-1.jfif',1,' Vsmart Active 1+ là smartphone cao cấp nhất trong bộ tứ sản phẩm được tập đoàn Vingroup công bố ra ngoài thị trường. Điện thoại có được thiết kế hiện đại, hiệu năng mạnh, camera kép và giá bán phải chăng.'),(56,'Huawei P30 Pro',14,22990000,'/image\\FPT\\HuaWei\\Huawei P30 Pro\\64 GB\\4 GB\\Xanh\\636899683181639311_huawei-p30-pro-xanh-cuc-quang-1.jfif',1,' Với Huawei P30 Pro, hãng cho thấy tầm nhìn rộng lớn của hãng khi mang loạt tính năng của tương lai cùng với những công nghệ chụp ảnh hiện đại nhất gói gọn vào chiếc điện thoại sang trọng này.'),(57,'Vivo V15',15,5990000,'/image\\FPT\\Vivo\\Vivo V15\\64 GB\\8 GB\\Đỏ\\636912701650897923_vivo-v15-do-qh-1.jfif',1,'Chiếc điện thoại màn hình tràn viền hoàn hảo với camera “tàng hình” độc đáo, Vivo V15 phá vỡ mọi giới hạn để mang đến cho bạn trải nghiệm tuyệt vời nhất.'),(58,'iPhone XR',1,19990000,'/image\\FPT\\iPhone\\iPhone XR\\64 GB\\8 GB\\đen\\636748797174925889_iphone-Xr-den1.jfif',1,'Chiếc iPhone với màn hình Liquid Retina hoàn toàn mới, công nghệ màn hình LCD tiên tiến nhất đi cùng Face ID nhanh hơn, con chip mạnh mẽ và hệ thống camera xóa phông hoàn hảo. '),(59,'iPhone 6s Plus',1,9980000,'/image\\FPT\\iPhone\\iPhone 6s Plus\\64 GB\\2 GB\\Vàng\\636172339622394948_apple-Iphone-6s-gold-1.jpg',1,'Apple iPhone 6s Plus là chiếc iPhone màn hình lớn nhất, cho phép người dùng làm được nhiều việc hơn trên không gian rộng lớn.'),(60,'OPPO F11',2,9680000,'/image\\IViettech\\Samsung\\OPPO F11\\1TB\\4 GB\\do\\636737264632784078_nokia6Plus-den-1.jpg',2,'Với chiếc điện thoại F11, OPPO cho thấy sự thấu hiểu khách hàng đến mức tối đa khi họ mang tới cho sản phẩm này những công nghệ và tính năng vượt trội hoàn toàn so với mức giá bán ra');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productdestails`
--

DROP TABLE IF EXISTS `productdestails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `productdestails` (
  `id` int(11) NOT NULL,
  `manhinh` varchar(50) DEFAULT NULL,
  `mau` varchar(20) DEFAULT NULL,
  `cameratruoc` varchar(50) DEFAULT NULL,
  `camerasau` varchar(50) DEFAULT NULL,
  `ram` varchar(50) DEFAULT NULL,
  `bonhotrong` varchar(50) DEFAULT NULL,
  `khecamsim` int(11) DEFAULT NULL,
  `hedieuhanh` varchar(50) DEFAULT NULL,
  `baohanh` varchar(20) DEFAULT NULL,
  `dophangiai` varchar(45) DEFAULT NULL,
  `CPU` varchar(255) DEFAULT NULL,
  `kichthuoc` varchar(255) DEFAULT NULL,
  `trongluong` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_product22` FOREIGN KEY (`id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productdestails`
--

LOCK TABLES `productdestails` WRITE;
/*!40000 ALTER TABLE `productdestails` DISABLE KEYS */;
INSERT INTO `productdestails` VALUES (26,'6.4 inches','đen','Chính 10 MP & Phụ 8 MP','Chính 12 MP & Phụ 12 MP, 16 MP','12 GB','1TB',2,'Android 9.0 (Pie)','12 ThÃ¡ng','1440 x 3040 pixels','Exynos 9820 8 nhân 64-bit, 8, 2 nhân 2.7 GHz, 2 nhân 2.3 GHz và 4 nhân 1.9 GHz','DÃ i 157.6 mm - Ngang 74.1 mm - DÃ y 7.8 mm','175 g'),(29,'6.4 inches','vang','7.0 MP','Dual 12.0 MP','3 GB','32 GB',1,'iOS 11','12','1920 x 1080 pixels','A10, 4 NhÃ¢n, 2.3 GHz','158.2 x 77.9 x 7.3 mm','188 g'),(31,'6.6 inches','den','16.0 MP','48 MP,13 MP +8 MP ( 3 camera )','8 GB','256 GB',2,'Android 9','12 Thang','1080 x 2340 Pixels','QualcommÃÂ® SnapdragonTM 855, 8, 2.8 GHz','162.0 x 77.2 x 9.3 mm','215g '),(32,'6.4 inches','đỏ','7.0 MP','Dual 12.0 MP','4 GB','64 GB',1,'iOS 11','12 Tháng','1920 x 1080 pixels','Apple A11 Bionic, 6','Dài 158.1 mm - Ngang 73.8 mm - 8.5 mm','215g '),(38,'6.4 inches','Xanh','16.0 MP','12.0 MP','6 GB','64 GB',2,'Android 9','12 Tháng','1080 x 2340 Pixels','A10, 4 Nhân, 2.3 GHz','Dài 158.1 mm - Ngang 73.8 mm - 8.5 mm','148 g'),(40,'6.4 inches','vang','7.0 MP','Dual 12.0 MP','4 GB','64 GB',1,'iOS 11','12 Tháng','1920 x 1080 pixels','Apple A11 Bionic, 6','158.4 x 78.1 x 7.5 mm','202 g'),(42,'6.4 inches','đen','16.0 MP','48 MP+ 5 MP','12 GB','1TB',2,'Android 9.0 (Pie)','12 Tháng','1440 x 3040 pixels','Exynos 9820 8 nhân 64-bit, 8, 2 nhân 2.7 GHz, 2 nhân 2.3 GHz và 4 nhân 1.9 GHz','138.4 x 67.3 x 7.3 mm','175 g'),(43,'5.8\"','Đen','7.0 MP','48 MP+ 5 MP','4 GB','64 GB',2,'Android 8.1 (Oreo)','12 Tháng','1080 x 2280 ','Qualcom Snapdragon 636, 8 nhân, 1.8 GHz','Dài 158.1 mm - Ngang 73.8 mm - 8.5 mm','215g '),(46,'6.4 inches','Xanh','16.0 MP','Dual 12.0 MP','6 GB','64 GB',2,'Android 9.0 (Pie)','12 Tháng','1920 x 1080 pixels','Exynos 9820 8 nhân 64-bit, 8, 2 nhân 2.7 GHz, 2 nhân 2.3 GHz và 4 nhân 1.9 GHz','Dài 158.1 mm - Ngang 73.8 mm - 8.5 mm','202 g'),(48,'6.4 inches','đen','7.0 MP','12.0 MP','4 GB','64 GB',2,'Android 9','12 Tháng','1080 x 2340 Pixels','Qualcomm® SnapdragonTM 855, 8, 2.8 GHz','Dài 157.6 mm - Ngang 74.1 mm - Dày 7.8 mm','189 g'),(49,'6.4 inches','Đen','7.0 MP','Dual 12.0 MP','4 GB','64 GB',2,'Android 9.0 (Pie)','12 Tháng','1920 x 1080 pixels','Qualcomm® SnapdragonTM 855, 8, 2.8 GHz','Dài 157.6 mm - Ngang 74.1 mm - Dày 7.8 mm','202 g'),(53,'6.4 inches','Hồng','Chính 10 MP & Phụ 8 MP','12.0 MP','6 GB','64 GB',2,'Android 9','12 Tháng','1334 x 750 pixels','Qualcomm® SnapdragonTM 855, 8, 2.8 GHz','162.0 x 77.2 x 9.3 mm','215g '),(56,'6.6 inches','Xanh','7.0 MP','Dual 12.0 MP','4 GB','64 GB',2,'Android 9','12 Tháng','1920 x 1080 pixels','Qualcomm® SnapdragonTM 855, 8, 2.8 GHz','138.4 x 67.3 x 7.3 mm','148 g'),(57,'6.9 inches','Đỏ','7.0 MP','48 MP+ 5 MP','8 GB','64 GB',2,'Android 9','12 Tháng','1080 x 2340 Pixels','Exynos 9820 8 nhân 64-bit, 8, 2 nhân 2.7 GHz, 2 nhân 2.3 GHz và 4 nhân 1.9 GHz','138.4 x 67.3 x 7.3 mm','202 g'),(58,'6.6 inches','đen','7.0 MP','12.0 MP','8 GB','64 GB',1,'iOS 11','12 Tháng','1920 x 1080 pixels','A10, 4 Nhân, 2.3 GHz','Dài 158.1 mm - Ngang 73.8 mm - 8.5 mm','175 g'),(59,'','Vàng','5 MP','12.0 MP','2 GB','64 GB',1,'iOS 11','12 Tháng','	1080 x 1920 pixels','Apple A9, 2 Nhân, 1.8 GHz','138.4 x 67.3 x 7.3 mm','148 g'),(60,'6.4 inches','Đỏ','7.0 MP','12','4 GB','1TB',2,'Android 9','12 Tháng','1920 x 1080 pixels','Exynos 9820 8 nhân 64-bit, 8, 2 nhân 2.7 GHz, 2 nhân 2.3 GHz và 4 nhân 1.9 GHz','158.4 x 78.1 x 7.5 mm','148 g');
/*!40000 ALTER TABLE `productdestails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productimage`
--

DROP TABLE IF EXISTS `productimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `productimage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productId` int(11) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKdda87k8xxycvtir8e6co3lnse` (`productId`),
  CONSTRAINT `FKdda87k8xxycvtir8e6co3lnse` FOREIGN KEY (`productId`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productimage`
--

LOCK TABLES `productimage` WRITE;
/*!40000 ALTER TABLE `productimage` DISABLE KEYS */;
INSERT INTO `productimage` VALUES (38,26,'/image\\FPT\\Samsung\\Samsung Galaxy S10+\\1TB\\12 GB\\den\\636863636050913338_ss-galaxy-s10-plus-den-2.png'),(39,26,'/image\\FPT\\Samsung\\Samsung Galaxy S10+\\1TB\\12 GB\\den\\636863636050673338_ss-galaxy-s10-plus-den-3.png'),(40,26,'/image\\FPT\\Samsung\\Samsung Galaxy S10+\\1TB\\12 GB\\den\\636863637628103338_ss-galaxy-s10-plus-den-4.png'),(47,29,'/image\\FPT\\iPhone\\iPhone 7\\32 GB\\3 GB\\vang\\636836628988166719_ip7-plus-vang-2.png'),(48,29,'/image\\FPT\\iPhone\\iPhone 7\\32 GB\\3 GB\\vang\\636836628988478673_ip7-plus-vang-3.png'),(49,29,'/image\\FPT\\iPhone\\iPhone 7\\32 GB\\3 GB\\vang\\636836628988166719_ip7-plus-vang-4.png'),(53,31,'/image\\FPT\\OPPO\\Oppo Reno 10x Zoom\\256 GB\\8 GB\\den\\636955294219205312_oppo-reno-10x-zoom-den-2.png'),(54,31,'/image\\FPT\\OPPO\\Oppo Reno 10x Zoom\\256 GB\\8 GB\\den\\636955294222013060_oppo-reno-10x-zoom-den-3.png'),(55,31,'/image\\FPT\\OPPO\\Oppo Reno 10x Zoom\\256 GB\\8 GB\\den\\636955294218581368_oppo-reno-10x-zoom-den-4.png'),(62,32,'/image\\FPT\\iPhone\\iPhone X\\64 GB\\4 GB\\đỏ\\636767481293463872_iphone-xs-gold-2.png'),(63,32,'/image\\FPT\\iPhone\\iPhone X\\64 GB\\4 GB\\đỏ\\636767481293188883_iphone-xs-gold-3.png'),(64,32,'/image\\FPT\\iPhone\\iPhone X\\64 GB\\4 GB\\đỏ\\636767481289803972_iphone-xs-gold-4.jfif'),(65,38,'/image\\FPT\\OPPO\\OPPO F11\\64 GB\\6 GB\\Xanh\\636888737676472202_oppo-f11-xanh-2.png'),(66,38,'/image\\FPT\\OPPO\\OPPO F11\\64 GB\\6 GB\\Xanh\\636888737679032202_oppo-f11-xanh-3.png'),(67,38,'/image\\FPT\\OPPO\\OPPO F11\\64 GB\\6 GB\\Xanh\\636888737675334238_oppo-f11-xanh-5.png'),(74,40,'/image\\IViettech\\iPhone\\iPhone 8 Plus\\64 GB\\4 GB\\vang\\636459060731746898_2.jpg'),(75,40,'/image\\IViettech\\iPhone\\iPhone 8 Plus\\64 GB\\4 GB\\vang\\636459060877911402_3.jpg'),(76,40,'/image\\IViettech\\iPhone\\iPhone 8 Plus\\64 GB\\4 GB\\vang\\636459060877911402_4.jpg'),(80,42,'/image\\FPT\\Samsung\\Samsung Galaxy S10+\\1TB\\12 GB\\đen\\636863636050913338_ss-galaxy-s10-plus-den-2.png'),(81,42,'/image\\FPT\\Samsung\\Samsung Galaxy S10+\\1TB\\12 GB\\đen\\636863636050673338_ss-galaxy-s10-plus-den-3.png'),(82,42,'/image\\FPT\\Samsung\\Samsung Galaxy S10+\\1TB\\12 GB\\đen\\636863637628103338_ss-galaxy-s10-plus-den-4.png'),(86,43,'/image\\IViettech\\Nokia\\Nokia 6.1 Plus\\64 GB\\4 GB\\Đen\\636737264632644092_nokia6Plus-den-3.jpg'),(87,43,'/image\\IViettech\\Nokia\\Nokia 6.1 Plus\\64 GB\\4 GB\\Đen\\636737264632654091_nokia6Plus-den-4.jpg'),(88,43,'/image\\IViettech\\Nokia\\Nokia 6.1 Plus\\64 GB\\4 GB\\Đen\\636737264632594097_nokia6Plus-den-5.jpg'),(98,26,'/image\\FPT\\Samsung\\Samsung Galaxy S10+\\1TB\\12 GB\\đen\\636863636050913338_ss-galaxy-s10-plus-den-2.png'),(99,26,'/image\\FPT\\Samsung\\Samsung Galaxy S10+\\1TB\\12 GB\\đen\\636863636050673338_ss-galaxy-s10-plus-den-3.png'),(100,26,'/image\\FPT\\Samsung\\Samsung Galaxy S10+\\1TB\\12 GB\\đen\\636863637628103338_ss-galaxy-s10-plus-den-4.png'),(101,46,'/image\\IViettech\\Xiaomi\\Xiaomi Mi 9\\64 GB\\6 GB\\Xanh\\636928415238930301_xiaomi-mi-9-xanh-2.png'),(102,46,'/image\\IViettech\\Xiaomi\\Xiaomi Mi 9\\64 GB\\6 GB\\Xanh\\636928415238450301_xiaomi-mi-9-xanh-3.png'),(103,46,'/image\\IViettech\\Xiaomi\\Xiaomi Mi 9\\64 GB\\6 GB\\Xanh\\636928415238590301_xiaomi-mi-9-xanh-4.png'),(107,48,'/image\\IViettech\\Xiaomi\\Xiaomi Mi 8\\64 GB\\4 GB\\đen\\636821310626629278_xiaomi-mi8-lite-64g-den-2.png'),(108,48,'/image\\IViettech\\Xiaomi\\Xiaomi Mi 8\\64 GB\\4 GB\\đen\\636821310626609278_xiaomi-mi8-lite-64g-den-3.png'),(109,48,'/image\\IViettech\\Xiaomi\\Xiaomi Mi 8\\64 GB\\4 GB\\đen\\636821310626609278_xiaomi-mi8-lite-64g-den-3.png'),(110,49,'/image\\IViettech\\Samsung\\Samsung Galaxy A50\\64 GB\\4 GB\\Đen\\636880892470231431_ss-galaxy-a50-den-2.png'),(111,49,'/image\\IViettech\\Samsung\\Samsung Galaxy A50\\64 GB\\4 GB\\Đen\\636880892469731431_ss-galaxy-a50-den-3.png'),(112,49,'/image\\IViettech\\Samsung\\Samsung Galaxy A50\\64 GB\\4 GB\\Đen\\636880892469121431_ss-galaxy-a50-den-5.png'),(122,53,'/image\\FPT\\Vsmart\\Vsmart Active 1+\\64 GB\\6 GB\\Hồng\\636800617664765208_vsmart-active1-plus-hong-3.png'),(123,53,'/image\\FPT\\Vsmart\\Vsmart Active 1+\\64 GB\\6 GB\\Hồng\\636800617664765208_vsmart-active1-plus-hong-2.png'),(124,53,'/image\\FPT\\Vsmart\\Vsmart Active 1+\\64 GB\\6 GB\\Hồng\\636800617663913232_vsmart-active1-plus-hong-4.png'),(131,56,'/image\\FPT\\HuaWei\\Huawei P30 Pro\\64 GB\\4 GB\\Xanh\\636893873122560000_huawei-p30-pro-xanh-cuc-quang-2.png'),(132,56,'/image\\FPT\\HuaWei\\Huawei P30 Pro\\64 GB\\4 GB\\Xanh\\636899683178079667_huawei-p30-pro-xanh-cuc-quang-3.png'),(133,56,'/image\\FPT\\HuaWei\\Huawei P30 Pro\\64 GB\\4 GB\\Xanh\\636893873123000000_huawei-p30-pro-xanh-cuc-quang-4.png'),(134,57,'/image\\FPT\\Vivo\\Vivo V15\\64 GB\\8 GB\\Đỏ\\636912701654127600_vivo-v15-do-qh-2.png'),(135,57,'/image\\FPT\\Vivo\\Vivo V15\\64 GB\\8 GB\\Đỏ\\636878974844672957_vivo-v15-6-128gb-do-3.png'),(136,57,'/image\\FPT\\Vivo\\Vivo V15\\64 GB\\8 GB\\Đỏ\\636912701650587954_vivo-v15-do-qh-5.png'),(137,58,'/image\\FPT\\iPhone\\iPhone XR\\64 GB\\8 GB\\đen\\636812432713875725_ip-xr-den-2.jfif'),(138,58,'/image\\FPT\\iPhone\\iPhone XR\\64 GB\\8 GB\\đen\\636812432713563751_ip-xr-den-3.jfif'),(139,58,'/image\\FPT\\iPhone\\iPhone XR\\64 GB\\8 GB\\đen\\636812432713563751_ip-xr-den-4.jfif'),(140,59,'/image\\FPT\\iPhone\\iPhone 6s Plus\\64 GB\\2 GB\\Vàng\\636172339809600948_apple-Iphone-6s-gold-2.jpg'),(141,59,'/image\\FPT\\iPhone\\iPhone 6s Plus\\64 GB\\2 GB\\Vàng\\636172339809600948_apple-Iphone-6s-gold-2.jpg'),(142,59,'/image\\FPT\\iPhone\\iPhone 6s Plus\\64 GB\\2 GB\\Vàng\\636172339809912958_apple-Iphone-6s-gold-3.jpg'),(143,60,'/image\\IViettech\\Samsung\\OPPO F11\\1TB\\4 GB\\do\\636737264632644092_nokia6Plus-den-3.jpg'),(144,60,'/image\\IViettech\\Samsung\\OPPO F11\\1TB\\4 GB\\do\\636737264632654091_nokia6Plus-den-4.jpg'),(145,60,'/image\\IViettech\\Samsung\\OPPO F11\\1TB\\4 GB\\do\\636737264632594097_nokia6Plus-den-5.jpg');
/*!40000 ALTER TABLE `productimage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `gender` bit(1) DEFAULT NULL,
  `birthDate` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile`
--

LOCK TABLES `profile` WRITE;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
INSERT INTO `profile` VALUES (1,'Thanh','Tran Ba','bathanh.thxd@gmail.com','0832383219','Mai Hoa-Tuyen Hoa',_binary '','1998-01-11'),(2,'Thuy','Tran Thi','thanhba.thxd@gmail.com','0832386789','Mai Hoa-Tuyen Hoa',_binary '\0','1998-01-11'),(3,'Thanh','Tran Ba','bathanh.thxd@gmail.com','0832383219','Mai Hoa-Tuyen Hoa',_binary '','1998-01-11'),(4,'Thanh','Tran Ba','bathanh.thxd@gmail.com','0832383219','Mai Hoa-Tuyen Hoa',_binary '\0','1998-01-11'),(10,'Thanh','Trần','bahtanh.than@Gmail.com',NULL,NULL,_binary '',NULL),(11,'Đạt','Trần Quang','dattran@Gmail.com',NULL,NULL,_binary '\0',NULL),(12,'Thanh Thúy','Bùi Thị','thuy@gmail.com',NULL,NULL,_binary '\0',NULL),(13,'','','',NULL,NULL,_binary '\0',NULL),(14,'Hoàng','Biện','chiyeumoinguoi@gmail.com',NULL,NULL,_binary '',NULL),(16,'Thanh','Tran Ba','bathanh.thxd@gmail.com','0832383219',NULL,_binary '\0',NULL),(17,'Thanh','Tran Ba','bathanh.thxd@gmail.com','0832383219',NULL,_binary '\0',NULL),(18,'Thanh','Tran Ba','bathanh.thxd@gmail.com','0832383219',NULL,_binary '\0',NULL),(19,'Thanh','Tran Ba','bathanh.thxd@gmail.com','0832383219',NULL,_binary '\0',NULL),(20,'Thanh','Tran Ba','bathanh.thxd@gmail.com','0832383219',NULL,_binary '\0',NULL),(21,'Thanh','Tran Ba','bathanh.thxd@gmail.com','0832383219',NULL,_binary '\0',NULL),(22,'Thanh','Tran Ba','bathanh.thxd@gmail.com','0832383219',NULL,_binary '\0',NULL),(23,'Thanh','Tran Ba','bathanh.thxd@gmail.com','0832383219',NULL,_binary '\0',NULL),(24,'Thanh','Tran Ba','bathanh.thxd@gmail.com','0832383219',NULL,_binary '\0',NULL),(25,'Thanh','Tran Ba','bathanh.thxd@gmail.com','0832383219',NULL,_binary '\0',NULL),(26,'Thanh','Tran Ba','bathanh.thxd@gmail.com','0832383219',NULL,_binary '\0',NULL),(27,'Thanh','Tran Ba','bathanh.thxd@gmail.com','0832383219',NULL,_binary '\0',NULL),(28,'Thanh','Tran Ba','bathanh.thxd@gmail.com','0832383219',NULL,_binary '\0',NULL),(29,'Thanh','Tran Ba','bathanh.thxd@gmail.com','0832383219',NULL,_binary '\0',NULL),(30,'Thanh','Tran Ba','bathanh.thxd@gmail.com','0832383219',NULL,_binary '\0',NULL),(31,'Thanh','Tran Ba','bathanh.thxd@gmail.com','0832383219',NULL,_binary '\0',NULL),(32,'Thanh','Tran Ba','bathanh.thxd@gmail.com','0832383219',NULL,_binary '\0',NULL),(33,'Thanh','Tran Ba','bathanh.thxd@gmail.com','0832383219',NULL,_binary '\0',NULL),(34,'Thanh','Tran Ba','bathanh.thxd@gmail.com','0832383219',NULL,_binary '\0',NULL),(35,'Thanh','Trần','bahtanh.than@Gmail.com','',NULL,_binary '\0',NULL),(36,'Thanh','Tran Ba','bathanh.thxd@gmail.com','0832383219',NULL,_binary '\0',NULL),(44,'Thanh','Trần','dattran@Gmail.com','0832383219',NULL,_binary '',NULL),(54,'Thanh','Ba','bahtanh.than@Gmail.com','0832383219',NULL,_binary '',NULL),(61,'Thanh',' Trần','chiyeumoinguoi@gmail.com','0832383219',NULL,_binary '',NULL),(62,'Tài','Đức','bahtanh.than@Gmail.com','0832383219',NULL,_binary '',NULL);
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotion`
--

DROP TABLE IF EXISTS `promotion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `promotion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `promotionValue` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `endDay` date DEFAULT NULL,
  `startDay` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotion`
--

LOCK TABLES `promotion` WRITE;
/*!40000 ALTER TABLE `promotion` DISABLE KEYS */;
/*!40000 ALTER TABLE `promotion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotiondestails`
--

DROP TABLE IF EXISTS `promotiondestails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `promotiondestails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productId` int(11) DEFAULT NULL,
  `PromotionId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_promotion_idx` (`PromotionId`),
  KEY `FK_Promotion-product_idx` (`productId`),
  CONSTRAINT `FK5ik1lxlq88l929pjxum08akj7` FOREIGN KEY (`PromotionId`) REFERENCES `promotion` (`id`),
  CONSTRAINT `FK_Promotion-product` FOREIGN KEY (`productId`) REFERENCES `product` (`id`),
  CONSTRAINT `FKdn3cfs3lmqxhkkmdyteydm4p2` FOREIGN KEY (`productId`) REFERENCES `product` (`id`),
  CONSTRAINT `fk_promotion` FOREIGN KEY (`PromotionId`) REFERENCES `promotion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotiondestails`
--

LOCK TABLES `promotiondestails` WRITE;
/*!40000 ALTER TABLE `promotiondestails` DISABLE KEYS */;
/*!40000 ALTER TABLE `promotiondestails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user_role` (
  `username` varchar(50) NOT NULL,
  `role` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES ('','ROLE_CUSTOMER'),('admin','ROLE_ADMIN'),('bathanh','ROLE_CUSTOMER'),('customer','ROLE_CUSTOMER'),('customer1','ROLE_CUSTOMER'),('customer2','ROLE_CUSTOMER'),('hoangbien','ROLE_CUSTOMER'),('taiduc','ROLE_CUSTOMER'),('thanhba','ROLE_CUSTOMER'),('thanhtran','ROLE_CUSTOMER'),('thuy01','ROLE_CUSTOMER'),('user','ROLE_USER');
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `enabled` int(11) DEFAULT NULL,
  `createDay` date DEFAULT NULL,
  `profileId` int(11) DEFAULT NULL,
  `role_username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKt60gt36j5f6wkfe9ve34ohf9e` (`profileId`),
  KEY `fk_role_idx` (`username`),
  KEY `FKt8ms93k8sly07ap9ifilo7i0a` (`role_username`),
  CONSTRAINT `FKgjynxj7x9dxqbrojntlrva0wm` FOREIGN KEY (`profileId`) REFERENCES `profile` (`id`),
  CONSTRAINT `FKt8ms93k8sly07ap9ifilo7i0a` FOREIGN KEY (`role_username`) REFERENCES `user_role` (`username`),
  CONSTRAINT `fk_role` FOREIGN KEY (`username`) REFERENCES `user_role` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'user','123456',1,'2019-01-22',1,NULL),(2,'admin','123456',1,'2019-01-22',2,NULL),(3,'customer','123456',1,'2019-01-11',3,NULL),(10,'customer1','123456',1,NULL,10,NULL),(11,'customer2','123456',1,NULL,11,NULL),(12,'thuy01','123456',1,NULL,12,NULL),(14,'hoangbien','123456',1,NULL,14,NULL),(43,'bathanh','123456',1,NULL,44,NULL),(44,'thanhba','123456',1,NULL,54,NULL),(45,'thanhtran','123456',1,'2019-06-19',61,NULL),(46,'taiduc','123456',1,'2019-06-19',62,NULL);
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

-- Dump completed on 2019-06-20 14:13:49
