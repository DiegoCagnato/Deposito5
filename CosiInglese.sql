/*
SQLyog Community v12.09 (64 bit)
MySQL - 10.4.14-MariaDB : Database - corsiinglese
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`corsiinglese` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `corsiinglese`;

/*Table structure for table `allievo` */

DROP TABLE IF EXISTS `allievo`;

CREATE TABLE `allievo` (
  `IdAllievo` char(3) NOT NULL,
  `Nome` varchar(50) NOT NULL,
  `Recapito` varchar(20) NOT NULL,
  `CorsoFrequentato` int(11) NOT NULL,
  `DataIscrizione` date NOT NULL,
  PRIMARY KEY (`IdAllievo`),
  KEY `CorsoFrequentato` (`CorsoFrequentato`),
  CONSTRAINT `allievo_ibfk_1` FOREIGN KEY (`CorsoFrequentato`) REFERENCES `corso` (`CodiceProgressivo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `allievo` */

insert  into `allievo`(`IdAllievo`,`Nome`,`Recapito`,`CorsoFrequentato`,`DataIscrizione`) values ('A01','Andrea','123',4,'2020-10-01'),('A02','Daniele','321',3,'2020-09-28'),('A03','Elena','456',2,'2020-09-03'),('A04','Denise','654',2,'2020-09-28'),('A05','Gabriele','789',1,'2020-10-02'),('A06','Stefano','987',1,'2020-10-01'),('A07','Luisa','111',5,'2020-10-03'),('A08','Giulia','222',1,'2020-09-29'),('A09','Luigi','333',2,'2020-10-08'),('A10','Gaia','444',3,'2020-09-29');

/*Table structure for table `conferenza` */

DROP TABLE IF EXISTS `conferenza`;

CREATE TABLE `conferenza` (
  `IdConferenza` char(3) NOT NULL,
  `GiornoEOra` datetime NOT NULL,
  `NomeConferenziere` varchar(50) NOT NULL,
  `Argomento` varchar(50) NOT NULL,
  PRIMARY KEY (`IdConferenza`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `conferenza` */

insert  into `conferenza`(`IdConferenza`,`GiornoEOra`,`NomeConferenziere`,`Argomento`) values ('2','2020-10-27 17:50:00','Roger','Musica Inglese'),('C01','2020-10-20 17:50:00','Gordon','Cucina Inglese');

/*Table structure for table `corso` */

DROP TABLE IF EXISTS `corso`;

CREATE TABLE `corso` (
  `IdLivello` char(3) NOT NULL,
  `CodiceProgressivo` int(11) NOT NULL AUTO_INCREMENT,
  `LibroTesto` varchar(50) DEFAULT NULL,
  `EsameFinale` char(2) NOT NULL,
  `DataAttivazione` date DEFAULT NULL,
  `NumeroIscritti` int(11) NOT NULL,
  `Insegnante` char(3) DEFAULT NULL,
  PRIMARY KEY (`CodiceProgressivo`),
  KEY `CodiceProgressivo` (`CodiceProgressivo`),
  KEY `Insegnante` (`Insegnante`),
  KEY `IdLivello` (`IdLivello`),
  CONSTRAINT `corso_ibfk_1` FOREIGN KEY (`Insegnante`) REFERENCES `insegnante` (`IdInsegnante`),
  CONSTRAINT `corso_ibfk_2` FOREIGN KEY (`IdLivello`) REFERENCES `livello` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

/*Data for the table `corso` */

insert  into `corso`(`IdLivello`,`CodiceProgressivo`,`LibroTesto`,`EsameFinale`,`DataAttivazione`,`NumeroIscritti`,`Insegnante`) values ('L01',1,'English For Beginners','No','2020-10-19',3,'I01'),('L02',2,'Intermediate English','No','2020-10-20',3,'I02'),('L03',3,'Muzy in Gondoland','Si','2020-10-26',2,'I02'),('L04',4,'AdvancedTopics','Si','2020-10-15',1,'I03'),('L05',5,'SuperEnglish','Si','2020-10-28',1,'I04');

/*Table structure for table `film` */

DROP TABLE IF EXISTS `film`;

CREATE TABLE `film` (
  `IdFilm` char(3) NOT NULL,
  `GiornoEOra` datetime NOT NULL,
  `NomeRegista` varchar(50) NOT NULL,
  PRIMARY KEY (`IdFilm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `film` */

insert  into `film`(`IdFilm`,`GiornoEOra`,`NomeRegista`) values ('F02','2020-10-23 17:30:00','Steve Spielberg'),('I01','2020-10-16 17:30:00','Dario Argento');

/*Table structure for table `insegnante` */

DROP TABLE IF EXISTS `insegnante`;

CREATE TABLE `insegnante` (
  `IdInsegnante` char(3) NOT NULL,
  `Nome` varchar(50) NOT NULL,
  `Indirizzo` varchar(50) NOT NULL,
  `Nazione` varchar(30) NOT NULL,
  PRIMARY KEY (`IdInsegnante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `insegnante` */

insert  into `insegnante`(`IdInsegnante`,`Nome`,`Indirizzo`,`Nazione`) values ('I01','Albert','Via Milano','Inghilterra'),('I02','Silvia','Via Torino','Nuova Zelanda'),('I03','Alexander','Via Trieste','Irlanda'),('I04','Sarah','Via Roma','USA');

/*Table structure for table `iscrizione` */

DROP TABLE IF EXISTS `iscrizione`;

CREATE TABLE `iscrizione` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Allievo` char(1) NOT NULL,
  `Film` char(3) DEFAULT NULL,
  `Conferenza` char(3) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Allievo` (`Allievo`),
  KEY `Attivita` (`Film`),
  KEY `Conferenza` (`Conferenza`),
  CONSTRAINT `iscrizione_ibfk_1` FOREIGN KEY (`Allievo`) REFERENCES `allievo` (`IdAllievo`),
  CONSTRAINT `iscrizione_ibfk_2` FOREIGN KEY (`Film`) REFERENCES `film` (`IdFilm`),
  CONSTRAINT `iscrizione_ibfk_3` FOREIGN KEY (`Conferenza`) REFERENCES `conferenza` (`IdConferenza`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

/*Data for the table `iscrizione` */

/*Table structure for table `lezioniprivate` */

DROP TABLE IF EXISTS `lezioniprivate`;

CREATE TABLE `lezioniprivate` (
  `IdLezioniPrivate` char(3) NOT NULL,
  `Allievo` char(3) NOT NULL,
  `Insegnante` char(3) NOT NULL,
  `Data` date NOT NULL,
  PRIMARY KEY (`IdLezioniPrivate`),
  KEY `Allievo` (`Allievo`),
  KEY `Insegnante` (`Insegnante`),
  CONSTRAINT `lezioniprivate_ibfk_1` FOREIGN KEY (`Allievo`) REFERENCES `allievo` (`IdAllievo`),
  CONSTRAINT `lezioniprivate_ibfk_2` FOREIGN KEY (`Insegnante`) REFERENCES `insegnante` (`IdInsegnante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `lezioniprivate` */

insert  into `lezioniprivate`(`IdLezioniPrivate`,`Allievo`,`Insegnante`,`Data`) values ('L01','A02','I02','2020-10-31'),('L02','A05','I04','2020-11-04'),('L03','A04','I01','2020-10-23');

/*Table structure for table `livello` */

DROP TABLE IF EXISTS `livello`;

CREATE TABLE `livello` (
  `Id` char(3) NOT NULL,
  `Livello` varchar(30) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `livello` */

insert  into `livello`(`Id`,`Livello`) values ('L01','Elementary'),('L02','Intermediate'),('L03','First Certificate'),('L04','Advanced'),('L05','Proficiency');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
