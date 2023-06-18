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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `acta_compromiso` */

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
  KEY `aprendiz_Acudiente` (`Id_AprFK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `acudiente` */

/*Table structure for table `apre_acud` */

DROP TABLE IF EXISTS `apre_acud`;

CREATE TABLE `apre_acud` (
  `Id_Apre` varchar(50) DEFAULT NULL,
  `Id_Acud` varchar(50) DEFAULT NULL,
  KEY `foreignkey1` (`Id_Acud`),
  KEY `foreignkey2` (`Id_Apre`),
  CONSTRAINT `foreignkey1` FOREIGN KEY (`Id_Acud`) REFERENCES `acudiente` (`Id_Acu`),
  CONSTRAINT `foreignkey2` FOREIGN KEY (`Id_Apre`) REFERENCES `aprendiz` (`Id_Apre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `apre_acud` */

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

/*Table structure for table `aprendices_actas` */

DROP TABLE IF EXISTS `aprendices_actas`;

CREATE TABLE `aprendices_actas` (
  `codActaFK` int(11) DEFAULT NULL,
  `idAprendizFK` varchar(50) DEFAULT NULL,
  `codFichaFK` int(30) DEFAULT NULL,
  KEY `fk1` (`codActaFK`),
  KEY `fk2` (`idAprendizFK`),
  KEY `fk3` (`codFichaFK`),
  CONSTRAINT `fk1` FOREIGN KEY (`codActaFK`) REFERENCES `acta_compromiso` (`codActa`),
  CONSTRAINT `fk2` FOREIGN KEY (`idAprendizFK`) REFERENCES `aprendiz` (`Id_Apre`),
  CONSTRAINT `fk3` FOREIGN KEY (`codFichaFK`) REFERENCES `ficha` (`Cod_Ficha`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `aprendices_actas` */

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
  CONSTRAINT `bitacora_ibfk_3` FOREIGN KEY (`Cod_Des_CortFK`) REFERENCES `descripcion_corta` (`Cod_Desc_Cor`),
  CONSTRAINT `bitacora_ibfk_6` FOREIGN KEY (`fk_ficha`) REFERENCES `ficha` (`Cod_Ficha`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `bitacora` */

/*Table structure for table `bitacora_aprendiz` */

DROP TABLE IF EXISTS `bitacora_aprendiz`;

CREATE TABLE `bitacora_aprendiz` (
  `Cod_Bit_FK` int(20) DEFAULT NULL,
  `Id_Apre_FK` varchar(50) DEFAULT NULL,
  `Cod_Ficha_FK` int(30) DEFAULT NULL,
  KEY `bitacora_aprendiz1` (`Cod_Bit_FK`),
  KEY `bitacora_aprendiz2` (`Id_Apre_FK`),
  KEY `bitacora_aprendiz3` (`Cod_Ficha_FK`),
  CONSTRAINT `bitacora_aprendiz1` FOREIGN KEY (`Cod_Bit_FK`) REFERENCES `bitacora` (`Cod_Bit`),
  CONSTRAINT `bitacora_aprendiz2` FOREIGN KEY (`Id_Apre_FK`) REFERENCES `aprendiz` (`Id_Apre`),
  CONSTRAINT `bitacora_aprendiz3` FOREIGN KEY (`Cod_Ficha_FK`) REFERENCES `ficha` (`Cod_Ficha`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `bitacora_aprendiz` */

/*Table structure for table `competencias` */

DROP TABLE IF EXISTS `competencias`;

CREATE TABLE `competencias` (
  `comp_Cod` int(20) NOT NULL,
  `comp_desc` varchar(255) NOT NULL,
  PRIMARY KEY (`comp_Cod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `competencias` */

/*Table structure for table `descripcion_corta` */

DROP TABLE IF EXISTS `descripcion_corta`;

CREATE TABLE `descripcion_corta` (
  `Cod_Desc_Cor` int(50) NOT NULL,
  `Des_Cort` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Cod_Desc_Cor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `descripcion_corta` */

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

insert  into `funcionario`(`ID_Func`,`Fun_Tip_Doc`,`Fun_Nom`,`Fun_Ape`,`Fun_Tel`,`Fun_Correo`,`Fun_Pswd`,`Fun_Direcc`,`Fun_Rol`,`Fun_Img`) values ('1001946423','Cedula de Ciudadania','BRAYAN','LOPEZ','3022974095','brayanlpz1525@gmail.com','b761d6d20bfb9ab4adf9e9ab7cc5a4de1c4fae34','Calle 46b #16-107','ADMIN',NULL),('1129506976','Cedula de Ciudadania','ASHLEY','DEFORT','3215795145','ashley@gmail.com','7c4a8d09ca3762af61e59520943dc26494f8941b','Calle 59C 22E-10','ADMIN','ÿØÿà\0JFIF\0\0\0\0\0\0ÿÛ\0C\0	\Z!\Z\"$\"$ÿÛ\0CÿÀ\0rr\"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0	ÿÄ\0N\0\0	\0\0!1Qa‘Aqğ\"¡ÁÑU”±23BR#br$S‚’¢£²Âá57CDTs%46c³tÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\06\0\0\0\0\0!1Aa\"2Qq¡±B‘Ñá4R3ğ$C’ñÿÚ\0\0\0?\0öU@X·\0@[€%H\0â KÜ\\	`Z‹n*¸¨…¸âà@[“ \0[‹‹qp -ÅÀ€·\0@P-ÉĞnN€‹rT\0°è\0äè\0àqp -ÅÀ€·\'@Å¨¸nN€n@\0·Ü\\qp -ÅÀ€·âà@[‹n.¸¸à	QRÜjõ¼zŞ[‹=o·—Q¨Öñëx¹nõ¼zŞ]EÀ•·‹—P%G­å¸Ô	ëxõ¼·\Z=o·‹–àO[ÅKr\\G­åÔjõ¼zŞ..Öñëyu%ÀzŞ=o\Z–àO[Ç­å¸¸£Öñ¨Ô­â¢âà=oëx©n.õ¼zŞ[’à=o-ÉpQëx¸¸[Ç­å¹.£Öñqp·‹—P%EEÅÀzŞ=oQRÜ—ëxõ¼\\·zŞ=o-Æ J[Ë¨¸Öñëyn.õ¼zŞ]F O[Ç­å¸Ô	ëxõ¼º@·[Ëq¨ÖñëyuzŞ=o.£P%An\0·‚Ü\\qp\'­ãÖòÜ\\	¨õ¼ª¤¸\r~#ÖòÜ—\0=o-ÅÀ·[Ëqp õ¼·[Ëqp&£Ä·[ÅÅÀzŞ=o \rG­âå¸Öğ[’à=o8x¼Ë…ª‰‚—ò§WÑœVÓJ†Øl<qóÑtUù™]L2{°Ø‰PÂ»Ñ4’ŞêixŒû2e6KûŠŸVc§N9ÖtØæ?ïDßêeåµNy÷§fó;4Ëä§í1r«ÂŞ}Â´y|N™å\rÅ£P¨©”Ráøã¼Ì¶I»Q\n´¬#â™O‚G=§Æ¿Ü“\"Í6ÿ\0SQRy!ti0Çåe£ÚÉî™.(ÌüâÏ3H¿õOH!_#R“Ëã(ü±ú9ï9Ìÿ\0÷‘t_B}ó™ï#è¾‡¢£heácÿ\0dVyš-Ø¸Ÿœ¿‘úC´’ß:¼à_$bª*6†3ƒşXı¸6—ïK‘òiş§ï+j\"ÿ\0ÌÂ\'Î|(Ív¢¤rÃ	ÒaŸÊÛ%m.\n+G*|\Z&¿S™\'9ËfÚT¾ÖÔÑê*G$*¶ƒöŞ*d¹÷¥L†5ÆT}úŞu¼Å]è\"ŠÅ6™ÏÃç9”Š%Šq¥á3Şø»üHğå¯nh÷lŞA¬av+,N>1Ktø?©•ÂçY~\"‰Oöq?å™îüw|Lf³\r[é²Ó¼2^·‚\'ŞUM4÷W1PƒÖñqp·qpÖñqp·qp·[Ëqp\'­ãÖòÜ\\	ëx^®[‹=o·–âàM~#ÖòÜ—¯ÄzŞ[’à5ø[Ëqp\'­ãRÜ\\	ëxÔ·zŞp°±n.°±n.°±n.°±UEÀ–-ÅÀ–-ÅÀ–-ÅÀ”-ÅÀ–-ÅÀ–-Åê°±n. ¡nq1øü.\n\Zâ&¨_„;ÛòA5¬Úv‡*ÇãŠÄÈÃAßŸ6pÿ\0yšÎa´x‰•ƒ	“õExŸÉ|L$Ù“fÆæM™È÷m™Å>-üZ[­çfÍÚY0û¸IQLÕ—Mïàa1y®;i˜ˆ¡…ÿ\0,êøoÔá‚È¬C›>ĞšJK’¼Ôj.P&£R’à5\Z‹”	¨Ô\\\\£R€&£Qqp\ZEÅÀj5(j5¨Ô¤¸Œ&7…iÈŸµ¾‰Õ=ŒÎi¦/w%D¿ª>Ïª5ò\\‰¬J¬˜1ä÷¡¾à³1a:ô»D´g2Ç[&ÓM6šºhÊåùî;\rHfEíå¯İ×“ßÖ¦OƒC/˜ëIn”1¹~qƒÆR3ÙÌÉs2w0˜ÙÏ½-IÚÑ²XP·!ŠPX·PX·XX·XXº‹,,[‹,,[@–-ÅÀ–.¢àKâàJâàJÜ,,[‹,,[‹,,[‹‹qp%¸‹âàKqâ[‹,-Ä·X[‰n.°±n.°·ÜùmBœQ:%¼cğÆb°øY^Ò|Å./Ë‰†Í¶‚\\ªÊÁ%6=Î?å^\\O3ZÄOŸˆšæO™Èß‹ÁÅ&[Ø46¿[ô†g2Ú)Ó+\r9Pnï»Äü¼ƒ(£‰ÇqEumº·©..YêcÅLqµa-Äº‹‹’°Ôj..Q¨¸¸\rIn%¸¸\rF¢âà5\Z‹‹€Ôj..–â]EÅÂ\rF¢âà5\Z‹‹-Äº‹‹-Äº‹‹€Ôj./À£Qqp\ZEÅÀ–âe2Üï„¤Eí¥/åİ.OÃâc..&7c|u¼mhİ½eÙ¦\nR£¤ÊUÁšúèsõ:Ş1\'i§TÓ£LÎå[C6U%c“™å1~òóãúù•Í>f}×®>¾¬|¬D¥6LpÌîiŸ­ÊÜéºJX[‰n.°±n.·bÜ\\	abÜ\\	an%¸¸[‰n.·n%¸¸ÂÜKqp ±n.·[€%…‹ XXº\0%…‹ Ğ	abŠ,,Z\n‹ Ğ	aaBè°±h4X[‰t0ùÎs\'œ©ILŸOİğ‡Ì˜ÙÓ²[–°çfì>W´ÄGJî…]Äø$j¶qˆÇ·\\©´½şoÇô8x¬DìLè¦Ï˜ãñğä¸#ò½wÅvv4úJâë=e,,[‹™6ÒÂÅ¿p%…‹~æÂÅ¿\\…‹~àKq-ø!~	n\"Å¿/À	abß‚à€–-øğ@Kq-øğX[‰oÀ_€ÂÅ¿~	abß‚à°±oÀ_‚[ˆ±oÀ_€ÂÅ¿/À	abß€¿\0%…‹~ü\0–â[ğBüœ7‚›ß‘1ªï…İ?4m¹Fq‡ÇÂ şä¯{üŸ‰¤ß‚¸¡‰8[M:¦\Zf3X–¾}52úK²l,kY&^ìŒs£Ü¦¿Ÿ×¯eM5UFš*˜ÙÆË†Ø­µ‹A¡\n’ÂÅĞh°±h4XXº\n,,]€KA ÂÅ Ğ	n\"Å Ğ	n º\0%h(·Z€,A@\"óâTJ\0°·èJ\0°±h4ƒ@%…¸’&¡]è¨’W5Lÿ\0:sÜXlMJİk||—/Ô˜×aÃlÖÚŒó=î¸°ø½ïæš·.KêkM¸›Š&Ûwmøú.ˆÙÛÅ†¸«µ_#Ä¼CŞJÔyô\0ùğĞä@Z\\ |ƒèù\0AàĞä\n–+†ÂËö˜¬D™TÈÔ+«bf#¬¥úĞ^Úì¦µ7=Á6·©QûOøjbçöŸ±ÒÛPæ¦Óú0Ñ¯Õ\"‹j°W½ãõ„òËs‡k)·Û¢ò¾l‹µ•në¹¹êWş¿MşpIø7ÑCJ“ÚÈF×{>W8ğÑ?Ñ3%„Û­‘Äµì³Ü,5ÿ\0;Yñ$g]^v¼~°Yl`ãà±øl=ì7\r‰[ë&l1¯ƒg&…ñ11¼!\0-ÉB\0}òh\0´\0}òrò\0\0ôÉ˜Èó™˜&¤ÏqLÃ½Ë{ƒË—#˜İ†LuÉ^[C±$Í—:T3%F£‚%T×‰úXÑ²lÎv_6—LOß‚¿Á›+&ÒbQAêZ»8š=°Ï£ö·©t\ZµÒÜE… QbèJ\0°·Ğh·bè(·©t\Z,,]€Kè\0XX,,[,,[\0%……Š°±l@°ÄmCq4’Uolj{G›¹î,&/ì“¤q/ç|/Ô˜×aÃlÖÚ;Aœ¼TQap­©	Ò(•œôıL)4\ZDlîãÇ\\uåª‚h4D³Rx\n\0–\Z\r\0xš\r\0PXh4@PM€P	¢ƒµ[W’ìÜöc‰N{Uƒ.‘LJÙst\\Î Ú¾Ó³ÜÙÅ#/uá]U%:Ì‰szÒlÑÕq:~–çáëI—rmÓäY/ï<ÆL©”ª”ŸzcáHU^­PëÜ÷¶(SŠ^K•8¸MÅ:/õ!=¤8ãÇ1ÅQ:¸¢umñlš,üg>N”öalcˆlù¾ßmfdÚ™›Î‘-ÿ\0&)i.ToVÍj|é¸‰n\"lÉ³ø£‰¶õgÎ‚üfL·É;ŞfYÄl–.‚ü\nÒ€ºğ€¿\0,Åj(\"Š“ªiÑ­LîU¶{Q–5ö\\ëá[ ›´….Š©h`oÀ_2^“½gdLnìü—¶ÂS†ß,‘‰‡sCrãóiÕ7åC~Ùı¿ÙŒåÃ.V=agÅD¥b’–ëÁ6èß$Û<å ¿£‡‹ê1ûÓÍ¬\'KÖª”ªº~\'Ñæ­˜ÛM Ùø¡‡ŠfoÃÎ¬réÁ&ê´hí½í+%Îœlm2Ük¢PÍ‰9q¾QÙW“§*Í/ÃŸÙŸf}uvÇ0ŞóåBèt•©(4\ZAò]\0 š\r\0 š\r\0 š\r\0 š! æåŒì¾z\ZÅ.\'ïÁ[5ÅpgA î‹V/Ogaá1±R!&%+}ÚÆ‹“fS2ùõUŠLN‘Áó\\ÍÛ:\\ù0Í•Š•S)µvpõ:yÃoGéaabØÅ¬–-…€–-‰`-……€–-…€–`[\0!I Ğ\0ä]\0…%y@ °Ğh\0\r€£C´9¢ÁHöRŸöó¿º¸“»<tœ–ŠÕÂÚ|Û»ŞÀáâ÷·M‰x.çĞÖkÌúm¶Û«ní»¶M¢6w°á®*òÁ~\"£A¡+K‹€J–¯ˆĞhâãA Ğ\\h4q~#A \rEÆ‡3Çá2ÜÜv:|0ò—z8âvK‡6÷$®Ù1¼ŞlÈ%KŠdÙË—n(¢i$–öÛÜ§ÛŞÔû®<¿fbMªÃ6%UÏ¸Ÿêô[™«v‡·˜í¥ãÂåp¿vRtŠm78éÕ-Ë›¹¥o]Å¦ŞÆ‘ñı—Óœ¿LLéØ™ñâ1£›66ÜqÇqDø¶îÏÌ‡3ºĞ\0@j5\0\0\0£P\0\0\0j\0\0\0\0]H\0Ş6´\\ÏgÜ¼&:(ñÙr¢îDë2Rşã~ƒ·\nã‘æù~u—ÁËq0Ï‘ª¬á~)­é®ò±™Ù-¤Ì¶k2X¼ÆàtS¤Äßrjà×zê¾‡Š_ÔÉÖ¿ev¤OXzz¯ˆ¿²{E—í&U;ÕÙQ5ß•Škô~(Ëèzš^·¬Z³¼J‰’¥¿ ĞÉ¢ãA ‹€..4\Z\0Ôj4\Z\0Ô_ˆĞhüL®Ïæ?ÙÍ‰¼<nëuñ_3 Ğ‰Øä¥rW–ÎÈ†(c…EM5f¼KcWÙ|Ó¹Àâ\"÷[¤¦ü\'àmäS1³›â·,·\nòäB Xh4\0RW‘kÈ	oH¤¯! ^E¯ \Z‚h\0j5·”	¨Ôiñ·€Ôj4ø> ˜Ôiñ\Z|@j5\Z|HÚ…7J÷Ü2ÅÊÀábŸ2ô²^1?h¸©ó18ˆçÍŠ±Äêùr\\nĞf‹}ÆıŒ¶Ôø½C¡u#hvôš\n»Ïy5\Z†M³Q¨ĞhQ¨ĞhRxï.ƒÇp\rF£A \rF£A \rF£BDá†i$›mº$€ü3f/ÀÎÇcgÃ\'&ÈâvKæüWlóßh{c‹ÚœÃ»ŠN])¿a!½şø¸·ğV^-óûWÛ(¶‡0y~cY^\Z&“NÓãVï¾KÁkãmœ-Äø„æŸû1õş¦İdÔj)ÈS‘ÆXS˜ä)È£QNC@QNBœ€j)ÌS§ \ZNBœ€j5ä)È£QNBœ€j5ä)È£QNBœ€º“QNBœ€ÍlvÑcvk8—ÂDâÒÒ[¤3`­Óàø?ª~È³Ls•HÌ°3{ò\'CU]ğ¿×ƒN©£ÊÔäo]‘moÜ¿Ø1³;¹n.$¢q;Jr’{Ÿ*?¯ÂõŞ\rü;Ï³?IWzïÃ¿u\Z‘Q¤ÕÓñ.‡«kšFƒ@\ZFƒ@\ZFƒ@\ZFƒ@\ZFƒ@\ZFƒ@\nªéÜÜvw3ûnÙM‹ûyjíÿ\02ğSNĞı°x‰˜LLå:E¯&¼SäÈµw…\ZŒš›yù;Q¯Àü08™x¼,åşìKwŠä~ş·”83´šü£Oˆõ¼ ×à5\Z|JÔkğ\Z|FŸ\ZFŸ§Ä\n	ëxê5\Z\r\0šK¡4ê5&ƒ@.£RWĞ©¯mfaì¤ıŠTTb÷ßxkúy™œv&^2|ÏİWÍø#AÅO™ˆÄG>c¬Qº¿§‘#yİ½¢ÁÏniíÏQ¨ĞhZì\ZFƒ@\ZFƒ@\ZFƒ@\ZFƒ@\ZFƒ@\ZFƒ@\ZaÛnÖ¼ìæm1á®.(]àîƒÍï|¼Íçks¼>ÏdœÏ“öPÒ\\\rÑÇ´0¯7¿‚MøfÌq¸ŒÃ?‹˜æOŸdOÅ·]àq¸¾³Â§…^óöşVã®ı\\}Atäyeè^C@%t\Z5ĞT	¨¡t\0ANeªà4S˜.‚¼€€º@\Z¢ÅĞ(]€ABŠòPA^@wob»Zó,ÜùµÅá`®(æJ^Ü?¥86vN§”²œ~\'+Ì°ù?g>DÅÂ«ÁñMU5â›=7³9¾=É0¹¦ĞN‚±CZ¸\"Vp¾iÕ||OUÂu5<;w²Œ•Úwdµ\Z‡aQ¨Ôh4¨Ôh4¨Ôh4¨Ôh4¨Ôh4¨Ôh41³‡Ùq~ÂlT“9¥}ĞÅàõİÓ¸êuµyÎcşÛ‚PÌu*Å]íx2»Ç›™¯Áÿ\0²?å—ÔjM¡[˜j5&ƒ@.£Rh4ê5&ƒ@(&€¨¹p \0rj.\0‹œ\\Ó2{£i{«‹{Mk6˜ˆk»]ö¸˜prâ÷%:ÇO¸h¿V`­RÇQÇq·Q6Ûñmï&…ñCĞâÇéƒQj„¬KÃA£aa Ğ¢ÃA£ÄUTh4aa Ğ	n%ÔhÌFØç2ò›Ææ‘QÅ*[R¡Í´+«UåSŞ)Y´ö„Änê>Ü6‰æ9ô96epØı¥¢šÕú+ru:ìûŸ6dùÑÎ›QÌ\'q;¶Û«oÍŸ\ZQšÙòNIómDmæ5\Z\r\n\ns\Z\r\0 Ğ\0\Z\r\0\rFƒ@\0h4¨\Z\r\0 Ğ h4¨\Z\r\0 Ğ\0\Z\r\04\Z\0;+°½¢x,ŞfEˆ™Iß~M]¡š–íR§šKÄë]×	>n+‡)seF£—ŞšuOª/Ógœc$y\"cxÙë+Í—Í¥g™4”’Så§+ùcV‰hÓFOF{šÚ-X´v–´ÆÅF£F4fH5\ZÑ€ªâ,4c@àÅ¸0)4cFQUÄhÆŒ§3&Æ¼>	Õ}ÇîÆ—Š{úoĞáè4a¬Z&²ìˆbQCŞ…¦îe¹„Ù<o·Á¼4q{òl«½ÃáÓwC7r‰¥çrãœwšÉrÜ—!‚Ü\\—rÜ‚à+çĞàÅÉa`-ÅÉa`sSÚüc›Š‡	÷e^.q?¢ıY²ã\'Á†ÂÌŸè!o~ó¯çLŠlØæÌuŠ6âo›ft»º\Z\\Ö›Ï“ãÀú>l[ºÈ}6-€‡Ñ,Kôš¢Ø\nš¢Øâ,,°°êßó—#Êİ}¢rOÅÕ@Ÿ’ï=QÛí¤›m$•[nÉ_ÚüÕç[MÌÛnÓŸ³¯„\nĞ.‰3ŸÃÁÉíöY:±5”l\0*€TT\0¨¨\0**-ÀXEE…€TTXXEE…€TTXX\0¨°QQa`ÁEE¸‚¢ÂÀvïìÿ\0œ·;!›işS%7áe\Zÿ\0…Ó›;lóÂfßrín_˜8»²áš¡šënäV‹¢mù¤zn¨õœ?‰ƒ’{×íä×ÉKèù-…²´¡ô|ØX |ÕÀPK¨ KÀ}âÄ°@–™“âŞ0—9¶¡¯v4¼SßÓ~†úUSM=ÌëkÌbÖ\',PÄıù/¸ëâ¼KhWxósx†.‘’{‹’ÂÅnYqqa`-Éa`Oˆ‚h4Ü\\”ê	  \ZöÙb»²%á!w÷âò[º¿ĞÕêssÌOÚ³IÓ¬)÷aòVøİêp­Á—Ö6‡MÃÅ¤õ¸h4%yëqInhĞ[ƒëqI ·ÖáëpÑ‹Iãÿ\0AnhÀzÜRh,¹Ú^fò­ˆÌ±Åİ™¯c.›ëîÕsI·¡æÃ¸¿hLs.Ë2Èbş,Ø§Æ¹B¨«çŞ}œĞò|g/>£—áËctQ~$ĞhrV-9‚h4ê™4\Z\0¹I Ğ¨&ƒ@(&ƒ@.¤¸ĞhâãA R\\h4r“A A A üIq Ğ\n5&ƒ@(&ƒ@=5°›Íö;,ÆÄûÓ•.c{Üp{­¿6›Ôó.‡u~ÏÙ‡¶Èó¶\'W‡¦BŸ„1ªQkz——?\'Æ>ÊòGGfúÜ=n\Z\rT×=n·\r€=n\Z\r\0zÜRX[ƒ‚Xh\'­ÃA [‡­ÂÂÜ[Œ¶Êâ¾Ï™©Q?rzî¾Ş¾š˜›œÃ-¨¡i®M1¼0ÉH½&³æì›N>\nzÄá%O‡tp§äüOŞ…;11;Jê5%Q©((Ô€qrXXqrXXs…œb-Ÿ9:D¡¤>nËâs,k»gˆ¤‰8h_ï·^JËâÉ¬o+°SÄÉk%…‹Şz„·n\0[”ùĞX¢t%¸pô	nÜ\0·)óa`/Ã¡-ÀUz\nÂÀt\'n8×ŠÛˆ°ê*Ã„ÃÁ.iÆÿ\0â]\rÍmÎ/íÛa›b{ÕQbãP¾0¦Òø$a¬x]VO5íë-ªÆĞ”ò°±®È¿t7ÜË`¢Âl«ï¬ÆZöó¥·e-¥îÓÁ¥vüÕìI»B§4:Ä	AO!a`…€t-‰`¡l, ABØ•@/Èj,,  ±l§ÔXXÅ<……€tò6ì~ÉE\'³ü&ĞKï9ñFã\rl¥Dé^TOı\'ÀÔlI1±Ğt-ˆ‡`öx}±™„‰û¸¬4p¥Æ(Z‰|]N¾±°vu‹ûÜåëDñ0Ëo”~ãøDlèïáç¥½a£xz_ÃÀt%…¸åª½<‰nÀ^‚ä·`>‰rXXqrXXqr[€·\0>‰zxÂÀ}W‘,-À\r³c±Ó3¼¸ª¼ŸıS3÷4­•ŸìsX`nÍNç½|U57KŞ6—[N\\³êº‹’ÂÆ-U¸Ô–ÜÀ¨©((ÔjJ\nu4¨í³‰‰;KJ¥ßÅ³t‰¨an+%¼ë¼DÇ;2sßn\'«©f>î‡®÷›|£QaBÇXÔj,(Q¨ °\rF¢‚À5\Z‹\0Ôj,(Æ¢‚Š 5?<LØda¦Ïû²àq¿$ªÏÒ†#mg}Ÿd3yÉÑÃ‚›GÍÀÒø´c{rÖgà˜îóØâ›69±ÅX£n&ø¶êÉ©(r2ü+0ä`äG:b…ÆÔ+t)U¶÷$\0Ûqõ\nş\"‚„\r£³,™gU!M‡½‡Ã/o55f“TZ¶­Â§yâäÁ‰ÂÍÃÍU‚l·Iø¦š©¢ö%—)#1‰{ø©İÔéüY|\\]\rù´“n´J¦KiCÌQÂà(]šm?4MN|ì§7™69Ÿuã—z&ÿ\0ûxü_‘ó÷>mø^;òñıU84æ59ßsæß…ã¿/Ğ}Ï›~ü¼@8Z“S÷>mø^;òñıÜù·áxïËÇô…©59ßsæß…c¿/Ğ}Ï›~ü¼@8:—S›÷>mø^;òñıÜù·áxïËÇô…¨ÔæıÏ›~ü¼A÷>mø^;òñı\0àê59ßsæß…ã¿/Ğ}Ï›~ü¼@8Z“S÷>møV;òñıÜù·áXïËÇô„üÉNg;î|Ûğ¼wåãú¹óoÂñß—èRês~çÍ¿Ç~^? ûŸ6ü/ùxş€pµ\Zœß¹óoÂñß—è>çÍ¿Ç~^? í³Ø|>?arü$Ä¢“?/—.4¸8zï:2ÂLÀæ8ŒïâH›¸­½¦Õ~wvY;ÈÈÃb°ó¤ÍÂÇ¦¦ÀámV©¤Öê:hußl„Û“¡†â¤Á6Û«x_ü5Ô–v›´íI¨¡ÈË0Só|œ(§N‰Cn‰·ºş0qõ?lø°ØÉˆ_½*d1¯4Ó_ Æá1,\\Ì&.LrgÊ}Øà‰Q§ëÄüQ1;[Ab…Õ4škÅ2Ó™Ù™ßiÙ¬³İ\\Ü$¨Ûó?™‘±ô\nÛš±-BœÆ¢‚„ §1¨  ñâ((Q¨  ñâ(,QNb‚€5\ZŠ\núaæ93åÍNğD¢Z:‡pÇ1ÂêšM?3®(o;?7Ûe8x›¼0÷^–ùäø¹ÜF+fGQ©(,Vå.£RP´¨%\0QbØbXw7ÙeX˜Ó¿³iy»/ÔĞ®n_3¹•(+ûóÑUüBÅ´Ç®Øæ}Râå°±›y..[..[T	qrØXê.[..[./RØx.k=ªMr¶6´¬¥Xá_3g±§vÍw³ÌÂëŠRÿ\0yù\Zú¹ÛçÒ~Ì«İçšİÙ–ÏJË¶UMX¬Â_~dM]@×»•|ÛàtÖU†ûng„ÁªÖ|è%Û›KæzZa—0A\nPÂ’InInG††í#Íæ)°E.dRâTŠÓ\\\Z±óS3¶ø?°mng†j‰b\"ŠÁEï/ƒF\ZÄ0za°Ë²T…\rÙ¡®%ŞÌÕÎ>Y—–áeÂ­˜Ñ$r*Œ—ÁQQT,\\TU\n€¨¨ªä¢¢ÂÀ**,,¢¢Â **,+ÈEE…@TTXXEEP°\n‹‹\0©Õı»HIåX¤®ı¤¸Ÿú­|ÎĞ±×İ¹@ÏàfRëN°7òÆİASdìÊS·9d4ªQÅÒşF·cxì[\rí¶¶9í{²0ÑÅ^m¤¾\rô\"GvËÛ>E#+ƒ=‘-)øf œÒ¼RÛ¢oÉµ£|¢©éL÷a’ãp-WÛÈÉ´Òz:3ÍvñÊñÕénÎ&¹Û“ÅZÓ\r-ò6š¯dq÷û;Ê¢ot3I±¯‘µØ÷Ziß\r\'Ò>Í+wK‹–Å/bù¸¹lP>n[”–r\\ú%€\\—>€ä¹ôK\0¹.}À.m[7½‚%»Á1=\Zÿ\0£5c9±“)*¶]uM}Y»5µ•æÃ-°Å.j…€µ ,-ÄaB[ˆ°\ZŞÛGl4¥ââ‰üıY¬ĞÎíœIæ2 ­”¤ú·ô0z—W³½¤°Õ)ä(]F¦M„§§‘u\Z()ä]F Jy\nyQ¨B…Ôj§¡u\Z()ä]F Jy\ZWm®›ˆ\\gJ_í#vÔÒ;oÿ\0ğÿ\0üò¿SW[ı½şRÊ½áÓ[	lr˜ZTX˜©×äz¡çmŠ™®Êcn‹írÓ~q%ó=xˆocìê>ÛòÇ\'7ÂæCîbeû8Ú_ÏæüÓ]×}AmîK÷îÍb0*â ^ÖGøÕhµUZ~i¦ÓM4èÓŞ˜–7¥él¢5;*ÂMTj9DŸœ)œ†³ÜZÆìfW7½W•)òp7ÈÏ¶;@VDè\0ƒ \0:€iäN€\0è:\0-<‰ĞXiäN€\0è:\0 è\0ƒ \0:\Zn--šÁCj¼b} êoç[vë9,W\"·lqSÉ%ÿ\00–6ìê‡lvpeù†c+ûYÉ¾ªºkèu:M´’m·D‘èŒÊşæÙœ(i2	}é«ûíÕ­¦„BºGVc¡æl|*~\"•!›Z6za´“‰º$ªÛ<É‰˜¦âfÍş¸Ü][bYdz±§^ÎòåÁÍ_ïc7\ny\Zc?øy—ßù¦ÿ\0ıb7Oq£şŞŸ(û4mİ((]F¦Ë§§‘u\Z()ä]F :EÔj§§‘u\Z€èJyQ¨\nyEÔj§‘”Ùxû™Ô”ßï(¡}Í#©ÊÊ\"îf¸X«ÿ\0›\nzº|ÈÌ2ÆøíÀ°±-ÄX¡ç‚Ä°°€–\0[‹’¢ ]„°°\ZfÖDŞq\Zş˜!_\nüÌEÌÓ:çx]ÕşÊ1¶/¯g¡Áb¯Ê…¹IbV¥Ëqaj.[‹..[..[([‹.[ÔXZ .i]¶&öøN”ÿ\0ÛFëcMí¢\Zö{|&Jï!_3[[ı½şRÊ½áçü$øğØ¹Xˆ?zTÅ\ZóM5ú˜‘6	ò%Î”ëÈTp¾)ª£ÌV;ç³Íf;„«¬Ì2xyŠ»»»¿Ùp´–Ît÷k{1_‹;ÁËÿ\0$ÄÅYÊis÷ä÷ù×Š;†Çå‹ÃáñxY˜\\L¨fÉ›†8\"UM?YÌnëîÃ³%3,ÆåqÅïÈ˜§@«¾•\Z^M|NÆGVA‘â¶k¤f¸~üìšlN\\èÕÜ¨\"t¤|“£®çOvšiª«®(í°…ƒ pà\0\0õ¼zŞ,*€nÜ\0[Å…P,-À­ãÖñaT\0p\0…¸\0õ¼!nÀ¢íËßÏ0Tëìpî7ÉÅ_¤(íÛp:w>Éó\r±íDÅ&f\"%îKP$šOÅÕ6’ãà®_¶Îe;?mŸCŸpx&£‰µhãß<ïwÉSÄîï[ÎC•`ò\\®V_‚—İ•-]½ñ·¾&ü[ÿ\0¦äs­À&±´1»U‹X›ÌqmÑËÃFáuşfš_8Üî^Ús%†Ù¹Y|.“1“WyWù £éÓV\"X_»ÑÂ×gYkâæ¿÷±›}ÍO²{½e\\Ô×şö3l±îtŸÛÓåf•»¥ÅËaca‰r\\¶(7-Ê\0—),âå\0K‹”–r\\ú\"sôÃDàÄÊ‹„iôgÀ\\xz»\'A¡óM.h¶5Şet\Z¨µ\0	T\0¤\0EE@Ñ¶‹şúÄÿ\0‰~ˆÇPÈm\nÿ\0ë8Ÿñ/Ñ\ns/ÏG‹ıºü’‚…§1BY¥NbœÀ”-9ŠsPP´æ)Ì	ABÓ˜§0%ANbœÀ”%§1ã¼ÍK¶(kÙŞgÉÊï`6çæj½­CŞìó6[é¤ÈÈ×Õÿ\0±”ı™W»ÎT7®Çs¸rüö,·\ZR1É(jì¦­İSkÎ†‹©`Š(#†8\"Š¡i¦\ZksLğÍ¨§w§Á©öwµrvƒ.‡ˆ™9ŒˆR›·´Jİô¹ø¯É£l%|NäP¨ápÄ”P´ÓMU5ÀAC*aJ‰%D’Ü‘@H\0\0\0\0)\0\0@\0¤\0\n@\0\0\0€€¤`>dÊ•*©pË†­¨aI*·Vè¹Ÿ@€\r¯hªmt¼¿3&Ëæ§vtP¿àÀÕÕxµÑ:ğ™Ù¢v“¬óiçL“{‡^ÆCNÍ&ëómºğ¡¬ĞKÑİ”CNÏ²•ÿ\0ëõ&m5ÎÌ¡îìP·a^­¿™²S™î´İ0Óåf­»¥ANbœËØ¥qNbœÀ\\”-9ŠsBP´æ)ÌÉBÓ˜§0%NbœÀ\\ˆ´æ)Ì	ABÓ˜ !ÖLŒ+ô?JŸœàKÿ\0\nıºšï5=Ê–¤¨¨BÔ y¼‰Ôu×‘+Èu@Ñö’«;Ä*x§şÊ1×2»U\r3™¯ú¡…üùª×³Ğàñ×åÅÅ‰Z\\\\XPÉRĞPÉRØPÉRØXÉRĞPÅÅ…\0\\Ö»O…Å°Y¼4İ%>‘\'ò6ZÑ`ïl6r¸a#}~E:ˆß\r¾Söe^ï3ÔTXQ\r´ıp¸‰ø\\D¼F\ZlrfÀëp6š|SFë€íC?‘‡RçÈÁâ¢JŠdP8b~ti=4[DÌvwşÀgó6‡ ‡ˆ†\\8˜&E.t0&’iÕQ6İ(×a¹ÓıŠf«ÏË&EIx¹}èÏ]¼Ó}Ü®¬ïÅÀ‹‹¢À..,,âàXÅÀ°‹ ÅÅ€‹¢À..,\0\\\\XXÅÅ€˜\r¼ÏâÙÜ…ãeA.dø¦C.TÖ·WZ4÷\'­ıŸí¯5Xœï•ËŠ°a%÷¦$ÿ\0*:?$—VÚv‡7í/h1¸w#°ø£L-Ç£mÓÍ*ó4¸ãdqGQEM·um½í¿J!bÌÌ÷**,,@ôÇg¸6\'†ŸúHU_™Ÿ¹†Øx;»’­ßä2_X34=îÛ~PÔéRÜXQq-AqqA@^Bâ‚€+È\\PPy¥  \nòqVÅ©0÷çA’øØĞ.ì\nHú©:¦»Ì­EIÔuP:€\Z!¢¢\Z!qp5²…¬Î’´R—Tßı%øÚÁïáf/oÊ~¬×)Ìº½í$ï†¥ÅÅ9Š6âå§1K.[ğæ)ÌÅø\nsæü	rÓ˜Ô	~¿NbœÀ—àZo¸ñŞæn`qìft©ÿ\0¡œú@ßÈÌ¿3µp÷ö_6ƒ{9u•åñÚ=%1İå­ƒQ©à[k¡4\Z@åe˜ÉÙ~c‡Çaİ&H˜¦C}í:Ñò{Ge¸¹Y†‘zTùjd/“U£æyŸS¶ûÎÔü¾~I::ÌÃ72Jnîî—“uÿ\0H˜gIë³±t\Z\0JÒâ€ì.„£à5‚€Ô°Qğ\Z\rAq \04\Z\n‚v\rƒP@\\h5ì\Z\r €¸¸Ô°ü3\\¬~7vT‰ndoÆ‰V‹™çÓ;0Ì±8éî³\'Ìs\"åWZ.Kv‡höÕıŸ-‘’I“1-Lœ“İvOÍªÿ\0¢Î¤ÔÆU^|¡5\ZÀĞºQ¨¤ÙH-”Áı8+¤ÉÜáäpw2L»¸ik¤(æS™ïñÆÔˆjI~¡iÌS™š‹ğæ)ÌÅø\ns~âœÆ /À\\S˜§0à)ÌS˜ğ\Z€¿‘•ÀãÌ°ĞÒÎl5òª8ô2;9Ã¯‰ôl‰ìÃ,íIŸFó~_‚(yÃD/Á‹€¿À\n–à\0©*Pl¥¸²és¼Ñ§ó¡©TŞvŠWµÉñ¥xaïôi¿‚4zÓ³³ ¶ø¶øJTT´3n¥EKa@%Kqa`%EKA`%EKNbÀJŠŸD ¢¥°¥À•8¹Ô<Ÿ/ú°óXYË±ùâ`ö˜i²ÿ\0ªº¢-ÄÂaäÛŠò>|Û.+ÈE|Àµädvk6’ç˜\\ÊRoÙGïÂ¿h–©½hcª*¦°˜™8¼,¬V52TØpD·4ÕS?Zò:Ó±¡S$G³ø©ü´æa›{áß:;®Mğ;.ÆKâw‚¼…E…‚Jòä,,¼…y\0¯!qa`ä+ÈX\0¯!^BÂÀ+ÈW°°\nòä,,¼…y\0¯#óÅâ%a0³q3ãRåJÇ2\'¹$ªÙúXë^Ùö…JÃÁ³øXıù©LÄ´÷C¾uw|’â%;C¯6Ÿ6ç˜¬ÊjiMÜ‡ú V…h’Ö¦6¼‰RÔÅA^B¼…IP-yŠŸRaö“`ƒÆ&—VHõ~LºS».Ñ#ô©UBÇĞb6j%EKa`„©n,,¨©h,ä©h(¨©h,ä©ôK\0¹*Z*g6:gÆ­·Õ´¾¦†Ï±Ré+:›âP§åš1·f¾®Ü¸lØîK–âå.\n\\·Uğ¸Ph5 Ğj*Äéjd¨åEº4á~Mu.âª8[MsV;#SFÚ).Fo=-Ñ¾úÖïãRÌn·µj±Ô-ø‹ñ,uR‚…Ô_ˆ‚…¿~ J\nQ¨‚…§1N`Jo-ø‹ñPx–œÅø((]EøäÌT·/6]?v6º6Îœn}²Ï1ò÷w13!§”M-OŸÚ6´Ãl§!NCQ©ŠJrä5\ZÈË±˜Œ:F7—>Lj8\"^\rqâæ¸…Ù|çŸdÒ3=Rd«‚5½?—Óñ<å©´öu´ÑlöoİŸO‰jğïî?Òâ¼xªò&Vvw¾ƒBK’á™.8b‚$šŠTÓºiø¢’¸Ğh*\0h4æ\0h4æ\0h4æ\0h4¼Àh4\Z€\Z\ry€\Z\rÏ˜ã†\"™JaM¸›¢Iomğ´ùÆ\"É§æ8Š>â¤¸+Gor^~<oÀóÎc‹ÄfùØÜTndùÑ¸ã‰ñ~‚[’à‡´}§‹hsäˆ¢X3pÉ[»ïÆ6¹øpTâÍ[R%M§rœ…£R”ä(5\Z€¡ÊÉåûLß.Ÿ½>Ö$.¦Odàö»S”ÊßßÇI]cHÏox„KÔt-ø‹ñ=ûQ((/Ä·â¡høüK~ JâüEø€¡([ñ%ønJüI~ [’…¿~!&„I–üF¡Í×f$û,Sj6ãêíğHÒá†(ãPCvÚK›gba¥)8yr¡v‚\nÑPÂıœş#}«ø¿J\n\nJœ“AA¨Ô\0Ô\0Ğº£¨Bè: 45}´‘I’1)oNü®¿VmLnÑaşÑ”ÎIV(´ZoøTšÎÒ¿M~L±-\Z¥¨ §2÷}*ZòæÅ9*øâœÙuW¯!¨§6«àZò))ÌÅy\nsT¯Èu^B¼…¨]Û9~Ëkó™t¢XééywİN†ÁÚ<¿g·YÄ4¥qQEÖÿ\03_±à³ÆÙm³÷mÇc@,R¤¦€¤°\r‚Å²û&Úõ%ËÈ39”–İ0“b{›şFø?œ)Ú‡—Ó£ªm5âv÷f[m>	y6o6˜¸R†DèŸñW‚oú¹øùï˜YKy;°ÂÀ\0°°\0,,\0\0ÂÀ.…€WÚÎ×©®<ƒ,›X¦.l/{ş„øqéÄÉö›¶ĞåğLÉ²™µÆD»³§Bÿ\0‚ôŸõ~{º…ïm¶ÛâD«µ¼h,,B°\0\0XXœØ	~ÓmòhiZc%EÒ$şFÆÍÙd¿i·ùD;é5ÅÒşEÚxß5#Ö>èÏH×¯!NbœÏxÔJŠ–œÅ9*ø¼…¨¼…y\n	^B¼‹©(¼…yRS˜\nò%_è”^B¼ŠJs!³²=¾o%5îÀûïK¯\rëC[Ø¼= Ÿ‰‹Å©péwò6JŞz¸ºëóeÛàh41iš\rQ@\Z@ ¡n. ¡n.¡\ZN\Z;¦®}\\\\½Ìpï!«AJ¾+z}(qïÀØvÏ\nÔÙX¸Wï.ä^jëá^†»Bøáèpdñ1Å—A §1rVš\r9‹ÔƒAqp\Zğ Ğ\\\\ƒAAp\Zä..œû[—ì»CÍa¥œRâë.ó5]>&íÛl¿g·Øˆ¿ÎI•û4ù\ZE\r¬µùÏİµ^Ë Ğ€Ödº\r>$è‘ -À°·M6šuM:4È(möi·1ãã—“fñ7‰îµ\'ßï¤«H¹Ñoññ½ßbÑp<ã²Ó\\¢ÀF+:kæéó;·.ÌæaÒ—6³%+.+Ëèeº›Ì6*r&‡ç\"|©ğ(åF¢\\·¯5à~„ìÉh¸@œ‰ \0Zr&ƒP§\"hÎ|ùr qÍB¹ï~\\IØ~´\\¹í+nbËã™“e5Š¢S±	ÿ\0\r5ZCÎ‡…÷l¹i2}eÊ¬¹nÏ‹óú´3Ş\'<ÆÎ­TS¢IòN‹à‘/;C…QEŠ&ÜMÕ¶êÛâ4 ¡Š¥õ¼iñ  @J\0.Ÿ¡<\0¾·›‡cRı§hy{§îC6/÷q/™§ïa2ûûrâÿ\07„™Æó6´Q¾¢Ÿ8cnÎù¿è)ÌS™î\Z¦ƒAqpà/ÀS˜§0à/ÀS˜§0à4~üÅÀ?!~âœÀ_€£à.sò+Åf’ ‰{>ü^KêèµÑí¬Ú|›vQ†û.[\"KT‰CX¼İßÄæP\\·5ŞrÖ›LÌ¥Ëp„ ¡n. |@\nŠ—Q¨¢¥Ôš€°©u\ZÂÍ°«—Í©Şj°¾\rn4\'TÚj:4ÎÊÔÒ¶ŸölÊ)ªKïªqñ]o©e\'ÉÒáùv™¤±5-y\n\n:‰R×§1@ä+ÈPS˜\nò%KA@%EKNbœÀW¯!Nb—TT´£;}•ÜÛ,Ô­3ÕG\Zı(uİNÓı¡¤÷s<§Oß“2\nù4ÿ\0æ:°ñ|J»j®Ù§»EF ÑfTT@j¢¨x€99\\]ÌÓ	³S w-QÓuó2ã6ÕÑ©Wbìû“:d˜Ôr£Š—Š2¸Lët8™uşô?4aõ\Z™,˜mr1xyé{9°Äß…hú3ö¯#NÔı¥bñ2’PO.mt#dlÚëÈW‘­,Ï\Z•=½|á_@óLsTöô\\¡_B66lµä~3ñXy)ûIÂ×…jú+šÔÜV&b¤x‰p«K¡øêO)³3‹ÎU8itşô_$bgN™:7ØâŠ\'âÏF¤§d%D÷$ßC¤£‰Å‰İ¶Û|ÎéÆ7öIí;û8¿Ft©•eò**‚¢¼…P\0**\0\nŠ€§e~ÏÒ»ÛKŸOÜÁ¸:ÇùjvÏìï&³s™ín†L)ù¸Ûı¿Ã+Íª¤ŞÌoî»v¥¯!NbœÏfÕJòE¯!Nb€J–¼…9Š\0©*ZsTT´RT´RT´æ)Ìy^Èa=–,TpÒ)Î‹ü+êëÑ\ZÖ+.D½J¼‹ÑU\"\\dÁ*H`J¹#ÏMœş!—jÅ#Í÷abê5*rRÂÅÔj°±u\Z=nÔ€t£@èF:€C´/¶åÑÃ¬Ù~ü]7­Q’&\'fT´ÒÑhòu®ŒºM¤Á}“0q@©.mb‡‚~+¯êŒ]Ëâwz,w‹Ö-i£\Z2Ğ\\2MthÆŒ·¡4e¸¸\r‚‚àMt«?hi=ì·)ÄS÷\'L‚¿âIÿ\0ÊtÙß=»áÜí‰†jUr1pFßÔPş±#¡®y1]µ3?Ù±İ(4-És–°âà9‹€\Z——’ÁßÎpPS÷±.±#¹:I²’Üİ£ÀC¾“”]/ò;oS:®ÅÙ(^¢âæKRcF[‹)æ)æ[‹€êBÜ\\^¢âà|Nƒ¿*88Â×Tt›ògwø1™Jr3L†©ìæÇ\r<›F6S—ÉÇ §!r˜*@R\\9‹€§! ¹@‡u~Ï’;¹cˆ§ïâ”ÿ\0	ÿ\0Ìt±ßİˆaœ‚•2”öø‰³<èû¿ò^\r]õ;ü\"Uä÷[¾ŒhËqsÖµÓF4e¸¸F4e¸¸F^¢âà4&Œ·hÆŒ·hÆŒ·?\\f+.D¿ŞÒ¼‹Ñ\\1¼¶\rÁRñ±­õ†\nğñ.¦É£?<4˜0ò “-R?R‰åç³eœ·›&Œh:\n¨ĞuhÆŒt\0h@¢¢…§0%…J(°©h(°±hN€p3¼Ç`b”’ï¯z[à×ª\Z4IÃ†$ÓN5tÎÈ¡ªmf_ì§}¶T>äoßKÂ.:ş¾e”Ÿ\'GAŸ–|9óìÀØXPP±Õ,,)ÌP……\0XXPS˜\ns;ÀXXPj·ÚníÛ›IPÕÃ!ÍKü\rGÿ\0)æÊò=m*8CP´ÓMU4÷¦ÜÙGáXËAô9Zş:«ÅâÛm)~XÙåjòäz§îl£ğ¬å ú¹²Â°–ƒèhÿ\0B¿ùıø°òµy\nò=S÷6QøVòĞ}~röG&‘í³Yy>ª½¬¸!qy*Uù$É’gh·Ñš#¬¼Í^HW‘ÛùÏi½`ÜP`rhs–è¥à ‚¬i?ƒ5\\Ãµ¼<m¬Ådò—ƒ”Ï‚†ÔÛ§á=UûOëÿ\0ë^Úü5óiUä+ÈÎb;OÎf6àÉözBÑ—§N­œgÚ.Z¬>N—–ÊúGàİTşxú«ş©‹á.fÀKö›O\"*UK‚8ŸF¾ghW‘×Û¶ØüÓ=•—æ2rùpM†%R0J‹¾•Rm%f“TãC°oÄáñ.“‡fğ²Nı7t´yëŸ5R¨UüEÎ{l¯\"Uâü@•E¿~ *¸¨·â.ªE¿~ JU¶²>Ï´¸Ä¡¢©‰ñªMüjvµø¶»mÊsÙ˜¾F]2	PCí\"Ÿ„‚d]öªÒmU$š·\Z›ü;†äâ9¼s´í»SY¸iÍf¡^B¼ŒÔ®Ó3¨\ZqeYŞQeğ¯Ñ£%ƒífl\r}¯dv~rñöR¶ú÷äşÕGç‡:8juä+Èìì³µšÒÌvF+vnL©SRóª…ÓCsÈ¶—³œéÃvQØ¬¥OÃÃ*6ø%U~U5²~Ôã÷§èºšÌWí/?W¯#Õ&Éİ\ZÊğ\r?‡ƒè_¹²Â°–ƒèkÿ\0B¿ùıx°òµy\n©û›(ü+ùh>ƒîl£ğ¬å úèWÿ\0?¡âÃÊÕäzk³ìØ6+(Ã¸iÃC\\^ó][9ÿ\0se…`?-ĞæÃ\n…$’I*$•Fşƒ‡N–ói¶û°½ù–ÂÂœÅ¢²ÂÂ‚œÀXXj)Ì…ŠKñab‘y€°°ÔP§d°ÊKÆÌ‡ß˜©-5º:ş‹™„Ép/†[¯³‡Şğ\\<Şãz‚`CJ¨‘…çÉÎ×çÚ<8óî¶))Ì©Ê,,^„èÂÅÔP	bÔjN€*u\0N£¨¸Ôu\0QÔ€ê:ĞSóÄÉƒ\"93aïA\Zi£ô¸n°ëìË	‰‰º:Ã7¯qú›¶—,~°$§K«ş«SJ‰8bi¦štiª4Ë«;Ã½¥Ï©¿šuIqs&ÂõEÉp>‰Ô—õIqp/QÔ”-ÀuOË‰Ãá0Ó18¹ò¤H”œS&L‰C)om»$tÎßöí‚Á9˜-“ÃÃª2rjJİ†Î/7Eæ‹°éòf©\nòf¦(ŞÒî\\n+ÃG‰Æb$á¤@«Ù±¨ …qm´‘×{CÛFÈåÑÅ#,xŒæz·ù<=Ùió**sIvÎ³Ìÿ\0jñŸkÏ3LN)&Ü0Å ‡”*%¢?8 †0B’^ìaá4¹\'“Ÿ“_iéHÙÙ{KÛÓfr¢‘—J‘”JŠµŠSqÌ§ûI/4“æuŞ/ˆÅÏ‹‹ÄNÄNÖ)“cqÄß6êÙù\\*<X1â©4¯–÷í%ÅËXõÂO™„ÅÊÅH‰Ã6Tj8QßYc#6Ê°ù„‡îÍ…7\ro[š~N¨è›_g{M÷&9áqq5Ä5Şæ¢Ü¢òğz?Î~$áS­Á1Æ÷§Ö<ãöş].«Œ9mÚ]ÅNLS“$(àQÃŠ“M:¦¼\Ze¹óÏR…ê.J/QNL—N@T\\NLh.Hâ†qÅ0¤ÜMº$–öØî8yæc#)Ê§ãñİ•iV\'¹%Íº#¡1Ø™¸¼\\ì\\÷Ş›67o‹n¬Ù»DÚo¾ñ«	„‰ı†C}×»ÚÅ¹Ååàµ~6Õ.}?ğß\n	É’=»ı#Ê?áå¸®3äå¯h((..zG4  ¸¸\\³iv‡,‚yvy™aeÃº	xˆ”ı\ZÓàl¹_l;w–µö‰ø<ÚRß\"B†4¹8;·æÓò4[‹”äÓâÉïV×-ëÚ]ç³}¾dÈ¡•å¸¬®c´S%¿m-stJ%ä“;C!Ï²lûöœ›3Ãc¥*UÉ˜›‡“[ÓäÒg18h\'¦ÒîÇıKÇÌâ`ñyQ‡‚ÅOÁâ`¼3dÌpD¼š£¡¡›…c·¹;}[Xõ÷¯½½ÑÔu<é°}»fx8¥á6¯\r÷†Q}ªJPÎ…qpÙE¥™ß9ŸeG—C˜d¸ù8¹ÍÀïáw…òi3ŸK“ûQÓâèâÔS/»,ŸQÔ—5×/RX\\\\ÔhÉrÜQÔ\\\\P…Ép.…‚£A.(¢i%K¶ÉseÙL±¥öùĞİÚR|<_Ğ‰¡Vl±ŠœÒÊd¸p%-ŞdWóáäd:‹…;¸´ŞÓi:¢¯èGQĞ\\QÔ€: tÔ\n¾@y\nò-€•ä+È¶W¯\"ØX˜¯\"ØX	^B¼‹a`%y\ZÖÔåu®:D7_Å…~¿^¼Mš„i5F•òbv[‡-±[šmac/´YSÁNöòaoÜ¿‘ğòàb)Ìº\'w{Jä¬Z¥…WABY–aUQEÄPko¶×$ØÌ³íy¤îôèÓR0°4æNk‚ğKÅ»/:\'í_´»b2µU\'5Ÿû6ºwã¥Ô)êÚ¢ñkÊ[Ef{A›NÍ3|TxœT×W[’ğInIx%c£¢ĞNjİ+÷iêuq‹Ù¯v{´>Ğsí´Å·œä`aŠ²pR›Rààßõ>oV5œÛÅŞj’Ö÷Ç‘ùI–æÍPCâ÷ğFfTµ.6HôXñÖ‘ËXÚ{Zo;ÚU(aJ’JÉ#èšLÂÅ&£P·‹\rE\0[Ó)5oL[ÓoØ³Ÿ“¨p8õ#ZBÓ¬r¼¸®]8>ÕË±ø,Ç\'ˆ‚|¨·EÜø5½>Nçõ9YnaËq\n~73ÅÀèšàÖæ¹3ÌñoÃXu–œ¸§–ÿ\0Iı¾n“‰ßrß¬}^ƒ°±ÕùOi8ÙIA™`ebR³SîEæÕÓ~T6<\'h;;=/k\'üTÉM¥ş­O¨ü?Ä0O\\s1é×ùú;XøŸ\'æÛçÑ¶ØXÀÁ¶5\Z¬9´•ş(b_ªí†ÌÀªói/ü0Äÿ\0Dhÿ\0NÖo·…oşgö_ş§ùÇêÏXXÔq}¡lô”ı”XœKğPJi?õš5ÜÛ´œtån\nV;(æ>ü^iY-joiÿ\0qóÓÑëÓùú(ÉÄtøÿ\06ÿ\0.®ÆÌ±ø,·\'ˆ‚D¥üÑ=ï‚[ÛäªÛ]´Ÿœ¨ğXZ:ºG7Ï‚å×‚Öó~72Ä9øìTÜDÇ¹ÆëEÁ-ÉrGSÙğŸÃXtVŒ¹gšÿ\0Hù|~n.¯‰ß4rS¤}KzcQCÓ9…½1oLPP9üE½1A@ôÊMF =o?,L˜\'Áİ‰Qÿ\0+àÏ×Q@0se¹q¸\"Tkâd¶gh3}›ÌàÌrltÌ,õgİu†5Â$ì×\'úŸXÜ:*°¯}nçÈÄµFcjÄÆÒˆ™‰Ş¬ì§µ\\¯káƒ/ÇÃ//Î’ş‹û9ôŞå·ããİw^\rÑµØÖ<*8åM†d¸â—2¢†([M4êšksG£;í]gNNÎí,èaÌh Ãb¢i,Obá3ƒñóßÁÖğşOooƒ«¥Ösû7îîZ®±iÌS™Ét\n®‚€*¸\n®‚€,*¸¬³3‰R¥Ùo*Z;\"ÖŠÆòålşXñøüÈZÃËu‰ñ|Ìİ!…C\nP¤’İMÉ–+‡‚D•H T\\OŞÅ6åÂÔçœÖßÉ+ÈW‘l,b×JòäZ+ÈW‘l,¯!^E°°¼‹^BÂ€J‚ĞË^C@%ÁkÈWA^@D.Zòä¯!^@Ar×¯ ?)Òà*)S!QA£OsF•e“2üE«˜ß¹Éó7ªò?^V*DRg@¢‚%te[lØÓj\'\r½yNcS››åÓ²üGv*Å*\'îGà×ÌàÔ¹İ­¢Ñ¼v]F¤+©«ö—¶XŠÙÙ™\'»7`ÂaëG6:|Şß‚æÒyüÏ…ËrìFaœ6[™68¡…*·ÏËÄñßi{aŒÛ=§šOqA†‚²ğ’´©IÙy½íñ|7´:_ûÏhÿ\0»5µZ½;Ë´9ÆaŸføŒÛ4ÄE?>.ôq=Ë‚KÁ%d–äŒ}O¹9³aVîü—‰é¢\"#hpæfgyd2É=ÙNk^ô[¹#™FD”)(U²E©’J1F**ÀQŠ1V.ŒQŠŠ€£b¢¬£b¬£b¬£`(Å«F(ÅX«F(ÅX«F(ÅE@QŠ1QVŒQŠ±VŒQŠŠ°bŒTTŒÌä÷&©°ªCşLÉÔüñ2ı´˜ {Úªäü¡„§3êœ¨¡Š(bM4Ó£OÁ£åÙÑÙ¡Rôï`İ¤ÚlÈs©ëïŒ4ºË™¾*Z[ùÆ¼x«ñ§kêxS+ÇâòÌÇ˜`gÅ#‡˜¦J™ºiÛÏšñG°û2Úì.Ùì´ŒÒWv^&ìñrSşÔ•iÉï\\ŸÏ=Ät~ø”í?GcG©ñ#’İá´j5%ËÔå·Šs\Zıp²\'bgÃ&L(âvåÍòÌDo/¬\Zn/‰)Åè—‹|Û+ÀÊÀa”™w‰Ş8š¼O‰ó“åÒ²ì?u{Ó\"¼qñC!¡U­»‹ªÔÎYå¯d¸¹j+ÈÁ¦—.ƒ@%ÁkÈWâåĞh¸¹kÈW¼†€K‚×Tµ%9ŠjJŠsÔT”-\0\"TS˜§0æ¢¢‚€**)ÌPÃ‡“Š‘™Ğ( ‹ÕWi™Æ[;/ïV)1?r4¾ƒ7ªœù2çÊŠTØTpD¨Ó2­¶léõ6Ã>º¨±”Î²y˜œÙu™‡nÏÆOêj›ea¶kf1ùŞ*,§0·NünĞB¼ÛKRúÇ<ÄCµ\\´µyâz:_öÛ7ù{€›îAİp½ï|ß’¤MqpğgEXäæ¸ìNg™bslÇ7‰›Ù±¿›mùoÜq¬zİ>Ã)l³–ói,s²©u)­Y*-N\rŒ¾_s\r®êß®…êáÈõ¼zŞ(:“Öñëxè:\0õ¼!B=o·ƒ [Ç­ã èÖñëxè(Öñëx  [Ç­ã èÖñëx èÖñëxè:\0õ¼zŞ:\n\0õ¼zŞ(:\0õ¼zŞ:€=o·ƒ \nŠ„(Öñëxè:\0õ¼zŞ:€bs	jKiZ+¯™Çª29¬ºÊ†>É˜êÆRÆóØ¶ÙE²_*f\"k‡,Æµ\'vI¿v?8[¯“kÄÑ¬[dÇ\\•šÛ´²¥æ–‹G“ŞI¦”P´ÓUMnhú:ÏöxÚ·´;_Š™ßÇeT‘n®)TşÎ\'¢pÿ\0£_µrìütå.J²ıèŞèW?¡äscœWšÛÉè+–¶§>ı\r;>2aqDú%Å¿n™N[\'/“HiØ—¿W|—}e˜		ÎR«wŠ6¯9´5­mÜNªrÏ-{-B%\ZkPÉA@-EIA@-EIA@-EIA@-EIA@-IA@-A(\0\\·%ÅÀº’ââà.[’âàUR\\\\\\ÅÅÅÀ\\\\\\\\ÅÅÅÀ·\Z’âàH¡QÂá‰\'³Os<ûfg8|.g—l–_1¨{ŸmÅÀ¡m¸eÃ_%iñ…ğ=_6d2¥Å2dJ MÅtI+·^ó«´ı¥™µÛœíqDàÅâbrSŞ¥/vZÒ\nó:¼#>nyí«{V&\"{µ *Z¡ˆªÚJõ±‚ìÂ·$‘†Â®ö&Zşòfj¤ÂaIF** •’‚¢ ((ÅE@_˜£æ**˜£‚TT1QPb˜¨¨\n1ÔTTùŠ\nŠIGÌTT1GÌTT1F**‚‚¢ (ùŠ>b¢ (Å1QP?,\\ü4ÅıÚô¹…3ÍÕ4üLiÃP½é´D¢_ µvìÿ\0´d=¦å°â§¹XÆ5ƒÄµ¹(ÚPÄëeH»­¿SŞØL4œ,•&D\nVşgó%7QBÚiÕ4îèocÛOÿ\0kû5É3Øãïâ\'a”—ãí ¬¾UŠ×&?Æ°í5Ë)eÏn^]ú7‹’âç	‰rÜ—qqqp-Éqqpqqqp-Éqqp-ÅÉqpàQRPPQRPPQRPPQRPPQRPPQRPPQRPPQRPP¼ı¢öìßcùî*T}Éø™+&ô}é¯¸éÍBâz©ê_Û“:îeÛ;³’ã´Ù³q³¡áİJ½ù-t=OÅÉ§æøÈTTt äeÊ¸¸_ßÀËTÆeJ¸ˆŸ_êŒŸBa0TTtJŠƒ \nŠƒ \nŠƒ \nŠƒ \nŠƒ \nŠƒ \nŠƒ \nŠƒ \nŠƒ \nŠƒ \nŠƒ \nŠƒ \nŠƒ \nŠƒ \nƒ \nŠƒ \n˜lbPâ¦.uës3ĞÄæKü®\'Å\'ğ‰qê*J¡*z«öÚ;\'Ï¶blÊ¼4è1’!nıØ×r4¹\'/Î&yU­û(gO\'íŸ-•}ÙY”©¸)»ëz¬p@µ4¸†/Ohøuı¹ê*J\n<ZŠ’‚€ZŠ’‚€ZŠ’‚€ZŠ’‚€ZŠ’‚€ZŠ’‚€ZŠ’‚€Z‚P\0  ¨¨\n\n\nŠhJ\nŠ€HPTTE@PPTTE@PPTT~×ù³Ì{fÅaU‡-ÁÈÃ*;&Óšõ¬ÊhtíÍ¯µüÉæİ©m>>½ècÌçÃã1¸aø$j•=¶šœ˜k_Hä¸©j^9¹JşÖ7ËædncòŸß™äŒ…I„•°«	/QQQP‚¢â¢ .***¬TTTEEE@TTTTEX¨¨\n±QQPb¬TTX¨¨¨\nŠŠŠ€¨«’¬TT\nKŠŠ„•*ÅX¨¨Åf–Ä§Æú³)Sšÿ\0ıß›K‰qrTT„-ÌÉfqä›S•g0V¸l¬JãîF¢§ÀÅÔT‹DZ6‘ı;‚(c…GQBÒi§½?î†±Ùfbó~Ívo1Š.ôsòÌ<S÷Ô´¢ø¦lÕ<-«Ëi¬ùB¢¦!BĞ•Ğ”Ğ”ĞP•BĞ•BĞ•Ğ A   \r‚‚€(4 ĞP”Ğh((A   \r„¡h‡áŒŸ	;3÷%AÈ¼’mş‡ïC]í/ö.Î¶—œ§1>jTM|I¬sZ :1S¦bq3±s&Æã‰ñm¶ş,üèJ\ns=ÜÔ‚œÉü§÷ãòFDÆå?År¯ÄÈèL&”	RXh(ÂÂ‚€*,((¥%\0¤¨  ‚€RXPP……\0¤°  ”‚PP!IaA@•  B’Â‚*	A@(%\0XÆæßÇ‡ü?3%Cšÿ\0Âú±(—‚‚œÉNd!@  ìı–1¿mì;\"ïEXä9ò\"¾îìèèº4v‡G~Å˜¯oÙ&&Kux|Út	pN	Q~±3¼hx½eyuY\n\r\r`ĞPPP‚‚€((((‚‚‚€4\Z\n\n\0    \r\0 PPµ%@PPµPPµPPµPPµPPµPPµS™¤vó9ÈìsjãN•ËfAş²îüÍâ§]şÒ1÷;Úx—şÚÖlæ[§òÒ=cî<ABÔ•=ÀPPTTfTéˆ‰q…ş¨Êœ²*b’âš2µ&}¢¡*|–¢ PJŠ¢TTQP!ôJŠA**¨¨ù-E@ •‚TT\n|–¢ PJŠ¢TT\n	QP)òZŠA**1Y£ÿ\0*\\¡FR¦\'1uÅÅÉ%ğ‰q¨)ÌTµ!‘z¥¨¶ı‡\'8¶+?ÃÖĞf0Çş´¤¿å=\rCÍ¿°¬uÉv¦_Nõ†?¡é:?ˆÆÚ›ÿ\0ß!((ZŠšBPPµPPµPPµPPµPPµPPµP 	QbĞP	abĞP	abĞP	aT‹A@ ±h(-\0–-\0–:ßö›iv´Íºe)¿–vM­ı«&{>ÂvV8°Ğ¯ÌÊ\"ı,oŸ8û\nX–-l%\0ä`Z‡-ókàeìa$>ìùqp‰?‰›±0˜,,,,XXXX………€XXXX………\0h,(,Å%€XXXX………\0XXXX………€XXPX……€XXXX………€XXXX………€XÃcZx©ÍŒïzlqq‰¿‰‰|ĞX”[\n\nê_ØQ¯»ö±x©¸Ki4ô½/şÂ3)7kä×|88Özª=By\'ùVÿ\0´	`š-\r,E  ÂÅ  ÂÅXX´XX´\0K‚€K€q\0Ş\0À\0p^\0\0A\0\"ğ\0(\0Fu7ímÿ\0ù·ÿ\0èÃıa\0ØÑÿ\0qOœ=Äâí@\0Ô?¼¼ÌàÂ`+ğ\0$à@\0¨ \0 \0\'‹\0\0Ç‚\0\nO¨\0ğ\0\'‚\0\n÷è8\0\'€\0Rx\0Ä0\0¤ú€nAîÔ\0€x\0\0}ˆJ$à@n =)û\nŞ»Sÿ\0Á†ÿ\0Šaê•¸ÉqOî­ÿ\0d¢Ü_xÀ à÷€{€\0O©|@\0÷\0\0ŸRğ\0\0ÿÙ'),('123','Tarjeta de Identidad','KENER','ROMERO','123','kener@gmail.com','93b16f06785d1f7773d056c1b7501f39abf371f1','calle 42#31-69','ADMIN','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0H\0\0H\0\0\0½vğd\0\0\0sBITÛáOà\0\0\0_zTXtRaw profile type APP1\0\0™ãJOÍK-ÊLV((ÊOËÌIåR\0c.KK£D04006’F@¶9T(Ñ\0˜˜›¥¡¹Y²™)ˆÏ\0Oºh-ØŒ\0\0ÁIDATxœíİYl÷áğco{×»Æ8>ƒÀ^;Å1„4€Rq…@\nF…ÚF•šFJß*µ}*}hUU%EEUb\"DIâQĞ8Ø`csClŸk{×ö3»3ó5â<cïbÏîşüı<f~ÿlí—ß1¿ƒÚ»w¯\0ÈB\'»\00ól\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0b“]˜yÒCt: ?(À0ŒN§£’„ZÂlB°É!B,‹F£F£Ñf³Y­Ö¬¬,Š¢rrr~PrxxX’¤±±±`0811Áqœ^¯gYV<\0ÁNo’$	‚Àqœßï¯¬¬t¹\\eee‡Ãd2™L¦ŒŒŠ¢233ğ)¿ß/IR ˆD\"‘HÄçóİ¹sçæÍ›·nİÊÌÌ4Ã OkvZ’$)‹‰¢h4\Z,X°bÅŠeË–Y­V–eõzı”—£n³Ù¾ÿ/Ë—/Åb~¿¿µµõòåËƒƒƒÇÑ4Í²,¨½{÷&»ãt:İÒ¥K—.]ZYY™——7ã?âŞ½{W¯^½zõªN§3\Z3ş#`V¡ÅN’$E£QŸÏ÷òË/?ÿüóö±gJ^^^^^^mmíĞĞPccãgŸ}æp8ôz=Zït;=ğ<o2™ªªª6oŞüä“OjüÓûúú>ıôÓH$b04şé\0¦¦¦&Ùu\05’$…B¡§Ÿ~úõ×_ß¸qcVV–öuÈÊÊZ¾|yyyùÄÄD?šîÔ‡®xê’ûŞÇíİ»·¶¶Öjµ&·>EEE---4\Zˆw*C‹¢äyï¥K—şîw¿s¹\\)Ò6,X½zõƒîİ»GÓ4²š0ÆNE¢(F£Ñ;w®^½:±éh4êõzı~8–›ıïÉ­ÙlÎÌÌt:Óy=ö(ãÎ;÷ŸÿüG¯×Ó4&§tÅSN4\Z¥iúÍ7ß¬­­÷³^¯·³³³««kxxx||<ÈÁD\"ß—1™Lr°322ìv{NNÎÂ…+++NçôÑh\\·nÓéü×¿şFû×fZìÔÂó|iiéÏşó¢¢¢i~$‰x½Ş›7o<yòÎ;z½^^:öı:ğ‡;Ìòòï“‚F@YYÙÆ].—Óé4™LÓüéõõõ===)2X\0‚B8ËÎÎşÃşàp8¦S>‹utt´¶¶¶´´øı~³Ùü8‹½A‡Ã™™™µµµÏ<óLUUËN«CçóùöíÛ7::Šu,©ÁN<Ï¿ùæ›óçÏŸNùöööO?ıtppçyƒÁ0S“X’$ÉÿÃÂÂÂÍ›7»İîé|Êãñ¼óÎ;ıııh·SfÅSÏó‹/şõ¯ıèN¬Guuu9räèÑ£Á`pÆ—sS%7Ô>ŸïüùówïŞu:ÙÙÙêŸ²Z­K–,éëëóx<Ø\"–\nìä!\nıñœ2?±Xìüùóï½÷^oo¯Õj½·MEÑ4m4\ZûûûÛÛÛÍfsaa¡zb-Keeå\'Ÿ|‚yòT€`\'™ ¿ÿıïóóóÕK>xğ`ÿşıgÎœÑétšÍB³,‹ÅZ[[{{{ËËËÕÉX,–šššöövyg˜65„I!ØÉ$ÏKÿìg?«®®V/ÖÓÓ³oß>Çc2™4^BQ”^¯¿wïŞÿû_—Ëåp8T*àp8G[[fI.;™B¡Ğ/¼°yófõb×¯_ÿç?ÿÉq\\§¦ä¦ûòåË………¹¹¹*%‡‡‡»ºº0‘–DvÒD£ÑÒÒÒ·ß~[¥eE±¡¡áÀÃ$}RŠ¦éh4zæÌ½^¿hÑ\"•j»İî7nx½Ş¤×yÎÂ@(9DQ4›Í;vìPï¯655}øá‡6›-E†¬4MÛl¶?ü°©©I¥EQ;vì0›Í¢(jV7xZìäˆD\"ë×¯ñÅUÊ\\¹råı÷ß—\'¨5«Ø”(Šb¦³³3??ÿ‰\'P*–““‡oŞ¼‰Õ¦I‘Bß˜¹CE§Ó¹iÓ&•2}}}ûöíKÍéeš¦9Û·o___ŸJ±M›69N4ÚI‘r_š¹`||¼®®Îl6+ğz½ï¾û®İnOÁTËhš¶Ûíï¾û®×ëU*c6›ëêêÆÇÇµ¬ÈRô{C°X,VUU¥²T“çù“\'OöööNs©v²°,ÛÛÛ{òäIç•Ê¸İîªªªX,¦eÅ@‡`kL’$Q7nÜh±X”Ê´¶¶:u*-6TÆS§Nµ¶¶*°X,7nEQŞRšA°5%Â¢E‹***”\núúz‹Å’«;(Š²X,õõõ@@©LEEÅ¢E‹½ff‚­)ãjjjT\r>yòd8NÙ¡õ£hš‡Ã\'OT*™™év»>Â46_ 2ƒÁçŸ^éiOOOccãô9H&“©±±±§§G©ÀsÏ=\n…´¬ ØÚ‰Åbn·[it-B[[Ûøøx\Z5×2š¦ÇÇÇÛÚÚ”úÛ6›íé§ŸÆš–Òì;”ÖB¡P]]ÒÓ‘‘‘†††´˜3{”ÑhlhhQ*PWW‡F[K¶FDQÌËËSÙ>ÑÜÜ,IRZÌ™=Š¢(I’š››•\näæææååa±ŠflD£Q—Ë¥ò–ëôéÓi7º~˜Éd:}ú´ÒS‹Åâr¹¢Ñ¨–UšËlˆ¢XUU¥İ7nƒÁ4m®eEƒÁ7nLúT¾x-¶fl-H’d³ÙT®İêêêÒıÿC‚Ó\\yù™TVV–ÍfÃJm ØZw}(~411ÑÓÓCÀÖe†azzz&&&&}šŸŸŸF[¶ä`ÛíöIŸz½Şşş~2‚İßß¯´-Än·Ûív[¶DQT¹ ‰ŒŒŒ¤İëëGÑ4=22òğuB?àp8lm¤ı—)-Äb1¥~¸$I·oß& Õ2š¦oß¾­4.,,Ä2mò}Jq‚ (]y\'ÂğğpŠïĞœ>–e‡‡‡•– 9NìÑ‚­A”ºâ¢(0À–1388¨Ôßv8¶6l-‚ tÔ¾$I>Ÿ/­_t=Œ¢(ŸÏ§Ô·Z­¶6l-ğ<¯´˜T’¤ÑÑQ’‚=::ªìÜÜ\\•ãV`!Ø\ZQú®K’ä÷ûI\n¶ßïWùe5®Ïœ…`Á ‚­•Î61ïºd*¿1#Ô‡`keY¿ß?é#š¦\n\nˆY%ŠbAAÒz¿ßOØ¿b)ÁÖË²*§‹˜L&bf•$IRÙU>22‚`kÁÖÃ0Á`PéQII	1owA())QZo‰YŠ“âl-°,ëñx&}DÓô¼yóHêŠÏ›7O©+îñxĞbkÁÖÃ0J]qš¦ËËË‰9v›ã¸òòr¥`ŒŒ ÅÖ‚­š¦•ZlNg·ÛN\'ÃlI’T¶ëtº¡¡![¶hšöù|J•m6[~~>ÃlAòóóm6Û¤O#‘HºŸë–Fl-ÈÁ¾wïŞ¤OçÍ›W\\\\LF°‹‹‹çÍ›7éÓ{÷îy½^bv§8ü•µ@Ó´×ëUéWVVjYŸÙ£ò‹x<[3ø+kDÅû÷ï+Í~Ë—H§õ0[’$ùêïIŸ\n‚ ²Of‚­ƒÁĞÖÖ¦´şÌb±¬Y³&­·4ò<¿fÍ\Z¥Àµk×ƒÆµš³l0ÓÕÕ¥t‚§N§[»vmú6Úrs½víZ¥^¯·»»SâšA°µ£×ë›šš”æåå¹İî4½\'\Zºİî¼¼<¥MMMXš¢%[;F£ñØ±cJOM&Ó†\rX–M»F[’$–e7lØ ²JüØ±ciz‘hšB°µCQ”Ùl¾té’RòòòeË–¥]£F—-[V^^®TàÒ¥Kf³o°µ„`kÊd2µµµ)M†õë×¥Q£-IÒØØØúõë•&ÆDQlkkKë‹DÓ‚­)½^ßÖÖÖÑÑ¡T ¤¤dÏ=*—i¤šH$²gÏ’’¥mmmz½^ËZ‚­)Š¢8»xñ¢J{íÚµ.—+-¶…pçr¹T&Ã£ÑèÅ‹9C?\\c¶ÖL&Ó—_~Ùßß¯TÀn·oß¾İf³¥ørQm6ÛöíÛUv}ô÷÷ùå—è‡kÁN«ÕZ__¯’Ûòòò]»v”lK’víÚ¥2g&Šb}}½ÒM	0«ì$`Y¶¿¿¿¥¥E¥Ì³Ï>»eË•3º“H>}Ë–-Ï>û¬J±–––şş~¼¾N\n¦¦¦&Ùu˜‹(Š\Z¨¬¬TÚä¨Óé***X–½qãË²©3F•$)‰lÛ¶íÕW_UÙÑ144ôşûïG\"ìúH\nüÑ“C¾¼îÔ©S*eX–]·nİÊ•+C¡f›R(Z¹råºuëÔ›âS§N‘tÙ`ÚA‹4z½şÛo¿-(((,,T*c0*++%Ijoo7™LÉm·åWÖ¯¼òJ]]]FF†JÉæææ£GbtDv2±,ÛŞŞ^YY™­TÆ`0TUUåää´µµQ•¬­ Ñhô—¿üå¦M›Ô‡vuuíß¿_¯×§ÎğaB°“‰¢¨X,vÿşıêêj³Ù¬R¬¤¤$??ÿÛo¿MÊ™û‘H$++ë7ŞxşùçÕãêóù:4::Š9³äB°“L>À´»»ûG?ú‘zÉ‚‚‚%K–Ğ4­MÓ-B$Yºté¯~õ«ŠŠŠ)Ëÿõ¯½sçÖ™%‚|ÃÜ½{wll¬ººZ}¶)33ó¹ç³ÙlÃÃÃ^¯—a˜ÙëîJ’Äq\\~~şÖ­[wïŞ™™©^çùúúú––•®hÁN	z½¾··7‰¸\\®)›âÒÒÒ%K–ÈËÎu:İŒÇ[ÅH$¶nİºsçÎ§zjÊÄb±cÇ;w.é3| C°S‚<+ÖÕÕuïŞ½åË—OYŞjµº\\®5kÖÈ=ùP(‹Å3á’$ñ</I’İnñÅßzë­ÚÚÚiÎl8pàë¯¿6HuŠ@°SEQ,ËvwwOLL”——Oy,EQV«õ©§ª©©),,´Z­<“‡ßÓ˜$IÑh4X­Ö+V¼ôÒK?ùÉOV¬XaµZ§ó?ñûıG9wîœÅbAªSµwïŞd×şŸH$âv»wïŞ­t@·Ò§FGGÚÛÛ›››ÇÇÇM&Ë²r3şp÷^EI’AˆÅb‘HÄn·?ûì³n·»¨¨(;;;®\r###‡–ß±ÇñÂìC°SÏóV«õ7¿ùÍt&¢\'566600ğàÁŸÏÇÇÇåæTîi[­V‡Ã‘››[TT”•••Ø¸uëÖşıûƒÁ ÎMAvŠ’ÇÌÛ¶m{ñÅS­=ŒD\"çÏŸÿè£AÀûêÔ„1vŠ¢iZ^Iz÷îİ¨/áÔÒıû÷:túôi†a°<e!Ø©‹¢(½^?44tüøqQóóó“ø2I’$ŸÏwüøñ¿üå/>Ÿ¯µRvw¥4I’(Šb¦©©é»ï¾KîŞìáááÁÁA‹Å‹ÅRütÀ;E‰¢FY–]¼xñ+¯¼òä“O\ZÆ¤7’<Ïûış³gÏ;w.Ò41vjB°S$I¡Phşüù«W¯^²dÉ‚’]£I+W®466Ş¸qÃd2a°jìòıÚ¯-[¶,_¾\\eŸvŠ»uëÖG}444d±XïÔ`§\nçM&Seeåîİ»Ng²«Ÿ\'Nœ?Şãñ`UiŠ@°“O>™dÕªU6lX´hÑãÿ\'&&Âá0ÏóápXŞ¤õƒòpİ`0˜L&³Ùœ™™ùø›@GGG¿şúë††ymìcşßà1!ØIÆqœ ¯¿şúªU«ç,!ÇÓÛÛ{÷îİñññááa¿ß‡\'&&DQœ˜˜øAa›ÍFÓ´Åb±Z­6›Íáp8ÎÜÜÜâââÂÂÂ„›\\Qoß¾ışûï÷÷÷Os©9Ì;iDQä8î™gÙ±cÇO<ïÇÃáp0¼sçÎ…:::äó@)Š’_Qÿ£Óé\r˜üÚLúQåä’$Ñ4½xñâÚÚZ—Ëe·Û-K¼¹ \'Nœ8uêÇq8q!Yìä¢¨W_}uõêÕ‹%®Ïöõõõ÷÷_¿~½©©)‹™Íf¹ë;#-¤¼?„ã8Q«««—.]ZZZZ^^oD¯_¿şá‡öõõáöÜ¤@°“€çy–eß~ûm—ËW\Z;::\Z»ºº<Ã0³z` œpç322.\\èv»W¬X×¿AÿøÇ?:;;±£S{¶Ö8[²dÉîİ»çÏŸ?Íø|¾k×®;vÌãñddd°,«åY¥’$Åb1ã8Û¶mÛªU«\n\n\n¦ÿfëøñã\'Nœø~\\\0ÚÀZqíH’4>>¾víÚ={öLó…V8şæ›o9ræÌyºkVÏ9›”<h7f³¹³³S¾=Óf³©ÜÅ÷°²²²¢¢¢Ï?ÿÜl6#ÛšA°5\"¿vÚ´iÓ={¦3ìE±¹¹ùğáÃ_}õU0L…Mò¦QoŞ¼yåÊ•±±±L¹›a˜üüü²²²ÎÎNÜø£[òxuçÎ[¶l™N>ß{ï½£GF\"ƒÁRaãÍóüÍ›7/\\¸àp8²³³§œZ+((¨¨¨¸~ız(J©_‡Tö¬“$iddäµ×^ûñ<¡é\'Ÿ|òÁôôôÌÈº‘Y\"¯oáyşâÅ‹§¨¨hÊó‰ÇÂ…åÜ)û{Á]r[½k×®—_~yÊoóĞĞĞÁƒ¿úê«X,–o€išff``àÒ¥KÙÙÙùùùêı‡Ãáv»oÜ¸‡‘íY…`Ï\"y>yûöíë×¯Ÿò{ÜÒÒòÎ;ïšÍæ4úÒËHyollÔétÅÅÅê£n‡ÃQZZzáÂy«¹VÕœsìYkjjvíÚ5eüìÙ³E1-\ZêGÑ4m0®]»6::ºhÑ\"õCÚœNçüùóÏœ9ƒyòÙƒ`Ïçkkkßzë-õæ78pàã?¶Z­iÔP?Juœ8qÂív;•Â………N§óêÕ«qÓ‡`ÏŠX,V\\\\ü‹_üBıBŸÏwôèÑ.Øl62¾ß,ËRÕŞŞ^VV¦r7°N§+((İİİØ\n6Ò¸‰HYò+ë×^{M}m™×ëı÷¿ÿıÍ7ß¤Î	¤3‚eY¿ßÿ÷¿ÿıêÕ«*ÅŒFã;ìv{,Ó¬nsZì&IR8~ã7yæ•b^¯÷OúS___ª>#hšÅbŸ}öYuuunn®R1½^_]]İÔÔ$o‰Ñ²†ÄC‹=Ã8[»v­úe×ápøĞ¡C^¯—ÈTËhšÎÉÉ9tèP¿J±¢¢¢mÛ¶E£ÑäÀJ{&	‚PPP°nİ:•qc(:räÈµk×NµŒaŸÏ÷·¿ıíşıû*Å^xá…åË—ó<¯YÅæ{&ºººüü|•2Ÿ~úé_|1Gî»bYv||üÏşs(R*c0¶mÛ&\Zí„`Ïãª««İn·J™–––>ø á{ğÒ‘^¯ihhPÉmnnî;=Â	†É³™!‚İnÿío«rnYggçÁƒçà9z½¾££Ãét–””(•ÉÏÏ\Z\Z’Ğ²n¤B‹=3AX¿~½ÊÖüñÜÜÛDQ”Ùl>räHWW—R™ÌÌÌ—^z‰atÈgÄœû’ÍArrrV®\\©Ò744tvvÎ‘¡õ£hšáÈ‘#*¹u»İ¥¥¥x­=#ì7oŞl³Ù”\n\\¾|ùÔ©Sf³YËZ¥\Z½^ßİİ}üøq¥EíØ±#hY+R!ØKE§Ó¹|ùr¥gÏM…+õ’Îh4655\r*(++«©©‰F£ZÖŠHöã\nƒ?ıéOUN;ºtéÒÕ«WÓtÛÖÌbÆãñ|ñÅ*·ğnİº¯¾‚ıXb±XUUUuuµRÑÑÑúúú9Ş	˜Ñhüä“Onß¾­T ¨¨hÅŠh´‚ıXAxúé§U¶(~şùçØ™øÙÙÙŸ}ö™ÒS‹Å²dÉŠ¢Ğh?;q’$Y,–¥K—*¼xñ\"®Âø–e»ººTö~ÕÖÖfee!ØÁN\\,+//WºÅZÅ‹/ÏÁ×ê(Šây¾¹¹9‰LZÀh4ÖÖÖbõøãÀw.q~¿İºuJOGGG/\\¸0g_\\«3­­­G©ÀªU«ÆÇÇµ¬aì‰¢XTTTVV¦T ¥¥åÁƒh®\'%7ÚgÏU*ğÄO¬\\¹‹U†¯]‚8{á…T\Zä“\'Ob2\\…ÑhlhhPê†eË–)=…)!Ø‰ï‘^¸p¡Rƒ|ëÖ­û÷ï£¹VAQ”ÑhlmmU*P\\\\œ‘‘)´Äà›—QËÊÊTn«?şü”7c€Édºté’ÒÓ¼¼¼…\n‚ e•ˆ`\'B>„Ti/—Ïç»{÷.¶N‰a˜¡¡¡¾¾¾IŸÚl¶¼¼<;1v\"$I*((PzÚÛÛ;44„~ø”hšöz½*sã%%%*‹OA¾|‰E±¼¼|ÒG‚ Ü¹s‡çy¬6›Q¿ıö[¥WÖr°1ÌN\0‚7ùF®Lú4\nuwwcËÇ4éõú®®.¥Ùï¼¼<‹Å‚`\'\0Á› .—Kéi$¹uëØÓDÓtWWW8V*€ù³Ä Øq‹F£UUUJO¿ûî;ãĞŸ&ùÕÙÙ©T`Ñ¢EX¦’\0;n‚ ¨œmvóæMìúˆ‹Á`P	vAA¶p&\0ÁÏó*°;::pË\\\\X–íîîVzZZZŠ‰ñ Øñ‘$);;[¥§=00€]q¡iú»ï¾Sy:oŞ<d;^ø\nÆGÅììl¥¹1ŸÏ\'IØñ2£££“>b&\'\'ãñB°ã#Šâ¼yó”:Û÷ïßG?<ò4¥G‡-v¼ìøÈg’*¥wllÍu(ŠRºÜ‹eÙììl;^v|$I2›ÍJ£è±±1°@Ó´ÏçSz¤×ëÑ¾…ñ‘$Éd2)¥K)¦ô§c&##-v¼ìøÈ/±•‚=11®x(ŠRºj“¢¨ììlü‹/;>ê“ŞÑhÁN\0EQ*«PĞO\0‚7•yo,O˜ÊŸ/\Z€?Y|,Ë™3gnİºõè¨a˜ìëJ€|öáÃ‡írÓ4=44d±X’R±ôEíİ»7ÙuH3‚ (mKĞëõ˜OŒ(ŠJ½q–eÑŠZì¸1ƒïÙŒ£i\Z›gfš\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°ôÍª×BJèÇ\0\0\0\0IEND®B`‚'),('1234','Cedula de Ciudadania','GERMAN','GOENAGA','123','german@gmail.com','da91388c72d3e31da19dcd85c97374197748485d','calle 42#31-69','ADMIN','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0H\0\0H\0\0\0½vğd\0\0\0sBITÛáOà\0\0\0_zTXtRaw profile type APP1\0\0™ãJOÍK-ÊLV((ÊOËÌIåR\0c.KK£D04006’F@¶9T(Ñ\0˜˜›¥¡¹Y²™)ˆÏ\0Oºh-ØŒ\0\0ÁIDATxœíİYl÷áğco{×»Æ8>ƒÀ^;Å1„4€Rq…@\nF…ÚF•šFJß*µ}*}hUU%EEUb\"DIâQĞ8Ø`csClŸk{×ö3»3ó5â<cïbÏîşüı<f~ÿlí—ß1¿ƒÚ»w¯\0ÈB\'»\00ól\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0b“]˜yÒCt: ?(À0ŒN§£’„ZÂlB°É!B,‹F£F£Ñf³Y­Ö¬¬,Š¢rrr~PrxxX’¤±±±`0811Áqœ^¯gYV<\0ÁNo’$	‚Àqœßï¯¬¬t¹\\eee‡Ãd2™L¦ŒŒŠ¢233ğ)¿ß/IR ˆD\"‘HÄçóİ¹sçæÍ›·nİÊÌÌ4Ã OkvZ’$)‹‰¢h4\Z,X°bÅŠeË–Y­V–eõzı”—£n³Ù¾ÿ/Ë—/Åb~¿¿µµõòåËƒƒƒÇÑ4Í²,¨½{÷&»ãt:İÒ¥K—.]ZYY™——7ã?âŞ½{W¯^½zõªN§3\Z3ş#`V¡ÅN’$E£QŸÏ÷òË/?ÿüóö±gJ^^^^^^mmíĞĞPccãgŸ}æp8ôz=Zït;=ğ<o2™ªªª6oŞüä“OjüÓûúú>ıôÓH$b04şé\0¦¦¦&Ùu\05’$…B¡§Ÿ~úõ×_ß¸qcVV–öuÈÊÊZ¾|yyyùÄÄD?šîÔ‡®xê’ûŞÇíİ»·¶¶Öjµ&·>EEE---4\Zˆw*C‹¢äyï¥K—şîw¿s¹\\)Ò6,X½zõƒîİ»GÓ4²š0ÆNE¢(F£Ñ;w®^½:±éh4êõzı~8–›ıïÉ­ÙlÎÌÌt:Óy=ö(ãÎ;÷ŸÿüG¯×Ó4&§tÅSN4\Z¥iúÍ7ß¬­­÷³^¯·³³³««kxxx||<ÈÁD\"ß—1™Lr°322ìv{NNÎÂ…+++NçôÑh\\·nÓéü×¿şFû×fZìÔÂó|iiéÏşó¢¢¢i~$‰x½Ş›7o<yòÎ;z½^^:öı:ğ‡;Ìòòï“‚F@YYÙÆ].—Óé4™LÓüéõõõ===)2X\0‚B8ËÎÎşÃşàp8¦S>‹utt´¶¶¶´´øı~³Ùü8‹½A‡Ã™™™µµµÏ<óLUUËN«CçóùöíÛ7::Šu,©ÁN<Ï¿ùæ›óçÏŸNùöööO?ıtppçyƒÁ0S“X’$ÉÿÃÂÂÂÍ›7»İîé|Êãñ¼óÎ;ıııh·SfÅSÏó‹/şõ¯ıèN¬Guuu9räèÑ£Á`pÆ—sS%7Ô>ŸïüùówïŞu:ÙÙÙêŸ²Z­K–,éëëóx<Ø\"–\nìä!\nıñœ2?±Xìüùóï½÷^oo¯Õj½·MEÑ4m4\ZûûûÛÛÛÍfsaa¡zb-Keeå\'Ÿ|‚yòT€`\'™ ¿ÿıïóóóÕK>xğ`ÿşıgÎœÑétšÍB³,‹ÅZ[[{{{ËËËÕÉX,–šššöövyg˜65„I!ØÉ$ÏKÿìg?«®®V/ÖÓÓ³oß>Çc2™4^BQ”^¯¿wïŞÿû_—Ëåp8T*àp8G[[fI.;™B¡Ğ/¼°yófõb×¯_ÿç?ÿÉq\\§¦ä¦ûòåË………¹¹¹*%‡‡‡»ºº0‘–DvÒD£ÑÒÒÒ·ß~[¥eE±¡¡áÀÃ$}RŠ¦éh4zæÌ½^¿hÑ\"•j»İî7nx½Ş¤×yÎÂ@(9DQ4›Í;vìPï¯655}øá‡6›-E†¬4MÛl¶?ü°©©I¥EQ;vì0›Í¢(jV7xZìäˆD\"ë×¯ñÅUÊ\\¹råı÷ß—\'¨5«Ø”(Šb¦³³3??ÿ‰\'P*–““‡oŞ¼‰Õ¦I‘Bß˜¹CE§Ó¹iÓ&•2}}}ûöíKÍéeš¦9Û·o___ŸJ±M›69N4ÚI‘r_š¹`||¼®®Îl6+ğz½ï¾û®İnOÁTËhš¶Ûíï¾û®×ëU*c6›ëêêÆÇÇµ¬ÈRô{C°X,VUU¥²T“çù“\'OöööNs©v²°,ÛÛÛ{òäIç•Ê¸İîªªªX,¦eÅ@‡`kL’$Q7nÜh±X”Ê´¶¶:u*-6TÆS§Nµ¶¶*°X,7nEQŞRšA°5%Â¢E‹***”\núúz‹Å’«;(Š²X,õõõ@@©LEEÅ¢E‹½ff‚­)ãjjjT\r>yòd8NÙ¡õ£hš‡Ã\'OT*™™év»>Â46_ 2ƒÁçŸ^éiOOOccãô9H&“©±±±§§G©ÀsÏ=\n…´¬ ØÚ‰Åbn·[it-B[[Ûøøx\Z5×2š¦ÇÇÇÛÚÚ”úÛ6›íé§ŸÆš–Òì;”ÖB¡P]]ÒÓ‘‘‘†††´˜3{”ÑhlhhQ*PWW‡F[K¶FDQÌËËSÙ>ÑÜÜ,IRZÌ™=Š¢(I’š››•\näæææååa±ŠflD£Q—Ë¥ò–ëôéÓi7º~˜Éd:}ú´ÒS‹Åâr¹¢Ñ¨–UšËlˆ¢XUU¥İ7nƒÁ4m®eEƒÁ7nLúT¾x-¶fl-H’d³ÙT®İêêêÒıÿC‚Ó\\yù™TVV–ÍfÃJm ØZw}(~411ÑÓÓCÀÖe†azzz&&&&}šŸŸŸF[¶ä`ÛíöIŸz½Şşş~2‚İßß¯´-Än·Ûív[¶DQT¹ ‰ŒŒŒ¤İëëGÑ4=22òğuB?àp8lm¤ı—)-Äb1¥~¸$I·oß& Õ2š¦oß¾­4.,,Ä2mò}Jq‚ (]y\'ÂğğpŠïĞœ>–e‡‡‡•– 9NìÑ‚­A”ºâ¢(0À–1388¨Ôßv8¶6l-‚ tÔ¾$I>Ÿ/­_t=Œ¢(ŸÏ§Ô·Z­¶6l-ğ<¯´˜T’¤ÑÑQ’‚=::ªìÜÜ\\•ãV`!Ø\ZQú®K’ä÷ûI\n¶ßïWùe5®Ïœ…`Á ‚­•Î61ïºd*¿1#Ô‡`keY¿ß?é#š¦\n\nˆY%ŠbAAÒz¿ßOØ¿b)ÁÖË²*§‹˜L&bf•$IRÙU>22‚`kÁÖÃ0Á`PéQII	1owA())QZo‰YŠ“âl-°,ëñx&}DÓô¼yóHêŠÏ›7O©+îñxĞbkÁÖÃ0J]qš¦ËËË‰9v›ã¸òòr¥`ŒŒ ÅÖ‚­š¦•ZlNg·ÛN\'ÃlI’T¶ëtº¡¡![¶hšöù|J•m6[~~>ÃlAòóóm6Û¤O#‘HºŸë–Fl-ÈÁ¾wïŞ¤OçÍ›W\\\\LF°‹‹‹çÍ›7éÓ{÷îy½^bv§8ü•µ@Ó´×ëUéWVVjYŸÙ£ò‹x<[3ø+kDÅû÷ï+Í~Ë—H§õ0[’$ùêïIŸ\n‚ ²Of‚­ƒÁĞÖÖ¦´şÌb±¬Y³&­·4ò<¿fÍ\Z¥Àµk×ƒÆµš³l0ÓÕÕ¥t‚§N§[»vmú6Úrs½víZ¥^¯·»»SâšA°µ£×ë›šš”æåå¹İî4½\'\Zºİî¼¼<¥MMMXš¢%[;F£ñØ±cJOM&Ó†\rX–M»F[’$–e7lØ ²JüØ±ciz‘hšB°µCQ”Ùl¾té’RòòòeË–¥]£F—-[V^^®TàÒ¥Kf³o°µ„`kÊd2µµµ)M†õë×¥Q£-IÒØØØúõë•&ÆDQlkkKë‹DÓ‚­)½^ßÖÖÖÑÑ¡T ¤¤dÏ=*—i¤šH$²gÏ’’¥mmmz½^ËZ‚­)Š¢8»xñ¢J{íÚµ.—+-¶…pçr¹T&Ã£ÑèÅ‹9C?\\c¶ÖL&Ó—_~Ùßß¯TÀn·oß¾İf³¥ørQm6ÛöíÛUv}ô÷÷ùå—è‡kÁN«ÕZ__¯’Ûòòò]»v”lK’víÚ¥2g&Šb}}½ÒM	0«ì$`Y¶¿¿¿¥¥E¥Ì³Ï>»eË•3º“H>}Ë–-Ï>û¬J±–––şş~¼¾N\n¦¦¦&Ùu˜‹(Š\Z¨¬¬TÚä¨Óé***X–½qãË²©3F•$)‰lÛ¶íÕW_UÙÑ144ôşûïG\"ìúH\nüÑ“C¾¼îÔ©S*eX–]·nİÊ•+C¡f›R(Z¹råºuëÔ›âS§N‘tÙ`ÚA‹4z½şÛo¿-(((,,T*c0*++%Ijoo7™LÉm·åWÖ¯¼òJ]]]FF†JÉæææ£GbtDv2±,ÛŞŞ^YY™­TÆ`0TUUåää´µµQ•¬­ Ñhô—¿üå¦M›Ô‡vuuíß¿_¯×§ÎğaB°“‰¢¨X,vÿşıêêj³Ù¬R¬¤¤$??ÿÛo¿MÊ™û‘H$++ë7ŞxşùçÕãêóù:4::Š9³äB°“L>À´»»ûG?ú‘zÉ‚‚‚%K–Ğ4­MÓ-B$Yºté¯~õ«ŠŠŠ)Ëÿõ¯½sçÖ™%‚|ÃÜ½{wll¬ººZ}¶)33ó¹ç³ÙlÃÃÃ^¯—a˜ÙëîJ’Äq\\~~şÖ­[wïŞ™™©^çùúúú––•®hÁN	z½¾··7‰¸\\®)›âÒÒÒ%K–ÈËÎu:İŒÇ[ÅH$¶nİºsçÎ§zjÊÄb±cÇ;w.é3| C°S‚<+ÖÕÕuïŞ½åË—OYŞjµº\\®5kÖÈ=ùP(‹Å3á’$ñ</I’İnñÅßzë­ÚÚÚiÎl8pàë¯¿6HuŠ@°SEQ,ËvwwOLL”——Oy,EQV«õ©§ª©©),,´Z­<“‡ßÓ˜$IÑh4X­Ö+V¼ôÒK?ùÉOV¬XaµZ§ó?ñûıG9wîœÅbAªSµwïŞd×şŸH$âv»wïŞ­t@·Ò§FGGÚÛÛ›››ÇÇÇM&Ë²r3şp÷^EI’AˆÅb‘HÄn·?ûì³n·»¨¨(;;;®\r###‡–ß±ÇñÂìC°SÏóV«õ7¿ùÍt&¢\'566600ğàÁŸÏÇÇÇåæTîi[­V‡Ã‘››[TT”•••Ø¸uëÖşıûƒÁ ÎMAvŠ’ÇÌÛ¶m{ñÅS­=ŒD\"çÏŸÿè£AÀûêÔ„1vŠ¢iZ^Iz÷îİ¨/áÔÒıû÷:túôi†a°<e!Ø©‹¢(½^?44tüøqQóóó“ø2I’$ŸÏwüøñ¿üå/>Ÿ¯µRvw¥4I’(Šb¦©©é»ï¾KîŞìáááÁÁA‹Å‹ÅRütÀ;E‰¢FY–]¼xñ+¯¼òä“O\ZÆ¤7’<Ïûış³gÏ;w.Ò41vjB°S$I¡Phşüù«W¯^²dÉ‚’]£I+W®466Ş¸qÃd2a°jìòıÚ¯-[¶,_¾\\eŸvŠ»uëÖG}444d±XïÔ`§\nçM&Seeåîİ»Ng²«Ÿ\'Nœ?Şãñ`UiŠ@°“O>™dÕªU6lX´hÑãÿ\'&&Âá0ÏóápXŞ¤õƒòpİ`0˜L&³Ùœ™™ùø›@GGG¿şúë††ymìcşßà1!ØIÆqœ ¯¿şúªU«ç,!ÇÓÛÛ{÷îİñññááa¿ß‡\'&&DQœ˜˜øAa›ÍFÓ´Åb±Z­6›Íáp8ÎÜÜÜâââÂÂÂ„›\\Qoß¾ışûï÷÷÷Os©9Ì;iDQä8î™gÙ±cÇO<ïÇÃáp0¼sçÎ…:::äó@)Š’_Qÿ£Óé\r˜üÚLúQåä’$Ñ4½xñâÚÚZ—Ëe·Û-K¼¹ \'Nœ8uêÇq8q!Yìä¢¨W_}uõêÕ‹%®Ïöõõõ÷÷_¿~½©©)‹™Íf¹ë;#-¤¼?„ã8Q«««—.]ZZZZ^^oD¯_¿şá‡öõõáöÜ¤@°“€çy–eß~ûm—ËW\Z;::\Z»ºº<Ã0³z` œpç322.\\èv»W¬X×¿AÿøÇ?:;;±£S{¶Ö8[²dÉîİ»çÏŸ?Íø|¾k×®;vÌãñddd°,«åY¥’$Åb1ã8Û¶mÛªU«\n\n\n¦ÿfëøñã\'Nœø~\\\0ÚÀZqíH’4>>¾víÚ={öLó…V8şæ›o9ræÌyºkVÏ9›”<h7f³¹³³S¾=Óf³©ÜÅ÷°²²²¢¢¢Ï?ÿÜl6#ÛšA°5\"¿vÚ´iÓ={¦3ìE±¹¹ùğáÃ_}õU0L…Mò¦QoŞ¼yåÊ•±±±L¹›a˜üüü²²²ÎÎNÜø£[òxuçÎ[¶l™N>ß{ï½£GF\"ƒÁRaãÍóüÍ›7/\\¸àp8²³³§œZ+((¨¨¨¸~ız(J©_‡Tö¬“$iddäµ×^ûñ<¡é\'Ÿ|òÁôôôÌÈº‘Y\"¯oáyşâÅ‹§¨¨hÊó‰ÇÂ…åÜ)û{Á]r[½k×®—_~yÊoóĞĞĞÁƒ¿úê«X,–o€išff``àÒ¥KÙÙÙùùùêı‡Ãáv»oÜ¸‡‘íY…`Ï\"y>yûöíë×¯Ÿò{ÜÒÒòÎ;ïšÍæ4úÒËHyollÔétÅÅÅê£n‡ÃQZZzáÂy«¹VÕœsìYkjjvíÚ5eüìÙ³E1-\ZêGÑ4m0®]»6::ºhÑ\"õCÚœNçüùóÏœ9ƒyòÙƒ`Ïçkkkßzë-õæ78pàã?¶Z­iÔP?Juœ8qÂív;•Â………N§óêÕ«qÓ‡`ÏŠX,V\\\\ü‹_üBıBŸÏwôèÑ.Øl62¾ß,ËRÕŞŞ^VV¦r7°N§+((İİİØ\n6Ò¸‰HYò+ë×^{M}m™×ëı÷¿ÿıÍ7ß¤Î	¤3‚eY¿ßÿ÷¿ÿıêÕ«*ÅŒFã;ìv{,Ó¬nsZì&IR8~ã7yæ•b^¯÷OúS___ª>#hšÅbŸ}öYuuunn®R1½^_]]İÔÔ$o‰Ñ²†ÄC‹=Ã8[»v­úe×ápøĞ¡C^¯—ÈTËhšÎÉÉ9tèP¿J±¢¢¢mÛ¶E£ÑäÀJ{&	‚PPP°nİ:•qc(:räÈµk×NµŒaŸÏ÷·¿ıíşıû*Å^xá…åË—ó<¯YÅæ{&ºººüü|•2Ÿ~úé_|1Gî»bYv||üÏşs(R*c0¶mÛ&\Zí„`Ïãª««İn·J™–––>ø á{ğÒ‘^¯ihhPÉmnnî;=Â	†É³™!‚İnÿío«rnYggçÁƒçà9z½¾££Ãét–””(•ÉÏÏ\Z\Z’Ğ²n¤B‹=3AX¿~½ÊÖüñÜÜÛDQ”Ùl>räHWW—R™ÌÌÌ—^z‰atÈgÄœû’ÍArrrV®\\©Ò744tvvÎ‘¡õ£hšáÈ‘#*¹u»İ¥¥¥x­=#ì7oŞl³Ù”\n\\¾|ùÔ©Sf³YËZ¥\Z½^ßİİ}üøq¥EíØ±#hY+R!ØKE§Ó¹|ùr¥gÏM…+õ’Îh4655\r*(++«©©‰F£ZÖŠHöã\nƒ?ıéOUN;ºtéÒÕ«WÓtÛÖÌbÆãñ|ñÅ*·ğnİº¯¾‚ıXb±XUUUuuµRÑÑÑúúú9Ş	˜Ñhüä“Onß¾­T ¨¨hÅŠh´‚ıXAxúé§U¶(~şùçØ™øÙÙÙŸ}ö™ÒS‹Å²dÉŠ¢Ğh?;q’$Y,–¥K—*¼xñ\"®Âø–e»ººTö~ÕÖÖfee!ØÁN\\,+//WºÅZÅ‹/ÏÁ×ê(Šây¾¹¹9‰LZÀh4ÖÖÖbõøãÀw.q~¿İºuJOGGG/\\¸0g_\\«3­­­G©ÀªU«ÆÇÇµ¬aì‰¢XTTTVV¦T ¥¥åÁƒh®\'%7ÚgÏU*ğÄO¬\\¹‹U†¯]‚8{á…T\Zä“\'Ob2\\…ÑhlhhPê†eË–)=…)!Ø‰ï‘^¸p¡Rƒ|ëÖ­û÷ï£¹VAQ”ÑhlmmU*P\\\\œ‘‘)´Äà›—QËÊÊTn«?şü”7c€Édºté’ÒÓ¼¼¼…\n‚ e•ˆ`\'B>„Ti/—Ïç»{÷.¶N‰a˜¡¡¡¾¾¾IŸÚl¶¼¼<;1v\"$I*((PzÚÛÛ;44„~ø”hšöz½*sã%%%*‹OA¾|‰E±¼¼|ÒG‚ Ü¹s‡çy¬6›Q¿ıö[¥WÖr°1ÌN\0‚7ùF®Lú4\nuwwcËÇ4éõú®®.¥Ùï¼¼<‹Å‚`\'\0Á› .—Kéi$¹uëØÓDÓtWWW8V*€ù³Ä Øq‹F£UUUJO¿ûî;ãĞŸ&ùÕÙÙ©T`Ñ¢EX¦’\0;n‚ ¨œmvóæMìúˆ‹Á`P	vAA¶p&\0ÁÏó*°;::pË\\\\X–íîîVzZZZŠ‰ñ Øñ‘$);;[¥§=00€]q¡iú»ï¾Sy:oŞ<d;^ø\nÆGÅììl¥¹1ŸÏ\'IØñ2£££“>b&\'\'ãñB°ã#Šâ¼yó”:Û÷ïßG?<ò4¥G‡-v¼ìøÈg’*¥wllÍu(ŠRºÜ‹eÙììl;^v|$I2›ÍJ£è±±1°@Ó´ÏçSz¤×ëÑ¾…ñ‘$Éd2)¥K)¦ô§c&##-v¼ìøÈ/±•‚=11®x(ŠRºj“¢¨ììlü‹/;>ê“ŞÑhÁN\0EQ*«PĞO\0‚7•yo,O˜ÊŸ/\Z€?Y|,Ë™3gnİºõè¨a˜ìëJ€|öáÃ‡írÓ4=44d±X’R±ôEíİ»7ÙuH3‚ (mKĞëõ˜OŒ(ŠJ½q–eÑŠZì¸1ƒïÙŒ£i\Z›gfš\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°ôÍª×BJèÇ\0\0\0\0IEND®B`‚'),('1234567','Cedula de Ciudadania','JUAN','CERVANTES','123','juan@gmail.com','c5652d9cc6bcf28e0e20210eae5ef9e54ba35717','calle 42#31-69','ADMIN','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0H\0\0H\0\0\0½vğd\0\0\0sBITÛáOà\0\0\0_zTXtRaw profile type APP1\0\0™ãJOÍK-ÊLV((ÊOËÌIåR\0c.KK£D04006’F@¶9T(Ñ\0˜˜›¥¡¹Y²™)ˆÏ\0Oºh-ØŒ\0\0ÁIDATxœíİYl÷áğco{×»Æ8>ƒÀ^;Å1„4€Rq…@\nF…ÚF•šFJß*µ}*}hUU%EEUb\"DIâQĞ8Ø`csClŸk{×ö3»3ó5â<cïbÏîşüı<f~ÿlí—ß1¿ƒÚ»w¯\0ÈB\'»\00ól\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0b“]˜yÒCt: ?(À0ŒN§£’„ZÂlB°É!B,‹F£F£Ñf³Y­Ö¬¬,Š¢rrr~PrxxX’¤±±±`0811Áqœ^¯gYV<\0ÁNo’$	‚Àqœßï¯¬¬t¹\\eee‡Ãd2™L¦ŒŒŠ¢233ğ)¿ß/IR ˆD\"‘HÄçóİ¹sçæÍ›·nİÊÌÌ4Ã OkvZ’$)‹‰¢h4\Z,X°bÅŠeË–Y­V–eõzı”—£n³Ù¾ÿ/Ë—/Åb~¿¿µµõòåËƒƒƒÇÑ4Í²,¨½{÷&»ãt:İÒ¥K—.]ZYY™——7ã?âŞ½{W¯^½zõªN§3\Z3ş#`V¡ÅN’$E£QŸÏ÷òË/?ÿüóö±gJ^^^^^^mmíĞĞPccãgŸ}æp8ôz=Zït;=ğ<o2™ªªª6oŞüä“OjüÓûúú>ıôÓH$b04şé\0¦¦¦&Ùu\05’$…B¡§Ÿ~úõ×_ß¸qcVV–öuÈÊÊZ¾|yyyùÄÄD?šîÔ‡®xê’ûŞÇíİ»·¶¶Öjµ&·>EEE---4\Zˆw*C‹¢äyï¥K—şîw¿s¹\\)Ò6,X½zõƒîİ»GÓ4²š0ÆNE¢(F£Ñ;w®^½:±éh4êõzı~8–›ıïÉ­ÙlÎÌÌt:Óy=ö(ãÎ;÷ŸÿüG¯×Ó4&§tÅSN4\Z¥iúÍ7ß¬­­÷³^¯·³³³««kxxx||<ÈÁD\"ß—1™Lr°322ìv{NNÎÂ…+++NçôÑh\\·nÓéü×¿şFû×fZìÔÂó|iiéÏşó¢¢¢i~$‰x½Ş›7o<yòÎ;z½^^:öı:ğ‡;Ìòòï“‚F@YYÙÆ].—Óé4™LÓüéõõõ===)2X\0‚B8ËÎÎşÃşàp8¦S>‹utt´¶¶¶´´øı~³Ùü8‹½A‡Ã™™™µµµÏ<óLUUËN«CçóùöíÛ7::Šu,©ÁN<Ï¿ùæ›óçÏŸNùöööO?ıtppçyƒÁ0S“X’$ÉÿÃÂÂÂÍ›7»İîé|Êãñ¼óÎ;ıııh·SfÅSÏó‹/şõ¯ıèN¬Guuu9räèÑ£Á`pÆ—sS%7Ô>ŸïüùówïŞu:ÙÙÙêŸ²Z­K–,éëëóx<Ø\"–\nìä!\nıñœ2?±Xìüùóï½÷^oo¯Õj½·MEÑ4m4\ZûûûÛÛÛÍfsaa¡zb-Keeå\'Ÿ|‚yòT€`\'™ ¿ÿıïóóóÕK>xğ`ÿşıgÎœÑétšÍB³,‹ÅZ[[{{{ËËËÕÉX,–šššöövyg˜65„I!ØÉ$ÏKÿìg?«®®V/ÖÓÓ³oß>Çc2™4^BQ”^¯¿wïŞÿû_—Ëåp8T*àp8G[[fI.;™B¡Ğ/¼°yófõb×¯_ÿç?ÿÉq\\§¦ä¦ûòåË………¹¹¹*%‡‡‡»ºº0‘–DvÒD£ÑÒÒÒ·ß~[¥eE±¡¡áÀÃ$}RŠ¦éh4zæÌ½^¿hÑ\"•j»İî7nx½Ş¤×yÎÂ@(9DQ4›Í;vìPï¯655}øá‡6›-E†¬4MÛl¶?ü°©©I¥EQ;vì0›Í¢(jV7xZìäˆD\"ë×¯ñÅUÊ\\¹råı÷ß—\'¨5«Ø”(Šb¦³³3??ÿ‰\'P*–““‡oŞ¼‰Õ¦I‘Bß˜¹CE§Ó¹iÓ&•2}}}ûöíKÍéeš¦9Û·o___ŸJ±M›69N4ÚI‘r_š¹`||¼®®Îl6+ğz½ï¾û®İnOÁTËhš¶Ûíï¾û®×ëU*c6›ëêêÆÇÇµ¬ÈRô{C°X,VUU¥²T“çù“\'OöööNs©v²°,ÛÛÛ{òäIç•Ê¸İîªªªX,¦eÅ@‡`kL’$Q7nÜh±X”Ê´¶¶:u*-6TÆS§Nµ¶¶*°X,7nEQŞRšA°5%Â¢E‹***”\núúz‹Å’«;(Š²X,õõõ@@©LEEÅ¢E‹½ff‚­)ãjjjT\r>yòd8NÙ¡õ£hš‡Ã\'OT*™™év»>Â46_ 2ƒÁçŸ^éiOOOccãô9H&“©±±±§§G©ÀsÏ=\n…´¬ ØÚ‰Åbn·[it-B[[Ûøøx\Z5×2š¦ÇÇÇÛÚÚ”úÛ6›íé§ŸÆš–Òì;”ÖB¡P]]ÒÓ‘‘‘†††´˜3{”ÑhlhhQ*PWW‡F[K¶FDQÌËËSÙ>ÑÜÜ,IRZÌ™=Š¢(I’š››•\näæææååa±ŠflD£Q—Ë¥ò–ëôéÓi7º~˜Éd:}ú´ÒS‹Åâr¹¢Ñ¨–UšËlˆ¢XUU¥İ7nƒÁ4m®eEƒÁ7nLúT¾x-¶fl-H’d³ÙT®İêêêÒıÿC‚Ó\\yù™TVV–ÍfÃJm ØZw}(~411ÑÓÓCÀÖe†azzz&&&&}šŸŸŸF[¶ä`ÛíöIŸz½Şşş~2‚İßß¯´-Än·Ûív[¶DQT¹ ‰ŒŒŒ¤İëëGÑ4=22òğuB?àp8lm¤ı—)-Äb1¥~¸$I·oß& Õ2š¦oß¾­4.,,Ä2mò}Jq‚ (]y\'ÂğğpŠïĞœ>–e‡‡‡•– 9NìÑ‚­A”ºâ¢(0À–1388¨Ôßv8¶6l-‚ tÔ¾$I>Ÿ/­_t=Œ¢(ŸÏ§Ô·Z­¶6l-ğ<¯´˜T’¤ÑÑQ’‚=::ªìÜÜ\\•ãV`!Ø\ZQú®K’ä÷ûI\n¶ßïWùe5®Ïœ…`Á ‚­•Î61ïºd*¿1#Ô‡`keY¿ß?é#š¦\n\nˆY%ŠbAAÒz¿ßOØ¿b)ÁÖË²*§‹˜L&bf•$IRÙU>22‚`kÁÖÃ0Á`PéQII	1owA())QZo‰YŠ“âl-°,ëñx&}DÓô¼yóHêŠÏ›7O©+îñxĞbkÁÖÃ0J]qš¦ËËË‰9v›ã¸òòr¥`ŒŒ ÅÖ‚­š¦•ZlNg·ÛN\'ÃlI’T¶ëtº¡¡![¶hšöù|J•m6[~~>ÃlAòóóm6Û¤O#‘HºŸë–Fl-ÈÁ¾wïŞ¤OçÍ›W\\\\LF°‹‹‹çÍ›7éÓ{÷îy½^bv§8ü•µ@Ó´×ëUéWVVjYŸÙ£ò‹x<[3ø+kDÅû÷ï+Í~Ë—H§õ0[’$ùêïIŸ\n‚ ²Of‚­ƒÁĞÖÖ¦´şÌb±¬Y³&­·4ò<¿fÍ\Z¥Àµk×ƒÆµš³l0ÓÕÕ¥t‚§N§[»vmú6Úrs½víZ¥^¯·»»SâšA°µ£×ë›šš”æåå¹İî4½\'\Zºİî¼¼<¥MMMXš¢%[;F£ñØ±cJOM&Ó†\rX–M»F[’$–e7lØ ²JüØ±ciz‘hšB°µCQ”Ùl¾té’RòòòeË–¥]£F—-[V^^®TàÒ¥Kf³o°µ„`kÊd2µµµ)M†õë×¥Q£-IÒØØØúõë•&ÆDQlkkKë‹DÓ‚­)½^ßÖÖÖÑÑ¡T ¤¤dÏ=*—i¤šH$²gÏ’’¥mmmz½^ËZ‚­)Š¢8»xñ¢J{íÚµ.—+-¶…pçr¹T&Ã£ÑèÅ‹9C?\\c¶ÖL&Ó—_~Ùßß¯TÀn·oß¾İf³¥ørQm6ÛöíÛUv}ô÷÷ùå—è‡kÁN«ÕZ__¯’Ûòòò]»v”lK’víÚ¥2g&Šb}}½ÒM	0«ì$`Y¶¿¿¿¥¥E¥Ì³Ï>»eË•3º“H>}Ë–-Ï>û¬J±–––şş~¼¾N\n¦¦¦&Ùu˜‹(Š\Z¨¬¬TÚä¨Óé***X–½qãË²©3F•$)‰lÛ¶íÕW_UÙÑ144ôşûïG\"ìúH\nüÑ“C¾¼îÔ©S*eX–]·nİÊ•+C¡f›R(Z¹råºuëÔ›âS§N‘tÙ`ÚA‹4z½şÛo¿-(((,,T*c0*++%Ijoo7™LÉm·åWÖ¯¼òJ]]]FF†JÉæææ£GbtDv2±,ÛŞŞ^YY™­TÆ`0TUUåää´µµQ•¬­ Ñhô—¿üå¦M›Ô‡vuuíß¿_¯×§ÎğaB°“‰¢¨X,vÿşıêêj³Ù¬R¬¤¤$??ÿÛo¿MÊ™û‘H$++ë7ŞxşùçÕãêóù:4::Š9³äB°“L>À´»»ûG?ú‘zÉ‚‚‚%K–Ğ4­MÓ-B$Yºté¯~õ«ŠŠŠ)Ëÿõ¯½sçÖ™%‚|ÃÜ½{wll¬ººZ}¶)33ó¹ç³ÙlÃÃÃ^¯—a˜ÙëîJ’Äq\\~~şÖ­[wïŞ™™©^çùúúú––•®hÁN	z½¾··7‰¸\\®)›âÒÒÒ%K–ÈËÎu:İŒÇ[ÅH$¶nİºsçÎ§zjÊÄb±cÇ;w.é3| C°S‚<+ÖÕÕuïŞ½åË—OYŞjµº\\®5kÖÈ=ùP(‹Å3á’$ñ</I’İnñÅßzë­ÚÚÚiÎl8pàë¯¿6HuŠ@°SEQ,ËvwwOLL”——Oy,EQV«õ©§ª©©),,´Z­<“‡ßÓ˜$IÑh4X­Ö+V¼ôÒK?ùÉOV¬XaµZ§ó?ñûıG9wîœÅbAªSµwïŞd×şŸH$âv»wïŞ­t@·Ò§FGGÚÛÛ›››ÇÇÇM&Ë²r3şp÷^EI’AˆÅb‘HÄn·?ûì³n·»¨¨(;;;®\r###‡–ß±ÇñÂìC°SÏóV«õ7¿ùÍt&¢\'566600ğàÁŸÏÇÇÇåæTîi[­V‡Ã‘››[TT”•••Ø¸uëÖşıûƒÁ ÎMAvŠ’ÇÌÛ¶m{ñÅS­=ŒD\"çÏŸÿè£AÀûêÔ„1vŠ¢iZ^Iz÷îİ¨/áÔÒıû÷:túôi†a°<e!Ø©‹¢(½^?44tüøqQóóó“ø2I’$ŸÏwüøñ¿üå/>Ÿ¯µRvw¥4I’(Šb¦©©é»ï¾KîŞìáááÁÁA‹Å‹ÅRütÀ;E‰¢FY–]¼xñ+¯¼òä“O\ZÆ¤7’<Ïûış³gÏ;w.Ò41vjB°S$I¡Phşüù«W¯^²dÉ‚’]£I+W®466Ş¸qÃd2a°jìòıÚ¯-[¶,_¾\\eŸvŠ»uëÖG}444d±XïÔ`§\nçM&Seeåîİ»Ng²«Ÿ\'Nœ?Şãñ`UiŠ@°“O>™dÕªU6lX´hÑãÿ\'&&Âá0ÏóápXŞ¤õƒòpİ`0˜L&³Ùœ™™ùø›@GGG¿şúë††ymìcşßà1!ØIÆqœ ¯¿şúªU«ç,!ÇÓÛÛ{÷îİñññááa¿ß‡\'&&DQœ˜˜øAa›ÍFÓ´Åb±Z­6›Íáp8ÎÜÜÜâââÂÂÂ„›\\Qoß¾ışûï÷÷÷Os©9Ì;iDQä8î™gÙ±cÇO<ïÇÃáp0¼sçÎ…:::äó@)Š’_Qÿ£Óé\r˜üÚLúQåä’$Ñ4½xñâÚÚZ—Ëe·Û-K¼¹ \'Nœ8uêÇq8q!Yìä¢¨W_}uõêÕ‹%®Ïöõõõ÷÷_¿~½©©)‹™Íf¹ë;#-¤¼?„ã8Q«««—.]ZZZZ^^oD¯_¿şá‡öõõáöÜ¤@°“€çy–eß~ûm—ËW\Z;::\Z»ºº<Ã0³z` œpç322.\\èv»W¬X×¿AÿøÇ?:;;±£S{¶Ö8[²dÉîİ»çÏŸ?Íø|¾k×®;vÌãñddd°,«åY¥’$Åb1ã8Û¶mÛªU«\n\n\n¦ÿfëøñã\'Nœø~\\\0ÚÀZqíH’4>>¾víÚ={öLó…V8şæ›o9ræÌyºkVÏ9›”<h7f³¹³³S¾=Óf³©ÜÅ÷°²²²¢¢¢Ï?ÿÜl6#ÛšA°5\"¿vÚ´iÓ={¦3ìE±¹¹ùğáÃ_}õU0L…Mò¦QoŞ¼yåÊ•±±±L¹›a˜üüü²²²ÎÎNÜø£[òxuçÎ[¶l™N>ß{ï½£GF\"ƒÁRaãÍóüÍ›7/\\¸àp8²³³§œZ+((¨¨¨¸~ız(J©_‡Tö¬“$iddäµ×^ûñ<¡é\'Ÿ|òÁôôôÌÈº‘Y\"¯oáyşâÅ‹§¨¨hÊó‰ÇÂ…åÜ)û{Á]r[½k×®—_~yÊoóĞĞĞÁƒ¿úê«X,–o€išff``àÒ¥KÙÙÙùùùêı‡Ãáv»oÜ¸‡‘íY…`Ï\"y>yûöíë×¯Ÿò{ÜÒÒòÎ;ïšÍæ4úÒËHyollÔétÅÅÅê£n‡ÃQZZzáÂy«¹VÕœsìYkjjvíÚ5eüìÙ³E1-\ZêGÑ4m0®]»6::ºhÑ\"õCÚœNçüùóÏœ9ƒyòÙƒ`Ïçkkkßzë-õæ78pàã?¶Z­iÔP?Juœ8qÂív;•Â………N§óêÕ«qÓ‡`ÏŠX,V\\\\ü‹_üBıBŸÏwôèÑ.Øl62¾ß,ËRÕŞŞ^VV¦r7°N§+((İİİØ\n6Ò¸‰HYò+ë×^{M}m™×ëı÷¿ÿıÍ7ß¤Î	¤3‚eY¿ßÿ÷¿ÿıêÕ«*ÅŒFã;ìv{,Ó¬nsZì&IR8~ã7yæ•b^¯÷OúS___ª>#hšÅbŸ}öYuuunn®R1½^_]]İÔÔ$o‰Ñ²†ÄC‹=Ã8[»v­úe×ápøĞ¡C^¯—ÈTËhšÎÉÉ9tèP¿J±¢¢¢mÛ¶E£ÑäÀJ{&	‚PPP°nİ:•qc(:räÈµk×NµŒaŸÏ÷·¿ıíşıû*Å^xá…åË—ó<¯YÅæ{&ºººüü|•2Ÿ~úé_|1Gî»bYv||üÏşs(R*c0¶mÛ&\Zí„`Ïãª««İn·J™–––>ø á{ğÒ‘^¯ihhPÉmnnî;=Â	†É³™!‚İnÿío«rnYggçÁƒçà9z½¾££Ãét–””(•ÉÏÏ\Z\Z’Ğ²n¤B‹=3AX¿~½ÊÖüñÜÜÛDQ”Ùl>räHWW—R™ÌÌÌ—^z‰atÈgÄœû’ÍArrrV®\\©Ò744tvvÎ‘¡õ£hšáÈ‘#*¹u»İ¥¥¥x­=#ì7oŞl³Ù”\n\\¾|ùÔ©Sf³YËZ¥\Z½^ßİİ}üøq¥EíØ±#hY+R!ØKE§Ó¹|ùr¥gÏM…+õ’Îh4655\r*(++«©©‰F£ZÖŠHöã\nƒ?ıéOUN;ºtéÒÕ«WÓtÛÖÌbÆãñ|ñÅ*·ğnİº¯¾‚ıXb±XUUUuuµRÑÑÑúúú9Ş	˜Ñhüä“Onß¾­T ¨¨hÅŠh´‚ıXAxúé§U¶(~şùçØ™øÙÙÙŸ}ö™ÒS‹Å²dÉŠ¢Ğh?;q’$Y,–¥K—*¼xñ\"®Âø–e»ººTö~ÕÖÖfee!ØÁN\\,+//WºÅZÅ‹/ÏÁ×ê(Šây¾¹¹9‰LZÀh4ÖÖÖbõøãÀw.q~¿İºuJOGGG/\\¸0g_\\«3­­­G©ÀªU«ÆÇÇµ¬aì‰¢XTTTVV¦T ¥¥åÁƒh®\'%7ÚgÏU*ğÄO¬\\¹‹U†¯]‚8{á…T\Zä“\'Ob2\\…ÑhlhhPê†eË–)=…)!Ø‰ï‘^¸p¡Rƒ|ëÖ­û÷ï£¹VAQ”ÑhlmmU*P\\\\œ‘‘)´Äà›—QËÊÊTn«?şü”7c€Édºté’ÒÓ¼¼¼…\n‚ e•ˆ`\'B>„Ti/—Ïç»{÷.¶N‰a˜¡¡¡¾¾¾IŸÚl¶¼¼<;1v\"$I*((PzÚÛÛ;44„~ø”hšöz½*sã%%%*‹OA¾|‰E±¼¼|ÒG‚ Ü¹s‡çy¬6›Q¿ıö[¥WÖr°1ÌN\0‚7ùF®Lú4\nuwwcËÇ4éõú®®.¥Ùï¼¼<‹Å‚`\'\0Á› .—Kéi$¹uëØÓDÓtWWW8V*€ù³Ä Øq‹F£UUUJO¿ûî;ãĞŸ&ùÕÙÙ©T`Ñ¢EX¦’\0;n‚ ¨œmvóæMìúˆ‹Á`P	vAA¶p&\0ÁÏó*°;::pË\\\\X–íîîVzZZZŠ‰ñ Øñ‘$);;[¥§=00€]q¡iú»ï¾Sy:oŞ<d;^ø\nÆGÅììl¥¹1ŸÏ\'IØñ2£££“>b&\'\'ãñB°ã#Šâ¼yó”:Û÷ïßG?<ò4¥G‡-v¼ìøÈg’*¥wllÍu(ŠRºÜ‹eÙììl;^v|$I2›ÍJ£è±±1°@Ó´ÏçSz¤×ëÑ¾…ñ‘$Éd2)¥K)¦ô§c&##-v¼ìøÈ/±•‚=11®x(ŠRºj“¢¨ììlü‹/;>ê“ŞÑhÁN\0EQ*«PĞO\0‚7•yo,O˜ÊŸ/\Z€?Y|,Ë™3gnİºõè¨a˜ìëJ€|öáÃ‡írÓ4=44d±X’R±ôEíİ»7ÙuH3‚ (mKĞëõ˜OŒ(ŠJ½q–eÑŠZì¸1ƒïÙŒ£i\Z›gfš\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°ôÍª×BJèÇ\0\0\0\0IEND®B`‚');

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

/*Table structure for table `programas` */

DROP TABLE IF EXISTS `programas`;

CREATE TABLE `programas` (
  `Cod_Pro` int(40) NOT NULL,
  `Pro_Desc` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Cod_Pro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `programas` */

insert  into `programas`(`Cod_Pro`,`Pro_Desc`) values (1,'ANALISIS Y DESARROLLO DE SISTEMAS DE INFORMACIÃ“N'),(2,'ANALISIS Y DESARROLLO DE SOFTWARE'),(4,'GESTION'),(5,'AVIACION'),(190,'SI');

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

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
