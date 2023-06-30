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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `acta_compromiso` */

insert  into `acta_compromiso`(`codActa`,`actaFecha`,`actaIdAprendiz`,`actaFicha`,`actaFuncionario`,`actaMotivoRemision`,`actaDescargoAprendiz`,`actaCompromisos`,`actaRecomendaciones`) values (7,'2023-06-22','123',2452524,'1001946423','Bajo rendimiento académico','x','x','x');

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

insert  into `funcionario`(`ID_Func`,`Fun_Tip_Doc`,`Fun_Nom`,`Fun_Ape`,`Fun_Tel`,`Fun_Correo`,`Fun_Pswd`,`Fun_Direcc`,`Fun_Rol`,`Fun_Img`) values ('1001946423','Cedula de Ciudadania','BRAYAN','LOPEZ','3022974095','brayanlpz1525@gmail.com','b761d6d20bfb9ab4adf9e9ab7cc5a4de1c4fae34','Calle 46b #16-107','ADMIN','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0H\0\0H\0\0\0�v�d\0\0\0sBIT��O�\0\0\0_zTXtRaw profile type APP1\0\0��JO�K-�LV((�O��I�R\0c.KK�D04006�F@�9T(�\0������Y��)��\0O�h-،\0\0�IDATx���Yl���co{׻�8>��^;��1��4�Rq�@\nF��F��FJ�*�}*}hUU%EEUb\"DI�Q�8�`csCl�k{���3�3�5�<c�b�����<f~�l��1��ڻw�\0�B\'�\00�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0b�]�y�Ct:� ?(�0�N����Z�lB��!B,�F�F��f�Y�֬�,��rrr~PrxxX�����`0811�q�^�gYV<\0�No�$	��q��ﯬ�t�\\eee��d2�L�����233�)��/IR �D\"�H���ݹs��͛�n����4àOkvZ�$)���h4\Z,X�bŊe˖Y�V�e�z����n�پ�/˗/��b~�������˃����4Ͳ,����{�&���t:�ҥK�.]ZYY���7�?�޽{���W�^�z��N�3\Z�3�#`V��N�$E�Q�����/?������gJ^^^^^^mm���Pcc�g�}�p8�z=Z�t�;=�<o2����6o���Oj�����>��ӎ��H$b04��\0���&�u\05�$�B���~���_߸qcVV��u���Z�|yyy���D?��ԇ�x�����ݻ����j�&�>EEE---4\Z��w*C����y�K���w�s�\\)�6,X�z���ݻG�4���0�NE�(F�ѝ;w�^�:��h4��z�~8����ɍ��l���t:��y=�(��Ν;����G���4&�t�SN4\Z�i��7߬�����^�������kxxx||<���D\"ߗ1�Lr�322�v{NN�+++�N����h\\�n����׿��F��fZ����|ii���󢢢i~$�x�ޛ7o�<y�Ν;z�^^:��:��;�������F�@YY�ƍ].���4�L������===)2X\0��B8��������p8�S>�utt��������~���8��A�Ù������<�LUU�N�C������7::�u,��N<������ϟN����O?�tpp��y��0S�X�$������͛7����|�����;���h�Sf�S��/�����N�Guuu9r��ѣ�`pƗsS%7�>�����w��u:����ꟲZ�K�,����x<�\"�\n��!\n���2?�X������^oo��j���ME�4m4\Z�������fsaa�zb-Kee�\'�|�y�T�`\'� ��������K>x�`���gΜ��t��B�,��Z[[{{{�����X,������vyg�65�I!��$�K��g?���V/��ӳo�>��c2�4^BQ�^��w����_���p8T*�p8G[[fI.;�B��/��y�f�bׯ_��?��q\\������˅�����*%������0��Dv�D����ҷ�~[�eE�������$}R���h4z���^�h�\"�j���7nx�ޤ�y��@(9DQ4��;v�P�655}��6�-E��4M�l�?����I�EQ;v�0�͢(jV7xZ��D\"�ׯ��U�\\�r���ߗ\'�5�ؔ(�b���3??��\'�P*����o޼�զI�Bߘ�CE�ӹi�&�2}}}���K��e��9�۷o___�J�M�69�N4�I�r_��`||����l6+�z�����nO�T�h���������U*c6������ǵ��R�{C�X,VUU��T����\'O���Ns�v��,���{��I��ʸ��X,�e�@�`kL�$Q7n�h�X�ʴ���:u*-6T��S�N���*�X,7nEQ�R�A�5%¢E�***�\n���z�Œ�;(��X,����@@�LEEŢE��ff��)��jjjT�\r>y�d8N١��h���\'O�T*����v�>�4�6_ 2���^�iOOOcc��9H&�������G��s�=\n��� �ډ�bn�[it-B[[���x\Z5�2�������ڔ��6��駟�����;��B�P]]��ӑ�������3{��hlhhQ*PWW�F[K�FDQ���S�>���,IRZ̙=��(I�����\n������a��fl�D�Q�˥�����i7�~��d:}���S���r��Ѩ�U��l���XUU��7n��4m�eE��7nL�T�x-�fl-H�d��T��������C�ӎ\\y��TVV��f�Jm �Z�w}(~411���C��e�azzz&&&&}�������F[��`���I�z����~2���߯�-�n���v[�DQT� ��������G�4=22��uB?�p8lm���)-�b1�~�$I�o�& �2��o߾�4�.,,�2m�}Jq� (]y\'���p��М>�e������9�N����A���(0��1388���v8�6l-��tԾ$I>�/�_t=��(�ϧ��Z��6l-�<���T����Q��=::����\\��V`!�\ZQ��K����I\n���W�e5�Ϝ�`� ����61�d*�1#�ԇ`k�eY��?�#��\n\n�Y�%�bAA��z��Oؿb)��˲*���L&bf�$IR�U>22�`k���0�`P�QII	1owA())QZo�Y���l-�,��x&}D���y�H�ϛ7O�+��x�bk���0J]q����ˉ9v����r�`�����������Zl�Ng�۝N\'�lI�T���t���![�h���|J�m6[~~>�lA���m6ۤO#�H���Fl-���w�ޤO�͛W\\\\LF�����͛7��{��y�^bv��8���@Ӵ��U�WVVjY�٣�x<[3�+kD����+�~˗H��0[�$���I�\n���Of������֦���b��Y�&��4�<�f�\Z����k��Ƶ��l�0��եt��N�[�vm�6�rs�v�Z�^����S�A����뛚��������4�\'\Z���<�MMMX��%[;F��رcJOM&ӆ\rX�M�F[�$�e7lؠ�J�رciz�h�B��CQ��l�t�R����e˖�]��F�-[V^^�T�ҥKf�o���`k�d2���)M���׏���Q�-I�������&�DQlkkK�D���)�^�����ѡT���dϞ=*�i��H$�gϞ���mmmz�^�Z��)��8��x�J{�ڵ.�+-��p�r�T&ã��ŋ9�C?\\c��L&ӗ_~��߯T�n�o߾�f���rQm6����Uv}������k�N��Z__������]�v��lK�v�ڥ2g&�b}}��M	0��$`Y������E�̳�>�e��3��H>}˖-�>��J������~��N\n���&�u��(�\Z���T����***X��q�˲�3F�$)�l۶��W_U��144����G\"��H\n�ѓC���ԩS*eX�]�n�ʕ+C��f�R(Z�r�u�ԛ�S�N�t�`�A��4z���o�-(((,,T*c0*++%Ijoo7�L�m��W֯��J]]]FF�J����G�bt�Dv2�,���^YY����T�`0TUU��䴵�Q���� �h�����M���vuu�߿_�ק��aB�����X,v�����j�٬R���$??��o�Mʙ��H$++�7�x��������:4::�9��B��L>�����G?��zɂ��%K��4�M�-B$Y�t�~�����)�����s�֙%��|�ܽ{wll���Z}�)33�瞳�l���^��a����J��q\\~~�֭[w�ޝ���^����������h�N	z����7��\\�)�����%K����u:݌�[�H$�nݺs�Χ�zjʏ�b�cǎ�;w.�3| C�S�<+���u�޽�˗OY�j��\\�5k��=�P(��3�$�</I��n���z����i�l8p�믿6Hu�@�SEQ,�vwwOLL���Oy,EQV��������),,�Z�<�����$I�h4X��+V���K?��OV�Xa�Z��?���G�9w��bA�S�w��d���H$�v�w�ޭt@�ҧFGG��ۛ�����M&˲r3�p�^EI�A��b�H�n�?��n����(;;;�\r###��߱����C�S��V��7���t&�\'566600����������T�i[�V�Ñ��[TT����؏�u������� �MAv����۶m{��S�=�D\"�ϟ�裏A���Ԅ1v��iZ^Iz����/������:t��i�a�<e!ة��(�^?44t��qQ����2I�$��w�����/>���Rvw�4I�(�b�����K��������A����R�t�;E���FY�]�x�+����O\Z�Ƥ7�<�����gϞ;w.�4�1vjB�S�$I�Ph����W�^�dɂ�]�I�+W�466޸q�d2a��j���گ-[�,_�\\e�v��u��G}444d�X�ԁ`�\n��M&See��ݻ�Ng���\'N�?���`Ui�@��O>�dժU6lX�h���\'&&��0���pXޤ���p�`0�L&�ٜ�����@GGG���놆ym�c���1!�I�q� �����U��,!�����{��������a���\'&&DQ����Aa��FӴ�b�Z�6���p8�����������\\Qo߾�������Os�9�;iDQ�8�g�ٱc�O<����p0�s�΅:::��@)��_�Q����\r���L�Q��$�4�x����Z��e��-K��� \'N�8u��q8q!Y�����W_}u����%��������_�~���)���f��;#-��?��8Q����.]ZZZZ^^oD�_��������ܤ@����y�e�~�m��W\Z;::\Z���<�0�z`��p��322.\\�v�W�X׿A���?:;;��S{��8�[�d��ݻ�ϟ?͏�|�k׮;v���ddd�,��Y��$�b1��8�۶m۪U�\n\n\n��f����\'N��~\\\0��Zq�H�4>>�v��={�L�V8��o�9r��y�kV�9��<h7f����S�=�f�������������?��l6#ۚA�5\"�vڴiӞ={�3�E�������_}�U0L�M�Qo޼y�ʕ���L��a���������N���[�xu�Ν[�l�N>�{｣G�F\"���Ra�����͛7/\\��p8�����Z+((����~�z(J�_�T���$idd��^��<���\'�|������Ⱥ�Y\"�o�y��ŋ����h�����)�{��]r[�k׮�_~y�o���������X,�o�i�ff``�ҥK�����������v�oܸ���Y�`�\"y>y����ׯ��{�����;����4���Hy�oll��t����n��QZZz��y��V՜s�Ykjjv��5e��ٳE1-\Z�G�4m0�]�6::�h�\"�CڜN����Ϝ9�y�ك`���kkk�z�-��78p��?�Z�i�P?Ju�8q��v;���N���իq�Ӈ`ϊX,V\\\\��_�B�B��w���.�l62��,�R���^VV�r7�N�+((����\n6Ҹ�HY�+��^{M}m���������7ߤ�	�3�eY��������ի*ŌF�;�v{,ӬnsZ�&IR8~�7�y��b^��O�S___��>#h���b�}�Yuuunn�R1�^_]]���$o�Ѳ��C�=�8�[�v��e��p�СC^���T�h����9t�P�J����m۶E����J{&	�PPP�n�:�qc(:r�ȵk�N��a����������*�^x��˗�<�Y��{&������|�2�~��_|1G�bYv||���s(R*c0�m�&\Z��`��㪫��n�J����>� �{�ґ^�ihhP�mnn�;=�	�ɳ�!��n��o�rnYgg�����9�z������t���(����\Z\Z��вn�B�=3AX�~�ʍ������DQ��l>r�HWW�R���̗^z�at�gĜ���ArrrV�\\��744tvvΑ���h��ȑ#*�u�ݥ��x�=#�7o�l�ٔ\n\\�|�ԩSf�Y�Z�\Z�^���}��q�E�ر#hY+R!؏KE�ӹ|�r�gϞM�+���h4655\r*(++����F�Z֊H��\n�?��OUN;�t��իW�t���b���|��*��nݺ����Xb�XUUUuu�R�������9�	��h��On߾�T���hŊh���XAx��U�(~���ؙ���ٟ}���S�Ųd����h?;q�$Y,��K�*�x�\"����e���T�~���fee!؏�N\\,+//W��Zŋ/�������(��y���9�LZ�h4���b����w.q~�ݺuJOGGG/\\�0g_\\�3����G���U���ǵ�a���XTTTVV�T������h�\'%7�gϞU*��O�\\��U��]�8�{�T\Z�\'Ob2\\��hlhhP��e˖)=�)!؉��^�p�R�|�֭��VAQ��hlmmU*P\\\\����)�����Q���Tn�?���7c��d�t��Ӽ���\n��e���`\'B>�Ti/���{�.�N�a�������I��l���<;1v\"$I*((Pz���;44�~��h��z�*s�%%%*�OA�|�E���|�G� ܹs��y�6�Q���[�W�r�1�N\0�7�F�L�4\nuwwc��4�����.��＼<�ł`\'\0��� .�K�i$�u���D�tWWW8V*���� �q�F�UUUJO���;����&���٩T`ѢEX��\0;n� ��mv��M�����`P	vAA�p&\0����*�;::p�\\\\X����VzZZZ��� ��$);;[��=00�]q�i���Sy:o�<d;^�\n�G���l��1��\'I��2����>b&\'\'��B��#��y�:����G?<�4�G�-v����g�*�wll�u(�R�܋e���l;^v|$I2��J�豱1�@Ӵ��Sz��������$�d2)�K)���c&##-v����/���=11��x(�R�j�����l��/;>���h�N\0EQ*�P�O\0�7�yo,O�ʟ/\Z�?Y|,˙3gnݺ�訏a�����J�|���Ç�r�4=44d�X�R��E�ݻ7�uH3� (mK����O�(�J�q�e��Z�1��ٌ�i\Z�gf�\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��ͪאBJ��\0\0\0\0IEND�B`�'),('1129506976','Cedula de Ciudadania','ASHLEY','DEFORT','3215795146','ashley@gmail.com','7c4a8d09ca3762af61e59520943dc26494f8941b','Calle 59C 22E-10','FUNC',NULL),('123','Tarjeta de Identidad','KENER','ROMERO','123','kener@gmail.com','93b16f06785d1f7773d056c1b7501f39abf371f1','calle 42#31-69','ADMIN','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0H\0\0H\0\0\0�v�d\0\0\0sBIT��O�\0\0\0_zTXtRaw profile type APP1\0\0��JO�K-�LV((�O��I�R\0c.KK�D04006�F@�9T(�\0������Y��)��\0O�h-،\0\0�IDATx���Yl���co{׻�8>��^;��1��4�Rq�@\nF��F��FJ�*�}*}hUU%EEUb\"DI�Q�8�`csCl�k{���3�3�5�<c�b�����<f~�l��1��ڻw�\0�B\'�\00�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0b�]�y�Ct:� ?(�0�N����Z�lB��!B,�F�F��f�Y�֬�,��rrr~PrxxX�����`0811�q�^�gYV<\0�No�$	��q��ﯬ�t�\\eee��d2�L�����233�)��/IR �D\"�H���ݹs��͛�n����4àOkvZ�$)���h4\Z,X�bŊe˖Y�V�e�z����n�پ�/˗/��b~�������˃����4Ͳ,����{�&���t:�ҥK�.]ZYY���7�?�޽{���W�^�z��N�3\Z�3�#`V��N�$E�Q�����/?������gJ^^^^^^mm���Pcc�g�}�p8�z=Z�t�;=�<o2����6o���Oj�����>��ӎ��H$b04��\0���&�u\05�$�B���~���_߸qcVV��u���Z�|yyy���D?��ԇ�x�����ݻ����j�&�>EEE---4\Z��w*C����y�K���w�s�\\)�6,X�z���ݻG�4���0�NE�(F�ѝ;w�^�:��h4��z�~8����ɍ��l���t:��y=�(��Ν;����G���4&�t�SN4\Z�i��7߬�����^�������kxxx||<���D\"ߗ1�Lr�322�v{NN�+++�N����h\\�n����׿��F��fZ����|ii���󢢢i~$�x�ޛ7o�<y�Ν;z�^^:��:��;�������F�@YY�ƍ].���4�L������===)2X\0��B8��������p8�S>�utt��������~���8��A�Ù������<�LUU�N�C������7::�u,��N<������ϟN����O?�tpp��y��0S�X�$������͛7����|�����;���h�Sf�S��/�����N�Guuu9r��ѣ�`pƗsS%7�>�����w��u:����ꟲZ�K�,����x<�\"�\n��!\n���2?�X������^oo��j���ME�4m4\Z�������fsaa�zb-Kee�\'�|�y�T�`\'� ��������K>x�`���gΜ��t��B�,��Z[[{{{�����X,������vyg�65�I!��$�K��g?���V/��ӳo�>��c2�4^BQ�^��w����_���p8T*�p8G[[fI.;�B��/��y�f�bׯ_��?��q\\������˅�����*%������0��Dv�D����ҷ�~[�eE�������$}R���h4z���^�h�\"�j���7nx�ޤ�y��@(9DQ4��;v�P�655}��6�-E��4M�l�?����I�EQ;v�0�͢(jV7xZ��D\"�ׯ��U�\\�r���ߗ\'�5�ؔ(�b���3??��\'�P*����o޼�զI�Bߘ�CE�ӹi�&�2}}}���K��e��9�۷o___�J�M�69�N4�I�r_��`||����l6+�z�����nO�T�h���������U*c6������ǵ��R�{C�X,VUU��T����\'O���Ns�v��,���{��I��ʸ��X,�e�@�`kL�$Q7n�h�X�ʴ���:u*-6T��S�N���*�X,7nEQ�R�A�5%¢E�***�\n���z�Œ�;(��X,����@@�LEEŢE��ff��)��jjjT�\r>y�d8N١��h���\'O�T*����v�>�4�6_ 2���^�iOOOcc��9H&�������G��s�=\n��� �ډ�bn�[it-B[[���x\Z5�2�������ڔ��6��駟�����;��B�P]]��ӑ�������3{��hlhhQ*PWW�F[K�FDQ���S�>���,IRZ̙=��(I�����\n������a��fl�D�Q�˥�����i7�~��d:}���S���r��Ѩ�U��l���XUU��7n��4m�eE��7nL�T�x-�fl-H�d��T��������C�ӎ\\y��TVV��f�Jm �Z�w}(~411���C��e�azzz&&&&}�������F[��`���I�z����~2���߯�-�n���v[�DQT� ��������G�4=22��uB?�p8lm���)-�b1�~�$I�o�& �2��o߾�4�.,,�2m�}Jq� (]y\'���p��М>�e������9�N����A���(0��1388���v8�6l-��tԾ$I>�/�_t=��(�ϧ��Z��6l-�<���T����Q��=::����\\��V`!�\ZQ��K����I\n���W�e5�Ϝ�`� ����61�d*�1#�ԇ`k�eY��?�#��\n\n�Y�%�bAA��z��Oؿb)��˲*���L&bf�$IR�U>22�`k���0�`P�QII	1owA())QZo�Y���l-�,��x&}D���y�H�ϛ7O�+��x�bk���0J]q����ˉ9v����r�`�����������Zl�Ng�۝N\'�lI�T���t���![�h���|J�m6[~~>�lA���m6ۤO#�H���Fl-���w�ޤO�͛W\\\\LF�����͛7��{��y�^bv��8���@Ӵ��U�WVVjY�٣�x<[3�+kD����+�~˗H��0[�$���I�\n���Of������֦���b��Y�&��4�<�f�\Z����k��Ƶ��l�0��եt��N�[�vm�6�rs�v�Z�^����S�A����뛚��������4�\'\Z���<�MMMX��%[;F��رcJOM&ӆ\rX�M�F[�$�e7lؠ�J�رciz�h�B��CQ��l�t�R����e˖�]��F�-[V^^�T�ҥKf�o���`k�d2���)M���׏���Q�-I�������&�DQlkkK�D���)�^�����ѡT���dϞ=*�i��H$�gϞ���mmmz�^�Z��)��8��x�J{�ڵ.�+-��p�r�T&ã��ŋ9�C?\\c��L&ӗ_~��߯T�n�o߾�f���rQm6����Uv}������k�N��Z__������]�v��lK�v�ڥ2g&�b}}��M	0��$`Y������E�̳�>�e��3��H>}˖-�>��J������~��N\n���&�u��(�\Z���T����***X��q�˲�3F�$)�l۶��W_U��144����G\"��H\n�ѓC���ԩS*eX�]�n�ʕ+C��f�R(Z�r�u�ԛ�S�N�t�`�A��4z���o�-(((,,T*c0*++%Ijoo7�L�m��W֯��J]]]FF�J����G�bt�Dv2�,���^YY����T�`0TUU��䴵�Q���� �h�����M���vuu�߿_�ק��aB�����X,v�����j�٬R���$??��o�Mʙ��H$++�7�x��������:4::�9��B��L>�����G?��zɂ��%K��4�M�-B$Y�t�~�����)�����s�֙%��|�ܽ{wll���Z}�)33�瞳�l���^��a����J��q\\~~�֭[w�ޝ���^����������h�N	z����7��\\�)�����%K����u:݌�[�H$�nݺs�Χ�zjʏ�b�cǎ�;w.�3| C�S�<+���u�޽�˗OY�j��\\�5k��=�P(��3�$�</I��n���z����i�l8p�믿6Hu�@�SEQ,�vwwOLL���Oy,EQV��������),,�Z�<�����$I�h4X��+V���K?��OV�Xa�Z��?���G�9w��bA�S�w��d���H$�v�w�ޭt@�ҧFGG��ۛ�����M&˲r3�p�^EI�A��b�H�n�?��n����(;;;�\r###��߱����C�S��V��7���t&�\'566600����������T�i[�V�Ñ��[TT����؏�u������� �MAv����۶m{��S�=�D\"�ϟ�裏A���Ԅ1v��iZ^Iz����/������:t��i�a�<e!ة��(�^?44t��qQ����2I�$��w�����/>���Rvw�4I�(�b�����K��������A����R�t�;E���FY�]�x�+����O\Z�Ƥ7�<�����gϞ;w.�4�1vjB�S�$I�Ph����W�^�dɂ�]�I�+W�466޸q�d2a��j���گ-[�,_�\\e�v��u��G}444d�X�ԁ`�\n��M&See��ݻ�Ng���\'N�?���`Ui�@��O>�dժU6lX�h���\'&&��0���pXޤ���p�`0�L&�ٜ�����@GGG���놆ym�c���1!�I�q� �����U��,!�����{��������a���\'&&DQ����Aa��FӴ�b�Z�6���p8�����������\\Qo߾�������Os�9�;iDQ�8�g�ٱc�O<����p0�s�΅:::��@)��_�Q����\r���L�Q��$�4�x����Z��e��-K��� \'N�8u��q8q!Y�����W_}u����%��������_�~���)���f��;#-��?��8Q����.]ZZZZ^^oD�_��������ܤ@����y�e�~�m��W\Z;::\Z���<�0�z`��p��322.\\�v�W�X׿A���?:;;��S{��8�[�d��ݻ�ϟ?͏�|�k׮;v���ddd�,��Y��$�b1��8�۶m۪U�\n\n\n��f����\'N��~\\\0��Zq�H�4>>�v��={�L�V8��o�9r��y�kV�9��<h7f����S�=�f�������������?��l6#ۚA�5\"�vڴiӞ={�3�E�������_}�U0L�M�Qo޼y�ʕ���L��a���������N���[�xu�Ν[�l�N>�{｣G�F\"���Ra�����͛7/\\��p8�����Z+((����~�z(J�_�T���$idd��^��<���\'�|������Ⱥ�Y\"�o�y��ŋ����h�����)�{��]r[�k׮�_~y�o���������X,�o�i�ff``�ҥK�����������v�oܸ���Y�`�\"y>y����ׯ��{�����;����4���Hy�oll��t����n��QZZz��y��V՜s�Ykjjv��5e��ٳE1-\Z�G�4m0�]�6::�h�\"�CڜN����Ϝ9�y�ك`���kkk�z�-��78p��?�Z�i�P?Ju�8q��v;���N���իq�Ӈ`ϊX,V\\\\��_�B�B��w���.�l62��,�R���^VV�r7�N�+((����\n6Ҹ�HY�+��^{M}m���������7ߤ�	�3�eY��������ի*ŌF�;�v{,ӬnsZ�&IR8~�7�y��b^��O�S___��>#h���b�}�Yuuunn�R1�^_]]���$o�Ѳ��C�=�8�[�v��e��p�СC^���T�h����9t�P�J����m۶E����J{&	�PPP�n�:�qc(:r�ȵk�N��a����������*�^x��˗�<�Y��{&������|�2�~��_|1G�bYv||���s(R*c0�m�&\Z��`��㪫��n�J����>� �{�ґ^�ihhP�mnn�;=�	�ɳ�!��n��o�rnYgg�����9�z������t���(����\Z\Z��вn�B�=3AX�~�ʍ������DQ��l>r�HWW�R���̗^z�at�gĜ���ArrrV�\\��744tvvΑ���h��ȑ#*�u�ݥ��x�=#�7o�l�ٔ\n\\�|�ԩSf�Y�Z�\Z�^���}��q�E�ر#hY+R!؏KE�ӹ|�r�gϞM�+���h4655\r*(++����F�Z֊H��\n�?��OUN;�t��իW�t���b���|��*��nݺ����Xb�XUUUuu�R�������9�	��h��On߾�T���hŊh���XAx��U�(~���ؙ���ٟ}���S�Ųd����h?;q�$Y,��K�*�x�\"����e���T�~���fee!؏�N\\,+//W��Zŋ/�������(��y���9�LZ�h4���b����w.q~�ݺuJOGGG/\\�0g_\\�3����G���U���ǵ�a���XTTTVV�T������h�\'%7�gϞU*��O�\\��U��]�8�{�T\Z�\'Ob2\\��hlhhP��e˖)=�)!؉��^�p�R�|�֭��VAQ��hlmmU*P\\\\����)�����Q���Tn�?���7c��d�t��Ӽ���\n��e���`\'B>�Ti/���{�.�N�a�������I��l���<;1v\"$I*((Pz���;44�~��h��z�*s�%%%*�OA�|�E���|�G� ܹs��y�6�Q���[�W�r�1�N\0�7�F�L�4\nuwwc��4�����.��＼<�ł`\'\0��� .�K�i$�u���D�tWWW8V*���� �q�F�UUUJO���;����&���٩T`ѢEX��\0;n� ��mv��M�����`P	vAA�p&\0����*�;::p�\\\\X����VzZZZ��� ��$);;[��=00�]q�i���Sy:o�<d;^�\n�G���l��1��\'I��2����>b&\'\'��B��#��y�:����G?<�4�G�-v����g�*�wll�u(�R�܋e���l;^v|$I2��J�豱1�@Ӵ��Sz��������$�d2)�K)���c&##-v����/���=11��x(�R�j�����l��/;>���h�N\0EQ*�P�O\0�7�yo,O�ʟ/\Z�?Y|,˙3gnݺ�訏a�����J�|���Ç�r�4=44d�X�R��E�ݻ7�uH3� (mK����O�(�J�q�e��Z�1��ٌ�i\Z�gf�\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��ͪאBJ��\0\0\0\0IEND�B`�'),('1234','Cedula de Ciudadania','GERMAN','GOENAGA','123','german@gmail.com','da91388c72d3e31da19dcd85c97374197748485d','calle 42#31-69','ADMIN','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0H\0\0H\0\0\0�v�d\0\0\0sBIT��O�\0\0\0_zTXtRaw profile type APP1\0\0��JO�K-�LV((�O��I�R\0c.KK�D04006�F@�9T(�\0������Y��)��\0O�h-،\0\0�IDATx���Yl���co{׻�8>��^;��1��4�Rq�@\nF��F��FJ�*�}*}hUU%EEUb\"DI�Q�8�`csCl�k{���3�3�5�<c�b�����<f~�l��1��ڻw�\0�B\'�\00�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0b�]�y�Ct:� ?(�0�N����Z�lB��!B,�F�F��f�Y�֬�,��rrr~PrxxX�����`0811�q�^�gYV<\0�No�$	��q��ﯬ�t�\\eee��d2�L�����233�)��/IR �D\"�H���ݹs��͛�n����4àOkvZ�$)���h4\Z,X�bŊe˖Y�V�e�z����n�پ�/˗/��b~�������˃����4Ͳ,����{�&���t:�ҥK�.]ZYY���7�?�޽{���W�^�z��N�3\Z�3�#`V��N�$E�Q�����/?������gJ^^^^^^mm���Pcc�g�}�p8�z=Z�t�;=�<o2����6o���Oj�����>��ӎ��H$b04��\0���&�u\05�$�B���~���_߸qcVV��u���Z�|yyy���D?��ԇ�x�����ݻ����j�&�>EEE---4\Z��w*C����y�K���w�s�\\)�6,X�z���ݻG�4���0�NE�(F�ѝ;w�^�:��h4��z�~8����ɍ��l���t:��y=�(��Ν;����G���4&�t�SN4\Z�i��7߬�����^�������kxxx||<���D\"ߗ1�Lr�322�v{NN�+++�N����h\\�n����׿��F��fZ����|ii���󢢢i~$�x�ޛ7o�<y�Ν;z�^^:��:��;�������F�@YY�ƍ].���4�L������===)2X\0��B8��������p8�S>�utt��������~���8��A�Ù������<�LUU�N�C������7::�u,��N<������ϟN����O?�tpp��y��0S�X�$������͛7����|�����;���h�Sf�S��/�����N�Guuu9r��ѣ�`pƗsS%7�>�����w��u:����ꟲZ�K�,����x<�\"�\n��!\n���2?�X������^oo��j���ME�4m4\Z�������fsaa�zb-Kee�\'�|�y�T�`\'� ��������K>x�`���gΜ��t��B�,��Z[[{{{�����X,������vyg�65�I!��$�K��g?���V/��ӳo�>��c2�4^BQ�^��w����_���p8T*�p8G[[fI.;�B��/��y�f�bׯ_��?��q\\������˅�����*%������0��Dv�D����ҷ�~[�eE�������$}R���h4z���^�h�\"�j���7nx�ޤ�y��@(9DQ4��;v�P�655}��6�-E��4M�l�?����I�EQ;v�0�͢(jV7xZ��D\"�ׯ��U�\\�r���ߗ\'�5�ؔ(�b���3??��\'�P*����o޼�զI�Bߘ�CE�ӹi�&�2}}}���K��e��9�۷o___�J�M�69�N4�I�r_��`||����l6+�z�����nO�T�h���������U*c6������ǵ��R�{C�X,VUU��T����\'O���Ns�v��,���{��I��ʸ��X,�e�@�`kL�$Q7n�h�X�ʴ���:u*-6T��S�N���*�X,7nEQ�R�A�5%¢E�***�\n���z�Œ�;(��X,����@@�LEEŢE��ff��)��jjjT�\r>y�d8N١��h���\'O�T*����v�>�4�6_ 2���^�iOOOcc��9H&�������G��s�=\n��� �ډ�bn�[it-B[[���x\Z5�2�������ڔ��6��駟�����;��B�P]]��ӑ�������3{��hlhhQ*PWW�F[K�FDQ���S�>���,IRZ̙=��(I�����\n������a��fl�D�Q�˥�����i7�~��d:}���S���r��Ѩ�U��l���XUU��7n��4m�eE��7nL�T�x-�fl-H�d��T��������C�ӎ\\y��TVV��f�Jm �Z�w}(~411���C��e�azzz&&&&}�������F[��`���I�z����~2���߯�-�n���v[�DQT� ��������G�4=22��uB?�p8lm���)-�b1�~�$I�o�& �2��o߾�4�.,,�2m�}Jq� (]y\'���p��М>�e������9�N����A���(0��1388���v8�6l-��tԾ$I>�/�_t=��(�ϧ��Z��6l-�<���T����Q��=::����\\��V`!�\ZQ��K����I\n���W�e5�Ϝ�`� ����61�d*�1#�ԇ`k�eY��?�#��\n\n�Y�%�bAA��z��Oؿb)��˲*���L&bf�$IR�U>22�`k���0�`P�QII	1owA())QZo�Y���l-�,��x&}D���y�H�ϛ7O�+��x�bk���0J]q����ˉ9v����r�`�����������Zl�Ng�۝N\'�lI�T���t���![�h���|J�m6[~~>�lA���m6ۤO#�H���Fl-���w�ޤO�͛W\\\\LF�����͛7��{��y�^bv��8���@Ӵ��U�WVVjY�٣�x<[3�+kD����+�~˗H��0[�$���I�\n���Of������֦���b��Y�&��4�<�f�\Z����k��Ƶ��l�0��եt��N�[�vm�6�rs�v�Z�^����S�A����뛚��������4�\'\Z���<�MMMX��%[;F��رcJOM&ӆ\rX�M�F[�$�e7lؠ�J�رciz�h�B��CQ��l�t�R����e˖�]��F�-[V^^�T�ҥKf�o���`k�d2���)M���׏���Q�-I�������&�DQlkkK�D���)�^�����ѡT���dϞ=*�i��H$�gϞ���mmmz�^�Z��)��8��x�J{�ڵ.�+-��p�r�T&ã��ŋ9�C?\\c��L&ӗ_~��߯T�n�o߾�f���rQm6����Uv}������k�N��Z__������]�v��lK�v�ڥ2g&�b}}��M	0��$`Y������E�̳�>�e��3��H>}˖-�>��J������~��N\n���&�u��(�\Z���T����***X��q�˲�3F�$)�l۶��W_U��144����G\"��H\n�ѓC���ԩS*eX�]�n�ʕ+C��f�R(Z�r�u�ԛ�S�N�t�`�A��4z���o�-(((,,T*c0*++%Ijoo7�L�m��W֯��J]]]FF�J����G�bt�Dv2�,���^YY����T�`0TUU��䴵�Q���� �h�����M���vuu�߿_�ק��aB�����X,v�����j�٬R���$??��o�Mʙ��H$++�7�x��������:4::�9��B��L>�����G?��zɂ��%K��4�M�-B$Y�t�~�����)�����s�֙%��|�ܽ{wll���Z}�)33�瞳�l���^��a����J��q\\~~�֭[w�ޝ���^����������h�N	z����7��\\�)�����%K����u:݌�[�H$�nݺs�Χ�zjʏ�b�cǎ�;w.�3| C�S�<+���u�޽�˗OY�j��\\�5k��=�P(��3�$�</I��n���z����i�l8p�믿6Hu�@�SEQ,�vwwOLL���Oy,EQV��������),,�Z�<�����$I�h4X��+V���K?��OV�Xa�Z��?���G�9w��bA�S�w��d���H$�v�w�ޭt@�ҧFGG��ۛ�����M&˲r3�p�^EI�A��b�H�n�?��n����(;;;�\r###��߱����C�S��V��7���t&�\'566600����������T�i[�V�Ñ��[TT����؏�u������� �MAv����۶m{��S�=�D\"�ϟ�裏A���Ԅ1v��iZ^Iz����/������:t��i�a�<e!ة��(�^?44t��qQ����2I�$��w�����/>���Rvw�4I�(�b�����K��������A����R�t�;E���FY�]�x�+����O\Z�Ƥ7�<�����gϞ;w.�4�1vjB�S�$I�Ph����W�^�dɂ�]�I�+W�466޸q�d2a��j���گ-[�,_�\\e�v��u��G}444d�X�ԁ`�\n��M&See��ݻ�Ng���\'N�?���`Ui�@��O>�dժU6lX�h���\'&&��0���pXޤ���p�`0�L&�ٜ�����@GGG���놆ym�c���1!�I�q� �����U��,!�����{��������a���\'&&DQ����Aa��FӴ�b�Z�6���p8�����������\\Qo߾�������Os�9�;iDQ�8�g�ٱc�O<����p0�s�΅:::��@)��_�Q����\r���L�Q��$�4�x����Z��e��-K��� \'N�8u��q8q!Y�����W_}u����%��������_�~���)���f��;#-��?��8Q����.]ZZZZ^^oD�_��������ܤ@����y�e�~�m��W\Z;::\Z���<�0�z`��p��322.\\�v�W�X׿A���?:;;��S{��8�[�d��ݻ�ϟ?͏�|�k׮;v���ddd�,��Y��$�b1��8�۶m۪U�\n\n\n��f����\'N��~\\\0��Zq�H�4>>�v��={�L�V8��o�9r��y�kV�9��<h7f����S�=�f�������������?��l6#ۚA�5\"�vڴiӞ={�3�E�������_}�U0L�M�Qo޼y�ʕ���L��a���������N���[�xu�Ν[�l�N>�{｣G�F\"���Ra�����͛7/\\��p8�����Z+((����~�z(J�_�T���$idd��^��<���\'�|������Ⱥ�Y\"�o�y��ŋ����h�����)�{��]r[�k׮�_~y�o���������X,�o�i�ff``�ҥK�����������v�oܸ���Y�`�\"y>y����ׯ��{�����;����4���Hy�oll��t����n��QZZz��y��V՜s�Ykjjv��5e��ٳE1-\Z�G�4m0�]�6::�h�\"�CڜN����Ϝ9�y�ك`���kkk�z�-��78p��?�Z�i�P?Ju�8q��v;���N���իq�Ӈ`ϊX,V\\\\��_�B�B��w���.�l62��,�R���^VV�r7�N�+((����\n6Ҹ�HY�+��^{M}m���������7ߤ�	�3�eY��������ի*ŌF�;�v{,ӬnsZ�&IR8~�7�y��b^��O�S___��>#h���b�}�Yuuunn�R1�^_]]���$o�Ѳ��C�=�8�[�v��e��p�СC^���T�h����9t�P�J����m۶E����J{&	�PPP�n�:�qc(:r�ȵk�N��a����������*�^x��˗�<�Y��{&������|�2�~��_|1G�bYv||���s(R*c0�m�&\Z��`��㪫��n�J����>� �{�ґ^�ihhP�mnn�;=�	�ɳ�!��n��o�rnYgg�����9�z������t���(����\Z\Z��вn�B�=3AX�~�ʍ������DQ��l>r�HWW�R���̗^z�at�gĜ���ArrrV�\\��744tvvΑ���h��ȑ#*�u�ݥ��x�=#�7o�l�ٔ\n\\�|�ԩSf�Y�Z�\Z�^���}��q�E�ر#hY+R!؏KE�ӹ|�r�gϞM�+���h4655\r*(++����F�Z֊H��\n�?��OUN;�t��իW�t���b���|��*��nݺ����Xb�XUUUuu�R�������9�	��h��On߾�T���hŊh���XAx��U�(~���ؙ���ٟ}���S�Ųd����h?;q�$Y,��K�*�x�\"����e���T�~���fee!؏�N\\,+//W��Zŋ/�������(��y���9�LZ�h4���b����w.q~�ݺuJOGGG/\\�0g_\\�3����G���U���ǵ�a���XTTTVV�T������h�\'%7�gϞU*��O�\\��U��]�8�{�T\Z�\'Ob2\\��hlhhP��e˖)=�)!؉��^�p�R�|�֭��VAQ��hlmmU*P\\\\����)�����Q���Tn�?���7c��d�t��Ӽ���\n��e���`\'B>�Ti/���{�.�N�a�������I��l���<;1v\"$I*((Pz���;44�~��h��z�*s�%%%*�OA�|�E���|�G� ܹs��y�6�Q���[�W�r�1�N\0�7�F�L�4\nuwwc��4�����.��＼<�ł`\'\0��� .�K�i$�u���D�tWWW8V*���� �q�F�UUUJO���;����&���٩T`ѢEX��\0;n� ��mv��M�����`P	vAA�p&\0����*�;::p�\\\\X����VzZZZ��� ��$);;[��=00�]q�i���Sy:o�<d;^�\n�G���l��1��\'I��2����>b&\'\'��B��#��y�:����G?<�4�G�-v����g�*�wll�u(�R�܋e���l;^v|$I2��J�豱1�@Ӵ��Sz��������$�d2)�K)���c&##-v����/���=11��x(�R�j�����l��/;>���h�N\0EQ*�P�O\0�7�yo,O�ʟ/\Z�?Y|,˙3gnݺ�訏a�����J�|���Ç�r�4=44d�X�R��E�ݻ7�uH3� (mK����O�(�J�q�e��Z�1��ٌ�i\Z�gf�\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��`� �\r@ �@6\0�l\0!�\0B��ͪאBJ��\0\0\0\0IEND�B`�');

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

insert  into `programas`(`Cod_Pro`,`Pro_Desc`) values (1,'ANALISIS Y DESARROLLO DE SISTEMAS DE INFORMACIÓN'),(2,'ANALISIS Y DESARROLLO DE SOFTWARE'),(4,'GESTION'),(5,'AVIACION'),(190,'SI');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
