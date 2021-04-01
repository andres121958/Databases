-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3307
-- Tiempo de generación: 02-04-2021 a las 00:46:49
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dnasport`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bodega`
--

CREATE TABLE `bodega` (
  `id_bodega` int(11) NOT NULL,
  `nombre_producto` varchar(45) NOT NULL,
  `cantidad_producto` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `bodega`
--

INSERT INTO `bodega` (`id_bodega`, `nombre_producto`, `cantidad_producto`) VALUES
(54, 'Hilos y agujas', '3000'),
(55, 'Goretex', '5000'),
(56, 'Lycra', '1000'),
(57, 'Windstopper', '500'),
(58, 'Dryarn', '3000'),
(59, 'Algodon', '5000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `color`
--

CREATE TABLE `color` (
  `id_color` int(11) NOT NULL,
  `nombre_color` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `color`
--

INSERT INTO `color` (`id_color`, `nombre_color`) VALUES
(20, 'Azul'),
(30, 'Rojo'),
(40, 'verde'),
(50, 'Amarillo'),
(60, 'Azul Marino'),
(70, 'Gris'),
(80, 'Cafe'),
(90, 'Morado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `codigo_factura` int(11) NOT NULL,
  `nombre_empresa` varchar(45) NOT NULL,
  `nombre_cliente` varchar(45) NOT NULL,
  `direccion_empresa` varchar(45) NOT NULL,
  `fecha` date NOT NULL,
  `total` int(11) NOT NULL,
  `iva` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `insumos`
--

CREATE TABLE `insumos` (
  `numero_referencia` int(11) NOT NULL,
  `cantidad` varchar(45) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `bodega_id_bodega` int(11) DEFAULT NULL,
  `proveedor_nit` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `insumos`
--

INSERT INTO `insumos` (`numero_referencia`, `cantidad`, `descripcion`, `nombre`, `bodega_id_bodega`, `proveedor_nit`) VALUES
(129, '3000', 'Costuras de Cubierta 401, 406, 407', 'Tirahilos', 54, 123132),
(130, '500', 'Remate 504, 514', 'Tirahilos', 54, 123132),
(131, '50', 'Costuras Planas 602, 605, 607', 'Esparcidor', 54, 123132),
(132, '40', 'Costuras de Cubierta 401, 406, 407', 'Aguja', 54, 123132),
(133, '40', 'Licras 3g', 'Licra', 56, 123137),
(134, '70', 'Algodón de fibra corta ', 'Algodón indio', 59, 123138),
(135, '5000', 'Agujas cubo delgado', 'Agujas', 54, 123138),
(136, '5000', 'Agujas cubo delgado', 'Agujas', 54, 123138);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden_confeccion`
--

CREATE TABLE `orden_confeccion` (
  `id_orden_confeccion` int(11) NOT NULL,
  `producto` varchar(45) NOT NULL,
  `estado_pedido` varchar(30) DEFAULT NULL,
  `cantidad` varchar(15) NOT NULL,
  `usuario_id_usuario` int(11) DEFAULT 49
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `orden_confeccion`
--

INSERT INTO `orden_confeccion` (`id_orden_confeccion`, `producto`, `estado_pedido`, `cantidad`, `usuario_id_usuario`) VALUES
(20, 'Camisetas Nike', 'Pendiente', '20000', 49),
(12123, '12213', 'En proceso', '123123', 49),
(12312312, 'Camisetas Nike', 'Finalizado', '123213123', 49),
(12312317, 'Shorts Real Madrid', 'En proceso', '60', 49),
(12312318, 'Chaqueta Deportiva Gris', 'Pendiente', '500', 49),
(12312319, 'Pantalón Diadora Mujer', 'En proceso', '400', 49),
(12312322, 'Chaqueta', 'En proceso', '20', 49),
(12312332, 'prueba', 'finalizado', '200', 49),
(12312333, 'prueba1', 'pendiente', '200', 49),
(12312334, 'prueba2', 'en proceso', '100', 49),
(12312335, 'prueba3', 'finalizado', '500', 49);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `id_pedido` int(11) NOT NULL,
  `cantidad` varchar(45) NOT NULL,
  `nombres` varchar(45) DEFAULT NULL,
  `apellidos` varchar(45) DEFAULT NULL,
  `usuario_id_usuario` int(11) NOT NULL,
  `producto_codigo_producto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`id_pedido`, `cantidad`, `nombres`, `apellidos`, `usuario_id_usuario`, `producto_codigo_producto`) VALUES
(789798458, '300', 'Andrés ', 'Ramirez', 51, 4),
(789798462, '5000', 'prueb', 'prueba', 53, 4),
(789798463, '500', 'Santiago ', 'Vermudez', 51, 5),
(789798464, '30', 'Luis', 'Quintero', 60, 3),
(789798465, '30000', 'andres', 'quintero', 60, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `codigo_producto` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `precio` int(11) NOT NULL,
  `cantidad` varchar(45) NOT NULL,
  `color_id_color` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`codigo_producto`, `nombre`, `precio`, `cantidad`, `color_id_color`) VALUES
(1, 'Pantalón Diadora Mujer', 80000, '3000', 20),
(2, 'Licras Essentials', 69900, '3000', 30),
(3, 'Chaqueta Deportiva Gris', 68700, '3000', 40),
(4, 'Leggins deportivo control abdomen', 60000, '3000', 50),
(5, 'Top deportivo Danfive para niña', 50000, '3000', 20),
(6, 'Sudadera de tipo Tiro para hombre', 120000, '3000', 40);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_has_factura`
--

CREATE TABLE `producto_has_factura` (
  `producto_codigo_producto` int(11) NOT NULL,
  `factura_codigo_factura` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `nit` int(11) NOT NULL,
  `razon_social` varchar(45) NOT NULL,
  `ciudad` varchar(45) NOT NULL,
  `calle` varchar(45) NOT NULL,
  `zona` varchar(45) NOT NULL,
  `usuario_id_usuario` int(11) DEFAULT 50
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`nit`, `razon_social`, `ciudad`, `calle`, `zona`, `usuario_id_usuario`) VALUES
(123132, 'Telas Mary', 'Bogotá', '54', 'Norte', 50),
(123135, 'Textiles Lafayette', 'Bogotá', '30', 'Industrial', 50),
(123136, 'Tela Kambrel', 'Bogotá', '20', 'Industrial', 50),
(123137, 'Digaltex', 'Bogotá', '25', 'Centro', 50),
(123138, 'Burifil', 'Bogotá', '55', 'Industrial', 50),
(123139, 'Camisetas Nike', 'Bogotá', 'Norte', 'Industrial', 50),
(123140, 'Prueba andres', 'Bogotá', 'Norte', 'Cafetera', 50);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `id_rol` int(11) NOT NULL,
  `nombre_rol` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id_rol`, `nombre_rol`) VALUES
(1, 'Administrador'),
(2, 'Auxiliar Contable'),
(3, 'Cliente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `primer_nombre` varchar(45) NOT NULL,
  `segundo_nombre` varchar(45) DEFAULT NULL,
  `primer_apellido` varchar(45) NOT NULL,
  `segundo_apellido` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) NOT NULL,
  `telefono` varchar(45) NOT NULL,
  `correo` varchar(45) NOT NULL,
  `contrasenia` varchar(45) NOT NULL,
  `correo_alternativo` varchar(45) NOT NULL,
  `tipo_documento` varchar(30) NOT NULL,
  `documento` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `primer_nombre`, `segundo_nombre`, `primer_apellido`, `segundo_apellido`, `direccion`, `telefono`, `correo`, `contrasenia`, `correo_alternativo`, `tipo_documento`, `documento`) VALUES
(49, 'Andres', 'Alexander', 'Quintero', 'Pardo', 'calle 48p sur #5h-18', '3024556235', 'andres121958@hotmail.com', '123', 'andres123@hotmail.com', 'Cédula de ciudadanía', '1031181159'),
(50, 'Oscar', 'Fabian', 'Samboni ', 'Valderrama', 'Calle 48p sur #bis-18', '3124336545', 'oscar123@hotmail.com', '123', 'oscarsebastian@hotmail.com', 'Cédula de ciudadanía', '52562602303'),
(51, 'Brayan', 'Felipe', 'Quintero', 'Velandia', 'Calle 40p sur #5h-20', '302456321', 'brayanquintero@hotmail.com', '123', 'brayan123@hotmail.com', 'Cédula de ciudadanía', '52743610'),
(53, 'Juan', 'Sebastian', 'Cely', 'Moreno', 'Calle 40b sur#5b-20', '302456987', 'sebastian123@hotmail.com', '12345', 'brayanquintero@hotmail.com', 'Cédula de ciudadanía', '52346498474'),
(59, 'prueba', 'prueba', 'prueba', 'prueba', 'prueba', 'prueba', 'prueba123@hotmail.com', '123', 'qeqwe@hotmail.com', 'Cédula de ciudadanía', '12341515'),
(60, 'Luis', 'Alexander', 'Quintero', 'Pardo', 'Calle 40p sur #5j - 20', '302456312', 'luis123@hotmail.com', '123', 'luis12345@hotmail.com', 'Cédula de ciudadanía', '321654');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_has_producto`
--

CREATE TABLE `usuario_has_producto` (
  `usuario_id_usuario` int(11) NOT NULL,
  `producto_codigo_producto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_has_rol`
--

CREATE TABLE `usuario_has_rol` (
  `usuario_id_usuario` int(11) NOT NULL,
  `rol_id_rol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario_has_rol`
--

INSERT INTO `usuario_has_rol` (`usuario_id_usuario`, `rol_id_rol`) VALUES
(49, 1),
(50, 2),
(51, 3),
(53, 3);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bodega`
--
ALTER TABLE `bodega`
  ADD PRIMARY KEY (`id_bodega`);

--
-- Indices de la tabla `color`
--
ALTER TABLE `color`
  ADD PRIMARY KEY (`id_color`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`codigo_factura`);

--
-- Indices de la tabla `insumos`
--
ALTER TABLE `insumos`
  ADD PRIMARY KEY (`numero_referencia`),
  ADD KEY `fk_insumos_bodega1_idx` (`bodega_id_bodega`),
  ADD KEY `fk_insumos_proveedor1_idx` (`proveedor_nit`);

--
-- Indices de la tabla `orden_confeccion`
--
ALTER TABLE `orden_confeccion`
  ADD PRIMARY KEY (`id_orden_confeccion`),
  ADD KEY `fk_orden_confeccion_usuario1_idx` (`usuario_id_usuario`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id_pedido`),
  ADD KEY `fk_pedido_usuario1_idx` (`usuario_id_usuario`),
  ADD KEY `fk_pedido_producto1_idx` (`producto_codigo_producto`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`codigo_producto`),
  ADD KEY `fk_producto_color_idx` (`color_id_color`);

--
-- Indices de la tabla `producto_has_factura`
--
ALTER TABLE `producto_has_factura`
  ADD PRIMARY KEY (`producto_codigo_producto`,`factura_codigo_factura`),
  ADD KEY `fk_producto_has_factura_factura1_idx` (`factura_codigo_factura`),
  ADD KEY `fk_producto_has_factura_producto1_idx` (`producto_codigo_producto`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`nit`),
  ADD KEY `fk_proveedor_usuario1_idx` (`usuario_id_usuario`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `CORREO_UNIQUE` (`correo`),
  ADD UNIQUE KEY `documento_UNIQUE` (`documento`);

--
-- Indices de la tabla `usuario_has_producto`
--
ALTER TABLE `usuario_has_producto`
  ADD PRIMARY KEY (`usuario_id_usuario`,`producto_codigo_producto`),
  ADD KEY `fk_usuario_has_producto_producto1_idx` (`producto_codigo_producto`),
  ADD KEY `fk_usuario_has_producto_usuario1_idx` (`usuario_id_usuario`);

--
-- Indices de la tabla `usuario_has_rol`
--
ALTER TABLE `usuario_has_rol`
  ADD PRIMARY KEY (`usuario_id_usuario`,`rol_id_rol`),
  ADD KEY `fk_usuario_has_rol_rol1_idx` (`rol_id_rol`),
  ADD KEY `fk_usuario_has_rol_usuario1_idx` (`usuario_id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `bodega`
--
ALTER TABLE `bodega`
  MODIFY `id_bodega` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT de la tabla `color`
--
ALTER TABLE `color`
  MODIFY `id_color` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=220;

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `codigo_factura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2147483648;

--
-- AUTO_INCREMENT de la tabla `insumos`
--
ALTER TABLE `insumos`
  MODIFY `numero_referencia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=137;

--
-- AUTO_INCREMENT de la tabla `orden_confeccion`
--
ALTER TABLE `orden_confeccion`
  MODIFY `id_orden_confeccion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12312336;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=789798466;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `codigo_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=456123146;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `nit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123141;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `insumos`
--
ALTER TABLE `insumos`
  ADD CONSTRAINT `fk_insumos_bodega1` FOREIGN KEY (`bodega_id_bodega`) REFERENCES `bodega` (`id_bodega`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_insumos_proveedor1` FOREIGN KEY (`proveedor_nit`) REFERENCES `proveedor` (`nit`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `orden_confeccion`
--
ALTER TABLE `orden_confeccion`
  ADD CONSTRAINT `fk_orden_confeccion_usuario` FOREIGN KEY (`usuario_id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `fk_pedido_producto1` FOREIGN KEY (`producto_codigo_producto`) REFERENCES `producto` (`codigo_producto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pedido_usuario1` FOREIGN KEY (`usuario_id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `fk_producto_color` FOREIGN KEY (`color_id_color`) REFERENCES `color` (`id_color`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `producto_has_factura`
--
ALTER TABLE `producto_has_factura`
  ADD CONSTRAINT `fk_producto_has_factura_factura1` FOREIGN KEY (`factura_codigo_factura`) REFERENCES `factura` (`codigo_factura`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_producto_has_factura_producto1` FOREIGN KEY (`producto_codigo_producto`) REFERENCES `producto` (`codigo_producto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD CONSTRAINT `fk_proveedor_usuario1` FOREIGN KEY (`usuario_id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuario_has_producto`
--
ALTER TABLE `usuario_has_producto`
  ADD CONSTRAINT `fk_usuario_has_producto_producto1` FOREIGN KEY (`producto_codigo_producto`) REFERENCES `producto` (`codigo_producto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_usuario_has_producto_usuario1` FOREIGN KEY (`usuario_id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuario_has_rol`
--
ALTER TABLE `usuario_has_rol`
  ADD CONSTRAINT `fk_usuario_has_rol_rol1` FOREIGN KEY (`rol_id_rol`) REFERENCES `rol` (`id_rol`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_usuario_has_rol_usuario1` FOREIGN KEY (`usuario_id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
