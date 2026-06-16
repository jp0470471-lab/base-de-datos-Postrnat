-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-06-2026 a las 05:38:46
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `restaurante`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id_categoria` int(11) NOT NULL,
  `nombre_categoria` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id_categoria`, `nombre_categoria`) VALUES
(1, 'Entradas'),
(2, 'Platos Fuertes'),
(3, 'Bebidas'),
(4, 'Postres'),
(5, 'Bebidas Calientes');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra_insumo`
--

CREATE TABLE `compra_insumo` (
  `id_compra` int(11) NOT NULL,
  `fecha_compra` date NOT NULL,
  `cantidad_comprada` decimal(10,2) DEFAULT NULL,
  `valor_total` decimal(10,2) DEFAULT NULL,
  `id_insumo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `compra_insumo`
--

INSERT INTO `compra_insumo` (`id_compra`, `fecha_compra`, `cantidad_comprada`, `valor_total`, `id_insumo`) VALUES
(1, '2026-05-01', 20.00, 400000.00, 1),
(2, '2026-05-02', 10.00, 200000.00, 2),
(3, '2026-05-03', 50.00, 150000.00, 3),
(4, '2026-05-04', 15.00, 120000.00, 4),
(5, '2026-05-05', 25.00, 500000.00, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedido`
--

CREATE TABLE `detalle_pedido` (
  `id_detalle` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `id_pedido` int(11) DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalle_pedido`
--

INSERT INTO `detalle_pedido` (`id_detalle`, `cantidad`, `precio_unitario`, `subtotal`, `id_pedido`, `id_producto`) VALUES
(1, 2, 25.00, 50000.00, 1, 1),
(2, 1, 45000.00, 45000.00, 2, 2),
(3, 3, 8000.00, 24000.00, 3, 3),
(4, 1, 12000.00, 12000.00, 4, 4),
(5, 2, 15000.00, 30000.00, 5, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `id_empleado` int(11) NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `num_identificacion` varchar(20) NOT NULL,
  `direccion` varchar(150) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `correo` varchar(100) NOT NULL,
  `nombre_usuario` varchar(50) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  `fecha_ingreso` date DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL,
  `id_rol` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`id_empleado`, `nombres`, `apellidos`, `num_identificacion`, `direccion`, `telefono`, `correo`, `nombre_usuario`, `contrasena`, `fecha_ingreso`, `estado`, `id_rol`) VALUES
(1, 'Juan', 'Pérez', '1001', 'Calle 10', '3208369999', 'juan@gmail.com', 'juanp', '12345', '2025-01-10', 'Activo', 1),
(2, 'María', 'Gómez', '1002', 'Calle 11', '3002222222', 'maria@gmail.com', 'mariag', '12345', '2025-02-15', 'Activo', 2),
(3, 'Carlos', 'Ramírez', '1003', 'Calle 12', '3003333333', 'carlos@gmail.com', 'carlosr', '12345', '2025-03-20', 'Activo', 3),
(4, 'Luisa', 'Fernández', '1004', 'Calle 13', '3004444444', 'luisa@gmail.com', 'luisaf', '12345', '2025-04-05', 'Activo', 4),
(5, 'Andrés', 'Martínez', '1005', 'Calle 14', '3005555555', 'andres@gmail.com', 'andresm', '12345', '2025-05-01', 'Activo', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `insumo`
--

CREATE TABLE `insumo` (
  `id_insumo` int(11) NOT NULL,
  `nombre_insumo` varchar(100) NOT NULL,
  `unidad_medida` varchar(50) DEFAULT NULL,
  `cantidad_disponible` decimal(10,2) DEFAULT NULL,
  `stock_minimo` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `insumo`
--

INSERT INTO `insumo` (`id_insumo`, `nombre_insumo`, `unidad_medida`, `cantidad_disponible`, `stock_minimo`) VALUES
(1, 'Carne', 'Kg', 50.00, 10.00),
(2, 'Queso', 'Kg', 30.00, 5.00),
(3, 'Harina', 'Kg', 100.00, 20.00),
(4, 'Tomate', 'Kg', 40.00, 8.00),
(5, 'Pollo', 'Kg', 60.00, 15.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mesa`
--

CREATE TABLE `mesa` (
  `id_mesa` int(11) NOT NULL,
  `numero_mesa` int(11) NOT NULL,
  `capacidad` int(11) NOT NULL,
  `ubicacion` varchar(100) DEFAULT NULL,
  `estado` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `mesa`
--

INSERT INTO `mesa` (`id_mesa`, `numero_mesa`, `capacidad`, `ubicacion`, `estado`) VALUES
(1, 1, 4, 'Ventana', 'Ocupada'),
(2, 2, 2, 'Centro', 'Ocupada'),
(3, 3, 6, 'Terraza', 'Disponible'),
(4, 4, 8, '2 piso', 'Reservada'),
(5, 5, 4, 'Patio', 'Disponible');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago`
--

CREATE TABLE `pago` (
  `id_pago` int(11) NOT NULL,
  `fecha_pago` datetime NOT NULL,
  `metodo_pago` varchar(50) DEFAULT NULL,
  `total` decimal(10,2) NOT NULL,
  `comprobante_generado` tinyint(1) DEFAULT 0,
  `numero_factura` varchar(50) DEFAULT NULL,
  `tipo_factura` varchar(50) DEFAULT NULL,
  `id_pedido` int(11) DEFAULT NULL,
  `id_empleado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pago`
--

INSERT INTO `pago` (`id_pago`, `fecha_pago`, `metodo_pago`, `total`, `comprobante_generado`, `numero_factura`, `tipo_factura`, `id_pedido`, `id_empleado`) VALUES
(1, '2026-05-14 12:20:00', 'Efectivo', 50000.00, 0, 'FAC001', 'Electronica', 1, 3),
(2, '2026-05-14 12:50:00', 'Tarjeta', 45000.00, 0, 'FAC002', 'Electronica', 2, 1),
(3, '2026-05-14 13:20:00', 'Nequi', 24000.00, 0, 'FAC003', 'Electronica', 3, 5),
(4, '2026-05-14 13:50:00', 'Daviplata', 12000.00, 0, 'FAC004', 'Electronica', 4, 4),
(5, '2026-05-14 14:20:00', 'Efectivo', 30000.00, 0, 'FAC005', 'Electronica', 5, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `id_pedido` int(11) NOT NULL,
  `fecha_hora` datetime NOT NULL,
  `estado` varchar(30) DEFAULT NULL,
  `id_mesa` int(11) DEFAULT NULL,
  `id_mesero` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`id_pedido`, `fecha_hora`, `estado`, `id_mesa`, `id_mesero`) VALUES
(1, '2026-05-14 12:00:00', 'Pendiente', 1, 1),
(2, '2026-05-14 12:30:00', 'Entregado', 2, 2),
(3, '2026-05-14 13:00:00', 'Entregado', 3, 3),
(4, '2026-05-14 13:30:00', 'Pagado', 4, 4),
(5, '2026-05-14 14:00:00', 'Cancelado', 5, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prediccion`
--

CREATE TABLE `prediccion` (
  `id_prediccion` int(11) NOT NULL,
  `fecha_generacion` date NOT NULL,
  `horizonte_dias` int(11) DEFAULT NULL,
  `consumo_estimado` decimal(10,2) DEFAULT NULL,
  `stock_recomendado` decimal(10,2) DEFAULT NULL,
  `nivel_riesgo` varchar(50) DEFAULT NULL,
  `estado` varchar(30) DEFAULT NULL,
  `observacion` varchar(255) DEFAULT NULL,
  `id_insumo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `prediccion`
--

INSERT INTO `prediccion` (`id_prediccion`, `fecha_generacion`, `horizonte_dias`, `consumo_estimado`, `stock_recomendado`, `nivel_riesgo`, `estado`, `observacion`, `id_insumo`) VALUES
(1, '2026-05-14', 7, 20.00, 30.00, 'Bajo', 'Activo', 'Stock suficiente', 1),
(2, '2026-05-14', 5, 15.00, 20.00, 'Medio', 'Activo', 'Comprar pronto', 2),
(3, '2026-05-14', 6, 40.00, 60.00, 'Alto', 'Activo', 'Reabastecer', 3),
(5, '2026-05-14', 7, 25.00, 35.00, 'Medio', 'Activo', 'Monitorear el consumo', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id_producto` int(11) NOT NULL,
  `nombre_producto` varchar(100) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL,
  `disponible` tinyint(1) DEFAULT 1,
  `id_categoria` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id_producto`, `nombre_producto`, `descripcion`, `precio`, `disponible`, `id_categoria`) VALUES
(1, 'Hamburguesa', 'Hamburguesa doble carne', 36000.00, 3, 2),
(2, 'Pizza', 'Pizza familiar', 60000.00, 2, 2),
(3, 'Limonada', 'Limonada natural', 9000.00, 3, 3),
(4, 'Brownie', 'Brownie con helado', 12000.00, 4, 4),
(5, 'Sopa', 'Sopa de pollo', 18000.00, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_insumo`
--

CREATE TABLE `producto_insumo` (
  `id_producto_insumo` int(11) NOT NULL,
  `cantidad_requerida` decimal(10,2) DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `id_insumo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto_insumo`
--

INSERT INTO `producto_insumo` (`id_producto_insumo`, `cantidad_requerida`, `id_producto`, `id_insumo`) VALUES
(1, 0.30, 1, 1),
(2, 0.20, 2, 2),
(3, 0.50, 2, 3),
(4, 0.10, 1, 4),
(5, 0.40, 5, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `id_rol` int(11) NOT NULL,
  `nombre_rol` varchar(50) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id_rol`, `nombre_rol`, `descripcion`) VALUES
(0, 'Bartender', 'Encargado de la barra de bebidas'),
(1, 'Administrador', 'Control total del sistema'),
(2, 'Mesero', 'Gestiona pedidos y mesas'),
(3, 'Cajero', 'Gestiona pagos y facturación'),
(4, 'Cocinero', 'Prepara los pedidos'),
(5, 'Supervisor', 'Supervisa operaciones');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `compra_insumo`
--
ALTER TABLE `compra_insumo`
  ADD PRIMARY KEY (`id_compra`),
  ADD KEY `fk_compra_insumo` (`id_insumo`);

--
-- Indices de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD PRIMARY KEY (`id_detalle`),
  ADD KEY `fk_detalle_pedido` (`id_pedido`),
  ADD KEY `fk_detalle_producto` (`id_producto`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`id_empleado`),
  ADD UNIQUE KEY `num_identificacion` (`num_identificacion`),
  ADD UNIQUE KEY `correo` (`correo`),
  ADD UNIQUE KEY `nombre_usuario` (`nombre_usuario`),
  ADD KEY `fk_empleado_rol` (`id_rol`);

--
-- Indices de la tabla `insumo`
--
ALTER TABLE `insumo`
  ADD PRIMARY KEY (`id_insumo`);

--
-- Indices de la tabla `mesa`
--
ALTER TABLE `mesa`
  ADD PRIMARY KEY (`id_mesa`),
  ADD UNIQUE KEY `numero_mesa` (`numero_mesa`);

--
-- Indices de la tabla `pago`
--
ALTER TABLE `pago`
  ADD PRIMARY KEY (`id_pago`),
  ADD UNIQUE KEY `id_pedido` (`id_pedido`),
  ADD KEY `fk_pago_empleado` (`id_empleado`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id_pedido`),
  ADD KEY `fk_pedido_mesa` (`id_mesa`),
  ADD KEY `fk_pedido_mesero` (`id_mesero`);

--
-- Indices de la tabla `prediccion`
--
ALTER TABLE `prediccion`
  ADD PRIMARY KEY (`id_prediccion`),
  ADD KEY `fk_prediccion_insumo` (`id_insumo`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `fk_producto_categoria` (`id_categoria`);

--
-- Indices de la tabla `producto_insumo`
--
ALTER TABLE `producto_insumo`
  ADD PRIMARY KEY (`id_producto_insumo`),
  ADD KEY `fk_productoinsumo_producto` (`id_producto`),
  ADD KEY `fk_productoinsumo_insumo` (`id_insumo`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id_rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `compra_insumo`
--
ALTER TABLE `compra_insumo`
  MODIFY `id_compra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  MODIFY `id_detalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `id_empleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `insumo`
--
ALTER TABLE `insumo`
  MODIFY `id_insumo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `mesa`
--
ALTER TABLE `mesa`
  MODIFY `id_mesa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `pago`
--
ALTER TABLE `pago`
  MODIFY `id_pago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
