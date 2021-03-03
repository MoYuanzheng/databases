/*
 Navicat Premium Data Transfer

 Source Server         : uppicsys
 Source Server Type    : MySQL
 Source Server Version : 80022
 Source Host           : localhost:3306
 Source Schema         : qrcode

 Target Server Type    : MySQL
 Target Server Version : 80022
 File Encoding         : 65001

 Date: 03/03/2021 22:08:30
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for batch
-- ----------------------------
DROP TABLE IF EXISTS `batch`;
CREATE TABLE `batch`  (
  `id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键',
  `order_time` timestamp(0) NOT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '下单时间',
  `complete_time` timestamp(0) NOT NULL COMMENT '订单完成时间',
  `product_type` int NOT NULL COMMENT '产品型号',
  `total` int NOT NULL COMMENT '订单总数',
  `update_time` timestamp(0) NULL DEFAULT NULL COMMENT '最近一次更新时间',
  `create_time` timestamp(0) NULL DEFAULT NULL COMMENT '该条记录创建时间',
  `del_flag` int NOT NULL DEFAULT 0 COMMENT '逻辑删除标志位 1 代表删除',
  `version` int NOT NULL DEFAULT 1 COMMENT '乐观锁',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '订单批次表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of batch
-- ----------------------------
INSERT INTO `batch` VALUES ('1001', '2020-01-22 00:27:50', '2021-01-22 00:27:53', 1001, 50000, '2000-01-01 00:00:01', '2021-02-08 15:16:42', 0, 1);

-- ----------------------------
-- Table structure for dealer
-- ----------------------------
DROP TABLE IF EXISTS `dealer`;
CREATE TABLE `dealer`  (
  `id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键',
  `alias` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '别名',
  `full_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '全称',
  `grade` int NOT NULL COMMENT '经销商等级，1 === 一级经销商',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '办公地址',
  `area` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '销售负责区域',
  `create_time` timestamp(0) NULL DEFAULT NULL COMMENT '该条记录创建时间',
  `version` int NOT NULL DEFAULT 1 COMMENT '乐观锁',
  `del_flag` int NOT NULL DEFAULT 0 COMMENT '逻辑删除',
  `update_time` timestamp(0) NULL DEFAULT NULL COMMENT '最近一次更新时间',
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `dealer_id_uindex`(`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '经销商' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dealer
-- ----------------------------
INSERT INTO `dealer` VALUES ('1', '1', '2', 1, '1', '1', '2021-02-08 14:26:11', 1, 0, '2000-01-01 00:00:01', NULL);

-- ----------------------------
-- Table structure for material
-- ----------------------------
DROP TABLE IF EXISTS `material`;
CREATE TABLE `material`  (
  `id` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键',
  `cn_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '中文名',
  `en_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '英文名',
  `create_time` timestamp(0) NULL DEFAULT NULL COMMENT '该条记录创建时间',
  `update_time` timestamp(0) NULL DEFAULT NULL COMMENT '最近一次更新时间',
  `del_flag` int NOT NULL DEFAULT 0 COMMENT '逻辑删除，1为被删除',
  `version` int NULL DEFAULT 1 COMMENT '乐观锁',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '材料' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of material
-- ----------------------------

-- ----------------------------
-- Table structure for product_all
-- ----------------------------
DROP TABLE IF EXISTS `product_all`;
CREATE TABLE `product_all`  (
  `id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键',
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '产品类别',
  `batch` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '批次',
  `manufacture_date` timestamp(0) NULL DEFAULT NULL COMMENT '生产日期',
  `inspection_date` timestamp(0) NULL DEFAULT NULL COMMENT '质检日期',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `product_id_uindex`(`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_all
-- ----------------------------

-- ----------------------------
-- Table structure for product_category
-- ----------------------------
DROP TABLE IF EXISTS `product_category`;
CREATE TABLE `product_category`  (
  `id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键',
  `type` int NOT NULL COMMENT '产品型号',
  `cn_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '中文名称',
  `price` double NOT NULL COMMENT '单价',
  `create_time` timestamp(0) NULL DEFAULT NULL COMMENT '该条记录创建时间',
  `update_time` timestamp(0) NULL DEFAULT NULL COMMENT '最近一次更新时间',
  `del_flag` int NOT NULL DEFAULT 0 COMMENT '逻辑删除，1为被删除',
  `version` int NULL DEFAULT 1 COMMENT '乐观锁',
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `products_product_id_uindex`(`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '产品' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_category
-- ----------------------------
INSERT INTO `product_category` VALUES ('1001', 1, '抛光砖', 688, '2021-02-08 15:25:35', '2000-01-01 00:00:01', 0, 1, NULL);
INSERT INTO `product_category` VALUES ('1002', 2, '抛釉砖', 710, '2021-02-08 15:25:35', '2000-01-01 00:00:01', 0, 1, NULL);
INSERT INTO `product_category` VALUES ('1003', 3, '通体砖', 534, '2021-02-08 15:25:35', '2000-01-01 00:00:01', 0, 1, NULL);
INSERT INTO `product_category` VALUES ('1004', 4, '仿古砖', 229, '2021-02-08 15:25:35', '2000-01-01 00:00:01', 0, 1, NULL);
INSERT INTO `product_category` VALUES ('1005', 5, '马赛克砖', 80, '2021-02-08 15:25:35', '2000-01-01 00:00:01', 0, 1, NULL);

-- ----------------------------
-- Table structure for sms
-- ----------------------------
DROP TABLE IF EXISTS `sms`;
CREATE TABLE `sms`  (
  `id` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '手机号 主键',
  `code` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '验证码',
  `deadline` timestamp(0) NULL DEFAULT NULL COMMENT '到期时间',
  `create_time` timestamp(0) NOT NULL COMMENT '记录创建时间',
  `update_time` timestamp(0) NOT NULL COMMENT '最近一次更改时间',
  `del_flag` int NULL DEFAULT 0 COMMENT '逻辑删除标志位，1为已删除',
  `version` int NULL DEFAULT 1,
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '备注\n',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `sms_id_uindex`(`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sms
-- ----------------------------
INSERT INTO `sms` VALUES ('15066686275', '237f', '2021-02-28 18:03:00', '2021-02-15 06:57:13', '2021-02-28 17:58:00', 0, 1, NULL);

-- ----------------------------
-- Table structure for supplier
-- ----------------------------
DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier`  (
  `id` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键',
  `material` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '所供应材料',
  `full_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '供应商全称',
  `header` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '负责人名字',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '联系电话',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '联系地址',
  `create_time` timestamp(0) NULL DEFAULT NULL COMMENT '该条记录创建时间',
  `update_time` timestamp(0) NULL DEFAULT NULL COMMENT '最近一次更新时间',
  `del_flag` int NOT NULL DEFAULT 0 COMMENT '逻辑删除，1为被删除',
  `version` int NULL DEFAULT 1 COMMENT '乐观锁',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '供应商' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of supplier
-- ----------------------------

-- ----------------------------
-- Table structure for test_time
-- ----------------------------
DROP TABLE IF EXISTS `test_time`;
CREATE TABLE `test_time`  (
  `id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键',
  `create_time` timestamp(0) NULL DEFAULT NULL COMMENT '该条记录创建时间',
  `update_time` timestamp(0) NULL DEFAULT NULL COMMENT '最近一次更新时间',
  `del_flag` int NULL DEFAULT 0 COMMENT '逻辑删除，1为被删除',
  `version` int NULL DEFAULT 1 COMMENT '乐观锁',
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
  `secret` int NOT NULL COMMENT '密码',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `test_time_id_uindex`(`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '测试表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of test_time
-- ----------------------------
INSERT INTO `test_time` VALUES ('666', '2021-02-08 12:37:06', '2021-02-08 12:40:21', 0, 1, 'yyyyy', 0);

-- ----------------------------
-- Table structure for token
-- ----------------------------
DROP TABLE IF EXISTS `token`;
CREATE TABLE `token`  (
  `id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键',
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'UUID生成',
  `deadline` int NOT NULL COMMENT '失效时间',
  `version` int NULL DEFAULT 1 COMMENT '乐观锁',
  `create_time` timestamp(0) NULL DEFAULT NULL COMMENT '该条记录创建时间',
  `update_time` timestamp(0) NULL DEFAULT NULL COMMENT '最近一次更新时间',
  `del_flag` int NOT NULL DEFAULT 0 COMMENT '逻辑删除，1为被删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `token_user_id_uindex`(`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Token' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of token
-- ----------------------------
INSERT INTO `token` VALUES ('9999', 'a827ec89-ce91-43d6-82d2-c84d40650f45', 1611057017, 1, '2021-01-28 19:46:53', '2000-01-01 00:00:01', 0);
INSERT INTO `token` VALUES ('admin', 'f61051f0-db5e-4f81-a9e0-0040192547aa', 1611063062, 1, '2021-01-28 19:46:53', '2000-01-01 00:00:01', 0);
INSERT INTO `token` VALUES ('admin1', '6dcaed3f-b276-4294-9b4a-d50270a9bf51', 1611395628, 1, '2021-01-28 19:46:53', '2000-01-01 00:00:01', 0);
INSERT INTO `token` VALUES ('admin2', 'c35dd4e3-bd06-40ff-94ab-01f86605e91d', 1611138549, 1, '2021-01-28 19:46:53', '2000-01-01 00:00:01', 0);
INSERT INTO `token` VALUES ('admin3', '3cc154f1-2e3b-4d79-aaa3-25d1618e9d2c', 1611395342, 1, '2021-01-28 19:46:53', '2000-01-01 00:00:01', 0);
INSERT INTO `token` VALUES ('admin4', 'cafb075b-f287-4930-b42d-0f691252eb74', 1611834523, 1, '2021-01-28 19:47:13', '2000-01-01 00:00:01', 0);
INSERT INTO `token` VALUES ('admin5', 'b4de7851-d230-463b-b8f3-32a08524fcaf', 1611834551, 1, '2021-01-28 19:47:41', '2000-01-01 00:00:01', 0);
INSERT INTO `token` VALUES ('root', '645ebbda-a2a7-4fe4-994b-35be032f97a2', 1611064504, 1, '2021-01-28 19:46:53', '2000-01-01 00:00:01', 0);
INSERT INTO `token` VALUES ('user', '7a5ba00d-bbdf-4a24-889a-8441ba9a5568', 1611063904, 1, '2021-01-28 19:46:53', '2000-01-01 00:00:01', 0);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '登录名-主键',
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户名 用于显示',
  `pwd` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '密码，最长 20 位',
  `roles` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '权限',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '电话',
  `email` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '电子邮箱',
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '备注',
  `version` int NULL DEFAULT 1 COMMENT '乐观锁',
  `del_flag` int NOT NULL DEFAULT 0 COMMENT '逻辑删除标志位',
  `create_time` timestamp(0) NULL DEFAULT NULL COMMENT '该条记录创建时间',
  `update_time` timestamp(0) NULL DEFAULT NULL COMMENT '最近一次更新时间',
  `code` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '短信校验码',
  `deadline` timestamp(0) NULL DEFAULT NULL COMMENT '校验码失效时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_phone_uindex`(`phone`) USING BTREE,
  UNIQUE INDEX `user_id_uindex`(`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('9999', '大马猴', '9999', 'ROLE_user', '18888888881', '815687789@qq.com', 'Test Insert', 1, 0, '2021-01-28 19:02:39', '2000-01-01 00:00:01', NULL, NULL);
INSERT INTO `user` VALUES ('admin', 'moyz', 'admin', 'ROLE_admin', '15066686275', '815687789@qq.com', 'admin', 10, 0, '2021-01-28 19:02:39', '2021-02-28 17:51:38', '455f', '2021-02-28 17:56:38');
INSERT INTO `user` VALUES ('admin1', 'PostmanX', '123456', 'ROLE_admin', '18888888883', '88888888@gmail.com', 'Test Postman', 1, 0, '2021-01-28 19:02:39', '2000-01-01 00:00:01', NULL, NULL);
INSERT INTO `user` VALUES ('admin2', 'PostmanX', '123456', 'ROLE_admin', '18888888848', '88888888@gmail.com', 'Test Postman', 1, 0, '2021-01-28 19:02:39', '2000-01-01 00:00:01', NULL, NULL);
INSERT INTO `user` VALUES ('admin3', 'PostmanX', '123456', 'ROLE_admin', '18888888885', '88888888@gmail.com', 'Test Postman', 1, 0, '2021-01-28 19:02:39', '2000-01-01 00:00:01', NULL, NULL);
INSERT INTO `user` VALUES ('admin4', 'version', '123456', 'ROLE_admin', '18888888868', '88888888@gmail.com', 'Test Lock', 1, 0, '2021-01-28 19:47:13', '2000-01-01 00:00:01', NULL, NULL);
INSERT INTO `user` VALUES ('admin5', 'version', '123456', 'ROLE_admin', '18888888788', '88888888@gmail.com', 'Test Lock', 1, 0, '2021-01-28 19:47:41', '2000-01-01 00:00:01', NULL, NULL);
INSERT INTO `user` VALUES ('root', '小马猴', 'root', 'ROLE_admin', '18888888812', '815687789@qq.com', 'Test root', 1, 0, '2021-01-28 19:02:39', '2000-01-01 00:00:01', NULL, NULL);
INSERT INTO `user` VALUES ('user', '小马猴', 'user', 'ROLE_user', '18888888138', '815687789@qq.com', 'Test user', 1, 0, '2000-01-01 00:00:01', '2000-01-01 00:00:00', NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
