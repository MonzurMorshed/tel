-- MySQL dump 10.13  Distrib 8.0.27, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: teletick_lara
-- ------------------------------------------------------
-- Server version	8.0.27-0ubuntu0.20.04.1

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
-- Table structure for table `action_events`
--

DROP TABLE IF EXISTS `action_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `action_events` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `batch_id` char(36) NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `actionable_type` varchar(255) NOT NULL,
  `actionable_id` bigint unsigned NOT NULL,
  `target_type` varchar(255) NOT NULL,
  `target_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint unsigned DEFAULT NULL,
  `fields` text NOT NULL,
  `status` varchar(25) NOT NULL DEFAULT 'running',
  `exception` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `original` mediumtext,
  `changes` mediumtext,
  PRIMARY KEY (`id`),
  KEY `action_events_actionable_type_actionable_id_index` (`actionable_type`,`actionable_id`),
  KEY `action_events_batch_id_model_type_model_id_index` (`batch_id`,`model_type`,`model_id`),
  KEY `action_events_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `action_events`
--

LOCK TABLES `action_events` WRITE;
/*!40000 ALTER TABLE `action_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `action_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresses` (
  `address_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `city` varchar(255) NOT NULL,
  `postal_code` varchar(255) NOT NULL,
  `street_address` varchar(255) NOT NULL,
  `additional` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`address_id`),
  KEY `addresses_user_id_foreign` (`user_id`),
  CONSTRAINT `addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` VALUES (1,1,'test','23322','test','test','2022-02-16 07:08:13','2022-02-16 07:08:13'),(2,133,'test452','23322','testAddress','test','2022-02-16 07:08:13','2022-02-16 07:08:13');
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_events`
--

DROP TABLE IF EXISTS `book_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_events` (
  `book_event_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_by` bigint unsigned NOT NULL,
  `target_id` bigint unsigned NOT NULL,
  `address_id` bigint unsigned NOT NULL,
  `reason_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`book_event_id`),
  KEY `book_events_address_id_foreign` (`address_id`),
  KEY `book_events_reason_id_foreign` (`reason_id`),
  CONSTRAINT `book_events_address_id_foreign` FOREIGN KEY (`address_id`) REFERENCES `addresses` (`address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_events`
--

LOCK TABLES `book_events` WRITE;
/*!40000 ALTER TABLE `book_events` DISABLE KEYS */;
INSERT INTO `book_events` VALUES (1,2,1,1,1,'2022-04-01 16:11:14','2022-04-01 16:11:14'),(9,2,1,1,1,'2022-04-01 18:31:30','2022-04-01 18:31:30'),(10,2,1,1,2,'2022-04-01 22:06:41','2022-04-01 22:06:41');
/*!40000 ALTER TABLE `book_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendar_events`
--

DROP TABLE IF EXISTS `calendar_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `calendar_events` (
  `calendar_event_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `image_path` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`calendar_event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendar_events`
--

LOCK TABLES `calendar_events` WRITE;
/*!40000 ALTER TABLE `calendar_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `calendar_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `client_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`client_id`),
  UNIQUE KEY `clients_client_id_unique` (`client_id`),
  KEY `clients_user_id_foreign` (`user_id`),
  CONSTRAINT `clients_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `daily_schedules`
--

DROP TABLE IF EXISTS `daily_schedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `daily_schedules` (
  `daily_schedule_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `weekday_id` tinyint unsigned NOT NULL,
  `status` tinyint DEFAULT '1',
  `type_online` tinyint DEFAULT '0',
  `type_offline` tinyint DEFAULT '1',
  `type` enum('offline','online') DEFAULT 'offline',
  `user_id` bigint unsigned NOT NULL,
  `interval` int DEFAULT '10',
  `from` varchar(255) NOT NULL DEFAULT '09:30',
  `to` varchar(255) NOT NULL DEFAULT '18:00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`daily_schedule_id`),
  KEY `daily_schedules_user_id_foreign` (`user_id`),
  CONSTRAINT `daily_schedules_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daily_schedules`
--

LOCK TABLES `daily_schedules` WRITE;
/*!40000 ALTER TABLE `daily_schedules` DISABLE KEYS */;
INSERT INTO `daily_schedules` VALUES (1,1,1,0,1,'offline',1,5,'7:00','18:00','2022-02-16 07:08:13','2022-04-01 21:46:04'),(2,2,1,0,1,'offline',1,10,'09:30','18:00','2022-02-16 07:08:13','2022-02-16 07:08:13'),(3,3,1,0,1,'offline',1,10,'09:30','18:00','2022-02-16 07:08:13','2022-02-16 07:08:13'),(4,4,1,0,1,'offline',1,10,'09:30','18:00','2022-02-16 07:08:13','2022-02-16 07:08:13'),(5,5,1,0,1,'offline',1,10,'09:30','18:00','2022-02-16 07:08:13','2022-02-16 07:08:13'),(6,6,1,0,1,'offline',1,10,'09:30','18:00','2022-02-16 07:08:13','2022-02-16 07:08:13'),(7,0,1,0,1,'offline',1,10,'09:30','18:00','2022-02-16 07:08:13','2022-02-16 07:08:13'),(8,1,1,0,1,'offline',133,10,'09:30','18:00','2022-02-16 07:08:13','2022-02-16 07:08:13'),(9,2,1,0,1,'offline',133,10,'09:30','18:00','2022-02-16 07:08:13','2022-02-16 07:08:13'),(10,3,1,0,1,'offline',133,10,'09:30','18:00','2022-02-16 07:08:13','2022-02-16 07:08:13'),(11,4,1,0,1,'offline',133,10,'09:30','18:00','2022-02-16 07:08:13','2022-02-16 07:08:13'),(12,5,1,0,1,'offline',133,10,'09:30','18:00','2022-02-16 07:08:13','2022-02-16 07:08:13'),(13,6,1,0,1,'offline',133,10,'09:30','18:00','2022-02-16 07:08:13','2022-02-16 07:08:13'),(14,0,1,0,1,'offline',133,10,'09:30','18:00','2022-02-16 07:08:13','2022-02-16 07:08:13');
/*!40000 ALTER TABLE `daily_schedules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(28,'2014_10_12_100000_create_password_resets_table',2),(29,'2018_01_01_000000_create_action_events_table',2),(30,'2019_05_10_000000_add_fields_to_action_events_table',2),(31,'2019_08_19_000000_create_failed_jobs_table',2),(32,'2022_02_16_014244_create_clients_table',2),(34,'2022_02_16_094017_create_addresses_table',2),(35,'2022_03_30_162844_create_daily_schedules_table',2),(36,'2022_03_30_170924_create_specialities_table',2),(37,'2022_03_30_171257_create_practices_table',2),(38,'2022_03_30_171851_create_users_practices_table',2),(39,'2022_03_30_171907_create_users_specialities_table',2),(40,'2022_03_30_171919_create_reasons_table',2),(41,'2022_03_31_112357_create_reason_daily_schedule_table',2),(42,'2022_04_01_051940_create_books_table',3),(43,'2022_02_16_014254_create_specialists_table',4),(44,'2022_04_01_170158_create_schedule_events_table',5),(45,'2022_04_01_173530_create_calendar_events_table',5),(46,'2022_04_01_051940_create_book_events_table',6),(47,'2022_04_02_000755_create_schedule_address_table',7);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `practices`
--

DROP TABLE IF EXISTS `practices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `practices` (
  `practice_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `speciality_id` bigint unsigned NOT NULL,
  `key` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`practice_id`),
  KEY `practices_speciality_id_foreign` (`speciality_id`),
  CONSTRAINT `practices_speciality_id_foreign` FOREIGN KEY (`speciality_id`) REFERENCES `specialities` (`speciality_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `practices`
--

LOCK TABLES `practices` WRITE;
/*!40000 ALTER TABLE `practices` DISABLE KEYS */;
INSERT INTO `practices` VALUES (2,1,'test123','test123','test123',1,'2022-02-16 07:08:13','2022-02-16 07:08:13'),(3,1,'qqq2','test','test',1,NULL,NULL);
/*!40000 ALTER TABLE `practices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reason_daily_schedule`
--

DROP TABLE IF EXISTS `reason_daily_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reason_daily_schedule` (
  `daily_schedule_id` bigint unsigned NOT NULL,
  `reason_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reason_daily_schedule`
--

LOCK TABLES `reason_daily_schedule` WRITE;
/*!40000 ALTER TABLE `reason_daily_schedule` DISABLE KEYS */;
INSERT INTO `reason_daily_schedule` VALUES (8,5,NULL,NULL),(8,4,NULL,NULL),(9,5,NULL,NULL),(9,3,NULL,NULL),(10,4,NULL,NULL),(10,3,NULL,NULL),(10,5,NULL,NULL),(11,5,NULL,NULL),(11,4,NULL,NULL),(11,3,NULL,NULL),(8,6,NULL,NULL),(8,7,NULL,NULL),(9,7,NULL,NULL),(9,4,NULL,NULL),(10,6,NULL,NULL),(12,7,NULL,NULL),(12,5,NULL,NULL),(11,7,NULL,NULL),(1,8,NULL,NULL),(1,9,NULL,NULL),(1,1,NULL,NULL),(2,9,NULL,NULL),(2,2,NULL,NULL),(3,1,NULL,NULL),(3,2,NULL,NULL),(3,8,NULL,NULL),(4,1,NULL,NULL),(4,8,NULL,NULL),(4,2,NULL,NULL),(4,9,NULL,NULL);
/*!40000 ALTER TABLE `reason_daily_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reasons`
--

DROP TABLE IF EXISTS `reasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reasons` (
  `reason_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `duration` int NOT NULL DEFAULT '1',
  `price` double(17,2) NOT NULL,
  `name` text NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`reason_id`),
  KEY `reasons_user_id_foreign` (`user_id`),
  CONSTRAINT `reasons_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reasons`
--

LOCK TABLES `reasons` WRITE;
/*!40000 ALTER TABLE `reasons` DISABLE KEYS */;
INSERT INTO `reasons` VALUES (2,90,14.55,'wqe',1,'2022-03-31 12:34:16','2022-03-31 12:34:16'),(4,60,110.00,'testReason2',133,'2022-03-31 12:34:16','2022-03-31 12:34:16'),(5,60,110.00,'testReason3',133,'2022-03-31 12:34:16','2022-03-31 12:34:16'),(6,120,100.00,'test123',133,'2022-03-31 19:04:34','2022-03-31 19:04:34'),(7,180,250.50,'test180',133,'2022-03-31 19:04:49','2022-03-31 19:04:49'),(8,30,50.00,'test',1,'2022-04-01 18:37:43','2022-04-01 18:37:43'),(9,120,150.00,'teqqstt',1,'2022-04-01 18:38:03','2022-04-01 18:38:03');
/*!40000 ALTER TABLE `reasons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule_address_teble`
--

DROP TABLE IF EXISTS `schedule_address_teble`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedule_address_teble` (
  `daily_schedule_id` bigint unsigned NOT NULL,
  `address_id` bigint unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule_address_teble`
--

LOCK TABLES `schedule_address_teble` WRITE;
/*!40000 ALTER TABLE `schedule_address_teble` DISABLE KEYS */;
/*!40000 ALTER TABLE `schedule_address_teble` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule_events`
--

DROP TABLE IF EXISTS `schedule_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedule_events` (
  `schedule_event_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `daily_schedule_id` bigint unsigned NOT NULL,
  `from` varchar(255) NOT NULL,
  `duration` int NOT NULL,
  `date` varchar(255) DEFAULT NULL,
  `eventable_id` bigint unsigned NOT NULL,
  `eventable_type` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`schedule_event_id`),
  KEY `schedule_events_daily_schedule_id_foreign` (`daily_schedule_id`),
  CONSTRAINT `schedule_events_daily_schedule_id_foreign` FOREIGN KEY (`daily_schedule_id`) REFERENCES `daily_schedules` (`daily_schedule_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule_events`
--

LOCK TABLES `schedule_events` WRITE;
/*!40000 ALTER TABLE `schedule_events` DISABLE KEYS */;
INSERT INTO `schedule_events` VALUES (1,1,'12:30',90,'2022-04-04',1,'Yarscript\\Api\\Models\\BookEvent','2022-04-01 16:16:39','2022-04-01 16:16:39'),(2,1,'9:30',1,'2022-04-04',9,'Yarscript\\Api\\Models\\BookEvent','2022-04-01 18:31:31','2022-04-01 18:31:31'),(3,2,'15:30',90,'2022-04-05',10,'Yarscript\\Api\\Models\\BookEvent','2022-04-01 22:06:41','2022-04-01 22:06:41');
/*!40000 ALTER TABLE `schedule_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specialists`
--

DROP TABLE IF EXISTS `specialists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `specialists` (
  `specialist_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `fee` varchar(255) NOT NULL,
  `follow` varchar(255) NOT NULL,
  `prof_expertise` text NOT NULL,
  `prof_practice` text NOT NULL,
  `education` text NOT NULL,
  `consultation_type` set('online','offline') NOT NULL DEFAULT 'offline',
  `expertise` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`specialist_id`),
  UNIQUE KEY `specialists_specialist_id_unique` (`specialist_id`),
  KEY `specialists_user_id_foreign` (`user_id`),
  CONSTRAINT `specialists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specialists`
--

LOCK TABLES `specialists` WRITE;
/*!40000 ALTER TABLE `specialists` DISABLE KEYS */;
INSERT INTO `specialists` VALUES (1,1,'324234234234','2342342','34234sdfgadsg','sdqqqqqrerer','sdgasdgsdfgsdfgsdfgsdfgf','offline',NULL,'2022-02-16 07:08:13','2022-02-16 07:08:13');
/*!40000 ALTER TABLE `specialists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specialities`
--

DROP TABLE IF EXISTS `specialities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `specialities` (
  `speciality_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `name` varchar(255) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`speciality_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specialities`
--

LOCK TABLES `specialities` WRITE;
/*!40000 ALTER TABLE `specialities` DISABLE KEYS */;
INSERT INTO `specialities` VALUES (1,'kek','test','1',1,'testName','2022-02-16 07:08:13','2022-02-16 07:08:13'),(2,'test','aetste','sadfasdf',1,'test','2022-02-16 07:08:13','2022-02-16 07:08:13');
/*!40000 ALTER TABLE `specialities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `type` tinyint(1) NOT NULL,
  `is_admin` tinyint NOT NULL DEFAULT '0',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `phone_number_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `users_user_id_unique` (`user_id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=234 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Piyushww','Piyushqq','test@test.test','12312333',0,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,'2022-02-16 07:08:13','2022-04-01 13:49:36'),(2,'Aicha','Aicha','test@test.test2','1232551',1,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,'2022-02-16 07:08:13','2022-02-16 07:08:13'),(3,'aysha','aysha','test@test.test14fgh','12312333',0,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,'2022-02-16 07:08:13','2022-02-16 07:08:13'),(4,'AKASH','AKASH','test@test.test12312333fghjg','12312333',0,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,'2022-02-16 07:08:13','2022-02-16 07:08:13'),(5,'AKASH','AKASH','test@test.test52fghjgh','12312333',0,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,'2022-02-16 07:08:13','2022-02-16 07:08:13'),(6,'AKASH','AKASH','test@test.testtttfgdjfg','12312333',0,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,'2022-02-16 07:08:13','2022-02-16 07:08:13'),(7,'AKASH','AKASH','test@test.testasdfghfgjd','12312333',0,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,'2022-02-16 07:08:13','2022-02-16 07:08:13'),(8,'AKASH','AKASH','test@test.testbndngn','12312333',0,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,'2022-02-16 07:08:13','2022-02-16 07:08:13'),(9,'Marie-Caroline','Marie-Caroline','test@test.testgdsgdg','12312333',0,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,'2022-02-16 07:08:13','2022-02-16 07:08:13'),(10,'FAUSTINE','FAUSTINE','test@test.testdsgsdg','12312333',0,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,'2022-02-16 07:08:13','2022-02-16 07:08:13'),(11,'Lea','Lea','test@test.testdfgsdh345','12312333',0,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,'2022-02-16 07:08:13','2022-02-16 07:08:13'),(12,'fanny','fanny','test@test.dfg','12312333',0,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,'2022-02-16 07:08:13','2022-02-16 07:08:13'),(13,'Bénédicte','Bénédicte','test@test.testkfgkfgk4mvm','12312333',0,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,'2022-02-16 07:08:13','2022-02-16 07:08:13'),(14,'Clement','AKASH','test@test.testdfghdfghstdt','12312333',0,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,'2022-02-16 07:08:13','2022-02-16 07:08:13'),(15,'Celine','Celine','test@test.testhdfhdf123dt','12312333',0,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,'2022-02-16 07:08:13','2022-02-16 07:08:13'),(122,'Djelou','Djelou','ouradmintest@test.com','12312333',1,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(123,'Cidjy','Cidjy','piyushdeshpande77@gmail.com','12312333',1,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(124,'Anne-Sophie','Anne-Sophie','ayshadjay@gmail.com','12312333',1,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(125,'Anna','AKASH','raffinee75@gmail.com','12312333',1,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(126,'Ulrika','Ulrika','test@test.testqqq','12312333',1,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(127,'Cyril','Cyril','BARRAFAUSTINE@gmail.com','12312333',1,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(128,'Cidjy','Cidjy','sapin.lea@outlook.fr','12312333',1,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(129,'Celine','Celine','fannyquentin@gmail.com','12312333',1,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(130,'Céline','Céline','bfulpin@gmail.com','12312333',1,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(131,'Rohit','Rohit','clement.nachin@hotmail.fr','12312333',1,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(132,'Viji','Viji','perret.celine30@gmail.com','12312333',1,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(133,'Willy','Willy','spec@spec.spec','12312333',1,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(134,'T','T','cidjy1234@icloud.com','12312333',1,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(135,'Alan ','Alan ','annesophiebarthelemi124587@yahoo.fr','12312333',1,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(136,'Thomas','Thomas','anuchak@yandex.ru','12312333',1,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(137,'emmanuelle','emmanuelle','contact.ulrikab1234@gmail.com','12312333',1,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(138,'Anne-Sophie','Anne-Sophie','Cyril.biesmans@orange.fr','12312333',1,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(139,'Yin','Yin','cidjy@icloud.com','12312333',1,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(140,'Roshan','Roshan','revailes.celinequilez123456@gmail.com','12312333',1,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(141,'SOUKAINA','SOUKAINA','revailes.celinequilez14254@gmail.com','12312333',1,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(142,'Sonika','Sonika','asdr@mailnesia.com','12312333',1,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(143,'Testing','Céline','barclaiswilly@gmail.com','12312333',1,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(144,'Deepika','Deepika','er@mailnesia.com','12312333',1,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(145,'Céline','Céline','ihtadto@mailnesia.com','12312333',1,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(146,'Test','Test','info@sophroinstitut.fr','12312333',1,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(147,'Ursula','Ursula','emmamesnard1245@yahoo.fr','12312333',1,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(148,'Ursula','Ursula','annesophiebarthelemi@yahoo.fr','12312333',1,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(149,'David','David','dsssd@mailnesia.com','12312333',1,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(150,'Anne-Marie','Anne-Marie','roshan87@gmail.com','12312333',1,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(151,'Marina','Marina','soukaina.haibaoui@teletick.fr','12312333',0,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(152,'Sayli','Sayli','testinglive30@gmail.com','12312333',0,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(153,'Stéphanie','Stéphanie','deepstesting12@gmail.com','12312333',0,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(154,'Clémentine','Clémentine','revailes.celinequilez@gmail.com','12312333',0,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(155,'Véronique','Véronique','elvasd@mailnesia.com','12312333',0,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(156,'Aurelie','Aurelie','contact14578@sophro-psy.fr','12312333',0,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(157,'Morgane','Morgane','contact@sophro-psy.fr','12312333',0,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(158,'Eleanor','Eleanor','coachdavidlaussot@gmail.com','12312333',0,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(159,'Frédéric','Frédéric','IAM.annemariesabate@yahoo.fr','12312333',0,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(160,'Sophie','Solène','mmerley.naturopathe@gmail.com','12312333',0,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(161,'sophie','Roxane','antutn@mailnesia.com','12312333',0,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(162,'Mathilde','Annelise','spouchol@positivemind.fr','12312333',0,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(163,'Delphine','Andréa','contact@clementinejoachim.com','12312333',0,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(164,'Léa','thibaut','aurelie.baruteau@neuf.fr','12312333',0,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(165,'Magalie','Solène','morganesagnier6@gmail.com','12312333',0,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(166,'enora','Roxane','vanherpeneleanor@gmail.com','12312333',0,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(167,'kajal','Annelise','sophronet.fr@gmail.com','12312333',0,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(168,'Enora','Andréa','lafuente.sante@gmail.coms','12312333',0,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(169,'Solène','thibaut','lafuente.sante@gmail.com','12312333',0,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(170,'Roxane','Anastassia','mathilde.therapeute@gmail.com','12312333',0,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(171,'Annelise','Joris','delphine.jaulin@gmail.com','12312333',0,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(172,'Andréa','Radhika1','leamichels@hotmail.fr','12312333',0,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(173,'thibaut','Amira','magalie@myhomenaturo.com','12312333',0,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(174,'Anastassia','Ulrika','kajal.nagare1@encureit.com','12312333',0,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(175,'Joris','Radhika1','enora.naturo@gmail.com','12312333',0,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(176,'Radhika1','Joris','spopulus.diet@outlook.fr','12312333',0,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(177,'Amira','Amira','roxanegaulier@gmail.com','12312333',0,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(178,'Ulrika','Joris','anneliserelaxologue@gmail.com','12312333',0,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(179,'Karine','Karine','andrea.boyer06000@gmail.com','12312333',0,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(180,'Juliane','Karine','trainwithtibo@gmail.com','12312333',0,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(181,'Charlotte','Karine','Anastassia.faraut@gmail.com','12312333',0,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(182,'Carine','Annelise','jorisgalland@icloud.com','12312333',0,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(183,'Jérôme','Karine','radhikasathe12@gmail.com','12312333',0,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(184,'Laure','thibaut','amiracoachangement@gmail.com','12312333',0,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(185,'Marion','Anastassia','contact.ulrikab@gmail.com','12312333',0,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(186,'Emanuelle','Joris','karinemonier17@gmail.com','12312333',0,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(187,'Maïwenn','Radhika1','julianedurand.dietetique@gmail.com','12312333',0,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(188,'Dayanah','Amira','charlottetonicello@gmail.com','12312333',0,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(189,'Alain','Ulrika','Cultivetavitalite@gmail.com','12312333',0,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(190,'Guillaume','Karine','naturaljay@outlook.fr','12312333',0,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(191,'Lena','Juliane','test12@gmail.comq','12312333',0,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(192,'Lena','Lena','testing22@gmail.comty','12312333',0,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(193,'Sonia','Sonia','rekhadeshpande306@gmail.com','12312333',0,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(194,'Sonia','Sonia','newadmin12@gmail.com','12312333',0,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(195,'Maiwenn','Maiwenn','laure.mayoud@hotmail.fr','12312333',0,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(196,'EMILIE','EMILIE','sophroteam35@gmail.com','12312333',0,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(197,'Anissa','Anissa','manue.nkaoua@gmail.com','12312333',0,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(198,'camille','camille','mpirastru.naturopathie@gmail.com','12312333',0,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(199,'Eugenie','Eugenie','dbmcoach@gmail.com','12312333',0,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(200,'Melanie','Melanie','alainsr@gmail.com','12312333',0,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(201,'Audrey','Audrey','gbordas87@gmail.com','12312333',0,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(202,'Souad','Souad','lena.rospape@hotmail.com','12312333',0,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(203,'Audrey','Audrey','lena.rospape@gmail.com','12312333',0,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(204,'Anais','Anais','svalentov@yahoo.com','12312333',0,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(205,'anais','anais','info@reflexologiebien-etre.com','12312333',0,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(206,'isabelle','isabelle','lia.pirastru@gmail.com','12312333',0,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(207,'Demo','Demo','emilie.vendeville@hotmail.fr','12312333',0,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(208,'Demo','Demo','anissag@live.fr','12312333',0,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(209,'AKASH','AKASH','soumoycamille@gmail.com','12312333',0,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(210,'Ritika','Ritika','eugenienaturopathe@gmail.com','12312333',0,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(211,'Iness','Iness','melanie.beliard@yahoo.com','12312333',0,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(212,'Samantha','Samantha','color.coach.cbt@gmail.com','12312333',0,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(213,'Elodie','Elodie','skoraichi@hotmail.fr','12312333',0,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(214,'Maxime','Maxime','audreydavidson2007@yahoo.com','12312333',0,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(215,'Caroline','Caroline','nolson.nutrition@gmail.com','12312333',0,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(216,'Lucie','Lucie','nolson.anais@gmail.com','12312333',0,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(217,'Manon','Manon','izzabellaroche@gmail.com','12312333',0,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(218,'Haydée','Haydée','ernot@mailnesia.com','12312333',0,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(219,'Léa','Léa','iness.morvan@gmail.com','12312333',0,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(220,'Martine','Martine','samantha.lanse@gmail.com','12312333',0,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(221,'Haydée','Haydée','elauf.dieteticienne@gmail.com','12312333',0,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(222,'Léa','Léa','imperiumreflexologie@hotmail.com','12312333',0,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(223,'Martine','Martine','reflexocaro@gmail.com','12312333',0,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(224,'Haydée','Haydée','lucienaturopathie@gmail.com','12312333',1,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(225,'Léa','Léa','hello@manonvercouter.com','12312333',1,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(226,'Martine','Martine','contact@haydee-garcia.com','12312333',1,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(227,'Martineasg','Martineasg','lea_77190@hotmail.fr','12312333',0,0,'2022-02-16 07:08:13',NULL,'$2y$10$JjQyQ5JDZIED6bV0gHJ5e.FK5xapLY34Mou8oE2/dat4jkS8MIsTy',NULL,NULL,NULL),(228,'test','tesaet','qqqwww@qqwww.com','12121212',1,0,'2022-02-16 07:08:13',NULL,'$2y$10$hh32/0j1J7SCoyjLzvfndeVT07kud50bh4uqSITXE1AcvduOsQvGq',NULL,'2022-04-01 01:31:12','2022-04-01 01:31:12'),(229,'wwww','wwww','www@www.www','12121212',1,0,'2022-02-16 07:08:13',NULL,'$2y$10$H2/wuFjI5zZ7gCDpUIyRouSeUda9lWX28R97A1TzPUBXSA1hW4csy',NULL,'2022-04-01 01:35:28','2022-04-01 01:35:28'),(230,'qqq@qqq.qqq','qqq@qqq.qqq','qqq@qqq.qqq','1111',1,0,'2022-04-01 01:37:12',NULL,'$2y$10$2OC4BBRivgjxaivQu39/Qu4QbtYSGRguctXa/qY7ROqwZMrKNgnJa',NULL,'2022-04-01 01:37:12','2022-04-01 01:37:12'),(231,'xzcsg','sdfsdf','dd@c.c','2342323',1,0,NULL,NULL,'$2y$10$dXot2qWjWfWe4cSHC/jptuv.fKr3CXf8IYQtOUm7eeYQXs4v3fZIq',NULL,'2022-04-01 01:38:11','2022-04-01 01:38:11'),(232,'xzcsg','sdfsdf','dd@csas.co','2342323',1,0,NULL,NULL,'$2y$10$uC9uytGUEM0yXyHXaXsMEO1C7JohXFFem/c7reO94s7L3ydzcpKi2',NULL,'2022-04-01 01:38:31','2022-04-01 01:38:31'),(233,'xzcsg','sdfsdf','ddsdf@csas.co','2342323',1,0,NULL,NULL,'$2y$10$SBbHiXICB4mI2vNhmA6.S..f9I/cfC81wnIvNZJPM0f7/hga4rjZG',NULL,'2022-04-01 01:38:40','2022-04-01 01:38:40');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_practices`
--

DROP TABLE IF EXISTS `users_practices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_practices` (
  `user_id` bigint unsigned NOT NULL,
  `practice_id` bigint unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_practices`
--

LOCK TABLES `users_practices` WRITE;
/*!40000 ALTER TABLE `users_practices` DISABLE KEYS */;
INSERT INTO `users_practices` VALUES (1,2);
/*!40000 ALTER TABLE `users_practices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_specialities`
--

DROP TABLE IF EXISTS `users_specialities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_specialities` (
  `user_id` bigint unsigned NOT NULL,
  `speciality_id` bigint unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_specialities`
--

LOCK TABLES `users_specialities` WRITE;
/*!40000 ALTER TABLE `users_specialities` DISABLE KEYS */;
INSERT INTO `users_specialities` VALUES (1,1);
/*!40000 ALTER TABLE `users_specialities` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-02  4:51:47
