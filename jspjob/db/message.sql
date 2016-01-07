-- MySQL dump 10.10
--
-- Host: localhost    Database: message
-- ------------------------------------------------------
-- Server version	5.0.22-community-nt

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `t_applyjob`
--

DROP TABLE IF EXISTS `t_applyjob`;
CREATE TABLE `t_applyjob` (
  `id` int(10) NOT NULL auto_increment,
  `auserName` varchar(50) default NULL,
  `specialty` varchar(300) default NULL,
  `jobName` varchar(100) default NULL,
  `salary` varchar(10) default NULL,
  `ptime` varchar(100) default NULL,
  `atime` varchar(100) default NULL,
  `other` varchar(300) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- Dumping data for table `t_applyjob`
--


/*!40000 ALTER TABLE `t_applyjob` DISABLE KEYS */;
LOCK TABLES `t_applyjob` WRITE;
INSERT INTO `t_applyjob` VALUES (1,'c0kaishi','??','?????','5000','2009-04-29','2009-5-1','?????');
UNLOCK TABLES;
/*!40000 ALTER TABLE `t_applyjob` ENABLE KEYS */;

--
-- Table structure for table `t_comment`
--

DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `content` text,
  `newsId` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- Dumping data for table `t_comment`
--


/*!40000 ALTER TABLE `t_comment` DISABLE KEYS */;
LOCK TABLES `t_comment` WRITE;
INSERT INTO `t_comment` VALUES (1,'真的该枪毙',4),(2,'真的该枪毙',4);
UNLOCK TABLES;
/*!40000 ALTER TABLE `t_comment` ENABLE KEYS */;

--
-- Table structure for table `t_company`
--

DROP TABLE IF EXISTS `t_company`;
CREATE TABLE `t_company` (
  `id` int(10) NOT NULL auto_increment,
  `cuserName` varchar(50) default NULL,
  `ctrueName` varchar(100) default NULL,
  `tel` varchar(20) default NULL,
  `manage` varchar(200) default NULL,
  `address` varchar(200) default NULL,
  `email` varchar(40) default NULL,
  `resume` text,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- Dumping data for table `t_company`
--


/*!40000 ALTER TABLE `t_company` DISABLE KEYS */;
LOCK TABLES `t_company` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `t_company` ENABLE KEYS */;

--
-- Table structure for table `t_jobseeker`
--

DROP TABLE IF EXISTS `t_jobseeker`;
CREATE TABLE `t_jobseeker` (
  `id` int(10) NOT NULL auto_increment,
  `auserName` varchar(50) default NULL,
  `trueName` varchar(20) default NULL,
  `age` int(3) default NULL,
  `sex` int(3) default NULL,
  `birthday` varchar(30) default NULL,
  `school` varchar(50) default NULL,
  `specialty` varchar(200) default NULL,
  `knowledge` varchar(200) default NULL,
  `email` varchar(40) default NULL,
  `resume` text,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- Dumping data for table `t_jobseeker`
--


/*!40000 ALTER TABLE `t_jobseeker` DISABLE KEYS */;
LOCK TABLES `t_jobseeker` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `t_jobseeker` ENABLE KEYS */;

--
-- Table structure for table `t_news`
--

DROP TABLE IF EXISTS `t_news`;
CREATE TABLE `t_news` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `title` varchar(45) NOT NULL,
  `content` text NOT NULL,
  `createTime` datetime NOT NULL,
  `isDeploy` bit(1) default NULL,
  `deployTime` datetime NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- Dumping data for table `t_news`
--


/*!40000 ALTER TABLE `t_news` DISABLE KEYS */;
LOCK TABLES `t_news` WRITE;
INSERT INTO `t_news` VALUES (2,'河北新闻--重大新闻','<p>\r\n	河北新闻，</p>\r\n','2013-10-18 15:36:40','\0','2013-10-18 15:36:40'),(4,'最高检公布前8月贪腐案','<p>\r\n	<strong>&ldquo;打老虎&rdquo;</strong></p>\r\n<p>\r\n	　　<strong>4名省部级官员被立案</strong></p>\r\n<p>\r\n	　　检察机关高度重视查办大要案，坚决打&ldquo;老虎&rdquo;。今年1月至8月，共立案侦查贪污贿赂犯罪大案18283件，占立案总数的80.8%，同比数量上升5.7%。今年以来，国家发展和改革委员会原副主任刘铁男，广西壮族自治区政协原副主席李达球，内蒙古自治区党委原常委、统战部原部长王素毅，安徽省政府原副省长倪发科，因涉嫌受贿犯罪，先后被检察机关依法立案侦查。</p>\r\n<p>\r\n	　　最高检表示，检察机关注重反贪办案力度、质量、效率、效果的有机统一。今年前8个月，决定起诉贪污贿赂犯罪案件11494件16064人，其中大案8110件、要案872人。铁道部原部长刘志军经北京市检察院第二分院依法提起公诉，被法院以受贿罪、滥用职权罪一审判处死刑，缓期两年执行。济南市检察院对薄熙来受贿、贪污、滥用职权案依法提起公诉，薄熙来一审被判处无期徒刑。</p>\r\n<p>\r\n	　　</p>\r\n','2013-10-18 16:41:07','\0','2013-10-18 16:41:07'),(5,'北京新闻','<p>\r\n	北京故宫信息</p>\r\n','2013-10-20 14:11:58','\0','2013-10-20 14:11:58'),(8,'广东新闻','<p>\r\n	广东新闻，真好</p>\r\n','2013-10-20 15:15:43','\0','2013-10-20 15:15:43');
UNLOCK TABLES;
/*!40000 ALTER TABLE `t_news` ENABLE KEYS */;

--
-- Table structure for table `t_pubjob`
--

DROP TABLE IF EXISTS `t_pubjob`;
CREATE TABLE `t_pubjob` (
  `id` int(10) NOT NULL auto_increment,
  `cusername` varchar(50) default NULL,
  `specialty` varchar(500) default NULL,
  `jobName` varchar(100) default NULL,
  `salary` varchar(10) default NULL,
  `ptime` varchar(30) default NULL,
  `atime` varchar(30) default NULL,
  `other` varchar(200) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- Dumping data for table `t_pubjob`
--


/*!40000 ALTER TABLE `t_pubjob` DISABLE KEYS */;
LOCK TABLES `t_pubjob` WRITE;
INSERT INTO `t_pubjob` VALUES (1,'ccit','??','?????','??','2009-04-29','2009-5-1','');
UNLOCK TABLES;
/*!40000 ALTER TABLE `t_pubjob` ENABLE KEYS */;

--
-- Table structure for table `t_user`
--

DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(10) NOT NULL auto_increment,
  `userName` varchar(40) default NULL,
  `userPass` varchar(50) default NULL,
  `userType` varchar(6) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- Dumping data for table `t_user`
--


/*!40000 ALTER TABLE `t_user` DISABLE KEYS */;
LOCK TABLES `t_user` WRITE;
INSERT INTO `t_user` VALUES (1,'ccit','123456','2'),(2,'c0kaishi','820036','1'),(3,'yufan','123','1'),(4,'admin','admin','3'),(5,'xiaobei','123456','1');
UNLOCK TABLES;
/*!40000 ALTER TABLE `t_user` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

