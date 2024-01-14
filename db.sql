/*
SQLyog Ultimate v11.3 (64 bit)
MySQL - 5.7.32-log : Database - ssm1ax6i
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ssm1ax6i` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `ssm1ax6i`;

/*Table structure for table `chat` */

DROP TABLE IF EXISTS `chat`;

CREATE TABLE `chat` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `adminid` bigint(20) DEFAULT NULL COMMENT '管理员id',
  `ask` longtext COMMENT '提问',
  `reply` longtext COMMENT '回复',
  `isreply` int(11) DEFAULT NULL COMMENT '是否回复',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8 COMMENT='客服中心';

/*Data for the table `chat` */

insert  into `chat`(`id`,`addtime`,`userid`,`adminid`,`ask`,`reply`,`isreply`) values (71,'2021-03-28 16:47:30',1,1,'提问1','回复1',1),(72,'2021-03-28 16:47:30',2,2,'提问2','回复2',2),(73,'2021-03-28 16:47:30',3,3,'提问3','回复3',3),(74,'2021-03-28 16:47:30',4,4,'提问4','回复4',4),(75,'2021-03-28 16:47:30',5,5,'提问5','回复5',5),(76,'2021-03-28 16:47:30',6,6,'提问6','回复6',6);

/*Table structure for table `config` */

DROP TABLE IF EXISTS `config`;

CREATE TABLE `config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='配置文件';

/*Data for the table `config` */

insert  into `config`(`id`,`name`,`value`) values (1,'picture1','http://localhost:8080/ssm1ax6i/upload/picture1.jpg'),(2,'picture2','http://localhost:8080/ssm1ax6i/upload/picture2.jpg'),(3,'picture3','http://localhost:8080/ssm1ax6i/upload/picture3.jpg'),(6,'homepage',NULL);

/*Table structure for table `exampaper` */

DROP TABLE IF EXISTS `exampaper`;

CREATE TABLE `exampaper` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `name` varchar(200) NOT NULL COMMENT '试卷名称',
  `time` int(11) NOT NULL COMMENT '考试时长(分钟)',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '试卷状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1616922074363 DEFAULT CHARSET=utf8 COMMENT='试卷表';

/*Data for the table `exampaper` */

insert  into `exampaper`(`id`,`addtime`,`name`,`time`,`status`) values (1616921518815,'2021-03-28 16:51:58','教师资格证考试',60,1),(1616921533207,'2021-03-28 16:52:12','公务员考试',60,1),(1616922074362,'2021-03-28 17:01:14','事业单位招聘考试',60,1);

/*Table structure for table `examquestion` */

DROP TABLE IF EXISTS `examquestion`;

CREATE TABLE `examquestion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `paperid` bigint(20) NOT NULL COMMENT '所属试卷id（外键）',
  `papername` varchar(200) NOT NULL COMMENT '试卷名称',
  `questionname` varchar(200) NOT NULL COMMENT '试题名称',
  `options` longtext COMMENT '选项，json字符串',
  `score` bigint(20) DEFAULT '0' COMMENT '分值',
  `answer` varchar(200) DEFAULT NULL COMMENT '正确答案',
  `analysis` longtext COMMENT '答案解析',
  `type` bigint(20) DEFAULT '0' COMMENT '试题类型，0：单选题 1：多选题 2：判断题 3：填空题（暂不考虑多项填空）',
  `sequence` bigint(20) DEFAULT '100' COMMENT '试题排序，值越大排越前面',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1616922106330 DEFAULT CHARSET=utf8 COMMENT='试题表';

/*Data for the table `examquestion` */

insert  into `examquestion`(`id`,`addtime`,`paperid`,`papername`,`questionname`,`options`,`score`,`answer`,`analysis`,`type`,`sequence`) values (1616921583735,'2021-03-28 16:53:03',1616921518815,'教师资格证考试','1+1=？','[{\"text\":\"A.1\",\"code\":\"A\"},{\"text\":\"B.2\",\"code\":\"B\"},{\"text\":\"C.3\",\"code\":\"C\"},{\"text\":\"D.4\",\"code\":\"D\"}]',1,'B','测试',0,1),(1616921616776,'2021-03-28 16:53:36',1616921518815,'教师资格证考试','1+1=？','[{\"text\":\"A.2\",\"code\":\"A\"},{\"text\":\"B.4\",\"code\":\"B\"},{\"text\":\"C.6\",\"code\":\"C\"},{\"text\":\"D.8\",\"code\":\"D\"}]',1,'A','测试',0,2),(1616921648102,'2021-03-28 16:54:08',1616921518815,'教师资格证考试','1+2=？','[{\"text\":\"A.1\",\"code\":\"A\"},{\"text\":\"B.2\",\"code\":\"B\"},{\"text\":\"C.3\",\"code\":\"C\"},{\"text\":\"D.4\",\"code\":\"D\"}]',1,'C','测试',0,3),(1616921678338,'2021-03-28 16:54:37',1616921518815,'教师资格证考试','1+3=？','[{\"text\":\"A.1\",\"code\":\"A\"},{\"text\":\"B.2\",\"code\":\"B\"},{\"text\":\"C.3\",\"code\":\"C\"},{\"text\":\"D.4\",\"code\":\"D\"}]',1,'D','测试',0,4),(1616922106329,'2021-03-28 17:01:45',1616921533207,'公务员考试','1+1=？','[{\"text\":\"A.1\",\"code\":\"A\"},{\"text\":\"B.2\",\"code\":\"B\"},{\"text\":\"C.3\",\"code\":\"C\"},{\"text\":\"D.4\",\"code\":\"D\"}]',1,'B','测试2',0,1);

/*Table structure for table `examrecord` */

DROP TABLE IF EXISTS `examrecord`;

CREATE TABLE `examrecord` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(200) DEFAULT NULL COMMENT '用户名',
  `paperid` bigint(20) NOT NULL COMMENT '试卷id（外键）',
  `papername` varchar(200) NOT NULL COMMENT '试卷名称',
  `questionid` bigint(20) NOT NULL COMMENT '试题id（外键）',
  `questionname` varchar(200) NOT NULL COMMENT '试题名称',
  `options` longtext COMMENT '选项，json字符串',
  `score` bigint(20) DEFAULT '0' COMMENT '分值',
  `answer` varchar(200) DEFAULT NULL COMMENT '正确答案',
  `analysis` longtext COMMENT '答案解析',
  `myscore` bigint(20) NOT NULL DEFAULT '0' COMMENT '试题得分',
  `myanswer` varchar(200) DEFAULT NULL COMMENT '考生答案',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1616921835094 DEFAULT CHARSET=utf8 COMMENT='考试记录表';

/*Data for the table `examrecord` */

insert  into `examrecord`(`id`,`addtime`,`userid`,`username`,`paperid`,`papername`,`questionid`,`questionname`,`options`,`score`,`answer`,`analysis`,`myscore`,`myanswer`) values (1616921827204,'2021-03-28 16:57:07',1616921768455,NULL,1616921518815,'教师资格证考试',1616921583735,'1+1=？','[{\"text\":\"A.1\",\"code\":\"A\",\"checked\":false},{\"text\":\"B.2\",\"code\":\"B\",\"checked\":true},{\"text\":\"C.3\",\"code\":\"C\",\"checked\":false},{\"text\":\"D.4\",\"code\":\"D\",\"checked\":false}]',1,'B','测试',1,'B'),(1616921830929,'2021-03-28 16:57:10',1616921768455,NULL,1616921518815,'教师资格证考试',1616921616776,'1+1=？','[{\"text\":\"A.2\",\"code\":\"A\",\"checked\":false},{\"text\":\"B.4\",\"code\":\"B\",\"checked\":true},{\"text\":\"C.6\",\"code\":\"C\",\"checked\":false},{\"text\":\"D.8\",\"code\":\"D\",\"checked\":false}]',1,'A','测试',0,'B'),(1616921833371,'2021-03-28 16:57:12',1616921768455,NULL,1616921518815,'教师资格证考试',1616921648102,'1+2=？','[{\"text\":\"A.1\",\"code\":\"A\",\"checked\":false},{\"text\":\"B.2\",\"code\":\"B\",\"checked\":false},{\"text\":\"C.3\",\"code\":\"C\",\"checked\":true},{\"text\":\"D.4\",\"code\":\"D\",\"checked\":false}]',1,'C','测试',1,'C'),(1616921835093,'2021-03-28 16:57:14',1616921768455,NULL,1616921518815,'教师资格证考试',1616921678338,'1+3=？','[{\"text\":\"A.1\",\"code\":\"A\",\"checked\":false},{\"text\":\"B.2\",\"code\":\"B\",\"checked\":false},{\"text\":\"C.3\",\"code\":\"C\",\"checked\":true},{\"text\":\"D.4\",\"code\":\"D\",\"checked\":false}]',1,'D','测试',0,'C');

/*Table structure for table `forum` */

DROP TABLE IF EXISTS `forum`;

CREATE TABLE `forum` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `title` varchar(200) DEFAULT NULL COMMENT '帖子标题',
  `content` longtext NOT NULL COMMENT '帖子内容',
  `parentid` bigint(20) DEFAULT NULL COMMENT '父节点id',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(200) DEFAULT NULL COMMENT '用户名',
  `isdone` varchar(200) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1616921870924 DEFAULT CHARSET=utf8 COMMENT='社区';

/*Data for the table `forum` */

insert  into `forum`(`id`,`addtime`,`title`,`content`,`parentid`,`userid`,`username`,`isdone`) values (81,'2021-03-28 16:47:30','帖子标题1','帖子内容1',1,1,'用户名1','开放'),(82,'2021-03-28 16:47:30','帖子标题2','帖子内容2',2,2,'用户名2','开放'),(83,'2021-03-28 16:47:30','帖子标题3','帖子内容3',3,3,'用户名3','开放'),(84,'2021-03-28 16:47:30','帖子标题4','帖子内容4',4,4,'用户名4','开放'),(85,'2021-03-28 16:47:30','帖子标题5','帖子内容5',5,5,'用户名5','开放'),(86,'2021-03-28 16:47:30','帖子标题6','帖子内容6',6,6,'用户名6','开放'),(1616921859768,'2021-03-28 16:57:39','测试001','1345645132132',0,1616921768455,'001','开放'),(1616921870923,'2021-03-28 16:57:50',NULL,'11111111111',1616921859768,1616921768455,'001',NULL);

/*Table structure for table `gonggao` */

DROP TABLE IF EXISTS `gonggao`;

CREATE TABLE `gonggao` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `biaoti` varchar(200) DEFAULT NULL COMMENT '标题',
  `leixing` varchar(200) DEFAULT NULL COMMENT '类型',
  `neirong` varchar(200) DEFAULT NULL COMMENT '内容',
  `fengmian` varchar(200) DEFAULT NULL COMMENT '封面',
  `fabushijian` datetime DEFAULT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8 COMMENT='公告';

/*Data for the table `gonggao` */

insert  into `gonggao`(`id`,`addtime`,`biaoti`,`leixing`,`neirong`,`fengmian`,`fabushijian`) values (61,'2021-03-28 16:47:30','标题1','教师资格证','内容1','http://localhost:8080/ssm1ax6i/upload/gonggao_fengmian1.jpg','2021-03-28 16:47:30'),(62,'2021-03-28 16:47:30','标题2','教师资格证','内容2','http://localhost:8080/ssm1ax6i/upload/gonggao_fengmian2.jpg','2021-03-28 16:47:30'),(63,'2021-03-28 16:47:30','标题3','教师资格证','内容3','http://localhost:8080/ssm1ax6i/upload/gonggao_fengmian3.jpg','2021-03-28 16:47:30'),(64,'2021-03-28 16:47:30','标题4','教师资格证','内容4','http://localhost:8080/ssm1ax6i/upload/gonggao_fengmian4.jpg','2021-03-28 16:47:30'),(65,'2021-03-28 16:47:30','标题5','教师资格证','内容5','http://localhost:8080/ssm1ax6i/upload/gonggao_fengmian5.jpg','2021-03-28 16:47:30'),(66,'2021-03-28 16:47:30','标题6','教师资格证','内容6','http://localhost:8080/ssm1ax6i/upload/gonggao_fengmian6.jpg','2021-03-28 16:47:30');

/*Table structure for table `gongwuyuan` */

DROP TABLE IF EXISTS `gongwuyuan`;

CREATE TABLE `gongwuyuan` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `biaoti` varchar(200) DEFAULT NULL COMMENT '标题',
  `neirong` varchar(200) DEFAULT NULL COMMENT '内容',
  `fengmian` varchar(200) DEFAULT NULL COMMENT '封面',
  `fabushijian` datetime DEFAULT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='公务员';

/*Data for the table `gongwuyuan` */

insert  into `gongwuyuan`(`id`,`addtime`,`biaoti`,`neirong`,`fengmian`,`fabushijian`) values (31,'2021-03-28 16:47:30','标题1','内容1','http://localhost:8080/ssm1ax6i/upload/gongwuyuan_fengmian1.jpg','2021-03-28 16:47:30'),(32,'2021-03-28 16:47:30','标题2','内容2','http://localhost:8080/ssm1ax6i/upload/gongwuyuan_fengmian2.jpg','2021-03-28 16:47:30'),(33,'2021-03-28 16:47:30','标题3','内容3','http://localhost:8080/ssm1ax6i/upload/gongwuyuan_fengmian3.jpg','2021-03-28 16:47:30'),(34,'2021-03-28 16:47:30','标题4','内容4','http://localhost:8080/ssm1ax6i/upload/gongwuyuan_fengmian4.jpg','2021-03-28 16:47:30'),(35,'2021-03-28 16:47:30','标题5','内容5','http://localhost:8080/ssm1ax6i/upload/gongwuyuan_fengmian5.jpg','2021-03-28 16:47:30'),(36,'2021-03-28 16:47:30','标题6','内容6','http://localhost:8080/ssm1ax6i/upload/gongwuyuan_fengmian6.jpg','2021-03-28 16:47:30');

/*Table structure for table `jiaoshizigezheng` */

DROP TABLE IF EXISTS `jiaoshizigezheng`;

CREATE TABLE `jiaoshizigezheng` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `biaoti` varchar(200) DEFAULT NULL COMMENT '标题',
  `neirong` varchar(200) DEFAULT NULL COMMENT '内容',
  `fengmian` varchar(200) DEFAULT NULL COMMENT '封面',
  `fabushijian` datetime DEFAULT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='教师资格证';

/*Data for the table `jiaoshizigezheng` */

insert  into `jiaoshizigezheng`(`id`,`addtime`,`biaoti`,`neirong`,`fengmian`,`fabushijian`) values (21,'2021-03-28 16:47:30','标题1','内容1','http://localhost:8080/ssm1ax6i/upload/jiaoshizigezheng_fengmian1.jpg','2021-03-28 16:47:30'),(22,'2021-03-28 16:47:30','标题2','内容2','http://localhost:8080/ssm1ax6i/upload/jiaoshizigezheng_fengmian2.jpg','2021-03-28 16:47:30'),(23,'2021-03-28 16:47:30','标题3','内容3','http://localhost:8080/ssm1ax6i/upload/jiaoshizigezheng_fengmian3.jpg','2021-03-28 16:47:30'),(24,'2021-03-28 16:47:30','标题4','内容4','http://localhost:8080/ssm1ax6i/upload/jiaoshizigezheng_fengmian4.jpg','2021-03-28 16:47:30'),(25,'2021-03-28 16:47:30','标题5','内容5','http://localhost:8080/ssm1ax6i/upload/jiaoshizigezheng_fengmian5.jpg','2021-03-28 16:47:30'),(26,'2021-03-28 16:47:30','标题6','内容6','http://localhost:8080/ssm1ax6i/upload/jiaoshizigezheng_fengmian6.jpg','2021-03-28 16:47:30');

/*Table structure for table `messages` */

DROP TABLE IF EXISTS `messages`;

CREATE TABLE `messages` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint(20) NOT NULL COMMENT '留言人id',
  `username` varchar(200) DEFAULT NULL COMMENT '用户名',
  `content` longtext NOT NULL COMMENT '留言内容',
  `reply` longtext COMMENT '回复内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8 COMMENT='留言板';

/*Data for the table `messages` */

insert  into `messages`(`id`,`addtime`,`userid`,`username`,`content`,`reply`) values (131,'2021-03-28 16:47:30',1,'用户名1','留言内容1','回复内容1'),(132,'2021-03-28 16:47:30',2,'用户名2','留言内容2','回复内容2'),(133,'2021-03-28 16:47:30',3,'用户名3','留言内容3','回复内容3'),(134,'2021-03-28 16:47:30',4,'用户名4','留言内容4','回复内容4'),(135,'2021-03-28 16:47:30',5,'用户名5','留言内容5','回复内容5'),(136,'2021-03-28 16:47:30',6,'用户名6','留言内容6','回复内容6');

/*Table structure for table `mianshijiangjie` */

DROP TABLE IF EXISTS `mianshijiangjie`;

CREATE TABLE `mianshijiangjie` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `biaoti` varchar(200) DEFAULT NULL COMMENT '标题',
  `jianjie` varchar(200) DEFAULT NULL COMMENT '简介',
  `shipin` varchar(200) DEFAULT NULL COMMENT '视频',
  `fengmian` varchar(200) DEFAULT NULL COMMENT '封面',
  `fabushijian` datetime DEFAULT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COMMENT='面试讲解';

/*Data for the table `mianshijiangjie` */

insert  into `mianshijiangjie`(`id`,`addtime`,`biaoti`,`jianjie`,`shipin`,`fengmian`,`fabushijian`) values (51,'2021-03-28 16:47:30','标题1','简介1','','http://localhost:8080/ssm1ax6i/upload/mianshijiangjie_fengmian1.jpg','2021-03-28 16:47:30'),(52,'2021-03-28 16:47:30','标题2','简介2','','http://localhost:8080/ssm1ax6i/upload/mianshijiangjie_fengmian2.jpg','2021-03-28 16:47:30'),(53,'2021-03-28 16:47:30','标题3','简介3','','http://localhost:8080/ssm1ax6i/upload/mianshijiangjie_fengmian3.jpg','2021-03-28 16:47:30'),(54,'2021-03-28 16:47:30','标题4','简介4','','http://localhost:8080/ssm1ax6i/upload/mianshijiangjie_fengmian4.jpg','2021-03-28 16:47:30'),(55,'2021-03-28 16:47:30','标题5','简介5','','http://localhost:8080/ssm1ax6i/upload/mianshijiangjie_fengmian5.jpg','2021-03-28 16:47:30'),(56,'2021-03-28 16:47:30','标题6','简介6','','http://localhost:8080/ssm1ax6i/upload/mianshijiangjie_fengmian6.jpg','2021-03-28 16:47:30');

/*Table structure for table `news` */

DROP TABLE IF EXISTS `news`;

CREATE TABLE `news` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `title` varchar(200) NOT NULL COMMENT '标题',
  `introduction` longtext COMMENT '简介',
  `picture` varchar(200) NOT NULL COMMENT '图片',
  `content` longtext NOT NULL COMMENT '内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8 COMMENT='广告栏';

/*Data for the table `news` */

insert  into `news`(`id`,`addtime`,`title`,`introduction`,`picture`,`content`) values (121,'2021-03-28 16:47:30','标题1','简介1','http://localhost:8080/ssm1ax6i/upload/news_picture1.jpg','内容1'),(122,'2021-03-28 16:47:30','标题2','简介2','http://localhost:8080/ssm1ax6i/upload/news_picture2.jpg','内容2'),(123,'2021-03-28 16:47:30','标题3','简介3','http://localhost:8080/ssm1ax6i/upload/news_picture3.jpg','内容3'),(124,'2021-03-28 16:47:30','标题4','简介4','http://localhost:8080/ssm1ax6i/upload/news_picture4.jpg','内容4'),(125,'2021-03-28 16:47:30','标题5','简介5','http://localhost:8080/ssm1ax6i/upload/news_picture5.jpg','内容5'),(126,'2021-03-28 16:47:30','标题6','简介6','http://localhost:8080/ssm1ax6i/upload/news_picture6.jpg','内容6');

/*Table structure for table `shiyedanwei` */

DROP TABLE IF EXISTS `shiyedanwei`;

CREATE TABLE `shiyedanwei` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `biaoti` varchar(200) DEFAULT NULL COMMENT '标题',
  `neirong` varchar(200) DEFAULT NULL COMMENT '内容',
  `fengmian` varchar(200) DEFAULT NULL COMMENT '封面',
  `fabushijian` datetime DEFAULT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COMMENT='事业单位';

/*Data for the table `shiyedanwei` */

insert  into `shiyedanwei`(`id`,`addtime`,`biaoti`,`neirong`,`fengmian`,`fabushijian`) values (41,'2021-03-28 16:47:30','标题1','内容1','http://localhost:8080/ssm1ax6i/upload/shiyedanwei_fengmian1.jpg','2021-03-28 16:47:30'),(42,'2021-03-28 16:47:30','标题2','内容2','http://localhost:8080/ssm1ax6i/upload/shiyedanwei_fengmian2.jpg','2021-03-28 16:47:30'),(43,'2021-03-28 16:47:30','标题3','内容3','http://localhost:8080/ssm1ax6i/upload/shiyedanwei_fengmian3.jpg','2021-03-28 16:47:30'),(44,'2021-03-28 16:47:30','标题4','内容4','http://localhost:8080/ssm1ax6i/upload/shiyedanwei_fengmian4.jpg','2021-03-28 16:47:30'),(45,'2021-03-28 16:47:30','标题5','内容5','http://localhost:8080/ssm1ax6i/upload/shiyedanwei_fengmian5.jpg','2021-03-28 16:47:30'),(46,'2021-03-28 16:47:30','标题6','内容6','http://localhost:8080/ssm1ax6i/upload/shiyedanwei_fengmian6.jpg','2021-03-28 16:47:30');

/*Table structure for table `token` */

DROP TABLE IF EXISTS `token`;

CREATE TABLE `token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='token表';

/*Data for the table `token` */

insert  into `token`(`id`,`userid`,`username`,`tablename`,`role`,`token`,`addtime`,`expiratedtime`) values (1,1616921417184,'1','yonghu','用户','n2ygn6dwb77q5potrn1pf3yrqu4jqfan','2021-03-28 16:50:22','2021-03-28 17:50:22'),(2,1,'abo','users','管理员','cj0xycqe1065mzw55u6x06f5ixuy1yay','2021-03-28 16:51:15','2021-03-28 18:00:20'),(3,1616921768455,'001','yonghu','用户','0ij8ql4g1w6yrsn2kguy46hn6wjls5c6','2021-03-28 16:56:18','2021-03-28 17:56:18');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `role` varchar(100) DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';

/*Data for the table `users` */

insert  into `users`(`id`,`username`,`password`,`role`,`addtime`) values (1,'abo','abo','管理员','2021-03-28 16:47:30');

/*Table structure for table `yonghu` */

DROP TABLE IF EXISTS `yonghu`;

CREATE TABLE `yonghu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `zhanghao` varchar(200) NOT NULL COMMENT '账号',
  `mima` varchar(200) NOT NULL COMMENT '密码',
  `xingming` varchar(200) NOT NULL COMMENT '姓名',
  `nianling` varchar(200) DEFAULT NULL COMMENT '年龄',
  `xingbie` varchar(200) DEFAULT NULL COMMENT '性别',
  `shouji` varchar(200) DEFAULT NULL COMMENT '手机',
  `youxiang` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `zhaopian` varchar(200) DEFAULT NULL COMMENT '照片',
  PRIMARY KEY (`id`),
  UNIQUE KEY `zhanghao` (`zhanghao`)
) ENGINE=InnoDB AUTO_INCREMENT=1616921768456 DEFAULT CHARSET=utf8 COMMENT='用户';

/*Data for the table `yonghu` */

insert  into `yonghu`(`id`,`addtime`,`zhanghao`,`mima`,`xingming`,`nianling`,`xingbie`,`shouji`,`youxiang`,`zhaopian`) values (12,'2021-03-28 16:47:30','用户2','123456','姓名2','年龄2','男','13823888882','773890002@qq.com','http://localhost:8080/ssm1ax6i/upload/yonghu_zhaopian2.jpg'),(13,'2021-03-28 16:47:30','用户3','123456','姓名3','年龄3','男','13823888883','773890003@qq.com','http://localhost:8080/ssm1ax6i/upload/yonghu_zhaopian3.jpg'),(14,'2021-03-28 16:47:30','用户4','123456','姓名4','年龄4','男','13823888884','773890004@qq.com','http://localhost:8080/ssm1ax6i/upload/yonghu_zhaopian4.jpg'),(16,'2021-03-28 16:47:30','用户6','123456','姓名6','年龄6','男','13823888886','773890006@qq.com','http://localhost:8080/ssm1ax6i/upload/yonghu_zhaopian6.jpg'),(1616921417184,'2021-03-28 16:50:17','1','1','1',NULL,'男',NULL,NULL,NULL),(1616921768455,'2021-03-28 16:56:08','001','001','001','18','男','13800000000','123@qq.com',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
