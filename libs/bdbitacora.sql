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

/*Table structure for table `acudiente` */

DROP TABLE IF EXISTS `acudiente`;

CREATE TABLE `acudiente` (
  `Id_Acu` varchar(50) NOT NULL,
  `Acu_Nom` varchar(50) DEFAULT NULL,
  `Acu_Ape` varchar(50) DEFAULT NULL,
  `Acu_Tel` varchar(50) DEFAULT NULL,
  `Acu_Corr` varchar(40) DEFAULT NULL,
  `Acu_Parent` varchar(30) DEFAULT NULL,
  `Acu_Direc` varchar(50) DEFAULT NULL,
  `Id_AprFK` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id_Acu`),
  KEY `aprendiz_Acudiente` (`Id_AprFK`),
  CONSTRAINT `aprendiz_Acudiente` FOREIGN KEY (`Id_AprFK`) REFERENCES `aprendiz` (`Id_Apre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `acudiente` */

LOCK TABLES `acudiente` WRITE;

UNLOCK TABLES;

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

LOCK TABLES `apre_ficha` WRITE;

UNLOCK TABLES;

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

LOCK TABLES `aprendiz` WRITE;

UNLOCK TABLES;

/*Table structure for table `bitacora` */

DROP TABLE IF EXISTS `bitacora`;

CREATE TABLE `bitacora` (
  `Cod_Bit` int(20) NOT NULL,
  `Bit_Fecha` datetime DEFAULT NULL,
  `ID_FuncFK` varchar(30) DEFAULT NULL,
  `Id_ApreFK` varchar(30) DEFAULT NULL,
  `Bit_Des_Larg` varchar(300) DEFAULT NULL,
  `Cod_Des_CortFK` int(30) DEFAULT NULL,
  `fk_plan` int(20) DEFAULT NULL,
  `fk_llamado` int(20) DEFAULT NULL,
  PRIMARY KEY (`Cod_Bit`),
  KEY `Id_ApreFK` (`Id_ApreFK`),
  KEY `ID_FuncFK` (`ID_FuncFK`),
  KEY `Cod_Des_CortFK` (`Cod_Des_CortFK`),
  KEY `fk_plan` (`fk_plan`),
  KEY `fk_llamado` (`fk_llamado`),
  CONSTRAINT `bitacora_ibfk_1` FOREIGN KEY (`Id_ApreFK`) REFERENCES `aprendiz` (`Id_Apre`),
  CONSTRAINT `bitacora_ibfk_2` FOREIGN KEY (`ID_FuncFK`) REFERENCES `funcionario` (`ID_Func`),
  CONSTRAINT `bitacora_ibfk_3` FOREIGN KEY (`Cod_Des_CortFK`) REFERENCES `descripcion_corta` (`Cod_Desc_Cor`),
  CONSTRAINT `bitacora_ibfk_4` FOREIGN KEY (`fk_plan`) REFERENCES `plan_de_mejoramiento` (`cod_plan`),
  CONSTRAINT `bitacora_ibfk_5` FOREIGN KEY (`fk_llamado`) REFERENCES `llamado_de_atencion` (`cod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `bitacora` */

LOCK TABLES `bitacora` WRITE;

UNLOCK TABLES;

/*Table structure for table `competencias` */

DROP TABLE IF EXISTS `competencias`;

CREATE TABLE `competencias` (
  `comp_Cod` int(20) NOT NULL,
  `comp_desc` varchar(255) NOT NULL,
  PRIMARY KEY (`comp_Cod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `competencias` */

LOCK TABLES `competencias` WRITE;

UNLOCK TABLES;

/*Table structure for table `descripcion_corta` */

DROP TABLE IF EXISTS `descripcion_corta`;

CREATE TABLE `descripcion_corta` (
  `Cod_Desc_Cor` int(50) NOT NULL,
  `Des_Cort` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Cod_Desc_Cor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `descripcion_corta` */

LOCK TABLES `descripcion_corta` WRITE;

UNLOCK TABLES;

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

LOCK TABLES `ficha` WRITE;

insert  into `ficha`(`Cod_Ficha`,`Desc_Fich`,`Cod_ProFK`,`fechaIni_Fich`,`fechaFin_Fich`) values (123,'gestion',1,'2023-05-09','2023-05-31'),(1234,'gestion',2,'2023-05-17','2023-05-31'),(2452524,'SISTEMAS',1,'2022-01-24','2024-01-01');

UNLOCK TABLES;

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
  `Fun_Cargo` varchar(20) DEFAULT NULL,
  `Fun_Rol` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID_Func`),
  KEY `Cod_cargoFK` (`Fun_Cargo`),
  KEY `Cod_RolFK` (`Fun_Rol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `funcionario` */

LOCK TABLES `funcionario` WRITE;

insert  into `funcionario`(`ID_Func`,`Fun_Tip_Doc`,`Fun_Nom`,`Fun_Ape`,`Fun_Tel`,`Fun_Correo`,`Fun_Pswd`,`Fun_Direcc`,`Fun_Cargo`,`Fun_Rol`) values ('1001946423','Cedula de Ciudadania','BRAYAN','LOPEZ','3022974095','brayanlpz1525@gmail.com','b761d6d20bfb9ab4adf9e9ab7cc5a4de1c4fae34','Calle 46b #16-107','ADMIN','ADMIN'),('123','Tarjeta de Identidad','KENER','ROMERO','123','kener@gmail.com','93b16f06785d1f7773d056c1b7501f39abf371f1','calle 42#31-69','ADMIN','ADMIN'),('1234','Cedula de Ciudadania','GERMAN','GOENAGA','123','german@gmail.com','da91388c72d3e31da19dcd85c97374197748485d','calle 42#31-69','ADMIN','ADMIN'),('1234567','Cedula de Ciudadania','JUAN','CERVANTES','123','juan@gmail.com','c5652d9cc6bcf28e0e20210eae5ef9e54ba35717','calle 42#31-69','ADMIN','ADMIN');

UNLOCK TABLES;

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
  CONSTRAINT `llamado_de_atencion_ibfk_1` FOREIGN KEY (`Fk_apren`) REFERENCES `aprendiz` (`Id_Apre`),
  CONSTRAINT `llamado_de_atencion_ibfk_2` FOREIGN KEY (`Fk_des_corta`) REFERENCES `descripcion_corta` (`Cod_Desc_Cor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `llamado_de_atencion` */

LOCK TABLES `llamado_de_atencion` WRITE;

UNLOCK TABLES;

/*Table structure for table `plan_de_mejoramiento` */

DROP TABLE IF EXISTS `plan_de_mejoramiento`;

CREATE TABLE `plan_de_mejoramiento` (
  `cod_plan` int(20) NOT NULL,
  `fecha_plan` date NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_fin` time NOT NULL,
  `lugar` varchar(20) NOT NULL,
  `tema` varchar(20) NOT NULL,
  `Fk_apren` varchar(50) NOT NULL,
  `objetivos` varchar(20) NOT NULL,
  `descripcion_plan` varchar(20) NOT NULL,
  `evidencia` varchar(20) NOT NULL,
  `resultado` int(10) NOT NULL,
  `forma_entrega` varchar(20) NOT NULL,
  `fk_funcionario` varchar(50) NOT NULL,
  `plnMej_Estado` char(5) NOT NULL COMMENT 'A="Activo", I="Inactivo", E="En proceso"',
  PRIMARY KEY (`cod_plan`),
  KEY `Fk_apren` (`Fk_apren`),
  KEY `fk_funcionario` (`fk_funcionario`),
  KEY `resultadoApr` (`resultado`),
  CONSTRAINT `plan_de_mejoramiento_ibfk_1` FOREIGN KEY (`Fk_apren`) REFERENCES `aprendiz` (`Id_Apre`),
  CONSTRAINT `plan_de_mejoramiento_ibfk_2` FOREIGN KEY (`fk_funcionario`) REFERENCES `funcionario` (`ID_Func`),
  CONSTRAINT `resultadoApr` FOREIGN KEY (`resultado`) REFERENCES `resultados_aprendizaje` (`result_Cod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `plan_de_mejoramiento` */

LOCK TABLES `plan_de_mejoramiento` WRITE;

UNLOCK TABLES;

/*Table structure for table `prog_comp` */

DROP TABLE IF EXISTS `prog_comp`;

CREATE TABLE `prog_comp` (
  `cod_Pro` int(10) NOT NULL,
  `comp_Cod` int(20) NOT NULL,
  KEY `codigoComp` (`comp_Cod`),
  KEY `codigoProg` (`cod_Pro`),
  CONSTRAINT `codigoComp` FOREIGN KEY (`comp_Cod`) REFERENCES `competencias` (`comp_Cod`),
  CONSTRAINT `prog_comp_ibfk_1` FOREIGN KEY (`cod_Pro`) REFERENCES `programas` (`Cod_Pro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `prog_comp` */

LOCK TABLES `prog_comp` WRITE;

UNLOCK TABLES;

/*Table structure for table `programas` */

DROP TABLE IF EXISTS `programas`;

CREATE TABLE `programas` (
  `Cod_Pro` int(40) NOT NULL,
  `Pro_Desc` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Cod_Pro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `programas` */

LOCK TABLES `programas` WRITE;

insert  into `programas`(`Cod_Pro`,`Pro_Desc`) values (1,'ANALISIS Y DESARROLLO DE SISTEMAS DE INFORMACIÓN'),(2,'ANALISIS Y DESARROLLO DE SOFTWARE'),(4,'GESTION'),(5,'AVIACION');

UNLOCK TABLES;

/*Table structure for table `resultados_aprendizaje` */

DROP TABLE IF EXISTS `resultados_aprendizaje`;

CREATE TABLE `resultados_aprendizaje` (
  `result_Cod` int(10) NOT NULL,
  `resutt_Desc` varchar(300) NOT NULL,
  `comp_CodFK` int(20) NOT NULL,
  PRIMARY KEY (`result_Cod`),
  KEY `compCodigo` (`comp_CodFK`),
  CONSTRAINT `compCodigo` FOREIGN KEY (`comp_CodFK`) REFERENCES `competencias` (`comp_Cod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `resultados_aprendizaje` */

LOCK TABLES `resultados_aprendizaje` WRITE;

UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
