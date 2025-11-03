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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='抽奖活动账户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `raffle_activity_account`
--

LOCK TABLES `raffle_activity_account` WRITE;
/*!40000 ALTER TABLE `raffle_activity_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `raffle_activity_account` ENABLE KEYS */;
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
  `activity_id` bigint NOT NULL COMMENT '活动ID',
  `activity_name` varchar(64) NOT NULL COMMENT '活动名称',
  `strategy_id` bigint NOT NULL COMMENT '抽奖策略ID',
  `order_id` varchar(12) NOT NULL COMMENT '订单ID',
  `order_time` datetime NOT NULL COMMENT '下单时间',
  `state` varchar(8) NOT NULL COMMENT '订单状态（not_used、used、expire）',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_order_id` (`order_id`),
  KEY `idx_user_id_activity_id` (`user_id`,`activity_id`,`state`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='抽奖活动单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `raffle_activity_order_000`
--

LOCK TABLES `raffle_activity_order_000` WRITE;
/*!40000 ALTER TABLE `raffle_activity_order_000` DISABLE KEYS */;
INSERT INTO `raffle_activity_order_000` VALUES (1,'ODRhfGEfX',100301,'测试活动',10006,'326676206786','2025-10-30 16:15:34','not_used','2025-10-31 00:15:33','2025-10-31 00:15:33'),(2,'IoTtOmcBeivNUYv',100301,'测试活动',10006,'135318759671','2025-10-30 16:15:34','not_used','2025-10-31 00:15:33','2025-10-31 00:15:33');
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
  `activity_id` bigint NOT NULL COMMENT '活动ID',
  `activity_name` varchar(64) NOT NULL COMMENT '活动名称',
  `strategy_id` bigint NOT NULL COMMENT '抽奖策略ID',
  `order_id` varchar(12) NOT NULL COMMENT '订单ID',
  `order_time` datetime NOT NULL COMMENT '下单时间',
  `state` varchar(8) NOT NULL COMMENT '订单状态（not_used、used、expire）',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_order_id` (`order_id`),
  KEY `idx_user_id_activity_id` (`user_id`,`activity_id`,`state`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='抽奖活动单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `raffle_activity_order_001`
--

LOCK TABLES `raffle_activity_order_001` WRITE;
/*!40000 ALTER TABLE `raffle_activity_order_001` DISABLE KEYS */;
INSERT INTO `raffle_activity_order_001` VALUES (1,'eOMtThyhVNLWUZNRcBaQKxI',100301,'测试活动',10006,'474069776047','2025-10-30 16:13:59','not_used','2025-10-31 00:13:59','2025-10-31 00:13:59'),(2,'xiaofuge',100301,'测试活动',10006,'067364394446','2025-10-30 16:14:56','not_used','2025-10-31 00:14:55','2025-10-31 00:14:55'),(3,'eOMtThyhVNLWUZNRcBaQKxI',100301,'测试活动',10006,'554928661369','2025-10-30 16:15:33','not_used','2025-10-31 00:15:33','2025-10-31 00:15:33'),(4,'gNfZBdyFGRajVfJNonEnOinZj',100301,'测试活动',10006,'468228618129','2025-10-30 16:15:34','not_used','2025-10-31 00:15:33','2025-10-31 00:15:33'),(5,'YdvDhtAsLghPXAgtbprXPZkhnfLTBSX',100301,'测试活动',10006,'945168355428','2025-10-30 16:15:34','not_used','2025-10-31 00:15:33','2025-10-31 00:15:33'),(6,'aofGvthLoyPLDADYzx',100301,'测试活动',10006,'376728775488','2025-10-30 16:15:34','not_used','2025-10-31 00:15:33','2025-10-31 00:15:33'),(7,'JkjHewSlMWOIVYZjIEB',100301,'测试活动',10006,'361150174582','2025-10-30 16:15:34','not_used','2025-10-31 00:15:33','2025-10-31 00:15:33'),(8,'WtKhlfZzDZ',100301,'测试活动',10006,'915625081749','2025-10-30 16:15:34','not_used','2025-10-31 00:15:33','2025-10-31 00:15:33');
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
  `activity_id` bigint NOT NULL COMMENT '活动ID',
  `activity_name` varchar(64) NOT NULL COMMENT '活动名称',
  `strategy_id` bigint NOT NULL COMMENT '抽奖策略ID',
  `order_id` varchar(12) NOT NULL COMMENT '订单ID',
  `order_time` datetime NOT NULL COMMENT '下单时间',
  `state` varchar(8) NOT NULL COMMENT '订单状态（not_used、used、expire）',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_order_id` (`order_id`),
  KEY `idx_user_id_activity_id` (`user_id`,`activity_id`,`state`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='抽奖活动单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `raffle_activity_order_002`
--

LOCK TABLES `raffle_activity_order_002` WRITE;
/*!40000 ALTER TABLE `raffle_activity_order_002` DISABLE KEYS */;
INSERT INTO `raffle_activity_order_002` VALUES (1,'yedUsFwdkelQbxeTeQOvaScfqIOOmaa',100301,'测试活动',10006,'159902855632','2025-10-30 16:14:00','not_used','2025-10-31 00:13:59','2025-10-31 00:13:59'),(2,'yedUsFwdkelQbxeTeQOvaScfqIOOmaa',100301,'测试活动',10006,'867974226591','2025-10-30 16:15:33','not_used','2025-10-31 00:15:33','2025-10-31 00:15:33'),(3,'UfzQhdgLLfDTDGspDb',100301,'测试活动',10006,'291497132737','2025-10-30 16:15:34','not_used','2025-10-31 00:15:33','2025-10-31 00:15:33'),(4,'AAAryjCRhLTuhnTodUewZQqaZErU',100301,'测试活动',10006,'036524573261','2025-10-30 16:15:34','not_used','2025-10-31 00:15:33','2025-10-31 00:15:33'),(5,'jNBgpTmxx',100301,'测试活动',10006,'508988337979','2025-10-30 16:15:34','not_used','2025-10-31 00:15:33','2025-10-31 00:15:33'),(6,'MFOPluIOMfSnzX',100301,'测试活动',10006,'946496542869','2025-10-30 16:15:34','not_used','2025-10-31 00:15:33','2025-10-31 00:15:33'),(7,'oBeMdQkAoYZDjfWhbzkmA',100301,'测试活动',10006,'049738273621','2025-10-30 16:15:34','not_used','2025-10-31 00:15:33','2025-10-31 00:15:33'),(8,'yybxVLsNlAeLWVhnIULZAyLBms',100301,'测试活动',10006,'258142794803','2025-10-30 16:15:34','not_used','2025-10-31 00:15:33','2025-10-31 00:15:33'),(9,'jzlglRKAeamYUmWJtnJZLqwakeYcea',100301,'测试活动',10006,'796494285312','2025-10-30 16:15:34','not_used','2025-10-31 00:15:33','2025-10-31 00:15:33'),(10,'xlpKnXmsjfwUTYgfExSOnq',100301,'测试活动',10006,'371429345484','2025-10-30 16:15:34','not_used','2025-10-31 00:15:33','2025-10-31 00:15:33');
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
  `activity_id` bigint NOT NULL COMMENT '活动ID',
  `activity_name` varchar(64) NOT NULL COMMENT '活动名称',
  `strategy_id` bigint NOT NULL COMMENT '抽奖策略ID',
  `order_id` varchar(12) NOT NULL COMMENT '订单ID',
  `order_time` datetime NOT NULL COMMENT '下单时间',
  `state` varchar(8) NOT NULL COMMENT '订单状态（not_used、used、expire）',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_order_id` (`order_id`),
  KEY `idx_user_id_activity_id` (`user_id`,`activity_id`,`state`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='抽奖活动单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `raffle_activity_order_003`
--

LOCK TABLES `raffle_activity_order_003` WRITE;
/*!40000 ALTER TABLE `raffle_activity_order_003` DISABLE KEYS */;
INSERT INTO `raffle_activity_order_003` VALUES (1,'Wru',100301,'测试活动',10006,'394960105576','2025-10-30 16:15:34','not_used','2025-10-31 00:15:33','2025-10-31 00:15:33'),(2,'NBaxYoMSiMNxLXFLxIok',100301,'测试活动',10006,'006415488650','2025-10-30 16:15:34','not_used','2025-10-31 00:15:33','2025-10-31 00:15:33'),(3,'DiACnbEKIFidn',100301,'测试活动',10006,'689543128028','2025-10-30 16:15:34','not_used','2025-10-31 00:15:33','2025-10-31 00:15:33'),(4,'AzTaco',100301,'测试活动',10006,'680680516752','2025-10-30 16:15:34','not_used','2025-10-31 00:15:33','2025-10-31 00:15:33'),(5,'LcdeWTdXPlQgjMVXbpRYzBT',100301,'测试活动',10006,'594806379189','2025-10-30 16:15:34','not_used','2025-10-31 00:15:33','2025-10-31 00:15:33'),(6,'veErKUBEqCrhrtgx',100301,'测试活动',10006,'936256706990','2025-10-30 16:15:34','not_used','2025-10-31 00:15:33','2025-10-31 00:15:33');
/*!40000 ALTER TABLE `raffle_activity_order_003` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-03 21:37:35
