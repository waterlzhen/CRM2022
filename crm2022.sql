/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1_MySQL8.0
 Source Server Type    : MySQL
 Source Server Version : 80027
 Source Host           : localhost:3306
 Source Schema         : crm2022

 Target Server Type    : MySQL
 Target Server Version : 80027
 File Encoding         : 65001

 Date: 11/09/2022 16:25:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tbl_activity
-- ----------------------------
DROP TABLE IF EXISTS `tbl_activity`;
CREATE TABLE `tbl_activity`  (
  `id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `owner` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `start_date` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `end_date` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cost` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `edit_time` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `edit_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_activity
-- ----------------------------
INSERT INTO `tbl_activity` VALUES ('02366f5947d3443d9df807bfd9920a06', '06f5fc056eac41558a964f96daa7f27c', '测试03', '2022-08-16', '2022-08-16', '2000', '测试03', '2022-08-14 11:33:16', '06f5fc056eac41558a964f96daa7f27c', NULL, NULL);
INSERT INTO `tbl_activity` VALUES ('46a9ec3263c1409b8858735035be358c', '06f5fc056eac41558a964f96daa7f27c', 'X测试04', '2022-08-14', '2022-08-15', '1300', '描述测试04', '2022-08-17 19:06:00', '06f5fc056eac41558a964f96daa7f27c', NULL, NULL);
INSERT INTO `tbl_activity` VALUES ('4778e0bbbec2425cbd6a90aee5d9f191', '06f5fc056eac41558a964f96daa7f27c', 'X测试02', '2020-10-02', '2020-10-03', '1000', '描述测试01', '2022-08-17 19:06:00', '06f5fc056eac41558a964f96daa7f27c', NULL, NULL);
INSERT INTO `tbl_activity` VALUES ('6d93f4e42099485a99639b9706ffe970', '06f5fc056eac41558a964f96daa7f27c', '测试04', '2022-08-14', '2022-08-15', '1300', '描述测试04', '2022-08-14 18:11:37', '06f5fc056eac41558a964f96daa7f27c', NULL, NULL);
INSERT INTO `tbl_activity` VALUES ('aecab0ee74a2450c84fcd05350544639', '06f5fc056eac41558a964f96daa7f27c', 'X测试05', '2020-10-20', '2020-11-10', '100', '描述测试02', '2022-08-17 19:06:00', '06f5fc056eac41558a964f96daa7f27c', NULL, NULL);
INSERT INTO `tbl_activity` VALUES ('afb55c84110b490aa20393965e39e670', '40f6cdea0bd34aceb77492a1656d9fb3', '测试02', '2020-10-20', '2020-11-10', '100', '描述测试02', '2022-08-13 18:46:55', '40f6cdea0bd34aceb77492a1656d9fb3', NULL, NULL);
INSERT INTO `tbl_activity` VALUES ('b1e1c026bde04f35a94f5aa9baa16978', '06f5fc056eac41558a964f96daa7f27c', 'X测试06', '2022-08-17', '2022-08-17', '200000', '描述测试06', '2022-08-17 19:06:00', '06f5fc056eac41558a964f96daa7f27c', NULL, NULL);
INSERT INTO `tbl_activity` VALUES ('b44f6ae3f152442f8337a178401fad10', '06f5fc056eac41558a964f96daa7f27c', 'X测试03', '2022-08-16', '2022-08-16', '2000', '测试03', '2022-08-17 19:06:00', '06f5fc056eac41558a964f96daa7f27c', NULL, NULL);
INSERT INTO `tbl_activity` VALUES ('beb855429ca34652b49c62e913acfd6a', '06f5fc056eac41558a964f96daa7f27c', '测试06', '2022-08-17', '2022-08-17', '200000', '描述测试06', '2022-08-15 17:11:28', '40f6cdea0bd34aceb77492a1656d9fb3', '2022-08-15 17:12:38', '40f6cdea0bd34aceb77492a1656d9fb3');
INSERT INTO `tbl_activity` VALUES ('c7519e042fdf41af804f2da62cab99c4', '40f6cdea0bd34aceb77492a1656d9fb3', '测试01', '2020-10-02', '2020-10-03', '1000', '描述测试01', '2022-08-13 18:24:40', '40f6cdea0bd34aceb77492a1656d9fb3', NULL, NULL);

-- ----------------------------
-- Table structure for tbl_activity_remark
-- ----------------------------
DROP TABLE IF EXISTS `tbl_activity_remark`;
CREATE TABLE `tbl_activity_remark`  (
  `id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `note_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `edit_time` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `edit_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `edit_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '0表示未修改，1表示已修改',
  `activity_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_activity_remark
-- ----------------------------
INSERT INTO `tbl_activity_remark` VALUES ('02366f5947d3443d9df807bfd9920a88', '哈哈', '2022-08-14 11:33:16', '06f5fc056eac41558a964f96daa7f27c', '2022-08-14 12:33:16', '06f5fc056eac41558a964f96daa7f27c', '0', '02366f5947d3443d9df807bfd9920a06');
INSERT INTO `tbl_activity_remark` VALUES ('42be06d421bc4edfb018cd9f27e88ff3', '我想被修改001', '2022-08-19 11:24:59', '06f5fc056eac41558a964f96daa7f27c', '2022-08-19 12:28:43', '06f5fc056eac41558a964f96daa7f27c', '1', '02366f5947d3443d9df807bfd9920a06');
INSERT INTO `tbl_activity_remark` VALUES ('be818ea7b8404ced9198505288342f90', '测试老刘', '2022-08-19 07:04:55', '06f5fc056eac41558a964f96daa7f27c', NULL, NULL, '0', '02366f5947d3443d9df807bfd9920a06');
INSERT INTO `tbl_activity_remark` VALUES ('d21e682288bc4973b6fa3b6194e4fdcb', '测试修改003——被修改为004', '2022-08-19 12:27:18', '06f5fc056eac41558a964f96daa7f27c', '2022-08-19 12:27:32', '06f5fc056eac41558a964f96daa7f27c', '1', '02366f5947d3443d9df807bfd9920a06');
INSERT INTO `tbl_activity_remark` VALUES ('ec802708bbaa4225b5036844b2f4f3c3', '测试备注0', '2022-08-19 07:07:24', '06f5fc056eac41558a964f96daa7f27c', NULL, NULL, '0', '46a9ec3263c1409b8858735035be358c');
INSERT INTO `tbl_activity_remark` VALUES ('ef36a917314d483897e320f48406d5ca', '测试修改', '2022-08-19 12:29:57', '06f5fc056eac41558a964f96daa7f27c', NULL, NULL, '0', '46a9ec3263c1409b8858735035be358c');

-- ----------------------------
-- Table structure for tbl_clue
-- ----------------------------
DROP TABLE IF EXISTS `tbl_clue`;
CREATE TABLE `tbl_clue`  (
  `id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fullname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `appellation` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `owner` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `company` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `job` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `website` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mphone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `source` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `edit_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `edit_time` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `contact_summary` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `next_contact_time` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_clue
-- ----------------------------
INSERT INTO `tbl_clue` VALUES ('a2a74b80a823436fb51fef5ca56461c5', '刘某-1', '59795c49896947e1ab61b7312bd0597c', '06f5fc056eac41558a964f96daa7f27c', '动力节点05-1', 'CTO-2', 'hao321@qq.com', '0511-4405333', 'http://www.shanghai.com', '13498798888', '1e0bd307e6ee425599327447f8387285', 'a83e75ced129421dbf11fab1f05cf8b4', '06f5fc056eac41558a964f96daa7f27c', '2022-08-20 07:09:45', '06f5fc056eac41558a964f96daa7f27c', '2022-08-20 07:22:47', '描述信息123修改', '联系纪要123修改', '2022-09-01', '上海市浦东区机场');
INSERT INTO `tbl_clue` VALUES ('c19e174a255049b89a0cb09cbdfbc173', '王某', '67165c27076e4c8599f42de57850e39c', '40f6cdea0bd34aceb77492a1656d9fb3', '动力节点03', 'UTO', 'hao123@qq.com', '0511-4405222', 'http://www.baidu.com', '13498791279', '9e6d6e15232549af853e22e703f3e015', '3a39605d67da48f2a3ef52e19d243953', '06f5fc056eac41558a964f96daa7f27c', '2022-08-19 21:08:36', NULL, NULL, '描述信息321', '联系纪要321', '2022-08-31', '重庆市万州区');
INSERT INTO `tbl_clue` VALUES ('f39935762750430c96b88c4f922f8fb2', '杜某', '59795c49896947e1ab61b7312bd0597c', '06f5fc056eac41558a964f96daa7f27c', '动力节点', 'CTO', 'hao123@qq.com', '0511-4405222', 'http://www.baidu.com', '13498791279', '310e6a49bd8a4962b3f95a1d92eb76f4', '48512bfed26145d4a38d3616e2d2cf79', '06f5fc056eac41558a964f96daa7f27c', '2022-08-19 17:40:27', NULL, NULL, '描述信息123', '联系纪要123', '2022-08-20', '上海市浦东区');

-- ----------------------------
-- Table structure for tbl_clue_activity_relation
-- ----------------------------
DROP TABLE IF EXISTS `tbl_clue_activity_relation`;
CREATE TABLE `tbl_clue_activity_relation`  (
  `id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `clue_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `activity_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_clue_activity_relation
-- ----------------------------
INSERT INTO `tbl_clue_activity_relation` VALUES ('202fce0f4f9d421393c637b2145ad924', 'c19e174a255049b89a0cb09cbdfbc173', '02366f5947d3443d9df807bfd9920a06');
INSERT INTO `tbl_clue_activity_relation` VALUES ('4e571c9c49d54fe9908ba982033c2649', 'a2a74b80a823436fb51fef5ca56461c5', '02366f5947d3443d9df807bfd9920a06');
INSERT INTO `tbl_clue_activity_relation` VALUES ('80f9f8e107044818b4c8f1897a91c2ed', 'f39935762750430c96b88c4f922f8fb2', 'afb55c84110b490aa20393965e39e670');
INSERT INTO `tbl_clue_activity_relation` VALUES ('bda64edb6caa43daac364ec38cdb71ca', 'a2a74b80a823436fb51fef5ca56461c5', 'b44f6ae3f152442f8337a178401fad10');
INSERT INTO `tbl_clue_activity_relation` VALUES ('ccce1897053448e384a21eaf4cd72838', 'a2a74b80a823436fb51fef5ca56461c5', '46a9ec3263c1409b8858735035be358c');
INSERT INTO `tbl_clue_activity_relation` VALUES ('e78980ed829443d0a3d7cd153b939301', 'a2a74b80a823436fb51fef5ca56461c5', '6d93f4e42099485a99639b9706ffe970');
INSERT INTO `tbl_clue_activity_relation` VALUES ('f47d06f49a044d95a299748ed53c7ecd', 'c19e174a255049b89a0cb09cbdfbc173', 'b44f6ae3f152442f8337a178401fad10');

-- ----------------------------
-- Table structure for tbl_clue_remark
-- ----------------------------
DROP TABLE IF EXISTS `tbl_clue_remark`;
CREATE TABLE `tbl_clue_remark`  (
  `id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `note_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `edit_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `edit_time` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `edit_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '0表示未修改，1表示已修改',
  `clue_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_clue_remark
-- ----------------------------
INSERT INTO `tbl_clue_remark` VALUES ('032035c62e6b4699816c3f5b427c304f', '我就不信了，我不能修改信息', '06f5fc056eac41558a964f96daa7f27c', '2022-08-20 09:03:08', '06f5fc056eac41558a964f96daa7f27c', '2022-08-20 12:10:52', '1', 'a2a74b80a823436fb51fef5ca56461c5');
INSERT INTO `tbl_clue_remark` VALUES ('3a7678770bf34ee1bf92906dfb3ae99b', '好主意', '06f5fc056eac41558a964f96daa7f27c', '2022-08-20 11:53:15', NULL, NULL, '0', 'a2a74b80a823436fb51fef5ca56461c5');
INSERT INTO `tbl_clue_remark` VALUES ('4e813bd40d3749139ebf1fe5e640f876', '我觉得这个可以有', '06f5fc056eac41558a964f96daa7f27c', '2022-08-20 08:54:52', NULL, NULL, '0', 'a2a74b80a823436fb51fef5ca56461c5');
INSERT INTO `tbl_clue_remark` VALUES ('dbedf8f30bca4aca95043d0f6797ec6f', '哈哈', '06f5fc056eac41558a964f96daa7f27c', '2022-08-20 08:52:48', NULL, NULL, '0', 'a2a74b80a823436fb51fef5ca56461c5');
INSERT INTO `tbl_clue_remark` VALUES ('f9f2e184f7084e508d0bd4269c2cd311', '公司就是需要你这样的人才，修改', '06f5fc056eac41558a964f96daa7f27c', '2022-08-20 11:53:39', '06f5fc056eac41558a964f96daa7f27c', '2022-08-20 12:10:17', '1', 'a2a74b80a823436fb51fef5ca56461c5');

-- ----------------------------
-- Table structure for tbl_contacts
-- ----------------------------
DROP TABLE IF EXISTS `tbl_contacts`;
CREATE TABLE `tbl_contacts`  (
  `id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `owner` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `source` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `customer_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fullname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `appellation` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mphone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `job` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `edit_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `edit_time` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `contact_summary` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `next_contact_time` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_contacts
-- ----------------------------
INSERT INTO `tbl_contacts` VALUES ('128adee5965748fcbcfc9dfab8ed8685', '40f6cdea0bd34aceb77492a1656d9fb3', '12302fd42bd349c1bb768b19600e6b20', 'e66dbfb83c23457681d8a50048dfde44', '涂某', 'e5f383d2622b4fc0959f4fe131dafc80', 'hao123@qq.com', '13498791279', 'CTO', '40f6cdea0bd34aceb77492a1656d9fb3', '2022-08-21 15:58:01', NULL, NULL, '描述信息123', '联系纪要123', '2022-08-27', '北京市海淀区');
INSERT INTO `tbl_contacts` VALUES ('f1fbeb6775b247ffb552e151e6f48358', '06f5fc056eac41558a964f96daa7f27c', 'fd677cc3b5d047d994e16f6ece4d3d45', '7f9eb9e70b1a48099c7c2e22dd5ce93d', '老铁', '31539e7ed8c848fc913e1c2c93d76fd1', 'hao123@qq.com', '13498791279', 'UTO', '06f5fc056eac41558a964f96daa7f27c', '2022-08-21 16:05:49', NULL, NULL, '描述信息123', '联系纪要123', '2022-09-10', '上海市浦东区');

-- ----------------------------
-- Table structure for tbl_contacts_activity_relation
-- ----------------------------
DROP TABLE IF EXISTS `tbl_contacts_activity_relation`;
CREATE TABLE `tbl_contacts_activity_relation`  (
  `id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `contacts_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `activity_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_contacts_activity_relation
-- ----------------------------
INSERT INTO `tbl_contacts_activity_relation` VALUES ('2e1c3050829147a2829aabbaa26f58b5', '128adee5965748fcbcfc9dfab8ed8685', '02366f5947d3443d9df807bfd9920a06');
INSERT INTO `tbl_contacts_activity_relation` VALUES ('559f6076ffe54249a1c8f984cbb60880', 'f1fbeb6775b247ffb552e151e6f48358', '46a9ec3263c1409b8858735035be358c');
INSERT INTO `tbl_contacts_activity_relation` VALUES ('6cf709f3a5e64270be1b7f671e0244fe', 'f1fbeb6775b247ffb552e151e6f48358', '4778e0bbbec2425cbd6a90aee5d9f191');
INSERT INTO `tbl_contacts_activity_relation` VALUES ('767932e3ef75402abf327fcb8e2de377', '128adee5965748fcbcfc9dfab8ed8685', 'b44f6ae3f152442f8337a178401fad10');
INSERT INTO `tbl_contacts_activity_relation` VALUES ('9a4388c23a3d4fd7b4d081bfcdbf8295', '128adee5965748fcbcfc9dfab8ed8685', 'afb55c84110b490aa20393965e39e670');
INSERT INTO `tbl_contacts_activity_relation` VALUES ('ab93c2feb6df4e6098acf4de4bd4e3d5', 'f1fbeb6775b247ffb552e151e6f48358', 'afb55c84110b490aa20393965e39e670');
INSERT INTO `tbl_contacts_activity_relation` VALUES ('b2afc56809cb4c9c8bb7428050548478', 'f1fbeb6775b247ffb552e151e6f48358', '6d93f4e42099485a99639b9706ffe970');

-- ----------------------------
-- Table structure for tbl_contacts_remark
-- ----------------------------
DROP TABLE IF EXISTS `tbl_contacts_remark`;
CREATE TABLE `tbl_contacts_remark`  (
  `id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `note_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `edit_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `edit_time` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `edit_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `contacts_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_contacts_remark
-- ----------------------------
INSERT INTO `tbl_contacts_remark` VALUES ('10b7d5eff5c6424d87407c2dea5fbd5c', '测试线索转换23', '06f5fc056eac41558a964f96daa7f27c', '2022-08-21 16:05:13', NULL, NULL, '0', 'f1fbeb6775b247ffb552e151e6f48358');
INSERT INTO `tbl_contacts_remark` VALUES ('12724cfba5c24863b75c0f2cd28ff800', '测试线索转换02', '40f6cdea0bd34aceb77492a1656d9fb3', '2022-08-21 15:41:24', NULL, NULL, '0', '128adee5965748fcbcfc9dfab8ed8685');
INSERT INTO `tbl_contacts_remark` VALUES ('21f16dabe6dd436d830e1fc6db745c14', '测试线索转换03', '40f6cdea0bd34aceb77492a1656d9fb3', '2022-08-21 15:41:28', NULL, NULL, '0', '128adee5965748fcbcfc9dfab8ed8685');
INSERT INTO `tbl_contacts_remark` VALUES ('39e69fe6c3554256b5f6b220640e756f', '测试线索转换24', '06f5fc056eac41558a964f96daa7f27c', '2022-08-21 16:05:09', NULL, NULL, '0', 'f1fbeb6775b247ffb552e151e6f48358');
INSERT INTO `tbl_contacts_remark` VALUES ('511730ae52b4438a87291d1ad819066a', '测试线索转换01', '40f6cdea0bd34aceb77492a1656d9fb3', '2022-08-21 15:41:11', NULL, NULL, '0', '128adee5965748fcbcfc9dfab8ed8685');
INSERT INTO `tbl_contacts_remark` VALUES ('caf9ef9c937a4a338c5c629df434fc4e', '测试线索转换22', '06f5fc056eac41558a964f96daa7f27c', '2022-08-21 16:05:05', NULL, NULL, '0', 'f1fbeb6775b247ffb552e151e6f48358');

-- ----------------------------
-- Table structure for tbl_customer
-- ----------------------------
DROP TABLE IF EXISTS `tbl_customer`;
CREATE TABLE `tbl_customer`  (
  `id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `owner` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `website` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `edit_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `edit_time` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `contact_summary` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `next_contact_time` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_customer
-- ----------------------------
INSERT INTO `tbl_customer` VALUES ('6bedb7da5a1648f692ae19144851f3e1', '40f6cdea0bd34aceb77492a1656d9fb3', '噗噗咧咧', NULL, NULL, '40f6cdea0bd34aceb77492a1656d9fb3', '2022-08-22 12:42:18', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_customer` VALUES ('7f9eb9e70b1a48099c7c2e22dd5ce93d', '06f5fc056eac41558a964f96daa7f27c', '动力节点', 'http://www.baidu.com', '0511-4405222', '06f5fc056eac41558a964f96daa7f27c', '2022-08-21 16:05:49', NULL, NULL, '联系纪要123', '2022-09-10', '描述信息123', '上海市浦东区');
INSERT INTO `tbl_customer` VALUES ('e66dbfb83c23457681d8a50048dfde44', '40f6cdea0bd34aceb77492a1656d9fb3', '动力节点02', 'http://www.baidu.com', '0511-4405222', '40f6cdea0bd34aceb77492a1656d9fb3', '2022-08-21 15:58:01', NULL, NULL, '联系纪要123', '2022-08-27', '描述信息123', '北京市海淀区');

-- ----------------------------
-- Table structure for tbl_customer_remark
-- ----------------------------
DROP TABLE IF EXISTS `tbl_customer_remark`;
CREATE TABLE `tbl_customer_remark`  (
  `id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `note_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `edit_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `edit_time` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `edit_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `customer_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_customer_remark
-- ----------------------------
INSERT INTO `tbl_customer_remark` VALUES ('1c6c4dc26850476cb1997c3f721316ad', '测试线索转换22', '06f5fc056eac41558a964f96daa7f27c', '2022-08-21 16:05:05', NULL, NULL, '0', '7f9eb9e70b1a48099c7c2e22dd5ce93d');
INSERT INTO `tbl_customer_remark` VALUES ('9ad75f5f706a4e60bb63bbcea892a924', '测试线索转换03', '40f6cdea0bd34aceb77492a1656d9fb3', '2022-08-21 15:41:28', NULL, NULL, '0', 'e66dbfb83c23457681d8a50048dfde44');
INSERT INTO `tbl_customer_remark` VALUES ('b1f02f0d06234914b2096b04e4ac8854', '测试线索转换01', '40f6cdea0bd34aceb77492a1656d9fb3', '2022-08-21 15:41:11', NULL, NULL, '0', 'e66dbfb83c23457681d8a50048dfde44');
INSERT INTO `tbl_customer_remark` VALUES ('d6fab379c7234ecfb971ba7693ec13fa', '测试线索转换24', '06f5fc056eac41558a964f96daa7f27c', '2022-08-21 16:05:09', NULL, NULL, '0', '7f9eb9e70b1a48099c7c2e22dd5ce93d');
INSERT INTO `tbl_customer_remark` VALUES ('d74d43eb9770471386b3e3744da4ee13', '测试线索转换23', '06f5fc056eac41558a964f96daa7f27c', '2022-08-21 16:05:13', NULL, NULL, '0', '7f9eb9e70b1a48099c7c2e22dd5ce93d');
INSERT INTO `tbl_customer_remark` VALUES ('d81c5f134ba04a1cb516007b86c3e8cf', '测试线索转换02', '40f6cdea0bd34aceb77492a1656d9fb3', '2022-08-21 15:41:24', NULL, NULL, '0', 'e66dbfb83c23457681d8a50048dfde44');

-- ----------------------------
-- Table structure for tbl_dic_type
-- ----------------------------
DROP TABLE IF EXISTS `tbl_dic_type`;
CREATE TABLE `tbl_dic_type`  (
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编码是主键，不能为空，不能含有中文。',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_dic_type
-- ----------------------------
INSERT INTO `tbl_dic_type` VALUES ('appellation', '称呼', '');
INSERT INTO `tbl_dic_type` VALUES ('clueState', '线索状态', '');
INSERT INTO `tbl_dic_type` VALUES ('returnPriority', '回访优先级', '');
INSERT INTO `tbl_dic_type` VALUES ('returnState', '回访状态', '');
INSERT INTO `tbl_dic_type` VALUES ('source', '来源', '');
INSERT INTO `tbl_dic_type` VALUES ('stage', '阶段', '');
INSERT INTO `tbl_dic_type` VALUES ('transactionType', '交易类型', '');

-- ----------------------------
-- Table structure for tbl_dic_value
-- ----------------------------
DROP TABLE IF EXISTS `tbl_dic_value`;
CREATE TABLE `tbl_dic_value`  (
  `id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键，采用UUID',
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '不能为空，并且要求同一个字典类型下字典值不能重复，具有唯一性。',
  `text` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '可以为空',
  `order_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '可以为空，但不为空的时候，要求必须是正整数',
  `type_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '外键',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_dic_value
-- ----------------------------
INSERT INTO `tbl_dic_value` VALUES ('06e3cbdf10a44eca8511dddfc6896c55', '虚假线索', '虚假线索', '4', 'clueState');
INSERT INTO `tbl_dic_value` VALUES ('0fe33840c6d84bf78df55d49b169a894', '销售邮件', '销售邮件', '8', 'source');
INSERT INTO `tbl_dic_value` VALUES ('12302fd42bd349c1bb768b19600e6b20', '交易会', '交易会', '11', 'source');
INSERT INTO `tbl_dic_value` VALUES ('1615f0bb3e604552a86cde9a2ad45bea', '最高', '最高', '2', 'returnPriority');
INSERT INTO `tbl_dic_value` VALUES ('176039d2a90e4b1a81c5ab8707268636', '教授', '教授', '5', 'appellation');
INSERT INTO `tbl_dic_value` VALUES ('1e0bd307e6ee425599327447f8387285', '将来联系', '将来联系', '2', 'clueState');
INSERT INTO `tbl_dic_value` VALUES ('2173663b40b949ce928db92607b5fe57', '丢失线索', '丢失线索', '5', 'clueState');
INSERT INTO `tbl_dic_value` VALUES ('2876690b7e744333b7f1867102f91153', '未启动', '未启动', '1', 'returnState');
INSERT INTO `tbl_dic_value` VALUES ('29805c804dd94974b568cfc9017b2e4c', '成交', '成交', '7', 'stage');
INSERT INTO `tbl_dic_value` VALUES ('310e6a49bd8a4962b3f95a1d92eb76f4', '试图联系', '试图联系', '1', 'clueState');
INSERT INTO `tbl_dic_value` VALUES ('31539e7ed8c848fc913e1c2c93d76fd1', '博士', '博士', '4', 'appellation');
INSERT INTO `tbl_dic_value` VALUES ('37ef211719134b009e10b7108194cf46', '资质审查', '资质审查', '1', 'stage');
INSERT INTO `tbl_dic_value` VALUES ('391807b5324d4f16bd58c882750ee632', '丢失的线索', '丢失的线索', '8', 'stage');
INSERT INTO `tbl_dic_value` VALUES ('3a39605d67da48f2a3ef52e19d243953', '聊天', '聊天', '14', 'source');
INSERT INTO `tbl_dic_value` VALUES ('474ab93e2e114816abf3ffc596b19131', '低', '低', '3', 'returnPriority');
INSERT INTO `tbl_dic_value` VALUES ('48512bfed26145d4a38d3616e2d2cf79', '广告', '广告', '1', 'source');
INSERT INTO `tbl_dic_value` VALUES ('4d03a42898684135809d380597ed3268', '合作伙伴研讨会', '合作伙伴研讨会', '9', 'source');
INSERT INTO `tbl_dic_value` VALUES ('59795c49896947e1ab61b7312bd0597c', '先生', '先生', '1', 'appellation');
INSERT INTO `tbl_dic_value` VALUES ('5c6e9e10ca414bd499c07b886f86202a', '高', '高', '1', 'returnPriority');
INSERT INTO `tbl_dic_value` VALUES ('67165c27076e4c8599f42de57850e39c', '夫人', '夫人', '2', 'appellation');
INSERT INTO `tbl_dic_value` VALUES ('68a1b1e814d5497a999b8f1298ace62b', '因竞争丢失关闭', '因竞争丢失关闭', '9', 'stage');
INSERT INTO `tbl_dic_value` VALUES ('6b86f215e69f4dbd8a2daa22efccf0cf', 'web调研', 'web调研', '13', 'source');
INSERT INTO `tbl_dic_value` VALUES ('72f13af8f5d34134b5b3f42c5d477510', '合作伙伴', '合作伙伴', '6', 'source');
INSERT INTO `tbl_dic_value` VALUES ('7c07db3146794c60bf975749952176df', '未联系', '未联系', '6', 'clueState');
INSERT INTO `tbl_dic_value` VALUES ('86c56aca9eef49058145ec20d5466c17', '内部研讨会', '内部研讨会', '10', 'source');
INSERT INTO `tbl_dic_value` VALUES ('9095bda1f9c34f098d5b92fb870eba17', '进行中', '进行中', '3', 'returnState');
INSERT INTO `tbl_dic_value` VALUES ('954b410341e7433faa468d3c4f7cf0d2', '已有业务', '已有业务', '1', 'transactionType');
INSERT INTO `tbl_dic_value` VALUES ('966170ead6fa481284b7d21f90364984', '已联系', '已联系', '3', 'clueState');
INSERT INTO `tbl_dic_value` VALUES ('96b03f65dec748caa3f0b6284b19ef2f', '推迟', '推迟', '2', 'returnState');
INSERT INTO `tbl_dic_value` VALUES ('97d1128f70294f0aac49e996ced28c8a', '新业务', '新业务', '2', 'transactionType');
INSERT INTO `tbl_dic_value` VALUES ('9ca96290352c40688de6596596565c12', '完成', '完成', '4', 'returnState');
INSERT INTO `tbl_dic_value` VALUES ('9e6d6e15232549af853e22e703f3e015', '需要条件', '需要条件', '7', 'clueState');
INSERT INTO `tbl_dic_value` VALUES ('9ff57750fac04f15b10ce1bbb5bb8bab', '需求分析', '需求分析', '2', 'stage');
INSERT INTO `tbl_dic_value` VALUES ('a70dc4b4523040c696f4421462be8b2f', '等待某人', '等待某人', '5', 'returnState');
INSERT INTO `tbl_dic_value` VALUES ('a83e75ced129421dbf11fab1f05cf8b4', '推销电话', '推销电话', '2', 'source');
INSERT INTO `tbl_dic_value` VALUES ('ab8472aab5de4ae9b388b2f1409441c1', '常规', '常规', '5', 'returnPriority');
INSERT INTO `tbl_dic_value` VALUES ('ab8c2a3dc05f4e3dbc7a0405f721b040', '提案/报价', '提案/报价', '5', 'stage');
INSERT INTO `tbl_dic_value` VALUES ('b924d911426f4bc5ae3876038bc7e0ad', 'web下载', 'web下载', '12', 'source');
INSERT INTO `tbl_dic_value` VALUES ('c13ad8f9e2f74d5aa84697bb243be3bb', '价值建议', '价值建议', '3', 'stage');
INSERT INTO `tbl_dic_value` VALUES ('c83c0be184bc40708fd7b361b6f36345', '最低', '最低', '4', 'returnPriority');
INSERT INTO `tbl_dic_value` VALUES ('db867ea866bc44678ac20c8a4a8bfefb', '员工介绍', '员工介绍', '3', 'source');
INSERT INTO `tbl_dic_value` VALUES ('e44be1d99158476e8e44778ed36f4355', '确定决策者', '确定决策者', '4', 'stage');
INSERT INTO `tbl_dic_value` VALUES ('e5f383d2622b4fc0959f4fe131dafc80', '女士', '女士', '3', 'appellation');
INSERT INTO `tbl_dic_value` VALUES ('e81577d9458f4e4192a44650a3a3692b', '谈判/复审', '谈判/复审', '6', 'stage');
INSERT INTO `tbl_dic_value` VALUES ('fb65d7fdb9c6483db02713e6bc05dd19', '在线商场', '在线商场', '5', 'source');
INSERT INTO `tbl_dic_value` VALUES ('fd677cc3b5d047d994e16f6ece4d3d45', '公开媒介', '公开媒介', '7', 'source');
INSERT INTO `tbl_dic_value` VALUES ('ff802a03ccea4ded8731427055681d48', '外部介绍', '外部介绍', '4', 'source');

-- ----------------------------
-- Table structure for tbl_tran
-- ----------------------------
DROP TABLE IF EXISTS `tbl_tran`;
CREATE TABLE `tbl_tran`  (
  `id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `owner` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `money` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `expected_date` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `customer_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `stage` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `source` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `activity_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `contacts_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `edit_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `edit_time` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `contact_summary` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `next_contact_time` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_tran
-- ----------------------------
INSERT INTO `tbl_tran` VALUES ('110b0845511c460cab9ab70ab86f4c34', '40f6cdea0bd34aceb77492a1656d9fb3', '3000', '一次测试交易', '2022-08-22', 'e66dbfb83c23457681d8a50048dfde44', 'e44be1d99158476e8e44778ed36f4355', '954b410341e7433faa468d3c4f7cf0d2', '4d03a42898684135809d380597ed3268', '02366f5947d3443d9df807bfd9920a06', '128adee5965748fcbcfc9dfab8ed8685', '40f6cdea0bd34aceb77492a1656d9fb3', '2022-08-22 11:48:36', NULL, NULL, '秒', '啊', '2022-08-15');
INSERT INTO `tbl_tran` VALUES ('111111', '', NULL, NULL, NULL, NULL, '68a1b1e814d5497a999b8f1298ace62b', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_tran` VALUES ('231', '', NULL, NULL, NULL, NULL, '29805c804dd94974b568cfc9017b2e4c', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_tran` VALUES ('321123', '', NULL, NULL, NULL, NULL, '391807b5324d4f16bd58c882750ee632', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_tran` VALUES ('3213', '', NULL, NULL, NULL, NULL, 'e81577d9458f4e4192a44650a3a3692b', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_tran` VALUES ('32131', '', NULL, NULL, NULL, NULL, 'e81577d9458f4e4192a44650a3a3692b', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_tran` VALUES ('692476a13eb8410782a06c5fe219de00', '40f6cdea0bd34aceb77492a1656d9fb3', '20000', '动力节点02-线索转换的交易', '2022-08-21', 'e66dbfb83c23457681d8a50048dfde44', '9ff57750fac04f15b10ce1bbb5bb8bab', '954b410341e7433faa468d3c4f7cf0d2', '4d03a42898684135809d380597ed3268', '02366f5947d3443d9df807bfd9920a06', '128adee5965748fcbcfc9dfab8ed8685', '40f6cdea0bd34aceb77492a1656d9fb3', '2022-08-21 15:58:01', NULL, NULL, '312', '123', '2022-09-22');
INSERT INTO `tbl_tran` VALUES ('97d7564eb37f48e09533fa838a6c7ab9', '40f6cdea0bd34aceb77492a1656d9fb3', '12312', '京东-商城', '2022-09-08', '6bedb7da5a1648f692ae19144851f3e1', 'c13ad8f9e2f74d5aa84697bb243be3bb', '97d1128f70294f0aac49e996ced28c8a', '6b86f215e69f4dbd8a2daa22efccf0cf', '02366f5947d3443d9df807bfd9920a06', '128adee5965748fcbcfc9dfab8ed8685', '40f6cdea0bd34aceb77492a1656d9fb3', '2022-08-22 12:42:18', NULL, NULL, '123描述', '123联系纪要', '2022-09-05');
INSERT INTO `tbl_tran` VALUES ('ae23a3bacbcd4fa4b0d4be70d4a29990', '', NULL, NULL, NULL, NULL, 'e44be1d99158476e8e44778ed36f4355', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_tran` VALUES ('ae23a3bacbcd4fa4b0d4be70d4a29991', '06f5fc056eac41558a964f96daa7f27c', '1000', '动力节点-', '2022-08-21', '7f9eb9e70b1a48099c7c2e22dd5ce93d', '9ff57750fac04f15b10ce1bbb5bb8bab', '954b410341e7433faa468d3c4f7cf0d2', '4d03a42898684135809d380597ed3268', '02366f5947d3443d9df807bfd9920a06', 'f1fbeb6775b247ffb552e151e6f48358', '06f5fc056eac41558a964f96daa7f27c', '2022-08-21 16:05:49', NULL, NULL, '31', '123', '2022-09-05');
INSERT INTO `tbl_tran` VALUES ('ae23a3bacbcd4fa4b0d4be70d4a29992', NULL, NULL, NULL, NULL, NULL, '37ef211719134b009e10b7108194cf46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_tran` VALUES ('ae23a3bacbcd4fa4b0d4be70d4a29993', '', NULL, NULL, NULL, NULL, '9ff57750fac04f15b10ce1bbb5bb8bab', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_tran` VALUES ('ae23a3bacbcd4fa4b0d4be70d4a29994', '', NULL, NULL, NULL, NULL, 'c13ad8f9e2f74d5aa84697bb243be3bb', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_tran` VALUES ('ae23a3bacbcd4fa4b0d4be70d4a29995', '', NULL, NULL, NULL, NULL, 'e44be1d99158476e8e44778ed36f4355', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_tran` VALUES ('ae23a3bacbcd4fa4b0d4be70d4a29996', '', NULL, NULL, NULL, NULL, 'e44be1d99158476e8e44778ed36f4355', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_tran` VALUES ('ae23a3bacbcd4fa4b0d4be70d4a2999a', '', NULL, NULL, NULL, NULL, 'ab8c2a3dc05f4e3dbc7a0405f721b040', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for tbl_tran_history
-- ----------------------------
DROP TABLE IF EXISTS `tbl_tran_history`;
CREATE TABLE `tbl_tran_history`  (
  `id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `stage` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `money` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `expected_date` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tran_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_tran_history
-- ----------------------------
INSERT INTO `tbl_tran_history` VALUES ('a909396b6a9147e7aa25eb6bd3fe5a43', 'c13ad8f9e2f74d5aa84697bb243be3bb', '12312', '2022-09-08', '2022-08-22 12:42:18', '40f6cdea0bd34aceb77492a1656d9fb3', '97d7564eb37f48e09533fa838a6c7ab9');

-- ----------------------------
-- Table structure for tbl_tran_remark
-- ----------------------------
DROP TABLE IF EXISTS `tbl_tran_remark`;
CREATE TABLE `tbl_tran_remark`  (
  `id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `note_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `edit_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `edit_time` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `edit_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tran_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_tran_remark
-- ----------------------------
INSERT INTO `tbl_tran_remark` VALUES ('1674fc8777a24713adce92845cb65376', '测试线索转换02', '40f6cdea0bd34aceb77492a1656d9fb3', '2022-08-21 15:41:24', NULL, NULL, '0', '692476a13eb8410782a06c5fe219de00');
INSERT INTO `tbl_tran_remark` VALUES ('367480cf18324048b6bcfc1ef5f1590d', '测试线索转换01', '40f6cdea0bd34aceb77492a1656d9fb3', '2022-08-21 15:41:11', NULL, NULL, '0', '692476a13eb8410782a06c5fe219de00');
INSERT INTO `tbl_tran_remark` VALUES ('3abf95b55b874e699951d49ac49724b8', '测试线索转换03', '40f6cdea0bd34aceb77492a1656d9fb3', '2022-08-21 15:41:28', NULL, NULL, '0', '692476a13eb8410782a06c5fe219de00');
INSERT INTO `tbl_tran_remark` VALUES ('91eb1e26dbd24fa7ac10a86b5711df14', '测试线索转换22', '06f5fc056eac41558a964f96daa7f27c', '2022-08-21 16:05:05', NULL, NULL, '0', 'ae23a3bacbcd4fa4b0d4be70d4a29991');
INSERT INTO `tbl_tran_remark` VALUES ('96efe9dbe4e44bfc8596ca1f7848d3d0', '测试线索转换24', '06f5fc056eac41558a964f96daa7f27c', '2022-08-21 16:05:09', NULL, NULL, '0', 'ae23a3bacbcd4fa4b0d4be70d4a29991');
INSERT INTO `tbl_tran_remark` VALUES ('dafff7c1a87a4876a7950a01f062577a', '测试线索转换23', '06f5fc056eac41558a964f96daa7f27c', '2022-08-21 16:05:13', NULL, NULL, '0', 'ae23a3bacbcd4fa4b0d4be70d4a29991');

-- ----------------------------
-- Table structure for tbl_user
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user`;
CREATE TABLE `tbl_user`  (
  `id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'uuid\r\n            ',
  `login_act` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `login_pwd` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码不能采用明文存储，采用密文，MD5加密之后的数据',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `expire_time` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '失效时间为空的时候表示永不失效，失效时间为2018-10-10 10:10:10，则表示在该时间之前该账户可用。',
  `lock_state` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '锁定状态为空时表示启用，为0时表示锁定，为1时表示启用。',
  `deptno` char(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `allow_ips` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '允许访问的IP为空时表示IP地址永不受限，允许访问的IP可以是一个，也可以是多个，当多个IP地址的时候，采用半角逗号分隔。允许IP是192.168.100.2，表示该用户只能在IP地址为192.168.100.2的机器上使用。',
  `createTime` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `edit_time` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `edit_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_user
-- ----------------------------
INSERT INTO `tbl_user` VALUES ('06f5fc056eac41558a964f96daa7f27c', 'ls', '李四', 'yf123', 'ls@163.com', '2023-11-27 21:50:05', '1', 'A001', '192.168.1.1,0:0:0:0:0:0:0:1,127.0.0.1', '2018-11-22 12:11:40', '李四', NULL, NULL);
INSERT INTO `tbl_user` VALUES ('40f6cdea0bd34aceb77492a1656d9fb3', 'zs', '张三', 'yf123', 'zs@qq.com', '2023-11-30 23:50:55', '1', 'A001', '192.168.1.1,192.168.1.2,127.0.0.1,0:0:0:0:0:0:0:1,127.0.0.1', '2018-11-22 11:37:34', '张三', NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
