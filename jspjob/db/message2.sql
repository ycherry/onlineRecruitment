/*
Navicat MySQL Data Transfer

Source Server         : yaya
Source Server Version : 50536
Source Host           : localhost:3306
Source Database       : message

Target Server Type    : MYSQL
Target Server Version : 50536
File Encoding         : 65001

Date: 2016-01-19 17:18:56
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_applyjob`
-- ----------------------------
DROP TABLE IF EXISTS `t_applyjob`;
CREATE TABLE `t_applyjob` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `auserName` varchar(50) DEFAULT NULL,
  `specialty` varchar(300) DEFAULT NULL,
  `jobName` varchar(100) DEFAULT NULL,
  `salary` varchar(10) DEFAULT NULL,
  `ptime` varchar(100) DEFAULT NULL,
  `atime` varchar(100) DEFAULT NULL,
  `other` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_applyjob
-- ----------------------------
INSERT INTO `t_applyjob` VALUES ('1', 'c0kaishi', '??', '?????', '5000', '2009-04-29', '2009-5-1', '?????');
INSERT INTO `t_applyjob` VALUES ('7', 'yaya', 'IT', '开发', '10000', '2016-01-14', '2016-12-12', 'java开发');

-- ----------------------------
-- Table structure for `t_comment`
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `content` text,
  `newsId` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_comment
-- ----------------------------
INSERT INTO `t_comment` VALUES ('1', '真的该枪毙', '4');
INSERT INTO `t_comment` VALUES ('2', '真的该枪毙', '4');

-- ----------------------------
-- Table structure for `t_company`
-- ----------------------------
DROP TABLE IF EXISTS `t_company`;
CREATE TABLE `t_company` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `cuserName` varchar(50) DEFAULT NULL,
  `ctrueName` varchar(100) DEFAULT NULL,
  `tel` varchar(20) DEFAULT NULL,
  `manage` varchar(200) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `resume` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_company
-- ----------------------------
INSERT INTO `t_company` VALUES ('17', 'abc', '阿百川', '13212319121', '信息技术', '武汉', '4370920497@163.com', 'IT');

-- ----------------------------
-- Table structure for `t_jobseeker`
-- ----------------------------
DROP TABLE IF EXISTS `t_jobseeker`;
CREATE TABLE `t_jobseeker` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `auserName` varchar(50) DEFAULT NULL,
  `trueName` varchar(20) DEFAULT NULL,
  `age` int(3) DEFAULT NULL,
  `sex` int(3) DEFAULT NULL,
  `birthday` varchar(30) DEFAULT NULL,
  `school` varchar(50) DEFAULT NULL,
  `specialty` varchar(200) DEFAULT NULL,
  `knowledge` varchar(200) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `resume` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_jobseeker
-- ----------------------------
INSERT INTO `t_jobseeker` VALUES ('1', 'user1', '用户1', '0', '1', 'null', '不详', '不祥', '不祥', 'null', '无');
INSERT INTO `t_jobseeker` VALUES ('5', 'qzzhuce', '求职注册', '0', '1', 'null', '不详', '不祥', '不祥', 'null', '无');
INSERT INTO `t_jobseeker` VALUES ('6', 'qzzhuce1', '注册1', '0', '1', 'null', '不详', '不祥', '不祥', 'null', '无');
INSERT INTO `t_jobseeker` VALUES ('7', 'zhuceqz', '求职注册', '0', '1', 'null', '不详', '不祥', '不祥', 'null', '无');
INSERT INTO `t_jobseeker` VALUES ('8', 'yaya1', '鸭鸭', '0', '1', 'null', '不详', '不祥', '不祥', 'null', '无');
INSERT INTO `t_jobseeker` VALUES ('9', 'yaya', '鸭鸭', '21', '0', '2012-12-12', '中南财经政法大学', '信管', '本科', '1120065434@qq.com', '无');

-- ----------------------------
-- Table structure for `t_news`
-- ----------------------------
DROP TABLE IF EXISTS `t_news`;
CREATE TABLE `t_news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `content` text NOT NULL,
  `createTime` datetime NOT NULL,
  `isDeploy` bit(1) DEFAULT NULL,
  `deployTime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_news
-- ----------------------------
INSERT INTO `t_news` VALUES ('2', '河北新闻--重大新闻', '<p>\r\n	河北新闻，</p>\r\n', '2013-10-18 15:36:40', '', '2013-10-18 15:36:40');
INSERT INTO `t_news` VALUES ('4', '最高检公布前8月贪腐案', '<p>\r\n	<strong>&ldquo;打老虎&rdquo;</strong></p>\r\n<p>\r\n	　　<strong>4名省部级官员被立案</strong></p>\r\n<p>\r\n	　　检察机关高度重视查办大要案，坚决打&ldquo;老虎&rdquo;。今年1月至8月，共立案侦查贪污贿赂犯罪大案18283件，占立案总数的80.8%，同比数量上升5.7%。今年以来，国家发展和改革委员会原副主任刘铁男，广西壮族自治区政协原副主席李达球，内蒙古自治区党委原常委、统战部原部长王素毅，安徽省政府原副省长倪发科，因涉嫌受贿犯罪，先后被检察机关依法立案侦查。</p>\r\n<p>\r\n	　　最高检表示，检察机关注重反贪办案力度、质量、效率、效果的有机统一。今年前8个月，决定起诉贪污贿赂犯罪案件11494件16064人，其中大案8110件、要案872人。铁道部原部长刘志军经北京市检察院第二分院依法提起公诉，被法院以受贿罪、滥用职权罪一审判处死刑，缓期两年执行。济南市检察院对薄熙来受贿、贪污、滥用职权案依法提起公诉，薄熙来一审被判处无期徒刑。</p>\r\n<p>\r\n	　　</p>\r\n', '2013-10-18 16:41:07', '', '2013-10-18 16:41:07');
INSERT INTO `t_news` VALUES ('5', '北京新闻', '<p>\r\n	北京故宫信息</p>\r\n', '2013-10-20 14:11:58', '', '2013-10-20 14:11:58');
INSERT INTO `t_news` VALUES ('8', '广东新闻', '<p>\r\n	广东新闻，真好</p>\r\n', '2013-10-20 15:15:43', '', '2013-10-20 15:15:43');

-- ----------------------------
-- Table structure for `t_pubjob`
-- ----------------------------
DROP TABLE IF EXISTS `t_pubjob`;
CREATE TABLE `t_pubjob` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `cusername` varchar(50) DEFAULT NULL,
  `specialty` varchar(500) DEFAULT NULL,
  `jobName` varchar(100) DEFAULT NULL,
  `education` varchar(10) DEFAULT NULL,
  `salary` varchar(10) DEFAULT NULL,
  `ptime` varchar(30) DEFAULT NULL,
  `atime` varchar(30) DEFAULT NULL,
  `other` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_pubjob
-- ----------------------------
INSERT INTO `t_pubjob` VALUES ('1', 'ccit', '??', '?????', 'aa', '??', '2009-04-29', '2009-5-1', '');
INSERT INTO `t_pubjob` VALUES ('3', 'abc', 'IT', 'java开发', 'aa', '9000', '2016-01-14', '2016-12-02', 'null');
INSERT INTO `t_pubjob` VALUES ('5', 'abc', '网络安全', '网络工程师', '本科', '10000', '2016-01-19', '2012-12-12', '岗位要求：1、熟悉计算机系统、网络操作系统、系统安全和数据安全、计算机网络体系结构和网络协议等相关知识；2、熟练掌握网络安全和主要的安全协议与安全系统、 网络通讯、网络管理、局域网、互联网、VPN、IP路由规划等相关技术；3、熟悉思科、H3C等主流产品；熟悉防火墙，IPS，SSL VPN技术，熟悉网络设备、Windows服务器、Linux服务器等。');

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `userName` varchar(40) DEFAULT NULL,
  `userPass` varchar(50) DEFAULT NULL,
  `userType` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'ccit', '123456', '2');
INSERT INTO `t_user` VALUES ('2', 'c0kaishi', '820036', '1');
INSERT INTO `t_user` VALUES ('3', 'yufan', '123', '1');
INSERT INTO `t_user` VALUES ('4', 'admin', 'admin', '3');
INSERT INTO `t_user` VALUES ('5', 'xiaobei', '123456', '1');
INSERT INTO `t_user` VALUES ('6', 'user1', '123456', '1');
INSERT INTO `t_user` VALUES ('14', 'qzzhuce', '123456', '1');
INSERT INTO `t_user` VALUES ('16', 'qzzhuce1', '123456', '1');
INSERT INTO `t_user` VALUES ('18', 'zhuceqz', '123456', '1');
INSERT INTO `t_user` VALUES ('24', 'yaya1', '123456', '1');
INSERT INTO `t_user` VALUES ('31', 'yaya', '123456', '1');
INSERT INTO `t_user` VALUES ('32', 'abc', '123456', '2');
