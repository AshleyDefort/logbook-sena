/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.5.5-10.4.27-MariaDB : Database - bitacora
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`bitacora` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `bitacora`;

/*Table structure for table `acta_compromiso` */

DROP TABLE IF EXISTS `acta_compromiso`;

CREATE TABLE `acta_compromiso` (
  `codActa` int(11) NOT NULL AUTO_INCREMENT,
  `actaFecha` date DEFAULT NULL,
  `actaIdAprendiz` varchar(50) DEFAULT NULL COMMENT 'Id del aprendiz',
  `actaFicha` int(11) DEFAULT NULL COMMENT 'Ficha a la que pertenece el aprendiz',
  `actaFuncionario` varchar(50) DEFAULT NULL COMMENT 'Id del instructor que genera el acta de compromiso',
  `actaMotivoRemision` varchar(500) DEFAULT NULL,
  `actaDescargoAprendiz` varchar(500) DEFAULT NULL,
  `actaCompromisos` varchar(500) DEFAULT NULL,
  `actaRecomendaciones` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`codActa`),
  KEY `FK_ACTAS_APRENDIZ` (`actaIdAprendiz`),
  KEY `FK_ACTAS_FICHA` (`actaFicha`),
  KEY `FK_ACTAS_FUNCIONARIOS` (`actaFuncionario`),
  CONSTRAINT `FK_ACTAS_APRENDIZ` FOREIGN KEY (`actaIdAprendiz`) REFERENCES `aprendiz` (`Id_Apre`),
  CONSTRAINT `FK_ACTAS_FICHA` FOREIGN KEY (`actaFicha`) REFERENCES `ficha` (`Cod_Ficha`),
  CONSTRAINT `FK_ACTAS_FUNCIONARIOS` FOREIGN KEY (`actaFuncionario`) REFERENCES `funcionario` (`ID_Func`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `acta_compromiso` */

insert  into `acta_compromiso`(`codActa`,`actaFecha`,`actaIdAprendiz`,`actaFicha`,`actaFuncionario`,`actaMotivoRemision`,`actaDescargoAprendiz`,`actaCompromisos`,`actaRecomendaciones`) values (7,'2023-06-22','123',2452524,'1001946423','Bajo rendimiento acadÃ©mico','x','x','x'),(8,'2023-06-30','456',1234,'1129506976','Inasistencia','A','C','CE');

/*Table structure for table `apre_ficha` */

DROP TABLE IF EXISTS `apre_ficha`;

CREATE TABLE `apre_ficha` (
  `Cod_Ficha` int(40) NOT NULL,
  `Id_Apre` varchar(30) NOT NULL,
  KEY `Id_Apre` (`Id_Apre`),
  KEY `Cod_Ficha` (`Cod_Ficha`),
  CONSTRAINT `apre_ficha_ibfk_1` FOREIGN KEY (`Id_Apre`) REFERENCES `aprendiz` (`Id_Apre`),
  CONSTRAINT `apre_ficha_ibfk_2` FOREIGN KEY (`Cod_Ficha`) REFERENCES `ficha` (`Cod_Ficha`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `apre_ficha` */

insert  into `apre_ficha`(`Cod_Ficha`,`Id_Apre`) values (1234,'456'),(2452524,'123'),(123,'456');

/*Table structure for table `aprendiz` */

DROP TABLE IF EXISTS `aprendiz`;

CREATE TABLE `aprendiz` (
  `Id_Apre` varchar(50) NOT NULL,
  `Apre_Nom` varchar(30) DEFAULT NULL,
  `Apre_Ape` varchar(30) DEFAULT NULL,
  `Apre_Tel` varchar(50) DEFAULT NULL,
  `Apre_Correo` varchar(50) DEFAULT NULL,
  `Apre_Sexo` varchar(50) DEFAULT NULL,
  `Apre_Rol` char(5) DEFAULT NULL,
  PRIMARY KEY (`Id_Apre`),
  KEY `aprendiz_rol_fk` (`Apre_Rol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `aprendiz` */

insert  into `aprendiz`(`Id_Apre`,`Apre_Nom`,`Apre_Ape`,`Apre_Tel`,`Apre_Correo`,`Apre_Sexo`,`Apre_Rol`) values ('123','KENER','ROMERO','123','kener@gmail.com','MASCULINO','APREN'),('456','MARIA','LOPEZ','234','maria@gmail.com','FEMENINO','APREN');

/*Table structure for table `bitacora` */

DROP TABLE IF EXISTS `bitacora`;

CREATE TABLE `bitacora` (
  `Cod_Bit` int(20) NOT NULL,
  `Bit_Fecha` datetime DEFAULT NULL,
  `ID_FuncFK` varchar(30) DEFAULT NULL,
  `Id_ApreFK` varchar(30) DEFAULT NULL,
  `Bit_Des_Larg` varchar(300) DEFAULT NULL,
  `Cod_Des_CortFK` int(30) DEFAULT NULL,
  `fk_ficha` int(30) DEFAULT NULL,
  PRIMARY KEY (`Cod_Bit`),
  KEY `Id_ApreFK` (`Id_ApreFK`),
  KEY `ID_FuncFK` (`ID_FuncFK`),
  KEY `Cod_Des_CortFK` (`Cod_Des_CortFK`),
  KEY `bitacora_ibfk_6` (`fk_ficha`),
  CONSTRAINT `bitacora_ibfk_1` FOREIGN KEY (`Id_ApreFK`) REFERENCES `aprendiz` (`Id_Apre`),
  CONSTRAINT `bitacora_ibfk_2` FOREIGN KEY (`ID_FuncFK`) REFERENCES `funcionario` (`ID_Func`),
  CONSTRAINT `bitacora_ibfk_6` FOREIGN KEY (`fk_ficha`) REFERENCES `ficha` (`Cod_Ficha`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `bitacora` */

/*Table structure for table `ficha` */

DROP TABLE IF EXISTS `ficha`;

CREATE TABLE `ficha` (
  `Cod_Ficha` int(30) NOT NULL,
  `Desc_Fich` varchar(50) DEFAULT NULL,
  `Cod_ProFK` int(30) DEFAULT NULL,
  `fechaIni_Fich` date NOT NULL,
  `fechaFin_Fich` date DEFAULT NULL,
  PRIMARY KEY (`Cod_Ficha`),
  KEY `Cod_ProFK` (`Cod_ProFK`),
  CONSTRAINT `ficha_ibfk_1` FOREIGN KEY (`Cod_ProFK`) REFERENCES `programas` (`Cod_Pro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ficha` */

insert  into `ficha`(`Cod_Ficha`,`Desc_Fich`,`Cod_ProFK`,`fechaIni_Fich`,`fechaFin_Fich`) values (123,'gestion',1,'2023-05-09','2023-05-31'),(1234,'gestion',2,'2023-05-17','2023-05-31'),(2452524,'SISTEMAS',1,'2022-01-24','2024-01-01');

/*Table structure for table `ficha_fucionario` */

DROP TABLE IF EXISTS `ficha_fucionario`;

CREATE TABLE `ficha_fucionario` (
  `cod_ficha` int(30) DEFAULT NULL,
  `id_funcionario` varchar(50) DEFAULT NULL,
  KEY `fucnionarioId` (`id_funcionario`),
  KEY `fichaCod` (`cod_ficha`),
  CONSTRAINT `fichaCod` FOREIGN KEY (`cod_ficha`) REFERENCES `ficha` (`Cod_Ficha`),
  CONSTRAINT `fucnionarioId` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionario` (`ID_Func`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ficha_fucionario` */

insert  into `ficha_fucionario`(`cod_ficha`,`id_funcionario`) values (123,'1129506976');

/*Table structure for table `funcionario` */

DROP TABLE IF EXISTS `funcionario`;

CREATE TABLE `funcionario` (
  `ID_Func` varchar(50) NOT NULL,
  `Fun_Tip_Doc` varchar(50) DEFAULT NULL,
  `Fun_Nom` varchar(30) DEFAULT NULL,
  `Fun_Ape` varchar(30) DEFAULT NULL,
  `Fun_Tel` varchar(30) DEFAULT NULL,
  `Fun_Correo` varchar(50) DEFAULT NULL,
  `Fun_Pswd` varchar(100) NOT NULL,
  `Fun_Direcc` varchar(50) DEFAULT NULL,
  `Fun_Rol` varchar(20) DEFAULT NULL,
  `Fun_Img` blob DEFAULT NULL,
  PRIMARY KEY (`ID_Func`),
  KEY `Cod_RolFK` (`Fun_Rol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `funcionario` */

insert  into `funcionario`(`ID_Func`,`Fun_Tip_Doc`,`Fun_Nom`,`Fun_Ape`,`Fun_Tel`,`Fun_Correo`,`Fun_Pswd`,`Fun_Direcc`,`Fun_Rol`,`Fun_Img`) values ('1001946423','Cedula de Ciudadania','BRAYAN','LOPEZ','3022974095','brayanlpz1525@gmail.com','b761d6d20bfb9ab4adf9e9ab7cc5a4de1c4fae34','Calle 46b #16-107','ADMIN','ï¿½PNG\r\n\Z\n\0\0\0\rIHDR\0\0H\0\0H\0\0\0ï¿½vï¿½d\0\0\0sBITï¿½ï¿½Oï¿½\0\0\0_zTXtRaw profile type APP1\0\0ï¿½ï¿½JOï¿½K-ï¿½LV((ï¿½Oï¿½ï¿½Iï¿½R\0c.KKï¿½D04006ï¿½F@ï¿½9T(ï¿½\0ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Yï¿½ï¿½)ï¿½ï¿½\0Oï¿½h-ØŒ\0\0ï¿½IDATxï¿½ï¿½ï¿½Ylï¿½ï¿½ï¿½co{×»ï¿½8>ï¿½ï¿½^;ï¿½ï¿½1ï¿½ï¿½4ï¿½Rqï¿½@\nFï¿½ï¿½Fï¿½ï¿½FJï¿½*ï¿½}*}hUU%EEUb\"DIï¿½Qï¿½8ï¿½`csClï¿½k{ï¿½ï¿½ï¿½3ï¿½3ï¿½5ï¿½<cï¿½bï¿½ï¿½ï¿½ï¿½ï¿½<f~ï¿½lï¿½ï¿½1ï¿½ï¿½Ú»wï¿½\0ï¿½B\'ï¿½\00ï¿½l\0!ï¿½\0Bï¿½ï¿½`ï¿½ ï¿½\r@ ï¿½@6\0ï¿½l\0!ï¿½\0Bï¿½ï¿½`ï¿½ ï¿½\r@ ï¿½@6\0ï¿½l\0!ï¿½\0Bï¿½ï¿½`ï¿½ ï¿½\r@ ï¿½@6\0ï¿½l\0!ï¿½\0Bï¿½ï¿½`ï¿½ ï¿½\r@ ï¿½@6\0ï¿½l\0!ï¿½\0Bï¿½ï¿½`ï¿½ ï¿½\r@ ï¿½@6\0ï¿½l\0!ï¿½\0Bï¿½ï¿½`ï¿½ ï¿½\r@ ï¿½@6\0ï¿½l\0!ï¿½\0Bï¿½ï¿½`ï¿½ ï¿½\r@ ï¿½@6\0ï¿½l\0!ï¿½\0Bï¿½ï¿½`ï¿½ ï¿½\r@ ï¿½@6\0ï¿½l\0!ï¿½\0Bï¿½ï¿½`ï¿½ ï¿½\r@ ï¿½@6\0ï¿½l\0!ï¿½\0Bï¿½ï¿½`ï¿½ ï¿½\r@ ï¿½@6\0ï¿½l\0!ï¿½\0Bï¿½ï¿½`ï¿½ ï¿½\r@ ï¿½@6\0ï¿½l\0!ï¿½\0bï¿½]ï¿½yï¿½Ct:ï¿½ ?(ï¿½0ï¿½Nï¿½ï¿½ï¿½ï¿½Zï¿½lBï¿½ï¿½!B,ï¿½Fï¿½Fï¿½ï¿½fï¿½Yï¿½Ö¬ï¿½,ï¿½ï¿½rrr~PrxxXï¿½ï¿½ï¿½ï¿½ï¿½`0811ï¿½qï¿½^ï¿½gYV<\0ï¿½Noï¿½$	ï¿½ï¿½qï¿½ï¿½ï¯¬ï¿½tï¿½\\eeeï¿½ï¿½d2ï¿½Lï¿½ï¿½ï¿½ï¿½ï¿½233ï¿½)ï¿½ï¿½/IR ï¿½D\"ï¿½Hï¿½ï¿½ï¿½Ý¹sï¿½ï¿½Í›ï¿½nï¿½ï¿½ï¿½ï¿½4Ã OkvZï¿½$)ï¿½ï¿½ï¿½h4\Z,Xï¿½bÅŠeË–Yï¿½Vï¿½eï¿½zï¿½ï¿½ï¿½ï¿½nï¿½Ù¾ï¿½/Ë—/ï¿½ï¿½b~ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Ëƒï¿½ï¿½ï¿½ï¿½4Í²,ï¿½ï¿½ï¿½ï¿½{ï¿½&ï¿½ï¿½ï¿½t:ï¿½Ò¥Kï¿½.]ZYYï¿½ï¿½ï¿½7ï¿½?ï¿½Þ½{ï¿½ï¿½ï¿½Wï¿½^ï¿½zï¿½ï¿½Nï¿½3\Zï¿½3ï¿½#`Vï¿½ï¿½Nï¿½$Eï¿½Qï¿½ï¿½ï¿½ï¿½ï¿½/?ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½gJ^^^^^^mmï¿½ï¿½ï¿½Pccï¿½gï¿½}ï¿½p8ï¿½z=Zï¿½tï¿½;=ï¿½<o2ï¿½ï¿½ï¿½ï¿½6oï¿½ï¿½ï¿½Ojï¿½ï¿½ï¿½ï¿½ï¿½>ï¿½ï¿½ÓŽï¿½ï¿½H$b04ï¿½ï¿½\0ï¿½ï¿½ï¿½&ï¿½u\05ï¿½$ï¿½Bï¿½ï¿½ï¿½~ï¿½ï¿½ï¿½_ß¸qcVVï¿½ï¿½uï¿½ï¿½ï¿½Zï¿½|yyyï¿½ï¿½ï¿½D?ï¿½ï¿½Ô‡ï¿½xï¿½ï¿½ï¿½ï¿½ï¿½Ý»ï¿½ï¿½ï¿½ï¿½jï¿½&ï¿½>EEE---4\Zï¿½ï¿½w*Cï¿½ï¿½ï¿½ï¿½yï¿½Kï¿½ï¿½ï¿½wï¿½sï¿½\\)ï¿½6,Xï¿½zï¿½ï¿½ï¿½Ý»Gï¿½4ï¿½ï¿½ï¿½0ï¿½NEï¿½(Fï¿½Ñ;wï¿½^ï¿½:ï¿½ï¿½h4ï¿½ï¿½zï¿½~8ï¿½ï¿½ï¿½ï¿½Éï¿½ï¿½lï¿½ï¿½ï¿½t:ï¿½ï¿½y=ï¿½(ï¿½ï¿½Î;ï¿½ï¿½ï¿½ï¿½Gï¿½ï¿½ï¿½4&ï¿½tï¿½SN4\Zï¿½iï¿½ï¿½7ß¬ï¿½ï¿½ï¿½ï¿½ï¿½^ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½kxxx||<ï¿½ï¿½ï¿½D\"ß—1ï¿½Lrï¿½322ï¿½v{NNï¿½Â…+++ï¿½Nï¿½ï¿½ï¿½ï¿½h\\ï¿½nï¿½ï¿½ï¿½ï¿½×¿ï¿½ï¿½Fï¿½ï¿½fZï¿½ï¿½ï¿½ï¿½|iiï¿½ï¿½ï¿½ó¢¢¢i~$ï¿½xï¿½Þ›7oï¿½<yï¿½Î;zï¿½^^:ï¿½ï¿½:ï¿½ï¿½;ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Fï¿½@YYï¿½Æ].ï¿½ï¿½ï¿½4ï¿½Lï¿½ï¿½ï¿½ï¿½ï¿½ï¿½===)2X\0ï¿½ï¿½B8ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½p8ï¿½S>ï¿½uttï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½~ï¿½ï¿½ï¿½8ï¿½ï¿½Aï¿½Ã™ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½<ï¿½LUUï¿½Nï¿½Cï¿½ï¿½ï¿½ï¿½ï¿½ï¿½7::ï¿½u,ï¿½ï¿½N<ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ÏŸNï¿½ï¿½ï¿½ï¿½O?ï¿½tppï¿½ï¿½yï¿½ï¿½0Sï¿½Xï¿½$ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Í›7ï¿½ï¿½ï¿½ï¿½|ï¿½ï¿½ï¿½ï¿½ï¿½;ï¿½ï¿½ï¿½hï¿½Sfï¿½Sï¿½ï¿½/ï¿½ï¿½ï¿½ï¿½ï¿½Nï¿½Guuu9rï¿½ï¿½Ñ£ï¿½`pÆ—sS%7ï¿½>ï¿½ï¿½ï¿½ï¿½ï¿½wï¿½ï¿½u:ï¿½ï¿½ï¿½ï¿½êŸ²Zï¿½Kï¿½,ï¿½ï¿½ï¿½ï¿½x<ï¿½\"ï¿½\nï¿½ï¿½!\nï¿½ï¿½ï¿½2?ï¿½Xï¿½ï¿½ï¿½ï¿½ï¿½ï¿½^ooï¿½ï¿½jï¿½ï¿½ï¿½MEï¿½4m4\Zï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½fsaaï¿½zb-Keeï¿½\'ï¿½|ï¿½yï¿½Tï¿½`\'ï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½K>xï¿½`ï¿½ï¿½ï¿½gÎœï¿½ï¿½tï¿½ï¿½Bï¿½,ï¿½ï¿½Z[[{{{ï¿½ï¿½ï¿½ï¿½ï¿½X,ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½vygï¿½65ï¿½I!ï¿½ï¿½$ï¿½Kï¿½ï¿½g?ï¿½ï¿½ï¿½V/ï¿½ï¿½Ó³oï¿½>ï¿½ï¿½c2ï¿½4^BQï¿½^ï¿½ï¿½wï¿½ï¿½ï¿½ï¿½_ï¿½ï¿½ï¿½p8T*ï¿½p8G[[fI.;ï¿½Bï¿½ï¿½/ï¿½ï¿½yï¿½fï¿½b×¯_ï¿½ï¿½?ï¿½ï¿½q\\ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Ë…ï¿½ï¿½ï¿½ï¿½ï¿½*%ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½0ï¿½ï¿½Dvï¿½Dï¿½ï¿½ï¿½ï¿½Ò·ï¿½~[ï¿½eEï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½$}Rï¿½ï¿½ï¿½h4zï¿½ï¿½ï¿½^ï¿½hï¿½\"ï¿½jï¿½ï¿½ï¿½7nxï¿½Þ¤ï¿½yï¿½ï¿½@(9DQ4ï¿½ï¿½;vï¿½Pï¿½655}ï¿½ï¿½6ï¿½-Eï¿½ï¿½4Mï¿½lï¿½?ï¿½ï¿½ï¿½ï¿½Iï¿½EQ;vï¿½0ï¿½Í¢(jV7xZï¿½ï¿½D\"ï¿½×¯ï¿½ï¿½Uï¿½\\ï¿½rï¿½ï¿½ï¿½ß—\'ï¿½5ï¿½Ø”(ï¿½bï¿½ï¿½ï¿½3??ï¿½ï¿½\'ï¿½P*ï¿½ï¿½ï¿½ï¿½oÞ¼ï¿½Õ¦Iï¿½Bß˜ï¿½CEï¿½Ó¹iï¿½&ï¿½2}}}ï¿½ï¿½ï¿½Kï¿½ï¿½eï¿½ï¿½9ï¿½Û·o___ï¿½Jï¿½Mï¿½69ï¿½N4ï¿½Iï¿½r_ï¿½ï¿½`||ï¿½ï¿½ï¿½ï¿½l6+ï¿½zï¿½ï¿½ï¿½ï¿½ï¿½nOï¿½Tï¿½hï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½U*c6ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Çµï¿½ï¿½Rï¿½{Cï¿½X,VUUï¿½ï¿½Tï¿½ï¿½ï¿½ï¿½\'Oï¿½ï¿½ï¿½Nsï¿½vï¿½ï¿½,ï¿½ï¿½ï¿½{ï¿½ï¿½Iï¿½ï¿½Ê¸ï¿½îªªï¿½X,ï¿½eï¿½@ï¿½`kLï¿½$Q7nï¿½hï¿½Xï¿½Ê´ï¿½ï¿½ï¿½:u*-6Tï¿½ï¿½Sï¿½Nï¿½ï¿½ï¿½*ï¿½X,7nEQï¿½Rï¿½Aï¿½5%Â¢Eï¿½***ï¿½\nï¿½ï¿½ï¿½zï¿½Å’ï¿½;(ï¿½ï¿½X,ï¿½ï¿½ï¿½ï¿½@@ï¿½LEEÅ¢Eï¿½ï¿½ffï¿½ï¿½)ï¿½ï¿½jjjTï¿½\r>yï¿½d8NÙ¡ï¿½ï¿½hï¿½ï¿½ï¿½\'Oï¿½T*ï¿½ï¿½ï¿½ï¿½vï¿½>ï¿½4ï¿½6_ 2ï¿½ï¿½ï¿½^ï¿½iOOOccï¿½ï¿½9H&ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Gï¿½ï¿½sï¿½=\nï¿½ï¿½ï¿½ ï¿½Ú‰ï¿½bnï¿½[it-B[[ï¿½ï¿½ï¿½x\Z5ï¿½2ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Ú”ï¿½ï¿½6ï¿½ï¿½é§Ÿï¿½ï¿½ï¿½ï¿½ï¿½;ï¿½ï¿½Bï¿½P]]ï¿½ï¿½Ó‘ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½3{ï¿½ï¿½hlhhQ*PWWï¿½F[Kï¿½FDQï¿½ï¿½ï¿½Sï¿½>ï¿½ï¿½ï¿½,IRZÌ™=ï¿½ï¿½(Iï¿½ï¿½ï¿½ï¿½ï¿½\nï¿½ï¿½ï¿½ï¿½ï¿½ï¿½aï¿½ï¿½flï¿½Dï¿½Qï¿½Ë¥ï¿½ï¿½ï¿½ï¿½ï¿½i7ï¿½~ï¿½ï¿½d:}ï¿½ï¿½ï¿½Sï¿½ï¿½ï¿½rï¿½ï¿½Ñ¨ï¿½Uï¿½ï¿½lï¿½ï¿½ï¿½XUUï¿½ï¿½7nï¿½ï¿½4mï¿½eEï¿½ï¿½7nLï¿½Tï¿½x-ï¿½fl-Hï¿½dï¿½ï¿½Tï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Cï¿½ÓŽ\\yï¿½ï¿½TVVï¿½ï¿½fï¿½Jm ï¿½Zï¿½w}(~411ï¿½ï¿½ï¿½Cï¿½ï¿½eï¿½azzz&&&&}ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½F[ï¿½ï¿½`ï¿½ï¿½ï¿½Iï¿½zï¿½ï¿½ï¿½ï¿½~2ï¿½ï¿½ï¿½ß¯ï¿½-ï¿½nï¿½ï¿½ï¿½v[ï¿½DQTï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Gï¿½4=22ï¿½ï¿½uB?ï¿½p8lmï¿½ï¿½ï¿½)-ï¿½b1ï¿½~ï¿½$Iï¿½oï¿½& ï¿½2ï¿½ï¿½oß¾ï¿½4ï¿½.,,ï¿½2mï¿½}Jqï¿½ (]y\'ï¿½ï¿½ï¿½pï¿½ï¿½Ðœ>ï¿½eï¿½ï¿½ï¿½ï¿½ï¿½ï¿½9ï¿½Nï¿½ï¿½ï¿½ï¿½Aï¿½ï¿½ï¿½(0ï¿½ï¿½1388ï¿½ï¿½ï¿½v8ï¿½6l-ï¿½ï¿½tÔ¾$I>ï¿½/ï¿½_t=ï¿½ï¿½(ï¿½Ï§ï¿½ï¿½Zï¿½ï¿½6l-ï¿½<ï¿½ï¿½ï¿½Tï¿½ï¿½ï¿½ï¿½Qï¿½ï¿½=::ï¿½ï¿½ï¿½ï¿½\\ï¿½ï¿½V`!ï¿½\ZQï¿½ï¿½Kï¿½ï¿½ï¿½ï¿½I\nï¿½ï¿½ï¿½Wï¿½e5ï¿½Ïœï¿½`ï¿½ ï¿½ï¿½ï¿½ï¿½61ï¿½d*ï¿½1#ï¿½Ô‡`kï¿½eYï¿½ï¿½?ï¿½#ï¿½ï¿½\n\nï¿½Yï¿½%ï¿½bAAï¿½ï¿½zï¿½ï¿½OØ¿b)ï¿½ï¿½Ë²*ï¿½ï¿½ï¿½L&bfï¿½$IRï¿½U>22ï¿½`kï¿½ï¿½ï¿½0ï¿½`Pï¿½QII	1owA())QZoï¿½Yï¿½ï¿½ï¿½l-ï¿½,ï¿½ï¿½x&}Dï¿½ï¿½ï¿½yï¿½Hï¿½Ï›7Oï¿½+ï¿½ï¿½xï¿½bkï¿½ï¿½ï¿½0J]qï¿½ï¿½ï¿½ï¿½Ë‰9vï¿½ï¿½ï¿½ï¿½rï¿½`ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Zlï¿½Ngï¿½ÛN\'ï¿½lIï¿½Tï¿½ï¿½ï¿½tï¿½ï¿½ï¿½![ï¿½hï¿½ï¿½ï¿½|Jï¿½m6[~~>ï¿½lAï¿½ï¿½ï¿½m6Û¤O#ï¿½Hï¿½ï¿½ï¿½Fl-ï¿½ï¿½ï¿½wï¿½Þ¤Oï¿½Í›W\\\\LFï¿½ï¿½ï¿½ï¿½ï¿½Í›7ï¿½ï¿½{ï¿½ï¿½yï¿½^bvï¿½ï¿½8ï¿½ï¿½ï¿½@Ó´ï¿½ï¿½Uï¿½WVVjYï¿½Ù£ï¿½x<[3ï¿½+kDï¿½ï¿½ï¿½ï¿½+ï¿½~Ë—Hï¿½ï¿½0[ï¿½$ï¿½ï¿½ï¿½Iï¿½\nï¿½ï¿½ï¿½Ofï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Ö¦ï¿½ï¿½ï¿½bï¿½ï¿½Yï¿½&ï¿½ï¿½4ï¿½<ï¿½fï¿½\Zï¿½ï¿½ï¿½ï¿½kï¿½ï¿½Æµï¿½ï¿½lï¿½0ï¿½ï¿½Õ¥tï¿½ï¿½Nï¿½[ï¿½vmï¿½6ï¿½rsï¿½vï¿½Zï¿½^ï¿½ï¿½ï¿½ï¿½Sï¿½Aï¿½ï¿½ï¿½ï¿½ë›šï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½4ï¿½\'\Zï¿½ï¿½ï¿½î¼¼<ï¿½MMMXï¿½ï¿½%[;Fï¿½ï¿½Ø±cJOM&Ó†\rXï¿½Mï¿½F[ï¿½$ï¿½e7lØ ï¿½Jï¿½Ø±cizï¿½hï¿½Bï¿½ï¿½CQï¿½ï¿½lï¿½tï¿½Rï¿½ï¿½ï¿½ï¿½eË–ï¿½]ï¿½ï¿½Fï¿½-[V^^ï¿½Tï¿½Ò¥Kfï¿½oï¿½ï¿½ï¿½`kï¿½d2ï¿½ï¿½ï¿½)Mï¿½ï¿½ï¿½×ï¿½ï¿½ï¿½Qï¿½-Iï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½&ï¿½DQlkkKï¿½Dï¿½ï¿½ï¿½)ï¿½^ï¿½ï¿½ï¿½ï¿½ï¿½Ñ¡Tï¿½ï¿½ï¿½dÏž=*ï¿½iï¿½ï¿½H$ï¿½gÏžï¿½ï¿½ï¿½mmmzï¿½^ï¿½Zï¿½ï¿½)ï¿½ï¿½8ï¿½ï¿½xï¿½J{ï¿½Úµ.ï¿½+-ï¿½ï¿½pï¿½rï¿½T&Ã£ï¿½ï¿½Å‹9ï¿½C?\\cï¿½ï¿½L&Ó—_~ï¿½ï¿½ß¯Tï¿½nï¿½oß¾ï¿½fï¿½ï¿½ï¿½rQm6ï¿½ï¿½ï¿½ï¿½Uv}ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½kï¿½Nï¿½ï¿½Z__ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½]ï¿½vï¿½ï¿½lKï¿½vï¿½Ú¥2g&ï¿½b}}ï¿½ï¿½M	0ï¿½ï¿½$`Yï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Eï¿½Ì³ï¿½>ï¿½eï¿½ï¿½3ï¿½ï¿½H>}Ë–-ï¿½>ï¿½ï¿½Jï¿½ï¿½ï¿½ï¿½ï¿½ï¿½~ï¿½ï¿½N\nï¿½ï¿½ï¿½&ï¿½uï¿½ï¿½(ï¿½\Zï¿½ï¿½ï¿½Tï¿½ï¿½ï¿½ï¿½***Xï¿½ï¿½qï¿½Ë²ï¿½3Fï¿½$)ï¿½lÛ¶ï¿½ï¿½W_Uï¿½ï¿½144ï¿½ï¿½ï¿½ï¿½G\"ï¿½ï¿½H\nï¿½Ñ“Cï¿½ï¿½ï¿½Ô©S*eXï¿½]ï¿½nï¿½Ê•+Cï¿½ï¿½fï¿½R(Zï¿½rï¿½uï¿½Ô›ï¿½Sï¿½Nï¿½tï¿½`ï¿½Aï¿½ï¿½4zï¿½ï¿½ï¿½oï¿½-(((,,T*c0*++%Ijoo7ï¿½Lï¿½mï¿½ï¿½WÖ¯ï¿½ï¿½J]]]FFï¿½Jï¿½ï¿½ï¿½ï¿½Gï¿½btï¿½Dv2ï¿½,ï¿½ï¿½ï¿½^YYï¿½ï¿½ï¿½ï¿½Tï¿½`0TUUï¿½ï¿½ä´µï¿½Qï¿½ï¿½ï¿½ï¿½ ï¿½hï¿½ï¿½ï¿½ï¿½ï¿½Mï¿½ï¿½ï¿½vuuï¿½ß¿_ï¿½×§ï¿½ï¿½aBï¿½ï¿½ï¿½ï¿½ï¿½X,vï¿½ï¿½ï¿½ï¿½ï¿½jï¿½Ù¬Rï¿½ï¿½ï¿½$??ï¿½ï¿½oï¿½MÊ™ï¿½ï¿½H$++ï¿½7ï¿½xï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½:4::ï¿½9ï¿½ï¿½Bï¿½ï¿½L>ï¿½ï¿½ï¿½ï¿½ï¿½G?ï¿½ï¿½zÉ‚ï¿½ï¿½%Kï¿½ï¿½4ï¿½Mï¿½-B$Yï¿½tï¿½~ï¿½ï¿½ï¿½ï¿½ï¿½)ï¿½ï¿½ï¿½ï¿½ï¿½sï¿½Ö™%ï¿½ï¿½|ï¿½Ü½{wllï¿½ï¿½ï¿½Z}ï¿½)33ï¿½çž³ï¿½lï¿½ï¿½ï¿½^ï¿½ï¿½aï¿½ï¿½ï¿½ï¿½Jï¿½ï¿½q\\~~ï¿½Ö­[wï¿½Þï¿½ï¿½ï¿½^ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½hï¿½N	zï¿½ï¿½ï¿½ï¿½7ï¿½ï¿½\\ï¿½)ï¿½ï¿½ï¿½ï¿½ï¿½%Kï¿½ï¿½ï¿½ï¿½u:ÝŒï¿½[ï¿½H$ï¿½nÝºsï¿½Î§ï¿½zjÊï¿½bï¿½cÇŽï¿½;w.ï¿½3| Cï¿½Sï¿½<+ï¿½ï¿½ï¿½uï¿½Þ½ï¿½Ë—OYï¿½jï¿½ï¿½\\ï¿½5kï¿½ï¿½=ï¿½P(ï¿½ï¿½3ï¿½$ï¿½</Iï¿½ï¿½nï¿½ï¿½ï¿½zï¿½ï¿½ï¿½ï¿½iï¿½l8pï¿½ë¯¿6Huï¿½@ï¿½SEQ,ï¿½vwwOLLï¿½ï¿½ï¿½Oy,EQVï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½),,ï¿½Zï¿½<ï¿½ï¿½ï¿½ï¿½ï¿½$Iï¿½h4Xï¿½ï¿½+Vï¿½ï¿½ï¿½K?ï¿½ï¿½OVï¿½Xaï¿½Zï¿½ï¿½?ï¿½ï¿½ï¿½Gï¿½9wï¿½ï¿½bAï¿½Sï¿½wï¿½ï¿½dï¿½ï¿½ï¿½H$ï¿½vï¿½wï¿½Þ­t@ï¿½Ò§FGGï¿½ï¿½Û›ï¿½ï¿½ï¿½ï¿½ï¿½M&Ë²r3ï¿½pï¿½^EIï¿½Aï¿½ï¿½bï¿½Hï¿½nï¿½?ï¿½ï¿½nï¿½ï¿½ï¿½ï¿½(;;;ï¿½\r###ï¿½ï¿½ß±ï¿½ï¿½ï¿½ï¿½Cï¿½Sï¿½ï¿½Vï¿½ï¿½7ï¿½ï¿½ï¿½t&ï¿½\'566600ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Tï¿½i[ï¿½Vï¿½Ã‘ï¿½ï¿½[TTï¿½ï¿½ï¿½ï¿½Øï¿½uï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½MAvï¿½ï¿½ï¿½ï¿½Û¶m{ï¿½ï¿½Sï¿½=ï¿½D\"ï¿½ÏŸï¿½è£Aï¿½ï¿½ï¿½Ô„1vï¿½ï¿½iZ^Izï¿½ï¿½ï¿½ï¿½/ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½:tï¿½ï¿½iï¿½aï¿½<e!Ø©ï¿½ï¿½(ï¿½^?44tï¿½ï¿½qQï¿½ï¿½ï¿½ï¿½2Iï¿½$ï¿½ï¿½wï¿½ï¿½ï¿½ï¿½ï¿½/>ï¿½ï¿½ï¿½Rvwï¿½4Iï¿½(ï¿½bï¿½ï¿½ï¿½ï¿½ï¿½Kï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Aï¿½ï¿½ï¿½ï¿½Rï¿½tï¿½;Eï¿½ï¿½ï¿½FYï¿½]ï¿½xï¿½+ï¿½ï¿½ï¿½ï¿½O\Zï¿½Æ¤7ï¿½<ï¿½ï¿½ï¿½ï¿½ï¿½gÏž;w.ï¿½4ï¿½1vjBï¿½Sï¿½$Iï¿½Phï¿½ï¿½ï¿½ï¿½Wï¿½^ï¿½dÉ‚ï¿½]ï¿½Iï¿½+Wï¿½466Þ¸qï¿½d2aï¿½ï¿½jï¿½ï¿½ï¿½Ú¯-[ï¿½,_ï¿½\\eï¿½vï¿½ï¿½uï¿½ï¿½G}444dï¿½Xï¿½Ô`ï¿½\nï¿½ï¿½M&Seeï¿½ï¿½Ý»ï¿½Ngï¿½ï¿½ï¿½\'Nï¿½?ï¿½ï¿½ï¿½`Uiï¿½@ï¿½ï¿½O>ï¿½dÕªU6lXï¿½hï¿½ï¿½ï¿½\'&&ï¿½ï¿½0ï¿½ï¿½ï¿½pXÞ¤ï¿½ï¿½ï¿½pï¿½`0ï¿½L&ï¿½Ùœï¿½ï¿½ï¿½ï¿½ï¿½@GGGï¿½ï¿½ï¿½ë††ymï¿½cï¿½ï¿½ï¿½1!ï¿½Iï¿½qï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½Uï¿½ï¿½,!ï¿½ï¿½ï¿½ï¿½ï¿½{ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½aï¿½ï¿½ï¿½\'&&DQï¿½ï¿½ï¿½ï¿½Aaï¿½ï¿½FÓ´ï¿½bï¿½Zï¿½6ï¿½ï¿½ï¿½p8ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Â„ï¿½\\Qoß¾ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Osï¿½9ï¿½;iDQï¿½8ï¿½gï¿½Ù±cï¿½O<ï¿½ï¿½ï¿½ï¿½p0ï¿½sï¿½Î…:::ï¿½ï¿½@)ï¿½ï¿½_ï¿½Qï¿½ï¿½ï¿½ï¿½\rï¿½ï¿½ï¿½Lï¿½Qï¿½ï¿½$ï¿½4ï¿½xï¿½ï¿½ï¿½ï¿½Zï¿½ï¿½eï¿½ï¿½-Kï¿½ï¿½ï¿½ \'Nï¿½8uï¿½ï¿½q8q!Yï¿½ï¿½ï¿½ï¿½ï¿½W_}uï¿½ï¿½ï¿½ï¿½%ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½_ï¿½~ï¿½ï¿½ï¿½)ï¿½ï¿½ï¿½fï¿½ï¿½;#-ï¿½ï¿½?ï¿½ï¿½8Qï¿½ï¿½ï¿½ï¿½.]ZZZZ^^oDï¿½_ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Ü¤@ï¿½ï¿½ï¿½ï¿½yï¿½eï¿½~ï¿½mï¿½ï¿½W\Z;::\Zï¿½ï¿½ï¿½<ï¿½0ï¿½z`ï¿½ï¿½pï¿½ï¿½322.\\ï¿½vï¿½Wï¿½X×¿Aï¿½ï¿½ï¿½?:;;ï¿½ï¿½S{ï¿½ï¿½8ï¿½[ï¿½dï¿½ï¿½Ý»ï¿½ÏŸ?Íï¿½|ï¿½k×®;vï¿½ï¿½ï¿½dddï¿½,ï¿½ï¿½Yï¿½ï¿½$ï¿½b1ï¿½ï¿½8ï¿½Û¶mÛªUï¿½\n\n\nï¿½ï¿½fï¿½ï¿½ï¿½ï¿½\'Nï¿½ï¿½~\\\0ï¿½ï¿½Zqï¿½Hï¿½4>>ï¿½vï¿½ï¿½={ï¿½Lï¿½V8ï¿½ï¿½oï¿½9rï¿½ï¿½yï¿½kVï¿½9ï¿½ï¿½<h7fï¿½ï¿½ï¿½ï¿½Sï¿½=ï¿½fï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½?ï¿½ï¿½l6#ÛšAï¿½5\"ï¿½vÚ´iÓž={ï¿½3ï¿½Eï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½_}ï¿½U0Lï¿½Mï¿½QoÞ¼yï¿½Ê•ï¿½ï¿½ï¿½Lï¿½ï¿½aï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Nï¿½ï¿½ï¿½[ï¿½xuï¿½Î[ï¿½lï¿½N>ï¿½{ï½£Gï¿½F\"ï¿½ï¿½ï¿½Raï¿½ï¿½ï¿½ï¿½ï¿½Í›7/\\ï¿½ï¿½p8ï¿½ï¿½ï¿½ï¿½ï¿½Z+((ï¿½ï¿½ï¿½ï¿½~ï¿½z(Jï¿½_ï¿½Tï¿½ï¿½ï¿½$iddï¿½ï¿½^ï¿½ï¿½<ï¿½ï¿½ï¿½\'ï¿½|ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Èºï¿½Y\"ï¿½oï¿½yï¿½ï¿½Å‹ï¿½ï¿½ï¿½ï¿½hï¿½ï¿½ï¿½Â…ï¿½ï¿½)ï¿½{ï¿½ï¿½]r[ï¿½k×®ï¿½_~yï¿½oï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½X,ï¿½oï¿½iï¿½ff``ï¿½Ò¥Kï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½vï¿½oÜ¸ï¿½ï¿½ï¿½Yï¿½`ï¿½\"y>yï¿½ï¿½ï¿½ï¿½×¯ï¿½ï¿½{ï¿½ï¿½ï¿½ï¿½ï¿½;ï¿½ï¿½ï¿½ï¿½4ï¿½ï¿½ï¿½Hyï¿½ollï¿½ï¿½tï¿½ï¿½ï¿½ï¿½nï¿½ï¿½QZZzï¿½ï¿½yï¿½ï¿½VÕœsï¿½Ykjjvï¿½ï¿½5eï¿½ï¿½Ù³E1-\Zï¿½Gï¿½4m0ï¿½]ï¿½6::ï¿½hï¿½\"ï¿½CÚœNï¿½ï¿½ï¿½ï¿½Ïœ9ï¿½yï¿½Ùƒ`ï¿½ï¿½ï¿½kkkï¿½zï¿½-ï¿½ï¿½78pï¿½ï¿½?ï¿½Zï¿½iï¿½P?Juï¿½8qï¿½ï¿½v;ï¿½Â…ï¿½ï¿½Nï¿½ï¿½ï¿½Õ«qï¿½Ó‡`ÏŠX,V\\\\ï¿½ï¿½_ï¿½Bï¿½Bï¿½ï¿½wï¿½ï¿½ï¿½.ï¿½l62ï¿½ï¿½,ï¿½Rï¿½ï¿½ï¿½^VVï¿½r7ï¿½Nï¿½+((ï¿½ï¿½ï¿½ï¿½\n6Ò¸ï¿½HYï¿½+ï¿½ï¿½^{M}mï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½7ß¤ï¿½	ï¿½3ï¿½eYï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Õ«*ÅŒFï¿½;ï¿½v{,Ó¬nsZï¿½&IR8~ï¿½7ï¿½yï¿½ï¿½b^ï¿½ï¿½Oï¿½S___ï¿½ï¿½>#hï¿½ï¿½ï¿½bï¿½}ï¿½Yuuunnï¿½R1ï¿½^_]]ï¿½ï¿½ï¿½$oï¿½Ñ²ï¿½ï¿½Cï¿½=ï¿½8ï¿½[ï¿½vï¿½ï¿½eï¿½ï¿½pï¿½Ð¡C^ï¿½ï¿½ï¿½Tï¿½hï¿½ï¿½ï¿½ï¿½9tï¿½Pï¿½Jï¿½ï¿½ï¿½ï¿½mÛ¶Eï¿½ï¿½ï¿½ï¿½J{&	ï¿½PPPï¿½nï¿½:ï¿½qc(:rï¿½Èµkï¿½Nï¿½ï¿½aï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½*ï¿½^xï¿½ï¿½Ë—ï¿½<ï¿½Yï¿½ï¿½{&ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½|ï¿½2ï¿½~ï¿½ï¿½_|1Gï¿½bYv||ï¿½ï¿½ï¿½s(R*c0ï¿½mï¿½&\Zï¿½ï¿½`ï¿½ï¿½ãª«ï¿½ï¿½nï¿½Jï¿½ï¿½ï¿½ï¿½>ï¿½ ï¿½{ï¿½Ò‘^ï¿½ihhPï¿½mnnï¿½;=ï¿½	ï¿½É³ï¿½!ï¿½ï¿½nï¿½ï¿½oï¿½rnYggï¿½ï¿½ï¿½ï¿½ï¿½9ï¿½zï¿½ï¿½ï¿½ï¿½ï¿½ï¿½tï¿½ï¿½ï¿½(ï¿½ï¿½ï¿½ï¿½\Z\Zï¿½ï¿½Ð²nï¿½Bï¿½=3AXï¿½~ï¿½Êï¿½ï¿½ï¿½ï¿½ï¿½ï¿½DQï¿½ï¿½l>rï¿½HWWï¿½Rï¿½ï¿½ï¿½Ì—^zï¿½atï¿½gÄœï¿½ï¿½ï¿½ArrrVï¿½\\ï¿½ï¿½744tvvÎ‘ï¿½ï¿½ï¿½hï¿½ï¿½È‘#*ï¿½uï¿½Ý¥ï¿½ï¿½xï¿½=#ï¿½7oï¿½lï¿½Ù”\n\\ï¿½|ï¿½Ô©Sfï¿½Yï¿½Zï¿½\Zï¿½^ï¿½ï¿½ï¿½}ï¿½ï¿½qï¿½Eï¿½Ø±#hY+R!ØKEï¿½Ó¹|ï¿½rï¿½gÏžMï¿½+ï¿½ï¿½ï¿½h4655\r*(++ï¿½ï¿½ï¿½ï¿½Fï¿½ZÖŠHï¿½ï¿½\nï¿½?ï¿½ï¿½OUN;ï¿½tï¿½ï¿½Õ«Wï¿½tï¿½ï¿½ï¿½bï¿½ï¿½ï¿½|ï¿½ï¿½*ï¿½ï¿½nÝºï¿½ï¿½ï¿½ï¿½Xbï¿½XUUUuuï¿½Rï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½9ï¿½	ï¿½ï¿½hï¿½ï¿½Onß¾ï¿½Tï¿½ï¿½ï¿½hÅŠhï¿½ï¿½ï¿½XAxï¿½ï¿½Uï¿½(~ï¿½ï¿½ï¿½Ø™ï¿½ï¿½ï¿½ÙŸ}ï¿½ï¿½ï¿½Sï¿½Å²dï¿½ï¿½ï¿½ï¿½h?;qï¿½$Y,ï¿½ï¿½Kï¿½*ï¿½xï¿½\"ï¿½ï¿½ï¿½ï¿½eï¿½ï¿½ï¿½Tï¿½~ï¿½ï¿½ï¿½fee!Øï¿½N\\,+//Wï¿½ï¿½ZÅ‹/ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½(ï¿½ï¿½yï¿½ï¿½ï¿½9ï¿½LZï¿½h4ï¿½ï¿½ï¿½bï¿½ï¿½ï¿½ï¿½w.q~ï¿½ÝºuJOGGG/\\ï¿½0g_\\ï¿½3ï¿½ï¿½ï¿½ï¿½Gï¿½ï¿½ï¿½Uï¿½ï¿½ï¿½Çµï¿½aï¿½ï¿½ï¿½XTTTVVï¿½Tï¿½ï¿½ï¿½ï¿½ï¿½ï¿½hï¿½\'%7ï¿½gÏžU*ï¿½ï¿½Oï¿½\\ï¿½ï¿½Uï¿½ï¿½]ï¿½8ï¿½{ï¿½T\Zï¿½\'Ob2\\ï¿½ï¿½hlhhPï¿½ï¿½eË–)=ï¿½)!Ø‰ï¿½ï¿½^ï¿½pï¿½Rï¿½|ï¿½Ö­ï¿½ï¿½ï£¹VAQï¿½ï¿½hlmmU*P\\\\ï¿½ï¿½ï¿½ï¿½)ï¿½ï¿½ï¿½ï¿½ï¿½Qï¿½ï¿½ï¿½Tnï¿½?ï¿½ï¿½ï¿½7cï¿½ï¿½dï¿½tï¿½ï¿½Ó¼ï¿½ï¿½ï¿½\nï¿½ï¿½eï¿½ï¿½ï¿½`\'B>ï¿½Ti/ï¿½ï¿½ï¿½{ï¿½.ï¿½Nï¿½aï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Iï¿½ï¿½lï¿½ï¿½ï¿½<;1v\"$I*((Pzï¿½ï¿½ï¿½;44ï¿½~ï¿½ï¿½hï¿½ï¿½zï¿½*sï¿½%%%*ï¿½OAï¿½|ï¿½Eï¿½ï¿½ï¿½|ï¿½Gï¿½ Ü¹sï¿½ï¿½yï¿½6ï¿½Qï¿½ï¿½ï¿½[ï¿½Wï¿½rï¿½1ï¿½N\0ï¿½7ï¿½Fï¿½Lï¿½4\nuwwcï¿½ï¿½4ï¿½ï¿½ï¿½ï¿½ï¿½.ï¿½ï¿½ï¼¼<ï¿½Å‚`\'\0ï¿½ï¿½ï¿½ .ï¿½Kï¿½i$ï¿½uï¿½ï¿½ï¿½Dï¿½tWWW8V*ï¿½ï¿½ï¿½ï¿½ ï¿½qï¿½Fï¿½UUUJOï¿½ï¿½ï¿½;ï¿½ï¿½ï¿½ï¿½&ï¿½ï¿½ï¿½Ù©T`Ñ¢EXï¿½ï¿½\0;nï¿½ ï¿½ï¿½mvï¿½ï¿½Mï¿½ï¿½ï¿½ï¿½ï¿½`P	vAAï¿½p&\0ï¿½ï¿½ï¿½ï¿½*ï¿½;::pï¿½\\\\Xï¿½ï¿½ï¿½ï¿½VzZZZï¿½ï¿½ï¿½ ï¿½ï¿½$);;[ï¿½ï¿½=00ï¿½]qï¿½iï¿½ï¿½ï¿½Sy:oï¿½<d;^ï¿½\nï¿½Gï¿½ï¿½ï¿½lï¿½ï¿½1ï¿½ï¿½\'Iï¿½ï¿½2ï¿½ï¿½ï¿½ï¿½>b&\'\'ï¿½ï¿½Bï¿½ï¿½#ï¿½ï¿½yï¿½:ï¿½ï¿½ï¿½ï¿½G?<ï¿½4ï¿½Gï¿½-vï¿½ï¿½ï¿½ï¿½gï¿½*ï¿½wllï¿½u(ï¿½Rï¿½Ü‹eï¿½ï¿½ï¿½l;^v|$I2ï¿½ï¿½Jï¿½è±±1ï¿½@Ó´ï¿½ï¿½Szï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½$ï¿½d2)ï¿½K)ï¿½ï¿½ï¿½c&##-vï¿½ï¿½ï¿½ï¿½/ï¿½ï¿½ï¿½=11ï¿½ï¿½x(ï¿½Rï¿½jï¿½ï¿½ï¿½ï¿½ï¿½lï¿½ï¿½/;>ï¿½ï¿½ï¿½hï¿½N\0EQ*ï¿½Pï¿½O\0ï¿½7ï¿½yo,Oï¿½ÊŸ/\Zï¿½?Y|,Ë™3gnÝºï¿½è¨aï¿½ï¿½ï¿½ï¿½ï¿½Jï¿½|ï¿½ï¿½ï¿½Ã‡ï¿½rï¿½4=44dï¿½Xï¿½Rï¿½ï¿½Eï¿½Ý»7ï¿½uH3ï¿½ (mKï¿½ï¿½ï¿½ï¿½Oï¿½(ï¿½Jï¿½qï¿½eï¿½ï¿½Zï¿½1ï¿½ï¿½ÙŒï¿½i\Zï¿½gfï¿½\0!ï¿½\0Bï¿½ï¿½`ï¿½ ï¿½\r@ ï¿½@6\0ï¿½l\0!ï¿½\0Bï¿½ï¿½`ï¿½ ï¿½\r@ ï¿½@6\0ï¿½l\0!ï¿½\0Bï¿½ï¿½`ï¿½ ï¿½\r@ ï¿½@6\0ï¿½l\0!ï¿½\0Bï¿½ï¿½`ï¿½ ï¿½\r@ ï¿½@6\0ï¿½l\0!ï¿½\0Bï¿½ï¿½`ï¿½ ï¿½\r@ ï¿½@6\0ï¿½l\0!ï¿½\0Bï¿½ï¿½`ï¿½ ï¿½\r@ ï¿½@6\0ï¿½l\0!ï¿½\0Bï¿½ï¿½`ï¿½ ï¿½\r@ ï¿½@6\0ï¿½l\0!ï¿½\0Bï¿½ï¿½`ï¿½ ï¿½\r@ ï¿½@6\0ï¿½l\0!ï¿½\0Bï¿½ï¿½`ï¿½ ï¿½\r@ ï¿½@6\0ï¿½l\0!ï¿½\0Bï¿½ï¿½`ï¿½ ï¿½\r@ ï¿½@6\0ï¿½l\0!ï¿½\0Bï¿½ï¿½`ï¿½ ï¿½\r@ ï¿½@6\0ï¿½l\0!ï¿½\0Bï¿½ï¿½Íª×BJï¿½ï¿½\0\0\0\0IENDï¿½B`ï¿½'),('1129506976','Cedula de Ciudadania','ASHLEY','DEFORT','3215795146','ashley@gmail.com','74d956c9d0e79e4d105491bf9d9d99e80a803b6b','Calle 59C 22E-10','ADMIN',NULL),('123','Tarjeta de Identidad','KENER','ROMERO','123','kener@gmail.com','93b16f06785d1f7773d056c1b7501f39abf371f1','calle 42#31-69','ADMIN','ï¿½PNG\r\n\Z\n\0\0\0\rIHDR\0\0H\0\0H\0\0\0ï¿½vï¿½d\0\0\0sBITï¿½ï¿½Oï¿½\0\0\0_zTXtRaw profile type APP1\0\0ï¿½ï¿½JOï¿½K-ï¿½LV((ï¿½Oï¿½ï¿½Iï¿½R\0c.KKï¿½D04006ï¿½F@ï¿½9T(ï¿½\0ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Yï¿½ï¿½)ï¿½ï¿½\0Oï¿½h-ØŒ\0\0ï¿½IDATxï¿½ï¿½ï¿½Ylï¿½ï¿½ï¿½co{×»ï¿½8>ï¿½ï¿½^;ï¿½ï¿½1ï¿½ï¿½4ï¿½Rqï¿½@\nFï¿½ï¿½Fï¿½ï¿½FJï¿½*ï¿½}*}hUU%EEUb\"DIï¿½Qï¿½8ï¿½`csClï¿½k{ï¿½ï¿½ï¿½3ï¿½3ï¿½5ï¿½<cï¿½bï¿½ï¿½ï¿½ï¿½ï¿½<f~ï¿½lï¿½ï¿½1ï¿½ï¿½Ú»wï¿½\0ï¿½B\'ï¿½\00ï¿½l\0!ï¿½\0Bï¿½ï¿½`ï¿½ ï¿½\r@ ï¿½@6\0ï¿½l\0!ï¿½\0Bï¿½ï¿½`ï¿½ ï¿½\r@ ï¿½@6\0ï¿½l\0!ï¿½\0Bï¿½ï¿½`ï¿½ ï¿½\r@ ï¿½@6\0ï¿½l\0!ï¿½\0Bï¿½ï¿½`ï¿½ ï¿½\r@ ï¿½@6\0ï¿½l\0!ï¿½\0Bï¿½ï¿½`ï¿½ ï¿½\r@ ï¿½@6\0ï¿½l\0!ï¿½\0Bï¿½ï¿½`ï¿½ ï¿½\r@ ï¿½@6\0ï¿½l\0!ï¿½\0Bï¿½ï¿½`ï¿½ ï¿½\r@ ï¿½@6\0ï¿½l\0!ï¿½\0Bï¿½ï¿½`ï¿½ ï¿½\r@ ï¿½@6\0ï¿½l\0!ï¿½\0Bï¿½ï¿½`ï¿½ ï¿½\r@ ï¿½@6\0ï¿½l\0!ï¿½\0Bï¿½ï¿½`ï¿½ ï¿½\r@ ï¿½@6\0ï¿½l\0!ï¿½\0Bï¿½ï¿½`ï¿½ ï¿½\r@ ï¿½@6\0ï¿½l\0!ï¿½\0bï¿½]ï¿½yï¿½Ct:ï¿½ ?(ï¿½0ï¿½Nï¿½ï¿½ï¿½ï¿½Zï¿½lBï¿½ï¿½!B,ï¿½Fï¿½Fï¿½ï¿½fï¿½Yï¿½Ö¬ï¿½,ï¿½ï¿½rrr~PrxxXï¿½ï¿½ï¿½ï¿½ï¿½`0811ï¿½qï¿½^ï¿½gYV<\0ï¿½Noï¿½$	ï¿½ï¿½qï¿½ï¿½ï¯¬ï¿½tï¿½\\eeeï¿½ï¿½d2ï¿½Lï¿½ï¿½ï¿½ï¿½ï¿½233ï¿½)ï¿½ï¿½/IR ï¿½D\"ï¿½Hï¿½ï¿½ï¿½Ý¹sï¿½ï¿½Í›ï¿½nï¿½ï¿½ï¿½ï¿½4Ã OkvZï¿½$)ï¿½ï¿½ï¿½h4\Z,Xï¿½bÅŠeË–Yï¿½Vï¿½eï¿½zï¿½ï¿½ï¿½ï¿½nï¿½Ù¾ï¿½/Ë—/ï¿½ï¿½b~ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Ëƒï¿½ï¿½ï¿½ï¿½4Í²,ï¿½ï¿½ï¿½ï¿½{ï¿½&ï¿½ï¿½ï¿½t:ï¿½Ò¥Kï¿½.]ZYYï¿½ï¿½ï¿½7ï¿½?ï¿½Þ½{ï¿½ï¿½ï¿½Wï¿½^ï¿½zï¿½ï¿½Nï¿½3\Zï¿½3ï¿½#`Vï¿½ï¿½Nï¿½$Eï¿½Qï¿½ï¿½ï¿½ï¿½ï¿½/?ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½gJ^^^^^^mmï¿½ï¿½ï¿½Pccï¿½gï¿½}ï¿½p8ï¿½z=Zï¿½tï¿½;=ï¿½<o2ï¿½ï¿½ï¿½ï¿½6oï¿½ï¿½ï¿½Ojï¿½ï¿½ï¿½ï¿½ï¿½>ï¿½ï¿½ÓŽï¿½ï¿½H$b04ï¿½ï¿½\0ï¿½ï¿½ï¿½&ï¿½u\05ï¿½$ï¿½Bï¿½ï¿½ï¿½~ï¿½ï¿½ï¿½_ß¸qcVVï¿½ï¿½uï¿½ï¿½ï¿½Zï¿½|yyyï¿½ï¿½ï¿½D?ï¿½ï¿½Ô‡ï¿½xï¿½ï¿½ï¿½ï¿½ï¿½Ý»ï¿½ï¿½ï¿½ï¿½jï¿½&ï¿½>EEE---4\Zï¿½ï¿½w*Cï¿½ï¿½ï¿½ï¿½yï¿½Kï¿½ï¿½ï¿½wï¿½sï¿½\\)ï¿½6,Xï¿½zï¿½ï¿½ï¿½Ý»Gï¿½4ï¿½ï¿½ï¿½0ï¿½NEï¿½(Fï¿½Ñ;wï¿½^ï¿½:ï¿½ï¿½h4ï¿½ï¿½zï¿½~8ï¿½ï¿½ï¿½ï¿½Éï¿½ï¿½lï¿½ï¿½ï¿½t:ï¿½ï¿½y=ï¿½(ï¿½ï¿½Î;ï¿½ï¿½ï¿½ï¿½Gï¿½ï¿½ï¿½4&ï¿½tï¿½SN4\Zï¿½iï¿½ï¿½7ß¬ï¿½ï¿½ï¿½ï¿½ï¿½^ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½kxxx||<ï¿½ï¿½ï¿½D\"ß—1ï¿½Lrï¿½322ï¿½v{NNï¿½Â…+++ï¿½Nï¿½ï¿½ï¿½ï¿½h\\ï¿½nï¿½ï¿½ï¿½ï¿½×¿ï¿½ï¿½Fï¿½ï¿½fZï¿½ï¿½ï¿½ï¿½|iiï¿½ï¿½ï¿½ó¢¢¢i~$ï¿½xï¿½Þ›7oï¿½<yï¿½Î;zï¿½^^:ï¿½ï¿½:ï¿½ï¿½;ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Fï¿½@YYï¿½Æ].ï¿½ï¿½ï¿½4ï¿½Lï¿½ï¿½ï¿½ï¿½ï¿½ï¿½===)2X\0ï¿½ï¿½B8ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½p8ï¿½S>ï¿½uttï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½~ï¿½ï¿½ï¿½8ï¿½ï¿½Aï¿½Ã™ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½<ï¿½LUUï¿½Nï¿½Cï¿½ï¿½ï¿½ï¿½ï¿½ï¿½7::ï¿½u,ï¿½ï¿½N<ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ÏŸNï¿½ï¿½ï¿½ï¿½O?ï¿½tppï¿½ï¿½yï¿½ï¿½0Sï¿½Xï¿½$ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Í›7ï¿½ï¿½ï¿½ï¿½|ï¿½ï¿½ï¿½ï¿½ï¿½;ï¿½ï¿½ï¿½hï¿½Sfï¿½Sï¿½ï¿½/ï¿½ï¿½ï¿½ï¿½ï¿½Nï¿½Guuu9rï¿½ï¿½Ñ£ï¿½`pÆ—sS%7ï¿½>ï¿½ï¿½ï¿½ï¿½ï¿½wï¿½ï¿½u:ï¿½ï¿½ï¿½ï¿½êŸ²Zï¿½Kï¿½,ï¿½ï¿½ï¿½ï¿½x<ï¿½\"ï¿½\nï¿½ï¿½!\nï¿½ï¿½ï¿½2?ï¿½Xï¿½ï¿½ï¿½ï¿½ï¿½ï¿½^ooï¿½ï¿½jï¿½ï¿½ï¿½MEï¿½4m4\Zï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½fsaaï¿½zb-Keeï¿½\'ï¿½|ï¿½yï¿½Tï¿½`\'ï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½K>xï¿½`ï¿½ï¿½ï¿½gÎœï¿½ï¿½tï¿½ï¿½Bï¿½,ï¿½ï¿½Z[[{{{ï¿½ï¿½ï¿½ï¿½ï¿½X,ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½vygï¿½65ï¿½I!ï¿½ï¿½$ï¿½Kï¿½ï¿½g?ï¿½ï¿½ï¿½V/ï¿½ï¿½Ó³oï¿½>ï¿½ï¿½c2ï¿½4^BQï¿½^ï¿½ï¿½wï¿½ï¿½ï¿½ï¿½_ï¿½ï¿½ï¿½p8T*ï¿½p8G[[fI.;ï¿½Bï¿½ï¿½/ï¿½ï¿½yï¿½fï¿½b×¯_ï¿½ï¿½?ï¿½ï¿½q\\ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Ë…ï¿½ï¿½ï¿½ï¿½ï¿½*%ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½0ï¿½ï¿½Dvï¿½Dï¿½ï¿½ï¿½ï¿½Ò·ï¿½~[ï¿½eEï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½$}Rï¿½ï¿½ï¿½h4zï¿½ï¿½ï¿½^ï¿½hï¿½\"ï¿½jï¿½ï¿½ï¿½7nxï¿½Þ¤ï¿½yï¿½ï¿½@(9DQ4ï¿½ï¿½;vï¿½Pï¿½655}ï¿½ï¿½6ï¿½-Eï¿½ï¿½4Mï¿½lï¿½?ï¿½ï¿½ï¿½ï¿½Iï¿½EQ;vï¿½0ï¿½Í¢(jV7xZï¿½ï¿½D\"ï¿½×¯ï¿½ï¿½Uï¿½\\ï¿½rï¿½ï¿½ï¿½ß—\'ï¿½5ï¿½Ø”(ï¿½bï¿½ï¿½ï¿½3??ï¿½ï¿½\'ï¿½P*ï¿½ï¿½ï¿½ï¿½oÞ¼ï¿½Õ¦Iï¿½Bß˜ï¿½CEï¿½Ó¹iï¿½&ï¿½2}}}ï¿½ï¿½ï¿½Kï¿½ï¿½eï¿½ï¿½9ï¿½Û·o___ï¿½Jï¿½Mï¿½69ï¿½N4ï¿½Iï¿½r_ï¿½ï¿½`||ï¿½ï¿½ï¿½ï¿½l6+ï¿½zï¿½ï¿½ï¿½ï¿½ï¿½nOï¿½Tï¿½hï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½U*c6ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Çµï¿½ï¿½Rï¿½{Cï¿½X,VUUï¿½ï¿½Tï¿½ï¿½ï¿½ï¿½\'Oï¿½ï¿½ï¿½Nsï¿½vï¿½ï¿½,ï¿½ï¿½ï¿½{ï¿½ï¿½Iï¿½ï¿½Ê¸ï¿½îªªï¿½X,ï¿½eï¿½@ï¿½`kLï¿½$Q7nï¿½hï¿½Xï¿½Ê´ï¿½ï¿½ï¿½:u*-6Tï¿½ï¿½Sï¿½Nï¿½ï¿½ï¿½*ï¿½X,7nEQï¿½Rï¿½Aï¿½5%Â¢Eï¿½***ï¿½\nï¿½ï¿½ï¿½zï¿½Å’ï¿½;(ï¿½ï¿½X,ï¿½ï¿½ï¿½ï¿½@@ï¿½LEEÅ¢Eï¿½ï¿½ffï¿½ï¿½)ï¿½ï¿½jjjTï¿½\r>yï¿½d8NÙ¡ï¿½ï¿½hï¿½ï¿½ï¿½\'Oï¿½T*ï¿½ï¿½ï¿½ï¿½vï¿½>ï¿½4ï¿½6_ 2ï¿½ï¿½ï¿½^ï¿½iOOOccï¿½ï¿½9H&ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Gï¿½ï¿½sï¿½=\nï¿½ï¿½ï¿½ ï¿½Ú‰ï¿½bnï¿½[it-B[[ï¿½ï¿½ï¿½x\Z5ï¿½2ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Ú”ï¿½ï¿½6ï¿½ï¿½é§Ÿï¿½ï¿½ï¿½ï¿½ï¿½;ï¿½ï¿½Bï¿½P]]ï¿½ï¿½Ó‘ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½3{ï¿½ï¿½hlhhQ*PWWï¿½F[Kï¿½FDQï¿½ï¿½ï¿½Sï¿½>ï¿½ï¿½ï¿½,IRZÌ™=ï¿½ï¿½(Iï¿½ï¿½ï¿½ï¿½ï¿½\nï¿½ï¿½ï¿½ï¿½ï¿½ï¿½aï¿½ï¿½flï¿½Dï¿½Qï¿½Ë¥ï¿½ï¿½ï¿½ï¿½ï¿½i7ï¿½~ï¿½ï¿½d:}ï¿½ï¿½ï¿½Sï¿½ï¿½ï¿½rï¿½ï¿½Ñ¨ï¿½Uï¿½ï¿½lï¿½ï¿½ï¿½XUUï¿½ï¿½7nï¿½ï¿½4mï¿½eEï¿½ï¿½7nLï¿½Tï¿½x-ï¿½fl-Hï¿½dï¿½ï¿½Tï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Cï¿½ÓŽ\\yï¿½ï¿½TVVï¿½ï¿½fï¿½Jm ï¿½Zï¿½w}(~411ï¿½ï¿½ï¿½Cï¿½ï¿½eï¿½azzz&&&&}ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½F[ï¿½ï¿½`ï¿½ï¿½ï¿½Iï¿½zï¿½ï¿½ï¿½ï¿½~2ï¿½ï¿½ï¿½ß¯ï¿½-ï¿½nï¿½ï¿½ï¿½v[ï¿½DQTï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Gï¿½4=22ï¿½ï¿½uB?ï¿½p8lmï¿½ï¿½ï¿½)-ï¿½b1ï¿½~ï¿½$Iï¿½oï¿½& ï¿½2ï¿½ï¿½oß¾ï¿½4ï¿½.,,ï¿½2mï¿½}Jqï¿½ (]y\'ï¿½ï¿½ï¿½pï¿½ï¿½Ðœ>ï¿½eï¿½ï¿½ï¿½ï¿½ï¿½ï¿½9ï¿½Nï¿½ï¿½ï¿½ï¿½Aï¿½ï¿½ï¿½(0ï¿½ï¿½1388ï¿½ï¿½ï¿½v8ï¿½6l-ï¿½ï¿½tÔ¾$I>ï¿½/ï¿½_t=ï¿½ï¿½(ï¿½Ï§ï¿½ï¿½Zï¿½ï¿½6l-ï¿½<ï¿½ï¿½ï¿½Tï¿½ï¿½ï¿½ï¿½Qï¿½ï¿½=::ï¿½ï¿½ï¿½ï¿½\\ï¿½ï¿½V`!ï¿½\ZQï¿½ï¿½Kï¿½ï¿½ï¿½ï¿½I\nï¿½ï¿½ï¿½Wï¿½e5ï¿½Ïœï¿½`ï¿½ ï¿½ï¿½ï¿½ï¿½61ï¿½d*ï¿½1#ï¿½Ô‡`kï¿½eYï¿½ï¿½?ï¿½#ï¿½ï¿½\n\nï¿½Yï¿½%ï¿½bAAï¿½ï¿½zï¿½ï¿½OØ¿b)ï¿½ï¿½Ë²*ï¿½ï¿½ï¿½L&bfï¿½$IRï¿½U>22ï¿½`kï¿½ï¿½ï¿½0ï¿½`Pï¿½QII	1owA())QZoï¿½Yï¿½ï¿½ï¿½l-ï¿½,ï¿½ï¿½x&}Dï¿½ï¿½ï¿½yï¿½Hï¿½Ï›7Oï¿½+ï¿½ï¿½xï¿½bkï¿½ï¿½ï¿½0J]qï¿½ï¿½ï¿½ï¿½Ë‰9vï¿½ï¿½ï¿½ï¿½rï¿½`ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Zlï¿½Ngï¿½ÛN\'ï¿½lIï¿½Tï¿½ï¿½ï¿½tï¿½ï¿½ï¿½![ï¿½hï¿½ï¿½ï¿½|Jï¿½m6[~~>ï¿½lAï¿½ï¿½ï¿½m6Û¤O#ï¿½Hï¿½ï¿½ï¿½Fl-ï¿½ï¿½ï¿½wï¿½Þ¤Oï¿½Í›W\\\\LFï¿½ï¿½ï¿½ï¿½ï¿½Í›7ï¿½ï¿½{ï¿½ï¿½yï¿½^bvï¿½ï¿½8ï¿½ï¿½ï¿½@Ó´ï¿½ï¿½Uï¿½WVVjYï¿½Ù£ï¿½x<[3ï¿½+kDï¿½ï¿½ï¿½ï¿½+ï¿½~Ë—Hï¿½ï¿½0[ï¿½$ï¿½ï¿½ï¿½Iï¿½\nï¿½ï¿½ï¿½Ofï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Ö¦ï¿½ï¿½ï¿½bï¿½ï¿½Yï¿½&ï¿½ï¿½4ï¿½<ï¿½fï¿½\Zï¿½ï¿½ï¿½ï¿½kï¿½ï¿½Æµï¿½ï¿½lï¿½0ï¿½ï¿½Õ¥tï¿½ï¿½Nï¿½[ï¿½vmï¿½6ï¿½rsï¿½vï¿½Zï¿½^ï¿½ï¿½ï¿½ï¿½Sï¿½Aï¿½ï¿½ï¿½ï¿½ë›šï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½4ï¿½\'\Zï¿½ï¿½ï¿½î¼¼<ï¿½MMMXï¿½ï¿½%[;Fï¿½ï¿½Ø±cJOM&Ó†\rXï¿½Mï¿½F[ï¿½$ï¿½e7lØ ï¿½Jï¿½Ø±cizï¿½hï¿½Bï¿½ï¿½CQï¿½ï¿½lï¿½tï¿½Rï¿½ï¿½ï¿½ï¿½eË–ï¿½]ï¿½ï¿½Fï¿½-[V^^ï¿½Tï¿½Ò¥Kfï¿½oï¿½ï¿½ï¿½`kï¿½d2ï¿½ï¿½ï¿½)Mï¿½ï¿½ï¿½×ï¿½ï¿½ï¿½Qï¿½-Iï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½&ï¿½DQlkkKï¿½Dï¿½ï¿½ï¿½)ï¿½^ï¿½ï¿½ï¿½ï¿½ï¿½Ñ¡Tï¿½ï¿½ï¿½dÏž=*ï¿½iï¿½ï¿½H$ï¿½gÏžï¿½ï¿½ï¿½mmmzï¿½^ï¿½Zï¿½ï¿½)ï¿½ï¿½8ï¿½ï¿½xï¿½J{ï¿½Úµ.ï¿½+-ï¿½ï¿½pï¿½rï¿½T&Ã£ï¿½ï¿½Å‹9ï¿½C?\\cï¿½ï¿½L&Ó—_~ï¿½ï¿½ß¯Tï¿½nï¿½oß¾ï¿½fï¿½ï¿½ï¿½rQm6ï¿½ï¿½ï¿½ï¿½Uv}ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½kï¿½Nï¿½ï¿½Z__ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½]ï¿½vï¿½ï¿½lKï¿½vï¿½Ú¥2g&ï¿½b}}ï¿½ï¿½M	0ï¿½ï¿½$`Yï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Eï¿½Ì³ï¿½>ï¿½eï¿½ï¿½3ï¿½ï¿½H>}Ë–-ï¿½>ï¿½ï¿½Jï¿½ï¿½ï¿½ï¿½ï¿½ï¿½~ï¿½ï¿½N\nï¿½ï¿½ï¿½&ï¿½uï¿½ï¿½(ï¿½\Zï¿½ï¿½ï¿½Tï¿½ï¿½ï¿½ï¿½***Xï¿½ï¿½qï¿½Ë²ï¿½3Fï¿½$)ï¿½lÛ¶ï¿½ï¿½W_Uï¿½ï¿½144ï¿½ï¿½ï¿½ï¿½G\"ï¿½ï¿½H\nï¿½Ñ“Cï¿½ï¿½ï¿½Ô©S*eXï¿½]ï¿½nï¿½Ê•+Cï¿½ï¿½fï¿½R(Zï¿½rï¿½uï¿½Ô›ï¿½Sï¿½Nï¿½tï¿½`ï¿½Aï¿½ï¿½4zï¿½ï¿½ï¿½oï¿½-(((,,T*c0*++%Ijoo7ï¿½Lï¿½mï¿½ï¿½WÖ¯ï¿½ï¿½J]]]FFï¿½Jï¿½ï¿½ï¿½ï¿½Gï¿½btï¿½Dv2ï¿½,ï¿½ï¿½ï¿½^YYï¿½ï¿½ï¿½ï¿½Tï¿½`0TUUï¿½ï¿½ä´µï¿½Qï¿½ï¿½ï¿½ï¿½ ï¿½hï¿½ï¿½ï¿½ï¿½ï¿½Mï¿½ï¿½ï¿½vuuï¿½ß¿_ï¿½×§ï¿½ï¿½aBï¿½ï¿½ï¿½ï¿½ï¿½X,vï¿½ï¿½ï¿½ï¿½ï¿½jï¿½Ù¬Rï¿½ï¿½ï¿½$??ï¿½ï¿½oï¿½MÊ™ï¿½ï¿½H$++ï¿½7ï¿½xï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½:4::ï¿½9ï¿½ï¿½Bï¿½ï¿½L>ï¿½ï¿½ï¿½ï¿½ï¿½G?ï¿½ï¿½zÉ‚ï¿½ï¿½%Kï¿½ï¿½4ï¿½Mï¿½-B$Yï¿½tï¿½~ï¿½ï¿½ï¿½ï¿½ï¿½)ï¿½ï¿½ï¿½ï¿½ï¿½sï¿½Ö™%ï¿½ï¿½|ï¿½Ü½{wllï¿½ï¿½ï¿½Z}ï¿½)33ï¿½çž³ï¿½lï¿½ï¿½ï¿½^ï¿½ï¿½aï¿½ï¿½ï¿½ï¿½Jï¿½ï¿½q\\~~ï¿½Ö­[wï¿½Þï¿½ï¿½ï¿½^ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½hï¿½N	zï¿½ï¿½ï¿½ï¿½7ï¿½ï¿½\\ï¿½)ï¿½ï¿½ï¿½ï¿½ï¿½%Kï¿½ï¿½ï¿½ï¿½u:ÝŒï¿½[ï¿½H$ï¿½nÝºsï¿½Î§ï¿½zjÊï¿½bï¿½cÇŽï¿½;w.ï¿½3| Cï¿½Sï¿½<+ï¿½ï¿½ï¿½uï¿½Þ½ï¿½Ë—OYï¿½jï¿½ï¿½\\ï¿½5kï¿½ï¿½=ï¿½P(ï¿½ï¿½3ï¿½$ï¿½</Iï¿½ï¿½nï¿½ï¿½ï¿½zï¿½ï¿½ï¿½ï¿½iï¿½l8pï¿½ë¯¿6Huï¿½@ï¿½SEQ,ï¿½vwwOLLï¿½ï¿½ï¿½Oy,EQVï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½),,ï¿½Zï¿½<ï¿½ï¿½ï¿½ï¿½ï¿½$Iï¿½h4Xï¿½ï¿½+Vï¿½ï¿½ï¿½K?ï¿½ï¿½OVï¿½Xaï¿½Zï¿½ï¿½?ï¿½ï¿½ï¿½Gï¿½9wï¿½ï¿½bAï¿½Sï¿½wï¿½ï¿½dï¿½ï¿½ï¿½H$ï¿½vï¿½wï¿½Þ­t@ï¿½Ò§FGGï¿½ï¿½Û›ï¿½ï¿½ï¿½ï¿½ï¿½M&Ë²r3ï¿½pï¿½^EIï¿½Aï¿½ï¿½bï¿½Hï¿½nï¿½?ï¿½ï¿½nï¿½ï¿½ï¿½ï¿½(;;;ï¿½\r###ï¿½ï¿½ß±ï¿½ï¿½ï¿½ï¿½Cï¿½Sï¿½ï¿½Vï¿½ï¿½7ï¿½ï¿½ï¿½t&ï¿½\'566600ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Tï¿½i[ï¿½Vï¿½Ã‘ï¿½ï¿½[TTï¿½ï¿½ï¿½ï¿½Øï¿½uï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½MAvï¿½ï¿½ï¿½ï¿½Û¶m{ï¿½ï¿½Sï¿½=ï¿½D\"ï¿½ÏŸï¿½è£Aï¿½ï¿½ï¿½Ô„1vï¿½ï¿½iZ^Izï¿½ï¿½ï¿½ï¿½/ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½:tï¿½ï¿½iï¿½aï¿½<e!Ø©ï¿½ï¿½(ï¿½^?44tï¿½ï¿½qQï¿½ï¿½ï¿½ï¿½2Iï¿½$ï¿½ï¿½wï¿½ï¿½ï¿½ï¿½ï¿½/>ï¿½ï¿½ï¿½Rvwï¿½4Iï¿½(ï¿½bï¿½ï¿½ï¿½ï¿½ï¿½Kï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Aï¿½ï¿½ï¿½ï¿½Rï¿½tï¿½;Eï¿½ï¿½ï¿½FYï¿½]ï¿½xï¿½+ï¿½ï¿½ï¿½ï¿½O\Zï¿½Æ¤7ï¿½<ï¿½ï¿½ï¿½ï¿½ï¿½gÏž;w.ï¿½4ï¿½1vjBï¿½Sï¿½$Iï¿½Phï¿½ï¿½ï¿½ï¿½Wï¿½^ï¿½dÉ‚ï¿½]ï¿½Iï¿½+Wï¿½466Þ¸qï¿½d2aï¿½ï¿½jï¿½ï¿½ï¿½Ú¯-[ï¿½,_ï¿½\\eï¿½vï¿½ï¿½uï¿½ï¿½G}444dï¿½Xï¿½Ô`ï¿½\nï¿½ï¿½M&Seeï¿½ï¿½Ý»ï¿½Ngï¿½ï¿½ï¿½\'Nï¿½?ï¿½ï¿½ï¿½`Uiï¿½@ï¿½ï¿½O>ï¿½dÕªU6lXï¿½hï¿½ï¿½ï¿½\'&&ï¿½ï¿½0ï¿½ï¿½ï¿½pXÞ¤ï¿½ï¿½ï¿½pï¿½`0ï¿½L&ï¿½Ùœï¿½ï¿½ï¿½ï¿½ï¿½@GGGï¿½ï¿½ï¿½ë††ymï¿½cï¿½ï¿½ï¿½1!ï¿½Iï¿½qï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½Uï¿½ï¿½,!ï¿½ï¿½ï¿½ï¿½ï¿½{ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½aï¿½ï¿½ï¿½\'&&DQï¿½ï¿½ï¿½ï¿½Aaï¿½ï¿½FÓ´ï¿½bï¿½Zï¿½6ï¿½ï¿½ï¿½p8ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Â„ï¿½\\Qoß¾ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Osï¿½9ï¿½;iDQï¿½8ï¿½gï¿½Ù±cï¿½O<ï¿½ï¿½ï¿½ï¿½p0ï¿½sï¿½Î…:::ï¿½ï¿½@)ï¿½ï¿½_ï¿½Qï¿½ï¿½ï¿½ï¿½\rï¿½ï¿½ï¿½Lï¿½Qï¿½ï¿½$ï¿½4ï¿½xï¿½ï¿½ï¿½ï¿½Zï¿½ï¿½eï¿½ï¿½-Kï¿½ï¿½ï¿½ \'Nï¿½8uï¿½ï¿½q8q!Yï¿½ï¿½ï¿½ï¿½ï¿½W_}uï¿½ï¿½ï¿½ï¿½%ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½_ï¿½~ï¿½ï¿½ï¿½)ï¿½ï¿½ï¿½fï¿½ï¿½;#-ï¿½ï¿½?ï¿½ï¿½8Qï¿½ï¿½ï¿½ï¿½.]ZZZZ^^oDï¿½_ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Ü¤@ï¿½ï¿½ï¿½ï¿½yï¿½eï¿½~ï¿½mï¿½ï¿½W\Z;::\Zï¿½ï¿½ï¿½<ï¿½0ï¿½z`ï¿½ï¿½pï¿½ï¿½322.\\ï¿½vï¿½Wï¿½X×¿Aï¿½ï¿½ï¿½?:;;ï¿½ï¿½S{ï¿½ï¿½8ï¿½[ï¿½dï¿½ï¿½Ý»ï¿½ÏŸ?Íï¿½|ï¿½k×®;vï¿½ï¿½ï¿½dddï¿½,ï¿½ï¿½Yï¿½ï¿½$ï¿½b1ï¿½ï¿½8ï¿½Û¶mÛªUï¿½\n\n\nï¿½ï¿½fï¿½ï¿½ï¿½ï¿½\'Nï¿½ï¿½~\\\0ï¿½ï¿½Zqï¿½Hï¿½4>>ï¿½vï¿½ï¿½={ï¿½Lï¿½V8ï¿½ï¿½oï¿½9rï¿½ï¿½yï¿½kVï¿½9ï¿½ï¿½<h7fï¿½ï¿½ï¿½ï¿½Sï¿½=ï¿½fï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½?ï¿½ï¿½l6#ÛšAï¿½5\"ï¿½vÚ´iÓž={ï¿½3ï¿½Eï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½_}ï¿½U0Lï¿½Mï¿½QoÞ¼yï¿½Ê•ï¿½ï¿½ï¿½Lï¿½ï¿½aï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Nï¿½ï¿½ï¿½[ï¿½xuï¿½Î[ï¿½lï¿½N>ï¿½{ï½£Gï¿½F\"ï¿½ï¿½ï¿½Raï¿½ï¿½ï¿½ï¿½ï¿½Í›7/\\ï¿½ï¿½p8ï¿½ï¿½ï¿½ï¿½ï¿½Z+((ï¿½ï¿½ï¿½ï¿½~ï¿½z(Jï¿½_ï¿½Tï¿½ï¿½ï¿½$iddï¿½ï¿½^ï¿½ï¿½<ï¿½ï¿½ï¿½\'ï¿½|ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Èºï¿½Y\"ï¿½oï¿½yï¿½ï¿½Å‹ï¿½ï¿½ï¿½ï¿½hï¿½ï¿½ï¿½Â…ï¿½ï¿½)ï¿½{ï¿½ï¿½]r[ï¿½k×®ï¿½_~yï¿½oï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½X,ï¿½oï¿½iï¿½ff``ï¿½Ò¥Kï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½vï¿½oÜ¸ï¿½ï¿½ï¿½Yï¿½`ï¿½\"y>yï¿½ï¿½ï¿½ï¿½×¯ï¿½ï¿½{ï¿½ï¿½ï¿½ï¿½ï¿½;ï¿½ï¿½ï¿½ï¿½4ï¿½ï¿½ï¿½Hyï¿½ollï¿½ï¿½tï¿½ï¿½ï¿½ï¿½nï¿½ï¿½QZZzï¿½ï¿½yï¿½ï¿½VÕœsï¿½Ykjjvï¿½ï¿½5eï¿½ï¿½Ù³E1-\Zï¿½Gï¿½4m0ï¿½]ï¿½6::ï¿½hï¿½\"ï¿½CÚœNï¿½ï¿½ï¿½ï¿½Ïœ9ï¿½yï¿½Ùƒ`ï¿½ï¿½ï¿½kkkï¿½zï¿½-ï¿½ï¿½78pï¿½ï¿½?ï¿½Zï¿½iï¿½P?Juï¿½8qï¿½ï¿½v;ï¿½Â…ï¿½ï¿½Nï¿½ï¿½ï¿½Õ«qï¿½Ó‡`ÏŠX,V\\\\ï¿½ï¿½_ï¿½Bï¿½Bï¿½ï¿½wï¿½ï¿½ï¿½.ï¿½l62ï¿½ï¿½,ï¿½Rï¿½ï¿½ï¿½^VVï¿½r7ï¿½Nï¿½+((ï¿½ï¿½ï¿½ï¿½\n6Ò¸ï¿½HYï¿½+ï¿½ï¿½^{M}mï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½7ß¤ï¿½	ï¿½3ï¿½eYï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Õ«*ÅŒFï¿½;ï¿½v{,Ó¬nsZï¿½&IR8~ï¿½7ï¿½yï¿½ï¿½b^ï¿½ï¿½Oï¿½S___ï¿½ï¿½>#hï¿½ï¿½ï¿½bï¿½}ï¿½Yuuunnï¿½R1ï¿½^_]]ï¿½ï¿½ï¿½$oï¿½Ñ²ï¿½ï¿½Cï¿½=ï¿½8ï¿½[ï¿½vï¿½ï¿½eï¿½ï¿½pï¿½Ð¡C^ï¿½ï¿½ï¿½Tï¿½hï¿½ï¿½ï¿½ï¿½9tï¿½Pï¿½Jï¿½ï¿½ï¿½ï¿½mÛ¶Eï¿½ï¿½ï¿½ï¿½J{&	ï¿½PPPï¿½nï¿½:ï¿½qc(:rï¿½Èµkï¿½Nï¿½ï¿½aï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½*ï¿½^xï¿½ï¿½Ë—ï¿½<ï¿½Yï¿½ï¿½{&ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½|ï¿½2ï¿½~ï¿½ï¿½_|1Gï¿½bYv||ï¿½ï¿½ï¿½s(R*c0ï¿½mï¿½&\Zï¿½ï¿½`ï¿½ï¿½ãª«ï¿½ï¿½nï¿½Jï¿½ï¿½ï¿½ï¿½>ï¿½ ï¿½{ï¿½Ò‘^ï¿½ihhPï¿½mnnï¿½;=ï¿½	ï¿½É³ï¿½!ï¿½ï¿½nï¿½ï¿½oï¿½rnYggï¿½ï¿½ï¿½ï¿½ï¿½9ï¿½zï¿½ï¿½ï¿½ï¿½ï¿½ï¿½tï¿½ï¿½ï¿½(ï¿½ï¿½ï¿½ï¿½\Z\Zï¿½ï¿½Ð²nï¿½Bï¿½=3AXï¿½~ï¿½Êï¿½ï¿½ï¿½ï¿½ï¿½ï¿½DQï¿½ï¿½l>rï¿½HWWï¿½Rï¿½ï¿½ï¿½Ì—^zï¿½atï¿½gÄœï¿½ï¿½ï¿½ArrrVï¿½\\ï¿½ï¿½744tvvÎ‘ï¿½ï¿½ï¿½hï¿½ï¿½È‘#*ï¿½uï¿½Ý¥ï¿½ï¿½xï¿½=#ï¿½7oï¿½lï¿½Ù”\n\\ï¿½|ï¿½Ô©Sfï¿½Yï¿½Zï¿½\Zï¿½^ï¿½ï¿½ï¿½}ï¿½ï¿½qï¿½Eï¿½Ø±#hY+R!ØKEï¿½Ó¹|ï¿½rï¿½gÏžMï¿½+ï¿½ï¿½ï¿½h4655\r*(++ï¿½ï¿½ï¿½ï¿½Fï¿½ZÖŠHï¿½ï¿½\nï¿½?ï¿½ï¿½OUN;ï¿½tï¿½ï¿½Õ«Wï¿½tï¿½ï¿½ï¿½bï¿½ï¿½ï¿½|ï¿½ï¿½*ï¿½ï¿½nÝºï¿½ï¿½ï¿½ï¿½Xbï¿½XUUUuuï¿½Rï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½9ï¿½	ï¿½ï¿½hï¿½ï¿½Onß¾ï¿½Tï¿½ï¿½ï¿½hÅŠhï¿½ï¿½ï¿½XAxï¿½ï¿½Uï¿½(~ï¿½ï¿½ï¿½Ø™ï¿½ï¿½ï¿½ÙŸ}ï¿½ï¿½ï¿½Sï¿½Å²dï¿½ï¿½ï¿½ï¿½h?;qï¿½$Y,ï¿½ï¿½Kï¿½*ï¿½xï¿½\"ï¿½ï¿½ï¿½ï¿½eï¿½ï¿½ï¿½Tï¿½~ï¿½ï¿½ï¿½fee!Øï¿½N\\,+//Wï¿½ï¿½ZÅ‹/ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½(ï¿½ï¿½yï¿½ï¿½ï¿½9ï¿½LZï¿½h4ï¿½ï¿½ï¿½bï¿½ï¿½ï¿½ï¿½w.q~ï¿½ÝºuJOGGG/\\ï¿½0g_\\ï¿½3ï¿½ï¿½ï¿½ï¿½Gï¿½ï¿½ï¿½Uï¿½ï¿½ï¿½Çµï¿½aï¿½ï¿½ï¿½XTTTVVï¿½Tï¿½ï¿½ï¿½ï¿½ï¿½ï¿½hï¿½\'%7ï¿½gÏžU*ï¿½ï¿½Oï¿½\\ï¿½ï¿½Uï¿½ï¿½]ï¿½8ï¿½{ï¿½T\Zï¿½\'Ob2\\ï¿½ï¿½hlhhPï¿½ï¿½eË–)=ï¿½)!Ø‰ï¿½ï¿½^ï¿½pï¿½Rï¿½|ï¿½Ö­ï¿½ï¿½ï£¹VAQï¿½ï¿½hlmmU*P\\\\ï¿½ï¿½ï¿½ï¿½)ï¿½ï¿½ï¿½ï¿½ï¿½Qï¿½ï¿½ï¿½Tnï¿½?ï¿½ï¿½ï¿½7cï¿½ï¿½dï¿½tï¿½ï¿½Ó¼ï¿½ï¿½ï¿½\nï¿½ï¿½eï¿½ï¿½ï¿½`\'B>ï¿½Ti/ï¿½ï¿½ï¿½{ï¿½.ï¿½Nï¿½aï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Iï¿½ï¿½lï¿½ï¿½ï¿½<;1v\"$I*((Pzï¿½ï¿½ï¿½;44ï¿½~ï¿½ï¿½hï¿½ï¿½zï¿½*sï¿½%%%*ï¿½OAï¿½|ï¿½Eï¿½ï¿½ï¿½|ï¿½Gï¿½ Ü¹sï¿½ï¿½yï¿½6ï¿½Qï¿½ï¿½ï¿½[ï¿½Wï¿½rï¿½1ï¿½N\0ï¿½7ï¿½Fï¿½Lï¿½4\nuwwcï¿½ï¿½4ï¿½ï¿½ï¿½ï¿½ï¿½.ï¿½ï¿½ï¼¼<ï¿½Å‚`\'\0ï¿½ï¿½ï¿½ .ï¿½Kï¿½i$ï¿½uï¿½ï¿½ï¿½Dï¿½tWWW8V*ï¿½ï¿½ï¿½ï¿½ ï¿½qï¿½Fï¿½UUUJOï¿½ï¿½ï¿½;ï¿½ï¿½ï¿½ï¿½&ï¿½ï¿½ï¿½Ù©T`Ñ¢EXï¿½ï¿½\0;nï¿½ ï¿½ï¿½mvï¿½ï¿½Mï¿½ï¿½ï¿½ï¿½ï¿½`P	vAAï¿½p&\0ï¿½ï¿½ï¿½ï¿½*ï¿½;::pï¿½\\\\Xï¿½ï¿½ï¿½ï¿½VzZZZï¿½ï¿½ï¿½ ï¿½ï¿½$);;[ï¿½ï¿½=00ï¿½]qï¿½iï¿½ï¿½ï¿½Sy:oï¿½<d;^ï¿½\nï¿½Gï¿½ï¿½ï¿½lï¿½ï¿½1ï¿½ï¿½\'Iï¿½ï¿½2ï¿½ï¿½ï¿½ï¿½>b&\'\'ï¿½ï¿½Bï¿½ï¿½#ï¿½ï¿½yï¿½:ï¿½ï¿½ï¿½ï¿½G?<ï¿½4ï¿½Gï¿½-vï¿½ï¿½ï¿½ï¿½gï¿½*ï¿½wllï¿½u(ï¿½Rï¿½Ü‹eï¿½ï¿½ï¿½l;^v|$I2ï¿½ï¿½Jï¿½è±±1ï¿½@Ó´ï¿½ï¿½Szï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½$ï¿½d2)ï¿½K)ï¿½ï¿½ï¿½c&##-vï¿½ï¿½ï¿½ï¿½/ï¿½ï¿½ï¿½=11ï¿½ï¿½x(ï¿½Rï¿½jï¿½ï¿½ï¿½ï¿½ï¿½lï¿½ï¿½/;>ï¿½ï¿½ï¿½hï¿½N\0EQ*ï¿½Pï¿½O\0ï¿½7ï¿½yo,Oï¿½ÊŸ/\Zï¿½?Y|,Ë™3gnÝºï¿½è¨aï¿½ï¿½ï¿½ï¿½ï¿½Jï¿½|ï¿½ï¿½ï¿½Ã‡ï¿½rï¿½4=44dï¿½Xï¿½Rï¿½ï¿½Eï¿½Ý»7ï¿½uH3ï¿½ (mKï¿½ï¿½ï¿½ï¿½Oï¿½(ï¿½Jï¿½qï¿½eï¿½ï¿½Zï¿½1ï¿½ï¿½ÙŒï¿½i\Zï¿½gfï¿½\0!ï¿½\0Bï¿½ï¿½`ï¿½ ï¿½\r@ ï¿½@6\0ï¿½l\0!ï¿½\0Bï¿½ï¿½`ï¿½ ï¿½\r@ ï¿½@6\0ï¿½l\0!ï¿½\0Bï¿½ï¿½`ï¿½ ï¿½\r@ ï¿½@6\0ï¿½l\0!ï¿½\0Bï¿½ï¿½`ï¿½ ï¿½\r@ ï¿½@6\0ï¿½l\0!ï¿½\0Bï¿½ï¿½`ï¿½ ï¿½\r@ ï¿½@6\0ï¿½l\0!ï¿½\0Bï¿½ï¿½`ï¿½ ï¿½\r@ ï¿½@6\0ï¿½l\0!ï¿½\0Bï¿½ï¿½`ï¿½ ï¿½\r@ ï¿½@6\0ï¿½l\0!ï¿½\0Bï¿½ï¿½`ï¿½ ï¿½\r@ ï¿½@6\0ï¿½l\0!ï¿½\0Bï¿½ï¿½`ï¿½ ï¿½\r@ ï¿½@6\0ï¿½l\0!ï¿½\0Bï¿½ï¿½`ï¿½ ï¿½\r@ ï¿½@6\0ï¿½l\0!ï¿½\0Bï¿½ï¿½`ï¿½ ï¿½\r@ ï¿½@6\0ï¿½l\0!ï¿½\0Bï¿½ï¿½Íª×BJï¿½ï¿½\0\0\0\0IENDï¿½B`ï¿½'),('1234','Cedula de Ciudadania','GERMAN','GOENAGA','123','german@gmail.com','da91388c72d3e31da19dcd85c97374197748485d','calle 42#31-69','ADMIN','ï¿½PNG\r\n\Z\n\0\0\0\rIHDR\0\0H\0\0H\0\0\0ï¿½vï¿½d\0\0\0sBITï¿½ï¿½Oï¿½\0\0\0_zTXtRaw profile type APP1\0\0ï¿½ï¿½JOï¿½K-ï¿½LV((ï¿½Oï¿½ï¿½Iï¿½R\0c.KKï¿½D04006ï¿½F@ï¿½9T(ï¿½\0ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Yï¿½ï¿½)ï¿½ï¿½\0Oï¿½h-ØŒ\0\0ï¿½IDATxï¿½ï¿½ï¿½Ylï¿½ï¿½ï¿½co{×»ï¿½8>ï¿½ï¿½^;ï¿½ï¿½1ï¿½ï¿½4ï¿½Rqï¿½@\nFï¿½ï¿½Fï¿½ï¿½FJï¿½*ï¿½}*}hUU%EEUb\"DIï¿½Qï¿½8ï¿½`csClï¿½k{ï¿½ï¿½ï¿½3ï¿½3ï¿½5ï¿½<cï¿½bï¿½ï¿½ï¿½ï¿½ï¿½<f~ï¿½lï¿½ï¿½1ï¿½ï¿½Ú»wï¿½\0ï¿½B\'ï¿½\00ï¿½l\0!ï¿½\0Bï¿½ï¿½`ï¿½ ï¿½\r@ ï¿½@6\0ï¿½l\0!ï¿½\0Bï¿½ï¿½`ï¿½ ï¿½\r@ ï¿½@6\0ï¿½l\0!ï¿½\0Bï¿½ï¿½`ï¿½ ï¿½\r@ ï¿½@6\0ï¿½l\0!ï¿½\0Bï¿½ï¿½`ï¿½ ï¿½\r@ ï¿½@6\0ï¿½l\0!ï¿½\0Bï¿½ï¿½`ï¿½ ï¿½\r@ ï¿½@6\0ï¿½l\0!ï¿½\0Bï¿½ï¿½`ï¿½ ï¿½\r@ ï¿½@6\0ï¿½l\0!ï¿½\0Bï¿½ï¿½`ï¿½ ï¿½\r@ ï¿½@6\0ï¿½l\0!ï¿½\0Bï¿½ï¿½`ï¿½ ï¿½\r@ ï¿½@6\0ï¿½l\0!ï¿½\0Bï¿½ï¿½`ï¿½ ï¿½\r@ ï¿½@6\0ï¿½l\0!ï¿½\0Bï¿½ï¿½`ï¿½ ï¿½\r@ ï¿½@6\0ï¿½l\0!ï¿½\0Bï¿½ï¿½`ï¿½ ï¿½\r@ ï¿½@6\0ï¿½l\0!ï¿½\0bï¿½]ï¿½yï¿½Ct:ï¿½ ?(ï¿½0ï¿½Nï¿½ï¿½ï¿½ï¿½Zï¿½lBï¿½ï¿½!B,ï¿½Fï¿½Fï¿½ï¿½fï¿½Yï¿½Ö¬ï¿½,ï¿½ï¿½rrr~PrxxXï¿½ï¿½ï¿½ï¿½ï¿½`0811ï¿½qï¿½^ï¿½gYV<\0ï¿½Noï¿½$	ï¿½ï¿½qï¿½ï¿½ï¯¬ï¿½tï¿½\\eeeï¿½ï¿½d2ï¿½Lï¿½ï¿½ï¿½ï¿½ï¿½233ï¿½)ï¿½ï¿½/IR ï¿½D\"ï¿½Hï¿½ï¿½ï¿½Ý¹sï¿½ï¿½Í›ï¿½nï¿½ï¿½ï¿½ï¿½4Ã OkvZï¿½$)ï¿½ï¿½ï¿½h4\Z,Xï¿½bÅŠeË–Yï¿½Vï¿½eï¿½zï¿½ï¿½ï¿½ï¿½nï¿½Ù¾ï¿½/Ë—/ï¿½ï¿½b~ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Ëƒï¿½ï¿½ï¿½ï¿½4Í²,ï¿½ï¿½ï¿½ï¿½{ï¿½&ï¿½ï¿½ï¿½t:ï¿½Ò¥Kï¿½.]ZYYï¿½ï¿½ï¿½7ï¿½?ï¿½Þ½{ï¿½ï¿½ï¿½Wï¿½^ï¿½zï¿½ï¿½Nï¿½3\Zï¿½3ï¿½#`Vï¿½ï¿½Nï¿½$Eï¿½Qï¿½ï¿½ï¿½ï¿½ï¿½/?ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½gJ^^^^^^mmï¿½ï¿½ï¿½Pccï¿½gï¿½}ï¿½p8ï¿½z=Zï¿½tï¿½;=ï¿½<o2ï¿½ï¿½ï¿½ï¿½6oï¿½ï¿½ï¿½Ojï¿½ï¿½ï¿½ï¿½ï¿½>ï¿½ï¿½ÓŽï¿½ï¿½H$b04ï¿½ï¿½\0ï¿½ï¿½ï¿½&ï¿½u\05ï¿½$ï¿½Bï¿½ï¿½ï¿½~ï¿½ï¿½ï¿½_ß¸qcVVï¿½ï¿½uï¿½ï¿½ï¿½Zï¿½|yyyï¿½ï¿½ï¿½D?ï¿½ï¿½Ô‡ï¿½xï¿½ï¿½ï¿½ï¿½ï¿½Ý»ï¿½ï¿½ï¿½ï¿½jï¿½&ï¿½>EEE---4\Zï¿½ï¿½w*Cï¿½ï¿½ï¿½ï¿½yï¿½Kï¿½ï¿½ï¿½wï¿½sï¿½\\)ï¿½6,Xï¿½zï¿½ï¿½ï¿½Ý»Gï¿½4ï¿½ï¿½ï¿½0ï¿½NEï¿½(Fï¿½Ñ;wï¿½^ï¿½:ï¿½ï¿½h4ï¿½ï¿½zï¿½~8ï¿½ï¿½ï¿½ï¿½Éï¿½ï¿½lï¿½ï¿½ï¿½t:ï¿½ï¿½y=ï¿½(ï¿½ï¿½Î;ï¿½ï¿½ï¿½ï¿½Gï¿½ï¿½ï¿½4&ï¿½tï¿½SN4\Zï¿½iï¿½ï¿½7ß¬ï¿½ï¿½ï¿½ï¿½ï¿½^ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½kxxx||<ï¿½ï¿½ï¿½D\"ß—1ï¿½Lrï¿½322ï¿½v{NNï¿½Â…+++ï¿½Nï¿½ï¿½ï¿½ï¿½h\\ï¿½nï¿½ï¿½ï¿½ï¿½×¿ï¿½ï¿½Fï¿½ï¿½fZï¿½ï¿½ï¿½ï¿½|iiï¿½ï¿½ï¿½ó¢¢¢i~$ï¿½xï¿½Þ›7oï¿½<yï¿½Î;zï¿½^^:ï¿½ï¿½:ï¿½ï¿½;ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Fï¿½@YYï¿½Æ].ï¿½ï¿½ï¿½4ï¿½Lï¿½ï¿½ï¿½ï¿½ï¿½ï¿½===)2X\0ï¿½ï¿½B8ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½p8ï¿½S>ï¿½uttï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½~ï¿½ï¿½ï¿½8ï¿½ï¿½Aï¿½Ã™ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½<ï¿½LUUï¿½Nï¿½Cï¿½ï¿½ï¿½ï¿½ï¿½ï¿½7::ï¿½u,ï¿½ï¿½N<ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ÏŸNï¿½ï¿½ï¿½ï¿½O?ï¿½tppï¿½ï¿½yï¿½ï¿½0Sï¿½Xï¿½$ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Í›7ï¿½ï¿½ï¿½ï¿½|ï¿½ï¿½ï¿½ï¿½ï¿½;ï¿½ï¿½ï¿½hï¿½Sfï¿½Sï¿½ï¿½/ï¿½ï¿½ï¿½ï¿½ï¿½Nï¿½Guuu9rï¿½ï¿½Ñ£ï¿½`pÆ—sS%7ï¿½>ï¿½ï¿½ï¿½ï¿½ï¿½wï¿½ï¿½u:ï¿½ï¿½ï¿½ï¿½êŸ²Zï¿½Kï¿½,ï¿½ï¿½ï¿½ï¿½x<ï¿½\"ï¿½\nï¿½ï¿½!\nï¿½ï¿½ï¿½2?ï¿½Xï¿½ï¿½ï¿½ï¿½ï¿½ï¿½^ooï¿½ï¿½jï¿½ï¿½ï¿½MEï¿½4m4\Zï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½fsaaï¿½zb-Keeï¿½\'ï¿½|ï¿½yï¿½Tï¿½`\'ï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½K>xï¿½`ï¿½ï¿½ï¿½gÎœï¿½ï¿½tï¿½ï¿½Bï¿½,ï¿½ï¿½Z[[{{{ï¿½ï¿½ï¿½ï¿½ï¿½X,ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½vygï¿½65ï¿½I!ï¿½ï¿½$ï¿½Kï¿½ï¿½g?ï¿½ï¿½ï¿½V/ï¿½ï¿½Ó³oï¿½>ï¿½ï¿½c2ï¿½4^BQï¿½^ï¿½ï¿½wï¿½ï¿½ï¿½ï¿½_ï¿½ï¿½ï¿½p8T*ï¿½p8G[[fI.;ï¿½Bï¿½ï¿½/ï¿½ï¿½yï¿½fï¿½b×¯_ï¿½ï¿½?ï¿½ï¿½q\\ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Ë…ï¿½ï¿½ï¿½ï¿½ï¿½*%ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½0ï¿½ï¿½Dvï¿½Dï¿½ï¿½ï¿½ï¿½Ò·ï¿½~[ï¿½eEï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½$}Rï¿½ï¿½ï¿½h4zï¿½ï¿½ï¿½^ï¿½hï¿½\"ï¿½jï¿½ï¿½ï¿½7nxï¿½Þ¤ï¿½yï¿½ï¿½@(9DQ4ï¿½ï¿½;vï¿½Pï¿½655}ï¿½ï¿½6ï¿½-Eï¿½ï¿½4Mï¿½lï¿½?ï¿½ï¿½ï¿½ï¿½Iï¿½EQ;vï¿½0ï¿½Í¢(jV7xZï¿½ï¿½D\"ï¿½×¯ï¿½ï¿½Uï¿½\\ï¿½rï¿½ï¿½ï¿½ß—\'ï¿½5ï¿½Ø”(ï¿½bï¿½ï¿½ï¿½3??ï¿½ï¿½\'ï¿½P*ï¿½ï¿½ï¿½ï¿½oÞ¼ï¿½Õ¦Iï¿½Bß˜ï¿½CEï¿½Ó¹iï¿½&ï¿½2}}}ï¿½ï¿½ï¿½Kï¿½ï¿½eï¿½ï¿½9ï¿½Û·o___ï¿½Jï¿½Mï¿½69ï¿½N4ï¿½Iï¿½r_ï¿½ï¿½`||ï¿½ï¿½ï¿½ï¿½l6+ï¿½zï¿½ï¿½ï¿½ï¿½ï¿½nOï¿½Tï¿½hï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½U*c6ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Çµï¿½ï¿½Rï¿½{Cï¿½X,VUUï¿½ï¿½Tï¿½ï¿½ï¿½ï¿½\'Oï¿½ï¿½ï¿½Nsï¿½vï¿½ï¿½,ï¿½ï¿½ï¿½{ï¿½ï¿½Iï¿½ï¿½Ê¸ï¿½îªªï¿½X,ï¿½eï¿½@ï¿½`kLï¿½$Q7nï¿½hï¿½Xï¿½Ê´ï¿½ï¿½ï¿½:u*-6Tï¿½ï¿½Sï¿½Nï¿½ï¿½ï¿½*ï¿½X,7nEQï¿½Rï¿½Aï¿½5%Â¢Eï¿½***ï¿½\nï¿½ï¿½ï¿½zï¿½Å’ï¿½;(ï¿½ï¿½X,ï¿½ï¿½ï¿½ï¿½@@ï¿½LEEÅ¢Eï¿½ï¿½ffï¿½ï¿½)ï¿½ï¿½jjjTï¿½\r>yï¿½d8NÙ¡ï¿½ï¿½hï¿½ï¿½ï¿½\'Oï¿½T*ï¿½ï¿½ï¿½ï¿½vï¿½>ï¿½4ï¿½6_ 2ï¿½ï¿½ï¿½^ï¿½iOOOccï¿½ï¿½9H&ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Gï¿½ï¿½sï¿½=\nï¿½ï¿½ï¿½ ï¿½Ú‰ï¿½bnï¿½[it-B[[ï¿½ï¿½ï¿½x\Z5ï¿½2ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Ú”ï¿½ï¿½6ï¿½ï¿½é§Ÿï¿½ï¿½ï¿½ï¿½ï¿½;ï¿½ï¿½Bï¿½P]]ï¿½ï¿½Ó‘ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½3{ï¿½ï¿½hlhhQ*PWWï¿½F[Kï¿½FDQï¿½ï¿½ï¿½Sï¿½>ï¿½ï¿½ï¿½,IRZÌ™=ï¿½ï¿½(Iï¿½ï¿½ï¿½ï¿½ï¿½\nï¿½ï¿½ï¿½ï¿½ï¿½ï¿½aï¿½ï¿½flï¿½Dï¿½Qï¿½Ë¥ï¿½ï¿½ï¿½ï¿½ï¿½i7ï¿½~ï¿½ï¿½d:}ï¿½ï¿½ï¿½Sï¿½ï¿½ï¿½rï¿½ï¿½Ñ¨ï¿½Uï¿½ï¿½lï¿½ï¿½ï¿½XUUï¿½ï¿½7nï¿½ï¿½4mï¿½eEï¿½ï¿½7nLï¿½Tï¿½x-ï¿½fl-Hï¿½dï¿½ï¿½Tï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Cï¿½ÓŽ\\yï¿½ï¿½TVVï¿½ï¿½fï¿½Jm ï¿½Zï¿½w}(~411ï¿½ï¿½ï¿½Cï¿½ï¿½eï¿½azzz&&&&}ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½F[ï¿½ï¿½`ï¿½ï¿½ï¿½Iï¿½zï¿½ï¿½ï¿½ï¿½~2ï¿½ï¿½ï¿½ß¯ï¿½-ï¿½nï¿½ï¿½ï¿½v[ï¿½DQTï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Gï¿½4=22ï¿½ï¿½uB?ï¿½p8lmï¿½ï¿½ï¿½)-ï¿½b1ï¿½~ï¿½$Iï¿½oï¿½& ï¿½2ï¿½ï¿½oß¾ï¿½4ï¿½.,,ï¿½2mï¿½}Jqï¿½ (]y\'ï¿½ï¿½ï¿½pï¿½ï¿½Ðœ>ï¿½eï¿½ï¿½ï¿½ï¿½ï¿½ï¿½9ï¿½Nï¿½ï¿½ï¿½ï¿½Aï¿½ï¿½ï¿½(0ï¿½ï¿½1388ï¿½ï¿½ï¿½v8ï¿½6l-ï¿½ï¿½tÔ¾$I>ï¿½/ï¿½_t=ï¿½ï¿½(ï¿½Ï§ï¿½ï¿½Zï¿½ï¿½6l-ï¿½<ï¿½ï¿½ï¿½Tï¿½ï¿½ï¿½ï¿½Qï¿½ï¿½=::ï¿½ï¿½ï¿½ï¿½\\ï¿½ï¿½V`!ï¿½\ZQï¿½ï¿½Kï¿½ï¿½ï¿½ï¿½I\nï¿½ï¿½ï¿½Wï¿½e5ï¿½Ïœï¿½`ï¿½ ï¿½ï¿½ï¿½ï¿½61ï¿½d*ï¿½1#ï¿½Ô‡`kï¿½eYï¿½ï¿½?ï¿½#ï¿½ï¿½\n\nï¿½Yï¿½%ï¿½bAAï¿½ï¿½zï¿½ï¿½OØ¿b)ï¿½ï¿½Ë²*ï¿½ï¿½ï¿½L&bfï¿½$IRï¿½U>22ï¿½`kï¿½ï¿½ï¿½0ï¿½`Pï¿½QII	1owA())QZoï¿½Yï¿½ï¿½ï¿½l-ï¿½,ï¿½ï¿½x&}Dï¿½ï¿½ï¿½yï¿½Hï¿½Ï›7Oï¿½+ï¿½ï¿½xï¿½bkï¿½ï¿½ï¿½0J]qï¿½ï¿½ï¿½ï¿½Ë‰9vï¿½ï¿½ï¿½ï¿½rï¿½`ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Zlï¿½Ngï¿½ÛN\'ï¿½lIï¿½Tï¿½ï¿½ï¿½tï¿½ï¿½ï¿½![ï¿½hï¿½ï¿½ï¿½|Jï¿½m6[~~>ï¿½lAï¿½ï¿½ï¿½m6Û¤O#ï¿½Hï¿½ï¿½ï¿½Fl-ï¿½ï¿½ï¿½wï¿½Þ¤Oï¿½Í›W\\\\LFï¿½ï¿½ï¿½ï¿½ï¿½Í›7ï¿½ï¿½{ï¿½ï¿½yï¿½^bvï¿½ï¿½8ï¿½ï¿½ï¿½@Ó´ï¿½ï¿½Uï¿½WVVjYï¿½Ù£ï¿½x<[3ï¿½+kDï¿½ï¿½ï¿½ï¿½+ï¿½~Ë—Hï¿½ï¿½0[ï¿½$ï¿½ï¿½ï¿½Iï¿½\nï¿½ï¿½ï¿½Ofï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Ö¦ï¿½ï¿½ï¿½bï¿½ï¿½Yï¿½&ï¿½ï¿½4ï¿½<ï¿½fï¿½\Zï¿½ï¿½ï¿½ï¿½kï¿½ï¿½Æµï¿½ï¿½lï¿½0ï¿½ï¿½Õ¥tï¿½ï¿½Nï¿½[ï¿½vmï¿½6ï¿½rsï¿½vï¿½Zï¿½^ï¿½ï¿½ï¿½ï¿½Sï¿½Aï¿½ï¿½ï¿½ï¿½ë›šï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½4ï¿½\'\Zï¿½ï¿½ï¿½î¼¼<ï¿½MMMXï¿½ï¿½%[;Fï¿½ï¿½Ø±cJOM&Ó†\rXï¿½Mï¿½F[ï¿½$ï¿½e7lØ ï¿½Jï¿½Ø±cizï¿½hï¿½Bï¿½ï¿½CQï¿½ï¿½lï¿½tï¿½Rï¿½ï¿½ï¿½ï¿½eË–ï¿½]ï¿½ï¿½Fï¿½-[V^^ï¿½Tï¿½Ò¥Kfï¿½oï¿½ï¿½ï¿½`kï¿½d2ï¿½ï¿½ï¿½)Mï¿½ï¿½ï¿½×ï¿½ï¿½ï¿½Qï¿½-Iï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½&ï¿½DQlkkKï¿½Dï¿½ï¿½ï¿½)ï¿½^ï¿½ï¿½ï¿½ï¿½ï¿½Ñ¡Tï¿½ï¿½ï¿½dÏž=*ï¿½iï¿½ï¿½H$ï¿½gÏžï¿½ï¿½ï¿½mmmzï¿½^ï¿½Zï¿½ï¿½)ï¿½ï¿½8ï¿½ï¿½xï¿½J{ï¿½Úµ.ï¿½+-ï¿½ï¿½pï¿½rï¿½T&Ã£ï¿½ï¿½Å‹9ï¿½C?\\cï¿½ï¿½L&Ó—_~ï¿½ï¿½ß¯Tï¿½nï¿½oß¾ï¿½fï¿½ï¿½ï¿½rQm6ï¿½ï¿½ï¿½ï¿½Uv}ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½kï¿½Nï¿½ï¿½Z__ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½]ï¿½vï¿½ï¿½lKï¿½vï¿½Ú¥2g&ï¿½b}}ï¿½ï¿½M	0ï¿½ï¿½$`Yï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Eï¿½Ì³ï¿½>ï¿½eï¿½ï¿½3ï¿½ï¿½H>}Ë–-ï¿½>ï¿½ï¿½Jï¿½ï¿½ï¿½ï¿½ï¿½ï¿½~ï¿½ï¿½N\nï¿½ï¿½ï¿½&ï¿½uï¿½ï¿½(ï¿½\Zï¿½ï¿½ï¿½Tï¿½ï¿½ï¿½ï¿½***Xï¿½ï¿½qï¿½Ë²ï¿½3Fï¿½$)ï¿½lÛ¶ï¿½ï¿½W_Uï¿½ï¿½144ï¿½ï¿½ï¿½ï¿½G\"ï¿½ï¿½H\nï¿½Ñ“Cï¿½ï¿½ï¿½Ô©S*eXï¿½]ï¿½nï¿½Ê•+Cï¿½ï¿½fï¿½R(Zï¿½rï¿½uï¿½Ô›ï¿½Sï¿½Nï¿½tï¿½`ï¿½Aï¿½ï¿½4zï¿½ï¿½ï¿½oï¿½-(((,,T*c0*++%Ijoo7ï¿½Lï¿½mï¿½ï¿½WÖ¯ï¿½ï¿½J]]]FFï¿½Jï¿½ï¿½ï¿½ï¿½Gï¿½btï¿½Dv2ï¿½,ï¿½ï¿½ï¿½^YYï¿½ï¿½ï¿½ï¿½Tï¿½`0TUUï¿½ï¿½ä´µï¿½Qï¿½ï¿½ï¿½ï¿½ ï¿½hï¿½ï¿½ï¿½ï¿½ï¿½Mï¿½ï¿½ï¿½vuuï¿½ß¿_ï¿½×§ï¿½ï¿½aBï¿½ï¿½ï¿½ï¿½ï¿½X,vï¿½ï¿½ï¿½ï¿½ï¿½jï¿½Ù¬Rï¿½ï¿½ï¿½$??ï¿½ï¿½oï¿½MÊ™ï¿½ï¿½H$++ï¿½7ï¿½xï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½:4::ï¿½9ï¿½ï¿½Bï¿½ï¿½L>ï¿½ï¿½ï¿½ï¿½ï¿½G?ï¿½ï¿½zÉ‚ï¿½ï¿½%Kï¿½ï¿½4ï¿½Mï¿½-B$Yï¿½tï¿½~ï¿½ï¿½ï¿½ï¿½ï¿½)ï¿½ï¿½ï¿½ï¿½ï¿½sï¿½Ö™%ï¿½ï¿½|ï¿½Ü½{wllï¿½ï¿½ï¿½Z}ï¿½)33ï¿½çž³ï¿½lï¿½ï¿½ï¿½^ï¿½ï¿½aï¿½ï¿½ï¿½ï¿½Jï¿½ï¿½q\\~~ï¿½Ö­[wï¿½Þï¿½ï¿½ï¿½^ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½hï¿½N	zï¿½ï¿½ï¿½ï¿½7ï¿½ï¿½\\ï¿½)ï¿½ï¿½ï¿½ï¿½ï¿½%Kï¿½ï¿½ï¿½ï¿½u:ÝŒï¿½[ï¿½H$ï¿½nÝºsï¿½Î§ï¿½zjÊï¿½bï¿½cÇŽï¿½;w.ï¿½3| Cï¿½Sï¿½<+ï¿½ï¿½ï¿½uï¿½Þ½ï¿½Ë—OYï¿½jï¿½ï¿½\\ï¿½5kï¿½ï¿½=ï¿½P(ï¿½ï¿½3ï¿½$ï¿½</Iï¿½ï¿½nï¿½ï¿½ï¿½zï¿½ï¿½ï¿½ï¿½iï¿½l8pï¿½ë¯¿6Huï¿½@ï¿½SEQ,ï¿½vwwOLLï¿½ï¿½ï¿½Oy,EQVï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½),,ï¿½Zï¿½<ï¿½ï¿½ï¿½ï¿½ï¿½$Iï¿½h4Xï¿½ï¿½+Vï¿½ï¿½ï¿½K?ï¿½ï¿½OVï¿½Xaï¿½Zï¿½ï¿½?ï¿½ï¿½ï¿½Gï¿½9wï¿½ï¿½bAï¿½Sï¿½wï¿½ï¿½dï¿½ï¿½ï¿½H$ï¿½vï¿½wï¿½Þ­t@ï¿½Ò§FGGï¿½ï¿½Û›ï¿½ï¿½ï¿½ï¿½ï¿½M&Ë²r3ï¿½pï¿½^EIï¿½Aï¿½ï¿½bï¿½Hï¿½nï¿½?ï¿½ï¿½nï¿½ï¿½ï¿½ï¿½(;;;ï¿½\r###ï¿½ï¿½ß±ï¿½ï¿½ï¿½ï¿½Cï¿½Sï¿½ï¿½Vï¿½ï¿½7ï¿½ï¿½ï¿½t&ï¿½\'566600ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Tï¿½i[ï¿½Vï¿½Ã‘ï¿½ï¿½[TTï¿½ï¿½ï¿½ï¿½Øï¿½uï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½MAvï¿½ï¿½ï¿½ï¿½Û¶m{ï¿½ï¿½Sï¿½=ï¿½D\"ï¿½ÏŸï¿½è£Aï¿½ï¿½ï¿½Ô„1vï¿½ï¿½iZ^Izï¿½ï¿½ï¿½ï¿½/ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½:tï¿½ï¿½iï¿½aï¿½<e!Ø©ï¿½ï¿½(ï¿½^?44tï¿½ï¿½qQï¿½ï¿½ï¿½ï¿½2Iï¿½$ï¿½ï¿½wï¿½ï¿½ï¿½ï¿½ï¿½/>ï¿½ï¿½ï¿½Rvwï¿½4Iï¿½(ï¿½bï¿½ï¿½ï¿½ï¿½ï¿½Kï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Aï¿½ï¿½ï¿½ï¿½Rï¿½tï¿½;Eï¿½ï¿½ï¿½FYï¿½]ï¿½xï¿½+ï¿½ï¿½ï¿½ï¿½O\Zï¿½Æ¤7ï¿½<ï¿½ï¿½ï¿½ï¿½ï¿½gÏž;w.ï¿½4ï¿½1vjBï¿½Sï¿½$Iï¿½Phï¿½ï¿½ï¿½ï¿½Wï¿½^ï¿½dÉ‚ï¿½]ï¿½Iï¿½+Wï¿½466Þ¸qï¿½d2aï¿½ï¿½jï¿½ï¿½ï¿½Ú¯-[ï¿½,_ï¿½\\eï¿½vï¿½ï¿½uï¿½ï¿½G}444dï¿½Xï¿½Ô`ï¿½\nï¿½ï¿½M&Seeï¿½ï¿½Ý»ï¿½Ngï¿½ï¿½ï¿½\'Nï¿½?ï¿½ï¿½ï¿½`Uiï¿½@ï¿½ï¿½O>ï¿½dÕªU6lXï¿½hï¿½ï¿½ï¿½\'&&ï¿½ï¿½0ï¿½ï¿½ï¿½pXÞ¤ï¿½ï¿½ï¿½pï¿½`0ï¿½L&ï¿½Ùœï¿½ï¿½ï¿½ï¿½ï¿½@GGGï¿½ï¿½ï¿½ë††ymï¿½cï¿½ï¿½ï¿½1!ï¿½Iï¿½qï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½Uï¿½ï¿½,!ï¿½ï¿½ï¿½ï¿½ï¿½{ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½aï¿½ï¿½ï¿½\'&&DQï¿½ï¿½ï¿½ï¿½Aaï¿½ï¿½FÓ´ï¿½bï¿½Zï¿½6ï¿½ï¿½ï¿½p8ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Â„ï¿½\\Qoß¾ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Osï¿½9ï¿½;iDQï¿½8ï¿½gï¿½Ù±cï¿½O<ï¿½ï¿½ï¿½ï¿½p0ï¿½sï¿½Î…:::ï¿½ï¿½@)ï¿½ï¿½_ï¿½Qï¿½ï¿½ï¿½ï¿½\rï¿½ï¿½ï¿½Lï¿½Qï¿½ï¿½$ï¿½4ï¿½xï¿½ï¿½ï¿½ï¿½Zï¿½ï¿½eï¿½ï¿½-Kï¿½ï¿½ï¿½ \'Nï¿½8uï¿½ï¿½q8q!Yï¿½ï¿½ï¿½ï¿½ï¿½W_}uï¿½ï¿½ï¿½ï¿½%ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½_ï¿½~ï¿½ï¿½ï¿½)ï¿½ï¿½ï¿½fï¿½ï¿½;#-ï¿½ï¿½?ï¿½ï¿½8Qï¿½ï¿½ï¿½ï¿½.]ZZZZ^^oDï¿½_ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Ü¤@ï¿½ï¿½ï¿½ï¿½yï¿½eï¿½~ï¿½mï¿½ï¿½W\Z;::\Zï¿½ï¿½ï¿½<ï¿½0ï¿½z`ï¿½ï¿½pï¿½ï¿½322.\\ï¿½vï¿½Wï¿½X×¿Aï¿½ï¿½ï¿½?:;;ï¿½ï¿½S{ï¿½ï¿½8ï¿½[ï¿½dï¿½ï¿½Ý»ï¿½ÏŸ?Íï¿½|ï¿½k×®;vï¿½ï¿½ï¿½dddï¿½,ï¿½ï¿½Yï¿½ï¿½$ï¿½b1ï¿½ï¿½8ï¿½Û¶mÛªUï¿½\n\n\nï¿½ï¿½fï¿½ï¿½ï¿½ï¿½\'Nï¿½ï¿½~\\\0ï¿½ï¿½Zqï¿½Hï¿½4>>ï¿½vï¿½ï¿½={ï¿½Lï¿½V8ï¿½ï¿½oï¿½9rï¿½ï¿½yï¿½kVï¿½9ï¿½ï¿½<h7fï¿½ï¿½ï¿½ï¿½Sï¿½=ï¿½fï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½?ï¿½ï¿½l6#ÛšAï¿½5\"ï¿½vÚ´iÓž={ï¿½3ï¿½Eï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½_}ï¿½U0Lï¿½Mï¿½QoÞ¼yï¿½Ê•ï¿½ï¿½ï¿½Lï¿½ï¿½aï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Nï¿½ï¿½ï¿½[ï¿½xuï¿½Î[ï¿½lï¿½N>ï¿½{ï½£Gï¿½F\"ï¿½ï¿½ï¿½Raï¿½ï¿½ï¿½ï¿½ï¿½Í›7/\\ï¿½ï¿½p8ï¿½ï¿½ï¿½ï¿½ï¿½Z+((ï¿½ï¿½ï¿½ï¿½~ï¿½z(Jï¿½_ï¿½Tï¿½ï¿½ï¿½$iddï¿½ï¿½^ï¿½ï¿½<ï¿½ï¿½ï¿½\'ï¿½|ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Èºï¿½Y\"ï¿½oï¿½yï¿½ï¿½Å‹ï¿½ï¿½ï¿½ï¿½hï¿½ï¿½ï¿½Â…ï¿½ï¿½)ï¿½{ï¿½ï¿½]r[ï¿½k×®ï¿½_~yï¿½oï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½X,ï¿½oï¿½iï¿½ff``ï¿½Ò¥Kï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½vï¿½oÜ¸ï¿½ï¿½ï¿½Yï¿½`ï¿½\"y>yï¿½ï¿½ï¿½ï¿½×¯ï¿½ï¿½{ï¿½ï¿½ï¿½ï¿½ï¿½;ï¿½ï¿½ï¿½ï¿½4ï¿½ï¿½ï¿½Hyï¿½ollï¿½ï¿½tï¿½ï¿½ï¿½ï¿½nï¿½ï¿½QZZzï¿½ï¿½yï¿½ï¿½VÕœsï¿½Ykjjvï¿½ï¿½5eï¿½ï¿½Ù³E1-\Zï¿½Gï¿½4m0ï¿½]ï¿½6::ï¿½hï¿½\"ï¿½CÚœNï¿½ï¿½ï¿½ï¿½Ïœ9ï¿½yï¿½Ùƒ`ï¿½ï¿½ï¿½kkkï¿½zï¿½-ï¿½ï¿½78pï¿½ï¿½?ï¿½Zï¿½iï¿½P?Juï¿½8qï¿½ï¿½v;ï¿½Â…ï¿½ï¿½Nï¿½ï¿½ï¿½Õ«qï¿½Ó‡`ÏŠX,V\\\\ï¿½ï¿½_ï¿½Bï¿½Bï¿½ï¿½wï¿½ï¿½ï¿½.ï¿½l62ï¿½ï¿½,ï¿½Rï¿½ï¿½ï¿½^VVï¿½r7ï¿½Nï¿½+((ï¿½ï¿½ï¿½ï¿½\n6Ò¸ï¿½HYï¿½+ï¿½ï¿½^{M}mï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½7ß¤ï¿½	ï¿½3ï¿½eYï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Õ«*ÅŒFï¿½;ï¿½v{,Ó¬nsZï¿½&IR8~ï¿½7ï¿½yï¿½ï¿½b^ï¿½ï¿½Oï¿½S___ï¿½ï¿½>#hï¿½ï¿½ï¿½bï¿½}ï¿½Yuuunnï¿½R1ï¿½^_]]ï¿½ï¿½ï¿½$oï¿½Ñ²ï¿½ï¿½Cï¿½=ï¿½8ï¿½[ï¿½vï¿½ï¿½eï¿½ï¿½pï¿½Ð¡C^ï¿½ï¿½ï¿½Tï¿½hï¿½ï¿½ï¿½ï¿½9tï¿½Pï¿½Jï¿½ï¿½ï¿½ï¿½mÛ¶Eï¿½ï¿½ï¿½ï¿½J{&	ï¿½PPPï¿½nï¿½:ï¿½qc(:rï¿½Èµkï¿½Nï¿½ï¿½aï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½*ï¿½^xï¿½ï¿½Ë—ï¿½<ï¿½Yï¿½ï¿½{&ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½|ï¿½2ï¿½~ï¿½ï¿½_|1Gï¿½bYv||ï¿½ï¿½ï¿½s(R*c0ï¿½mï¿½&\Zï¿½ï¿½`ï¿½ï¿½ãª«ï¿½ï¿½nï¿½Jï¿½ï¿½ï¿½ï¿½>ï¿½ ï¿½{ï¿½Ò‘^ï¿½ihhPï¿½mnnï¿½;=ï¿½	ï¿½É³ï¿½!ï¿½ï¿½nï¿½ï¿½oï¿½rnYggï¿½ï¿½ï¿½ï¿½ï¿½9ï¿½zï¿½ï¿½ï¿½ï¿½ï¿½ï¿½tï¿½ï¿½ï¿½(ï¿½ï¿½ï¿½ï¿½\Z\Zï¿½ï¿½Ð²nï¿½Bï¿½=3AXï¿½~ï¿½Êï¿½ï¿½ï¿½ï¿½ï¿½ï¿½DQï¿½ï¿½l>rï¿½HWWï¿½Rï¿½ï¿½ï¿½Ì—^zï¿½atï¿½gÄœï¿½ï¿½ï¿½ArrrVï¿½\\ï¿½ï¿½744tvvÎ‘ï¿½ï¿½ï¿½hï¿½ï¿½È‘#*ï¿½uï¿½Ý¥ï¿½ï¿½xï¿½=#ï¿½7oï¿½lï¿½Ù”\n\\ï¿½|ï¿½Ô©Sfï¿½Yï¿½Zï¿½\Zï¿½^ï¿½ï¿½ï¿½}ï¿½ï¿½qï¿½Eï¿½Ø±#hY+R!ØKEï¿½Ó¹|ï¿½rï¿½gÏžMï¿½+ï¿½ï¿½ï¿½h4655\r*(++ï¿½ï¿½ï¿½ï¿½Fï¿½ZÖŠHï¿½ï¿½\nï¿½?ï¿½ï¿½OUN;ï¿½tï¿½ï¿½Õ«Wï¿½tï¿½ï¿½ï¿½bï¿½ï¿½ï¿½|ï¿½ï¿½*ï¿½ï¿½nÝºï¿½ï¿½ï¿½ï¿½Xbï¿½XUUUuuï¿½Rï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½9ï¿½	ï¿½ï¿½hï¿½ï¿½Onß¾ï¿½Tï¿½ï¿½ï¿½hÅŠhï¿½ï¿½ï¿½XAxï¿½ï¿½Uï¿½(~ï¿½ï¿½ï¿½Ø™ï¿½ï¿½ï¿½ÙŸ}ï¿½ï¿½ï¿½Sï¿½Å²dï¿½ï¿½ï¿½ï¿½h?;qï¿½$Y,ï¿½ï¿½Kï¿½*ï¿½xï¿½\"ï¿½ï¿½ï¿½ï¿½eï¿½ï¿½ï¿½Tï¿½~ï¿½ï¿½ï¿½fee!Øï¿½N\\,+//Wï¿½ï¿½ZÅ‹/ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½(ï¿½ï¿½yï¿½ï¿½ï¿½9ï¿½LZï¿½h4ï¿½ï¿½ï¿½bï¿½ï¿½ï¿½ï¿½w.q~ï¿½ÝºuJOGGG/\\ï¿½0g_\\ï¿½3ï¿½ï¿½ï¿½ï¿½Gï¿½ï¿½ï¿½Uï¿½ï¿½ï¿½Çµï¿½aï¿½ï¿½ï¿½XTTTVVï¿½Tï¿½ï¿½ï¿½ï¿½ï¿½ï¿½hï¿½\'%7ï¿½gÏžU*ï¿½ï¿½Oï¿½\\ï¿½ï¿½Uï¿½ï¿½]ï¿½8ï¿½{ï¿½T\Zï¿½\'Ob2\\ï¿½ï¿½hlhhPï¿½ï¿½eË–)=ï¿½)!Ø‰ï¿½ï¿½^ï¿½pï¿½Rï¿½|ï¿½Ö­ï¿½ï¿½ï£¹VAQï¿½ï¿½hlmmU*P\\\\ï¿½ï¿½ï¿½ï¿½)ï¿½ï¿½ï¿½ï¿½ï¿½Qï¿½ï¿½ï¿½Tnï¿½?ï¿½ï¿½ï¿½7cï¿½ï¿½dï¿½tï¿½ï¿½Ó¼ï¿½ï¿½ï¿½\nï¿½ï¿½eï¿½ï¿½ï¿½`\'B>ï¿½Ti/ï¿½ï¿½ï¿½{ï¿½.ï¿½Nï¿½aï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Iï¿½ï¿½lï¿½ï¿½ï¿½<;1v\"$I*((Pzï¿½ï¿½ï¿½;44ï¿½~ï¿½ï¿½hï¿½ï¿½zï¿½*sï¿½%%%*ï¿½OAï¿½|ï¿½Eï¿½ï¿½ï¿½|ï¿½Gï¿½ Ü¹sï¿½ï¿½yï¿½6ï¿½Qï¿½ï¿½ï¿½[ï¿½Wï¿½rï¿½1ï¿½N\0ï¿½7ï¿½Fï¿½Lï¿½4\nuwwcï¿½ï¿½4ï¿½ï¿½ï¿½ï¿½ï¿½.ï¿½ï¿½ï¼¼<ï¿½Å‚`\'\0ï¿½ï¿½ï¿½ .ï¿½Kï¿½i$ï¿½uï¿½ï¿½ï¿½Dï¿½tWWW8V*ï¿½ï¿½ï¿½ï¿½ ï¿½qï¿½Fï¿½UUUJOï¿½ï¿½ï¿½;ï¿½ï¿½ï¿½ï¿½&ï¿½ï¿½ï¿½Ù©T`Ñ¢EXï¿½ï¿½\0;nï¿½ ï¿½ï¿½mvï¿½ï¿½Mï¿½ï¿½ï¿½ï¿½ï¿½`P	vAAï¿½p&\0ï¿½ï¿½ï¿½ï¿½*ï¿½;::pï¿½\\\\Xï¿½ï¿½ï¿½ï¿½VzZZZï¿½ï¿½ï¿½ ï¿½ï¿½$);;[ï¿½ï¿½=00ï¿½]qï¿½iï¿½ï¿½ï¿½Sy:oï¿½<d;^ï¿½\nï¿½Gï¿½ï¿½ï¿½lï¿½ï¿½1ï¿½ï¿½\'Iï¿½ï¿½2ï¿½ï¿½ï¿½ï¿½>b&\'\'ï¿½ï¿½Bï¿½ï¿½#ï¿½ï¿½yï¿½:ï¿½ï¿½ï¿½ï¿½G?<ï¿½4ï¿½Gï¿½-vï¿½ï¿½ï¿½ï¿½gï¿½*ï¿½wllï¿½u(ï¿½Rï¿½Ü‹eï¿½ï¿½ï¿½l;^v|$I2ï¿½ï¿½Jï¿½è±±1ï¿½@Ó´ï¿½ï¿½Szï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½$ï¿½d2)ï¿½K)ï¿½ï¿½ï¿½c&##-vï¿½ï¿½ï¿½ï¿½/ï¿½ï¿½ï¿½=11ï¿½ï¿½x(ï¿½Rï¿½jï¿½ï¿½ï¿½ï¿½ï¿½lï¿½ï¿½/;>ï¿½ï¿½ï¿½hï¿½N\0EQ*ï¿½Pï¿½O\0ï¿½7ï¿½yo,Oï¿½ÊŸ/\Zï¿½?Y|,Ë™3gnÝºï¿½è¨aï¿½ï¿½ï¿½ï¿½ï¿½Jï¿½|ï¿½ï¿½ï¿½Ã‡ï¿½rï¿½4=44dï¿½Xï¿½Rï¿½ï¿½Eï¿½Ý»7ï¿½uH3ï¿½ (mKï¿½ï¿½ï¿½ï¿½Oï¿½(ï¿½Jï¿½qï¿½eï¿½ï¿½Zï¿½1ï¿½ï¿½ÙŒï¿½i\Zï¿½gfï¿½\0!ï¿½\0Bï¿½ï¿½`ï¿½ ï¿½\r@ ï¿½@6\0ï¿½l\0!ï¿½\0Bï¿½ï¿½`ï¿½ ï¿½\r@ ï¿½@6\0ï¿½l\0!ï¿½\0Bï¿½ï¿½`ï¿½ ï¿½\r@ ï¿½@6\0ï¿½l\0!ï¿½\0Bï¿½ï¿½`ï¿½ ï¿½\r@ ï¿½@6\0ï¿½l\0!ï¿½\0Bï¿½ï¿½`ï¿½ ï¿½\r@ ï¿½@6\0ï¿½l\0!ï¿½\0Bï¿½ï¿½`ï¿½ ï¿½\r@ ï¿½@6\0ï¿½l\0!ï¿½\0Bï¿½ï¿½`ï¿½ ï¿½\r@ ï¿½@6\0ï¿½l\0!ï¿½\0Bï¿½ï¿½`ï¿½ ï¿½\r@ ï¿½@6\0ï¿½l\0!ï¿½\0Bï¿½ï¿½`ï¿½ ï¿½\r@ ï¿½@6\0ï¿½l\0!ï¿½\0Bï¿½ï¿½`ï¿½ ï¿½\r@ ï¿½@6\0ï¿½l\0!ï¿½\0Bï¿½ï¿½`ï¿½ ï¿½\r@ ï¿½@6\0ï¿½l\0!ï¿½\0Bï¿½ï¿½Íª×BJï¿½ï¿½\0\0\0\0IENDï¿½B`ï¿½'),('5640','Cedula de Ciudadania','Usuario','Funcionario','123456789','usuario@gmail.com','09c6bd5f65243380b7ab079f5b68fe4af2899c0a','Calle 30 #45-27','FUNC','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0H\0\0H\0\0\0½vðd\0\0\0sBITÛáOà\0\0\0_zTXtRaw profile type APP1\0\0™ãJOÍK-ÊLV((ÊOËÌIåR\0c.KK£D04006’F@¶9T(Ñ\0˜˜›¥¡¹Y²™)ˆÏ\0Oºh-ØŒ\0\0ÁIDATxœíÝYl÷áðco{×»Æ8>ƒÀ^;Å1„4€Rq…@\nF…ÚF•šFJß*µ}*}hUU%EEUb\"DIâQÐ8Ø`csClŸk{×öž3»3ó5â<cïbÏîþüý<f~ÿlí—ß1¿ƒÚ»w¯\0ÈB\'»\00ól\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0b“]˜yÒCt: ?(À0ŒN§£’„ZÂlB°É!B,‹F£F£Ñf³Y­Ö¬¬,Š¢rrr~PrxxX’¤±±±`0811Áqœ^¯gYV<\0ÁNo’$	‚Àqœßï¯¬¬t¹\\eee‡Ãd2™L¦ŒŒŠ¢233ð)¿ß/IR ˆD\"‘HÄçóÝ¹sçæÍ›·nÝÊÌÌ4Ã OkvZ’$)‹‰¢h4\Z,X°bÅŠeË–Y­V–eõzý”—£n³Ù¾ÿ/Ë—/Åb~¿¿µµõòåËƒƒƒÇÑ4Í²,žŽ¨½{÷&»Žãt:ÝÒ¥K—.]ZYY™——7ã?âÞ½{W¯^½zõªN§3\Z3þ#`V¡ÅN’$E£QŸÏ÷òË/?ÿüóö±gJ^^^^^^mmíÐÐPccãgŸ}æp8ôz=Zït;=ð<o2™ªªª6oÞüä“OjüÓûúú>ýôÓŽŽŽH$b04þé\0¦¦¦&Ùu\05’$…B¡§Ÿ~úõ×_ß¸qcVV–öuÈÊÊZ¾|yyyùÄÄD?šîÔ‡®xê’ûÞÇíÝ»·¶¶Öjµ&·>EEE---4\Zˆw*C‹¢äyï¥K—þîw¿s¹\\)Ò6,X½zõƒîÝ»GÓ4²š0ÆNE¢(F£Ñ;w®^½:±éh4êõzý~8–›ýïÉ­ÙlÎÌÌt:Óy=ö(ŽãÎ;÷ŸÿüG¯×Ó4&§tÅSN4\Z¥iúÍ7ß¬­­÷³^¯·³³³««kxxx||<ÈÁŽD\"ß—1™Lr°322ìv{NNÎÂ…+++NçôÑh\\·nÓéü×¿þFû×fZìÔÂó|iiéÏþó¢¢¢i~$‰x½Þ›7ož<yòÎ;z½^^:öý:ð‡;Ìòòï“‚F@YYÙÆ].—Óé4™LÓüéõõõ===)2X\0‚B8ŽËÎÎþÃþàp8¦S>‹utt´¶¶¶´´øý~³Ùü8‹½A‡Ã™™™µµµÏ<óLUUËN«CçóùöíÛ7::Šu,©ÁN<Ï¿ùæ›óçÏŸNùöööO?ýtppçyƒÁ0S“X’$ÉÿÃÂÂÂÍ›7»Ýîé|Êãñ¼óÎ;ýýýh·SfÅSÏó‹/þõ¯ýèN¬Guuu9räèÑ£Á`pÆ—sS%7Ô>ŸïüùówïÞu:ÙÙÙêŸ²Z­K–,éëëóx<Ø\"–\nìä!\nýñœ2?±Xìüùóï½÷^oo¯Õj½·MEÑ4m4\ZûûûÛÛÛÍfsaa¡zb-Keeå\'Ÿ|‚yòT€`\'™ ¿ÿýïóóóÕK>xð`ÿþýgÎœÑétšÍB³,‹ÅZ[[{{{ËËËÕÉX,–šššöövyg˜65„I!ØÉ$ÏKÿìg?«®®V/ÖÓÓ³oß>Çc2™4^BQ”^¯¿wïÞÿû_—Ëåp8T*àp8G[[fI.;™B¡Ð/¼°yófõb×¯_ÿç?ÿÉq\\§¦ä¦ûòåË………¹¹¹*%‡‡‡»ºº0‘–DvÒD£ÑÒÒÒ·ß~[¥eE±¡¡áÀÃ$}RŠ¦éh4zæÌ½^¿hÑ\"•j»Ýî7nx½Þ¤×yÎÂ@(9DQ4›Í;vìPï¯655}øá‡6›-E†¬4MÛl¶?ü°©©I¥EQ;vì0›Í¢(jV7xZìäˆD\"ë×¯ñÅUÊ\\¹råý÷ß—\'¨5«Ø”(Šb¦³³3??ÿ‰\'žP*–““‡oÞ¼‰Õ¦I‘Bß˜¹CE§Ó¹iÓ&•2}}}ûöíKÍéeš¦9ŽÛ·o___ŸJ±M›69N4ÚI‘r_š¹`||¼®®Îl6+ðz½ï¾û®ÝnOÁTËhš¶Ûíï¾û®×ëU*c6›ëêêÆÇÇµ¬ÈRô{C°X,VUU¥²T“çù“\'OöööNs©v²°,ÛÛÛ{òäIžç•Ê¸ÝîªªªX,¦eÅ@‡`kL’$Q7nÜh±X”Ê´¶¶ž:u*-6TÆS§Nµ¶¶*°X,7nEQÞRšA°5%Â¢E‹***”\núúz‹Å’«;(Š²X,õõõ@@©LEEÅ¢E‹½ff‚­)ŽãjjjTŽ\r>yòd8NÙ¡õ£hš‡Ã\'OžT*™™év»>Â46_ 2ƒÁçŸ^éiOOOccãô9H&“©±±±§§G©ÀsÏ=\n…´¬ ØÚ‰Åbn·[it-B[[Ûøøx\Z5×2š¦ÇÇÇÛÚÚ”úÛ6›íé§ŸÆš–Òì;”ÖB¡P]]ÒÓ‘‘‘†††´˜3{”ÑhlhhQ*PWW‡F[K¶FDQÌËËSÙ>ÑÜÜ,IRZÌ™=Š¢(I’š››•\näæææååa±ŠflD£Q—Ë¥ò–ëôéÓi7º~˜Éd:}ú´ÒS‹Åâr¹¢Ñ¨–UšËlˆ¢XUU¥Ý7nƒÁ4m®eEƒÁ7nLúT¾x-¶fl-H’d³ÙT®ÝêêêÒýÿC‚ÓŽ\\yù™TVV–ÍfÃJm ØZw}(~411ÑÓÓCÀÖe†azzz&&&&}šŸŸŸF[¶ä`ÛíöIŸz½Þþþ~2‚Ýßß¯´-Än·Ûív[¶DQT¹ ‰ŒŒŒ¤ÝëëGÑ4=22òðuB?àp8lm¤ý—)-Äb1¥~¸$I·oß& Õ2š¦oß¾­4.,,Ä2mò}Jq‚ (]y\'ÂððpŠïÐœ>–e‡‡‡•– 9NìÑ‚­A”ºâ¢(0À–1388¨Ôßv8¶6l-‚ tÔ¾$I>Ÿ/­_t=Œ¢(ŸÏ§Ô·Z­¶6l-ð<¯´˜T’¤ÑÑQ’‚=::ªìÜÜ\\•ãV`!Ø\ZQú®K’ä÷ûI\n¶ßïWùe5®Ïœ…`Á ‚­•Î61ïºd*¿1#ŽÔ‡`keY¿ß?é#š¦\n\nˆY%ŠbAAÒz¿ßOØ¿b)ÁÖË²*§‹˜L&bf•$IRÙU>22‚`kÁÖÃ0Á`PéQII	1owA())QZo‰YŠ“âl-°,ëñx&}DÓô¼yóHêŠÏ›7O©+îñxÐbkÁÖÃ0J]qš¦ËËË‰9v›ã¸òòr¥`ŒŒ ÅÖ‚­š¦•ZlNg·ÛN\'ÃlI’T¶ëtº¡¡![¶hšöù|J•m6[~~>ÃlAòóóm6Û¤O#‘HºŸë–Fl-ÈÁ¾wïÞ¤OçÍ›W\\\\LF°‹‹‹çÍ›7éÓ{÷îy½^bvž§8ü•µ@Ó´×ëUéWVVjYŸÙ£ò‹x<[3ø+kDÅû÷ï+Í~Ë—H§õ0[’$ùêïIŸ\n‚ ²Of‚­ƒÁÐÖÖ¦´þÌb±¬Y³&­·4ò<¿fÍ\Z¥Àµk×ƒÆµš³l0ÓÕÕ¥t‚§N§[»vmú6Úrs½víZ¥^¯·»»SâšA°µ£×ë›šš”žæåå¹Ýî4½\'\ZºÝî¼¼<¥MMMXš¢%[;F£ñØ±cJOM&Ó†\rX–M»F[’$–e7lØ ²JüØ±ciz‘hšB°µCQ”Ùl¾té’RòòòeË–¥]£F—-[V^^®TàÒ¥Kf³o°µ„`kÊd2µµµ)M†õë×¥Q£-IÒØØØúõë•&ÆDQlkkKë‹DÓ‚­)½^ßÖÖÖÑÑ¡T ¤¤dÏž=*—i¤šH$²gÏž’’¥mmmz½^ËZ‚­)Š¢8Ž»xñ¢J{íÚµ.—+-¶…pçr¹T&Ã£ÑèÅ‹9ŽC?\\c¶ÖL&Ó—_~Ùßß¯TÀn·oß¾Ýf³¥ørQm6ÛöíÛUv}ô÷÷ùå—è‡kÁN«ÕZ__¯’Ûòòò]»v”lK’víÚ¥2g&Šb}}½ÒM	0«ì$`Y¶¿¿¿¥¥E¥Ì³Ï>»eË•3º“H>}Ë–-Ï>û¬J±–––þþ~¼¾N\n¦¦¦&Ùu˜‹(Š\Z¨¬¬TÚä¨Óé***X–½qãË²©3F•$)‰lÛ¶íÕW_UÙÑ144ôþûïG\"ìúH\nüÑ“C¾¼îÔ©S*eX–]·nÝÊ•+C¡f›R(Z¹råºuëÔ›âS§N‘tÙ`ÚA‹4z½þÛo¿-(((,,T*c0*++%Ijoo7™LÉm·åWÖ¯¼òJ]]]FF†JÉæææ£GbtDv2±,ÛÞÞ^YY™­TÆ`0TUUåää´µµQ•¬ž­ Ñhô—¿üå¦M›Ô‡vuuíß¿_¯×§ÎðaB°“‰¢¨X,vÿþýêêj³Ù¬R¬¤¤$??ÿÛo¿MÊ™û‘H$++ë7ÞxþùçÕãêóù:4::Š9³äB°“L>À´»»ûG?ú‘zÉ‚‚‚%K–Ð4­MÓ-B$Yºté¯~õ«ŠŠŠ)Ëÿõ¯½sçÖ™%‚|ÃÜ½{wll¬ººZ}¶)33ó¹çž³ÙlÃÃÃ^¯—a˜ÙëîJ’Äq\\~~þÖ­[wïÞ™™©^žçùúúú––•®hÁN	z½¾··7‰¸\\®)›âÒÒÒ%K–ÈËÎu:ÝŒÇ[ÅH$¶nÝºsçÎ§žzjÊÄb±cÇŽ;w.é3| C°S‚<+ÖÕÕuïÞ½åË—OYÞjµº\\®5kÖÈ=ùP(‹Å3á’$ñ</I’ÝnñÅßzë­ÚÚÚiÎl8pàë¯¿6HuŠ@°SEQ,ËvwwOLL”——Oy,EQV«õ©§žª©©),,´Z­<“‡ßÓ˜$IÑh4X­Ö+V¼ôÒK?ùÉOV¬XaµZ§ó?ñûýGŽ9wîœÅbAªSµwïÞd×þŸH$âv»wïÞ­t@·Ò§FGGÚÛÛ›››ÇÇÇM&Ë²r3þp÷^EI’AˆÅb‘HÄn·?ûì³n·»¨¨(;;;®\r###‡–ß±ÇñÂìC°SÏóV«õ7¿ùÍt&¢\'566600ðàÁŸÏÇÇÇåæTîi[­V‡Ã‘››[TT”•••Ø¸uëÖþýûƒÁ ÎMAvŠ’ÇÌÛ¶m{ñÅS­=ŒD\"çÏŸÿè£AÀûêÔ„1vŠ¢iZ^Iz÷îÝ¨/áÔÒýû÷:túôi†a°<e!Ø©‹¢(½^?44tüøqQóóó“ø2I’$ŸÏwüøñ¿üå/>Ÿ¯µRvw¥4I’(Šb¦©©é»ï¾KîÞìáááÁÁA‹Å‹ÅRütÀ;E‰¢FY–]¼xñ+¯¼òä“O\ZÆ¤7’<Ïûýþ³gÏž;w.Ò41vjB°SŽ$I¡Phþüù«W¯^²dÉ‚’]£I+W®466Þ¸qÃd2a°jìòýÚ¯-[¶,_¾\\eŸvŠ»uëÖG}444d±XïÔ`§\nžçM&SeeåîÝ»Ng²«Ÿ\'Nœ?Þãñ`UiŠ@°“O>™dÕªU6lX´hÑãÿ\'&&Âá0ÏóápXÞ¤õƒòpÝ`0˜L&³Ùœ™™ùø›@GGG¿þúë††ymìcþßà1!ØIÆqœ ¯¿þúªU«ç,!ÇÓÛÛ{÷îÝñññááa¿ß‡\'&&DQœ˜˜øAa›ÍFÓ´Åb±Z­6›Íáp8ÎÜÜÜâââÂÂÂ„›\\Qoß¾ýþûï÷÷÷Os©9Ì;iDQä8î™gžÙ±cÇO<ïÇÃáp0¼sçÎ…:::äó@)Š’_Qÿ£Óé\r˜üÚLúQåä’$Ñ4½xñâÚÚZ—Ëe·Û-K¼¹ \'Nœ8uêÇq8q!Yìä¢¨W_}uõêÕ‹%®Ïöõõõ÷÷_¿~½©©)‹™Íf¹ë;#-¤¼?„ã8Q«««—.]ZZZZ^^oD¯_¿þá‡öõõáöÜ¤@°“€çy–eß~ûm—ËW\Z;::\Z»ºº<Ã0³z` œpžç322.\\èv»W¬X×¿AÿøÇ?:;;±£S{¶Ö8Ž[²dÉîÝ»çÏŸ?Íø|¾k×®;vÌãñddd°,«åY¥’$Åb1Žã8ŽÛ¶mÛªU«\n\n\n¦ÿfëøñã\'Nœø~\\\0ÚÀZqíH’4>>¾víÚ={öLó…V8þæ›oŽ9ræÌyºkVÏ9›”<h7f³¹³³S¾=Óf³©ÜÅ÷°²²²¢¢¢Ï?ÿÜl6#ÛšA°5\"¿vÚ´iÓž={¦3ìE±¹¹ùðáÃ_}õU0L…Mò¦QoÞ¼yåÊ•±±±L¹›a˜üüü²²²ÎÎNÜø£[òxuçÎ[¶l™N>ß{ï½£GF\"ƒÁRaãÍóüÍ›7/\\¸àp8²³³§œZ+((¨¨¨¸~ýz(J©_‡Tö¬“$iddäµ×^ûñ<¡é\'Ÿ|òÁôôôÌÈº‘Y\"¯oáyþâÅ‹§¨¨hÊó‰ÇÂ…åÜ)û{Áž]r[½k×®—_~yÊoóÐÐÐÁƒ¿úê«X,–o€išff``àÒ¥KÙÙÙùùùêý‡Ãáv»oÜ¸‡‘íY…`Ï\"y>yûöíë×¯Ÿò{ÜÒÒòÎ;ïšÍæ4úÒËHyžollÔétÅÅÅê£n‡ÃQZZzáÂy«¹VÕœsìYkjjvíÚ5eüìÙ³E1-\ZêGÑ4m0®]»6::ºhÑ\"õCÚœNçüùóÏœ9ƒyòÙƒ`Ïžçkkkßzë-õæ78pàã?¶Z­iÔP?Juœ8qÂív;•Â………N§óêÕ«qÓ‡`ÏŠX,V\\\\ü‹_üBýBŸÏwôèÑ.Øl62¾ß,ËRÕÞÞ^VV¦r7°N§+((ÝÝÝØ\n6Ò¸‰HYò+ë×^{M}m™×ëý÷¿ÿýÍ7ß¤Î	¤3‚eY¿ßÿ÷¿ÿýêÕ«*ÅŒFãŽ;ìv{,Ó¬nsZì&IR8~ã7žyæ•b^¯÷OúS___ª>#hšŽÅbŸ}öYuuunn®R1½^_]]ÝÔÔ$o‰Ñ²†ÄC‹=Ã8Ž[»v­úe×ápøÐ¡C^¯—ÈTËhšÎÉÉ9tèP¿J±¢¢¢mÛ¶E£ÑäÀJ{&	‚PPP°nÝ:•qc(:räÈµk×NµŒaŸÏ÷·¿ýíþýû*Å^xá…åË—ó<¯YÅæ{&ºººüü|•2Ÿ~úé_|1Gî»bYv||üÏþs(R*c0¶mÛ&\Zí„`ÏŽãª««Ýn·J™–––>ø á{ðÒ‘^¯ihhPÉmnnîŽ;=Â	†É³™!‚Ýnÿío«rnYggçÁƒçà9žz½¾££Ãét–””(•ÉÏÏ\Z\Z’Ð²n¤B‹=3AX¿~½ÊÖüñÜÜÛDQ”Ùl>räHWW—R™ÌÌÌ—^z‰atÈgÄœû’ÍArrrV®\\©Ò744tvvÎ‘¡õ£hšáÈ‘#*¹u»Ý¥¥¥x­=#ì7oÞl³Ù”\n\\¾|ùÔ©Sf³YËZ¥\Z½^ßÝÝ}üøq¥EíØ±#hY+R!ØKE§Ó¹|ùr¥gÏžM…+õ’Îh4655\r*(++«©©‰F£ZÖŠHöã\nƒ?ýéOUN;ºtéÒÕ«WÓtÛÖÌbÆãñ|ñÅ*·ðnÝº¯¾‚ýXb±XUUUuuµRÑÑÑúúú9Þ	˜Ñhüä“Onß¾­T ¨¨hÅŠh´‚ýXAxúé§U¶(~þùçØ™øÙÙÙŸ}ö™ÒS‹Å²dÉŠ¢Ðh?;q’$Y,–¥K—*¼xñ\"®Âø–e»ººTö~ÕÖÖfee!ØÁN\\,+//WºÅZÅ‹/ŽÏÁ×ê(Šây¾¹¹9‰LZÀh4ÖÖÖbõøãÀw.q~¿ÝºuJOGGG/\\¸0g_\\«3­­­G©ÀªU«ÆÇÇµ¬aì‰¢XTTTVV¦T ¥¥åÁƒh®\'%7ÚgÏžU*ðÄO¬\\¹‹U†¯]‚8Ž{á…T\Zä“\'Ob2\\…ÑhlhhPê†eË–)=…)!Ø‰ï‘^¸p¡Rƒ|ëÖ­û÷ï£¹VAQ”ÑhlmmU*P\\\\œ‘‘)´Äà›—QËÊÊTn«?þü”7c€Édºté’ÒÓ¼¼¼…\n‚ e•ˆ`\'B>„Ti/—Ïç»{÷.¶N‰a˜¡¡¡¾¾¾IŸÚl¶¼¼<;1v\"$I*((PzÚÛÛ;44„~ø”hšöz½*sã%%%*‹OA¾|‰E±¼¼|ÒG‚ Ü¹s‡çy¬6›Q¿ýö[¥WÖr°1ÌN\0‚7ùF®Lú4\nuwwcËÇ4éõú®®.¥Ùï¼¼<‹Å‚`\'\0ÁŽ› .—Kéi$¹uëØÓDÓtWWW8V*€ù³Ä Øq‹F£UUUJO¿ûî;ŽãÐŸ&ùÕÙÙ©T`Ñ¢EX¦’\0;n‚ ¨œmvóæMìúˆ‹Á`P	vAA¶p&\0ÁŽÏó*°;::pË\\\\X–íîîVzZZZŠ‰ñ Øñ‘$);;[¥§=00€]q¡iú»ï¾Sy:oÞ<d;^ø\nÆGÅììl¥¹1ŸÏ\'IØñ2£££“>b&\'\'ãñB°ã#Šâ¼yó”:Û÷ïßG?<ò4¥G‡-v¼ìøÈg’*¥wllÍu(ŠRºÜ‹eÙììl;^v|$I2›ÍJ£è±±1°@Ó´ÏçSz¤×ëÑ¾…ñ‘$Éd2)¥K)¦ô§c&##-v¼ìøÈ/±•‚=11®x(ŠRºj“¢¨ììlü‹/;>ê“ÞÑhÁN\0EQ*«PÐO\0‚7•yo,O˜ÊŸ/\Z€?Y|,Ë™3gnÝºõè¨a˜ŽŽìëJ€|öáÃ‡írÓ4=44d±X’R±ôEíÝ»7ÙuH3‚ (mKÐëõ˜OŒ(ŠJ½q–eÑŠZì¸1ƒïÙŒ£i\Z›gfš\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°ôÍª×BJèÇ\0\0\0\0IEND®B`‚');

/*Table structure for table `llamado_de_atencion` */

DROP TABLE IF EXISTS `llamado_de_atencion`;

CREATE TABLE `llamado_de_atencion` (
  `cod` int(10) NOT NULL,
  `fecha` date NOT NULL,
  `descripcion` varchar(500) NOT NULL,
  `Fk_des_corta` int(50) NOT NULL,
  `Fk_apren` varchar(50) NOT NULL,
  PRIMARY KEY (`cod`),
  KEY `Fk_apren` (`Fk_apren`),
  KEY `Fk_des_corta` (`Fk_des_corta`),
  CONSTRAINT `llamado_de_atencion_ibfk_1` FOREIGN KEY (`Fk_apren`) REFERENCES `aprendiz` (`Id_Apre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `llamado_de_atencion` */

/*Table structure for table `prog_comp` */

DROP TABLE IF EXISTS `prog_comp`;

CREATE TABLE `prog_comp` (
  `cod_Pro` int(10) NOT NULL,
  `comp_Cod` int(20) NOT NULL,
  KEY `codigoComp` (`comp_Cod`),
  KEY `codigoProg` (`cod_Pro`),
  CONSTRAINT `prog_comp_ibfk_1` FOREIGN KEY (`cod_Pro`) REFERENCES `programas` (`Cod_Pro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `prog_comp` */

/*Table structure for table `programas` */

DROP TABLE IF EXISTS `programas`;

CREATE TABLE `programas` (
  `Cod_Pro` int(40) NOT NULL,
  `Pro_Desc` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Cod_Pro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `programas` */

insert  into `programas`(`Cod_Pro`,`Pro_Desc`) values (1,'ANALISIS Y DESARROLLO DE SISTEMAS DE INFORMACIÃ“N'),(2,'ANALISIS Y DESARROLLO DE SOFTWARE'),(4,'GESTION'),(5,'AVIACION'),(190,'SI');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
