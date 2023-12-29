/*
SQLyog Enterprise - MySQL GUI v6.56
MySQL - 5.5.5-10.4.28-MariaDB : Database - phr
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`phr` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `phr`;

/*Table structure for table `aq` */

DROP TABLE IF EXISTS `aq`;

CREATE TABLE `aq` (
  `id` int(200) unsigned NOT NULL AUTO_INCREMENT,
  `patientemail` varchar(40) DEFAULT NULL,
  `patientmessages` text DEFAULT NULL,
  `docemail` varchar(40) DEFAULT NULL,
  `docmessages` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `aq` */

insert  into `aq`(`id`,`patientemail`,`patientmessages`,`docemail`,`docmessages`) values (1,'kumar@gmail.com','empty','Ramprasad@gmail.com','Hi Kumar,What is the issue'),(2,'kumar@gmail.com','Hello sir,I am feeling pain in stomach','Ramprasad@gmail.com','empty'),(3,'kumar@gmail.com','Hello sir,I am feeling pain in stomach','Ramprasad@gmail.com','empty'),(4,'nani@gmail.com','empty','Ramprasad@gmail.com','hello nani'),(5,'nani@gmail.com','empty','Ramprasad@gmail.com','hello');

/*Table structure for table `aqtestdata` */

DROP TABLE IF EXISTS `aqtestdata`;

CREATE TABLE `aqtestdata` (
  `id` int(200) NOT NULL AUTO_INCREMENT,
  `m1` varchar(100) DEFAULT NULL,
  `m2` varchar(100) DEFAULT NULL,
  `m3` varchar(100) DEFAULT NULL,
  `m4` varchar(100) DEFAULT NULL,
  `m5` varchar(100) DEFAULT NULL,
  `m6` varchar(100) DEFAULT NULL,
  `o1` varchar(100) DEFAULT NULL,
  `o2` varchar(100) DEFAULT NULL,
  `o3` varchar(100) DEFAULT NULL,
  `fa1` varchar(100) DEFAULT NULL,
  `fa2` varchar(100) DEFAULT NULL,
  `fa3` varchar(100) DEFAULT NULL,
  `fa4` varchar(100) DEFAULT NULL,
  `fa5` varchar(100) DEFAULT NULL,
  `fa6` varchar(100) DEFAULT NULL,
  `fa7` varchar(100) DEFAULT NULL,
  `v1` varchar(100) DEFAULT NULL,
  `v2` varchar(100) DEFAULT NULL,
  `v3` varchar(100) DEFAULT NULL,
  `v4` varchar(100) DEFAULT NULL,
  `v5` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `aqtestdata` */

/*Table structure for table `cognitive` */

DROP TABLE IF EXISTS `cognitive`;

CREATE TABLE `cognitive` (
  `id` int(200) NOT NULL AUTO_INCREMENT,
  `Question` varchar(250) DEFAULT NULL,
  `a` varchar(200) DEFAULT NULL,
  `b` varchar(200) DEFAULT NULL,
  `c` varchar(200) DEFAULT NULL,
  `d` varchar(200) DEFAULT NULL,
  `e` varchar(200) DEFAULT NULL,
  `f` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `cognitive` */

insert  into `cognitive`(`id`,`Question`,`a`,`b`,`c`,`d`,`e`,`f`) values (1,'How many fingers in your hands ? ','3','7','10','2',NULL,NULL),(2,'How many days are in December ?','29','31','28','27',NULL,NULL),(3,'how many months are in a Calandar ?','12','10','9','11',NULL,NULL),(4,'What is the next number in the sequence 5,10,15,20,.... ?','18','25','22','21',NULL,NULL),(5,'How much is half of 100 ?','70','22','50','60',NULL,NULL),(7,'How many zeros are in number : 1203040 ?','1','5','2','3',NULL,NULL),(8,'What is the result for the expression: 10+5+2= ?','17','13','15','20',NULL,NULL),(10,'Which letter is 5th from the left end in the Given Word: BEAUTIFUL ?','A','T','U','B',NULL,NULL),(11,'You are buying $13.5 of groceries.How much change would you receive back from a $20 bill ?','$7','$12.6','$6.5','$5.6',NULL,NULL),(12,'Tick the things that are used in kitchen ?','car','Ball','Spatual','Vegetables',NULL,NULL),(13,'Choose the things that are available in Red Color ?','Banana','Apple','Mango','Grapes',NULL,NULL),(14,'How many letters are there in he English alphabet ?','34','28','26','62',NULL,NULL),(17,'What is black when you buy it ,red when you use it,and gray when you throwit away ?','Shoe','Charcoal','Belt','All the above',NULL,NULL),(18,'what goes up and down without moving ?','Balloon','Temparature','Lift','Rain',NULL,NULL),(22,'Which of the fallowing is a type of animal ?','Table','Dog','Chair','Computer',NULL,NULL),(23,'Which of the fallowing is a type of fish ?','Salmon','Tomato','Carrot','Broccoli',NULL,NULL),(25,'Fill in the blank : k,l,m,_,o,p','G','R','N','Q',NULL,NULL),(26,'How many chocolates are there in the image ?','7','5','10','3','8',NULL),(27,'What time is the clock showing ?','12:00','7:00','1:31','6:45',NULL,NULL),(29,'How many colors are ther in the rainbow ?','7','6','5','8','9',NULL),(30,'How do we spell \"WORLD\" backwards ?','LDROW','DLROW','DRLWO','ROWDL','',NULL),(31,'What is year is it ?','2019','2020','2021','2023','2024',NULL),(33,'What color is sky ?','Yellow','Green','Blue','Pink',NULL,NULL),(35,'I am an odd number.Take away a letter and become even.What number am I ?','Nine','Seven','Six','Five',NULL,NULL);

/*Table structure for table `cognitivescore` */

DROP TABLE IF EXISTS `cognitivescore`;

CREATE TABLE `cognitivescore` (
  `id` int(100) unsigned NOT NULL AUTO_INCREMENT,
  `useremail` varchar(200) DEFAULT NULL,
  `score` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `cognitivescore` */

insert  into `cognitivescore`(`id`,`useremail`,`score`) values (1,'nani@gmail.com','35');

/*Table structure for table `connectdata` */

DROP TABLE IF EXISTS `connectdata`;

CREATE TABLE `connectdata` (
  `Id` int(100) NOT NULL AUTO_INCREMENT,
  `PatientName` varchar(100) DEFAULT NULL,
  `PatientAge` varchar(100) DEFAULT NULL,
  `Type` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'pending',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `connectdata` */

insert  into `connectdata`(`Id`,`PatientName`,`PatientAge`,`Type`,`status`) values (1,'nani@gmail.com','58','Cardiology','pending');

/*Table structure for table `docreg` */

DROP TABLE IF EXISTS `docreg`;

CREATE TABLE `docreg` (
  `slno` int(100) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) DEFAULT NULL,
  `Department` varchar(100) DEFAULT NULL,
  `Age` varchar(100) DEFAULT NULL,
  `Number` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Password` varchar(100) DEFAULT NULL,
  UNIQUE KEY `slno` (`slno`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `docreg` */

insert  into `docreg`(`slno`,`Name`,`Department`,`Age`,`Number`,`Email`,`Password`) values (1,'Ram Prasad','Cardiology','35','895647123','Ramprasad@gmail.com','12345678');

/*Table structure for table `keypaper` */

DROP TABLE IF EXISTS `keypaper`;

CREATE TABLE `keypaper` (
  `id` int(200) NOT NULL AUTO_INCREMENT,
  `key` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `keypaper` */

insert  into `keypaper`(`id`,`key`) values (1,'c'),(2,'b'),(3,'a'),(4,'b'),(5,'c'),(7,'d'),(8,'a'),(10,'b'),(11,'c'),(12,'d'),(13,'b'),(14,'c'),(17,'b'),(18,'b'),(22,'b'),(23,'a'),(25,'c'),(26,'c'),(27,'c'),(29,'a'),(30,'b'),(31,'d'),(33,'c'),(35,'b');

/*Table structure for table `mykeypaper` */

DROP TABLE IF EXISTS `mykeypaper`;

CREATE TABLE `mykeypaper` (
  `id` int(200) unsigned NOT NULL AUTO_INCREMENT,
  `Qid` varchar(10) DEFAULT NULL,
  `val` varchar(10) DEFAULT NULL,
  `useremail` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `mykeypaper` */

insert  into `mykeypaper`(`id`,`Qid`,`val`,`useremail`) values (1,'2','d','nani@gmail.com'),(2,'4','d','nani@gmail.com'),(3,'5','c','nani@gmail.com'),(4,'7','c','nani@gmail.com'),(5,'8','d','nani@gmail.com'),(6,'10','c','nani@gmail.com'),(7,'11','d','nani@gmail.com'),(8,'12','a','nani@gmail.com'),(9,'14','d','nani@gmail.com'),(10,'17','b','nani@gmail.com'),(11,'18','b','nani@gmail.com'),(12,'26','c','nani@gmail.com'),(13,'29','b','nani@gmail.com'),(14,'31','a','nani@gmail.com'),(15,'33','a','nani@gmail.com'),(16,'1','c','nani@gmail.com'),(17,'2','b','nani@gmail.com'),(18,'3','a','nani@gmail.com'),(19,'7','d','nani@gmail.com'),(20,'8','a','nani@gmail.com'),(21,'11','c','nani@gmail.com'),(22,'17','b','nani@gmail.com'),(23,'18','b','nani@gmail.com'),(24,'22','b','nani@gmail.com'),(25,'27','c','nani@gmail.com'),(26,'29','a','nani@gmail.com'),(27,'30','b','nani@gmail.com'),(28,'31','d','nani@gmail.com'),(29,'33','c','nani@gmail.com'),(30,'35','b','nani@gmail.com'),(107,'1','c','nani@gmail.com'),(108,'3','b','nani@gmail.com'),(109,'4','c','nani@gmail.com'),(110,'5','b','nani@gmail.com'),(111,'11','d','nani@gmail.com'),(112,'13','b','nani@gmail.com'),(113,'14','d','nani@gmail.com'),(114,'17','b','nani@gmail.com'),(115,'18','b','nani@gmail.com'),(116,'22','c','nani@gmail.com'),(117,'25','c','nani@gmail.com'),(118,'27','c','nani@gmail.com'),(119,'30','d','nani@gmail.com'),(120,'33','b','nani@gmail.com'),(121,'35','d','nani@gmail.com'),(122,'1','c','nani@gmail.com'),(123,'3','b','nani@gmail.com'),(124,'4','c','nani@gmail.com'),(125,'5','b','nani@gmail.com'),(126,'11','d','nani@gmail.com'),(127,'13','b','nani@gmail.com'),(128,'14','d','nani@gmail.com'),(129,'17','b','nani@gmail.com'),(130,'18','b','nani@gmail.com'),(131,'22','c','nani@gmail.com'),(132,'25','c','nani@gmail.com'),(133,'27','c','nani@gmail.com'),(134,'30','d','nani@gmail.com'),(135,'33','b','nani@gmail.com'),(136,'35','d','nani@gmail.com'),(137,'1','d','nani@gmail.com'),(138,'2','c','nani@gmail.com'),(139,'3','c','nani@gmail.com'),(140,'4','d','nani@gmail.com'),(141,'5','b','nani@gmail.com'),(142,'7','d','nani@gmail.com'),(143,'8','c','nani@gmail.com'),(144,'11','b','nani@gmail.com'),(145,'17','b','nani@gmail.com'),(146,'22','d','nani@gmail.com'),(147,'23','d','nani@gmail.com'),(148,'27','c','nani@gmail.com'),(149,'29','d','nani@gmail.com'),(150,'31','d','nani@gmail.com'),(151,'33','b','nani@gmail.com');

/*Table structure for table `patient_reg` */

DROP TABLE IF EXISTS `patient_reg`;

CREATE TABLE `patient_reg` (
  `ID` int(200) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) DEFAULT NULL,
  `Age` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Password` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `patient_reg` */

insert  into `patient_reg`(`ID`,`Name`,`Age`,`Email`,`Password`) values (1,'nani','58','nani@gmail.com','12345678'),(2,'kumar','58','kumar@gmail.com','123456');

/*Table structure for table `patientreq` */

DROP TABLE IF EXISTS `patientreq`;

CREATE TABLE `patientreq` (
  `Id` int(200) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) DEFAULT NULL,
  `Patientemail` varchar(100) DEFAULT NULL,
  `Docname` varchar(100) DEFAULT NULL,
  `Age` varchar(100) DEFAULT NULL,
  `dept` varchar(100) DEFAULT NULL,
  `symptoms` varchar(100) DEFAULT NULL,
  `AppointmentDate` varchar(100) DEFAULT NULL,
  `Time` varchar(100) DEFAULT NULL,
  `Status` varchar(100) DEFAULT 'pending',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `patientreq` */

insert  into `patientreq`(`Id`,`Name`,`Patientemail`,`Docname`,`Age`,`dept`,`symptoms`,`AppointmentDate`,`Time`,`Status`) values (1,'kumar','nani@gmail.com','Ram Prasad','24','Dermatologist','Chest Pain ','06/09/2023','15:30','accepted'),(2,'nani','nani@gmail.com','Ram Prasad','24','Dermatologist','pain','06/09/2027','2:30','cancelled'),(3,'nani','nani@gmail.com','Ram Prasad','24','Dermatologist','Chest Pain ','06/09/2023','15:30','cancelled');

/*Table structure for table `reports` */

DROP TABLE IF EXISTS `reports`;

CREATE TABLE `reports` (
  `Id` int(200) NOT NULL AUTO_INCREMENT,
  `FileName` varchar(200) DEFAULT NULL,
  `FileData` varchar(200) DEFAULT NULL,
  `PatientEmail` varchar(200) DEFAULT NULL,
  `Status` varchar(200) DEFAULT NULL,
  `Key1` varchar(100) DEFAULT NULL,
  `Patientid` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `reports` */

insert  into `reports`(`Id`,`FileName`,`FileData`,`PatientEmail`,`Status`,`Key1`,`Patientid`) values (1,'hello.txt','uploadfiles/hello.txt','nani@gmail.com','accepted',NULL,'PID6030'),(2,'abc.txt','uploadfiles/abc.txt','nani@gmail.com','accepted',NULL,'PID2710');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
