CREATE DATABASE Peticiones;
USE Peticiones;

CREATE TABLE rol (
    id_rol INT AUTO_INCREMENT PRIMARY KEY,
    nombre_rol VARCHAR(50) NOT NULL,
    descripcion TEXT
);
CREATE TABLE tipo_peticion (
    id_tipo INT AUTO_INCREMENT PRIMARY KEY,
    nombre_tipo VARCHAR(50) NOT NULL,
    descripcion TEXT,
    activo BOOLEAN DEFAULT TRUE
);
CREATE TABLE usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido_paterno VARCHAR(50),
    apellido_materno VARCHAR(50),
    correo VARCHAR(100) UNIQUE,
    contraseña VARCHAR(255),
    rol_id INT,
    usuario_sistema VARCHAR(50),
    activo BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (rol_id) REFERENCES rol(id_rol)
);
CREATE TABLE peticion (
    id_peticion INT AUTO_INCREMENT PRIMARY KEY,
    tipo_peticion_id INT,
    descripcion TEXT,
    fecha_creacion DATETIME,
    fecha_respuesta DATETIME,
    archivo VARCHAR(255),
    usuario_emisor INT,
    usuario_receptor INT,
    estado_actual ENUM('pendiente','aceptada','rechazada''pausada''cerrada'),
    FOREIGN KEY (tipo_peticion_id) REFERENCES tipo_peticion(id_tipo),
    FOREIGN KEY (usuario_emisor) REFERENCES usuario(id_usuario),
    FOREIGN KEY (usuario_receptor) REFERENCES usuario(id_usuario)
);
CREATE TABLE historial_peticion (
    id_historial INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    peticion_id INT,
    estado ENUM('pendiente','aceptada','rechazada''pausada''cerrada'),
    fecha_cambio DATETIME,
    comentario TEXT,
    FOREIGN KEY (usuario_id) REFERENCES usuario(id_usuario),
    FOREIGN KEY (peticion_id) REFERENCES peticion(id_peticion)
);
CREATE TABLE rol_peticion (
    id INT AUTO_INCREMENT PRIMARY KEY,
    rol_id INT,
    tipo_peticion_id INT,
    FOREIGN KEY (rol_id) REFERENCES rol(id_rol),
    FOREIGN KEY (tipo_peticion_id) REFERENCES tipo_peticion(id_tipo)
);
INSERT INTO rol (nombre_rol, descripcion) VALUES
('CONTABILIDAD', 'Área de contabilidad'),
('BANCAS', 'Área de operaciones bancarias'),
('ADM. CAJA', 'Administración de caja'),
('MOSTRADOR', 'Área de mostrador'),
('GERENTE', 'Rol de gerencia'),
('PATIO', 'Área de patio'),
('OTRAS PETICIONES', 'Peticiones generales no ligadas a un área específica');


SELECT * FROM rol;

SELECT * FROM tipo_peticion;

INSERT INTO tipo_peticion (id_tipo, nombre_tipo, descripcion, activo) VALUES
(1, 'Contpaq', 'Soporte relacionado con sistema Contpaq', TRUE),
(2, 'Hardware/Software', 'Soporte técnico de hardware y software', TRUE);


INSERT INTO tipo_peticion (id_tipo, nombre_tipo, descripcion, activo) VALUES
(3, 'Cambio de Precio', 'Modificar precios de productos o servicios', TRUE),
(4, 'Seguimientos a Actividades especificas', 'Seguimiento de actividades puntuales', TRUE),
(5, 'Alta/Modificación de Cliente', 'Registro o modificación de clientes', TRUE);


INSERT INTO tipo_peticion (id_tipo, nombre_tipo, descripcion, activo) VALUES
(6, 'Eliminacion/Modificación Mov. Bancarios', 'Gestión de movimientos bancarios', TRUE),
(7, 'Eliminar recibos de pagos', 'Eliminación de recibos de pagos', TRUE),
(8, 'Eliminar Ordenes de Pagos', 'Eliminación de órdenes de pago', TRUE),
(9, 'Alta de Conceptos bancarios', 'Registro de conceptos bancarios', TRUE),
(10, 'Alta de Cajas', 'Registro de cajas', TRUE),
(11, 'Hardware/Software', 'Soporte técnico de hardware y software', TRUE),
(12, 'Altas/Modificacion de Clientes', 'Registro o modificación de clientes', TRUE),
(13, 'Alta/Modificación de productos', 'Registro o modificación de productos', TRUE),
(14, 'Cambios de precio', 'Modificación de precios', TRUE);

-- BANCAS - Solicitudes
INSERT INTO tipo_peticion (id_tipo, nombre_tipo, descripcion, activo) VALUES
(15, 'Pagos en General', 'Gestión de pagos generales', TRUE),
(16, 'Validación de Nómina', 'Validación de nómina', TRUE);


INSERT INTO tipo_peticion (id_tipo, nombre_tipo, descripcion, activo) VALUES
(17, 'Cancelación, Eliminación y Modificación Remisiones', 'Gestión de remisiones', TRUE),
(18, 'Cuadre de facturas', 'Revisión y cuadre de facturas', TRUE),
(19, 'Cancelación de Facturas', 'Anulación de facturas', TRUE),
(20, 'Cancelación de Cartera', 'Gestión de cartera', TRUE),
(21, 'Cerrar Pedidos(Frentes)', 'Cierre de pedidos', TRUE),
(22, 'Eliminacion/Modificación Mov. Bancarios', 'Gestión de movimientos bancarios', TRUE),
(23, 'Alta/Modificación de Cliente', 'Registro o modificación de clientes', TRUE),
(24, 'Modificación de Precios', 'Modificación de precios', TRUE),
(25, 'Eliminacion recibos de pagos', 'Eliminación de recibos de pagos', TRUE),
(26, 'Hardware/Software', 'Soporte técnico de hardware y software', TRUE);

-- ADM. CAJA - Solicitudes
INSERT INTO tipo_peticion (id_tipo, nombre_tipo, descripcion, activo) VALUES
(27, 'Pagos a proveedores', 'Gestión de pagos a proveedores', TRUE),
(28, 'Solicitud de Gas/Combustibles', 'Solicitud de combustibles', TRUE),
(29, 'Pagos de Servicios', 'Gestión de pagos de servicios', TRUE),
(30, 'Reembolsos variados', 'Gestión de reembolsos', TRUE),
(31, 'Notas de Cargo/Credito', 'Gestión de notas de cargo/crédito', TRUE),
(32, 'Pagos Bonos, Honorarios, etc', 'Pagos de bonos y honorarios', TRUE),
(33, 'Reembolso de Efectivo/Tarjeta', 'Reembolsos en efectivo o tarjeta', TRUE),
(34, 'Remisiones manuales', 'Gestión de remisiones manuales', TRUE);


INSERT INTO tipo_peticion (id_tipo, nombre_tipo, descripcion, activo) VALUES
(35, 'Alta/Modificación de Cliente', 'Registro o modificación de clientes', TRUE),
(36, 'Cambio de Precio', 'Modificar precios de productos o servicios', TRUE),
(37, 'Alta proveedor', 'Registro de proveedores', TRUE),
(38, 'Alta/Modificacion de producto', 'Registro o modificación de productos', TRUE),
(39, 'Traspasos', 'Traspaso de inventario', TRUE),
(40, 'Ajustes de inventario', 'Ajustes de inventario', TRUE),
(41, 'Cruce/Ajustes conteos de Ferreteria/Sensibles', 'Cruce y ajustes de conteos', TRUE),
(42, 'Cerrar Pedidos', 'Cierre de pedidos', TRUE),
(43, 'Entrada de Compra', 'Registro de compras', TRUE);


INSERT INTO tipo_peticion (id_tipo, nombre_tipo, descripcion, activo) VALUES
(44, 'Baja Merma/Uso Interno', 'Gestión de merma o uso interno', TRUE),
(45, 'Cambio de Precio Sugerido', 'Solicitud de cambio de precio sugerido', TRUE),
(46, 'Salida pedidos crédito', 'Gestión de pedidos a crédito', TRUE),
(47, 'Transferencia de saldos de clientes entre sesiones', 'Transferencia de saldos', TRUE),
(48, 'Compras', 'Gestión de compras', TRUE),
(49, 'Validación/Aplicación de Saldos', 'Validación y aplicación de saldos', TRUE);

INSERT INTO tipo_peticion (id_tipo, nombre_tipo, descripcion, activo) VALUES
(50, 'Cambio de Precio', 'Modificar precios de productos o servicios', TRUE),
(51, 'Traspasos', 'Traspaso de inventario', TRUE),
(52, 'Ajustes de inventario', 'Ajustes de inventario', TRUE),
(53, 'Cruce/Ajustes conteos de Ferreteria/Sensibles', 'Cruce y ajustes de conteos', TRUE),
(54, 'Entrada de Compra', 'Registro de compras', TRUE);


INSERT INTO tipo_peticion (id_tipo, nombre_tipo, descripcion, activo) VALUES
(55, 'Baja Merma/Uso Interno', 'Gestión de merma o uso interno', TRUE),
(56, 'Cambio de Precio Sugerido', 'Solicitud de cambio de precio sugerido', TRUE),
(57, 'Salida pedidos crédito', 'Gestión de pedidos a crédito', TRUE),
(58, 'Transferencia de saldos de clientes entre sesiones', 'Transferencia de saldos', TRUE),
(59, 'Validación/Aplicación de Saldos', 'Validación y aplicación de saldos', TRUE),
(60, 'Solicitud de Gas/Combustibles', 'Solicitud de combustibles', TRUE),
(61, 'Solicitud Carte Porte', 'Solicitud de carta porte', TRUE),
(62, 'Solicitud Gastos de Unidades/PDV', 'Solicitud de gastos de unidades o puntos de venta', TRUE),
(63, 'Compras', 'Gestión de compras', TRUE);


INSERT INTO tipo_peticion (id_tipo, nombre_tipo, descripcion, activo) VALUES
(64, 'Ajustes de inventario', 'Ajustes de inventario', TRUE),
(65, 'Entrada de Compra', 'Registro de compras', TRUE),
(66, 'Recetas de producción', 'Gestión de recetas de producción', TRUE),
(67, 'Traspasos', 'Traspaso de inventario', TRUE);


INSERT INTO tipo_peticion (id_tipo, nombre_tipo, descripcion, activo) VALUES
(68, 'Baja Merma/Uso Interno', 'Gestión de merma o uso interno', TRUE),
(69, 'Solicitud de Gas/Combustibles', 'Solicitud de combustibles', TRUE),
(70, 'Solicitud Carte Porte', 'Solicitud de carta porte', TRUE),
(71, 'Solicitud Gastos de Unidades/PDV', 'Solicitud de gastos de unidades o puntos de venta', TRUE);

