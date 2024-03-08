-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.32-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para parcial
CREATE DATABASE IF NOT EXISTS `parcial` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `parcial`;

-- Volcando estructura para tabla parcial.categoria
CREATE TABLE IF NOT EXISTS `categoria` (
  `Id_Categoria` int(11) NOT NULL AUTO_INCREMENT,
  `Cat_Descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Id_Categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla parcial.empresa
CREATE TABLE IF NOT EXISTS `empresa` (
  `Id_Empresa` int(11) NOT NULL AUTO_INCREMENT,
  `Emp_Nombre` varchar(50) DEFAULT NULL,
  `Id_Vendedor` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id_Empresa`),
  KEY `FK_empresa_vendedores` (`Id_Vendedor`),
  CONSTRAINT `FK_empresa_vendedores` FOREIGN KEY (`Id_Vendedor`) REFERENCES `vendedor` (`Id_Vendedor`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla parcial.productos
CREATE TABLE IF NOT EXISTS `productos` (
  `Id_Productos` int(11) NOT NULL AUTO_INCREMENT,
  `Pro_Codigo` varchar(45) DEFAULT NULL,
  `Pro_Descripcion` varchar(100) DEFAULT NULL,
  `Pro_Cantidad` int(11) DEFAULT NULL,
  `Pro_Precio` double DEFAULT NULL,
  `Id_Categoria` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id_Productos`),
  KEY `FK_productos_categoria` (`Id_Categoria`),
  CONSTRAINT `FK_productos_categoria` FOREIGN KEY (`Id_Categoria`) REFERENCES `categoria` (`Id_Categoria`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla parcial.vendedor
CREATE TABLE IF NOT EXISTS `vendedor` (
  `Id_Vendedor` int(11) NOT NULL AUTO_INCREMENT,
  `Ven_Nombre` varchar(80) DEFAULT NULL,
  `Ven_Correo` text DEFAULT NULL,
  `Ven_Contraseña` text DEFAULT NULL,
  PRIMARY KEY (`Id_Vendedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla parcial.vender
CREATE TABLE IF NOT EXISTS `vender` (
  `Id_Producto` int(11) DEFAULT NULL,
  `Id_Vendedor` int(11) DEFAULT NULL,
  `Id_Categoria` int(11) DEFAULT NULL,
  KEY `FK__productos` (`Id_Producto`),
  KEY `FK__productos_2` (`Id_Categoria`),
  KEY `FK__vendedores` (`Id_Vendedor`) USING BTREE,
  CONSTRAINT `FK__productos` FOREIGN KEY (`Id_Producto`) REFERENCES `productos` (`Id_Productos`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK__productos_2` FOREIGN KEY (`Id_Categoria`) REFERENCES `productos` (`Id_Categoria`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_vender_vendedor` FOREIGN KEY (`Id_Vendedor`) REFERENCES `vendedor` (`Id_Vendedor`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- La exportación de datos fue deseleccionada.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
