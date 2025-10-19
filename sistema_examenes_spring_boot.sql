-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 19-10-2025 a las 23:33:34
-- Versión del servidor: 12.0.2-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sistema_examenes_spring_boot`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `categoria_id` bigint(20) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`categoria_id`, `descripcion`, `titulo`) VALUES
(1, 'Esta categoría contiene exámenes con todo lo relacionado a poo', 'Programación orientada a objetos'),
(2, 'Aqui haras examanes con todo el marco spring', 'Spring Framework');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `examenes`
--

CREATE TABLE `examenes` (
  `examen_id` bigint(20) NOT NULL,
  `activo` bit(1) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `numero_de_preguntas` varchar(255) DEFAULT NULL,
  `puntos_maximos` varchar(255) DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `categoria_categoria_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `examenes`
--

INSERT INTO `examenes` (`examen_id`, `activo`, `descripcion`, `numero_de_preguntas`, `puntos_maximos`, `titulo`, `categoria_categoria_id`) VALUES
(1, b'1', 'Pondrás a prueba tus conocimientos sobre herencia', '3', '50', 'Herencia', 1),
(2, b'1', 'Pondras a p', '2', '50', 'Spring Boot', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preguntas`
--

CREATE TABLE `preguntas` (
  `pregunta_id` bigint(20) NOT NULL,
  `contenido` varchar(5000) DEFAULT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `opcion1` varchar(255) DEFAULT NULL,
  `opcion2` varchar(255) DEFAULT NULL,
  `opcion3` varchar(255) DEFAULT NULL,
  `opcion4` varchar(255) DEFAULT NULL,
  `respuesta` varchar(255) DEFAULT NULL,
  `examen_examen_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `preguntas`
--

INSERT INTO `preguntas` (`pregunta_id`, `contenido`, `imagen`, `opcion1`, `opcion2`, `opcion3`, `opcion4`, `respuesta`, `examen_examen_id`) VALUES
(1, 'Que es herencia?', NULL, 'Saltar por el patio', 'Correr por atras', 'Mirar al cielo', 'Heredar algo de alguien mayor', 'Heredar algo de alguien mayor', 1),
(2, 'Que se entiendo por crear un objeto utilizado por un molde?', NULL, 'Caminar', 'Oler', 'Brinacr', 'Instancia', 'Instancia', 1),
(3, 'Que es una clase?', NULL, 'No se', 'Si se pero no me acuero', 'Un modelo', 'una casa', 'Un modelo', 1),
(4, 'Que es spring boot?', NULL, 'Saltar por el patio', 'Correr por atras', 'Mirar al cielo', 'aaa', 'aaa', 2),
(5, 'Que es @Restcontroller', NULL, 'Saltar por el patio', 'Correr por atras', 'Mirar al cielo', 'bbb', 'bbb', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) NOT NULL,
  `rol_nombre` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `rol_nombre`) VALUES
(1, 'ADMIN'),
(2, 'NORMAL');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` bigint(20) NOT NULL,
  `apellido` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `enabled` bit(1) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `perfil` varchar(255) DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `apellido`, `email`, `enabled`, `nombre`, `password`, `perfil`, `telefono`, `username`) VALUES
(1, 'user', 'user@gmail.com', b'1', 'user', '$2y$10$IfKlaWN5tuQGnlqUOq7t/.kU6M.bGWCgBXFaWOHI3Vt9Wo5Rd3efW', 'default.png', '3011111111', 'username'),
(2, 'Administrador ', 'admin@gmail.com', b'1', 'Administrador', '$2y$10$c83QA5kNeNLwTxzf1P1OreZXYvIbweHb5dWXOoIP3Qyod0lkwRGo6', 'foto.png', '3000000000', 'admin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_rol`
--

CREATE TABLE `usuario_rol` (
  `id` bigint(20) NOT NULL,
  `rol_rol_id` bigint(20) DEFAULT NULL,
  `usuario_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario_rol`
--

INSERT INTO `usuario_rol` (`id`, `rol_rol_id`, `usuario_id`) VALUES
(1, 2, 1),
(2, 1, 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`categoria_id`);

--
-- Indices de la tabla `examenes`
--
ALTER TABLE `examenes`
  ADD PRIMARY KEY (`examen_id`),
  ADD KEY `FK9e3vkr595xf5ntcw0ih72lifw` (`categoria_categoria_id`);

--
-- Indices de la tabla `preguntas`
--
ALTER TABLE `preguntas`
  ADD PRIMARY KEY (`pregunta_id`),
  ADD KEY `FK9g0sx7pv0vsvc4uksis4egp4j` (`examen_examen_id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario_rol`
--
ALTER TABLE `usuario_rol`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK7j1tyvjj1tv8gbq7n6f7efccc` (`rol_rol_id`),
  ADD KEY `FKktsemf1f6awjww4da0ocv4n32` (`usuario_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `categoria_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `examenes`
--
ALTER TABLE `examenes`
  MODIFY `examen_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `preguntas`
--
ALTER TABLE `preguntas`
  MODIFY `pregunta_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuario_rol`
--
ALTER TABLE `usuario_rol`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `examenes`
--
ALTER TABLE `examenes`
  ADD CONSTRAINT `FK9e3vkr595xf5ntcw0ih72lifw` FOREIGN KEY (`categoria_categoria_id`) REFERENCES `categorias` (`categoria_id`);

--
-- Filtros para la tabla `preguntas`
--
ALTER TABLE `preguntas`
  ADD CONSTRAINT `FK9g0sx7pv0vsvc4uksis4egp4j` FOREIGN KEY (`examen_examen_id`) REFERENCES `examenes` (`examen_id`);

--
-- Filtros para la tabla `usuario_rol`
--
ALTER TABLE `usuario_rol`
  ADD CONSTRAINT `FK7j1tyvjj1tv8gbq7n6f7efccc` FOREIGN KEY (`rol_rol_id`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `FKktsemf1f6awjww4da0ocv4n32` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
