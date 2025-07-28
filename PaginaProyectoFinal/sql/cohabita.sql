-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: cohabita
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `cedula` varchar(8) NOT NULL,
  PRIMARY KEY (`cedula`),
  CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`cedula`) REFERENCES `adulto` (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_evaluacion_exoneracion`
--

DROP TABLE IF EXISTS `admin_evaluacion_exoneracion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_evaluacion_exoneracion` (
  `id_admin` varchar(8) NOT NULL,
  `id_solicitud` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `veredicto` text NOT NULL,
  `motivo` text DEFAULT NULL,
  PRIMARY KEY (`id_admin`,`id_solicitud`),
  KEY `id_solicitud` (`id_solicitud`),
  CONSTRAINT `admin_evaluacion_exoneracion_ibfk_1` FOREIGN KEY (`id_admin`) REFERENCES `admin` (`cedula`),
  CONSTRAINT `admin_evaluacion_exoneracion_ibfk_2` FOREIGN KEY (`id_solicitud`) REFERENCES `solicitud_exoneracion_horas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_evaluacion_exoneracion`
--

LOCK TABLES `admin_evaluacion_exoneracion` WRITE;
/*!40000 ALTER TABLE `admin_evaluacion_exoneracion` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_evaluacion_exoneracion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_evaluacion_reclamo`
--

DROP TABLE IF EXISTS `admin_evaluacion_reclamo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_evaluacion_reclamo` (
  `id_admin` varchar(8) NOT NULL,
  `id_reclamo` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `veredicto` text NOT NULL,
  `motivo` text NOT NULL,
  PRIMARY KEY (`id_admin`,`id_reclamo`),
  KEY `id_reclamo` (`id_reclamo`),
  CONSTRAINT `admin_evaluacion_reclamo_ibfk_1` FOREIGN KEY (`id_admin`) REFERENCES `admin` (`cedula`),
  CONSTRAINT `admin_evaluacion_reclamo_ibfk_2` FOREIGN KEY (`id_reclamo`) REFERENCES `reclamo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_evaluacion_reclamo`
--

LOCK TABLES `admin_evaluacion_reclamo` WRITE;
/*!40000 ALTER TABLE `admin_evaluacion_reclamo` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_evaluacion_reclamo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_genera_registro`
--

DROP TABLE IF EXISTS `admin_genera_registro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_genera_registro` (
  `id_admin` varchar(8) NOT NULL,
  `id_registro` int(11) NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`id_admin`,`id_registro`),
  KEY `id_registro` (`id_registro`),
  CONSTRAINT `admin_genera_registro_ibfk_1` FOREIGN KEY (`id_admin`) REFERENCES `admin` (`cedula`),
  CONSTRAINT `admin_genera_registro_ibfk_2` FOREIGN KEY (`id_registro`) REFERENCES `registro_admin` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_genera_registro`
--

LOCK TABLES `admin_genera_registro` WRITE;
/*!40000 ALTER TABLE `admin_genera_registro` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_genera_registro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adulto`
--

DROP TABLE IF EXISTS `adulto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adulto` (
  `cedula` varchar(8) NOT NULL,
  `contrasena` varchar(30) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `ocupacion` varchar(50) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`cedula`),
  CONSTRAINT `adulto_ibfk_1` FOREIGN KEY (`cedula`) REFERENCES `persona` (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adulto`
--

LOCK TABLES `adulto` WRITE;
/*!40000 ALTER TABLE `adulto` DISABLE KEYS */;
/*!40000 ALTER TABLE `adulto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adulto_aporta_horas`
--

DROP TABLE IF EXISTS `adulto_aporta_horas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adulto_aporta_horas` (
  `id_aporte` int(11) NOT NULL,
  `cedula_adulto` varchar(8) NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`id_aporte`,`cedula_adulto`),
  KEY `cedula_adulto` (`cedula_adulto`),
  CONSTRAINT `adulto_aporta_horas_ibfk_1` FOREIGN KEY (`id_aporte`) REFERENCES `horas_semanales` (`id_aporte`),
  CONSTRAINT `adulto_aporta_horas_ibfk_2` FOREIGN KEY (`cedula_adulto`) REFERENCES `adulto` (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adulto_aporta_horas`
--

LOCK TABLES `adulto_aporta_horas` WRITE;
/*!40000 ALTER TABLE `adulto_aporta_horas` DISABLE KEYS */;
/*!40000 ALTER TABLE `adulto_aporta_horas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comprobante_pago`
--

DROP TABLE IF EXISTS `comprobante_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comprobante_pago` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cedula_emisor` varchar(8) NOT NULL,
  `cedula_titular` varchar(8) NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `estado` varchar(20) NOT NULL,
  `fecha` date NOT NULL,
  `documento` longblob NOT NULL,
  `id_admin` varchar(8) NOT NULL,
  `fecha_validacion` date NOT NULL,
  `motivo_validacion` text DEFAULT NULL,
  `veredicto` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cedula_emisor` (`cedula_emisor`),
  KEY `cedula_titular` (`cedula_titular`),
  KEY `id_admin` (`id_admin`),
  CONSTRAINT `comprobante_pago_ibfk_1` FOREIGN KEY (`cedula_emisor`) REFERENCES `persona` (`cedula`),
  CONSTRAINT `comprobante_pago_ibfk_2` FOREIGN KEY (`cedula_titular`) REFERENCES `titular` (`cedula`),
  CONSTRAINT `comprobante_pago_ibfk_3` FOREIGN KEY (`id_admin`) REFERENCES `admin` (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comprobante_pago`
--

LOCK TABLES `comprobante_pago` WRITE;
/*!40000 ALTER TABLE `comprobante_pago` DISABLE KEYS */;
/*!40000 ALTER TABLE `comprobante_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evaluacion_solicitud_registro`
--

DROP TABLE IF EXISTS `evaluacion_solicitud_registro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evaluacion_solicitud_registro` (
  `id_admin` varchar(8) NOT NULL,
  `id_solicitud` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `veredicto` text NOT NULL,
  `motivo` text NOT NULL,
  PRIMARY KEY (`id_admin`,`id_solicitud`),
  KEY `id_solicitud` (`id_solicitud`),
  CONSTRAINT `evaluacion_solicitud_registro_ibfk_1` FOREIGN KEY (`id_admin`) REFERENCES `admin` (`cedula`),
  CONSTRAINT `evaluacion_solicitud_registro_ibfk_2` FOREIGN KEY (`id_solicitud`) REFERENCES `solicitud_registro` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evaluacion_solicitud_registro`
--

LOCK TABLES `evaluacion_solicitud_registro` WRITE;
/*!40000 ALTER TABLE `evaluacion_solicitud_registro` DISABLE KEYS */;
/*!40000 ALTER TABLE `evaluacion_solicitud_registro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expulsion`
--

DROP TABLE IF EXISTS `expulsion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expulsion` (
  `id_expulsion` int(11) NOT NULL AUTO_INCREMENT,
  `id_admin` varchar(8) NOT NULL,
  `id_familia` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `motivo` text NOT NULL,
  PRIMARY KEY (`id_expulsion`),
  KEY `id_admin` (`id_admin`),
  KEY `id_familia` (`id_familia`),
  CONSTRAINT `expulsion_ibfk_1` FOREIGN KEY (`id_admin`) REFERENCES `admin` (`cedula`),
  CONSTRAINT `expulsion_ibfk_2` FOREIGN KEY (`id_familia`) REFERENCES `familia` (`id_familia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expulsion`
--

LOCK TABLES `expulsion` WRITE;
/*!40000 ALTER TABLE `expulsion` DISABLE KEYS */;
/*!40000 ALTER TABLE `expulsion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `familia`
--

DROP TABLE IF EXISTS `familia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `familia` (
  `id_familia` int(11) NOT NULL AUTO_INCREMENT,
  `estado` varchar(30) NOT NULL,
  `horas_semanales_minimas` int(11) NOT NULL,
  `id_unidad` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_familia`),
  UNIQUE KEY `id_unidad` (`id_unidad`),
  CONSTRAINT `familia_ibfk_1` FOREIGN KEY (`id_unidad`) REFERENCES `unidad_habitacional` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `familia`
--

LOCK TABLES `familia` WRITE;
/*!40000 ALTER TABLE `familia` DISABLE KEYS */;
/*!40000 ALTER TABLE `familia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horas_semanales`
--

DROP TABLE IF EXISTS `horas_semanales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `horas_semanales` (
  `id_aporte` int(11) NOT NULL AUTO_INCREMENT,
  `cedula_adulto` varchar(8) NOT NULL,
  `id_familia` int(11) NOT NULL,
  `inicio_semana` date NOT NULL,
  `fin_semana` date NOT NULL,
  `cant_horas` int(11) NOT NULL,
  `tarea` text DEFAULT NULL,
  PRIMARY KEY (`id_aporte`),
  KEY `cedula_adulto` (`cedula_adulto`),
  KEY `id_familia` (`id_familia`),
  CONSTRAINT `horas_semanales_ibfk_1` FOREIGN KEY (`cedula_adulto`) REFERENCES `adulto` (`cedula`),
  CONSTRAINT `horas_semanales_ibfk_2` FOREIGN KEY (`id_familia`) REFERENCES `familia` (`id_familia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horas_semanales`
--

LOCK TABLES `horas_semanales` WRITE;
/*!40000 ALTER TABLE `horas_semanales` DISABLE KEYS */;
/*!40000 ALTER TABLE `horas_semanales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persona` (
  `cedula` varchar(8) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `primer_apellido` varchar(30) NOT NULL,
  `segundo_apellido` varchar(30) DEFAULT NULL,
  `genero` varchar(1) NOT NULL,
  `foto` longblob NOT NULL,
  `declaracion_no_vivienda` longblob NOT NULL,
  `copia_cedula` longblob NOT NULL,
  `comprobante_ingresos` longblob DEFAULT NULL,
  PRIMARY KEY (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona_familia`
--

DROP TABLE IF EXISTS `persona_familia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persona_familia` (
  `cedula_persona` varchar(8) NOT NULL,
  `id_familia` int(11) NOT NULL,
  `rol` varchar(30) NOT NULL,
  PRIMARY KEY (`cedula_persona`,`id_familia`),
  KEY `id_familia` (`id_familia`),
  CONSTRAINT `persona_familia_ibfk_1` FOREIGN KEY (`cedula_persona`) REFERENCES `persona` (`cedula`),
  CONSTRAINT `persona_familia_ibfk_2` FOREIGN KEY (`id_familia`) REFERENCES `familia` (`id_familia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona_familia`
--

LOCK TABLES `persona_familia` WRITE;
/*!40000 ALTER TABLE `persona_familia` DISABLE KEYS */;
/*!40000 ALTER TABLE `persona_familia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prueba_expulsion`
--

DROP TABLE IF EXISTS `prueba_expulsion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prueba_expulsion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_expulsion` int(11) NOT NULL,
  `archivo` longblob NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_expulsion` (`id_expulsion`),
  CONSTRAINT `prueba_expulsion_ibfk_1` FOREIGN KEY (`id_expulsion`) REFERENCES `expulsion` (`id_expulsion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prueba_expulsion`
--

LOCK TABLES `prueba_expulsion` WRITE;
/*!40000 ALTER TABLE `prueba_expulsion` DISABLE KEYS */;
/*!40000 ALTER TABLE `prueba_expulsion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reclamo`
--

DROP TABLE IF EXISTS `reclamo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reclamo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `motivo` text NOT NULL,
  `estado` varchar(30) NOT NULL,
  `cedula_titular` varchar(8) NOT NULL,
  `fecha_envio` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cedula_titular` (`cedula_titular`),
  CONSTRAINT `reclamo_ibfk_1` FOREIGN KEY (`cedula_titular`) REFERENCES `titular` (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reclamo`
--

LOCK TABLES `reclamo` WRITE;
/*!40000 ALTER TABLE `reclamo` DISABLE KEYS */;
/*!40000 ALTER TABLE `reclamo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registro_admin`
--

DROP TABLE IF EXISTS `registro_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registro_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cedula_afectado` varchar(8) NOT NULL,
  `accion` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cedula_afectado` (`cedula_afectado`),
  CONSTRAINT `registro_admin_ibfk_1` FOREIGN KEY (`cedula_afectado`) REFERENCES `adulto` (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registro_admin`
--

LOCK TABLES `registro_admin` WRITE;
/*!40000 ALTER TABLE `registro_admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `registro_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sancion`
--

DROP TABLE IF EXISTS `sancion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sancion` (
  `id_sancion` int(11) NOT NULL AUTO_INCREMENT,
  `id_admin` varchar(8) NOT NULL,
  `id_familia` int(11) NOT NULL,
  `motivo` text NOT NULL,
  `monto_sancion` decimal(10,2) DEFAULT NULL,
  `horas_sancion` int(11) DEFAULT NULL,
  `pruebas` longblob DEFAULT NULL,
  PRIMARY KEY (`id_sancion`),
  KEY `id_admin` (`id_admin`),
  KEY `id_familia` (`id_familia`),
  CONSTRAINT `sancion_ibfk_1` FOREIGN KEY (`id_admin`) REFERENCES `admin` (`cedula`),
  CONSTRAINT `sancion_ibfk_2` FOREIGN KEY (`id_familia`) REFERENCES `familia` (`id_familia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sancion`
--

LOCK TABLES `sancion` WRITE;
/*!40000 ALTER TABLE `sancion` DISABLE KEYS */;
/*!40000 ALTER TABLE `sancion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitud_exoneracion_horas`
--

DROP TABLE IF EXISTS `solicitud_exoneracion_horas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solicitud_exoneracion_horas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_familia` int(11) NOT NULL,
  `pruebas` longblob NOT NULL,
  `motivo` text NOT NULL,
  `estado` varchar(30) NOT NULL,
  `cant_horas` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_familia` (`id_familia`),
  CONSTRAINT `solicitud_exoneracion_horas_ibfk_1` FOREIGN KEY (`id_familia`) REFERENCES `familia` (`id_familia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitud_exoneracion_horas`
--

LOCK TABLES `solicitud_exoneracion_horas` WRITE;
/*!40000 ALTER TABLE `solicitud_exoneracion_horas` DISABLE KEYS */;
/*!40000 ALTER TABLE `solicitud_exoneracion_horas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitud_exoneracion_titular`
--

DROP TABLE IF EXISTS `solicitud_exoneracion_titular`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solicitud_exoneracion_titular` (
  `id_solicitud` int(11) NOT NULL,
  `id_titular` varchar(8) NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`id_solicitud`,`id_titular`),
  KEY `id_titular` (`id_titular`),
  CONSTRAINT `solicitud_exoneracion_titular_ibfk_1` FOREIGN KEY (`id_solicitud`) REFERENCES `solicitud_exoneracion_horas` (`id`),
  CONSTRAINT `solicitud_exoneracion_titular_ibfk_2` FOREIGN KEY (`id_titular`) REFERENCES `titular` (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitud_exoneracion_titular`
--

LOCK TABLES `solicitud_exoneracion_titular` WRITE;
/*!40000 ALTER TABLE `solicitud_exoneracion_titular` DISABLE KEYS */;
/*!40000 ALTER TABLE `solicitud_exoneracion_titular` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitud_registro`
--

DROP TABLE IF EXISTS `solicitud_registro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solicitud_registro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_familia` int(11) NOT NULL,
  `cant_familiares` int(11) NOT NULL,
  `motivo` text NOT NULL,
  `estado` varchar(20) NOT NULL,
  `id_titular` varchar(8) NOT NULL,
  `fecha_envio` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_familia` (`id_familia`),
  KEY `id_titular` (`id_titular`),
  CONSTRAINT `solicitud_registro_ibfk_1` FOREIGN KEY (`id_familia`) REFERENCES `familia` (`id_familia`),
  CONSTRAINT `solicitud_registro_ibfk_2` FOREIGN KEY (`id_titular`) REFERENCES `titular` (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitud_registro`
--

LOCK TABLES `solicitud_registro` WRITE;
/*!40000 ALTER TABLE `solicitud_registro` DISABLE KEYS */;
/*!40000 ALTER TABLE `solicitud_registro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `titular`
--

DROP TABLE IF EXISTS `titular`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `titular` (
  `cedula` varchar(8) NOT NULL,
  PRIMARY KEY (`cedula`),
  CONSTRAINT `titular_ibfk_1` FOREIGN KEY (`cedula`) REFERENCES `adulto` (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `titular`
--

LOCK TABLES `titular` WRITE;
/*!40000 ALTER TABLE `titular` DISABLE KEYS */;
/*!40000 ALTER TABLE `titular` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `titulo`
--

DROP TABLE IF EXISTS `titulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `titulo` (
  `id_titulo` int(11) NOT NULL AUTO_INCREMENT,
  `id_comprobante` int(11) NOT NULL,
  `cedula_titular` varchar(8) NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`id_titulo`),
  KEY `id_comprobante` (`id_comprobante`),
  KEY `cedula_titular` (`cedula_titular`),
  CONSTRAINT `titulo_ibfk_1` FOREIGN KEY (`id_comprobante`) REFERENCES `comprobante_pago` (`id`),
  CONSTRAINT `titulo_ibfk_2` FOREIGN KEY (`cedula_titular`) REFERENCES `titular` (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `titulo`
--

LOCK TABLES `titulo` WRITE;
/*!40000 ALTER TABLE `titulo` DISABLE KEYS */;
/*!40000 ALTER TABLE `titulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidad_habitacional`
--

DROP TABLE IF EXISTS `unidad_habitacional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unidad_habitacional` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estado` varchar(30) NOT NULL,
  `cantidad_habitaciones` int(11) NOT NULL,
  `bloque` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidad_habitacional`
--

LOCK TABLES `unidad_habitacional` WRITE;
/*!40000 ALTER TABLE `unidad_habitacional` DISABLE KEYS */;
/*!40000 ALTER TABLE `unidad_habitacional` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `validacion_horas`
--

DROP TABLE IF EXISTS `validacion_horas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `validacion_horas` (
  `id_validacion` int(11) NOT NULL AUTO_INCREMENT,
  `id_aporte` int(11) NOT NULL,
  `id_admin` varchar(8) NOT NULL,
  `fecha` date NOT NULL,
  `motivo` text DEFAULT NULL,
  PRIMARY KEY (`id_validacion`),
  KEY `id_aporte` (`id_aporte`),
  KEY `id_admin` (`id_admin`),
  CONSTRAINT `validacion_horas_ibfk_1` FOREIGN KEY (`id_aporte`) REFERENCES `horas_semanales` (`id_aporte`),
  CONSTRAINT `validacion_horas_ibfk_2` FOREIGN KEY (`id_admin`) REFERENCES `admin` (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `validacion_horas`
--

LOCK TABLES `validacion_horas` WRITE;
/*!40000 ALTER TABLE `validacion_horas` DISABLE KEYS */;
/*!40000 ALTER TABLE `validacion_horas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-28  0:35:55
