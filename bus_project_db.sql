/*
SQLyog Community v13.2.0 (64 bit)
MySQL - 10.4.25-MariaDB : Database - bus_project
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`bus_project` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `bus_project`;

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `auth_group` */

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `auth_group_permissions` */

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4;

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values 
(1,'Can add log entry',1,'add_logentry'),
(2,'Can change log entry',1,'change_logentry'),
(3,'Can delete log entry',1,'delete_logentry'),
(4,'Can view log entry',1,'view_logentry'),
(5,'Can add permission',2,'add_permission'),
(6,'Can change permission',2,'change_permission'),
(7,'Can delete permission',2,'delete_permission'),
(8,'Can view permission',2,'view_permission'),
(9,'Can add group',3,'add_group'),
(10,'Can change group',3,'change_group'),
(11,'Can delete group',3,'delete_group'),
(12,'Can view group',3,'view_group'),
(13,'Can add user',4,'add_user'),
(14,'Can change user',4,'change_user'),
(15,'Can delete user',4,'delete_user'),
(16,'Can view user',4,'view_user'),
(17,'Can add content type',5,'add_contenttype'),
(18,'Can change content type',5,'change_contenttype'),
(19,'Can delete content type',5,'delete_contenttype'),
(20,'Can view content type',5,'view_contenttype'),
(21,'Can add session',6,'add_session'),
(22,'Can change session',6,'change_session'),
(23,'Can delete session',6,'delete_session'),
(24,'Can view session',6,'view_session'),
(25,'Can add city',7,'add_city'),
(26,'Can change city',7,'change_city'),
(27,'Can delete city',7,'delete_city'),
(28,'Can view city',7,'view_city'),
(29,'Can add timetable',8,'add_timetable'),
(30,'Can change timetable',8,'change_timetable'),
(31,'Can delete timetable',8,'delete_timetable'),
(32,'Can view timetable',8,'view_timetable'),
(33,'Can add ticket',9,'add_ticket'),
(34,'Can change ticket',9,'change_ticket'),
(35,'Can delete ticket',9,'delete_ticket'),
(36,'Can view ticket',9,'view_ticket'),
(37,'Can add ticket',10,'add_ticket'),
(38,'Can change ticket',10,'change_ticket'),
(39,'Can delete ticket',10,'delete_ticket'),
(40,'Can view ticket',10,'view_ticket');

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

/*Data for the table `auth_user` */

insert  into `auth_user`(`id`,`password`,`last_login`,`is_superuser`,`username`,`first_name`,`last_name`,`email`,`is_staff`,`is_active`,`date_joined`) values 
(1,'pbkdf2_sha256$600000$pnDR9xnECNpc28ndT7giyE$qGrtY9HQ58O/NBo/WOUIvf2JTeoLYxBPWo54YF/Bc6s=','2025-01-23 17:22:25.917592',1,'admin','','','admin@admin.com',1,1,'2025-01-23 17:22:19.670996'),
(9,'pbkdf2_sha256$600000$YXlDIvMvJwR4DUvzWoFEKf$lWxRbXLoO8xQOApw6yNdR98OhSgJaSJGkuPP8cW637s=','2025-01-26 16:10:24.280776',0,'ivana','ivana','ivana','ivana@gmail.com',0,1,'2025-01-25 22:03:43.768458');

/*Table structure for table `auth_user_groups` */

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `auth_user_groups` */

/*Table structure for table `auth_user_user_permissions` */

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `auth_user_user_permissions` */

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

/*Data for the table `django_admin_log` */

insert  into `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) values 
(1,'2025-01-23 18:14:39.722547','1','Ticket object (1)',1,'[{\"added\": {}}]',9,1),
(2,'2025-01-23 18:30:44.353126','2','Ticket object (2)',1,'[{\"added\": {}}]',10,1),
(3,'2025-01-23 18:31:00.651588','2','Ticket object (2)',3,'',10,1);

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values 
(1,'admin','logentry'),
(3,'auth','group'),
(2,'auth','permission'),
(4,'auth','user'),
(5,'contenttypes','contenttype'),
(6,'sessions','session'),
(10,'tickets','ticket'),
(7,'timetables','city'),
(9,'timetables','ticket'),
(8,'timetables','timetable');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values 
(1,'contenttypes','0001_initial','2025-01-23 16:16:29.771865'),
(2,'auth','0001_initial','2025-01-23 16:16:30.725824'),
(3,'admin','0001_initial','2025-01-23 16:16:30.936077'),
(4,'admin','0002_logentry_remove_auto_add','2025-01-23 16:16:30.945334'),
(5,'admin','0003_logentry_add_action_flag_choices','2025-01-23 16:16:30.953695'),
(6,'contenttypes','0002_remove_content_type_name','2025-01-23 16:16:31.038965'),
(7,'auth','0002_alter_permission_name_max_length','2025-01-23 16:16:31.132112'),
(8,'auth','0003_alter_user_email_max_length','2025-01-23 16:16:31.146827'),
(9,'auth','0004_alter_user_username_opts','2025-01-23 16:16:31.157061'),
(10,'auth','0005_alter_user_last_login_null','2025-01-23 16:16:31.232978'),
(11,'auth','0006_require_contenttypes_0002','2025-01-23 16:16:31.238618'),
(12,'auth','0007_alter_validators_add_error_messages','2025-01-23 16:16:31.246425'),
(13,'auth','0008_alter_user_username_max_length','2025-01-23 16:16:31.263366'),
(14,'auth','0009_alter_user_last_name_max_length','2025-01-23 16:16:31.281126'),
(15,'auth','0010_alter_group_name_max_length','2025-01-23 16:16:31.302263'),
(16,'auth','0011_update_proxy_permissions','2025-01-23 16:16:31.310388'),
(17,'auth','0012_alter_user_first_name_max_length','2025-01-23 16:16:31.326822'),
(18,'sessions','0001_initial','2025-01-23 16:16:31.390533'),
(19,'timetables','0001_initial','2025-01-23 16:16:31.722747'),
(20,'timetables','0002_ticket','2025-01-23 18:14:11.251302'),
(21,'timetables','0003_delete_ticket','2025-01-23 18:33:37.306397'),
(22,'tickets','0001_initial','2025-01-23 18:33:37.528916');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `django_session` */

insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values 
('19cole0bbxapld9tb2fxrqe397qcf58g','.eJxVjDsOwjAQBe_iGlnO-kco6XMGa9de4wCypTipEHeHSCmgfTPzXiLgtpawdV7CnMRFWHH63Qjjg-sO0h3rrcnY6rrMJHdFHrTLqSV-Xg_376BgL98arAfApBF0ZIygsifjwbLGxIzgsk-WgNBDHB2RMoPBcx4cgs2j0uL9AfjoOEU:1tbn8X:mMMPI-yvTmdWOLQ7vORL380fZTgT98IeHLVwo_H-lhs','2025-02-08 20:52:13.339548'),
('1mpirij001g4lzbg396gli806ogpgtsq','.eJxVjDsOwjAQBe_iGlnO-kco6XMGa9de4wCypTipEHeHSCmgfTPzXiLgtpawdV7CnMRFWHH63Qjjg-sO0h3rrcnY6rrMJHdFHrTLqSV-Xg_376BgL98arAfApBF0ZIygsifjwbLGxIzgsk-WgNBDHB2RMoPBcx4cgs2j0uL9AfjoOEU:1tbmBq:qrTrThO6qDtYKS_DNCeYDGot0kLbdx37zDvpkTBMoXw','2025-02-08 19:51:34.753877'),
('1nvcti5x0p4ahcminjaat6gzivx1lm0w','.eJxVjEEOwiAQRe_C2hCgQyku3fcMZIYZbdVAUtqV8e7apAvd_vfef6mE2zqlrcmSZlZnFdXpdyPMDyk74DuWW9W5lnWZSe-KPmjTY2V5Xg7372DCNn1r48QzE3QdAFnT9WgHb7IPGXwwjnpxA-YBwF6JvAPkaE30gaIYFofq_QHIijdd:1tbp18:sdIW-Diq4imoIjEZ-ZofCQpKDji-QPwQNbHdvKj7bDY','2025-02-08 22:52:42.372124'),
('26rizkbho4u3db3bdf6xb6erb8wzx3a1','.eJxVjDsOwjAQBe_iGlnO-kco6XMGa9de4wCypTipEHeHSCmgfTPzXiLgtpawdV7CnMRFWHH63Qjjg-sO0h3rrcnY6rrMJHdFHrTLqSV-Xg_376BgL98arAfApBF0ZIygsifjwbLGxIzgsk-WgNBDHB2RMoPBcx4cgs2j0uL9AfjoOEU:1tbmD3:FKZk9iBaJW4uQbFIvMc8YYUr5zj6wfZln8Z8B4j0vOo','2025-02-08 19:52:49.299282'),
('3iwv16f2n1yin69k7iazkhhuhvuep72q','.eJxVjDsOwjAQBe_iGlnO-kco6XMGa9de4wCypTipEHeHSCmgfTPzXiLgtpawdV7CnMRFWHH63Qjjg-sO0h3rrcnY6rrMJHdFHrTLqSV-Xg_376BgL98arAfApBF0ZIygsifjwbLGxIzgsk-WgNBDHB2RMoPBcx4cgs2j0uL9AfjoOEU:1tbmmZ:yl2D546v8F9wXA0b0Ab7nDKXJjgmkdFaawlYcnLQA_g','2025-02-08 20:29:31.662545'),
('4csr1fyoblddwm00rf8yc4glmm4cczb2','.eJxVjMEOwiAQBf-FsyFAYQGP3v0GAssiVQNJaU_Gf9cmPej1zcx7sRC3tYZt0BLmzM5MstPvliI-qO0g32O7dY69rcuc-K7wgw5-7Zmel8P9O6hx1G9tFQEV9M4bEhqmbAClUAaVd-B10iIXU5KNjoSUpIUVyScgwCmCnJC9P9GaN3k:1tb0uP:0oIGp-ZisyD88oEoYoMPW2A8_QvS59t1D70IMUHB04c','2025-02-06 17:22:25.923759'),
('58iq277w8w6qx0b94uzmwy1gpva3gul9','.eJxVjDsOwyAQBe9CHaHlj1Om9xkQsEtwEmHJ2FWUu0dILpL2zcx7sxCPvYaj0xYWZFc2scvvlmJ-UhsAH7HdV57Xtm9L4kPhJ-18XpFet9P9O6ix11HrbCEpBFQW0XtHUUkPUkNyWESJkKTSVhCQMBmLKhPYDMWgcaQ8sc8X7xw4KQ:1tbp4O:rQDu6A3FwH_9-cngffiMTzB33r4IuMuJZQe2BxOju4o','2025-02-08 22:56:04.239015'),
('66ivm5j98di4mwgl1kw9rrtapz3ofxad','.eJxVjDsOwjAQBe_iGlnO-kco6XMGa9de4wCypTipEHeHSCmgfTPzXiLgtpawdV7CnMRFWHH63Qjjg-sO0h3rrcnY6rrMJHdFHrTLqSV-Xg_376BgL98arAfApBF0ZIygsifjwbLGxIzgsk-WgNBDHB2RMoPBcx4cgs2j0uL9AfjoOEU:1tbmPp:PwXVuB4caIx2uIr1J0Y_muyceHTFgOOTz1IvqBAU650','2025-02-08 20:06:01.612444'),
('6i9tghidheglwv8m9500j4vqq4b5earj','.eJxVjDsOwjAQBe_iGlnO-kco6XMGa9de4wCypTipEHeHSCmgfTPzXiLgtpawdV7CnMRFWHH63Qjjg-sO0h3rrcnY6rrMJHdFHrTLqSV-Xg_376BgL98arAfApBF0ZIygsifjwbLGxIzgsk-WgNBDHB2RMoPBcx4cgs2j0uL9AfjoOEU:1tbn7X:yz-PsFSMWmROr9uGqjYleSK_mBTNNWjRWhEXjr3TMgE','2025-02-08 20:51:11.758644'),
('6lax40tujgrynw05tzo73od9ywtex7w9','.eJxVjEEOwiAQRe_C2hCgQyku3fcMZIYZbdVAUtqV8e7apAvd_vfef6mE2zqlrcmSZlZnFdXpdyPMDyk74DuWW9W5lnWZSe-KPmjTY2V5Xg7372DCNn1r48QzE3QdAFnT9WgHb7IPGXwwjnpxA-YBwF6JvAPkaE30gaIYFofq_QHIijdd:1tbp3X:xDf7UF821NzfRS82xgfFRA9KtwoyfAX8tbASKlop8TU','2025-02-08 22:55:11.588703'),
('6qozbhlkwccozxjp0eyv7151tkdltl6c','.eJxVjDsOwjAQBe_iGlnO-kco6XMGa9de4wCypTipEHeHSCmgfTPzXiLgtpawdV7CnMRFWHH63Qjjg-sO0h3rrcnY6rrMJHdFHrTLqSV-Xg_376BgL98arAfApBF0ZIygsifjwbLGxIzgsk-WgNBDHB2RMoPBcx4cgs2j0uL9AfjoOEU:1tbmy7:XGrBsYx9Qk8cSoi2JzYL316NGHRLEpM6llm5KY_eeyY','2025-02-08 20:41:27.621259'),
('7e48k72ursjyoanpsu76hup3zg6bfpob','.eJxVjMsOwiAQRf-FtSEwPASX7v0GMgMTqRpISrsy_rtt0oVu7znnvkXCdalpHTynqYiL8OL0uxHmJ7cdlAe2e5e5t2WeSO6KPOiQt174dT3cv4OKo241AQVWxTsFwNnorbRQPCC7mLMjOmsXY6HIWhOgjQqUMsahgRC8DeLzBe5vN1s:1tbnt1:o707OH9gLiGpchKHndNgYeiiOEbYoDQyU5aF7nDug2o','2025-02-08 21:40:15.374207'),
('7egplvp9a4y4bssv635b7ygil0gdeqti','.eJxVjDsOwjAQBe_iGlnO-kco6XMGa9de4wCypTipEHeHSCmgfTPzXiLgtpawdV7CnMRFWHH63Qjjg-sO0h3rrcnY6rrMJHdFHrTLqSV-Xg_376BgL98arAfApBF0ZIygsifjwbLGxIzgsk-WgNBDHB2RMoPBcx4cgs2j0uL9AfjoOEU:1tbmcu:0WbtKb_X2OYIzL20RRDm-_u2CX72L8ZqQsSmm0X8wyY','2025-02-08 20:19:32.872963'),
('7kivz4xyyyy3hgegdgx7iglamzw12cqw','.eJxVjDsOwjAQBe_iGlnO-kco6XMGa9de4wCypTipEHeHSCmgfTPzXiLgtpawdV7CnMRFWHH63Qjjg-sO0h3rrcnY6rrMJHdFHrTLqSV-Xg_376BgL98arAfApBF0ZIygsifjwbLGxIzgsk-WgNBDHB2RMoPBcx4cgs2j0uL9AfjoOEU:1tbmk2:FC5sCa9P8oxDnRV6HYGLTrHlCp1nMnQQNvSuP-YowxY','2025-02-08 20:26:54.770046'),
('7kpueobs99gtkroodkl62fkdroy4jmw4','.eJxVjEEOwiAQRe_C2hCYQiku3XsGMgyMVA0kpV0Z765NutDtf-_9lwi4rSVsPS9hTuIsvDj9bhHpkesO0h3rrUlqdV3mKHdFHrTLa0v5eTncv4OCvXxr9OBJpQkhcfRgKGuTo0VAB47ZsBqyjyMwJdKkXfQDo6KJzWBHZ514fwANFDic:1tc2Nd:ovW48ml-CQxEAzJB4lgqskkeT2v2yfS58CEyNWzE6ow','2025-02-09 13:08:49.478917'),
('7xwzzg5a9bzbvp8y1hl50it1ghiopfqt','.eJxVjEEOwiAQRe_C2hCYQiku3XsGMgyMVA0kpV0Z765NutDtf-_9lwi4rSVsPS9hTuIsvDj9bhHpkesO0h3rrUlqdV3mKHdFHrTLa0v5eTncv4OCvXxr9OBJpQkhcfRgKGuTo0VAB47ZsBqyjyMwJdKkXfQDo6KJzWBHZ514fwANFDic:1tbp87:YQQVKKwCp8P7bxf3WTd9fmLY0YcTT377PcdaQaYgrdA','2025-02-08 22:59:55.958041'),
('8qxifhfb9aour7u2ajxlroc6h9a1zzoy','.eJxVjDsOwjAQBe_iGlnO-kco6XMGa9de4wCypTipEHeHSCmgfTPzXiLgtpawdV7CnMRFWHH63Qjjg-sO0h3rrcnY6rrMJHdFHrTLqSV-Xg_376BgL98arAfApBF0ZIygsifjwbLGxIzgsk-WgNBDHB2RMoPBcx4cgs2j0uL9AfjoOEU:1tbmCa:6siCQrYP1E9uP8utyynh6KAfeYvqttJKzBK4N8lwvHI','2025-02-08 19:52:20.812389'),
('9agwb2wwmlly37m9yin7h9a36ronj8fm','.eJxVjEEOwiAQRe_C2hCYQiku3XsGMgyMVA0kpV0Z765NutDtf-_9lwi4rSVsPS9hTuIsvDj9bhHpkesO0h3rrUlqdV3mKHdFHrTLa0v5eTncv4OCvXxr9OBJpQkhcfRgKGuTo0VAB47ZsBqyjyMwJdKkXfQDo6KJzWBHZ514fwANFDic:1tc4x4:2MoBIUsopE8ubJHn6M_R5bopaRsAfQ1QHqHufBijA74','2025-02-09 15:53:34.571666'),
('9argkc8kewkphzawtznanebjx1jedzg1','.eJxVjcsOwiAURP-FtSGWGwq4dO83kPsAqRpISrsy_rtt0oVu55yZeauI61Li2tMcJ1EXFdTpNyPkZ6o7kAfWe9Pc6jJPpHdFH7TrW5P0uh7u30DBXrb2mR1TIPLAnoGAMooQB2CxQw5BjDDC6A2PwTvHmI0fMGeQ7YOtVZ8vKws5vg:1tbp7V:OXkH-S32Y7XWoYUsI7JTDXIme_W44ZaXzZi-l-hb9VE','2025-02-08 22:59:17.045079'),
('b0b8dm6ocu7m1vf6a4ejs6e157vvy4cc','.eJxVjEEOwiAQRe_C2pBSBhCX7nsGMsMMUjVtUtqV8e7apAvd_vfef6mE21rT1mRJI6uLMp06_Y6E-SHTTviO023WeZ7WZSS9K_qgTQ8zy_N6uH8HFVv91giWQMgiluLRebKWESVy7IPrCN3Z9MFnECbDEKVA77IHKYHQRgfq_QEyVjjt:1tc5Fk:b-AgLrejFLp7EO4hRFQQWt1UGfzy5Qoxr89gEgxOOos','2025-02-09 16:12:52.220411'),
('c75l8kdncri6xmyoskakovqy4lf7p51p','.eJxVjDsOwjAQBe_iGlnO-kco6XMGa9de4wCypTipEHeHSCmgfTPzXiLgtpawdV7CnMRFWHH63Qjjg-sO0h3rrcnY6rrMJHdFHrTLqSV-Xg_376BgL98arAfApBF0ZIygsifjwbLGxIzgsk-WgNBDHB2RMoPBcx4cgs2j0uL9AfjoOEU:1tbmEJ:4Qehw7fhdr8A_zE9Ndaf9aYhPCkRKeQ3rW_SqBb02Hs','2025-02-08 19:54:07.241048'),
('cfd7xrsvrciu97rggftu3y23k1zom0vv','.eJxVjEEOwiAQRe_C2hCYQiku3XsGMgyMVA0kpV0Z765NutDtf-_9lwi4rSVsPS9hTuIsvDj9bhHpkesO0h3rrUlqdV3mKHdFHrTLa0v5eTncv4OCvXxr9OBJpQkhcfRgKGuTo0VAB47ZsBqyjyMwJdKkXfQDo6KJzWBHZ514fwANFDic:1tc5DM:siKZw0-ks1trJu2O9WsXkX1_6RUAoGqgQHt6RSX7Mpo','2025-02-09 16:10:24.287646'),
('evv14aemapjbvx0rkkr9kxtekvfzu74l','.eJxVjDsOwjAQBe_iGlnO-kco6XMGa9de4wCypTipEHeHSCmgfTPzXiLgtpawdV7CnMRFWHH63Qjjg-sO0h3rrcnY6rrMJHdFHrTLqSV-Xg_376BgL98arAfApBF0ZIygsifjwbLGxIzgsk-WgNBDHB2RMoPBcx4cgs2j0uL9AfjoOEU:1tbmtQ:38_dmQvIeInz7sSoVh09xi_h5HNAyT-Xx-5MguREvt4','2025-02-08 20:36:36.760490'),
('f1u8yhqeqxyjmd3gb8a2wvd4qkknqzm8','.eJxVjMsOwiAQRf-FtSEwPASX7v0GMgMTqRpISrsy_rtt0oVu7znnvkXCdalpHTynqYiL8OL0uxHmJ7cdlAe2e5e5t2WeSO6KPOiQt174dT3cv4OKo241AQVWxTsFwNnorbRQPCC7mLMjOmsXY6HIWhOgjQqUMsahgRC8DeLzBe5vN1s:1tbo6k:DnVXH-CwevmiV1lfh28QEdGyqYXKKM-a0EI7m8WeaZ4','2025-02-08 21:54:26.517213'),
('f3jfxejn36us0kt1wncjh6ekd7o81cxp','.eJxVjMsOwiAQRf-FtSEwPASX7v0GMgMTqRpISrsy_rtt0oVu7znnvkXCdalpHTynqYiL8OL0uxHmJ7cdlAe2e5e5t2WeSO6KPOiQt174dT3cv4OKo241AQVWxTsFwNnorbRQPCC7mLMjOmsXY6HIWhOgjQqUMsahgRC8DeLzBe5vN1s:1tboDw:vJ25QuBaG2kjvj_fw_2ku1u9m-bKPDBXA_gzL2Atj5c','2025-02-08 22:01:52.284594'),
('f4tmd316vwm1o68508gnp30fvacnqnls','.eJxVjMsOwiAQRf-FtSEwPASX7v0GMgMTqRpISrsy_rtt0oVu7znnvkXCdalpHTynqYiL8OL0uxHmJ7cdlAe2e5e5t2WeSO6KPOiQt174dT3cv4OKo241AQVWxTsFwNnorbRQPCC7mLMjOmsXY6HIWhOgjQqUMsahgRC8DeLzBe5vN1s:1tbo8G:FQQdSNmR3jV7JjVmuvGmgsoDQhj--jUGQz_6a9EyIe4','2025-02-08 21:56:00.905358'),
('fdeo2wi23eeezxp0s0qt7628nczfdtic','.eJxVjEEOwiAQRe_C2hAYIIBL956BzMBUqgaS0q6Md9cmXej2v_f-SyTc1pq2wUuaiziLKE6_G2F-cNtBuWO7dZl7W5eZ5K7Igw557YWfl8P9O6g46rcOZEkDUgb0YJQzCIG096pEZGsVTTQ5lV1QBjVbzqyLYUKI4A1jEO8P6r04QQ:1tbotz:36XqWGmU6RqgNbSrzMkjWY7HDwcelrJB21SFXRIRsWo','2025-02-08 22:45:19.238848'),
('ffe3h17cwuz8u0hlyncjsd298p14nlqu','.eJxVjDsOwjAQBe_iGlnO-kco6XMGa9de4wCypTipEHeHSCmgfTPzXiLgtpawdV7CnMRFWHH63Qjjg-sO0h3rrcnY6rrMJHdFHrTLqSV-Xg_376BgL98arAfApBF0ZIygsifjwbLGxIzgsk-WgNBDHB2RMoPBcx4cgs2j0uL9AfjoOEU:1tbmqN:VqJgjDgDYT7zxDlYGfMb5Rs25_zwL8D6j3rNKEQmHXM','2025-02-08 20:33:27.580037'),
('fiz6dxbmwfmns1h70mf8zw5co3bokryf','.eJxVjEEOwiAQRe_C2hCYQiku3XsGMgyMVA0kpV0Z765NutDtf-_9lwi4rSVsPS9hTuIsvDj9bhHpkesO0h3rrUlqdV3mKHdFHrTLa0v5eTncv4OCvXxr9OBJpQkhcfRgKGuTo0VAB47ZsBqyjyMwJdKkXfQDo6KJzWBHZ514fwANFDic:1tc256:xhY1t9fs7q7nygOcWwci_OShGGo32OxZEF0siX91Ks8','2025-02-09 12:49:40.168074'),
('fva22w57ehto5teb16h64eg1omqsnmib','.eJxVjDsOwjAQBe_iGlnO-kco6XMGa9de4wCypTipEHeHSCmgfTPzXiLgtpawdV7CnMRFWHH63Qjjg-sO0h3rrcnY6rrMJHdFHrTLqSV-Xg_376BgL98arAfApBF0ZIygsifjwbLGxIzgsk-WgNBDHB2RMoPBcx4cgs2j0uL9AfjoOEU:1tbmE8:ArgTHKUxvxvTsbc3RLwrDTawhzSEaIbKUuqOcaRsWA4','2025-02-08 19:53:56.692873'),
('fvlf7gacganhlzz8olamz9hi7dn6yd2k','.eJxVjEEOwiAQRe_C2hCYQiku3XsGMgyMVA0kpV0Z765NutDtf-_9lwi4rSVsPS9hTuIsvDj9bhHpkesO0h3rrUlqdV3mKHdFHrTLa0v5eTncv4OCvXxr9OBJpQkhcfRgKGuTo0VAB47ZsBqyjyMwJdKkXfQDo6KJzWBHZ514fwANFDic:1tc2Jc:VkxkWVirFa566UceE6NjVg8N193koMWxiqIecSeAcEQ','2025-02-09 13:04:40.631043'),
('fxiz0wxfghmmx7jca8e9ie3ypqgns41w','.eJxVjMsOwiAQRf-FtSEwPASX7v0GMgMTqRpISrsy_rtt0oVu7znnvkXCdalpHTynqYiL8OL0uxHmJ7cdlAe2e5e5t2WeSO6KPOiQt174dT3cv4OKo241AQVWxTsFwNnorbRQPCC7mLMjOmsXY6HIWhOgjQqUMsahgRC8DeLzBe5vN1s:1tbo98:qB3wo61YVIOdFBXf7EYqsEwUuf9A3gyWz45sgW9oWDc','2025-02-08 21:56:54.958817'),
('ga2i887asge4oldgq5qinhsaeoarw2a8','.eJxVjDsOwjAQBe_iGlmsf7Ep6XMGa9de4wBypDipEHeHSCmgfTPzXiLitta4dV7ilMVFBHH63QjTg9sO8h3bbZZpbusykdwVedAuxznz83q4fwcVe_3WYDWwNehTNmB8yVohD-w9JQCfijUQCmliKi6ftTIeVUiIRINzVEi8P_DIOME:1tbp7q:-gn-GB14cMCC6MdsAvg3ukXC65rH8_75w555wlGExN0','2025-02-08 22:59:38.442023'),
('ghw61opibuevnfbo9o2rmf14egf44zc7','.eJxVjEEOwiAQRe_C2hAKBQaX7j0DGZhBqoYmpV0Z765NutDtf-_9l4i4rTVunZc4kTiLIE6_W8L84LYDumO7zTLPbV2mJHdFHrTL60z8vBzu30HFXr81shsMmVKSNiaM1loCF5yH7ItTOpMNmZFGcpAUKA-YoJRBZXCaLQfx_gDmgzf6:1tbowb:4inh2lyIou05unIDkNY0kk5kBVajEoeCXc76iflADqA','2025-02-08 22:48:01.148354'),
('hc1djjvmlz4ujlcf25uqis9ilqo161sa','.eJxVjEEOwiAQRe_C2hCYQiku3XsGMgyMVA0kpV0Z765NutDtf-_9lwi4rSVsPS9hTuIsvDj9bhHpkesO0h3rrUlqdV3mKHdFHrTLa0v5eTncv4OCvXxr9OBJpQkhcfRgKGuTo0VAB47ZsBqyjyMwJdKkXfQDo6KJzWBHZ514fwANFDic:1tc4pi:kWO3ODD87hWaHB2cisced4U31cn2KGNZsX1enuPuzQk','2025-02-09 15:45:58.542192'),
('hgjargqkp5m2mrdt3gtx1i3meqdsyqzj','.eJxVjDsOwjAQBe_iGlnO-kco6XMGa9de4wCypTipEHeHSCmgfTPzXiLgtpawdV7CnMRFWHH63Qjjg-sO0h3rrcnY6rrMJHdFHrTLqSV-Xg_376BgL98arAfApBF0ZIygsifjwbLGxIzgsk-WgNBDHB2RMoPBcx4cgs2j0uL9AfjoOEU:1tbmCS:cLb93ctWXnfObq-9i6xVCZNoOgunzb4kltuUoLXHFOg','2025-02-08 19:52:12.621999'),
('j0pcxu969uxikq55fpfu2wt8j8e0tovr','.eJxVjDsOwjAQBe_iGlnO-kco6XMGa9de4wCypTipEHeHSCmgfTPzXiLgtpawdV7CnMRFWHH63Qjjg-sO0h3rrcnY6rrMJHdFHrTLqSV-Xg_376BgL98arAfApBF0ZIygsifjwbLGxIzgsk-WgNBDHB2RMoPBcx4cgs2j0uL9AfjoOEU:1tbmCb:GMp6EZcdPpgIC3xxgtFC5QUqggkgmAHoFBcRJBkNTyc','2025-02-08 19:52:21.159055'),
('jeia7q09juluk8ab8wmb1ncp8fmwgo1l','.eJxVjEEOwiAQRe_C2hCYQiku3XsGMgyMVA0kpV0Z765NutDtf-_9lwi4rSVsPS9hTuIsvDj9bhHpkesO0h3rrUlqdV3mKHdFHrTLa0v5eTncv4OCvXxr9OBJpQkhcfRgKGuTo0VAB47ZsBqyjyMwJdKkXfQDo6KJzWBHZ514fwANFDic:1tc24A:rnsYJEp3Duhi7UgMkWhM1q6j6WdXyvzsnb3QFIA2t5Q','2025-02-09 12:48:42.400410'),
('jit09aa3tisncmk5rhy4zew5fbj9rqqa','.eJxVjEEOwiAQRe_C2hCYQiku3XsGMgyMVA0kpV0Z765NutDtf-_9lwi4rSVsPS9hTuIsvDj9bhHpkesO0h3rrUlqdV3mKHdFHrTLa0v5eTncv4OCvXxr9OBJpQkhcfRgKGuTo0VAB47ZsBqyjyMwJdKkXfQDo6KJzWBHZ514fwANFDic:1tc2KL:s4boFifXu-WfEfvEkzwqM0uLg27FhlGLtOwKuQKE8Cc','2025-02-09 13:05:25.717360'),
('jucr4cgkxbk2k8863e1eknfoiu36gw03','.eJxVjDsOwjAQBe_iGlnO-kco6XMGa9de4wCypTipEHeHSCmgfTPzXiLgtpawdV7CnMRFWHH63Qjjg-sO0h3rrcnY6rrMJHdFHrTLqSV-Xg_376BgL98arAfApBF0ZIygsifjwbLGxIzgsk-WgNBDHB2RMoPBcx4cgs2j0uL9AfjoOEU:1tbnVd:kKrLLB7L0_XMGoWwIfg3BbAcaXIt93ajuIl7J7WryzQ','2025-02-08 21:16:05.571920'),
('khx93r8i29s5sf4hmu6pibfskqen5q8e','.eJxVjMsOwiAUBf-FtSFAoRdcuvcbmvsAWzWQ9LEy_rs26UK3Z2bOSw24reOwLXkeJlFnZY06_Y6E_Mh1J3LHemuaW13nifSu6IMu-tokPy-H-3cw4jJ-6xic76L1KAwsRAImGeepdx2knCl4TNEKJGEqqUByXJihM31vIBhU7w8EGjgP:1tc5KV:8B8o6ud7vzoQ8nEAUa7VIP2CIqTwHUbH5xX2ldn1nKE','2025-02-09 16:17:47.130637'),
('knuwbsotalokpowbp4k6ahqm1xcdrrw4','.eJxVjMsOwiAQRf-FtSEwPASX7v0GMgMTqRpISrsy_rtt0oVu7znnvkXCdalpHTynqYiL8OL0uxHmJ7cdlAe2e5e5t2WeSO6KPOiQt174dT3cv4OKo241AQVWxTsFwNnorbRQPCC7mLMjOmsXY6HIWhOgjQqUMsahgRC8DeLzBe5vN1s:1tbo72:eaellhy-JpKkRj4JV5r4mtc_V2RVWjlhhBbICMMJ47A','2025-02-08 21:54:44.496824'),
('ksytygdb71u3ceknvjwasfck8mgmlnsx','.eJxVjDsOwjAQBe_iGlnO-kco6XMGa9de4wCypTipEHeHSCmgfTPzXiLgtpawdV7CnMRFWHH63Qjjg-sO0h3rrcnY6rrMJHdFHrTLqSV-Xg_376BgL98arAfApBF0ZIygsifjwbLGxIzgsk-WgNBDHB2RMoPBcx4cgs2j0uL9AfjoOEU:1tbnPK:KCY6geC-1ODGJfxS03H__ciEcLsixCfWSXeahcFffwE','2025-02-08 21:09:34.043998'),
('l2qzq6mpkw4a4xu4ertnzn3rlozni9zz','.eJxVjDsOwyAQBe9CHaHlj1Om9xkQsEtwEmHJ2FWUu0dILpL2zcx7sxCPvYaj0xYWZFc2scvvlmJ-UhsAH7HdV57Xtm9L4kPhJ-18XpFet9P9O6ix11HrbCEpBFQW0XtHUUkPUkNyWESJkKTSVhCQMBmLKhPYDMWgcaQ8sc8X7xw4KQ:1tbp6q:kW_YEB4uUMWWG-b8g5h-v9Ux0G4pzRI5Foiw9BhywBY','2025-02-08 22:58:36.113635'),
('lnye5kb7tuhsq51aml7ndo2b0h1vxy0z','.eJxVjEEOwiAQRe_C2hCgQyku3fcMZIYZbdVAUtqV8e7apAvd_vfef6mE2zqlrcmSZlZnFdXpdyPMDyk74DuWW9W5lnWZSe-KPmjTY2V5Xg7372DCNn1r48QzE3QdAFnT9WgHb7IPGXwwjnpxA-YBwF6JvAPkaE30gaIYFofq_QHIijdd:1tbp0i:PMhO__AzOd_opxkwK4HeQeq7QHR-UCK_malyYURvX_U','2025-02-08 22:52:16.406498'),
('m6laexzbe1vxp4qh47mkjd4hsaelert6','.eJxVjEEOwiAQRe_C2hCgQyku3fcMZIYZbdVAUtqV8e7apAvd_vfef6mE2zqlrcmSZlZnFdXpdyPMDyk74DuWW9W5lnWZSe-KPmjTY2V5Xg7372DCNn1r48QzE3QdAFnT9WgHb7IPGXwwjnpxA-YBwF6JvAPkaE30gaIYFofq_QHIijdd:1tbozK:oVZb4KAkemdDIaqUkxJjgXACx23AlRfiEKRQWdrz54E','2025-02-08 22:50:50.886136'),
('moznf7u4capabvkcxr4c5ns8wu5ld78w','.eJxVjDsOwjAQBe_iGlnO-kco6XMGa9de4wCypTipEHeHSCmgfTPzXiLgtpawdV7CnMRFWHH63Qjjg-sO0h3rrcnY6rrMJHdFHrTLqSV-Xg_376BgL98arAfApBF0ZIygsifjwbLGxIzgsk-WgNBDHB2RMoPBcx4cgs2j0uL9AfjoOEU:1tbngX:LhZQTigOViiQ99jzWcT97iIaIP4Fscck_4ovINMcYNU','2025-02-08 21:27:21.099091'),
('mxlb0p4yrdo7vzgablobtou3vkfnd9c3','.eJxVjMsOwiAQRf-FtSEwPASX7v0GMgMTqRpISrsy_rtt0oVu7znnvkXCdalpHTynqYiL8OL0uxHmJ7cdlAe2e5e5t2WeSO6KPOiQt174dT3cv4OKo241AQVWxTsFwNnorbRQPCC7mLMjOmsXY6HIWhOgjQqUMsahgRC8DeLzBe5vN1s:1tbo7X:UU25DBdv1h1jQuvsET6bE4WHS2QCcjgccHjfBd9bYgw','2025-02-08 21:55:15.436133'),
('o60epgyj52up2m09dj9abi1jvml0gs2e','.eJxVjDsOwjAQBe_iGlnO-kco6XMGa9de4wCypTipEHeHSCmgfTPzXiLgtpawdV7CnMRFWHH63Qjjg-sO0h3rrcnY6rrMJHdFHrTLqSV-Xg_376BgL98arAfApBF0ZIygsifjwbLGxIzgsk-WgNBDHB2RMoPBcx4cgs2j0uL9AfjoOEU:1tbmD2:4rlTN-1Wsd0uN0z0C5EQFyH4DEfVFgwGvZjhGyz_PKY','2025-02-08 19:52:48.672998'),
('paq1mtbgjvznt59ji3oh9p2hqwq49fdf','.eJxVjEEOwiAQRe_C2hCYQiku3XsGMgyMVA0kpV0Z765NutDtf-_9lwi4rSVsPS9hTuIsvDj9bhHpkesO0h3rrUlqdV3mKHdFHrTLa0v5eTncv4OCvXxr9OBJpQkhcfRgKGuTo0VAB47ZsBqyjyMwJdKkXfQDo6KJzWBHZ514fwANFDic:1tc59f:d_1KLsIEjF0G5LSc8R3sezYFkadckx_ipLaoU-fQ2n0','2025-02-09 16:06:35.904923'),
('r1t0w6rwduqy8uwczj5df2eeyjg3eqmn','.eJxVjEEOwiAQRe_C2hCYQiku3XsGMgyMVA0kpV0Z765NutDtf-_9lwi4rSVsPS9hTuIsvDj9bhHpkesO0h3rrUlqdV3mKHdFHrTLa0v5eTncv4OCvXxr9OBJpQkhcfRgKGuTo0VAB47ZsBqyjyMwJdKkXfQDo6KJzWBHZ514fwANFDic:1tc2BI:VAJWvGtFRMHTAe9bYnuY0MdwKwfAXcmq0C_YG-ZFKOU','2025-02-09 12:56:04.726271'),
('r6aim773royv38us8xsbirg67pfowrq2','.eJxVjDsOwjAQBe_iGlnO-kco6XMGa9de4wCypTipEHeHSCmgfTPzXiLgtpawdV7CnMRFWHH63Qjjg-sO0h3rrcnY6rrMJHdFHrTLqSV-Xg_376BgL98arAfApBF0ZIygsifjwbLGxIzgsk-WgNBDHB2RMoPBcx4cgs2j0uL9AfjoOEU:1tbnhN:GAJL1HqgVQU6e9QCAPDbHRhPTg7ZNHS0bw93H4B3Em0','2025-02-08 21:28:13.006603'),
('rnmm18icr6wzyo80pu1249tqi0wwne4z','.eJxVjDsOwjAQBe_iGlnO-kco6XMGa9de4wCypTipEHeHSCmgfTPzXiLgtpawdV7CnMRFWHH63Qjjg-sO0h3rrcnY6rrMJHdFHrTLqSV-Xg_376BgL98arAfApBF0ZIygsifjwbLGxIzgsk-WgNBDHB2RMoPBcx4cgs2j0uL9AfjoOEU:1tbmZc:8T272XDS0debYyTuvRBax8J77qT66qJVqpn3Pz2MgdI','2025-02-08 20:16:08.605911'),
('rp3l0fwrx4cnx6ecoi5kihjiqvj5a5i7','.eJxVjDsOwjAQBe_iGlnO-kco6XMGa9de4wCypTipEHeHSCmgfTPzXiLgtpawdV7CnMRFWHH63Qjjg-sO0h3rrcnY6rrMJHdFHrTLqSV-Xg_376BgL98arAfApBF0ZIygsifjwbLGxIzgsk-WgNBDHB2RMoPBcx4cgs2j0uL9AfjoOEU:1tbml1:QJ9GYmqj6M0a-Fos3XyNCFZb99OLHQvNnyD6afDOAzs','2025-02-08 20:27:55.428323'),
('rydzaljqpvih5esbp9ee83qm7u9h2nb3','.eJxVjDsOwjAQRO_iGllrx79Q0ucM1q4_OIAcKU4qxN1xpBRQzrw382Ye9634vaXVz5FdmWWX344wPFM9QHxgvS88LHVbZ-KHwk_a-LTE9Lqd7t9BwVb6OjiXlSMplFMjIGVrDGC2BEHYPBqNAwBiDjIpLQfnetaSBKBWXQP2-QLZMzdh:1tboEU:-DPcySxcg0VU9sRFz3DDy6NZ-1ngnqVNZ1WuBD793lY','2025-02-08 22:02:26.878924'),
('sgproyr5yoekcznbitnv3lz6gubom2q0','.eJxVjMsOwiAQRf-FtSEwPASX7v0GMgMTqRpISrsy_rtt0oVu7znnvkXCdalpHTynqYiL8OL0uxHmJ7cdlAe2e5e5t2WeSO6KPOiQt174dT3cv4OKo241AQVWxTsFwNnorbRQPCC7mLMjOmsXY6HIWhOgjQqUMsahgRC8DeLzBe5vN1s:1tbnwX:jrxsKmPKcmt0Sb72MyYv5BliO6rLt-8f5UiOPIdW6hc','2025-02-08 21:43:53.846981'),
('sjdzgynfncm6hb6h946tqbz25xx5awmo','.eJxVjDsOwjAQBe_iGlnO-kco6XMGa9de4wCypTipEHeHSCmgfTPzXiLgtpawdV7CnMRFWHH63Qjjg-sO0h3rrcnY6rrMJHdFHrTLqSV-Xg_376BgL98arAfApBF0ZIygsifjwbLGxIzgsk-WgNBDHB2RMoPBcx4cgs2j0uL9AfjoOEU:1tbmFL:RJcWQSxMaunGCh2KJxGvnIDoVdqZFE0cF1Pl3Bkuny4','2025-02-08 19:55:11.063475'),
('sorwysgv74o9y2naxv9l7offwyp3qayd','.eJxVjEEOwiAQRe_C2hCYQiku3XsGMgyMVA0kpV0Z765NutDtf-_9lwi4rSVsPS9hTuIsvDj9bhHpkesO0h3rrUlqdV3mKHdFHrTLa0v5eTncv4OCvXxr9OBJpQkhcfRgKGuTo0VAB47ZsBqyjyMwJdKkXfQDo6KJzWBHZ514fwANFDic:1tc2Pl:WGUgEd7E-sqqqVPFJJ-IrFVuiKb0hzqNkOXQggbMlSU','2025-02-09 13:11:01.943512'),
('sqjd1w21zycwa1lze7eix5yldf0mi340','.eJxVjDsOwjAQBe_iGlnO-kco6XMGa9de4wCypTipEHeHSCmgfTPzXiLgtpawdV7CnMRFWHH63Qjjg-sO0h3rrcnY6rrMJHdFHrTLqSV-Xg_376BgL98arAfApBF0ZIygsifjwbLGxIzgsk-WgNBDHB2RMoPBcx4cgs2j0uL9AfjoOEU:1tbnBB:GAqDQbWeAtUd8aNY-aIwxQONzxSr57txeTi1GDDSxcI','2025-02-08 20:54:57.209796'),
('szpdgxrztkhn5dw5o2ca59te3wfyt5pi','.eJxVjDsOwjAQBe_iGlnO-kco6XMGa9de4wCypTipEHeHSCmgfTPzXiLgtpawdV7CnMRFWHH63Qjjg-sO0h3rrcnY6rrMJHdFHrTLqSV-Xg_376BgL98arAfApBF0ZIygsifjwbLGxIzgsk-WgNBDHB2RMoPBcx4cgs2j0uL9AfjoOEU:1tbmCZ:oGtcnkcw4VdzeGrXph4NkIiT5vGPWD8eXNEXZa2xqv8','2025-02-08 19:52:19.407976'),
('t2qripqbibkc3gj60wzfjgudnvef8a2s','.eJxVjDsOwjAQBe_iGlnO-kco6XMGa9de4wCypTipEHeHSCmgfTPzXiLgtpawdV7CnMRFWHH63Qjjg-sO0h3rrcnY6rrMJHdFHrTLqSV-Xg_376BgL98arAfApBF0ZIygsifjwbLGxIzgsk-WgNBDHB2RMoPBcx4cgs2j0uL9AfjoOEU:1tbnKG:KdPP-YFm2Lug9ErFFnjZzVy8DEntkMt1gLP_bUUK4MM','2025-02-08 21:04:20.072330'),
('t3omcch0p0s1s70r7zv2kmbkzrn8xk5r','.eJxVjDsOwjAQBe_iGlnO-kco6XMGa9de4wCypTipEHeHSCmgfTPzXiLgtpawdV7CnMRFWHH63Qjjg-sO0h3rrcnY6rrMJHdFHrTLqSV-Xg_376BgL98arAfApBF0ZIygsifjwbLGxIzgsk-WgNBDHB2RMoPBcx4cgs2j0uL9AfjoOEU:1tbmWo:Ls2MKz0j7XVZmRlTBnLNsfotV3QLJadArZryB2Q3Dd0','2025-02-08 20:13:14.254569'),
('vh5d37vcreudg5h929zvfyujcwfsfksj','.eJxVjMsOwiAQRf-FtSHlMRRcuvcbyAwMUjU0Ke3K-O_apAvd3nPOfYmI21rj1nmJUxZnEcTpdyNMD247yHdst1mmua3LRHJX5EG7vM6Zn5fD_Tuo2Ou3BlIOzMCDt6pQAGBjyRnKziarfAleIXAw3pYAuWggwpFdUIQ6sR7F-wPO_De2:1tbocC:4ZyHVLIMHxLZBYvJ2_jOUd0XiFFIoSuNISNb9vj4J-c','2025-02-08 22:26:56.507609'),
('vk511tnoqvbjwdbnruvtc9doujbx73ey','.eJxVjDsOwjAQBe_iGlnO-kco6XMGa9de4wCypTipEHeHSCmgfTPzXiLgtpawdV7CnMRFWHH63Qjjg-sO0h3rrcnY6rrMJHdFHrTLqSV-Xg_376BgL98arAfApBF0ZIygsifjwbLGxIzgsk-WgNBDHB2RMoPBcx4cgs2j0uL9AfjoOEU:1tbndP:m_Jzs2tEhwy7uOPdidL-d8ejPpyoptM90JI1xMc-ux4','2025-02-08 21:24:07.687728'),
('wockjaqjieh2yu8xw9i5rsabhg866yeh','.eJxVjDsOwjAQBe_iGlnO-kco6XMGa9de4wCypTipEHeHSCmgfTPzXiLgtpawdV7CnMRFWHH63Qjjg-sO0h3rrcnY6rrMJHdFHrTLqSV-Xg_376BgL98arAfApBF0ZIygsifjwbLGxIzgsk-WgNBDHB2RMoPBcx4cgs2j0uL9AfjoOEU:1tbmG4:9PBWzQxrll5hfB864ATZr0IICK-aOKDRdGorBZZUSF4','2025-02-08 19:55:56.519554'),
('xxstj1wcrg71fwhyctkkdx29psj7y3q4','.eJxVjEEOwiAQRe_C2hCgQyku3fcMZIYZbdVAUtqV8e7apAvd_vfef6mE2zqlrcmSZlZnFdXpdyPMDyk74DuWW9W5lnWZSe-KPmjTY2V5Xg7372DCNn1r48QzE3QdAFnT9WgHb7IPGXwwjnpxA-YBwF6JvAPkaE30gaIYFofq_QHIijdd:1tbp0K:CYTjjbcmfdqlPWYI3h0J59Ddtmv0UP1vuqHEIxlphrk','2025-02-08 22:51:52.671215'),
('xyumt8noazcopvfh27p0rykf825e0rxb','.eJxVjMsOwiAQRf-FtSHlMRRcuvcbyAwMUjU0Ke3K-O_apAvd3nPOfYmI21rj1nmJUxZnEcTpdyNMD247yHdst1mmua3LRHJX5EG7vM6Zn5fD_Tuo2Ou3BlIOzMCDt6pQAGBjyRnKziarfAleIXAw3pYAuWggwpFdUIQ6sR7F-wPO_De2:1tboM1:BQcevK7TVhdsXGHwvCCF_ctWFaInOaD7E_rxzBp9IUw','2025-02-08 22:10:13.371801'),
('ycebprujk9u65vcgbainxcg470gitl9x','.eJxVjEEOwiAQRe_C2hCgQyku3fcMZIYZbdVAUtqV8e7apAvd_vfef6mE2zqlrcmSZlZnFdXpdyPMDyk74DuWW9W5lnWZSe-KPmjTY2V5Xg7372DCNn1r48QzE3QdAFnT9WgHb7IPGXwwjnpxA-YBwF6JvAPkaE30gaIYFofq_QHIijdd:1tbp2J:10mXFroJtE0QJaSLpL1aEtxi3XVVydbIQQAac8S7Vkc','2025-02-08 22:53:55.364542'),
('yi4pc88ye5j3t7oj7b1fr7m8f7fjjvhl','.eJxVjDsOwyAQBe9CHaHlj1Om9xkQsEtwEmHJ2FWUu0dILpL2zcx7sxCPvYaj0xYWZFc2scvvlmJ-UhsAH7HdV57Xtm9L4kPhJ-18XpFet9P9O6ix11HrbCEpBFQW0XtHUUkPUkNyWESJkKTSVhCQMBmLKhPYDMWgcaQ8sc8X7xw4KQ:1tbp5F:o8t9D1dcvpnv7CE8aRoOBK6CtiUJyvSQLfz7hN-weCw','2025-02-08 22:56:57.870544'),
('z500kxbd55ct1wten9kfasl1am9e6k95','.eJxVjEEOwiAQRe_C2hCYQiku3XsGMgyMVA0kpV0Z765NutDtf-_9lwi4rSVsPS9hTuIsvDj9bhHpkesO0h3rrUlqdV3mKHdFHrTLa0v5eTncv4OCvXxr9OBJpQkhcfRgKGuTo0VAB47ZsBqyjyMwJdKkXfQDo6KJzWBHZ514fwANFDic:1tc2SR:q76g1NgN7E18OZQhpyy_u2WJ2ZI_1YDwDLfxDvkQmvk','2025-02-09 13:13:47.982207'),
('zyzjqyaxtj1jt66k6lzmn5mddaogyc3a','.eJxVjEsOwiAUAO_C2hD6ytel-56BPHggVQNJaVfGuxuSLnQ7M5k383jsxR89bX4ldmWWXX5ZwPhMdQh6YL03HlvdtzXwkfDTdr40Sq_b2f4NCvYytnnWCCJTIhRKg0UNgqIzisjFFGKYZJYqZQJtZjdlkCCldBqMscoJ9vkC-QI3ig:1tboFN:VEHaMVt6dT9V8eLpSFygPsMPE5zozjVizb_GjUSySq8','2025-02-08 22:03:21.850452');

/*Table structure for table `tickets_ticket` */

DROP TABLE IF EXISTS `tickets_ticket`;

CREATE TABLE `tickets_ticket` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `passenger_count` int(11) NOT NULL,
  `timetable_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tickets_ticket_timetable_id_3e889304_fk_timetables_timetable_id` (`timetable_id`),
  KEY `tickets_ticket_user_id_6f5f1c69_fk_auth_user_id` (`user_id`),
  CONSTRAINT `tickets_ticket_timetable_id_3e889304_fk_timetables_timetable_id` FOREIGN KEY (`timetable_id`) REFERENCES `timetables_timetable` (`id`),
  CONSTRAINT `tickets_ticket_user_id_6f5f1c69_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tickets_ticket` */

insert  into `tickets_ticket`(`id`,`passenger_count`,`timetable_id`,`user_id`) values 
(1,3,13,9),
(2,1,19,9),
(3,2,1,1),
(4,3,13,1);

/*Table structure for table `timetables_city` */

DROP TABLE IF EXISTS `timetables_city`;

CREATE TABLE `timetables_city` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `postal_code` int(10) unsigned NOT NULL CHECK (`postal_code` >= 0),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

/*Data for the table `timetables_city` */

insert  into `timetables_city`(`id`,`name`,`postal_code`) values 
(1,'New York',10001),
(2,'Jersey City',7302),
(3,'Hoboken',7030),
(4,'Trenton',8601),
(5,'Atlantic City',8201);

/*Table structure for table `timetables_timetable` */

DROP TABLE IF EXISTS `timetables_timetable`;

CREATE TABLE `timetables_timetable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `time` time(6) NOT NULL,
  `arrival_city_id` bigint(20) NOT NULL,
  `departure_city_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `timetables_timetable_arrival_city_id_0e6e1d55_fk_timetable` (`arrival_city_id`),
  KEY `timetables_timetable_departure_city_id_8c67b457_fk_timetable` (`departure_city_id`),
  CONSTRAINT `timetables_timetable_arrival_city_id_0e6e1d55_fk_timetable` FOREIGN KEY (`arrival_city_id`) REFERENCES `timetables_city` (`id`),
  CONSTRAINT `timetables_timetable_departure_city_id_8c67b457_fk_timetable` FOREIGN KEY (`departure_city_id`) REFERENCES `timetables_city` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4;

/*Data for the table `timetables_timetable` */

insert  into `timetables_timetable`(`id`,`date`,`time`,`arrival_city_id`,`departure_city_id`) values 
(1,'2025-01-23','18:00:00.000000',1,2),
(5,'2025-01-30','12:00:00.000000',2,3),
(6,'2025-01-24','17:00:00.000000',1,5),
(13,'2025-01-26','12:00:00.000000',1,2),
(14,'2025-01-26','13:00:00.000000',1,2),
(15,'2025-01-26','14:00:00.000000',1,2),
(16,'2025-01-26','15:00:00.000000',2,1),
(17,'2025-01-26','15:00:00.000000',2,1),
(18,'2025-01-26','16:00:00.000000',2,1),
(19,'2025-01-26','17:00:00.000000',2,1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
