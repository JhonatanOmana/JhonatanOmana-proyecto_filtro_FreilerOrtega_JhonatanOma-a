CREATE DATABASE FILTRO_T2;
USE FILTRO_T2;

CREATE TABLE AGROCAT(
    id_AGROCAT INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(80),
    ubicacion VARCHAR(80),
    telefono VARCHAR(80),
    correo VARCHAR(80)
);

CREATE TABLE departamento(
    id_departamento INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(80),
    horario VARCHAR(80)
);

CREATE TABLE clientes(
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(80),
    apellido VARCHAR(80),
    cedula VARCHAR(80),
    correo VARCHAR(80),
    direccion VARCHAR(80)
);

CREATE TABLE proveedores(
    id_proveedores INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(80),
    apellido VARCHAR(80),
    cedula VARCHAR(80),
    correo VARCHAR(80),
    direccion VARCHAR(80)
);

CREATE TABLE mantenimiento(
    id_mantenimiento INT PRIMARY KEY AUTO_INCREMENT,
    fecha_entrada DATETIME,
    fecha_salida DATETIME,
    detalles VARCHAR(80)
);

CREATE TABLE loguin(
    id_loguin INT PRIMARY KEY AUTO_INCREMENT,
    contraseña VARCHAR(80),
    rol VARCHAR(80),
    id_empleado INT
);

CREATE TABLE registro(
    id_registro INT PRIMARY KEY AUTO_INCREMENT,
    nombre1 VARCHAR(80),
    nombre2 VARCHAR(80),
    apellido1 VARCHAR(80),
    apellido2 VARCHAR(80),
    cedula VARCHAR(80),
    correo VARCHAR(80),
    telefono VARCHAR(80),
    id_loguin INT,
    FOREIGN KEY (id_loguin) REFERENCES loguin(id_loguin),
    id_AGROCAT INT,
    FOREIGN KEY (id_AGROCAT) REFERENCES AGROCAT(id_AGROCAT)
);

CREATE TABLE empleado(
    id_empleado INT PRIMARY KEY AUTO_INCREMENT,
    nombre1 VARCHAR(80),
    nombre2 VARCHAR(80),
    apellido1 VARCHAR(80),
    apellido2 VARCHAR(80),
    cedula VARCHAR(80),
    correo VARCHAR(80),
    telefono VARCHAR(80),
    cargo VARCHAR(80),
    id_registro INT,
    FOREIGN KEY (id_registro) REFERENCES registro(id_registro),
    id_departamento INT,
    FOREIGN KEY (id_departamento) REFERENCES departamento(id_departamento)
);

CREATE TABLE pedidos(
    id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    cantidad INT,
    total_a_pagar INT,
    id_cliente INT,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

CREATE TABLE productos(
    id_producto INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(80),
    cantidad INT,
    cantidad_stock INT,
    id_departamento INT,
    FOREIGN KEY (id_departamento) REFERENCES departamento(id_departamento),
    id_pedido INT,
    FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido),
    id_cliente INT,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

CREATE TABLE pagos(
    id_pago INT PRIMARY KEY AUTO_INCREMENT,
    metodo_pago VARCHAR(80),
    id_pedido INT,
    FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido),
    id_cliente INT,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

CREATE TABLE salario(
    id_salario INT PRIMARY KEY AUTO_INCREMENT,
    horas INT,
    id_empleado INT,
    salario_total int,
    FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado),
    id_departamento INT,
    FOREIGN KEY (id_departamento) REFERENCES departamento(id_departamento)
);

CREATE TABLE pedido_proveedores(
    id_pedido_proveedores INT PRIMARY KEY AUTO_INCREMENT,
    id_AGROCAT INT,
    FOREIGN KEY (id_AGROCAT) REFERENCES AGROCAT(id_AGROCAT)
);

CREATE TABLE insumos(
    id_insumos INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(80),
    cantidad INT,
    precio DECIMAL(10,2),
    id_pedido_proveedores INT,
    FOREIGN KEY (id_pedido_proveedores) REFERENCES pedido_proveedores(id_pedido_proveedores),
    id_AGROCAT INT,
    FOREIGN KEY (id_AGROCAT) REFERENCES AGROCAT(id_AGROCAT),
    id_proveedores INT,
    FOREIGN KEY (id_proveedores) REFERENCES proveedores(id_proveedores)
);

CREATE TABLE maquinaria(
    id_maquinaria INT PRIMARY KEY AUTO_INCREMENT,
    tipo VARCHAR(80),
    nombre VARCHAR(80),
    estado VARCHAR(80),
    id_mantenimiento INT,
    FOREIGN KEY (id_mantenimiento) REFERENCES mantenimiento(id_mantenimiento),
    id_departamento INT,
    FOREIGN KEY (id_departamento) REFERENCES departamento(id_departamento)
);




