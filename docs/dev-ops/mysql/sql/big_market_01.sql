-- MySQL dump 10.13  Distrib 9.2.0, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: big_market_01
-- ------------------------------------------------------
-- Server version	8.0.32

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

CREATE database if NOT EXISTS `big_market_01` default character set utf8mb4;
use `big_market_01`;
--
-- Table structure for table `raffle_activity_account`
--

DROP TABLE IF EXISTS `raffle_activity_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `raffle_activity_account` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `user_id` varchar(32) NOT NULL COMMENT '用户ID',
  `activity_id` bigint NOT NULL COMMENT '活动ID',
  `total_count` int NOT NULL COMMENT '总次数',
  `total_count_surplus` int NOT NULL COMMENT '总次数-剩余',
  `day_count` int NOT NULL COMMENT '日次数',
  `day_count_surplus` int NOT NULL COMMENT '日次数-剩余',
  `month_count` int NOT NULL COMMENT '月次数',
  `month_count_surplus` int NOT NULL COMMENT '月次数-剩余',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_user_id_activity_id` (`user_id`,`activity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='抽奖活动账户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `raffle_activity_account`
--

LOCK TABLES `raffle_activity_account` WRITE;
/*!40000 ALTER TABLE `raffle_activity_account` DISABLE KEYS */;
INSERT INTO `raffle_activity_account` VALUES (1,'xiaofuge',100301,37,37,37,37,37,37,'2025-11-06 20:55:34','2025-11-11 00:02:43'),(2,'carton',100301,38,7,38,7,38,7,'2025-11-06 22:15:48','2025-11-18 21:51:53');
/*!40000 ALTER TABLE `raffle_activity_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `raffle_activity_account_day`
--

DROP TABLE IF EXISTS `raffle_activity_account_day`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `raffle_activity_account_day` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `user_id` varchar(32) NOT NULL COMMENT '用户ID',
  `activity_id` bigint NOT NULL COMMENT '活动ID',
  `day` varchar(10) NOT NULL COMMENT '日期（yyyy-mm-dd）',
  `day_count` int NOT NULL COMMENT '日次数',
  `day_count_surplus` int NOT NULL COMMENT '日次数-剩余',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_user_id_activity_id_day` (`user_id`,`activity_id`,`day`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='抽奖活动账户表-日次数';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `raffle_activity_account_day`
--

LOCK TABLES `raffle_activity_account_day` WRITE;
/*!40000 ALTER TABLE `raffle_activity_account_day` DISABLE KEYS */;
INSERT INTO `raffle_activity_account_day` VALUES (1,'carton',100301,'2025-11-10',38,36,'2025-11-10 23:54:41','2025-11-10 23:59:54'),(2,'carton',100301,'2025-11-11',38,35,'2025-11-11 10:25:47','2025-11-11 10:25:47'),(3,'carton',100301,'2025-11-13',38,29,'2025-11-13 23:20:25','2025-11-13 23:32:23'),(4,'carton',100301,'2025-11-17',10,2,'2025-11-17 16:20:40','2025-11-17 17:10:30');
/*!40000 ALTER TABLE `raffle_activity_account_day` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `raffle_activity_account_month`
--

DROP TABLE IF EXISTS `raffle_activity_account_month`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `raffle_activity_account_month` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `user_id` varchar(32) NOT NULL COMMENT '用户ID',
  `activity_id` bigint NOT NULL COMMENT '活动ID',
  `month` varchar(7) NOT NULL COMMENT '月（yyyy-mm）',
  `month_count` int NOT NULL COMMENT '月次数',
  `month_count_surplus` int NOT NULL COMMENT '月次数-剩余',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_user_id_activity_id_month` (`user_id`,`activity_id`,`month`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='抽奖活动账户表-月次数';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `raffle_activity_account_month`
--

LOCK TABLES `raffle_activity_account_month` WRITE;
/*!40000 ALTER TABLE `raffle_activity_account_month` DISABLE KEYS */;
INSERT INTO `raffle_activity_account_month` VALUES (1,'carton',100301,'2025-11',38,7,'2025-11-10 23:54:41','2025-11-18 21:51:53');
/*!40000 ALTER TABLE `raffle_activity_account_month` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `raffle_activity_order_000`
--

DROP TABLE IF EXISTS `raffle_activity_order_000`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `raffle_activity_order_000` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `user_id` varchar(32) NOT NULL COMMENT '用户ID',
  `sku` bigint NOT NULL COMMENT '商品sku',
  `activity_id` bigint NOT NULL COMMENT '活动ID',
  `activity_name` varchar(64) NOT NULL COMMENT '活动名称',
  `strategy_id` bigint NOT NULL COMMENT '抽奖策略ID',
  `order_id` varchar(12) NOT NULL COMMENT '订单ID',
  `order_time` datetime NOT NULL COMMENT '下单时间',
  `total_count` int NOT NULL COMMENT '总次数',
  `day_count` int NOT NULL COMMENT '日次数',
  `month_count` int NOT NULL COMMENT '月次数',
  `state` varchar(16) NOT NULL DEFAULT 'complete' COMMENT '订单状态（complete）',
  `out_business_no` varchar(64) NOT NULL COMMENT '业务仿重ID - 外部透传的，确保幂等',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_order_id` (`order_id`),
  UNIQUE KEY `uq_out_business_no` (`out_business_no`),
  KEY `idx_user_id_activity_id` (`user_id`,`activity_id`,`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='抽奖活动单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `raffle_activity_order_000`
--

LOCK TABLES `raffle_activity_order_000` WRITE;
/*!40000 ALTER TABLE `raffle_activity_order_000` DISABLE KEYS */;
/*!40000 ALTER TABLE `raffle_activity_order_000` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `raffle_activity_order_001`
--

DROP TABLE IF EXISTS `raffle_activity_order_001`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `raffle_activity_order_001` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `user_id` varchar(32) NOT NULL COMMENT '用户ID',
  `sku` bigint NOT NULL COMMENT '商品sku',
  `activity_id` bigint NOT NULL COMMENT '活动ID',
  `activity_name` varchar(64) NOT NULL COMMENT '活动名称',
  `strategy_id` bigint NOT NULL COMMENT '抽奖策略ID',
  `order_id` varchar(12) NOT NULL COMMENT '订单ID',
  `order_time` datetime NOT NULL COMMENT '下单时间',
  `total_count` int NOT NULL COMMENT '总次数',
  `day_count` int NOT NULL COMMENT '日次数',
  `month_count` int NOT NULL COMMENT '月次数',
  `state` varchar(16) NOT NULL DEFAULT 'complete' COMMENT '订单状态（complete）',
  `out_business_no` varchar(64) NOT NULL COMMENT '业务仿重ID - 外部透传的，确保幂等',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_order_id` (`order_id`),
  UNIQUE KEY `uq_out_business_no` (`out_business_no`),
  KEY `idx_user_id_activity_id` (`user_id`,`activity_id`,`state`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='抽奖活动单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `raffle_activity_order_001`
--

LOCK TABLES `raffle_activity_order_001` WRITE;
/*!40000 ALTER TABLE `raffle_activity_order_001` DISABLE KEYS */;
INSERT INTO `raffle_activity_order_001` VALUES (1,'xiaofuge',9011,100301,'测试活动',10006,'648689973538','2025-11-06 12:55:34',1,1,1,'completed','501842504011','2025-11-06 20:55:34','2025-11-06 20:55:34'),(2,'xiaofuge',9011,100301,'测试活动',10006,'999388621912','2025-11-06 12:55:34',1,1,1,'completed','250858847204','2025-11-06 20:55:34','2025-11-06 20:55:34'),(3,'xiaofuge',9011,100301,'测试活动',10006,'847230189249','2025-11-06 12:55:34',1,1,1,'completed','859841858287','2025-11-06 20:55:34','2025-11-06 20:55:34'),(4,'xiaofuge',9011,100301,'测试活动',10006,'123225792049','2025-11-06 12:55:34',1,1,1,'completed','880659571535','2025-11-06 20:55:34','2025-11-06 20:55:34'),(5,'xiaofuge',9011,100301,'测试活动',10006,'473553648404','2025-11-06 12:55:34',1,1,1,'completed','545884435029','2025-11-06 20:55:34','2025-11-06 20:55:34'),(6,'xiaofuge',9011,100301,'测试活动',10006,'705176391106','2025-11-06 12:55:34',1,1,1,'completed','491805303301','2025-11-06 20:55:34','2025-11-06 20:55:34'),(7,'xiaofuge',9011,100301,'测试活动',10006,'462590728448','2025-11-06 12:55:34',1,1,1,'completed','938713520927','2025-11-06 20:55:34','2025-11-06 20:55:34'),(8,'xiaofuge',9011,100301,'测试活动',10006,'194287641422','2025-11-06 12:55:34',1,1,1,'completed','416040853587','2025-11-06 20:55:34','2025-11-06 20:55:34'),(9,'xiaofuge',9011,100301,'测试活动',10006,'717708933224','2025-11-06 12:55:34',1,1,1,'completed','375642902559','2025-11-06 20:55:34','2025-11-06 20:55:34'),(10,'xiaofuge',9011,100301,'测试活动',10006,'845165763460','2025-11-06 12:55:34',1,1,1,'completed','173992619925','2025-11-06 20:55:34','2025-11-06 20:55:34'),(11,'xiaofuge',9011,100301,'测试活动',10006,'716647385977','2025-11-06 12:55:34',1,1,1,'completed','250654366523','2025-11-06 20:55:34','2025-11-06 20:55:34'),(12,'xiaofuge',9011,100301,'测试活动',10006,'705080605759','2025-11-06 12:55:34',1,1,1,'completed','081327774109','2025-11-06 20:55:34','2025-11-06 20:55:34'),(13,'xiaofuge',9011,100301,'测试活动',10006,'960509649607','2025-11-06 12:55:34',1,1,1,'completed','590406418140','2025-11-06 20:55:34','2025-11-06 20:55:34'),(14,'xiaofuge',9011,100301,'测试活动',10006,'135167435476','2025-11-06 12:55:34',1,1,1,'completed','104800515896','2025-11-06 20:55:34','2025-11-06 20:55:34'),(15,'xiaofuge',9011,100301,'测试活动',10006,'884589110601','2025-11-06 12:55:34',1,1,1,'completed','628626772035','2025-11-06 20:55:34','2025-11-06 20:55:34'),(16,'xiaofuge',9011,100301,'测试活动',10006,'920479344163','2025-11-06 12:55:34',1,1,1,'completed','658949063561','2025-11-06 20:55:34','2025-11-06 20:55:34'),(17,'xiaofuge',9011,100301,'测试活动',10006,'961284249569','2025-11-06 12:55:34',1,1,1,'completed','844293134204','2025-11-06 20:55:34','2025-11-06 20:55:34'),(18,'xiaofuge',9011,100301,'测试活动',10006,'033330548724','2025-11-06 12:55:34',1,1,1,'completed','042515819729','2025-11-06 20:55:34','2025-11-06 20:55:34'),(19,'xiaofuge',9011,100301,'测试活动',10006,'168974943318','2025-11-10 16:02:43',1,1,1,'completed','886999370818','2025-11-11 00:02:42','2025-11-11 00:02:42'),(20,'xiaofuge',9011,100301,'测试活动',10006,'651080399424','2025-11-10 16:02:43',1,1,1,'completed','608993065792','2025-11-11 00:02:42','2025-11-11 00:02:42'),(21,'xiaofuge',9011,100301,'测试活动',10006,'068550860519','2025-11-10 16:02:43',1,1,1,'completed','155086176350','2025-11-11 00:02:42','2025-11-11 00:02:42'),(22,'xiaofuge',9011,100301,'测试活动',10006,'343378098460','2025-11-10 16:02:43',1,1,1,'completed','436879313038','2025-11-11 00:02:42','2025-11-11 00:02:42'),(23,'xiaofuge',9011,100301,'测试活动',10006,'033113530904','2025-11-10 16:02:43',1,1,1,'completed','929478068080','2025-11-11 00:02:42','2025-11-11 00:02:42'),(24,'xiaofuge',9011,100301,'测试活动',10006,'140307801303','2025-11-10 16:02:43',1,1,1,'completed','078290391777','2025-11-11 00:02:42','2025-11-11 00:02:42'),(25,'xiaofuge',9011,100301,'测试活动',10006,'351997585764','2025-11-10 16:02:43',1,1,1,'completed','293228575571','2025-11-11 00:02:43','2025-11-11 00:02:43'),(26,'xiaofuge',9011,100301,'测试活动',10006,'424227685538','2025-11-10 16:02:43',1,1,1,'completed','376691167743','2025-11-11 00:02:43','2025-11-11 00:02:43'),(27,'xiaofuge',9011,100301,'测试活动',10006,'065952434525','2025-11-10 16:02:43',1,1,1,'completed','815983700748','2025-11-11 00:02:43','2025-11-11 00:02:43'),(28,'xiaofuge',9011,100301,'测试活动',10006,'099938644606','2025-11-10 16:02:43',1,1,1,'completed','949200699366','2025-11-11 00:02:43','2025-11-11 00:02:43'),(29,'xiaofuge',9011,100301,'测试活动',10006,'027899476161','2025-11-10 16:02:43',1,1,1,'completed','570869933642','2025-11-11 00:02:43','2025-11-11 00:02:43'),(30,'xiaofuge',9011,100301,'测试活动',10006,'728017150847','2025-11-10 16:02:43',1,1,1,'completed','370780218942','2025-11-11 00:02:43','2025-11-11 00:02:43'),(31,'xiaofuge',9011,100301,'测试活动',10006,'266826856940','2025-11-10 16:02:43',1,1,1,'completed','904353558826','2025-11-11 00:02:43','2025-11-11 00:02:43'),(32,'xiaofuge',9011,100301,'测试活动',10006,'522068914117','2025-11-10 16:02:43',1,1,1,'completed','459199911750','2025-11-11 00:02:43','2025-11-11 00:02:43'),(33,'xiaofuge',9011,100301,'测试活动',10006,'834179303796','2025-11-10 16:02:43',1,1,1,'completed','062128250887','2025-11-11 00:02:43','2025-11-11 00:02:43'),(34,'xiaofuge',9011,100301,'测试活动',10006,'121773966767','2025-11-10 16:02:43',1,1,1,'completed','590442404820','2025-11-11 00:02:43','2025-11-11 00:02:43'),(35,'xiaofuge',9011,100301,'测试活动',10006,'450712672834','2025-11-10 16:02:43',1,1,1,'completed','456094821836','2025-11-11 00:02:43','2025-11-11 00:02:43'),(36,'xiaofuge',9011,100301,'测试活动',10006,'442306022474','2025-11-10 16:02:43',1,1,1,'completed','748382710011','2025-11-11 00:02:43','2025-11-11 00:02:43'),(37,'xiaofuge',9011,100301,'测试活动',10006,'242130765783','2025-11-10 16:02:43',1,1,1,'completed','896521842993','2025-11-11 00:02:43','2025-11-11 00:02:43');
/*!40000 ALTER TABLE `raffle_activity_order_001` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `raffle_activity_order_002`
--

DROP TABLE IF EXISTS `raffle_activity_order_002`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `raffle_activity_order_002` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `user_id` varchar(32) NOT NULL COMMENT '用户ID',
  `sku` bigint NOT NULL COMMENT '商品sku',
  `activity_id` bigint NOT NULL COMMENT '活动ID',
  `activity_name` varchar(64) NOT NULL COMMENT '活动名称',
  `strategy_id` bigint NOT NULL COMMENT '抽奖策略ID',
  `order_id` varchar(12) NOT NULL COMMENT '订单ID',
  `order_time` datetime NOT NULL COMMENT '下单时间',
  `total_count` int NOT NULL COMMENT '总次数',
  `day_count` int NOT NULL COMMENT '日次数',
  `month_count` int NOT NULL COMMENT '月次数',
  `state` varchar(16) NOT NULL DEFAULT 'complete' COMMENT '订单状态（complete）',
  `out_business_no` varchar(64) NOT NULL COMMENT '业务仿重ID - 外部透传的，确保幂等',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_order_id` (`order_id`),
  UNIQUE KEY `uq_out_business_no` (`out_business_no`),
  KEY `idx_user_id_activity_id` (`user_id`,`activity_id`,`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='抽奖活动单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `raffle_activity_order_002`
--

LOCK TABLES `raffle_activity_order_002` WRITE;
/*!40000 ALTER TABLE `raffle_activity_order_002` DISABLE KEYS */;
/*!40000 ALTER TABLE `raffle_activity_order_002` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `raffle_activity_order_003`
--

DROP TABLE IF EXISTS `raffle_activity_order_003`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `raffle_activity_order_003` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `user_id` varchar(32) NOT NULL COMMENT '用户ID',
  `sku` bigint NOT NULL COMMENT '商品sku',
  `activity_id` bigint NOT NULL COMMENT '活动ID',
  `activity_name` varchar(64) NOT NULL COMMENT '活动名称',
  `strategy_id` bigint NOT NULL COMMENT '抽奖策略ID',
  `order_id` varchar(12) NOT NULL COMMENT '订单ID',
  `order_time` datetime NOT NULL COMMENT '下单时间',
  `total_count` int NOT NULL COMMENT '总次数',
  `day_count` int NOT NULL COMMENT '日次数',
  `month_count` int NOT NULL COMMENT '月次数',
  `state` varchar(16) NOT NULL DEFAULT 'complete' COMMENT '订单状态（complete）',
  `out_business_no` varchar(64) NOT NULL COMMENT '业务仿重ID - 外部透传的，确保幂等',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_order_id` (`order_id`),
  UNIQUE KEY `uq_out_business_no` (`out_business_no`),
  KEY `idx_user_id_activity_id` (`user_id`,`activity_id`,`state`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='抽奖活动单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `raffle_activity_order_003`
--

LOCK TABLES `raffle_activity_order_003` WRITE;
/*!40000 ALTER TABLE `raffle_activity_order_003` DISABLE KEYS */;
INSERT INTO `raffle_activity_order_003` VALUES (1,'carton',9011,100301,'测试活动',10006,'933616234268','2025-11-06 14:15:07',1,1,1,'completed','252596575472','2025-11-06 22:15:48','2025-11-06 22:15:48'),(2,'carton',9011,100301,'测试活动',10006,'021400659845','2025-11-06 14:16:01',1,1,1,'completed','297560856284','2025-11-06 22:16:01','2025-11-06 22:16:01'),(3,'carton',9011,100301,'测试活动',10006,'060969445899','2025-11-06 14:16:01',1,1,1,'completed','928441790781','2025-11-06 22:16:01','2025-11-06 22:16:01'),(4,'carton',9011,100301,'测试活动',10006,'631233881380','2025-11-06 14:16:01',1,1,1,'completed','108892835285','2025-11-06 22:16:01','2025-11-06 22:16:01'),(5,'carton',9011,100301,'测试活动',10006,'874962784655','2025-11-06 14:16:01',1,1,1,'completed','843327328905','2025-11-06 22:16:01','2025-11-06 22:16:01'),(6,'carton',9011,100301,'测试活动',10006,'686326794054','2025-11-06 14:16:01',1,1,1,'completed','341310484515','2025-11-06 22:16:01','2025-11-06 22:16:01'),(7,'carton',9011,100301,'测试活动',10006,'166802649429','2025-11-06 14:16:01',1,1,1,'completed','405927220506','2025-11-06 22:16:01','2025-11-06 22:16:01'),(8,'carton',9011,100301,'测试活动',10006,'099975964083','2025-11-06 14:16:02',1,1,1,'completed','872523590565','2025-11-06 22:16:01','2025-11-06 22:16:01'),(9,'carton',9011,100301,'测试活动',10006,'720433699843','2025-11-06 14:16:02',1,1,1,'completed','349416281670','2025-11-06 22:16:01','2025-11-06 22:16:01'),(10,'carton',9011,100301,'测试活动',10006,'355599078603','2025-11-06 14:16:02',1,1,1,'completed','034377607294','2025-11-06 22:16:01','2025-11-06 22:16:01'),(11,'carton',9011,100301,'测试活动',10006,'325247218657','2025-11-06 14:16:02',1,1,1,'completed','466020848205','2025-11-06 22:16:01','2025-11-06 22:16:01'),(12,'carton',9011,100301,'测试活动',10006,'944181925389','2025-11-06 14:16:02',1,1,1,'completed','720031816388','2025-11-06 22:16:01','2025-11-06 22:16:01'),(13,'carton',9011,100301,'测试活动',10006,'767341414875','2025-11-06 14:16:02',1,1,1,'completed','937907450554','2025-11-06 22:16:01','2025-11-06 22:16:01'),(14,'carton',9011,100301,'测试活动',10006,'432347977940','2025-11-06 14:16:02',1,1,1,'completed','697490571456','2025-11-06 22:16:01','2025-11-06 22:16:01'),(15,'carton',9011,100301,'测试活动',10006,'276533465055','2025-11-06 14:16:02',1,1,1,'completed','413262036575','2025-11-06 22:16:01','2025-11-06 22:16:01'),(16,'carton',9011,100301,'测试活动',10006,'511366632931','2025-11-06 14:16:02',1,1,1,'completed','124063432998','2025-11-06 22:16:01','2025-11-06 22:16:01'),(17,'carton',9011,100301,'测试活动',10006,'665922976875','2025-11-06 14:16:02',1,1,1,'completed','103068374754','2025-11-06 22:16:01','2025-11-06 22:16:01'),(18,'carton',9011,100301,'测试活动',10006,'375242214904','2025-11-06 14:16:02',1,1,1,'completed','948095572824','2025-11-06 22:16:01','2025-11-06 22:16:01'),(19,'carton',9011,100301,'测试活动',10006,'483754372778','2025-11-06 14:16:02',1,1,1,'completed','213706458379','2025-11-06 22:16:01','2025-11-06 22:16:01'),(20,'carton',9011,100301,'测试活动',10006,'404455583157','2025-11-06 14:19:19',1,1,1,'completed','778623747686','2025-11-06 22:19:19','2025-11-06 22:19:19'),(21,'carton',9011,100301,'测试活动',10006,'057133787246','2025-11-06 14:19:19',1,1,1,'completed','010989561412','2025-11-06 22:19:19','2025-11-06 22:19:19'),(22,'carton',9011,100301,'测试活动',10006,'929235858621','2025-11-06 14:19:19',1,1,1,'completed','837792280339','2025-11-06 22:19:19','2025-11-06 22:19:19'),(23,'carton',9011,100301,'测试活动',10006,'232374464929','2025-11-06 14:19:19',1,1,1,'completed','833445690793','2025-11-06 22:19:19','2025-11-06 22:19:19'),(24,'carton',9011,100301,'测试活动',10006,'545002029307','2025-11-06 14:19:19',1,1,1,'completed','692366467403','2025-11-06 22:19:19','2025-11-06 22:19:19'),(25,'carton',9011,100301,'测试活动',10006,'284497666606','2025-11-06 14:19:19',1,1,1,'completed','430040476955','2025-11-06 22:19:19','2025-11-06 22:19:19'),(26,'carton',9011,100301,'测试活动',10006,'859022598089','2025-11-06 14:19:19',1,1,1,'completed','892748074894','2025-11-06 22:19:19','2025-11-06 22:19:19'),(27,'carton',9011,100301,'测试活动',10006,'169570040825','2025-11-06 14:19:19',1,1,1,'completed','161179744671','2025-11-06 22:19:19','2025-11-06 22:19:19'),(28,'carton',9011,100301,'测试活动',10006,'986070353809','2025-11-06 14:19:19',1,1,1,'completed','391219546061','2025-11-06 22:19:19','2025-11-06 22:19:19'),(29,'carton',9011,100301,'测试活动',10006,'321509643196','2025-11-06 14:19:19',1,1,1,'completed','958796272373','2025-11-06 22:19:19','2025-11-06 22:19:19'),(30,'carton',9011,100301,'测试活动',10006,'602573243605','2025-11-06 14:19:19',1,1,1,'completed','986108684177','2025-11-06 22:19:19','2025-11-06 22:19:19'),(31,'carton',9011,100301,'测试活动',10006,'130564811239','2025-11-06 14:19:19',1,1,1,'completed','174168394599','2025-11-06 22:19:19','2025-11-06 22:19:19'),(32,'carton',9011,100301,'测试活动',10006,'043295421151','2025-11-06 14:19:19',1,1,1,'completed','446451724637','2025-11-06 22:19:19','2025-11-06 22:19:19'),(33,'carton',9011,100301,'测试活动',10006,'466230130075','2025-11-06 14:19:19',1,1,1,'completed','480002934172','2025-11-06 22:19:19','2025-11-06 22:19:19'),(34,'carton',9011,100301,'测试活动',10006,'994413693684','2025-11-06 14:19:19',1,1,1,'completed','020709439285','2025-11-06 22:19:19','2025-11-06 22:19:19'),(35,'carton',9011,100301,'测试活动',10006,'745665412723','2025-11-06 14:19:19',1,1,1,'completed','615331809934','2025-11-06 22:19:19','2025-11-06 22:19:19'),(36,'carton',9011,100301,'测试活动',10006,'911865586373','2025-11-06 14:19:19',1,1,1,'completed','547930537847','2025-11-06 22:19:19','2025-11-06 22:19:19'),(37,'carton',9011,100301,'测试活动',10006,'189744770711','2025-11-06 14:19:20',1,1,1,'completed','634210090473','2025-11-06 22:19:19','2025-11-06 22:19:19'),(38,'carton',9011,100301,'测试活动',10006,'493716657693','2025-11-06 14:19:20',1,1,1,'completed','872584993610','2025-11-06 22:19:19','2025-11-06 22:19:19');
/*!40000 ALTER TABLE `raffle_activity_order_003` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `user_id` varchar(32) NOT NULL COMMENT '用户ID',
  `topic` varchar(32) NOT NULL COMMENT '消息主题',
  `message_id` varchar(11) DEFAULT NULL COMMENT '消息编号',
  `message` varchar(512) NOT NULL COMMENT '消息主体',
  `state` varchar(16) NOT NULL DEFAULT 'create' COMMENT '任务状态；create-创建、completed-完成、fail-失败',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_message_id` (`message_id`),
  KEY `idx_state` (`state`),
  KEY `idx_create_time` (`update_time`)
) ENGINE=InnoDB AUTO_INCREMENT=228 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='任务表，发送MQ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
INSERT INTO `task` VALUES (179,'carton','send_award','56396776155','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"carton\"},\"id\":\"56396776155\",\"timestamp\":1762949273098}','completed','2025-11-12 20:07:52','2025-11-12 20:07:53'),(180,'carton','send_award','88818515693','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"carton\"},\"id\":\"88818515693\",\"timestamp\":1762949274466}','completed','2025-11-12 20:07:53','2025-11-12 20:07:53'),(181,'carton','send_award','21651513306','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"carton\"},\"id\":\"21651513306\",\"timestamp\":1762949274996}','completed','2025-11-12 20:07:54','2025-11-12 20:07:54'),(182,'carton','send_award','24041612080','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"carton\"},\"id\":\"24041612080\",\"timestamp\":1762949275533}','completed','2025-11-12 20:07:54','2025-11-12 20:07:54'),(183,'carton','send_award','91074254039','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"carton\"},\"id\":\"91074254039\",\"timestamp\":1762949276063}','completed','2025-11-12 20:07:55','2025-11-12 20:07:55'),(184,'carton','send_award','93571306148','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"carton\"},\"id\":\"93571306148\",\"timestamp\":1762949276592}','completed','2025-11-12 20:07:55','2025-11-12 20:07:55'),(185,'carton','send_award','88228829509','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"carton\"},\"id\":\"88228829509\",\"timestamp\":1762949277119}','completed','2025-11-12 20:07:56','2025-11-12 20:07:56'),(186,'carton','send_award','14039250220','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"carton\"},\"id\":\"14039250220\",\"timestamp\":1762949277661}','completed','2025-11-12 20:07:57','2025-11-12 20:07:57'),(187,'carton','send_award','22226771693','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"carton\"},\"id\":\"22226771693\",\"timestamp\":1762949278192}','completed','2025-11-12 20:07:57','2025-11-12 20:07:57'),(188,'carton','send_award','91545054243','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"carton\"},\"id\":\"91545054243\",\"timestamp\":1762949278718}','completed','2025-11-12 20:07:58','2025-11-12 20:07:58'),(189,'carton','send_award','15291818997','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"carton\"},\"id\":\"15291818997\",\"timestamp\":1762949279245}','completed','2025-11-12 20:07:58','2025-11-12 20:07:58'),(190,'carton','send_award','31783168894','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"carton\"},\"id\":\"31783168894\",\"timestamp\":1762949279766}','completed','2025-11-12 20:07:59','2025-11-12 20:07:59'),(191,'carton','send_award','01218063933','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"carton\"},\"id\":\"01218063933\",\"timestamp\":1762949280299}','completed','2025-11-12 20:07:59','2025-11-12 20:07:59'),(192,'carton','send_award','37757482093','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"carton\"},\"id\":\"37757482093\",\"timestamp\":1762949280856}','completed','2025-11-12 20:08:00','2025-11-12 20:08:00'),(193,'carton','send_award','83150753527','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"carton\"},\"id\":\"83150753527\",\"timestamp\":1762949281384}','completed','2025-11-12 20:08:01','2025-11-12 20:08:01'),(194,'carton','send_award','19978372296','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"carton\"},\"id\":\"19978372296\",\"timestamp\":1762949281928}','completed','2025-11-12 20:08:01','2025-11-12 20:08:01'),(195,'carton','send_award','29378949726','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"carton\"},\"id\":\"29378949726\",\"timestamp\":1762949282469}','completed','2025-11-12 20:08:02','2025-11-12 20:08:02'),(196,'carton','send_award','44151591503','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"carton\"},\"id\":\"44151591503\",\"timestamp\":1762949282998}','completed','2025-11-12 20:08:02','2025-11-12 20:09:24'),(197,'carton','send_award','61085532983','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"carton\"},\"id\":\"61085532983\",\"timestamp\":1762949283528}','completed','2025-11-12 20:08:03','2025-11-12 20:09:24'),(198,'carton','send_award','48456002142','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"carton\"},\"id\":\"48456002142\",\"timestamp\":1762949284057}','completed','2025-11-12 20:08:04','2025-11-12 20:09:24'),(199,'carton','send_award','99843066436','{\"data\":{\"awardId\":108,\"awardTitle\":\"1等奖\",\"userId\":\"carton\"},\"id\":\"99843066436\",\"timestamp\":1763046326033}','completed','2025-11-13 23:05:22','2025-11-13 23:05:22'),(200,'carton','send_award','73514852476','{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"carton\"},\"id\":\"73514852476\",\"timestamp\":1763047224992}','completed','2025-11-13 23:20:26','2025-11-13 23:20:27'),(201,'carton','send_award','67549761119','{\"data\":{\"awardId\":102,\"awardTitle\":\"7等奖\",\"userId\":\"carton\"},\"id\":\"67549761119\",\"timestamp\":1763047929632}','completed','2025-11-13 23:32:08','2025-11-13 23:32:08'),(202,'carton','send_award','77368939952','{\"data\":{\"awardId\":105,\"awardTitle\":\"4等奖\",\"userId\":\"carton\"},\"id\":\"77368939952\",\"timestamp\":1763047937024}','completed','2025-11-13 23:32:15','2025-11-13 23:32:16'),(203,'carton','send_award','20798489758','{\"data\":{\"awardId\":102,\"awardTitle\":\"7等奖\",\"userId\":\"carton\"},\"id\":\"20798489758\",\"timestamp\":1763047942674}','completed','2025-11-13 23:32:19','2025-11-13 23:32:19'),(204,'carton','send_award','36708639187','{\"data\":{\"awardId\":103,\"awardTitle\":\"6等奖\",\"userId\":\"carton\"},\"id\":\"36708639187\",\"timestamp\":1763047944747}','completed','2025-11-13 23:32:22','2025-11-13 23:32:22'),(205,'carton','send_award','65087223970','{\"data\":{\"awardId\":106,\"awardTitle\":\"3等奖\",\"userId\":\"carton\"},\"id\":\"65087223970\",\"timestamp\":1763047946372}','completed','2025-11-13 23:32:23','2025-11-13 23:32:23'),(206,'carton','send_award','70339338609','{\"data\":{\"awardId\":106,\"awardTitle\":\"3等奖\",\"userId\":\"carton\"},\"id\":\"70339338609\",\"timestamp\":1763370629901}','completed','2025-11-17 17:10:30','2025-11-17 17:10:30'),(207,'carton','send_award','68793286939','{\"data\":{\"awardId\":105,\"awardTitle\":\"小米su7周体验\",\"userId\":\"carton\"},\"id\":\"68793286939\",\"timestamp\":1763456180155}','completed','2025-11-18 16:56:20','2025-11-18 16:56:20'),(208,'carton','send_award','18592142490','{\"data\":{\"awardId\":108,\"awardTitle\":\"暴走玩偶\",\"userId\":\"carton\"},\"id\":\"18592142490\",\"timestamp\":1763456209006}','completed','2025-11-18 16:56:48','2025-11-18 16:56:48'),(209,'carton','send_award','55329565632','{\"data\":{\"awardId\":108,\"awardTitle\":\"暴走玩偶\",\"userId\":\"carton\"},\"id\":\"55329565632\",\"timestamp\":1763467019821}','completed','2025-11-18 19:57:00','2025-11-18 19:57:00'),(210,'carton','send_award','28033293752','{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"carton\"},\"id\":\"28033293752\",\"timestamp\":1763467359991}','completed','2025-11-18 20:02:40','2025-11-18 20:02:40'),(211,'carton','send_award','12307319851','{\"data\":{\"awardId\":104,\"awardTitle\":\"小米台灯\",\"userId\":\"carton\"},\"id\":\"12307319851\",\"timestamp\":1763467579913}','completed','2025-11-18 20:06:19','2025-11-18 20:06:19'),(212,'carton','send_award','82376374166','{\"data\":{\"awardId\":103,\"awardTitle\":\"支付优惠卷\",\"userId\":\"carton\"},\"id\":\"82376374166\",\"timestamp\":1763467596807}','completed','2025-11-18 20:06:36','2025-11-18 20:06:36'),(213,'carton','send_award','41584256251','{\"data\":{\"awardId\":108,\"awardTitle\":\"暴走玩偶\",\"userId\":\"carton\"},\"id\":\"41584256251\",\"timestamp\":1763467608641}','completed','2025-11-18 20:06:48','2025-11-18 20:06:48'),(214,'carton','send_award','02577102927','{\"data\":{\"awardId\":107,\"awardTitle\":\"小霸王游戏机\",\"userId\":\"carton\"},\"id\":\"02577102927\",\"timestamp\":1763468334033}','completed','2025-11-18 20:18:53','2025-11-18 20:18:53'),(215,'carton','send_award','91494547895','{\"data\":{\"awardId\":106,\"awardTitle\":\"轻奢办公椅\",\"userId\":\"carton\"},\"id\":\"91494547895\",\"timestamp\":1763468796153}','completed','2025-11-18 20:42:41','2025-11-18 20:42:42'),(216,'carton','send_award','35236410492','{\"data\":{\"awardId\":104,\"awardTitle\":\"小米台灯\",\"userId\":\"carton\"},\"id\":\"35236410492\",\"timestamp\":1763470115031}','completed','2025-11-18 20:48:35','2025-11-18 20:53:14'),(217,'carton','send_award','63548327984','{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"carton\"},\"id\":\"63548327984\",\"timestamp\":1763471441484}','completed','2025-11-18 21:10:41','2025-11-18 21:10:41'),(218,'carton','send_award','06350827498','{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"carton\"},\"id\":\"06350827498\",\"timestamp\":1763471456014}','completed','2025-11-18 21:10:56','2025-11-18 21:10:56'),(219,'carton','send_award','51425162895','{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"carton\"},\"id\":\"51425162895\",\"timestamp\":1763471465967}','completed','2025-11-18 21:11:05','2025-11-18 21:11:05'),(220,'carton','send_award','87655564338','{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"carton\"},\"id\":\"87655564338\",\"timestamp\":1763471474518}','completed','2025-11-18 21:11:14','2025-11-18 21:11:14'),(221,'carton','send_award','92386935869','{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"carton\"},\"id\":\"92386935869\",\"timestamp\":1763471627242}','completed','2025-11-18 21:13:47','2025-11-18 21:13:47'),(222,'carton','send_award','20659101503','{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"carton\"},\"id\":\"20659101503\",\"timestamp\":1763471794446}','completed','2025-11-18 21:16:35','2025-11-18 21:16:35'),(223,'carton','send_award','71616578947','{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"carton\"},\"id\":\"71616578947\",\"timestamp\":1763472335072}','completed','2025-11-18 21:25:35','2025-11-18 21:25:35'),(224,'carton','send_award','62436399250','{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"carton\"},\"id\":\"62436399250\",\"timestamp\":1763472779905}','completed','2025-11-18 21:33:00','2025-11-18 21:33:00'),(225,'carton','send_award','22297650243','{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"carton\"},\"id\":\"22297650243\",\"timestamp\":1763473455867}','completed','2025-11-18 21:44:16','2025-11-18 21:44:16'),(226,'carton','send_award','43964865995','{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"carton\"},\"id\":\"43964865995\",\"timestamp\":1763473617612}','completed','2025-11-18 21:46:57','2025-11-18 21:46:57'),(227,'carton','send_award','89544716342','{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"carton\"},\"id\":\"89544716342\",\"timestamp\":1763474091327}','completed','2025-11-18 21:54:51','2025-11-18 21:54:51');
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_award_record_000`
--

DROP TABLE IF EXISTS `user_award_record_000`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_award_record_000` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `user_id` varchar(32) NOT NULL COMMENT '用户ID',
  `activity_id` bigint NOT NULL COMMENT '活动ID',
  `strategy_id` bigint NOT NULL COMMENT '抽奖策略ID',
  `order_id` varchar(12) NOT NULL COMMENT '抽奖订单ID【作为幂等使用】',
  `award_id` int NOT NULL COMMENT '奖品ID',
  `award_title` varchar(128) NOT NULL COMMENT '奖品标题（名称）',
  `award_time` datetime NOT NULL COMMENT '中奖时间',
  `award_state` varchar(16) NOT NULL DEFAULT 'create' COMMENT '奖品状态；create-创建、completed-发奖完成',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_order_id` (`order_id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_activity_id` (`activity_id`),
  KEY `idx_award_id` (`strategy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户中奖记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_award_record_000`
--

LOCK TABLES `user_award_record_000` WRITE;
/*!40000 ALTER TABLE `user_award_record_000` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_award_record_000` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_award_record_001`
--

DROP TABLE IF EXISTS `user_award_record_001`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_award_record_001` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `user_id` varchar(32) NOT NULL COMMENT '用户ID',
  `activity_id` bigint NOT NULL COMMENT '活动ID',
  `strategy_id` bigint NOT NULL COMMENT '抽奖策略ID',
  `order_id` varchar(12) NOT NULL COMMENT '抽奖订单ID【作为幂等使用】',
  `award_id` int NOT NULL COMMENT '奖品ID',
  `award_title` varchar(128) NOT NULL COMMENT '奖品标题（名称）',
  `award_time` datetime NOT NULL COMMENT '中奖时间',
  `award_state` varchar(16) NOT NULL DEFAULT 'create' COMMENT '奖品状态；create-创建、completed-发奖完成',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_order_id` (`order_id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_activity_id` (`activity_id`),
  KEY `idx_award_id` (`strategy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户中奖记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_award_record_001`
--

LOCK TABLES `user_award_record_001` WRITE;
/*!40000 ALTER TABLE `user_award_record_001` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_award_record_001` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_award_record_002`
--

DROP TABLE IF EXISTS `user_award_record_002`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_award_record_002` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `user_id` varchar(32) NOT NULL COMMENT '用户ID',
  `activity_id` bigint NOT NULL COMMENT '活动ID',
  `strategy_id` bigint NOT NULL COMMENT '抽奖策略ID',
  `order_id` varchar(12) NOT NULL COMMENT '抽奖订单ID【作为幂等使用】',
  `award_id` int NOT NULL COMMENT '奖品ID',
  `award_title` varchar(128) NOT NULL COMMENT '奖品标题（名称）',
  `award_time` datetime NOT NULL COMMENT '中奖时间',
  `award_state` varchar(16) NOT NULL DEFAULT 'create' COMMENT '奖品状态；create-创建、completed-发奖完成',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_order_id` (`order_id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_activity_id` (`activity_id`),
  KEY `idx_award_id` (`strategy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户中奖记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_award_record_002`
--

LOCK TABLES `user_award_record_002` WRITE;
/*!40000 ALTER TABLE `user_award_record_002` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_award_record_002` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_award_record_003`
--

DROP TABLE IF EXISTS `user_award_record_003`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_award_record_003` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `user_id` varchar(32) NOT NULL COMMENT '用户ID',
  `activity_id` bigint NOT NULL COMMENT '活动ID',
  `strategy_id` bigint NOT NULL COMMENT '抽奖策略ID',
  `order_id` varchar(12) NOT NULL COMMENT '抽奖订单ID【作为幂等使用】',
  `award_id` int NOT NULL COMMENT '奖品ID',
  `award_title` varchar(128) NOT NULL COMMENT '奖品标题（名称）',
  `award_time` datetime NOT NULL COMMENT '中奖时间',
  `award_state` varchar(16) NOT NULL DEFAULT 'create' COMMENT '奖品状态；create-创建、completed-发奖完成',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_order_id` (`order_id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_activity_id` (`activity_id`),
  KEY `idx_award_id` (`strategy_id`)
) ENGINE=InnoDB AUTO_INCREMENT=236 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户中奖记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_award_record_003`
--

LOCK TABLES `user_award_record_003` WRITE;
/*!40000 ALTER TABLE `user_award_record_003` DISABLE KEYS */;
INSERT INTO `user_award_record_003` VALUES (200,'carton',100301,10006,'583109062345',108,'1等奖','2025-11-13 15:05:26','create','2025-11-13 23:05:22','2025-11-13 23:05:22'),(207,'carton',100301,10006,'921821914872',101,'随机积分','2025-11-13 15:20:25','create','2025-11-13 23:20:26','2025-11-13 23:20:26'),(209,'carton',100301,10006,'091817072471',102,'7等奖','2025-11-13 15:32:10','create','2025-11-13 23:32:08','2025-11-13 23:32:08'),(210,'carton',100301,10006,'999487727146',105,'4等奖','2025-11-13 15:32:17','create','2025-11-13 23:32:15','2025-11-13 23:32:15'),(211,'carton',100301,10006,'592260842527',102,'7等奖','2025-11-13 15:32:23','create','2025-11-13 23:32:19','2025-11-13 23:32:19'),(212,'carton',100301,10006,'618804793836',103,'6等奖','2025-11-13 15:32:25','create','2025-11-13 23:32:22','2025-11-13 23:32:22'),(213,'carton',100301,10006,'875631768483',106,'3等奖','2025-11-13 15:32:26','create','2025-11-13 23:32:23','2025-11-13 23:32:23'),(214,'carton',100301,10006,'121832497604',106,'3等奖','2025-11-17 09:10:30','create','2025-11-17 17:10:30','2025-11-17 17:10:30'),(215,'carton',100301,10006,'765129441003',105,'小米su7周体验','2025-11-18 08:56:20','create','2025-11-18 16:56:20','2025-11-18 16:56:20'),(216,'carton',100301,10006,'841920213715',108,'暴走玩偶','2025-11-18 08:56:49','create','2025-11-18 16:56:48','2025-11-18 16:56:48'),(217,'carton',100301,10006,'085224781350',108,'暴走玩偶','2025-11-18 11:57:00','create','2025-11-18 19:57:00','2025-11-18 19:57:00'),(218,'carton',100301,10006,'583876766435',101,'随机积分','2025-11-18 12:02:40','create','2025-11-18 20:02:40','2025-11-18 20:02:40'),(219,'carton',100301,10006,'656315870392',104,'小米台灯','2025-11-18 12:06:20','create','2025-11-18 20:06:19','2025-11-18 20:06:19'),(220,'carton',100301,10006,'265818531092',103,'支付优惠卷','2025-11-18 12:06:37','create','2025-11-18 20:06:36','2025-11-18 20:06:36'),(221,'carton',100301,10006,'354426731801',108,'暴走玩偶','2025-11-18 12:06:49','create','2025-11-18 20:06:48','2025-11-18 20:06:48'),(222,'carton',100301,10006,'191941242068',107,'小霸王游戏机','2025-11-18 12:18:54','create','2025-11-18 20:18:53','2025-11-18 20:18:53'),(223,'carton',100301,10006,'668617566835',106,'轻奢办公椅','2025-11-18 12:26:08','create','2025-11-18 20:42:41','2025-11-18 20:42:41'),(224,'carton',100301,10006,'459714491845',104,'小米台灯','2025-11-18 12:48:35','create','2025-11-18 20:48:35','2025-11-18 20:48:35'),(225,'carton',100301,10006,'088278060358',101,'随机积分','2025-11-18 13:10:41','create','2025-11-18 21:10:41','2025-11-18 21:10:41'),(226,'carton',100301,10006,'784589480475',101,'随机积分','2025-11-18 13:10:56','create','2025-11-18 21:10:56','2025-11-18 21:10:56'),(227,'carton',100301,10006,'762633695438',101,'随机积分','2025-11-18 13:11:06','create','2025-11-18 21:11:05','2025-11-18 21:11:05'),(228,'carton',100301,10006,'711883253625',101,'随机积分','2025-11-18 13:11:15','create','2025-11-18 21:11:14','2025-11-18 21:11:14'),(229,'carton',100301,10006,'635931125379',101,'随机积分','2025-11-18 13:13:47','create','2025-11-18 21:13:47','2025-11-18 21:13:47'),(230,'carton',100301,10006,'247263150405',101,'随机积分','2025-11-18 13:16:34','create','2025-11-18 21:16:35','2025-11-18 21:16:35'),(231,'carton',100301,10006,'093086023032',101,'随机积分','2025-11-18 13:25:35','create','2025-11-18 21:25:35','2025-11-18 21:25:35'),(232,'carton',100301,10006,'340988914360',101,'随机积分','2025-11-18 13:33:00','create','2025-11-18 21:33:00','2025-11-18 21:33:00'),(233,'carton',100301,10006,'931341687220',101,'随机积分','2025-11-18 13:44:16','create','2025-11-18 21:44:16','2025-11-18 21:44:16'),(234,'carton',100301,10006,'173031469213',101,'随机积分','2025-11-18 13:46:58','create','2025-11-18 21:46:57','2025-11-18 21:46:57'),(235,'carton',100301,10006,'080208886280',101,'随机积分','2025-11-18 13:54:51','create','2025-11-18 21:54:51','2025-11-18 21:54:51');
/*!40000 ALTER TABLE `user_award_record_003` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_raffle_order_000`
--

DROP TABLE IF EXISTS `user_raffle_order_000`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_raffle_order_000` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(32) NOT NULL COMMENT '用户ID',
  `activity_id` bigint NOT NULL COMMENT '活动ID',
  `activity_name` varchar(64) NOT NULL COMMENT '活动名称',
  `strategy_id` bigint NOT NULL COMMENT '抽奖策略ID',
  `order_id` varchar(12) NOT NULL COMMENT '订单ID',
  `order_time` datetime NOT NULL COMMENT '下单时间',
  `order_state` varchar(16) NOT NULL DEFAULT 'create' COMMENT '订单状态；create-创建、used-已使用、cancel-已作废',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_order_id` (`order_id`),
  KEY `idx_user_id_activity_id` (`user_id`,`activity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户抽奖订单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_raffle_order_000`
--

LOCK TABLES `user_raffle_order_000` WRITE;
/*!40000 ALTER TABLE `user_raffle_order_000` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_raffle_order_000` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_raffle_order_001`
--

DROP TABLE IF EXISTS `user_raffle_order_001`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_raffle_order_001` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(32) NOT NULL COMMENT '用户ID',
  `activity_id` bigint NOT NULL COMMENT '活动ID',
  `activity_name` varchar(64) NOT NULL COMMENT '活动名称',
  `strategy_id` bigint NOT NULL COMMENT '抽奖策略ID',
  `order_id` varchar(12) NOT NULL COMMENT '订单ID',
  `order_time` datetime NOT NULL COMMENT '下单时间',
  `order_state` varchar(16) NOT NULL DEFAULT 'create' COMMENT '订单状态；create-创建、used-已使用、cancel-已作废',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_order_id` (`order_id`),
  KEY `idx_user_id_activity_id` (`user_id`,`activity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户抽奖订单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_raffle_order_001`
--

LOCK TABLES `user_raffle_order_001` WRITE;
/*!40000 ALTER TABLE `user_raffle_order_001` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_raffle_order_001` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_raffle_order_002`
--

DROP TABLE IF EXISTS `user_raffle_order_002`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_raffle_order_002` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(32) NOT NULL COMMENT '用户ID',
  `activity_id` bigint NOT NULL COMMENT '活动ID',
  `activity_name` varchar(64) NOT NULL COMMENT '活动名称',
  `strategy_id` bigint NOT NULL COMMENT '抽奖策略ID',
  `order_id` varchar(12) NOT NULL COMMENT '订单ID',
  `order_time` datetime NOT NULL COMMENT '下单时间',
  `order_state` varchar(16) NOT NULL DEFAULT 'create' COMMENT '订单状态；create-创建、used-已使用、cancel-已作废',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_order_id` (`order_id`),
  KEY `idx_user_id_activity_id` (`user_id`,`activity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户抽奖订单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_raffle_order_002`
--

LOCK TABLES `user_raffle_order_002` WRITE;
/*!40000 ALTER TABLE `user_raffle_order_002` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_raffle_order_002` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_raffle_order_003`
--

DROP TABLE IF EXISTS `user_raffle_order_003`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_raffle_order_003` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(32) NOT NULL COMMENT '用户ID',
  `activity_id` bigint NOT NULL COMMENT '活动ID',
  `activity_name` varchar(64) NOT NULL COMMENT '活动名称',
  `strategy_id` bigint NOT NULL COMMENT '抽奖策略ID',
  `order_id` varchar(12) NOT NULL COMMENT '订单ID',
  `order_time` datetime NOT NULL COMMENT '下单时间',
  `order_state` varchar(16) NOT NULL DEFAULT 'create' COMMENT '订单状态；create-创建、used-已使用、cancel-已作废',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_order_id` (`order_id`),
  KEY `idx_user_id_activity_id` (`user_id`,`activity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户抽奖订单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_raffle_order_003`
--

LOCK TABLES `user_raffle_order_003` WRITE;
/*!40000 ALTER TABLE `user_raffle_order_003` DISABLE KEYS */;
INSERT INTO `user_raffle_order_003` VALUES (1,'carton',100301,'测试活动',10006,'906787871338','2025-11-10 15:54:41','used','2025-11-10 23:54:41','2025-11-10 23:59:38'),(2,'carton',100301,'测试活动',10006,'745975862815','2025-11-10 15:59:54','used','2025-11-10 23:59:54','2025-11-11 10:21:41'),(5,'carton',100301,'测试活动',10006,'091817072471','2025-11-13 15:32:09','used','2025-11-13 23:32:07','2025-11-13 23:32:08'),(6,'carton',100301,'测试活动',10006,'999487727146','2025-11-13 15:32:17','used','2025-11-13 23:32:15','2025-11-13 23:32:15'),(7,'carton',100301,'测试活动',10006,'592260842527','2025-11-13 15:32:23','used','2025-11-13 23:32:19','2025-11-13 23:32:19'),(8,'carton',100301,'测试活动',10006,'618804793836','2025-11-13 15:32:25','used','2025-11-13 23:32:22','2025-11-13 23:32:22'),(9,'carton',100301,'测试活动',10006,'875631768483','2025-11-13 15:32:26','used','2025-11-13 23:32:23','2025-11-13 23:32:23'),(10,'carton',100301,'测试活动',10006,'121832497604','2025-11-17 09:10:29','used','2025-11-17 17:10:30','2025-11-17 17:10:30'),(11,'carton',100301,'测试活动',10006,'765129441003','2025-11-18 08:56:20','used','2025-11-18 16:56:19','2025-11-18 16:56:20'),(12,'carton',100301,'测试活动',10006,'841920213715','2025-11-18 08:56:49','used','2025-11-18 16:56:48','2025-11-18 16:56:48'),(13,'carton',100301,'测试活动',10006,'085224781350','2025-11-18 11:57:00','used','2025-11-18 19:57:00','2025-11-18 19:57:00'),(14,'carton',100301,'测试活动',10006,'583876766435','2025-11-18 12:02:40','used','2025-11-18 20:02:40','2025-11-18 20:02:40'),(15,'carton',100301,'测试活动',10006,'656315870392','2025-11-18 12:05:54','used','2025-11-18 20:05:54','2025-11-18 20:06:19'),(16,'carton',100301,'测试活动',10006,'265818531092','2025-11-18 12:06:37','used','2025-11-18 20:06:36','2025-11-18 20:06:36'),(17,'carton',100301,'测试活动',10006,'354426731801','2025-11-18 12:06:49','used','2025-11-18 20:06:48','2025-11-18 20:06:48'),(18,'carton',100301,'测试活动',10006,'191941242068','2025-11-18 12:18:39','used','2025-11-18 20:18:51','2025-11-18 20:18:53'),(19,'carton',100301,'测试活动',10006,'668617566835','2025-11-18 12:22:50','used','2025-11-18 20:22:52','2025-11-18 20:42:41'),(20,'carton',100301,'测试活动',10006,'459714491845','2025-11-18 12:43:44','used','2025-11-18 20:43:45','2025-11-18 20:48:35'),(21,'carton',100301,'测试活动',10006,'088278060358','2025-11-18 12:54:22','used','2025-11-18 20:54:24','2025-11-18 21:10:41'),(22,'carton',100301,'测试活动',10006,'784589480475','2025-11-18 13:10:56','used','2025-11-18 21:10:56','2025-11-18 21:10:56'),(23,'carton',100301,'测试活动',10006,'762633695438','2025-11-18 13:11:06','used','2025-11-18 21:11:05','2025-11-18 21:11:05'),(24,'carton',100301,'测试活动',10006,'711883253625','2025-11-18 13:11:14','used','2025-11-18 21:11:14','2025-11-18 21:11:14'),(25,'carton',100301,'测试活动',10006,'635931125379','2025-11-18 13:13:47','used','2025-11-18 21:13:47','2025-11-18 21:13:47'),(26,'carton',100301,'测试活动',10006,'247263150405','2025-11-18 13:16:34','used','2025-11-18 21:16:35','2025-11-18 21:16:35'),(27,'carton',100301,'测试活动',10006,'093086023032','2025-11-18 13:18:14','used','2025-11-18 21:18:14','2025-11-18 21:25:35'),(28,'carton',100301,'测试活动',10006,'340988914360','2025-11-18 13:26:31','used','2025-11-18 21:26:30','2025-11-18 21:33:00'),(29,'carton',100301,'测试活动',10006,'931341687220','2025-11-18 13:43:11','used','2025-11-18 21:43:11','2025-11-18 21:44:16'),(30,'carton',100301,'测试活动',10006,'173031469213','2025-11-18 13:44:31','used','2025-11-18 21:44:30','2025-11-18 21:46:57'),(31,'carton',100301,'测试活动',10006,'080208886280','2025-11-18 13:51:54','used','2025-11-18 21:51:53','2025-11-18 21:54:51');
/*!40000 ALTER TABLE `user_raffle_order_003` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-18 21:55:42
