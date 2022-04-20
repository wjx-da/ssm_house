/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80017
 Source Host           : localhost:3306
 Source Schema         : house_db

 Target Server Type    : MySQL
 Target Server Version : 80017
 File Encoding         : 65001

 Date: 06/04/2022 23:06:50
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
                          `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
                          `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
                          PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('a', 'a');

-- ----------------------------
-- Table structure for t_areainfo
-- ----------------------------
DROP TABLE IF EXISTS `t_areainfo`;
CREATE TABLE `t_areainfo`  (
                               `areaId` int(11) NOT NULL AUTO_INCREMENT COMMENT '记录编号',
                               `areaName` varchar(20)  NOT NULL COMMENT '区域名称',
                               PRIMARY KEY (`areaId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_areainfo
-- ----------------------------
INSERT INTO `t_areainfo` VALUES (1, 'qwe');
INSERT INTO `t_areainfo` VALUES (2, 'a');

-- ----------------------------
-- Table structure for t_buildinginfo
-- ----------------------------
DROP TABLE IF EXISTS `t_buildinginfo`;
CREATE TABLE `t_buildinginfo`  (
                                   `buildingId` int(11) NOT NULL AUTO_INCREMENT COMMENT '楼盘编号',
                                   `areaObj` int(11) NOT NULL COMMENT '所在区域',
                                   `buildingName` varchar(20)  NOT NULL COMMENT '楼盘名称',
                                   `buildingPhoto` varchar(60)  NOT NULL COMMENT '楼盘图片',
                                   PRIMARY KEY (`buildingId`) USING BTREE,
                                   INDEX `areaObj`(`areaObj`) USING BTREE,
                                   CONSTRAINT `t_buildinginfo_ibfk_1` FOREIGN KEY (`areaObj`) REFERENCES `t_areainfo` (`areaId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_buildinginfo
-- ----------------------------
INSERT INTO `t_buildinginfo` VALUES (1, 1, 'qwea', 'upload/9fac2671-2cdb-458a-ac49-9e245a397a14.jpg');
INSERT INTO `t_buildinginfo` VALUES (3, 1, '设置大厦', 'upload/c0e5304a-bbfc-466a-b26c-6a49778b0884.jpg');

-- ----------------------------
-- Table structure for t_guestbook
-- ----------------------------
DROP TABLE IF EXISTS `t_guestbook`;
CREATE TABLE `t_guestbook`  (
                                `guestBookId` int(11) NOT NULL AUTO_INCREMENT COMMENT '记录编号',
                                `title` varchar(40)  NOT NULL COMMENT '留言标题',
                                `content` varchar(200)  NOT NULL COMMENT '留言内容',
                                `userObj` varchar(20)  NOT NULL COMMENT '留言人',
                                `addTime` varchar(20)  NOT NULL COMMENT '留言时间',
                                PRIMARY KEY (`guestBookId`) USING BTREE,
                                INDEX `userObj`(`userObj`) USING BTREE,
                                CONSTRAINT `t_guestbook_ibfk_1` FOREIGN KEY (`userObj`) REFERENCES `t_userinfo` (`user_name`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_hourse
-- ----------------------------
DROP TABLE IF EXISTS `t_hourse`;
CREATE TABLE `t_hourse`  (
                             `hourseId` int(11) NOT NULL AUTO_INCREMENT COMMENT '房屋编号',
                             `hourseName` varchar(20)  NOT NULL COMMENT '房屋名称',
                             `buildingObj` int(11) NOT NULL COMMENT '所在楼盘',
                             `housePhoto` varchar(60)  NOT NULL COMMENT '房屋图片',
                             `hourseTypeObj` int(11) NOT NULL COMMENT '房屋类型',
                             `priceRangeObj` int(11) NOT NULL COMMENT '价格范围',
                             `area` varchar(20)  NOT NULL COMMENT '面积',
                             `price` float NOT NULL COMMENT '租金(元/月)',
                             `louceng` varchar(20)  NOT NULL COMMENT '楼层/总楼层',
                             `zhuangxiu` varchar(20)  NOT NULL COMMENT '装修',
                             `caoxiang` varchar(20)  NULL COMMENT '朝向',
                             `madeYear` varchar(20)  NULL COMMENT '建筑年代',
                             `connectPerson` varchar(20)  NOT NULL COMMENT '联系人',
                             `connectPhone` varchar(20)  NOT NULL COMMENT '联系电话',
                             `detail` varchar(500)  NULL COMMENT '详细信息',
                             `address` varchar(50)  NULL COMMENT '地址',
                             `userInfo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '租户',
                             `card` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL  COMMENT '户主身份证',
                             PRIMARY KEY (`hourseId`) USING BTREE,
                             INDEX `buildingObj`(`buildingObj`) USING BTREE,
                             INDEX `hourseTypeObj`(`hourseTypeObj`) USING BTREE,
                             INDEX `priceRangeObj`(`priceRangeObj`) USING BTREE,
                             CONSTRAINT `t_hourse_ibfk_1` FOREIGN KEY (`buildingObj`) REFERENCES `t_buildinginfo` (`buildingId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
                             CONSTRAINT `t_hourse_ibfk_2` FOREIGN KEY (`hourseTypeObj`) REFERENCES `t_hoursetype` (`typeId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
                             CONSTRAINT `t_hourse_ibfk_3` FOREIGN KEY (`priceRangeObj`) REFERENCES `t_pricerange` (`rangeId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_hourse
-- ----------------------------
INSERT INTO `t_hourse` VALUES (4, 'aaaa', 1, 'upload/edc414df-3dcf-4c8f-b56d-09fa1b54141c.jpg', 1, 1, '1222', 1324, '12', '完好', '南', '2014', '张三', '2123154', '阿诗丹顿', '南昌', 'a', '134892146145');
INSERT INTO `t_hourse` VALUES (5, 'aaaaaaa', 1, 'upload/fd9e592f-1515-404a-a3de-8268897dff1a.jpg', 1, 1, 'aa', 1324, '12', '完好', '南', '2014', '张三', '1376709218', 'dasdasd', '南昌', NULL, '134892146145');

-- ----------------------------
-- Table structure for t_hoursetype
-- ----------------------------
DROP TABLE IF EXISTS `t_hoursetype`;
CREATE TABLE `t_hoursetype`  (
                                 `typeId` int(11) NOT NULL AUTO_INCREMENT COMMENT '类别编号',
                                 `typeName` varchar(20)  NOT NULL COMMENT '房屋类型',
                                 PRIMARY KEY (`typeId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_hoursetype
-- ----------------------------
INSERT INTO `t_hoursetype` VALUES (1, 'qwe');

-- ----------------------------
-- Table structure for t_newsinfo
-- ----------------------------
DROP TABLE IF EXISTS `t_newsinfo`;
CREATE TABLE `t_newsinfo`  (
                               `newsId` int(11) NOT NULL AUTO_INCREMENT COMMENT '记录编号',
                               `newsTitle` varchar(20)  NOT NULL COMMENT '标题',
                               `newsContent` varchar(200)  NOT NULL COMMENT '新闻内容',
                               `newsDate` varchar(20)  NULL COMMENT '发布日期',
                               PRIMARY KEY (`newsId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_newsinfo
-- ----------------------------
INSERT INTO `t_newsinfo` VALUES (1, 'czxc', 'asd', '2022-03-02');

-- ----------------------------
-- Table structure for t_pricerange
-- ----------------------------
DROP TABLE IF EXISTS `t_pricerange`;
CREATE TABLE `t_pricerange`  (
                                 `rangeId` int(11) NOT NULL AUTO_INCREMENT COMMENT '记录编号',
                                 `priceName` varchar(20)  NOT NULL COMMENT '价格区间',
                                 PRIMARY KEY (`rangeId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_pricerange
-- ----------------------------
INSERT INTO `t_pricerange` VALUES (1, '100-1999');

-- ----------------------------
-- Table structure for t_rent
-- ----------------------------
DROP TABLE IF EXISTS `t_rent`;
CREATE TABLE `t_rent`  (
                           `id` int(11) NOT NULL AUTO_INCREMENT,
                           `hourseObj` int(11) DEFAULT NULL COMMENT '房屋id',
                           `userInfoObj` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
                           `starttime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '开始时间',
                           `endtime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
                           `rentprice` float(10, 2) DEFAULT NULL COMMENT '价格',
                           `nowtime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
                           PRIMARY KEY (`id`) USING BTREE,
                           INDEX `hourseObj`(`hourseObj`) USING BTREE,
                           INDEX `userInfoObj`(`userInfoObj`) USING BTREE,
                           CONSTRAINT `hourseObj` FOREIGN KEY (`hourseObj`) REFERENCES `t_hourse` (`hourseId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
                           CONSTRAINT `userInfoObj` FOREIGN KEY (`userInfoObj`) REFERENCES `t_userinfo` (`user_name`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_rent
-- ----------------------------
INSERT INTO `t_rent` VALUES (6, 4, 'a', '2022-04-05', '2022-04-29', 132132.00, '2022-04-29');

-- ----------------------------
-- Table structure for t_userinfo
-- ----------------------------
DROP TABLE IF EXISTS `t_userinfo`;
CREATE TABLE `t_userinfo`  (
                               `user_name` varchar(20)  NOT NULL COMMENT 'user_name',
                               `password` varchar(20)  NULL COMMENT '密码',
                               `realName` varchar(20)  NOT NULL COMMENT '姓名',
                               `sex` varchar(4)  NOT NULL COMMENT '性别',
                               `birthday` varchar(20)  NULL COMMENT '出生日期',
                               `cardNumber` varchar(20)  NOT NULL COMMENT '身份证',
                               `city` varchar(20)  NULL COMMENT '籍贯',
                               `photo` varchar(60)  NOT NULL COMMENT '照片',
                               `address` varchar(20)  NULL COMMENT '家庭地址',
                               `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL  COMMENT '电子邮件',
                               `telephone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL  COMMENT '手机号',
                               `price` float(10, 2) DEFAULT NULL COMMENT '价格',
                               PRIMARY KEY (`user_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_userinfo
-- ----------------------------
INSERT INTO `t_userinfo` VALUES ('a', 'a', 'qwe qwe', '男', '2022-04-06', '360125', '360100', 'upload/4b4c1e9b-4738-4a91-b8a8-7f4779119f00.jpg', '南昌', NULL, '13767092182', 1325.00);

-- ----------------------------
-- Table structure for t_wanthourseinfo
-- ----------------------------
DROP TABLE IF EXISTS `t_wanthourseinfo`;
CREATE TABLE `t_wanthourseinfo`  (
                                     `wantHourseId` int(11) NOT NULL AUTO_INCREMENT COMMENT '记录编号',
                                     `userObj` varchar(20)  NOT NULL COMMENT '求租用户',
                                     `title` varchar(20)  NOT NULL COMMENT '标题',
                                     `position` int(11) NOT NULL COMMENT '求租区域',
                                     `hourseTypeObj` int(11) NOT NULL COMMENT '房屋类型',
                                     `priceRangeObj` int(11) NOT NULL COMMENT '价格范围',
                                     `price` float NOT NULL COMMENT '最高能出租金',
                                     `lianxiren` varchar(20)  NOT NULL COMMENT '联系人',
                                     `telephone` varchar(20)  NOT NULL COMMENT '联系电话',
                                     `hourseId` int(11) NOT NULL COMMENT '房屋id',
                                     PRIMARY KEY (`wantHourseId`) USING BTREE,
                                     INDEX `userObj`(`userObj`) USING BTREE,
                                     INDEX `position`(`position`) USING BTREE,
                                     INDEX `hourseTypeObj`(`hourseTypeObj`) USING BTREE,
                                     INDEX `priceRangeObj`(`priceRangeObj`) USING BTREE,
                                     CONSTRAINT `t_wanthourseinfo_ibfk_1` FOREIGN KEY (`userObj`) REFERENCES `t_userinfo` (`user_name`) ON DELETE RESTRICT ON UPDATE RESTRICT,
                                     CONSTRAINT `t_wanthourseinfo_ibfk_2` FOREIGN KEY (`position`) REFERENCES `t_areainfo` (`areaId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
                                     CONSTRAINT `t_wanthourseinfo_ibfk_3` FOREIGN KEY (`hourseTypeObj`) REFERENCES `t_hoursetype` (`typeId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
                                     CONSTRAINT `t_wanthourseinfo_ibfk_4` FOREIGN KEY (`priceRangeObj`) REFERENCES `t_pricerange` (`rangeId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_wanthourseinfo
-- ----------------------------
INSERT INTO `t_wanthourseinfo` VALUES (26, 'a', '租房申请', 1, 1, 1, 1325, 'qwe qwe', '13767092182', 4);
INSERT INTO `t_wanthourseinfo` VALUES (27, 'a', '租房申请', 1, 1, 1, 1325, 'qwe qwe', '13767092182', 5);

SET FOREIGN_KEY_CHECKS = 1;
