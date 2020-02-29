/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50727
Source Host           : localhost:3306
Source Database       : pagetest_one

Target Server Type    : MYSQL
Target Server Version : 50727
File Encoding         : 65001

Date: 2020-02-29 14:19:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `tb_user`
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(40) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `phone` varchar(40) DEFAULT NULL,
  `roleName` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('1', '1', '123', '123@qq.com', '10086', '学生');
INSERT INTO `tb_user` VALUES ('2', '2', '123', '123@qq.com', '10086', '老师');
INSERT INTO `tb_user` VALUES ('3', '3', '123', '123@qq.com', '10086', '医生');
INSERT INTO `tb_user` VALUES ('4', '4', '123', '123@qq.com', '10086', '保安');
INSERT INTO `tb_user` VALUES ('5', '5', '123', '123@qq.com', '10086', '警察');
INSERT INTO `tb_user` VALUES ('6', '6', '123', '123@qq.com', '10086', '农民');
INSERT INTO `tb_user` VALUES ('7', '7', '123', '123@qq.com', '10086', '渔民');
