/*
SQLyog Community v11.01 (32 bit)
MySQL - 5.6.13-log : Database - kuroro
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`kuroro` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;

USE `kuroro`;

/*Table structure for table `account` */

CREATE TABLE `account` (
  `account_id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `account_email` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '邮箱,也是用户名',
  `account_name` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '昵称,必须有',
  `account_status` int(2) NOT NULL DEFAULT '0' COMMENT '用户是否激活。默认0 没有激活 1是已激活',
  `account_birthday` date NOT NULL COMMENT '生日',
  `account_passwd` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '密码 md5加密 32位长度',
  `account_date` date NOT NULL COMMENT '注册日期',
  `account_point` bigint(9) DEFAULT '0' COMMENT 'KuroPoint-积分点',
  PRIMARY KEY (`account_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='帐户表';

/*Data for the table `account` */

/*Table structure for table `tags` */

CREATE TABLE `tags` (
  `tag_id` int(9) NOT NULL AUTO_INCREMENT COMMENT '标签id',
  `tag_name` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '标签名字',
  `tag_date` date NOT NULL COMMENT '标签创建日期',
  `tag_parent` int(3) DEFAULT '0' COMMENT '父标签',
  PRIMARY KEY (`tag_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='主题_标签表';

/*Data for the table `tags` */

/*Table structure for table `topic` */

CREATE TABLE `topic` (
  `topic_id` bigint(9) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tag_id` int(9) NOT NULL COMMENT '所属标签',
  `topic_name` varchar(500) COLLATE utf8_bin NOT NULL COMMENT '帖子的标题',
  `topic_content` text COLLATE utf8_bin NOT NULL COMMENT '帖子的内容',
  `topic_account_id` bigint(11) NOT NULL COMMENT '发帖人id,如果未登录就为-1',
  `topic_date` datetime NOT NULL COMMENT '发帖时间',
  `topic_account_name` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '发帖人名称,匿名记录IP',
  `topic_account_email` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '如果未登录,就要记录邮件',
  PRIMARY KEY (`topic_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='帖子表';

/*Data for the table `topic` */

/*Table structure for table `topic_reply` */

CREATE TABLE `topic_reply` (
  `topic_reply_id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '回复的id',
  `topic_reply_account_id` bigint(11) NOT NULL COMMENT '回复者帐户id,未登录为-1',
  `topic_reply_account_name` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '回复者昵称,匿名的话记录IP',
  `topic_reply_email` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '如果未登录回复,需要记录邮箱',
  `topic_id` bigint(9) NOT NULL COMMENT '帖子id',
  `topic_reply_date` datetime NOT NULL COMMENT '回复时间',
  `topic_reply_content` text COLLATE utf8_bin NOT NULL COMMENT '回复内容',
  PRIMARY KEY (`topic_reply_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='回帖表';

/*Data for the table `topic_reply` */

/*Table structure for table `tucao` */

CREATE TABLE `tucao` (
  `tucao_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tucao_account_id` bigint(11) NOT NULL COMMENT '吐嘈者帐户id,未登录者为-1',
  `tucao_account_name` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '吐嘈者昵称,匿名显示ip',
  `tucao_account_email` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '吐嘈者email',
  `tucao_context` varchar(160) COLLATE utf8_bin NOT NULL COMMENT '吐嘈内容',
  `tucao_pic` varchar(20000) COLLATE utf8_bin DEFAULT NULL COMMENT '吐嘈的图片',
  PRIMARY KEY (`tucao_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='吐嘈表';

/*Data for the table `tucao` */

/*Table structure for table `tucao_reply` */

CREATE TABLE `tucao_reply` (
  `tucao_replay_id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '吐嘈id',
  `tucao_replay_account_id` bigint(11) NOT NULL COMMENT '回复吐嘈者帐户id,未登录为-1',
  `tucao_replay_account_name` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '回复吐嘈者昵称,匿名的话记录IP',
  `tucao_replay_account_email` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '如果未登录回复,需要记录邮箱',
  `tucao_replay_context` varchar(160) COLLATE utf8_bin NOT NULL COMMENT '回复内容',
  `tucao_replay_datetime` datetime NOT NULL COMMENT '回复时间',
  PRIMARY KEY (`tucao_replay_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='吐嘈回复表';

/*Data for the table `tucao_reply` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
