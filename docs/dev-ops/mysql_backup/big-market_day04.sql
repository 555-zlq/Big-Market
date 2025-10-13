-- MySQL dump 10.13  Distrib 9.2.0, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: big_market
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

--
-- Table structure for table `award`
--

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

CREATE database if NOT EXISTS `big_market` default character set utf8mb4 collate utf8mb4_0900_ai_ci;
use `big_market`;

DROP TABLE IF EXISTS `award`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `award` (
                         `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
                         `award_id` int NOT NULL COMMENT '抽奖奖品ID - 内部流转使用',
                         `award_key` varchar(32) NOT NULL COMMENT '奖品对接标识 - 每一个都是一个对应的发奖策略',
                         `award_config` varchar(32) NOT NULL COMMENT '奖品配置信息',
                         `award_desc` varchar(128) NOT NULL COMMENT '奖品内容描述',
                         `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                         `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                         PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `award`
--

LOCK TABLES `award` WRITE;
/*!40000 ALTER TABLE `award` DISABLE KEYS */;
INSERT INTO `award` VALUES (1,101,'user_credit_random','1,100','用户积分【优先透彻规则范围，如果没有则走配置】','2023-12-09 11:07:06','2023-12-09 11:21:31'),(2,102,'openai_use_count','5','OpenAI 增加使用次数','2023-12-09 11:07:06','2023-12-09 11:12:59'),(3,103,'openai_use_count','10','OpenAI 增加使用次数','2023-12-09 11:07:06','2023-12-09 11:12:59'),(4,104,'openai_use_count','20','OpenAI 增加使用次数','2023-12-09 11:07:06','2023-12-09 11:12:58'),(5,105,'openai_model','gpt-4','OpenAI 增加模型','2023-12-09 11:07:06','2023-12-09 11:12:01'),(6,106,'openai_model','dall-e-2','OpenAI 增加模型','2023-12-09 11:07:06','2023-12-09 11:12:08'),(7,107,'openai_model','dall-e-3','OpenAI 增加模型','2023-12-09 11:07:06','2023-12-09 11:12:10'),(8,108,'openai_use_count','100','OpenAI 增加使用次数','2023-12-09 11:07:06','2023-12-09 11:12:55'),(9,109,'openai_model','gpt-4,dall-e-2,dall-e-3','OpenAI 增加模型','2023-12-09 11:07:06','2023-12-09 11:12:39'),(10,100,'user_credit_blacklist','1','黑名单积分','2025-10-10 10:31:51','2025-10-10 10:31:56');
/*!40000 ALTER TABLE `award` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strategy`
--

DROP TABLE IF EXISTS `strategy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `strategy` (
                            `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增索引',
                            `strategy_id` bigint NOT NULL COMMENT '抽奖策略id',
                            `strategy_desc` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '抽奖策略描述\r\n\r\n',
                            `create_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
                            `update_time` datetime NOT NULL COMMENT '更新时间\r\n',
                            `rule_models` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '策略模型',
                            PRIMARY KEY (`id` DESC) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strategy`
--

LOCK TABLES `strategy` WRITE;
/*!40000 ALTER TABLE `strategy` DISABLE KEYS */;
INSERT INTO `strategy` VALUES (1,10001,'抽奖策略A','2025-09-24 22:12:38','2025-09-24 21:15:19','rule_weight,rule_blacklist');
/*!40000 ALTER TABLE `strategy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strategy_award`
--

DROP TABLE IF EXISTS `strategy_award`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `strategy_award` (
                                  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
                                  `strategy_id` bigint NOT NULL COMMENT '抽奖策略id',
                                  `award_id` bigint NOT NULL COMMENT '抽奖奖品id',
                                  `award_title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '抽奖奖品title',
                                  `award_subtitle` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '抽奖奖品副标题',
                                  `award_count` int NOT NULL COMMENT '奖品库存总量',
                                  `award_count_surplus` int NOT NULL COMMENT '奖品库存剩余',
                                  `rule_models` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT ' 规则模型\r\n',
                                  `award_rate` decimal(6,4) NOT NULL COMMENT '奖品中奖概率',
                                  `create_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
                                  `update_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                  `sort` int NOT NULL COMMENT '奖品顺序',
                                  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strategy_award`
--

LOCK TABLES `strategy_award` WRITE;
/*!40000 ALTER TABLE `strategy_award` DISABLE KEYS */;
INSERT INTO `strategy_award` VALUES (1,10001,101,'随即积分',NULL,80000,80000,'rule_random',0.8000,'2025-10-08 19:23:42','2025-10-08 19:23:42',1),(2,10001,102,'5次使用',NULL,10000,10000,NULL,0.1000,'2025-10-08 19:23:42','2025-10-08 19:23:42',2),(3,10001,103,'10次使用',NULL,5000,5000,NULL,0.0500,'2025-10-08 19:23:42','2025-10-08 19:23:42',3),(4,10001,104,'20次使用',NULL,4000,4000,NULL,0.0400,'2025-10-08 19:23:42','2025-10-08 19:23:42',4),(5,10001,105,'增加gpt-4对话模型',NULL,400,400,NULL,0.0040,'2025-10-08 19:23:42','2025-10-08 19:23:42',5),(6,10001,106,'增加dall-e-2画图模型',NULL,200,200,NULL,0.0020,'2025-10-08 19:23:42','2025-10-08 19:23:42',6),(7,10001,107,'增加dall-e-3画图模型','抽奖1次后解锁',200,200,'rule_lock,rule_luck_award',0.0020,'2025-10-08 19:23:42','2025-10-08 19:23:42',7),(8,10001,108,'增加100次使用','抽奖2次后解锁',199,199,'rule_lock',0.0019,'2025-10-08 19:23:42','2025-10-08 19:23:42',8),(9,10001,109,'解锁全部模型','抽奖6次后解锁',1,1,'rule_lock',0.0001,'2025-09-24 21:55:45','2025-09-24 21:55:45',9);
/*!40000 ALTER TABLE `strategy_award` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strategy_rule`
--

DROP TABLE IF EXISTS `strategy_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `strategy_rule` (
                                 `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
                                 `strategy_id` bigint NOT NULL COMMENT '策略id',
                                 `award_id` bigint DEFAULT NULL COMMENT '奖品id',
                                 `rule_type` int NOT NULL DEFAULT '0' COMMENT '抽奖规则类型【1-策略规则，2-奖品规则】',
                                 `rule_model` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '抽奖规则类型【rule_lock】',
                                 `rule_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '抽奖规则比值',
                                 `rule_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '抽奖规则描述',
                                 `create_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
                                 `update_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                 PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strategy_rule`
--

LOCK TABLES `strategy_rule` WRITE;
/*!40000 ALTER TABLE `strategy_rule` DISABLE KEYS */;
INSERT INTO `strategy_rule` VALUES (1,10001,101,2,'rule_random','1,1000','随即积分策略','2025-09-24 21:39:55','2025-09-24 21:39:57'),(2,10001,107,2,'rule_lock','1','抽奖1次后解锁','2025-09-24 21:41:56','2025-09-24 21:42:00'),(3,10001,108,2,'rule_lock','2','抽奖2次后解锁','2025-09-24 21:42:50','2025-09-24 21:42:52'),(4,10001,109,2,'rule_lock','6','抽奖6次后解锁','2025-09-24 21:43:35','2025-09-24 21:43:37'),(5,10001,107,2,'rule_luck_award','1,100','兜底奖品100以内随机积分','2025-10-10 11:07:50','2025-10-10 11:07:50'),(6,10001,NULL,1,'rule_weight','4000:102,103,104,105 5000:102,103,104,105,106 6000:102,103,104,105,106,107,108,109','消耗6000分，必中奖范围','2025-10-09 10:35:25','2025-10-09 10:35:25'),(7,10001,NULL,1,'rule_blacklist','100:user001,user002,user003','黑名单抽奖，积分兜底','2025-10-10 10:30:42','2025-10-10 10:30:42'),(8,10001,108,2,'rule_luck_award','1,100','兜底奖品100以内随机积分','2025-10-10 11:03:20','2025-10-10 11:03:22'),(9,10001,101,2,'rule_luck_award','1,10','兜底奖品10以内随机积分','2025-10-10 11:03:20','2025-10-10 11:03:22'),(10,10001,102,2,'rule_luck_award','1,20','兜底奖品20以内随机积分','2025-10-10 11:03:20','2025-10-10 11:03:22'),(11,10001,103,2,'rule_luck_award','1,30','兜底奖品30以内随机积分','2025-10-10 11:03:20','2025-10-10 11:03:22'),(12,10001,104,2,'rule_luck_award','1,40','兜底奖品40以内随机积分','2025-10-10 11:03:20','2025-10-10 11:03:22'),(13,10001,105,2,'rule_luck_award','1,50','兜底奖品50以内随机积分','2025-10-10 11:03:20','2025-10-10 11:03:22'),(14,10001,106,2,'rule_luck_award','1,60','兜底奖品60以内随机积分','2025-10-10 11:03:20','2025-10-10 11:03:22');
/*!40000 ALTER TABLE `strategy_rule` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-11 16:55:03
