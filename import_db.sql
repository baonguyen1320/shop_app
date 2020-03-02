-- MySQL dump 10.13  Distrib 5.7.19, for Linux (x86_64)
--
-- Host: localhost    Database: shop_db
-- ------------------------------------------------------
-- Server version	5.7.19-0ubuntu0.17.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categories`
--
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS categories;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE categories (
  id bigserial not null,
  title varchar(255) DEFAULT NULL,
  tag integer DEFAULT NULL,
  published SMALLINT DEFAULT '1',
  icon varchar(255) DEFAULT NULL,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP NOT NULL,
  parent_id integer DEFAULT NULL,
  slug varchar(255) DEFAULT NULL,
  PRIMARY KEY (id)
) 
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

-- LOCK TABLES categories WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO categories VALUES (1,'Information Technology',1,1,'desktop_mac','2016-06-27 03:51:26','2017-04-14 04:23:12',9,'information-technology'),(5,'Electric & Electronic',2,1,'wb_incandescent','2016-06-27 03:54:59','2017-04-14 04:29:34',9,'electric-electronic'),(9,'root',0,0,'','2016-07-01 14:18:42','2016-07-01 14:18:42',NULL,NULL),(10,'Web Development',1,1,'public','2016-07-01 14:35:32','2017-04-14 04:33:29',1,'web-development'),(11,'Programming Languages',2,1,'settings_ethernet','2016-07-01 14:38:46','2017-04-14 04:35:52',1,'programming-languages'),(12,'Databases',3,1,'library_books','2016-07-01 14:42:08','2017-04-14 04:36:40',1,'databases'),(13,'Mobile Apps',4,1,'phone_android','2016-07-01 14:44:06','2017-04-14 04:37:15',1,'mobile-apps'),(14,'Game Development',5,1,'headset_mic','2016-07-01 14:59:47','2017-04-14 04:37:45',1,'game-development'),(15,'Project Management',6,1,'toc','2016-07-01 15:05:45','2017-04-14 04:38:10',1,'project-management'),(16,'Operating Systems',7,1,'stars','2016-07-01 15:13:45','2017-04-14 04:38:29',1,'operating-systems'),(17,'Hardware',0,1,'settings','2016-07-01 15:15:04','2017-10-24 03:54:53',1,'hardware'),(18,'Network & Security',8,1,'settings_input_component','2016-07-01 15:18:01','2017-10-24 03:54:53',1,'network-security'),(19,'Analog Design',8,1,'swap_calls','2016-07-01 15:41:42','2017-06-30 09:24:26',5,'analog-design'),(20,'Design Basic',1,1,'dialpad','2016-07-01 15:43:42','2017-06-30 10:05:26',5,'design-basic'),(21,'FPGA - CPLD',3,1,'functions','2016-07-01 15:44:34','2017-04-14 04:45:01',5,'fpga-cpld'),(22,'CPU - MCU - DSP',2,1,'memory','2016-07-01 15:46:12','2017-06-30 09:21:10',5,'cpu-mcu-dsp'),(23,'Internet of Things',5,1,'grain','2016-07-01 15:51:14','2017-06-28 10:09:11',5,'internet-of-things'),(24,'Machine Learning',9,1,'filter_tilt_shift','2016-07-01 15:52:54','2017-10-24 03:54:53',1,'machine-learning'),(25,'Power Electronic',6,1,'flash_on','2016-07-01 15:53:56','2017-04-14 04:46:32',5,'power-electronic'),(26,'EDA Tools',7,1,'brightness_high','2016-07-01 15:58:37','2017-04-14 04:47:21',5,'eda-tools'),(27,'Embedded System',4,1,'camera','2016-07-01 15:59:25','2017-06-30 09:24:23',5,'embedded-system');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
-- UNLOCK TABLES;

--
-- Table structure for table `products`
--


/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE products (
  id bigserial not null,
  name varchar(255) DEFAULT NULL,
  content TEXT,
  price decimal(8,2) DEFAULT '0.00',
  buyer integer DEFAULT '0',
  data_file varchar(255) DEFAULT NULL,
  manufacturer varchar(255) DEFAULT NULL,
  category_id bigint DEFAULT NULL,
  published SMALLINT DEFAULT '1',
  tags varchar(255) DEFAULT NULL,
  language varchar(255) DEFAULT 'English',
  slug varchar(255) DEFAULT NULL,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP NOT NULL,
  image_file_name varchar(255) DEFAULT NULL,
  image_content_type varchar(255) DEFAULT NULL,
  image_file_size integer DEFAULT NULL,
  image_updated_at TIMESTAMP DEFAULT NULL,
  PRIMARY KEY (id),
  -- KEY index_products_on_category_id (category_id),
  CONSTRAINT fk_rails_fb915499a4 FOREIGN KEY (category_id) REFERENCES categories (id)
)
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

-- LOCK TABLES products WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
-- UNLOCK TABLES;