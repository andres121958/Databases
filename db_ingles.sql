-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3307
-- Tiempo de generación: 06-01-2021 a las 00:05:24
-- Versión del servidor: 10.4.16-MariaDB
-- Versión de PHP: 7.3.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_ingles`
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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `color`
--

CREATE TABLE `color` (
  `id_color` int(11) NOT NULL,
  `nombre_color` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `bodega_id_bodega` int(11) NOT NULL,
  `proveedor_nit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden_confeccion`
--

CREATE TABLE `orden_confeccion` (
  `id_orden_confeccion` int(11) NOT NULL,
  `producto` varchar(45) NOT NULL,
  `estado_pedido` varchar(30) DEFAULT NULL,
  `cantidad` int(20) NOT NULL,
  `usuario_id_usuario` int(11) DEFAULT 49
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `orden_confeccion`
--

INSERT INTO `orden_confeccion` (`id_orden_confeccion`, `producto`, `estado_pedido`, `cantidad`, `usuario_id_usuario`) VALUES
(12312314, 'Shorts Real Madrid', 'In process', 200, 49),
(12312315, 'Nike t-shirt', 'Pending order', 300, 49),
(12312316, 'Three stripes t-shirt', 'Pending order', 20, 49),
(12312317, 'Basics sweatshirt', 'In process', 300, 49),
(12312318, 'Windbreaker jacket', 'In process', 50, 49),
(12312319, 'FC Bayern distributed shirt', 'Pending order', 100, 49),
(12312320, 'Rad tricot t-shirt', 'Finalized', 500, 49),
(12312321, 'Essential t-shirt', 'In process', 500, 49),
(12312322, 'Essentials pants', 'Finalized', 500, 49),
(12312323, 'Warm up shirt', 'Finalized', 100, 49),
(12312324, 'Club polo shirt', 'Pending order', 60, 49);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `id_pedido` int(11) NOT NULL,
  `cantidad` varchar(45) NOT NULL,
  `nombres` varchar(45) DEFAULT NULL,
  `apellidos` varchar(45) DEFAULT NULL,
  `productos` varchar(100) DEFAULT NULL,
  `usuario_id_usuario` int(11) NOT NULL,
  `producto_codigo_producto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(123128, 'Camisetas Nike', 'Camisetas Nike', 'Camisetas Nike', 'Camisetas Nike', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `id_rol` int(11) NOT NULL,
  `nombre_rol` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(51, 'Brayan', 'Felipe', 'Quintero', 'Pardo', 'Calle 40p sur #2h-10', '301456987', 'brayan123@hotmail.com', '123', 'qweqwe@hotmail.com', 'Cedula de ciudadania', '0206030');

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
  ADD UNIQUE KEY `CORREO_UNIQUE` (`correo`);

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
  MODIFY `id_bodega` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `numero_referencia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `orden_confeccion`
--
ALTER TABLE `orden_confeccion`
  MODIFY `id_orden_confeccion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12312328;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=789798457;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `codigo_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=456123146;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `nit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123131;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

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
  ADD CONSTRAINT `fk_orden_confeccion_usuario1` FOREIGN KEY (`usuario_id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
