-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: localhost    Database: dbproyecto
-- ------------------------------------------------------
-- Server version	5.6.26-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria` (
  `id_categoria` int(11) NOT NULL AUTO_INCREMENT,
  `categoria` varchar(100) NOT NULL,
  `estado` enum('0','1') NOT NULL,
  `id_usuario` int(11) NOT NULL,
  PRIMARY KEY (`id_categoria`),
  KEY `fk_categoria_usuarios_idx` (`id_usuario`),
  CONSTRAINT `fk_categoria_usuarios` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Tecnologia','1',26),(2,'Tecnologia','1',26),(4,'Autos','0',26),(5,'NUEVA','1',26),(6,'Hogar','1',26),(7,'Hogar','1',26),(8,'jsf','1',26),(9,'jsf hogar','1',26),(10,'Hogar','1',26),(11,'Hogar','1',26);
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientes` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `cedula_cliente` varchar(100) NOT NULL,
  `nombre_cliente` varchar(100) NOT NULL,
  `apellido_cliente` varchar(100) NOT NULL,
  `telefono_cliente` varchar(100) NOT NULL,
  `correo_cliente` varchar(100) NOT NULL,
  `direccion_cliente` varchar(100) NOT NULL,
  `fecha_ingreso` date NOT NULL,
  `estado` enum('0','1') NOT NULL,
  `id_usuario` int(11) NOT NULL,
  PRIMARY KEY (`id_cliente`),
  KEY `fk_clientes_usuario_idx` (`id_usuario`),
  CONSTRAINT `fk_clientes_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compras` (
  `id_compras` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_compra` date NOT NULL,
  `numero_compra` varchar(100) NOT NULL,
  `proveedor` varchar(100) NOT NULL,
  `cedula_proveedor` varchar(100) NOT NULL,
  `comprador` varchar(100) NOT NULL,
  `moneda` varchar(100) NOT NULL,
  `subtotal` varchar(100) NOT NULL,
  `total_iva` varchar(100) NOT NULL,
  `total` varchar(100) NOT NULL,
  `tipo_pago` varchar(100) NOT NULL,
  `estado` enum('0','1') NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_proveedor` int(11) NOT NULL,
  PRIMARY KEY (`id_compras`),
  KEY `fk_compras_usuario_idx` (`id_usuario`),
  KEY `fk_compras_proveedor_idx` (`id_proveedor`),
  CONSTRAINT `fk_compras_proveedor` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id_proveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_compras_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compras`
--

LOCK TABLES `compras` WRITE;
/*!40000 ALTER TABLE `compras` DISABLE KEYS */;
/*!40000 ALTER TABLE `compras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_compras`
--

DROP TABLE IF EXISTS `detalle_compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalle_compras` (
  `id_detalle_compras` int(11) NOT NULL AUTO_INCREMENT,
  `numero_compra` varchar(100) NOT NULL,
  `cedula_proveedor` varchar(100) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `producto` varchar(100) NOT NULL,
  `moneda` varchar(100) NOT NULL,
  `precio_compra` varchar(100) NOT NULL,
  `cantidad_compra` varchar(100) NOT NULL,
  `descuento` varchar(100) NOT NULL,
  `importe` varchar(100) NOT NULL,
  `fecha_compra` date NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_proveedor` int(11) NOT NULL,
  `estado` enum('0','1') NOT NULL,
  `id_categoria` int(11) NOT NULL,
  PRIMARY KEY (`id_detalle_compras`),
  KEY `fk_detalle_compras_producto_idx` (`id_producto`),
  KEY `fk_detalle_compras_usuario_idx` (`id_usuario`),
  KEY `fk_detalle_compras_proveedor_idx` (`id_proveedor`),
  KEY `fk_detalle_compras_categoria_idx` (`id_categoria`),
  CONSTRAINT `fk_detalle_compras_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalle_compras_producto` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalle_compras_proveedor` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id_proveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalle_compras_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_compras`
--

LOCK TABLES `detalle_compras` WRITE;
/*!40000 ALTER TABLE `detalle_compras` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_compras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_ventas`
--

DROP TABLE IF EXISTS `detalle_ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalle_ventas` (
  `id_detalle_ventas` int(11) NOT NULL AUTO_INCREMENT,
  `numero_venta` varchar(100) NOT NULL,
  `cedula_cliente` varchar(100) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `producto` varchar(100) NOT NULL,
  `moneda` varchar(100) NOT NULL,
  `precio_venta` varchar(100) NOT NULL,
  `cantidad_venta` varchar(100) NOT NULL,
  `descuento` varchar(100) NOT NULL,
  `importe` varchar(100) NOT NULL,
  `fecha_venta` date NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `estado` enum('0','1') NOT NULL,
  PRIMARY KEY (`id_detalle_ventas`),
  KEY `fk_detalle_ventas_producto_idx` (`id_producto`),
  KEY `fk_detalle_ventas_usuario_idx` (`id_usuario`),
  KEY `fk_detalle_ventas_clientes_idx` (`id_cliente`),
  CONSTRAINT `fk_detalle_ventas_clientes` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalle_ventas_producto` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalle_ventas_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_ventas`
--

LOCK TABLES `detalle_ventas` WRITE;
/*!40000 ALTER TABLE `detalle_ventas` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_ventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresa`
--

DROP TABLE IF EXISTS `empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empresa` (
  `id_empresa` int(11) NOT NULL AUTO_INCREMENT,
  `cedula_empresa` varchar(100) NOT NULL,
  `nombre_empresa` varchar(100) NOT NULL,
  `direccion_empresa` varchar(100) NOT NULL,
  `correo_empresa` varchar(100) NOT NULL,
  `telefono_empresa` varchar(100) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  PRIMARY KEY (`id_empresa`),
  KEY `fk_empresa_usuario_idx` (`id_usuario`),
  CONSTRAINT `fk_empresa_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa`
--

LOCK TABLES `empresa` WRITE;
/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
/*!40000 ALTER TABLE `empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oferta_empleo`
--

DROP TABLE IF EXISTS `oferta_empleo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oferta_empleo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_empresa` int(11) NOT NULL DEFAULT '0',
  `nombre_empresa` varchar(100) DEFAULT NULL,
  `area_empresa` varchar(20) DEFAULT NULL,
  `titulo_oferta` varchar(100) DEFAULT NULL,
  `cargo_solicitado` varchar(50) DEFAULT NULL,
  `puestos_vacantes` int(11) DEFAULT NULL,
  `tipo_de_contratacion` varchar(20) DEFAULT NULL,
  `nivel_de_experiencia` varchar(20) DEFAULT NULL,
  `genero` int(11) DEFAULT NULL,
  `edad` varchar(100) DEFAULT NULL,
  `salario_maximo` int(11) DEFAULT NULL,
  `salario_minimo` int(11) DEFAULT NULL,
  `vehiculo` varchar(2) DEFAULT NULL,
  `pais` varchar(40) DEFAULT NULL,
  `departamento` varchar(40) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `expiracion` date DEFAULT NULL,
  `descripcion_oferta` varchar(1500) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`,`id_empresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oferta_empleo`
--

LOCK TABLES `oferta_empleo` WRITE;
/*!40000 ALTER TABLE `oferta_empleo` DISABLE KEYS */;
/*!40000 ALTER TABLE `oferta_empleo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permisos`
--

DROP TABLE IF EXISTS `permisos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permisos` (
  `id_permiso` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id_permiso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permisos`
--

LOCK TABLES `permisos` WRITE;
/*!40000 ALTER TABLE `permisos` DISABLE KEYS */;
/*!40000 ALTER TABLE `permisos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producto` (
  `id_producto` int(11) NOT NULL AUTO_INCREMENT,
  `id_categoria` int(11) NOT NULL,
  `producto` varchar(100) NOT NULL,
  `presentacion` varchar(100) NOT NULL,
  `unidad` varchar(45) NOT NULL,
  `moneda` varchar(45) NOT NULL,
  `precio_compra` varchar(45) NOT NULL,
  `precio_venta` varchar(45) NOT NULL,
  `stock` varchar(45) NOT NULL,
  `estado` enum('0','1') NOT NULL,
  `imagen` varchar(45) NOT NULL,
  `fecha_vencimiento` date NOT NULL,
  `id_usuario` int(11) NOT NULL,
  PRIMARY KEY (`id_producto`),
  KEY `fk_producto_categoria_idx` (`id_categoria`),
  KEY `fk_producto_usuario_idx` (`id_usuario`),
  CONSTRAINT `fk_producto_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_producto_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,1,'samsung','nose','4','dolar','300','320','4','1','imagen','2020-10-10',26);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proveedor` (
  `id_proveedor` int(11) NOT NULL AUTO_INCREMENT,
  `cedula` varchar(45) NOT NULL,
  `razon_social` varchar(100) NOT NULL,
  `telefono` varchar(100) NOT NULL,
  `correo` varchar(45) NOT NULL,
  `direccion` varchar(150) NOT NULL,
  `fecha` date NOT NULL,
  `estado` enum('0','1') NOT NULL,
  `id_usuario` int(11) NOT NULL,
  PRIMARY KEY (`id_proveedor`),
  KEY `fk_proveedor_usuario_idx` (`id_usuario`),
  CONSTRAINT `fk_proveedor_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_permiso`
--

DROP TABLE IF EXISTS `usuario_permiso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario_permiso` (
  `id_usuario_permiso` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `id_permiso` int(11) NOT NULL,
  PRIMARY KEY (`id_usuario_permiso`),
  KEY `fk_usuario_permiso_usuario_idx` (`id_usuario`),
  KEY `fk_usuario_permiso_permiso_idx` (`id_permiso`),
  CONSTRAINT `fk_usuario_permiso_permiso` FOREIGN KEY (`id_permiso`) REFERENCES `permisos` (`id_permiso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_permiso_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_permiso`
--

LOCK TABLES `usuario_permiso` WRITE;
/*!40000 ALTER TABLE `usuario_permiso` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario_permiso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `cedula` varchar(100) NOT NULL,
  `telefono` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `cargo` enum('0','1') NOT NULL,
  `usuario` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `password2` varchar(100) NOT NULL,
  `fecha_ingreso` date NOT NULL,
  `estado` enum('0','1') NOT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `cedula` (`cedula`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'peticion 5','apellido peticion3','2222','00011001','postman3@gmail.com','UNA RUTA HTTP','1','user04','12323','asasdad','2020-05-30','1'),(4,'USUARIO 4 PROBADNO STATSUS 2','MANUEL  MANUEL','2323','00011001','add2esls2gmail.com','UNA RUTA HTTP','1','user04','12323','asasdad','2020-05-31','1'),(9,'peticion 5','apellido peticion3','37383838','00011001','Udd@gmail.com','UNA RUTA HTTP','1','user04','12323','asasdad','2020-05-31','1'),(16,'adasadd','MANUEL  MANUEL','1313','00011001','add2esl4@gmail.com','UNA RUTA HTTP','1','user04','12323','asasdad','2020-06-02','1'),(17,'adasadd','MANUEL  MANUEL','sss','00011001','add2esl2@gmail.com','UNA RUTA HTTP','1','user04','12323','asasdad','2020-06-02','1'),(18,'adasadd','MANUEL  MANUEL','ssss','00011001','add2esls2@gmail.com','UNA RUTA HTTP','1','user04','12323','asasdad','2020-06-02','1'),(19,'USUARIO 4 PROBADNO STATSUS 2','MANUEL  MANUEL','23223','00011001','add2emcksml@gmail.com','UNA RUTA HTTP','1','user04','$2y$10$0dK//riNrpeM1eB09xvWAe9YqEVw98IZDZQpFW3sHJu8kLaehidPu','$2y$10$1MCZTNRgPb.PEmaaAG5eueZ2SZ/NkORvFfX4FdGPAs9QAsbMiaJpi','2020-06-03','1'),(25,'psos','ROBzzxxRT','1101291','00011001','token7@gmail.com','UNA RUTA HTTP','1','user03','$2y$10$B69rGbd/AlOhiLkVv7gFcOb2RAxmyhUoDG9FaoFMMwBjB9k5SkHtO','$2y$10$B69rGbd/AlOhiLkVv7gFcOb2RAxmyhUoDG9FaoFMMwBjB9k5SkHtO','2020-06-03','1'),(26,'JUEVESAAGOSTO','ROBERT','05259903','00011001','postmanagosto@gmail.com','DIRECCIO DEN AGOSTO','1','useragosto','$2y$10$PtA2kx1rs2VjY6owTLNNQuH5MTMk1TrdUyfz.CcvZoxVBzxkZwHSC','$2y$10$PtA2kx1rs2VjY6owTLNNQuH5MTMk1TrdUyfz.CcvZoxVBzxkZwHSC','2020-08-07','1'),(27,'JUEVESAAGOSTO','ROBERT','052233','00011001','eitado@gmail.com','DIRECCIO DEN AGOSTO','1','useragosto','$2y$10$Uk1OFTxzUq0YNI1nfrGCOexurvvQr2TwRqNags3y1x1aq9zyly2CG','$2y$10$Uk1OFTxzUq0YNI1nfrGCOexurvvQr2TwRqNags3y1x1aq9zyly2CG','2020-08-09','1'),(28,'primerdesdeform','ENIODE SDE MODEL','20101','12323','MDEL@GMAIL.COM','ASDASDASDAD','1','userMODALXD','$2y$10$G0TuOeT23paSsjAhnNnjeO3BQq6N4gcVF.XwvX9cO.hHWiZ7tYQoS','$2y$10$G0TuOeT23paSsjAhnNnjeO3BQq6N4gcVF.XwvX9cO.hHWiZ7tYQoS','2020-08-09','1'),(29,'JUEVESAAGOSTO','ROBERT','0522332','00011001','eitadssso@gmail.com','DIRECCIO DEN AGOSTO','1','useragosto','$2y$10$6zE8Gp7u36BzL19roS/hYuwjUNcwTUDrh3OyR9X2lFYZzdpZBxMnS','$2y$10$6zE8Gp7u36BzL19roS/hYuwjUNcwTUDrh3OyR9X2lFYZzdpZBxMnS','2020-08-09','1'),(30,'adasadd','MANUEL  MANUEL','123123','00011001','add2essdls2@gmail.com','UNA RUTA HTTP','1','user04','$2y$10$m5odeY1/izCddeNYd/qLNeEB71h/df8XkuU2CjyUzrXR544RY3Uam','$2y$10$m5odeY1/izCddeNYd/qLNeEB71h/df8XkuU2CjyUzrXR544RY3Uam','2020-08-09','1'),(31,'adasadd','MANUEL  MANUEL','12312','00011001','ad2d2essdls2@gmail.com','UNA RUTA HTTP','1','user04','$2y$10$bbP76r/8vaNJhnJWWZG6xuIpoe03i8qg1Q.BAX1gvVM/vkF1WUIg.','$2y$10$bbP76r/8vaNJhnJWWZG6xuIpoe03i8qg1Q.BAX1gvVM/vkF1WUIg.','2020-08-09','1'),(32,'adasadd','MANUEL  MANUEL','1231213','00011001','add2e2ssdls2@gmail.com','UNA RUTA HTTP','1','user04','$2y$10$PobDxE2NtvQsEzhpmYK0regdEVSkroH5Hr8BgeyUYmYGrH6v3lGZO','$2y$10$PobDxE2NtvQsEzhpmYK0regdEVSkroH5Hr8BgeyUYmYGrH6v3lGZO','2020-08-09','1'),(33,'adasadd','MANUEL  MANUEL','123','00011001','promtp@gmail.com','UNA RUTA HTTP','1','user04','$2y$10$eqmX6J.Y2tMr.fOAf3OhLerJZhbhYKvqQ0Z9M000b.84aOYh6cYfS','$2y$10$eqmX6J.Y2tMr.fOAf3OhLerJZhbhYKvqQ0Z9M000b.84aOYh6cYfS','2020-08-09','1'),(34,'adasadd','MANUEL  MANUEL','12312322','00011001','add222essdls2@gmail.com','UNA RUTA HTTP','1','user04','$2y$10$GcPA9ZlGnTDxihtZVgkMm.cCKHsCmza5Pl60STphgKPGXUQT4K0vW','$2y$10$GcPA9ZlGnTDxihtZVgkMm.cCKHsCmza5Pl60STphgKPGXUQT4K0vW','2020-08-09','1'),(35,'adasadd','MANUEL  MANUEL','89','00011001','add2sdls2@gmail.com','UNA RUTA HTTP','1','user04','$2y$10$fgo32eqX.na51gLnT4EBLuAzoiJXE28JcgFHc95tveSMR9j820u3S','$2y$10$fgo32eqX.na51gLnT4EBLuAzoiJXE28JcgFHc95tveSMR9j820u3S','2020-08-09','1'),(36,'adasadd','MANUEL  MANUEL','13132','00011001','add2lc4@gmail.com','UNA RUTA HTTP','1','user04','$2y$10$EKSDul1kXEkB/pXH.oGYeuvsqgDjNwnVXROe.Af6QBdNXWFD49JGG','$2y$10$EKSDul1kXEkB/pXH.oGYeuvsqgDjNwnVXROe.Af6QBdNXWFD49JGG','2020-08-09','1'),(37,'adasadd','MANUEL  MANUEL','1313233','00011001','add2lc2224@gmail.com','UNA RUTA HTTP','1','user04','$2y$10$CPggPXM21aCLMvHjPrc2Re6ZTqwe3/Bflvtt.4SmtrSu53PUqPRsq','$2y$10$CPggPXM21aCLMvHjPrc2Re6ZTqwe3/Bflvtt.4SmtrSu53PUqPRsq','2020-08-09','1'),(38,'adasadd','MANUEL  MANUEL','13222','00011001','add2jdasdl224@gmail.com','UNA RUTA HTTP','1','user04','$2y$10$LjDZE9oLl63gZQcjMLmrYuiM/eN7Bv9k2/HXFthxembN/B.EVG/l.','$2y$10$LjDZE9oLl63gZQcjMLmrYuiM/eN7Bv9k2/HXFthxembN/B.EVG/l.','2020-08-09','1');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ventas` (
  `id_ventas` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_venta` date NOT NULL,
  `numero_venta` varchar(100) NOT NULL,
  `cliente` varchar(100) NOT NULL,
  `cedula_cliente` varchar(100) NOT NULL,
  `vendedor` varchar(100) NOT NULL,
  `moneda` varchar(100) NOT NULL,
  `subtotal` varchar(100) NOT NULL,
  `total_iva` varchar(100) NOT NULL,
  `total` varchar(100) NOT NULL,
  `tipo_pago` varchar(100) NOT NULL,
  `estado` enum('0','1') NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  PRIMARY KEY (`id_ventas`),
  KEY `fk_ventas_usuario_idx` (`id_usuario`),
  KEY `fk_ventas_cliente_idx` (`id_cliente`),
  CONSTRAINT `fk_ventas_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ventas_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-02 17:56:45
-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: localhost    Database: basereserva
-- ------------------------------------------------------
-- Server version	5.6.26-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `IdPersona` int(11) NOT NULL,
  `CodigoCliente` varchar(45) NOT NULL,
  PRIMARY KEY (`IdPersona`),
  UNIQUE KEY `CodigoCliente_UNIQUE` (`CodigoCliente`),
  CONSTRAINT `fk_Persona_Cliente` FOREIGN KEY (`IdPersona`) REFERENCES `persona` (`IdPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consumo`
--

DROP TABLE IF EXISTS `consumo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consumo` (
  `IdConsumo` int(11) NOT NULL AUTO_INCREMENT,
  `IdReserva` int(11) NOT NULL,
  `IdProducto` int(11) NOT NULL,
  `Cantidad` decimal(7,2) NOT NULL,
  `PrecioVenta` decimal(7,2) NOT NULL,
  `Estado` varchar(15) NOT NULL,
  PRIMARY KEY (`IdConsumo`),
  KEY `fk_Consumo_Producto_idx` (`IdProducto`),
  KEY `fk_Consumo_Reserva_idx` (`IdReserva`),
  CONSTRAINT `fk_Consumo_Producto` FOREIGN KEY (`IdProducto`) REFERENCES `producto` (`IdProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Consumo_Reserva` FOREIGN KEY (`IdReserva`) REFERENCES `reserva` (`IdReserva`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consumo`
--

LOCK TABLES `consumo` WRITE;
/*!40000 ALTER TABLE `consumo` DISABLE KEYS */;
/*!40000 ALTER TABLE `consumo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `habitacion`
--

DROP TABLE IF EXISTS `habitacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `habitacion` (
  `IdHabitacion` int(11) NOT NULL AUTO_INCREMENT,
  `Numero` varchar(4) NOT NULL,
  `Piso` varchar(2) NOT NULL,
  `Descripcion` varchar(255) DEFAULT NULL,
  `Caracteristica` varchar(512) DEFAULT NULL,
  `PrecioDiario` decimal(7,2) NOT NULL,
  `Estado` varchar(15) NOT NULL,
  `TipoHabitacion` varchar(20) NOT NULL,
  PRIMARY KEY (`IdHabitacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `habitacion`
--

LOCK TABLES `habitacion` WRITE;
/*!40000 ALTER TABLE `habitacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `habitacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pago`
--

DROP TABLE IF EXISTS `pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pago` (
  `IdPago` int(11) NOT NULL AUTO_INCREMENT,
  `IdReserva` int(11) NOT NULL,
  `TipoComprobante` varchar(45) NOT NULL,
  `NumComprobante` varchar(45) NOT NULL,
  `Igv` decimal(4,2) NOT NULL,
  `TotalPago` decimal(7,2) NOT NULL,
  `FechaEmision` date NOT NULL,
  `FechaPago` date NOT NULL,
  PRIMARY KEY (`IdPago`),
  KEY `fk_Pago_Reseva_idx` (`IdReserva`),
  CONSTRAINT `fk_Pago_Reseva` FOREIGN KEY (`IdReserva`) REFERENCES `reserva` (`IdReserva`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pago`
--

LOCK TABLES `pago` WRITE;
/*!40000 ALTER TABLE `pago` DISABLE KEYS */;
/*!40000 ALTER TABLE `pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persona` (
  `IdPersona` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(20) NOT NULL,
  `APaterno` varchar(45) NOT NULL,
  `AMaterno` varchar(45) NOT NULL,
  `TipoDocumento` varchar(45) NOT NULL,
  `NumeroDocumento` varchar(45) NOT NULL,
  `Direccion` varchar(100) DEFAULT NULL,
  `Telefono` varchar(45) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`IdPersona`),
  UNIQUE KEY `Telefono_UNIQUE` (`Telefono`),
  UNIQUE KEY `Email_UNIQUE` (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producto` (
  `IdProducto` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) NOT NULL,
  `Descripcion` varchar(255) DEFAULT NULL,
  `UnidadMedida` varchar(45) NOT NULL,
  `PrecioVenta` decimal(7,2) NOT NULL,
  PRIMARY KEY (`IdProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reserva`
--

DROP TABLE IF EXISTS `reserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reserva` (
  `IdReserva` int(11) NOT NULL AUTO_INCREMENT,
  `IdHabitacion` int(11) NOT NULL,
  `IdCliente` int(11) NOT NULL,
  `IdTrabajador` int(11) NOT NULL,
  `TipoReserva` varchar(45) NOT NULL,
  `FechaReserva` date NOT NULL,
  `FechaIngreso` date NOT NULL,
  `FechaSalida` date NOT NULL,
  `CostoAlojamiento` decimal(7,2) NOT NULL,
  `Estado` varchar(45) NOT NULL,
  PRIMARY KEY (`IdReserva`),
  KEY `fk_Reserva_Habitacion_idx` (`IdHabitacion`),
  KEY `fk_Reserva_Cliente_idx` (`IdCliente`),
  KEY `fk_Reserva_Trabajador_idx` (`IdTrabajador`),
  CONSTRAINT `fk_Reserva_Cliente` FOREIGN KEY (`IdCliente`) REFERENCES `cliente` (`IdPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Reserva_Habitacion` FOREIGN KEY (`IdHabitacion`) REFERENCES `habitacion` (`IdHabitacion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Reserva_Trabajador` FOREIGN KEY (`IdTrabajador`) REFERENCES `trabajador` (`IdPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserva`
--

LOCK TABLES `reserva` WRITE;
/*!40000 ALTER TABLE `reserva` DISABLE KEYS */;
/*!40000 ALTER TABLE `reserva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trabajador`
--

DROP TABLE IF EXISTS `trabajador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trabajador` (
  `IdPersona` int(11) NOT NULL,
  `Sueldo` decimal(7,2) NOT NULL,
  `Acceso` varchar(15) NOT NULL,
  `Login` varchar(45) NOT NULL,
  `Password` varchar(45) NOT NULL,
  `Estadol` varchar(1) NOT NULL,
  PRIMARY KEY (`IdPersona`),
  UNIQUE KEY `Login_UNIQUE` (`Login`),
  CONSTRAINT `fk_Persona_Trabajador` FOREIGN KEY (`IdPersona`) REFERENCES `persona` (`IdPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trabajador`
--

LOCK TABLES `trabajador` WRITE;
/*!40000 ALTER TABLE `trabajador` DISABLE KEYS */;
/*!40000 ALTER TABLE `trabajador` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-02 17:56:45
