create database ferremas;
create user "jefe"@"%" identified by "123";
grant all privileges on ferremas.* to "jefe"@"%";
flush privileges;

use ferremas;

CREATE TABLE Cliente (
id_cliente INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
correo VARCHAR(100) NOT NULL UNIQUE,
contrasenia VARCHAR(100) NOT NULL,
direccion VARCHAR(255),
telefono VARCHAR(20)
);

CREATE TABLE Producto (
id_producto INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
categoria VARCHAR(100),
precio DECIMAL(10,2) NOT NULL,
stock INT DEFAULT 0,
descripcion TEXT,
imagen_url VARCHAR(255)
);

CREATE TABLE Pedido (
id_pedido INT AUTO_INCREMENT PRIMARY KEY,
id_cliente INT,
fecha_pedido DATETIME DEFAULT CURRENT_TIMESTAMP,
total DECIMAL(10,2),
estado_pedido ENUM('pendiente', 'aprobado', 'enviado', 'entregado') DEFAULT 'pendiente',
tipo_entrega ENUM('retiro en tienda', 'despacho a domicilio') DEFAULT 'despacho a domicilio',
FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);

CREATE TABLE Detalle_Pedido (
id_detalle INT AUTO_INCREMENT PRIMARY KEY,
id_pedido INT,
id_producto INT,
cantidad INT NOT NULL,
precio_unitario DECIMAL(10,2),
FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido),
FOREIGN KEY (id_producto) REFERENCES Producto(id_producto)
);

CREATE TABLE Pago (
id_pago INT AUTO_INCREMENT PRIMARY KEY,
id_pedido INT,
fecha_pago DATETIME DEFAULT CURRENT_TIMESTAMP,
monto DECIMAL(10,2),
tipo_pago ENUM('Webpay', 'transferencia'),
estado_pago ENUM('pendiente', 'confirmado'),
FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido)
);

CREATE TABLE Usuario_Sistema (
id_usuario INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
correo VARCHAR(100) NOT NULL UNIQUE,
contrasenia VARCHAR(100) NOT NULL,
rol ENUM('Administrador', 'Vendedor', 'Bodeguero', 'Contador')
);


INSERT INTO Producto (nombre, categoria, precio, stock, descripcion, imagen_url) VALUES
('Taladro Percutor Bosch GSB13RE', 'Herramientas Eléctricas', 89990.00, 20, 'Taladro de impacto de 550W con portabrocas sin llave.', 'https://m.media-amazon.com/images/I/71V5Ckz6tFL.AC_SL1500.jpg'),
('Martillo de Carpintero de Fibra de Vidrio', 'Herramientas Manuales', 7990.00, 50, 'Martillo de garra de uso general con mango antideslizante.', 'https://m.media-amazon.com/images/I/61Gx4v6sK6L.AC_SL1500.jpg'),
('Juego de Destornilladores Torx', 'Herramientas Manuales', 12990.00, 35, 'Set de destornilladores Torx de precisión.', 'https://img.freepik.com/foto-gratis/juego-destornilladores-torx_53876-126634.jpg'),
('Lijadora Orbital Makita BO4556', 'Herramientas Eléctricas', 64990.00, 10, 'Lijadora orbital de 200W para acabados finos.', 'https://www.sodimac.cl/sodimac-cl/product/1119516/Lijadora-Orbital-Bo4556-112-X-102mm-200w/1119516'),
('Caja de Tornillos 5mm Soberbio Zincado', 'Tornillos y Anclajes', 5990.00, 100, 'Pack de 48 cajas de 100 tornillos zincados de 5mm.', 'https://www.prodalam.cl/media/catalog/product/cache/1/image/800x800/9df78eab33525d08d6e5fb8d27136e95/7/3/73100-ca.jpg'),
('Casco de Seguridad Amarillo Climax', 'Equipos de Seguridad', 10990.00, 25, 'Casco de seguridad amarillo con suspensión de 4 puntos.', 'https://www.kroser.com.uy/media/catalog/product/cache/1/image/800x800/9df78eab33525d08d6e5fb8d27136e95/1/0/10240359006_000.jpg'),
('Lentes de Seguridad Transparente Condor', 'Equipos de Seguridad', 4990.00, 40, 'Lentes de seguridad con protección UV y diseño ergonómico.', 'https://www.grainger.com.mx/media/product/4EY97_AS01.jpg'),
('Pintura Látex Blanca 4L American Colors', 'Pinturas', 19990.00, 15, 'Pintura látex blanca mate para interiores y exteriores.', 'https://www.promart.pe/media/catalog/product/cache/1/image/800x800/9df78eab33525d08d6e5fb8d27136e95/1/6/16109.jpg'),
('Cemento Portland 25kg Cielo Azul', 'Materiales Básicos', 6990.00, 60, 'Saco de cemento Portland de alta resistencia.', 'https://www.sanmarino.com.uy/media/catalog/product/cache/1/image/800x800/9df78eab33525d08d6e5fb8d27136e95/c/e/cemento_portland_25kg.jpg'),
('Nivel Láser Stanley FMHT77447-1', 'Equipos de Medición', 34990.00, 12, 'Nivel láser rotativo con alcance de 600 metros.', 'https://m.media-amazon.com/images/I/61ZfK+3KxJL.AC_SL1500.jpg');

-- Insertar clientes
INSERT INTO Cliente (nombre, correo, contrasenia, direccion, telefono) VALUES
('Sanon Natalie 2', 'sanon@gmail.com', 'clave2', 'Calle Falsa 200', '988891989'),
('Lovena Andre 3', 'andre@gmail.com', 'clave3', 'Calle Falsa 300', '990190236'),
('Joseph Marianie 4', 'marianie@gmail.com', 'clave4', 'Calle Falsa 400', '914199486'),
('Nadia Jean Baptiste 5', 'nadia@gmail.com', 'clave5', 'Calle Falsa 500', '911289926'),
('Admise Germain 6', 'germain@gmail.com', 'clave6', 'Calle Falsa 600', '982695195');

-- Insertar nuevos pedidos
INSERT INTO Pedido (id_cliente, fecha_pedido, total, estado_pedido, tipo_entrega) VALUES
(1, '2025-05-03 02:31:41', 28670.41, 'pendiente', 'despacho_a_domicilio'),
(2, '2025-05-15 02:31:41', 37469.90, 'aprobado', 'retiro_en_tienda'),
(3, '2025-05-19 02:31:41', 17097.19, 'pendiente', 'retiro_en_tienda'),
(4, '2025-05-14 02:31:41', 95607.50, 'aprobado', 'despacho_a_domicilio'),
(5, '2025-05-09 02:31:41', 48913.60, 'enviado', 'retiro_en_tienda');

-- Insertar detalles de pedidos (referencia a producto existente id_producto)
INSERT INTO Detalle_Pedido (id_pedido, id_producto, cantidad, precio_unitario) VALUES
(6, 1, 2, 34832.45),
(7, 8, 2, 13832.41),
(8, 3, 4, 29359.65),
(9, 5, 4, 22700.10),
(10, 7, 2, 23607.19);

-- Insertar pagos correspondientes
INSERT INTO Pago (id_pedido, fecha_pago, monto, tipo_pago, estado_pago) VALUES
(6, '2025-05-03 02:31:41', 28670.41, 'transferencia', 'pendiente'),
(7, '2025-05-15 02:31:41', 37469.90, 'Webpay', 'confirmado'),
(8, '2025-05-19 02:31:41', 17097.19, 'transferencia', 'pendiente'),
(9, '2025-05-14 02:31:41', 95607.50, 'transferencia', 'pendiente'),
(10, '2025-05-09 02:31:41', 48913.60, 'transferencia', 'pendiente');


-- Insertar usuario del sistema
INSERT INTO Usuario_Sistema (nombre, correo, contrasenia, rol) VALUES
('Admin General', 'admin@ferremas.cl', 'admin123', 'Administrador'),
('Carlos Pérez', 'vendedor1@ferremas.cl', 'venta123', 'Vendedor'),
('Lucía Rojas', 'bodega@ferremas.cl', 'bodega123', 'Bodeguero'),
('María Torres', 'contabilidad@ferremas.cl', 'conta123', 'Contador');
