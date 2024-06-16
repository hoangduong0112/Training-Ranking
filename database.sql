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
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2024-06-13 15:41:59.961872','1','Công nghệ thông tin',1,'[{\"added\": {}}]',7,1),(2,'2024-06-13 15:42:01.604091','2','Kinh tế và quản lý công',1,'[{\"added\": {}}]',7,1),(3,'2024-06-13 15:42:03.149992','3','Tài chính - Ngân hàng',1,'[{\"added\": {}}]',7,1),(4,'2024-06-13 15:42:04.859991','4','Đào tạo đặc biệt',1,'[{\"added\": {}}]',7,1),(5,'2024-06-13 15:42:07.115734','5','Kế toán - kiểm toán',1,'[{\"added\": {}}]',7,1),(6,'2024-06-13 15:42:08.817925','6','Xây dựng',1,'[{\"added\": {}}]',7,1),(7,'2024-06-13 15:42:13.847534','1','IT01',1,'[{\"added\": {}}]',10,1),(8,'2024-06-13 15:42:16.500177','2','IT02',1,'[{\"added\": {}}]',10,1),(9,'2024-06-13 15:45:18.496953','3','EC01',1,'[{\"added\": {}}]',10,1),(10,'2024-06-13 15:45:21.309360','4','EC02',1,'[{\"added\": {}}]',10,1),(11,'2024-06-13 15:45:24.566600','5','FB01',1,'[{\"added\": {}}]',10,1),(12,'2024-06-13 15:45:28.183137','6','FB02',1,'[{\"added\": {}}]',10,1),(13,'2024-06-13 15:50:06.684703','7','RM01',1,'[{\"added\": {}}]',10,1),(14,'2024-06-13 15:50:11.072407','8','RM02',1,'[{\"added\": {}}]',10,1),(15,'2024-06-13 15:50:20.448316','9','SE01',1,'[{\"added\": {}}]',10,1),(16,'2024-06-13 15:50:25.167325','10','SE02',1,'[{\"added\": {}}]',10,1),(17,'2024-06-13 15:50:33.295273','11','BA01',1,'[{\"added\": {}}]',10,1),(18,'2024-06-13 15:50:39.350545','12','BA02',1,'[{\"added\": {}}]',10,1),(19,'2024-06-13 16:35:37.444928','1','Điều 1',1,'[{\"added\": {}}]',9,1),(20,'2024-06-13 16:35:47.861915','2','Điều 2',1,'[{\"added\": {}}]',9,1),(21,'2024-06-13 16:35:59.467024','3','Điều 3',1,'[{\"added\": {}}]',9,1),(22,'2024-06-13 16:38:02.855408','4','Điều 4',1,'[{\"added\": {}}]',9,1),(23,'2024-06-13 16:38:11.030957','5','Điều 5',1,'[{\"added\": {}}]',9,1),(24,'2024-06-13 16:51:33.491067','2','CUỘC THI HỌC THUẬT \"LUẬT SƯ TÀI NĂNG 2022\"',1,'[{\"added\": {}}]',11,1),(25,'2024-06-13 16:51:33.492072','1','CUỘC THI HỌC THUẬT \"LUẬT SƯ TÀI NĂNG 2022\"',1,'[{\"added\": {}}]',11,1),(26,'2024-06-13 16:51:58.233144','2','CUỘC THI HỌC THUẬT \"LUẬT SƯ TÀI NĂNG 2024\"',2,'[{\"changed\": {\"fields\": [\"Title\", \"Description\"]}}]',11,1),(27,'2024-06-13 16:54:40.276460','1','CUỘC THI TRỰC TUYẾN \"OU TUYÊN TRUYỀN MỤC TIÊU PHÁT TRIỂN BỀN VỮNG\"',2,'[{\"changed\": {\"fields\": [\"Title\", \"Description\"]}}]',11,1),(28,'2024-06-13 16:55:21.977656','1','CUỘC THI LUẬT AN NINH MẠNG VÀ BỘ QUY TẮC ỨNG XỬ TRÊN MẠNG XÃ HỘI NĂM 2024',2,'[{\"changed\": {\"fields\": [\"Title\", \"Date register\", \"Description\", \"Points\", \"Statute\"]}}]',11,1),(29,'2024-06-13 16:55:56.027356','3','Khóa tập huấn trợ giảng Khoa Đào tạo đặc biệt',1,'[{\"added\": {}}]',11,1),(30,'2024-06-13 16:56:18.041791','4','TẬP HUẤN NCKH CHỦ ĐỀ \"PHƯƠNG PHÁP NGHIÊN CỨU KHOA HỌC\"',1,'[{\"added\": {}}]',11,1),(31,'2024-06-13 16:56:40.313975','5','Sinh hoạt Câu lạc bộ A&A',1,'[{\"added\": {}}]',11,1),(32,'2024-06-13 16:57:24.545430','6','Khảo sát đánh giá thực trạng việc học ngoại ngữ trong sinh viên',1,'[{\"added\": {}}]',11,1),(33,'2024-06-13 16:57:54.544337','7','Khóa học bổi dưỡng Archicad do công ty Giải pháp Rồng Xanh tổ chức',1,'[{\"added\": {}}]',11,1),(34,'2024-06-13 17:04:43.222137','8','Cuộc thi Giảng Đường Pháp Luật',1,'[{\"added\": {}}]',11,1),(35,'2024-06-13 17:05:06.897087','9','CUỘC THI HÙNG BIỆN TIẾNG NHẬT',1,'[{\"added\": {}}]',11,1),(36,'2024-06-13 17:05:47.674393','10','Hội thảo Xây dựng thương hiệu cá nhân',1,'[{\"added\": {}}]',11,1),(37,'2024-06-13 17:15:35.090391','11','Sinh hoạt CLB Live',1,'[{\"added\": {}}]',11,1),(38,'2024-06-13 17:16:01.206570','12','Sinh hoạt CLB Lập trình trên thiết bị di động',1,'[{\"added\": {}}]',11,1),(39,'2024-06-13 17:16:37.024762','13','Hội thảo kỹ năng “Hành trang Gen Z”',1,'[{\"added\": {}}]',11,1),(40,'2024-06-13 17:17:36.725189','1','CUỘC THI LUẬT AN NINH MẠNG VÀ BỘ QUY TẮC ỨNG XỬ TRÊN MẠNG XÃ HỘI NĂM 2024',1,'[{\"added\": {}}]',6,1),(41,'2024-06-13 17:18:10.767915','2','CUỘC THI HỌC THUẬT \"LUẬT SƯ TÀI NĂNG 2024\"',1,'[{\"added\": {}}]',6,1),(42,'2024-06-13 17:21:04.352747','3','Khóa tập huấn trợ giảng Khoa Đào tạo đặc biệt',1,'[{\"added\": {}}]',6,1),(43,'2024-06-13 17:24:48.719978','4','TẬP HUẤN NCKH CHỦ ĐỀ \"PHƯƠNG PHÁP NGHIÊN CỨU KHOA HỌC\"',1,'[{\"added\": {}}]',6,1),(44,'2024-06-13 17:25:13.009594','5','Sinh hoạt Câu lạc bộ A&A',1,'[{\"added\": {}}]',6,1),(45,'2024-06-13 17:25:38.493502','6','Khảo sát đánh giá thực trạng việc học ngoại ngữ trong sinh viên',1,'[{\"added\": {}}]',6,1),(46,'2024-06-13 17:26:18.218385','7','Khóa học bổi dưỡng Archicad do công ty Giải pháp Rồng Xanh tổ chức',1,'[{\"added\": {}}]',6,1),(47,'2024-06-13 17:52:11.682400','2','20000',1,'[{\"added\": {}}]',15,1),(48,'2024-06-13 17:52:24.113227','3','20001',1,'[{\"added\": {}}]',15,1),(49,'2024-06-13 17:57:49.991660','4','20002',1,'[{\"added\": {}}]',15,1),(50,'2024-06-13 17:58:09.927877','5','20003',1,'[{\"added\": {}}]',15,1),(51,'2024-06-13 17:58:22.045311','6','20004',1,'[{\"added\": {}}]',15,1),(52,'2024-06-13 17:58:38.747134','7','20005',1,'[{\"added\": {}}]',15,1),(53,'2024-06-13 18:06:18.300132','8','20006',1,'[{\"added\": {}}]',15,1),(54,'2024-06-13 18:06:55.206570','9','20007',1,'[{\"added\": {}}]',15,1),(55,'2024-06-13 18:07:18.218345','10','20008',1,'[{\"added\": {}}]',15,1),(56,'2024-06-13 18:08:32.497930','12','20009',1,'[{\"added\": {}}]',15,1),(57,'2024-06-13 18:09:03.079126','13','20010',1,'[{\"added\": {}}]',15,1),(58,'2024-06-13 18:09:20.667591','14','20011',1,'[{\"added\": {}}]',15,1),(59,'2024-06-13 18:09:35.441993','1','HK1-2024',1,'[{\"added\": {}}]',8,1),(60,'2024-06-13 18:09:41.594319','2','HK2-2024',1,'[{\"added\": {}}]',8,1),(61,'2024-06-13 18:10:19.089708','1','StudentActivity object (1)',1,'[{\"added\": {}}]',12,1),(62,'2024-06-13 18:10:34.110579','2','StudentActivity object (2)',1,'[{\"added\": {}}]',12,1),(63,'2024-06-13 18:10:44.590008','3','StudentActivity object (3)',1,'[{\"added\": {}}]',12,1),(64,'2024-06-13 18:18:18.501320','4','StudentActivity object (4)',1,'[{\"added\": {}}]',12,1),(65,'2024-06-13 18:18:25.827090','5','StudentActivity object (5)',1,'[{\"added\": {}}]',12,1),(66,'2024-06-13 18:18:38.830845','6','StudentActivity object (6)',1,'[{\"added\": {}}]',12,1),(67,'2024-06-13 18:18:47.678134','7','StudentActivity object (7)',1,'[{\"added\": {}}]',12,1),(68,'2024-06-13 18:18:55.018120','8','StudentActivity object (8)',1,'[{\"added\": {}}]',12,1),(69,'2024-06-13 18:29:24.625509','9','StudentActivity object (9)',1,'[{\"added\": {}}]',12,1),(70,'2024-06-13 18:29:30.594082','10','StudentActivity object (10)',1,'[{\"added\": {}}]',12,1),(71,'2024-06-13 18:29:41.268166','11','StudentActivity object (11)',1,'[{\"added\": {}}]',12,1),(72,'2024-06-13 18:30:26.922924','12','StudentActivity object (12)',1,'[{\"added\": {}}]',12,1),(73,'2024-06-13 18:30:33.687361','13','StudentActivity object (13)',1,'[{\"added\": {}}]',12,1),(74,'2024-06-13 18:30:40.848874','14','StudentActivity object (14)',1,'[{\"added\": {}}]',12,1),(75,'2024-06-13 18:30:46.987046','15','StudentActivity object (15)',1,'[{\"added\": {}}]',12,1),(76,'2024-06-13 18:32:26.784398','16','StudentActivity object (16)',1,'[{\"added\": {}}]',12,1),(77,'2024-06-13 18:32:34.352926','17','StudentActivity object (17)',1,'[{\"added\": {}}]',12,1),(78,'2024-06-13 18:32:34.424927','18','StudentActivity object (18)',1,'[{\"added\": {}}]',12,1),(79,'2024-06-13 18:32:40.700034','19','StudentActivity object (19)',1,'[{\"added\": {}}]',12,1),(80,'2024-06-13 18:32:51.499466','20','StudentActivity object (20)',1,'[{\"added\": {}}]',12,1),(81,'2024-06-13 18:33:03.782307','21','StudentActivity object (21)',1,'[{\"added\": {}}]',12,1),(82,'2024-06-13 18:33:13.412593','22','StudentActivity object (22)',1,'[{\"added\": {}}]',12,1),(83,'2024-06-13 18:33:16.529404','23','StudentActivity object (23)',1,'[{\"added\": {}}]',12,1),(84,'2024-06-13 18:33:21.962594','24','StudentActivity object (24)',1,'[{\"added\": {}}]',12,1),(85,'2024-06-13 18:33:30.321815','25','StudentActivity object (25)',1,'[{\"added\": {}}]',12,1),(86,'2024-06-13 18:33:39.643764','26','StudentActivity object (26)',1,'[{\"added\": {}}]',12,1),(87,'2024-06-13 18:33:45.386093','27','StudentActivity object (27)',1,'[{\"added\": {}}]',12,1),(88,'2024-06-13 18:33:51.406884','28','StudentActivity object (28)',1,'[{\"added\": {}}]',12,1),(89,'2024-06-13 18:34:01.367524','29','StudentActivity object (29)',1,'[{\"added\": {}}]',12,1),(90,'2024-06-13 18:34:11.220482','30','StudentActivity object (30)',1,'[{\"added\": {}}]',12,1),(91,'2024-06-13 18:34:17.104711','31','StudentActivity object (31)',1,'[{\"added\": {}}]',12,1),(92,'2024-06-13 18:34:23.128760','32','StudentActivity object (32)',1,'[{\"added\": {}}]',12,1),(93,'2024-06-13 18:34:29.588025','33','StudentActivity object (33)',1,'[{\"added\": {}}]',12,1),(94,'2024-06-13 18:34:35.547343','34','StudentActivity object (34)',1,'[{\"added\": {}}]',12,1),(95,'2024-06-13 18:34:38.514683','35','StudentActivity object (35)',1,'[{\"added\": {}}]',12,1),(96,'2024-06-13 18:34:46.352487','36','StudentActivity object (36)',1,'[{\"added\": {}}]',12,1),(97,'2024-06-13 18:36:23.120784','37','StudentActivity object (37)',1,'[{\"added\": {}}]',12,1),(98,'2024-06-13 18:36:29.115866','38','StudentActivity object (38)',1,'[{\"added\": {}}]',12,1),(99,'2024-06-13 18:36:33.749405','39','StudentActivity object (39)',1,'[{\"added\": {}}]',12,1),(100,'2024-06-13 18:36:39.483547','40','StudentActivity object (40)',1,'[{\"added\": {}}]',12,1),(101,'2024-06-13 18:36:48.222576','41','StudentActivity object (41)',1,'[{\"added\": {}}]',12,1),(102,'2024-06-13 18:36:54.987369','42','StudentActivity object (42)',1,'[{\"added\": {}}]',12,1),(103,'2024-06-13 18:37:00.219446','43','StudentActivity object (43)',1,'[{\"added\": {}}]',12,1),(104,'2024-06-13 18:37:04.689611','44','StudentActivity object (44)',1,'[{\"added\": {}}]',12,1),(105,'2024-06-13 18:37:04.775608','45','StudentActivity object (45)',1,'[{\"added\": {}}]',12,1),(106,'2024-06-14 16:22:38.752735','1','Comment object (1)',1,'[{\"added\": {}}]',16,1),(107,'2024-06-14 17:37:47.555640','13','Hội thảo kỹ năng “Hành trang Gen Z”',2,'[{\"changed\": {\"fields\": [\"Points\"]}}]',11,1),(108,'2024-06-14 17:37:52.494305','12','Sinh hoạt CLB Lập trình trên thiết bị di động',2,'[{\"changed\": {\"fields\": [\"Points\"]}}]',11,1),(109,'2024-06-14 17:37:56.134695','11','Sinh hoạt CLB Live',2,'[{\"changed\": {\"fields\": [\"Points\"]}}]',11,1),(110,'2024-06-14 17:38:00.941881','10','Hội thảo Xây dựng thương hiệu cá nhân',2,'[]',11,1),(111,'2024-06-14 17:38:04.997980','5','Sinh hoạt Câu lạc bộ A&A',2,'[{\"changed\": {\"fields\": [\"Points\"]}}]',11,1),(112,'2024-06-14 17:38:09.078848','8','Cuộc thi Giảng Đường Pháp Luật',2,'[{\"changed\": {\"fields\": [\"Points\"]}}]',11,1),(113,'2024-06-14 17:38:13.867563','4','TẬP HUẤN NCKH CHỦ ĐỀ \"PHƯƠNG PHÁP NGHIÊN CỨU KHOA HỌC\"',2,'[]',11,1),(114,'2024-06-14 22:07:42.512726','46','StudentActivity object (46)',1,'[{\"added\": {}}]',12,1),(115,'2024-06-14 22:09:07.227458','47','StudentActivity object (47)',1,'[{\"added\": {}}]',12,1),(116,'2024-06-15 09:30:13.928320','48','StudentActivity object (48)',1,'[{\"added\": {}}]',12,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-06-13 15:38:28.668452'),(2,'contenttypes','0002_remove_content_type_name','2024-06-13 15:38:28.837157'),(3,'auth','0001_initial','2024-06-13 15:38:31.401453'),(4,'auth','0002_alter_permission_name_max_length','2024-06-13 15:38:31.910768'),(5,'auth','0003_alter_user_email_max_length','2024-06-13 15:38:31.931766'),(6,'auth','0004_alter_user_username_opts','2024-06-13 15:38:31.946879'),(7,'auth','0005_alter_user_last_login_null','2024-06-13 15:38:31.989877'),(8,'auth','0006_require_contenttypes_0002','2024-06-13 15:38:31.998875'),(9,'auth','0007_alter_validators_add_error_messages','2024-06-13 15:38:32.022881'),(10,'auth','0008_alter_user_username_max_length','2024-06-13 15:38:32.035876'),(11,'auth','0009_alter_user_last_name_max_length','2024-06-13 15:38:32.055906'),(12,'auth','0010_alter_group_name_max_length','2024-06-13 15:38:32.095876'),(13,'auth','0011_update_proxy_permissions','2024-06-13 15:38:32.112876'),(14,'auth','0012_alter_user_first_name_max_length','2024-06-13 15:38:32.138906'),(15,'TrainingAPIApp','0001_initial','2024-06-13 15:38:37.116156'),(16,'TrainingAPIApp','0002_bulletin_activity','2024-06-13 15:38:37.358949'),(17,'admin','0001_initial','2024-06-13 15:38:37.776123'),(18,'admin','0002_logentry_remove_auto_add','2024-06-13 15:38:37.802356'),(19,'admin','0003_logentry_add_action_flag_choices','2024-06-13 15:38:37.837902'),(20,'oauth2_provider','0001_initial','2024-06-13 15:38:40.804552'),(21,'oauth2_provider','0002_auto_20190406_1805','2024-06-13 15:38:41.023268'),(22,'oauth2_provider','0003_auto_20201211_1314','2024-06-13 15:38:41.251393'),(23,'oauth2_provider','0004_auto_20200902_2022','2024-06-13 15:38:42.476555'),(24,'oauth2_provider','0005_auto_20211222_2352','2024-06-13 15:38:42.607015'),(25,'oauth2_provider','0006_alter_application_client_secret','2024-06-13 15:38:42.673016'),(26,'oauth2_provider','0007_application_post_logout_redirect_uris','2024-06-13 15:38:42.880627'),(27,'oauth2_provider','0008_alter_accesstoken_token','2024-06-13 15:38:42.913768'),(28,'oauth2_provider','0009_add_hash_client_secret','2024-06-13 15:38:43.088003'),(29,'oauth2_provider','0010_application_allowed_origins','2024-06-13 15:38:43.543853'),(30,'sessions','0001_initial','2024-06-13 15:38:43.677460');
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
INSERT INTO `django_session` VALUES ('y4ae95io354djpdforo8hfdrs7w20kx6','.eJxVjMsOwiAQRf-FtSFAoR1cuvcbyDAz2KqBpI-V8d-1SRe6veec-1IJt3VM2yJzmlidlVWn3y0jPaTugO9Yb01Tq-s8Zb0r-qCLvjaW5-Vw_w5GXMZvjRSoAxg8uszZUU_kjRgDFHzsio-C0jsfoYM4cGELPgBDHwSh2FLU-wPsmTgi:1sI9EV:p8m5nQ2-emk4kaGeXCrIIE7QOpXZHT_GWpd7tlCGMKA','2024-06-28 15:52:55.348126');
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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_accesstoken`
--

LOCK TABLES `oauth2_provider_accesstoken` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_accesstoken` DISABLE KEYS */;
INSERT INTO `oauth2_provider_accesstoken` VALUES (1,'Jp0jXwoWHMF8739RFkSz9lr11fXVaF','2024-06-16 02:20:46.353626','read write',3,1,'2024-06-15 16:20:46.354627','2024-06-15 16:20:46.354627',NULL,NULL),(2,'a6ujvrJnDs6ysk3dVQTNFjMmIF2m8W','2024-06-16 02:21:25.421497','read write',3,2,'2024-06-15 16:21:25.421497','2024-06-15 16:21:25.421497',NULL,NULL),(3,'ek2LRO2dvQqPMX6TSLQJ7iddLLw0YL','2024-06-16 02:26:34.043932','read write',3,5,'2024-06-15 16:26:34.044935','2024-06-15 16:26:34.044935',NULL,NULL),(4,'GvGMc7kgEsjJYN7RQvqcZ87CRzSY4z','2024-06-16 02:26:45.911388','read write',3,9,'2024-06-15 16:26:45.912390','2024-06-15 16:26:45.912390',NULL,NULL),(5,'JbPZlHmHfUBmFPhKM1WdCic5j1s9w9','2024-06-16 02:32:18.115134','read write',3,2,'2024-06-15 16:32:18.116133','2024-06-15 16:32:18.116133',NULL,NULL),(6,'Zcx7loAZXq0qVpjEbwvPUCI2bjfiZB','2024-06-16 03:19:47.402697','read write',3,17,'2024-06-15 17:19:47.403698','2024-06-15 17:19:47.403698',NULL,NULL),(7,'6oukoas8OpXXe7lTBLwaRvgFAfxquE','2024-06-16 06:40:54.348186','read write',3,8,'2024-06-15 20:40:54.350182','2024-06-15 20:40:54.350182',NULL,NULL),(8,'NV940kBNb3wZwsueS2RdE7PxkpedX6','2024-06-16 06:42:12.209716','read write',3,8,'2024-06-15 20:42:12.209716','2024-06-15 20:42:12.209716',NULL,NULL),(9,'JIYGNvT3GChkeU2i08QAinGQgVBjxr','2024-06-16 18:45:13.617481','read write',3,8,'2024-06-16 08:45:13.620481','2024-06-16 08:45:13.620481',NULL,NULL),(10,'5Jn5hfui4MHWgS4SFmJJIeOk1MlMqA','2024-06-16 19:39:08.224478','read write',3,8,'2024-06-16 09:39:08.250811','2024-06-16 09:39:08.250811',NULL,NULL),(11,'mKm6js4ov1sqf0URxZRjFDXh1NuDqj','2024-06-16 19:50:19.783481','read write',3,8,'2024-06-16 09:50:19.784483','2024-06-16 09:50:19.784483',NULL,NULL),(12,'e0Wd9IcvbdCmSCJLARLFd2hXcLKOYa','2024-06-16 20:09:28.604905','read write',3,8,'2024-06-16 10:09:28.605908','2024-06-16 10:09:28.605908',NULL,NULL),(13,'brJl8OVIqZQNwnDJ614Lmq7tdtNHcQ','2024-06-16 20:32:16.621052','read write',3,8,'2024-06-16 10:32:16.621052','2024-06-16 10:32:16.621052',NULL,NULL),(14,'xZ5yQs0Rm7X4VfU0nFRuyy7lVzLWJ1','2024-06-16 23:24:15.871063','read write',3,8,'2024-06-16 13:24:15.871063','2024-06-16 13:24:15.871063',NULL,NULL),(15,'4UPcQ4FRGhYN4wi5A6KTw9Ibx32Rh5','2024-06-16 23:54:35.917490','read write',3,8,'2024-06-16 13:54:35.918493','2024-06-16 13:54:35.918493',NULL,NULL),(16,'ptAhKEYZtZZ1xeqFOnAc65U59eFWoI','2024-06-17 00:20:00.002639','read write',3,8,'2024-06-16 14:20:00.003640','2024-06-16 14:20:00.003640',NULL,NULL),(17,'7pfbhz3PMshj7savO8CXQ7OrS2d5w6','2024-06-17 00:30:38.965793','read write',3,8,'2024-06-16 14:30:38.966796','2024-06-16 14:30:38.966796',NULL,NULL),(18,'cRGOLaZELS4FFfeuTeS4yk18XbeD7U','2024-06-17 00:39:12.586537','read write',3,8,'2024-06-16 14:39:12.587538','2024-06-16 14:39:12.587538',NULL,NULL),(19,'8eU9ZCpM5u2eW8MXnhhvL876vfDzvy','2024-06-17 00:51:47.332066','read write',3,8,'2024-06-16 14:51:47.332066','2024-06-16 14:51:47.332066',NULL,NULL),(20,'l8tvAuprBHf0ERrQb5kHIDjmJyf6Rb','2024-06-17 00:56:21.412844','read write',3,8,'2024-06-16 14:56:21.412844','2024-06-16 14:56:21.412844',NULL,NULL),(21,'TjfW6zKR18L22QcozSMYXSW4sVSITm','2024-06-17 00:56:22.415774','read write',3,8,'2024-06-16 14:56:22.415774','2024-06-16 14:56:22.415774',NULL,NULL),(22,'Mp2heWjiZeDRwAjyLUFAHbHFXC2mF9','2024-06-17 00:58:42.761261','read write',3,8,'2024-06-16 14:58:42.761261','2024-06-16 14:58:42.761261',NULL,NULL),(23,'YgcXqHnR0VOKO0JqYSMYAykO64FTam','2024-06-17 01:05:28.302662','read write',3,8,'2024-06-16 15:05:28.303663','2024-06-16 15:05:28.303663',NULL,NULL),(24,'IXkD33ZHDk3qFl51kvkppEw2fW4aqz','2024-06-17 01:09:47.682546','read write',3,8,'2024-06-16 15:09:47.682546','2024-06-16 15:09:47.682546',NULL,NULL),(25,'8GNjsbaaNCDd8wtJCXxYEJDm3cjdI6','2024-06-17 01:16:46.369504','read write',3,8,'2024-06-16 15:16:46.369504','2024-06-16 15:16:46.369504',NULL,NULL),(26,'ZO5ofmc5NpfrfbIP8HCq4hTCHFybG9','2024-06-17 01:22:12.580723','read write',3,8,'2024-06-16 15:22:12.580723','2024-06-16 15:22:12.580723',NULL,NULL),(27,'knkDG5WUv0vfUfyptD969oznYsF11w','2024-06-17 01:25:03.735954','read write',3,8,'2024-06-16 15:25:03.735954','2024-06-16 15:25:03.735954',NULL,NULL),(28,'dlyBHGJF4xoY0o7boTHRrC0vc0cXA2','2024-06-17 01:27:05.162795','read write',3,8,'2024-06-16 15:27:05.162795','2024-06-16 15:27:05.162795',NULL,NULL),(29,'soBTaDXtTDSgN5aGgxPcatG2j3q1OP','2024-06-17 02:02:55.060999','read write',3,8,'2024-06-16 16:02:55.076622','2024-06-16 16:02:55.076622',NULL,NULL),(30,'LbHSjGmcusaey9Oloxn7Ea2ze6JBeF','2024-06-17 02:08:09.778404','read write',3,8,'2024-06-16 16:08:09.778404','2024-06-16 16:08:09.778404',NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_application`
--

LOCK TABLES `oauth2_provider_application` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_application` DISABLE KEYS */;
INSERT INTO `oauth2_provider_application` VALUES (3,'dnZ9K9kYGMSCWyVpNn3AHpbGuOFBDdGVBKUzBYtd','','confidential','password','pbkdf2_sha256$720000$veXaLJClgjRdmMnXug62Qh$tNzEosEdid/S2zMSEUaBJiI1j9wNrqHQwcJRgZUlZmg=','mainapp',1,0,'2024-06-15 16:18:12.314520','2024-06-15 16:18:12.314520','','',1,'');
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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_refreshtoken`
--

LOCK TABLES `oauth2_provider_refreshtoken` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_refreshtoken` DISABLE KEYS */;
INSERT INTO `oauth2_provider_refreshtoken` VALUES (1,'vYqGnKFN3MraktsG2NZ0S2jmv3E76F',1,3,1,'2024-06-15 16:20:46.373625','2024-06-15 16:20:46.373625',NULL),(2,'AEefn71ToA2JUqLQNJmYJgGTJpntAH',2,3,2,'2024-06-15 16:21:25.422497','2024-06-15 16:21:25.422497',NULL),(3,'JpkOxG1Oisz2DKF2o6pXzoOzptyZsU',3,3,5,'2024-06-15 16:26:34.045937','2024-06-15 16:26:34.045937',NULL),(4,'zkQufteHt2pZTjPCDoUXfgPSPaVuDy',4,3,9,'2024-06-15 16:26:45.913390','2024-06-15 16:26:45.913390',NULL),(5,'L07S4wQkT7fM0kdUJPZTk9eIMeidFK',5,3,2,'2024-06-15 16:32:18.176130','2024-06-15 16:32:18.176130',NULL),(6,'qPhwFxYEfAHcEx57Xa8G4v9adBJ7dR',6,3,17,'2024-06-15 17:19:47.418699','2024-06-15 17:19:47.418699',NULL),(7,'GdWWwloB1KjN7JeRIcT5ZeINoIxw7m',7,3,8,'2024-06-15 20:40:54.465560','2024-06-15 20:40:54.465560',NULL),(8,'UzIpBuAlwkT31y5UIouffXHrx1lhoF',8,3,8,'2024-06-15 20:42:12.320516','2024-06-15 20:42:12.320516',NULL),(9,'8skYDEyOPwa0xXdZRJ1SGUhMdCAaQ5',9,3,8,'2024-06-16 08:45:13.737483','2024-06-16 08:45:13.737483',NULL),(10,'hHYmZcL8439FHMfPOtsoQlXhYiRKSD',10,3,8,'2024-06-16 09:39:08.463255','2024-06-16 09:39:08.463255',NULL),(11,'ZonH8tSL5q1s75hLL7WzCtDOEqLjrH',11,3,8,'2024-06-16 09:50:19.854739','2024-06-16 09:50:19.854739',NULL),(12,'nIJPDZpqdgBbiD1aPelS9ThrbIt2Jb',12,3,8,'2024-06-16 10:09:28.616026','2024-06-16 10:09:28.616026',NULL),(13,'yyUsgf5DASY4PJ7GvQ8BNFWMjZY5Wq',13,3,8,'2024-06-16 10:32:16.652620','2024-06-16 10:32:16.652620',NULL),(14,'Mw7p2C1oImxXOD0QNSv1r0I11S3lt9',14,3,8,'2024-06-16 13:24:15.926673','2024-06-16 13:24:15.926673',NULL),(15,'JK4IzryWc2B4fCkDm0tHZLYUX1Xdbk',15,3,8,'2024-06-16 13:54:35.919492','2024-06-16 13:54:35.919492',NULL),(16,'HXG8L8YSb61l9pjby5FRTZF8cNb6WL',16,3,8,'2024-06-16 14:20:00.017641','2024-06-16 14:20:00.017641',NULL),(17,'Pfh769jRQ6fTd4ykoOhzEHLOyLdvFB',17,3,8,'2024-06-16 14:30:38.967796','2024-06-16 14:30:38.967796',NULL),(18,'32RZvkleknkrVps9SFfU8z7XG9sQdO',18,3,8,'2024-06-16 14:39:12.598540','2024-06-16 14:39:12.598540',NULL),(19,'8wMqrV5K8GwBsOuSeBNX7fzmAdVyDB',19,3,8,'2024-06-16 14:51:47.351245','2024-06-16 14:51:47.351245',NULL),(20,'6g9pbbfotWA0Ds1fHaIO6dkqKSuYti',20,3,8,'2024-06-16 14:56:21.428472','2024-06-16 14:56:21.428472',NULL),(21,'ssgBuz3vxDzjfCJCa3iyYN3DXZLMQL',21,3,8,'2024-06-16 14:56:22.432201','2024-06-16 14:56:22.432201',NULL),(22,'VEYJxEfSN6P67q9W4JVWMPXtxIWFlb',22,3,8,'2024-06-16 14:58:42.761261','2024-06-16 14:58:42.761261',NULL),(23,'WXNw4NzixNMppkrKsFjktzqydHqbPR',23,3,8,'2024-06-16 15:05:28.328977','2024-06-16 15:05:28.328977',NULL),(24,'COaUVFjMaslKObSd7abxyo3qV3lr7f',24,3,8,'2024-06-16 15:09:47.698180','2024-06-16 15:09:47.698180',NULL),(25,'y01M52450itbEIeP1TqlHkNPJzODFK',25,3,8,'2024-06-16 15:16:46.377660','2024-06-16 15:16:46.378659',NULL),(26,'NXKOM5nhB2W7pI51N6FvtNPnxBGtTq',26,3,8,'2024-06-16 15:22:12.592850','2024-06-16 15:22:12.592850',NULL),(27,'joZDUnRsILlUPl8ohCrjVOCW3NLuIn',27,3,8,'2024-06-16 15:25:03.751047','2024-06-16 15:25:03.751047',NULL),(28,'Hy63vXnpPWkZU5LV3wJnpdKiTLrito',28,3,8,'2024-06-16 15:27:05.163798','2024-06-16 15:27:05.163798',NULL),(29,'ZOSSdHclvkL9AKqEicKOZmqIVO0Isn',29,3,8,'2024-06-16 16:02:55.232965','2024-06-16 16:02:55.232965',NULL),(30,'wvzvfBnx0sH2PRUVEjnk6b0LUFl7AX',30,3,8,'2024-06-16 16:08:09.829759','2024-06-16 16:08:09.829759',NULL);
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
  `is_active` tinyint(1) NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_register` datetime(6) NOT NULL,
  `location` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `points` smallint unsigned NOT NULL,
  `statute_id` bigint NOT NULL,
  `assistant_creator_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `TrainingAPIApp_activ_assistant_creator_id_2b1ee62c_fk_TrainingA` (`assistant_creator_id`),
  KEY `TrainingAPIApp_activ_statute_id_fd1b2be9_fk_TrainingA` (`statute_id`),
  CONSTRAINT `TrainingAPIApp_activ_assistant_creator_id_2b1ee62c_fk_TrainingA` FOREIGN KEY (`assistant_creator_id`) REFERENCES `trainingapiapp_user` (`id`),
  CONSTRAINT `TrainingAPIApp_activ_statute_id_fd1b2be9_fk_TrainingA` FOREIGN KEY (`statute_id`) REFERENCES `trainingapiapp_statute` (`id`),
  CONSTRAINT `trainingapiapp_activity_chk_1` CHECK ((`points` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainingapiapp_activity`
--

LOCK TABLES `trainingapiapp_activity` WRITE;
/*!40000 ALTER TABLE `trainingapiapp_activity` DISABLE KEYS */;
INSERT INTO `trainingapiapp_activity` VALUES (1,'2024-06-13','2024-06-13',1,'CUỘC THI LUẬT AN NINH MẠNG VÀ BỘ QUY TẮC ỨNG XỬ TRÊN MẠNG XÃ HỘI NĂM 2024','2024-04-09 00:00:00.000000','Nhà Bè','CUỘC THI LUẬT AN NINH MẠNG VÀ BỘ QUY TẮC ỨNG XỬ TRÊN MẠNG XÃ HỘI NĂM 2024',10,2,5),(2,'2024-06-13','2024-06-13',1,'CUỘC THI HỌC THUẬT \"LUẬT SƯ TÀI NĂNG 2024\"','2024-04-18 00:00:00.000000','Nhà Bè','CUỘC THI HỌC THUẬT \"LUẬT SƯ TÀI NĂNG 2024\"',5,1,5),(3,'2024-06-13','2024-06-13',1,'Khóa tập huấn trợ giảng Khoa Đào tạo đặc biệt','2024-04-01 00:00:00.000000','Nhà Bè','Tham gia khóa tập huấn trợ giảng Khoa Đào tạo đặc biệt',5,3,6),(4,'2024-06-13','2024-06-15',1,'TẬP HUẤN NCKH CHỦ ĐỀ \"PHƯƠNG PHÁP NGHIÊN CỨU KHOA HỌC\"','2024-04-24 00:00:00.000000','Nhà Bè','TẬP HUẤN NCKH CHỦ ĐỀ \"PHƯƠNG PHÁP NGHIÊN CỨU KHOA HỌC\"',5,3,7),(5,'2024-06-13','2024-06-15',1,'Sinh hoạt Câu lạc bộ A&A','2024-04-25 00:00:00.000000','Nhà Bè','Sinh hoạt Câu lạc bộ A&A',15,2,7),(6,'2024-06-13','2024-06-13',1,'Khảo sát đánh giá thực trạng việc học ngoại ngữ trong sinh viên','2024-03-12 00:00:00.000000','Nhà Bè','Tham gia khảo sát đánh giá thực trạng việc học ngoại ngữ trong sinh viên',5,4,6),(7,'2024-06-13','2024-06-13',1,'Khóa học bổi dưỡng Archicad do công ty Giải pháp Rồng Xanh tổ chức','2024-03-30 00:00:00.000000','Nhà Bè','Tham gia Khóa học bổi dưỡng Archicad do công ty Giải pháp Rồng Xanh tổ chức',5,5,6),(8,'2024-06-14','2024-06-15',1,'Cuộc thi Giảng Đường Pháp Luật','2024-05-02 00:00:00.000000','Nhà Bè','Cuộc thi Giảng Đường Pháp Luật',15,3,6),(9,'2024-06-14','2024-06-14',1,'CUỘC THI HÙNG BIỆN TIẾNG NHẬT','2024-03-23 00:00:00.000000','Nhà Bè','CUỘC THI HÙNG BIỆN TIẾNG NHẬT',10,4,7),(10,'2024-06-14','2024-06-15',1,'Hội thảo Xây dựng thương hiệu cá nhân','2024-03-16 00:00:00.000000','Nhà Bè','Hội thảo Xây dựng thương hiệu cá nhân',10,4,5),(11,'2024-06-14','2024-06-15',1,'Sinh hoạt CLB Live','2024-03-16 00:00:00.000000','Nhà Bè','Sinh hoạt CLB Live',10,1,5),(12,'2024-06-14','2024-06-15',1,'Sinh hoạt CLB Lập trình trên thiết bị di động','2024-04-03 00:00:00.000000','Nhà Bè','Sinh hoạt CLB Lập trình trên thiết bị di động',15,2,6),(13,'2024-06-14','2024-06-15',1,'Hội thảo kỹ năng “Hành trang Gen Z”','2024-04-08 00:00:00.000000','Nhà Bè','Hội thảo kỹ năng “Hành trang Gen Z”',15,4,7);
/*!40000 ALTER TABLE `trainingapiapp_activity` ENABLE KEYS */;
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
  `is_active` tinyint(1) NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author_id` bigint NOT NULL,
  `activity_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `TrainingAPIApp_bulle_author_id_81502938_fk_TrainingA` (`author_id`),
  KEY `TrainingAPIApp_bulle_activity_id_97f95ad3_fk_TrainingA` (`activity_id`),
  CONSTRAINT `TrainingAPIApp_bulle_activity_id_97f95ad3_fk_TrainingA` FOREIGN KEY (`activity_id`) REFERENCES `trainingapiapp_activity` (`id`),
  CONSTRAINT `TrainingAPIApp_bulle_author_id_81502938_fk_TrainingA` FOREIGN KEY (`author_id`) REFERENCES `trainingapiapp_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainingapiapp_bulletin`
--

LOCK TABLES `trainingapiapp_bulletin` WRITE;
/*!40000 ALTER TABLE `trainingapiapp_bulletin` DISABLE KEYS */;
INSERT INTO `trainingapiapp_bulletin` VALUES (1,'2024-06-14','2024-06-14',1,'CUỘC THI LUẬT AN NINH MẠNG VÀ BỘ QUY TẮC ỨNG XỬ TRÊN MẠNG XÃ HỘI NĂM 2024','Tham gia cuộc thi luật','image/upload/v1718299083/u9gkuk6lngjz4wrcet97.jpg',5,1),(2,'2024-06-14','2024-06-14',1,'CUỘC THI HỌC THUẬT \"LUẬT SƯ TÀI NĂNG 2024\"','Tham gia cuộc thi','image/upload/v1718299117/ic0v4dxxksnq0iyotz2h.jpg',6,2),(3,'2024-06-14','2024-06-14',1,'Khóa tập huấn trợ giảng Khoa Đào tạo đặc biệt','Khóa tập huấn trợ giảng Khoa Đào tạo đặc biệt','image/upload/v1718299291/at7fmnm08hqohrtxtzcx.jpg',6,3),(4,'2024-06-14','2024-06-14',1,'TẬP HUẤN NCKH CHỦ ĐỀ \"PHƯƠNG PHÁP NGHIÊN CỨU KHOA HỌC\"','TẬP HUẤN NCKH CHỦ ĐỀ \"PHƯƠNG PHÁP NGHIÊN CỨU KHOA HỌC\"',NULL,7,4),(5,'2024-06-14','2024-06-14',1,'Sinh hoạt Câu lạc bộ A&A','Sinh hoạt Câu lạc bộ A&A','image/upload/v1718299540/f6ulwreiarsleoayrsxq.jpg',5,5),(6,'2024-06-14','2024-06-14',1,'Khảo sát đánh giá thực trạng việc học ngoại ngữ trong sinh viên','Khảo sát đánh giá thực trạng việc học ngoại ngữ trong sinh viên','image/upload/v1718299565/jk0i8zy0j2afejbik74w.jpg',6,6),(7,'2024-06-14','2024-06-14',1,'Khóa học bổi dưỡng Archicad do công ty Giải pháp Rồng Xanh tổ chức','Khóa học bổi dưỡng Archicad do công ty Giải pháp Rồng Xanh tổ chức','image/upload/v1718299605/bmowf1y1gos89jpczaue.jpg',6,7);
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
  `is_active` tinyint(1) NOT NULL,
  `content` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bulletin_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `TrainingAPIApp_comme_bulletin_id_2f95289d_fk_TrainingA` (`bulletin_id`),
  KEY `TrainingAPIApp_comme_user_id_2dcae11a_fk_TrainingA` (`user_id`),
  CONSTRAINT `TrainingAPIApp_comme_bulletin_id_2f95289d_fk_TrainingA` FOREIGN KEY (`bulletin_id`) REFERENCES `trainingapiapp_bulletin` (`id`),
  CONSTRAINT `TrainingAPIApp_comme_user_id_2dcae11a_fk_TrainingA` FOREIGN KEY (`user_id`) REFERENCES `trainingapiapp_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainingapiapp_comment`
--

LOCK TABLES `trainingapiapp_comment` WRITE;
/*!40000 ALTER TABLE `trainingapiapp_comment` DISABLE KEYS */;
INSERT INTO `trainingapiapp_comment` VALUES (1,'2024-06-14','2024-06-14',1,'Ngon',1,8);
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
  `is_active` tinyint(1) NOT NULL,
  `department_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainingapiapp_department`
--

LOCK TABLES `trainingapiapp_department` WRITE;
/*!40000 ALTER TABLE `trainingapiapp_department` DISABLE KEYS */;
INSERT INTO `trainingapiapp_department` VALUES (1,'2024-06-13','2024-06-13',1,'Công nghệ thông tin'),(2,'2024-06-13','2024-06-13',1,'Kinh tế và quản lý công'),(3,'2024-06-13','2024-06-13',1,'Tài chính - Ngân hàng'),(4,'2024-06-13','2024-06-13',1,'Đào tạo đặc biệt'),(5,'2024-06-13','2024-06-13',1,'Kế toán - kiểm toán'),(6,'2024-06-13','2024-06-13',1,'Xây dựng');
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
  `is_active` tinyint(1) NOT NULL,
  `klass_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `department_id` bigint NOT NULL,
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
INSERT INTO `trainingapiapp_klass` VALUES (1,'2024-06-13','2024-06-13',1,'IT01',1),(2,'2024-06-13','2024-06-13',1,'IT02',1),(3,'2024-06-13','2024-06-13',1,'EC01',2),(4,'2024-06-13','2024-06-13',1,'EC02',2),(5,'2024-06-13','2024-06-13',1,'FB01',3),(6,'2024-06-13','2024-06-13',1,'FB02',3),(7,'2024-06-13','2024-06-13',1,'RM01',4),(8,'2024-06-13','2024-06-13',1,'RM02',4),(9,'2024-06-13','2024-06-13',1,'SE01',5),(10,'2024-06-13','2024-06-13',1,'SE02',5),(11,'2024-06-13','2024-06-13',1,'BA01',6),(12,'2024-06-13','2024-06-13',1,'BA02',6);
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
  `is_active` tinyint(1) NOT NULL,
  `bulletin_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
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
  `is_active` tinyint(1) NOT NULL,
  `reason` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `proof` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `student_activity_id` bigint NOT NULL,
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
  `is_active` tinyint(1) NOT NULL,
  `semester_name` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_finished` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `semester_name` (`semester_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainingapiapp_semester`
--

LOCK TABLES `trainingapiapp_semester` WRITE;
/*!40000 ALTER TABLE `trainingapiapp_semester` DISABLE KEYS */;
INSERT INTO `trainingapiapp_semester` VALUES (1,'2024-06-14','2024-06-14',1,'HK1-2024','Học kì 1 - năm 2024',1),(2,'2024-06-14','2024-06-14',1,'HK2-2024','Học kì 2 - năm 2024',0);
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
  `is_active` tinyint(1) NOT NULL,
  `statute_name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `max_point` smallint unsigned NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `trainingapiapp_statute_chk_1` CHECK ((`max_point` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainingapiapp_statute`
--

LOCK TABLES `trainingapiapp_statute` WRITE;
/*!40000 ALTER TABLE `trainingapiapp_statute` DISABLE KEYS */;
INSERT INTO `trainingapiapp_statute` VALUES (1,'2024-06-13','2024-06-13',1,'Điều 1',25,'Điều 1'),(2,'2024-06-13','2024-06-13',1,'Điều 2',25,'Điều 2'),(3,'2024-06-13','2024-06-13',1,'Điều 3',20,'Điều 3'),(4,'2024-06-13','2024-06-13',1,'Điều 4',15,'Điều 4'),(5,'2024-06-13','2024-06-13',1,'Điều 5',20,'Điều 5');
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
  `student_code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `student_class_id` bigint NOT NULL,
  `student_department_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  UNIQUE KEY `student_code` (`student_code`),
  KEY `TrainingAPIApp_stude_student_class_id_18e5a812_fk_TrainingA` (`student_class_id`),
  KEY `TrainingAPIApp_stude_student_department_i_fb9edfb1_fk_TrainingA` (`student_department_id`),
  CONSTRAINT `TrainingAPIApp_stude_student_class_id_18e5a812_fk_TrainingA` FOREIGN KEY (`student_class_id`) REFERENCES `trainingapiapp_klass` (`id`),
  CONSTRAINT `TrainingAPIApp_stude_student_department_i_fb9edfb1_fk_TrainingA` FOREIGN KEY (`student_department_id`) REFERENCES `trainingapiapp_department` (`id`),
  CONSTRAINT `TrainingAPIApp_stude_user_id_091885d5_fk_TrainingA` FOREIGN KEY (`user_id`) REFERENCES `trainingapiapp_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainingapiapp_student`
--

LOCK TABLES `trainingapiapp_student` WRITE;
/*!40000 ALTER TABLE `trainingapiapp_student` DISABLE KEYS */;
INSERT INTO `trainingapiapp_student` VALUES (2,'20000','123',1,1,8),(3,'20001','123',2,1,9),(4,'20002','123',3,2,10),(5,'20003','123',4,2,11),(6,'20004','123',5,3,12),(7,'20005','123',6,3,13),(8,'20006','123',7,4,14),(9,'20007','123',8,4,19),(10,'20008','123',9,5,15),(12,'20009','123',10,5,16),(13,'20010','123',11,6,17),(14,'20011','123',12,6,18);
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
  `is_active` tinyint(1) NOT NULL,
  `status` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `activity_id` bigint NOT NULL,
  `semester_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `TrainingAPIApp_stude_activity_id_9261693b_fk_TrainingA` (`activity_id`),
  KEY `TrainingAPIApp_stude_semester_id_c7375a4e_fk_TrainingA` (`semester_id`),
  KEY `TrainingAPIApp_stude_user_id_81f3f895_fk_TrainingA` (`user_id`),
  CONSTRAINT `TrainingAPIApp_stude_activity_id_9261693b_fk_TrainingA` FOREIGN KEY (`activity_id`) REFERENCES `trainingapiapp_activity` (`id`),
  CONSTRAINT `TrainingAPIApp_stude_semester_id_c7375a4e_fk_TrainingA` FOREIGN KEY (`semester_id`) REFERENCES `trainingapiapp_semester` (`id`),
  CONSTRAINT `TrainingAPIApp_stude_user_id_81f3f895_fk_TrainingA` FOREIGN KEY (`user_id`) REFERENCES `trainingapiapp_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainingapiapp_studentactivity`
--

LOCK TABLES `trainingapiapp_studentactivity` WRITE;
/*!40000 ALTER TABLE `trainingapiapp_studentactivity` DISABLE KEYS */;
INSERT INTO `trainingapiapp_studentactivity` VALUES (1,'2024-06-14','2024-06-14',1,'attended',1,1,8),(2,'2024-06-14','2024-06-14',1,'attended',2,1,8),(3,'2024-06-14','2024-06-14',1,'attended',3,1,8),(4,'2024-06-14','2024-06-14',1,'attended',4,1,8),(5,'2024-06-14','2024-06-14',1,'attended',5,1,8),(6,'2024-06-14','2024-06-14',1,'attended',10,1,8),(9,'2024-06-14','2024-06-14',1,'attended',11,1,8),(10,'2024-06-14','2024-06-14',1,'attended',12,1,8),(11,'2024-06-14','2024-06-14',1,'attended',7,1,8),(12,'2024-06-14','2024-06-14',1,'attended',1,1,9),(13,'2024-06-14','2024-06-14',1,'attended',3,1,9),(14,'2024-06-14','2024-06-14',1,'attended',8,1,9),(15,'2024-06-14','2024-06-14',1,'attended',7,1,9),(16,'2024-06-14','2024-06-14',1,'attended',10,1,9),(17,'2024-06-14','2024-06-14',1,'attended',5,1,9),(18,'2024-06-14','2024-06-14',1,'attended',5,1,9),(19,'2024-06-14','2024-06-14',1,'attended',1,1,10),(20,'2024-06-14','2024-06-14',1,'attended',2,1,9),(21,'2024-06-14','2024-06-14',1,'attended',7,1,10),(22,'2024-06-14','2024-06-14',1,'attended',10,1,10),(23,'2024-06-14','2024-06-14',1,'attended',11,1,10),(24,'2024-06-14','2024-06-14',1,'attended',1,1,11),(25,'2024-06-14','2024-06-14',1,'attended',3,1,11),(26,'2024-06-14','2024-06-14',1,'attended',6,1,11),(27,'2024-06-14','2024-06-14',1,'attended',10,1,12),(28,'2024-06-14','2024-06-14',1,'attended',3,1,12),(29,'2024-06-14','2024-06-14',1,'attended',12,1,12),(30,'2024-06-14','2024-06-14',1,'attended',8,1,11),(31,'2024-06-14','2024-06-14',1,'attended',6,1,13),(32,'2024-06-14','2024-06-14',1,'attended',1,1,13),(33,'2024-06-14','2024-06-14',1,'attended',5,1,11),(34,'2024-06-14','2024-06-14',1,'attended',10,1,13),(35,'2024-06-14','2024-06-14',1,'attended',12,1,13),(36,'2024-06-14','2024-06-14',1,'attended',11,1,13),(37,'2024-06-14','2024-06-14',1,'attended',5,1,14),(38,'2024-06-14','2024-06-14',1,'attended',3,1,14),(39,'2024-06-14','2024-06-14',1,'attended',11,1,14),(40,'2024-06-14','2024-06-14',1,'attended',5,1,15),(41,'2024-06-14','2024-06-14',1,'attended',3,1,15),(42,'2024-06-14','2024-06-14',1,'attended',9,1,15);
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
  `first_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_role` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainingapiapp_user`
--

LOCK TABLES `trainingapiapp_user` WRITE;
/*!40000 ALTER TABLE `trainingapiapp_user` DISABLE KEYS */;
INSERT INTO `trainingapiapp_user` VALUES (1,'pbkdf2_sha256$720000$RgdEVzySDsQRups12JPN83$K+mtIvV+QrVDeGvXd6NX14Yueu6GhFHVyYojqdBIjV0=','2024-06-14 15:52:55.311094',1,'admin','',1,1,'2024-06-13 15:39:56.685371','admin@ou.edu.vn','https://res.cloudinary.com/dmfr3gngl/image/upload/v1718295085/default/hoso_dnry6o.jpg','ADMIN'),(2,'pbkdf2_sha256$720000$pS722awoi1Re7qUaFiBf8B$wF27TWJh0smHg16ml2p4V7YtuZMJ5piZhqXOAmThv1s=','2024-06-14 15:50:57.619069',0,'Nguyễn','A',1,1,'2024-06-13 16:13:57.120689','specialist1@ou.edu.vn','image/upload/v1718295266/chc6lswv3k1aox0b04gy.jpg','CV'),(3,'pbkdf2_sha256$720000$s3JdfIPep9tgcu0Zvwje7d$no2XlX+FrAobI05uvnbrwskjGDvnGywniLbALWM46bc=',NULL,0,'Nguyễn','B',1,1,'2024-06-13 16:14:11.893137','specialist2@ou.edu.vn','image/upload/v1718295280/almzpj0mj2dcbsugarjr.jpg','CV'),(4,'pbkdf2_sha256$720000$MTXn9AeK86CucL1yfVJ0Qw$ked0JWCnjFTSrrHDkvdN0TtiQFFdDDxQvvmPrmUx86A=',NULL,0,'Nguyễn','C',1,1,'2024-06-13 16:14:21.949238','specialist3@ou.edu.vn','image/upload/v1718295290/xt3biokumcjmwlhr8hdo.jpg','CV'),(5,'pbkdf2_sha256$720000$lBZI7lgU0uGQd97varmcGH$/K6OLUV0gjACOUZXNnklPv4TNI2W//29K8hX0elMAZA=',NULL,0,'Nguyễn','D',0,1,'2024-06-13 16:24:13.869176','assistant1@ou.edu.vn','image/upload/v1718295883/ldqanlr1mkuwme6lujba.jpg','TLSV'),(6,'pbkdf2_sha256$720000$1y4rIbyBkiUTPNc5blZ3pu$poBYHDGYT9dRi0xe1GZZMHDOSaF2g324RTnrhgNwL3g=',NULL,0,'Nguyễn','E',0,1,'2024-06-13 16:28:24.701602','assistant2@ou.edu.vn','image/upload/v1718296133/fbkki8lqcerxtzrbkt3t.jpg','TLSV'),(7,'pbkdf2_sha256$720000$TffYzqPOOn7lOIa9tqfY1r$wKfYD3zwVZSd1d7PL3ZfLYV7Y0IG3d+zAi3SwfUalaI=',NULL,0,'Nguyễn','F',0,1,'2024-06-13 16:28:33.470570','assistant3@ou.edu.vn','image/upload/v1718296142/lujxiw1b6phs3c7td7qk.jpg','TLSV'),(8,'pbkdf2_sha256$720000$4coYeoHbPEkd6rVDMuOx6X$aCeDMUIsxbBnkCSQWArJQjFze/xsLWVh8LEjw13vLpc=',NULL,0,'Nguyễn','G',0,1,'2024-06-13 16:28:58.039411','student1@ou.edu.vn','image/upload/v1718296166/on2tgpj2zv7ewkkuukn5.jpg','SV'),(9,'pbkdf2_sha256$720000$QiSfVogQNAfswF3TrA0nDA$uejdTGYCS4ENIUTYpEjMw9I9ATi9+DQK9/X6kdFhEEA=',NULL,0,'Nguyễn','H',0,1,'2024-06-13 16:29:06.032022','student2@ou.edu.vn','image/upload/v1718296174/l22dn3aw6wjydeqr4ckw.jpg','SV'),(10,'pbkdf2_sha256$720000$AWoT1heeyZhOrbrQzsIBrN$gOuEoGyQP4/bPBa6x3Ej5PUIZpu2OAVk+o7P1d0mryM=',NULL,0,'Nguyễn','I',0,1,'2024-06-13 16:29:13.449975','student3@ou.edu.vn','image/upload/v1718296181/zfhyblxvkq9pjewp2dnf.jpg','SV'),(11,'pbkdf2_sha256$720000$nS3JBqLHKOtRBHy8szY27w$8JKE3QfUYrdwsOSoRGoMMCr3dnu608yzpl2HJQJVW84=',NULL,0,'Nguyễn','J',0,1,'2024-06-13 17:36:31.260009','student4@ou.edu.vn','image/upload/v1718300220/wjf3ayg43fqnbus1nlmi.jpg','SV'),(12,'pbkdf2_sha256$720000$rXmcNYEmr6oyixatkInqZ6$vL2yLKXlQ1KTpwqDi0w+BLnio6XGqBTWemjVRse9sV4=',NULL,0,'Nguyễn','K',0,1,'2024-06-13 17:45:53.666052','student5@ou.edu.vn','image/upload/v1718300782/zhbjojldq0bjm2bvicxu.jpg','SV'),(13,'pbkdf2_sha256$720000$X3r3R4wZyV9OEfC30Xd28Y$TjUsOEIz81gGYp1mHTkOES3TDOd63tdEzPlEGtsinkM=',NULL,0,'Nguyễn','L',0,1,'2024-06-13 17:46:00.427211','student6@ou.edu.vn','image/upload/v1718300788/nakdetp7cpk58krwokpe.jpg','SV'),(14,'pbkdf2_sha256$720000$IBgLencDX2FiHZyJgGr4aV$JcSY6cST4pwVchve5KFPlvzEaBPHsG67p/UCWws5MeE=',NULL,0,'Nguyễn','M',0,1,'2024-06-13 17:46:06.797582','student7@ou.edu.vn','image/upload/v1718300795/q4t5omr2p7brb9s3ovvz.jpg','SV'),(15,'pbkdf2_sha256$720000$0PEds7Fd2Iz9cgR01tEeNz$yIFdgaI08eo3vfZpQrEMa237Itevyl4MfG8yf7hpx6w=',NULL,0,'Nguyễn','N',0,1,'2024-06-13 17:46:17.267684','student9@ou.edu.vn','image/upload/v1718300805/f0obuzgj6ybtgtt7elv0.jpg','SV'),(16,'pbkdf2_sha256$720000$N2eLxRxnQoBuFqf0d5z3vo$uUBF80jPERwCiMkwHxo9pScjFwE0S4c8dwTpsgDZ1dc=',NULL,0,'Nguyễn','O',0,1,'2024-06-13 17:46:28.749532','student10@ou.edu.vn','image/upload/v1718300817/y3nswg8hdk5gv6ya0x0r.jpg','SV'),(17,'pbkdf2_sha256$720000$px1sDOK9SfiW8W7hrX6U7i$arGWTNo7znMoQWiIqaTcEFebvpv+G/A/RYcw6REDk24=',NULL,0,'Nguyễn','P',0,1,'2024-06-13 17:46:34.161614','student11@ou.edu.vn','image/upload/v1718300822/ohvhprbfnly9cty5hxjo.jpg','SV'),(18,'pbkdf2_sha256$720000$KFdt4JJNnk97IwV3BEECa7$itZJmgPi7yJkgyapzaoOTC4xLTa0BXtl/k39pxq+eJg=',NULL,0,'Nguyễn','Q',0,1,'2024-06-13 17:46:40.237809','student12@ou.edu.vn','image/upload/v1718300828/yxxzaevtxkdwwzixqouy.jpg','SV'),(19,'pbkdf2_sha256$720000$lB7Gj02oVG9TaE54RnwnHg$y+YFEdLPhhDLZLoj9Bs1T97ZFNBiWSXcBxdYmWXMykQ=',NULL,0,'Nguyễn','R',0,1,'2024-06-13 18:06:31.117953','student8@ou.edu.vn','image/upload/v1718302020/pfx52gkfzilfm1l5qr4y.jpg','SV'),(20,'pbkdf2_sha256$720000$tRSrtLv5TOPZ02m5smCr8D$3XSjd/LgzONWn+1bV0X4uqI5hnh4Ckarrzkk6wXvZt8=',NULL,0,'Nguyễn','S',0,0,'2024-06-14 16:41:34.709545','student13@ou.edu.vn','image/upload/v1718383326/gzctuhptlimbj3vwvpmh.jpg','SV');
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

-- Dump completed on 2024-06-16 23:17:28
