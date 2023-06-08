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
  `cod_Acta` int(11) NOT NULL AUTO_INCREMENT,
  `acta_Fecha` date DEFAULT NULL,
  `acta_id_Aprendiz` varchar(50) DEFAULT NULL COMMENT 'Id del aprendiz',
  `acta_Ficha` int(11) DEFAULT NULL COMMENT 'Ficha a la que pertenece el aprendiz',
  `acta_Programa` int(11) DEFAULT NULL,
  `acta_Funcionario` int(11) DEFAULT NULL COMMENT 'Id del instructor que genera el acta de compromiso',
  `acta_Telefono_Aprendiz` int(11) DEFAULT NULL,
  `acta_Direccion_Aprendiz` int(11) DEFAULT NULL,
  `acta_Motivo_Remision` varchar(500) DEFAULT NULL,
  `acta_Descargo_Aprendiz` varchar(500) DEFAULT NULL,
  `acta_Compromisos_Adquiridos` varchar(500) DEFAULT NULL,
  `acta_Recomendaciones` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`cod_Acta`),
  KEY `FK_ACTAS_APRENDIZ` (`acta_id_Aprendiz`),
  KEY `FK_ACTAS_FICHA` (`acta_Ficha`),
  KEY `FK_ACTAS_PROGRAMA` (`acta_Programa`),
  CONSTRAINT `FK_ACTAS_APRENDIZ` FOREIGN KEY (`acta_id_Aprendiz`) REFERENCES `aprendiz` (`Id_Apre`),
  CONSTRAINT `FK_ACTAS_FICHA` FOREIGN KEY (`acta_Ficha`) REFERENCES `ficha` (`Cod_Ficha`),
  CONSTRAINT `FK_ACTAS_PROGRAMA` FOREIGN KEY (`acta_Programa`) REFERENCES `programas` (`Cod_Pro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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

insert  into `apre_ficha`(`Cod_Ficha`,`Id_Apre`) values (1234,'456'),(2452524,'123');

/*Table structure for table `aprendices_actas` */

DROP TABLE IF EXISTS `aprendices_actas`;

CREATE TABLE `aprendices_actas` (
  `cod_acta_FK` int(11) DEFAULT NULL,
  `id_aprendiz_FK` varchar(50) DEFAULT NULL,
  `cod_ficha_FK` int(30) DEFAULT NULL,
  KEY `fk1` (`cod_acta_FK`),
  KEY `fk2` (`id_aprendiz_FK`),
  KEY `fk3` (`cod_ficha_FK`),
  CONSTRAINT `fk1` FOREIGN KEY (`cod_acta_FK`) REFERENCES `acta_compromiso` (`cod_Acta`),
  CONSTRAINT `fk2` FOREIGN KEY (`id_aprendiz_FK`) REFERENCES `aprendiz` (`Id_Apre`),
  CONSTRAINT `fk3` FOREIGN KEY (`cod_ficha_FK`) REFERENCES `ficha` (`Cod_Ficha`)
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

insert  into `funcionario`(`ID_Func`,`Fun_Tip_Doc`,`Fun_Nom`,`Fun_Ape`,`Fun_Tel`,`Fun_Correo`,`Fun_Pswd`,`Fun_Direcc`,`Fun_Rol`,`Fun_Img`) values ('1001946423','Cedula de Ciudadania','BRAYAN','LOPEZ','3022974095','brayanlpz1525@gmail.com','b761d6d20bfb9ab4adf9e9ab7cc5a4de1c4fae34','Calle 46b #16-107','ADMIN','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0H\0\0H\0\0\0½vðd\0\0\0sBITÛáOà\0\0\0_zTXtRaw profile type APP1\0\0™ãJOÍK-ÊLV((ÊOËÌIåR\0c.KK£D04006’F@¶9T(Ñ\0˜˜›¥¡¹Y²™)ˆÏ\0Oºh-ØŒ\0\0ÁIDATxœíÝYl÷áðco{×»Æ8>ƒÀ^;Å1„4€Rq…@\nF…ÚF•šFJß*µ}*}hUU%EEUb\"DIâQÐ8Ø`csClŸk{×öž3»3ó5â<cïbÏîþüý<f~ÿlí—ß1¿ƒÚ»w¯\0ÈB\'»\00ól\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0b“]˜yÒCt: ?(À0ŒN§£’„ZÂlB°É!B,‹F£F£Ñf³Y­Ö¬¬,Š¢rrr~PrxxX’¤±±±`0811Áqœ^¯gYV<\0ÁNo’$	‚Àqœßï¯¬¬t¹\\eee‡Ãd2™L¦ŒŒŠ¢233ð)¿ß/IR ˆD\"‘HÄçóÝ¹sçæÍ›·nÝÊÌÌ4Ã OkvZ’$)‹‰¢h4\Z,X°bÅŠeË–Y­V–eõzý”—£n³Ù¾ÿ/Ë—/Åb~¿¿µµõòåËƒƒƒÇÑ4Í²,žŽ¨½{÷&»Žãt:ÝÒ¥K—.]ZYY™——7ã?âÞ½{W¯^½zõªN§3\Z3þ#`V¡ÅN’$E£QŸÏ÷òË/?ÿüóö±gJ^^^^^^mmíÐÐPccãgŸ}æp8ôz=Zït;=ð<o2™ªªª6oÞüä“OjüÓûúú>ýôÓŽŽŽH$b04þé\0¦¦¦&Ùu\05’$…B¡§Ÿ~úõ×_ß¸qcVV–öuÈÊÊZ¾|yyyùÄÄD?šîÔ‡®xê’ûÞÇíÝ»·¶¶Öjµ&·>EEE---4\Zˆw*C‹¢äyï¥K—þîw¿s¹\\)Ò6,X½zõƒîÝ»GÓ4²š0ÆNE¢(F£Ñ;w®^½:±éh4êõzý~8–›ýïÉ­ÙlÎÌÌt:Óy=ö(ŽãÎ;÷ŸÿüG¯×Ó4&§tÅSN4\Z¥iúÍ7ß¬­­÷³^¯·³³³««kxxx||<ÈÁŽD\"ß—1™Lr°322ìv{NNÎÂ…+++NçôÑh\\·nÓéü×¿þFû×fZìÔÂó|iiéÏþó¢¢¢i~$‰x½Þ›7ož<yòÎ;z½^^:öý:ð‡;Ìòòï“‚F@YYÙÆ].—Óé4™LÓüéõõõ===)2X\0‚B8ŽËÎÎþÃþàp8¦S>‹utt´¶¶¶´´øý~³Ùü8‹½A‡Ã™™™µµµÏ<óLUUËN«CçóùöíÛ7::Šu,©ÁN<Ï¿ùæ›óçÏŸNùöööO?ýtppçyƒÁ0S“X’$ÉÿÃÂÂÂÍ›7»Ýîé|Êãñ¼óÎ;ýýýh·SfÅSÏó‹/þõ¯ýèN¬Guuu9räèÑ£Á`pÆ—sS%7Ô>ŸïüùówïÞu:ÙÙÙêŸ²Z­K–,éëëóx<Ø\"–\nìä!\nýñœ2?±Xìüùóï½÷^oo¯Õj½·MEÑ4m4\ZûûûÛÛÛÍfsaa¡zb-Keeå\'Ÿ|‚yòT€`\'™ ¿ÿýïóóóÕK>xð`ÿþýgÎœÑétšÍB³,‹ÅZ[[{{{ËËËÕÉX,–šššöövyg˜65„I!ØÉ$ÏKÿìg?«®®V/ÖÓÓ³oß>Çc2™4^BQ”^¯¿wïÞÿû_—Ëåp8T*àp8G[[fI.;™B¡Ð/¼°yófõb×¯_ÿç?ÿÉq\\§¦ä¦ûòåË………¹¹¹*%‡‡‡»ºº0‘–DvÒD£ÑÒÒÒ·ß~[¥eE±¡¡áÀÃ$}RŠ¦éh4zæÌ½^¿hÑ\"•j»Ýî7nx½Þ¤×yÎÂ@(9DQ4›Í;vìPï¯655}øá‡6›-E†¬4MÛl¶?ü°©©I¥EQ;vì0›Í¢(jV7xZìäˆD\"ë×¯ñÅUÊ\\¹råý÷ß—\'¨5«Ø”(Šb¦³³3??ÿ‰\'žP*–““‡oÞ¼‰Õ¦I‘Bß˜¹CE§Ó¹iÓ&•2}}}ûöíKÍéeš¦9ŽÛ·o___ŸJ±M›69N4ÚI‘r_š¹`||¼®®Îl6+ðz½ï¾û®ÝnOÁTËhš¶Ûíï¾û®×ëU*c6›ëêêÆÇÇµ¬ÈRô{C°X,VUU¥²T“çù“\'OöööNs©v²°,ÛÛÛ{òäIžç•Ê¸ÝîªªªX,¦eÅ@‡`kL’$Q7nÜh±X”Ê´¶¶ž:u*-6TÆS§Nµ¶¶*°X,7nEQÞRšA°5%Â¢E‹***”\núúz‹Å’«;(Š²X,õõõ@@©LEEÅ¢E‹½ff‚­)ŽãjjjTŽ\r>yòd8NÙ¡õ£hš‡Ã\'OžT*™™év»>Â46_ 2ƒÁçŸ^éiOOOccãô9H&“©±±±§§G©ÀsÏ=\n…´¬ ØÚ‰Åbn·[it-B[[Ûøøx\Z5×2š¦ÇÇÇÛÚÚ”úÛ6›íé§ŸÆš–Òì;”ÖB¡P]]ÒÓ‘‘‘†††´˜3{”ÑhlhhQ*PWW‡F[K¶FDQÌËËSÙ>ÑÜÜ,IRZÌ™=Š¢(I’š››•\näæææååa±ŠflD£Q—Ë¥ò–ëôéÓi7º~˜Éd:}ú´ÒS‹Åâr¹¢Ñ¨–UšËlˆ¢XUU¥Ý7nƒÁ4m®eEƒÁ7nLúT¾x-¶fl-H’d³ÙT®ÝêêêÒýÿC‚ÓŽ\\yù™TVV–ÍfÃJm ØZw}(~411ÑÓÓCÀÖe†azzz&&&&}šŸŸŸF[¶ä`ÛíöIŸz½Þþþ~2‚Ýßß¯´-Än·Ûív[¶DQT¹ ‰ŒŒŒ¤ÝëëGÑ4=22òðuB?àp8lm¤ý—)-Äb1¥~¸$I·oß& Õ2š¦oß¾­4.,,Ä2mò}Jq‚ (]y\'ÂððpŠïÐœ>–e‡‡‡•– 9NìÑ‚­A”ºâ¢(0À–1388¨Ôßv8¶6l-‚ tÔ¾$I>Ÿ/­_t=Œ¢(ŸÏ§Ô·Z­¶6l-ð<¯´˜T’¤ÑÑQ’‚=::ªìÜÜ\\•ãV`!Ø\ZQú®K’ä÷ûI\n¶ßïWùe5®Ïœ…`Á ‚­•Î61ïºd*¿1#ŽÔ‡`keY¿ß?é#š¦\n\nˆY%ŠbAAÒz¿ßOØ¿b)ÁÖË²*§‹˜L&bf•$IRÙU>22‚`kÁÖÃ0Á`PéQII	1owA())QZo‰YŠ“âl-°,ëñx&}DÓô¼yóHêŠÏ›7O©+îñxÐbkÁÖÃ0J]qš¦ËËË‰9v›ã¸òòr¥`ŒŒ ÅÖ‚­š¦•ZlNg·ÛN\'ÃlI’T¶ëtº¡¡![¶hšöù|J•m6[~~>ÃlAòóóm6Û¤O#‘HºŸë–Fl-ÈÁ¾wïÞ¤OçÍ›W\\\\LF°‹‹‹çÍ›7éÓ{÷îy½^bvž§8ü•µ@Ó´×ëUéWVVjYŸÙ£ò‹x<[3ø+kDÅû÷ï+Í~Ë—H§õ0[’$ùêïIŸ\n‚ ²Of‚­ƒÁÐÖÖ¦´þÌb±¬Y³&­·4ò<¿fÍ\Z¥Àµk×ƒÆµš³l0ÓÕÕ¥t‚§N§[»vmú6Úrs½víZ¥^¯·»»SâšA°µ£×ë›šš”žæåå¹Ýî4½\'\ZºÝî¼¼<¥MMMXš¢%[;F£ñØ±cJOM&Ó†\rX–M»F[’$–e7lØ ²JüØ±ciz‘hšB°µCQ”Ùl¾té’RòòòeË–¥]£F—-[V^^®TàÒ¥Kf³o°µ„`kÊd2µµµ)M†õë×¥Q£-IÒØØØúõë•&ÆDQlkkKë‹DÓ‚­)½^ßÖÖÖÑÑ¡T ¤¤dÏž=*—i¤šH$²gÏž’’¥mmmz½^ËZ‚­)Š¢8Ž»xñ¢J{íÚµ.—+-¶…pçr¹T&Ã£ÑèÅ‹9ŽC?\\c¶ÖL&Ó—_~Ùßß¯TÀn·oß¾Ýf³¥ørQm6ÛöíÛUv}ô÷÷ùå—è‡kÁN«ÕZ__¯’Ûòòò]»v”lK’víÚ¥2g&Šb}}½ÒM	0«ì$`Y¶¿¿¿¥¥E¥Ì³Ï>»eË•3º“H>}Ë–-Ï>û¬J±–––þþ~¼¾N\n¦¦¦&Ùu˜‹(Š\Z¨¬¬TÚä¨Óé***X–½qãË²©3F•$)‰lÛ¶íÕW_UÙÑ144ôþûïG\"ìúH\nüÑ“C¾¼îÔ©S*eX–]·nÝÊ•+C¡f›R(Z¹råºuëÔ›âS§N‘tÙ`ÚA‹4z½þÛo¿-(((,,T*c0*++%Ijoo7™LÉm·åWÖ¯¼òJ]]]FF†JÉæææ£GbtDv2±,ÛÞÞ^YY™­TÆ`0TUUåää´µµQ•¬ž­ Ñhô—¿üå¦M›Ô‡vuuíß¿_¯×§ÎðaB°“‰¢¨X,vÿþýêêj³Ù¬R¬¤¤$??ÿÛo¿MÊ™û‘H$++ë7ÞxþùçÕãêóù:4::Š9³äB°“L>À´»»ûG?ú‘zÉ‚‚‚%K–Ð4­MÓ-B$Yºté¯~õ«ŠŠŠ)Ëÿõ¯½sçÖ™%‚|ÃÜ½{wll¬ººZ}¶)33ó¹çž³ÙlÃÃÃ^¯—a˜ÙëîJ’Äq\\~~þÖ­[wïÞ™™©^žçùúúú––•®hÁN	z½¾··7‰¸\\®)›âÒÒÒ%K–ÈËÎu:ÝŒÇ[ÅH$¶nÝºsçÎ§žzjÊÄb±cÇŽ;w.é3| C°S‚<+ÖÕÕuïÞ½åË—OYÞjµº\\®5kÖÈ=ùP(‹Å3á’$ñ</I’ÝnñÅßzë­ÚÚÚiÎl8pàë¯¿6HuŠ@°SEQ,ËvwwOLL”——Oy,EQV«õ©§žª©©),,´Z­<“‡ßÓ˜$IÑh4X­Ö+V¼ôÒK?ùÉOV¬XaµZ§ó?ñûýGŽ9wîœÅbAªSµwïÞd×þŸH$âv»wïÞ­t@·Ò§FGGÚÛÛ›››ÇÇÇM&Ë²r3þp÷^EI’AˆÅb‘HÄn·?ûì³n·»¨¨(;;;®\r###‡–ß±ÇñÂìC°SÏóV«õ7¿ùÍt&¢\'566600ðàÁŸÏÇÇÇåæTîi[­V‡Ã‘››[TT”•••Ø¸uëÖþýûƒÁ ÎMAvŠ’ÇÌÛ¶m{ñÅS­=ŒD\"çÏŸÿè£AÀûêÔ„1vŠ¢iZ^Iz÷îÝ¨/áÔÒýû÷:túôi†a°<e!Ø©‹¢(½^?44tüøqQóóó“ø2I’$ŸÏwüøñ¿üå/>Ÿ¯µRvw¥4I’(Šb¦©©é»ï¾KîÞìáááÁÁA‹Å‹ÅRütÀ;E‰¢FY–]¼xñ+¯¼òä“O\ZÆ¤7’<Ïûýþ³gÏž;w.Ò41vjB°SŽ$I¡Phþüù«W¯^²dÉ‚’]£I+W®466Þ¸qÃd2a°jìòýÚ¯-[¶,_¾\\eŸvŠ»uëÖG}444d±XïÔ`§\nžçM&SeeåîÝ»Ng²«Ÿ\'Nœ?Þãñ`UiŠ@°“O>™dÕªU6lX´hÑãÿ\'&&Âá0ÏóápXÞ¤õƒòpÝ`0˜L&³Ùœ™™ùø›@GGG¿þúë††ymìcþßà1!ØIÆqœ ¯¿þúªU«ç,!ÇÓÛÛ{÷îÝñññááa¿ß‡\'&&DQœ˜˜øAa›ÍFÓ´Åb±Z­6›Íáp8ÎÜÜÜâââÂÂÂ„›\\Qoß¾ýþûï÷÷÷Os©9Ì;iDQä8î™gžÙ±cÇO<ïÇÃáp0¼sçÎ…:::äó@)Š’_Qÿ£Óé\r˜üÚLúQåä’$Ñ4½xñâÚÚZ—Ëe·Û-K¼¹ \'Nœ8uêÇq8q!Yìä¢¨W_}uõêÕ‹%®Ïöõõõ÷÷_¿~½©©)‹™Íf¹ë;#-¤¼?„ã8Q«««—.]ZZZZ^^oD¯_¿þá‡öõõáöÜ¤@°“€çy–eß~ûm—ËW\Z;::\Z»ºº<Ã0³z` œpžç322.\\èv»W¬X×¿AÿøÇ?:;;±£S{¶Ö8Ž[²dÉîÝ»çÏŸ?Íø|¾k×®;vÌãñddd°,«åY¥’$Åb1Žã8ŽÛ¶mÛªU«\n\n\n¦ÿfëøñã\'Nœø~\\\0ÚÀZqíH’4>>¾víÚ={öLó…V8þæ›oŽ9ræÌyºkVÏ9›”<h7f³¹³³S¾=Óf³©ÜÅ÷°²²²¢¢¢Ï?ÿÜl6#ÛšA°5\"¿vÚ´iÓž={¦3ìE±¹¹ùðáÃ_}õU0L…Mò¦QoÞ¼yåÊ•±±±L¹›a˜üüü²²²ÎÎNÜø£[òxuçÎ[¶l™N>ß{ï½£GF\"ƒÁRaãÍóüÍ›7/\\¸àp8²³³§œZ+((¨¨¨¸~ýz(J©_‡Tö¬“$iddäµ×^ûñ<¡é\'Ÿ|òÁôôôÌÈº‘Y\"¯oáyþâÅ‹§¨¨hÊó‰ÇÂ…åÜ)û{Áž]r[½k×®—_~yÊoóÐÐÐÁƒ¿úê«X,–o€išff``àÒ¥KÙÙÙùùùêý‡Ãáv»oÜ¸‡‘íY…`Ï\"y>yûöíë×¯Ÿò{ÜÒÒòÎ;ïšÍæ4úÒËHyžollÔétÅÅÅê£n‡ÃQZZzáÂy«¹VÕœsìYkjjvíÚ5eüìÙ³E1-\ZêGÑ4m0®]»6::ºhÑ\"õCÚœNçüùóÏœ9ƒyòÙƒ`Ïžçkkkßzë-õæ78pàã?¶Z­iÔP?Juœ8qÂív;•Â………N§óêÕ«qÓ‡`ÏŠX,V\\\\ü‹_üBýBŸÏwôèÑ.Øl62¾ß,ËRÕÞÞ^VV¦r7°N§+((ÝÝÝØ\n6Ò¸‰HYò+ë×^{M}m™×ëý÷¿ÿýÍ7ß¤Î	¤3‚eY¿ßÿ÷¿ÿýêÕ«*ÅŒFãŽ;ìv{,Ó¬nsZì&IR8~ã7žyæ•b^¯÷OúS___ª>#hšŽÅbŸ}öYuuunn®R1½^_]]ÝÔÔ$o‰Ñ²†ÄC‹=Ã8Ž[»v­úe×ápøÐ¡C^¯—ÈTËhšÎÉÉ9tèP¿J±¢¢¢mÛ¶E£ÑäÀJ{&	‚PPP°nÝ:•qc(:räÈµk×NµŒaŸÏ÷·¿ýíþýû*Å^xá…åË—ó<¯YÅæ{&ºººüü|•2Ÿ~úé_|1Gî»bYv||üÏþs(R*c0¶mÛ&\Zí„`ÏŽãª««Ýn·J™–––>ø á{ðÒ‘^¯ihhPÉmnnîŽ;=Â	†É³™!‚Ýnÿío«rnYggçÁƒçà9žz½¾££Ãét–””(•ÉÏÏ\Z\Z’Ð²n¤B‹=3AX¿~½ÊÖüñÜÜÛDQ”Ùl>räHWW—R™ÌÌÌ—^z‰atÈgÄœû’ÍArrrV®\\©Ò744tvvÎ‘¡õ£hšáÈ‘#*¹u»Ý¥¥¥x­=#ì7oÞl³Ù”\n\\¾|ùÔ©Sf³YËZ¥\Z½^ßÝÝ}üøq¥EíØ±#hY+R!ØKE§Ó¹|ùr¥gÏžM…+õ’Îh4655\r*(++«©©‰F£ZÖŠHöã\nƒ?ýéOUN;ºtéÒÕ«WÓtÛÖÌbÆãñ|ñÅ*·ðnÝº¯¾‚ýXb±XUUUuuµRÑÑÑúúú9Þ	˜Ñhüä“Onß¾­T ¨¨hÅŠh´‚ýXAxúé§U¶(~þùçØ™øÙÙÙŸ}ö™ÒS‹Å²dÉŠ¢Ðh?;q’$Y,–¥K—*¼xñ\"®Âø–e»ººTö~ÕÖÖfee!ØÁN\\,+//WºÅZÅ‹/ŽÏÁ×ê(Šây¾¹¹9‰LZÀh4ÖÖÖbõøãÀw.q~¿ÝºuJOGGG/\\¸0g_\\«3­­­G©ÀªU«ÆÇÇµ¬aì‰¢XTTTVV¦T ¥¥åÁƒh®\'%7ÚgÏžU*ðÄO¬\\¹‹U†¯]‚8Ž{á…T\Zä“\'Ob2\\…ÑhlhhPê†eË–)=…)!Ø‰ï‘^¸p¡Rƒ|ëÖ­û÷ï£¹VAQ”ÑhlmmU*P\\\\œ‘‘)´Äà›—QËÊÊTn«?þü”7c€Édºté’ÒÓ¼¼¼…\n‚ e•ˆ`\'B>„Ti/—Ïç»{÷.¶N‰a˜¡¡¡¾¾¾IŸÚl¶¼¼<;1v\"$I*((PzÚÛÛ;44„~ø”hšöz½*sã%%%*‹OA¾|‰E±¼¼|ÒG‚ Ü¹s‡çy¬6›Q¿ýö[¥WÖr°1ÌN\0‚7ùF®Lú4\nuwwcËÇ4éõú®®.¥Ùï¼¼<‹Å‚`\'\0ÁŽ› .—Kéi$¹uëØÓDÓtWWW8V*€ù³Ä Øq‹F£UUUJO¿ûî;ŽãÐŸ&ùÕÙÙ©T`Ñ¢EX¦’\0;n‚ ¨œmvóæMìúˆ‹Á`P	vAA¶p&\0ÁŽÏó*°;::pË\\\\X–íîîVzZZZŠ‰ñ Øñ‘$);;[¥§=00€]q¡iú»ï¾Sy:oÞ<d;^ø\nÆGÅììl¥¹1ŸÏ\'IØñ2£££“>b&\'\'ãñB°ã#Šâ¼yó”:Û÷ïßG?<ò4¥G‡-v¼ìøÈg’*¥wllÍu(ŠRºÜ‹eÙììl;^v|$I2›ÍJ£è±±1°@Ó´ÏçSz¤×ëÑ¾…ñ‘$Éd2)¥K)¦ô§c&##-v¼ìøÈ/±•‚=11®x(ŠRºj“¢¨ììlü‹/;>ê“ÞÑhÁN\0EQ*«PÐO\0‚7•yo,O˜ÊŸ/\Z€?Y|,Ë™3gnÝºõè¨a˜ŽŽìëJ€|öáÃ‡írÓ4=44d±X’R±ôEíÝ»7ÙuH3‚ (mKÐëõ˜OŒ(ŠJ½q–eÑŠZì¸1ƒïÙŒ£i\Z›gfš\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°ôÍª×BJèÇ\0\0\0\0IEND®B`‚'),('1129506976','Cedula de Ciudadania','ASHLEY','DEFORT','3215795146','ashley@gmail.com','7c4a8d09ca3762af61e59520943dc26494f8941b','Calle X #11X-22','ADMIN','ÿØÿà\0JFIF\0\0\0\0\0ÿÛ\0C\0	\n\n			\n\n		\r\r\nÿÛ\0C	ÿÀ\0_g\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0	ÿÄ\0T\0\n\0\0!1AÑ\"QVWaq”2‘“±7BSt#36Rr¡Á	$%4CTU²bcsu&F‚ƒ’•¢ÓÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\0@\0	\0\0\0!1Sq‘\"AQa#2T¡Ñ5’Á4Rr±Bá3E$¢ÒðÿÚ\0\0\0?\0µ4\0@\0@\0@\0@\0@t/WÛ>9o’ë|¸ÁEIÝòÌðÖ…Õ<ñS1d•Èˆž*tTTÃI\ZË;‘­O#¦ñÑŽXç’Ý€ZÍÖxÉcç›É‹;HëP;¦;‚VQ·œ¾k¨­/<¥SÓ9c o=SÅu\Z>óÆ¾º×Î_k¿RÛ#\'”qÐSË·Åñ•›Ý¤\\ãz575ÚšŽQo’»8¤F\'øµÚoòÇâ+ÓÖúš/ÿ\0Ét~3½m¿ú·ÿ\0Éçííÿ\0ú3ÿ\0É‘cœrë\r²F›ô”W–Ì>š(	ý¶í¦ÇW(—ßdÿ\0Ñý!¤å&ï\nûüŸú\"¤$n”ñ…§¹é†Û}”XîoÛ9Ú|ÁÅM­8ÆŠá”swë¨°ìxúßsÊ9×Ù¿×W}Å,SÄÙ ‘²Fð×4îó‚¥è¨äÍ	ã\\ŽNsuk“€ \0€ \0€ \0€ \0€ \0€ \0€ \0€ \0€ Ô=@Ç´ÓªÊ2:¦ÅONß!›ùR¿± {JðÜnÛ Z‰×$O©ºÝiìôÎª¨\\‘>«äVö³ëÞa«÷™¥¯¬’šÒÇMCˆcY¿.–ßXªBõ©¼JªõÉžk¦!Äõ—ù•d\\™àÔòõ5‚À‘€ A-!Í$ÌØ¹9ÔI.¸­½`µôØ®qY%n?+„m™ç¥%1=»õ–ûß\râÉh”õkœ~~(X¸KÍl‘´µ«Î‰||Sþ‰÷A_Gt¢†áAPÉéêÙ#‘‡pæ‘¸*àŽFÊÔ{4RùŠVLÄ’5ÍJ…öv\0@\0@\0@\0@\0@\0@\0@\0@ÃœÖ´¹Ä\0äžÄÔrÒWZËU¨ùÔÖ;}VöK;Ì0µ§“äœãçæ%‹oN¹U¬L^ã4&ó]qÎ uÞ¹`}Û4&ÿ\0D(‰\0€ kðA¬õeÒûõ_„’™mÎqò‹74ïæV–½:DZ	—J|%ÏÉÆ!t¨¶É×JioòKõd–à@\0@\0@\0@\0@\0@\0@\0@\0@\ZßˆLÀázO}ºC7‚©’™ÐÓ¸ˆy‹	ˆk:ºItå’ÜU_ÕÖ©eEÉU2MåZM,•>yœ]$Ž/sY$îJ ªåÍM`s•Ê®]j|.€ \0€ 21Ê+pìîÍ~¡œÄè*ã õÆ\\‡Ø²º§QÕÇ3,•8K5kíõÑNÅË%N%±Úî]­Ô×:c¼UQ6Va­‡ŠD™‰#u)µPJÙãl­Ô©™Ú]‡h@\0@\0@\0@\0@\0@\0@\0@\0@F®<ª&‡Iè#‰å­šæÆ¿nÑÑ\'eÇ®VÛš‰ââ¸å5êÛS<\\…*t Â\0€ \0€ 9´‡4ìAÜÉÎ¢Øt^yjt£žgtžû\\ÇÎz+a¬ŽW[¡UþÔ6§9_j§sµóPÍPÌ„\0@\0@\0@\0@\0@\0@\0@\0@kãÂ–z\'¡’&6›ý»DÔ±]nj§ƒŠã”Ö9Ö¦ªx9\nýTáA„\0@\0@rÖ¹îhÜ¸ìœ®Q3Ðr‰šä…±hÅ<´šSŠÓNÞŒ‘Úàk‡˜ôVÃYZ¬·ÂÕþÔ6§1Yj§kµ£PÌÖPÌ„\0@\0@\0@\0@\0@\0@\0@\0@½×¬5ÙÆ–_l°Cáj¿&t”ÍÛç\0ä°×ú.o’$M9hÞGñ=¿¬­rÂÔÍÙf›Ê¯¨§–’¢ZYÛÑ’º7·Ìàv#íZþæ«­]hjóÚ¬rµÚÐü×Éò\0@[¥XvkŸÙl]-ToÕ\\Ø²6šGÖÖG<Õ8k%î5ñA\Zgš§Ø-Ô0[()íÔÍÚ*hÛ°\r–ÃÇ\ZDÄcu!µ0ÄØcHÛ©#²¾ÎÀ€ \0€ \0€ \0€ \0€ \0€ \0€ \0€ \0€à€An\"ÕÅÎ‹Ôéök.Mk¥ÿ\0b^^dacyE)úÀûÉT®/²ºßT³ÆÇý×¬w‡j­Z˜“Ý¿Nåñ#ú‡€ \0€ \'Ú)Ub¢—Rò*OSXßoc†Îdgë8ûÕ¯‚,Ž§j×LšWáÜ]¼œá×S1nU	’»áÜKEb°@\0@\0@\0@\0@\0@\0@\0@\0@?œàøþ¡ãuXÆIFÙé*šG1ÍŽìpö…ã®¡†ãÁ:fŠx.VÚ{­;©ªS6¯ÿ\0Ù•Ë­ü:åúAršwÓ>¶Æ÷“lm$5›òóIß0åMêª™Çà¿s]ñ&«°H®TçGàäþMF£„L éŒsÜÆ—9Ç`\0Ü’¹DÍrC”EUÉ	AÃ‡	wlªº—0Ô*7RYb\"H©$IPG1¸ìjžá¼#%SÒ¦µ2bjO,Ü#e®{jî	”i¥ÅèÔ”´ô4ÑQÒBØ¡‚8ØÑ°k@Øm±¨Ö¦H…äÆ6&£™\"²ú>Â\0€ \0€ \0€ \0€ \0€ \0€ \0€ \0€ \0€ ­Ê×n¼ÑÉoºÐÃWM(ÙñLÀæ»àW\\±2f«$LÑ|Î©¡Ž¡‹­EEðR8êgFS,—6µö:¹^ö»wÄO˜7±Bnx\Z–©UôËÌ_¡]Þ98¢­U’ÞÍËú¡¡2	µ†ÙPc³RÒÜâ`öÌØ÷âTB£\\¢vQ\"97äA*ù:»Âì¡DzoÈñÿ\0‘Þ½z)Í³½y¿ÝöT<€/»/ªf\'À¶¤ÝÞß¤•ô–vvóð¤‚ÈÒ`Jé—ßª7êe¨y4¹N¿ü—#>¤’ÒÞ´×N¼}Uç‹£\0éOSå38aäâÕ„¨m¹=ÉÎšý‹\ZÉ­¶œ¤syïó]\\\rÖÆ2668Ú\ZÖ€`”\"\"&HLÑ$>—\'!\0@\0@\0@\0@\0@\0@\0@\0@\0@\0@\0@\0@\0@\0@\0@\0@Ð¼ßlØõ®Ë5\r3zåž@Æÿ\0Šêšx©ÛÏ•È‰êtTTÃHÏi;‘©æ¦ŒÌxÕÒlrI¨­sU]*â;5ðGÿ\0©Dëqµº™U±ª¹S‡påÕHªÈ•^äòMM[sÿ\0H5Èô£µ`tÀÊIj¸>å—”\'êŽâEæåRMQ@Ÿª˜õo™ýD—¡§öÃ‰ÿ\0%ã~>¬rdÖ\"	9N¯srlhŠui8ëÔ¨\'l•Ú9˜:Øyoþ­˜ò¹«›šŠtÇÊ]É®ÍÍECÛ£ÿ\0HW¥Õx]ì?³áœÝ¾À½Lå¡½/ê{cåJ©«ß…õ3ŒgŒ>±ÌnQŽÔÐõŒÉ²ÊÒãúgÿ\0PÅní&n•\nI?ª[»I¿0MYÀõ••µú\n‡¼t¼œ(Öõ©…Þ’äÞu;Ñ}<Iå²ûAwj:–D_O`²F\\Æu#.—Ân¹d4B­öèL¢îˆ>­×†åX´¯¨DÏššŒmÞ½m”RUµ¹«S<ˆ›ã\n½úº¢ù·÷*ë´9v	ÅJ§µYþ]8©ÇŒ*÷êê‡æßÜ¢K±N*;UŸåÓŠUïÕÕÍ¿¹;D—bœTv«?Ë§0«ß«ª›rv‰.Å8¨íV—N*<aW¿WT?6þäí]ŠqQÚ¬ÿ\0.œTxÂ¯~®¨~mýÉÚ$»â£µYþ]8¨ñ…^ý]PüÛû“´Iv)ÅGj³üºqSzpï¯•ºáGqª«ÇbµþBà\0ŽRðÿ\0µKpåý÷Æ¹Îg7\"q„ñCñ#çÇÌæúægº™˜Ë€aL¶\nÖ>Ý	”B]ÑÛ³u—¹Ö­¾•õ(™óSQ¼\\×E%[[ÎV¦y;Æ{õuCóoîUßh’ìSŠ•Wj³üºqQã\n½úº¡ù·÷\'h’ìSŠŽÕgùtâ£Æ{õuCóoîNÑ%Ø§ªÏòéÅM£<gÚµ)n1”Ù)ìO©RÌÙË˜÷ÿ\0eÄõ,Í—\ZÇr¨öFg©s3Ø{”(®Õ]\Z©‰\Z®¥ÏFd˜;‚§E”r€ \"þ³q‰tÒ¼ò»§Âé«™I¶ÓÉPæoì\nzÆRZªÝLØ‘rñÌ¬±?–É^ê6ÂŽDñÌÁ¼aW¿WT?6þå‰í]ŠqS	Ú¬ÿ\0.œTúgúB/o{[ú:¢æ@åVýÿ\0Êr‡*®^Á8œ§*“ªåÑÓŠ“¼? Çè/R@!ul˜ÆýÆû+.–n‘eTË4Ì·¨ªª“*eÎLÏQwž€ 4\'<T[4jåK`µZ¢¼]$¢\'JZØYÙ¹¾ÅÄ8®;+ÒÛÏ¡Å8Ú,?#iâg=ë­3Ô†¡ñ…^ý]PüÛû”o´Iv)ÅH—j³üºqQã\n½úº¡ù·÷\'h’ìSŠŽÕgùtâ§nÕþJÉî4Ð]0*X)$‘­šXêœç1¤ó »\"å	Îz$¢\'Ž“¶TÞé\ZÙ`DnzW5&’óAZio6º†OKWeì;‚VT2¢4–5Í·)ª#ª‰³D¹µÉ™Þ]§x@\0@y¹ö‡±Wd\'ô)h!tòŸ3Bè©”±:i553<õu,£Õ|-LÔ¬miÖü«V²*ªšÚùcµ6BÚZF8ˆÃäHí\'­Q»åEÞus—¹àž´b,GU}¨sžì™àž\ZÑ`ˆÙúAÕ32žž\'Ë,Ž\rc7.\'¨\0¾šÕró[¬úkUêjfªmÛ\n\Z×¢eÂYôðJÀøÌÏ\r.ÙØ¤tøJéPÞzG’/™-¥À÷ª¦$‰H¾gv§ƒ½p‚K8Éœ?a²·r»]ƒn­LÑ™þ§sðí©šGŸêjÜ«\nÊ0šómÉìÕŽÉÈûQX\nº\ZŠó\'jµHÅuºªÝ\'³©bµ}O\ry	êãy=÷ºÃyÇî3QÕBààøÜFû£çÑMU-‰,.ÉPõQÖOA*MNåk“È³ÍÔæj®Ûò9#¬\rð5QïÔöòßã¶êù°]íDÙ×âÔ¦Ìa‹Ê^íì¨_‹RïAÄ\'êw&þþ!1å’î«òy÷^zÏ½kúš¼§ƒƒ±CA[s©e¾–J‰ääØãnî?÷o•ÜÖ&jvGæw24ÍOgô}›ú-rû‚½]]W³^³ª«vNà?GÙ¿¢×/¸)ÕÕ{5à:ª·dîô}›ú-rû‚]W³^ª«vNà?GÙ¿¢×/¸)ÕÕ{5à:ª·dîÈàRÅz²Ú/m»Û*)ÞD¬-\'˜ó«3Á,Éí\Z©¼¸94¦šž}«U7›ˆÏÔÞKü#¿&ÄŸ–K¸˜bßÉçÜUš \r_î)e‚VMŽd‘æ¹§bê!rŠ­\\Ðúk•«În²wpŸÄ¬9e>žæU}½3)jewûÃ{?ÚVÞÄÉVÄ¢ª^új_2òÀØÁ+˜–úÅ÷‰©WÇþÉJ§åž«Æë¾ñîoà¨ìcù«ÍpÇßÈi5!géOþñ÷Ûø¯¦üH}3âBÛ´ãú‰cþ\n/ûVÅÛ?¤rahþ†/ñC$^ã\"&³j¯I°š¼’ºF\ZŽ‰Ž’\"yÉ)êåæe‰½]c´ÒºwëðOSˆoQXèRýz‘<Ô«¬«&ºæúÜŽõPéª«¥t¯$ï¶ç}‡°*®ªJÉ<«šªšÇ[Y-|î¨™ss—3É^cÈÂà§\\ÛI1ÒÜ–¬ˆäÝÖÙ^îM=±üwä¬¬}æ/WÎº?ãö-ÞNñ/³wUÔ®…øWø&¢´K˜ \0€ 0Mv¢©¸èþ[EG’i­’µdòX‹ó%¶f7ZµL&ÒÚ*ÄÍUªU3ØèÞèÞÒ×4Aëkâ¦K’š´¨¨¹)ò¸8;ö+Íf=y£¾[ËEMÍž\"á¸é4î7]ÐLêy[+5¢æwÓT>’fÏ¶®hLŒ{K©[}ŽËÍho…¡&“ç «6ƒÆ­Ê±™/¡p[9O‰[Í¯%ói¸,UhÅôG¾S\r	uTžŽÞõ$§ÅvÊŒ½æ[Éu.7³TåïQ¹ùŸ†¦cÚ;Ä%†+,™•_Í–:ªIdøyöñs§¶b(R%•4.´Ë3âñIhÅP$+2h\\óL³5ãx\0ÓÇ€æf·—ÌÈÊÃ\'\'ÔKªW}úr[o])3¾‡>/Ý?ôÎ÷÷q§gÔ{W}{,·íô7>Žhå›FlSX¬·JºØ¦“ÂÔl>Í”¢ÍfŠË\nÃ•Q|ÉŽÃðáè\\®EÓ¤üø„ýNäßÁŸÄ/œEùd»œUù<ûŠ¯=gÞµýM^S…ÁÁ´¸j¾XñÝ^²Ýr+…=2$ÓýF»TƒÏ5Ê9&TF§Š’|S%Þ)jjkUÔXéÏC½?Çþôw+‡¯m[f—çâ[&ÝœGéÏC½?Çþôw\'^Ú¶Í‰l›vq§=ôÿ\0ûÑÜ{jÛ4~%²mÙÄ~œô;ÓüïGruí«lÑø–É·g9µÖ[nT\\íC5%S‘KÝ´õìYhŸ¬I#\\Ñudfà’)£I!TV®”Tñ0#?Sy/ðŽü~Y.ã‹\'ŸqVj€5| =‹N)|¾[kn–ª\'ÔEo)Ãå­óíæ^˜i%ž7I\ZfÖ{ ¡ž¦7KsFë<uæ<gfÝq­´ÖÃr·T¾ž¦âH¤aÙÍpê!vG#áz=‹’¡Ù¯é$k’¦¥,7…î\"è5BÏ-UòZ(öpyò–ÚoœùÕÍ…±.‘%<ËïSêlÅ±Þ¡JZ…Êf§ô$˜“ÒµxÁýwÞ=ÍüŒ5y®ûó¹\r&¢¤,ý)ÿ\0Þ\"þûôß‰¦|H[vœQ,ÁEÿ\0jØ»gô‘îCl-ÐÅþ(d‹ÜdN½Â¾ŽÕE=ÆáPÈ)©˜d–GšÖŽ²WÄ’6&+Þ¹\"rÊÈ²H¹\"kR´8”ÖŠ½[Íæu-DŸ™mÎt4QÈìv/øì¨¼MzuÞ©y«Ün„ûšÝ‹ñïµª¬_vÝ\rOäÔ\n6DM«Ãž’Uê¾KE$$Úèœ\'­\'¢?cÞT‡\rÚv¬F*wJ’œ%b}ò½¬Tî7K¾ÆIÅŽ‰C¥™d7+\r1eŠæÁàFßÑÈ”\n÷bÛ\ZZªHSÝ»Vó#ŽpâY*ÒHÝ;W¢øšD)ÚµÜë,×\Zk­¾gESI+e‰í;àw²)]ÒF.JšNØ&}<–5ÉQsBÎø{Õû~®`´·Ò¢\nè‰òƒÀ§·˜«ãÞw¤GçßM\nŸÉ²øVýö…²gßn‡\'¯ŸêmŸ$á\0@Ä±E<O†f5ñ¼¹®‚báQ™)ÃšŽNkµ‹^ø4¾Ó]ê²3„UÑT½ÓKD]³á\'™èùÆê«¿à¹[\"ÔP&m]*žE)Š9>’ºªÚ™µt«|·~ó‰ä¸ôÏ‚õc­£td‚eÍnÛ(ô“Ó.R±SzE\rM\"«fb·/4<•æ<\0@vin7\n½uE9ëþjW7ð+í’>?…UÆK$•7)–ã:Ñ©˜œ­–Ñ–×‚ÃÒ\ršWH?þŠÉRÞ«é8ä_×I–£Ä7*ÎWõ\\É¦œvÞé&Š‡Q­Œ¬‰çgÖ@:.`óôGZ˜Û1ä¬TeksO4\'Ö~S\'Q—ó“Í>ÄÆÄ²ûqc§ÈqºöUQÔ·¤×4óÂ;\n²èë!®‰&sj–ý|(¢™ÙµLOˆOÔîMüüBÇâ/Ë%Üb±Wäóî*¼õŸz×õ5yN\0@kº\Z4‡\r\0ÍPm·÷VÂØ¿-ƒüPÚŒ7ùE>_Ø‡Ägêo%þß‚éÄŸ–K¸óâßÉçÜUš \r_	UÀ…-5~E}¡¬“A=1d‘¼nó+1²M#™¢¡irdÆËQ+™¢¡‹ñGÃ½f˜Þ¤ÉìI=‚á+Ÿä3•3‰ß¢|ÃÌ¼«:×*ÔB™Æï¡‹Æ¸Qöi–ªÎ\'/>¨i={ »â×ŠkíŽ¶JZÚG‡Å#Ä7¹wÓÔIK*Mää=µRÑLÙàvNMJYºýjÖr:zÙã‡ £`m\\á?ñ´{UÝ‡1w˜¹HšÓù6/	âˆ¯ôè×®R·Zyú¡8ÁýwÞ=ÍüiŒ5yPcïÎä4šŠ³ô§ÿ\0x‹ûíüWÓ~$>™ñ!mÚqýD±ÿ\0ý«bíŸÒG¹\r°´Cø¡’/q‘!ï\Zzð)¡:WŒU;\';œÌwÕºÿ\05Zãk÷5:¾Óÿ\0%þ\n‹”LMÌN«¦]+ñ/ðBµWÉØ ¡ª¹ÖÃo¢óOPñlcw$“æ_qÆé\\ŒbfªvE¦zFÄÍT³Ž´‚›I0\Zz£iºW†ÔVÉ·>‘›ð\n÷ÃvvÚ(Ñ‹ñ»J›+„¬-±P#ãv—î²éµ»T°;†5[]3£2Ò¿o)²´nÝfç’õÞ­ŒºÒ:&Ÿ\rç¿Z#½P¾™é§Zo*Ë ±\\±›Í]†ïNè*è¥1JÇ¢Qéet2&J†¯ÕSIG3 ™2sW%<õÒyÍŸÃö¯\\4‹:¦¹µîu²­Í†ºù9‡·á¾ë=‡¯³Õ¤Ÿñ]\n„›_¤°×6TøC“Ð³»EÖ†ùl¦»Ûgdôµq‰b‘§pæ•|Ã+\'$sE6^	ÙSfsj¦hwaÜáfY¥ƒ²Kd•bšŠ#³žFû/%ml4,Ó®MCÃp¸Ál…j*W&¡¬ÿ\0•æˆzPßÿ\0°_Œ-[B7øòÉµ<»ß|6ä‘ø+õusvÛiàér^yñ5Ž¥2™QÛÐòÔâü9X™Nävô<F™ð¹®òÕAˆR² )Eð}ròCl°_•R™2TòÐx)ìø_+›H™*kæè<Û÷\0¸tÛœw$­ƒ—UAél~tTrL¿ø^©¼óÕr_FïéäTÞk\\‡€ÍB¶Ç$ö{ý¾âÑÍ±µ®kÏÚ°u¶$U‰èâ7WÉÂWC\";ÓÄÑYÎ—ç:qRÚl¿© éŸ!ï±ÞâJ¾×Wmw6¥ŠÒr²×ZÍ«Zb«bÂRð)¨Jâ£’gICró±Ž;ˆÜÁ¹ÛÍ¾ê€îGV´j½×&|?“K¤±VºWºäUÝ‘+8„ýNäßÁŸÄ+~Y.âÓÅ_“Ï¸ªóÖ}ë_ÔÕå8\\Ap»6©¶œ^þ$4UoèÈv+5`¢Šá^Êy¾$bÝ\rÒç,ÿ\0‰©ü‰ôgþZ»ïGr´Zü—‰svufò^#ùèÏüµwÞŽäükò^#³«7’ñÈŸFå«¾ôw\'à‹_’ñY¼—‰Ã¸&Ñ—?\'¯ö‰Gr.µù/¼œÙ—Áx›»°Ðâö*zØ)mð6CŽç¢Ñ°ÝJi©ÙKaSS$&´”Ì¢”ñ|-LÁøŒýMä¿Â;ðX¬Iùd»Œ&-üž}ÅYª\0Õð€•üÿ\0[/úä¬>Oÿ\0¨“qjr_ý\\›‰«‘ãÖœªËW`½Ò²¢Ž²3Œpß‘íÕhÔÓÇWÃ*fÕ.jºH«¡u<é›]¬­^ ô*í£™D¬Š)&±U¼ºŠ§möoö|êÄ6,Õ’g\ZêS\\1V\Z—Õ*\"gü+ü)©TtŠ›_4û%£Ê,.Š¦’@ý·ò^;Z|á{(+¥·NÚˆW%Cßl¸Ïj©mU:ä¨{ZÇ¨qêŽa.`)&’®6‰bþË€Ø¯Uæâ—J•©Ë%SÛˆ.©z¬ZÌ²UÖ†\n±&ý)ÿ\0Þ\"þûôß‰¦|H[vœQ,ÁEÿ\0jØ»gô‘îCl-ÐÅþ(b|Ak\ràõ/Ãt«i††ü§<­ðëXüCyež‘_Ÿ}t\"¬UŽÃD²gß]\rB±¯7zûõÒªót¨|õu’e‘ÇrçCÍ3ê$Yd\\ÕMh¨žJ©]4«›œ¹©Ò]GIíá¹]Ã	È©2k\\PIUDîœBfô›¿Ÿeê¢«}íž=iæ{mõÒ[jS\'9º³7!ãcY‰ßòšìõ&üotóNÃ´[ÏšpËcY¿æ¨~è÷§ã{§šp¢Þ|Ó©süîí¨¹™-ò\ZfVL6•Ð3¢|çÚ£·\nù.S,ò¢s—ÈŠ].rÝª¦tNrëÈÆ—„Æ„Ëà›\\zô¯#¬;Ò¶I#¹ü ¬ì}ÿ\0×Î¿ãö.N±\'þ®¥Å‚e«4¸‚\0€ 5ŸxuVm¤×Ë]n’®841´n^áØ°XŽÕÖé#f¼³B5‹mî¸Ú¥Š=.DÍ\n¸šiæ}<ñ–I‹×\r‹H;Uæ«UQušÆæ«Zíh|.“bè–³^t_\'7Ëu,utó³ÁTS¼ìÓÛ¿œ,ÝŽõ-–jÄÍZ9ˆfÃÕ>Þ4ÍB¡-íyi|ô­uêÙu¦¨ÛÊlPôÛ¿Ú¬hqí›ïZ¨¾ˆ[r›ls}ó\\‹è™ž•WÚ3NÐciœæô€m7W°ùÜüukn®rþ‡¥ü¥Y›«œ¿¡¸âŠ-aµ³³XÙMlŽfÍáåÏ8´òÀ¡x“¥æ>2nyçâW¸·\Z%þ$¥…™1<×Y”0¯ÂVð+¦÷Z¼¶£Qj)Ÿ/§ïiG<lz>}•…€í²>¥k\\ÔL“×2ÓäÒÑ+êÖâäÉ­EDõÌ”œB~§roàÏâÿ\0~Y.âÏÅ_“Ï¸ªóÖ}ë_ÔÕå8\\†”gïÓ,Þß˜2…µf…Ý/ã°rÉZnYVÚ”Lòð2ö;¢Ù«YXçs|	1ã¨ìÁ¡ûçw©×hNØýK\'µGl‰ÇŒ§ÐX~ùÝéÚ¶)Äv¨í‚q0ZŸAaûçw§hNØ§Ú£¶	ÄxÁj}‡ïÞ¡;bœGjŽØ\'ah‡Sjî`1i1ˆ¨C™Ó6BJÌØñjÞ*z:Ç‘ Ã˜åoÕbæú›ˆÏÔÞKü#¿šÄŸ–K¸bßÉçÜUš \r_	_À/õ²ñÿ\0¡þJÃäÿ\0ú‰7§%ÿ\0ÕÉ¸œêØ.óÔM>Çõ/ªÆr\ZVÉí>\rûyQ?nNÁq·Cs`™4/ÐÆ]­T÷ŠgST&h¿Eó+\'W´£!Ò<²|zõŒ$—ÒÔäMaÏçTMâÓ5¢¡a•4x/š\ZÕ~±ÔXªÖždÑà¾\n†±& ÒŸýâ/ï·ñ_MøúgÄ…¯b÷Ûf3¥–Ûíâ¥°RQÛY,\'°7}‡µl-,ñÒÛÙ4«’#M¨¢©ŽŽÖÉæ\\šÖ¢¯¹uãVëõ{9ª¾H÷2ßŒ4PïÉ±ƒÉÛyÈT¥úîûÅZÊ¿\nhDô5ß_d¿W:uøCSÐÖëGOoÃ²êõƒ\Z }]d.hê¬•ë£¢š¾T†ÍÇ¶‚ßQs™ ¦nnSb%MfôißiîYŸÂ—?ì$?‚/;1ü•5›Ñ§}§¹?\n\\ÿ\0°~¼ìÇòTÖoFöžäü)sþÁø\"ó³…Mf<¾;í=ÉøRçýƒðEçfkŒ³¾á7¹ñüŠ‰ôµmÒc‡aíWI-«É“Ž×PÏn™iê“ñ×”ñÛ-âáÝioVª‡AWG+eŠFõ‡»`™ôò$±®JšPî§¨’–VÍäæ®hYö‚jå»W0jk¼s0\\iš!­‡)¯n‘Ý·WÕ‚îË½\"H‹ÞM\n†Ìá‹ìwÚÊ‹ßMOSe¬á$‚¸(Ó®œÙsë„ÙFS¦ç6ïžßæ¦wœÙ*}Á±\\µ«ÍrëO+lK€!ºHµ4KÌzëO\"¦WÃ.°b/wåØ¼³E¹èINàðáçä«ê¼1r£^üy§¡WW`ë½ûÈ³O4Ò`uxvYC#âªÆ®q¹‡goHý‡Çm–!ôu\\\ZðSû}\\k“ãr~Šu¿0_èµÿ\0,þåñÑæþÅà§WEŸû‚Ìßú-Ë?¹:<ßØ¼tYÿ\0±x)Ù¥Ãòº×5”¸ÕÎBî­©±øí²ûmCô65à§k(*¤\\›—ôS9Ç8iÖ<Ÿ¢ëv%3Xî})œ#\0|VZ›Üê¾øè3t˜>ñ[ÿ\0Ž%ýtLø‚	à¹ê=àOÙÎ §Ý§1r˜Úð5RJ×gè„úÍÉ“Zä–âüÓûSîKK†ÑŒÚà³Xè\"¤£¦hdqFÐ\0öûÕ‹<t±¤Q&MBÖ¦¥†Ž$†óZžb:ïCYqÒlŽŠ‚óÏ-!k#`Ü¸î:‚Æß£t¶éXÄÍUN&óZ¦dišª¡ú/ÔOÿ\0Üúÿ\0påFu]nÍx\ZÝÔ×\r‹¸Ñv ú#sû‡\'UVì×ÇSWì]À~‹µÑŸÜ9:ª·f¼SWì]À~‹µÑŸÜ9:ª·f¼SWì]À~‹µÑŸÜ9:ª·f¼SWì]À~‹µÑŸÜ9:ª·f¼SWì]À~‹µÑŸÜ9:ª·f¼SWì]ÀÞœa9mUYYw°VR@! É,E£u,Á´50\\9Ò1Q2\'8ÝWMtçË\Z¢eâ„¶×ú\nËž’d4VúwÏQ-+šÈØ7.;vcbÝ-ºV13UB×Å1>kLÌ3UBµ˜j€#¹óÿ\0Èr£z®³f¼\roêjý‹¸þ‹µÑŸÜ9:ª·f¼SWì]À“œbY.?”]¦½Ùjè£|;5ÓFZ	ÛÚ§˜\ZŽzz‡¬¬TÑâYœ›ÐÔÒÕH³1Z™x“EYåÈ\Z÷Z´‚Å¬œÖ[Œ,elM/£©Êã¨oæ%a¯vxoëÓ½à¾FX ¿Ò,2\'y5/’•Ë‘h¦£ã—ª»,øÅtÏ¥‘Ìð‘D\\×€zÁT¥M’ºšWD±ªåèk½^¸ÒLè]®K­ó¿EÚƒèÏîº:ª·f¼7SWì]À~‹µÑŸÜ9:ª·f¼SWì]ÀûƒL5³ÄN#s[à;Î¹m®±=Úð>™f¯ç\'ºwGq–jë²iv-ŽÜ…%$N¸É.þqá£fƒæëSlGW[54vúv/59Ú5–&,®¸TREk¥ÜÔDç.ZÔß¢íAôFç÷PŽª­Ù¯¹êjý‹¸¥ú‚?ùFç÷Nª­Ù¯Ô×\r‹¸wƒ~ŒÉ—ßèŒW›¦ík$o•C³Ùºµ0m‘h Z™“\'»è…×€0êÛ)–®¡¹Hÿ\0¢AMË /q¢5…¢Ÿ:Æ¨=Ö‡hgŠ&îéc=¾Ò6P,icZÈÒ®Íé¡}P¬¹BÃŽ¸D•ÔÍÍíÐ¨ž(C1¥ú‚Fã¹ýÃ•cÕu›5àSM_±wú.ÔDnpäêªÝšðM_±wiðñqÕ\r#Î©k)tu®½í‚¶/àO ï‚aÙ+ìõhïf¼ÇhTÈ”aI®v*æ¿Ù;˜íL¾¿¡bÔó²¦ê#ß£#C†ãc±WK\\ŽDrÇ#ÚŽOô_GÐ@È€}èÊj*:†ç¥†Fž°æ\nùV5É’¡ðèØôÉÈŠu>ŽØèôrÞå×Ñ¡þÔàutH?±8£¶ú=Ü·¹:4?ÚœDƒûÚ‚ŠŽš6ÅOKloSZÀ\0]cZ™\"­ŒLšˆ‡ì\0€Ü¾³”Á\0ˆÝÇƒ÷mû!ÆH<»oØ™ Éƒ÷mû$ ðqþí¿bdƒ$?Ý·ìLdƒÁÇû¶ý‰’x8ÿ\0vß±2A’\0Æ4î¸&Hƒ$C’¸\\œœx8ÿ\0vß±q’dƒÁÇû¶ý‰’5¿U {‚dˆ2D>—\'!\0@|–0Ë\ZO¹q’dƒÁÇû¶ý‰’x8ÿ\0vß±2A’îÛö&H2Aàãßß±2A’îÛö&H2AàãýÛ~ÄÉHr\0€\\œœ \0€à€FÄn€ãÁÇû¶ý‹Œã$?Ý·ìLdƒÁÇû¶ý‰’úê\\œ„7È8ö¼Yoµö†éõ$‚Š¢HÝVà]ÑqòÅYÔcù`™Ñ{ÐªšÊ~«”ù©§|)NÕTÖ¾Ÿã\n½zº¢ù·÷.žÑ%Ø\':;U›åÓŠUëÕÕÍ¿¹;D—`œTv«7Ë§0«×«ª/›rv‰.Á8¨íVo—N*<aW¯WT_6þäí]‚qQÚ¬ß.œTxÂ¯^®¨¾mýÉÚ$»â£µY¾]8¨ñ…^½]Q|Ûû“´Iv	ÅGj³|ºqQã\n½zº¢ù·÷\'h’ìŠŽÕfùtâ£ÆzõuEóoîNÑ%Ø\'ªÍòéÅGŒ*õêê‹æßÜ¢K°N*;U›åÓŠUëÕÕÍ¿¹;D—`œTv«7Ë§0«×«ª/›rv‰.Á8¨íVo—N*<aW¯WT_6þäí]‚qQÚ¬ß.œTxÂ¯^®¨¾mýÉÚ$»â£µY¾]8¨ñ…^½]Q|Ûû“´Iv	ÅGj³|ºqQã\n½zº¢ù·÷\'h’ìŠŽÕfùtâ£ÆzõuEóoîNÑ%Ø\'ªÍòéÅGŒ*õêê‹æßÜ¢K°N*;U›åÓŠUëÕÕÍ¿¹;D—`œTv«7Ë§0«×«ª/›rv‰.Á8¨íVo—N*oµË(ÖØk®u¸l«e#„m³—Fû\0{«ßj/ˆé5©ã™5Â˜–«£å|(Æ\'ŽzÔÝ\nPL‚\0€ŒzÏÅ–]£ù”ØÅ~žÒÏDIORj\\¬=GÛu½bÚ›=RÀøQSÁsÖV˜‡ÕØ+šJtTÖ‹ž´0?UëÕÕÍ¿¹b;D—`œTÁö«7Ë§0«×«ª/›rv‰.Á8¨íVo—N*<aW¯WT_6þäí]‚qQÚ¬ß.œTxÂ¯^®¨¾mýÉÚ$»â£µY¾]8¨ñ…^½]Q|Ûû“´Iv	ÅGj³|ºqQã\n½zº¢ù·÷\'h’ìŠŽÕfùtâ£ÆzõuEóoîNÑ%Ø\'ªÍòéÅGŒ*õêê‹æßÜ¢K°N*;U›åÓŠUëÕÕÍ¿¹;D—`œTv«7Ë§0«×«ª/›rv‰.Á8¨íVo—N*<aW¯WT_6þäí]‚qQÚ¬ß.œTxÂ¯^®¨¾mýÉÚ$»â£µY¾]8¨ñ…^½]Q|Ûû“´Iv	ÅGj³|ºqQã\n½zº¢ù·÷\'h’ìŠŽÕfùtâ£ÆzõuEóoîNÑ%Ø\'ªÍòéÅGŒ*õêê‹æßÜ¢K°N*;U›åÓŠUëÕÕÍ¿¹;D—`œTv«7Ë§0«×«ª/›rv‰.Á8¨íVo—N*<aW¯WT_6þäí]‚qQÚ¬ß.œTÍt›Œ›¦¤åÇçÂièÚ)ß?…eKœwnÜ¶>õ”´c9.sû‰FzÌÍ”	nõ=Ð£t*ç™5úï}ÿ\0Ü\'ÿ\0¼ªºáý\\Ÿä¿ì¦®¿×KþKþÌ}xÌx@\0@\0@\0@\0@{Xv-sÍ2ZjÑ¥©®™±4Ô;OØ½TT²VÎØ#LÕTö[è¥¸Ô²š$Í\\¹§¦˜%¯N0Ûn+k‰­m$!²?noY\'ÏÌ­‚¶PGm¥e<i©\r£³Û\"´Q²–$ÔœTÊW¼Ê£8°Ñèõ/–åm¥¼Yƒª -TÛÊi=¼”OÙ’çF¯bwÙ¥F9°%âd=ã4§©[ÒFøžèäikÚvp#b\n¤U%5ÑQQrSåpp\0@\0@\0@\0@›…_ÖLŸÀKø…\'Â×.å&8\'óÿ\05Î ]ï¿û„ÿ\0÷•„¸W\'ù/û#×_ë¥ÿ\0%ÿ\0f>¼f< \0€ \0€ \0€ \0€ &çú8môjuöŒ‰ªÇ‚ dæÖƒý ÷î­L\rfölZù“JèO¹uro‡ý”ks4®†çþÉt¬rÙ\0€ù{#ki´Â¢*d§\nˆ©’•ÏÅÞÉ§™ä—ûe)mžøã<e£ÈŠNÖ†ê•Æu·V,Ñ§qúw/‘¯8òÀ¶šõž$÷riôEò4\Z‡0€ \0€ \0€ \0€ \0€ÜÜ*þ²dþ_Ä)>þ¹w)1Á?˜¯ø©Šg8>k>e{š,Fðæ>¾b×\n)#¦v €±õô5Nª‘R7k_ó1W;mk«%rBï‰â¾g…ô8ô>óò2w/\'WÕìÁOUÖì]ûWì>€ç‡Þ~FNäêú½“¸(êºÝ‹¿jý‡ÐãÐûÏÈÉÜ_W²wW[±wí_°úœzyù;“«êöNà£ªëv.ý«ö@sCï?#\'ru}^ÉÜu]nÅßµ~Ãèqè}çädîN¯«Ù;‚Ž«­Ø»ö¯Ø}Î=¼üŒÉÕõ{\'pQÕu»~Õû 9Ç¡÷Ÿ‘“¹:¾¯dî\n:®·bïÚ¿aô8ô>óò2w\'WÕìÁGUÖì]ûWì>€ç‡Þ~FNäêú½“¸(êºÝ‹¿jý‡ÐãÐûÏÈÉÜ_W²wW[±wí_°úœzyù;“«êöNà£ªëv.ý«ö<ŠÊ\ZÛtî¥¸RMM3~´r°±ÃàW™ñ¾%æ½2_SÉ$O‰ÜÙQ}OÁ|a\0@æŠi¥v©çÖüjš7ÄÕOÛ“biÀžÍÂËÙ-ºÖ6êÖ»Œî³¾÷^ÊfêÖ»“Yi–;5=h¤²ZáRQDØb`ìhÁ)£lQ¦HšÙújxé!l&Mjd‡yváòÉ#¸G#\\Xz.Øï±óÂ*.£„T]GÒää 5þ¸i«`øäÑVÖhžb`9‡¾ZÙv£t¯Ãy€Ä–f_(N©ÞÖÝåZÞ-U–;¥U¢¾\'GQI+¡{\\6;´ì¨¢t:7¦”\\a¨ôÒº%EÈé®£¤ ½l±^ïEÍ´Z++K>°§ÒmïØ.è –üMUÜ™ðÓMQÿ\0…ŠíÈªz@sCï?#\'rîêú½“¸)èêºÝ‹¿jý‡ÐãÐûÏÈÉÜ_W²wW[±wí_°úœzyù;“«êöNà£ªëv.ý«ö@sCï?#\'ru}^ÉÜu]nÅßµ~Ãèqè}çädîN¯«Ù;‚Ž«­Ø»ö¯Ø}Î=¼üŒÉÕõ{\'pQÕu»~Õû 9Ç¡÷Ÿ‘“¹:¾¯dî\n:®·bïÚ¿aô8ô>óò2w\'WÕìÁGUÖì]ûWì>€ç‡Þ~FNäêú½“¸(êºÝ‹¿jý‡ÐãÐûÏÈÉÜ_W²wW[±wí_°úœzyù;“«êöNà£ªëv.ý«ö@sCï?#\'ru}^ÉÜu]nÅßµ~ÆÝá‹Êíºˆùëñ›¥<F†QÓ–•ìnûŽ[¤x^’¢*ÕWÆ¨™/‚’ÌCU\rÁ]$NDæ®´T,m]†Ä\0@\0@\0@\ZŠ½°fXÃ#¶Ú †ùoµhi‘ƒëyù(~+²C[Féãj$Ó™Æøv…ê\"b$­ÓŸŸžet±Øö*P×ƒ„ÈÄ5 ’y\0\':ËáFÛ§˜Cr+µ1mâöÑ3úcœQ~ÈmÁWN³uu\'¶‘;ïÓ¹\r…ÀxªhºD©ï$Ó¹<	\0¦$ô 0íXÔ+n˜á¦ã(i†2È¿7ÊFÍã²ÆÝ®,µÒ:¡þ\Z·˜‹åÖ;5ê¤]I£8Oâ.ç[Üq¼ÞædnCPg¦|ŽäÉÉú£Ì6UþÄr>­ðU;ã\\ÓyW`lY,•Ï¦­v~ÑsOEò&ÇZ´‹  ?ÆöUÊ=P±Ò‘MX[\r{X<–IÔ×míUV9²û\'¥|I¡t.ò“åû	Rçhv‡oð\"J®J  [°Te9%»¤þ–¾¡°·âyÿ\0‚ôÒSº®vÂÝn\\]\r+«jYNÍn\\‹OÓ=2Å´Û¤µØmPÁ+ahž`Áá$~ÜÉ>õÛ-”öÈ[-ÉrÒ¾*m\ržÏKh§lP1rÒ¾*f+&eÂ\0€ \0€ \0€ \0€ \0€ \0€ Fqoª˜›TÚ¡¨éy#ßŸCö‰ø(ž.º6‚…cEï?BŒwze²Úèš½÷èOä­Òw;•H\Zæp€ 7w\nZE.¥êõÐ;óM™Í¨¨qní‘ÀòJ°nuˆ÷§qšWìMpE…o{ÓÝ³JúúKQÁ!‰¬¡­hê\0\r€W‚\"52CcZÔj#SRk““‚@“°\nöãY~åã³Tô­6W¹Íw)&êvþâ5Œï]>§£D½Æ}T×þP1YÕôHWÝ³ê¾$z¡­ª¶ÖC_E3¢žâHÞÓ±k‚†F÷Dä{WJ¤t/I¹*wÃž­ÒêÎŸÒ×Èö‹O]=Nø€¯Œ9wmÞ¿hSeð•õ·ÊÈ¿t9\r¨¤  <<×·fØÅÃºD×Ã[£!¿EÛ‹¾yki] ‘4*+w\ZgÓJš…Uj6rÓ¼ÂãŠ\\ãx}Îká·„füœ=ë_nT/·TºžOâjÝÚÛ%¦±ô²Åx§™/W¿Tã\r¾ÿ\0Hv–†vÌßçþÑK;©flÍÖ‹™ê¢©uC*­«™kzsšZóü:Û“Z§ESz|ùµàlà~+amµ±Ü)™<k¡PÚ{EÆ+¥*b\\ÑSêdËÜd‚\0€ \0€ \0€ \0€ \0€ \0€ µÆáIi žå_3b¦¦ŒË+ÝÔÖÌ¯‰$l,Y¹\"rÊÈ²H¹\"iR¯¸ÕZÝWÔ\ZÛ³ÞE\r+ÝOG;´1§n÷íº¡1\rÙ×jÇIÿ\0Ð†²â«Ûï—J¿\nhMÈk5‚#AØ·ÐÔÜë©íÔ‘:IªdlLkFä’vî8Ý+ÑÖ§dQ:g¤lLÕW\"Ð¸~Òº](ÓÚ+7ƒoç\n–	ë¤ëHGù}áëSm4M‹þK¥w›7…¬±ÛÛ]õÒíæÌYÒH\Z_Š=aƒKp	éèåÿ\0l]˜`¥hvÎcNàÉðQŒUyKU\Z£~7hO¹\rÆ—öÙh¬_xý	÷+VyåªžJ™Þ_$¯/{Yq;’¨×9\\ªåÖ¦¸9Ê÷+­OÍ|Ÿ&Üá«Wj4§Pig¨•ÆÓqp§¬¥³@qØ?à¤xfðëMb+¾h_¹,Á÷çXî\rs—Ý»Býÿ\0BÌè«)®4×ÑÊÙ`¨`’7·©Í#pUìÇ¶F£ÚºÙHäl¬I¹¢éC÷_GØ@E®6tq¹8ÍF³So]inÕîd‡³ì%@1½›¤ÁÓbNóuî+QpúUÓ¥Æï3_ª;©Te¥à£Y]Žd/Ó›ÕOFßs%ôÏ{¹G(êh÷’§ø\"õÑ¦èR¯uÚ·–\'Xƒ¢T-ºeî?W¢ù~¤ñVáz\0@\0@\0@\0@\0@\0@ceö=œØêö®º·¥XXï©Qió«üozèÐ¥KÞv½Å_Ê. è”én{Ï×èžDU!F*x%ÑÃ_¤Ô{Õ\'J‚ÚK(ÃÇ\'ÍÔOÁX8\"ÍÒ&ZéSºÝ[ËG“œ?Ò§[ŒÉÝn¯U\'j¶‹È :×\Zú[U÷\Zé›ñ™${ŽÀ\0Ä’6&+Þ¹\"rÊÈ²=rDÒUÿ\0:¯[«9ý]ÙÒ?ó}#ÝOC<™?æU	ˆnÎ»Ö:Oø¦„Ük.)¾>ù^éU{‰¡©èk%‚#A\0@ON\nõ äøë´òûV]p´·zWHîrCØÑîVî	½t¨:ËÞn­ÅëÉÞ!é´ý_:÷Ù«Õ<¿BQ)ñg^¾†–çE=¾¶ËCr1ÃpAâHÛ+ULÑN¹blÌXÞ™¢•Ä.•UéN¡VZü…¾­î¨¢~Ü=_¨\\Eiu¦µÑÿ\0Åt¦ãY±]‘ö;ƒ¢Ë¸º[¸ÖFB±o¯ªµ×SÜ¨¥1TRÈÙbx<ÚæÁ_qÈèžf´ÒvE+¡zHÅÉQsBÐx|ÕZ=VÓÚ·†ãLÁldùBF€½Å_xzìÛµdÏ¼šÙ¬+{eîÞÙsï¦‡o6jÎ’P€ \0€ \0€ \0€ \0€ \0€ <ç.µà˜­Ç)»Íàéèat„ö—vñ^JúÈè)ÝQ\"èj•|VÊWÕL¹#Pª­BÍnzƒ—Ür»¬…ÓWL^<šÞÀ>_n5¯¸Ô¾¢Mj¦­Ýn2]jßU.·)Ž/	Ž{ÄnYÖSoÅíQ¹ó×LØ÷~‹wæãî^Ê\Z7×Ô6ž=j§ºÛA%Î©”±&—)jšy…[´ÿ\0·bÖØšÆRBÖ¼´}y6òñ+`mÔL·Ó6ž	õ6’ÓnŽÕHÊXÓB\'ÔÉ¸È„TãkY¿0Y¦–J«.léW»bÈ{þrB¯±Åë£ÅÐb^óµî*ÞQ±E-°/yßâ\nuª”£‚\0€ 2-?Í.º–Û²«<îŠz)ƒÎÝNgíçåºöÛëd·Ô¶¢5ÒŠdmwmUlª…rV©jXikÔNß•Z%ká­„<€y±Ý ­·ÖÇp§mDk¡PÚ+]Æ+­#*¢]C\"^Ó \ZSŠ!S´þzª»ÚZj)Ü”æ€IgÅE±].”jæ\'}ºSìC1µ…/6õtiï¥>ÅkÍ”ó>	˜Y$n,{OX ìB£œŠÕÉušâæ«ZºÐø\\!ºxXÕçév Ã}C›h¼9´Õc¬4ïä»o~ÊQ…oUXˆõî;B“<~[-Á\"û·è_à²¨¥Žx™4NcÚÒ:ˆ*òEG&hl{\\ŽDrj>×\'!\0@\0@\0@\0@\0@øÝÖ_Ï7h´ÎÃ[½%¼-s£w\'ÉÕàÏŸeTc‹×¶‘(a]\r×¿È¤yGÄ\"T¶Àîët»‘UvUA\0@N>toóM¦MM¾QíS\\Þ…¿¦Þm©ÇŸŸekà{7±kåM+ðî.ÞN0ÿ\0°‰ns§yßâY«µ‚Ô,ÖÙ§ØÇ*ºÌÖEGœÀnM¼–üJñ\\kc·Ó:¢EÐ‰õ1×[ŒVªGÕJº\ZŸ_«3¼ÊéŸeW¦í+Ý5l®xk¿A»òhö¯µõ²\\*Q&µSW.w	n•Oª•t¹xúñž\0€ Oð]­GÈÎŸ_k·]Þ!yåý@0*{‚¯}~‡2÷]«yfòyˆº\rOWÎ½ÇêôR{Ü+x½ŽP9­{K\\lAí	¬*g¡JíãG]§ù¹ÉmT½=íÅìèŽL›­ÃüU-ŒlÝ_UíãNãÿ\0Ù¯xúÁÕU½&$÷r¿>(i\0Zç1Áìqkšwu‚¹EËJ¢ä¹¡b<ksü!˜½Ú¯¥x²4Eåß4C©ÿ\0ã²º0uç¬):<‹ßféælÄ	t¢JY—ÞG£zy’L‹\0 \0€ \0€ \0€ \0€ \0€×zëª:U§÷ô²ËÃ\r$`ùN‘Ã`@öu¬-úèËM¦UïjMä^™d |ê½íHžªUÅÚé[{¹Õ]î3:Zš¹]4¯=eÄîU4¯žE‘ëš®“Xg™õ:Y5UÍN¢ë:‚aè^˜Vê¶ PX!‰ÆŽ95t€G<ÊÍXmo»V6NîµÜH0Õ™÷ºöS¢wSK½´‹M®ŽËm¦´ÛâlTô±6(ÚÑ°\0\r•ûM‰B=,§±F™\"&Gmv¡8ÖÖWä¹4êÉY½¶ÖCê·lÒž ºª,mzZ™ºKÝn¿Uÿ\0¢Šå­eGWÀ½Ækõ_ú\"â€•ˆ@\0@~Ôuu4QVÑÌè§áñ½§b×¢ÛèÜŽjä¨}Ç#¢r=‹’¡f¼5êõ.«àÓM3;[XÚzØÁæ5ßë†o\r»Q¢ª÷Û¡M”Á÷æß(\Zª½öèwÜÛjFKÖm7 Õ\nãU°xgFd¦xÛ+Fão~Û,MêÚË­ v¿\ræÚ#½P>™úòÍ7•c~²\\1»ÍeŠë†®†WC+êpTD¦•ÐÈ™*h5zªšJI©“š¹)Ð]\'@@g:5©5ÚYž[òzY d•q·þ$$ùAe¬·7Ú«;uxî3x~îû%{*Zº<}P´Ûîƒ#³Ò^í“²jjÈ›+Ó¸æ7ÛÞÿ\0O;*bl±®h¨m-Lup¶x—4rfz¸ô\0@\0@\0@\0@ò÷²6:I\ZÖÉ\'…TDÍNQ5+ƒ‹=`~¤ç²ZmÕÖ‹+;Oí;íT–.¼-Î±cb÷¡\ruÇ7õ»×¬Q¯»f„ßâh¥ áõ+Ûm.{Èk@ë$õÊ\"ªä‡(ŠåÉá\'G™§W«?FózhšRæìèã;tXUÙ„lÝ[H’È÷éý<ˆÀ¶´P¤Ò§¼~•ôO#|)q:\r[ÄV¬SiFžÖ\\Y0*Öºš… óð„}m¼Á`1Ù¶š\'=¼ºyÅ—ÆØíî‘¾í\rÞVumMÆ²zúÉ]$õ:Yã¹.\'rU\r#Ý#•î]*kD’:g¬\\ÕtŸ‚ø:Â×Æq<‡1¹GiÇ-SÖÔÈ@èÆÂC}¤öé¥¤šµé\rUS×GCQp‘\"§j¹}\r‹‘ð­­8Å×»Ž0NÆôœ)æ<îŽk5S….”±{WÇ£Ñs$5x&óE·’-‹šð54±IŽŠhÜÇ°ìæ¸lAó£ªŠÕÉH¢¢µr]gÂàà 6—\Z·[¤ùõ%y”þl­{`®}i;t¾©»ºÓX×çÝ]\nJ0¥õö:öÉŸqÚ÷ý<·\\).´0\\¨&l´õ1‰b{zœÒ7_ÈÙXbæŠl¼R²v$‘®hºPì/³° !7\Z5ùdZ£b¥> ø;‹XÝöd‡ðUn9²ó•ñ&…ø¾å/ÊFöoKœ	¡t;™•lT\0@M^µòªit¶÷SåÂÖ÷=ÜÈësU£¯<ö­««KK›“|AÏjÚæ])¥¿ÊYEº\0@\0@\0@\0@‡âÛX\"Óœ\n[-º¥¢ñza†&´ùQÆzÞ¢8ºð–Ú5‰‹ß~ÓÌ‚ã«úZh×Þ?Bz\'™\\o{å{¤‘ÅÏy.q=dž²©5UUÍMwUW.j|®zð•¤.ÔŒþ;­Ê›§g²8M>ã“¤ë`ûB–á?YV$Nã4®ÿ\0ql=o^’Èžî=+¿À²µ¬hc@\rhØØÜ‰–ƒbÑ2Ð‡(Ê¦¢\ZJyjª$Š½Ç¨4\rÉ_.r1ªçjCåïHÚ®v¤+?‰Í^›Tõ\n©ÔuÖ{c5Aò\\æí¼ûª/^ëZ¼Õî7B\ZÛŒ¯Ë{¸;˜¾íšîiå\Z\"úSÁ5TñÓSÆé%•ÁŒcFåÄõ\0¾šÕz£[¬úk\\÷#Z™ª–SÂîÓi~MW]LÏÏwF	êdÛÊkO6³à\n¼pµ™¶ºDsÓ¾í*l~Ãí²ÐµïOxý+ö7AÀµÀFÄÕ(&ZÈÆ–Š·¿3P¬B;eÍÝ\Z¦ÆÝ›Ýœ½ª¢Æ¶D¤›¦Â×kôR‰å¥ép¹1úýþÈ¼ %dëà£ZNAe~›ßê÷­¶´:…Ïw7ÅÕÐåm`‹ßH‰hf^óunò/N±J…mÓ¯y¿ªy­X%¤>]ŒÛsnáŒÝáRÜ!tR4?Q^jºVV@è$ML%uw\ngÓJ™µÉ‘Uz‚\\´ã5¹b·8Ë_K)1¹:3Í¤|¾Ý(mª}<žô5nól’ÑZúYSRèÝàb«bÂ×Ä²[Ž‘Pdv¹ŸEÍ”tNÝ 1ñÓITú9Û<k¥õÐÖIAPÊˆ—%jæZž—gÖÝJÂíÙUºf;ò˜‡‡cáË·”Ò¶×peÎ•µ]z÷›GeºGx¢eTk­4ú)–,‰•\0€ \0€ \0€ \0€ :w{¥–ÙUv¯•±ÓÒDé^ç†Ànºæ•°F²=t!Õ<Ì¦‰ÒÈ¹\"&e[ëž§Öj¶ ×äRHÿ\0ÈÚónÿ\0‡<‚ o·G]«2ü:“q¬8–òûå{ê{ºšžHkÕ†#áÛ´Úëow:kEº-U\\­†&·8€]ÄùäHØ™ªèCº_S#b3r®HZ>„é…”éí¿‰€ÕÈÁ=d…»8Êá¹ÝÔ¯Û\r­¶š&Âšõ®ógpÍ™–K{)Óâ]+½Mˆ³D€ #gšÈ0¼Da6Z°Ûµäm)c¼¸aóüz”\Z^º7E‰{ïú!\\ò…ˆ:º“¡B¾ñúýþÊý$’I;“Ìªt Î#x8Ñ‡çYÓ+Å?û\"Èðæn?¤Ÿ­£ÚÛYV¾§¥JÆ²Ääÿ\0-Î¯¦Lžî?ª–\0\0\0\0\\¥þr€Çu¶j%pÅ®‘5ñÖDæ±ÎQûy.â¼W\n(îÎ§‘4*û­º;¥#éeMNæUn…Ý4û,¸b—hžÙ¨¥-kœ6é³%ÃÞµúáE%º¡ÔòkCW.–émUo¥•4µ~žf:¼F< =Ü#/»`™E¿)²Ô:*š„€ŽÑÚÁzèk$ ¨mDK’¢žëm|¶Ê¦UB¹+Tµ\r5Ï-:‘‡[²«LÁÌ«…¦FoåFþ¢ìæÀÛ+ã¹S6¢5Ö†ÑYîq]èÙUëN\ne+ÞdÂ2ñ§£‡.Å™žYiË®Vfí;ÞrAÖI÷l ˜ÚÍÓ)ú\\IÞf½ÅkÊ&éô©_\nwÙ¯Õ?è€jŸ(`€ $ÇºÄq±Ø%â¨‹méÀSôŽÍŠ?Ä:ÁWž‡QÑ%^ëõz)dòyè}eî?W¢“ôFàî\n¸Kèå\0@\0@\0@\0@Kã{YM¢Ù˜XkCj«@–àXy¶.¶·j®±ÍëØÆ”®•ø·G(ø‡ØD–ÈÞv—nð êªJL 	aÁÝÞ]K¾ÒoKowƒ¡kÛÉòÿ\0l{•‡ì¾ÞE®™47Vÿ\02Õäçô™Vå:w[ðïó\'2¶¸ <|»(¶a˜åvKw•±ÓPÂé]¹Û¤@äÑí+ÍYUžEÐˆxëëb·Ó¾¦eÉ­LÊ­Õöá©µË*¯•î‘\\wèD	è·ìZýu¯}Ê©õ]z·\Z»z¹Éw­}T‹­tz\'‰¬qŠ[Æ®Y~CCŽZ tµUÓ6&4{zÏÀ/M%3ë&l¦jªzèhä¯¨e4)›œ¹¥¥z}lÓ<*ßŠÛcoú¼`Í $=dùÖÀZ­ÑÚé[NÏ\r{Í¢²Z£³Q2–?Óê¦\\²FX ¹Æ¦‹œŸn¢X©w¸ZÛµ`cwt°õ±@qµ—¥CÓaNóuú¡Xò‰‡ºe?X@ökõB*ˆ¢‚\0€’Ük?ÐÜ¬à·ºÎ…®ôð!/<£Ÿ©¾àTëÞºGD•{Õ¼²9=Ä=_UÐg^ãõz)?ÁÍ ƒÌ®û9@~ÔT×\Z9è+\"AQ¢‘‡©Í#bÄŒlV;RŸFÙ˜±½3EÐ¥cq¤õ\ZS¨u”0ÂE®¹Æ¢‰á»45Ç~‡ÁQ’Ò¶š×1ººPÖŒ]cu’àæ\"w¥¿cT¨ñÚ’®¢†ª*ÊI]Ð¼=iØ‚:—ÓèÜŽjä¨}Æ÷Dä{%BÍølÕ¨5_O)k**ëµ¼6š¹ƒ‘‘ø…{á«º]¨‘Î^ût)²ØBúÛå½¯r÷Û¡ÆÙR\"T\0@\0@\0@7¨yµ³OqŽWuš6GGœÆ¼íá$ÛÉhö’¼7\ZèíÔÎ¨‘t\"}LuÚãª‘õR®†§ò*«7Ën9ÆSpÉî’½óWLé\0qß Òy4{×Úê·×T:y5ªš·r®’åTú™WK”ð—ð„G§Ø]ÓP2ëv+h‹§=lÁ¤íÉ­í\'à½¶ê).-§Z©‘µ[¥ºÕ²–$Òå-WÄ-˜&+nÅ­¶:zC\0­Ý§í[CG;iãM†Ò[h\"¶R²–$É\Z‡¼½g¸ !/úÌ.±émŽ¨)ˆ–âZzäÚÞ]›Vc›×´r[â]	ño)nQñµzZà]	¥Ûüˆ†«r¥mpE¢Â†ŽMQ¿Ñ?P<¹’7ê7÷ƒÞ­<dömZù“Jü?réäãû&-ÎtÒºŸû%â²h ð­£§¸QÍCW’\ZˆÝ#pZFÅ|=‘ªÇjSâHÛ+M ¬~#ôŽ§J5ªŽHµW½ÓÐ¿n]~©öƒº¢q%¡ÖšÇ5¸í(kN.±:Ç^æ\"w¥»P£¤T ?Zj™èê#ª¦•ÑËƒØö‹Hê!}5ÊÇ#›­¦=Ñ¹ÕÉP²ÞuŠŸU0(#ª•¢ïiciêãß™\0l×üUç…ï-ºÑ¢9{íÐ¿sdpf mîëï¡…7\"“\0€ÓÜNéZ§§•\r¤§c®ö¶º¢‰Äsåõ‡ØkZëD¼Ôï·JebKÝ½Q‰ï¥¿ÉYÓÁ-4òSÎÂÉ\"qcÚG0GXT[š­UjëC[Õc•®Ö‡æ¾O€Ûü2jÔºY¨t²ÕNEªäáMVÒ|–ôˆçÜ¤¸bî¶ªÔW/qÚîK°uõl·«—¸íúø–eMSe<Ut²¶Xf`|oiÜ9¤nW£\\j9º”Ù6=²5ÕÍýWÑô\0@\0@\0@:7bvI‘³N¬Õ ÐZJ¬±Û¶YºÇØª<oyé3ô(—ºÝ~ªQ|¢â«©Kt+Üf¿Uÿ\0¢-¨X;x%Ñ£XåÔ{å/FºæÞ…^ß©_L{J¶ðE—£DµÒ§yÚ·—\'8¢@·Ó¼í[¼ÉR¬Ñ\r®\ZŸC¥8vC<ü­ÌtTQ·„”ŽAaï—FZhÝ2ëðÞ`1%å–:Ô;âÔÔóR­¯WzÛõÖªñq™ÒÔÖJédsŽä’U<Î¨‘Ò½t©¬U¾ªWM\"æ®\\Î’ê:`èv˜Wj®AA¿%kÄÕrmä¶&È\'Ú9,ÍŠÖûµcaMZ×qŸÃvgÞëÙNÔîë]ÈZEšÑA`µRÙ­p6\ZJ8›L’¿a…”ñ¤Q¦Hš\rž§‚:X›I“Z™!Ý]§p@©8•ÒXuWOj©©âÞënkªhˆo”çõ7óÄÖ„»Q+Sãn”\"xÂÄ—»{šÔï·K~ÅeUÒTPUMEUŽhèäiÃØ…D=‹•ŽÖ†µÈÇDåc“Jh?ò|ËÐW­Ò|þŠð×¹Öú‡ˆ+bß`æ¶çÝ¾ë;‡îÏ´Ö6DøWB¡$Â÷ÇØëÛ2|¡Ééÿ\0E ÚîtW›u=ÖÝ;f¦ªŒK;‡4«ê)[3F.h¦ÍC3*#Ic\\Ñt¡Ú]‡iÁÀµÃpyƒY^Üdhã°|ÍÙ…¢—£i½¸½ý³bŸµ¿Lã;7Aªé1§qÿ\0E5ÿ\0”?Õµ2÷r}ŽjWÏW0€°Nõˆæ¸ƒ°ËÍHuÒÈÐÖ9îò¥„ý]‡nÀ+“Þzu7E•{ìú¡~ò}ˆ:Æ“¡Ì½øþ©ÿ\0D‘SrÆ\0€ \0€ \0€ 5—z­I¥\Z{[v4\\j˜è(c=nŽ¿€X,Cvm¦ÒgÞ]	¼b«Û,v÷KŸ}t7yW×\nê«l÷\nÙ]$õ:Iã¹$Ê¡$‘Ò½^íjk,²ºg¬\\Õtuðu„ÊÐ\r,«Õ]B¡³ˆ\\h)Þ\'¬“o$FÓ¾ÇÞ³¸~ÔëµkbËºšT’ak#ïwC—u4®âÐ­–ê;E¾ž×o„EMKb‰ƒ©­WÔQ¶$lL‘\rš†SÆ‘F™\"&Hv—aÚ|K,pDù¥pk#isœz€rW\n¨ÔÍNäj+—RÃÅž±»RóÉm¹ÜlÖW˜aÞL²¹%‹¯=gV±Æ½ÆhOUó5×â¸®X¢_vÍ	ê¾fŠQ\"Lcå{c¥ÎqØ\07$®QW$9DU\\².tr=2Àã¹\\©À¼Þ\ZÙçqØÂ7kGÀ«¿	Ù’×Hzwß¥ƒbð>K5\nI\"{Çé]ÞòR²n\0@ãGEÆ%’7?±Rím»;ýe¬nÍ†_9÷ªƒ\ZÙz$ý2î»_¢”G(x{ Ôôø¸ý~‹ÿ\0dbP2³qpM­m»[¦7ú¯õª1Ò·½îúñÿ\0`{Bµ°EïÛGÐ&])ðîò.ÞNq·‹«*¼ß‡w‘-ŠZÁ†jæ[µ?¸bõÑ5ÒKLò?£”$…‹¼[™t¤u;ÓJêÞa¯Ö˜ï4/¥ziTÑè¥Wä–Ž/|¬°Ý`tU4Rº\'µÃcÈò?¯õ4ï¥•ÐÈ™*)«Õ”²QNè%L•«‘æ.ƒÌ†“êÇL³‹nUoO(lìß“â<œ÷,¦âû][*á¯q—±Ýd³V²ª?Ó»Äµ[$¶åØýGi”IK_fŒƒ¾Àö-€¤©ed-ž=NLÍ¢¢«Ž¾•/uÉ™ê¯Aê\0€ \0€ âi£§†J‰œM/{`rWr5Êpç#\\º­n)µyúŸ¨ÁA3¿4Ú\\iéÚ’ò7ûÕŠït¬Tb÷¡>æ¸c[òÞn\nØ×Ý³B}Í*¢Ä0 >£ŽI¤lQ0½ï!­hÉ=‹”Erä‡(ŠåÉ$áGH[¦xU×\ZpËÅå­ž¤‘Í¬ëk~Â¯\'gKe\Z=éß~•þ\rÀö³Ð#äOxý+üÁJ‰¨@h>.u—ôq„¢££x½BÎ‰ç[yDûÁQ_zêÚ_e\Z÷ß£r<wˆ:¢‹ØB¾ñú7\'‰\\Îsžâ÷¸—8îIí*”UÏI¯*¹éS…ÁÀ@H´fMBÍ™“]i‹¬¶IŽ$y2Ê9†)–²­Æ©\'‘;Œú¯‘>Àxynµ©S*{¸þ«äX›È˜ØãhkXZP]ˆ‰’ˆˆ™!ô¹9\0€ \ZÔ\\\"Ù¨˜}ÇºÄ×ÅY.RM¼—|\nðÜ¨c¸Ó:žDÐ¿ìÆÝ­±]©K*hr}|\n­Îðëž•\\1k´NlÔ3:0â6h<œ=…kõ}–ú‡SÉ­ÕÛ¾[eSéeM-^>§€¼g€ =ŒG\'¹á™%Mh”ÇUo™³0ƒ¶ûvé£ª’ŠvÏ\Zéjæzè+$·Ô2¦ÉÍ\\ËQÒÍ@¶j^nÊm²‡~Q3~lrp?°6«„w:VÔGã¯y´VK¬WŠ&UFºÓNó-Y,ÃŽ-,’-R±Òn´W.ˆê=Mr¬1Õ›%K„Ièâœå#ä©t=üáVe>Èà{Yo—Kou$ôÉ–ÞçùöÆ›¯9*Ûå_ñû&øƒ%[\\ëêß±3•œ\\a\0@\0@\0@|KsÄøehs$ikílBáQ™)ÃšŽEjêRñCÂævÔgúsF÷Òîd¯¡nîs	æ^Ïg±U¸§	ûë(“GŠ(RøÏôtZûrwu¹¿ÊÍsZæàv Ž`ªãQS*e¡NþáG¿H™Ëo÷ZwE‘ÂbKwl’Ž¦š˜`û7XÕûi¸Í;×Èžà;[W{ySÝÇ§zù,Æ666645­\0\0;º‘2LØTDDÉ¥ÉÉÐ¿^íøåž²ùt˜EKE¦•Äõ\07]5²š\'M\"èDÌèª©ŽŽO*äÖ¦jUž´j]ÃU3Ë†KW#¼yŠ–=ù6&’°ö…@ÞîoºÖ:wjðÜjþ!¼I{¯}K×F¤Ü†± =vÃpÉ¯tv+\\š¦²VÄÆ´nyž¿‚ï¦§}T­†4ÍTôRSIY3`‰3s—\"Óô{MíÚ[‚ÛñŠ(Ûá£®ªrÊG2Ù­¬µR6kñõShlˆì´,¦f¼´¯š™²Ê™ € \0€ +ñ¯¢ã!±7RltÃòÛ[:5¡£œö»H%WøÞËÒaéÑ\'yº÷w(¸{¥ÁÖP\'yŸªET…\ZàãY¾‚æCï5E–›ÛÃZç»”Su7o0;©¶½t\nž*÷ôRÄäÿ\0õegC™}ÜŸEð,!®kÚ×Üyrë/ô\\ô¡ÊÊÊqËv[×c·X›%5t.‰àöÜr?çª¦ed.‚DÐ©‘å­¤ŽºÔò¦häÈªíXÓêý2Î.8­loÁ)4Ïpþ’-ü—-»[Ÿk«u;¼5z¡«·ËT–z×Ò½4\"èõCXÃw-6›òãªÓI%MUKÃ#Š6î\\Jí†ÎôŽ4ÍTî‚	*dH¢LÜº°>\Zø`¶i•6Y”D*2iZþM(?²<çÚ®<3…ã¶5**4Ê¿BüÁø2;3WT™Ì¿BC©™`„\0@\0@\0@|ÉrÆè¥c^Ç‚×5ÃpG™p¨Š™)Â¢92RñKÂ›emF é½¼5à+­ñ7‘ó½ƒñ\n´ÅXO<ë([½©þÐ¨q®EG\\-Íÿ\0&§ûBZ¬—+ÅæžÅGK#«*&¶.‰é·1ìU´P>iR§yW\"£‚šJ‰’\'yW,‹JÑ=3¡Ò¼ßÓÆßÊ|–²@?¤”Žd«úÇleª°7_Žóg°å–JS7^µ_53Õ—3¡8ßÖcMZ[a«\"IG…¸¾7mÑ‘Ÿx*µÇ7®j%¾×ñ}Š‡”ŒCÌDµÀºWK¾Ä,UqM38 Ñ~Rj¥ú›žæ+k9‚>³þ=ŠÎÀÖMw	“ü~åÅÉÆ×t=÷&R³K„ \0€ \0€ :×}%Ö†{u|\ršž¡†9á¸ ¯‰#l¬V=3E:å‰“±c‘3E+ˆ]&ªÒm@«µ²\'þl«s§¡‘ßµ=_¨lEhu¢±Ñ§ÂºPÖlWbuŠ½Ñ\"wKw\Z½`È@}Ã4´ò²x$s$ÁÍsNÄÔBåZ¹¦³é®Vª9ºË$áSXâÔü+}|Íüñfc`¨füÞÀ6kþ*ðÂ—”ºR#½öh_¹±˜#%æ…#‘}ã4.ï7z•P€¼ghës<<fÖŠPë­‘»ÉÑnî–ìü:Ô\ZYºm7J;ìú¡\\ò…`ë\nN›\nwÙ¯ÕaÇ¯95ÚŽ‚ZªÚ‡ˆÙ¹ÜùüÊ£§§–ªDŠ$ÍÊQt´“VJ@ÜÜ¾‡påÃ]›Ií1^¯´ñVd•-’W7qM¿ì³Ì|å\\øoÅi%™3•~›‚ÂXBI4éÎ™||½ÞÊZN\0€ \0€ \0€ ‡48¸ØƒÚšÆ³YAÃæI©ÌÕ\Z*1{A&4x\"ò6/ÛÎ°-ÃÔl¯éìLåàF›…h#¹¥Í‰“¼¼3ó6rÏP€ÃµgPíúcƒÜrª×³§Oð“±’CÔc.÷ZéPÿ\0\r[ÌEòëš…õOðM	æ¥WåÏ-¿×dWŠ‡MW]3¥{Ýíê\0µþª¦JÉ4«šªš»[W-}Cª&\\ÜåÌò—œò„q£šopÕ,îßŒQD]Þ$ªc!Ê?bÊÙ­¯ºÕ¶¦ÆoÚ$½W2™‰£Zîñ-7°Ûñ‹%‚×Ž–†Ã@Ûn¯újvRÄØcM™AIK\r‚$É­LôWyè\0€ \0€ Oñ5¤ú©§õ\"šö½±¦¢ínîwDc÷\ZÄövÝh×šöéO±ÆVÞèÍOxÝ)ö+:ª–z*™hê¢ts@óŒpØµÀìB¢ÞÅc•®Ö†¶½ŽÊÇ&J‡ä¾O€€ØšªUºQŸPä½Æ‰ïVE¾Áñž\\ýÛî³V«­5™>ô$jôû{jáÔ©æ…¢Ù®ô7ëU-æÛ;f¥¬‰²ÄöÁiWä32¢4–5ÍI³´ó²ª&Í\Zæ×&hwWiÜ~UTÑVSKK;£™…Ži‚Ø¯—5ÕjêSåìI\Z­v¥5Ö˜h\r¥—…ÞÉKá«+å2xiZ:Qwè·Ì×`¤µ=ÒD™¹Þ>DzÍ…èl’>XS79u¯†ãe,á#\0€ \0€ \0€ \0€ æ±¥Îp\0\rÉ\'MAW-*W¯úÈs¼Ëèš¬ºÓdqcÃO)\'êqö…Lã+ÏOªèÑ/qŸì×þP1YÖtHWÝÇõR:(Q^-kžàÆ\\ã°´®Q3Ð‡(™®HX·z9ž`íÈ®´·›ÛD¯é*(û\ZfêêÁöd·R{i¾ÿ\0¢€ðúZ¨ºD©ï§rýL	è@\0@\0@­\0¸ÎÑa‡díÎìtÄZîçùöµ¼¢›´“í%SøÖËÐçéq\'qÚý¡yBÃÝ_UÓ Nãõú/ý‘™A\nØ 	©Á´Š˜$ÒÜ‚°xX‡„·>Gõ°uÆ7÷«GÞùÈ¶ù—J|?bæäãsÚ¶º‡iO‡?ôL%eè@\0@\0@\0@\0@øÖÒ²ºŽz9Iž7Fâ:À#eòö$V¯‰ñ#F+ÇAu_ŠÉêj/z{{ð®¾ii«îs=šGùªÎíç,´OÏÇ%þ\n‚ùÉ«ÜåšÞüóÒ¨¿Á2Ü-Án¶åV*«|ã¨JÍƒ‡œ_UÐTÐ?™PÅj•mu²®Û\'²ªbµ}OxÏ½xNÑÇêVwÚçLãf³9³Ì\\<‰^&š–á+2ÜêÒI¸Í+ëèN06[ÅrK*{¶i_Uò,~8ã†6ÅXÀ\ZÖŽ PWj\"\"d†Å\"#S$>—\'!\0@\0@\0@1©8-¯Q°ëŽ+uˆ>:¨@íÍ²äŸ·eà¹PGr¦u<š—ý˜Ë½²+µéeM\nŸ_ªóLRç„d÷^ïeMÎ‰Ûƒ€<ˆZý[I%î§“[TÕË…¶Ú—ÒÌšZ¹(€$žÀ¼‡ŒÚšUÃ~£ê¬Ì–ßmu¸ÍuSKc#ÙÚJÚpÕmÕscy­ó]D¢É„n7·\"ÆÞk?¹uGG¸RÁ4¶z{Üý;¥æ \'—êÄÿ\0ü\0+BÍ„é-J’¯yþká¸¹,\"†Êä™ÝùÅ|ÐÞ\nTM‚\0€ \0€ \0€ \0€ \0€ \0€ðò¬+ÍmÒÛ2[55lŽ‹ºl =ŽëËWEOZÅŽv¢¢ž*Ûu-Æ5Š¥ˆäR.ê74×*¹+´ß!¦·‰¸¤¯éø6cš×ðP–l®çÐ½è¹åôÌ¬nü˜6g«íÒ#}ž\\QI¢ºYG¤x5/¡–©£§Y<`ôe”õ‘¸oz˜Ù-M´R64¯Šù©>Ã¶FX¨[J™+¼U<TÏV\\Î„\0@\0@\0@ø“ár«Xî”9+_m·\\ãÚ*·Õ—µ²D:ˆè5Û»ßö¨^%ÂÎ¼ÈÙ©Õ\ZïóÕú\"é+ì_‚Ýˆ%eE+š×ê\\óÒŸ¢.“öÒn°	°ÜrF¶ûv‰ÁâG‚\"aö7·âÝ£ÑÛò|ý÷ý»\0 ¶e%O¼‘<|\rûMKMEièéã‚&rk#`kGÀ){XÖ\'5©’Æ1±§5‰’zªú>‚\0€ \0€ \0€ ?ÿÙ'),('123','Tarjeta de Identidad','KENER','ROMERO','123','kener@gmail.com','93b16f06785d1f7773d056c1b7501f39abf371f1','calle 42#31-69','ADMIN','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0H\0\0H\0\0\0½vðd\0\0\0sBITÛáOà\0\0\0_zTXtRaw profile type APP1\0\0™ãJOÍK-ÊLV((ÊOËÌIåR\0c.KK£D04006’F@¶9T(Ñ\0˜˜›¥¡¹Y²™)ˆÏ\0Oºh-ØŒ\0\0ÁIDATxœíÝYl÷áðco{×»Æ8>ƒÀ^;Å1„4€Rq…@\nF…ÚF•šFJß*µ}*}hUU%EEUb\"DIâQÐ8Ø`csClŸk{×öž3»3ó5â<cïbÏîþüý<f~ÿlí—ß1¿ƒÚ»w¯\0ÈB\'»\00ól\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0b“]˜yÒCt: ?(À0ŒN§£’„ZÂlB°É!B,‹F£F£Ñf³Y­Ö¬¬,Š¢rrr~PrxxX’¤±±±`0811Áqœ^¯gYV<\0ÁNo’$	‚Àqœßï¯¬¬t¹\\eee‡Ãd2™L¦ŒŒŠ¢233ð)¿ß/IR ˆD\"‘HÄçóÝ¹sçæÍ›·nÝÊÌÌ4Ã OkvZ’$)‹‰¢h4\Z,X°bÅŠeË–Y­V–eõzý”—£n³Ù¾ÿ/Ë—/Åb~¿¿µµõòåËƒƒƒÇÑ4Í²,žŽ¨½{÷&»Žãt:ÝÒ¥K—.]ZYY™——7ã?âÞ½{W¯^½zõªN§3\Z3þ#`V¡ÅN’$E£QŸÏ÷òË/?ÿüóö±gJ^^^^^^mmíÐÐPccãgŸ}æp8ôz=Zït;=ð<o2™ªªª6oÞüä“OjüÓûúú>ýôÓŽŽŽH$b04þé\0¦¦¦&Ùu\05’$…B¡§Ÿ~úõ×_ß¸qcVV–öuÈÊÊZ¾|yyyùÄÄD?šîÔ‡®xê’ûÞÇíÝ»·¶¶Öjµ&·>EEE---4\Zˆw*C‹¢äyï¥K—þîw¿s¹\\)Ò6,X½zõƒîÝ»GÓ4²š0ÆNE¢(F£Ñ;w®^½:±éh4êõzý~8–›ýïÉ­ÙlÎÌÌt:Óy=ö(ŽãÎ;÷ŸÿüG¯×Ó4&§tÅSN4\Z¥iúÍ7ß¬­­÷³^¯·³³³««kxxx||<ÈÁŽD\"ß—1™Lr°322ìv{NNÎÂ…+++NçôÑh\\·nÓéü×¿þFû×fZìÔÂó|iiéÏþó¢¢¢i~$‰x½Þ›7ož<yòÎ;z½^^:öý:ð‡;Ìòòï“‚F@YYÙÆ].—Óé4™LÓüéõõõ===)2X\0‚B8ŽËÎÎþÃþàp8¦S>‹utt´¶¶¶´´øý~³Ùü8‹½A‡Ã™™™µµµÏ<óLUUËN«CçóùöíÛ7::Šu,©ÁN<Ï¿ùæ›óçÏŸNùöööO?ýtppçyƒÁ0S“X’$ÉÿÃÂÂÂÍ›7»Ýîé|Êãñ¼óÎ;ýýýh·SfÅSÏó‹/þõ¯ýèN¬Guuu9räèÑ£Á`pÆ—sS%7Ô>ŸïüùówïÞu:ÙÙÙêŸ²Z­K–,éëëóx<Ø\"–\nìä!\nýñœ2?±Xìüùóï½÷^oo¯Õj½·MEÑ4m4\ZûûûÛÛÛÍfsaa¡zb-Keeå\'Ÿ|‚yòT€`\'™ ¿ÿýïóóóÕK>xð`ÿþýgÎœÑétšÍB³,‹ÅZ[[{{{ËËËÕÉX,–šššöövyg˜65„I!ØÉ$ÏKÿìg?«®®V/ÖÓÓ³oß>Çc2™4^BQ”^¯¿wïÞÿû_—Ëåp8T*àp8G[[fI.;™B¡Ð/¼°yófõb×¯_ÿç?ÿÉq\\§¦ä¦ûòåË………¹¹¹*%‡‡‡»ºº0‘–DvÒD£ÑÒÒÒ·ß~[¥eE±¡¡áÀÃ$}RŠ¦éh4zæÌ½^¿hÑ\"•j»Ýî7nx½Þ¤×yÎÂ@(9DQ4›Í;vìPï¯655}øá‡6›-E†¬4MÛl¶?ü°©©I¥EQ;vì0›Í¢(jV7xZìäˆD\"ë×¯ñÅUÊ\\¹råý÷ß—\'¨5«Ø”(Šb¦³³3??ÿ‰\'žP*–““‡oÞ¼‰Õ¦I‘Bß˜¹CE§Ó¹iÓ&•2}}}ûöíKÍéeš¦9ŽÛ·o___ŸJ±M›69N4ÚI‘r_š¹`||¼®®Îl6+ðz½ï¾û®ÝnOÁTËhš¶Ûíï¾û®×ëU*c6›ëêêÆÇÇµ¬ÈRô{C°X,VUU¥²T“çù“\'OöööNs©v²°,ÛÛÛ{òäIžç•Ê¸ÝîªªªX,¦eÅ@‡`kL’$Q7nÜh±X”Ê´¶¶ž:u*-6TÆS§Nµ¶¶*°X,7nEQÞRšA°5%Â¢E‹***”\núúz‹Å’«;(Š²X,õõõ@@©LEEÅ¢E‹½ff‚­)ŽãjjjTŽ\r>yòd8NÙ¡õ£hš‡Ã\'OžT*™™év»>Â46_ 2ƒÁçŸ^éiOOOccãô9H&“©±±±§§G©ÀsÏ=\n…´¬ ØÚ‰Åbn·[it-B[[Ûøøx\Z5×2š¦ÇÇÇÛÚÚ”úÛ6›íé§ŸÆš–Òì;”ÖB¡P]]ÒÓ‘‘‘†††´˜3{”ÑhlhhQ*PWW‡F[K¶FDQÌËËSÙ>ÑÜÜ,IRZÌ™=Š¢(I’š››•\näæææååa±ŠflD£Q—Ë¥ò–ëôéÓi7º~˜Éd:}ú´ÒS‹Åâr¹¢Ñ¨–UšËlˆ¢XUU¥Ý7nƒÁ4m®eEƒÁ7nLúT¾x-¶fl-H’d³ÙT®ÝêêêÒýÿC‚ÓŽ\\yù™TVV–ÍfÃJm ØZw}(~411ÑÓÓCÀÖe†azzz&&&&}šŸŸŸF[¶ä`ÛíöIŸz½Þþþ~2‚Ýßß¯´-Än·Ûív[¶DQT¹ ‰ŒŒŒ¤ÝëëGÑ4=22òðuB?àp8lm¤ý—)-Äb1¥~¸$I·oß& Õ2š¦oß¾­4.,,Ä2mò}Jq‚ (]y\'ÂððpŠïÐœ>–e‡‡‡•– 9NìÑ‚­A”ºâ¢(0À–1388¨Ôßv8¶6l-‚ tÔ¾$I>Ÿ/­_t=Œ¢(ŸÏ§Ô·Z­¶6l-ð<¯´˜T’¤ÑÑQ’‚=::ªìÜÜ\\•ãV`!Ø\ZQú®K’ä÷ûI\n¶ßïWùe5®Ïœ…`Á ‚­•Î61ïºd*¿1#ŽÔ‡`keY¿ß?é#š¦\n\nˆY%ŠbAAÒz¿ßOØ¿b)ÁÖË²*§‹˜L&bf•$IRÙU>22‚`kÁÖÃ0Á`PéQII	1owA())QZo‰YŠ“âl-°,ëñx&}DÓô¼yóHêŠÏ›7O©+îñxÐbkÁÖÃ0J]qš¦ËËË‰9v›ã¸òòr¥`ŒŒ ÅÖ‚­š¦•ZlNg·ÛN\'ÃlI’T¶ëtº¡¡![¶hšöù|J•m6[~~>ÃlAòóóm6Û¤O#‘HºŸë–Fl-ÈÁ¾wïÞ¤OçÍ›W\\\\LF°‹‹‹çÍ›7éÓ{÷îy½^bvž§8ü•µ@Ó´×ëUéWVVjYŸÙ£ò‹x<[3ø+kDÅû÷ï+Í~Ë—H§õ0[’$ùêïIŸ\n‚ ²Of‚­ƒÁÐÖÖ¦´þÌb±¬Y³&­·4ò<¿fÍ\Z¥Àµk×ƒÆµš³l0ÓÕÕ¥t‚§N§[»vmú6Úrs½víZ¥^¯·»»SâšA°µ£×ë›šš”žæåå¹Ýî4½\'\ZºÝî¼¼<¥MMMXš¢%[;F£ñØ±cJOM&Ó†\rX–M»F[’$–e7lØ ²JüØ±ciz‘hšB°µCQ”Ùl¾té’RòòòeË–¥]£F—-[V^^®TàÒ¥Kf³o°µ„`kÊd2µµµ)M†õë×¥Q£-IÒØØØúõë•&ÆDQlkkKë‹DÓ‚­)½^ßÖÖÖÑÑ¡T ¤¤dÏž=*—i¤šH$²gÏž’’¥mmmz½^ËZ‚­)Š¢8Ž»xñ¢J{íÚµ.—+-¶…pçr¹T&Ã£ÑèÅ‹9ŽC?\\c¶ÖL&Ó—_~Ùßß¯TÀn·oß¾Ýf³¥ørQm6ÛöíÛUv}ô÷÷ùå—è‡kÁN«ÕZ__¯’Ûòòò]»v”lK’víÚ¥2g&Šb}}½ÒM	0«ì$`Y¶¿¿¿¥¥E¥Ì³Ï>»eË•3º“H>}Ë–-Ï>û¬J±–––þþ~¼¾N\n¦¦¦&Ùu˜‹(Š\Z¨¬¬TÚä¨Óé***X–½qãË²©3F•$)‰lÛ¶íÕW_UÙÑ144ôþûïG\"ìúH\nüÑ“C¾¼îÔ©S*eX–]·nÝÊ•+C¡f›R(Z¹råºuëÔ›âS§N‘tÙ`ÚA‹4z½þÛo¿-(((,,T*c0*++%Ijoo7™LÉm·åWÖ¯¼òJ]]]FF†JÉæææ£GbtDv2±,ÛÞÞ^YY™­TÆ`0TUUåää´µµQ•¬ž­ Ñhô—¿üå¦M›Ô‡vuuíß¿_¯×§ÎðaB°“‰¢¨X,vÿþýêêj³Ù¬R¬¤¤$??ÿÛo¿MÊ™û‘H$++ë7ÞxþùçÕãêóù:4::Š9³äB°“L>À´»»ûG?ú‘zÉ‚‚‚%K–Ð4­MÓ-B$Yºté¯~õ«ŠŠŠ)Ëÿõ¯½sçÖ™%‚|ÃÜ½{wll¬ººZ}¶)33ó¹çž³ÙlÃÃÃ^¯—a˜ÙëîJ’Äq\\~~þÖ­[wïÞ™™©^žçùúúú––•®hÁN	z½¾··7‰¸\\®)›âÒÒÒ%K–ÈËÎu:ÝŒÇ[ÅH$¶nÝºsçÎ§žzjÊÄb±cÇŽ;w.é3| C°S‚<+ÖÕÕuïÞ½åË—OYÞjµº\\®5kÖÈ=ùP(‹Å3á’$ñ</I’ÝnñÅßzë­ÚÚÚiÎl8pàë¯¿6HuŠ@°SEQ,ËvwwOLL”——Oy,EQV«õ©§žª©©),,´Z­<“‡ßÓ˜$IÑh4X­Ö+V¼ôÒK?ùÉOV¬XaµZ§ó?ñûýGŽ9wîœÅbAªSµwïÞd×þŸH$âv»wïÞ­t@·Ò§FGGÚÛÛ›››ÇÇÇM&Ë²r3þp÷^EI’AˆÅb‘HÄn·?ûì³n·»¨¨(;;;®\r###‡–ß±ÇñÂìC°SÏóV«õ7¿ùÍt&¢\'566600ðàÁŸÏÇÇÇåæTîi[­V‡Ã‘››[TT”•••Ø¸uëÖþýûƒÁ ÎMAvŠ’ÇÌÛ¶m{ñÅS­=ŒD\"çÏŸÿè£AÀûêÔ„1vŠ¢iZ^Iz÷îÝ¨/áÔÒýû÷:túôi†a°<e!Ø©‹¢(½^?44tüøqQóóó“ø2I’$ŸÏwüøñ¿üå/>Ÿ¯µRvw¥4I’(Šb¦©©é»ï¾KîÞìáááÁÁA‹Å‹ÅRütÀ;E‰¢FY–]¼xñ+¯¼òä“O\ZÆ¤7’<Ïûýþ³gÏž;w.Ò41vjB°SŽ$I¡Phþüù«W¯^²dÉ‚’]£I+W®466Þ¸qÃd2a°jìòýÚ¯-[¶,_¾\\eŸvŠ»uëÖG}444d±XïÔ`§\nžçM&SeeåîÝ»Ng²«Ÿ\'Nœ?Þãñ`UiŠ@°“O>™dÕªU6lX´hÑãÿ\'&&Âá0ÏóápXÞ¤õƒòpÝ`0˜L&³Ùœ™™ùø›@GGG¿þúë††ymìcþßà1!ØIÆqœ ¯¿þúªU«ç,!ÇÓÛÛ{÷îÝñññááa¿ß‡\'&&DQœ˜˜øAa›ÍFÓ´Åb±Z­6›Íáp8ÎÜÜÜâââÂÂÂ„›\\Qoß¾ýþûï÷÷÷Os©9Ì;iDQä8î™gžÙ±cÇO<ïÇÃáp0¼sçÎ…:::äó@)Š’_Qÿ£Óé\r˜üÚLúQåä’$Ñ4½xñâÚÚZ—Ëe·Û-K¼¹ \'Nœ8uêÇq8q!Yìä¢¨W_}uõêÕ‹%®Ïöõõõ÷÷_¿~½©©)‹™Íf¹ë;#-¤¼?„ã8Q«««—.]ZZZZ^^oD¯_¿þá‡öõõáöÜ¤@°“€çy–eß~ûm—ËW\Z;::\Z»ºº<Ã0³z` œpžç322.\\èv»W¬X×¿AÿøÇ?:;;±£S{¶Ö8Ž[²dÉîÝ»çÏŸ?Íø|¾k×®;vÌãñddd°,«åY¥’$Åb1Žã8ŽÛ¶mÛªU«\n\n\n¦ÿfëøñã\'Nœø~\\\0ÚÀZqíH’4>>¾víÚ={öLó…V8þæ›oŽ9ræÌyºkVÏ9›”<h7f³¹³³S¾=Óf³©ÜÅ÷°²²²¢¢¢Ï?ÿÜl6#ÛšA°5\"¿vÚ´iÓž={¦3ìE±¹¹ùðáÃ_}õU0L…Mò¦QoÞ¼yåÊ•±±±L¹›a˜üüü²²²ÎÎNÜø£[òxuçÎ[¶l™N>ß{ï½£GF\"ƒÁRaãÍóüÍ›7/\\¸àp8²³³§œZ+((¨¨¨¸~ýz(J©_‡Tö¬“$iddäµ×^ûñ<¡é\'Ÿ|òÁôôôÌÈº‘Y\"¯oáyþâÅ‹§¨¨hÊó‰ÇÂ…åÜ)û{Áž]r[½k×®—_~yÊoóÐÐÐÁƒ¿úê«X,–o€išff``àÒ¥KÙÙÙùùùêý‡Ãáv»oÜ¸‡‘íY…`Ï\"y>yûöíë×¯Ÿò{ÜÒÒòÎ;ïšÍæ4úÒËHyžollÔétÅÅÅê£n‡ÃQZZzáÂy«¹VÕœsìYkjjvíÚ5eüìÙ³E1-\ZêGÑ4m0®]»6::ºhÑ\"õCÚœNçüùóÏœ9ƒyòÙƒ`Ïžçkkkßzë-õæ78pàã?¶Z­iÔP?Juœ8qÂív;•Â………N§óêÕ«qÓ‡`ÏŠX,V\\\\ü‹_üBýBŸÏwôèÑ.Øl62¾ß,ËRÕÞÞ^VV¦r7°N§+((ÝÝÝØ\n6Ò¸‰HYò+ë×^{M}m™×ëý÷¿ÿýÍ7ß¤Î	¤3‚eY¿ßÿ÷¿ÿýêÕ«*ÅŒFãŽ;ìv{,Ó¬nsZì&IR8~ã7žyæ•b^¯÷OúS___ª>#hšŽÅbŸ}öYuuunn®R1½^_]]ÝÔÔ$o‰Ñ²†ÄC‹=Ã8Ž[»v­úe×ápøÐ¡C^¯—ÈTËhšÎÉÉ9tèP¿J±¢¢¢mÛ¶E£ÑäÀJ{&	‚PPP°nÝ:•qc(:räÈµk×NµŒaŸÏ÷·¿ýíþýû*Å^xá…åË—ó<¯YÅæ{&ºººüü|•2Ÿ~úé_|1Gî»bYv||üÏþs(R*c0¶mÛ&\Zí„`ÏŽãª««Ýn·J™–––>ø á{ðÒ‘^¯ihhPÉmnnîŽ;=Â	†É³™!‚Ýnÿío«rnYggçÁƒçà9žz½¾££Ãét–””(•ÉÏÏ\Z\Z’Ð²n¤B‹=3AX¿~½ÊÖüñÜÜÛDQ”Ùl>räHWW—R™ÌÌÌ—^z‰atÈgÄœû’ÍArrrV®\\©Ò744tvvÎ‘¡õ£hšáÈ‘#*¹u»Ý¥¥¥x­=#ì7oÞl³Ù”\n\\¾|ùÔ©Sf³YËZ¥\Z½^ßÝÝ}üøq¥EíØ±#hY+R!ØKE§Ó¹|ùr¥gÏžM…+õ’Îh4655\r*(++«©©‰F£ZÖŠHöã\nƒ?ýéOUN;ºtéÒÕ«WÓtÛÖÌbÆãñ|ñÅ*·ðnÝº¯¾‚ýXb±XUUUuuµRÑÑÑúúú9Þ	˜Ñhüä“Onß¾­T ¨¨hÅŠh´‚ýXAxúé§U¶(~þùçØ™øÙÙÙŸ}ö™ÒS‹Å²dÉŠ¢Ðh?;q’$Y,–¥K—*¼xñ\"®Âø–e»ººTö~ÕÖÖfee!ØÁN\\,+//WºÅZÅ‹/ŽÏÁ×ê(Šây¾¹¹9‰LZÀh4ÖÖÖbõøãÀw.q~¿ÝºuJOGGG/\\¸0g_\\«3­­­G©ÀªU«ÆÇÇµ¬aì‰¢XTTTVV¦T ¥¥åÁƒh®\'%7ÚgÏžU*ðÄO¬\\¹‹U†¯]‚8Ž{á…T\Zä“\'Ob2\\…ÑhlhhPê†eË–)=…)!Ø‰ï‘^¸p¡Rƒ|ëÖ­û÷ï£¹VAQ”ÑhlmmU*P\\\\œ‘‘)´Äà›—QËÊÊTn«?þü”7c€Édºté’ÒÓ¼¼¼…\n‚ e•ˆ`\'B>„Ti/—Ïç»{÷.¶N‰a˜¡¡¡¾¾¾IŸÚl¶¼¼<;1v\"$I*((PzÚÛÛ;44„~ø”hšöz½*sã%%%*‹OA¾|‰E±¼¼|ÒG‚ Ü¹s‡çy¬6›Q¿ýö[¥WÖr°1ÌN\0‚7ùF®Lú4\nuwwcËÇ4éõú®®.¥Ùï¼¼<‹Å‚`\'\0ÁŽ› .—Kéi$¹uëØÓDÓtWWW8V*€ù³Ä Øq‹F£UUUJO¿ûî;ŽãÐŸ&ùÕÙÙ©T`Ñ¢EX¦’\0;n‚ ¨œmvóæMìúˆ‹Á`P	vAA¶p&\0ÁŽÏó*°;::pË\\\\X–íîîVzZZZŠ‰ñ Øñ‘$);;[¥§=00€]q¡iú»ï¾Sy:oÞ<d;^ø\nÆGÅììl¥¹1ŸÏ\'IØñ2£££“>b&\'\'ãñB°ã#Šâ¼yó”:Û÷ïßG?<ò4¥G‡-v¼ìøÈg’*¥wllÍu(ŠRºÜ‹eÙììl;^v|$I2›ÍJ£è±±1°@Ó´ÏçSz¤×ëÑ¾…ñ‘$Éd2)¥K)¦ô§c&##-v¼ìøÈ/±•‚=11®x(ŠRºj“¢¨ììlü‹/;>ê“ÞÑhÁN\0EQ*«PÐO\0‚7•yo,O˜ÊŸ/\Z€?Y|,Ë™3gnÝºõè¨a˜ŽŽìëJ€|öáÃ‡írÓ4=44d±X’R±ôEíÝ»7ÙuH3‚ (mKÐëõ˜OŒ(ŠJ½q–eÑŠZì¸1ƒïÙŒ£i\Z›gfš\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°ôÍª×BJèÇ\0\0\0\0IEND®B`‚'),('1234','Cedula de Ciudadania','GERMAN','GOENAGA','123','german@gmail.com','da91388c72d3e31da19dcd85c97374197748485d','calle 42#31-69','ADMIN','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0H\0\0H\0\0\0½vðd\0\0\0sBITÛáOà\0\0\0_zTXtRaw profile type APP1\0\0™ãJOÍK-ÊLV((ÊOËÌIåR\0c.KK£D04006’F@¶9T(Ñ\0˜˜›¥¡¹Y²™)ˆÏ\0Oºh-ØŒ\0\0ÁIDATxœíÝYl÷áðco{×»Æ8>ƒÀ^;Å1„4€Rq…@\nF…ÚF•šFJß*µ}*}hUU%EEUb\"DIâQÐ8Ø`csClŸk{×öž3»3ó5â<cïbÏîþüý<f~ÿlí—ß1¿ƒÚ»w¯\0ÈB\'»\00ól\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0b“]˜yÒCt: ?(À0ŒN§£’„ZÂlB°É!B,‹F£F£Ñf³Y­Ö¬¬,Š¢rrr~PrxxX’¤±±±`0811Áqœ^¯gYV<\0ÁNo’$	‚Àqœßï¯¬¬t¹\\eee‡Ãd2™L¦ŒŒŠ¢233ð)¿ß/IR ˆD\"‘HÄçóÝ¹sçæÍ›·nÝÊÌÌ4Ã OkvZ’$)‹‰¢h4\Z,X°bÅŠeË–Y­V–eõzý”—£n³Ù¾ÿ/Ë—/Åb~¿¿µµõòåËƒƒƒÇÑ4Í²,žŽ¨½{÷&»Žãt:ÝÒ¥K—.]ZYY™——7ã?âÞ½{W¯^½zõªN§3\Z3þ#`V¡ÅN’$E£QŸÏ÷òË/?ÿüóö±gJ^^^^^^mmíÐÐPccãgŸ}æp8ôz=Zït;=ð<o2™ªªª6oÞüä“OjüÓûúú>ýôÓŽŽŽH$b04þé\0¦¦¦&Ùu\05’$…B¡§Ÿ~úõ×_ß¸qcVV–öuÈÊÊZ¾|yyyùÄÄD?šîÔ‡®xê’ûÞÇíÝ»·¶¶Öjµ&·>EEE---4\Zˆw*C‹¢äyï¥K—þîw¿s¹\\)Ò6,X½zõƒîÝ»GÓ4²š0ÆNE¢(F£Ñ;w®^½:±éh4êõzý~8–›ýïÉ­ÙlÎÌÌt:Óy=ö(ŽãÎ;÷ŸÿüG¯×Ó4&§tÅSN4\Z¥iúÍ7ß¬­­÷³^¯·³³³««kxxx||<ÈÁŽD\"ß—1™Lr°322ìv{NNÎÂ…+++NçôÑh\\·nÓéü×¿þFû×fZìÔÂó|iiéÏþó¢¢¢i~$‰x½Þ›7ož<yòÎ;z½^^:öý:ð‡;Ìòòï“‚F@YYÙÆ].—Óé4™LÓüéõõõ===)2X\0‚B8ŽËÎÎþÃþàp8¦S>‹utt´¶¶¶´´øý~³Ùü8‹½A‡Ã™™™µµµÏ<óLUUËN«CçóùöíÛ7::Šu,©ÁN<Ï¿ùæ›óçÏŸNùöööO?ýtppçyƒÁ0S“X’$ÉÿÃÂÂÂÍ›7»Ýîé|Êãñ¼óÎ;ýýýh·SfÅSÏó‹/þõ¯ýèN¬Guuu9räèÑ£Á`pÆ—sS%7Ô>ŸïüùówïÞu:ÙÙÙêŸ²Z­K–,éëëóx<Ø\"–\nìä!\nýñœ2?±Xìüùóï½÷^oo¯Õj½·MEÑ4m4\ZûûûÛÛÛÍfsaa¡zb-Keeå\'Ÿ|‚yòT€`\'™ ¿ÿýïóóóÕK>xð`ÿþýgÎœÑétšÍB³,‹ÅZ[[{{{ËËËÕÉX,–šššöövyg˜65„I!ØÉ$ÏKÿìg?«®®V/ÖÓÓ³oß>Çc2™4^BQ”^¯¿wïÞÿû_—Ëåp8T*àp8G[[fI.;™B¡Ð/¼°yófõb×¯_ÿç?ÿÉq\\§¦ä¦ûòåË………¹¹¹*%‡‡‡»ºº0‘–DvÒD£ÑÒÒÒ·ß~[¥eE±¡¡áÀÃ$}RŠ¦éh4zæÌ½^¿hÑ\"•j»Ýî7nx½Þ¤×yÎÂ@(9DQ4›Í;vìPï¯655}øá‡6›-E†¬4MÛl¶?ü°©©I¥EQ;vì0›Í¢(jV7xZìäˆD\"ë×¯ñÅUÊ\\¹råý÷ß—\'¨5«Ø”(Šb¦³³3??ÿ‰\'žP*–““‡oÞ¼‰Õ¦I‘Bß˜¹CE§Ó¹iÓ&•2}}}ûöíKÍéeš¦9ŽÛ·o___ŸJ±M›69N4ÚI‘r_š¹`||¼®®Îl6+ðz½ï¾û®ÝnOÁTËhš¶Ûíï¾û®×ëU*c6›ëêêÆÇÇµ¬ÈRô{C°X,VUU¥²T“çù“\'OöööNs©v²°,ÛÛÛ{òäIžç•Ê¸ÝîªªªX,¦eÅ@‡`kL’$Q7nÜh±X”Ê´¶¶ž:u*-6TÆS§Nµ¶¶*°X,7nEQÞRšA°5%Â¢E‹***”\núúz‹Å’«;(Š²X,õõõ@@©LEEÅ¢E‹½ff‚­)ŽãjjjTŽ\r>yòd8NÙ¡õ£hš‡Ã\'OžT*™™év»>Â46_ 2ƒÁçŸ^éiOOOccãô9H&“©±±±§§G©ÀsÏ=\n…´¬ ØÚ‰Åbn·[it-B[[Ûøøx\Z5×2š¦ÇÇÇÛÚÚ”úÛ6›íé§ŸÆš–Òì;”ÖB¡P]]ÒÓ‘‘‘†††´˜3{”ÑhlhhQ*PWW‡F[K¶FDQÌËËSÙ>ÑÜÜ,IRZÌ™=Š¢(I’š››•\näæææååa±ŠflD£Q—Ë¥ò–ëôéÓi7º~˜Éd:}ú´ÒS‹Åâr¹¢Ñ¨–UšËlˆ¢XUU¥Ý7nƒÁ4m®eEƒÁ7nLúT¾x-¶fl-H’d³ÙT®ÝêêêÒýÿC‚ÓŽ\\yù™TVV–ÍfÃJm ØZw}(~411ÑÓÓCÀÖe†azzz&&&&}šŸŸŸF[¶ä`ÛíöIŸz½Þþþ~2‚Ýßß¯´-Än·Ûív[¶DQT¹ ‰ŒŒŒ¤ÝëëGÑ4=22òðuB?àp8lm¤ý—)-Äb1¥~¸$I·oß& Õ2š¦oß¾­4.,,Ä2mò}Jq‚ (]y\'ÂððpŠïÐœ>–e‡‡‡•– 9NìÑ‚­A”ºâ¢(0À–1388¨Ôßv8¶6l-‚ tÔ¾$I>Ÿ/­_t=Œ¢(ŸÏ§Ô·Z­¶6l-ð<¯´˜T’¤ÑÑQ’‚=::ªìÜÜ\\•ãV`!Ø\ZQú®K’ä÷ûI\n¶ßïWùe5®Ïœ…`Á ‚­•Î61ïºd*¿1#ŽÔ‡`keY¿ß?é#š¦\n\nˆY%ŠbAAÒz¿ßOØ¿b)ÁÖË²*§‹˜L&bf•$IRÙU>22‚`kÁÖÃ0Á`PéQII	1owA())QZo‰YŠ“âl-°,ëñx&}DÓô¼yóHêŠÏ›7O©+îñxÐbkÁÖÃ0J]qš¦ËËË‰9v›ã¸òòr¥`ŒŒ ÅÖ‚­š¦•ZlNg·ÛN\'ÃlI’T¶ëtº¡¡![¶hšöù|J•m6[~~>ÃlAòóóm6Û¤O#‘HºŸë–Fl-ÈÁ¾wïÞ¤OçÍ›W\\\\LF°‹‹‹çÍ›7éÓ{÷îy½^bvž§8ü•µ@Ó´×ëUéWVVjYŸÙ£ò‹x<[3ø+kDÅû÷ï+Í~Ë—H§õ0[’$ùêïIŸ\n‚ ²Of‚­ƒÁÐÖÖ¦´þÌb±¬Y³&­·4ò<¿fÍ\Z¥Àµk×ƒÆµš³l0ÓÕÕ¥t‚§N§[»vmú6Úrs½víZ¥^¯·»»SâšA°µ£×ë›šš”žæåå¹Ýî4½\'\ZºÝî¼¼<¥MMMXš¢%[;F£ñØ±cJOM&Ó†\rX–M»F[’$–e7lØ ²JüØ±ciz‘hšB°µCQ”Ùl¾té’RòòòeË–¥]£F—-[V^^®TàÒ¥Kf³o°µ„`kÊd2µµµ)M†õë×¥Q£-IÒØØØúõë•&ÆDQlkkKë‹DÓ‚­)½^ßÖÖÖÑÑ¡T ¤¤dÏž=*—i¤šH$²gÏž’’¥mmmz½^ËZ‚­)Š¢8Ž»xñ¢J{íÚµ.—+-¶…pçr¹T&Ã£ÑèÅ‹9ŽC?\\c¶ÖL&Ó—_~Ùßß¯TÀn·oß¾Ýf³¥ørQm6ÛöíÛUv}ô÷÷ùå—è‡kÁN«ÕZ__¯’Ûòòò]»v”lK’víÚ¥2g&Šb}}½ÒM	0«ì$`Y¶¿¿¿¥¥E¥Ì³Ï>»eË•3º“H>}Ë–-Ï>û¬J±–––þþ~¼¾N\n¦¦¦&Ùu˜‹(Š\Z¨¬¬TÚä¨Óé***X–½qãË²©3F•$)‰lÛ¶íÕW_UÙÑ144ôþûïG\"ìúH\nüÑ“C¾¼îÔ©S*eX–]·nÝÊ•+C¡f›R(Z¹råºuëÔ›âS§N‘tÙ`ÚA‹4z½þÛo¿-(((,,T*c0*++%Ijoo7™LÉm·åWÖ¯¼òJ]]]FF†JÉæææ£GbtDv2±,ÛÞÞ^YY™­TÆ`0TUUåää´µµQ•¬ž­ Ñhô—¿üå¦M›Ô‡vuuíß¿_¯×§ÎðaB°“‰¢¨X,vÿþýêêj³Ù¬R¬¤¤$??ÿÛo¿MÊ™û‘H$++ë7ÞxþùçÕãêóù:4::Š9³äB°“L>À´»»ûG?ú‘zÉ‚‚‚%K–Ð4­MÓ-B$Yºté¯~õ«ŠŠŠ)Ëÿõ¯½sçÖ™%‚|ÃÜ½{wll¬ººZ}¶)33ó¹çž³ÙlÃÃÃ^¯—a˜ÙëîJ’Äq\\~~þÖ­[wïÞ™™©^žçùúúú––•®hÁN	z½¾··7‰¸\\®)›âÒÒÒ%K–ÈËÎu:ÝŒÇ[ÅH$¶nÝºsçÎ§žzjÊÄb±cÇŽ;w.é3| C°S‚<+ÖÕÕuïÞ½åË—OYÞjµº\\®5kÖÈ=ùP(‹Å3á’$ñ</I’ÝnñÅßzë­ÚÚÚiÎl8pàë¯¿6HuŠ@°SEQ,ËvwwOLL”——Oy,EQV«õ©§žª©©),,´Z­<“‡ßÓ˜$IÑh4X­Ö+V¼ôÒK?ùÉOV¬XaµZ§ó?ñûýGŽ9wîœÅbAªSµwïÞd×þŸH$âv»wïÞ­t@·Ò§FGGÚÛÛ›››ÇÇÇM&Ë²r3þp÷^EI’AˆÅb‘HÄn·?ûì³n·»¨¨(;;;®\r###‡–ß±ÇñÂìC°SÏóV«õ7¿ùÍt&¢\'566600ðàÁŸÏÇÇÇåæTîi[­V‡Ã‘››[TT”•••Ø¸uëÖþýûƒÁ ÎMAvŠ’ÇÌÛ¶m{ñÅS­=ŒD\"çÏŸÿè£AÀûêÔ„1vŠ¢iZ^Iz÷îÝ¨/áÔÒýû÷:túôi†a°<e!Ø©‹¢(½^?44tüøqQóóó“ø2I’$ŸÏwüøñ¿üå/>Ÿ¯µRvw¥4I’(Šb¦©©é»ï¾KîÞìáááÁÁA‹Å‹ÅRütÀ;E‰¢FY–]¼xñ+¯¼òä“O\ZÆ¤7’<Ïûýþ³gÏž;w.Ò41vjB°SŽ$I¡Phþüù«W¯^²dÉ‚’]£I+W®466Þ¸qÃd2a°jìòýÚ¯-[¶,_¾\\eŸvŠ»uëÖG}444d±XïÔ`§\nžçM&SeeåîÝ»Ng²«Ÿ\'Nœ?Þãñ`UiŠ@°“O>™dÕªU6lX´hÑãÿ\'&&Âá0ÏóápXÞ¤õƒòpÝ`0˜L&³Ùœ™™ùø›@GGG¿þúë††ymìcþßà1!ØIÆqœ ¯¿þúªU«ç,!ÇÓÛÛ{÷îÝñññááa¿ß‡\'&&DQœ˜˜øAa›ÍFÓ´Åb±Z­6›Íáp8ÎÜÜÜâââÂÂÂ„›\\Qoß¾ýþûï÷÷÷Os©9Ì;iDQä8î™gžÙ±cÇO<ïÇÃáp0¼sçÎ…:::äó@)Š’_Qÿ£Óé\r˜üÚLúQåä’$Ñ4½xñâÚÚZ—Ëe·Û-K¼¹ \'Nœ8uêÇq8q!Yìä¢¨W_}uõêÕ‹%®Ïöõõõ÷÷_¿~½©©)‹™Íf¹ë;#-¤¼?„ã8Q«««—.]ZZZZ^^oD¯_¿þá‡öõõáöÜ¤@°“€çy–eß~ûm—ËW\Z;::\Z»ºº<Ã0³z` œpžç322.\\èv»W¬X×¿AÿøÇ?:;;±£S{¶Ö8Ž[²dÉîÝ»çÏŸ?Íø|¾k×®;vÌãñddd°,«åY¥’$Åb1Žã8ŽÛ¶mÛªU«\n\n\n¦ÿfëøñã\'Nœø~\\\0ÚÀZqíH’4>>¾víÚ={öLó…V8þæ›oŽ9ræÌyºkVÏ9›”<h7f³¹³³S¾=Óf³©ÜÅ÷°²²²¢¢¢Ï?ÿÜl6#ÛšA°5\"¿vÚ´iÓž={¦3ìE±¹¹ùðáÃ_}õU0L…Mò¦QoÞ¼yåÊ•±±±L¹›a˜üüü²²²ÎÎNÜø£[òxuçÎ[¶l™N>ß{ï½£GF\"ƒÁRaãÍóüÍ›7/\\¸àp8²³³§œZ+((¨¨¨¸~ýz(J©_‡Tö¬“$iddäµ×^ûñ<¡é\'Ÿ|òÁôôôÌÈº‘Y\"¯oáyþâÅ‹§¨¨hÊó‰ÇÂ…åÜ)û{Áž]r[½k×®—_~yÊoóÐÐÐÁƒ¿úê«X,–o€išff``àÒ¥KÙÙÙùùùêý‡Ãáv»oÜ¸‡‘íY…`Ï\"y>yûöíë×¯Ÿò{ÜÒÒòÎ;ïšÍæ4úÒËHyžollÔétÅÅÅê£n‡ÃQZZzáÂy«¹VÕœsìYkjjvíÚ5eüìÙ³E1-\ZêGÑ4m0®]»6::ºhÑ\"õCÚœNçüùóÏœ9ƒyòÙƒ`Ïžçkkkßzë-õæ78pàã?¶Z­iÔP?Juœ8qÂív;•Â………N§óêÕ«qÓ‡`ÏŠX,V\\\\ü‹_üBýBŸÏwôèÑ.Øl62¾ß,ËRÕÞÞ^VV¦r7°N§+((ÝÝÝØ\n6Ò¸‰HYò+ë×^{M}m™×ëý÷¿ÿýÍ7ß¤Î	¤3‚eY¿ßÿ÷¿ÿýêÕ«*ÅŒFãŽ;ìv{,Ó¬nsZì&IR8~ã7žyæ•b^¯÷OúS___ª>#hšŽÅbŸ}öYuuunn®R1½^_]]ÝÔÔ$o‰Ñ²†ÄC‹=Ã8Ž[»v­úe×ápøÐ¡C^¯—ÈTËhšÎÉÉ9tèP¿J±¢¢¢mÛ¶E£ÑäÀJ{&	‚PPP°nÝ:•qc(:räÈµk×NµŒaŸÏ÷·¿ýíþýû*Å^xá…åË—ó<¯YÅæ{&ºººüü|•2Ÿ~úé_|1Gî»bYv||üÏþs(R*c0¶mÛ&\Zí„`ÏŽãª««Ýn·J™–––>ø á{ðÒ‘^¯ihhPÉmnnîŽ;=Â	†É³™!‚Ýnÿío«rnYggçÁƒçà9žz½¾££Ãét–””(•ÉÏÏ\Z\Z’Ð²n¤B‹=3AX¿~½ÊÖüñÜÜÛDQ”Ùl>räHWW—R™ÌÌÌ—^z‰atÈgÄœû’ÍArrrV®\\©Ò744tvvÎ‘¡õ£hšáÈ‘#*¹u»Ý¥¥¥x­=#ì7oÞl³Ù”\n\\¾|ùÔ©Sf³YËZ¥\Z½^ßÝÝ}üøq¥EíØ±#hY+R!ØKE§Ó¹|ùr¥gÏžM…+õ’Îh4655\r*(++«©©‰F£ZÖŠHöã\nƒ?ýéOUN;ºtéÒÕ«WÓtÛÖÌbÆãñ|ñÅ*·ðnÝº¯¾‚ýXb±XUUUuuµRÑÑÑúúú9Þ	˜Ñhüä“Onß¾­T ¨¨hÅŠh´‚ýXAxúé§U¶(~þùçØ™øÙÙÙŸ}ö™ÒS‹Å²dÉŠ¢Ðh?;q’$Y,–¥K—*¼xñ\"®Âø–e»ººTö~ÕÖÖfee!ØÁN\\,+//WºÅZÅ‹/ŽÏÁ×ê(Šây¾¹¹9‰LZÀh4ÖÖÖbõøãÀw.q~¿ÝºuJOGGG/\\¸0g_\\«3­­­G©ÀªU«ÆÇÇµ¬aì‰¢XTTTVV¦T ¥¥åÁƒh®\'%7ÚgÏžU*ðÄO¬\\¹‹U†¯]‚8Ž{á…T\Zä“\'Ob2\\…ÑhlhhPê†eË–)=…)!Ø‰ï‘^¸p¡Rƒ|ëÖ­û÷ï£¹VAQ”ÑhlmmU*P\\\\œ‘‘)´Äà›—QËÊÊTn«?þü”7c€Édºté’ÒÓ¼¼¼…\n‚ e•ˆ`\'B>„Ti/—Ïç»{÷.¶N‰a˜¡¡¡¾¾¾IŸÚl¶¼¼<;1v\"$I*((PzÚÛÛ;44„~ø”hšöz½*sã%%%*‹OA¾|‰E±¼¼|ÒG‚ Ü¹s‡çy¬6›Q¿ýö[¥WÖr°1ÌN\0‚7ùF®Lú4\nuwwcËÇ4éõú®®.¥Ùï¼¼<‹Å‚`\'\0ÁŽ› .—Kéi$¹uëØÓDÓtWWW8V*€ù³Ä Øq‹F£UUUJO¿ûî;ŽãÐŸ&ùÕÙÙ©T`Ñ¢EX¦’\0;n‚ ¨œmvóæMìúˆ‹Á`P	vAA¶p&\0ÁŽÏó*°;::pË\\\\X–íîîVzZZZŠ‰ñ Øñ‘$);;[¥§=00€]q¡iú»ï¾Sy:oÞ<d;^ø\nÆGÅììl¥¹1ŸÏ\'IØñ2£££“>b&\'\'ãñB°ã#Šâ¼yó”:Û÷ïßG?<ò4¥G‡-v¼ìøÈg’*¥wllÍu(ŠRºÜ‹eÙììl;^v|$I2›ÍJ£è±±1°@Ó´ÏçSz¤×ëÑ¾…ñ‘$Éd2)¥K)¦ô§c&##-v¼ìøÈ/±•‚=11®x(ŠRºj“¢¨ììlü‹/;>ê“ÞÑhÁN\0EQ*«PÐO\0‚7•yo,O˜ÊŸ/\Z€?Y|,Ë™3gnÝºõè¨a˜ŽŽìëJ€|öáÃ‡írÓ4=44d±X’R±ôEíÝ»7ÙuH3‚ (mKÐëõ˜OŒ(ŠJ½q–eÑŠZì¸1ƒïÙŒ£i\Z›gfš\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°ôÍª×BJèÇ\0\0\0\0IEND®B`‚'),('1234567','Cedula de Ciudadania','JUAN','CERVANTES','123','juan@gmail.com','c5652d9cc6bcf28e0e20210eae5ef9e54ba35717','calle 42#31-69','ADMIN','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0H\0\0H\0\0\0½vðd\0\0\0sBITÛáOà\0\0\0_zTXtRaw profile type APP1\0\0™ãJOÍK-ÊLV((ÊOËÌIåR\0c.KK£D04006’F@¶9T(Ñ\0˜˜›¥¡¹Y²™)ˆÏ\0Oºh-ØŒ\0\0ÁIDATxœíÝYl÷áðco{×»Æ8>ƒÀ^;Å1„4€Rq…@\nF…ÚF•šFJß*µ}*}hUU%EEUb\"DIâQÐ8Ø`csClŸk{×öž3»3ó5â<cïbÏîþüý<f~ÿlí—ß1¿ƒÚ»w¯\0ÈB\'»\00ól\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0b“]˜yÒCt: ?(À0ŒN§£’„ZÂlB°É!B,‹F£F£Ñf³Y­Ö¬¬,Š¢rrr~PrxxX’¤±±±`0811Áqœ^¯gYV<\0ÁNo’$	‚Àqœßï¯¬¬t¹\\eee‡Ãd2™L¦ŒŒŠ¢233ð)¿ß/IR ˆD\"‘HÄçóÝ¹sçæÍ›·nÝÊÌÌ4Ã OkvZ’$)‹‰¢h4\Z,X°bÅŠeË–Y­V–eõzý”—£n³Ù¾ÿ/Ë—/Åb~¿¿µµõòåËƒƒƒÇÑ4Í²,žŽ¨½{÷&»Žãt:ÝÒ¥K—.]ZYY™——7ã?âÞ½{W¯^½zõªN§3\Z3þ#`V¡ÅN’$E£QŸÏ÷òË/?ÿüóö±gJ^^^^^^mmíÐÐPccãgŸ}æp8ôz=Zït;=ð<o2™ªªª6oÞüä“OjüÓûúú>ýôÓŽŽŽH$b04þé\0¦¦¦&Ùu\05’$…B¡§Ÿ~úõ×_ß¸qcVV–öuÈÊÊZ¾|yyyùÄÄD?šîÔ‡®xê’ûÞÇíÝ»·¶¶Öjµ&·>EEE---4\Zˆw*C‹¢äyï¥K—þîw¿s¹\\)Ò6,X½zõƒîÝ»GÓ4²š0ÆNE¢(F£Ñ;w®^½:±éh4êõzý~8–›ýïÉ­ÙlÎÌÌt:Óy=ö(ŽãÎ;÷ŸÿüG¯×Ó4&§tÅSN4\Z¥iúÍ7ß¬­­÷³^¯·³³³««kxxx||<ÈÁŽD\"ß—1™Lr°322ìv{NNÎÂ…+++NçôÑh\\·nÓéü×¿þFû×fZìÔÂó|iiéÏþó¢¢¢i~$‰x½Þ›7ož<yòÎ;z½^^:öý:ð‡;Ìòòï“‚F@YYÙÆ].—Óé4™LÓüéõõõ===)2X\0‚B8ŽËÎÎþÃþàp8¦S>‹utt´¶¶¶´´øý~³Ùü8‹½A‡Ã™™™µµµÏ<óLUUËN«CçóùöíÛ7::Šu,©ÁN<Ï¿ùæ›óçÏŸNùöööO?ýtppçyƒÁ0S“X’$ÉÿÃÂÂÂÍ›7»Ýîé|Êãñ¼óÎ;ýýýh·SfÅSÏó‹/þõ¯ýèN¬Guuu9räèÑ£Á`pÆ—sS%7Ô>ŸïüùówïÞu:ÙÙÙêŸ²Z­K–,éëëóx<Ø\"–\nìä!\nýñœ2?±Xìüùóï½÷^oo¯Õj½·MEÑ4m4\ZûûûÛÛÛÍfsaa¡zb-Keeå\'Ÿ|‚yòT€`\'™ ¿ÿýïóóóÕK>xð`ÿþýgÎœÑétšÍB³,‹ÅZ[[{{{ËËËÕÉX,–šššöövyg˜65„I!ØÉ$ÏKÿìg?«®®V/ÖÓÓ³oß>Çc2™4^BQ”^¯¿wïÞÿû_—Ëåp8T*àp8G[[fI.;™B¡Ð/¼°yófõb×¯_ÿç?ÿÉq\\§¦ä¦ûòåË………¹¹¹*%‡‡‡»ºº0‘–DvÒD£ÑÒÒÒ·ß~[¥eE±¡¡áÀÃ$}RŠ¦éh4zæÌ½^¿hÑ\"•j»Ýî7nx½Þ¤×yÎÂ@(9DQ4›Í;vìPï¯655}øá‡6›-E†¬4MÛl¶?ü°©©I¥EQ;vì0›Í¢(jV7xZìäˆD\"ë×¯ñÅUÊ\\¹råý÷ß—\'¨5«Ø”(Šb¦³³3??ÿ‰\'žP*–““‡oÞ¼‰Õ¦I‘Bß˜¹CE§Ó¹iÓ&•2}}}ûöíKÍéeš¦9ŽÛ·o___ŸJ±M›69N4ÚI‘r_š¹`||¼®®Îl6+ðz½ï¾û®ÝnOÁTËhš¶Ûíï¾û®×ëU*c6›ëêêÆÇÇµ¬ÈRô{C°X,VUU¥²T“çù“\'OöööNs©v²°,ÛÛÛ{òäIžç•Ê¸ÝîªªªX,¦eÅ@‡`kL’$Q7nÜh±X”Ê´¶¶ž:u*-6TÆS§Nµ¶¶*°X,7nEQÞRšA°5%Â¢E‹***”\núúz‹Å’«;(Š²X,õõõ@@©LEEÅ¢E‹½ff‚­)ŽãjjjTŽ\r>yòd8NÙ¡õ£hš‡Ã\'OžT*™™év»>Â46_ 2ƒÁçŸ^éiOOOccãô9H&“©±±±§§G©ÀsÏ=\n…´¬ ØÚ‰Åbn·[it-B[[Ûøøx\Z5×2š¦ÇÇÇÛÚÚ”úÛ6›íé§ŸÆš–Òì;”ÖB¡P]]ÒÓ‘‘‘†††´˜3{”ÑhlhhQ*PWW‡F[K¶FDQÌËËSÙ>ÑÜÜ,IRZÌ™=Š¢(I’š››•\näæææååa±ŠflD£Q—Ë¥ò–ëôéÓi7º~˜Éd:}ú´ÒS‹Åâr¹¢Ñ¨–UšËlˆ¢XUU¥Ý7nƒÁ4m®eEƒÁ7nLúT¾x-¶fl-H’d³ÙT®ÝêêêÒýÿC‚ÓŽ\\yù™TVV–ÍfÃJm ØZw}(~411ÑÓÓCÀÖe†azzz&&&&}šŸŸŸF[¶ä`ÛíöIŸz½Þþþ~2‚Ýßß¯´-Än·Ûív[¶DQT¹ ‰ŒŒŒ¤ÝëëGÑ4=22òðuB?àp8lm¤ý—)-Äb1¥~¸$I·oß& Õ2š¦oß¾­4.,,Ä2mò}Jq‚ (]y\'ÂððpŠïÐœ>–e‡‡‡•– 9NìÑ‚­A”ºâ¢(0À–1388¨Ôßv8¶6l-‚ tÔ¾$I>Ÿ/­_t=Œ¢(ŸÏ§Ô·Z­¶6l-ð<¯´˜T’¤ÑÑQ’‚=::ªìÜÜ\\•ãV`!Ø\ZQú®K’ä÷ûI\n¶ßïWùe5®Ïœ…`Á ‚­•Î61ïºd*¿1#ŽÔ‡`keY¿ß?é#š¦\n\nˆY%ŠbAAÒz¿ßOØ¿b)ÁÖË²*§‹˜L&bf•$IRÙU>22‚`kÁÖÃ0Á`PéQII	1owA())QZo‰YŠ“âl-°,ëñx&}DÓô¼yóHêŠÏ›7O©+îñxÐbkÁÖÃ0J]qš¦ËËË‰9v›ã¸òòr¥`ŒŒ ÅÖ‚­š¦•ZlNg·ÛN\'ÃlI’T¶ëtº¡¡![¶hšöù|J•m6[~~>ÃlAòóóm6Û¤O#‘HºŸë–Fl-ÈÁ¾wïÞ¤OçÍ›W\\\\LF°‹‹‹çÍ›7éÓ{÷îy½^bvž§8ü•µ@Ó´×ëUéWVVjYŸÙ£ò‹x<[3ø+kDÅû÷ï+Í~Ë—H§õ0[’$ùêïIŸ\n‚ ²Of‚­ƒÁÐÖÖ¦´þÌb±¬Y³&­·4ò<¿fÍ\Z¥Àµk×ƒÆµš³l0ÓÕÕ¥t‚§N§[»vmú6Úrs½víZ¥^¯·»»SâšA°µ£×ë›šš”žæåå¹Ýî4½\'\ZºÝî¼¼<¥MMMXš¢%[;F£ñØ±cJOM&Ó†\rX–M»F[’$–e7lØ ²JüØ±ciz‘hšB°µCQ”Ùl¾té’RòòòeË–¥]£F—-[V^^®TàÒ¥Kf³o°µ„`kÊd2µµµ)M†õë×¥Q£-IÒØØØúõë•&ÆDQlkkKë‹DÓ‚­)½^ßÖÖÖÑÑ¡T ¤¤dÏž=*—i¤šH$²gÏž’’¥mmmz½^ËZ‚­)Š¢8Ž»xñ¢J{íÚµ.—+-¶…pçr¹T&Ã£ÑèÅ‹9ŽC?\\c¶ÖL&Ó—_~Ùßß¯TÀn·oß¾Ýf³¥ørQm6ÛöíÛUv}ô÷÷ùå—è‡kÁN«ÕZ__¯’Ûòòò]»v”lK’víÚ¥2g&Šb}}½ÒM	0«ì$`Y¶¿¿¿¥¥E¥Ì³Ï>»eË•3º“H>}Ë–-Ï>û¬J±–––þþ~¼¾N\n¦¦¦&Ùu˜‹(Š\Z¨¬¬TÚä¨Óé***X–½qãË²©3F•$)‰lÛ¶íÕW_UÙÑ144ôþûïG\"ìúH\nüÑ“C¾¼îÔ©S*eX–]·nÝÊ•+C¡f›R(Z¹råºuëÔ›âS§N‘tÙ`ÚA‹4z½þÛo¿-(((,,T*c0*++%Ijoo7™LÉm·åWÖ¯¼òJ]]]FF†JÉæææ£GbtDv2±,ÛÞÞ^YY™­TÆ`0TUUåää´µµQ•¬ž­ Ñhô—¿üå¦M›Ô‡vuuíß¿_¯×§ÎðaB°“‰¢¨X,vÿþýêêj³Ù¬R¬¤¤$??ÿÛo¿MÊ™û‘H$++ë7ÞxþùçÕãêóù:4::Š9³äB°“L>À´»»ûG?ú‘zÉ‚‚‚%K–Ð4­MÓ-B$Yºté¯~õ«ŠŠŠ)Ëÿõ¯½sçÖ™%‚|ÃÜ½{wll¬ººZ}¶)33ó¹çž³ÙlÃÃÃ^¯—a˜ÙëîJ’Äq\\~~þÖ­[wïÞ™™©^žçùúúú––•®hÁN	z½¾··7‰¸\\®)›âÒÒÒ%K–ÈËÎu:ÝŒÇ[ÅH$¶nÝºsçÎ§žzjÊÄb±cÇŽ;w.é3| C°S‚<+ÖÕÕuïÞ½åË—OYÞjµº\\®5kÖÈ=ùP(‹Å3á’$ñ</I’ÝnñÅßzë­ÚÚÚiÎl8pàë¯¿6HuŠ@°SEQ,ËvwwOLL”——Oy,EQV«õ©§žª©©),,´Z­<“‡ßÓ˜$IÑh4X­Ö+V¼ôÒK?ùÉOV¬XaµZ§ó?ñûýGŽ9wîœÅbAªSµwïÞd×þŸH$âv»wïÞ­t@·Ò§FGGÚÛÛ›››ÇÇÇM&Ë²r3þp÷^EI’AˆÅb‘HÄn·?ûì³n·»¨¨(;;;®\r###‡–ß±ÇñÂìC°SÏóV«õ7¿ùÍt&¢\'566600ðàÁŸÏÇÇÇåæTîi[­V‡Ã‘››[TT”•••Ø¸uëÖþýûƒÁ ÎMAvŠ’ÇÌÛ¶m{ñÅS­=ŒD\"çÏŸÿè£AÀûêÔ„1vŠ¢iZ^Iz÷îÝ¨/áÔÒýû÷:túôi†a°<e!Ø©‹¢(½^?44tüøqQóóó“ø2I’$ŸÏwüøñ¿üå/>Ÿ¯µRvw¥4I’(Šb¦©©é»ï¾KîÞìáááÁÁA‹Å‹ÅRütÀ;E‰¢FY–]¼xñ+¯¼òä“O\ZÆ¤7’<Ïûýþ³gÏž;w.Ò41vjB°SŽ$I¡Phþüù«W¯^²dÉ‚’]£I+W®466Þ¸qÃd2a°jìòýÚ¯-[¶,_¾\\eŸvŠ»uëÖG}444d±XïÔ`§\nžçM&SeeåîÝ»Ng²«Ÿ\'Nœ?Þãñ`UiŠ@°“O>™dÕªU6lX´hÑãÿ\'&&Âá0ÏóápXÞ¤õƒòpÝ`0˜L&³Ùœ™™ùø›@GGG¿þúë††ymìcþßà1!ØIÆqœ ¯¿þúªU«ç,!ÇÓÛÛ{÷îÝñññááa¿ß‡\'&&DQœ˜˜øAa›ÍFÓ´Åb±Z­6›Íáp8ÎÜÜÜâââÂÂÂ„›\\Qoß¾ýþûï÷÷÷Os©9Ì;iDQä8î™gžÙ±cÇO<ïÇÃáp0¼sçÎ…:::äó@)Š’_Qÿ£Óé\r˜üÚLúQåä’$Ñ4½xñâÚÚZ—Ëe·Û-K¼¹ \'Nœ8uêÇq8q!Yìä¢¨W_}uõêÕ‹%®Ïöõõõ÷÷_¿~½©©)‹™Íf¹ë;#-¤¼?„ã8Q«««—.]ZZZZ^^oD¯_¿þá‡öõõáöÜ¤@°“€çy–eß~ûm—ËW\Z;::\Z»ºº<Ã0³z` œpžç322.\\èv»W¬X×¿AÿøÇ?:;;±£S{¶Ö8Ž[²dÉîÝ»çÏŸ?Íø|¾k×®;vÌãñddd°,«åY¥’$Åb1Žã8ŽÛ¶mÛªU«\n\n\n¦ÿfëøñã\'Nœø~\\\0ÚÀZqíH’4>>¾víÚ={öLó…V8þæ›oŽ9ræÌyºkVÏ9›”<h7f³¹³³S¾=Óf³©ÜÅ÷°²²²¢¢¢Ï?ÿÜl6#ÛšA°5\"¿vÚ´iÓž={¦3ìE±¹¹ùðáÃ_}õU0L…Mò¦QoÞ¼yåÊ•±±±L¹›a˜üüü²²²ÎÎNÜø£[òxuçÎ[¶l™N>ß{ï½£GF\"ƒÁRaãÍóüÍ›7/\\¸àp8²³³§œZ+((¨¨¨¸~ýz(J©_‡Tö¬“$iddäµ×^ûñ<¡é\'Ÿ|òÁôôôÌÈº‘Y\"¯oáyþâÅ‹§¨¨hÊó‰ÇÂ…åÜ)û{Áž]r[½k×®—_~yÊoóÐÐÐÁƒ¿úê«X,–o€išff``àÒ¥KÙÙÙùùùêý‡Ãáv»oÜ¸‡‘íY…`Ï\"y>yûöíë×¯Ÿò{ÜÒÒòÎ;ïšÍæ4úÒËHyžollÔétÅÅÅê£n‡ÃQZZzáÂy«¹VÕœsìYkjjvíÚ5eüìÙ³E1-\ZêGÑ4m0®]»6::ºhÑ\"õCÚœNçüùóÏœ9ƒyòÙƒ`Ïžçkkkßzë-õæ78pàã?¶Z­iÔP?Juœ8qÂív;•Â………N§óêÕ«qÓ‡`ÏŠX,V\\\\ü‹_üBýBŸÏwôèÑ.Øl62¾ß,ËRÕÞÞ^VV¦r7°N§+((ÝÝÝØ\n6Ò¸‰HYò+ë×^{M}m™×ëý÷¿ÿýÍ7ß¤Î	¤3‚eY¿ßÿ÷¿ÿýêÕ«*ÅŒFãŽ;ìv{,Ó¬nsZì&IR8~ã7žyæ•b^¯÷OúS___ª>#hšŽÅbŸ}öYuuunn®R1½^_]]ÝÔÔ$o‰Ñ²†ÄC‹=Ã8Ž[»v­úe×ápøÐ¡C^¯—ÈTËhšÎÉÉ9tèP¿J±¢¢¢mÛ¶E£ÑäÀJ{&	‚PPP°nÝ:•qc(:räÈµk×NµŒaŸÏ÷·¿ýíþýû*Å^xá…åË—ó<¯YÅæ{&ºººüü|•2Ÿ~úé_|1Gî»bYv||üÏþs(R*c0¶mÛ&\Zí„`ÏŽãª««Ýn·J™–––>ø á{ðÒ‘^¯ihhPÉmnnîŽ;=Â	†É³™!‚Ýnÿío«rnYggçÁƒçà9žz½¾££Ãét–””(•ÉÏÏ\Z\Z’Ð²n¤B‹=3AX¿~½ÊÖüñÜÜÛDQ”Ùl>räHWW—R™ÌÌÌ—^z‰atÈgÄœû’ÍArrrV®\\©Ò744tvvÎ‘¡õ£hšáÈ‘#*¹u»Ý¥¥¥x­=#ì7oÞl³Ù”\n\\¾|ùÔ©Sf³YËZ¥\Z½^ßÝÝ}üøq¥EíØ±#hY+R!ØKE§Ó¹|ùr¥gÏžM…+õ’Îh4655\r*(++«©©‰F£ZÖŠHöã\nƒ?ýéOUN;ºtéÒÕ«WÓtÛÖÌbÆãñ|ñÅ*·ðnÝº¯¾‚ýXb±XUUUuuµRÑÑÑúúú9Þ	˜Ñhüä“Onß¾­T ¨¨hÅŠh´‚ýXAxúé§U¶(~þùçØ™øÙÙÙŸ}ö™ÒS‹Å²dÉŠ¢Ðh?;q’$Y,–¥K—*¼xñ\"®Âø–e»ººTö~ÕÖÖfee!ØÁN\\,+//WºÅZÅ‹/ŽÏÁ×ê(Šây¾¹¹9‰LZÀh4ÖÖÖbõøãÀw.q~¿ÝºuJOGGG/\\¸0g_\\«3­­­G©ÀªU«ÆÇÇµ¬aì‰¢XTTTVV¦T ¥¥åÁƒh®\'%7ÚgÏžU*ðÄO¬\\¹‹U†¯]‚8Ž{á…T\Zä“\'Ob2\\…ÑhlhhPê†eË–)=…)!Ø‰ï‘^¸p¡Rƒ|ëÖ­û÷ï£¹VAQ”ÑhlmmU*P\\\\œ‘‘)´Äà›—QËÊÊTn«?þü”7c€Édºté’ÒÓ¼¼¼…\n‚ e•ˆ`\'B>„Ti/—Ïç»{÷.¶N‰a˜¡¡¡¾¾¾IŸÚl¶¼¼<;1v\"$I*((PzÚÛÛ;44„~ø”hšöz½*sã%%%*‹OA¾|‰E±¼¼|ÒG‚ Ü¹s‡çy¬6›Q¿ýö[¥WÖr°1ÌN\0‚7ùF®Lú4\nuwwcËÇ4éõú®®.¥Ùï¼¼<‹Å‚`\'\0ÁŽ› .—Kéi$¹uëØÓDÓtWWW8V*€ù³Ä Øq‹F£UUUJO¿ûî;ŽãÐŸ&ùÕÙÙ©T`Ñ¢EX¦’\0;n‚ ¨œmvóæMìúˆ‹Á`P	vAA¶p&\0ÁŽÏó*°;::pË\\\\X–íîîVzZZZŠ‰ñ Øñ‘$);;[¥§=00€]q¡iú»ï¾Sy:oÞ<d;^ø\nÆGÅììl¥¹1ŸÏ\'IØñ2£££“>b&\'\'ãñB°ã#Šâ¼yó”:Û÷ïßG?<ò4¥G‡-v¼ìøÈg’*¥wllÍu(ŠRºÜ‹eÙììl;^v|$I2›ÍJ£è±±1°@Ó´ÏçSz¤×ëÑ¾…ñ‘$Éd2)¥K)¦ô§c&##-v¼ìøÈ/±•‚=11®x(ŠRºj“¢¨ììlü‹/;>ê“ÞÑhÁN\0EQ*«PÐO\0‚7•yo,O˜ÊŸ/\Z€?Y|,Ë™3gnÝºõè¨a˜ŽŽìëJ€|öáÃ‡írÓ4=44d±X’R±ôEíÝ»7ÙuH3‚ (mKÐëõ˜OŒ(ŠJ½q–eÑŠZì¸1ƒïÙŒ£i\Z›gfš\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°ôÍª×BJèÇ\0\0\0\0IEND®B`‚');

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
