/*
 Navicat Premium Dump SQL

 Source Server         : test
 Source Server Type    : MySQL
 Source Server Version : 90200 (9.2.0)
 Source Host           : localhost:3306
 Source Schema         : big-market

 Target Server Type    : MySQL
 Target Server Version : 90200 (9.2.0)
 File Encoding         : 65001

 Date: 24/09/2025 22:51:30
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

CREATE database if NOT EXISTS `big_market` default character set utf8mb4 collate utf8mb4_0900_ai_ci;
use `big_market`;
-- ----------------------------
-- Table structure for strategy
-- ----------------------------
DROP TABLE IF EXISTS `strategy`;
CREATE TABLE `strategy`  (
                             `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增索引',
                             `strategy_id` bigint NOT NULL COMMENT '抽奖策略id',
                             `strategy_desc` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '抽奖策略描述\r\n\r\n',
                             `create_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
                             `update_time` datetime NOT NULL COMMENT '更新时间\r\n',
                             `rule_models` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '策略模型',
                             PRIMARY KEY (`id` DESC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of strategy
-- ----------------------------
INSERT INTO `strategy` VALUES (1, 10001, '抽奖策略A', '2025-09-24 22:12:38', '2025-09-24 21:15:19', 'rule_weight,rule_blacklist');

-- ----------------------------
-- Table structure for strategy_award
-- ----------------------------
DROP TABLE IF EXISTS `strategy_award`;
CREATE TABLE `strategy_award`  (
                                   `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
                                   `strategy_id` bigint NOT NULL COMMENT '抽奖策略id',
                                   `award_id` bigint NOT NULL COMMENT '抽奖奖品id',
                                   `award_title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '抽奖奖品title',
                                   `award_subtitle` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '抽奖奖品副标题',
                                   `award_count` int NOT NULL COMMENT '奖品库存总量',
                                   `award_count_surplus` int NOT NULL COMMENT '奖品库存剩余',
                                   `rule_models` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT ' 规则模型\r\n',
                                   `award_rate` decimal(6, 4) NOT NULL COMMENT '奖品中奖概率',
                                   `create_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
                                   `update_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                   `sort` int NOT NULL COMMENT '奖品顺序',
                                   PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of strategy_award
-- ----------------------------
INSERT INTO `strategy_award` VALUES (1, 10001, 101, '随即积分', NULL, 80000, 80000, 'rule_random', 80.0000, '2025-09-24 21:54:58', '2025-09-24 21:54:58', 1);
INSERT INTO `strategy_award` VALUES (2, 10001, 102, '5次使用', NULL, 10000, 10000, NULL, 10.0000, '2025-09-24 21:27:40', '2025-09-24 21:27:43', 2);
INSERT INTO `strategy_award` VALUES (3, 10001, 103, '10次使用', NULL, 5000, 5000, NULL, 5.0000, '2025-09-24 21:28:25', '2025-09-24 21:28:29', 3);
INSERT INTO `strategy_award` VALUES (4, 10001, 104, '20次使用', NULL, 4000, 4000, NULL, 4.0000, '2025-09-24 21:29:05', '2025-09-24 21:29:08', 4);
INSERT INTO `strategy_award` VALUES (5, 10001, 105, '增加gpt-4对话模型', NULL, 400, 400, NULL, 0.6000, '2025-09-24 21:38:51', '2025-09-24 21:38:51', 5);
INSERT INTO `strategy_award` VALUES (6, 10001, 106, '增加dall-e-2画图模型', NULL, 200, 200, NULL, 0.2000, '2025-09-24 21:31:18', '2025-09-24 21:31:21', 6);
INSERT INTO `strategy_award` VALUES (7, 10001, 107, '增加dall-e-3画图模型', '抽奖1次后解锁', 200, 200, 'rule_lock,rule_luck_award', 0.1999, '2025-09-24 22:04:11', '2025-09-24 22:04:11', 7);
INSERT INTO `strategy_award` VALUES (8, 10001, 108, '增加100次使用', '抽奖2次后解锁', 199, 199, 'rule_lock', 0.1999, '2025-09-24 21:55:42', '2025-09-24 21:55:42', 8);
INSERT INTO `strategy_award` VALUES (9, 10001, 109, '解锁全部模型', '抽奖6次后解锁', 1, 1, 'rule_lock', 0.0001, '2025-09-24 21:55:45', '2025-09-24 21:55:45', 9);

-- ----------------------------
-- Table structure for strategy_rule
-- ----------------------------
DROP TABLE IF EXISTS `strategy_rule`;
CREATE TABLE `strategy_rule`  (
                                  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
                                  `strategy_id` bigint NOT NULL COMMENT '策略id',
                                  `award_id` bigint NULL DEFAULT NULL COMMENT '奖品id',
                                  `rule_type` int NOT NULL DEFAULT 0 COMMENT '抽奖规则类型【1-策略规则，2-奖品规则】',
                                  `rule_model` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '抽奖规则类型【rule_lock】',
                                  `rule_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '抽奖规则比值',
                                  `rule_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '抽奖规则描述',
                                  `create_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
                                  `update_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of strategy_rule
-- ----------------------------
INSERT INTO `strategy_rule` VALUES (1, 10001, 101, 2, 'rule_random', '1,1000', '随即积分策略', '2025-09-24 21:39:55', '2025-09-24 21:39:57');
INSERT INTO `strategy_rule` VALUES (2, 10001, 107, 2, 'rule_lock', '1', '抽奖1次后解锁', '2025-09-24 21:41:56', '2025-09-24 21:42:00');
INSERT INTO `strategy_rule` VALUES (3, 10001, 108, 2, 'rule_lock', '2', '抽奖2次后解锁', '2025-09-24 21:42:50', '2025-09-24 21:42:52');
INSERT INTO `strategy_rule` VALUES (4, 10001, 109, 2, 'rule_lock', '6', '抽奖6次后解锁', '2025-09-24 21:43:35', '2025-09-24 21:43:37');
INSERT INTO `strategy_rule` VALUES (5, 10001, 107, 2, 'rule_lick_award', '1,100', '随机积分完成', '2025-09-24 22:01:38', '2025-09-24 22:01:43');
INSERT INTO `strategy_rule` VALUES (6, 10001, NULL, 1, 'rule_weight', '6000,102,103,104,105,106,107,108,109', '消耗6000分，必中奖范围', '2025-09-24 22:06:56', '2025-09-24 22:07:00');
INSERT INTO `strategy_rule` VALUES (7, 10001, NULL, 1, 'rule_blacklist', '1', '黑名单抽奖，积分兜底', '2025-09-24 22:08:05', '2025-09-24 22:08:09');

SET FOREIGN_KEY_CHECKS = 1;

# 转储表 award
# ------------------------------------------------------------

DROP TABLE IF EXISTS `award`;

CREATE TABLE `award` (
                         `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
                         `award_id` int(8) NOT NULL COMMENT '抽奖奖品ID - 内部流转使用',
                         `award_key` varchar(32) NOT NULL COMMENT '奖品对接标识 - 每一个都是一个对应的发奖策略',
                         `award_config` varchar(32) NOT NULL COMMENT '奖品配置信息',
                         `award_desc` varchar(128) NOT NULL COMMENT '奖品内容描述',
                         `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                         `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                         PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `award` WRITE;
/*!40000 ALTER TABLE `award` DISABLE KEYS */;

INSERT INTO `award` (`id`, `award_id`, `award_key`, `award_config`, `award_desc`, `create_time`, `update_time`)
VALUES
    (1,101,'user_credit_random','1,100','用户积分【优先透彻规则范围，如果没有则走配置】','2023-12-09 11:07:06','2023-12-09 11:21:31'),
    (2,102,'openai_use_count','5','OpenAI 增加使用次数','2023-12-09 11:07:06','2023-12-09 11:12:59'),
    (3,103,'openai_use_count','10','OpenAI 增加使用次数','2023-12-09 11:07:06','2023-12-09 11:12:59'),
    (4,104,'openai_use_count','20','OpenAI 增加使用次数','2023-12-09 11:07:06','2023-12-09 11:12:58'),
    (5,105,'openai_model','gpt-4','OpenAI 增加模型','2023-12-09 11:07:06','2023-12-09 11:12:01'),
    (6,106,'openai_model','dall-e-2','OpenAI 增加模型','2023-12-09 11:07:06','2023-12-09 11:12:08'),
    (7,107,'openai_model','dall-e-3','OpenAI 增加模型','2023-12-09 11:07:06','2023-12-09 11:12:10'),
    (8,108,'openai_use_count','100','OpenAI 增加使用次数','2023-12-09 11:07:06','2023-12-09 11:12:55'),
    (9,109,'openai_model','gpt-4,dall-e-2,dall-e-3','OpenAI 增加模型','2023-12-09 11:07:06','2023-12-09 11:12:39');

/*!40000 ALTER TABLE `award` ENABLE KEYS */;
UNLOCK TABLES;

