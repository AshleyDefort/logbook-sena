/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.5.5-10.4.25-MariaDB : Database - bitacora
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`bitacora` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

/*Data for the table `acta_compromiso` */

LOCK TABLES `acta_compromiso` WRITE;

insert  into `acta_compromiso`(`codActa`,`actaFecha`,`actaIdAprendiz`,`actaFicha`,`actaFuncionario`,`actaMotivoRemision`,`actaDescargoAprendiz`,`actaCompromisos`,`actaRecomendaciones`) values (7,'2023-06-22','123',2452524,'1001946423','Bajo rendimiento acadÃ©mico','x','x','x');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `apre_ficha` */

LOCK TABLES `apre_ficha` WRITE;

insert  into `apre_ficha`(`Cod_Ficha`,`Id_Apre`) values (1234,'456'),(2452524,'123'),(123,'456');

UNLOCK TABLES;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `aprendices_actas` */

LOCK TABLES `aprendices_actas` WRITE;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `aprendiz` */

LOCK TABLES `aprendiz` WRITE;

insert  into `aprendiz`(`Id_Apre`,`Apre_Nom`,`Apre_Ape`,`Apre_Tel`,`Apre_Correo`,`Apre_Sexo`,`Apre_Rol`) values ('123','KENER','ROMERO','123','kener@gmail.com','MASCULINO','APREN'),('456','MARIA','LOPEZ','234','maria@gmail.com','FEMENINO','APREN');

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
  `fk_ficha` int(30) DEFAULT NULL,
  PRIMARY KEY (`Cod_Bit`),
  KEY `Id_ApreFK` (`Id_ApreFK`),
  KEY `ID_FuncFK` (`ID_FuncFK`),
  KEY `Cod_Des_CortFK` (`Cod_Des_CortFK`),
  KEY `bitacora_ibfk_6` (`fk_ficha`),
  CONSTRAINT `bitacora_ibfk_1` FOREIGN KEY (`Id_ApreFK`) REFERENCES `aprendiz` (`Id_Apre`),
  CONSTRAINT `bitacora_ibfk_2` FOREIGN KEY (`ID_FuncFK`) REFERENCES `funcionario` (`ID_Func`),
  CONSTRAINT `bitacora_ibfk_6` FOREIGN KEY (`fk_ficha`) REFERENCES `ficha` (`Cod_Ficha`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `bitacora` */

LOCK TABLES `bitacora` WRITE;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `ficha` */

LOCK TABLES `ficha` WRITE;

insert  into `ficha`(`Cod_Ficha`,`Desc_Fich`,`Cod_ProFK`,`fechaIni_Fich`,`fechaFin_Fich`) values (123,'gestion',1,'2023-05-09','2023-05-31'),(1234,'gestion',2,'2023-05-17','2023-05-31'),(2452524,'SISTEMAS',1,'2022-01-24','2024-01-01');

UNLOCK TABLES;

/*Table structure for table `ficha_fucionario` */

DROP TABLE IF EXISTS `ficha_fucionario`;

CREATE TABLE `ficha_fucionario` (
  `cod_ficha` int(30) DEFAULT NULL,
  `id_funcionario` varchar(50) DEFAULT NULL,
  KEY `fucnionarioId` (`id_funcionario`),
  KEY `fichaCod` (`cod_ficha`),
  CONSTRAINT `fichaCod` FOREIGN KEY (`cod_ficha`) REFERENCES `ficha` (`Cod_Ficha`),
  CONSTRAINT `fucnionarioId` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionario` (`ID_Func`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `ficha_fucionario` */

LOCK TABLES `ficha_fucionario` WRITE;

insert  into `ficha_fucionario`(`cod_ficha`,`id_funcionario`) values (123,'1129506976');

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
  `Fun_Rol` varchar(20) DEFAULT NULL,
  `Fun_Img` blob DEFAULT NULL,
  PRIMARY KEY (`ID_Func`),
  KEY `Cod_RolFK` (`Fun_Rol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `funcionario` */

LOCK TABLES `funcionario` WRITE;

insert  into `funcionario`(`ID_Func`,`Fun_Tip_Doc`,`Fun_Nom`,`Fun_Ape`,`Fun_Tel`,`Fun_Correo`,`Fun_Pswd`,`Fun_Direcc`,`Fun_Rol`,`Fun_Img`) values ('1001946423','Cedula de Ciudadania','BRAYAN','LOPEZ','3022974095','brayanlpz1525@gmail.com','b761d6d20bfb9ab4adf9e9ab7cc5a4de1c4fae34','Calle 46b #16-107','ADMIN','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0H\0\0H\0\0\0½vðd\0\0\0sBITÛáOà\0\0\0_zTXtRaw profile type APP1\0\0™ãJOÍK-ÊLV((ÊOËÌIåR\0c.KK£D04006’F@¶9T(Ñ\0˜˜›¥¡¹Y²™)ˆÏ\0Oºh-ØŒ\0\0ÁIDATxœíÝYl÷áðco{×»Æ8>ƒÀ^;Å1„4€Rq…@\nF…ÚF•šFJß*µ}*}hUU%EEUb\"DIâQÐ8Ø`csClŸk{×öž3»3ó5â<cïbÏîþüý<f~ÿlí—ß1¿ƒÚ»w¯\0ÈB\'»\00ól\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0b“]˜yÒCt: ?(À0ŒN§£’„ZÂlB°É!B,‹F£F£Ñf³Y­Ö¬¬,Š¢rrr~PrxxX’¤±±±`0811Áqœ^¯gYV<\0ÁNo’$	‚Àqœßï¯¬¬t¹\\eee‡Ãd2™L¦ŒŒŠ¢233ð)¿ß/IR ˆD\"‘HÄçóÝ¹sçæÍ›·nÝÊÌÌ4Ã OkvZ’$)‹‰¢h4\Z,X°bÅŠeË–Y­V–eõzý”—£n³Ù¾ÿ/Ë—/Åb~¿¿µµõòåËƒƒƒÇÑ4Í²,žŽ¨½{÷&»Žãt:ÝÒ¥K—.]ZYY™——7ã?âÞ½{W¯^½zõªN§3\Z3þ#`V¡ÅN’$E£QŸÏ÷òË/?ÿüóö±gJ^^^^^^mmíÐÐPccãgŸ}æp8ôz=Zït;=ð<o2™ªªª6oÞüä“OjüÓûúú>ýôÓŽŽŽH$b04þé\0¦¦¦&Ùu\05’$…B¡§Ÿ~úõ×_ß¸qcVV–öuÈÊÊZ¾|yyyùÄÄD?šîÔ‡®xê’ûÞÇíÝ»·¶¶Öjµ&·>EEE---4\Zˆw*C‹¢äyï¥K—þîw¿s¹\\)Ò6,X½zõƒîÝ»GÓ4²š0ÆNE¢(F£Ñ;w®^½:±éh4êõzý~8–›ýïÉ­ÙlÎÌÌt:Óy=ö(ŽãÎ;÷ŸÿüG¯×Ó4&§tÅSN4\Z¥iúÍ7ß¬­­÷³^¯·³³³««kxxx||<ÈÁŽD\"ß—1™Lr°322ìv{NNÎÂ…+++NçôÑh\\·nÓéü×¿þFû×fZìÔÂó|iiéÏþó¢¢¢i~$‰x½Þ›7ož<yòÎ;z½^^:öý:ð‡;Ìòòï“‚F@YYÙÆ].—Óé4™LÓüéõõõ===)2X\0‚B8ŽËÎÎþÃþàp8¦S>‹utt´¶¶¶´´øý~³Ùü8‹½A‡Ã™™™µµµÏ<óLUUËN«CçóùöíÛ7::Šu,©ÁN<Ï¿ùæ›óçÏŸNùöööO?ýtppçyƒÁ0S“X’$ÉÿÃÂÂÂÍ›7»Ýîé|Êãñ¼óÎ;ýýýh·SfÅSÏó‹/þõ¯ýèN¬Guuu9räèÑ£Á`pÆ—sS%7Ô>ŸïüùówïÞu:ÙÙÙêŸ²Z­K–,éëëóx<Ø\"–\nìä!\nýñœ2?±Xìüùóï½÷^oo¯Õj½·MEÑ4m4\ZûûûÛÛÛÍfsaa¡zb-Keeå\'Ÿ|‚yòT€`\'™ ¿ÿýïóóóÕK>xð`ÿþýgÎœÑétšÍB³,‹ÅZ[[{{{ËËËÕÉX,–šššöövyg˜65„I!ØÉ$ÏKÿìg?«®®V/ÖÓÓ³oß>Çc2™4^BQ”^¯¿wïÞÿû_—Ëåp8T*àp8G[[fI.;™B¡Ð/¼°yófõb×¯_ÿç?ÿÉq\\§¦ä¦ûòåË………¹¹¹*%‡‡‡»ºº0‘–DvÒD£ÑÒÒÒ·ß~[¥eE±¡¡áÀÃ$}RŠ¦éh4zæÌ½^¿hÑ\"•j»Ýî7nx½Þ¤×yÎÂ@(9DQ4›Í;vìPï¯655}øá‡6›-E†¬4MÛl¶?ü°©©I¥EQ;vì0›Í¢(jV7xZìäˆD\"ë×¯ñÅUÊ\\¹råý÷ß—\'¨5«Ø”(Šb¦³³3??ÿ‰\'žP*–““‡oÞ¼‰Õ¦I‘Bß˜¹CE§Ó¹iÓ&•2}}}ûöíKÍéeš¦9ŽÛ·o___ŸJ±M›69N4ÚI‘r_š¹`||¼®®Îl6+ðz½ï¾û®ÝnOÁTËhš¶Ûíï¾û®×ëU*c6›ëêêÆÇÇµ¬ÈRô{C°X,VUU¥²T“çù“\'OöööNs©v²°,ÛÛÛ{òäIžç•Ê¸ÝîªªªX,¦eÅ@‡`kL’$Q7nÜh±X”Ê´¶¶ž:u*-6TÆS§Nµ¶¶*°X,7nEQÞRšA°5%Â¢E‹***”\núúz‹Å’«;(Š²X,õõõ@@©LEEÅ¢E‹½ff‚­)ŽãjjjTŽ\r>yòd8NÙ¡õ£hš‡Ã\'OžT*™™év»>Â46_ 2ƒÁçŸ^éiOOOccãô9H&“©±±±§§G©ÀsÏ=\n…´¬ ØÚ‰Åbn·[it-B[[Ûøøx\Z5×2š¦ÇÇÇÛÚÚ”úÛ6›íé§ŸÆš–Òì;”ÖB¡P]]ÒÓ‘‘‘†††´˜3{”ÑhlhhQ*PWW‡F[K¶FDQÌËËSÙ>ÑÜÜ,IRZÌ™=Š¢(I’š››•\näæææååa±ŠflD£Q—Ë¥ò–ëôéÓi7º~˜Éd:}ú´ÒS‹Åâr¹¢Ñ¨–UšËlˆ¢XUU¥Ý7nƒÁ4m®eEƒÁ7nLúT¾x-¶fl-H’d³ÙT®ÝêêêÒýÿC‚ÓŽ\\yù™TVV–ÍfÃJm ØZw}(~411ÑÓÓCÀÖe†azzz&&&&}šŸŸŸF[¶ä`ÛíöIŸz½Þþþ~2‚Ýßß¯´-Än·Ûív[¶DQT¹ ‰ŒŒŒ¤ÝëëGÑ4=22òðuB?àp8lm¤ý—)-Äb1¥~¸$I·oß& Õ2š¦oß¾­4.,,Ä2mò}Jq‚ (]y\'ÂððpŠïÐœ>–e‡‡‡•– 9NìÑ‚­A”ºâ¢(0À–1388¨Ôßv8¶6l-‚ tÔ¾$I>Ÿ/­_t=Œ¢(ŸÏ§Ô·Z­¶6l-ð<¯´˜T’¤ÑÑQ’‚=::ªìÜÜ\\•ãV`!Ø\ZQú®K’ä÷ûI\n¶ßïWùe5®Ïœ…`Á ‚­•Î61ïºd*¿1#ŽÔ‡`keY¿ß?é#š¦\n\nˆY%ŠbAAÒz¿ßOØ¿b)ÁÖË²*§‹˜L&bf•$IRÙU>22‚`kÁÖÃ0Á`PéQII	1owA())QZo‰YŠ“âl-°,ëñx&}DÓô¼yóHêŠÏ›7O©+îñxÐbkÁÖÃ0J]qš¦ËËË‰9v›ã¸òòr¥`ŒŒ ÅÖ‚­š¦•ZlNg·ÛN\'ÃlI’T¶ëtº¡¡![¶hšöù|J•m6[~~>ÃlAòóóm6Û¤O#‘HºŸë–Fl-ÈÁ¾wïÞ¤OçÍ›W\\\\LF°‹‹‹çÍ›7éÓ{÷îy½^bvž§8ü•µ@Ó´×ëUéWVVjYŸÙ£ò‹x<[3ø+kDÅû÷ï+Í~Ë—H§õ0[’$ùêïIŸ\n‚ ²Of‚­ƒÁÐÖÖ¦´þÌb±¬Y³&­·4ò<¿fÍ\Z¥Àµk×ƒÆµš³l0ÓÕÕ¥t‚§N§[»vmú6Úrs½víZ¥^¯·»»SâšA°µ£×ë›šš”žæåå¹Ýî4½\'\ZºÝî¼¼<¥MMMXš¢%[;F£ñØ±cJOM&Ó†\rX–M»F[’$–e7lØ ²JüØ±ciz‘hšB°µCQ”Ùl¾té’RòòòeË–¥]£F—-[V^^®TàÒ¥Kf³o°µ„`kÊd2µµµ)M†õë×¥Q£-IÒØØØúõë•&ÆDQlkkKë‹DÓ‚­)½^ßÖÖÖÑÑ¡T ¤¤dÏž=*—i¤šH$²gÏž’’¥mmmz½^ËZ‚­)Š¢8Ž»xñ¢J{íÚµ.—+-¶…pçr¹T&Ã£ÑèÅ‹9ŽC?\\c¶ÖL&Ó—_~Ùßß¯TÀn·oß¾Ýf³¥ørQm6ÛöíÛUv}ô÷÷ùå—è‡kÁN«ÕZ__¯’Ûòòò]»v”lK’víÚ¥2g&Šb}}½ÒM	0«ì$`Y¶¿¿¿¥¥E¥Ì³Ï>»eË•3º“H>}Ë–-Ï>û¬J±–––þþ~¼¾N\n¦¦¦&Ùu˜‹(Š\Z¨¬¬TÚä¨Óé***X–½qãË²©3F•$)‰lÛ¶íÕW_UÙÑ144ôþûïG\"ìúH\nüÑ“C¾¼îÔ©S*eX–]·nÝÊ•+C¡f›R(Z¹råºuëÔ›âS§N‘tÙ`ÚA‹4z½þÛo¿-(((,,T*c0*++%Ijoo7™LÉm·åWÖ¯¼òJ]]]FF†JÉæææ£GbtDv2±,ÛÞÞ^YY™­TÆ`0TUUåää´µµQ•¬ž­ Ñhô—¿üå¦M›Ô‡vuuíß¿_¯×§ÎðaB°“‰¢¨X,vÿþýêêj³Ù¬R¬¤¤$??ÿÛo¿MÊ™û‘H$++ë7ÞxþùçÕãêóù:4::Š9³äB°“L>À´»»ûG?ú‘zÉ‚‚‚%K–Ð4­MÓ-B$Yºté¯~õ«ŠŠŠ)Ëÿõ¯½sçÖ™%‚|ÃÜ½{wll¬ººZ}¶)33ó¹çž³ÙlÃÃÃ^¯—a˜ÙëîJ’Äq\\~~þÖ­[wïÞ™™©^žçùúúú––•®hÁN	z½¾··7‰¸\\®)›âÒÒÒ%K–ÈËÎu:ÝŒÇ[ÅH$¶nÝºsçÎ§žzjÊÄb±cÇŽ;w.é3| C°S‚<+ÖÕÕuïÞ½åË—OYÞjµº\\®5kÖÈ=ùP(‹Å3á’$ñ</I’ÝnñÅßzë­ÚÚÚiÎl8pàë¯¿6HuŠ@°SEQ,ËvwwOLL”——Oy,EQV«õ©§žª©©),,´Z­<“‡ßÓ˜$IÑh4X­Ö+V¼ôÒK?ùÉOV¬XaµZ§ó?ñûýGŽ9wîœÅbAªSµwïÞd×þŸH$âv»wïÞ­t@·Ò§FGGÚÛÛ›››ÇÇÇM&Ë²r3þp÷^EI’AˆÅb‘HÄn·?ûì³n·»¨¨(;;;®\r###‡–ß±ÇñÂìC°SÏóV«õ7¿ùÍt&¢\'566600ðàÁŸÏÇÇÇåæTîi[­V‡Ã‘››[TT”•••Ø¸uëÖþýûƒÁ ÎMAvŠ’ÇÌÛ¶m{ñÅS­=ŒD\"çÏŸÿè£AÀûêÔ„1vŠ¢iZ^Iz÷îÝ¨/áÔÒýû÷:túôi†a°<e!Ø©‹¢(½^?44tüøqQóóó“ø2I’$ŸÏwüøñ¿üå/>Ÿ¯µRvw¥4I’(Šb¦©©é»ï¾KîÞìáááÁÁA‹Å‹ÅRütÀ;E‰¢FY–]¼xñ+¯¼òä“O\ZÆ¤7’<Ïûýþ³gÏž;w.Ò41vjB°SŽ$I¡Phþüù«W¯^²dÉ‚’]£I+W®466Þ¸qÃd2a°jìòýÚ¯-[¶,_¾\\eŸvŠ»uëÖG}444d±XïÔ`§\nžçM&SeeåîÝ»Ng²«Ÿ\'Nœ?Þãñ`UiŠ@°“O>™dÕªU6lX´hÑãÿ\'&&Âá0ÏóápXÞ¤õƒòpÝ`0˜L&³Ùœ™™ùø›@GGG¿þúë††ymìcþßà1!ØIÆqœ ¯¿þúªU«ç,!ÇÓÛÛ{÷îÝñññááa¿ß‡\'&&DQœ˜˜øAa›ÍFÓ´Åb±Z­6›Íáp8ÎÜÜÜâââÂÂÂ„›\\Qoß¾ýþûï÷÷÷Os©9Ì;iDQä8î™gžÙ±cÇO<ïÇÃáp0¼sçÎ…:::äó@)Š’_Qÿ£Óé\r˜üÚLúQåä’$Ñ4½xñâÚÚZ—Ëe·Û-K¼¹ \'Nœ8uêÇq8q!Yìä¢¨W_}uõêÕ‹%®Ïöõõõ÷÷_¿~½©©)‹™Íf¹ë;#-¤¼?„ã8Q«««—.]ZZZZ^^oD¯_¿þá‡öõõáöÜ¤@°“€çy–eß~ûm—ËW\Z;::\Z»ºº<Ã0³z` œpžç322.\\èv»W¬X×¿AÿøÇ?:;;±£S{¶Ö8Ž[²dÉîÝ»çÏŸ?Íø|¾k×®;vÌãñddd°,«åY¥’$Åb1Žã8ŽÛ¶mÛªU«\n\n\n¦ÿfëøñã\'Nœø~\\\0ÚÀZqíH’4>>¾víÚ={öLó…V8þæ›oŽ9ræÌyºkVÏ9›”<h7f³¹³³S¾=Óf³©ÜÅ÷°²²²¢¢¢Ï?ÿÜl6#ÛšA°5\"¿vÚ´iÓž={¦3ìE±¹¹ùðáÃ_}õU0L…Mò¦QoÞ¼yåÊ•±±±L¹›a˜üüü²²²ÎÎNÜø£[òxuçÎ[¶l™N>ß{ï½£GF\"ƒÁRaãÍóüÍ›7/\\¸àp8²³³§œZ+((¨¨¨¸~ýz(J©_‡Tö¬“$iddäµ×^ûñ<¡é\'Ÿ|òÁôôôÌÈº‘Y\"¯oáyþâÅ‹§¨¨hÊó‰ÇÂ…åÜ)û{Áž]r[½k×®—_~yÊoóÐÐÐÁƒ¿úê«X,–o€išff``àÒ¥KÙÙÙùùùêý‡Ãáv»oÜ¸‡‘íY…`Ï\"y>yûöíë×¯Ÿò{ÜÒÒòÎ;ïšÍæ4úÒËHyžollÔétÅÅÅê£n‡ÃQZZzáÂy«¹VÕœsìYkjjvíÚ5eüìÙ³E1-\ZêGÑ4m0®]»6::ºhÑ\"õCÚœNçüùóÏœ9ƒyòÙƒ`Ïžçkkkßzë-õæ78pàã?¶Z­iÔP?Juœ8qÂív;•Â………N§óêÕ«qÓ‡`ÏŠX,V\\\\ü‹_üBýBŸÏwôèÑ.Øl62¾ß,ËRÕÞÞ^VV¦r7°N§+((ÝÝÝØ\n6Ò¸‰HYò+ë×^{M}m™×ëý÷¿ÿýÍ7ß¤Î	¤3‚eY¿ßÿ÷¿ÿýêÕ«*ÅŒFãŽ;ìv{,Ó¬nsZì&IR8~ã7žyæ•b^¯÷OúS___ª>#hšŽÅbŸ}öYuuunn®R1½^_]]ÝÔÔ$o‰Ñ²†ÄC‹=Ã8Ž[»v­úe×ápøÐ¡C^¯—ÈTËhšÎÉÉ9tèP¿J±¢¢¢mÛ¶E£ÑäÀJ{&	‚PPP°nÝ:•qc(:räÈµk×NµŒaŸÏ÷·¿ýíþýû*Å^xá…åË—ó<¯YÅæ{&ºººüü|•2Ÿ~úé_|1Gî»bYv||üÏþs(R*c0¶mÛ&\Zí„`ÏŽãª««Ýn·J™–––>ø á{ðÒ‘^¯ihhPÉmnnîŽ;=Â	†É³™!‚Ýnÿío«rnYggçÁƒçà9žz½¾££Ãét–””(•ÉÏÏ\Z\Z’Ð²n¤B‹=3AX¿~½ÊÖüñÜÜÛDQ”Ùl>räHWW—R™ÌÌÌ—^z‰atÈgÄœû’ÍArrrV®\\©Ò744tvvÎ‘¡õ£hšáÈ‘#*¹u»Ý¥¥¥x­=#ì7oÞl³Ù”\n\\¾|ùÔ©Sf³YËZ¥\Z½^ßÝÝ}üøq¥EíØ±#hY+R!ØKE§Ó¹|ùr¥gÏžM…+õ’Îh4655\r*(++«©©‰F£ZÖŠHöã\nƒ?ýéOUN;ºtéÒÕ«WÓtÛÖÌbÆãñ|ñÅ*·ðnÝº¯¾‚ýXb±XUUUuuµRÑÑÑúúú9Þ	˜Ñhüä“Onß¾­T ¨¨hÅŠh´‚ýXAxúé§U¶(~þùçØ™øÙÙÙŸ}ö™ÒS‹Å²dÉŠ¢Ðh?;q’$Y,–¥K—*¼xñ\"®Âø–e»ººTö~ÕÖÖfee!ØÁN\\,+//WºÅZÅ‹/ŽÏÁ×ê(Šây¾¹¹9‰LZÀh4ÖÖÖbõøãÀw.q~¿ÝºuJOGGG/\\¸0g_\\«3­­­G©ÀªU«ÆÇÇµ¬aì‰¢XTTTVV¦T ¥¥åÁƒh®\'%7ÚgÏžU*ðÄO¬\\¹‹U†¯]‚8Ž{á…T\Zä“\'Ob2\\…ÑhlhhPê†eË–)=…)!Ø‰ï‘^¸p¡Rƒ|ëÖ­û÷ï£¹VAQ”ÑhlmmU*P\\\\œ‘‘)´Äà›—QËÊÊTn«?þü”7c€Édºté’ÒÓ¼¼¼…\n‚ e•ˆ`\'B>„Ti/—Ïç»{÷.¶N‰a˜¡¡¡¾¾¾IŸÚl¶¼¼<;1v\"$I*((PzÚÛÛ;44„~ø”hšöz½*sã%%%*‹OA¾|‰E±¼¼|ÒG‚ Ü¹s‡çy¬6›Q¿ýö[¥WÖr°1ÌN\0‚7ùF®Lú4\nuwwcËÇ4éõú®®.¥Ùï¼¼<‹Å‚`\'\0ÁŽ› .—Kéi$¹uëØÓDÓtWWW8V*€ù³Ä Øq‹F£UUUJO¿ûî;ŽãÐŸ&ùÕÙÙ©T`Ñ¢EX¦’\0;n‚ ¨œmvóæMìúˆ‹Á`P	vAA¶p&\0ÁŽÏó*°;::pË\\\\X–íîîVzZZZŠ‰ñ Øñ‘$);;[¥§=00€]q¡iú»ï¾Sy:oÞ<d;^ø\nÆGÅììl¥¹1ŸÏ\'IØñ2£££“>b&\'\'ãñB°ã#Šâ¼yó”:Û÷ïßG?<ò4¥G‡-v¼ìøÈg’*¥wllÍu(ŠRºÜ‹eÙììl;^v|$I2›ÍJ£è±±1°@Ó´ÏçSz¤×ëÑ¾…ñ‘$Éd2)¥K)¦ô§c&##-v¼ìøÈ/±•‚=11®x(ŠRºj“¢¨ììlü‹/;>ê“ÞÑhÁN\0EQ*«PÐO\0‚7•yo,O˜ÊŸ/\Z€?Y|,Ë™3gnÝºõè¨a˜ŽŽìëJ€|öáÃ‡írÓ4=44d±X’R±ôEíÝ»7ÙuH3‚ (mKÐëõ˜OŒ(ŠJ½q–eÑŠZì¸1ƒïÙŒ£i\Z›gfš\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°ôÍª×BJèÇ\0\0\0\0IEND®B`‚'),('1129506976','Cedula de Ciudadania','ASHLEY','DEFORT','3215795145','ashley@gmail.com','7c4a8d09ca3762af61e59520943dc26494f8941b','Calle 59C 22E-10','ADMIN','ÿØÿà\0JFIF\0\0\0\0\0\0ÿÛ\0C\0	\Z!\Z\"$\"$ÿÛ\0CÿÀ\0rr\"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0	ÿÄ\0N\0\0	\0\0!1Qa‘Aqð\"¡ÁÑU”±23BR#br$S‚’¢£²Âá57CDTs%46c³tÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\06\0\0\0\0\0!1Aa\"2Qq¡±B‘Ñá4R3ð$C’ñÿÚ\0\0\0?\0öU@X·\0@[€%H\0â KÜ\\	`Z‹n*¸¨…¸âà@[“ \0[‹‹qp -ÅÀ€·\0@P-ÉÐnN€‹rT\0°è\0äè\0àqp -ÅÀ€·\'@Å¨¸nN€n@\0·Ü\\qp -ÅÀ€·âà@[‹n.¸¸à	QRÜjõ¼zÞ[‹=o·—Q¨Öñëx¹nõ¼zÞ]EÀ•·‹—P%G­å¸Ô	ëxõ¼·\Z=o·‹–àO[ÅKr\\G­åÔjõ¼zÞ..Öñëyu%ÀzÞ=o\Z–àO[Ç­å¸¸£Öñ¨Ô­â¢âà=oëx©n.õ¼zÞ[’à=o-ÉpQëx¸¸[Ç­å¹.£Öñqp·‹—P%EEÅÀzÞ=oQRÜ—ëxõ¼\\·zÞ=o-Æ J[Ë¨¸Öñëyn.õ¼zÞ]F O[Ç­å¸Ô	ëxõ¼º@ž·[Ëq¨ÖñëyuzÞ=o.£P%An\0ž·‚Ü\\qp\'­ãÖòÜ\\	¨õ¼ª¤¸\r~#ÖòÜ—\0=o-ÅÀž·[Ëqp õ¼·[Ëqp&£Ä·[ÅÅÀzÞ=o \rG­âå¸Öð[’à=o8x¼Ë…ª‰‚—ò§WÑœVÓJ†Øl<qóÑtUù™]L2{°Ø‰PÂ»Ñ4’ÞêixŒû2e6KûŠŸVc§N9ÖtØæ?ïDßêeåµNy÷§fó;4Ëä§í1r«ÂÞ}Â´y|N™å\rÅ£P¨©”Ráøã¼Ì¶I»Q\n´¬#â™O‚G=§Æ¿Ü“\"Í6ÿ\0SQRy!ti0Çåe£ÚÉî™.(ÌüâÏ3H¿õOH!_#R“Ëã(ü±ú9ï9Ìÿ\0÷‘t_B}ó™ï#è¾‡¢£heácÿ\0dVyš-Ø¸Ÿœ¿‘úC´’ß:¼à_$bª*6†3ƒþXý¸6—ïK‘òiþ§ï+j\"ÿ\0ÌÂ\'Î|(Ív¢¤rÃ	ÒaŸÊÛ%m.\n+G*|\Z&¿S™\'9ËfÚT¾ÖÔÑê*G$*¶ƒöÞ*d¹÷¥L†5ÆT}úÞu¼Å]è\"ŠÅ6™ÏÃç9”Š%Šq¥á3Þø»üHðå¯nh÷lÞA¬avž+,N>1Ktø?©•ÂçY~\"‰Oöq?å™îüw|Lf³\r[é²Ó¼2^·‚\'ÞUM4÷W1PƒÖñqp·qpÖñqp·qp·[Ëqp\'­ãÖòÜ\\	ëx^®[‹=o·–âàM~#ÖòÜ—¯ÄzÞ[’à5ø[Ëqp\'­ãRÜ\\	ëxÔ·zÞp°±n.°±n.°±n.°±UEÀ–-ÅÀ–-ÅÀ–-ÅÀ”-ÅÀ–-ÅÀ–-Åê°±n. ¡nq1øü.\n\Zâ&¨_„;ÛòA5¬Úv‡*ÇãŠÄÈÃAßŸ6pÿ\0yšÎa´x‰•ƒ	“õExŸÉ|L$Ù“fÆæM™Èž÷m™Å>-üZ[­çfÍÚY0û¸IQLÕ—Mïàa1y®;i˜ˆ¡…ÿ\0,êøoÔá‚È¬C›>ÐšJK’¼Ôj.P&£R’à5\Z‹”	¨Ô\\\\£R€&£Qqp\ZEÅÀj5(j5¨Ô¤¸Œ&7…iÈŸµ¾‰Õ=ŒÎi¦/w%D¿ª>ŽÏª5ò\\‰¬J¬˜1ä÷¡¾à³1a:ô»D´g2Ç[&ÓM6šºhÊåùî;\rHfEíå¯Ý×“ßÖ¦OƒC/˜ëIn”1¹~qƒÆR3ÙÌÉžs2w0˜ÙÏ½-IÚÑ²XP·!ŠPX·PX·XX·XXº‹,,[‹,,[@–-ÅÀ–.¢àKâàJâàJÜ,,[‹,,[‹,,[‹‹qp%¸‹âàKqâ[‹,-Ä·X[‰n.°±n.°·ÜùmBœQ:%¼cðÆb°øY^Ò|Å./Ë‰†Í¶‚\\ªÊÁ%6=Î?å^\\O3ZÄOŸˆšæO™Èß‹ÁÅ&[Ø46¿[ô†g2Ú)Ó+\r9Pnï»Äü¼ƒŽ(£‰ÇqEumº·©..YêcÅLqµa-Äº‹‹’°Ôj..Q¨¸¸\rIn%¸¸\rF¢âà5\Z‹‹€Ôj..–â]EÅÂ\rF¢âà5\Z‹‹-Äº‹‹-Äº‹‹€Ôj./À£Qqp\ZEÅÀ–âe2Üï„¤Eí¥/åÝ.OÃâc..&7c|u¼mhÝ½eÙ¦\nR£¤ÊUÁšúèsõ:Þ1\'i§TÓ£LÎå[C6U%c“™å1~òóãúù•Í>f}×®>¾¬ž|¬D¥6LpÌîiŸ­ÊÜéºJX[‰n.°±n.·bÜ\\	abÜ\\	an%¸¸[‰n.·n%¸¸ÂÜKqp ±n.·[€%…‹ XXº\0%…‹ Ð	abŠ,,Z\n‹ Ð	aaBè°±h4X[‰t0ùÎs\'œ©ILŸOÝð‡Ì˜ÙÓ²[–°çfì>W´ÄGJî…]Äø$j¶qˆÇ·\\©´½þoÇô8x¬DìLè¦Ï˜ãñðä¸#ò½wÅvv4úJâë=e,,[‹™6ÒÂÅ¿p%…‹~æÂÅ¿\\…‹~àKq-ø!~	n\"Å¿/À	abß‚à€–-øð@Kq-øðX[‰oÀ_€ÂÅ¿~	abß‚à°±oÀ_‚[ˆ±oÀ_€ÂÅ¿/À	abß€¿\0%…‹~ü\0–â[ðBüœ7‚›ß‘1ªï…Ý?4m¹Fq‡ÇÂ þä¯{üŸ‰¤ß‚¸¡‰8[M:¦\Zf3X–¾}52úK²l,kY&^ìŒs£Ü¦¿Ÿ×¯eM5UFš*˜ÙÆË†Ø­µ‹A¡\n’ÂÅÐh°±h4XXº\n,,]€KA ÂÅ Ð	n\"Å Ð	n º\0%h(·Z€,A@\"óâTJ\0°·èJ\0°±h4ƒ@%…¸’&¡]è¨’W5Lÿ\0:sÜXlMJÝk||—/Ô˜×aÃlÖÚŒó=î¸°ø½ïæš·.KêkM¸›Š&Ûwmøú.ˆÙÛÅ†¸«µ_#Ä¼CÞJÔyô\0ùðÐä@Z\\ |ƒèù\0AàÐä\n–+†ÂËö˜¬D™TÈÔ+«bf#¬¥úÐ^Úì¦µ7=Á6·©QûOøjbçöŸ±ÒÛPæ¦Óú0Ñ¯Õ\"‹j°W½ãõ„òËs‡k)·Û¢ò¾l‹µ•në¹¹êWþ¿MþpžIø7ÑCJ“ÚŽÈF×{>W8ðÑ?Ñ3%„Û­‘Äµì³Ü,5ÿ\0;Yñ$g]^v¼~°ŽYl`ãà±øl=ì7\r‰[ë&l1¯ƒg&…ñ11¼!\0-ÉB\0}òh\0´\0}òrò\0\0ôÉ˜Èó™˜&¤ÏqLÃ½Ë{ƒË—#˜Ý†LuÉ^[C±$Í—:T3%F£‚%T×‰úXÑ²lÎv_6—ŽLOß‚¿Á›ž+&ÒbQAêZ»8š=°Ï£ö·©t\ZµÒÜE… QbèJ\0°·Ðh·bè(·©t\Z,,]€Kè\0XX,,[,,[\0%……Š°±l@°ÄmCq4’Uolj{G›¹î,&/ì“¤q/ç|/Ô˜×aÃlÖÚ;Aœ¼TQap­©	Ò(•œôýL)4\ZDlîãÇ\\uåª‚h4D³Rx\n\0–\Z\r\0xš\r\0PXh4@PM€P	¢ƒµ[W’ìÜžöc‰N{Uƒ.‘LJÙst\\Î Ú¾Ó³ÜÙÅ#/uá]U%:Ì‰szÒžlÑÕq:~–çáëI—rmÓäY/ï<ÆL©”ª”ŸzcáHU^­PëÜ÷¶(SŠ^K•8¸MÅ:/õ!=¤Ž8ãÇ1ÅQ:¸¢umñlš,üg>N”öalcˆlù¾ßmfdÚ™›Î‘-ÿ\0&)i.ToVÍj|é¸‰Žn\"lÉ³ø£‰¶õgÎ‚üfL·É;ÞfYÄl–.‚ü\nÒ€ºð€¿\0,Åj(\"Š“ªiÑ­LîU¶{Q–5ö\\ëá[ ›´….Š©h`oÀ_2^“½gdLnìü—¶ÂS†ß,‘‰‡sŽCrãóiÕ7åC~Ùý¿ÙŒåÃ.V=agÅD¥b’–ëÁ6èß$Û<å ¿£‡‹ê1ûÓÍ¬\'KÖª”ªº~\'Ñæ­˜ÛM Ùø¡‡ŠfoÃÎ¬réÁ&ê´hí½í+%Îœlm2Ük¢PÍ‰9q¾QÙW“§*Í/ÃŸÙŸf}uvÇ0ÞóåBèt•©(4\ZAò]\0 š\r\0 š\r\0 š\r\0 š! æåŒì¾z\ZÅ.\'ïÁ[5ÅpgA î‹V/Ogaá1±R!&%+}ÚÆ‹“fS2ùõUŠLN‘Áó\\ÍÛ:\\ù0Í•Š•S)µvpõ:yÃoGéaabØÅ¬–-…€–-‰`-……€–-…€–`[\0!I Ð\0ä]\0…%y@ °Ðh\0\r€£C´9¢ÁHöRŸöó¿º¸“»<tœ–ŠÕÂÚ|Û»ÞÀáâ÷·M‰x.çÐÖkÌúm¶Û«ní»¶M¢6w°á®*òÁ~\"£A¡+K‹€J–¯ˆÐhâãA Ð\\h4q~#A \rEÆ‡3Çá2ÜÜv:|0ò—z8âvK‡6÷$®Ù1¼ÞlÈ%KŠdÙË—n(¢i$–öÛÜŽ§ÛÞÔû®<¿fbMªÃ6%UÏ¸Ÿêô[™«v‡·˜í¥ãÂåp¿vRtŠm78éÕ-Ë›¹¥žo]Å¦ÞÆ‘ñý—Óœ¿LLéØ™ñâ1£›66ÜqÇqDø¶îÏÌ‡3ºÐ\0@j5\0\0\0£P\0\0\0j\0\0\0\0]H\0Þ6´\\ÏgÜ¼&:(ñÙr¢îDë2Rþã~ƒ·\nã‘æù~u—ÁŽËq0Ï‘ª¬á~)­é®ò±™Ù-¤Ì¶k2X¼ÆàtS¤Äßrjà×zêŽ¾‡Š_ÔÉÖ¿ev¤OXzz¯ˆ¿²{E—í&U;ÕÙQ5ß•Škô~(Ëèzš^·¬Z³¼J‰’¥¿ ÐÉ¢ãA ‹€..4\Z\0Ôj4\Z\0Ô_ˆÐhüL®Ïæ?ÙÍ‰¼<nëuñ_3 Ð‰Øä¥rW–ÎÈ†(c…EM5f¼KcWÙ|Ó¹Àâ\"÷[¤¦ü\'àmäS1³›â·,ž·\nòäB Xh4\0RW‘kÈ	oH¤¯! ^E¯ \Z‚h\0j5·”	¨Ôiñ·€Ôj4ø> ˜Ôiñ\Z|@j5\Z|HÚ…7J÷Ü2ÅÊÀábŸ2ô²^1?h¸©ó18ˆçÍŠ±Äêùr\\ŽnÐf‹}ÆýŒ¶Ôø½C¡u#hvôš\n»Ïy5\Z†M³Q¨ÐhQ¨ÐhRxï.ƒÇp\rF£A \rF£A \rF£BDá†i$›mº$€ü3f/ÀÎÇcgÃ\'&ÈâvKæüWlóßh{c‹ÚœÃ»ŠN])¿a!½þø¸·ðV^-óûWÛ(¶‡0y~cY^\Z&“NÓãVï¾KÁkãmœ-Äø„æŸû1õþ¦ÝdÔj)ÈS‘ÆXS˜ä)È£QNC@QNBœ€j)ÌS§ \ZNBœ€j5ä)È£QNBœ€j5ä)È£QNBœ€º“QNBœ€ÍlvÑcvk8—ÂDâÒÒ[¤3`­Óàø?ª~È³Ls•HÌ°3{ò\'CU]ð¿×ƒN©£ÊÔäo]‘moÜ¿Ø1³;¹n.$¢q;Jr’{Ÿ*?¯ÂõÞ\rü;Ï³?IWzïÃ¿u\Z‘Q¤ÕÓñ.‡«kšFƒ@\ZFƒ@\ZFƒ@\ZFƒ@\ZFƒ@\ZFƒ@\nªéÜÜvw3ûnÙM‹ûyjíÿ\02ðSNÐý°x‰˜LLå:E¯&¼SäÈµw…\ZŒš›yù;Q¯Àü08™x¼,åþìKwŠä~þ·”83´šü£Oˆõ¼ ×à5\Z|JÔkð\Z|FŸ\ZFŸ§Ä\n	ëxê5\Z\r\0šK¡4ê5&ƒ@.£RWÐ©¯mfaì¤ýŠTTŽb÷ßxkúy™œv&^2|ÏÝWÍø#AÅO™ˆÄG>c¬Qº¿§‘#yÝ½¢ÁÏniíÏQ¨ÐhZì\ZFƒ@\ZFƒ@\ZFƒ@\ZFƒ@\ZFƒ@\ZFƒ@\ZaÛnÖ¼ìæm1á®.(]àîƒÍï|¼Íçks¼>ÏdœÏ“öPÒ\\\rÑÇ´0¯7¿‚MøfÌq¸ŒÃ?‹˜æOŸŽdOÅ·]àq¸¾³Â§…^óöþVã®ý\\}Atäyeè^C@%t\Z5ÐT	¨¡t\0ANeªà4S˜.‚¼€€º@\Z¢ÅÐ(]€ABŠòPA^@wob»Zó,ÜùµÅá`®(æJ^Ü?¥86vN§”²œ~\'+Ì°ùŽ?g>DÅÂ«ÁñMU5â›=7³9¾=É0¹¦ÐN‚±CZ¸\"Vp¾iÕ||OUÂuž5<;w²Œ•Úwdµ\Z‡aQ¨Ôh4¨Ôh4¨Ôh4¨Ôh4¨Ôh4¨Ôh41³‡Ùq~ÂlT“9¥}ÐÅàõÝÓ¸êuµyžÎcþÛ‚PÌu*Å]íx2»Ç›™¯Áÿ\0²?å—ÔjM¡[˜j5&ƒ@.£Rh4ê5&ƒ@(&€¨¹p \0rj.\0‹œ\\Ó2{£i{«‹{Mk6˜ˆk»]Žö¸˜prâ÷%:ÇO¸h¿V`­RÇQÇq·Q6Ûñmï&…ñCÐâÇéƒQj„¬KÃA£aa Ð¢ÃA£ÄUTh4aa Ð	n%ÔhÌFØç2ò›Ææ‘QÅ*[R¡Í´+«UåSÞ)Y´ö„Änê>Ü6‰æ9ô96epØý¥¢šÕú+ru:ìûŸ6dùÑÎ›QÌŽ\'q;¶Û«oÍŸ\ZQšÙòNIómDmæ5\Z\r\n\ns\Z\r\0 Ð\0\Z\r\0\rFƒ@\0h4¨\Z\r\0 Ð h4¨\Z\r\0 Ð\0\Z\r\04\Z\0;+°½¢x,ÞfEˆ™Iß~M]¡š–íR§šKÄë]×	>n+‡Ž)seF£—ÞšuOª/Ógœc$y\"cxÙë+Í—Í¥g™4”’Så§+ùcV‰hÓFOF{šÚ-X´v–´ÆÅF£F4fH5\ZÑ€ªâ,4c@àÅ¸0)4cFQUÄhÆŒ§3&Æ¼>	Õ}ÇîÆ—Š{úoÐáè4a¬Z&²ìˆbQCÞ…¦žîe¹„Ù<o·Á¼4q{òl«½ÃáÓwC7r‰¥çrãœwšÉrÜ—!‚Ü\\—rÜ‚à+çÐàÅÉa`-ÅÉa`sSÚüc›Š‡	÷e^.q?¢ýY²ã\'Á†ÂÌŸè!o~ó¯çLŠlØæÌuŠ6âo›ftŽ»º\Z\\Ö›Ï“ãÀú>l[ºÈ}6-€‡Ñ,Kôš¢Ø\nš¢Øâ,,°°êßó—#ÊÝ}¢rOÅÕ@Ÿ’ï=QÛí¤›m$•[nÉ_ÚüÕç[MÌÛnÓŸ³¯„\nÐ.‰Ž3ŸÃÁÉíöYŽ:±5”l\0*€TT\0¨¨\0**-ÀXEE…€TTXXEE…€TTXX\0¨°QQa`ÁEE¸‚¢ÂÀvïìÿ\0œ·;!›iþS%7áe\Zÿ\0…Ó›;lóÂfßrín_˜8»²áš¡šënäV‹¢mù¤zn¨õœ?‰ƒ’{×íä×ÉKèù-…Ž²´¡ô|ØX |ÕÀPK¨ KÀ}âÄ°@–™“âÞ0—9¶¡¯v4¼SßÓ~†úUSM=ÌëkžÌbÖ\',PÄýù/¸ëâ¼KhWxósx†.‘’{‹’ÂÅnYqqa`-Éa`Oˆ‚h4Ü\\”ê	  \ZöÙb»²%á!w÷âò[º¿ÐÕêssÌOÚ³IÓ¬)÷aòVøÝêp­Á—Ö6‡MÃÅ¤õ¸h4%yëqInhÐ[ƒëqI ·ÖáëpÑ‹Iãÿ\0AnhÀzÜRh,¹Ú^fò­ˆÌ±ÅÝ™¯c.›ëîÕsI·¡æÃ¸¿hLs.Ë2Èbþ,Ø§Æ¹B¨«çÞ}œÐò|g/>£—áËctQ~$ÐhrV-9‚h4ê™4\Z\0¹I Ð¨&ƒ@(&ƒ@.¤¸ÐhâãA R\\h4r“A A A üIq Ð\n5&ƒ@(&ƒ@=5°›Íö;,ÆÄûÓ•.c{Üp{­¿6›Ôó.‡u~ÏÙ‡¶Èó¶\'W‡ž¦BŸ„1ªQkzŽ——?\'Æ>ÊòGGfúÜ=n\Z\rT×=n·\r€=n\Z\r\0zÜRX[ƒ‚Xh\'­ÃA [‡­ÂÂÜ[Œ¶Êâ¾Ï™©Q?rzî¾Þ¾š˜›œÃ-¨¡i®M1¼0ÉH½&³æì›N>\nzÄá%O‡tp§äüOÞ…;11;Jê5%Q©((Ô€qrXXqrXXs…œb-Ÿ9:D¡¤>nËâs,k»gˆ¤‰8h_ï·^JËâÉ¬o+°SÄÉk%…‹Þz„·n\0[”ùÐX¢t%¸pô	nÜ\0·)óa`/Ã¡-ÀUz\nÂÀt\'n8×ŠÛˆ°ê*Ã„ÃÁ.žiÆÿ\0â]\rÍmÎ/íÛa›b{ÕQbãP¾0¦Òø$a¬x]VO5íë-ªÆÐ”ò°±®È¿t7ÜË`¢Âl«ï¬ÆZöó¥·e-¥îÓÁ¥vüÕìI»B§4:Ä	AO!a`…€t-‰`¡l, ABØ•@/Èj,,  ±l§ÔXXÅ<……€tò6ì~ÉE\'³ü&ÐKï9ñFã\rl¥Dé^TOý\'ÀÔlI1±Ðt-ˆ‡`öx}±™„‰û¸¬4p¥Æ(Z‰|]N¾±°vu‹ûÜåëDñ0Ëo”~ãøDlèïáç¥½a£xz_ÃÀt%…¸åª½<‰nÀ^‚ä·`>‰rXXqrXXqr[€·\0>‰zxÂÀ}W‘,-À\r³c±Ó3¼¸ª¼ŸýS3÷4­•ŸìsX`nÍNç½|U57KÞ6—[N\\³êº‹’ÂÆ-U¸Ô–ÜÀ¨©((ÔjJ\nu4¨í³‰‰;KJ¥ßÅ³t‰¨an+%¼ë¼DÇ;2sßn\'«©f>î‡®÷›|ž£QaBÇXÔj,(Q¨ °\rF¢‚À5\Z‹\0Ôj,(Æ¢‚Š 5?<LØda¦Ïû²àq¿$ªÏÒ†#mg}Ÿd3yÉÑÃ‚›GÍÀÒø´c{rÖgà˜îóØâ›69±ÅX£n&ø¶êÉ©(r2ü+0žä`äG:b…ÆÔ+t)U¶÷$\0Ûqõ\nþ\"‚„\r£³,™gU!M‡½‡Ã/o55f“TZ¶­Â§yâäÁ‰ÂÍÃÍU‚l·Iø¦š©¢ö%—)#1‰{ø©ÝÔéüY|\\]\rù´“n´J¦KiCÌQÂàŽ(]šm?4MN|ì§7™69Ÿuã—z&ÿ\0ûxü_‘ó÷>mø^;òñýU84æ59ßsæß…ã¿/Ð}Ï›~Žü¼@8Z“S÷>mø^;òñýÜù·áxïËÇô…©59ßsæß…c¿/Ð}Ï›~Žü¼@8:—S›÷>mø^;òñýÜù·áxïËÇô…¨ÔæýÏ›~Žü¼A÷>mø^;òñý\0àê59ßsæß…ã¿/Ð}Ï›~Žü¼@8Z“S÷>møV;òñýÜù·áXïËÇô„üÉNg;î|Ûð¼wåãú¹óoÂñß—èRês~çÍ¿Ç~^? ûŸ6ü/ùxþ€pµ\Zœß¹óoÂñß—è>çÍ¿Ç~^? í³Ø|>?arü$Ä¢“?/—.4¸8zï:2ÂLÀæ8ŒïâH›¸­½¦Õ~wvY;ÈÈÃb°ó¤ÍÂÇ¦¦ÀámV©¤Öê:hußl„Û“¡†â¤Á6Û«x_ü5Ô–vŽ›´íI¨¡ÈË0Só|œ(§N‰Cn‰·ºþ0qõ?lø°ØÉˆ_½*d1¯4Ó_ Æá1,\\Ì&.LrgÊ}Øà‰Q§ëÄüQ1;[AŽb…Õ4škÅ2Ó™ŽÙ™ßiÙ¬³Ý\\Ü$¨Ûó?™‘±ô\nÛš±-BœÆ¢‚„ §1¨  ñâ((Q¨  ñâ(,QNb‚€5\ZŠ\núaæ93åÍNðD¢Z:‡pÇ1ÂêšM?3®(o;?7Ûe8x›¼0÷^–ùäø¹ÜF+fGQ©(,Vå.£RP´¨%\0QbØbXw7ÙeX˜Ó¿³iy»/ÔÐ®n_3¹•(+ûóÑUüBÅ´ŽŽÇ®Øæ}Râå°±›y..[..[T	qrØXê.[..[./RØx.k=ªMr¶6Ž´¬¥Xá_3g±§vÍw³ÌÂëŠRÿ\0yù\Zú¹ÛçÒ~Ì«ÝçšÝÙ–ÏJË¶UMX¬Â_~dM]@×»•|ÛàtÖU†ûng„ÁªÖ|è%Û›KæzZa—0A\nPÂ’InInG††í#Íæ)°E.dRâTŠÓ\\\Z±óS3¶ø?°mng†j‰b\"ŠÁEï/ƒF\ZÄ0za°Ë²T…\rÙ¡®%ÞÌÕÎ>Y—–áeÂ­˜Ñ$r*Œ—ÁQQT,\\TU\n€¨¨ªä¢¢ÂÀ**,,¢¢Â **,+ÈEE…@TTXXEEP°\n‹‹\0©Õý»HIåX¤®ý¤¸Ÿú­|ÎÐ±×Ý¹@žÏàfRëN°7òÆÝASdìÊS·9d4ªQÅÒþF·cxì[\rí¶¶9í{²0ÑÅ^m¤¾\rô\"GvËÛ>E#+ƒ=‘-)øf œÒ¼RÛ¢oÉµ£|¢©éL÷a’ãp-WÛÈŽÉ´Òz:3ÍvñÊñÕénÎ&¹Û“ÅZÓ\r-ò6š¯dq÷û;Ê¢ot3I±¯‘µØ÷Ziß\r\'Ò>Í+wK‹–Å/bù¸¹lP>n[”–r\\ú%€\\—>€ä¹ôK\0¹.}À.m[7½‚%»Á1=\Zÿ\0£5c9±“)Ž*¶Ž]uM}Y»5µ•æÃ-°Å.j…€µ ,-ÄaB[ˆ°\ZÞÛGl4¥ââ‰üýY¬ÐÎíœIæ2 ­”¤ú·ô0z—W³½¤°Õ)ä(]F¦M„§§‘u\Z()ä]F Jy\nyQ¨žB…Ôj§¡u\Z()ä]F Jy\ZWm®›ˆ\\gJ_í#vÔÒ;oÿ\0ðÿ\0üò¿SW[ý½þRÊ½áÓ[	lr˜ZTX˜©×äz¡çmŠ™®Êcn‹írÓ~q%ó=xˆocìê>ÛòÇ\'7ÂæCîbeû8Ú_ÏæüÓ]×}AmîK÷îÍb0*â ^ÖGøÕhµUZž~i¦ÓM4èÓÞ˜–7¥él¢5;*ÂMTj9DŸœ)œž†³ÜZÆìfW7½W•)òp7ÈÏ¶;@VžDè\0ƒ \0:€iäN€\0è:\0-<‰ÐXiäN€\0è:\0 è\0ƒ \0:\Zn--šÁCj¼b} êoç[vë9,W\"·ŽlqSÉ%ÿ\00–6ìêŽ‡lvpeù†c+ûYÉ¾ªºkèu:M´’m·D‘èŒÊþæÙœ(i2	}é«ûíÕ­¦„BºGVc¡æl|*~\"•!›Z6za´“‰º$ªÛ<É‰˜¦âfÍþ¸Ü][bYdz±§^ÎòåÁÍ_ïc7\ny\Zc?øy—ßù¦ÿ\0ýb7Oq£þÞŸ(û4mÝ((]F¦Ë§§‘u\Z()ä]F :žEÔj§§‘u\Z€èJyQ¨\nyžEÔj§‘”Ùxû™Ô”ßï(¡}Í#©ÊÊ\"îf¸X«ÿ\0›\nzº|ÈžÌ2ÆøíŽÀ°±-ÄX¡ç‚Ä°°€–\0[‹’¢ ]„°°\ZfÖDÞq\Zþ˜!_\nüÌEÌžÓ:çxŽ]ÕþÊ1¶/¯g¡Áb¯Ê…¹IbV¥Ëqaj.[‹..[..[([‹.[ÔXZ .i]¶&öøN”ÿ\0ÛFëcMí¢\Zö{Ž|&Jï!_3[[ý½þRÊ½áçü$øðØ¹Xˆ?zTÅ\ZóM5ú˜‘6	ò%Î”ëÈTp¾)ª£ÌV;ç³Íf;„«¬Ì2xyŠ»»»¿Ùpž´–Ît÷k{1_‹;ÁËÿ\0$ÄÅYÊis÷ä÷ù×Š;†Çå‹ÃáñxY˜\\L¨fÉ›†8\"UM?YÌnëîÃ³%3,ÆåqÅïÈ˜§@«¾•\Z^M|NÆGVA‘â¶k¤f¸~üìšlN\\èÕÜ¨\"t¤|“£®çOvšiª«®(í°…ƒ pà\0\0õ¼zÞ,*€nÜ\0[Å…P,-À­ãÖñaT\0p\0…¸\0õ¼!nÀ¢íËßÏ0Tëìpî7ÉÅ_¤(íÛp:w>Éó\r±íDÅ&f\"%îKP$šOÅÕ6’ãà®_¶Îe;?mŸCŸpx&£‰µhãß<ïwÉSÄîï[ÎC•`ò\\®V_‚—Ý•-]½ñ·¾&ü[ÿ\0¦äs­À&±´1»U‹X›ÌqmÑËÃFáuþfš_8Üî^Ús%†Ù¹Y|.“1“WyWù £éÓV\"X_»ÑÂ×gYkâæ¿÷±›}ÍO²{½e\\Ô×þö3l±îtŸÛÓåf•»¥ÅËaca‰r\\¶(7-Ê\0—),âå\0K‹”–r\\ú\"sôÃDàÄÊ‹„iôgÀ\\xz»\'A¡óM.h¶5Þet\Z¨µ\0	T\0¤\0EE@Ñ¶‹þúÄÿ\0‰~ˆÇPÈm\nÿ\0ë8Ÿñ/Ñ\ns/ŽÏG‹ýºü’‚…§1BY¥NbœÀ”-9ŠsPP´æ)Ì	ABÓ˜§0%ANbœÀ”%§1ã¼ÍK¶(kÙÞgÉÊï`6çæj½­CÞìó6[é¤ÈÈ×Õÿ\0±”ý™W»ÎT7®Çs¸rüö,·\ZR1É(jì¦­ÝSkÎ†‹©`Š(#†8\"Š¡i¦\ZksLðÍ¨§w§Á©öwµrvƒ.‡ˆ™9ŒˆR›·´JÝô¹ø¯É£l%|NäP¨ápÄ”P´ÓMU5ÀAC*aJ‰%D’Ü‘@H\0\0\0\0)\0\0@\0¤\0\n@\0\0\0€€¤`>dÊ•*©pË†­¨aI*·Vè¹Ÿ@€\r¯hªmt¼¿3&Ëæ§vtP¿àÀÕÕxµÑ:ð™Ù¢v“¬óiçL“{‡^ÆCNÍ&ëómºð¡¬ÐKÑÝ”CNÏ²•ÿ\0ëõŽ&m5ÎÌ¡îìP·a^­¿™²S™î´Ý0Óåf­»¥ANbœËØ¥qNbœÀ\\”-9ŠsBP´æ)ÌÉBÓ˜§0%NbœÀ\\ˆ´æ)Ì	ABÓ˜ !ÖLŒ+ô?JŸœàKÿ\0\nýºšï5=Ê–¤¨¨BÔ y¼‰Ôu×‘+Èu@Ñö’«;Ä*x§þÊ1×2»U\r3™¯ú¡…üùª×³Ðàñ×åÅÅ‰Z\\\\XPÉRÐPÉRØPÉRØXÉRÐPÅÅ…\0\\Ö»O…Å°Y¼4Ý%>‘\'ò6ZÑ`ïl6r¸a#}~E:ˆß\r¾Söe^ï3ÔTXQ\r´ýp¸‰ø\\D¼F\ZlrfÀëp6š|SFë€íC?‘‡RçÈÁâ¢JŠdP8b~ti=4[DÌvwþÀgó6‡ ‡ˆ†\\8˜&E.t0&’iÕQ6Ý(×a¹ÓýŠf«žÏË&EIx¹}èÏ]¼Ó}Ü®¬ïÅÀ‹‹Ž¢À..,,âàXÅÀ°‹Ž ÅÅ€‹Ž¢À..,\0\\\\XXÅÅ€˜\r¼ÏâÙÜ…ãeA.dø¦C.TÖ·WZ4÷\'­ýŽŸí¯5Xœï•ËŠ°a%÷¦$ÿ\0ž*:?$—VÚv‡7í/h1¸w#°ø£ŽL-Ç£mÓÍ*ó4¸ãŽdqGQEM·um½í¿J!bÌÌ÷**,,@ôÇg¸6\'†ŸúHU_™Ÿ¹†Øx;»’­ßä2_X34=îÛ~PÔžéRÜXQq-AqqA@^Bâ‚€+È\\PPy¥  \nòqVÅ©0÷çA’øØÐ.ì\nHú©:Ž¦»Ì­EIÔuP:€\Z!¢¢\Z!qp5²…¬Î’´R—Tßý%øÚÁïáf/oÊ~¬×)Ìº½í$ï†¥ÅÅ9Š6âå§1K.[ðæ)ÌÅø\nsæü	rÓ˜Ô	~¿NbœÀ—àZo¸ñÞæn`qìft©ÿ\0¡œú@ßÈÌ¿3µp÷ö_6ƒ{9u•åñÚ=%1Ýå­ƒQ©à[k¡4\Z@åe˜ÉÙ~c‡ÇaÝ&H˜¦C}í:Ñò{Ge¸¹Y†Ž‘zTùjd/“U£æyŸS¶ûÎÔü¾~I::ÌÃ72Jnîî—“uÿ\0H˜gIë³±t\Z\0JÒâ€ì.„£à5‚€Ô°Qð\Z\rAq \04\Z\n‚v\rƒP@\\h5ì\Z\r €¸¸Ô°ü3\\¬~7vT‰ndoÆ‰V‹™çÓ;0Ì±8éî³\'Ìs\"åWZ.Kv‡höÕýŸ-‘’IŽ“1-Lœ“ÝvOÍªÿ\0¢Î¤ÔÆU^|¡5\ZÀÐºQ¨¤ÙH-”Áý8+¤ÉÜáäpw2L»¸ik¤(æS™ïñÆÔˆjI~¡iÌS™š‹ðæ)ÌÅø\ns~âœÆ /À\\S˜§0à)ÌS˜ð\Z€¿‘•ÀãÌ°ÐÒÎl5òª8ô2;9Ã¯‰ôl‰ìÃ,íIŸFó~_‚(yÃD/Á‹€¿À\n–à\0©*Pl¥¸²és¼Ñ§ó¡©TÞvŠWµÉñ¥xaïôi¿‚4zÓ³³ ¶ø¶øJTT´3n¥EKa@%Kqa`%EKA`%EKNbÀJŠŸD ¢¥°¥À•8¹Ô<Ÿ/ú°óXYË±ùâ`ö˜i²ÿ\0ªº¢-ÄÂaäÛŠò>|Û.+ÈE|Àµädvk6’ç˜\\ÊRoÙGïÂ¿žh–©½hcª*¦°˜™8¼,¬V52TØpD·4ÕS?Zò:Ó±¡S$G³ø©žü´æa›{áß:;®Mð;.ÆKâw‚¼…E…‚Jòä,,¼…y\0¯!qa`ä+ÈX\0¯!^BÂÀ+ÈW°°\nòä,,¼…y\0¯#óÅâ%a0³q3ãRåJÇ2\'¹$ªÙúXë^Ùö…JÃÁ³øXýù©LÄ´÷C¾uw|’â%;C¯6Ÿ6ç˜¬ÊjiMÜ‡ú V…h’Ö¦6¼‰RÔÅA^B¼…IP-yŠŸRaö“`ƒÆ&—VHõ~LºS».Ñ#ô©UBÇÐb6j%EKa`„©n,,¨©h,ä©h(¨©h,ä©ôK\0¹*Z*g6:gÆ­·Õ´¾¦†Ï±Ré+:›âP§åš1·f¾®Ü¸lØîK–âå.\n\\·Uð¸Ph5 Ðj*Äéjd¨åEº4á~Mu.âª8[MsV;#SFÚ).Fo=-Ñ¾úÖïãRÌn·µj±Ô-ø‹ñ,uR‚…Ô_ˆ‚…¿~ J\nQ¨‚…§1N`Jo-ø‹ñPx–œÅø((]EøäÌT·/6]?v6º6ÎœŽn}²Ï1ò÷w13!§”M-OŸÚ6´Ãl§!NCQ©ŠJrä5\ZÈË±˜Œ:F7—>Lj8\"^\rqâžæ¸…Ù|çŸdÒ3=Rd«‚5½?—Óñ<å©´öu´ÑlöoÝŸO‰jðïî?Òâ¼xªò&Vvw¾ƒBKŽ’á™.8b‚$šŠTÓºiø¢’¸Ðh*\0h4æ\0h4æ\0h4æ\0h4¼Àh4\Z€\Z\ry€\Z\rÏ˜ã†\"™JaM¸›¢Iomð´ùÆ\"É§æ8Š>â¤¸+Gor^~<oÀóÎc‹ÄfùØÜTndùÑ¸ã‰ñ~‚[’à‡´}§‹hsŽäˆ¢X3pÉ[»ïÆ6¹øpTâÍ[R%M§rœ…£R”ä(5\Z€¡ÊÉåûLß.Ÿ½>Ö$Ž.¦Odàö»S”ÊßßÇI]cHÏox„KÔt-ø‹ñ=ûQ((/Ä·â¡høüK~ JâüEø€¡([ñ%ønJüI~ [’…¿~!&„I–üF¡Í×f$û,žSjŽ6ãêíðHÒá†(ãPCvÚK›gba¥)8yr¡v‚\nÑPÂýœþ#}«ø¿J\n\nJœ“AA¨Ô\0Ô\0Ðº£¨Bè:Ž 45}´‘I’1)oNü®¿VmLnÑaþÑ”ÎIV(´ZoøTšÎÒ¿M~L±-\Z¥¨ §2÷}*ZòæÅ9*øâœÙuW¯!¨§6«àZò))ÌÅy\nsT¯Èu^B¼…¨]Û9~Ëkó™t¢XééywÝN†ÁÚ<¿g·YÄ4¥qQEÖÿ\03_±à³ÆÙm³÷mÇc@,R¤¦€¤°\r‚Å²û&Úõ%ËÈ39”–Ý0“b{›þFø?œ)Ú‡—Ó£ªm5âv÷f[m>	y6o6˜¸R†DèŸñW‚oú¹øùï˜YKy;°ÂÀ\0°°\0,,\0\0ÂÀ.…€WÚÎ×©®<ƒ,›X¦.l/{þ„øqéÄÉö›¶ÐåðLÉ²™µÆD»³§Bÿ\0‚žôŸõ~ž{º…ïm¶ÛâD«µ¼h,,B°\0\0XXœØ	~ÓmòhiZc%EÒ$þFÆÍÙd¿i·ùD;é5ÅÒþEÚxß5#Ö>èžÏH×¯!NbœÏxÔJŠ–œÅ9*ø¼…¨¼…y\n	^B¼‹©(¼…yRS˜\nò%_è”^B¼ŠJs!³²=¾o%5îÀûïK¯\rëC[Ø¼= Ÿ‰‹Å©péwò6JÞz¸ºëóeÛàh41iš\rQ@\Z@ ¡n. ¡n.¡\ZN\Z;¦®}\\\\½ÌpïŽ!«AJ¾+z}(qïÀØvÏ\nÔÙX¸Wï.ä^jëá^†»Bøáèpdñ1Å—A §1rVš\r9‹ÔƒAqp\Zð Ð\\\\ƒAAp\Zä..œû[—ì»CÍa¥œRâë.ó5]>&íÛl¿g·Øˆ¿ÎI•û4ù\ZE\r¬µùÏÝµ^Ë Ð€Ödº\r>$è‘ -À°·M6šuM:4È(möi·1ãã—“fñ7‰îµ\'ßï¤«H¹Ñoññ½ßbÑp<ã²Ó\\¢ÀF+:kæéó;·.ÌæaÒ—6³%+.+Ëèeº›Ì6*r&‡ç\"|©ð(åF¢\\·¯5à~„ìÉh¸@œ‰ \0Zr&ƒP§\"hÎ|ùr qÍB¹ï~\\IØ~´\\¹í+nbËã™“e5Š¢S±	ÿ\0\r5ZCÎ‡…÷l¹Ži2}eÊ¬¹nÏ‹óú´3Þ\'<ÆÎ­TS¢IòN‹à‘/;C…QEŠ&ÜMÕ¶êÛâ4 ¡Š¥õ¼iñ  @J\0.Ÿ¡<\0¾·›‡cRý§hy{§îC6/÷q/™§ïa2ûûrâÿ\07„™Æó6´Q¾¢Ÿ8cnÎù¿è)ÌS™î\Z¦ƒAqpà/ÀS˜§0à/ÀS˜§0à4~üÅÀ?!~âœÀ_€£à.sò+Åf’ ‰{>ü^KêèµÑí¬Ú|›vQ†û.[\"KT‰CX¼ÝßÄæP\\·5ÞrÖ›LÌ¥Ëp„ ¡n. |@\nŠ—Q¨¢¥Ôš€°©u\ZÂÍ°«—Í©Þj°¾\rn4\'TÚj:4ÎÊÔÒ¶ŸölÊ)ªKïªqñ]o©e\'ÉÒáùv™¤±5-y\n\n:‰R×§1@ä+ÈPS˜\nò%KA@%EKNbœÀW¯!Nb—TT´£;}•ÜÛ,Ô­3ÕG\Zý(uÝNÓý¡¤÷s<§Oß“2\nù4ÿ\0æ:°ñ|J»j®Ù§»EF ÑfTT@j¢¨x€99\\]ÌÓ	³S w-QÓuó2ã6ÕÑ©Wbìû“:d˜Ôr£Š—Š2¸Lët8™uþô?4aõ\Z™,˜mr1xyé{9°Äß…hú3ö¯#NÔý¥bñ2’PO.mt#dlÚëÈW‘­,Ï\Z•=½|á_@óLsTöô\\¡_B66lµä~3ñXy)ûIÂ×…jú+šÔÜV&b¤x‰p«K¡øêO)³3‹ÎU8itþô_$bgN™:7ØâŠ\'âÏF¤§dŽ%D÷$ßC¤£‰Å‰Ý¶Û|ÎéÆ7öIí;û8¿Ft©•eò**‚¢¼…P\0**\0\nŠ€§e~ÏÒ»ÛKŸOÜÁ¸:ÇùjvÏìï&³s™ín†L)ù¸Ûý¿Ã+Íª¤ÞÌoî»v¥¯!NbœÏfÕJòE¯!Nb€J–¼…9Š\0©*ZsTT´RT´RT´æ)Ìy^Èa=–,TpÒ)Î‹ü+êëÑ\ZÖ+.D½J¼‹ÑU\"\\dÁ*H`J¹#ÏMœþ!—jÅ#Í÷abê5*rRÂÅÔj°±u\Z=nÔ€t£@èF:€C´/¶åÑÃ¬Ù~ü]7­Q’&\'fT´ÒÑhòu®ŒºM¤Á}“0q@©.mb‡‚~+¯êŒ]Ëâwz,w‹Ö-i£\Z2Ð\\2MthÆŒ·¡4e¸¸\r‚‚àMt«?hi=ì·)ÄS÷\'L‚¿âIÿ\0ÊtÙß=»áÜí‰†jUr1pFßÔPþ±#¡®y1]µ3?Ù±Ý(4-És–°âà9‹€\Z——’ÁßÎpPS÷±.±#¹:I²’ÜÝ£ÀC¾“”]/ò;oS:®ÅÙ(^¢âæKRžcF[‹)æ)æ[‹€êBÜ\\^¢âà|Nƒ¿*88Â×Tt›ògwø1™Jr3L†©ìæÇ\r<›F6S—ÉÇ §!r˜*@R\\9‹€§! ¹@‡u~Ï’;¹cˆ§ïâ”ÿ\0	ÿ\0Ìt±ßÝˆaœ‚•2”öø‰³<èû¿ò^\r]õ;ü\"Uä÷[¾ŒhËqsÖµÓF4e¸¸F4e¸¸F^¢âà4&Œ·hÆŒ·hÆŒ·?\\f+.D¿ÞÒ¼‹Ñ\\1¼¶\rÁRñ±­õ†\nðñ.¦É£?<4˜0ò “-R?R‰åç³eœ·›&Œh:\n¨ÐuhÆŒt\0h@¢¢…§0%…J(°©h(°±hN€p3¼Ç`b”’ï¯z[à×ª\Z4IÃ†$ÓN5tÎÈ¡ªmf_ì§}¶T>äoßKÂ.:þ¾e”Ÿ\'GAŸ–|9óìÀØXPP±Õ,,)ÌP……\0XXPS˜\ns;ÀXXPj·ÚníÛ›IPÕÃ!ÍKü\rGÿ\0)æÊò=m*8CP´ÓMU4÷¦ŽÜÙGáXËAô9Zþ:«ÅâÛm)~XÙåjòäz§îl£ð¬å ú¹²Â°–ƒèhÿ\0B¿ùýø°òµy\nò=S÷6QøVòÐ}~röG&‘í³Yy>ª½¬¸!qy*Uù$ÉŽ’gh·Ñš#¬¼Í^HW‘ÛùÏi½ž`ÜP`rhs–è¥à ‚¬i?ƒ5\\Ãµ¼<m¬Ådò—ƒž”Ï‚†ÔÛ§á=UûOëÿ\0ë^Úü5óiUä+ÈÎb;OÎf6àÉözBÑ—§N­œgÚ.Z¬>N—–ÊúGàÝTþxú«þ©‹á.fÀKö›O\"*UK‚8ŸF¾ghW‘×Û¶ØüÓ=•—æ2rùpM†%R0J‹¾•Rm%f“TãC°oÄáñ.“‡fð²Ný7t´yëŸ5R¨UüEÎ{l¯\"Uâü@•E¿~ *¸¨·â.ªE¿~ JU¶²>Ï´¸Ä¡¢©‰ñªMüjvµø¶»mŽÊsÙ˜¾F]2	PCí\"Ÿ„‚d]öªÒmU$š·\Z›ü;†äâ9¼s´í»SYž¸iÍf¡^B¼ŒÔ®Ó3¨\ZqeYÞQeð¯Ñ£%ƒífl\r}¯dv~rñöR¶ú÷ŽäþÕGç‡:8žjuä+Èìì³µšÒÌvF+vnL©SRóª…ÓCsÈ¶—³œéÃvQØ¬¥OÃÃ*6ø%U~U5²~Ôã÷§èºšÌWí/?W¯#Õ&ÉÝ\ZÊð\r?‡ƒè_¹²Â°–ƒèkÿ\0B¿ùýx°òµy\nž©û›(ü+ùh>ƒîl£ð¬å úèWÿ\0?¡âÃÊÕäzk³ìØ6+(Ã¸iÃC\\^ó][9ÿ\0se…`?-ÐæÃ\n…$’I*$•Fþƒ‡N–ói¶û°½ù–ÂÂœÅ¢²ÂÂ‚œÀXXj)Ì…ŠKñab‘y€°°ÔP§d°ÊKÆÌ‡ß˜©-5º:þ‹™„Ép/†[¯³‡Þð\\<Þãz‚`CJ¨‘…çÉÎ×çÚ<8óî¶))Ì©Ê,,^„èÂÅÔP	bÔjN€*u\0N£¨¸Ôu\0QÔ€ê:ÐSóÄÉƒ\"93aïA\Zi£ô¸n°ëìË	‰‰º:Ã7¯qú›¶—,~°$§K«þ«SJ‰8bi¦štiª4Ë«;Ã½¥Ï©¿šuIqs&ÂõEÉp>‰Ô—õIqp/QÔ”-ÀuOË‰Ãá0Ó18¹ò¤H”œS&L‰C)om»$tÎßöí‚Á9˜-“ÃÃŽžªž2rjJÝ†Î/7Eæ‹°éòf©\nòf¦(ÞÒî\\n+ÃG‰Æb$á¤@«Ù±¨ …qm´‘×{CÛFÈåÑÅ#,xŒæz·ù<=ÙióŽ**sIžvÎ³Ìÿ\0jñŸkÏ3LN)&Ü0Å ‡”*%¢?8 †0B’^ìaá4Ž¹\'“Ÿ“_iéHÙÙ{KÛÓfr¢‘—J‘”JŠµŠSqÌ§ûI/4“æuÞ/ˆÅÏ‹‹ÄNÄNÖ)“cqÄß6êÙù\\*<X1â©4¯–÷í%ÅËXõÂO™„ÅÊÅH‰Ã6Tj8QßYc#6Ê°ù„‡îÍ…7\ro[š~N¨è›_g{M÷&9áqq5Ä5Þæ¢Ü¢òðz?Î~$áS­Á1Æ÷§Ö<ãöþ].«Œ9mÚ]ÅNLS“$(àQÃŠ“M:¦¼\Ze¹óÏR…ê.J/QNL—N@T\\NLh.Hâ†qÅ0¤ÜMº$–öØî8yæc#)Ê§ãñÝ•iVŽ\'¹%Íº#¡1Ø™¸¼\\ì\\÷Þ›67o‹n¬Ù»DÚo¾ñ«	„‰ý†C}×»ÚÅ¹Ååàµ~6Õ.}?ðß\n	É’=»ý#Ê?áå¸ž®3äå¯h((..zG4  ¸¸\\³iv‡,‚yvy™aeÃº	xˆ”ý\ZÓàl¹_l;w–µö‰ø<ÚRß\"B†4¹8;·æÓò4[‹”äÓâÉïV×-ëÚ]ç³}¾dÈ¡•žå¸¬®c´S%¿m-stJ%ä“;C!Ï²lûöœ›3Ãc¥*UÉ˜›‡“[ÓäÒg18h\'¦ÒîÇýKÇÌâ`ñyŽQ‡‚ÅOÁâ`¼3dÌpD¼š£¡¡›…c·¹;}[Xõ÷¯½½ÑÔu<é°}»fx8¥á6¯\r÷†Q}ªJPÎ…qpÙE¥™ß9ŸeG—C˜d¸ù8¹ÍÀïáw…òi3ŸK“ûQÓâèâÔS/»,ŸQÔ—5×/RX\\\\ÔhÉrÜQÔ\\\\P…Ép.…‚£A.(¢i%K¶ÉseÙL±¥öùÐÝÚR|<_Ð‰¡Vl±ŠœÒÊd¸p%-ÞdWóáäd:‹Ž…;¸´ÞÓi:Ž¢¯èGQÐ\\QÔ€:Ž tÔ\n¾@y\nò-€•ä+È¶W¯\"ØX˜¯\"ØX	^B¼‹a`%y\ZÖÔåu®:D7_Å…~¿^¼Mš„i5F•òbv[‡-±[šmac/´YSÁNöòaoÜ¿‘ðòàb)Ìº\'w{Jä¬Z¥…WABY–aUQEÄPko¶×$ØÌ³íy¤îôèÓR0°4æNk‚ðKÅ»/:\'Ží_´»b2µU\'5Ÿû6ºwã¥Ô)êÚ¢ñkÊ[Ef{A›NÍ3|TxœT×W[’ðInIx%c£¢ÐNjÝ+÷iêuq‹Ù¯v{´>Ðsí´Å·Žœä`aŠ²pR›Rààßõ>oV5œÛÅÞj’Ö÷Ç‘ùI–æÍPCâ÷ðFfTµ.6HôXñÖ‘ËXÚ{Zo;ÚU(aJ’JÉ#èšLÂÅ&£P·‹\rE\0[Ó)5oL[ÓoØ³Ÿ“¨p8õ#ZBÓ¬r¼¸®]8>ÕË±ø,Ç\'ˆ‚|¨·EÜø5½>Nçžõ9YnaËq\n~73ÅÀèšàÖæ¹3ÌñoÃXu–œ¸§–ÿ\0Iý¾nž“‰ßrß¬}^ƒ°±ÕùOi8ÙIA™`ebR³ŽSîEæÕÓ~T6<\'h;;=/k\'üTÉM¥þ­O¨ü?Ä0O\\s1é×ùú;XøŽŸ\'æÛçÑ¶ØXÀÁ¶5\Z¬9´•þ(b_ªí†ÌÀªói/ü0Äÿ\0Dhÿ\0NÖo·…oþgö_þ§ùÇêÏXXÔq}¡lô”ý”XœKðPJi?õš5ÜÛ´œtån\nV;(æ>ü^iY-joiÿ\0qóÓÑëÓùú(ÉÄtøÿ\06ÿ\0.®ÆÌ±ø,·\'ˆ‚D¥üÑ=ï‚[ÛäŽªÛ]´Ÿœ¨ðXZ:ºG7Ï‚å×‚Öó~72Ä9øìTÜDÇ¹ÆëEÁ-ÉrGSÙðŸÃXtVŒ¹gšÿ\0Hù|~n.¯‰ß4rS¤}KzcQCÓ9…½1oLPP9üE½1A@ôÊMF =o?,L˜\'ÁÝ‰Qÿ\0+àÏ×Q@0se¹q¸\"Tkâd¶gh3}›ÌàÌrltÌ,õgÝu†5Â$ì×\'úŸXÜ:*°¯}nçÈÄµFcjÄÆÒˆ™‰Þ¬ì§µ\\¯káƒ/ÇÃ//Î’þ‹û9ôÞå·ããÝw^\rÑµØÖ<*8åM†d¸â—2¢†([M4êšksG£;í]gNNÎí,èaÌh Ãb¢i,Obá3ƒñóßÁÖðþOooƒ«¥Ösû7îîZ®±iÌS™Ét\n®‚€*¸\n®‚€,*¸¬³3‰R¥ÙoŽ*Z;\"ÖŠÆòålþXñøžüÈZÃËu‰ñ|ÌÝ!…C\nP¤’ÝMÉ–+‡‚D•H T\\OÞÅ6åÂÔçœÖßÉ+ÈW‘l,b×JòäZ+ÈW‘l,¯!^E°°¼‹^BÂ€J‚ÐË^C@%ÁkÈWA^@D.Zòä¯!^@Ar×¯ ?)Òà*)S!QA£OsF•e“2üE«˜ß¹Éó7ªò?^V*DRg@¢‚%te[lØÓj\'\r½yNcS››åÓ²üGv*Å*\'îGà×ÌàÔ¹Ý­¢Ñ¼v]F¤+©«ö—¶XŠÙÙ™Ž\'»7`ÂaëG6:|Þß‚æÒyüÏ…ËrìFaŽœ6[™68¡…*·ÏËÄñßi{aŒÛ=§šOqA†‚²ð’´©IÙy½íñ|7´:_ûÏhÿ\0»5µZ½;Ë´9ÆaŸføŒÛ4ÄE?>.ôq=Ë‚KÁ%d–äŒ}O¹9³aVîü—‰é¢\"#hpæfgyd2É=ÙNk^ô[¹#™FD”)(U²E©’J1F**ÀQŠ1V.ŒQŠŠ€£b¢¬£b¬£b¬£`(Å«F(ÅX«F(ÅX«F(ÅE@QŠ1QVŒQŠ±VŒQŠŠ°bŒTTŒÌä÷&©°ªCþLÉÔüñ2ý´˜ {Úªäü¡„§3êœ¨¡Š(bM4Ó£OÁ£åÙÑÙ¡Rôï`Ý¤ÚlÈs©ëïŒ4ºË™¾*Z[ùÆ¼x«ñ§kêxS+ÇâòÌÇ˜`gÅ#‡˜¦J™ºiÛÏšñG°û2Úì.Ùì´ŒÒWv^&ìñrSþÔ•iÉï\\ŸÏ=Ät~ø”í?GcG©ñ#’Ýá´j5%ËÔå·Šs\Zýp²\'bgÃ&L(âvåÍòÌDo/¬\Zn/‰)Åè—‹|Û+ÀÊÀa”™w‰Þ8š¼O‰ó“åÒ²ì?u{Ó\"¼qñC!¡U­»‹ªÔÎYå¯d¸¹j+ÈÁ¦—.ƒ@%ÁkÈWâåÐh¸¹kÈW¼†€K‚×Tµ%9ŠjJŠsÔT”-\0\"TS˜§0æ¢¢‚€**)ÌPÃ‡“Š‘™Ð( ‹ÕWi™Æ[;/ïV)1?r4¾ƒ7ªœù2çÊŠTØTpD¨Ó2­¶léõ6Ã>Žº¨±”Î²y˜œÙu™‡nÏÆOêj›eža¶kf1ùÞ*Ž,§0·NünÐB¼ÛKRúÇ<ÄCµ\\´µyâz:_öÛ7ù{€›îAÝp½ï|ß’¤MqpðgEXäæ¸ìNg™bslÇ7‰›Ù±¿›mùoÜq¬zÝ>ÃŽ)l³–ói,s²©uŽ)­Y*-N\rŒ¾_s\r®êß®…êáÈõ¼zÞ(:“Öñëxè:\0õ¼!B=o·Žƒ [Ç­ã èÖñëxè(Öñëx  [Ç­ã èÖñëx èÖñëxè:\0õ¼zÞ:\n\0õ¼zÞ(:\0õ¼zÞ:€=o·Žƒ \nŠ„(Öñëxè:\0õ¼zÞ:€bs	jKiZ+¯™Çª29¬ºÊ†>É˜êÆRÆóØ¶ÙE²_*f\"k‡,Æµ\'vI¿v?8[¯“kÄÑ¬[dÇ\\•šÛ´²¥æ–‹G“ÞI¦”P´ÓUMnhú:ÏöxÚ·´;_Š™ßÇeT‘n®)TþÎ\'¢pÿ\0£_µrìütå.J²ýèÞèW?¡äscœWšÛÉè+–¶§>ýž\r;>2aqDú%Å¿n™N[\'/“HiØ—¿W|—}e˜		ÎR«wŠ6¯9´5­mÜNªrÏ-{-B%\ZkPÉA@-EIA@-EIA@-EIA@-EIA@-IA@-A(\0\\·%ÅÀº’ââà.[’âàUR\\\\\\ÅÅÅÀ\\\\\\\\ÅÅÅÀ·\Z’âàH¡QÂá‰\'³Os<ûfg8|.g—l–_1¨{ŸmÅÀ¡m¸eÃ_%iñ…ð=_6d2¥Å2dJ MÅtI+·^ó«´ý¥™µÛœíqDàÅâbrSÞ¥/vZÒ\nó:¼#>nyí«{V&\"{µ *Zž¡ˆªÚJõ±‚ìÂ·$‘†Â®ö&Zþòfj¤ÂaIF** •’‚¢ ((ÅE@_˜£æ**˜£‚TT1QPb˜¨¨\n1ÔTTùŠ\nŠIGÌTT1GÌTT1F**‚‚¢ (ùŠ>b¢ (Å1QP?,\\ü4ÅýÚô¹…3ÍÕ4üLiÃP½é´D¢_ µvìÿ\0´d=¦å°â§¹XÆ5ƒÄµ¹(ÚPÄëeH»­¿SÞØL4œ,•&D\nVþgó%7QBÚiÕ4îèocÛOÿ\0kû5É3Øãïâ\'a”—ãí ¬¾UŠ×&?Æ°í5Ë)eÏn^]ú7‹’âç	‰rÜ—qqqp-Éqqpqqqp-Éqqp-ÅÉqpàQRPPQRPPQRPPQRPPQRPPQRPPQRPPQRPP¼ý¢öìßcùî*T}Éø™+&ô}é¯¸éÍBâz©ê_Û“:îeÛ;³’ã´Ù³q³¡áÝJ½ù-t=OÅÉ§æøÈTTt äeÊ¸¸_ßÀËTÆeJ¸ˆŸ_êŒŸBa0TTtJŠŽƒ \nŠŽƒ \nŠŽƒ \nŠŽƒ \nŠŽƒ \nŠŽƒ \nŠŽƒ \nŠŽƒ \nŠŽƒ \nŠŽƒ \nŠŽƒ \nŠŽƒ \nŠŽƒ \nŠŽƒ \nŽƒ \nŠŽƒ \n˜lbPâ¦.uës3ÐÄæKü®\'Å\'ð‰qê*J¡*z«öÚ;\'Ï¶blÊ¼4è1’!nýØ×r4¹\'/Î&yU­û(gO\'íŸ-•}ÙY”©¸)Ž»ëz¬p@µ4¸†/Ohøuý¹ê*J\n<ZŠ’‚€ZŠ’‚€ZŠ’‚€ZŠ’‚€ZŠ’‚€ZŠ’‚€ZŠ’‚€Z‚P\0  ¨¨\n\n\nŠhJ\nŠ€HPTTE@PPTTE@PPTT~×ù³Ì{fÅaU‡-ÁÈÃ*;&Óšõ¬ÊhtíÍ¯µüÉæÝ©m>>½ècÌçÃã1¸aø$j•=¶šœ˜k_Hä¸©j^9¹JþÖ7ËædncòŸß™äŒ…I„•°«	/QQQP‚¢â¢ .***¬TTTEEE@TTTTEX¨¨\n±QQPb¬TTX¨¨¨\nŠŠŠ€¨«’¬TT\nKŠŠ„•*ÅX¨¨Åf–Ä§Æú³)Sšÿ\0ýß›K‰qrTT„-ÌžÉfqä›S•g0V¸l¬JãîF¢§ÀÅÔT‹DZ6‘ý;‚(c…GQBÒi§½?î†±Ùfbó~Ívo1Š.ôsòÌ<S÷Ô´¢ø¦lÕ<-«Ëi¬ùB¢¦!BÐ•Ð”Ð”ÐP•BÐ•BÐ•Ð A   \r‚‚€(4 ÐP”Ðh((A   \r„¡h‡áŒŸ	;3÷%AÈ¼’mþ‡ïC]í/ö.Î¶—œ§1>jTM|I¬sZ :1S¦bq3±s&Æã‰ñm¶þ,üèJ\ns=ÜÔ‚œÉü§÷ãòFDÆå?År¯ÄÈèL&”	RXh(ÂÂ‚€*,((¥%\0¤¨  ‚€RXPP……\0¤°  ”‚PP!IaA@•  B’Â‚*	A@(%\0XÆæßÇ‡ü?3%Cšÿ\0Âú±(—‚‚œÉNd!@  ìý–1¿mì;\"ïEXä9ò\"¾îìèèº4vŽ‡G~Å˜¯oÙ&&Kux|Út	pN	Q~±3¼hx½eyuY\n\r\r`ÐPPP‚‚€((((‚‚‚€4\Z\n\n\0    \r\0 PPµ%@PPµPPµPPµPPµPPµPPµS™¤vó9ÈìsjãN•ËfAþ²îüÍâ§]þÒ1÷;Úx—þÚÖlæ[§òÒ=cî<ABÔ•=ÀPPTTfTéˆ‰q…þ¨Êœ²*b’âš2µ&}¢¡*|–¢ PJŠ¢TTQP!ôJŠA**¨¨ù-E@ •‚TT\n|–¢ PJŠ¢TT\n	QP)òZŠA**1Y£ÿ\0*\\¡FR¦\'1uÅÅÉ%ð‰q¨)ÌTµ!‘z¥¨¶ý‡\'8¶+?ÃÖÐf0Çþ´¤¿å=\rCÍ¿°¬uÉv¦_Nõ†?¡é:ž?ˆÆÚ›ÿ\0ß!((ZŠšBPPµPPµPPµPPµPPµPPµP 	QbÐP	abÐP	abÐP	aT‹A@ ±h(-\0–-\0–:ßö›iv´Íºe)¿–vM­ý«&{>ÂvVŽ8°Ð¯ÌÊ\"ý,ožŸ8û\nX–-l%\0ä`Z‡-ókàeìa$>ìùqp‰?‰›±0˜,,,,XXXX………€XXXX………\0h,(,Å%€XXXX………\0XXXX………€XXPX……€XXXX………€XXXX………€XÃcZx©ÍŒïzlqq‰¿‰‰|ÐX”[\n\nê_ØQ¯»ö±x©¸Ki4ô½/þÂ3)7kä×|88ÖŽzª=By\'ùVÿ\0´	`š-\r,E  ÂÅ  ÂÅXX´XX´\0K‚€K€q\0Þ\0À\0p^\0\0A\0\"ð\0(\0Fu7ímÿ\0ù·ÿ\0èÃýa\0ØÑÿ\0qOœ=Äâí@\0Ô?¼¼ÌàÂ`+ð\0$à@\0¨ \0 \0\'‹\0\0Ç‚\0\nO¨\0ð\0\'‚\0\n÷è8\0\'€\0Rx\0Ä0\0¤ú€nAîÔ\0€x\0\0}ˆJ$à@n =)û\nÞ»Sÿ\0Á†ÿ\0Šaê•¸ÉqOî­ÿ\0d¢Ü_xÀ à÷€{€\0O©|@\0÷\0\0ŸRð\0\0ÿÙ'),('123','Tarjeta de Identidad','KENER','ROMERO','123','kener@gmail.com','93b16f06785d1f7773d056c1b7501f39abf371f1','calle 42#31-69','ADMIN','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0H\0\0H\0\0\0½vðd\0\0\0sBITÛáOà\0\0\0_zTXtRaw profile type APP1\0\0™ãJOÍK-ÊLV((ÊOËÌIåR\0c.KK£D04006’F@¶9T(Ñ\0˜˜›¥¡¹Y²™)ˆÏ\0Oºh-ØŒ\0\0ÁIDATxœíÝYl÷áðco{×»Æ8>ƒÀ^;Å1„4€Rq…@\nF…ÚF•šFJß*µ}*}hUU%EEUb\"DIâQÐ8Ø`csClŸk{×öž3»3ó5â<cïbÏîþüý<f~ÿlí—ß1¿ƒÚ»w¯\0ÈB\'»\00ól\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0b“]˜yÒCt: ?(À0ŒN§£’„ZÂlB°É!B,‹F£F£Ñf³Y­Ö¬¬,Š¢rrr~PrxxX’¤±±±`0811Áqœ^¯gYV<\0ÁNo’$	‚Àqœßï¯¬¬t¹\\eee‡Ãd2™L¦ŒŒŠ¢233ð)¿ß/IR ˆD\"‘HÄçóÝ¹sçæÍ›·nÝÊÌÌ4Ã OkvZ’$)‹‰¢h4\Z,X°bÅŠeË–Y­V–eõzý”—£n³Ù¾ÿ/Ë—/Åb~¿¿µµõòåËƒƒƒÇÑ4Í²,žŽ¨½{÷&»Žãt:ÝÒ¥K—.]ZYY™——7ã?âÞ½{W¯^½zõªN§3\Z3þ#`V¡ÅN’$E£QŸÏ÷òË/?ÿüóö±gJ^^^^^^mmíÐÐPccãgŸ}æp8ôz=Zït;=ð<o2™ªªª6oÞüä“OjüÓûúú>ýôÓŽŽŽH$b04þé\0¦¦¦&Ùu\05’$…B¡§Ÿ~úõ×_ß¸qcVV–öuÈÊÊZ¾|yyyùÄÄD?šîÔ‡®xê’ûÞÇíÝ»·¶¶Öjµ&·>EEE---4\Zˆw*C‹¢äyï¥K—þîw¿s¹\\)Ò6,X½zõƒîÝ»GÓ4²š0ÆNE¢(F£Ñ;w®^½:±éh4êõzý~8–›ýïÉ­ÙlÎÌÌt:Óy=ö(ŽãÎ;÷ŸÿüG¯×Ó4&§tÅSN4\Z¥iúÍ7ß¬­­÷³^¯·³³³««kxxx||<ÈÁŽD\"ß—1™Lr°322ìv{NNÎÂ…+++NçôÑh\\·nÓéü×¿þFû×fZìÔÂó|iiéÏþó¢¢¢i~$‰x½Þ›7ož<yòÎ;z½^^:öý:ð‡;Ìòòï“‚F@YYÙÆ].—Óé4™LÓüéõõõ===)2X\0‚B8ŽËÎÎþÃþàp8¦S>‹utt´¶¶¶´´øý~³Ùü8‹½A‡Ã™™™µµµÏ<óLUUËN«CçóùöíÛ7::Šu,©ÁN<Ï¿ùæ›óçÏŸNùöööO?ýtppçyƒÁ0S“X’$ÉÿÃÂÂÂÍ›7»Ýîé|Êãñ¼óÎ;ýýýh·SfÅSÏó‹/þõ¯ýèN¬Guuu9räèÑ£Á`pÆ—sS%7Ô>ŸïüùówïÞu:ÙÙÙêŸ²Z­K–,éëëóx<Ø\"–\nìä!\nýñœ2?±Xìüùóï½÷^oo¯Õj½·MEÑ4m4\ZûûûÛÛÛÍfsaa¡zb-Keeå\'Ÿ|‚yòT€`\'™ ¿ÿýïóóóÕK>xð`ÿþýgÎœÑétšÍB³,‹ÅZ[[{{{ËËËÕÉX,–šššöövyg˜65„I!ØÉ$ÏKÿìg?«®®V/ÖÓÓ³oß>Çc2™4^BQ”^¯¿wïÞÿû_—Ëåp8T*àp8G[[fI.;™B¡Ð/¼°yófõb×¯_ÿç?ÿÉq\\§¦ä¦ûòåË………¹¹¹*%‡‡‡»ºº0‘–DvÒD£ÑÒÒÒ·ß~[¥eE±¡¡áÀÃ$}RŠ¦éh4zæÌ½^¿hÑ\"•j»Ýî7nx½Þ¤×yÎÂ@(9DQ4›Í;vìPï¯655}øá‡6›-E†¬4MÛl¶?ü°©©I¥EQ;vì0›Í¢(jV7xZìäˆD\"ë×¯ñÅUÊ\\¹råý÷ß—\'¨5«Ø”(Šb¦³³3??ÿ‰\'žP*–““‡oÞ¼‰Õ¦I‘Bß˜¹CE§Ó¹iÓ&•2}}}ûöíKÍéeš¦9ŽÛ·o___ŸJ±M›69N4ÚI‘r_š¹`||¼®®Îl6+ðz½ï¾û®ÝnOÁTËhš¶Ûíï¾û®×ëU*c6›ëêêÆÇÇµ¬ÈRô{C°X,VUU¥²T“çù“\'OöööNs©v²°,ÛÛÛ{òäIžç•Ê¸ÝîªªªX,¦eÅ@‡`kL’$Q7nÜh±X”Ê´¶¶ž:u*-6TÆS§Nµ¶¶*°X,7nEQÞRšA°5%Â¢E‹***”\núúz‹Å’«;(Š²X,õõõ@@©LEEÅ¢E‹½ff‚­)ŽãjjjTŽ\r>yòd8NÙ¡õ£hš‡Ã\'OžT*™™év»>Â46_ 2ƒÁçŸ^éiOOOccãô9H&“©±±±§§G©ÀsÏ=\n…´¬ ØÚ‰Åbn·[it-B[[Ûøøx\Z5×2š¦ÇÇÇÛÚÚ”úÛ6›íé§ŸÆš–Òì;”ÖB¡P]]ÒÓ‘‘‘†††´˜3{”ÑhlhhQ*PWW‡F[K¶FDQÌËËSÙ>ÑÜÜ,IRZÌ™=Š¢(I’š››•\näæææååa±ŠflD£Q—Ë¥ò–ëôéÓi7º~˜Éd:}ú´ÒS‹Åâr¹¢Ñ¨–UšËlˆ¢XUU¥Ý7nƒÁ4m®eEƒÁ7nLúT¾x-¶fl-H’d³ÙT®ÝêêêÒýÿC‚ÓŽ\\yù™TVV–ÍfÃJm ØZw}(~411ÑÓÓCÀÖe†azzz&&&&}šŸŸŸF[¶ä`ÛíöIŸz½Þþþ~2‚Ýßß¯´-Än·Ûív[¶DQT¹ ‰ŒŒŒ¤ÝëëGÑ4=22òðuB?àp8lm¤ý—)-Äb1¥~¸$I·oß& Õ2š¦oß¾­4.,,Ä2mò}Jq‚ (]y\'ÂððpŠïÐœ>–e‡‡‡•– 9NìÑ‚­A”ºâ¢(0À–1388¨Ôßv8¶6l-‚ tÔ¾$I>Ÿ/­_t=Œ¢(ŸÏ§Ô·Z­¶6l-ð<¯´˜T’¤ÑÑQ’‚=::ªìÜÜ\\•ãV`!Ø\ZQú®K’ä÷ûI\n¶ßïWùe5®Ïœ…`Á ‚­•Î61ïºd*¿1#ŽÔ‡`keY¿ß?é#š¦\n\nˆY%ŠbAAÒz¿ßOØ¿b)ÁÖË²*§‹˜L&bf•$IRÙU>22‚`kÁÖÃ0Á`PéQII	1owA())QZo‰YŠ“âl-°,ëñx&}DÓô¼yóHêŠÏ›7O©+îñxÐbkÁÖÃ0J]qš¦ËËË‰9v›ã¸òòr¥`ŒŒ ÅÖ‚­š¦•ZlNg·ÛN\'ÃlI’T¶ëtº¡¡![¶hšöù|J•m6[~~>ÃlAòóóm6Û¤O#‘HºŸë–Fl-ÈÁ¾wïÞ¤OçÍ›W\\\\LF°‹‹‹çÍ›7éÓ{÷îy½^bvž§8ü•µ@Ó´×ëUéWVVjYŸÙ£ò‹x<[3ø+kDÅû÷ï+Í~Ë—H§õ0[’$ùêïIŸ\n‚ ²Of‚­ƒÁÐÖÖ¦´þÌb±¬Y³&­·4ò<¿fÍ\Z¥Àµk×ƒÆµš³l0ÓÕÕ¥t‚§N§[»vmú6Úrs½víZ¥^¯·»»SâšA°µ£×ë›šš”žæåå¹Ýî4½\'\ZºÝî¼¼<¥MMMXš¢%[;F£ñØ±cJOM&Ó†\rX–M»F[’$–e7lØ ²JüØ±ciz‘hšB°µCQ”Ùl¾té’RòòòeË–¥]£F—-[V^^®TàÒ¥Kf³o°µ„`kÊd2µµµ)M†õë×¥Q£-IÒØØØúõë•&ÆDQlkkKë‹DÓ‚­)½^ßÖÖÖÑÑ¡T ¤¤dÏž=*—i¤šH$²gÏž’’¥mmmz½^ËZ‚­)Š¢8Ž»xñ¢J{íÚµ.—+-¶…pçr¹T&Ã£ÑèÅ‹9ŽC?\\c¶ÖL&Ó—_~Ùßß¯TÀn·oß¾Ýf³¥ørQm6ÛöíÛUv}ô÷÷ùå—è‡kÁN«ÕZ__¯’Ûòòò]»v”lK’víÚ¥2g&Šb}}½ÒM	0«ì$`Y¶¿¿¿¥¥E¥Ì³Ï>»eË•3º“H>}Ë–-Ï>û¬J±–––þþ~¼¾N\n¦¦¦&Ùu˜‹(Š\Z¨¬¬TÚä¨Óé***X–½qãË²©3F•$)‰lÛ¶íÕW_UÙÑ144ôþûïG\"ìúH\nüÑ“C¾¼îÔ©S*eX–]·nÝÊ•+C¡f›R(Z¹råºuëÔ›âS§N‘tÙ`ÚA‹4z½þÛo¿-(((,,T*c0*++%Ijoo7™LÉm·åWÖ¯¼òJ]]]FF†JÉæææ£GbtDv2±,ÛÞÞ^YY™­TÆ`0TUUåää´µµQ•¬ž­ Ñhô—¿üå¦M›Ô‡vuuíß¿_¯×§ÎðaB°“‰¢¨X,vÿþýêêj³Ù¬R¬¤¤$??ÿÛo¿MÊ™û‘H$++ë7ÞxþùçÕãêóù:4::Š9³äB°“L>À´»»ûG?ú‘zÉ‚‚‚%K–Ð4­MÓ-B$Yºté¯~õ«ŠŠŠ)Ëÿõ¯½sçÖ™%‚|ÃÜ½{wll¬ººZ}¶)33ó¹çž³ÙlÃÃÃ^¯—a˜ÙëîJ’Äq\\~~þÖ­[wïÞ™™©^žçùúúú––•®hÁN	z½¾··7‰¸\\®)›âÒÒÒ%K–ÈËÎu:ÝŒÇ[ÅH$¶nÝºsçÎ§žzjÊÄb±cÇŽ;w.é3| C°S‚<+ÖÕÕuïÞ½åË—OYÞjµº\\®5kÖÈ=ùP(‹Å3á’$ñ</I’ÝnñÅßzë­ÚÚÚiÎl8pàë¯¿6HuŠ@°SEQ,ËvwwOLL”——Oy,EQV«õ©§žª©©),,´Z­<“‡ßÓ˜$IÑh4X­Ö+V¼ôÒK?ùÉOV¬XaµZ§ó?ñûýGŽ9wîœÅbAªSµwïÞd×þŸH$âv»wïÞ­t@·Ò§FGGÚÛÛ›››ÇÇÇM&Ë²r3þp÷^EI’AˆÅb‘HÄn·?ûì³n·»¨¨(;;;®\r###‡–ß±ÇñÂìC°SÏóV«õ7¿ùÍt&¢\'566600ðàÁŸÏÇÇÇåæTîi[­V‡Ã‘››[TT”•••Ø¸uëÖþýûƒÁ ÎMAvŠ’ÇÌÛ¶m{ñÅS­=ŒD\"çÏŸÿè£AÀûêÔ„1vŠ¢iZ^Iz÷îÝ¨/áÔÒýû÷:túôi†a°<e!Ø©‹¢(½^?44tüøqQóóó“ø2I’$ŸÏwüøñ¿üå/>Ÿ¯µRvw¥4I’(Šb¦©©é»ï¾KîÞìáááÁÁA‹Å‹ÅRütÀ;E‰¢FY–]¼xñ+¯¼òä“O\ZÆ¤7’<Ïûýþ³gÏž;w.Ò41vjB°SŽ$I¡Phþüù«W¯^²dÉ‚’]£I+W®466Þ¸qÃd2a°jìòýÚ¯-[¶,_¾\\eŸvŠ»uëÖG}444d±XïÔ`§\nžçM&SeeåîÝ»Ng²«Ÿ\'Nœ?Þãñ`UiŠ@°“O>™dÕªU6lX´hÑãÿ\'&&Âá0ÏóápXÞ¤õƒòpÝ`0˜L&³Ùœ™™ùø›@GGG¿þúë††ymìcþßà1!ØIÆqœ ¯¿þúªU«ç,!ÇÓÛÛ{÷îÝñññááa¿ß‡\'&&DQœ˜˜øAa›ÍFÓ´Åb±Z­6›Íáp8ÎÜÜÜâââÂÂÂ„›\\Qoß¾ýþûï÷÷÷Os©9Ì;iDQä8î™gžÙ±cÇO<ïÇÃáp0¼sçÎ…:::äó@)Š’_Qÿ£Óé\r˜üÚLúQåä’$Ñ4½xñâÚÚZ—Ëe·Û-K¼¹ \'Nœ8uêÇq8q!Yìä¢¨W_}uõêÕ‹%®Ïöõõõ÷÷_¿~½©©)‹™Íf¹ë;#-¤¼?„ã8Q«««—.]ZZZZ^^oD¯_¿þá‡öõõáöÜ¤@°“€çy–eß~ûm—ËW\Z;::\Z»ºº<Ã0³z` œpžç322.\\èv»W¬X×¿AÿøÇ?:;;±£S{¶Ö8Ž[²dÉîÝ»çÏŸ?Íø|¾k×®;vÌãñddd°,«åY¥’$Åb1Žã8ŽÛ¶mÛªU«\n\n\n¦ÿfëøñã\'Nœø~\\\0ÚÀZqíH’4>>¾víÚ={öLó…V8þæ›oŽ9ræÌyºkVÏ9›”<h7f³¹³³S¾=Óf³©ÜÅ÷°²²²¢¢¢Ï?ÿÜl6#ÛšA°5\"¿vÚ´iÓž={¦3ìE±¹¹ùðáÃ_}õU0L…Mò¦QoÞ¼yåÊ•±±±L¹›a˜üüü²²²ÎÎNÜø£[òxuçÎ[¶l™N>ß{ï½£GF\"ƒÁRaãÍóüÍ›7/\\¸àp8²³³§œZ+((¨¨¨¸~ýz(J©_‡Tö¬“$iddäµ×^ûñ<¡é\'Ÿ|òÁôôôÌÈº‘Y\"¯oáyþâÅ‹§¨¨hÊó‰ÇÂ…åÜ)û{Áž]r[½k×®—_~yÊoóÐÐÐÁƒ¿úê«X,–o€išff``àÒ¥KÙÙÙùùùêý‡Ãáv»oÜ¸‡‘íY…`Ï\"y>yûöíë×¯Ÿò{ÜÒÒòÎ;ïšÍæ4úÒËHyžollÔétÅÅÅê£n‡ÃQZZzáÂy«¹VÕœsìYkjjvíÚ5eüìÙ³E1-\ZêGÑ4m0®]»6::ºhÑ\"õCÚœNçüùóÏœ9ƒyòÙƒ`Ïžçkkkßzë-õæ78pàã?¶Z­iÔP?Juœ8qÂív;•Â………N§óêÕ«qÓ‡`ÏŠX,V\\\\ü‹_üBýBŸÏwôèÑ.Øl62¾ß,ËRÕÞÞ^VV¦r7°N§+((ÝÝÝØ\n6Ò¸‰HYò+ë×^{M}m™×ëý÷¿ÿýÍ7ß¤Î	¤3‚eY¿ßÿ÷¿ÿýêÕ«*ÅŒFãŽ;ìv{,Ó¬nsZì&IR8~ã7žyæ•b^¯÷OúS___ª>#hšŽÅbŸ}öYuuunn®R1½^_]]ÝÔÔ$o‰Ñ²†ÄC‹=Ã8Ž[»v­úe×ápøÐ¡C^¯—ÈTËhšÎÉÉ9tèP¿J±¢¢¢mÛ¶E£ÑäÀJ{&	‚PPP°nÝ:•qc(:räÈµk×NµŒaŸÏ÷·¿ýíþýû*Å^xá…åË—ó<¯YÅæ{&ºººüü|•2Ÿ~úé_|1Gî»bYv||üÏþs(R*c0¶mÛ&\Zí„`ÏŽãª««Ýn·J™–––>ø á{ðÒ‘^¯ihhPÉmnnîŽ;=Â	†É³™!‚Ýnÿío«rnYggçÁƒçà9žz½¾££Ãét–””(•ÉÏÏ\Z\Z’Ð²n¤B‹=3AX¿~½ÊÖüñÜÜÛDQ”Ùl>räHWW—R™ÌÌÌ—^z‰atÈgÄœû’ÍArrrV®\\©Ò744tvvÎ‘¡õ£hšáÈ‘#*¹u»Ý¥¥¥x­=#ì7oÞl³Ù”\n\\¾|ùÔ©Sf³YËZ¥\Z½^ßÝÝ}üøq¥EíØ±#hY+R!ØKE§Ó¹|ùr¥gÏžM…+õ’Îh4655\r*(++«©©‰F£ZÖŠHöã\nƒ?ýéOUN;ºtéÒÕ«WÓtÛÖÌbÆãñ|ñÅ*·ðnÝº¯¾‚ýXb±XUUUuuµRÑÑÑúúú9Þ	˜Ñhüä“Onß¾­T ¨¨hÅŠh´‚ýXAxúé§U¶(~þùçØ™øÙÙÙŸ}ö™ÒS‹Å²dÉŠ¢Ðh?;q’$Y,–¥K—*¼xñ\"®Âø–e»ººTö~ÕÖÖfee!ØÁN\\,+//WºÅZÅ‹/ŽÏÁ×ê(Šây¾¹¹9‰LZÀh4ÖÖÖbõøãÀw.q~¿ÝºuJOGGG/\\¸0g_\\«3­­­G©ÀªU«ÆÇÇµ¬aì‰¢XTTTVV¦T ¥¥åÁƒh®\'%7ÚgÏžU*ðÄO¬\\¹‹U†¯]‚8Ž{á…T\Zä“\'Ob2\\…ÑhlhhPê†eË–)=…)!Ø‰ï‘^¸p¡Rƒ|ëÖ­û÷ï£¹VAQ”ÑhlmmU*P\\\\œ‘‘)´Äà›—QËÊÊTn«?þü”7c€Édºté’ÒÓ¼¼¼…\n‚ e•ˆ`\'B>„Ti/—Ïç»{÷.¶N‰a˜¡¡¡¾¾¾IŸÚl¶¼¼<;1v\"$I*((PzÚÛÛ;44„~ø”hšöz½*sã%%%*‹OA¾|‰E±¼¼|ÒG‚ Ü¹s‡çy¬6›Q¿ýö[¥WÖr°1ÌN\0‚7ùF®Lú4\nuwwcËÇ4éõú®®.¥Ùï¼¼<‹Å‚`\'\0ÁŽ› .—Kéi$¹uëØÓDÓtWWW8V*€ù³Ä Øq‹F£UUUJO¿ûî;ŽãÐŸ&ùÕÙÙ©T`Ñ¢EX¦’\0;n‚ ¨œmvóæMìúˆ‹Á`P	vAA¶p&\0ÁŽÏó*°;::pË\\\\X–íîîVzZZZŠ‰ñ Øñ‘$);;[¥§=00€]q¡iú»ï¾Sy:oÞ<d;^ø\nÆGÅììl¥¹1ŸÏ\'IØñ2£££“>b&\'\'ãñB°ã#Šâ¼yó”:Û÷ïßG?<ò4¥G‡-v¼ìøÈg’*¥wllÍu(ŠRºÜ‹eÙììl;^v|$I2›ÍJ£è±±1°@Ó´ÏçSz¤×ëÑ¾…ñ‘$Éd2)¥K)¦ô§c&##-v¼ìøÈ/±•‚=11®x(ŠRºj“¢¨ììlü‹/;>ê“ÞÑhÁN\0EQ*«PÐO\0‚7•yo,O˜ÊŸ/\Z€?Y|,Ë™3gnÝºõè¨a˜ŽŽìëJ€|öáÃ‡írÓ4=44d±X’R±ôEíÝ»7ÙuH3‚ (mKÐëõ˜OŒ(ŠJ½q–eÑŠZì¸1ƒïÙŒ£i\Z›gfš\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°ôÍª×BJèÇ\0\0\0\0IEND®B`‚'),('1234','Cedula de Ciudadania','GERMAN','GOENAGA','123','german@gmail.com','da91388c72d3e31da19dcd85c97374197748485d','calle 42#31-69','ADMIN','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0H\0\0H\0\0\0½vðd\0\0\0sBITÛáOà\0\0\0_zTXtRaw profile type APP1\0\0™ãJOÍK-ÊLV((ÊOËÌIåR\0c.KK£D04006’F@¶9T(Ñ\0˜˜›¥¡¹Y²™)ˆÏ\0Oºh-ØŒ\0\0ÁIDATxœíÝYl÷áðco{×»Æ8>ƒÀ^;Å1„4€Rq…@\nF…ÚF•šFJß*µ}*}hUU%EEUb\"DIâQÐ8Ø`csClŸk{×öž3»3ó5â<cïbÏîþüý<f~ÿlí—ß1¿ƒÚ»w¯\0ÈB\'»\00ól\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0b“]˜yÒCt: ?(À0ŒN§£’„ZÂlB°É!B,‹F£F£Ñf³Y­Ö¬¬,Š¢rrr~PrxxX’¤±±±`0811Áqœ^¯gYV<\0ÁNo’$	‚Àqœßï¯¬¬t¹\\eee‡Ãd2™L¦ŒŒŠ¢233ð)¿ß/IR ˆD\"‘HÄçóÝ¹sçæÍ›·nÝÊÌÌ4Ã OkvZ’$)‹‰¢h4\Z,X°bÅŠeË–Y­V–eõzý”—£n³Ù¾ÿ/Ë—/Åb~¿¿µµõòåËƒƒƒÇÑ4Í²,žŽ¨½{÷&»Žãt:ÝÒ¥K—.]ZYY™——7ã?âÞ½{W¯^½zõªN§3\Z3þ#`V¡ÅN’$E£QŸÏ÷òË/?ÿüóö±gJ^^^^^^mmíÐÐPccãgŸ}æp8ôz=Zït;=ð<o2™ªªª6oÞüä“OjüÓûúú>ýôÓŽŽŽH$b04þé\0¦¦¦&Ùu\05’$…B¡§Ÿ~úõ×_ß¸qcVV–öuÈÊÊZ¾|yyyùÄÄD?šîÔ‡®xê’ûÞÇíÝ»·¶¶Öjµ&·>EEE---4\Zˆw*C‹¢äyï¥K—þîw¿s¹\\)Ò6,X½zõƒîÝ»GÓ4²š0ÆNE¢(F£Ñ;w®^½:±éh4êõzý~8–›ýïÉ­ÙlÎÌÌt:Óy=ö(ŽãÎ;÷ŸÿüG¯×Ó4&§tÅSN4\Z¥iúÍ7ß¬­­÷³^¯·³³³««kxxx||<ÈÁŽD\"ß—1™Lr°322ìv{NNÎÂ…+++NçôÑh\\·nÓéü×¿þFû×fZìÔÂó|iiéÏþó¢¢¢i~$‰x½Þ›7ož<yòÎ;z½^^:öý:ð‡;Ìòòï“‚F@YYÙÆ].—Óé4™LÓüéõõõ===)2X\0‚B8ŽËÎÎþÃþàp8¦S>‹utt´¶¶¶´´øý~³Ùü8‹½A‡Ã™™™µµµÏ<óLUUËN«CçóùöíÛ7::Šu,©ÁN<Ï¿ùæ›óçÏŸNùöööO?ýtppçyƒÁ0S“X’$ÉÿÃÂÂÂÍ›7»Ýîé|Êãñ¼óÎ;ýýýh·SfÅSÏó‹/þõ¯ýèN¬Guuu9räèÑ£Á`pÆ—sS%7Ô>ŸïüùówïÞu:ÙÙÙêŸ²Z­K–,éëëóx<Ø\"–\nìä!\nýñœ2?±Xìüùóï½÷^oo¯Õj½·MEÑ4m4\ZûûûÛÛÛÍfsaa¡zb-Keeå\'Ÿ|‚yòT€`\'™ ¿ÿýïóóóÕK>xð`ÿþýgÎœÑétšÍB³,‹ÅZ[[{{{ËËËÕÉX,–šššöövyg˜65„I!ØÉ$ÏKÿìg?«®®V/ÖÓÓ³oß>Çc2™4^BQ”^¯¿wïÞÿû_—Ëåp8T*àp8G[[fI.;™B¡Ð/¼°yófõb×¯_ÿç?ÿÉq\\§¦ä¦ûòåË………¹¹¹*%‡‡‡»ºº0‘–DvÒD£ÑÒÒÒ·ß~[¥eE±¡¡áÀÃ$}RŠ¦éh4zæÌ½^¿hÑ\"•j»Ýî7nx½Þ¤×yÎÂ@(9DQ4›Í;vìPï¯655}øá‡6›-E†¬4MÛl¶?ü°©©I¥EQ;vì0›Í¢(jV7xZìäˆD\"ë×¯ñÅUÊ\\¹råý÷ß—\'¨5«Ø”(Šb¦³³3??ÿ‰\'žP*–““‡oÞ¼‰Õ¦I‘Bß˜¹CE§Ó¹iÓ&•2}}}ûöíKÍéeš¦9ŽÛ·o___ŸJ±M›69N4ÚI‘r_š¹`||¼®®Îl6+ðz½ï¾û®ÝnOÁTËhš¶Ûíï¾û®×ëU*c6›ëêêÆÇÇµ¬ÈRô{C°X,VUU¥²T“çù“\'OöööNs©v²°,ÛÛÛ{òäIžç•Ê¸ÝîªªªX,¦eÅ@‡`kL’$Q7nÜh±X”Ê´¶¶ž:u*-6TÆS§Nµ¶¶*°X,7nEQÞRšA°5%Â¢E‹***”\núúz‹Å’«;(Š²X,õõõ@@©LEEÅ¢E‹½ff‚­)ŽãjjjTŽ\r>yòd8NÙ¡õ£hš‡Ã\'OžT*™™év»>Â46_ 2ƒÁçŸ^éiOOOccãô9H&“©±±±§§G©ÀsÏ=\n…´¬ ØÚ‰Åbn·[it-B[[Ûøøx\Z5×2š¦ÇÇÇÛÚÚ”úÛ6›íé§ŸÆš–Òì;”ÖB¡P]]ÒÓ‘‘‘†††´˜3{”ÑhlhhQ*PWW‡F[K¶FDQÌËËSÙ>ÑÜÜ,IRZÌ™=Š¢(I’š››•\näæææååa±ŠflD£Q—Ë¥ò–ëôéÓi7º~˜Éd:}ú´ÒS‹Åâr¹¢Ñ¨–UšËlˆ¢XUU¥Ý7nƒÁ4m®eEƒÁ7nLúT¾x-¶fl-H’d³ÙT®ÝêêêÒýÿC‚ÓŽ\\yù™TVV–ÍfÃJm ØZw}(~411ÑÓÓCÀÖe†azzz&&&&}šŸŸŸF[¶ä`ÛíöIŸz½Þþþ~2‚Ýßß¯´-Än·Ûív[¶DQT¹ ‰ŒŒŒ¤ÝëëGÑ4=22òðuB?àp8lm¤ý—)-Äb1¥~¸$I·oß& Õ2š¦oß¾­4.,,Ä2mò}Jq‚ (]y\'ÂððpŠïÐœ>–e‡‡‡•– 9NìÑ‚­A”ºâ¢(0À–1388¨Ôßv8¶6l-‚ tÔ¾$I>Ÿ/­_t=Œ¢(ŸÏ§Ô·Z­¶6l-ð<¯´˜T’¤ÑÑQ’‚=::ªìÜÜ\\•ãV`!Ø\ZQú®K’ä÷ûI\n¶ßïWùe5®Ïœ…`Á ‚­•Î61ïºd*¿1#ŽÔ‡`keY¿ß?é#š¦\n\nˆY%ŠbAAÒz¿ßOØ¿b)ÁÖË²*§‹˜L&bf•$IRÙU>22‚`kÁÖÃ0Á`PéQII	1owA())QZo‰YŠ“âl-°,ëñx&}DÓô¼yóHêŠÏ›7O©+îñxÐbkÁÖÃ0J]qš¦ËËË‰9v›ã¸òòr¥`ŒŒ ÅÖ‚­š¦•ZlNg·ÛN\'ÃlI’T¶ëtº¡¡![¶hšöù|J•m6[~~>ÃlAòóóm6Û¤O#‘HºŸë–Fl-ÈÁ¾wïÞ¤OçÍ›W\\\\LF°‹‹‹çÍ›7éÓ{÷îy½^bvž§8ü•µ@Ó´×ëUéWVVjYŸÙ£ò‹x<[3ø+kDÅû÷ï+Í~Ë—H§õ0[’$ùêïIŸ\n‚ ²Of‚­ƒÁÐÖÖ¦´þÌb±¬Y³&­·4ò<¿fÍ\Z¥Àµk×ƒÆµš³l0ÓÕÕ¥t‚§N§[»vmú6Úrs½víZ¥^¯·»»SâšA°µ£×ë›šš”žæåå¹Ýî4½\'\ZºÝî¼¼<¥MMMXš¢%[;F£ñØ±cJOM&Ó†\rX–M»F[’$–e7lØ ²JüØ±ciz‘hšB°µCQ”Ùl¾té’RòòòeË–¥]£F—-[V^^®TàÒ¥Kf³o°µ„`kÊd2µµµ)M†õë×¥Q£-IÒØØØúõë•&ÆDQlkkKë‹DÓ‚­)½^ßÖÖÖÑÑ¡T ¤¤dÏž=*—i¤šH$²gÏž’’¥mmmz½^ËZ‚­)Š¢8Ž»xñ¢J{íÚµ.—+-¶…pçr¹T&Ã£ÑèÅ‹9ŽC?\\c¶ÖL&Ó—_~Ùßß¯TÀn·oß¾Ýf³¥ørQm6ÛöíÛUv}ô÷÷ùå—è‡kÁN«ÕZ__¯’Ûòòò]»v”lK’víÚ¥2g&Šb}}½ÒM	0«ì$`Y¶¿¿¿¥¥E¥Ì³Ï>»eË•3º“H>}Ë–-Ï>û¬J±–––þþ~¼¾N\n¦¦¦&Ùu˜‹(Š\Z¨¬¬TÚä¨Óé***X–½qãË²©3F•$)‰lÛ¶íÕW_UÙÑ144ôþûïG\"ìúH\nüÑ“C¾¼îÔ©S*eX–]·nÝÊ•+C¡f›R(Z¹råºuëÔ›âS§N‘tÙ`ÚA‹4z½þÛo¿-(((,,T*c0*++%Ijoo7™LÉm·åWÖ¯¼òJ]]]FF†JÉæææ£GbtDv2±,ÛÞÞ^YY™­TÆ`0TUUåää´µµQ•¬ž­ Ñhô—¿üå¦M›Ô‡vuuíß¿_¯×§ÎðaB°“‰¢¨X,vÿþýêêj³Ù¬R¬¤¤$??ÿÛo¿MÊ™û‘H$++ë7ÞxþùçÕãêóù:4::Š9³äB°“L>À´»»ûG?ú‘zÉ‚‚‚%K–Ð4­MÓ-B$Yºté¯~õ«ŠŠŠ)Ëÿõ¯½sçÖ™%‚|ÃÜ½{wll¬ººZ}¶)33ó¹çž³ÙlÃÃÃ^¯—a˜ÙëîJ’Äq\\~~þÖ­[wïÞ™™©^žçùúúú––•®hÁN	z½¾··7‰¸\\®)›âÒÒÒ%K–ÈËÎu:ÝŒÇ[ÅH$¶nÝºsçÎ§žzjÊÄb±cÇŽ;w.é3| C°S‚<+ÖÕÕuïÞ½åË—OYÞjµº\\®5kÖÈ=ùP(‹Å3á’$ñ</I’ÝnñÅßzë­ÚÚÚiÎl8pàë¯¿6HuŠ@°SEQ,ËvwwOLL”——Oy,EQV«õ©§žª©©),,´Z­<“‡ßÓ˜$IÑh4X­Ö+V¼ôÒK?ùÉOV¬XaµZ§ó?ñûýGŽ9wîœÅbAªSµwïÞd×þŸH$âv»wïÞ­t@·Ò§FGGÚÛÛ›››ÇÇÇM&Ë²r3þp÷^EI’AˆÅb‘HÄn·?ûì³n·»¨¨(;;;®\r###‡–ß±ÇñÂìC°SÏóV«õ7¿ùÍt&¢\'566600ðàÁŸÏÇÇÇåæTîi[­V‡Ã‘››[TT”•••Ø¸uëÖþýûƒÁ ÎMAvŠ’ÇÌÛ¶m{ñÅS­=ŒD\"çÏŸÿè£AÀûêÔ„1vŠ¢iZ^Iz÷îÝ¨/áÔÒýû÷:túôi†a°<e!Ø©‹¢(½^?44tüøqQóóó“ø2I’$ŸÏwüøñ¿üå/>Ÿ¯µRvw¥4I’(Šb¦©©é»ï¾KîÞìáááÁÁA‹Å‹ÅRütÀ;E‰¢FY–]¼xñ+¯¼òä“O\ZÆ¤7’<Ïûýþ³gÏž;w.Ò41vjB°SŽ$I¡Phþüù«W¯^²dÉ‚’]£I+W®466Þ¸qÃd2a°jìòýÚ¯-[¶,_¾\\eŸvŠ»uëÖG}444d±XïÔ`§\nžçM&SeeåîÝ»Ng²«Ÿ\'Nœ?Þãñ`UiŠ@°“O>™dÕªU6lX´hÑãÿ\'&&Âá0ÏóápXÞ¤õƒòpÝ`0˜L&³Ùœ™™ùø›@GGG¿þúë††ymìcþßà1!ØIÆqœ ¯¿þúªU«ç,!ÇÓÛÛ{÷îÝñññááa¿ß‡\'&&DQœ˜˜øAa›ÍFÓ´Åb±Z­6›Íáp8ÎÜÜÜâââÂÂÂ„›\\Qoß¾ýþûï÷÷÷Os©9Ì;iDQä8î™gžÙ±cÇO<ïÇÃáp0¼sçÎ…:::äó@)Š’_Qÿ£Óé\r˜üÚLúQåä’$Ñ4½xñâÚÚZ—Ëe·Û-K¼¹ \'Nœ8uêÇq8q!Yìä¢¨W_}uõêÕ‹%®Ïöõõõ÷÷_¿~½©©)‹™Íf¹ë;#-¤¼?„ã8Q«««—.]ZZZZ^^oD¯_¿þá‡öõõáöÜ¤@°“€çy–eß~ûm—ËW\Z;::\Z»ºº<Ã0³z` œpžç322.\\èv»W¬X×¿AÿøÇ?:;;±£S{¶Ö8Ž[²dÉîÝ»çÏŸ?Íø|¾k×®;vÌãñddd°,«åY¥’$Åb1Žã8ŽÛ¶mÛªU«\n\n\n¦ÿfëøñã\'Nœø~\\\0ÚÀZqíH’4>>¾víÚ={öLó…V8þæ›oŽ9ræÌyºkVÏ9›”<h7f³¹³³S¾=Óf³©ÜÅ÷°²²²¢¢¢Ï?ÿÜl6#ÛšA°5\"¿vÚ´iÓž={¦3ìE±¹¹ùðáÃ_}õU0L…Mò¦QoÞ¼yåÊ•±±±L¹›a˜üüü²²²ÎÎNÜø£[òxuçÎ[¶l™N>ß{ï½£GF\"ƒÁRaãÍóüÍ›7/\\¸àp8²³³§œZ+((¨¨¨¸~ýz(J©_‡Tö¬“$iddäµ×^ûñ<¡é\'Ÿ|òÁôôôÌÈº‘Y\"¯oáyþâÅ‹§¨¨hÊó‰ÇÂ…åÜ)û{Áž]r[½k×®—_~yÊoóÐÐÐÁƒ¿úê«X,–o€išff``àÒ¥KÙÙÙùùùêý‡Ãáv»oÜ¸‡‘íY…`Ï\"y>yûöíë×¯Ÿò{ÜÒÒòÎ;ïšÍæ4úÒËHyžollÔétÅÅÅê£n‡ÃQZZzáÂy«¹VÕœsìYkjjvíÚ5eüìÙ³E1-\ZêGÑ4m0®]»6::ºhÑ\"õCÚœNçüùóÏœ9ƒyòÙƒ`Ïžçkkkßzë-õæ78pàã?¶Z­iÔP?Juœ8qÂív;•Â………N§óêÕ«qÓ‡`ÏŠX,V\\\\ü‹_üBýBŸÏwôèÑ.Øl62¾ß,ËRÕÞÞ^VV¦r7°N§+((ÝÝÝØ\n6Ò¸‰HYò+ë×^{M}m™×ëý÷¿ÿýÍ7ß¤Î	¤3‚eY¿ßÿ÷¿ÿýêÕ«*ÅŒFãŽ;ìv{,Ó¬nsZì&IR8~ã7žyæ•b^¯÷OúS___ª>#hšŽÅbŸ}öYuuunn®R1½^_]]ÝÔÔ$o‰Ñ²†ÄC‹=Ã8Ž[»v­úe×ápøÐ¡C^¯—ÈTËhšÎÉÉ9tèP¿J±¢¢¢mÛ¶E£ÑäÀJ{&	‚PPP°nÝ:•qc(:räÈµk×NµŒaŸÏ÷·¿ýíþýû*Å^xá…åË—ó<¯YÅæ{&ºººüü|•2Ÿ~úé_|1Gî»bYv||üÏþs(R*c0¶mÛ&\Zí„`ÏŽãª««Ýn·J™–––>ø á{ðÒ‘^¯ihhPÉmnnîŽ;=Â	†É³™!‚Ýnÿío«rnYggçÁƒçà9žz½¾££Ãét–””(•ÉÏÏ\Z\Z’Ð²n¤B‹=3AX¿~½ÊÖüñÜÜÛDQ”Ùl>räHWW—R™ÌÌÌ—^z‰atÈgÄœû’ÍArrrV®\\©Ò744tvvÎ‘¡õ£hšáÈ‘#*¹u»Ý¥¥¥x­=#ì7oÞl³Ù”\n\\¾|ùÔ©Sf³YËZ¥\Z½^ßÝÝ}üøq¥EíØ±#hY+R!ØKE§Ó¹|ùr¥gÏžM…+õ’Îh4655\r*(++«©©‰F£ZÖŠHöã\nƒ?ýéOUN;ºtéÒÕ«WÓtÛÖÌbÆãñ|ñÅ*·ðnÝº¯¾‚ýXb±XUUUuuµRÑÑÑúúú9Þ	˜Ñhüä“Onß¾­T ¨¨hÅŠh´‚ýXAxúé§U¶(~þùçØ™øÙÙÙŸ}ö™ÒS‹Å²dÉŠ¢Ðh?;q’$Y,–¥K—*¼xñ\"®Âø–e»ººTö~ÕÖÖfee!ØÁN\\,+//WºÅZÅ‹/ŽÏÁ×ê(Šây¾¹¹9‰LZÀh4ÖÖÖbõøãÀw.q~¿ÝºuJOGGG/\\¸0g_\\«3­­­G©ÀªU«ÆÇÇµ¬aì‰¢XTTTVV¦T ¥¥åÁƒh®\'%7ÚgÏžU*ðÄO¬\\¹‹U†¯]‚8Ž{á…T\Zä“\'Ob2\\…ÑhlhhPê†eË–)=…)!Ø‰ï‘^¸p¡Rƒ|ëÖ­û÷ï£¹VAQ”ÑhlmmU*P\\\\œ‘‘)´Äà›—QËÊÊTn«?þü”7c€Édºté’ÒÓ¼¼¼…\n‚ e•ˆ`\'B>„Ti/—Ïç»{÷.¶N‰a˜¡¡¡¾¾¾IŸÚl¶¼¼<;1v\"$I*((PzÚÛÛ;44„~ø”hšöz½*sã%%%*‹OA¾|‰E±¼¼|ÒG‚ Ü¹s‡çy¬6›Q¿ýö[¥WÖr°1ÌN\0‚7ùF®Lú4\nuwwcËÇ4éõú®®.¥Ùï¼¼<‹Å‚`\'\0ÁŽ› .—Kéi$¹uëØÓDÓtWWW8V*€ù³Ä Øq‹F£UUUJO¿ûî;ŽãÐŸ&ùÕÙÙ©T`Ñ¢EX¦’\0;n‚ ¨œmvóæMìúˆ‹Á`P	vAA¶p&\0ÁŽÏó*°;::pË\\\\X–íîîVzZZZŠ‰ñ Øñ‘$);;[¥§=00€]q¡iú»ï¾Sy:oÞ<d;^ø\nÆGÅììl¥¹1ŸÏ\'IØñ2£££“>b&\'\'ãñB°ã#Šâ¼yó”:Û÷ïßG?<ò4¥G‡-v¼ìøÈg’*¥wllÍu(ŠRºÜ‹eÙììl;^v|$I2›ÍJ£è±±1°@Ó´ÏçSz¤×ëÑ¾…ñ‘$Éd2)¥K)¦ô§c&##-v¼ìøÈ/±•‚=11®x(ŠRºj“¢¨ììlü‹/;>ê“ÞÑhÁN\0EQ*«PÐO\0‚7•yo,O˜ÊŸ/\Z€?Y|,Ë™3gnÝºõè¨a˜ŽŽìëJ€|öáÃ‡írÓ4=44d±X’R±ôEíÝ»7ÙuH3‚ (mKÐëõ˜OŒ(ŠJ½q–eÑŠZì¸1ƒïÙŒ£i\Z›gfš\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°ôÍª×BJèÇ\0\0\0\0IEND®B`‚');

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
  CONSTRAINT `llamado_de_atencion_ibfk_1` FOREIGN KEY (`Fk_apren`) REFERENCES `aprendiz` (`Id_Apre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `llamado_de_atencion` */

LOCK TABLES `llamado_de_atencion` WRITE;

UNLOCK TABLES;

/*Table structure for table `prog_comp` */

DROP TABLE IF EXISTS `prog_comp`;

CREATE TABLE `prog_comp` (
  `cod_Pro` int(10) NOT NULL,
  `comp_Cod` int(20) NOT NULL,
  KEY `codigoComp` (`comp_Cod`),
  KEY `codigoProg` (`cod_Pro`),
  CONSTRAINT `prog_comp_ibfk_1` FOREIGN KEY (`cod_Pro`) REFERENCES `programas` (`Cod_Pro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `prog_comp` */

LOCK TABLES `prog_comp` WRITE;

UNLOCK TABLES;

/*Table structure for table `programas` */

DROP TABLE IF EXISTS `programas`;

CREATE TABLE `programas` (
  `Cod_Pro` int(40) NOT NULL,
  `Pro_Desc` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Cod_Pro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `programas` */

LOCK TABLES `programas` WRITE;

insert  into `programas`(`Cod_Pro`,`Pro_Desc`) values (1,'ANALISIS Y DESARROLLO DE SISTEMAS DE INFORMACIÃ“N'),(2,'ANALISIS Y DESARROLLO DE SOFTWARE'),(4,'GESTION'),(5,'AVIACION'),(190,'SI');

UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
