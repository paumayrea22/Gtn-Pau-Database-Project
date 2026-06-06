CREATE DATABASE  IF NOT EXISTS `gym_pau` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `gym_pau`;
-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: gym_pau
-- ------------------------------------------------------
-- Server version	9.6.0

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '521b111e-10e4-11f1-ade2-0a0027000006:1-252';

--
-- Table structure for table `actividades`
--

DROP TABLE IF EXISTS `actividades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actividades` (
  `id_actividad` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(250) DEFAULT NULL,
  `Tipo_Actividad_id_tipo` int NOT NULL,
  `Tarifa_Actividad_id_tarifa_actividad` int NOT NULL,
  PRIMARY KEY (`id_actividad`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`),
  KEY `fk_Actividad_Tipo_Actividad1_idx` (`Tipo_Actividad_id_tipo`),
  KEY `fk_Actividad_Tarifa_Actividad1_idx` (`Tarifa_Actividad_id_tarifa_actividad`),
  CONSTRAINT `fk_Actividad_Tarifa_Actividad1` FOREIGN KEY (`Tarifa_Actividad_id_tarifa_actividad`) REFERENCES `tarifas_actividades` (`id_tarifa_actividad`),
  CONSTRAINT `fk_Actividad_Tipo_Actividad1` FOREIGN KEY (`Tipo_Actividad_id_tipo`) REFERENCES `tipos_actividades` (`id_tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actividades`
--

LOCK TABLES `actividades` WRITE;
/*!40000 ALTER TABLE `actividades` DISABLE KEYS */;
INSERT INTO `actividades` VALUES (1,'Iniciación a la Musculación','Clase para aprender técnicas básicas',1,1),(2,'Zumba Party','Baile y cardio a ritmo latino',8,2),(3,'Spinning Montaña','Simulación de subidas en bici',9,2),(4,'Crossfit WOD','Entrenamiento del día de alta intensidad',3,3),(5,'Yoga Amanecer','Yoga para empezar el día con energía',6,2),(6,'Pilates Core','Fortalecimiento de la zona abdominal y lumbar',7,2),(7,'Body Pump Total','Levantamiento de pesas con coreografía',10,2),(8,'Body Combat Extreme','Cardio inspirado en artes marciales',11,2),(9,'Boxeo Technique','Técnica de golpeo en saco y manoplas',13,3),(10,'Masterclass Glúteos','Especialización en tren inferior',20,16),(11,'AquaFitness','Gimnasia en la piscina sin impacto',16,2),(12,'TRX Suspensión','Fuerza usando el propio peso corporal',12,3),(13,'Movilidad y Foam Roller','Recuperación activa y estiramientos',17,1),(14,'Calistenia Avanzada','Trucos y ejercicios en barra',18,3),(15,'Clínic Powerlifting','Mejora de sentadilla, banca y peso muerto',5,4),(16,'MMA Sparring','Combate controlado para nivel intermedio',14,3),(17,'Halterofilia Olímpica','Técnica de Arrancada y Dos Tiempos',4,3),(18,'Entrenamiento Personal VIP','Sesión exclusiva 1 a 1',1,11),(19,'Asesoría Nutricional','Medición y dieta personalizada',1,14),(20,'Fisioterapia Descarga','Masaje deportivo preventivo',1,15);
/*!40000 ALTER TABLE `actividades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id_usuario` int NOT NULL,
  `dni` varchar(9) NOT NULL,
  `direccion` varchar(150) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `estado_cuenta` varchar(50) NOT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `dni_UNIQUE` (`dni`),
  KEY `fk_Cliente_Usuario1_idx` (`id_usuario`),
  CONSTRAINT `fk_Cliente_Usuario1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (21,'11111111A','Gold Coast 1','600111222','Activo'),(22,'22222222B','Texas Avenue 2','600222333','Activo'),(23,'33333333C','Vegas Strip 3','600333444','Activo'),(24,'44444444D','Birmingham St 4','600444555','Inactivo'),(25,'55555555E','Atlanta Blvd 5','600555666','Activo'),(26,'66666666F','Denver Road 6','600666777','Activo'),(27,'77777777G','Sardinia Way 7','600777888','Activo'),(28,'88888888H','Florida St 8','600888999','Pendiente Pago'),(29,'99999999I','Maryland Ave 9','600999000','Activo'),(30,'10101010J','Cairo Street 10','601111222','Activo'),(31,'12121212K','Tehran Blvd 11','601222333','Activo'),(32,'13131313L','Florida St 12','601333444','Inactivo'),(33,'14141414M','New York 13','601444555','Activo'),(34,'15151515N','Texas Pkwy 14','601555666','Activo'),(35,'16161616O','London Eye 15','601666777','Activo'),(36,'17171717P','Brooklyn 16','601777888','Pendiente Pago'),(37,'18181818Q','Curacao 17','601888999','Activo'),(38,'19191919R','Germany St 18','601999000','Activo'),(39,'20202020S','Maryland 19','602111222','Inactivo'),(40,'21212121T','Cali Way 20','602222333','Activo');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `efectivos`
--

DROP TABLE IF EXISTS `efectivos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `efectivos` (
  `cambio` decimal(6,2) NOT NULL,
  `Pago_id_pago` int NOT NULL,
  PRIMARY KEY (`Pago_id_pago`),
  CONSTRAINT `fk_Efectivo_Pago1` FOREIGN KEY (`Pago_id_pago`) REFERENCES `pagos` (`id_pago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `efectivos`
--

LOCK TABLES `efectivos` WRITE;
/*!40000 ALTER TABLE `efectivos` DISABLE KEYS */;
INSERT INTO `efectivos` VALUES (10.01,2),(15.00,8),(4.01,11),(0.01,13),(2.50,15),(0.00,18),(14.00,20);
/*!40000 ALTER TABLE `efectivos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `id_usuario` int NOT NULL,
  `nuss` varchar(45) NOT NULL,
  `cargo` varchar(50) NOT NULL,
  `turno` varchar(20) NOT NULL,
  `Gimnasio_id_gimnasio` int NOT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `nss_UNIQUE` (`nuss`),
  KEY `fk_Empleado_Gimnasio1_idx` (`Gimnasio_id_gimnasio`),
  KEY `fk_Empleado_Usuario1_idx` (`id_usuario`),
  CONSTRAINT `fk_Empleado_Gimnasio1` FOREIGN KEY (`Gimnasio_id_gimnasio`) REFERENCES `gimnasios` (`id_gimnasio`),
  CONSTRAINT `fk_Empleado_Usuario1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (1,'ES12345678901','Administrador BD','Mañana',20),(2,'ES12345678902','Entrenador Personal','Tarde',20),(3,'ES12345678903','Monitor de Sala','Mañana',20),(4,'ES12345678904','Instructor Clases','Tarde',20),(5,'ES12345678905','Nutricionista','Mañana',20),(6,'ES12345678906','Entrenador Personal','Partido',20),(7,'ES12345678907','Mantenimiento','Noche',20),(8,'ES12345678908','Coordinador Deportivo','Mañana',20),(9,'ES12345678909','Becario DAM','Tarde',20),(10,'ES12345678910','Marketing','Mañana',20),(11,'ES12345678911','Seguridad','Noche',20),(12,'ES12345678912','Director Deportivo','Partido',1),(13,'ES12345678913','Entrenador Élite','Tarde',1),(14,'ES12345678914','Instructor Posing','Mañana',1),(15,'ES12345678915','Creador de Contenido','Partido',20),(16,'ES12345678916','Promotor','Tarde',20),(17,'ES12345678917','Entrenador Fuerza','Mañana',1),(18,'ES12345678918','Director Técnico','Partido',9),(19,'ES12345678919','Seguridad VIP','Noche',9),(20,'ES12345678920','Mantenimiento Pesado','Mañana',9);
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gimnasios`
--

DROP TABLE IF EXISTS `gimnasios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gimnasios` (
  `id_gimnasio` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `ciudad` varchar(50) NOT NULL,
  `direccion` varchar(150) NOT NULL,
  PRIMARY KEY (`id_gimnasio`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gimnasios`
--

LOCK TABLES `gimnasios` WRITE;
/*!40000 ALTER TABLE `gimnasios` DISABLE KEYS */;
INSERT INTO `gimnasios` VALUES (1,'Golds Gym Venice','Los Angeles','320 Hampton Dr, Venice'),(2,'Metroflex Gym','Arlington','201 E Division St'),(3,'Oxygen Gym','Kuwait','Jabriya, Kuwait City'),(4,'Powerhouse Gym','Tampa','1000 W Kennedy Blvd'),(5,'Bev Francis Powerhouse','Syosset','235 Robbins Ln'),(6,'Titan Fitness','Sydney','1/29-31 O\'Riordan St'),(7,'Muscle Beach Gym','Santa Monica','Ocean Front Walk'),(8,'Dorian Yates Temple','Birmingham','11-12 Hurst St'),(9,'Westside Barbell','Columbus','Secret Location'),(10,'Iron Addicts Gym','Miami','31 NE 17th St'),(11,'City Athletic Club','Las Vegas','7980 W Sahara Ave'),(12,'Quads Gym','Chicago','3727 N Broadway'),(13,'Alphalete Gym','Houston','1302 Texas Pkwy'),(14,'Zoo Culture','Woodland Hills','20725 Erwin St'),(15,'Binous Gym','Dubai','Al Quoz Industrial Area 3'),(16,'McFit Paterna','Paterna','Av. de Europa 22'),(17,'Basic-Fit Paterna','Paterna','Carrer de la Ciutat de Llíria'),(18,'Synergym Paterna','Paterna','Carrer Major 15'),(19,'Fitness Park Valencia','Valencia','Centro Comercial MN4'),(20,'IES Henri Matisse Gym','Paterna','Instalaciones del instituto');
/*!40000 ALTER TABLE `gimnasios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagos`
--

DROP TABLE IF EXISTS `pagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagos` (
  `id_pago` int NOT NULL AUTO_INCREMENT,
  `metodo` varchar(45) NOT NULL,
  `importe` decimal(6,2) NOT NULL,
  `fecha` date NOT NULL,
  `Pedido_id_pedido` int DEFAULT NULL,
  `Suscripcion_id_suscripcion` int DEFAULT NULL,
  PRIMARY KEY (`id_pago`),
  KEY `fk_Pago_Pedido1_idx` (`Pedido_id_pedido`),
  KEY `fk_Pago_Suscripcion1_idx` (`Suscripcion_id_suscripcion`),
  CONSTRAINT `fk_Pago_Pedido1` FOREIGN KEY (`Pedido_id_pedido`) REFERENCES `pedidos` (`id_pedido`),
  CONSTRAINT `fk_Pago_Suscripcion1` FOREIGN KEY (`Suscripcion_id_suscripcion`) REFERENCES `suscripciones` (`id_suscripcion`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagos`
--

LOCK TABLES `pagos` WRITE;
/*!40000 ALTER TABLE `pagos` DISABLE KEYS */;
INSERT INTO `pagos` VALUES (1,'Tarjeta',29.99,'2024-01-01',NULL,1),(2,'Efectivo',39.99,'2024-01-15',NULL,2),(3,'Transferencia',59.99,'2024-02-01',NULL,3),(4,'Tarjeta',99.99,'2024-02-10',NULL,4),(5,'Tarjeta',299.99,'2024-01-01',NULL,5),(6,'Transferencia',399.99,'2024-01-05',NULL,6),(7,'Tarjeta',599.99,'2024-02-01',NULL,7),(8,'Efectivo',85.00,'2024-03-01',NULL,8),(9,'Transferencia',110.00,'2024-03-05',NULL,9),(10,'Tarjeta',160.00,'2024-01-20',NULL,10),(11,'Efectivo',45.99,'2024-03-01',1,NULL),(12,'Tarjeta',25.50,'2024-03-01',2,NULL),(13,'Efectivo',19.99,'2024-03-02',4,NULL),(14,'Tarjeta',44.00,'2024-03-03',5,NULL),(15,'Efectivo',7.50,'2024-03-03',6,NULL),(16,'Transferencia',8.99,'2024-03-04',8,NULL),(17,'Tarjeta',30.00,'2024-03-05',9,NULL),(18,'Efectivo',25.00,'2024-03-06',11,NULL),(19,'Tarjeta',65.00,'2024-03-06',12,NULL),(20,'Efectivo',36.00,'2024-03-07',13,NULL);
/*!40000 ALTER TABLE `pagos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `id_pedido` int NOT NULL AUTO_INCREMENT,
  `estado` varchar(45) NOT NULL,
  `fecha_pedido` datetime NOT NULL,
  `total_pedido` decimal(6,2) NOT NULL,
  `Cliente_id_usuario` int NOT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `fk_Pedido_Cliente1_idx` (`Cliente_id_usuario`),
  CONSTRAINT `fk_Pedido_Cliente1` FOREIGN KEY (`Cliente_id_usuario`) REFERENCES `clientes` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (1,'Entregado','2024-03-01 10:15:00',45.99,21),(2,'Entregado','2024-03-01 11:30:00',25.50,22),(3,'Pendiente','2024-03-02 09:00:00',30.00,23),(4,'Entregado','2024-03-02 18:45:00',19.99,24),(5,'Entregado','2024-03-03 12:00:00',44.00,25),(6,'Entregado','2024-03-03 19:10:00',7.50,26),(7,'Cancelado','2024-03-04 08:30:00',1.50,27),(8,'Entregado','2024-03-04 20:00:00',8.99,28),(9,'Entregado','2024-03-05 14:20:00',30.00,29),(10,'Pendiente','2024-03-05 17:00:00',45.00,30),(11,'Entregado','2024-03-06 10:00:00',25.00,31),(12,'Entregado','2024-03-06 16:30:00',65.00,32),(13,'Entregado','2024-03-07 11:15:00',36.00,33),(14,'Entregado','2024-03-07 18:00:00',19.00,34),(15,'Pendiente','2024-03-08 09:45:00',12.00,35),(16,'Entregado','2024-03-08 21:30:00',11.00,36),(17,'Entregado','2024-03-09 13:00:00',14.99,37),(18,'Entregado','2024-03-09 19:20:00',39.80,38),(19,'Entregado','2024-03-10 10:00:00',24.00,39),(20,'Entregado','2024-03-10 15:45:00',2.00,40);
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos_productos`
--

DROP TABLE IF EXISTS `pedidos_productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos_productos` (
  `Pedido_id_pedido` int NOT NULL,
  `Producto_id_producto` int NOT NULL,
  `cantidad` int NOT NULL,
  PRIMARY KEY (`Pedido_id_pedido`,`Producto_id_producto`),
  KEY `fk_Pedido_has_Productos_Productos1_idx` (`Producto_id_producto`),
  KEY `fk_Pedido_has_Productos_Pedido1_idx` (`Pedido_id_pedido`),
  CONSTRAINT `fk_Pedido_has_Productos_Pedido1` FOREIGN KEY (`Pedido_id_pedido`) REFERENCES `pedidos` (`id_pedido`),
  CONSTRAINT `fk_Pedido_has_Productos_Productos1` FOREIGN KEY (`Producto_id_producto`) REFERENCES `productos` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos_productos`
--

LOCK TABLES `pedidos_productos` WRITE;
/*!40000 ALTER TABLE `pedidos_productos` DISABLE KEYS */;
INSERT INTO `pedidos_productos` VALUES (1,1,1),(2,2,1),(3,3,1),(4,4,1),(5,5,2),(6,6,3),(7,7,1),(8,8,1),(9,9,2),(10,10,1),(11,11,2),(12,12,1),(13,13,2),(14,14,2),(15,15,2),(16,16,2),(17,17,1),(18,18,2),(19,19,1),(20,20,2);
/*!40000 ALTER TABLE `pedidos_productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permisos`
--

DROP TABLE IF EXISTS `permisos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permisos` (
  `id_permiso` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id_permiso`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permisos`
--

LOCK TABLES `permisos` WRITE;
/*!40000 ALTER TABLE `permisos` DISABLE KEYS */;
INSERT INTO `permisos` VALUES (1,'Acceso_Total','Permite realizar cualquier acción en el sistema'),(2,'Gestionar_Usuarios','Crear, editar o borrar usuarios'),(3,'Cobrar_Cuotas','Procesar pagos de suscripciones'),(4,'Vender_Productos','Procesar ventas en la tienda del gimnasio'),(5,'Crear_Clases','Añadir nuevas sesiones al calendario'),(6,'Modificar_Horarios','Cambiar fechas u horas de sesiones'),(7,'Ver_Facturacion','Acceso a informes de ingresos'),(8,'Gestionar_Stock','Añadir o quitar inventario de productos'),(9,'Abrir_Caja','Iniciar el turno en recepción'),(10,'Cerrar_Caja','Finalizar el turno y cuadrar cuentas'),(11,'Fichar_Entrada','Registro de jornada laboral'),(12,'Ver_Rutinas','Acceso a los planes de entrenamiento'),(13,'Gestionar_Salas','Bloquear o habilitar salas del centro'),(14,'Enviar_Correos','Permiso para marketing y avisos'),(15,'Anular_Recibos','Cancelar un pago erróneo'),(16,'Ver_Historial_Medico','Acceso exclusivo a lesiones (Solo Médicos)'),(17,'Gestionar_Nomina','Acceso a salarios de empleados'),(18,'Mantenimiento_App','Acceso a logs del sistema'),(19,'Bloquear_Torno','Control manual de los tornos de acceso'),(20,'Aplicar_Descuentos','Permite rebajar precios en ventas manuales');
/*!40000 ALTER TABLE `permisos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `id_producto` int NOT NULL AUTO_INCREMENT,
  `precio` decimal(6,2) NOT NULL,
  `cantidad` int NOT NULL,
  `descripcion` varchar(250) NOT NULL,
  PRIMARY KEY (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,45.99,100,'Whey Protein Optimum Nutrition (Sabor Chocolate)'),(2,25.50,150,'Creatina Monohidrato Creapure 500g'),(3,30.00,80,'Pre-entrenamiento C4 Original'),(4,19.99,200,'BCAA 2:1:1 Xtend (Sandía)'),(5,22.00,50,'Glutamina en polvo 300g'),(6,2.50,500,'Barrita Proteica Barebells (Caramelo y Anacardos)'),(7,1.50,600,'Bebida Energética Monster Zero Ultra'),(8,8.99,120,'Shaker Golds Gym Oficial 700ml'),(9,15.00,90,'Camiseta Tirantes Stringer Gym_Pau'),(10,45.00,30,'Cinturón de Levantamiento de Cuero RDX'),(11,12.50,100,'Straps (Agarraderas) para peso muerto'),(12,65.00,20,'Rodilleras SBD de Neopreno para Powerlifting'),(13,18.00,80,'Muñequeras Elásticas Inzer'),(14,9.50,150,'Magnesio Líquido para mejor agarre'),(15,6.00,300,'Toalla de Microfibra logo Gym_Pau'),(16,5.50,200,'Candado de combinación para taquillas'),(17,14.99,100,'Multivitamínico Animal Pak'),(18,19.90,85,'Omega 3 Aceite de Pescado'),(19,24.00,60,'Caseína Micelar Nocturna (Sabor Vainilla)'),(20,1.00,1000,'Botella de Agua Mineral 1.5L');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservas`
--

DROP TABLE IF EXISTS `reservas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservas` (
  `id_reserva` int NOT NULL AUTO_INCREMENT,
  `fecha` datetime NOT NULL,
  `estado` varchar(50) NOT NULL,
  `Sesion_id_sesion` int NOT NULL,
  `Cliente_id_usuario` int NOT NULL,
  PRIMARY KEY (`id_reserva`),
  KEY `fk_Reserva_Sesion1_idx` (`Sesion_id_sesion`),
  KEY `fk_Reserva_Cliente1_idx` (`Cliente_id_usuario`),
  CONSTRAINT `fk_Reserva_Cliente1` FOREIGN KEY (`Cliente_id_usuario`) REFERENCES `clientes` (`id_usuario`),
  CONSTRAINT `fk_Reserva_Sesion1` FOREIGN KEY (`Sesion_id_sesion`) REFERENCES `sesiones` (`id_sesion`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservas`
--

LOCK TABLES `reservas` WRITE;
/*!40000 ALTER TABLE `reservas` DISABLE KEYS */;
INSERT INTO `reservas` VALUES (1,'2024-02-28 10:00:00','Confirmada',1,21),(2,'2024-02-28 11:30:00','Confirmada',2,22),(3,'2024-03-01 09:00:00','Confirmada',3,23),(4,'2024-03-02 16:00:00','Confirmada',4,25),(5,'2024-03-01 08:00:00','Asistida',5,26),(6,'2024-03-04 18:00:00','Confirmada',6,27),(7,'2024-03-05 10:00:00','Confirmada',7,28),(8,'2024-03-02 11:00:00','Cancelada',8,29),(9,'2024-03-01 13:00:00','Asistida',9,30),(10,'2024-03-06 15:00:00','Confirmada',10,31),(11,'2024-03-02 09:00:00','Asistida',11,32),(12,'2024-03-07 19:00:00','Confirmada',12,33),(13,'2024-02-29 07:00:00','Asistida',13,34),(14,'2024-03-03 10:00:00','Confirmada',14,35),(15,'2024-03-01 12:00:00','Asistida',15,36),(16,'2024-03-08 14:00:00','Confirmada',16,37),(17,'2024-03-09 17:00:00','Confirmada',17,38),(18,'2024-03-09 18:00:00','Confirmada',18,39),(19,'2024-03-10 20:00:00','Confirmada',19,40),(20,'2024-02-28 08:00:00','Asistida',20,21);
/*!40000 ALTER TABLE `reservas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id_rol` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id_rol`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Administrador','Control total del sistema y gimnasios'),(2,'Gerente','Gestión integral de una sucursal específica'),(3,'Recepcionista','Atención al cliente, cobros y accesos'),(4,'Entrenador Personal','Entrenamientos 1 a 1 y seguimientos'),(5,'Monitor de Sala','Asistencia general en la sala de musculación'),(6,'Instructor Colectivas','Imparte clases como Zumba, Spinning, etc.'),(7,'Nutricionista','Asesoramiento dietético para socios'),(8,'Fisioterapeuta','Rehabilitación y descargas musculares'),(9,'Mantenimiento','Reparación de máquinas e instalaciones'),(10,'Limpieza','Mantenimiento de la higiene del centro'),(11,'Marketing','Gestión de redes y promociones'),(12,'Recursos Humanos','Gestión de nóminas y contratos'),(13,'Contabilidad','Gestión de facturas y presupuestos'),(14,'Seguridad','Control de cámaras y aforos nocturnos'),(15,'Coordinador Deportivo','Organiza los horarios de las clases'),(16,'Director Técnico','Supervisa la calidad de los entrenamientos'),(17,'Socorrista','Vigilancia en la zona de piscina'),(18,'Médico Deportivo','Pruebas de esfuerzo y salud'),(19,'Atención al Socio','Resolución de quejas y dudas'),(20,'Becario DAM','Mantenimiento de la base de datos y software');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles_permisos`
--

DROP TABLE IF EXISTS `roles_permisos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles_permisos` (
  `Rol_id_rol` int NOT NULL,
  `Permiso_id_permiso` int NOT NULL,
  PRIMARY KEY (`Rol_id_rol`,`Permiso_id_permiso`),
  KEY `fk_Rol_has_Permisos_Permisos1_idx` (`Permiso_id_permiso`),
  KEY `fk_Rol_has_Permisos_Rol1_idx` (`Rol_id_rol`),
  CONSTRAINT `fk_Rol_has_Permisos_Permisos1` FOREIGN KEY (`Permiso_id_permiso`) REFERENCES `permisos` (`id_permiso`),
  CONSTRAINT `fk_Rol_has_Permisos_Rol1` FOREIGN KEY (`Rol_id_rol`) REFERENCES `roles` (`id_rol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles_permisos`
--

LOCK TABLES `roles_permisos` WRITE;
/*!40000 ALTER TABLE `roles_permisos` DISABLE KEYS */;
INSERT INTO `roles_permisos` VALUES (1,1),(1,2),(1,3),(3,3),(3,4),(6,5),(6,6),(2,7),(13,7),(2,8),(3,9),(3,10),(4,12),(7,12),(5,13),(11,14),(18,16),(12,17),(20,18),(14,19);
/*!40000 ALTER TABLE `roles_permisos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salas`
--

DROP TABLE IF EXISTS `salas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salas` (
  `id_sala` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `aforo` int NOT NULL,
  `Gimnasio_id_gimnasio` int NOT NULL,
  PRIMARY KEY (`id_sala`),
  KEY `fk_Sala_Gimnasio1_idx` (`Gimnasio_id_gimnasio`),
  CONSTRAINT `fk_Sala_Gimnasio1` FOREIGN KEY (`Gimnasio_id_gimnasio`) REFERENCES `gimnasios` (`id_gimnasio`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salas`
--

LOCK TABLES `salas` WRITE;
/*!40000 ALTER TABLE `salas` DISABLE KEYS */;
INSERT INTO `salas` VALUES (1,'Sala Musculación Principal',150,20),(2,'Zona Peso Libre',50,20),(3,'Sala Cardio',60,20),(4,'Sala Crossfit',40,20),(5,'Sala Spinning',30,20),(6,'Sala Actividades Dirigidas 1',40,20),(7,'Sala Actividades Dirigidas 2',30,20),(8,'Tatami Artes Marciales',25,20),(9,'Zona Estiramientos',15,20),(10,'Piscina Climatizada',50,20),(11,'Sala Posing y Espejos',10,1),(12,'Zona Halterofilia',20,2),(13,'Pista Pádel 1',4,20),(14,'Pista Pádel 2',4,20),(15,'Sala Rehabilitación',5,20),(16,'Despacho Nutrición',3,20),(17,'Zona Calistenia Outdoor',30,7),(18,'Ring de Boxeo',10,20),(19,'Sauna',8,20),(20,'Sala VIP Entrenamiento',5,20);
/*!40000 ALTER TABLE `salas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sesiones`
--

DROP TABLE IF EXISTS `sesiones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sesiones` (
  `id_sesion` int NOT NULL AUTO_INCREMENT,
  `hora_inicio` time NOT NULL,
  `hora_fin` time NOT NULL,
  `estado` varchar(45) NOT NULL,
  `duracion` int NOT NULL,
  `fecha` date NOT NULL,
  `plazas_libres` int NOT NULL,
  `Actividad_id_actividad` int NOT NULL,
  `Empleado_id_usuario` int NOT NULL,
  `Sala_id_sala` int NOT NULL,
  PRIMARY KEY (`id_sesion`),
  KEY `fk_Sesion_Actividad1_idx` (`Actividad_id_actividad`),
  KEY `fk_Sesion_Empleado1_idx` (`Empleado_id_usuario`),
  KEY `fk_Sesion_Sala1_idx` (`Sala_id_sala`),
  CONSTRAINT `fk_Sesion_Actividad1` FOREIGN KEY (`Actividad_id_actividad`) REFERENCES `actividades` (`id_actividad`),
  CONSTRAINT `fk_Sesion_Empleado1` FOREIGN KEY (`Empleado_id_usuario`) REFERENCES `empleados` (`id_usuario`),
  CONSTRAINT `fk_Sesion_Sala1` FOREIGN KEY (`Sala_id_sala`) REFERENCES `salas` (`id_sala`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sesiones`
--

LOCK TABLES `sesiones` WRITE;
/*!40000 ALTER TABLE `sesiones` DISABLE KEYS */;
INSERT INTO `sesiones` VALUES (1,'09:00:00','10:00:00','Completada',60,'2024-03-01',0,1,2,1),(2,'10:30:00','11:30:00','Completada',60,'2024-03-01',5,2,4,6),(3,'12:00:00','13:00:00','Activa',60,'2024-03-02',10,3,4,5),(4,'17:00:00','18:00:00','Programada',60,'2024-03-05',2,4,13,4),(5,'08:00:00','09:00:00','Completada',60,'2024-03-03',15,5,4,7),(6,'18:30:00','19:30:00','Programada',60,'2024-03-06',0,7,4,1),(7,'19:00:00','20:00:00','Programada',60,'2024-03-06',8,8,12,8),(8,'11:00:00','12:00:00','Cancelada',60,'2024-03-04',30,9,6,18),(9,'14:00:00','15:00:00','Completada',60,'2024-03-02',1,10,14,2),(10,'16:00:00','16:45:00','Programada',45,'2024-03-07',4,11,4,10),(11,'09:30:00','10:30:00','Completada',60,'2024-03-03',12,12,17,17),(12,'20:00:00','21:00:00','Programada',60,'2024-03-08',0,15,17,12),(13,'07:00:00','08:00:00','Completada',60,'2024-03-01',5,17,13,12),(14,'10:00:00','11:00:00','Activa',60,'2024-03-04',0,18,2,20),(15,'13:00:00','13:45:00','Completada',45,'2024-03-02',0,19,5,16),(16,'15:00:00','16:00:00','Programada',60,'2024-03-09',0,20,5,15),(17,'18:00:00','19:00:00','Programada',60,'2024-03-10',20,2,4,6),(18,'19:30:00','20:30:00','Programada',60,'2024-03-10',5,4,13,4),(19,'21:00:00','22:00:00','Programada',60,'2024-03-11',10,3,4,5),(20,'08:30:00','09:30:00','Completada',60,'2024-03-01',2,6,4,7);
/*!40000 ALTER TABLE `sesiones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suscripciones`
--

DROP TABLE IF EXISTS `suscripciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suscripciones` (
  `id_suscripcion` int NOT NULL AUTO_INCREMENT,
  `precio` decimal(6,2) NOT NULL,
  `fecha_inicio` datetime NOT NULL,
  `fecha_fin` datetime NOT NULL,
  `Tipo_Suscripcion_id_tipo_suscripcion` int NOT NULL,
  `Cliente_id_usuario` int NOT NULL,
  PRIMARY KEY (`id_suscripcion`),
  KEY `fk_Suscripcion_Tipo_Suscripcion1_idx` (`Tipo_Suscripcion_id_tipo_suscripcion`),
  KEY `fk_Suscripcion_Cliente1_idx` (`Cliente_id_usuario`),
  CONSTRAINT `fk_Suscripcion_Cliente1` FOREIGN KEY (`Cliente_id_usuario`) REFERENCES `clientes` (`id_usuario`),
  CONSTRAINT `fk_Suscripcion_Tipo_Suscripcion1` FOREIGN KEY (`Tipo_Suscripcion_id_tipo_suscripcion`) REFERENCES `tipos_suscripciones` (`id_tipo_suscripcion`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suscripciones`
--

LOCK TABLES `suscripciones` WRITE;
/*!40000 ALTER TABLE `suscripciones` DISABLE KEYS */;
INSERT INTO `suscripciones` VALUES (1,29.99,'2024-01-01 00:00:00','2024-02-01 00:00:00',3,21),(2,39.99,'2024-01-15 00:00:00','2024-02-15 00:00:00',4,22),(3,59.99,'2024-02-01 00:00:00','2024-03-01 00:00:00',5,23),(4,99.99,'2024-02-10 00:00:00','2024-03-10 00:00:00',6,24),(5,299.99,'2024-01-01 00:00:00','2024-12-31 00:00:00',13,25),(6,399.99,'2024-01-05 00:00:00','2024-12-31 00:00:00',14,26),(7,599.99,'2024-02-01 00:00:00','2025-02-01 00:00:00',15,27),(8,85.00,'2024-03-01 00:00:00','2024-06-01 00:00:00',7,28),(9,110.00,'2024-03-05 00:00:00','2024-06-05 00:00:00',8,29),(10,160.00,'2024-01-20 00:00:00','2024-04-20 00:00:00',9,30),(11,150.00,'2024-02-15 00:00:00','2024-08-15 00:00:00',10,31),(12,200.00,'2024-02-20 00:00:00','2024-08-20 00:00:00',11,32),(13,300.00,'2024-03-01 00:00:00','2024-09-01 00:00:00',12,33),(14,25.00,'2024-03-01 00:00:00','2024-04-01 00:00:00',16,34),(15,80.00,'2024-03-01 00:00:00','2024-04-01 00:00:00',17,35),(16,19.99,'2024-03-05 00:00:00','2024-04-05 00:00:00',18,36),(17,15.00,'2024-03-10 00:00:00','2024-04-10 00:00:00',19,37),(18,0.00,'2024-01-01 00:00:00','2099-12-31 00:00:00',20,38),(19,10.00,'2024-03-01 00:00:00','2024-03-02 00:00:00',1,39),(20,25.00,'2024-03-01 00:00:00','2024-03-08 00:00:00',2,40);
/*!40000 ALTER TABLE `suscripciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarifas_actividades`
--

DROP TABLE IF EXISTS `tarifas_actividades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tarifas_actividades` (
  `id_tarifa_actividad` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `precio` decimal(6,2) NOT NULL,
  PRIMARY KEY (`id_tarifa_actividad`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarifas_actividades`
--

LOCK TABLES `tarifas_actividades` WRITE;
/*!40000 ALTER TABLE `tarifas_actividades` DISABLE KEYS */;
INSERT INTO `tarifas_actividades` VALUES (1,'Tarifa Zero (Gratis con Cuota)',0.00),(2,'Clase Suelta Básica',5.00),(3,'Clase Suelta Premium',8.50),(4,'Clase Suelta VIP',12.00),(5,'Bono 5 Clases Básicas',20.00),(6,'Bono 10 Clases Básicas',35.00),(7,'Bono 20 Clases Básicas',60.00),(8,'Bono 5 Clases Premium',35.00),(9,'Bono 10 Clases Premium',65.00),(10,'Bono 20 Clases Premium',110.00),(11,'Sesión Entrenamiento Personal 1h',30.00),(12,'Bono 5 Sesiones PT',135.00),(13,'Bono 10 Sesiones PT',250.00),(14,'Sesión Nutrición 45min',40.00),(15,'Sesión Fisioterapia 1h',45.00),(16,'Clase Masterclass Especial',15.00),(17,'Suplemento Piscina (Mensual)',20.00),(18,'Suplemento Crossfit (Mensual)',25.00),(19,'Reserva Pista Pádel 1.5h',12.00),(20,'Bono 10 Pistas Pádel',100.00);
/*!40000 ALTER TABLE `tarifas_actividades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarjetas`
--

DROP TABLE IF EXISTS `tarjetas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tarjetas` (
  `num_tarjeta` varchar(20) NOT NULL,
  `Pago_id_pago` int NOT NULL,
  PRIMARY KEY (`num_tarjeta`,`Pago_id_pago`),
  KEY `fk_Tarjeta_Pago1_idx` (`Pago_id_pago`),
  CONSTRAINT `fk_Tarjeta_Pago1` FOREIGN KEY (`Pago_id_pago`) REFERENCES `pagos` (`id_pago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarjetas`
--

LOCK TABLES `tarjetas` WRITE;
/*!40000 ALTER TABLE `tarjetas` DISABLE KEYS */;
INSERT INTO `tarjetas` VALUES ('****-****-****-1234',1),('****-****-****-5678',4),('****-****-****-9012',5),('****-****-****-3456',7),('****-****-****-7890',10),('****-****-****-1111',12),('****-****-****-2222',14),('****-****-****-3333',17),('****-****-****-4444',19);
/*!40000 ALTER TABLE `tarjetas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipos_actividades`
--

DROP TABLE IF EXISTS `tipos_actividades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipos_actividades` (
  `id_tipo` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id_tipo`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos_actividades`
--

LOCK TABLES `tipos_actividades` WRITE;
/*!40000 ALTER TABLE `tipos_actividades` DISABLE KEYS */;
INSERT INTO `tipos_actividades` VALUES (16,'Aquagym'),(14,'Artes Marciales Mixtas (MMA)'),(11,'Body Combat'),(10,'Body Pump'),(13,'Boxeo'),(18,'Calistenia'),(2,'Cardio y Elípticas'),(3,'Crossfit'),(12,'Entrenamiento en Suspensión (TRX)'),(20,'Entrenamiento Funcional (HIIT)'),(17,'Estiramientos y Movilidad'),(19,'Gimnasia Rítmica'),(4,'Halterofilia'),(1,'Musculación Libre'),(15,'Natación Libre'),(7,'Pilates Suelo'),(5,'Powerlifting'),(9,'Spinning / Ciclo Indoor'),(6,'Yoga Vinyasa'),(8,'Zumba Fitness');
/*!40000 ALTER TABLE `tipos_actividades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipos_suscripciones`
--

DROP TABLE IF EXISTS `tipos_suscripciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipos_suscripciones` (
  `id_tipo_suscripcion` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(250) DEFAULT NULL,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id_tipo_suscripcion`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos_suscripciones`
--

LOCK TABLES `tipos_suscripciones` WRITE;
/*!40000 ALTER TABLE `tipos_suscripciones` DISABLE KEYS */;
INSERT INTO `tipos_suscripciones` VALUES (1,'Acceso de 1 solo día a las instalaciones','Pase de Día'),(2,'Acceso durante 7 días consecutivos','Pase de Semana'),(3,'Acceso solo a zona de musculación y cardio','Mensual Básica'),(4,'Musculación + Clases colectivas básicas','Mensual Estándar'),(5,'Acceso total incluyendo toalla y parking','Mensual Premium'),(6,'Premium + 2 sesiones de Entrenador Personal','Mensual VIP'),(7,'Ahorro del 10% respecto a mensual básica','Trimestral Básica'),(8,'Ahorro del 10% respecto a mensual estándar','Trimestral Estándar'),(9,'Ahorro del 10% respecto a mensual premium','Trimestral Premium'),(10,'Ahorro del 15% respecto a mensual básica','Semestral Básica'),(11,'Ahorro del 15% respecto a mensual estándar','Semestral Estándar'),(12,'Ahorro del 15% respecto a mensual premium','Semestral Premium'),(13,'El mejor precio para musculación libre','Anual Básica'),(14,'El pack más popular para socios frecuentes','Anual Estándar'),(15,'Todo incluido los 365 días del año','Anual Premium'),(16,'Descuento especial presentando carnet Jove/Uni','Estudiante Mensual'),(17,'Hasta 4 miembros del mismo núcleo familiar','Familiar Mensual'),(18,'Acceso restringido de 06:00 a 14:00h','Matinal Mensual'),(19,'Acceso solo Viernes, Sábados y Domingos','Fin de Semana'),(20,'Tarifa vitalicia para los primeros 100 socios','Socio Fundador');
/*!40000 ALTER TABLE `tipos_suscripciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transferencias`
--

DROP TABLE IF EXISTS `transferencias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transferencias` (
  `num_cuenta` varchar(34) NOT NULL,
  `Pago_id_pago` int NOT NULL,
  PRIMARY KEY (`num_cuenta`,`Pago_id_pago`),
  KEY `fk_Transferencia_Pago1_idx` (`Pago_id_pago`),
  CONSTRAINT `fk_Transferencia_Pago1` FOREIGN KEY (`Pago_id_pago`) REFERENCES `pagos` (`id_pago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transferencias`
--

LOCK TABLES `transferencias` WRITE;
/*!40000 ALTER TABLE `transferencias` DISABLE KEYS */;
INSERT INTO `transferencias` VALUES ('ES9121000418401234567890',3),('ES9121000418400987654321',6),('ES9121000418401122334455',9),('ES9121000418405566778899',16);
/*!40000 ALTER TABLE `transferencias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `fecha_alta` datetime DEFAULT NULL,
  `tipo` varchar(20) DEFAULT NULL,
  `Rol_id_rol` int NOT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `fk_Usuario_Rol_idx` (`Rol_id_rol`),
  CONSTRAINT `fk_Usuario_Rol` FOREIGN KEY (`Rol_id_rol`) REFERENCES `roles` (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Pau','Mayordomo Real','pau.mr@gympau.com','hash_pass_1','2023-01-10 00:00:00','Empleado',1),(2,'Nader','Atrees Ferreiro','nader.af@gympau.com','hash_pass_2','2023-01-15 00:00:00','Empleado',4),(3,'Luis Fernando','García Arteaga','luis.ga@gympau.com','hash_pass_3','2023-02-01 00:00:00','Empleado',5),(4,'Marco','Alfons','marco.a@gympau.com','hash_pass_4','2023-02-10 00:00:00','Empleado',6),(5,'Giuseppe','Lombardo','giuseppe.l@gympau.com','hash_pass_5','2023-03-05 00:00:00','Empleado',7),(6,'Daniel','Pigula Topolanski','daniel.pt@gympau.com','hash_pass_6','2023-03-20 00:00:00','Empleado',4),(7,'Nikolai','Nikolayet','nikolai.n@gympau.com','hash_pass_7','2023-04-12 00:00:00','Empleado',9),(8,'Nico','Gracía','nico.g@gympau.com','hash_pass_8','2023-05-01 00:00:00','Empleado',15),(9,'Erik Olaf','Cervera Morcillo','erik.cm@gympau.com','hash_pass_9','2023-05-15 00:00:00','Empleado',20),(10,'Víctor','Aparisi Rodríguez','victor.ar@gympau.com','hash_pass_10','2023-06-10 00:00:00','Empleado',11),(11,'Andranik','Babayan Babayan','andranik.bb@gympau.com','hash_pass_11','2023-07-01 00:00:00','Empleado',14),(12,'Chris','Bumstead','cbum@gympau.com','hash_pass_12','2023-07-15 00:00:00','Empleado',4),(13,'Ramon','Dino','ramon.d@gympau.com','hash_pass_13','2023-08-01 00:00:00','Empleado',4),(14,'Urs','Kalecinski','urs.k@gympau.com','hash_pass_14','2023-08-20 00:00:00','Empleado',6),(15,'Joan','Pradells','joan.p@gympau.com','hash_pass_15','2023-09-10 00:00:00','Empleado',5),(16,'Noel','Deyzel','noel.d@gympau.com','hash_pass_16','2023-10-05 00:00:00','Empleado',11),(17,'Larry','Wheels','larry.w@gympau.com','hash_pass_17','2023-10-20 00:00:00','Empleado',4),(18,'Brian','Shaw','brian.s@gympau.com','hash_pass_18','2023-11-01 00:00:00','Empleado',16),(19,'Hafthor','Bjornsson','hafthor.b@gympau.com','hash_pass_19','2023-11-15 00:00:00','Empleado',14),(20,'Eddie','Hall','eddie.h@gympau.com','hash_pass_20','2023-12-01 00:00:00','Empleado',9),(21,'Arnold','Schwarzenegger','arnold@austrianoak.com','hash_pass_21','2024-01-05 00:00:00','Cliente',3),(22,'Ronnie','Coleman','ronnie@lightweight.com','hash_pass_22','2024-01-10 00:00:00','Cliente',3),(23,'Jay','Cutler','jay@cutler.com','hash_pass_23','2024-01-15 00:00:00','Cliente',3),(24,'Dorian','Yates','dorian@shadow.com','hash_pass_24','2024-02-01 00:00:00','Cliente',3),(25,'Lee','Haney','lee@totalee.com','hash_pass_25','2024-02-10 00:00:00','Cliente',3),(26,'Phil','Heath','phil@thegift.com','hash_pass_26','2024-02-20 00:00:00','Cliente',3),(27,'Franco','Columbu','franco@sardinian.com','hash_pass_27','2024-03-01 00:00:00','Cliente',3),(28,'Dexter','Jackson','dexter@blade.com','hash_pass_28','2024-03-15 00:00:00','Cliente',3),(29,'Shawn','Rhoden','shawn@flexatron.com','hash_pass_29','2024-04-05 00:00:00','Cliente',3),(30,'Big','Ramy','ramy@egypt.com','hash_pass_30','2024-04-10 00:00:00','Cliente',3),(31,'Hadi','Choopan','hadi@persianwolf.com','hash_pass_31','2024-05-01 00:00:00','Cliente',3),(32,'Derek','Lunsford','derek@olympia.com','hash_pass_32','2024-05-15 00:00:00','Cliente',3),(33,'Nick','Walker','nick@mutant.com','hash_pass_33','2024-06-01 00:00:00','Cliente',3),(34,'Hunter','Labrada','hunter@labrada.com','hash_pass_34','2024-06-20 00:00:00','Cliente',3),(35,'Samson','Dauda','samson@lion.com','hash_pass_35','2024-07-05 00:00:00','Cliente',3),(36,'Kai','Greene','kai@predator.com','hash_pass_36','2024-07-15 00:00:00','Cliente',3),(37,'Roelly','Winklaar','roelly@beast.com','hash_pass_37','2024-08-01 00:00:00','Cliente',3),(38,'Markus','Ruhl','markus@freak.com','hash_pass_38','2024-08-20 00:00:00','Cliente',3),(39,'Kevin','Levrone','kevin@maryland.com','hash_pass_39','2024-09-10 00:00:00','Cliente',3),(40,'Flex','Wheeler','flex@sultan.com','hash_pass_40','2024-09-25 00:00:00','Cliente',3);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-02  3:48:51
