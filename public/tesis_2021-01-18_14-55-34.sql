-- MySQL dump 10.13  Distrib 8.0.22, for Linux (x86_64)
--
-- Host: localhost    Database: tesis
-- ------------------------------------------------------
-- Server version	8.0.22-0ubuntu0.20.04.3

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `area_capa`
--

DROP TABLE IF EXISTS `area_capa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `area_capa` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `estado` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area_capa`
--

LOCK TABLES `area_capa` WRITE;
/*!40000 ALTER TABLE `area_capa` DISABLE KEYS */;
INSERT INTO `area_capa` VALUES (3,'Tecnologia',1,NULL,NULL),(4,'Medio ambiente',1,NULL,NULL);
/*!40000 ALTER TABLE `area_capa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `area_laboral`
--

DROP TABLE IF EXISTS `area_laboral`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `area_laboral` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `estado` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area_laboral`
--

LOCK TABLES `area_laboral` WRITE;
/*!40000 ALTER TABLE `area_laboral` DISABLE KEYS */;
INSERT INTO `area_laboral` VALUES (1,'Educación',1,NULL,NULL),(2,'Agricultura',1,NULL,NULL),(3,'Responsabilidad Social Empresarial',1,NULL,NULL),(4,'Sector Salud',1,NULL,NULL);
/*!40000 ALTER TABLE `area_laboral` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `capacitacion`
--

DROP TABLE IF EXISTS `capacitacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `capacitacion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipo_capa_id` int NOT NULL,
  `estudiante_id` int NOT NULL,
  `area_capa_id` int NOT NULL,
  `nombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `institucion` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `fechainicio` date DEFAULT NULL,
  `fechafin` date DEFAULT NULL,
  `estado` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `capacitacion_estudiante_id` (`estudiante_id`),
  KEY `capacitacion_area_capa_id` (`area_capa_id`),
  KEY `capacitacion_tipo_capa_id` (`tipo_capa_id`),
  CONSTRAINT `capacitacion_area_capa_id` FOREIGN KEY (`area_capa_id`) REFERENCES `area_capa` (`id`),
  CONSTRAINT `capacitacion_estudiante_id` FOREIGN KEY (`estudiante_id`) REFERENCES `estudiante` (`id`),
  CONSTRAINT `capacitacion_tipo_capa_id` FOREIGN KEY (`tipo_capa_id`) REFERENCES `tipo_capa` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `capacitacion`
--

LOCK TABLES `capacitacion` WRITE;
/*!40000 ALTER TABLE `capacitacion` DISABLE KEYS */;
INSERT INTO `capacitacion` VALUES (1,1,2,3,'Conferencia de Programa Espacial Boliviano','Tecnológico Santa Cruz','2014-03-01','2014-03-02',1,'2020-12-15 23:19:15','2020-12-15 23:19:15'),(2,1,5,3,'Conferencia de Programa Espacial Boliviano','Tecnológico Santa Cruz','2014-02-01','2016-02-03',1,'2020-12-16 14:01:18','2020-12-16 14:01:18'),(3,2,5,3,'Concurso de Startup Weekend Education 2015','Startup Weeken Education','2015-04-24','2015-04-26',1,'2020-12-17 18:22:42','2020-12-17 18:22:42'),(4,2,5,4,'Aprendisaje de cuidado de la flora y fauna de Bolivia','Amigarse S.R.L','2016-04-17','2016-04-18',1,'2020-12-17 18:25:33','2020-12-17 18:25:33');
/*!40000 ALTER TABLE `capacitacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carrera`
--

DROP TABLE IF EXISTS `carrera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrera` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `estado` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrera`
--

LOCK TABLES `carrera` WRITE;
/*!40000 ALTER TABLE `carrera` DISABLE KEYS */;
INSERT INTO `carrera` VALUES (1,'Sistemas Informaticos',1,'2020-12-06 19:58:57','2020-12-06 19:58:57'),(2,'Contaduria General',1,'2020-12-06 19:58:57','2020-12-06 19:58:57');
/*!40000 ALTER TABLE `carrera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacto`
--

DROP TABLE IF EXISTS `contacto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contacto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `empresa_id` int NOT NULL,
  `users_id` int NOT NULL,
  `nombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `celular` int DEFAULT NULL,
  `telefono` int DEFAULT NULL,
  `estado` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contacto_empresa_id` (`empresa_id`),
  KEY `contacto_users_id` (`users_id`),
  CONSTRAINT `contacto_empresa_id` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`id`),
  CONSTRAINT `contacto_users_id` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacto`
--

LOCK TABLES `contacto` WRITE;
/*!40000 ALTER TABLE `contacto` DISABLE KEYS */;
INSERT INTO `contacto` VALUES (1,2,25,'pedro martinez',62342342,32412,1,'2020-12-10 18:50:34','2020-12-10 18:50:34'),(2,1,10,'juan perez',6123123,23423,1,'2020-12-06 19:58:57','2020-12-06 21:51:50'),(3,3,7,'leonardo',623123,123123,1,'2020-12-10 19:46:49','2020-12-10 19:46:49'),(4,7,27,'Roberto Salvatierra',632323,34242,1,'2020-12-14 18:09:17','2020-12-14 18:09:17'),(5,8,28,'juan tenorio',523423,43412,1,'2020-12-14 21:01:24','2020-12-14 21:01:24'),(6,9,31,'Juan Perez Martinez',623423,34523,1,'2020-12-16 12:40:21','2020-12-16 12:40:21'),(7,10,40,'Juan',12312312,123123,1,'2021-01-14 02:05:21','2021-01-14 02:05:21'),(8,10,40,'Juan',12312312,123123,1,'2021-01-14 02:07:37','2021-01-14 02:07:37'),(9,10,40,'Juan',12312312,123123,1,'2021-01-14 02:14:55','2021-01-14 02:14:55'),(10,10,40,'Juan',12312312,123123,1,'2021-01-14 02:16:39','2021-01-14 02:16:39'),(11,10,40,'Juan',12312312,123123,1,'2021-01-14 02:17:18','2021-01-14 02:17:18');
/*!40000 ALTER TABLE `contacto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contrato`
--

DROP TABLE IF EXISTS `contrato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contrato` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `estado` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contrato`
--

LOCK TABLES `contrato` WRITE;
/*!40000 ALTER TABLE `contrato` DISABLE KEYS */;
INSERT INTO `contrato` VALUES (1,'Medio tiempo',1,'2020-12-06 21:51:50','2020-12-06 21:51:50'),(2,'Tiempo completo',1,'2020-12-06 19:58:57','2020-12-06 19:58:57');
/*!40000 ALTER TABLE `contrato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamento`
--

DROP TABLE IF EXISTS `departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamento` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(70) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `estado` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamento`
--

LOCK TABLES `departamento` WRITE;
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
INSERT INTO `departamento` VALUES (1,'Santa Cruz',1,'2020-12-06 19:34:19','2020-12-06 19:34:19'),(2,'Pando',1,'2020-12-06 19:34:19','2020-12-06 19:34:19');
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresa`
--

DROP TABLE IF EXISTS `empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empresa` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dpto_id` int NOT NULL,
  `users_id` int NOT NULL,
  `nombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `direccion` varchar(250) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `url_pagina` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `descripcion` varchar(500) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `celular` int DEFAULT NULL,
  `telefono` int DEFAULT NULL,
  `nit` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `fechaalta` date DEFAULT NULL,
  `estado` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `empresa_departamento_id` (`dpto_id`),
  CONSTRAINT `empresa_departamento_id` FOREIGN KEY (`dpto_id`) REFERENCES `departamento` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa`
--

LOCK TABLES `empresa` WRITE;
/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
INSERT INTO `empresa` VALUES (1,1,17,'Sofia','4to Anillo, Parque Industrial','Www.sofia.com','Empresa Distribuidora Aviocola',723123,3421424,'1242324','public/GamMIG63OZwKCNzaTN4GcuR1U8pk8j07cuZEDG71.png',NULL,1,'2020-12-06 19:58:57','2021-01-05 14:13:02'),(2,1,17,'Caja Nacional De Salud','Av 2 De Agosto','Www.cajanacional.com','Centro De Salud',123123,3424124,'12312312312','public/9jboFQNiRQBgyHftvyz0JUGEOuEEs5REph6011rW.png',NULL,1,'2020-12-10 18:50:20','2021-01-05 14:13:16'),(3,1,7,'Cuadernos Lider','av 2 de agosto','www.lider.com','distribuidora de papeleria',123123,3424124,'123123','public/IlA2KCDcGrcDQCzGZhG5gNvH1IC9UeMe5qNn1E5q.png',NULL,1,'2020-12-10 19:46:32','2021-01-05 14:19:44'),(4,2,26,'Cuadernos Lider','av 2 de agosto','www.lider.com','distribuidora de papeleria',123123,3424124,'123123','public/Sl1VKbLSXYYxHUGQqaSHJcPTjoJM0X4QaLnDPy3D.png',NULL,1,'2020-12-10 20:23:39','2021-01-05 14:27:42'),(5,2,26,'Cuadernos Lider y TOP','av 2 de agosto','www.lider.com','distribuidora de papeleria',123123,3424124,'123123','public/ihggdCESKROaXYGdcPIHgh786DNvvbtRrBdvfQy0.png',NULL,1,'2020-12-10 20:27:11','2020-12-10 20:27:11'),(6,1,17,'Sofia S.R.L.','4to anillo, parque industrial','www.sofia.com','empresa distribuidora aviocola',723123,342142,'1242324','public/ihggdCESKROaXYGdcPIHgh786DNvvbtRrBdvfQy0.png',NULL,1,'2020-12-10 20:30:45','2020-12-11 12:47:22'),(7,1,27,'Netflix','av 2 de agosto','www.netflix.com','entretenimiento',72342342,3424124,'12312312','public/ihggdCESKROaXYGdcPIHgh786DNvvbtRrBdvfQy0.png',NULL,1,'2020-12-14 18:07:58','2020-12-14 18:07:58'),(8,1,28,'cumbre','av cañoto','www.cumbre.com','universidad',65423234,435235,'123123123','public/hmYahPVxAUqJQ0e16zm7jnLVB9IOf2CBkheN4D41.png',NULL,1,'2020-12-14 21:00:59','2020-12-14 21:00:59'),(9,1,31,'Caja Nacional De Salud Balliviam','1er Anillo, Calle Balliviam','Www.empresa.com','Nosocomio',7123123,3424124,'12123123','public/QQGpbDrshzJTOytguroFifBerbliyoGdV1LXVFHW.png',NULL,1,'2020-12-16 12:40:00','2021-01-05 18:26:26'),(10,1,40,'Caja Nacional De Salud Materno Infantil','Av Cañoto','Www.cajanacional.com','Centro De Salud',72342342,3423425,'12312312','public/n0RRwZqNMNxavhdQ9FFa4wAuhZrYfq9FL0O3aKeZ.png',NULL,1,'2021-01-14 01:59:48','2021-01-14 01:59:48');
/*!40000 ALTER TABLE `empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado_civil`
--

DROP TABLE IF EXISTS `estado_civil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado_civil` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `estado` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado_civil`
--

LOCK TABLES `estado_civil` WRITE;
/*!40000 ALTER TABLE `estado_civil` DISABLE KEYS */;
INSERT INTO `estado_civil` VALUES (1,'Soltero/a',1,'2020-12-06 19:58:57','2020-12-06 19:58:57'),(2,'Casado/a',1,'2020-12-06 19:58:57','2020-12-06 19:58:57'),(5,'Divorciado/a',1,'2020-12-06 19:58:57','2020-12-06 19:58:57'),(6,'Viudo/a',1,'2020-12-06 19:58:57','2020-12-06 19:58:57'),(7,'Concubinato',1,'2020-12-06 19:58:57','2020-12-06 19:58:57');
/*!40000 ALTER TABLE `estado_civil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estudiante`
--

DROP TABLE IF EXISTS `estudiante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estudiante` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipo_sangre_id` int NOT NULL,
  `estado_civil_id` int NOT NULL,
  `provincia_id` int NOT NULL,
  `users_id` int NOT NULL,
  `genero_id` int NOT NULL,
  `matricula` int NOT NULL,
  `nombre` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `apellidop` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `apellidom` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `fechanac` date NOT NULL,
  `telefono` int DEFAULT NULL,
  `celular` int DEFAULT NULL,
  `dni` int NOT NULL,
  `direccion` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `foto` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `strpassword` varchar(16) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `fechaalta` date DEFAULT NULL,
  `estado` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `estudiante_users_id` (`users_id`),
  KEY `estudiante_tipo_sangre_id` (`tipo_sangre_id`),
  KEY `estudiante_estado_civil_id` (`estado_civil_id`),
  KEY `estudiante_genero_id` (`genero_id`),
  KEY `estudiante_provincia_id` (`provincia_id`),
  CONSTRAINT `estudiante_estado_civil_id` FOREIGN KEY (`estado_civil_id`) REFERENCES `estado_civil` (`id`),
  CONSTRAINT `estudiante_genero_id` FOREIGN KEY (`genero_id`) REFERENCES `genero` (`id`),
  CONSTRAINT `estudiante_provincia_id` FOREIGN KEY (`provincia_id`) REFERENCES `provincia` (`id`),
  CONSTRAINT `estudiante_tipo_sangre_id` FOREIGN KEY (`tipo_sangre_id`) REFERENCES `tipo_sangre` (`id`),
  CONSTRAINT `estudiante_users_id` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudiante`
--

LOCK TABLES `estudiante` WRITE;
/*!40000 ALTER TABLE `estudiante` DISABLE KEYS */;
INSERT INTO `estudiante` VALUES (2,1,1,1,7,2,1123123,'jesus','gutierrez','sipe','2000-02-04',3424124,6572723,323123,'Zona barrio lindo','public/JExuw53sZOJKTq1fNTEfUq3NL3xVmpohVpq9HN2g.png',NULL,NULL,NULL,1,'2020-12-07 20:39:07','2020-12-14 22:22:13'),(3,1,1,1,24,1,13123123,'maria','guzman','suarez','2000-02-03',324242,7123123,123123123,'Zona barrio lindo',NULL,NULL,NULL,NULL,0,'2020-12-08 00:32:47','2021-01-05 14:20:31'),(4,4,1,1,29,1,1123123,'Yerelin','gutierrez','suarez','2000-02-03',3424124,123123,323123,'Zona barrio lindo','public/JrbNM0hjyzpEO1AGdPfAcbopaQpSqkP34o5dhS6M.png',NULL,NULL,NULL,1,'2020-12-14 22:57:06','2021-01-05 14:20:44'),(5,2,1,1,30,1,12345678,'Casimiro','Takelberry','Gonzales','2000-02-03',3423425,763423,121233,'Zona Barrio Lindo','public/k6s43Lutrdno4d8tEka2h91sN5SKcd5mxv1BntLW.png',NULL,NULL,NULL,1,'2020-12-16 12:32:31','2021-01-14 02:38:39'),(6,4,1,1,30,1,32312412,'Yerelin','Gutierrez','Guzman','2000-02-04',3424124,72342342,123123123,'Zona Barrio Lindo','public/wj0HrLbUsr2lgpXn2IgUvCIM1puJ5O5599XkYXAo.png',NULL,NULL,NULL,1,'2021-01-14 01:01:57','2021-01-14 01:01:57'),(7,1,2,1,37,1,123123123,'Yerelin','Gutierrez','Suarez','2000-02-03',3424124,72342342,23234234,'Zona Barrio Lindo','public/ypS8Ojztk53qpG29LW0o83VArnybirTvNY4uJM59.png',NULL,NULL,NULL,1,'2021-01-14 01:03:54','2021-01-14 01:03:54'),(8,2,5,1,38,2,123123,'Manuel','Mamani','Perez','2000-02-03',3424124,72342342,121233,'Zona Barrio Lindo','public/QmHa6bUvd0pV0SMweTTkRrMhVyeIRu5Wr3KExcFm.png',NULL,NULL,NULL,1,'2021-01-14 01:05:29','2021-01-14 01:05:29'),(9,1,6,1,39,1,123123123,'Manuel','Mamani','Perez','2000-02-04',3424124,7123123,121233,'Zona Barrio Lindo','public/OlnW5YpREUE8F3N31kqE3hDtbpur2S2Zlkz4d7XC.png',NULL,NULL,NULL,1,'2021-01-14 01:16:37','2021-01-14 01:16:37'),(10,1,2,1,42,1,12312323,'Estudianteprueba','Prueba','Gonzales','2000-02-04',3423425,27123123,121233,'Zona Barrio Lindo','public/HD5f9z4NNkfavzWFpb2tt0JyI7WZm4DRjysJBqVw.png',NULL,NULL,NULL,1,'2021-01-14 02:33:37','2021-01-14 02:33:37');
/*!40000 ALTER TABLE `estudiante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estudios`
--

DROP TABLE IF EXISTS `estudios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estudios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `carrera_id` int NOT NULL,
  `estudiante_id` int NOT NULL,
  `semestre` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `institucion` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `fechainicio` date NOT NULL,
  `fechafin` date DEFAULT NULL,
  `estado` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `estudios_estudiante_id` (`estudiante_id`),
  KEY `estudios_carrera_id` (`carrera_id`),
  CONSTRAINT `estudios_carrera_id` FOREIGN KEY (`carrera_id`) REFERENCES `carrera` (`id`),
  CONSTRAINT `estudios_estudiante_id` FOREIGN KEY (`estudiante_id`) REFERENCES `estudiante` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudios`
--

LOCK TABLES `estudios` WRITE;
/*!40000 ALTER TABLE `estudios` DISABLE KEYS */;
INSERT INTO `estudios` VALUES (1,1,2,'6to semestre','Ensec','2014-02-01',NULL,1,'2020-12-15 22:31:28','2020-12-15 22:31:28'),(2,1,5,'Bachiller','Colegio 24 de Septiembre','2014-02-01','2016-02-03',1,'2020-12-16 14:00:47','2020-12-16 14:00:47'),(3,1,5,'Finalizado','Instituto E.N.S.E.C','2014-02-01','2016-12-03',1,'2020-12-17 18:23:50','2020-12-17 18:23:50');
/*!40000 ALTER TABLE `estudios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estudios_idioma`
--

DROP TABLE IF EXISTS `estudios_idioma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estudios_idioma` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idioma_id` int NOT NULL,
  `estudiante_id` int NOT NULL,
  `hablar` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `escribir` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `leer` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `estado` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `estudios_idioma_estudiante_id` (`estudiante_id`),
  KEY `estudios_idioma_idioma_id` (`idioma_id`),
  CONSTRAINT `estudios_idioma_estudiante_id` FOREIGN KEY (`estudiante_id`) REFERENCES `estudiante` (`id`),
  CONSTRAINT `estudios_idioma_idioma_id` FOREIGN KEY (`idioma_id`) REFERENCES `idioma` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudios_idioma`
--

LOCK TABLES `estudios_idioma` WRITE;
/*!40000 ALTER TABLE `estudios_idioma` DISABLE KEYS */;
INSERT INTO `estudios_idioma` VALUES (1,2,2,'Avanzado','Intermedio','Avanzado',1,'2020-12-16 02:39:47','2020-12-16 02:39:47'),(2,1,5,'Básico','Avanzado','Básico',1,'2020-12-16 14:03:22','2020-12-16 14:03:22'),(3,2,5,'Básico','Avanzado','Básico',1,'2020-12-17 18:28:07','2020-12-17 18:28:07');
/*!40000 ALTER TABLE `estudios_idioma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_laboral`
--

DROP TABLE IF EXISTS `exp_laboral`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exp_laboral` (
  `id` int NOT NULL AUTO_INCREMENT,
  `area_laboral_id` int NOT NULL,
  `estudiante_id` int NOT NULL,
  `institucion` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `puesto` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `fechainicial` date NOT NULL,
  `fechafin` date NOT NULL,
  `descripcion` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `estado` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `exp_laboral_estudiante_id` (`estudiante_id`),
  KEY `exp_laboral_area_laboral_id` (`area_laboral_id`),
  CONSTRAINT `exp_laboral_area_laboral_id` FOREIGN KEY (`area_laboral_id`) REFERENCES `area_laboral` (`id`),
  CONSTRAINT `exp_laboral_estudiante_id` FOREIGN KEY (`estudiante_id`) REFERENCES `estudiante` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_laboral`
--

LOCK TABLES `exp_laboral` WRITE;
/*!40000 ALTER TABLE `exp_laboral` DISABLE KEYS */;
INSERT INTO `exp_laboral` VALUES (1,1,2,'Colegio Magisterio B','Maestro','2020-11-01','2020-12-16','instructor de matematica',1,NULL,NULL),(2,4,5,'Caja Nacional de Salud Cañoto','Aux. Oficina','2019-04-01','2019-08-30','Ayudante de Personal',1,'2020-12-16 14:06:11','2020-12-16 14:06:11'),(3,4,5,'Caja Nacional de Salud Cañoto','Aux. Oficina','2019-09-01','2019-12-30','Ayudante de Personal',1,'2020-12-16 14:06:45','2020-12-16 14:06:45'),(4,4,5,'Hospital Municipal Plan 3000','Soporte Técnico','2014-02-01','2014-10-31','Implementación del Sistema y cableado',1,'2020-12-17 18:27:35','2020-12-17 18:27:35');
/*!40000 ALTER TABLE `exp_laboral` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genero`
--

DROP TABLE IF EXISTS `genero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genero` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `estado` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genero`
--

LOCK TABLES `genero` WRITE;
/*!40000 ALTER TABLE `genero` DISABLE KEYS */;
INSERT INTO `genero` VALUES (1,'Femenino',1,'2020-12-06 21:51:50','2020-12-06 21:51:50'),(2,'Masculino',1,'2020-12-06 18:08:29','2020-12-06 18:08:29');
/*!40000 ALTER TABLE `genero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `idioma`
--

DROP TABLE IF EXISTS `idioma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `idioma` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `estado` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `idioma`
--

LOCK TABLES `idioma` WRITE;
/*!40000 ALTER TABLE `idioma` DISABLE KEYS */;
INSERT INTO `idioma` VALUES (1,'Español',1,'2020-12-06 19:58:57','2020-12-06 19:58:57'),(2,'Frances',1,'2020-12-06 19:58:57',NULL);
/*!40000 ALTER TABLE `idioma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2014_10_12_200000_add_two_factor_columns_to_users_table',1),(4,'2019_08_19_000000_create_failed_jobs_table',1),(5,'2019_12_14_000001_create_personal_access_tokens_table',1),(6,'2020_05_21_100000_create_teams_table',1),(7,'2020_12_07_150315_create_sessions_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oferta_laboral`
--

DROP TABLE IF EXISTS `oferta_laboral`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oferta_laboral` (
  `id` int NOT NULL AUTO_INCREMENT,
  `carrera_id` int NOT NULL,
  `empresa_id` int NOT NULL,
  `salario_id` int NOT NULL,
  `tipo_sueldo_id` int NOT NULL,
  `contrato_id` int NOT NULL,
  `titulo` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `descripcion` varchar(5000) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `requisito` varchar(5000) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `publicado` date DEFAULT NULL,
  `vencimiento` date DEFAULT NULL,
  `telefono` int DEFAULT NULL,
  `celular` int DEFAULT NULL,
  `estado` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oferta_laboral_carrera_id` (`carrera_id`),
  KEY `oferta_laboral_salario_id` (`salario_id`),
  KEY `oferta_laboral_tipo_sueldo_id` (`tipo_sueldo_id`),
  KEY `oferta_laboral_contrato_id` (`contrato_id`),
  KEY `oferta_laboral_empresa_id` (`empresa_id`),
  CONSTRAINT `oferta_laboral_carrera_id` FOREIGN KEY (`carrera_id`) REFERENCES `carrera` (`id`),
  CONSTRAINT `oferta_laboral_contrato_id` FOREIGN KEY (`contrato_id`) REFERENCES `contrato` (`id`),
  CONSTRAINT `oferta_laboral_empresa_id` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`id`),
  CONSTRAINT `oferta_laboral_salario_id` FOREIGN KEY (`salario_id`) REFERENCES `salario` (`id`),
  CONSTRAINT `oferta_laboral_tipo_sueldo_id` FOREIGN KEY (`tipo_sueldo_id`) REFERENCES `tipo_sueldo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oferta_laboral`
--

LOCK TABLES `oferta_laboral` WRITE;
/*!40000 ALTER TABLE `oferta_laboral` DISABLE KEYS */;
INSERT INTO `oferta_laboral` VALUES (1,1,9,2,2,2,'Analista de Compensaciones','Elaborar las Planillas de Salarios y Aportes a la Seguridad Social del personal de la empresa y gestionar el pago y presentaciones en forma oportuna y correcta a fin de cumplir con las obligaciones y plazos establecidos por las Leyes y Reglamentos en materia Laboral. ','Titulado Universitario (Carrera de Nivel Licenciatura) en:\r\nAdministración de Empresas,\r\nAdministración de RRHH,\r\nIngeniería Comercial,\r\nContaduría Pública O ramas afines','2020-12-10','2020-12-30',344244,6525332,1,'2020-12-06 19:58:57',NULL),(2,2,4,1,2,1,'ENCARGADO DE ALMACÉN','EMPRESA PRIVADA\r\n\r\nSubsede La Paz','Profesional en el área de Administración de Empresas o Contaduría\r\nManejo de Office\r\nResidencia en la ciudad de El Alto','2020-12-06','2020-12-11',4323223,7232323,1,'2020-12-06 19:58:57','2020-12-06 19:58:57'),(3,1,3,1,1,1,'DOCENTE DE MEDIO TIEMPO DE LA CARRERA DE DERECHO','La Universidad Católica Boliviana \"San Pablo\" necesita incorporar un profesional, para ocupar el siguiente cargo:\r\n\r\nCONVOCATORIA N° 19/2020\r\n\r\nDOCENTE MEDIO TIEMPO CARRERA: DERECHO\r\n\r\n(Sede Santa Cruz)','Titulado a nivel de pregrado en la carrera de Derecho.\r\nMaestría o Doctorado en área de Derecho. Diplomado en Educación Superior.\r\nExperiencia en docencia, mínima de 5 años.\r\nExperiencia laboral en su especialidad minima de 5 años.\r\nConocimientos y experiencia de investigación científica, mínima de 3 años.\r\nDominio del Idioma Ingles.\r\nSe requiere un profesional comprometido con capacidad trabajo en equipo, con buen nivel de comunicación y relacionamiento.','2020-12-14','2000-02-03',3242412,6342323,1,'2020-12-14 10:35:59','2020-12-14 10:35:59'),(4,2,3,2,2,2,'SECRETARIA - RECEPCIONISTA','Asunto: Secretaria Recepcionista','Santa Cruz Si te gusta el trabajo en equipo y te preocupas por ofrecer un buen servicio al cliente ¡Postúlate!','2020-12-14','2000-02-03',345223,752323,1,'2020-12-14 12:05:35','2020-12-14 12:05:35'),(5,2,3,1,2,1,'Ejecutivo Comercial Y De Negocios','Banco mercantil santa cruz\r\n\r\ntendrÁs la oportunidad de generar contactos empresariales, ser embajador de la marca bmsc a travÉs de la gestiÓn y asesoramiento eficiente  a clientes potenciales y leales. generarÁs volumen de negocio a travÉs de ofertas de valor acompaÑadas de un servicio de calidad, basada en la post venta','Licenciatura en ciencias econÓmico-financieras y comerciales\r\nvaloraciÓn especial en estudios superiores relacionados a negocios y finanza\r\nexperiencia en ventas de al menos 1 aÑ\r\nanÁlisis matemÁtico- financier\r\ndisponibilidad y flexibilidad de horarios','2020-12-14','2001-03-03',3425252,72342342,1,'2020-12-14 12:18:06','2020-12-14 12:18:06'),(6,2,3,2,1,2,'Regente FarmacÉutico/a','Únete a la familia chaveciana, premiada como uno de los mejores lugares para trabajar en el país.\r\n\r\nofrecemos un clima ideal de trabajo y una cultura interna que no querrás cambiar.\r\n\r\nenvía tu curriculum vitae con el asunto \"regente farmacéutico - la paz\" al correo','Licenciado/a en bioquímica y farmacia o lic. en farmacia.\r\nconocimiento en farmacología.\r\ndisponibilidad para turnos rotativos.\r\nganas de crecer profesionalmente.\r\npreferiblemente experiencia en atención de farmacia.','2020-12-14','2001-03-03',324242,72342342,1,'2020-12-14 12:31:08','2020-12-14 12:31:08'),(7,2,3,2,2,2,'Personal De Atencion Al Cliente - Supervisor','AtenciÓn al cliente - supervisor','Envía tu cv a 78103063  shorturl.at/bxix0','2020-12-14','2000-02-03',232323,7123123,1,'2020-12-14 12:42:56','2020-12-14 12:42:56'),(8,1,9,1,2,1,'Requerimiento De Personal - Jefe Obras Civiles','La empresa minera corocoro dependiente de la corporaciÓn minera de bolivia (comibol), invita a todos los profesionales idóneos, aptos, y capaces a presentar su postulación para optar al cargo durante la gestión 2021 de: cargo: jefe obras civiles','Grado académico:\r\n\r\nprofesional con titulo en provisión nacional en ingenieria civil.\r\nexperiencia laboral:\r\n\r\nexperiencia general de 5 años en el área.\r\nexperiencia especifica de 2 años en diseño, supervisión y elecución de proyectos estructurales civlles.\r\nconocimientos:\r\n\r\nmanejo de programas estructurales y movimiento de tierras (revit estrutural, sap 2000, autocad, civl 3d, inroad).\r\nconocimientos geotécnicos, sistemas de información geografica.\r\ncontar con capacidades en dirección y manejo del personal.\r\nnormas de seguridad industrial y medio ambiente.\r\notros requisitos:\r\n\r\ncontar con registro a la sociedad de ingenieros de bolivia (sib).\r\nlibreta de servicio militar (sólo varones).\r\nvacancia: 1 (uno)\r\n\r\nlugar de trabajo: \r\n\r\ndepartamento de la paz, provincia pacajes canton corocoro.\r\ndisponiblildad \r\n\r\nel postulante deberá tener dispónibilidad inmedlata para su incorporación a partir de 04 de enero de 2021.\r\nindicar su pretensión salarial (excluyenta).\r\n\r\nlos interosados deberan llenar form. cmb/darh -01 descargando de la pagina web: www.mineracorocoro.com , presentar su carta de presentación indicando pretensión salarlal (excluyente) y hoja de vida documentada en sobre cerrado, en las oficinas de la empresa minera corocoro o en la unidad central de correspondencia (uncc) do la corporación minera de bollvia - comibol planta baja av. carmacho n° 1398 esq. loayza, bajo el rotulo de requerimiento de personal jefe obras civiles.','2020-12-16','2000-02-03',34124124,7123123,1,'2020-12-16 13:07:52','2020-12-16 13:07:52'),(9,2,9,1,2,1,'MÉdicos De Guardia Hospitalaria','3 medicos/as de guardia hospitalaria\r\n\r\ncies la paz (ref. 02-010/2020)','FormaciÓn:\r\n\r\nlicenciatura en medicina con título en provisión nacional.\r\ndiplomado en urgencias médicas. \r\ncursos:\r\n\r\ncursos de capacitación en salud sexual y reproductiva.\r\nen comunicación para la satisfacción del cliente, aprendizaje de jóvenes y adultos, psicología de la mujer.\r\nmanejo de paquetes computacionales.\r\nconocimientos de acls (soporte vital cardiovascular avanzado), bls (soporte vital básico) y deseable atls (apoyo vital avanzado en trauma)\r\nconocimiento manejo expediente clínico digital.\r\nexperiencia:\r\n\r\nexperiencia profesional de 3 años.\r\n2 años de experiencia laboral en hospitales.\r\nexperiencia de trabajo en temas referentes a salud sexual y reproductiva con enfoque de derechos, genero, generacionales e interculturalidad.\r\nexperiencia de atención clínica. \r\nen manejo de trauma, emergencias médicas y desastres. (deseable).\r\nen manejo de pacientes críticos.\r\nhabilidades:\r\n\r\ndesarrollo de relaciones interpersonales, trabajo en equipo, capacidad de planificación y organización, capacidad de control, capacidad de comunicación\r\nactitudes:\r\n\r\nproactividad, tolerancia a la presión, dinamismo y energía, integridad, compromiso con la visión y valores de la organización, compromiso con la protección a niños/as, jóvenes y adultos vulnerables, responsabilidad.\r\notros:\r\n\r\ncertificado de antecedentes de la felcc.\r\nlos/as interesados/as deberán recabar y llenar el formulario de postulación de nuestra página web: www.cies.org.bo y enviarlo al correo electrónico: rquenta@cies.org.bo, hasta el día 18 de diciembre de 2020, impostergablemente.','2020-12-17','2001-03-03',342424,6453452,1,'2020-12-17 12:08:41','2020-12-17 12:08:41'),(10,1,9,1,2,1,'Asistente De Business Inteligence','Empresa boliviana comercializadora de equipamiento médico e insumos para la salud, requiere incorporar a su equipo de trabajo un:\r\n\r\nasistente de business intelligence\r\n\r\n(base santa cruz)\r\nobjetivo del puesto:\r\n\r\ndesarrollar e implementar propuestas de inteligencia comercial, logistica y financiera con el fin de hacer eficiente el manejo de información para la toma de decisiones a todo nivel.','Formación y conocimientos requeridos:\r\n\r\nlic. en ingeniería de sistemas, ingeniería informática administrativa, ingeniería industrial y de sistemas, ingeniería comercial, ingeniería económica y/o carreras afines.\r\nexperiencia mínima de 1 años en el área de bi.\r\nse valora experiencia en el manejo de base de datos, sku, kpi´s y sql.\r\nse valora conocimiento en bpa, logistica y distribución , supply chain\r\nmanejo del idioma ingles a nivel intermedio\r\nmanejo de microsoft office a nivel intermedio-avanzado (macros).\r\nmanejo de power bi.   \r\n \r\n\r\ncompetencias requeridas:\r\n\r\ngestión-control\r\nresponsabilidad\r\natención al cliente\r\nresolución de conflictos\r\ncapacidad de negociación\r\nplanificación y organización.\r\n \r\n\r\nofrecemos:\r\n\r\nestabilidad laboral\r\noportunidades de crecimiento.','2020-12-17','2020-12-30',4324241,623423423,1,'2020-12-17 19:56:43','2020-12-17 19:56:43'),(11,1,9,1,1,1,'Comercio Exterior','Minimo 3 años de experiencia en el area\r\ndinamico y trabajo en equipo\r\nque tenga licencia de conducir','Se requiere un profesional para el area de comercio exterior .\r\n\r\ntitulo a provision nacional  \r\n\r\nrobertoacarapi1987@gmail.com\r\n\r\nminimo 3 años de experiencia en el area\r\n\r\ndinamico y trabajo en equipo\r\n\r\nque tenga licencia de conducir\r\n\r\ndicponibilidad de viajes a diferentes departamentos\r\n\r\ndisponibilidad inmediata\r\n\r\ntrabajo bajo presion\r\n\r\ninteresad@s enviar su hoja de vida a: aporceblaja@gmail.com \r\n\r\nrobertoacarapi1987@gmail.com','2020-12-17','2001-03-03',NULL,NULL,1,'2020-12-17 20:12:41','2020-12-17 20:12:41'),(12,2,9,2,2,2,'Coordinador De Prácticas Hospitalarias E Internado Rotatorio','Coordinador de prÁcticas hospitalarias e internado rotatorio','Sede la paz \r\n\r\nrequiere: \r\n\r\ncoordinador de prÁcticas hospitalarias e internado rotatorio\r\n\r\nrequisitos:\r\n\r\nmédico titulado y habilitado por el colegio médico\r\ndiplomado en educación superior. se valorará especialidad\r\nmaestría en el área (deseable).\r\nexperiencia profesional de 3 años como mínimo.\r\nexperiencia en gestión y monitoreo de proyectos (deseable).\r\nexperiencia en enseñanza superior de estudios y planificación académica (deseable)\r\nconocimiento de materias clínicas y organización de internado rotatorio.\r\nconocimiento de la organización del sistema de salud vigente.\r\ndominio de herramientas tecnológicas (microsoft office, g-suite, etc.)\r\ncompetencias y habilidades:\r\n\r\ncapacidad de organización y planificación.\r\norientación al cliente.\r\ntrabajo en equipo y bajo presión.\r\ninnovación\r\norientación al logro.\r\ncomunicación efectiva','2021-01-05','2021-01-30',3421424,7123123,1,'2021-01-05 15:14:58','2021-01-05 15:14:58'),(13,2,9,2,1,1,'BioquÃmico O BiotecnÃlogo','Laboratorio de análisis clínicos','BioquÍmico o biotecnÓlogo con experiencia a tiempo completo, enviar hoja de vida a: oportunidadlaboral@yahoo.com','2021-01-05','2021-01-30',3421424,72342342,1,'2021-01-05 15:27:07','2021-01-05 15:27:07'),(14,2,9,2,2,2,'Auxiliar De Departamento De AtenciÃn Al Cliente','Recepcionista','Auxiliar de departamento de atención al cliente\r\n\r\nrequisitos específicos:\r\n\r\nedad: 20 a 25 años\r\n\r\nsexo: preferentemente femenino \r\n\r\nsede: cochabamba\r\n\r\nexcelente presencia\r\niniciativa propia\r\nexperiencia no necesaria\r\nrequisitos generales:\r\n\r\nfacilidad de palabra\r\nconocimiento en paquetes de diseño y producción audiovisual\r\ndisponibilidad de horario \r\nmanejo y resolución de conflictos\r\nmanejo de redes sociales\r\ndesarrollo de planes estrategicos','2021-01-05','2021-01-30',3424124,7123123,1,'2021-01-05 16:19:47','2021-01-05 16:19:47'),(15,2,9,1,1,1,'Regente FarmacÉutico/a','Recepción','Auxiliar de departamento de atención al cliente\r\n\r\nrequisitos específicos:\r\n\r\nedad: 20 a 25 años\r\n\r\nsexo: preferentemente femenino \r\n\r\nsede: cochabamba\r\n\r\nexcelente presencia\r\niniciativa propia\r\nexperiencia no necesaria\r\nrequisitos generales:\r\n\r\nfacilidad de palabra\r\nconocimiento en paquetes de diseño y producción audiovisual\r\ndisponibilidad de horario \r\nmanejo y resolución de conflictos\r\nmanejo de redes sociales\r\ndesarrollo de planes estrategicos','2021-01-05','2021-12-30',34124124,72342342,1,'2021-01-05 16:21:36','2021-01-05 16:21:36'),(16,2,9,1,1,1,'Auxiliar De Departamento De Atención Al Cliente','Auxiliar de departamento de atención al cliente\r\n\r\nrequisitos específicos:\r\n\r\nedad: 20 a 25 años\r\n\r\nsexo: preferentemente femenino \r\n\r\nsede: cochabamba\r\n\r\nexcelente presencia\r\niniciativa propia\r\nexperiencia no necesaria\r\nrequisitos generales:\r\n\r\nfacilidad de palabra\r\nconocimiento en paquetes de diseño y producción audiovisual\r\ndisponibilidad de horario \r\nmanejo y resolución de conflictos\r\nmanejo de redes sociales\r\ndesarrollo de planes estrategicos','Auxiliar de departamento de atención al cliente\r\n\r\nrequisitos específicos:\r\n\r\nedad: 20 a 25 años\r\n\r\nsexo: preferentemente femenino \r\n\r\nsede: cochabamba\r\n\r\nexcelente presencia\r\niniciativa propia\r\nexperiencia no necesaria\r\nrequisitos generales:\r\n\r\nfacilidad de palabra\r\nconocimiento en paquetes de diseño y producción audiovisual\r\ndisponibilidad de horario \r\nmanejo y resolución de conflictos\r\nmanejo de redes sociales\r\ndesarrollo de planes estrategicos','2021-01-05','2021-01-30',3424124,7123123,1,'2021-01-05 16:33:06','2021-01-05 16:33:06');
/*!40000 ALTER TABLE `oferta_laboral` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal`
--

DROP TABLE IF EXISTS `personal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal` (
  `id` int NOT NULL AUTO_INCREMENT,
  `users_id` int NOT NULL,
  `nombre` varchar(60) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `apellidop` varchar(80) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `apellidom` varchar(80) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `carnet` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `celular` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `estado` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `personal_users_id` (`users_id`),
  CONSTRAINT `personal_users_id` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal`
--

LOCK TABLES `personal` WRITE;
/*!40000 ALTER TABLE `personal` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `postular_oferta`
--

DROP TABLE IF EXISTS `postular_oferta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `postular_oferta` (
  `id` int NOT NULL AUTO_INCREMENT,
  `estudiante_id` int NOT NULL,
  `oferta_laboral_id` int NOT NULL,
  `fecha_postulacion` date NOT NULL,
  `estado_preseleccion` int DEFAULT NULL,
  `estado_final_contrato` int DEFAULT NULL,
  `aspiracion_salarial` int DEFAULT NULL,
  `estado` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `postular_oferta_estudiante_id` (`estudiante_id`),
  KEY `postular_oferta_oferta_laboral_id` (`oferta_laboral_id`),
  CONSTRAINT `postular_oferta_estudiante_id` FOREIGN KEY (`estudiante_id`) REFERENCES `estudiante` (`id`),
  CONSTRAINT `postular_oferta_oferta_laboral_id` FOREIGN KEY (`oferta_laboral_id`) REFERENCES `oferta_laboral` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `postular_oferta`
--

LOCK TABLES `postular_oferta` WRITE;
/*!40000 ALTER TABLE `postular_oferta` DISABLE KEYS */;
INSERT INTO `postular_oferta` VALUES (1,2,2,'2020-12-11',0,NULL,NULL,0,'2020-12-11 18:10:59','2020-12-15 14:55:39'),(2,2,1,'2020-12-11',0,NULL,NULL,0,'2020-12-11 18:44:20','2020-12-16 12:14:25'),(3,2,2,'2020-12-11',1,NULL,NULL,1,'2020-12-11 18:45:04','2020-12-11 21:06:04'),(4,2,1,'2020-12-11',0,NULL,NULL,1,'2020-12-11 21:10:34','2020-12-15 14:20:36'),(5,2,1,'2020-12-11',0,NULL,NULL,0,'2020-12-12 00:08:02','2020-12-15 14:21:57'),(6,2,3,'2020-12-14',0,NULL,NULL,0,'2020-12-14 10:36:58','2020-12-15 15:01:34'),(7,2,3,'2020-12-14',0,NULL,NULL,0,'2020-12-14 10:37:13','2020-12-15 14:22:32'),(8,2,3,'2020-12-14',0,NULL,NULL,0,'2020-12-14 10:55:50','2020-12-15 14:57:21'),(9,2,1,'2020-12-15',0,NULL,2000,0,'2020-12-15 12:32:00','2020-12-15 14:22:27'),(10,2,8,'2020-12-16',0,NULL,2000,1,'2020-12-16 12:35:35','2020-12-16 12:35:35'),(11,5,8,'2020-12-16',1,NULL,2500,0,'2020-12-16 13:16:49','2020-12-17 12:52:17'),(12,5,9,'2020-12-17',0,NULL,NULL,0,'2020-12-17 18:32:09','2020-12-17 18:32:09'),(13,5,8,'2020-12-17',0,NULL,NULL,1,'2020-12-17 18:32:42','2020-12-17 18:32:42'),(14,5,9,'2020-12-17',0,NULL,NULL,0,'2020-12-17 18:36:13','2020-12-17 18:36:13'),(15,5,9,'2020-12-17',0,NULL,NULL,0,'2020-12-17 18:36:27','2020-12-17 18:36:27'),(16,5,9,'2020-12-17',1,NULL,NULL,1,'2020-12-17 18:38:39','2020-12-18 01:42:58'),(17,5,6,'2020-12-17',0,NULL,NULL,1,'2020-12-17 19:17:14','2020-12-17 19:17:14'),(18,5,2,'2020-12-17',0,NULL,NULL,0,'2020-12-17 19:18:14','2020-12-18 01:48:20'),(19,5,5,'2020-12-17',0,NULL,NULL,0,'2020-12-17 20:15:03','2020-12-17 20:19:03'),(20,5,10,'2020-12-17',0,NULL,2000,0,'2020-12-17 20:15:35','2020-12-17 20:17:34'),(21,5,5,'2020-12-17',0,NULL,NULL,0,'2020-12-18 01:48:44','2021-01-06 15:17:33'),(22,5,7,'2021-01-06',0,NULL,2000,1,'2021-01-06 15:38:06','2021-01-06 15:38:06');
/*!40000 ALTER TABLE `postular_oferta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provincia`
--

DROP TABLE IF EXISTS `provincia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provincia` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dpto_id` int NOT NULL,
  `nombre` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `estado` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `provincia_departamento_id` (`dpto_id`),
  CONSTRAINT `provincia_departamento_id` FOREIGN KEY (`dpto_id`) REFERENCES `departamento` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provincia`
--

LOCK TABLES `provincia` WRITE;
/*!40000 ALTER TABLE `provincia` DISABLE KEYS */;
INSERT INTO `provincia` VALUES (1,1,'warnes',1,'2020-12-06 19:54:20','2020-12-06 19:54:20');
/*!40000 ALTER TABLE `provincia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `referencia`
--

DROP TABLE IF EXISTS `referencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `referencia` (
  `id` int NOT NULL AUTO_INCREMENT,
  `estudiante_id` int NOT NULL,
  `nombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `apellidop` varchar(70) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `apellidom` varchar(70) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `telefono` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `trabajo` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `estado` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `referencia_estudiante_id` (`estudiante_id`),
  CONSTRAINT `referencia_estudiante_id` FOREIGN KEY (`estudiante_id`) REFERENCES `estudiante` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `referencia`
--

LOCK TABLES `referencia` WRITE;
/*!40000 ALTER TABLE `referencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `referencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salario`
--

DROP TABLE IF EXISTS `salario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `estado` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salario`
--

LOCK TABLES `salario` WRITE;
/*!40000 ALTER TABLE `salario` DISABLE KEYS */;
INSERT INTO `salario` VALUES (1,'De 2100 Bs. a 2.999 Bs.',1,'2020-12-06 19:58:57','2020-12-06 19:58:57'),(2,'De 3.000 Bs. a 3.999 Bs.',1,'2020-12-06 19:58:57','2020-12-06 19:58:57');
/*!40000 ALTER TABLE `salario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `payload` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('LZzwk1KpzqJmOM4tUEShme6LEYRa3DdIL11jYIFd',30,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36','YTo1OntzOjY6Il90b2tlbiI7czo0MDoibEZ2d2U1Ukh5MGxuSHg2MUlVZWhScGNwY0l0QW5MeXZybXhxY2NwVSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9lc3R1ZGlvcyI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjMwO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjYwOiIkMnkkMTAkT05lV0RmSXdRb0ZQenlhMVc4RFJ0T1dJOFpTREVxZ3hhVGt4TE5qVGlLUFAyWGhlNkp0ajYiO30=',1610927967),('ZEaKUDYe45enbMSPtXeS3dzlPIWQkGuJBLmJqjFq',7,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36','YTo1OntzOjY6Il90b2tlbiI7czo0MDoiMnNFYjdlSmRCNXlnWmZHblh6dUdsOTJKSHliUVRTb0FpbmNJM1l3eSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9iYWNrdXBzL2luZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6NztzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJDFJRHBvLlZNa2JDSVQuemZxZkYxb3VtQmw5NHM0NExSVEhLYnpXRU1ZdHd3QTB2OThNOFZhIjt9',1610995590);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teams` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_team` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `teams_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
INSERT INTO `teams` VALUES (1,7,'jesusgutierrez0106@gmail.com\'s Team',1,'2020-12-07 15:52:17','2020-12-07 15:52:17');
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_capa`
--

DROP TABLE IF EXISTS `tipo_capa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_capa` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `estado` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_capa`
--

LOCK TABLES `tipo_capa` WRITE;
/*!40000 ALTER TABLE `tipo_capa` DISABLE KEYS */;
INSERT INTO `tipo_capa` VALUES (1,'Conferencia',1,NULL,NULL),(2,'Practico',1,NULL,NULL);
/*!40000 ALTER TABLE `tipo_capa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_sangre`
--

DROP TABLE IF EXISTS `tipo_sangre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_sangre` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `estado` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_sangre`
--

LOCK TABLES `tipo_sangre` WRITE;
/*!40000 ALTER TABLE `tipo_sangre` DISABLE KEYS */;
INSERT INTO `tipo_sangre` VALUES (1,'O negativo.',1,'2020-12-06 19:58:57','2020-12-06 19:58:57'),(2,'O positivo.',1,'2020-12-06 19:58:57','2020-12-06 19:58:57'),(3,'A negativo',1,'2020-12-06 21:51:50',NULL),(4,'A positivo',1,'2020-12-06 19:58:57','2020-12-06 19:58:57'),(5,'B negativo',1,'2020-12-06 19:58:57','2020-12-06 19:58:57'),(6,'B positivo',1,'2020-12-06 19:58:57','2020-12-06 19:58:57'),(7,'AB negativo',1,'2020-12-06 19:58:57','2020-12-06 19:58:57'),(8,'AB positivo',1,'2020-12-06 18:08:29','2020-12-06 18:08:29');
/*!40000 ALTER TABLE `tipo_sangre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_sueldo`
--

DROP TABLE IF EXISTS `tipo_sueldo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_sueldo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `estado` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_sueldo`
--

LOCK TABLES `tipo_sueldo` WRITE;
/*!40000 ALTER TABLE `tipo_sueldo` DISABLE KEYS */;
INSERT INTO `tipo_sueldo` VALUES (1,'Por hora',1,'2020-12-06 19:58:57','2020-12-06 19:58:57'),(2,'Por Dia',1,'2020-12-06 19:58:57','2020-12-06 19:58:57');
/*!40000 ALTER TABLE `tipo_sueldo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_usuario`
--

DROP TABLE IF EXISTS `tipo_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_usuario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `estado` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_usuario`
--

LOCK TABLES `tipo_usuario` WRITE;
/*!40000 ALTER TABLE `tipo_usuario` DISABLE KEYS */;
INSERT INTO `tipo_usuario` VALUES (1,'Administrador',1,'2020-12-06 18:08:29','2020-12-06 18:08:29'),(2,'Estudiante',1,'2020-12-06 18:08:29','2020-12-06 18:08:29'),(3,'Empresa',1,'2020-12-06 18:09:44','2020-12-06 18:09:44');
/*!40000 ALTER TABLE `tipo_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipo_usuario_id` int NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `two_factor_recovery_codes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_photo_path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `estado` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_tipo_usuario_id` (`tipo_usuario_id`),
  CONSTRAINT `users_tipo_usuario_id` FOREIGN KEY (`tipo_usuario_id`) REFERENCES `tipo_usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (7,1,'jesusgutierrez0106@gmail.com',NULL,'$2y$10$1IDpo.VMkbCIT.zfqfF1oumBl94s44LRTHKbzWEMYtwwA0v98M8Va',NULL,NULL,'ngngtPHMISAK14YBIX7YY6z3RiQsdLUAwT352TrHrN00BRlBBnUgSs0WWDO4',NULL,1,'2020-12-07 15:52:17','2021-01-06 23:51:22'),(8,2,'Casimiro@gmail.com',NULL,'$2y$10$McDUDt9VdOsrtrbrdSS.d.Ieua6D9eAlInB2oYB.s8OCDhUCMgRBy',NULL,NULL,NULL,NULL,0,'2020-12-07 16:56:27','2021-01-12 01:50:16'),(9,3,'gamin@gmail.com',NULL,'$2y$10$ZNsynXO/Y4eZNj0YfPgrZeeiSe7OteoF0EcPQVfCAu/JuSy.kdVoa',NULL,NULL,NULL,NULL,1,'2020-12-07 17:16:08','2020-12-13 23:13:44'),(10,3,'puedeserzaszar@gmail.com',NULL,'$2y$10$9VgaV7sc7c3DEPoYtddUnurpZmztPw5QPg.M19aLkhLjwybwn5t6m',NULL,NULL,NULL,NULL,1,'2020-12-07 21:44:35','2020-12-14 18:03:52'),(11,2,'asd@gmal.com',NULL,'$2y$10$OnxrFYtfxNS9wiXEIEBDseDc9.JlWtxp3judpMorf6sxLvzLjIriK',NULL,NULL,NULL,NULL,1,'2020-12-07 21:47:58','2020-12-17 21:20:40'),(13,2,'elmlefco1@gmail.com',NULL,'$2y$10$pEi.30Ddvt6fo5cbMhA3D.P8N2p9FOaQKlvzzaIHr1By6cAaDiTVe',NULL,NULL,NULL,NULL,0,'2020-12-07 21:54:12','2020-12-13 22:13:39'),(14,2,'prueba@gmail.com',NULL,'$2y$10$upGMrR7VAkRfg3kMrmtxUeMP7W6Dhym5qr1TVi59.rM4UVvOY.6EW',NULL,NULL,NULL,NULL,0,'2020-12-07 22:04:15','2020-12-13 22:09:53'),(17,2,'prueba1@gmail.com',NULL,'$2y$10$GSgbuFw7S1YLv36C0TJDbey5d.3vsqnmD6sWV3fgUaf651nfVHt1O',NULL,NULL,NULL,NULL,0,'2020-12-07 22:06:26','2020-12-13 22:09:49'),(18,2,'prueba2@gmail.com',NULL,'$2y$10$96npF8rF.ORaewtKR2MNjuR/2GQZoerhd.UqgiuO3mcfl.2WViFB2',NULL,NULL,NULL,NULL,0,'2020-12-07 22:07:42','2020-12-13 22:12:12'),(19,2,'prueba3@gmail.com',NULL,'$2y$10$f4YagUGEsg5UIN1Lm.qDZuHh5f.N2dR9J/L4zjoWqCtxHQMmb5N2u',NULL,NULL,NULL,NULL,0,'2020-12-07 22:35:08','2020-12-13 22:55:26'),(21,2,'prueba4@gmail.com',NULL,'$2y$10$gOcRHTQ.RM3gGfSeu2SAMOd9ZuZP0sL45RZlUr//HDvWmR.ymUygG',NULL,NULL,NULL,NULL,0,'2020-12-07 22:38:59','2020-12-13 22:09:43'),(23,2,'prueba5@gmail.com',NULL,'$2y$10$VKDqr8q8RzrzHvfnZXMWbeCsw6J1KQ8GbgMnXJc3.WNE.IpBExKTO',NULL,NULL,NULL,NULL,0,'2020-12-07 22:39:48','2020-12-13 22:56:50'),(24,2,'prueba6@gmail.com',NULL,'$2y$10$rkiGQonvMNSblt5zD.lF.upV3IrBNJk3OQcTWWUEPf8K2Z8p16E8i',NULL,NULL,NULL,NULL,0,'2020-12-08 00:24:15','2020-12-13 22:57:00'),(25,3,'prueba7@gmail.com',NULL,'$2y$10$rrmQusVjv5ub9qu/JWp2bu2yhXLfYdhsGvW75OJ9GZ50rlNaoMp2u',NULL,NULL,NULL,NULL,0,'2020-12-10 18:49:39','2020-12-13 22:55:45'),(26,3,'prueba8@gmail.com',NULL,'$2y$10$I1HddX265PpkDQTmapH3f.zNCqewSL2zJhhVtQ7LZg34ExM4UbmNi',NULL,NULL,NULL,NULL,0,'2020-12-10 19:30:53','2020-12-13 22:56:42'),(27,3,'prueba10@gmail.com',NULL,'$2y$10$moTA/BVeY8nofbMAQ63UiO3MsjjYnpwQERsF3ZcqghYPXmAsLIila',NULL,NULL,NULL,NULL,1,'2020-12-14 18:04:27','2020-12-14 18:04:27'),(28,3,'prueba11@gmail.com',NULL,'$2y$10$M6RpKVZqDi5jsklhY0ICKuQfJGhnxs.OlPvPiPLepAitwq8r80apO',NULL,NULL,NULL,NULL,1,'2020-12-14 20:59:25','2020-12-14 20:59:25'),(29,2,'prueba12@gmail.com',NULL,'$2y$10$3OhAvKtX97ic1eEM6MMMpuEJ6em5xKpR8ENXBb2YmYATyTQ8q5vli',NULL,NULL,NULL,NULL,1,'2020-12-14 22:30:35','2020-12-14 22:30:35'),(30,2,'Estudiante@gmail.com',NULL,'$2y$10$ONeWDfIwQoFPzya1W8DRtOWI8ZSDEqgxaTkxLNjTiKPP2Xhe6Jtj6',NULL,NULL,NULL,NULL,1,'2020-12-16 12:31:29','2021-01-06 15:39:44'),(31,3,'Empresa@gmail.com',NULL,'$2y$10$BOhdtv3hBnH71oUGyzK0bOa9DcwK.4r1BVIjZUSW682vqX4D1RKU6',NULL,NULL,NULL,NULL,1,'2020-12-16 12:38:34','2020-12-16 12:38:34'),(32,2,'prueba20@gmail.com',NULL,'$2y$10$4y9R8NtkAYQClkHowWESPeltYS0s1H3ZyQL6d31QEtnTPXgEZ3Ya2',NULL,NULL,NULL,NULL,0,'2020-12-16 18:24:44','2020-12-16 18:24:44'),(33,3,'prueba21@gmail.com',NULL,'$2y$10$0Z4fjturlFuiHWg8v8EP5OqHZ7feLjLuRFen4gKuAFnQz7wr5.58u',NULL,NULL,NULL,NULL,1,'2020-12-16 18:27:50','2021-01-05 14:07:10'),(34,3,'Empresa01@gmail.com',NULL,'$2y$10$rZIC6ekLQ3A9wx1PZWV3/O79PCwLwSe2kpcoj4AW71QNeLiEC4fUe',NULL,NULL,NULL,NULL,1,'2021-01-12 01:02:12','2021-01-12 01:02:12'),(35,3,'Empresa02@gmail.com',NULL,'$2y$10$bFFJtczHlxQ.3r5ZOH8uLeKKlufypyMUNMrTT.xHI6HUmjZaGt/Hy',NULL,NULL,NULL,NULL,1,'2021-01-12 01:39:18','2021-01-12 01:39:18'),(36,3,'Empresa03@gmail.com',NULL,'$2y$10$yc4Ed5rU9mnZCRr4LgVkV.ULBJHrAaqFk11riIhkBkUVeOMX./L72',NULL,NULL,NULL,NULL,1,'2021-01-12 01:45:23','2021-01-12 01:45:23'),(37,2,'Estudiante01@gmail.com',NULL,'$2y$10$10im84wrwxhZz0J4tEDc1.4XpxaTS.fs27i9zrZ9Vzf0Jjzt/JNAC',NULL,NULL,NULL,NULL,1,'2021-01-13 20:13:30','2021-01-13 20:13:30'),(38,2,'estudiante02@gmail.com',NULL,'$2y$10$8kBHqcXPIVfazYV4sRsej.k4CyNKAgHIShSIFTpVGQfpANdIvLCre',NULL,NULL,NULL,NULL,0,'2021-01-14 00:33:26','2021-01-14 00:33:26'),(39,2,'estudiante03@gmail.com',NULL,'$2y$10$g6agUCqy6dNpL9aRLKY2KeVdo0RtboK.VlZP9V8UHUd0ls4phHgGW',NULL,NULL,NULL,NULL,1,'2021-01-14 00:44:02','2021-01-14 00:44:02'),(40,3,'empresa04@gmail.com',NULL,'$2y$10$fHoe.mK6SKNg2N8siFoEVOQhyVfBGDH/bpeTgWQPriHGdd0sZ/Q72',NULL,NULL,NULL,NULL,1,'2021-01-14 01:17:28','2021-01-14 01:17:28'),(41,3,'Empresa05@gmail.com',NULL,'$2y$10$44LIEG4e0H1uK03A6uMkSuRZoDMzUxFXKMRfhD/pyXiOJKW66WDNa',NULL,NULL,NULL,NULL,1,'2021-01-14 01:25:31','2021-01-14 01:25:31'),(42,2,'estudiante04@gmail.com',NULL,'$2y$10$7zYD268cXRRPt96eR6Jct.Ci321VTFe8ZpJVn34qVcPRJ.7SoAGqi',NULL,NULL,NULL,NULL,1,'2021-01-14 02:24:59','2021-01-14 02:24:59'),(43,2,'estudiante05@gmail.com',NULL,'$2y$10$9OPxt1PDx29ScHR9DLWNDeiZoWQxwNgPYP2TOgMxS2NGpcMeb0fnu',NULL,NULL,NULL,NULL,1,'2021-01-14 02:34:31','2021-01-14 02:34:31');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-18 14:55:54
