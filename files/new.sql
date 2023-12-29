/*
SQLyog Enterprise - MySQL GUI v6.56
MySQL - 5.5.5-10.4.21-MariaDB : Database - phr
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`phr` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `phr`;

/*Table structure for table `connectdata` */

DROP TABLE IF EXISTS `connectdata`;

CREATE TABLE `connectdata` (
  `Id` int(100) NOT NULL AUTO_INCREMENT,
  `PatientName` varchar(100) DEFAULT NULL,
  `PatientAge` varchar(100) DEFAULT NULL,
  `Type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `connectdata` */

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
  `status` varchar(100) DEFAULT 'pending',
  UNIQUE KEY `slno` (`slno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `docreg` */

/*Table structure for table `patient_reg` */

DROP TABLE IF EXISTS `patient_reg`;

CREATE TABLE `patient_reg` (
  `ID` int(200) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) DEFAULT NULL,
  `Age` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Password` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `patient_reg` */

/*Table structure for table `patientreq` */

DROP TABLE IF EXISTS `patientreq`;

CREATE TABLE `patientreq` (
  `Id` int(200) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) DEFAULT NULL,
  `Type` varchar(100) DEFAULT NULL,
  `Age` varchar(100) DEFAULT NULL,
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
  `FileData` longblob DEFAULT NULL,
  `PatientEmail` varchar(200) DEFAULT NULL,
  `Status` varchar(200) DEFAULT NULL,
  `Key1` varchar(100) DEFAULT NULL,
  `Patientid` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `reports` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
