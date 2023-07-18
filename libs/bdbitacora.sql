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
  CONSTRAINT `FK_ACTAS_APRENDIZ` FOREIGN KEY (`actaIdAprendiz`) REFERENCES `aprendiz` (`Id_Apre`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_ACTAS_FICHA` FOREIGN KEY (`actaFicha`) REFERENCES `ficha` (`Cod_Ficha`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_ACTAS_FUNCIONARIOS` FOREIGN KEY (`actaFuncionario`) REFERENCES `funcionario` (`ID_Func`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `acta_compromiso` */

insert  into `acta_compromiso`(`codActa`,`actaFecha`,`actaIdAprendiz`,`actaFicha`,`actaFuncionario`,`actaMotivoRemision`,`actaDescargoAprendiz`,`actaCompromisos`,`actaRecomendaciones`) values (12,'2023-07-17','123',1234,'1129506976','Bajo rendimiento acadÃ©mico','Yo, Kenner Romero, reconozco y asumo la responsabilidad de mi bajo rendimiento acadÃ©mico. Me comprometo a tomar las medidas necesarias para mejorar mi desempeÃ±o. Entiendo la importancia de cumplir con mis responsabilidades acadÃ©micas, establecer un horario de estudio estructurado y buscar el apoyo necesario para superar los desafÃ­os que enfrento.','Como parte de mi compromiso para mejorar mi rendimiento acadÃ©mico, me comprometo a cumplir con las siguientes acciones: establecer metas claras y realistas, participar activamente en todas las actividades acadÃ©micas, buscar apoyo adicional cuando sea necesario, mantener un horario de estudio disciplinado y utilizar los recursos educativos disponibles para maximizar mi aprendizaje.','Se sugiere al aprendiz que busque tutorÃ­as o asesoramiento acadÃ©mico para obtener orientaciÃ³n adicional en Ã¡reas especÃ­ficas de dificultad. AdemÃ¡s, se le anima a establecer una comunicaciÃ³n abierta con sus profesores para aclarar dudas y recibir retroalimentaciÃ³n constructiva. El aprendiz tambiÃ©n puede beneficiarse de la participaciÃ³n en grupos de estudio o la creaciÃ³n de redes de apoyo con otros compaÃ±eros de clase para fomentar un ambiente de aprendizaje colaborativo.');

/*Table structure for table `apre_ficha` */

DROP TABLE IF EXISTS `apre_ficha`;

CREATE TABLE `apre_ficha` (
  `Cod_Ficha` int(40) NOT NULL,
  `Id_Apre` varchar(30) NOT NULL,
  `ApreRol` varchar(10) NOT NULL,
  KEY `Id_Apre` (`Id_Apre`),
  KEY `Cod_Ficha` (`Cod_Ficha`),
  CONSTRAINT `apre_ficha_ibfk_1` FOREIGN KEY (`Id_Apre`) REFERENCES `aprendiz` (`Id_Apre`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `apre_ficha_ibfk_2` FOREIGN KEY (`Cod_Ficha`) REFERENCES `ficha` (`Cod_Ficha`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `apre_ficha` */

insert  into `apre_ficha`(`Cod_Ficha`,`Id_Apre`,`ApreRol`) values (1234,'123','APRENDIZ'),(1234,'456','APRENDIZ'),(1234,'789','APRENDIZ'),(1234,'1011','LÃDER');

/*Table structure for table `aprendiz` */

DROP TABLE IF EXISTS `aprendiz`;

CREATE TABLE `aprendiz` (
  `Id_Apre` varchar(50) NOT NULL,
  `Apre_Nom` varchar(30) DEFAULT NULL,
  `Apre_Ape` varchar(30) DEFAULT NULL,
  `Apre_Tel` varchar(50) DEFAULT NULL,
  `Apre_Correo` varchar(50) DEFAULT NULL,
  `Apre_Sexo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id_Apre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `aprendiz` */

insert  into `aprendiz`(`Id_Apre`,`Apre_Nom`,`Apre_Ape`,`Apre_Tel`,`Apre_Correo`,`Apre_Sexo`) values ('1011','Camilo','PÃ©rez Cabarcas','321456789','camiloperez@gmail.com','MASCULINO'),('123','Kenner ','Romero Balza','312345678','kenerromero@gmail.com','MASCULINO'),('456','MarÃ­a JosÃ©','LÃ³pez Ãvila','321679854','marialopez@gmail.com','FEMENINO'),('789','Hillary','Mercado Defort','312567987','hillarymd@gmail.com','FEMENINO');

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

insert  into `ficha`(`Cod_Ficha`,`Desc_Fich`,`Cod_ProFK`,`fechaIni_Fich`,`fechaFin_Fich`) values (1234,'Ficha 1 ADSI',101,'2023-07-17','2023-09-23');

/*Table structure for table `ficha_funcionario` */

DROP TABLE IF EXISTS `ficha_funcionario`;

CREATE TABLE `ficha_funcionario` (
  `cod_ficha` int(30) DEFAULT NULL,
  `id_funcionario` varchar(50) DEFAULT NULL,
  KEY `fucnionarioId` (`id_funcionario`),
  KEY `fichaCod` (`cod_ficha`),
  CONSTRAINT `fichaCod` FOREIGN KEY (`cod_ficha`) REFERENCES `ficha` (`Cod_Ficha`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fucnionarioId` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionario` (`ID_Func`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ficha_funcionario` */

insert  into `ficha_funcionario`(`cod_ficha`,`id_funcionario`) values (1234,'1129506976'),(1234,'5640'),(1234,'1001946423');

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

insert  into `funcionario`(`ID_Func`,`Fun_Tip_Doc`,`Fun_Nom`,`Fun_Ape`,`Fun_Tel`,`Fun_Correo`,`Fun_Pswd`,`Fun_Direcc`,`Fun_Rol`,`Fun_Img`) values ('1001946423','CC','BRAYAN','LÃ“PEZ','3022974095','brayanlpz1525@gmail.com','b761d6d20bfb9ab4adf9e9ab7cc5a4de1c4fae34','Calle 46b #16-107','ADMIN','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0H\0\0H\0\0\0½vğd\0\0\0sBITÛáOà\0\0\0_zTXtRaw profile type APP1\0\0™ãJOÍK-ÊLV((ÊOËÌIåR\0c.KK£D04006’F@¶9T(Ñ\0˜˜›¥¡¹Y²™)ˆÏ\0Oºh-ØŒ\0\0ÁIDATxœíİYl÷áğco{×»Æ8>ƒÀ^;Å1„4€Rq…@\nF…ÚF•šFJß*µ}*}hUU%EEUb\"DIâQĞ8Ø`csClŸk{×ö3»3ó5â<cïbÏîşüı<f~ÿlí—ß1¿ƒÚ»w¯\0ÈB\'»\00ól\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0b“]˜yÒCt: ?(À0ŒN§£’„ZÂlB°É!B,‹F£F£Ñf³Y­Ö¬¬,Š¢rrr~PrxxX’¤±±±`0811Áqœ^¯gYV<\0ÁNo’$	‚Àqœßï¯¬¬t¹\\eee‡Ãd2™L¦ŒŒŠ¢233ğ)¿ß/IR ˆD\"‘HÄçóİ¹sçæÍ›·nİÊÌÌ4Ã OkvZ’$)‹‰¢h4\Z,X°bÅŠeË–Y­V–eõzı”—£n³Ù¾ÿ/Ë—/Åb~¿¿µµõòåËƒƒƒÇÑ4Í²,¨½{÷&»ãt:İÒ¥K—.]ZYY™——7ã?âŞ½{W¯^½zõªN§3\Z3ş#`V¡ÅN’$E£QŸÏ÷òË/?ÿüóö±gJ^^^^^^mmíĞĞPccãgŸ}æp8ôz=Zït;=ğ<o2™ªªª6oŞüä“OjüÓûúú>ıôÓH$b04şé\0¦¦¦&Ùu\05’$…B¡§Ÿ~úõ×_ß¸qcVV–öuÈÊÊZ¾|yyyùÄÄD?šîÔ‡®xê’ûŞÇíİ»·¶¶Öjµ&·>EEE---4\Zˆw*C‹¢äyï¥K—şîw¿s¹\\)Ò6,X½zõƒîİ»GÓ4²š0ÆNE¢(F£Ñ;w®^½:±éh4êõzı~8–›ıïÉ­ÙlÎÌÌt:Óy=ö(ãÎ;÷ŸÿüG¯×Ó4&§tÅSN4\Z¥iúÍ7ß¬­­÷³^¯·³³³««kxxx||<ÈÁD\"ß—1™Lr°322ìv{NNÎÂ…+++NçôÑh\\·nÓéü×¿şFû×fZìÔÂó|iiéÏşó¢¢¢i~$‰x½Ş›7o<yòÎ;z½^^:öı:ğ‡;Ìòòï“‚F@YYÙÆ].—Óé4™LÓüéõõõ===)2X\0‚B8ËÎÎşÃşàp8¦S>‹utt´¶¶¶´´øı~³Ùü8‹½A‡Ã™™™µµµÏ<óLUUËN«CçóùöíÛ7::Šu,©ÁN<Ï¿ùæ›óçÏŸNùöööO?ıtppçyƒÁ0S“X’$ÉÿÃÂÂÂÍ›7»İîé|Êãñ¼óÎ;ıııh·SfÅSÏó‹/şõ¯ıèN¬Guuu9räèÑ£Á`pÆ—sS%7Ô>ŸïüùówïŞu:ÙÙÙêŸ²Z­K–,éëëóx<Ø\"–\nìä!\nıñœ2?±Xìüùóï½÷^oo¯Õj½·MEÑ4m4\ZûûûÛÛÛÍfsaa¡zb-Keeå\'Ÿ|‚yòT€`\'™ ¿ÿıïóóóÕK>xğ`ÿşıgÎœÑétšÍB³,‹ÅZ[[{{{ËËËÕÉX,–šššöövyg˜65„I!ØÉ$ÏKÿìg?«®®V/ÖÓÓ³oß>Çc2™4^BQ”^¯¿wïŞÿû_—Ëåp8T*àp8G[[fI.;™B¡Ğ/¼°yófõb×¯_ÿç?ÿÉq\\§¦ä¦ûòåË………¹¹¹*%‡‡‡»ºº0‘–DvÒD£ÑÒÒÒ·ß~[¥eE±¡¡áÀÃ$}RŠ¦éh4zæÌ½^¿hÑ\"•j»İî7nx½Ş¤×yÎÂ@(9DQ4›Í;vìPï¯655}øá‡6›-E†¬4MÛl¶?ü°©©I¥EQ;vì0›Í¢(jV7xZìäˆD\"ë×¯ñÅUÊ\\¹råı÷ß—\'¨5«Ø”(Šb¦³³3??ÿ‰\'P*–““‡oŞ¼‰Õ¦I‘Bß˜¹CE§Ó¹iÓ&•2}}}ûöíKÍéeš¦9Û·o___ŸJ±M›69N4ÚI‘r_š¹`||¼®®Îl6+ğz½ï¾û®İnOÁTËhš¶Ûíï¾û®×ëU*c6›ëêêÆÇÇµ¬ÈRô{C°X,VUU¥²T“çù“\'OöööNs©v²°,ÛÛÛ{òäIç•Ê¸İîªªªX,¦eÅ@‡`kL’$Q7nÜh±X”Ê´¶¶:u*-6TÆS§Nµ¶¶*°X,7nEQŞRšA°5%Â¢E‹***”\núúz‹Å’«;(Š²X,õõõ@@©LEEÅ¢E‹½ff‚­)ãjjjT\r>yòd8NÙ¡õ£hš‡Ã\'OT*™™év»>Â46_ 2ƒÁçŸ^éiOOOccãô9H&“©±±±§§G©ÀsÏ=\n…´¬ ØÚ‰Åbn·[it-B[[Ûøøx\Z5×2š¦ÇÇÇÛÚÚ”úÛ6›íé§ŸÆš–Òì;”ÖB¡P]]ÒÓ‘‘‘†††´˜3{”ÑhlhhQ*PWW‡F[K¶FDQÌËËSÙ>ÑÜÜ,IRZÌ™=Š¢(I’š››•\näæææååa±ŠflD£Q—Ë¥ò–ëôéÓi7º~˜Éd:}ú´ÒS‹Åâr¹¢Ñ¨–UšËlˆ¢XUU¥İ7nƒÁ4m®eEƒÁ7nLúT¾x-¶fl-H’d³ÙT®İêêêÒıÿC‚Ó\\yù™TVV–ÍfÃJm ØZw}(~411ÑÓÓCÀÖe†azzz&&&&}šŸŸŸF[¶ä`ÛíöIŸz½Şşş~2‚İßß¯´-Än·Ûív[¶DQT¹ ‰ŒŒŒ¤İëëGÑ4=22òğuB?àp8lm¤ı—)-Äb1¥~¸$I·oß& Õ2š¦oß¾­4.,,Ä2mò}Jq‚ (]y\'ÂğğpŠïĞœ>–e‡‡‡•– 9NìÑ‚­A”ºâ¢(0À–1388¨Ôßv8¶6l-‚ tÔ¾$I>Ÿ/­_t=Œ¢(ŸÏ§Ô·Z­¶6l-ğ<¯´˜T’¤ÑÑQ’‚=::ªìÜÜ\\•ãV`!Ø\ZQú®K’ä÷ûI\n¶ßïWùe5®Ïœ…`Á ‚­•Î61ïºd*¿1#Ô‡`keY¿ß?é#š¦\n\nˆY%ŠbAAÒz¿ßOØ¿b)ÁÖË²*§‹˜L&bf•$IRÙU>22‚`kÁÖÃ0Á`PéQII	1owA())QZo‰YŠ“âl-°,ëñx&}DÓô¼yóHêŠÏ›7O©+îñxĞbkÁÖÃ0J]qš¦ËËË‰9v›ã¸òòr¥`ŒŒ ÅÖ‚­š¦•ZlNg·ÛN\'ÃlI’T¶ëtº¡¡![¶hšöù|J•m6[~~>ÃlAòóóm6Û¤O#‘HºŸë–Fl-ÈÁ¾wïŞ¤OçÍ›W\\\\LF°‹‹‹çÍ›7éÓ{÷îy½^bv§8ü•µ@Ó´×ëUéWVVjYŸÙ£ò‹x<[3ø+kDÅû÷ï+Í~Ë—H§õ0[’$ùêïIŸ\n‚ ²Of‚­ƒÁĞÖÖ¦´şÌb±¬Y³&­·4ò<¿fÍ\Z¥Àµk×ƒÆµš³l0ÓÕÕ¥t‚§N§[»vmú6Úrs½víZ¥^¯·»»SâšA°µ£×ë›šš”æåå¹İî4½\'\Zºİî¼¼<¥MMMXš¢%[;F£ñØ±cJOM&Ó†\rX–M»F[’$–e7lØ ²JüØ±ciz‘hšB°µCQ”Ùl¾té’RòòòeË–¥]£F—-[V^^®TàÒ¥Kf³o°µ„`kÊd2µµµ)M†õë×¥Q£-IÒØØØúõë•&ÆDQlkkKë‹DÓ‚­)½^ßÖÖÖÑÑ¡T ¤¤dÏ=*—i¤šH$²gÏ’’¥mmmz½^ËZ‚­)Š¢8»xñ¢J{íÚµ.—+-¶…pçr¹T&Ã£ÑèÅ‹9C?\\c¶ÖL&Ó—_~Ùßß¯TÀn·oß¾İf³¥ørQm6ÛöíÛUv}ô÷÷ùå—è‡kÁN«ÕZ__¯’Ûòòò]»v”lK’víÚ¥2g&Šb}}½ÒM	0«ì$`Y¶¿¿¿¥¥E¥Ì³Ï>»eË•3º“H>}Ë–-Ï>û¬J±–––şş~¼¾N\n¦¦¦&Ùu˜‹(Š\Z¨¬¬TÚä¨Óé***X–½qãË²©3F•$)‰lÛ¶íÕW_UÙÑ144ôşûïG\"ìúH\nüÑ“C¾¼îÔ©S*eX–]·nİÊ•+C¡f›R(Z¹råºuëÔ›âS§N‘tÙ`ÚA‹4z½şÛo¿-(((,,T*c0*++%Ijoo7™LÉm·åWÖ¯¼òJ]]]FF†JÉæææ£GbtDv2±,ÛŞŞ^YY™­TÆ`0TUUåää´µµQ•¬­ Ñhô—¿üå¦M›Ô‡vuuíß¿_¯×§ÎğaB°“‰¢¨X,vÿşıêêj³Ù¬R¬¤¤$??ÿÛo¿MÊ™û‘H$++ë7ŞxşùçÕãêóù:4::Š9³äB°“L>À´»»ûG?ú‘zÉ‚‚‚%K–Ğ4­MÓ-B$Yºté¯~õ«ŠŠŠ)Ëÿõ¯½sçÖ™%‚|ÃÜ½{wll¬ººZ}¶)33ó¹ç³ÙlÃÃÃ^¯—a˜ÙëîJ’Äq\\~~şÖ­[wïŞ™™©^çùúúú––•®hÁN	z½¾··7‰¸\\®)›âÒÒÒ%K–ÈËÎu:İŒÇ[ÅH$¶nİºsçÎ§zjÊÄb±cÇ;w.é3| C°S‚<+ÖÕÕuïŞ½åË—OYŞjµº\\®5kÖÈ=ùP(‹Å3á’$ñ</I’İnñÅßzë­ÚÚÚiÎl8pàë¯¿6HuŠ@°SEQ,ËvwwOLL”——Oy,EQV«õ©§ª©©),,´Z­<“‡ßÓ˜$IÑh4X­Ö+V¼ôÒK?ùÉOV¬XaµZ§ó?ñûıG9wîœÅbAªSµwïŞd×şŸH$âv»wïŞ­t@·Ò§FGGÚÛÛ›››ÇÇÇM&Ë²r3şp÷^EI’AˆÅb‘HÄn·?ûì³n·»¨¨(;;;®\r###‡–ß±ÇñÂìC°SÏóV«õ7¿ùÍt&¢\'566600ğàÁŸÏÇÇÇåæTîi[­V‡Ã‘››[TT”•••Ø¸uëÖşıûƒÁ ÎMAvŠ’ÇÌÛ¶m{ñÅS­=ŒD\"çÏŸÿè£AÀûêÔ„1vŠ¢iZ^Iz÷îİ¨/áÔÒıû÷:túôi†a°<e!Ø©‹¢(½^?44tüøqQóóó“ø2I’$ŸÏwüøñ¿üå/>Ÿ¯µRvw¥4I’(Šb¦©©é»ï¾KîŞìáááÁÁA‹Å‹ÅRütÀ;E‰¢FY–]¼xñ+¯¼òä“O\ZÆ¤7’<Ïûış³gÏ;w.Ò41vjB°S$I¡Phşüù«W¯^²dÉ‚’]£I+W®466Ş¸qÃd2a°jìòıÚ¯-[¶,_¾\\eŸvŠ»uëÖG}444d±XïÔ`§\nçM&Seeåîİ»Ng²«Ÿ\'Nœ?Şãñ`UiŠ@°“O>™dÕªU6lX´hÑãÿ\'&&Âá0ÏóápXŞ¤õƒòpİ`0˜L&³Ùœ™™ùø›@GGG¿şúë††ymìcşßà1!ØIÆqœ ¯¿şúªU«ç,!ÇÓÛÛ{÷îİñññááa¿ß‡\'&&DQœ˜˜øAa›ÍFÓ´Åb±Z­6›Íáp8ÎÜÜÜâââÂÂÂ„›\\Qoß¾ışûï÷÷÷Os©9Ì;iDQä8î™gÙ±cÇO<ïÇÃáp0¼sçÎ…:::äó@)Š’_Qÿ£Óé\r˜üÚLúQåä’$Ñ4½xñâÚÚZ—Ëe·Û-K¼¹ \'Nœ8uêÇq8q!Yìä¢¨W_}uõêÕ‹%®Ïöõõõ÷÷_¿~½©©)‹™Íf¹ë;#-¤¼?„ã8Q«««—.]ZZZZ^^oD¯_¿şá‡öõõáöÜ¤@°“€çy–eß~ûm—ËW\Z;::\Z»ºº<Ã0³z` œpç322.\\èv»W¬X×¿AÿøÇ?:;;±£S{¶Ö8[²dÉîİ»çÏŸ?Íø|¾k×®;vÌãñddd°,«åY¥’$Åb1ã8Û¶mÛªU«\n\n\n¦ÿfëøñã\'Nœø~\\\0ÚÀZqíH’4>>¾víÚ={öLó…V8şæ›o9ræÌyºkVÏ9›”<h7f³¹³³S¾=Óf³©ÜÅ÷°²²²¢¢¢Ï?ÿÜl6#ÛšA°5\"¿vÚ´iÓ={¦3ìE±¹¹ùğáÃ_}õU0L…Mò¦QoŞ¼yåÊ•±±±L¹›a˜üüü²²²ÎÎNÜø£[òxuçÎ[¶l™N>ß{ï½£GF\"ƒÁRaãÍóüÍ›7/\\¸àp8²³³§œZ+((¨¨¨¸~ız(J©_‡Tö¬“$iddäµ×^ûñ<¡é\'Ÿ|òÁôôôÌÈº‘Y\"¯oáyşâÅ‹§¨¨hÊó‰ÇÂ…åÜ)û{Á]r[½k×®—_~yÊoóĞĞĞÁƒ¿úê«X,–o€išff``àÒ¥KÙÙÙùùùêı‡Ãáv»oÜ¸‡‘íY…`Ï\"y>yûöíë×¯Ÿò{ÜÒÒòÎ;ïšÍæ4úÒËHyollÔétÅÅÅê£n‡ÃQZZzáÂy«¹VÕœsìYkjjvíÚ5eüìÙ³E1-\ZêGÑ4m0®]»6::ºhÑ\"õCÚœNçüùóÏœ9ƒyòÙƒ`Ïçkkkßzë-õæ78pàã?¶Z­iÔP?Juœ8qÂív;•Â………N§óêÕ«qÓ‡`ÏŠX,V\\\\ü‹_üBıBŸÏwôèÑ.Øl62¾ß,ËRÕŞŞ^VV¦r7°N§+((İİİØ\n6Ò¸‰HYò+ë×^{M}m™×ëı÷¿ÿıÍ7ß¤Î	¤3‚eY¿ßÿ÷¿ÿıêÕ«*ÅŒFã;ìv{,Ó¬nsZì&IR8~ã7yæ•b^¯÷OúS___ª>#hšÅbŸ}öYuuunn®R1½^_]]İÔÔ$o‰Ñ²†ÄC‹=Ã8[»v­úe×ápøĞ¡C^¯—ÈTËhšÎÉÉ9tèP¿J±¢¢¢mÛ¶E£ÑäÀJ{&	‚PPP°nİ:•qc(:räÈµk×NµŒaŸÏ÷·¿ıíşıû*Å^xá…åË—ó<¯YÅæ{&ºººüü|•2Ÿ~úé_|1Gî»bYv||üÏşs(R*c0¶mÛ&\Zí„`Ïãª««İn·J™–––>ø á{ğÒ‘^¯ihhPÉmnnî;=Â	†É³™!‚İnÿío«rnYggçÁƒçà9z½¾££Ãét–””(•ÉÏÏ\Z\Z’Ğ²n¤B‹=3AX¿~½ÊÖüñÜÜÛDQ”Ùl>räHWW—R™ÌÌÌ—^z‰atÈgÄœû’ÍArrrV®\\©Ò744tvvÎ‘¡õ£hšáÈ‘#*¹u»İ¥¥¥x­=#ì7oŞl³Ù”\n\\¾|ùÔ©Sf³YËZ¥\Z½^ßİİ}üøq¥EíØ±#hY+R!ØKE§Ó¹|ùr¥gÏM…+õ’Îh4655\r*(++«©©‰F£ZÖŠHöã\nƒ?ıéOUN;ºtéÒÕ«WÓtÛÖÌbÆãñ|ñÅ*·ğnİº¯¾‚ıXb±XUUUuuµRÑÑÑúúú9Ş	˜Ñhüä“Onß¾­T ¨¨hÅŠh´‚ıXAxúé§U¶(~şùçØ™øÙÙÙŸ}ö™ÒS‹Å²dÉŠ¢Ğh?;q’$Y,–¥K—*¼xñ\"®Âø–e»ººTö~ÕÖÖfee!ØÁN\\,+//WºÅZÅ‹/ÏÁ×ê(Šây¾¹¹9‰LZÀh4ÖÖÖbõøãÀw.q~¿İºuJOGGG/\\¸0g_\\«3­­­G©ÀªU«ÆÇÇµ¬aì‰¢XTTTVV¦T ¥¥åÁƒh®\'%7ÚgÏU*ğÄO¬\\¹‹U†¯]‚8{á…T\Zä“\'Ob2\\…ÑhlhhPê†eË–)=…)!Ø‰ï‘^¸p¡Rƒ|ëÖ­û÷ï£¹VAQ”ÑhlmmU*P\\\\œ‘‘)´Äà›—QËÊÊTn«?şü”7c€Édºté’ÒÓ¼¼¼…\n‚ e•ˆ`\'B>„Ti/—Ïç»{÷.¶N‰a˜¡¡¡¾¾¾IŸÚl¶¼¼<;1v\"$I*((PzÚÛÛ;44„~ø”hšöz½*sã%%%*‹OA¾|‰E±¼¼|ÒG‚ Ü¹s‡çy¬6›Q¿ıö[¥WÖr°1ÌN\0‚7ùF®Lú4\nuwwcËÇ4éõú®®.¥Ùï¼¼<‹Å‚`\'\0Á› .—Kéi$¹uëØÓDÓtWWW8V*€ù³Ä Øq‹F£UUUJO¿ûî;ãĞŸ&ùÕÙÙ©T`Ñ¢EX¦’\0;n‚ ¨œmvóæMìúˆ‹Á`P	vAA¶p&\0ÁÏó*°;::pË\\\\X–íîîVzZZZŠ‰ñ Øñ‘$);;[¥§=00€]q¡iú»ï¾Sy:oŞ<d;^ø\nÆGÅììl¥¹1ŸÏ\'IØñ2£££“>b&\'\'ãñB°ã#Šâ¼yó”:Û÷ïßG?<ò4¥G‡-v¼ìøÈg’*¥wllÍu(ŠRºÜ‹eÙììl;^v|$I2›ÍJ£è±±1°@Ó´ÏçSz¤×ëÑ¾…ñ‘$Éd2)¥K)¦ô§c&##-v¼ìøÈ/±•‚=11®x(ŠRºj“¢¨ììlü‹/;>ê“ŞÑhÁN\0EQ*«PĞO\0‚7•yo,O˜ÊŸ/\Z€?Y|,Ë™3gnİºõè¨a˜ìëJ€|öáÃ‡írÓ4=44d±X’R±ôEíİ»7ÙuH3‚ (mKĞëõ˜OŒ(ŠJ½q–eÑŠZì¸1ƒïÙŒ£i\Z›gfš\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°ôÍª×BJèÇ\0\0\0\0IEND®B`‚'),('1129506976','CC','ASHLEY','DEFORT','3215795146','ashley@gmail.com','74d956c9d0e79e4d105491bf9d9d99e80a803b6b','Calle 59C 22E-10','ADMIN','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0H\0\0H\0\0\0½vğd\0\0\0sBITÛáOà\0\0\0_zTXtRaw profile type APP1\0\0™ãJOÍK-ÊLV((ÊOËÌIåR\0c.KK£D04006’F@¶9T(Ñ\0˜˜›¥¡¹Y²™)ˆÏ\0Oºh-ØŒ\0\0ÁIDATxœíİYl÷áğco{×»Æ8>ƒÀ^;Å1„4€Rq…@\nF…ÚF•šFJß*µ}*}hUU%EEUb\"DIâQĞ8Ø`csClŸk{×ö3»3ó5â<cïbÏîşüı<f~ÿlí—ß1¿ƒÚ»w¯\0ÈB\'»\00ól\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0b“]˜yÒCt: ?(À0ŒN§£’„ZÂlB°É!B,‹F£F£Ñf³Y­Ö¬¬,Š¢rrr~PrxxX’¤±±±`0811Áqœ^¯gYV<\0ÁNo’$	‚Àqœßï¯¬¬t¹\\eee‡Ãd2™L¦ŒŒŠ¢233ğ)¿ß/IR ˆD\"‘HÄçóİ¹sçæÍ›·nİÊÌÌ4Ã OkvZ’$)‹‰¢h4\Z,X°bÅŠeË–Y­V–eõzı”—£n³Ù¾ÿ/Ë—/Åb~¿¿µµõòåËƒƒƒÇÑ4Í²,¨½{÷&»ãt:İÒ¥K—.]ZYY™——7ã?âŞ½{W¯^½zõªN§3\Z3ş#`V¡ÅN’$E£QŸÏ÷òË/?ÿüóö±gJ^^^^^^mmíĞĞPccãgŸ}æp8ôz=Zït;=ğ<o2™ªªª6oŞüä“OjüÓûúú>ıôÓH$b04şé\0¦¦¦&Ùu\05’$…B¡§Ÿ~úõ×_ß¸qcVV–öuÈÊÊZ¾|yyyùÄÄD?šîÔ‡®xê’ûŞÇíİ»·¶¶Öjµ&·>EEE---4\Zˆw*C‹¢äyï¥K—şîw¿s¹\\)Ò6,X½zõƒîİ»GÓ4²š0ÆNE¢(F£Ñ;w®^½:±éh4êõzı~8–›ıïÉ­ÙlÎÌÌt:Óy=ö(ãÎ;÷ŸÿüG¯×Ó4&§tÅSN4\Z¥iúÍ7ß¬­­÷³^¯·³³³««kxxx||<ÈÁD\"ß—1™Lr°322ìv{NNÎÂ…+++NçôÑh\\·nÓéü×¿şFû×fZìÔÂó|iiéÏşó¢¢¢i~$‰x½Ş›7o<yòÎ;z½^^:öı:ğ‡;Ìòòï“‚F@YYÙÆ].—Óé4™LÓüéõõõ===)2X\0‚B8ËÎÎşÃşàp8¦S>‹utt´¶¶¶´´øı~³Ùü8‹½A‡Ã™™™µµµÏ<óLUUËN«CçóùöíÛ7::Šu,©ÁN<Ï¿ùæ›óçÏŸNùöööO?ıtppçyƒÁ0S“X’$ÉÿÃÂÂÂÍ›7»İîé|Êãñ¼óÎ;ıııh·SfÅSÏó‹/şõ¯ıèN¬Guuu9räèÑ£Á`pÆ—sS%7Ô>ŸïüùówïŞu:ÙÙÙêŸ²Z­K–,éëëóx<Ø\"–\nìä!\nıñœ2?±Xìüùóï½÷^oo¯Õj½·MEÑ4m4\ZûûûÛÛÛÍfsaa¡zb-Keeå\'Ÿ|‚yòT€`\'™ ¿ÿıïóóóÕK>xğ`ÿşıgÎœÑétšÍB³,‹ÅZ[[{{{ËËËÕÉX,–šššöövyg˜65„I!ØÉ$ÏKÿìg?«®®V/ÖÓÓ³oß>Çc2™4^BQ”^¯¿wïŞÿû_—Ëåp8T*àp8G[[fI.;™B¡Ğ/¼°yófõb×¯_ÿç?ÿÉq\\§¦ä¦ûòåË………¹¹¹*%‡‡‡»ºº0‘–DvÒD£ÑÒÒÒ·ß~[¥eE±¡¡áÀÃ$}RŠ¦éh4zæÌ½^¿hÑ\"•j»İî7nx½Ş¤×yÎÂ@(9DQ4›Í;vìPï¯655}øá‡6›-E†¬4MÛl¶?ü°©©I¥EQ;vì0›Í¢(jV7xZìäˆD\"ë×¯ñÅUÊ\\¹råı÷ß—\'¨5«Ø”(Šb¦³³3??ÿ‰\'P*–““‡oŞ¼‰Õ¦I‘Bß˜¹CE§Ó¹iÓ&•2}}}ûöíKÍéeš¦9Û·o___ŸJ±M›69N4ÚI‘r_š¹`||¼®®Îl6+ğz½ï¾û®İnOÁTËhš¶Ûíï¾û®×ëU*c6›ëêêÆÇÇµ¬ÈRô{C°X,VUU¥²T“çù“\'OöööNs©v²°,ÛÛÛ{òäIç•Ê¸İîªªªX,¦eÅ@‡`kL’$Q7nÜh±X”Ê´¶¶:u*-6TÆS§Nµ¶¶*°X,7nEQŞRšA°5%Â¢E‹***”\núúz‹Å’«;(Š²X,õõõ@@©LEEÅ¢E‹½ff‚­)ãjjjT\r>yòd8NÙ¡õ£hš‡Ã\'OT*™™év»>Â46_ 2ƒÁçŸ^éiOOOccãô9H&“©±±±§§G©ÀsÏ=\n…´¬ ØÚ‰Åbn·[it-B[[Ûøøx\Z5×2š¦ÇÇÇÛÚÚ”úÛ6›íé§ŸÆš–Òì;”ÖB¡P]]ÒÓ‘‘‘†††´˜3{”ÑhlhhQ*PWW‡F[K¶FDQÌËËSÙ>ÑÜÜ,IRZÌ™=Š¢(I’š››•\näæææååa±ŠflD£Q—Ë¥ò–ëôéÓi7º~˜Éd:}ú´ÒS‹Åâr¹¢Ñ¨–UšËlˆ¢XUU¥İ7nƒÁ4m®eEƒÁ7nLúT¾x-¶fl-H’d³ÙT®İêêêÒıÿC‚Ó\\yù™TVV–ÍfÃJm ØZw}(~411ÑÓÓCÀÖe†azzz&&&&}šŸŸŸF[¶ä`ÛíöIŸz½Şşş~2‚İßß¯´-Än·Ûív[¶DQT¹ ‰ŒŒŒ¤İëëGÑ4=22òğuB?àp8lm¤ı—)-Äb1¥~¸$I·oß& Õ2š¦oß¾­4.,,Ä2mò}Jq‚ (]y\'ÂğğpŠïĞœ>–e‡‡‡•– 9NìÑ‚­A”ºâ¢(0À–1388¨Ôßv8¶6l-‚ tÔ¾$I>Ÿ/­_t=Œ¢(ŸÏ§Ô·Z­¶6l-ğ<¯´˜T’¤ÑÑQ’‚=::ªìÜÜ\\•ãV`!Ø\ZQú®K’ä÷ûI\n¶ßïWùe5®Ïœ…`Á ‚­•Î61ïºd*¿1#Ô‡`keY¿ß?é#š¦\n\nˆY%ŠbAAÒz¿ßOØ¿b)ÁÖË²*§‹˜L&bf•$IRÙU>22‚`kÁÖÃ0Á`PéQII	1owA())QZo‰YŠ“âl-°,ëñx&}DÓô¼yóHêŠÏ›7O©+îñxĞbkÁÖÃ0J]qš¦ËËË‰9v›ã¸òòr¥`ŒŒ ÅÖ‚­š¦•ZlNg·ÛN\'ÃlI’T¶ëtº¡¡![¶hšöù|J•m6[~~>ÃlAòóóm6Û¤O#‘HºŸë–Fl-ÈÁ¾wïŞ¤OçÍ›W\\\\LF°‹‹‹çÍ›7éÓ{÷îy½^bv§8ü•µ@Ó´×ëUéWVVjYŸÙ£ò‹x<[3ø+kDÅû÷ï+Í~Ë—H§õ0[’$ùêïIŸ\n‚ ²Of‚­ƒÁĞÖÖ¦´şÌb±¬Y³&­·4ò<¿fÍ\Z¥Àµk×ƒÆµš³l0ÓÕÕ¥t‚§N§[»vmú6Úrs½víZ¥^¯·»»SâšA°µ£×ë›šš”æåå¹İî4½\'\Zºİî¼¼<¥MMMXš¢%[;F£ñØ±cJOM&Ó†\rX–M»F[’$–e7lØ ²JüØ±ciz‘hšB°µCQ”Ùl¾té’RòòòeË–¥]£F—-[V^^®TàÒ¥Kf³o°µ„`kÊd2µµµ)M†õë×¥Q£-IÒØØØúõë•&ÆDQlkkKë‹DÓ‚­)½^ßÖÖÖÑÑ¡T ¤¤dÏ=*—i¤šH$²gÏ’’¥mmmz½^ËZ‚­)Š¢8»xñ¢J{íÚµ.—+-¶…pçr¹T&Ã£ÑèÅ‹9C?\\c¶ÖL&Ó—_~Ùßß¯TÀn·oß¾İf³¥ørQm6ÛöíÛUv}ô÷÷ùå—è‡kÁN«ÕZ__¯’Ûòòò]»v”lK’víÚ¥2g&Šb}}½ÒM	0«ì$`Y¶¿¿¿¥¥E¥Ì³Ï>»eË•3º“H>}Ë–-Ï>û¬J±–––şş~¼¾N\n¦¦¦&Ùu˜‹(Š\Z¨¬¬TÚä¨Óé***X–½qãË²©3F•$)‰lÛ¶íÕW_UÙÑ144ôşûïG\"ìúH\nüÑ“C¾¼îÔ©S*eX–]·nİÊ•+C¡f›R(Z¹råºuëÔ›âS§N‘tÙ`ÚA‹4z½şÛo¿-(((,,T*c0*++%Ijoo7™LÉm·åWÖ¯¼òJ]]]FF†JÉæææ£GbtDv2±,ÛŞŞ^YY™­TÆ`0TUUåää´µµQ•¬­ Ñhô—¿üå¦M›Ô‡vuuíß¿_¯×§ÎğaB°“‰¢¨X,vÿşıêêj³Ù¬R¬¤¤$??ÿÛo¿MÊ™û‘H$++ë7ŞxşùçÕãêóù:4::Š9³äB°“L>À´»»ûG?ú‘zÉ‚‚‚%K–Ğ4­MÓ-B$Yºté¯~õ«ŠŠŠ)Ëÿõ¯½sçÖ™%‚|ÃÜ½{wll¬ººZ}¶)33ó¹ç³ÙlÃÃÃ^¯—a˜ÙëîJ’Äq\\~~şÖ­[wïŞ™™©^çùúúú––•®hÁN	z½¾··7‰¸\\®)›âÒÒÒ%K–ÈËÎu:İŒÇ[ÅH$¶nİºsçÎ§zjÊÄb±cÇ;w.é3| C°S‚<+ÖÕÕuïŞ½åË—OYŞjµº\\®5kÖÈ=ùP(‹Å3á’$ñ</I’İnñÅßzë­ÚÚÚiÎl8pàë¯¿6HuŠ@°SEQ,ËvwwOLL”——Oy,EQV«õ©§ª©©),,´Z­<“‡ßÓ˜$IÑh4X­Ö+V¼ôÒK?ùÉOV¬XaµZ§ó?ñûıG9wîœÅbAªSµwïŞd×şŸH$âv»wïŞ­t@·Ò§FGGÚÛÛ›››ÇÇÇM&Ë²r3şp÷^EI’AˆÅb‘HÄn·?ûì³n·»¨¨(;;;®\r###‡–ß±ÇñÂìC°SÏóV«õ7¿ùÍt&¢\'566600ğàÁŸÏÇÇÇåæTîi[­V‡Ã‘››[TT”•••Ø¸uëÖşıûƒÁ ÎMAvŠ’ÇÌÛ¶m{ñÅS­=ŒD\"çÏŸÿè£AÀûêÔ„1vŠ¢iZ^Iz÷îİ¨/áÔÒıû÷:túôi†a°<e!Ø©‹¢(½^?44tüøqQóóó“ø2I’$ŸÏwüøñ¿üå/>Ÿ¯µRvw¥4I’(Šb¦©©é»ï¾KîŞìáááÁÁA‹Å‹ÅRütÀ;E‰¢FY–]¼xñ+¯¼òä“O\ZÆ¤7’<Ïûış³gÏ;w.Ò41vjB°S$I¡Phşüù«W¯^²dÉ‚’]£I+W®466Ş¸qÃd2a°jìòıÚ¯-[¶,_¾\\eŸvŠ»uëÖG}444d±XïÔ`§\nçM&Seeåîİ»Ng²«Ÿ\'Nœ?Şãñ`UiŠ@°“O>™dÕªU6lX´hÑãÿ\'&&Âá0ÏóápXŞ¤õƒòpİ`0˜L&³Ùœ™™ùø›@GGG¿şúë††ymìcşßà1!ØIÆqœ ¯¿şúªU«ç,!ÇÓÛÛ{÷îİñññááa¿ß‡\'&&DQœ˜˜øAa›ÍFÓ´Åb±Z­6›Íáp8ÎÜÜÜâââÂÂÂ„›\\Qoß¾ışûï÷÷÷Os©9Ì;iDQä8î™gÙ±cÇO<ïÇÃáp0¼sçÎ…:::äó@)Š’_Qÿ£Óé\r˜üÚLúQåä’$Ñ4½xñâÚÚZ—Ëe·Û-K¼¹ \'Nœ8uêÇq8q!Yìä¢¨W_}uõêÕ‹%®Ïöõõõ÷÷_¿~½©©)‹™Íf¹ë;#-¤¼?„ã8Q«««—.]ZZZZ^^oD¯_¿şá‡öõõáöÜ¤@°“€çy–eß~ûm—ËW\Z;::\Z»ºº<Ã0³z` œpç322.\\èv»W¬X×¿AÿøÇ?:;;±£S{¶Ö8[²dÉîİ»çÏŸ?Íø|¾k×®;vÌãñddd°,«åY¥’$Åb1ã8Û¶mÛªU«\n\n\n¦ÿfëøñã\'Nœø~\\\0ÚÀZqíH’4>>¾víÚ={öLó…V8şæ›o9ræÌyºkVÏ9›”<h7f³¹³³S¾=Óf³©ÜÅ÷°²²²¢¢¢Ï?ÿÜl6#ÛšA°5\"¿vÚ´iÓ={¦3ìE±¹¹ùğáÃ_}õU0L…Mò¦QoŞ¼yåÊ•±±±L¹›a˜üüü²²²ÎÎNÜø£[òxuçÎ[¶l™N>ß{ï½£GF\"ƒÁRaãÍóüÍ›7/\\¸àp8²³³§œZ+((¨¨¨¸~ız(J©_‡Tö¬“$iddäµ×^ûñ<¡é\'Ÿ|òÁôôôÌÈº‘Y\"¯oáyşâÅ‹§¨¨hÊó‰ÇÂ…åÜ)û{Á]r[½k×®—_~yÊoóĞĞĞÁƒ¿úê«X,–o€išff``àÒ¥KÙÙÙùùùêı‡Ãáv»oÜ¸‡‘íY…`Ï\"y>yûöíë×¯Ÿò{ÜÒÒòÎ;ïšÍæ4úÒËHyollÔétÅÅÅê£n‡ÃQZZzáÂy«¹VÕœsìYkjjvíÚ5eüìÙ³E1-\ZêGÑ4m0®]»6::ºhÑ\"õCÚœNçüùóÏœ9ƒyòÙƒ`Ïçkkkßzë-õæ78pàã?¶Z­iÔP?Juœ8qÂív;•Â………N§óêÕ«qÓ‡`ÏŠX,V\\\\ü‹_üBıBŸÏwôèÑ.Øl62¾ß,ËRÕŞŞ^VV¦r7°N§+((İİİØ\n6Ò¸‰HYò+ë×^{M}m™×ëı÷¿ÿıÍ7ß¤Î	¤3‚eY¿ßÿ÷¿ÿıêÕ«*ÅŒFã;ìv{,Ó¬nsZì&IR8~ã7yæ•b^¯÷OúS___ª>#hšÅbŸ}öYuuunn®R1½^_]]İÔÔ$o‰Ñ²†ÄC‹=Ã8[»v­úe×ápøĞ¡C^¯—ÈTËhšÎÉÉ9tèP¿J±¢¢¢mÛ¶E£ÑäÀJ{&	‚PPP°nİ:•qc(:räÈµk×NµŒaŸÏ÷·¿ıíşıû*Å^xá…åË—ó<¯YÅæ{&ºººüü|•2Ÿ~úé_|1Gî»bYv||üÏşs(R*c0¶mÛ&\Zí„`Ïãª««İn·J™–––>ø á{ğÒ‘^¯ihhPÉmnnî;=Â	†É³™!‚İnÿío«rnYggçÁƒçà9z½¾££Ãét–””(•ÉÏÏ\Z\Z’Ğ²n¤B‹=3AX¿~½ÊÖüñÜÜÛDQ”Ùl>räHWW—R™ÌÌÌ—^z‰atÈgÄœû’ÍArrrV®\\©Ò744tvvÎ‘¡õ£hšáÈ‘#*¹u»İ¥¥¥x­=#ì7oŞl³Ù”\n\\¾|ùÔ©Sf³YËZ¥\Z½^ßİİ}üøq¥EíØ±#hY+R!ØKE§Ó¹|ùr¥gÏM…+õ’Îh4655\r*(++«©©‰F£ZÖŠHöã\nƒ?ıéOUN;ºtéÒÕ«WÓtÛÖÌbÆãñ|ñÅ*·ğnİº¯¾‚ıXb±XUUUuuµRÑÑÑúúú9Ş	˜Ñhüä“Onß¾­T ¨¨hÅŠh´‚ıXAxúé§U¶(~şùçØ™øÙÙÙŸ}ö™ÒS‹Å²dÉŠ¢Ğh?;q’$Y,–¥K—*¼xñ\"®Âø–e»ººTö~ÕÖÖfee!ØÁN\\,+//WºÅZÅ‹/ÏÁ×ê(Šây¾¹¹9‰LZÀh4ÖÖÖbõøãÀw.q~¿İºuJOGGG/\\¸0g_\\«3­­­G©ÀªU«ÆÇÇµ¬aì‰¢XTTTVV¦T ¥¥åÁƒh®\'%7ÚgÏU*ğÄO¬\\¹‹U†¯]‚8{á…T\Zä“\'Ob2\\…ÑhlhhPê†eË–)=…)!Ø‰ï‘^¸p¡Rƒ|ëÖ­û÷ï£¹VAQ”ÑhlmmU*P\\\\œ‘‘)´Äà›—QËÊÊTn«?şü”7c€Édºté’ÒÓ¼¼¼…\n‚ e•ˆ`\'B>„Ti/—Ïç»{÷.¶N‰a˜¡¡¡¾¾¾IŸÚl¶¼¼<;1v\"$I*((PzÚÛÛ;44„~ø”hšöz½*sã%%%*‹OA¾|‰E±¼¼|ÒG‚ Ü¹s‡çy¬6›Q¿ıö[¥WÖr°1ÌN\0‚7ùF®Lú4\nuwwcËÇ4éõú®®.¥Ùï¼¼<‹Å‚`\'\0Á› .—Kéi$¹uëØÓDÓtWWW8V*€ù³Ä Øq‹F£UUUJO¿ûî;ãĞŸ&ùÕÙÙ©T`Ñ¢EX¦’\0;n‚ ¨œmvóæMìúˆ‹Á`P	vAA¶p&\0ÁÏó*°;::pË\\\\X–íîîVzZZZŠ‰ñ Øñ‘$);;[¥§=00€]q¡iú»ï¾Sy:oŞ<d;^ø\nÆGÅììl¥¹1ŸÏ\'IØñ2£££“>b&\'\'ãñB°ã#Šâ¼yó”:Û÷ïßG?<ò4¥G‡-v¼ìøÈg’*¥wllÍu(ŠRºÜ‹eÙììl;^v|$I2›ÍJ£è±±1°@Ó´ÏçSz¤×ëÑ¾…ñ‘$Éd2)¥K)¦ô§c&##-v¼ìøÈ/±•‚=11®x(ŠRºj“¢¨ììlü‹/;>ê“ŞÑhÁN\0EQ*«PĞO\0‚7•yo,O˜ÊŸ/\Z€?Y|,Ë™3gnİºõè¨a˜ìëJ€|öáÃ‡írÓ4=44d±X’R±ôEíİ»7ÙuH3‚ (mKĞëõ˜OŒ(ŠJ½q–eÑŠZì¸1ƒïÙŒ£i\Z›gfš\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°ôÍª×BJèÇ\0\0\0\0IEND®B`‚'),('5640','CE','Usuario','Funcionario','123456789','usuario@gmail.com','09c6bd5f65243380b7ab079f5b68fe4af2899c0a','Calle 30 #45-27','FUNC','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0H\0\0H\0\0\0½vğd\0\0\0sBITÛáOà\0\0\0_zTXtRaw profile type APP1\0\0™ãJOÍK-ÊLV((ÊOËÌIåR\0c.KK£D04006’F@¶9T(Ñ\0˜˜›¥¡¹Y²™)ˆÏ\0Oºh-ØŒ\0\0ÁIDATxœíİYl÷áğco{×»Æ8>ƒÀ^;Å1„4€Rq…@\nF…ÚF•šFJß*µ}*}hUU%EEUb\"DIâQĞ8Ø`csClŸk{×ö3»3ó5â<cïbÏîşüı<f~ÿlí—ß1¿ƒÚ»w¯\0ÈB\'»\00ól\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0b“]˜yÒCt: ?(À0ŒN§£’„ZÂlB°É!B,‹F£F£Ñf³Y­Ö¬¬,Š¢rrr~PrxxX’¤±±±`0811Áqœ^¯gYV<\0ÁNo’$	‚Àqœßï¯¬¬t¹\\eee‡Ãd2™L¦ŒŒŠ¢233ğ)¿ß/IR ˆD\"‘HÄçóİ¹sçæÍ›·nİÊÌÌ4Ã OkvZ’$)‹‰¢h4\Z,X°bÅŠeË–Y­V–eõzı”—£n³Ù¾ÿ/Ë—/Åb~¿¿µµõòåËƒƒƒÇÑ4Í²,¨½{÷&»ãt:İÒ¥K—.]ZYY™——7ã?âŞ½{W¯^½zõªN§3\Z3ş#`V¡ÅN’$E£QŸÏ÷òË/?ÿüóö±gJ^^^^^^mmíĞĞPccãgŸ}æp8ôz=Zït;=ğ<o2™ªªª6oŞüä“OjüÓûúú>ıôÓH$b04şé\0¦¦¦&Ùu\05’$…B¡§Ÿ~úõ×_ß¸qcVV–öuÈÊÊZ¾|yyyùÄÄD?šîÔ‡®xê’ûŞÇíİ»·¶¶Öjµ&·>EEE---4\Zˆw*C‹¢äyï¥K—şîw¿s¹\\)Ò6,X½zõƒîİ»GÓ4²š0ÆNE¢(F£Ñ;w®^½:±éh4êõzı~8–›ıïÉ­ÙlÎÌÌt:Óy=ö(ãÎ;÷ŸÿüG¯×Ó4&§tÅSN4\Z¥iúÍ7ß¬­­÷³^¯·³³³««kxxx||<ÈÁD\"ß—1™Lr°322ìv{NNÎÂ…+++NçôÑh\\·nÓéü×¿şFû×fZìÔÂó|iiéÏşó¢¢¢i~$‰x½Ş›7o<yòÎ;z½^^:öı:ğ‡;Ìòòï“‚F@YYÙÆ].—Óé4™LÓüéõõõ===)2X\0‚B8ËÎÎşÃşàp8¦S>‹utt´¶¶¶´´øı~³Ùü8‹½A‡Ã™™™µµµÏ<óLUUËN«CçóùöíÛ7::Šu,©ÁN<Ï¿ùæ›óçÏŸNùöööO?ıtppçyƒÁ0S“X’$ÉÿÃÂÂÂÍ›7»İîé|Êãñ¼óÎ;ıııh·SfÅSÏó‹/şõ¯ıèN¬Guuu9räèÑ£Á`pÆ—sS%7Ô>ŸïüùówïŞu:ÙÙÙêŸ²Z­K–,éëëóx<Ø\"–\nìä!\nıñœ2?±Xìüùóï½÷^oo¯Õj½·MEÑ4m4\ZûûûÛÛÛÍfsaa¡zb-Keeå\'Ÿ|‚yòT€`\'™ ¿ÿıïóóóÕK>xğ`ÿşıgÎœÑétšÍB³,‹ÅZ[[{{{ËËËÕÉX,–šššöövyg˜65„I!ØÉ$ÏKÿìg?«®®V/ÖÓÓ³oß>Çc2™4^BQ”^¯¿wïŞÿû_—Ëåp8T*àp8G[[fI.;™B¡Ğ/¼°yófõb×¯_ÿç?ÿÉq\\§¦ä¦ûòåË………¹¹¹*%‡‡‡»ºº0‘–DvÒD£ÑÒÒÒ·ß~[¥eE±¡¡áÀÃ$}RŠ¦éh4zæÌ½^¿hÑ\"•j»İî7nx½Ş¤×yÎÂ@(9DQ4›Í;vìPï¯655}øá‡6›-E†¬4MÛl¶?ü°©©I¥EQ;vì0›Í¢(jV7xZìäˆD\"ë×¯ñÅUÊ\\¹råı÷ß—\'¨5«Ø”(Šb¦³³3??ÿ‰\'P*–““‡oŞ¼‰Õ¦I‘Bß˜¹CE§Ó¹iÓ&•2}}}ûöíKÍéeš¦9Û·o___ŸJ±M›69N4ÚI‘r_š¹`||¼®®Îl6+ğz½ï¾û®İnOÁTËhš¶Ûíï¾û®×ëU*c6›ëêêÆÇÇµ¬ÈRô{C°X,VUU¥²T“çù“\'OöööNs©v²°,ÛÛÛ{òäIç•Ê¸İîªªªX,¦eÅ@‡`kL’$Q7nÜh±X”Ê´¶¶:u*-6TÆS§Nµ¶¶*°X,7nEQŞRšA°5%Â¢E‹***”\núúz‹Å’«;(Š²X,õõõ@@©LEEÅ¢E‹½ff‚­)ãjjjT\r>yòd8NÙ¡õ£hš‡Ã\'OT*™™év»>Â46_ 2ƒÁçŸ^éiOOOccãô9H&“©±±±§§G©ÀsÏ=\n…´¬ ØÚ‰Åbn·[it-B[[Ûøøx\Z5×2š¦ÇÇÇÛÚÚ”úÛ6›íé§ŸÆš–Òì;”ÖB¡P]]ÒÓ‘‘‘†††´˜3{”ÑhlhhQ*PWW‡F[K¶FDQÌËËSÙ>ÑÜÜ,IRZÌ™=Š¢(I’š››•\näæææååa±ŠflD£Q—Ë¥ò–ëôéÓi7º~˜Éd:}ú´ÒS‹Åâr¹¢Ñ¨–UšËlˆ¢XUU¥İ7nƒÁ4m®eEƒÁ7nLúT¾x-¶fl-H’d³ÙT®İêêêÒıÿC‚Ó\\yù™TVV–ÍfÃJm ØZw}(~411ÑÓÓCÀÖe†azzz&&&&}šŸŸŸF[¶ä`ÛíöIŸz½Şşş~2‚İßß¯´-Än·Ûív[¶DQT¹ ‰ŒŒŒ¤İëëGÑ4=22òğuB?àp8lm¤ı—)-Äb1¥~¸$I·oß& Õ2š¦oß¾­4.,,Ä2mò}Jq‚ (]y\'ÂğğpŠïĞœ>–e‡‡‡•– 9NìÑ‚­A”ºâ¢(0À–1388¨Ôßv8¶6l-‚ tÔ¾$I>Ÿ/­_t=Œ¢(ŸÏ§Ô·Z­¶6l-ğ<¯´˜T’¤ÑÑQ’‚=::ªìÜÜ\\•ãV`!Ø\ZQú®K’ä÷ûI\n¶ßïWùe5®Ïœ…`Á ‚­•Î61ïºd*¿1#Ô‡`keY¿ß?é#š¦\n\nˆY%ŠbAAÒz¿ßOØ¿b)ÁÖË²*§‹˜L&bf•$IRÙU>22‚`kÁÖÃ0Á`PéQII	1owA())QZo‰YŠ“âl-°,ëñx&}DÓô¼yóHêŠÏ›7O©+îñxĞbkÁÖÃ0J]qš¦ËËË‰9v›ã¸òòr¥`ŒŒ ÅÖ‚­š¦•ZlNg·ÛN\'ÃlI’T¶ëtº¡¡![¶hšöù|J•m6[~~>ÃlAòóóm6Û¤O#‘HºŸë–Fl-ÈÁ¾wïŞ¤OçÍ›W\\\\LF°‹‹‹çÍ›7éÓ{÷îy½^bv§8ü•µ@Ó´×ëUéWVVjYŸÙ£ò‹x<[3ø+kDÅû÷ï+Í~Ë—H§õ0[’$ùêïIŸ\n‚ ²Of‚­ƒÁĞÖÖ¦´şÌb±¬Y³&­·4ò<¿fÍ\Z¥Àµk×ƒÆµš³l0ÓÕÕ¥t‚§N§[»vmú6Úrs½víZ¥^¯·»»SâšA°µ£×ë›šš”æåå¹İî4½\'\Zºİî¼¼<¥MMMXš¢%[;F£ñØ±cJOM&Ó†\rX–M»F[’$–e7lØ ²JüØ±ciz‘hšB°µCQ”Ùl¾té’RòòòeË–¥]£F—-[V^^®TàÒ¥Kf³o°µ„`kÊd2µµµ)M†õë×¥Q£-IÒØØØúõë•&ÆDQlkkKë‹DÓ‚­)½^ßÖÖÖÑÑ¡T ¤¤dÏ=*—i¤šH$²gÏ’’¥mmmz½^ËZ‚­)Š¢8»xñ¢J{íÚµ.—+-¶…pçr¹T&Ã£ÑèÅ‹9C?\\c¶ÖL&Ó—_~Ùßß¯TÀn·oß¾İf³¥ørQm6ÛöíÛUv}ô÷÷ùå—è‡kÁN«ÕZ__¯’Ûòòò]»v”lK’víÚ¥2g&Šb}}½ÒM	0«ì$`Y¶¿¿¿¥¥E¥Ì³Ï>»eË•3º“H>}Ë–-Ï>û¬J±–––şş~¼¾N\n¦¦¦&Ùu˜‹(Š\Z¨¬¬TÚä¨Óé***X–½qãË²©3F•$)‰lÛ¶íÕW_UÙÑ144ôşûïG\"ìúH\nüÑ“C¾¼îÔ©S*eX–]·nİÊ•+C¡f›R(Z¹råºuëÔ›âS§N‘tÙ`ÚA‹4z½şÛo¿-(((,,T*c0*++%Ijoo7™LÉm·åWÖ¯¼òJ]]]FF†JÉæææ£GbtDv2±,ÛŞŞ^YY™­TÆ`0TUUåää´µµQ•¬­ Ñhô—¿üå¦M›Ô‡vuuíß¿_¯×§ÎğaB°“‰¢¨X,vÿşıêêj³Ù¬R¬¤¤$??ÿÛo¿MÊ™û‘H$++ë7ŞxşùçÕãêóù:4::Š9³äB°“L>À´»»ûG?ú‘zÉ‚‚‚%K–Ğ4­MÓ-B$Yºté¯~õ«ŠŠŠ)Ëÿõ¯½sçÖ™%‚|ÃÜ½{wll¬ººZ}¶)33ó¹ç³ÙlÃÃÃ^¯—a˜ÙëîJ’Äq\\~~şÖ­[wïŞ™™©^çùúúú––•®hÁN	z½¾··7‰¸\\®)›âÒÒÒ%K–ÈËÎu:İŒÇ[ÅH$¶nİºsçÎ§zjÊÄb±cÇ;w.é3| C°S‚<+ÖÕÕuïŞ½åË—OYŞjµº\\®5kÖÈ=ùP(‹Å3á’$ñ</I’İnñÅßzë­ÚÚÚiÎl8pàë¯¿6HuŠ@°SEQ,ËvwwOLL”——Oy,EQV«õ©§ª©©),,´Z­<“‡ßÓ˜$IÑh4X­Ö+V¼ôÒK?ùÉOV¬XaµZ§ó?ñûıG9wîœÅbAªSµwïŞd×şŸH$âv»wïŞ­t@·Ò§FGGÚÛÛ›››ÇÇÇM&Ë²r3şp÷^EI’AˆÅb‘HÄn·?ûì³n·»¨¨(;;;®\r###‡–ß±ÇñÂìC°SÏóV«õ7¿ùÍt&¢\'566600ğàÁŸÏÇÇÇåæTîi[­V‡Ã‘››[TT”•••Ø¸uëÖşıûƒÁ ÎMAvŠ’ÇÌÛ¶m{ñÅS­=ŒD\"çÏŸÿè£AÀûêÔ„1vŠ¢iZ^Iz÷îİ¨/áÔÒıû÷:túôi†a°<e!Ø©‹¢(½^?44tüøqQóóó“ø2I’$ŸÏwüøñ¿üå/>Ÿ¯µRvw¥4I’(Šb¦©©é»ï¾KîŞìáááÁÁA‹Å‹ÅRütÀ;E‰¢FY–]¼xñ+¯¼òä“O\ZÆ¤7’<Ïûış³gÏ;w.Ò41vjB°S$I¡Phşüù«W¯^²dÉ‚’]£I+W®466Ş¸qÃd2a°jìòıÚ¯-[¶,_¾\\eŸvŠ»uëÖG}444d±XïÔ`§\nçM&Seeåîİ»Ng²«Ÿ\'Nœ?Şãñ`UiŠ@°“O>™dÕªU6lX´hÑãÿ\'&&Âá0ÏóápXŞ¤õƒòpİ`0˜L&³Ùœ™™ùø›@GGG¿şúë††ymìcşßà1!ØIÆqœ ¯¿şúªU«ç,!ÇÓÛÛ{÷îİñññááa¿ß‡\'&&DQœ˜˜øAa›ÍFÓ´Åb±Z­6›Íáp8ÎÜÜÜâââÂÂÂ„›\\Qoß¾ışûï÷÷÷Os©9Ì;iDQä8î™gÙ±cÇO<ïÇÃáp0¼sçÎ…:::äó@)Š’_Qÿ£Óé\r˜üÚLúQåä’$Ñ4½xñâÚÚZ—Ëe·Û-K¼¹ \'Nœ8uêÇq8q!Yìä¢¨W_}uõêÕ‹%®Ïöõõõ÷÷_¿~½©©)‹™Íf¹ë;#-¤¼?„ã8Q«««—.]ZZZZ^^oD¯_¿şá‡öõõáöÜ¤@°“€çy–eß~ûm—ËW\Z;::\Z»ºº<Ã0³z` œpç322.\\èv»W¬X×¿AÿøÇ?:;;±£S{¶Ö8[²dÉîİ»çÏŸ?Íø|¾k×®;vÌãñddd°,«åY¥’$Åb1ã8Û¶mÛªU«\n\n\n¦ÿfëøñã\'Nœø~\\\0ÚÀZqíH’4>>¾víÚ={öLó…V8şæ›o9ræÌyºkVÏ9›”<h7f³¹³³S¾=Óf³©ÜÅ÷°²²²¢¢¢Ï?ÿÜl6#ÛšA°5\"¿vÚ´iÓ={¦3ìE±¹¹ùğáÃ_}õU0L…Mò¦QoŞ¼yåÊ•±±±L¹›a˜üüü²²²ÎÎNÜø£[òxuçÎ[¶l™N>ß{ï½£GF\"ƒÁRaãÍóüÍ›7/\\¸àp8²³³§œZ+((¨¨¨¸~ız(J©_‡Tö¬“$iddäµ×^ûñ<¡é\'Ÿ|òÁôôôÌÈº‘Y\"¯oáyşâÅ‹§¨¨hÊó‰ÇÂ…åÜ)û{Á]r[½k×®—_~yÊoóĞĞĞÁƒ¿úê«X,–o€išff``àÒ¥KÙÙÙùùùêı‡Ãáv»oÜ¸‡‘íY…`Ï\"y>yûöíë×¯Ÿò{ÜÒÒòÎ;ïšÍæ4úÒËHyollÔétÅÅÅê£n‡ÃQZZzáÂy«¹VÕœsìYkjjvíÚ5eüìÙ³E1-\ZêGÑ4m0®]»6::ºhÑ\"õCÚœNçüùóÏœ9ƒyòÙƒ`Ïçkkkßzë-õæ78pàã?¶Z­iÔP?Juœ8qÂív;•Â………N§óêÕ«qÓ‡`ÏŠX,V\\\\ü‹_üBıBŸÏwôèÑ.Øl62¾ß,ËRÕŞŞ^VV¦r7°N§+((İİİØ\n6Ò¸‰HYò+ë×^{M}m™×ëı÷¿ÿıÍ7ß¤Î	¤3‚eY¿ßÿ÷¿ÿıêÕ«*ÅŒFã;ìv{,Ó¬nsZì&IR8~ã7yæ•b^¯÷OúS___ª>#hšÅbŸ}öYuuunn®R1½^_]]İÔÔ$o‰Ñ²†ÄC‹=Ã8[»v­úe×ápøĞ¡C^¯—ÈTËhšÎÉÉ9tèP¿J±¢¢¢mÛ¶E£ÑäÀJ{&	‚PPP°nİ:•qc(:räÈµk×NµŒaŸÏ÷·¿ıíşıû*Å^xá…åË—ó<¯YÅæ{&ºººüü|•2Ÿ~úé_|1Gî»bYv||üÏşs(R*c0¶mÛ&\Zí„`Ïãª««İn·J™–––>ø á{ğÒ‘^¯ihhPÉmnnî;=Â	†É³™!‚İnÿío«rnYggçÁƒçà9z½¾££Ãét–””(•ÉÏÏ\Z\Z’Ğ²n¤B‹=3AX¿~½ÊÖüñÜÜÛDQ”Ùl>räHWW—R™ÌÌÌ—^z‰atÈgÄœû’ÍArrrV®\\©Ò744tvvÎ‘¡õ£hšáÈ‘#*¹u»İ¥¥¥x­=#ì7oŞl³Ù”\n\\¾|ùÔ©Sf³YËZ¥\Z½^ßİİ}üøq¥EíØ±#hY+R!ØKE§Ó¹|ùr¥gÏM…+õ’Îh4655\r*(++«©©‰F£ZÖŠHöã\nƒ?ıéOUN;ºtéÒÕ«WÓtÛÖÌbÆãñ|ñÅ*·ğnİº¯¾‚ıXb±XUUUuuµRÑÑÑúúú9Ş	˜Ñhüä“Onß¾­T ¨¨hÅŠh´‚ıXAxúé§U¶(~şùçØ™øÙÙÙŸ}ö™ÒS‹Å²dÉŠ¢Ğh?;q’$Y,–¥K—*¼xñ\"®Âø–e»ººTö~ÕÖÖfee!ØÁN\\,+//WºÅZÅ‹/ÏÁ×ê(Šây¾¹¹9‰LZÀh4ÖÖÖbõøãÀw.q~¿İºuJOGGG/\\¸0g_\\«3­­­G©ÀªU«ÆÇÇµ¬aì‰¢XTTTVV¦T ¥¥åÁƒh®\'%7ÚgÏU*ğÄO¬\\¹‹U†¯]‚8{á…T\Zä“\'Ob2\\…ÑhlhhPê†eË–)=…)!Ø‰ï‘^¸p¡Rƒ|ëÖ­û÷ï£¹VAQ”ÑhlmmU*P\\\\œ‘‘)´Äà›—QËÊÊTn«?şü”7c€Édºté’ÒÓ¼¼¼…\n‚ e•ˆ`\'B>„Ti/—Ïç»{÷.¶N‰a˜¡¡¡¾¾¾IŸÚl¶¼¼<;1v\"$I*((PzÚÛÛ;44„~ø”hšöz½*sã%%%*‹OA¾|‰E±¼¼|ÒG‚ Ü¹s‡çy¬6›Q¿ıö[¥WÖr°1ÌN\0‚7ùF®Lú4\nuwwcËÇ4éõú®®.¥Ùï¼¼<‹Å‚`\'\0Á› .—Kéi$¹uëØÓDÓtWWW8V*€ù³Ä Øq‹F£UUUJO¿ûî;ãĞŸ&ùÕÙÙ©T`Ñ¢EX¦’\0;n‚ ¨œmvóæMìúˆ‹Á`P	vAA¶p&\0ÁÏó*°;::pË\\\\X–íîîVzZZZŠ‰ñ Øñ‘$);;[¥§=00€]q¡iú»ï¾Sy:oŞ<d;^ø\nÆGÅììl¥¹1ŸÏ\'IØñ2£££“>b&\'\'ãñB°ã#Šâ¼yó”:Û÷ïßG?<ò4¥G‡-v¼ìøÈg’*¥wllÍu(ŠRºÜ‹eÙììl;^v|$I2›ÍJ£è±±1°@Ó´ÏçSz¤×ëÑ¾…ñ‘$Éd2)¥K)¦ô§c&##-v¼ìøÈ/±•‚=11®x(ŠRºj“¢¨ììlü‹/;>ê“ŞÑhÁN\0EQ*«PĞO\0‚7•yo,O˜ÊŸ/\Z€?Y|,Ë™3gnİºõè¨a˜ìëJ€|öáÃ‡írÓ4=44d±X’R±ôEíİ»7ÙuH3‚ (mKĞëõ˜OŒ(ŠJ½q–eÑŠZì¸1ƒïÙŒ£i\Z›gfš\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°„`Á ‚\r@ €@6\0l\0!Ø\0B°ôÍª×BJèÇ\0\0\0\0IEND®B`‚');

/*Table structure for table `llamado_de_atencion` */

DROP TABLE IF EXISTS `llamado_de_atencion`;

CREATE TABLE `llamado_de_atencion` (
  `codLlamado` int(11) NOT NULL AUTO_INCREMENT,
  `atencionFecha` date NOT NULL,
  `llamadoIdApre` varchar(50) NOT NULL,
  `llamadoFicha` int(11) NOT NULL,
  `llamadoFuncionario` varchar(50) NOT NULL,
  `llamadoMotivo` varchar(500) NOT NULL,
  `llamadoAccionesTomadas` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`codLlamado`),
  KEY `Fk_apren` (`llamadoFuncionario`),
  KEY `Fk_des_corta` (`llamadoFicha`),
  KEY `idAprendiz` (`llamadoIdApre`),
  CONSTRAINT `fichaDeCaracterizacion` FOREIGN KEY (`llamadoFicha`) REFERENCES `ficha` (`Cod_Ficha`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idAprendiz` FOREIGN KEY (`llamadoIdApre`) REFERENCES `aprendiz` (`Id_Apre`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idFuncionario` FOREIGN KEY (`llamadoFuncionario`) REFERENCES `funcionario` (`ID_Func`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `llamado_de_atencion` */

insert  into `llamado_de_atencion`(`codLlamado`,`atencionFecha`,`llamadoIdApre`,`llamadoFicha`,`llamadoFuncionario`,`llamadoMotivo`,`llamadoAccionesTomadas`) values (4,'2023-07-17','456',1234,'1129506976','Incumplimiento de tareas asignadas','RealizaciÃ³n de actividad de refuerzo');

/*Table structure for table `observaciones` */

DROP TABLE IF EXISTS `observaciones`;

CREATE TABLE `observaciones` (
  `CodObs` int(20) NOT NULL AUTO_INCREMENT,
  `FechaObs` date DEFAULT NULL,
  `ID_FuncFK` varchar(30) DEFAULT NULL,
  `Id_ApreFK` varchar(30) DEFAULT NULL,
  `TituloObs` varchar(100) DEFAULT NULL,
  `DescripcionObs` varchar(500) DEFAULT NULL,
  `fk_ficha` int(30) DEFAULT NULL,
  PRIMARY KEY (`CodObs`),
  KEY `Id_ApreFK` (`Id_ApreFK`),
  KEY `ID_FuncFK` (`ID_FuncFK`),
  KEY `Cod_Des_CortFK` (`DescripcionObs`),
  KEY `bitacora_ibfk_6` (`fk_ficha`),
  CONSTRAINT `observaciones_ibfk_1` FOREIGN KEY (`Id_ApreFK`) REFERENCES `aprendiz` (`Id_Apre`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `observaciones_ibfk_2` FOREIGN KEY (`ID_FuncFK`) REFERENCES `funcionario` (`ID_Func`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `observaciones_ibfk_6` FOREIGN KEY (`fk_ficha`) REFERENCES `ficha` (`Cod_Ficha`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `observaciones` */

insert  into `observaciones`(`CodObs`,`FechaObs`,`ID_FuncFK`,`Id_ApreFK`,`TituloObs`,`DescripcionObs`,`fk_ficha`) values (4,'2023-07-17','1129506976','789','ObservaciÃ³n de trabajo en equipo','Durante el desarrollo de las actividades, se ha identificado que el aprendiz presenta dificultades en el trabajo en equipo. Es necesario fortalecer la habilidad de colaboraciÃ³n y comunicaciÃ³n con sus compaÃ±eros para alcanzar los objetivos de manera efectiva y lograr un ambiente de trabajo armonioso. Se recomienda que el aprendiz participe activamente en actividades grupales y busque oportunidades para mejorar su capacidad de trabajar en equipo.',1234);

/*Table structure for table `programas` */

DROP TABLE IF EXISTS `programas`;

CREATE TABLE `programas` (
  `Cod_Pro` int(40) NOT NULL,
  `Pro_Desc` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Cod_Pro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `programas` */

insert  into `programas`(`Cod_Pro`,`Pro_Desc`) values (101,'AnÃ¡lisis y Desarrollo de Sistemas de InformaciÃ³n'),(102,'GestiÃ³n de Redes de Datos'),(103,'InstalaciÃ³n de Redes de Computadores'),(104,'DiseÃ±o e IntegraciÃ³n de Multimedia'),(105,'Mantenimiento de Equipos de Computo'),(106,'ProgramaciÃ³n de Software ');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
