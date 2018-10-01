CREATE DATABASE  IF NOT EXISTS `db_smartgames_elimar` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `db_smartgames_elimar`;
-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: localhost    Database: db_smartgames_elimar
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `markers`
--

DROP TABLE IF EXISTS `markers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `markers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `address` varchar(80) NOT NULL,
  `lat` float(10,6) NOT NULL,
  `lng` float(10,6) NOT NULL,
  `type` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `markers`
--

LOCK TABLES `markers` WRITE;
/*!40000 ALTER TABLE `markers` DISABLE KEYS */;
INSERT INTO `markers` VALUES (1,'SmartGames','669  Avenida Piracema, Tamboré',-23.505711,-46.834736,'Games'),(2,'SmartGames 02 Morumbi','1089 Av. Roque Petroni Júnior, Morumbi',-23.623104,-46.698826,'Games');
/*!40000 ALTER TABLE `markers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_categoria`
--

DROP TABLE IF EXISTS `tb_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_categoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nome_UNIQUE` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_categoria`
--

LOCK TABLES `tb_categoria` WRITE;
/*!40000 ALTER TABLE `tb_categoria` DISABLE KEYS */;
INSERT INTO `tb_categoria` VALUES (4,'aventura'),(3,'battle royale'),(6,'corrida'),(1,'esportes'),(5,'estrategia'),(2,'fps'),(7,'luta');
/*!40000 ALTER TABLE `tb_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_distribuidora`
--

DROP TABLE IF EXISTS `tb_distribuidora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_distribuidora` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nome_UNIQUE` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_distribuidora`
--

LOCK TABLES `tb_distribuidora` WRITE;
/*!40000 ALTER TABLE `tb_distribuidora` DISABLE KEYS */;
INSERT INTO `tb_distribuidora` VALUES (3,'Electronic Arts'),(2,'Konami'),(4,'NetherRealm Studios'),(1,'Valve');
/*!40000 ALTER TABLE `tb_distribuidora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_filial`
--

DROP TABLE IF EXISTS `tb_filial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_filial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `endereco` varchar(200) NOT NULL,
  `longitude` varchar(20) NOT NULL,
  `latitude` varchar(20) NOT NULL,
  `dir_imagem` varchar(120) DEFAULT NULL,
  `telefone` varchar(20) NOT NULL,
  `email` varchar(120) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_filial`
--

LOCK TABLES `tb_filial` WRITE;
/*!40000 ALTER TABLE `tb_filial` DISABLE KEYS */;
INSERT INTO `tb_filial` VALUES (1,'SmartGames 01 Tamboré','Av. Piracema n.669, Tamboré','-46.834736','-23.505710','smartgames01.jpg','11 4143-0745','atendimento@smartgames.com'),(2,'SmartGames 02 Morumbi','Av. Roque Petroni Júnior n.1089, Morumbi','-46.698827','-23.623105','smartgames02.jpg','11 4004-1234','morumbishopping@smartgames.com');
/*!40000 ALTER TABLE `tb_filial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_filial_jogo`
--

DROP TABLE IF EXISTS `tb_filial_jogo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_filial_jogo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idFilial` int(11) NOT NULL,
  `idJogo` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idFilial_idx` (`idFilial`),
  KEY `idJogo_idx` (`idJogo`),
  CONSTRAINT `fk_idFilial` FOREIGN KEY (`idFilial`) REFERENCES `tb_filial` (`id`),
  CONSTRAINT `fk_idJogo` FOREIGN KEY (`idJogo`) REFERENCES `tb_jogo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_filial_jogo`
--

LOCK TABLES `tb_filial_jogo` WRITE;
/*!40000 ALTER TABLE `tb_filial_jogo` DISABLE KEYS */;
INSERT INTO `tb_filial_jogo` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,2,1);
/*!40000 ALTER TABLE `tb_filial_jogo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_jogo`
--

DROP TABLE IF EXISTS `tb_jogo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_jogo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(120) NOT NULL,
  `nomeCapa` varchar(100) NOT NULL,
  `desc` text NOT NULL,
  `lancamento` varchar(4) NOT NULL,
  `preco` decimal(6,2) NOT NULL,
  `idCategoria` int(11) NOT NULL,
  `idPlataforma` int(11) NOT NULL,
  `idDistribuidora` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_idCategoria_idx` (`idCategoria`),
  KEY `fk_idPlataforma_idx` (`idPlataforma`),
  KEY `fk_idDistribuidora_idx` (`idDistribuidora`),
  CONSTRAINT `fk_idCategoria` FOREIGN KEY (`idCategoria`) REFERENCES `tb_categoria` (`id`),
  CONSTRAINT `fk_idDistribuidora` FOREIGN KEY (`idDistribuidora`) REFERENCES `tb_distribuidora` (`id`),
  CONSTRAINT `fk_idPlataforma` FOREIGN KEY (`idPlataforma`) REFERENCES `tb_plataforma` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_jogo`
--

LOCK TABLES `tb_jogo` WRITE;
/*!40000 ALTER TABLE `tb_jogo` DISABLE KEYS */;
INSERT INTO `tb_jogo` VALUES (1,'PES 2019','xbox_pes2019.jpg','Para este ano, a grande promessa da Konami é trazer gráficos e jogabilidade mais realistas e fazer os fãs brasileiros irem ao delírio com times do Campeonato Brasileiro licenciados.','2018',159.90,1,2,2),(2,'FIFA 19','pc_fifa19.jpg','FIFA 19 é um videojogo de simulação de futebol desenvolvido pela EA Vancouver e EA Bucharest, como parte da série FIFA da Electronic Arts.','2018',249.99,1,1,3),(3,'FIFA 19','ps4_fifa19.jpg','FIFA 19 é um videojogo de simulação de futebol desenvolvido pela EA Vancouver e EA Bucharest, como parte da série FIFA da Electronic Arts','2018',249.99,1,3,3),(4,'FIFA 19','xbox_fifa19.jpg','FIFA 19 é um videojogo de simulação de futebol desenvolvido pela EA Vancouver e EA Bucharest, como parte da série FIFA da Electronic Arts','2018',249.99,1,2,3),(5,'PES 19','ps4_pes2019.jpg','Para este ano, a grande promessa da Konami é trazer gráficos e jogabilidade mais realistas e fazer os fãs brasileiros irem ao delírio com times do Campeonato Brasileiro licenciados.','2018',159.90,1,3,2),(6,'Mortal Kombat X','xbox_mortalkombatx.jpg','Mortal Kombat X is a fighting video game developed by NetherRealm Studios and published by Warner Bros. Interactive Entertainment.','2015',124.90,7,2,4),(7,'Mortal Kombat X','ps4_mortalkombatx.jpg','Mortal Kombat X is a fighting video game developed by NetherRealm Studios and published by Warner Bros. Interactive Entertainment.','2015',89.90,7,3,4);
/*!40000 ALTER TABLE `tb_jogo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_plataforma`
--

DROP TABLE IF EXISTS `tb_plataforma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_plataforma` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nome_UNIQUE` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_plataforma`
--

LOCK TABLES `tb_plataforma` WRITE;
/*!40000 ALTER TABLE `tb_plataforma` DISABLE KEYS */;
INSERT INTO `tb_plataforma` VALUES (1,'PC'),(3,'PS4'),(2,'XBOX ONE');
/*!40000 ALTER TABLE `tb_plataforma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `view_detalhes_jogo`
--

DROP TABLE IF EXISTS `view_detalhes_jogo`;
/*!50001 DROP VIEW IF EXISTS `view_detalhes_jogo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `view_detalhes_jogo` AS SELECT 
 1 AS `id`,
 1 AS `nome`,
 1 AS `nomeCapa`,
 1 AS `desc`,
 1 AS `lancamento`,
 1 AS `preco`,
 1 AS `idCategoria`,
 1 AS `nomeCategoria`,
 1 AS `idPlataforma`,
 1 AS `nomePlataforma`,
 1 AS `idDistribuidora`,
 1 AS `nomeDistribuidora`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_filial_jogo`
--

DROP TABLE IF EXISTS `view_filial_jogo`;
/*!50001 DROP VIEW IF EXISTS `view_filial_jogo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `view_filial_jogo` AS SELECT 
 1 AS `idFilialJogo`,
 1 AS `idJogo`,
 1 AS `idFilial`,
 1 AS `nomeFilial`,
 1 AS `telefoneFilial`,
 1 AS `emailFilial`,
 1 AS `lat`,
 1 AS `lgt`,
 1 AS `enderecoFilial`,
 1 AS `dir_imagem`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_nome_plataforma`
--

DROP TABLE IF EXISTS `view_nome_plataforma`;
/*!50001 DROP VIEW IF EXISTS `view_nome_plataforma`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `view_nome_plataforma` AS SELECT 
 1 AS `nomeJogo`,
 1 AS `nomePlataforma`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_previewjogo`
--

DROP TABLE IF EXISTS `view_previewjogo`;
/*!50001 DROP VIEW IF EXISTS `view_previewjogo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `view_previewjogo` AS SELECT 
 1 AS `id`,
 1 AS `nomeJogo`,
 1 AS `nomeCapa`,
 1 AS `plataforma`,
 1 AS `categoria`,
 1 AS `idCategoria`,
 1 AS `idPlataforma`,
 1 AS `precoJogo`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `view_detalhes_jogo`
--

/*!50001 DROP VIEW IF EXISTS `view_detalhes_jogo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_detalhes_jogo` AS select `j`.`id` AS `id`,`j`.`nome` AS `nome`,`j`.`nomeCapa` AS `nomeCapa`,`j`.`desc` AS `desc`,`j`.`lancamento` AS `lancamento`,`j`.`preco` AS `preco`,`c`.`id` AS `idCategoria`,`c`.`nome` AS `nomeCategoria`,`p`.`id` AS `idPlataforma`,`p`.`nome` AS `nomePlataforma`,`d`.`id` AS `idDistribuidora`,`d`.`nome` AS `nomeDistribuidora` from (((`tb_jogo` `j` join `tb_categoria` `c`) join `tb_plataforma` `p`) join `tb_distribuidora` `d`) where ((`j`.`idCategoria` = `c`.`id`) and (`j`.`idPlataforma` = `p`.`id`) and (`j`.`idDistribuidora` = `d`.`id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_filial_jogo`
--

/*!50001 DROP VIEW IF EXISTS `view_filial_jogo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_filial_jogo` AS select `fj`.`id` AS `idFilialJogo`,`j`.`id` AS `idJogo`,`f`.`id` AS `idFilial`,`f`.`nome` AS `nomeFilial`,`f`.`telefone` AS `telefoneFilial`,`f`.`email` AS `emailFilial`,`f`.`latitude` AS `lat`,`f`.`longitude` AS `lgt`,`f`.`endereco` AS `enderecoFilial`,`f`.`dir_imagem` AS `dir_imagem` from ((`tb_filial_jogo` `fj` join `tb_jogo` `j`) join `tb_filial` `f`) where ((`j`.`id` = `fj`.`idJogo`) and (`f`.`id` = `fj`.`idFilial`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_nome_plataforma`
--

/*!50001 DROP VIEW IF EXISTS `view_nome_plataforma`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_nome_plataforma` AS select `j`.`nome` AS `nomeJogo`,`p`.`nome` AS `nomePlataforma` from (`tb_jogo` `j` join `tb_plataforma` `p`) where (`j`.`idPlataforma` = `p`.`id`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_previewjogo`
--

/*!50001 DROP VIEW IF EXISTS `view_previewjogo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_previewjogo` AS select `j`.`id` AS `id`,`j`.`nome` AS `nomeJogo`,`j`.`nomeCapa` AS `nomeCapa`,`p`.`nome` AS `plataforma`,`c`.`nome` AS `categoria`,`j`.`idCategoria` AS `idCategoria`,`j`.`idPlataforma` AS `idPlataforma`,`j`.`preco` AS `precoJogo` from ((`tb_jogo` `j` join `tb_plataforma` `p`) join `tb_categoria` `c`) where ((`j`.`idPlataforma` = `p`.`id`) and (`j`.`idCategoria` = `c`.`id`) and (`j`.`idCategoria` = `c`.`id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-01  0:21:32


