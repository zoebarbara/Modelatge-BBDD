-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 11-04-2020 a las 15:18:32
-- Versión del servidor: 8.0.19
-- Versión de PHP: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cul_ampolla`
--
CREATE DATABASE IF NOT EXISTS `cul_ampolla` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `cul_ampolla`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `costumer`
--

CREATE TABLE `costumer` (
  `id_costumer` int NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `post_address` varchar(100) DEFAULT NULL,
  `phone` int DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `cre_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `costumer`
--

INSERT INTO `costumer` (`id_costumer`, `name`, `post_address`, `phone`, `email`, `cre_date`) VALUES
(1, 'Alonso', 'Balmes 30', 666999333, 'alon34@homtail.com', '0000-00-00'),
(2, 'Paco', 'Muntaner 430', 659430000, 'franp@gmail.com', '2019-04-22'),
(3, 'Marta', 'Valencia 223', 655118493, 'martita33@gmail.com', '2019-03-02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glasses`
--

CREATE TABLE `glasses` (
  `id_glasses` int NOT NULL,
  `prov_id` int NOT NULL,
  `brand` varchar(100) DEFAULT NULL,
  `graduationLeft` varchar(11) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `graduationRight` varchar(11) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `rimless_frame` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `rimmed_frame` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `metal_frame` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `color_frame` varchar(20) DEFAULT NULL,
  `color_glass_left` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `color_glass_right` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `price_left` int DEFAULT NULL,
  `price_right` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `glasses`
--

INSERT INTO `glasses` (`id_glasses`, `prov_id`, `brand`, `graduationLeft`, `graduationRight`, `rimless_frame`, `rimmed_frame`, `metal_frame`, `color_frame`, `color_glass_left`, `color_glass_right`, `price_left`, `price_right`) VALUES
(1, 1, 'RayBan', '1.00', '1.00', 'No', 'Yes', 'Yes', 'Brown', 'Brown', 'Brown', 50, 50),
(7, 1, 'Oakley', '0', '0', 'No', 'Yes', 'No', 'Black', 'Blue', 'Blue', 45, 45),
(8, 1, 'Arnette', '0', '0', 'No', 'Yes', 'No', 'Grey', 'Green', 'Green', 35, 35);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provider`
--

CREATE TABLE `provider` (
  `id_prov` int NOT NULL,
  `name` varchar(20) NOT NULL,
  `street` varchar(100) DEFAULT NULL,
  `num_st` int DEFAULT NULL,
  `floor` int DEFAULT NULL,
  `door` int DEFAULT NULL,
  `city` tinytext,
  `postal code` varchar(11) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `country` tinytext,
  `phone` int DEFAULT NULL,
  `fax` int DEFAULT NULL,
  `nif` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `provider`
--

INSERT INTO `provider` (`id_prov`, `name`, `street`, `num_st`, `floor`, `door`, `city`, `postal code`, `country`, `phone`, `fax`, `nif`) VALUES
(1, 'Prosun', 'Calle Pallars', 73, 0, 1, 'Barcelona', '08018', 'Spain', 936314454, 936314454, '50498521E');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `purchase`
--

CREATE TABLE `purchase` (
  `id_purchase` int NOT NULL,
  `seller_id` int DEFAULT NULL,
  `costumer_id` int DEFAULT NULL,
  `glasses_id` int DEFAULT NULL,
  `price` int DEFAULT NULL,
  `purchase_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seller`
--

CREATE TABLE `seller` (
  `id_seller` int NOT NULL,
  `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `costumer`
--
ALTER TABLE `costumer`
  ADD PRIMARY KEY (`id_costumer`);

--
-- Indices de la tabla `glasses`
--
ALTER TABLE `glasses`
  ADD PRIMARY KEY (`id_glasses`),
  ADD KEY `prov_id` (`prov_id`);

--
-- Indices de la tabla `provider`
--
ALTER TABLE `provider`
  ADD PRIMARY KEY (`id_prov`);

--
-- Indices de la tabla `purchase`
--
ALTER TABLE `purchase`
  ADD PRIMARY KEY (`id_purchase`),
  ADD KEY `seller_id` (`seller_id`),
  ADD KEY `costumer_id` (`costumer_id`),
  ADD KEY `glasses_id` (`glasses_id`);

--
-- Indices de la tabla `seller`
--
ALTER TABLE `seller`
  ADD PRIMARY KEY (`id_seller`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `costumer`
--
ALTER TABLE `costumer`
  MODIFY `id_costumer` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `glasses`
--
ALTER TABLE `glasses`
  MODIFY `id_glasses` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `provider`
--
ALTER TABLE `provider`
  MODIFY `id_prov` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `purchase`
--
ALTER TABLE `purchase`
  MODIFY `id_purchase` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `seller`
--
ALTER TABLE `seller`
  MODIFY `id_seller` int NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `glasses`
--
ALTER TABLE `glasses`
  ADD CONSTRAINT `glasses_ibfk_1` FOREIGN KEY (`prov_id`) REFERENCES `provider` (`id_prov`);

--
-- Filtros para la tabla `purchase`
--
ALTER TABLE `purchase`
  ADD CONSTRAINT `purchase_ibfk_1` FOREIGN KEY (`seller_id`) REFERENCES `seller` (`id_seller`),
  ADD CONSTRAINT `purchase_ibfk_2` FOREIGN KEY (`costumer_id`) REFERENCES `costumer` (`id_costumer`),
  ADD CONSTRAINT `purchase_ibfk_3` FOREIGN KEY (`glasses_id`) REFERENCES `glasses` (`id_glasses`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
