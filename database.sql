-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: trainingdb
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add bulletin',6,'add_bulletin'),(22,'Can change bulletin',6,'change_bulletin'),(23,'Can delete bulletin',6,'delete_bulletin'),(24,'Can view bulletin',6,'view_bulletin'),(25,'Can add department',7,'add_department'),(26,'Can change department',7,'change_department'),(27,'Can delete department',7,'delete_department'),(28,'Can view department',7,'view_department'),(29,'Can add semester',8,'add_semester'),(30,'Can change semester',8,'change_semester'),(31,'Can delete semester',8,'delete_semester'),(32,'Can view semester',8,'view_semester'),(33,'Can add statute',9,'add_statute'),(34,'Can change statute',9,'change_statute'),(35,'Can delete statute',9,'delete_statute'),(36,'Can view statute',9,'view_statute'),(37,'Can add klass',10,'add_klass'),(38,'Can change klass',10,'change_klass'),(39,'Can delete klass',10,'delete_klass'),(40,'Can view klass',10,'view_klass'),(41,'Can add activity',11,'add_activity'),(42,'Can change activity',11,'change_activity'),(43,'Can delete activity',11,'delete_activity'),(44,'Can view activity',11,'view_activity'),(45,'Can add student activity',12,'add_studentactivity'),(46,'Can change student activity',12,'change_studentactivity'),(47,'Can delete student activity',12,'delete_studentactivity'),(48,'Can view student activity',12,'view_studentactivity'),(49,'Can add missing activity report',13,'add_missingactivityreport'),(50,'Can change missing activity report',13,'change_missingactivityreport'),(51,'Can delete missing activity report',13,'delete_missingactivityreport'),(52,'Can view missing activity report',13,'view_missingactivityreport'),(53,'Can add User',14,'add_user'),(54,'Can change User',14,'change_user'),(55,'Can delete User',14,'delete_user'),(56,'Can view User',14,'view_user'),(57,'Can create student account',14,'create_student_account'),(58,'Can create assistant account',14,'create_assistant_account'),(59,'Can create specialist account',14,'create_specialist_account'),(60,'Can add student',15,'add_student'),(61,'Can change student',15,'change_student'),(62,'Can delete student',15,'delete_student'),(63,'Can view student',15,'view_student'),(64,'Can add comment',16,'add_comment'),(65,'Can change comment',16,'change_comment'),(66,'Can delete comment',16,'delete_comment'),(67,'Can view comment',16,'view_comment'),(68,'Can add like',17,'add_like'),(69,'Can change like',17,'change_like'),(70,'Can delete like',17,'delete_like'),(71,'Can view like',17,'view_like'),(72,'Can add application',18,'add_application'),(73,'Can change application',18,'change_application'),(74,'Can delete application',18,'delete_application'),(75,'Can view application',18,'view_application'),(76,'Can add access token',19,'add_accesstoken'),(77,'Can change access token',19,'change_accesstoken'),(78,'Can delete access token',19,'delete_accesstoken'),(79,'Can view access token',19,'view_accesstoken'),(80,'Can add grant',20,'add_grant'),(81,'Can change grant',20,'change_grant'),(82,'Can delete grant',20,'delete_grant'),(83,'Can view grant',20,'view_grant'),(84,'Can add refresh token',21,'add_refreshtoken'),(85,'Can change refresh token',21,'change_refreshtoken'),(86,'Can delete refresh token',21,'delete_refreshtoken'),(87,'Can view refresh token',21,'view_refreshtoken'),(88,'Can add id token',22,'add_idtoken'),(89,'Can change id token',22,'change_idtoken'),(90,'Can delete id token',22,'delete_idtoken'),(91,'Can view id token',22,'view_idtoken');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8mb4_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_TrainingAPIApp_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_TrainingAPIApp_user_id` FOREIGN KEY (`user_id`) REFERENCES `trainingapiapp_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2024-06-08 16:22:29.577028','1','Điều 1',1,'[{\"added\": {}}]',9,1),(2,'2024-06-08 16:22:40.116920','2','Điều 2',1,'[{\"added\": {}}]',9,1),(3,'2024-06-08 16:22:50.417420','3','Điều 3',1,'[{\"added\": {}}]',9,1),(4,'2024-06-08 16:22:57.231630','4','Điều 4',1,'[{\"added\": {}}]',9,1),(5,'2024-06-08 16:23:04.551926','5','Điều 5',1,'[{\"added\": {}}]',9,1),(6,'2024-06-08 16:23:11.416715','1','HK1-2024',1,'[{\"added\": {}}]',8,1),(7,'2024-06-08 16:23:15.712347','2','HK2-2024',1,'[{\"added\": {}}]',8,1),(8,'2024-06-08 16:24:02.573276','1','Công nghệ thông tin',1,'[{\"added\": {}}]',7,1),(9,'2024-06-08 16:24:04.437592','2','Kinh tế và quản lý công',1,'[{\"added\": {}}]',7,1),(10,'2024-06-08 16:24:06.013139','3','Tài chính - Ngân hàng',1,'[{\"added\": {}}]',7,1),(11,'2024-06-08 16:24:07.650876','4','Đào tạo đặc biệt',1,'[{\"added\": {}}]',7,1),(12,'2024-06-08 16:24:09.591763','5','Kế toán - kiểm toán',1,'[{\"added\": {}}]',7,1),(13,'2024-06-08 16:24:11.226948','6','Xây dựng',1,'[{\"added\": {}}]',7,1),(14,'2024-06-08 16:32:03.757409','1','IT01',1,'[{\"added\": {}}]',10,1),(15,'2024-06-08 16:32:08.358515','2','IT02',1,'[{\"added\": {}}]',10,1),(16,'2024-06-08 16:32:12.801622','3','EC01',1,'[{\"added\": {}}]',10,1),(17,'2024-06-08 16:32:16.859112','4','EC02',1,'[{\"added\": {}}]',10,1),(18,'2024-06-08 16:33:39.933315','5','FB01',1,'[{\"added\": {}}]',10,1),(19,'2024-06-08 16:33:46.841658','6','FB02',1,'[{\"added\": {}}]',10,1),(20,'2024-06-08 16:34:00.633560','7','SE01',1,'[{\"added\": {}}]',10,1),(21,'2024-06-08 16:34:05.476978','8','SE02',1,'[{\"added\": {}}]',10,1),(22,'2024-06-08 16:34:30.919697','9','BA',1,'[{\"added\": {}}]',10,1),(23,'2024-06-08 16:34:37.365669','10','BA02',1,'[{\"added\": {}}]',10,1),(24,'2024-06-08 16:34:44.711125','11','BT01',1,'[{\"added\": {}}]',10,1),(25,'2024-06-08 16:34:56.774453','12','BT02',1,'[{\"added\": {}}]',10,1),(26,'2024-06-08 16:35:05.222746','9','BA01',2,'[{\"changed\": {\"fields\": [\"Klass name\"]}}]',10,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(19,'oauth2_provider','accesstoken'),(18,'oauth2_provider','application'),(20,'oauth2_provider','grant'),(22,'oauth2_provider','idtoken'),(21,'oauth2_provider','refreshtoken'),(5,'sessions','session'),(11,'TrainingAPIApp','activity'),(6,'TrainingAPIApp','bulletin'),(16,'TrainingAPIApp','comment'),(7,'TrainingAPIApp','department'),(10,'TrainingAPIApp','klass'),(17,'TrainingAPIApp','like'),(13,'TrainingAPIApp','missingactivityreport'),(8,'TrainingAPIApp','semester'),(9,'TrainingAPIApp','statute'),(15,'TrainingAPIApp','student'),(12,'TrainingAPIApp','studentactivity'),(14,'TrainingAPIApp','user');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-06-08 15:58:00.732079'),(2,'contenttypes','0002_remove_content_type_name','2024-06-08 15:58:01.273245'),(3,'auth','0001_initial','2024-06-08 15:58:02.819712'),(4,'auth','0002_alter_permission_name_max_length','2024-06-08 15:58:03.102374'),(5,'auth','0003_alter_user_email_max_length','2024-06-08 15:58:03.138416'),(6,'auth','0004_alter_user_username_opts','2024-06-08 15:58:03.163863'),(7,'auth','0005_alter_user_last_login_null','2024-06-08 15:58:03.194972'),(8,'auth','0006_require_contenttypes_0002','2024-06-08 15:58:03.213853'),(9,'auth','0007_alter_validators_add_error_messages','2024-06-08 15:58:03.236996'),(10,'auth','0008_alter_user_username_max_length','2024-06-08 15:58:03.269743'),(11,'auth','0009_alter_user_last_name_max_length','2024-06-08 15:58:03.284659'),(12,'auth','0010_alter_group_name_max_length','2024-06-08 15:58:03.334488'),(13,'auth','0011_update_proxy_permissions','2024-06-08 15:58:03.352426'),(14,'auth','0012_alter_user_first_name_max_length','2024-06-08 15:58:03.378581'),(15,'TrainingAPIApp','0001_initial','2024-06-08 15:58:03.876684'),(16,'TrainingAPIApp','0002_semester_user','2024-06-08 15:58:05.037085'),(17,'TrainingAPIApp','0003_bulletin_statute_alter_user_user_role_comment_and_more','2024-06-08 15:58:09.878557'),(18,'TrainingAPIApp','0004_bulletin_author','2024-06-08 15:58:10.359621'),(19,'TrainingAPIApp','0005_remove_department_department_code','2024-06-08 15:58:10.624670'),(20,'TrainingAPIApp','0006_semester_is_finished','2024-06-08 15:58:10.690351'),(21,'TrainingAPIApp','0007_remove_student_full_name_student_student_code_and_more','2024-06-08 15:58:11.279341'),(22,'TrainingAPIApp','0008_remove_activity_active_remove_bulletin_active_and_more','2024-06-08 15:58:13.839573'),(23,'admin','0001_initial','2024-06-08 16:01:36.096626'),(24,'admin','0002_logentry_remove_auto_add','2024-06-08 16:01:36.134894'),(25,'admin','0003_logentry_add_action_flag_choices','2024-06-08 16:01:36.161690'),(26,'oauth2_provider','0001_initial','2024-06-08 16:01:41.363171'),(27,'oauth2_provider','0002_auto_20190406_1805','2024-06-08 16:01:41.534895'),(28,'oauth2_provider','0003_auto_20201211_1314','2024-06-08 16:01:41.794424'),(29,'oauth2_provider','0004_auto_20200902_2022','2024-06-08 16:01:43.188106'),(30,'oauth2_provider','0005_auto_20211222_2352','2024-06-08 16:01:43.336128'),(31,'oauth2_provider','0006_alter_application_client_secret','2024-06-08 16:01:43.386292'),(32,'oauth2_provider','0007_application_post_logout_redirect_uris','2024-06-08 16:01:43.595444'),(33,'oauth2_provider','0008_alter_accesstoken_token','2024-06-08 16:01:43.633383'),(34,'oauth2_provider','0009_add_hash_client_secret','2024-06-08 16:01:43.742199'),(35,'oauth2_provider','0010_application_allowed_origins','2024-06-08 16:01:44.097481'),(36,'sessions','0001_initial','2024-06-08 16:01:44.360075');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('h7it2f8dkqiv4pm4ca1dcoxwg24cyf16','.eJxVjEEOwiAQRe_C2pAZpQy4dN8zEGZAqRpISrsy3l2bdKHb_977LxXiupSw9jyHKamzQnX43TjKI9cNpHust6al1WWeWG-K3mnXY0v5edndv4MSe_nWzEmEhBm8mCMCswXMztJAjr0TjInJEKH3mRKwDOLIQ7RoAE5XUu8P-5M30A:1sFyaf:fkUcIIg6cQyZDuflWnlsLlR_uRJMRztCdGQwQLMHoFY','2024-06-22 16:06:49.613259');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_accesstoken`
--

DROP TABLE IF EXISTS `oauth2_provider_accesstoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_accesstoken` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires` datetime(6) NOT NULL,
  `scope` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `application_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `source_refresh_token_id` bigint DEFAULT NULL,
  `id_token_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`),
  UNIQUE KEY `source_refresh_token_id` (`source_refresh_token_id`),
  UNIQUE KEY `id_token_id` (`id_token_id`),
  KEY `oauth2_provider_acce_application_id_b22886e1_fk_oauth2_pr` (`application_id`),
  KEY `oauth2_provider_acce_user_id_6e4c9a65_fk_TrainingA` (`user_id`),
  CONSTRAINT `oauth2_provider_acce_application_id_b22886e1_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_acce_id_token_id_85db651b_fk_oauth2_pr` FOREIGN KEY (`id_token_id`) REFERENCES `oauth2_provider_idtoken` (`id`),
  CONSTRAINT `oauth2_provider_acce_source_refresh_token_e66fbc72_fk_oauth2_pr` FOREIGN KEY (`source_refresh_token_id`) REFERENCES `oauth2_provider_refreshtoken` (`id`),
  CONSTRAINT `oauth2_provider_acce_user_id_6e4c9a65_fk_TrainingA` FOREIGN KEY (`user_id`) REFERENCES `trainingapiapp_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_accesstoken`
--

LOCK TABLES `oauth2_provider_accesstoken` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_accesstoken` DISABLE KEYS */;
INSERT INTO `oauth2_provider_accesstoken` VALUES (1,'0cu3hfojlNMbRlcezs7BM8ndgw0dCR','2024-06-09 03:59:25.314276','read write',1,3,'2024-06-08 17:59:25.317276','2024-06-08 17:59:25.317276',NULL,NULL);
/*!40000 ALTER TABLE `oauth2_provider_accesstoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_application`
--

DROP TABLE IF EXISTS `oauth2_provider_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_application` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `client_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect_uris` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_type` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `authorization_grant_type` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_secret` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `skip_authorization` tinyint(1) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `algorithm` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_logout_redirect_uris` longtext COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT (_utf8mb3''),
  `hash_client_secret` tinyint(1) NOT NULL,
  `allowed_origins` longtext COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT (_utf8mb3''),
  PRIMARY KEY (`id`),
  UNIQUE KEY `client_id` (`client_id`),
  KEY `oauth2_provider_appl_user_id_79829054_fk_TrainingA` (`user_id`),
  KEY `oauth2_provider_application_client_secret_53133678` (`client_secret`),
  CONSTRAINT `oauth2_provider_appl_user_id_79829054_fk_TrainingA` FOREIGN KEY (`user_id`) REFERENCES `trainingapiapp_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_application`
--

LOCK TABLES `oauth2_provider_application` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_application` DISABLE KEYS */;
INSERT INTO `oauth2_provider_application` VALUES (1,'5XCs0SJURt6t4QD6dap5i5hPSNN4X8USn5B56MtS','','confidential','password','pbkdf2_sha256$720000$xoLX9ScDZ5hnHZoc5Q1XxQ$RsLD2Fodw6fZPFPrmRUrFtz8wYgDXq+Na85gjLUCK8w=','main-app',1,0,'2024-06-08 16:07:27.946308','2024-06-08 16:07:27.946308','','',1,'');
/*!40000 ALTER TABLE `oauth2_provider_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_grant`
--

DROP TABLE IF EXISTS `oauth2_provider_grant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_grant` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires` datetime(6) NOT NULL,
  `redirect_uri` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `scope` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `application_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `code_challenge` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code_challenge_method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nonce` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `claims` longtext COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT (_utf8mb3''),
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `oauth2_provider_gran_application_id_81923564_fk_oauth2_pr` (`application_id`),
  KEY `oauth2_provider_grant_user_id_e8f62af8_fk_TrainingAPIApp_user_id` (`user_id`),
  CONSTRAINT `oauth2_provider_gran_application_id_81923564_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_grant_user_id_e8f62af8_fk_TrainingAPIApp_user_id` FOREIGN KEY (`user_id`) REFERENCES `trainingapiapp_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_grant`
--

LOCK TABLES `oauth2_provider_grant` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_grant` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_provider_grant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_idtoken`
--

DROP TABLE IF EXISTS `oauth2_provider_idtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_idtoken` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `jti` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires` datetime(6) NOT NULL,
  `scope` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `application_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `jti` (`jti`),
  KEY `oauth2_provider_idto_application_id_08c5ff4f_fk_oauth2_pr` (`application_id`),
  KEY `oauth2_provider_idto_user_id_dd512b59_fk_TrainingA` (`user_id`),
  CONSTRAINT `oauth2_provider_idto_application_id_08c5ff4f_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_idto_user_id_dd512b59_fk_TrainingA` FOREIGN KEY (`user_id`) REFERENCES `trainingapiapp_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_idtoken`
--

LOCK TABLES `oauth2_provider_idtoken` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_idtoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_provider_idtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_refreshtoken`
--

DROP TABLE IF EXISTS `oauth2_provider_refreshtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_refreshtoken` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` bigint DEFAULT NULL,
  `application_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `revoked` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `access_token_id` (`access_token_id`),
  UNIQUE KEY `oauth2_provider_refreshtoken_token_revoked_af8a5134_uniq` (`token`,`revoked`),
  KEY `oauth2_provider_refr_application_id_2d1c311b_fk_oauth2_pr` (`application_id`),
  KEY `oauth2_provider_refr_user_id_da837fce_fk_TrainingA` (`user_id`),
  CONSTRAINT `oauth2_provider_refr_access_token_id_775e84e8_fk_oauth2_pr` FOREIGN KEY (`access_token_id`) REFERENCES `oauth2_provider_accesstoken` (`id`),
  CONSTRAINT `oauth2_provider_refr_application_id_2d1c311b_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_refr_user_id_da837fce_fk_TrainingA` FOREIGN KEY (`user_id`) REFERENCES `trainingapiapp_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_refreshtoken`
--

LOCK TABLES `oauth2_provider_refreshtoken` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_refreshtoken` DISABLE KEYS */;
INSERT INTO `oauth2_provider_refreshtoken` VALUES (1,'8gs19PYdwfCMj9Ps6OvBxwpUO8yAhP',1,1,3,'2024-06-08 17:59:25.412273','2024-06-08 17:59:25.412273',NULL);
/*!40000 ALTER TABLE `oauth2_provider_refreshtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainingapiapp_activity`
--

DROP TABLE IF EXISTS `trainingapiapp_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trainingapiapp_activity` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_date` date NOT NULL,
  `updated_date` date NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_register` datetime(6) NOT NULL,
  `location` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `points` smallint unsigned NOT NULL,
  `assistant_creator_id` bigint NOT NULL,
  `statute_id` bigint NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `TrainingAPIApp_activ_assistant_creator_id_2b1ee62c_fk_TrainingA` (`assistant_creator_id`),
  KEY `TrainingAPIApp_activ_statute_id_fd1b2be9_fk_TrainingA` (`statute_id`),
  CONSTRAINT `TrainingAPIApp_activ_assistant_creator_id_2b1ee62c_fk_TrainingA` FOREIGN KEY (`assistant_creator_id`) REFERENCES `trainingapiapp_user` (`id`),
  CONSTRAINT `TrainingAPIApp_activ_statute_id_fd1b2be9_fk_TrainingA` FOREIGN KEY (`statute_id`) REFERENCES `trainingapiapp_statute` (`id`),
  CONSTRAINT `trainingapiapp_activity_chk_1` CHECK ((`points` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainingapiapp_activity`
--

LOCK TABLES `trainingapiapp_activity` WRITE;
/*!40000 ALTER TABLE `trainingapiapp_activity` DISABLE KEYS */;
INSERT INTO `trainingapiapp_activity` VALUES (1,'2024-06-09','2024-06-09','Ngày hội thể thao','2024-06-10 15:00:00.000000','NB.250','description',5,3,1,1),(2,'2024-06-09','2024-06-09','Ngày hội thể thao','2024-06-10 15:00:00.000000','NB.250','description',5,3,1,1),(3,'2024-06-09','2024-06-09','Ngày hội thể thao','2024-06-10 15:00:00.000000','NB.250','description',5,3,1,1),(4,'2024-06-09','2024-06-09','Ngày hội thể thao','2024-06-10 15:00:00.000000','NB.250','description',5,3,1,1),(5,'2024-06-09','2024-06-09','Ngày hội thể thao','2024-06-10 15:00:00.000000','NB.250','description',5,3,1,1),(6,'2024-06-09','2024-06-09','Ngày hội thể thao','2024-06-10 15:00:00.000000','NB.250','description',5,3,1,1),(7,'2024-06-09','2024-06-09','Ngày hội thể thao','2024-06-10 15:00:00.000000','NB.250','description',5,3,1,1),(8,'2024-06-09','2024-06-09','Ngày hội thể thao','2024-06-10 15:00:00.000000','NB.250','description',5,3,1,1),(9,'2024-06-09','2024-06-09','Ngày hội thể thao','2024-06-10 15:00:00.000000','NB.250','description',5,3,1,1);
/*!40000 ALTER TABLE `trainingapiapp_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainingapiapp_activity_student`
--

DROP TABLE IF EXISTS `trainingapiapp_activity_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trainingapiapp_activity_student` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `activity_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `TrainingAPIApp_activity__activity_id_user_id_e0400e7a_uniq` (`activity_id`,`user_id`),
  KEY `TrainingAPIApp_activ_user_id_bc8af246_fk_TrainingA` (`user_id`),
  CONSTRAINT `TrainingAPIApp_activ_activity_id_e1372f6a_fk_TrainingA` FOREIGN KEY (`activity_id`) REFERENCES `trainingapiapp_activity` (`id`),
  CONSTRAINT `TrainingAPIApp_activ_user_id_bc8af246_fk_TrainingA` FOREIGN KEY (`user_id`) REFERENCES `trainingapiapp_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainingapiapp_activity_student`
--

LOCK TABLES `trainingapiapp_activity_student` WRITE;
/*!40000 ALTER TABLE `trainingapiapp_activity_student` DISABLE KEYS */;
/*!40000 ALTER TABLE `trainingapiapp_activity_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainingapiapp_bulletin`
--

DROP TABLE IF EXISTS `trainingapiapp_bulletin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trainingapiapp_bulletin` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_date` date NOT NULL,
  `updated_date` date NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author_id` bigint NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `TrainingAPIApp_bulle_author_id_81502938_fk_TrainingA` (`author_id`),
  CONSTRAINT `TrainingAPIApp_bulle_author_id_81502938_fk_TrainingA` FOREIGN KEY (`author_id`) REFERENCES `trainingapiapp_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainingapiapp_bulletin`
--

LOCK TABLES `trainingapiapp_bulletin` WRITE;
/*!40000 ALTER TABLE `trainingapiapp_bulletin` DISABLE KEYS */;
/*!40000 ALTER TABLE `trainingapiapp_bulletin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainingapiapp_comment`
--

DROP TABLE IF EXISTS `trainingapiapp_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trainingapiapp_comment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_date` date NOT NULL,
  `updated_date` date NOT NULL,
  `content` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bulletin_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `TrainingAPIApp_comme_bulletin_id_2f95289d_fk_TrainingA` (`bulletin_id`),
  KEY `TrainingAPIApp_comme_user_id_2dcae11a_fk_TrainingA` (`user_id`),
  CONSTRAINT `TrainingAPIApp_comme_bulletin_id_2f95289d_fk_TrainingA` FOREIGN KEY (`bulletin_id`) REFERENCES `trainingapiapp_bulletin` (`id`),
  CONSTRAINT `TrainingAPIApp_comme_user_id_2dcae11a_fk_TrainingA` FOREIGN KEY (`user_id`) REFERENCES `trainingapiapp_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainingapiapp_comment`
--

LOCK TABLES `trainingapiapp_comment` WRITE;
/*!40000 ALTER TABLE `trainingapiapp_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `trainingapiapp_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainingapiapp_department`
--

DROP TABLE IF EXISTS `trainingapiapp_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trainingapiapp_department` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_date` date NOT NULL,
  `updated_date` date NOT NULL,
  `department_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainingapiapp_department`
--

LOCK TABLES `trainingapiapp_department` WRITE;
/*!40000 ALTER TABLE `trainingapiapp_department` DISABLE KEYS */;
INSERT INTO `trainingapiapp_department` VALUES (1,'2024-06-08','2024-06-08','Công nghệ thông tin',1),(2,'2024-06-08','2024-06-08','Kinh tế và quản lý công',1),(3,'2024-06-08','2024-06-08','Tài chính - Ngân hàng',1),(4,'2024-06-08','2024-06-08','Đào tạo đặc biệt',1),(5,'2024-06-08','2024-06-08','Kế toán - kiểm toán',1),(6,'2024-06-08','2024-06-08','Xây dựng',1);
/*!40000 ALTER TABLE `trainingapiapp_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainingapiapp_klass`
--

DROP TABLE IF EXISTS `trainingapiapp_klass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trainingapiapp_klass` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_date` date NOT NULL,
  `updated_date` date NOT NULL,
  `klass_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `department_id` bigint NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `TrainingAPIApp_klass_department_id_38698e4f_fk_TrainingA` (`department_id`),
  CONSTRAINT `TrainingAPIApp_klass_department_id_38698e4f_fk_TrainingA` FOREIGN KEY (`department_id`) REFERENCES `trainingapiapp_department` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainingapiapp_klass`
--

LOCK TABLES `trainingapiapp_klass` WRITE;
/*!40000 ALTER TABLE `trainingapiapp_klass` DISABLE KEYS */;
INSERT INTO `trainingapiapp_klass` VALUES (1,'2024-06-08','2024-06-08','IT01',1,1),(2,'2024-06-08','2024-06-08','IT02',1,1),(3,'2024-06-08','2024-06-08','EC01',2,1),(4,'2024-06-08','2024-06-08','EC02',2,1),(5,'2024-06-08','2024-06-08','FB01',3,1),(6,'2024-06-08','2024-06-08','FB02',3,1),(7,'2024-06-08','2024-06-08','SE01',4,1),(8,'2024-06-08','2024-06-08','SE02',4,1),(9,'2024-06-08','2024-06-08','BA01',5,1),(10,'2024-06-08','2024-06-08','BA02',5,1),(11,'2024-06-08','2024-06-08','BT01',6,1),(12,'2024-06-08','2024-06-08','BT02',6,1);
/*!40000 ALTER TABLE `trainingapiapp_klass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainingapiapp_like`
--

DROP TABLE IF EXISTS `trainingapiapp_like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trainingapiapp_like` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_date` date NOT NULL,
  `updated_date` date NOT NULL,
  `bulletin_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `TrainingAPIApp_like_user_id_bulletin_id_eddc2328_uniq` (`user_id`,`bulletin_id`),
  KEY `TrainingAPIApp_like_bulletin_id_c86027e0_fk_TrainingA` (`bulletin_id`),
  CONSTRAINT `TrainingAPIApp_like_bulletin_id_c86027e0_fk_TrainingA` FOREIGN KEY (`bulletin_id`) REFERENCES `trainingapiapp_bulletin` (`id`),
  CONSTRAINT `TrainingAPIApp_like_user_id_8aec4cd9_fk_TrainingAPIApp_user_id` FOREIGN KEY (`user_id`) REFERENCES `trainingapiapp_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainingapiapp_like`
--

LOCK TABLES `trainingapiapp_like` WRITE;
/*!40000 ALTER TABLE `trainingapiapp_like` DISABLE KEYS */;
/*!40000 ALTER TABLE `trainingapiapp_like` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainingapiapp_missingactivityreport`
--

DROP TABLE IF EXISTS `trainingapiapp_missingactivityreport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trainingapiapp_missingactivityreport` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_date` date NOT NULL,
  `updated_date` date NOT NULL,
  `reason` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `proof` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `student_activity_id` bigint NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `TrainingAPIApp_missi_student_activity_id_4c775345_fk_TrainingA` (`student_activity_id`),
  CONSTRAINT `TrainingAPIApp_missi_student_activity_id_4c775345_fk_TrainingA` FOREIGN KEY (`student_activity_id`) REFERENCES `trainingapiapp_studentactivity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainingapiapp_missingactivityreport`
--

LOCK TABLES `trainingapiapp_missingactivityreport` WRITE;
/*!40000 ALTER TABLE `trainingapiapp_missingactivityreport` DISABLE KEYS */;
/*!40000 ALTER TABLE `trainingapiapp_missingactivityreport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainingapiapp_semester`
--

DROP TABLE IF EXISTS `trainingapiapp_semester`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trainingapiapp_semester` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_date` date NOT NULL,
  `updated_date` date NOT NULL,
  `semester_name` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_finished` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `semester_name` (`semester_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainingapiapp_semester`
--

LOCK TABLES `trainingapiapp_semester` WRITE;
/*!40000 ALTER TABLE `trainingapiapp_semester` DISABLE KEYS */;
INSERT INTO `trainingapiapp_semester` VALUES (1,'2024-06-08','2024-06-08','HK1-2024','Học kì 1 - năm 2024',1,1),(2,'2024-06-08','2024-06-08','HK2-2024','Học kì 2 - năm 2024',0,1);
/*!40000 ALTER TABLE `trainingapiapp_semester` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainingapiapp_statute`
--

DROP TABLE IF EXISTS `trainingapiapp_statute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trainingapiapp_statute` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_date` date NOT NULL,
  `updated_date` date NOT NULL,
  `statute_name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `max_point` smallint unsigned NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `trainingapiapp_statute_chk_1` CHECK ((`max_point` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainingapiapp_statute`
--

LOCK TABLES `trainingapiapp_statute` WRITE;
/*!40000 ALTER TABLE `trainingapiapp_statute` DISABLE KEYS */;
INSERT INTO `trainingapiapp_statute` VALUES (1,'2024-06-08','2024-06-08','Điều 1',25,'Điều 1',1),(2,'2024-06-08','2024-06-08','Điều 2',25,'Điều 2',1),(3,'2024-06-08','2024-06-08','Điều 3',15,'Điều 3',1),(4,'2024-06-08','2024-06-08','Điều 4',20,'Điều 4',1),(5,'2024-06-08','2024-06-08','Điều 5',25,'Điều 5',1);
/*!40000 ALTER TABLE `trainingapiapp_statute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainingapiapp_student`
--

DROP TABLE IF EXISTS `trainingapiapp_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trainingapiapp_student` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `student_class_id` bigint NOT NULL,
  `student_department_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `student_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  UNIQUE KEY `student_code` (`student_code`),
  KEY `TrainingAPIApp_stude_student_class_id_18e5a812_fk_TrainingA` (`student_class_id`),
  KEY `TrainingAPIApp_stude_student_department_i_fb9edfb1_fk_TrainingA` (`student_department_id`),
  CONSTRAINT `TrainingAPIApp_stude_student_class_id_18e5a812_fk_TrainingA` FOREIGN KEY (`student_class_id`) REFERENCES `trainingapiapp_klass` (`id`),
  CONSTRAINT `TrainingAPIApp_stude_student_department_i_fb9edfb1_fk_TrainingA` FOREIGN KEY (`student_department_id`) REFERENCES `trainingapiapp_department` (`id`),
  CONSTRAINT `TrainingAPIApp_stude_user_id_091885d5_fk_TrainingA` FOREIGN KEY (`user_id`) REFERENCES `trainingapiapp_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainingapiapp_student`
--

LOCK TABLES `trainingapiapp_student` WRITE;
/*!40000 ALTER TABLE `trainingapiapp_student` DISABLE KEYS */;
/*!40000 ALTER TABLE `trainingapiapp_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainingapiapp_studentactivity`
--

DROP TABLE IF EXISTS `trainingapiapp_studentactivity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trainingapiapp_studentactivity` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_date` date NOT NULL,
  `updated_date` date NOT NULL,
  `status` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `activity_id` bigint NOT NULL,
  `semester_id` bigint NOT NULL,
  `student_id` bigint NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `TrainingAPIApp_stude_activity_id_9261693b_fk_TrainingA` (`activity_id`),
  KEY `TrainingAPIApp_stude_semester_id_c7375a4e_fk_TrainingA` (`semester_id`),
  KEY `TrainingAPIApp_stude_student_id_41c33070_fk_TrainingA` (`student_id`),
  CONSTRAINT `TrainingAPIApp_stude_activity_id_9261693b_fk_TrainingA` FOREIGN KEY (`activity_id`) REFERENCES `trainingapiapp_activity` (`id`),
  CONSTRAINT `TrainingAPIApp_stude_semester_id_c7375a4e_fk_TrainingA` FOREIGN KEY (`semester_id`) REFERENCES `trainingapiapp_semester` (`id`),
  CONSTRAINT `TrainingAPIApp_stude_student_id_41c33070_fk_TrainingA` FOREIGN KEY (`student_id`) REFERENCES `trainingapiapp_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainingapiapp_studentactivity`
--

LOCK TABLES `trainingapiapp_studentactivity` WRITE;
/*!40000 ALTER TABLE `trainingapiapp_studentactivity` DISABLE KEYS */;
INSERT INTO `trainingapiapp_studentactivity` VALUES (1,'2024-06-09','2024-06-09','registered',9,2,3,1);
/*!40000 ALTER TABLE `trainingapiapp_studentactivity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainingapiapp_user`
--

DROP TABLE IF EXISTS `trainingapiapp_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trainingapiapp_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_role` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainingapiapp_user`
--

LOCK TABLES `trainingapiapp_user` WRITE;
/*!40000 ALTER TABLE `trainingapiapp_user` DISABLE KEYS */;
INSERT INTO `trainingapiapp_user` VALUES (1,'pbkdf2_sha256$720000$lBmlEwN5ChwQRsxcbxZOjF$9RC/VYT15G09eKXFUbL8aRmdIKJhdYPGR4CQ2c4sow8=','2024-06-08 16:06:49.580060',1,1,1,'2024-06-08 16:06:17.669304','superuser@ou.edu.vn',NULL,'ADMIN','',''),(3,'pbkdf2_sha256$720000$8y5B7H5eXSSjwkhCYRY8nY$qSraz/O9XCHMHylaGba+kMYT4RGqlxI5h6PGxbB3FlI=',NULL,0,0,1,'2024-06-08 17:34:08.002052','specialist1@ou.edu.vn','image/upload/v1717868068/ci4tweuo0citrtdetnka.jpg','CV','',''),(4,'pbkdf2_sha256$720000$yFWal5ILcwejKG5f8oC5sw$Kjx9muX/ZWmizCyN3uDpZhfxvI4Y4jWuV5CKi8JTBu4=',NULL,0,0,1,'2024-06-08 17:34:26.118033','assistant1@ou.edu.vn','image/upload/v1717868086/msgoaiqrm82jj2mdhkip.jpg','TLSV','',''),(5,'pbkdf2_sha256$720000$5BIkCFcrPQeSgnQ0IqH9Am$Ye+dyArVBlHQ9w/bf6kVY5KwbRuk4nh5jMF1KGC6X4o=',NULL,0,0,1,'2024-06-08 17:34:32.704652','assistant2@ou.edu.vn','image/upload/v1717868093/vor2jlvgp4f77hkj2xko.jpg','TLSV','',''),(6,'pbkdf2_sha256$720000$MGvWG4STSDuGLcljzVLQHi$+K0OAOi+oTrZpF+Ur9n1fnGwsAlxuWerdr2QBl91YzI=',NULL,0,0,1,'2024-06-08 17:34:45.783248','student1@ou.edu.vn','image/upload/v1717868106/iskgzwslrgmpcmgzuigm.jpg','SV','',''),(7,'pbkdf2_sha256$720000$zsixUabcCOTZIG2Ase8Zb1$u7YyEenn6xOlFBTC2omafrg8lomKV8YhLcBPQvoaFXg=',NULL,0,0,1,'2024-06-08 17:34:51.419686','student2@ou.edu.vn','image/upload/v1717868111/s9pfd7t6mnavh3auyxw6.jpg','SV','','');
/*!40000 ALTER TABLE `trainingapiapp_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainingapiapp_user_groups`
--

DROP TABLE IF EXISTS `trainingapiapp_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trainingapiapp_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `TrainingAPIApp_user_groups_user_id_group_id_cdf9edca_uniq` (`user_id`,`group_id`),
  KEY `TrainingAPIApp_user_groups_group_id_d250b708_fk_auth_group_id` (`group_id`),
  CONSTRAINT `TrainingAPIApp_user__user_id_444e7f7a_fk_TrainingA` FOREIGN KEY (`user_id`) REFERENCES `trainingapiapp_user` (`id`),
  CONSTRAINT `TrainingAPIApp_user_groups_group_id_d250b708_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainingapiapp_user_groups`
--

LOCK TABLES `trainingapiapp_user_groups` WRITE;
/*!40000 ALTER TABLE `trainingapiapp_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `trainingapiapp_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainingapiapp_user_user_permissions`
--

DROP TABLE IF EXISTS `trainingapiapp_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trainingapiapp_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `TrainingAPIApp_user_user_user_id_permission_id_7973a843_uniq` (`user_id`,`permission_id`),
  KEY `TrainingAPIApp_user__permission_id_29b8c9a6_fk_auth_perm` (`permission_id`),
  CONSTRAINT `TrainingAPIApp_user__permission_id_29b8c9a6_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `TrainingAPIApp_user__user_id_6226858f_fk_TrainingA` FOREIGN KEY (`user_id`) REFERENCES `trainingapiapp_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainingapiapp_user_user_permissions`
--

LOCK TABLES `trainingapiapp_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `trainingapiapp_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `trainingapiapp_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-09  1:48:33
