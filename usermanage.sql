/*
Navicat MySQL Data Transfer

Source Server         : qiuyiliang
Source Server Version : 50729
Source Host           : localhost:3306
Source Database       : usermanage

Target Server Type    : MYSQL
Target Server Version : 50729
File Encoding         : 65001

Date: 2020-06-02 22:33:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_book`
-- ----------------------------
DROP TABLE IF EXISTS `t_book`;
CREATE TABLE `t_book` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` double(10,0) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_book
-- ----------------------------
INSERT INTO `t_book` VALUES ('1', 'java', '10');
INSERT INTO `t_book` VALUES ('2', 'javaweb ', '102');
INSERT INTO `t_book` VALUES ('3', 'python', '19');
INSERT INTO `t_book` VALUES ('4', 'JavaWeb', '210');
INSERT INTO `t_book` VALUES ('5', '数据库', '20');
INSERT INTO `t_book` VALUES ('6', '计算组成原理', '20');
