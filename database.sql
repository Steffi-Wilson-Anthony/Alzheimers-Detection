/*
SQLyog Enterprise - MySQL GUI v6.56
MySQL - 5.5.5-10.1.13-MariaDB : Database - phr
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`phr` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `phr`;

/*Table structure for table `aq` */

DROP TABLE IF EXISTS `aq`;

CREATE TABLE `aq` (
  `id` int(200) unsigned NOT NULL AUTO_INCREMENT,
  `patientemail` varchar(40) DEFAULT NULL,
  `patientmessages` text,
  `docemail` varchar(40) DEFAULT NULL,
  `docmessages` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

/*Data for the table `aq` */

insert  into `aq`(`id`,`patientemail`,`patientmessages`,`docemail`,`docmessages`) values (1,'kumar@gmail.com','empty','Ramprasad@gmail.com','Hi Kumar,What is the issue'),(2,'kumar@gmail.com','Hello sir,I am feeling pain in stomach','Ramprasad@gmail.com','empty'),(3,'kumar@gmail.com','Hello sir,I am feeling pain in stomach','Ramprasad@gmail.com','empty'),(4,'nani@gmail.com','empty','Ramprasad@gmail.com','hello nani');

/*Table structure for table `connectdata` */

DROP TABLE IF EXISTS `connectdata`;

CREATE TABLE `connectdata` (
  `Id` int(100) NOT NULL AUTO_INCREMENT,
  `PatientName` varchar(100) DEFAULT NULL,
  `PatientAge` varchar(100) DEFAULT NULL,
  `Type` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'pending',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `docreg` */

insert  into `docreg`(`slno`,`Name`,`Department`,`Age`,`Number`,`Email`,`Password`) values (1,'Ram Prasad','Cardiology','35','895647123','Ramprasad@gmail.com','12345678');

/*Table structure for table `patient_reg` */

DROP TABLE IF EXISTS `patient_reg`;

CREATE TABLE `patient_reg` (
  `ID` int(200) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) DEFAULT NULL,
  `Age` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Password` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `patient_reg` */

insert  into `patient_reg`(`ID`,`Name`,`Age`,`Email`,`Password`) values (1,'nani','58','nani@gmail.com','12345678'),(2,'kumar','58','kumar@gmail.com','123456');

/*Table structure for table `patientreq` */

DROP TABLE IF EXISTS `patientreq`;

CREATE TABLE `patientreq` (
  `Id` int(200) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) DEFAULT NULL,
  `Docname` varchar(100) DEFAULT NULL,
  `Age` varchar(100) DEFAULT NULL,
  `dept` varchar(100) DEFAULT NULL,
  `symptoms` varchar(100) DEFAULT NULL,
  `AppointmentDate` varchar(100) DEFAULT NULL,
  `Time` varchar(100) DEFAULT NULL,
  `Status` varchar(100) DEFAULT 'pending',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `patientreq` */

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `reports` */

insert  into `reports`(`Id`,`FileName`,`FileData`,`PatientEmail`,`Status`,`Key1`,`Patientid`) values (1,'hello.txt','uploadfiles/hello.txt','nani@gmail.com','accepted',NULL,'PID6030'),(2,'abc.txt','uploadfiles/abc.txt','nani@gmail.com','accepted',NULL,'PID2710');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
