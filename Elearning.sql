-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: elearning
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
-- Table structure for table `assignmentfile`
--

DROP TABLE IF EXISTS `assignmentfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assignmentfile` (
  `AssignmentFileId` varchar(50) NOT NULL,
  `AssignmentId` varchar(36) NOT NULL,
  `FileTitle` varchar(45) NOT NULL,
  `FileUrl` varchar(255) NOT NULL,
  PRIMARY KEY (`AssignmentFileId`),
  KEY `Fk_assignmentfile_AssignmentId_idx` (`AssignmentId`),
  CONSTRAINT `Fk_assignmentfile_AssignmentId` FOREIGN KEY (`AssignmentId`) REFERENCES `assignments` (`AssignmentId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignmentfile`
--

LOCK TABLES `assignmentfile` WRITE;
/*!40000 ALTER TABLE `assignmentfile` DISABLE KEYS */;
INSERT INTO `assignmentfile` VALUES ('1682f6cc588c6b08359bb5f80a6350fe','q1r2s3t4-u5v6-w7x8-y9z0-a1b2c3d4e5f6','[NAME]_履歴書','http://res.cloudinary.com/ddwapzxdc/raw/upload/v1708615640/CourseAssignment/Teacher/y0dp3uzjgbqlennomij4.docx'),('16c35c91c45b398fc79c16be04b1c21e','1f2c3e4c-5d6e-7f8g-9h0i-1j2k3l4m5n6o','mau_đon_hoc_bong_trao_đoi_21.0k','http://res.cloudinary.com/ddwapzxdc/raw/upload/v1718619717/CourseAssignment/Teacher/zefj1cijmyhxbdtubgra.docx'),('1c040463a3247eed58923171d65347da','p2q3r4s5-t6u7-v8w9-x0y1-z2a3b4c5d6e7','Lec 10.3-CICD-DigitalOcean','http://res.cloudinary.com/ddwapzxdc/raw/upload/v1706110005/CourseAssignment/Teacher/hkwr5gmkx06vlfpufia7.pdf'),('1c935cc034340190aed1aba49ba5f686','31553a17-1ff5-46d9-9392-9d59545f1c6a','Chi_Phi_Du_An','http://res.cloudinary.com/ddwapzxdc/raw/upload/v1717829082/CourseAssignment/Teacher/x2fqhzz5vwurzzawdgqf.docx'),('2e538a0641e95b45bb3193892af07461','bfbbea64-1d55-4e85-be0b-91de82b22fd8','API  cần sửa','http://res.cloudinary.com/ddwapzxdc/raw/upload/v1719106179/CourseAssignment/Teacher/dglbgnjol8cstqxbx3xw.txt'),('5b61ece2397bbe5d7fc9ba83d3f81220','p2q3r4s5-t6u7-v8w9-x0y1-z2a3b4c5d6e7','Đặc tả các ca sử dụng','http://res.cloudinary.com/ddwapzxdc/raw/upload/v1703167890/CourseAssignment/Teacher/ompjrjxtfli7qkcc4lpx.docx'),('5e8ff9bab3d4a66592763fbdccc7428b','q1r2s3t4-u5v6-w7x8-y9z0-a1b2c3d4e5f6','cd6a42ac-7331-4b8c-80b5-3f3f43bf4a14','http://res.cloudinary.com/ddwapzxdc/raw/upload/v1717505580/CourseAssignment/Teacher/mpmodnxel8rmf685lcxv.jpeg'),('a864b25f24c0c8ef98d0da734408eb88','q1r2s3t4-u5v6-w7x8-y9z0-a1b2c3d4e5f6','cd6a42ac-7331-4b8c-80b5-3f3f43bf4a14','http://res.cloudinary.com/ddwapzxdc/raw/upload/v1717505356/CourseAssignment/Teacher/va4mbgnfz12a9wrtgr3a.jpeg'),('d593030de123d3753b90ffebac7754a6','31553a17-1ff5-46d9-9392-9d59545f1c6a','b73c7580-6f67-4ba8-bea6-3e26302e486d','http://res.cloudinary.com/ddwapzxdc/raw/upload/v1717829453/CourseAssignment/Teacher/jj3hh44ji3jodspboi2y.jpeg');
/*!40000 ALTER TABLE `assignmentfile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assignments`
--

DROP TABLE IF EXISTS `assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assignments` (
  `AssignmentId` varchar(36) NOT NULL,
  `AssignmentTitle` varchar(255) NOT NULL,
  `AssignmentDesc` varchar(10000) DEFAULT NULL,
  `ChapterId` varchar(36) NOT NULL,
  `StartDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `EndDate` datetime DEFAULT NULL,
  `CourseId` int DEFAULT NULL,
  PRIMARY KEY (`AssignmentId`),
  KEY `ChapterId_idx` (`ChapterId`),
  KEY `Fk_assignments_CourseId_idx` (`CourseId`),
  CONSTRAINT `Fk_assignments_CourseId` FOREIGN KEY (`CourseId`) REFERENCES `courses` (`CourseId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignments`
--

LOCK TABLES `assignments` WRITE;
/*!40000 ALTER TABLE `assignments` DISABLE KEYS */;
INSERT INTO `assignments` VALUES ('1f2c3e4c-5d6e-7f8g-9h0i-1j2k3l4m5n6o','Đề thi học kỳ','<p>thi</p>','274','2024-02-15 22:26:16','2024-02-25 16:00:00',7),('31553a17-1ff5-46d9-9392-9d59545f1c6a','Chương 1','<p><span style=\"background-color: rgb(241, 245, 249); color: rgb(2, 8, 23);\">Chương 1</span></p>','278','2024-06-08 13:25:26','2024-06-25 00:00:00',92),('a1b2c3d4-e5f6-g7h8-i9j0-k1l2m3n4o5','Lab 2',NULL,'202','2024-03-09 16:37:37','2024-03-15 00:00:00',7),('bfbbea64-1d55-4e85-be0b-91de82b22fd8','Bài tập 1 : Intro to Data and Data Science ','<p>124</p>','201','2024-06-18 09:44:25','2024-06-19 06:00:00',7),('d7e6f5g4h3i2j1-k0l9m8n7o6p5q4r3s2t1','sdfsdf','<p>1231241412</p>','204','2024-02-15 22:13:35','2024-02-20 05:00:00',7),('f7be45fb-cbb3-4d24-9145-d2f303a11f35','Bài tập 2 : Intro to Data and Data Science','<ol><li><span style=\"background-color: rgb(241, 245, 249);\">Intro to Data and Data Science</span></li><li><span style=\"background-color: rgb(241, 245, 249);\"><span class=\"ql-cursor\">﻿</span>Intro to Data and Data Science</span></li><li><br></li></ol>','201','2024-06-18 09:44:31','2024-06-27 00:00:00',7),('p2q3r4s5-t6u7-v8w9-x0y1-z2a3b4c5d6e7','Bài tập 2','<p>Các em nộp bài ở đây</p>','241','2023-12-21 16:05:54','2024-03-27 00:00:00',7),('q1r2s3t4-u5v6-w7x8-y9z0-a1b2c3d4e5f6','Học từ vựng 1','<p><strong>Làm bài tập đi mọi người</strong></p>','270','2024-02-22 22:26:49','2024-02-25 00:00:00',NULL);
/*!40000 ALTER TABLE `assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chapters`
--

DROP TABLE IF EXISTS `chapters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chapters` (
  `ChapterId` int NOT NULL AUTO_INCREMENT,
  `ChapterTitle` varchar(255) NOT NULL,
  `ChapterPosition` varchar(45) DEFAULT NULL,
  `ChapterDesc` varchar(1000) DEFAULT NULL,
  `ChapterVideo` varchar(255) DEFAULT NULL,
  `CourseId` int NOT NULL,
  `CreatedAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `UpdatedAt` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ChapterId`),
  KEY `CourseId_idx` (`CourseId`),
  CONSTRAINT `CourseIdFk` FOREIGN KEY (`CourseId`) REFERENCES `courses` (`CourseId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=287 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chapters`
--

LOCK TABLES `chapters` WRITE;
/*!40000 ALTER TABLE `chapters` DISABLE KEYS */;
INSERT INTO `chapters` VALUES (29,'Giới thiệu môn học','','','',10,'2023-10-21 10:05:51','2023-10-21 10:05:51'),(32,'HTML','','','',10,'2023-10-21 12:04:20','2023-10-21 12:04:20'),(33,'CSS','','','',10,'2023-10-21 12:04:24','2023-10-21 12:04:24'),(34,'JS','','','',10,'2023-10-21 12:04:28','2023-10-21 12:04:28'),(40,'PHP','','','',10,'2023-10-21 15:46:13','2023-10-21 15:46:13'),(42,'Ruby','','','',10,'2023-10-21 16:15:15','2023-10-21 16:15:15'),(55,'Golang','','','',10,'2023-10-23 08:07:55','2023-10-23 08:07:55'),(171,'NextJS','','','',10,'2023-10-26 20:29:11','2023-10-26 20:29:11'),(172,'Java','','','',10,'2023-10-26 20:29:41','2023-10-26 20:29:41'),(201,'Intro to Data and Data Science','1','<p><span style=\"background-color: rgb(247, 247, 247); color: rgb(0, 0, 0);\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla lacinia lorem ac semper finibus. Curabitur sed risus at elit fringilla malesuada. Sed iaculis nisl nec est interdum, ac tempor dolor vestibulum. Sed feugiat fringilla magna ut mollis. Ut velit risus, dignissim ut congue non, tristique a neque. Mauris tempus, velit ac vehicula suscipit, neque turpis interdum est, et fringilla urna nunc eget nulla. Curabitur placerat turpis nec dui dapibus, id dignissim tortor pharetra. Sed ut iaculis lorem. Ut ultrices odio non nunc facilisis, id scelerisque urna dignissim. Aliquam vulputate elementum mauris, eget faucibus metus lacinia non. Maecenas finibus velit eu elit gravida, sed fringilla magna volutpat. Curabitur dictum elit quis enim feugiat, et porttitor arcu consequat.</span></p>','https://www.youtube.com/embed/fIpKgyleBK0?si=HnD7aQEO-wv4dCIh',7,'2023-11-01 21:24:20','2023-11-01 21:24:20'),(202,'Mathematics ','2','<p>sádsada</p>','',7,'2023-11-01 22:14:50','2023-11-01 22:14:50'),(203,'Statistics','3','<p>Statistics</p>','',7,'2023-11-01 22:14:59','2023-11-01 22:14:59'),(204,'Python','4','<p>Môn lập trình Python</p>','',7,'2023-11-01 22:15:08','2023-11-01 22:15:08'),(205,'Tableau','5','<p>Tableau</p>','C:\\Users\\Acer\\AppData\\Local\\Temp\\ToÃ¡n tá»­ ++ -- vá»i tiá»n tá» & háº­u tá» (1).mp4',7,'2023-11-01 23:21:51','2023-11-01 23:21:51'),(207,' Advanced Statistics ','6','<p>Đây là Advanced <span style=\"background-color: rgb(241, 245, 249);\">Statistics</span></p>','',7,'2023-11-01 23:29:51','2023-11-01 23:29:51'),(208,'Machine Learning','7','Hello','https://res.cloudinary.com/ddwapzxdc/video/upload/v1699848550/CourseVideo/diweokdqqn69zgfpfzvr.mp4',7,'2023-11-02 09:45:11','2023-11-02 09:45:11'),(241,'Tổng kết học phần','8','<p>Tổng kết môn học 3</p>',NULL,7,'2023-11-22 21:04:09','2023-11-22 21:04:09'),(270,'IP ADRESS','3','<p>Lam</p>',NULL,6,'2024-01-03 18:48:38','2024-01-03 18:48:38'),(273,'SSH1112',NULL,NULL,NULL,25,'2024-01-24 22:36:43','2024-01-24 22:36:43'),(274,'Thi học kỳ','9',NULL,NULL,7,'2024-02-12 18:55:59','2024-02-12 18:55:59'),(276,'Test 1','2','<p>2</p>',NULL,6,'2024-05-24 16:53:31','2024-05-24 16:53:31'),(278,'Chương 1',NULL,'<p><span style=\"background-color: rgb(241, 245, 249); color: rgb(2, 8, 23);\">Chương 1</span></p>',NULL,92,'2024-06-08 13:21:11','2024-06-08 13:21:11'),(283,'Chương 2',NULL,'<p>Chương 2</p>',NULL,92,'2024-06-17 14:41:14','2024-06-17 14:41:14'),(286,'GitDemo','1',NULL,NULL,6,'2024-06-19 21:31:44','2024-06-19 21:31:44');
/*!40000 ALTER TABLE `chapters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class_student`
--

DROP TABLE IF EXISTS `class_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class_student` (
  `Class_Student_Id` int NOT NULL AUTO_INCREMENT,
  `ClassId` varchar(36) NOT NULL,
  `UserId` int NOT NULL,
  PRIMARY KEY (`Class_Student_Id`),
  KEY `Fk_classId_class_student_idx` (`ClassId`),
  KEY `Fk_userId_class_student_idx` (`UserId`),
  CONSTRAINT `Fk_classId_class_student` FOREIGN KEY (`ClassId`) REFERENCES `classes` (`ClassId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Fk_userId_class_student` FOREIGN KEY (`UserId`) REFERENCES `students` (`UserId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_student`
--

LOCK TABLES `class_student` WRITE;
/*!40000 ALTER TABLE `class_student` DISABLE KEYS */;
INSERT INTO `class_student` VALUES (48,'cde7476f-01e8-496b-afee-441f5ec86544',12),(49,'cde7476f-01e8-496b-afee-441f5ec86544',5),(50,'b7ee6573-04db-435b-b1c2-eaa45b33be7b',5),(51,'b7ee6573-04db-435b-b1c2-eaa45b33be7b',12);
/*!40000 ALTER TABLE `class_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classes`
--

DROP TABLE IF EXISTS `classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classes` (
  `ClassId` varchar(36) NOT NULL,
  `ClassCode` varchar(45) NOT NULL,
  `CourseId` int NOT NULL,
  `TeacherId` int NOT NULL,
  PRIMARY KEY (`ClassId`),
  KEY `FK_CourseId_idx` (`CourseId`),
  KEY `FK_TeacherId_idx` (`TeacherId`),
  CONSTRAINT `FK_CourseId` FOREIGN KEY (`CourseId`) REFERENCES `courses` (`CourseId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_TeacherId` FOREIGN KEY (`TeacherId`) REFERENCES `teachers` (`TeacherId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes`
--

LOCK TABLES `classes` WRITE;
/*!40000 ALTER TABLE `classes` DISABLE KEYS */;
INSERT INTO `classes` VALUES ('8c49d541-dbbd-413c-9eff-efc86da56f7f','Lớp 2 - C',7,4),('b7ee6573-04db-435b-b1c2-eaa45b33be7b','Lớp 1 - S',7,4),('cde7476f-01e8-496b-afee-441f5ec86544','1122',6,4);
/*!40000 ALTER TABLE `classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses` (
  `CourseId` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `cat` varchar(255) DEFAULT NULL,
  `desc` varchar(10000) DEFAULT NULL,
  `TeacherId` int NOT NULL,
  `img` varchar(1000) DEFAULT NULL,
  `StartDate` datetime DEFAULT NULL,
  `EndDate` datetime DEFAULT NULL,
  `CourseCode` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`CourseId`),
  KEY `uid_idx` (`TeacherId`),
  CONSTRAINT `TeacherId` FOREIGN KEY (`TeacherId`) REFERENCES `teachers` (`TeacherId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (6,'Học môn tiếng nhật chuyên ngành','art','<p>\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed porttitor risus id mi posuere, ut porta nunc lobortis. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Integer malesuada, enim eget lacinia ullamcorper, metus justo posuere libero, vitae scelerisque ex tortor sed orci. Nunc eleifend pharetra purus ut euismod. Sed cursus venenatis lacus, at cursus dui aliquam eu. Proin arcu sem, pretium sed fermentum et, aliquet ac nisl. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Cras auctor tincidunt felis, nec euismod tellus efficitur id. Nullam congue, dolor a pellentesque semper, ex lorem vehicula augue, in faucibus dolor eros vel justo. Nam in mauris dolor. Vestibulum vel imperdiet turpis. Nunc elit nulla, vulputate eget lobortis in, euismod vel ipsum. Nullam maximus mauris at magna tincidunt, at pulvinar urna rhoncus.\" Web</p>',4,'http://res.cloudinary.com/ddwapzxdc/image/upload/v1718612374/CourseImage/bmeyvkgxt1ptw5ftfusf.jpg','2023-10-10 00:00:00','2023-11-17 00:00:00','JP1110'),(7,'The Data Science Course: Complete Data Science Bootcamp 2023','cinema','<p><strong>The Problem</strong></p><p>Data scientist is one of the best suited professions to thrive this century. It is digital, programming-oriented, and analytical. Therefore, it comes as no surprise that the demand for data scientists has been surging in the job marketplace.&nbsp;&nbsp;&nbsp;</p><p>However, supply has been very limited. It is difficult to acquire the skills necessary to be hired as a data scientist.&nbsp;&nbsp;&nbsp;</p><p>And how can you do that?&nbsp;</p><p>Universities have been slow at creating specialized data science programs. (not to mention that the ones that exist are very expensive and time consuming)&nbsp;&nbsp;</p><p>Most online courses focus on a specific topic and it is difficult to understand how the skill they teach fit in the complete picture&nbsp;</p><p><strong>The Solution</strong>&nbsp;&nbsp;</p><p>Data science is a multidisciplinary field. It encompasses a wide range of topics.&nbsp;&nbsp;</p><ul><li><br></li><li>Understanding of the data science field and the type of analysis carried out&nbsp;</li><li>Mathematics&nbsp;</li><li>Statistics&nbsp;&nbsp;</li><li>Python&nbsp;&nbsp;</li><li>Applying advanced statistical techniques in Python&nbsp;&nbsp;</li><li>Data Visualization&nbsp;</li><li>Machine Learning&nbsp;</li><li>Deep Learning&nbsp;</li></ul><p>Each of these topics builds on the previous ones. And you risk getting lost along the way if you don’t acquire these skills in the right order. For example, one would struggle in the application of Machine Learning techniques before understanding the underlying Mathematics. Or, it can be overwhelming to study regression analysis in Python before knowing what a regression is.&nbsp;&nbsp;</p><p><strong><em>So, in an effort to create the most effective, time-efficient, and structured data science training available online, we created The Data Science Course 2023.</em></strong>&nbsp;&nbsp;</p><p>We believe this is the first training program that solves the biggest challenge to entering the data science field&nbsp;<strong>– having all the necessary resources in one place.</strong>&nbsp;&nbsp;</p><p>Moreover, our focus is to teach topics that flow smoothly and complement each other. The course teaches you everything you need to know to become a data scientist at a fraction of the cost of traditional programs (not to mention the amount of time you will save).&nbsp;&nbsp;</p><p><strong>The Skills</strong></p><p><strong>&nbsp;&nbsp;1.&nbsp;Intro to Data and Data Science</strong></p><p>Big data, business intelligence, business analytics, machine learning and artificial intelligence. We know these buzzwords belong to the field of data science but what do they all mean?&nbsp;&nbsp;&nbsp;</p><p><strong>Why learn it?</strong>&nbsp;As a candidate data scientist, you must understand the ins and outs of each of these areas and recognise the appropriate approach to solving a problem. This ‘Intro to data and data science’ will give you a comprehensive look at all these buzzwords and where they fit in the realm of data science.&nbsp;</p><p>&nbsp;&nbsp;<strong>2. Mathematics</strong>&nbsp;</p><p>Learning the tools is the first step to doing data science. You must first see the big picture to then examine the parts in detail.&nbsp;&nbsp;</p><p>We take a detailed look specifically at calculus and linear algebra as they are the subfields data science relies on.&nbsp;&nbsp;</p><p><strong>Why learn it?</strong>&nbsp;&nbsp;</p><p>Calculus and linear algebra are essential for programming in data science. If you want to understand advanced machine learning algorithms, then you need these skills in your arsenal.</p><p>&nbsp;&nbsp;<strong>3. Statistics</strong>&nbsp;</p><p>You need to think like a scientist before you can become a scientist. Statistics trains your mind to frame problems as hypotheses and gives you techniques to test these hypotheses, just like a scientist.&nbsp;</p><p><strong>Why learn it?</strong>&nbsp;&nbsp;</p><p>This course doesn’t just give you the tools you need but teaches you how to use them. Statistics trains you to think like a scientist.</p><p>&nbsp;&nbsp;<strong>4. Python</strong></p><p>Python is a relatively new programming language and, unlike R, it is a general-purpose programming language. You can do anything with it! Web applications, computer games and data science are among many of its capabilities. That’s why, in a short space of time, it has managed to disrupt many disciplines. Extremely powerful libraries have been developed to enable data manipulation, transformation, and visualisation. Where Python really shines however, is when it deals with machine and deep learning.</p><p><strong>Why learn it?</strong>&nbsp;&nbsp;</p><p>When it comes to developing, implementing, and deploying machine learning models through powerful frameworks such as scikit-learn, TensorFlow, etc, Python is a must have programming language.&nbsp;</p><p>&nbsp;&nbsp;<strong>5. Tableau</strong></p><p>Data scientists don’t just need to deal with data and solve data driven problems. They also need to convince company executives of the right decisions to make. These executives may not be well versed in data science, so the data scientist must but be able to present and visualise the data’s story in a way they will understand. That’s where Tableau comes in – and we will help you become an expert story teller using the leading visualisation software in business intelligence and data science.</p><p><strong>Why learn it?</strong>&nbsp;&nbsp;</p><p>A data scientist relies on business intelligence tools like Tableau to communicate complex results to non-technical decision makers.&nbsp;</p><p>&nbsp;&nbsp;<strong>6. Advanced Statistics</strong>&nbsp;</p><p>Regressions, clustering, and factor analysis are all disciplines that were invented before machine learning. However, now these statistical methods are all performed through machine learning to provide predictions with unparalleled accuracy. This section will look at these techniques in detail.&nbsp;</p><p><strong>Why learn it?</strong>&nbsp;&nbsp;</p><p>Data science is all about predictive modelling and you can become an expert in these methods through this ‘advance statistics’ section.&nbsp;</p><p>&nbsp;&nbsp;<strong>7. Machine Learning</strong>&nbsp;</p><p>The final part of the program and what every section has been leading up to is deep learning. Being able to employ machine and deep learning in their work is what often separates a data&nbsp;<em>scientist&nbsp;</em>from a data&nbsp;<em>analyst.&nbsp;</em>This section covers all common machine learning techniques and deep learning methods with TensorFlow.&nbsp;</p><p><strong>Why learn it?</strong>&nbsp;&nbsp;</p><p>Machine learning is everywhere. Companies like Facebook, Google, and Amazon have been using machines that can learn on their own for years. Now is the time for&nbsp;<em>you</em>&nbsp;to control the machines.&nbsp;</p><p><strong>**What you get**:</strong></p><ul><li>A $1250 data science training program&nbsp;&nbsp;</li><li>Active Q&amp;A support&nbsp;</li><li>All the knowledge to get hired as a data scientist&nbsp;</li><li>A community of data science learners&nbsp;</li><li>A certificate of completion&nbsp;&nbsp;</li><li>Access to future updates&nbsp;</li><li>Solve real-life business cases that will get you the job&nbsp;&nbsp;</li></ul><p><strong>You will become a data scientist from scratch</strong>&nbsp;&nbsp;We are happy to offer an unconditional 30-day money back in full guarantee. No risk for you. The content of the course is excellent, and this is a no-brainer for us, as we are certain you will love it.</p>',4,'http://res.cloudinary.com/ddwapzxdc/image/upload/v1718612298/CourseImage/rhk5djw1hsivyhog9j7o.webp','2023-09-07 00:00:00','2024-12-27 00:00:00','IT4442'),(8,'Học máy (Machine learning) và ứng dụng','science','<h2>Mô tả</h2><p>Học máy (Machine learning) đang ngày càng trở nên phổ biến và được ứng dụng rộng rãi. Chúng được sử dụng trong các hệ thống máy tính của Google, Facebook, ứng dụng trong nhận diện khuôn mặt, nhận diện chữ viết, xe tự lái,...</p><p>Trong khóa học này, chúng ta sẽ cùng tìm hiểu về các thuật toán Machine learning cơ bản để xem làm thế nào để dạy máy tính học từ số liệu có sẵn.</p><p>Các thuật&nbsp;toán và hướng dẫn thực hành được trình bày gồm:</p><p><br></p><p><br></p><p><br></p><p><br></p><ul><li>Mô hình hồi quy tuyến tính</li><li>Mô hình hồi quy Logistic</li><li>Mô hình cây quyết định</li><li>Mô hình k-NN</li><li>Mô hình học không giám sát (Phân cụm thứ bậc, phân cụm K-means)</li><li>Phương pháp xây dựng và kiểm định mô hình</li><li>Các thuật toán khác sẽ được cập nhật trong thời gian tới.</li></ul><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><h2>Đối tượng của khóa học này:</h2><ul><li>Sinh viên có xu hướng về khoa học máy tính, khoa học dữ liệu, phân tích kinh doanh</li><li>Bất cứ ai muốn tìm hiểu về các thuật toán học máy (Machine learning) và cách mà máy tính học từ dữ liệu</li></ul>',4,'https://res.cloudinary.com/ddwapzxdc/image/upload/v1712303889/CourseImage/fyeii53gaxhcmdvbmjvs.jpg','2023-11-01 00:00:00','2024-03-05 00:00:00','IT5567'),(10,'100 Days of Code: The Complete Python Pro Bootcamp for 2023','','<p>100 Days of Code: The Complete Python Pro Bootcamp for 2023.</p><p>Welcome to the 100 Days of Code - The Complete Python Pro Bootcamp,<strong>&nbsp;the only course you need</strong>&nbsp;to learn to code with Python. With over 500,000&nbsp;<strong>5 STAR reviews</strong>&nbsp;and a 4.8 average, my courses are some of the HIGHEST&nbsp;RATED courses in the history of Udemy!&nbsp;&nbsp;</p>',4,'https://res.cloudinary.com/ddwapzxdc/image/upload/v1712303857/CourseImage/ktisjm9j8ke0toigftxt.jpg','2023-10-01 00:00:00','2023-12-14 00:00:00','PY1212'),(25,'Python Object Oriented Programming (OOP): Beginner to Pro',NULL,'<h2>Yêu cầu:</h2><ul><li>A computer (Windows/Mac/Linux). That\'s all!</li><li><br></li><li>Prepare to write thousands of lines of Python code</li><li><br></li><li>No prior knowledge of python is required</li></ul><h2>Mô tả:</h2><p>Welcome to the&nbsp;<strong>best resource</strong>&nbsp;online and the&nbsp;<strong>only one you need</strong>&nbsp;to learn and&nbsp;<strong>master object-oriented programming with modern python</strong>!</p><p>There has never been a better time to learn python. It is consistently ranked in the&nbsp;<strong>top 3 most in-demand and most-loved programming languages</strong>&nbsp;in the world, with applications in machine learning, web development, data science, automation, game development, and much more. And its growth shows no signs of stopping.</p><p>But while there are plenty of resources to learn the basics of python, it is quite difficult to move past those to the intermediate and advanced facets of the language. This course seeks to address that.</p><p>Over more than 20 hours of detailed lectures, live coding, and guided projects we will&nbsp;<strong>unpack everything that python has to offer, starting from absolute scratch</strong>. We will master not only object-oriented python and how to use it, but in the process also gain an understanding of the python data model and the essence of writing pythonic code.</p><p>Every five to ten lectures we will&nbsp;<strong>stop and practice</strong>&nbsp;what we have covered, as we work through a list of detailed requirements and convert that to an object-oriented solution using nothing by&nbsp;<strong>zero-dependencies, pure python</strong>.</p><p><strong>––––– Structure &amp; Curriculum –––––</strong></p><p>The curriculum is organized around three parts of&nbsp;<strong>increasing target proficiency</strong>.</p><p>In the first, we will cover the&nbsp;<strong>essential foundations&nbsp;</strong>of working with classes in python, defining our own types, customizing them using dunders, exposing managed attributes through properties and effectively using inheritance.</p><p>· Classes</p><p>· Dunders</p><p>· Properties</p><p>· Inheritance</p><p>Having established that core foundation, in the next five sections, we will dive into more advanced topics that effective python developers rely on. These include&nbsp;<strong>modern features</strong>&nbsp;like dataclasses, enumerations and slots but also more established,&nbsp;<strong>pivotal constructs&nbsp;</strong>like descriptors and exceptions.</p><p>· Slots</p><p>· Dataclasses</p><p>· Descriptors</p><p>· Enumerations</p><p>· Exceptions</p><p>Then in the final four sections we will&nbsp;<strong>take a look under the hood&nbsp;</strong>at how python recognizes and works with types. We will explore, practice and implement several patterns including duck typing, dynamic protocols and abstract base classes. Finally, we will look at the i<strong>nternal machinery that produces classes</strong>&nbsp;in python, as we turn our attention to class metaprogramming.</p><p>· Dynamic Protocols</p><p>· Abstract Base Classes</p><p>· Multiple Inheritance</p><p>· Class Metaprogramming</p><p>This course is intended for anyone who is&nbsp;<strong>committed to mastering object-oriented programming with python</strong>, regardless of prior experience, which is why a&nbsp;<strong>full-length bonus introduction to the python programming language is included</strong>&nbsp;to get anyone up and running writing pythonic code in no time.</p><p>I hope you commit to joining me in this journey as we take your python to the next level.&nbsp;<strong>See you inside!.</strong></p><h2>Đối tượng của khóa học này:</h2><ul><li>Everyone interested in learning and mastering object-oriented python from the ground up</li><li>Learners with some Python experience who want to take their skill to the next level</li><li>Python developers who want to gain a deeper understanding</li></ul>',4,'https://res.cloudinary.com/ddwapzxdc/image/upload/v1712304048/CourseImage/quqiul0adygeioq30tll.jpg','2024-01-02 00:00:00','2024-02-22 00:00:00','OP1231'),(92,'Môn học Cơ sở dữ liệu',NULL,'<p>Môn học MySQL là một môn học quan trọng trong lĩnh vực công nghệ thông tin và phát triển phần mềm. MySQL là một hệ quản trị cơ sở dữ liệu (DBMS) mã nguồn mở và phổ biến, được sử dụng rộng rãi trong các ứng dụng web và các hệ thống quản lý thông tin.</p><p>Trong môn học MySQL, bạn sẽ được học về:</p><ul><li>Các khái niệm cơ bản về cơ sở dữ liệu và DBMS:</li><li class=\"ql-indent-1\">Các loại cơ sở dữ liệu (quan hệ, NoSQL, ...)</li><li class=\"ql-indent-1\">Các thành phần chính của một DBMS</li><li class=\"ql-indent-1\">Khái niệm về bảng, cột, hàng, khóa chính, khóa ngoại, v.v.</li><li>Ngôn ngữ truy vấn SQL:</li><li>Các câu lệnh SQL cơ bản như SELECT, INSERT, UPDATE, DELETE</li><li class=\"ql-indent-1\">Các công cụ và phần mềm để tương tác với MySQL</li><li class=\"ql-indent-1\">Viết các truy vấn SQL phức tạp hơn với JOIN, GROUP BY, ORDER BY, v.v.</li><li>Thiết kế và quản lý cơ sở dữ liệu MySQL:</li><li class=\"ql-indent-1\">Cách thiết kế một cơ sở dữ liệu có cấu trúc hợp lý</li><li class=\"ql-indent-1\">Quản lý người dùng, quyền truy cập, backup và restore dữ liệu</li><li class=\"ql-indent-1\">Tối ưu hóa hiệu suất của cơ sở dữ liệu</li><li>Ứng dụng MySQL trong phát triển ứng dụng:</li><li class=\"ql-indent-1\">Kết nối ứng dụng với cơ sở dữ liệu MySQL</li><li class=\"ql-indent-1\">Sử dụng MySQL trong các ngôn ngữ lập trình như PHP, Python, Java, v.v.</li><li class=\"ql-indent-1\">Các mô hình thiết kế ứng dụng web sử dụng MySQL</li></ul><p>Môn học MySQL sẽ cung cấp cho bạn những kiến thức và kỹ năng cần thiết để làm việc với cơ sở dữ liệu MySQL, từ việc thiết kế, quản lý đến tích hợp vào các ứng dụng phần mềm. Nó là một phần quan trọng trong chương trình đào tạo về công nghệ thông tin và phát triển phần mềm.</p>',4,'http://res.cloudinary.com/ddwapzxdc/image/upload/v1718606473/CourseImage/t849onrdloqez1gfdjgw.jpg',NULL,NULL,'IT9669');
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents`
--

DROP TABLE IF EXISTS `documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documents` (
  `DocumentId` int NOT NULL AUTO_INCREMENT,
  `DocumentName` varchar(100) DEFAULT NULL,
  `ChapterId` int NOT NULL,
  `DocumentUrl` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`DocumentId`),
  KEY `ChapterId_idx` (`ChapterId`),
  CONSTRAINT `FK_Documents_ChapterId` FOREIGN KEY (`ChapterId`) REFERENCES `chapters` (`ChapterId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents`
--

LOCK TABLES `documents` WRITE;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
INSERT INTO `documents` VALUES (4,'Application Guidelines',241,'http://res.cloudinary.com/ddwapzxdc/raw/upload/v1701165833/CourseDocument/zolkyojoejtglxmuzvem.pdf'),(8,'Lab5_TH_Mang',241,'http://res.cloudinary.com/ddwapzxdc/raw/upload/v1701167063/CourseDocument/zs0ibg2cqt8ibmekgfpz.docx'),(12,'CTD_BT1',241,'http://res.cloudinary.com/ddwapzxdc/raw/upload/v1701710713/CourseDocument/oh05vgxy8leyuqqqxtuf.docx'),(15,'mau_đon_hoc_bong_trao_đoi_21.0k',283,'http://res.cloudinary.com/ddwapzxdc/raw/upload/v1718619290/CourseDocument/noxolbazr3vu0oepmrcl.docx'),(20,'mau_đon_hoc_bong_trao_đoi_21.0k',201,'http://res.cloudinary.com/ddwapzxdc/raw/upload/v1718619526/CourseDocument/lpnetul9ylk19uevpwjt.docx'),(21,'Do_an_tot_nghiep_Ung_dung',201,'http://res.cloudinary.com/ddwapzxdc/raw/upload/v1718619540/CourseDocument/f29tndvxowzjcqqptvvw.pdf'),(22,'Book1',202,'http://res.cloudinary.com/ddwapzxdc/raw/upload/v1719105935/CourseDocument/d7gypzvuy4aiy8zqg2jo.xlsx'),(23,'jp',283,'http://res.cloudinary.com/ddwapzxdc/raw/upload/v1719106804/CourseDocument/k8kc7cceqxtrl2qetgw3.jpeg');
/*!40000 ALTER TABLE `documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `examclasses`
--

DROP TABLE IF EXISTS `examclasses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `examclasses` (
  `ExamClassId` varchar(36) NOT NULL,
  `ExamId` varchar(36) NOT NULL,
  `ClassId` varchar(36) NOT NULL,
  PRIMARY KEY (`ExamClassId`),
  KEY `Fk_ExamId_ExamClasses_idx` (`ExamId`),
  KEY `Fk_ClassId_ExamClasses_idx` (`ClassId`),
  CONSTRAINT `Fk_ClassId_ExamClasses` FOREIGN KEY (`ClassId`) REFERENCES `classes` (`ClassId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Fk_ExamId_ExamClasses` FOREIGN KEY (`ExamId`) REFERENCES `exams` (`ExamId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `examclasses`
--

LOCK TABLES `examclasses` WRITE;
/*!40000 ALTER TABLE `examclasses` DISABLE KEYS */;
INSERT INTO `examclasses` VALUES ('105e15a2-fdd8-4a69-8d8f-4485d06029e0','dc781d3e-0126-4dec-9d47-b03e26221e5e','8c49d541-dbbd-413c-9eff-efc86da56f7f'),('aa2cd059-b55d-4645-89d0-6abc7125949b','0cde0138-6165-4cd7-99ac-846e2f1f91d2','b7ee6573-04db-435b-b1c2-eaa45b33be7b');
/*!40000 ALTER TABLE `examclasses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `examquestions`
--

DROP TABLE IF EXISTS `examquestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `examquestions` (
  `ExamQuestionId` varchar(36) NOT NULL,
  `ExamId` varchar(36) NOT NULL,
  `QuestionId` varchar(36) NOT NULL,
  PRIMARY KEY (`ExamQuestionId`),
  KEY `Fk_ExamId_ExamQuestions_idx` (`ExamId`),
  KEY `Fk_QuestionId_ExamQuestions_idx` (`QuestionId`),
  CONSTRAINT `Fk_ExamId_ExamQuestions` FOREIGN KEY (`ExamId`) REFERENCES `exams` (`ExamId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Fk_QuestionId_ExamQuestions` FOREIGN KEY (`QuestionId`) REFERENCES `questions` (`QuestionId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `examquestions`
--

LOCK TABLES `examquestions` WRITE;
/*!40000 ALTER TABLE `examquestions` DISABLE KEYS */;
INSERT INTO `examquestions` VALUES ('2a2b2b66-674e-4f10-b1b4-54f568b8eca4','0cde0138-6165-4cd7-99ac-846e2f1f91d2','3791f07e-2c73-4a9f-b68b-25c91f6befa6'),('2ad5714b-eb59-4894-8d7a-76dbc1b79a71','dc781d3e-0126-4dec-9d47-b03e26221e5e','4e6bfebd-8241-483f-b988-687508809170'),('2d1fe65c-d0c2-476d-b83c-ebcdfc386fab','dc781d3e-0126-4dec-9d47-b03e26221e5e','3791f07e-2c73-4a9f-b68b-25c91f6befa6'),('78341fb2-ebfc-47be-ac53-78c1a977ea75','0cde0138-6165-4cd7-99ac-846e2f1f91d2','5ca6041b-91f0-4338-b5fa-bcdab2b816db'),('7d32bbc3-db16-445c-b8a1-cb5901f1d3b2','0cde0138-6165-4cd7-99ac-846e2f1f91d2','4e6bfebd-8241-483f-b988-687508809170'),('839d67d2-ed52-4db5-9a37-53ee591f3eb4','0cde0138-6165-4cd7-99ac-846e2f1f91d2','207f1bf9-ccaa-4e80-b64e-c3a62cae9d00'),('8f067fe1-8406-4455-85e2-62b967129e36','dc781d3e-0126-4dec-9d47-b03e26221e5e','2d2a6766-6c1a-47a3-b602-f38c63bdb3d8'),('9d3c1b26-1f9f-4c31-82ef-1f7ac2827f34','0cde0138-6165-4cd7-99ac-846e2f1f91d2','361d3179-565f-45e4-975b-bdce39e543bd'),('bfc9c0c5-8bf8-452e-84de-527aad09386e','0cde0138-6165-4cd7-99ac-846e2f1f91d2','fa28d027-e207-4133-86ae-68c81018614a'),('bff5b12b-0546-4c88-992b-72f8130e0c36','dc781d3e-0126-4dec-9d47-b03e26221e5e','b035e234-a538-4681-95fb-92062567c0e1'),('cbd739a4-aa81-4344-b602-4b210199a375','0cde0138-6165-4cd7-99ac-846e2f1f91d2','b7721e0c-7c34-4b7f-ab0d-5ab97fcca853'),('e79f93ce-31e3-4a6b-b64a-4675e7a3c1bc','0cde0138-6165-4cd7-99ac-846e2f1f91d2','92279a47-ef9e-481d-84b2-d79e50a5ed46'),('e930b0c0-3e45-4945-b2e7-67590eeb73cc','0cde0138-6165-4cd7-99ac-846e2f1f91d2','2d2a6766-6c1a-47a3-b602-f38c63bdb3d8'),('f04ee38e-116d-4038-947f-8c5ff616fe18','0cde0138-6165-4cd7-99ac-846e2f1f91d2','ba112533-d049-4532-90df-1749230e74c6'),('f6b2f491-2668-4ee2-8513-39fdcdac7cbc','dc781d3e-0126-4dec-9d47-b03e26221e5e','207f1bf9-ccaa-4e80-b64e-c3a62cae9d00');
/*!40000 ALTER TABLE `examquestions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exams`
--

DROP TABLE IF EXISTS `exams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exams` (
  `ExamId` varchar(36) NOT NULL,
  `CourseId` int NOT NULL,
  `ExamTitle` varchar(1000) NOT NULL,
  `ExamDescription` varchar(10000) DEFAULT NULL,
  `TimeStart` datetime NOT NULL,
  `TimeLimit` int NOT NULL,
  `Status` int DEFAULT NULL,
  `AccessCode` varchar(45) DEFAULT NULL,
  `ConfirmAccess` tinyint NOT NULL,
  `LastModificationTime` datetime DEFAULT NULL,
  `CreatorUserId` int DEFAULT NULL,
  `LastModifierUserId` int DEFAULT NULL,
  `IsDeleted` tinyint DEFAULT NULL,
  `DeleterUserId` int DEFAULT NULL,
  PRIMARY KEY (`ExamId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exams`
--

LOCK TABLES `exams` WRITE;
/*!40000 ALTER TABLE `exams` DISABLE KEYS */;
INSERT INTO `exams` VALUES ('0cde0138-6165-4cd7-99ac-846e2f1f91d2',7,'Bài thi cuối kỳ','Bài thi cuối kỳ','2024-06-26 10:40:33',20,NULL,'',0,NULL,NULL,NULL,0,NULL),('dc781d3e-0126-4dec-9d47-b03e26221e5e',7,'Bài thi giữa kỳ','Bài thi giữa kỳ','2024-06-26 16:50:43',30,NULL,'',0,NULL,NULL,NULL,0,NULL);
/*!40000 ALTER TABLE `exams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `images` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `url` varchar(10000) DEFAULT NULL,
  `public_id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES (1,NULL,NULL,'http://res.cloudinary.com/ddwapzxdc/video/upload/v1699174891/CourseVideo/qulstxli3t6rsopnkfcc.mp4',NULL),(2,NULL,NULL,'http://res.cloudinary.com/ddwapzxdc/video/upload/v1699263268/CourseVideo/qcch7g9m59tbanhg8bq0.mp4',NULL),(3,NULL,NULL,'http://res.cloudinary.com/ddwapzxdc/video/upload/v1699532034/CourseVideo/yibbrsasfohtztctpj8n.mp4',NULL),(4,NULL,NULL,'http://res.cloudinary.com/ddwapzxdc/video/upload/v1699538076/CourseVideo/ma7oktzehweqtt9fexxr.mp4',NULL),(5,NULL,NULL,'http://res.cloudinary.com/ddwapzxdc/video/upload/v1699539565/CourseVideo/hsoykfffbluemoujatxx.mp4',NULL),(6,NULL,NULL,'http://res.cloudinary.com/ddwapzxdc/video/upload/v1699539674/CourseVideo/qbfyh4biiybci3e6aasa.mp4',NULL);
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lessons`
--

DROP TABLE IF EXISTS `lessons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lessons` (
  `LessonId` varchar(36) NOT NULL,
  `LessonTitle` varchar(45) NOT NULL,
  `LessonDesc` varchar(10000) DEFAULT NULL,
  `LessonVideo` varchar(1000) DEFAULT NULL,
  `LessonPosition` int DEFAULT NULL,
  `CreateAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `ChapterId` int NOT NULL,
  PRIMARY KEY (`LessonId`),
  KEY `ChapterId_idx` (`ChapterId`),
  CONSTRAINT `ChapterId` FOREIGN KEY (`ChapterId`) REFERENCES `chapters` (`ChapterId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lessons`
--

LOCK TABLES `lessons` WRITE;
/*!40000 ALTER TABLE `lessons` DISABLE KEYS */;
INSERT INTO `lessons` VALUES ('a2f751b3-eb69-4106-ac5d-fe674d427f28','Bài học 2',NULL,NULL,2,'2024-06-26 09:46:32',201),('b50ba34b-ab51-4224-8c5f-853055fa3937','Bài học 1',NULL,'http://res.cloudinary.com/ddwapzxdc/video/upload/v1719370104/CourseVideo/pgz3pcgob9k5voxsaczp.mp4',1,'2024-06-26 09:46:23',201);
/*!40000 ALTER TABLE `lessons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questions` (
  `QuestionId` varchar(36) NOT NULL,
  `ChapterId` int NOT NULL,
  `CourseId` int NOT NULL,
  `QuestionContent` varchar(1000) NOT NULL,
  `QuestionImg` varchar(1000) DEFAULT NULL,
  `QuestionType` varchar(45) NOT NULL,
  `QuestionAnswer` varchar(255) DEFAULT NULL,
  `QuestionOptions` json DEFAULT NULL,
  `DeleterUserId` int DEFAULT NULL,
  `DeletionTime` datetime DEFAULT NULL,
  `LastModificationTime` datetime DEFAULT NULL,
  `LastModifierUserId` int DEFAULT NULL,
  `CreatorUserId` int DEFAULT NULL,
  `IsDeleted` tinyint NOT NULL,
  PRIMARY KEY (`QuestionId`),
  KEY `Fk_CourseId_Questions_idx` (`CourseId`),
  KEY `FkChapterId_Questions_idx` (`ChapterId`),
  CONSTRAINT `Fk_ChapterId_Questions` FOREIGN KEY (`ChapterId`) REFERENCES `chapters` (`ChapterId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Fk_CourseId_Questions` FOREIGN KEY (`CourseId`) REFERENCES `courses` (`CourseId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES ('04cc69e8-39cc-4778-92b7-6553b74f2cad',270,6,'2',NULL,'Single Choice','','[{\"id\": 1, \"isAnswer\": true, \"optionImg\": \"\", \"optionTitle\": \"2\"}, {\"id\": 2, \"isAnswer\": false, \"optionImg\": \"\", \"optionTitle\": \"3\"}, {\"id\": 3, \"isAnswer\": false, \"optionImg\": \"\", \"optionTitle\": \"4\"}, {\"id\": 4, \"isAnswer\": false, \"optionImg\": \"\", \"optionTitle\": \"1\"}]',NULL,NULL,'2024-04-19 14:23:58',NULL,NULL,0),('14c97994-74ce-4053-b970-55cbabd5b297',204,7,'Câu hỏi Python',NULL,'Single Choice','','[{\"id\": 1, \"isAnswer\": true, \"optionImg\": \"https://res.cloudinary.com/ddwapzxdc/image/upload/v1711971387/BankQuestion/k29ro880fz7qok9bqhmq.png\", \"optionTitle\": \"Câu 2\"}, {\"id\": 2, \"isAnswer\": false, \"optionImg\": \"https://res.cloudinary.com/ddwapzxdc/image/upload/v1711971430/BankQuestion/y8g89rad4reocwcsjqgr.png\", \"optionTitle\": \"Xin chào\"}]',NULL,NULL,'2023-10-29 14:25:26',NULL,NULL,0),('169d0019-f6ed-47a2-bf4c-1e967c0e32e6',270,6,'1',NULL,'Single Choice','','[{\"id\": 1, \"isAnswer\": false, \"optionImg\": \"\", \"optionTitle\": \"2\"}, {\"id\": 2, \"isAnswer\": false, \"optionImg\": \"\", \"optionTitle\": \"3\"}, {\"id\": 3, \"isAnswer\": true, \"optionImg\": \"\", \"optionTitle\": \"1\"}]',NULL,NULL,'2024-04-19 14:23:58',NULL,NULL,0),('207f1bf9-ccaa-4e80-b64e-c3a62cae9d00',201,7,'Kỹ thuật nào được sử dụng để giảm số lượng tính năng trong một bộ dữ liệu?',NULL,'Multiple Choice','','[{\"id\": 1, \"isAnswer\": true, \"optionImg\": \"\", \"optionTitle\": \"Giảm kích thước\"}, {\"id\": 2, \"isAnswer\": false, \"optionImg\": \"\", \"optionTitle\": \"Trích xuất tính năng\"}, {\"id\": 3, \"isAnswer\": true, \"optionImg\": \"\", \"optionTitle\": \" Lựa chọn tính năng\"}, {\"id\": 4, \"isAnswer\": false, \"optionImg\": \"\", \"optionTitle\": \"Xử lý ngoại lệ\"}]',NULL,NULL,'2024-04-10 17:11:45',NULL,NULL,0),('2d2a6766-6c1a-47a3-b602-f38c63bdb3d8',201,7,'Đâu là ngôn ngữ lập trình phổ biến được sử dụng trong Data Science?',NULL,'Multiple Choice','','[{\"id\": 1, \"isAnswer\": true, \"optionImg\": \"\", \"optionTitle\": \"Python\"}, {\"id\": 2, \"isAnswer\": true, \"optionImg\": \"\", \"optionTitle\": \"R\"}, {\"id\": 3, \"isAnswer\": false, \"optionImg\": \"\", \"optionTitle\": \"Java\"}, {\"id\": 4, \"isAnswer\": false, \"optionImg\": \"\", \"optionTitle\": \" C++\"}]',NULL,NULL,'2024-04-05 08:58:33',NULL,NULL,0),('361d3179-565f-45e4-975b-bdce39e543bd',201,7,'Công cụ nào được sử dụng để xử lý dữ liệu thiếu và nhiễu?',NULL,'Multiple Choice','','[{\"id\": 1, \"isAnswer\": true, \"optionImg\": \"\", \"optionTitle\": \"Làm sạch dữ liệu\"}, {\"id\": 2, \"isAnswer\": true, \"optionImg\": \"\", \"optionTitle\": \"Biến đổi dữ liệu\"}, {\"id\": 3, \"isAnswer\": false, \"optionImg\": \"\", \"optionTitle\": \" Phân tích dữ liệu\"}, {\"id\": 4, \"isAnswer\": false, \"optionImg\": \"\", \"optionTitle\": \" Trực quan hóa dữ liệu\"}]',NULL,NULL,'2024-04-10 17:11:45',NULL,NULL,0),('3791f07e-2c73-4a9f-b68b-25c91f6befa6',201,7,'Kỹ năng nào sau đây là quan trọng nhất cho một Data Scientist?',NULL,'Single Choice','','[{\"id\": 1, \"isAnswer\": true, \"optionImg\": \"\", \"optionTitle\": \" Lập trình\"}, {\"id\": 2, \"isAnswer\": false, \"optionImg\": \"\", \"optionTitle\": \"Toán học\"}, {\"id\": 3, \"isAnswer\": false, \"optionImg\": \"\", \"optionTitle\": \"Kiến thức về lĩnh vực doanh nghiệp\"}, {\"id\": 4, \"isAnswer\": false, \"optionImg\": \"\", \"optionTitle\": \"Khả năng trực quan hóa dữ liệu\"}, {\"id\": 5, \"isAnswer\": false, \"optionImg\": \"\", \"optionTitle\": \"Tin học\"}]',NULL,NULL,'2024-04-07 15:43:46',NULL,NULL,0),('4e6bfebd-8241-483f-b988-687508809170',201,7,'Thuật toán nào được sử dụng để huấn luyện một mô hình học máy có giám sát?',NULL,'Single Choice','','[{\"id\": 1, \"isAnswer\": true, \"optionImg\": \"\", \"optionTitle\": \"Hồi quy tuyến tính\"}, {\"id\": 2, \"isAnswer\": false, \"optionImg\": \"\", \"optionTitle\": \"Phân cụm\"}, {\"id\": 3, \"isAnswer\": false, \"optionImg\": \"\", \"optionTitle\": \"Học tăng cường\"}]',NULL,NULL,'2024-04-10 17:11:45',NULL,NULL,0),('5ca6041b-91f0-4338-b5fa-bcdab2b816db',201,7,'Critical Review and In-depth Study of Predictive Models',NULL,'Single Choice','','[{\"id\": 1, \"isAnswer\": false, \"optionImg\": \"\", \"optionTitle\": \"4\"}, {\"id\": 2, \"isAnswer\": true, \"optionImg\": \"\", \"optionTitle\": \"5\"}, {\"id\": 3, \"isAnswer\": false, \"optionImg\": \"\", \"optionTitle\": \"6\"}, {\"id\": 4, \"isAnswer\": false, \"optionImg\": \"\", \"optionTitle\": \"7\"}]',NULL,NULL,'2024-04-05 08:58:33',NULL,NULL,0),('728251ef-8801-4763-9fed-70d556cb6c3e',203,7,'Chương 3',NULL,'Multiple Choice','','[{\"id\": 1, \"isAnswer\": true, \"optionImg\": \"\", \"optionTitle\": \"1\"}, {\"id\": 2, \"isAnswer\": true, \"optionTitle\": \"2\"}, {\"id\": 3, \"isAnswer\": false, \"optionTitle\": \"3\"}]',NULL,NULL,'2023-10-19 14:25:26',NULL,NULL,0),('8d10c248-e3b3-4b80-829a-4ba8bdb8522b',208,7,'2',NULL,'Single Choice','','[{\"id\": 1, \"isAnswer\": true, \"optionImg\": \"\", \"optionTitle\": \"2\"}, {\"id\": 2, \"isAnswer\": false, \"optionImg\": \"\", \"optionTitle\": \"1\"}]',NULL,NULL,'2024-06-26 09:34:17',NULL,NULL,0),('92279a47-ef9e-481d-84b2-d79e50a5ed46',203,7,'Xác thực 2 yếu tố (two-factor authentication) trên Facebook là gì?',NULL,'Single Choice','','[{\"id\": 1, \"isAnswer\": false, \"optionImg\": \"\", \"optionTitle\": \"Sau khi điền mật khẩu, người dùng nhập thêm mã bảo mật để truy cập Facebook\"}, {\"id\": 2, \"isAnswer\": true, \"optionTitle\": \"\\nXác thực bằng cách nhập mật khẩu hai lần\"}, {\"id\": 3, \"isAnswer\": false, \"optionTitle\": \"Người dùng xác thực bằng một tài khoản Facebook khác\"}]',NULL,NULL,'2023-10-19 14:25:26',NULL,NULL,0),('b035e234-a538-4681-95fb-92062567c0e1',201,7,'Kỹ thuật học máy nào được sử dụng để phân loại các điểm dữ liệu vào các nhóm được xác định trước?',NULL,'Multiple Choice','','[{\"id\": 1, \"isAnswer\": false, \"optionImg\": \"\", \"optionTitle\": \"Hồi quy tuyến tính\"}, {\"id\": 2, \"isAnswer\": false, \"optionImg\": \"\", \"optionTitle\": \"Phân cụm\"}, {\"id\": 3, \"isAnswer\": true, \"optionImg\": \"\", \"optionTitle\": \"Cây quyết định\"}, {\"id\": 4, \"isAnswer\": true, \"optionImg\": \"\", \"optionTitle\": \"Mạng nơ-ron\"}]',NULL,NULL,'2024-04-10 17:11:45',NULL,NULL,0),('b7721e0c-7c34-4b7f-ab0d-5ab97fcca853',201,7,'Data Science bao gồm các khía cạnh nào sau đây?',NULL,'Single Choice','','[{\"id\": 1, \"isAnswer\": false, \"optionImg\": \"\", \"optionTitle\": \"Xử lý dữ liệu\"}, {\"id\": 2, \"isAnswer\": false, \"optionImg\": \"\", \"optionTitle\": \" Phân tích dữ liệu\"}, {\"id\": 3, \"isAnswer\": false, \"optionImg\": \"\", \"optionTitle\": \"Trực quan hóa dữ liệu\"}, {\"id\": 4, \"isAnswer\": true, \"optionImg\": \"\", \"optionTitle\": \"Tất cả các phương án trên\"}]',NULL,NULL,'2024-04-05 08:58:33',NULL,NULL,0),('ba112533-d049-4532-90df-1749230e74c6',202,7,'Test','https://res.cloudinary.com/ddwapzxdc/image/upload/v1712897037/BankQuestion/fdeqtuz5mvppiv93bgch.jpg','Multiple Choice','','[{\"id\": 1, \"isAnswer\": true, \"optionImg\": \"\", \"optionTitle\": \"1\"}, {\"id\": 2, \"isAnswer\": false, \"optionImg\": \"\", \"optionTitle\": \"2\"}, {\"id\": 3, \"isAnswer\": true, \"optionImg\": \"\", \"optionTitle\": \"3\"}]',NULL,NULL,'2024-04-12 11:45:26',NULL,NULL,0),('d1f08a03-9208-489c-b3bb-81fa0e37687a',201,7,'CRISP-DM là viết tắt của gì?','https://res.cloudinary.com/ddwapzxdc/image/upload/v1712282196/BankQuestion/docuf5gvllihrh0ciu5t.jpg','Single Choice','','[{\"id\": 1, \"isAnswer\": true, \"optionImg\": \"\", \"optionTitle\": \"Cross-Industry Standard Process for Data Mining\"}, {\"id\": 2, \"isAnswer\": false, \"optionImg\": \"\", \"optionTitle\": \"Comprehensive Research and Implementation of Statistical Procedures for Data Modeling\"}, {\"id\": 3, \"isAnswer\": false, \"optionImg\": \"\", \"optionTitle\": \"Computerized Regression and Information for Statistical Prediction and Modeling\"}, {\"id\": 4, \"isAnswer\": false, \"optionImg\": \"\", \"optionTitle\": \"Critical Review and In-depth Study of Predictive Models\"}]',NULL,NULL,'2024-04-05 08:58:33',NULL,NULL,0),('fa28d027-e207-4133-86ae-68c81018614a',203,7,'Trong phân phối chuẩn, độ lệch chuẩn biểu thị:',NULL,'Single Choice','','[{\"id\": 1, \"isAnswer\": true, \"optionImg\": \"\", \"optionTitle\": \"Mức độ phân tán của dữ liệu\"}, {\"id\": 2, \"isAnswer\": false, \"optionImg\": \"\", \"optionTitle\": \"Mức độ lệch của dữ liệu\"}, {\"id\": 3, \"isAnswer\": false, \"optionImg\": \"\", \"optionTitle\": \"Mức độ lệch của dữ liệu\"}, {\"id\": 4, \"isAnswer\": false, \"optionImg\": \"\", \"optionTitle\": \"Mức độ lệch của dữ liệu\"}]',NULL,NULL,'2024-06-26 09:38:25',NULL,NULL,0);
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resultexams`
--

DROP TABLE IF EXISTS `resultexams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resultexams` (
  `ResultExamId` varchar(36) NOT NULL,
  `UserId` varchar(36) NOT NULL,
  `ExamId` varchar(36) NOT NULL,
  `SubmissionAnswers` json NOT NULL,
  `Score` decimal(4,2) NOT NULL,
  `NumberQuestions` int NOT NULL,
  `NumberAnswers` int NOT NULL,
  `NumberCorrectAnswers` int NOT NULL,
  `SubmissionTime` datetime NOT NULL,
  PRIMARY KEY (`ResultExamId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resultexams`
--

LOCK TABLES `resultexams` WRITE;
/*!40000 ALTER TABLE `resultexams` DISABLE KEYS */;
INSERT INTO `resultexams` VALUES ('517a4c29-f817-4a96-8dc9-1f5c492135fc','12','14c379e3-c7c9-47ef-8b85-c8e618b22b42','[]',0.00,7,0,0,'2024-05-27 11:58:34'),('57f31e1e-12c4-4b36-8851-c2ea27732ae7','12','08f57da2-8182-4e59-8f94-d95ac43c41c6','[{\"answerId\": [4], \"questionId\": \"b7721e0c-7c34-4b7f-ab0d-5ab97fcca853\"}, {\"answerId\": [3, 1], \"questionId\": \"2d8b6402-134d-4438-be94-b4e2f70c7b2d\"}, {\"answerId\": [1], \"questionId\": \"d1f08a03-9208-489c-b3bb-81fa0e37687a\"}, {\"answerId\": [1], \"questionId\": \"14c97994-74ce-4053-b970-55cbabd5b297\"}, {\"answerId\": [1], \"questionId\": \"4e6bfebd-8241-483f-b988-687508809170\"}, {\"answerId\": [2], \"questionId\": \"e7037594-8e2e-4a6a-a127-23126f1e840b\"}, {\"answerId\": [1], \"questionId\": \"3791f07e-2c73-4a9f-b68b-25c91f6befa6\"}, {\"answerId\": [3, 4], \"questionId\": \"b035e234-a538-4681-95fb-92062567c0e1\"}]',10.00,8,8,8,'2024-06-02 15:33:54'),('82fb39a5-9299-404a-ac69-f702f7a21be6','12','7357c10b-c44b-43d7-953d-830cb08246a5','[{\"answerId\": [1], \"questionId\": \"92279a47-ef9e-481d-84b2-d79e50a5ed46\"}, {\"answerId\": [2], \"questionId\": \"e7037594-8e2e-4a6a-a127-23126f1e840b\"}, {\"answerId\": [1, 3], \"questionId\": \"207f1bf9-ccaa-4e80-b64e-c3a62cae9d00\"}, {\"answerId\": [3], \"questionId\": \"2d2a6766-6c1a-47a3-b602-f38c63bdb3d8\"}, {\"answerId\": [3], \"questionId\": \"3791f07e-2c73-4a9f-b68b-25c91f6befa6\"}, {\"answerId\": [2], \"questionId\": \"b035e234-a538-4681-95fb-92062567c0e1\"}, {\"answerId\": [3], \"questionId\": \"c2e40ead-b11e-4e42-896b-788e767c6ce0\"}, {\"answerId\": [2], \"questionId\": \"01c5618d-c955-4747-8122-3cb686dc4357\"}, {\"answerId\": [2], \"questionId\": \"e7efb81c-46d8-4b51-8c2a-ab3aaa7ad886\"}, {\"answerId\": [1], \"questionId\": \"361d3179-565f-45e4-975b-bdce39e543bd\"}]',4.00,10,10,4,'2024-06-20 11:38:34'),('8e965dc9-1cc0-4aee-a56f-ac9814aa0823','12','b40a933f-0dd2-4da6-b828-8c916549b89e','[{\"answerId\": [4], \"questionId\": \"207f1bf9-ccaa-4e80-b64e-c3a62cae9d00\"}, {\"answerId\": [2], \"questionId\": \"01c5618d-c955-4747-8122-3cb686dc4357\"}]',5.00,2,2,1,'2024-06-21 11:01:02'),('cbdbaee4-0818-4048-9ba7-590c3a41d9f2','12','f499d6a7-e34d-4cfb-b043-2b2fd338f7a1','[{\"answerId\": [2], \"questionId\": \"3791f07e-2c73-4a9f-b68b-25c91f6befa6\"}, {\"answerId\": [2], \"questionId\": \"361d3179-565f-45e4-975b-bdce39e543bd\"}]',0.00,2,2,0,'2024-05-27 13:42:44');
/*!40000 ALTER TABLE `resultexams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `StudentId` int NOT NULL AUTO_INCREMENT,
  `UserId` int NOT NULL,
  `StudentName` varchar(45) NOT NULL,
  `Class` varchar(45) DEFAULT NULL,
  `Faculty` varchar(45) DEFAULT NULL,
  `BirthDate` datetime DEFAULT NULL,
  `PhoneNo` varchar(45) DEFAULT NULL,
  `StudentCode` varchar(45) NOT NULL,
  `Adress` varchar(1000) DEFAULT NULL,
  `Gender` int DEFAULT NULL,
  PRIMARY KEY (`StudentId`),
  KEY `UserId_idx` (`UserId`),
  CONSTRAINT `UserId` FOREIGN KEY (`UserId`) REFERENCES `users` (`UserId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,12,'Lê Trường Lam','Việt Nhật 01-K65','Công nghệ thông tin Việt Nhật','2023-10-27 00:00:00','0373358367','20204996',NULL,NULL),(2,5,'Nguyễn Nhật Anh','Việt Nhật 01-K65','Công nghệ thông tin Việt Nhật','2023-10-27 00:00:00',NULL,'20204997',NULL,NULL);
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submissions`
--

DROP TABLE IF EXISTS `submissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `submissions` (
  `SubmissionId` varchar(36) NOT NULL,
  `AssignmentId` varchar(36) NOT NULL,
  `UserId` int NOT NULL,
  `ChapterId` int NOT NULL,
  `CourseId` int NOT NULL,
  `SubmissionDate` datetime DEFAULT NULL,
  `Score` int DEFAULT NULL,
  `Status` int DEFAULT '1',
  `SubmissionFiles` json DEFAULT NULL,
  `Review` varchar(10000) DEFAULT NULL,
  `Graded` tinyint DEFAULT NULL,
  PRIMARY KEY (`SubmissionId`),
  KEY `Fk_submitssions_CourseId_idx` (`CourseId`),
  KEY `Fk_submitssions_ChapterId_idx` (`ChapterId`),
  KEY `Fk_submitssions_StudentId_idx` (`UserId`),
  KEY `Fk_submitssions_AssignmentId_idx` (`AssignmentId`),
  CONSTRAINT `Fk_submitssions_AssignmentId` FOREIGN KEY (`AssignmentId`) REFERENCES `assignments` (`AssignmentId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Fk_submitssions_ChapterId` FOREIGN KEY (`ChapterId`) REFERENCES `chapters` (`ChapterId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Fk_submitssions_CourseId` FOREIGN KEY (`CourseId`) REFERENCES `courses` (`CourseId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Fk_submitssions_StudentId` FOREIGN KEY (`UserId`) REFERENCES `users` (`UserId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submissions`
--

LOCK TABLES `submissions` WRITE;
/*!40000 ALTER TABLE `submissions` DISABLE KEYS */;
INSERT INTO `submissions` VALUES ('2e14a387-6ec8-49be-9f49-a18edabf0213','bfbbea64-1d55-4e85-be0b-91de82b22fd8',12,201,7,'2024-06-23 14:04:37',10,1,'[{\"fileUrl\": \"http://res.cloudinary.com/ddwapzxdc/raw/upload/v1718683554/CourseAssignment/Student/jjkvbhmhphounbm2vsky.jpeg\", \"fileTitle\": \"jp\", \"assignmentFileId\": \"21cae5411adb97974a7a7da7a9bf1943\"}, {\"fileUrl\": \"http://res.cloudinary.com/ddwapzxdc/raw/upload/v1718683442/CourseAssignment/Student/gkdapl4fbedcyci9leir.docx\", \"fileTitle\": \"mau_đon_hoc_bong_trao_đoi_21.0k\", \"assignmentFileId\": \"1bf612fec2c2b662e1c8389091cafe5b\"}, {\"fileUrl\": \"http://res.cloudinary.com/ddwapzxdc/raw/upload/v1718683409/CourseAssignment/Student/k3zihw266unf8wriizdm.png\", \"fileTitle\": \"cloudinary\", \"assignmentFileId\": \"e0303ad4995570bb9fb37e86bdb6f732\"}]',NULL,1),('3965c7de-7670-4800-9cbf-5b4496be0288','f7be45fb-cbb3-4d24-9145-d2f303a11f35',12,201,7,'2024-06-19 16:56:56',NULL,1,'[{\"fileUrl\": \"http://res.cloudinary.com/ddwapzxdc/raw/upload/v1718790980/CourseAssignment/Student/sdim3xilg9egb9ucfkw3.txt\", \"fileTitle\": \"API  cần sửa\", \"assignmentFileId\": \"4ed8ba1ac93fd44f6191ecd343e324d4\"}]',NULL,NULL),('74aa6a05-4cb8-4dde-8cf9-2c79f53fd89b','1f2c3e4c-5d6e-7f8g-9h0i-1j2k3l4m5n6o',12,274,7,'2024-06-19 20:48:00',NULL,1,'[{\"fileUrl\": \"http://res.cloudinary.com/ddwapzxdc/raw/upload/v1718804875/CourseAssignment/Student/bo6m6ug2vizrlu0sbc97.jpg\", \"fileTitle\": \"overview\", \"assignmentFileId\": \"cbc942772571e472d4aca07d26e6daa2\"}]',NULL,NULL),('775623b4-4123-403e-a626-a7c65f1c506f','bfbbea64-1d55-4e85-be0b-91de82b22fd8',5,201,7,NULL,NULL,0,NULL,NULL,NULL),('883d8ebb-9e0c-42c0-b8bd-c216ec8798b9','p2q3r4s5-t6u7-v8w9-x0y1-z2a3b4c5d6e7',12,241,7,'2024-06-02 14:58:20',NULL,0,NULL,NULL,NULL),('9af8fa08-4a23-4292-8ca9-fa0cd37f8f14','a1b2c3d4-e5f6-g7h8-i9j0-k1l2m3n4o5',5,202,7,NULL,NULL,0,NULL,NULL,NULL),('edc0bc6d-da59-4b45-8257-0fcb892d5a8f','q1r2s3t4-u5v6-w7x8-y9z0-a1b2c3d4e5f6',12,270,6,'2024-06-20 10:41:42',NULL,1,NULL,NULL,NULL),('f0c255d1-4fcb-4e3c-a4a9-1514d91fc24d','p2q3r4s5-t6u7-v8w9-x0y1-z2a3b4c5d6e7',5,241,7,NULL,0,0,NULL,'<p>CHưa làm bài</p>',NULL);
/*!40000 ALTER TABLE `submissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teachers`
--

DROP TABLE IF EXISTS `teachers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teachers` (
  `TeacherId` int NOT NULL AUTO_INCREMENT,
  `UserId` int NOT NULL,
  `TeacherName` varchar(45) NOT NULL,
  `Position` varchar(45) DEFAULT NULL,
  `Faculty` varchar(45) DEFAULT NULL,
  `PhoneNo` varchar(45) DEFAULT NULL,
  `BirthDate` datetime DEFAULT NULL,
  `Address` varchar(1000) DEFAULT NULL,
  `Gender` int DEFAULT NULL,
  PRIMARY KEY (`TeacherId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teachers`
--

LOCK TABLES `teachers` WRITE;
/*!40000 ALTER TABLE `teachers` DISABLE KEYS */;
INSERT INTO `teachers` VALUES (1,6,'Teacher',NULL,NULL,NULL,'2023-10-10 00:00:00',NULL,NULL),(2,11,'Nhat Anh',NULL,NULL,NULL,'1990-04-10 00:00:00',NULL,NULL),(4,1,'Lê Trường Lam',NULL,NULL,NULL,'1982-01-10 00:00:00',NULL,NULL);
/*!40000 ALTER TABLE `teachers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `UserId` int NOT NULL AUTO_INCREMENT,
  `UserName` varchar(45) NOT NULL,
  `Email` varchar(45) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Img` varchar(255) DEFAULT NULL,
  `Role` varchar(45) DEFAULT 'student',
  PRIMARY KEY (`UserId`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Lam','Lam@gmail.com','$2a$10$r3Q/pjsPUtkOr/RtbRvGOuQryOVXCydKAMetfDYKmVcarHHVFqfLi',NULL,'teacher'),(3,'Admin','taro@gmail.com','$2a$10$Za1UmZtZeE3B9hfbF0y/Tu0Wnfg9chWNo51ChDJ0YlU4Slg7N6/IC',NULL,'admin'),(5,'20204996','Lam1@gmail.com','$2a$10$aooleWL7kdPex0.7TiA9V.G5EsTxe2VuE5eWkyff1jl1uDPgahz7C',NULL,'student'),(6,'Lam123','Truonglam@gmail.com','$2a$10$QgbFPdQgvIi9A6ti7UKT6epgaYx38ok41KJVsSwga.9ItZ7.V9QB2',NULL,'teacher'),(11,'kietmoidayh','kietmoidayh','$2a$10$MOYP5Gql/N8Xqw5QQDxatu4SV1liN4J9xC8/DWrtokXQeQcJRauLK',NULL,'student'),(12,'Lam.lt204996','lam.lt204996@sis.hust.edu.vn','$2a$10$9ptPMvrBbRb7NJqATsp/TOUUadUNG.we8mZeSpj6cbnijAR7qt8zu',NULL,'student');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-30 10:55:38
