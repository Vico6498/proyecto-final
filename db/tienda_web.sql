-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: tienda_web
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `direccion` text,
  `fecha_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `correo` (`correo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compras`
--

DROP TABLE IF EXISTS `compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compras` (
  `id` int NOT NULL AUTO_INCREMENT,
  `producto_id` int DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  `fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `producto_id` (`producto_id`),
  CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compras`
--

LOCK TABLES `compras` WRITE;
/*!40000 ALTER TABLE `compras` DISABLE KEYS */;
INSERT INTO `compras` VALUES (1,31,1,'2025-05-13 02:45:26'),(2,32,1,'2025-05-13 02:51:39'),(3,1,1,'2025-05-13 03:31:50'),(4,2,1,'2025-05-13 03:36:47');
/*!40000 ALTER TABLE `compras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text,
  `precio` decimal(10,2) NOT NULL,
  `stock` int NOT NULL DEFAULT '0',
  `fecha_agregado` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `imagen` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'Crema Hidratante','Crema para el cuidado facial',150.00,24,'2025-05-12 23:39:48','cremahidratante.png'),(2,'Gel Limpiador','Gel para limpieza diaria',120.00,29,'2025-05-12 23:39:48','gel-limpiador.png'),(3,'Protector Solar SPF 50','Protección solar de amplio espectro',200.00,20,'2025-05-12 23:39:48','protector-50.png'),(4,'Tónico Facial','Tónico refrescante sin alcohol',90.00,15,'2025-05-12 23:39:48','tonico.png'),(5,'Mascarilla de Arcilla','Purificante para piel grasa',180.00,10,'2025-05-12 23:39:48','arcilla.png'),(6,'Suero Antiedad','Reduce arrugas y líneas de expresión',300.00,8,'2025-05-12 23:39:48','antiedad.png'),(7,'Contorno de Ojos','Desinflama y reduce ojeras',180.00,14,'2025-05-12 23:39:48','ojos.png'),(8,'Agua Micelar','Desmaquillante y limpiador suave',110.00,22,'2025-05-12 23:39:48','micelar.png'),(9,'Bálsamo Labial','Hidratante para labios secos',50.00,50,'2025-05-12 23:39:48','labial.png'),(10,'Jabón Facial','Con ingredientes naturales',70.00,40,'2025-05-12 23:39:48','facial.png'),(11,'Exfoliante Suave','Remueve células muertas',130.00,18,'2025-05-12 23:39:48','exfoliante.png'),(12,'Crema de Día','Con filtro solar',160.00,12,'2025-05-12 23:39:48','dia.png'),(13,'Crema de Noche','Regeneradora intensiva',170.00,9,'2025-05-12 23:39:48','noche.png'),(14,'Aceite Facial','Hidratación profunda',220.00,7,'2025-05-12 23:39:48','aceite-facial.png'),(15,'Limpiador Espumoso','Ideal para piel mixta',115.00,30,'2025-05-12 23:39:48','espumoso.png'),(16,'Crema Antiacné','Tratamiento localizado',140.00,16,'2025-05-12 23:39:48','anti.png'),(17,'Mascarilla Hidratante','Para piel seca y sensible',190.00,11,'2025-05-12 23:39:48','mascarilla.png'),(18,'Tónico de Rosas','Calma e hidrata',100.00,17,'2025-05-12 23:39:48','rosas.png'),(19,'Crema Matificante','Controla el brillo facial',135.00,19,'2025-05-12 23:39:48','cremam.png'),(20,'Pads Exfoliantes','Uso diario',145.00,13,'2025-05-12 23:39:48','pads.png'),(21,'Ampolletas de Vitamina C','Luminosidad y firmeza',250.00,6,'2025-05-12 23:39:48','ampolletas.png'),(22,'Peeling Químico','Ácido glicólico al 10%',230.00,5,'2025-05-12 23:39:48','pellinf.png'),(23,'Mascarilla de Carbón','Elimina impurezas',175.00,8,'2025-05-12 23:39:48','carbon.png'),(24,'Serum Niacinamida','Controla grasa y poros',210.00,12,'2025-05-12 23:39:48','nia.png'),(25,'Spray Refrescante','Rocío facial calmante',95.00,20,'2025-05-12 23:39:48','refres.png'),(26,'Esencia Facial','Preparador para el serum',155.00,10,'2025-05-12 23:39:48','escenciaf.png'),(27,'Crema para Manos','Nutre e hidrata',80.00,25,'2025-05-12 23:39:48','cremam.png'),(28,'Gel Calmante','Post solar con aloe',105.00,18,'2025-05-12 23:39:48','gc.png'),(29,'Mascarilla de Colágeno','Reafirmante intensiva',195.00,9,'2025-05-12 23:39:48','colagenom.png'),(30,'Serum Retinol','Estimula la renovación celular',270.00,6,'2025-05-12 23:39:48','rs.png'),(31,'prueba1','1',1.00,0,'2025-05-13 02:38:23','6a7c2fcc4e0a624bd30c0181ecb77670.jpg'),(32,'prueba2','preuba2',11.00,1,'2025-05-13 02:51:21','6a7c2fcc4e0a624bd30c0181ecb77670.jpg'),(33,'Gel Calmante','Post solar con aloe',105.00,18,'2025-05-14 04:11:53','gc.png');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `clave` varchar(255) DEFAULT NULL,
  `rol` varchar(20) DEFAULT 'usuario',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'usuariop1','prueba1@gmail.com','$2y$10$vhNy6tip9PWkT7vrODfNDO/9tIOp9Fp/w7m8v469ZLcML8VoM9Ho6','usuario'),(2,'Administrador','admin@example.com','$2y$10$P3TBAuMrlGdCiw9sjUfL3OuOkF1CuDhL3iQlM9nxgn60ISgK2ZenC','admin');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-13 23:02:59
