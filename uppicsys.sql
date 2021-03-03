/*
 Navicat Premium Data Transfer

 Source Server         : uppicsys
 Source Server Type    : MySQL
 Source Server Version : 80022
 Source Host           : localhost:3306
 Source Schema         : uppicsys

 Target Server Type    : MySQL
 Target Server Version : 80022
 File Encoding         : 65001

 Date: 03/03/2021 22:09:10
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_pics
-- ----------------------------
DROP TABLE IF EXISTS `t_pics`;
CREATE TABLE `t_pics`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `pic_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pic_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pic_intro` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pic_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `pic_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `modified_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `update_time` timestamp(0) NOT NULL DEFAULT '2000-01-01 00:00:01' ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_pics
-- ----------------------------
INSERT INTO `t_pics` VALUES (1, '修改11', 'upload/依赖.png', '213', '2020-12-06 23:39:51', 'image/png', NULL, '2000-01-01 00:00:01');

SET FOREIGN_KEY_CHECKS = 1;
