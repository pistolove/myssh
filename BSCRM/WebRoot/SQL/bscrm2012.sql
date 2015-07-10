/*
SQLyog Ultimate v8.71 
MySQL - 5.1.51-community : Database - crm2012
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`crm2012` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;

USE `crm2012`;

/*Table structure for table `course` */

DROP TABLE IF EXISTS `course`;

CREATE TABLE `course` (
  `courseId` int(11) NOT NULL AUTO_INCREMENT,
  `className` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `target` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `textbook` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `curNumber` int(11) DEFAULT NULL,
  `status` varchar(4) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`courseId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `course` */

insert  into `course`(`courseId`,`className`,`price`,`target`,`textbook`,`amount`,`curNumber`,`status`) values (1,'PHP就业班 北京--05月17日',1000,'大专学历以上','HTML、CSS、XML、Javascript、Ajax、Jquery、Mysql数据库、LAMP（Linux、Apache、MySQL、PHP）',80,81,'0'),(2,'PHP就业班 北京--05月28号',3800,'大专学历以上','photoshop、illustrator、版式布局及配色技巧、UI用户界面设计、Flash互动广告动画设计、HTML/XHTML、CSS、Dreamweaver、Javascript ',80,74,'0'),(3,'网页平面设计就业班 北京--03月28号',4000,'大专学历以上','photoshop、illustrator、版式布局及配色技巧、UI用户界面设计、Flash互动广告动画设计、HTML/XHTML、CSS、Dreamweaver、Javascript ',80,80,'1'),(4,'.Net培训精品就业班 北京-5月15日',6800,'本课适合于计算机专业，有一定JavaScript基础、通过入学考核的未就业人士','	 HTML基础加强、CSS（包含Div+CSS布局）、JavaScript、Dom（事件、window对象、document对象、定时器、动态Dom、跨浏览器兼容性解决方案、Internet Explorer Developer Toolbar）、JQuery',80,67,'0'),(5,'.Net培训基础加强班 北京-05-23',1980,'大专及以上学历','C#与.Net简介、VisualStudio的使用、基本的输出语句、变量与类型、赋值表达式与基本输入语句、类型转换、算术表达式、bool变量与逻辑表达式、选择结构（if、switch-case）、三元表达式、循环结构',80,56,'0'),(6,'Java基础与加强班 -北京-04-27',2000,'本科级以上学历','《Java就业培训教程》                    作者：张孝祥      清华大学出版社\n《JavaScript网页开发—体验式学习教程》  作者：张孝祥      清华大学出版社\n',80,80,'1'),(7,'JavaEE物联云就业班 北京05-23',7800,'本课适合于计算机专业，有一定Java\\JavaScript基础、通过入学考核的未就业人士','《深入体验Java Web开发内幕——高级特性 》	\n《Java就业培训教程》	\n《深入体验Java Web开发内幕——核心基础 》	\n《EJB3.0入门经典》	\n《JavaScript网页开发－体验式学习教程 》',80,78,'0'),(8,'JavaEE物联冲刺班 北京-05-03',6800,'本课适合于有一定Java\\JavaScript\\JavaWEB\\数据库基础的学生；特别适合于大专院校计算机专业的学生，和网上学习过各类视频教程的未就业人士。','《深入体验Java Web开发内幕——高级特性 》	\n《Java就业培训教程》	\n《深入体验Java Web开发内幕——核心基础 》\n《EJB3.0入门经典》	\n《JavaScript网页开发－体验式学习教程 》',80,67,'0'),(9,'3G/4G-Android+物联就业班',7000,'本课适合于计算机专业，有一定Java\\JavaScript基础、通过入学考核的未就业人士','《深入体验Java Web开发内幕——高级特性 》	 《Java就业培训教程》	 《深入体验Java Web开发内幕——核心基础 》 《EJB3.0入门经典》	 《JavaScript网页开发－体验式学习教程 》',80,56,'0'),(10,'Android基础与项目+物联冲刺班',7000,'适合掌握了JavaScript、JSON、JavaWEB、JDBC、数据库基础的学生。注：上过Java基础班的学生需要再学习JavaEE就业班前面一个半月的课才能达到入学要求。','《深入体验Java Web开发内幕——高级特性 》	 《Java就业培训教程》	 《深入体验Java Web开发内幕——核心基础 》 《EJB3.0入门经典》	 《JavaScript网页开发－体验式学习教程 》',80,76,'0');

/*Table structure for table `role_operate` */

DROP TABLE IF EXISTS `role_operate`;

CREATE TABLE `role_operate` (
  `roleId` int(11) NOT NULL,
  `operateId` int(11) NOT NULL,
  PRIMARY KEY (`roleId`,`operateId`),
  KEY `FKCB875ABBB588A63D` (`operateId`),
  KEY `FKCB875ABBFEF0A40E` (`roleId`),
  CONSTRAINT `FKCB875ABBB588A63D` FOREIGN KEY (`operateId`) REFERENCES `sys_operate` (`operateId`),
  CONSTRAINT `FKCB875ABBFEF0A40E` FOREIGN KEY (`roleId`) REFERENCES `sys_role` (`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `role_operate` */

insert  into `role_operate`(`roleId`,`operateId`) values (2,1),(3,1),(4,1),(2,2),(3,2),(2,3),(3,3),(2,4),(3,4),(2,5),(3,5),(2,6),(3,6),(2,7),(3,7),(2,8),(3,8),(2,9),(3,9),(4,9),(2,10),(3,10),(2,11),(3,11),(2,12),(3,12),(2,13),(3,13),(2,14),(3,14),(2,15),(3,15),(4,15),(2,16),(3,16),(2,17),(3,17),(2,18),(3,18),(2,19),(3,19),(2,20),(3,20),(2,21),(3,21),(4,21),(2,22),(3,22),(2,23),(3,23),(2,24),(3,24),(2,25),(3,25),(2,26),(3,26),(2,27),(3,27),(4,27),(2,28),(3,28),(2,29),(3,29),(2,30),(3,30),(2,31),(3,31),(2,32),(4,32),(2,33),(2,34),(2,35),(2,36),(2,37),(2,38),(2,39),(2,40),(2,41),(2,42),(2,43),(2,44),(2,45),(2,46),(2,47);

/*Table structure for table `salary` */

DROP TABLE IF EXISTS `salary`;

CREATE TABLE `salary` (
  `salaryId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `userName` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `groupName` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `payday` date DEFAULT NULL,
  `roomSurcharge` float DEFAULT NULL,
  `mealAllowance` float DEFAULT NULL,
  `grossPay` float DEFAULT NULL,
  `providentFund` float DEFAULT NULL,
  `insurance` float DEFAULT NULL,
  `overtimeCharges` float DEFAULT NULL,
  `attendance` float DEFAULT NULL,
  `taxes` float DEFAULT NULL,
  `summation` float DEFAULT NULL,
  `remark` text COLLATE utf8_bin,
  PRIMARY KEY (`salaryId`),
  KEY `FKC9C6C9CA445F978` (`userId`),
  CONSTRAINT `FKC9C6C9CA445F978` FOREIGN KEY (`userId`) REFERENCES `sys_user` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `salary` */

insert  into `salary`(`salaryId`,`userId`,`userName`,`groupName`,`payday`,`roomSurcharge`,`mealAllowance`,`grossPay`,`providentFund`,`insurance`,`overtimeCharges`,`attendance`,`taxes`,`summation`,`remark`) values (1,NULL,'周垂文','售后部','2012-05-09',100,200,2000,100,100,50,50,20,1880,'这个月你没有很多工资哦，呵呵呵得加油哦！！！<img src=\"http://localhost:8080/BSCRM/ui/kindeditor4/plugins/emoticons/images/0.gif\" border=\"0\" alt=\"\" />'),(2,3,'单崇真','售后部','2012-05-09',100,200,2200,100,100,100,0,20,2180,'比大锤卖力啊呵呵呵加油吧，工资会慢慢涨的哦！<img src=\"http://localhost:8080/BSCRM/ui/kindeditor4/plugins/emoticons/images/13.gif\" border=\"0\" alt=\"\" />'),(3,4,'李远晨','公关部','2012-05-09',100,200,2500,100,100,400,50,24,2726,'努力吧呵呵呵有前途的哦！<img src=\"http://localhost:8080/BSCRM/ui/kindeditor4/plugins/emoticons/images/20.gif\" border=\"0\" alt=\"\" />'),(4,5,'于宇','研发部','2012-05-09',100,200,2200,100,100,50,50,20,2080,'加油哦！呵呵呵，别再玩儿了哦！<img src=\"http://localhost:8080/BSCRM/ui/kindeditor4/plugins/emoticons/images/28.gif\" border=\"0\" alt=\"\" />'),(5,6,'刘铁铮','销售部','2012-05-09',100,200,2300,100,100,50,0,20,2230,'努力哦！呵呵呵<img src=\"http://localhost:8080/BSCRM/ui/kindeditor4/plugins/emoticons/images/21.gif\" border=\"0\" alt=\"\" />'),(6,7,'李强','研发部','2012-05-09',100,200,3000,100,100,50,0,20,2930,'呵呵呵强哥多努力哦！呵呵呵<img src=\"http://localhost:8080/BSCRM/ui/kindeditor4/plugins/emoticons/images/44.gif\" border=\"0\" alt=\"\" />'),(7,NULL,'王鹏飞','研发部','2012-05-09',100,100,2500,100,100,50,0,20,2330,'大飞加油吧！呵呵呵<img src=\"http://localhost:8080/BSCRM/ui/kindeditor4/plugins/emoticons/images/9.gif\" border=\"0\" alt=\"\" />'),(8,9,'陈奇瑞','售后部','2012-05-09',100,200,2222,100,100,50,50,20,2102,'瑞瑞，你的加油哦呵呵呵<img src=\"http://localhost:8080/BSCRM/ui/kindeditor4/plugins/emoticons/images/23.gif\" border=\"0\" alt=\"\" />');

/*Table structure for table `sys_log` */

DROP TABLE IF EXISTS `sys_log`;

CREATE TABLE `sys_log` (
  `logId` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `operateTime` datetime DEFAULT NULL,
  `content` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`logId`)
) ENGINE=InnoDB AUTO_INCREMENT=305 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `sys_log` */

insert  into `sys_log`(`logId`,`username`,`operateTime`,`content`) values (1,'张飞','2012-05-05 21:08:39','进入添加工资页面!'),(2,'张飞','2012-05-08 00:24:07','成功登录!'),(3,'张飞','2012-05-08 00:24:08','浏览所有图片文件!'),(4,'张飞','2012-05-08 00:28:26','查询部门信息!'),(5,'张飞','2012-05-08 00:28:35','进入添加部门的页面!'),(6,'张飞','2012-05-08 00:28:47','进入编辑部门ID为[ 5 ]的部门人员页面!'),(7,'张飞','2012-05-08 00:28:53','查询人员!'),(8,'张飞','2012-05-08 00:28:57','进入用户添加页面!'),(9,'张飞','2012-05-08 00:29:03','查询课程!'),(10,'张飞','2012-05-08 00:29:06','进入课程添加页面!'),(11,'张飞','2012-05-08 00:29:10','查询工资!'),(12,'张飞','2012-05-08 00:29:12','进入添加工资页面!'),(13,'张飞','2012-05-08 00:29:24','查询文件!'),(14,'张飞','2012-05-08 00:29:26','进入上传文件页面!'),(15,'张飞','2012-05-08 00:29:34','查询日志!'),(16,'张飞','2012-05-08 00:31:56','查询日志!'),(17,'张飞','2012-05-08 00:32:06','查询日志!'),(18,'张飞','2012-05-08 00:33:22','查询日志!'),(19,'张飞','2012-05-08 00:33:39','查询日志!'),(20,'张飞','2012-05-08 00:36:46','查询日志!'),(21,'张飞','2012-05-08 00:36:58','查询日志!'),(22,'张飞','2012-05-08 00:38:02','查询日志!'),(23,'张飞','2012-05-08 00:42:40','查询日志!'),(24,'张飞','2012-05-08 00:42:58','查询日志!'),(25,'张飞','2012-05-08 00:43:07','查询日志!'),(26,'张飞','2012-05-08 00:43:36','退出登录!'),(27,'单崇真','2012-05-08 00:43:51','成功登录!'),(28,'单崇真','2012-05-08 00:43:52','浏览所有图片文件!'),(29,'单崇真','2012-05-08 00:43:54','查询日志!'),(30,'单崇真','2012-05-08 00:44:27','查询日志!'),(31,'单崇真','2012-05-08 00:45:26','查询课程!'),(32,'单崇真','2012-05-08 00:45:28','查询人员!'),(33,'单崇真','2012-05-08 00:45:35','查询部门信息!'),(34,'单崇真','2012-05-08 00:45:41','查询日志!'),(35,'单崇真','2012-05-08 00:45:51','查询日志!'),(36,'单崇真','2012-05-08 00:46:19','退出登录!'),(37,'单崇真','2012-05-08 00:46:26','成功登录!'),(38,'单崇真','2012-05-08 00:46:27','浏览所有图片文件!'),(39,'单崇真','2012-05-08 00:46:35','退出登录!'),(40,'张飞','2012-05-08 00:47:32','成功登录!'),(41,'张飞','2012-05-08 00:47:33','浏览所有图片文件!'),(42,'张飞','2012-05-08 00:49:17','查询角色!'),(43,'张飞','2012-05-08 00:49:21','编辑角色ID为[ 2 ]的角色权限!'),(44,'张飞','2012-05-08 00:49:30','查询日志!'),(45,'张飞','2012-05-08 00:49:33','查询文件!'),(46,'张飞','2012-05-08 00:49:42','查询工资!'),(47,'张飞','2012-05-08 00:49:46','查询课程!'),(48,'张飞','2012-05-08 00:50:44','浏览所有图片文件!'),(49,'张飞','2012-05-08 00:50:52','查询部门信息!'),(50,'张飞','2012-05-08 00:51:32','进入添加部门的页面!'),(51,'张飞','2012-05-08 00:53:14','进入编辑部门ID为[ 1 ]的部门人员页面!'),(52,'张飞','2012-05-08 00:53:18','查询角色!'),(53,'张飞','2012-05-08 00:53:20','查询日志!'),(54,'张飞','2012-05-08 00:53:21','查询文件!'),(55,'张飞','2012-05-08 00:53:24','查询工资!'),(56,'张飞','2012-05-08 00:53:25','查询课程!'),(57,'张飞','2012-05-08 00:53:26','查询人员!'),(58,'张飞','2012-05-08 00:53:27','查询部门信息!'),(59,'张飞','2012-05-08 00:53:28','浏览所有图片文件!'),(60,'张飞','2012-05-08 00:53:30','查询日志!'),(61,'张飞','2012-05-08 22:38:04','成功登录!'),(62,'张飞','2012-05-08 22:38:04','浏览所有图片文件!'),(63,'张飞','2012-05-08 22:38:48','查询部门信息!'),(64,'张飞','2012-05-08 22:40:23','浏览所有图片文件!'),(65,'张飞','2012-05-08 22:41:23','查询部门信息!'),(66,'张飞','2012-05-08 22:41:24','查询部门信息!'),(67,'张飞','2012-05-08 22:41:30','浏览所有图片文件!'),(68,'张飞','2012-05-08 22:41:31','浏览所有图片文件!'),(69,'张飞','2012-05-08 22:42:16','查询角色!'),(70,'张飞','2012-05-08 22:42:17','查询角色!'),(71,'张飞','2012-05-08 22:42:18','查询角色!'),(72,'张飞','2012-05-08 22:42:37','查询日志!'),(73,'张飞','2012-05-08 22:42:43','查询日志!'),(74,'张飞','2012-05-08 22:43:08','查询工资!'),(75,'张飞','2012-05-08 22:43:21','查询课程!'),(76,'张飞','2012-05-08 22:43:59','进入编辑[ PHP就业班 北京--05月17日 ]课程页面!'),(77,'张飞','2012-05-08 22:44:01','进入编辑[ PHP就业班 北京--05月17日 ]课程页面!'),(78,'张飞','2012-05-08 22:44:19','进入编辑[ PHP就业班 北京--05月17日 ]课程页面!'),(79,'张飞','2012-05-08 22:44:45','进入编辑[ JavaEE物联云就业班 北京05-23 ]课程页面!'),(80,'张飞','2012-05-08 22:45:10','进入编辑[ JavaEE物联云就业班 北京05-23 ]课程页面!'),(81,'张飞','2012-05-08 22:46:44','进入编辑[ PHP就业班 北京--05月17日 ]课程页面!'),(82,'张飞','2012-05-08 22:46:56','更新[ PHP就业班 北京--05月17日 ]课程!'),(83,'张飞','2012-05-08 22:47:14','查询课程!'),(84,'张飞','2012-05-08 22:47:32','进入编辑[ PHP就业班 北京--05月17日 ]课程页面!'),(85,'张飞','2012-05-08 22:47:43','更新[ PHP就业班 北京--05月17日 ]课程!'),(86,'张飞','2012-05-08 22:47:48','查询课程!'),(87,'张飞','2012-05-08 22:48:27','进入编辑[ PHP就业班 北京--05月28号 ]课程页面!'),(88,'张飞','2012-05-08 22:49:01','查询部门信息!'),(89,'张飞','2012-05-08 22:49:12','进入编辑部门ID为[ 1 ]的部门人员页面!'),(90,'张飞','2012-05-08 22:49:40','进入编辑部门ID为[ 3 ]的部门人员页面!'),(91,'张飞','2012-05-08 22:50:52','查询工资!'),(92,'张飞','2012-05-08 22:54:05','退出登录!'),(93,'单崇真','2012-05-08 22:54:20','成功登录!'),(94,'单崇真','2012-05-08 22:54:21','浏览所有图片文件!'),(95,'单崇真','2012-05-08 22:54:42','查询日志!'),(96,'单崇真','2012-05-08 23:55:56','成功登录!'),(97,'单崇真','2012-05-08 23:55:57','浏览所有图片文件!'),(98,'单崇真','2012-05-09 00:23:26','浏览所有图片文件!'),(99,'单崇真','2012-05-09 00:25:25','浏览所有图片文件!'),(100,'单崇真','2012-05-09 00:25:41','浏览所有图片文件!'),(101,'单崇真','2012-05-09 00:25:50','查询工资!'),(102,'单崇真','2012-05-09 00:25:55','查询文件!'),(103,'单崇真','2012-05-09 00:26:12','查询日志!'),(104,'单崇真','2012-05-09 00:26:17','查询文件!'),(105,'单崇真','2012-05-09 00:26:19','查询工资!'),(106,'单崇真','2012-05-09 00:26:36','查询部门信息!'),(107,'单崇真','2012-05-09 00:26:48','查询人员!'),(108,'单崇真','2012-05-09 00:27:03','查询人员!'),(109,'单崇真','2012-05-09 00:27:06','查询人员!'),(110,'单崇真','2012-05-09 00:27:11','查询日志!'),(111,'单崇真','2012-05-09 00:27:32','查询工资!'),(112,'单崇真','2012-05-09 00:27:37','退出登录!'),(113,'张飞','2012-05-09 00:27:49','成功登录!'),(114,'张飞','2012-05-09 00:27:50','浏览所有图片文件!'),(115,'张飞','2012-05-09 00:27:55','查询权限!'),(116,'张飞','2012-05-09 00:27:58','查询角色!'),(117,'张飞','2012-05-09 00:28:01','查询日志!'),(118,'张飞','2012-05-09 00:28:04','查询文件!'),(119,'张飞','2012-05-09 00:28:06','查询工资!'),(120,'张飞','2012-05-09 00:28:12','进入添加工资页面!'),(121,'张飞','2012-05-09 00:29:36','添加[ 周垂文 ]工资!'),(122,'张飞','2012-05-09 00:29:38','查询工资!'),(123,'张飞','2012-05-09 00:29:43','进入添加工资页面!'),(124,'张飞','2012-05-09 00:33:53','添加[ 单崇真 ]工资!'),(125,'张飞','2012-05-09 00:33:55','查询工资!'),(126,'张飞','2012-05-09 00:33:58','进入添加工资页面!'),(127,'张飞','2012-05-09 00:35:03','添加[ 李远晨 ]工资!'),(128,'张飞','2012-05-09 00:35:04','查询工资!'),(129,'张飞','2012-05-09 00:35:07','进入添加工资页面!'),(130,'张飞','2012-05-09 00:36:12','添加[ 于宇 ]工资!'),(131,'张飞','2012-05-09 00:36:13','查询工资!'),(132,'张飞','2012-05-09 00:36:15','进入添加工资页面!'),(133,'张飞','2012-05-09 00:36:58','添加[ 刘铁铮 ]工资!'),(134,'张飞','2012-05-09 00:36:59','查询工资!'),(135,'张飞','2012-05-09 00:37:21','进入添加工资页面!'),(136,'张飞','2012-05-09 00:39:23','添加[ 李强 ]工资!'),(137,'张飞','2012-05-09 00:39:23','查询工资!'),(138,'张飞','2012-05-09 00:39:29','进入添加工资页面!'),(139,'张飞','2012-05-09 00:40:34','添加[ 王鹏飞 ]工资!'),(140,'张飞','2012-05-09 00:40:34','查询工资!'),(141,'张飞','2012-05-09 00:40:37','进入添加工资页面!'),(142,'张飞','2012-05-09 00:42:06','添加[ 陈奇瑞 ]工资!'),(143,'张飞','2012-05-09 00:42:07','查询工资!'),(144,'张飞','2012-05-09 00:42:11','查询文件!'),(145,'张飞','2012-05-09 00:42:13','查询日志!'),(146,'张飞','2012-05-09 00:42:54','查询部门信息!'),(147,'张飞','2012-05-09 00:42:58','查询人员!'),(148,'张飞','2012-05-09 00:42:59','查询课程!'),(149,'张飞','2012-05-09 00:43:02','查询工资!'),(150,'张飞','2012-05-09 00:43:03','查询文件!'),(151,'张飞','2012-05-09 00:43:22','浏览所有图片文件!'),(152,'张飞','2012-05-12 21:08:03','成功登录!'),(153,'张飞','2012-05-12 21:08:05','浏览所有图片文件!'),(154,'张飞','2012-05-12 21:11:45','查询人员!'),(155,'张飞','2012-05-12 21:11:51','进入编辑[ 张飞 ]信息的页面!'),(156,'张飞','2012-05-12 21:13:51','更新[ 张飞 ]的信息!'),(157,'张飞','2012-05-12 21:13:54','查询人员!'),(158,'张飞','2012-05-12 21:13:58','进入编辑[ 张飞 ]信息的页面!'),(159,'张飞','2012-05-12 21:24:18','查询人员!'),(160,'张飞','2012-05-12 21:25:37','成功登录!'),(161,'张飞','2012-05-12 21:25:38','浏览所有图片文件!'),(162,'张飞','2012-05-12 21:25:42','查询人员!'),(163,'张飞','2012-05-12 21:25:45','进入编辑[ 张飞 ]信息的页面!'),(164,'张飞','2012-05-12 21:25:52','更新[ 张飞 ]的信息!'),(165,'张飞','2012-05-12 21:25:55','查询人员!'),(166,'张飞','2012-05-12 21:25:57','进入编辑[ 张飞 ]信息的页面!'),(167,'张飞','2012-05-12 21:27:45','浏览所有图片文件!'),(168,'张飞','2012-05-12 21:27:47','查询人员!'),(169,'张飞','2012-05-12 21:27:49','进入编辑[ 张飞 ]信息的页面!'),(170,'张飞','2012-05-12 21:28:16','更新[ 张飞 ]的信息!'),(171,'张飞','2012-05-12 21:28:17','查询人员!'),(172,'张飞','2012-05-12 21:28:19','进入编辑[ 张飞 ]信息的页面!'),(173,'张飞','2012-05-12 21:31:27','查询人员!'),(174,'张飞','2012-05-12 21:31:45','进入编辑[ 张飞 ]信息的页面!'),(175,'张飞','2012-05-12 21:31:49','更新[ 张飞 ]的信息!'),(176,'张飞','2012-05-12 21:31:52','查询人员!'),(177,'张飞','2012-05-12 21:31:58','进入编辑[ 周垂文 ]信息的页面!'),(178,'张飞','2012-05-12 21:32:02','更新[ 周垂文 ]的信息!'),(179,'张飞','2012-05-12 21:32:03','查询人员!'),(180,'张飞','2012-05-12 21:32:07','进入编辑[ 王鹏飞 ]信息的页面!'),(181,'张飞','2012-05-12 21:32:11','更新[ 王鹏飞 ]的信息!'),(182,'张飞','2012-05-12 21:32:12','查询人员!'),(183,'张飞','2012-05-12 21:32:58','查询部门信息!'),(184,'张飞','2012-05-12 21:33:01','查询人员!'),(185,'张飞','2012-05-12 21:33:04','查询课程!'),(186,'张飞','2012-05-12 21:33:07','查询工资!'),(187,'张飞','2012-05-12 21:37:14','查询文件!'),(188,'张飞','2012-05-12 21:38:02','查询文件!'),(189,'张飞','2012-05-12 21:38:08','查询文件!'),(190,'张飞','2012-05-12 21:39:59','查询人员!'),(191,'张飞','2012-05-12 21:40:01','进入编辑[ 张飞 ]信息的页面!'),(192,'张飞','2012-05-12 21:40:08','更新[ 张飞 ]的信息!'),(193,'张飞','2012-05-12 21:40:11','查询人员!'),(194,'张飞','2012-05-12 21:40:14','进入编辑[ 张飞 ]信息的页面!'),(195,'张飞','2012-05-12 21:42:04','查询人员!'),(196,'张飞','2012-05-12 21:47:03','查询文件!'),(197,'张飞','2012-05-12 21:47:11','查询文件!'),(198,'张飞','2012-05-12 21:48:52','查询日志!'),(199,'张飞','2012-05-12 21:48:58','查询文件!'),(200,'张飞','2012-05-12 21:53:08','查询部门信息!'),(201,'张飞','2012-05-12 21:53:12','查询人员!'),(202,'张飞','2012-05-12 21:53:14','查询课程!'),(203,'张飞','2012-05-12 21:53:21','查询工资!'),(204,'张飞','2012-05-12 21:53:27','查询文件!'),(205,'张飞','2012-05-12 21:53:36','查询日志!'),(206,'张飞','2012-05-12 21:53:48','查询角色!'),(207,'张飞','2012-05-12 21:53:51','查询权限!'),(208,'张飞','2012-05-12 21:55:43','查询部门信息!'),(209,'张飞','2012-05-12 21:55:47','浏览所有图片文件!'),(210,'张飞','2012-05-12 21:57:19','成功登录!'),(211,'张飞','2012-05-12 21:57:19','浏览所有图片文件!'),(212,'张飞','2012-05-12 21:57:40','查询文件!'),(213,'张飞','2012-05-12 21:57:54','查询文件!'),(214,'张飞','2012-05-12 21:57:55','查询文件!'),(215,'张飞','2012-05-12 22:14:17','成功登录!'),(216,'张飞','2012-05-12 22:14:17','浏览所有图片文件!'),(217,'张飞','2012-05-12 22:14:22','查询文件!'),(218,'张飞','2012-05-12 22:14:53','查询部门信息!'),(219,'张飞','2012-05-12 22:14:55','查询人员!'),(220,'张飞','2012-05-12 22:14:56','查询课程!'),(221,'张飞','2012-05-12 22:14:58','查询人员!'),(222,'张飞','2012-05-12 22:15:09','查询工资!'),(223,'张飞','2012-05-12 22:15:13','查询文件!'),(224,'张飞','2012-05-12 22:15:19','查询日志!'),(225,'张飞','2012-05-12 22:15:29','查询角色!'),(226,'张飞','2012-05-12 22:15:32','查询权限!'),(227,'张飞','2012-05-12 22:16:27','查询部门信息!'),(228,'张飞','2012-05-12 22:19:52','查询文件!'),(229,'张飞','2012-05-12 22:19:55','进入上传文件页面!'),(230,'张飞','2012-05-12 22:28:10','成功登录!'),(231,'张飞','2012-05-12 22:28:11','浏览所有图片文件!'),(232,'张飞','2012-05-12 22:28:14','查询文件!'),(233,'张飞','2012-05-12 22:28:18','进入上传文件页面!'),(234,'张飞','2012-05-12 22:39:05','成功登录!'),(235,'张飞','2012-05-12 22:39:06','浏览所有图片文件!'),(236,'张飞','2012-05-12 22:39:12','查询文件!'),(237,'张飞','2012-05-12 22:39:22','进入上传文件页面!'),(238,'张飞','2012-05-12 22:41:46','浏览所有图片文件!'),(239,'张飞','2012-05-12 22:41:49','查询文件!'),(240,'张飞','2012-05-12 22:41:59','进入上传文件页面!'),(241,'张飞','2012-05-12 22:44:10','查询文件!'),(242,'张飞','2012-05-12 22:47:03','浏览所有图片文件!'),(243,'张飞','2012-05-12 23:00:07','浏览所有图片文件!'),(244,'张飞','2012-05-12 23:02:45','浏览所有图片文件!'),(245,'张飞','2012-05-12 23:03:42','浏览所有图片文件!'),(246,'张飞','2012-05-12 23:04:07','浏览所有图片文件!'),(247,'张飞','2012-05-12 23:07:11','浏览所有图片文件!'),(248,'张飞','2012-05-12 23:07:39','浏览所有图片文件!'),(249,'张飞','2012-05-12 23:08:40','浏览所有图片文件!'),(250,'张飞','2012-05-12 23:13:26','成功登录!'),(251,'张飞','2012-05-12 23:13:27','浏览所有图片文件!'),(252,'张飞','2012-05-12 23:13:31','查询文件!'),(253,'张飞','2012-05-12 23:13:36','进入上传文件页面!'),(254,'张飞','2012-05-12 23:24:29','上传[ 神秘.themepack ]文件!'),(255,'张飞','2012-05-12 23:28:30','查询文件!'),(256,'张飞','2012-05-12 23:28:32','进入上传文件页面!'),(257,'张飞','2012-05-12 23:28:45','上传[ 63.jpg ]文件!'),(258,'张飞','2012-05-12 23:28:58','浏览所有图片文件!'),(259,'张飞','2012-05-12 23:29:13','查询日志!'),(260,'张飞','2012-05-12 23:30:15','查询日志!'),(261,'张飞','2012-05-12 23:31:04','查询日志!'),(262,'张飞','2012-05-12 23:31:55','查询日志!'),(263,'张飞','2012-05-12 23:34:43','查询文件!'),(264,'张飞','2012-05-12 23:35:04','下载[ 63.jpg ]文件!'),(265,'张飞','2012-05-12 23:36:25','删除文件ID为[ [Ljava.lang.String;@1e13c53 ]的2个文件!'),(266,'张飞','2012-05-12 23:36:40','查询文件!'),(267,'张飞','2012-05-12 23:37:56','进入上传文件页面!'),(268,'张飞','2012-05-12 23:38:06','上传[ CIMG0003.JPG ]文件!'),(269,'张飞','2012-05-12 23:38:19','查询文件!'),(270,'张飞','2012-05-12 23:38:25','浏览所有图片文件!'),(271,'张飞','2012-05-12 23:38:37','浏览所有图片文件!'),(272,'张飞','2012-05-12 23:38:48','查询文件!'),(273,'张飞','2012-05-12 23:39:22','进入上传文件页面!'),(274,'张飞','2012-05-12 23:43:41','浏览所有图片文件!'),(275,'张飞','2012-05-12 23:47:14','浏览所有图片文件!'),(276,'张飞','2012-05-12 23:47:50','浏览所有图片文件!'),(277,'张飞','2012-05-12 23:50:10','浏览所有图片文件!'),(278,'张飞','2012-05-12 23:52:01','浏览所有图片文件!'),(279,'张飞','2012-05-13 00:35:31','成功登录!'),(280,'张飞','2012-05-13 00:38:35','浏览所有图片文件!'),(281,'张飞','2012-05-13 00:44:29','浏览所有图片文件!'),(282,'张飞','2012-05-13 00:47:31','成功登录!'),(283,'张飞','2012-05-13 00:47:38','浏览所有图片文件!'),(284,'张飞','2012-05-13 00:47:57','查询文件!'),(285,'张飞','2012-05-13 00:48:01','进入上传文件页面!'),(286,'张飞','2012-05-13 00:48:14','上传[ CIMG0003.JPG ]文件!'),(287,'张飞','2012-05-13 00:48:22','浏览所有图片文件!'),(288,'张飞','2012-05-13 00:49:29','查询文件!'),(289,'张飞','2012-05-13 00:50:39','浏览所有图片文件!'),(290,'张飞','2012-05-13 00:51:22','查询文件!'),(291,'张飞','2012-05-13 01:01:55','进入上传文件页面!'),(292,'张飞','2012-05-13 01:03:26','上传[ Flowers_Wallpapers_71.jpg ]文件!'),(293,'张飞','2012-05-13 01:03:26','上传[ Flowers_Wallpapers_72.jpg ]文件!'),(294,'张飞','2012-05-13 01:03:26','上传[ Flowers_Wallpapers_73.jpg ]文件!'),(295,'张飞','2012-05-13 01:03:26','上传[ Flowers_Wallpapers_74.png ]文件!'),(296,'张飞','2012-05-13 01:03:26','上传[ Flowers_Wallpapers_76.jpg ]文件!'),(297,'张飞','2012-05-13 01:03:27','上传[ Flowers_Wallpapers_110.jpg ]文件!'),(298,'张飞','2012-05-13 01:03:27','上传[ Flowers_Wallpapers_113.jpg ]文件!'),(299,'张飞','2012-05-13 01:03:27','上传[ SuperPipo_416713.bmp ]文件!'),(300,'张飞','2012-05-13 01:03:32','浏览所有图片文件!'),(301,'张飞','2012-05-13 01:03:46','浏览所有图片文件!'),(302,'张飞','2012-05-13 01:04:28','查询文件!'),(303,'张飞','2012-05-13 01:04:45','删除文件ID为[ [Ljava.lang.String;@12b56c1 ]的1个文件!'),(304,'张飞','2012-05-13 01:04:45','查询文件!');

/*Table structure for table `sys_operate` */

DROP TABLE IF EXISTS `sys_operate`;

CREATE TABLE `sys_operate` (
  `operateId` int(11) NOT NULL AUTO_INCREMENT,
  `operateName` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `operateUrl` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`operateId`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `sys_operate` */

insert  into `sys_operate`(`operateId`,`operateName`,`operateUrl`) values (1,'部门列表','sysUserGroupAction_Check.do'),(2,'增加部门页面','sysUserGroupAction_AddUI.do'),(3,'保存部门','sysUserGroupAction_Save.do'),(4,'编辑部门页面','sysUserGroupAction_EditUI.do'),(5,'更新部门信息','sysUserGroupAction_Update.do'),(6,'删除部门','sysUserGroupAction_Delete.do'),(7,'编辑部门人员页面','sysUserGroupAction_CheckGroupUser.do'),(8,'保存部门人员','sysUserGroupAction_SaveGroupUser.do'),(9,'人员列表','sysUserAction_Check.do'),(10,'保存人员','sysUserAction_Save.do'),(11,'编辑人员页面','sysUserAction_EditUI.do'),(12,'更新人员信息','sysUserAction_Update.do'),(13,'删除人员','sysUserAction_Delete.do'),(14,'添加人员页面','sysUserAction_AddUI.do'),(15,'课程列表','courseAction_Check.do'),(16,'保存课程','courseAction_Save.do'),(17,'课程添加页面','courseAction_AddUI.do'),(18,'编辑课程页面','courseAction_EditUI.do'),(19,'更新课程','courseAction_Update.do'),(20,'删除课程','courseAction_Delete.do'),(21,'工资列表','salaryAction_Check.do'),(22,'添加工资页面','salaryAction_AddUI.do'),(23,'保存工资','salaryAction_Save.do'),(24,'编辑工资页面','salaryAction_EditUI.do'),(25,'更新工资','salaryAction_Update.do'),(26,'删除工资','salaryAction_Delete.do'),(27,'资料列表','uploadFileAction_Check.do'),(28,'添加资料页面','uploadFileAction_AddUI.do'),(29,'保存资料','uploadFileAction_SaveFiles.do'),(30,'删除资料','uploadFileAction_Delete.do'),(31,'下载资料','uploadFileAction_Download.do'),(32,'日志列表','sysLogAction_Check.do'),(33,'删除日志','sysLogAction_Delete.do'),(34,'角色列表','sysRoleAction_Check.do'),(35,'添加角色页面','sysRoleAction_AddUI.do'),(36,'保存角色','sysRoleAction_Save.do'),(37,'编辑角色页面','sysRoleAction_EditUI.do'),(38,'更新角色','sysRoleAction_Update.do'),(39,'删除角色','sysRoleAction_Delete.do'),(40,'编辑角色权限','sysRoleAction_CheckRoleOperates.do'),(41,'保存角色权限','sysRoleAction_SaveroleOperates.do'),(42,'保存权限','operateAction_Save.do'),(43,'编辑权限页面','operateAction_EditUI.do'),(44,'更新权限','operateAction_Update.do'),(45,'权限添加页面','operateAction_AddUI.do'),(46,'删除权限','operateAction_Delete.do'),(47,'权限列表','operateAction_Check.do');

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `roleId` int(11) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `remark` text COLLATE utf8_bin,
  PRIMARY KEY (`roleId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `sys_role` */

insert  into `sys_role`(`roleId`,`roleName`,`remark`) values (2,'超级管理员','超级管理员哦呵呵呵好好管理哦<img src=\"http://localhost:8080/BSCRM/ui/kindeditor4/plugins/emoticons/images/12.gif\" border=\"0\" alt=\"\" />'),(3,'系统管理员','系统管理员哦呵呵呵你的权限也不小哦，但是不要乱搞哦呵呵呵<img src=\"http://localhost:8080/BSCRM/ui/kindeditor4/plugins/emoticons/images/13.gif\" border=\"0\" alt=\"\" />'),(4,'普通人员','普通人员哦呵呵呵不要不上心哦，好好干会有前途的哦<img src=\"http://localhost:8080/BSCRM/ui/kindeditor4/plugins/emoticons/images/28.gif\" border=\"0\" alt=\"\" />');

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `cnname` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `password` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `commendMan` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `movetelePhone` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `address` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `telephone` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `nowAddress` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `nowtelePhone` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `identityCode` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `instancyLinkman` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `instancytelePhone` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `roleId` int(11) DEFAULT NULL,
  `groupId` int(11) DEFAULT NULL,
  `sex` varchar(2) COLLATE utf8_bin DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `duty` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `workDate` date DEFAULT NULL,
  `highSchool` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `finishSchool` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `finishSchoolDate` date DEFAULT NULL,
  `remark` text COLLATE utf8_bin,
  `creator` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `updater` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`userId`),
  KEY `FK74A81DFDFEF0A40E` (`roleId`),
  KEY `FK74A81DFDC0126227` (`groupId`),
  CONSTRAINT `FK74A81DFDC0126227` FOREIGN KEY (`groupId`) REFERENCES `sys_user_group` (`groupId`),
  CONSTRAINT `FK74A81DFDFEF0A40E` FOREIGN KEY (`roleId`) REFERENCES `sys_role` (`roleId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `sys_user` */

insert  into `sys_user`(`userId`,`name`,`cnname`,`password`,`commendMan`,`movetelePhone`,`email`,`address`,`telephone`,`nowAddress`,`nowtelePhone`,`identityCode`,`instancyLinkman`,`instancytelePhone`,`roleId`,`groupId`,`sex`,`birthday`,`duty`,`workDate`,`highSchool`,`finishSchool`,`finishSchoolDate`,`remark`,`creator`,`createTime`,`updater`,`updateTime`) values (1,'jwdsy','张飞','1594BEC343ED788FDEA204A9FBE8E246','张飞','15313526005','jwdsy@jwdsy.com','湖北省广水市关庙镇太山村','07226812550','辽宁大连旅顺开发区','564654565','234958437985798798','于宇','8237495848',2,3,'男','2012-05-08','开发','2012-05-31','本科','大连科技学院','2012-05-08','开发不行啊，继续加油吧，你行的呵呵呵<img src=\"http://localhost:8080/BSCRM/ui/kindeditor4/plugins/emoticons/images/13.gif\" border=\"0\" alt=\"\" />','jwdsy','2012-05-05 23:00:25','jwdsy','2012-05-12 21:40:07'),(2,'cwzhou','周垂文','6F6435E322B0F3DAEE776CBA85612A99','张飞','12345678901','cwzhou@jwdsy.com','黑龙江，牡丹江','1321231','辽宁大连旅顺开发区','3243532345','2345245664765857','张飞','1324645432',4,1,'女','2012-05-01','售后','2012-05-02','本科','大连科技学院','2012-05-03','此人还行<img src=\"http://localhost:8080/BSCRM/ui/kindeditor4/plugins/emoticons/images/13.gif\" border=\"0\" alt=\"\" />','jwdsy','2012-05-05 23:58:25','jwdsy','2012-05-12 21:32:01'),(3,'czshan','单崇真','29823C7EC5F1269070F8BFBCF6B57F47','张飞','15924678399','czshan@jwdsy.com','辽宁大连瓦房店','234565464','辽宁大连旅顺开发区','23454675','235467459392847891','于宇','3481274981',4,1,'男','2012-05-01','售后','2012-05-03','本科','大连科技学院','2012-05-02','你的四级没过啊呵呵呵加油哦！！！<img src=\"http://localhost:8080/BSCRM/ui/kindeditor4/plugins/emoticons/images/0.gif\" border=\"0\" alt=\"\" />','jwdsy','2012-05-06 00:21:25',NULL,NULL),(4,'ycli','李远晨','5756417536987AFFDB21E1C6159B6430','张飞','348573988','ycli@jwdsy.com','辽宁大连甘井子区','36578634','辽宁大连旅顺开发区','45654311','2783978723456523420','单崇真','15924678399',4,6,'男','2012-05-08','公关','2012-05-07','本科','大连科技学院','2012-05-05','小伙儿挺帅气啊呵呵呵球踢得不错哦！<img src=\"http://localhost:8080/BSCRM/ui/kindeditor4/plugins/emoticons/images/20.gif\" border=\"0\" alt=\"\" />','jwdsy','2012-05-06 00:24:45',NULL,NULL),(5,'yyu','于宇','F1D12A2BF3667A8BF984A183FE65C7D7','张飞','28474982473','yyu@jwdsy.com','内蒙古赤峰','28344372','辽宁大连旅顺开发区','23847989','283456239458','周垂文','87543843356',4,5,'男','2012-05-22','研发','2012-05-10','本科','大连科技学院','2012-05-08','脑袋上都是包啊！的好好整整啊！<img src=\"http://localhost:8080/BSCRM/ui/kindeditor4/plugins/emoticons/images/13.gif\" border=\"0\" alt=\"\" />','jwdsy','2012-05-06 00:26:54',NULL,NULL),(6,'tzliu','刘铁铮','24756946F97223D48C2F3C49DA1B9CED','张飞','2345575643','tzliu@jwdsy.com','辽宁大连甘井子区','8743523537','辽宁大连旅顺开发区','2834738245','234567348569345','李远晨','3845723489',4,2,'男','2012-05-08','销售','2012-05-07','本科','大连科技学院','2012-05-30','呵呵呵帅气的小伙儿！好好努力吧呵呵呵<img src=\"http://localhost:8080/BSCRM/ui/kindeditor4/plugins/emoticons/images/6.gif\" border=\"0\" alt=\"\" />','jwdsy','2012-05-06 00:29:42',NULL,NULL),(7,'qqli','李强','C1360A5293B6E95944D02FAA5571C845','张飞','132137189','qqli@jwdsy.com','湖北省广水市东余店','2345356','辽宁大连旅顺开发区','43256354','234784860548908','张飞','283498456043',3,5,'男','2012-05-01','研发','2012-05-10','硕士','大连海事大学','2012-05-09','加油哦，公司需要像你这样的实力派人才！呵呵呵<img src=\"http://localhost:8080/BSCRM/ui/kindeditor4/plugins/emoticons/images/20.gif\" border=\"0\" alt=\"\" />','jwdsy','2012-05-06 14:44:25','',NULL),(8,'pfwang','王鹏飞','1DB51D442D55911B1B330E88770F9E01','张飞','2348579589','pfwang@jwdsy.com','河北邯郸','902345698349','辽宁大连旅顺开发区','4798372529','289347569384390','李强强','8347598675',4,5,'女','2012-05-01','研发','2012-05-31','本科','大连科技学院','2012-05-19','加油吧，你，还需要多锻炼锻炼！呵呵呵<img src=\"http://localhost:8080/BSCRM/ui/kindeditor4/plugins/emoticons/images/13.gif\" border=\"0\" alt=\"\" />','jwdsy','2012-05-06 14:47:16','jwdsy','2012-05-12 21:32:10'),(9,'qrchen','陈奇瑞','A571EAD3D56F82DEF3A93BAE83EAA884','张飞','275983475834','qrchen@jwdsy.com','四川成都','27456837','辽宁大连旅顺开发区','234759549','287345939689809','王鹏飞','823476983749',4,1,'男','2012-05-09','售后','2012-05-15','本科','大连科技学院','2012-05-08','加油吧，你也得努力哦呵呵呵<img src=\"http://localhost:8080/BSCRM/ui/kindeditor4/plugins/emoticons/images/4.gif\" border=\"0\" alt=\"\" />','jwdsy','2012-05-06 14:50:28','',NULL);

/*Table structure for table `sys_user_group` */

DROP TABLE IF EXISTS `sys_user_group`;

CREATE TABLE `sys_user_group` (
  `groupId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `principal` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `incumbent` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `remark` text COLLATE utf8_bin,
  PRIMARY KEY (`groupId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `sys_user_group` */

insert  into `sys_user_group`(`groupId`,`name`,`principal`,`incumbent`,`remark`) values (1,'售后部','于宇','负责公司所有售后工作，要好好干哦！','<span style=\"font-family:\'Microsoft YaHei\';font-size:16px;color:#E53333;\"><strong><em><u>好好加油！不然就</u></em></strong></span><span style=\"font-family:\'Microsoft YaHei\';font-size:16px;color:#E53333;\"><strong><em><u>没有钱赚了哦！呵呵呵</u></em></strong></span><img src=\"http://localhost:8080/BSCRM/ui/kindeditor4/plugins/emoticons/images/12.gif\" border=\"0\" alt=\"\" />'),(2,'销售部','单崇真','负责公司的所有产品的销售业务方面的事情！','<span style=\"font-family:\'Microsoft YaHei\';font-size:16px;color:#E53333;\"><strong><em><u>好好加油！不然就</u></em></strong></span><span style=\"font-family:\'Microsoft YaHei\';font-size:16px;color:#E53333;\"><strong><em><u>没有钱赚了哦！呵呵呵</u></em></strong></span><img src=\"http://localhost:8080/BSCRM/ui/kindeditor4/plugins/emoticons/images/12.gif\" border=\"0\" alt=\"\" />'),(3,'开发部','张飞','负责产品的开发任务等相关事宜！','<span style=\"font-family:\'Microsoft YaHei\';font-size:16px;color:#EE33EE;\"><strong><em><u>要好好的搞好产品的开发任务工作！不然要扣工资哦！呵呵呵不吓唬你！</u></em></strong></span><img src=\"http://localhost:8080/BSCRM/ui/kindeditor4/plugins/emoticons/images/26.gif\" border=\"0\" alt=\"\" />'),(4,'软件部','周垂文','负责公司电脑等其他软件方面的相关事宜！','<span style=\"font-family:\'Arial Black\';font-size:16px;color:#FFE500;background-color:#666666;\"><strong><em><u>要把新来的员工的电脑环境弄好哦！一切都要搞到最好哦！新来的同事伤</u></em></strong></span><span style=\"font-family:\'Arial Black\';font-size:16px;color:#FFE500;background-color:#666666;\"><strong><em><u>不起哦！呵呵</u></em></strong></span><img src=\"http://localhost:8080/BSCRM/ui/kindeditor4/plugins/emoticons/images/44.gif\" border=\"0\" alt=\"\" />'),(5,'研发部','刘铁铮','负责公司产品研发任务！','<span style=\"font-size:16px;font-family:\'Microsoft YaHei\';color:#006600;\"><strong><em><u>加油哦呵呵！</u></em></strong></span><img src=\"http://localhost:8080/BSCRM/ui/kindeditor4/plugins/emoticons/images/13.gif\" border=\"0\" alt=\"\" />'),(6,'公关部','李远晨','负责公司所有公关工作，好好干哦，你行的呵呵呵','<span style=\"font-size:16px;font-family:\'Microsoft YaHei\';color:#006600;\"><strong><em><u>加油哦呵呵！</u></em></strong></span><img src=\"http://localhost:8080/BSCRM/ui/kindeditor4/plugins/emoticons/images/13.gif\" border=\"0\" alt=\"\" />');

/*Table structure for table `upload_file` */

DROP TABLE IF EXISTS `upload_file`;

CREATE TABLE `upload_file` (
  `fileId` int(11) NOT NULL AUTO_INCREMENT,
  `fileName` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `filePath` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `fileSize` bigint(20) DEFAULT NULL,
  `suffix` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `uploadTime` date DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`fileId`),
  KEY `FK3F7438FA445F978` (`userId`),
  CONSTRAINT `FK3F7438FA445F978` FOREIGN KEY (`userId`) REFERENCES `sys_user` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `upload_file` */

insert  into `upload_file`(`fileId`,`fileName`,`filePath`,`fileSize`,`suffix`,`uploadTime`,`userId`) values (1,'bl201.jpg','UploadFiles/bl201.jpg',19,'jpg','2012-05-06',1),(2,'flo.jpg','UploadFiles/flo.jpg',17,'jpg','2012-05-06',1),(3,'ct27.jpg','UploadFiles/ct27.jpg',51,'jpg','2012-05-07',1),(4,'ct37.jpg','UploadFiles/ct37.jpg',78,'jpg','2012-05-07',1),(5,'ct41.jpg','UploadFiles/ct41.jpg',41,'jpg','2012-05-07',1),(6,'ct60.jpg','UploadFiles/ct60.jpg',118,'jpg','2012-05-07',1),(7,'ct65.jpg','UploadFiles/ct65.jpg',62,'jpg','2012-05-07',1),(8,'ct75.jpg','UploadFiles/ct75.jpg',33,'jpg','2012-05-07',1),(9,'ct81.jpg','UploadFiles/ct81.jpg',57,'jpg','2012-05-07',1),(10,'ct134.jpg','UploadFiles/ct134.jpg',64,'jpg','2012-05-07',1),(11,'ct139.jpg','UploadFiles/ct139.jpg',111,'jpg','2012-05-07',1),(12,'or105.jpg','UploadFiles/or105.jpg',47,'jpg','2012-05-07',1),(13,'sf48.jpg','UploadFiles/sf48.jpg',56,'jpg','2012-05-07',1),(18,'Flowers_Wallpapers_71.jpg','UploadFiles/Flowers_Wallpapers_71.jpg',28,'jpg','2012-05-13',1),(19,'Flowers_Wallpapers_72.jpg','UploadFiles/Flowers_Wallpapers_72.jpg',52,'jpg','2012-05-13',1),(20,'Flowers_Wallpapers_73.jpg','UploadFiles/Flowers_Wallpapers_73.jpg',23,'jpg','2012-05-13',1),(21,'Flowers_Wallpapers_74.png','UploadFiles/Flowers_Wallpapers_74.png',30,'png','2012-05-13',1),(22,'Flowers_Wallpapers_76.jpg','UploadFiles/Flowers_Wallpapers_76.jpg',26,'jpg','2012-05-13',1),(23,'Flowers_Wallpapers_110.jpg','UploadFiles/Flowers_Wallpapers_110.jpg',69,'jpg','2012-05-13',1),(24,'Flowers_Wallpapers_113.jpg','UploadFiles/Flowers_Wallpapers_113.jpg',40,'jpg','2012-05-13',1),(25,'SuperPipo_416713.bmp','UploadFiles/SuperPipo_416713.bmp',181,'bmp','2012-05-13',1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
