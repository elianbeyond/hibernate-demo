/*
 Navicat Premium Data Transfer

 Source Server         : backend
 Source Server Type    : MySQL
 Source Server Version : 50724
 Source Host           : localhost:3306
 Source Schema         : backend

 Target Server Type    : MySQL
 Target Server Version : 50724
 File Encoding         : 65001

 Date: 12/09/2022 21:06:34
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL,
  `product_id` int(11) NULL DEFAULT NULL,
  `quantity` int(11) NULL DEFAULT NULL COMMENT '数量',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `product_id`(`product_id`) USING BTREE,
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '购物车' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cart
-- ----------------------------

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `product_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  `rate` int(11) NULL DEFAULT NULL COMMENT '价格',
  `content` char(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '商品分类',
  INDEX `product_id`(`product_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '评价' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of comment
-- ----------------------------

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `product_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  `warehouse_id` int(11) NULL DEFAULT NULL,
  `quantity` int(11) NULL DEFAULT NULL COMMENT '数量',
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `product_id`(`product_id`) USING BTREE,
  INDEX `warehouse_id`(`warehouse_id`) USING BTREE,
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `order_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `order_ibfk_3` FOREIGN KEY (`warehouse_id`) REFERENCES `smart_warehouse` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '订单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of order
-- ----------------------------

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL,
  `name` char(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '商品名称',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品价格',
  `category` char(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '商品分类',
  `location` char(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '地址',
  `quantity` int(11) NULL DEFAULT NULL COMMENT '数量',
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '商品管理' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (1, 0, 'default', 0.00, 'unkown', 'unkown', 0, 0);

-- ----------------------------
-- Table structure for smart_warehouse
-- ----------------------------
DROP TABLE IF EXISTS `smart_warehouse`;
CREATE TABLE `smart_warehouse`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '名字',
  `price` int(11) NULL DEFAULT NULL COMMENT '价格',
  `headquarter_location` char(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '总部地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '仓库信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of smart_warehouse
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NULL DEFAULT NULL,
  `voucher_id` int(11) NULL DEFAULT NULL,
  `username` char(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '姓名',
  `user_email` char(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '邮箱',
  `password` char(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '密码',
  `address` char(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '地址',
  `admin` tinyint(1) NULL DEFAULT 0 COMMENT '管理员 0:否，1:是',
  `isban` tinyint(1) NULL DEFAULT 0 COMMENT '状态 0:禁用，1:正常',
  `is_ban` bit(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `product_id`(`product_id`) USING BTREE,
  INDEX `voucher_id`(`voucher_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '用户信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 0, 0, 'elian', '814846181@qq.com', 'e10adc3949ba59abbe56e057f20f883e', 'home', 1, 0, b'0');
INSERT INTO `user` VALUES (2, 0, 0, 'cbx', '15197730857@163.com', 'e10adc3949ba59abbe56e057f20f883e', 'home', 1, 0, b'0');
INSERT INTO `user` VALUES (7, 0, 0, 'cbx2', '15197730857@163.com', 'e10adc3949ba59abbe56e057f20f883e', 'home', 0, 0, b'0');

-- ----------------------------
-- Table structure for voucher
-- ----------------------------
DROP TABLE IF EXISTS `voucher`;
CREATE TABLE `voucher`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL,
  `name` char(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '凭证名称',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '价格',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `voucher_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '凭证' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of voucher
-- ----------------------------
INSERT INTO `voucher` VALUES (1, 0, 'unkown', 0.00);

SET FOREIGN_KEY_CHECKS = 0;
