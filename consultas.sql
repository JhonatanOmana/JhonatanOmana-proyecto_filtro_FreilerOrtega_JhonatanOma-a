use filtro_t2;

-- CONSULTAS 

-- 1 conocer todos los clientes que realizaron compras en AGROCAT

select nombre from clientes;

-- 2 consultar todos los productos en stock 

select * from productos where cantidad_stock > 0;

-- 3 consultar pedido de un cliente en especifico 

select * from pedidos where id_cliente = 3;

-- 4 total a pagar de todos los pedidos 

select sum(total_a_pagar) as total_valor_de_pedidos from pedidos;

-- 5 obtener el total de horas trabajadas por cada uno de los empleados 

select e.nombre1, e.apellido1, s.horas from empleado e join salario s on e.id_empleado = s.id_empleado;

-- 6 consultar el estado de las maquinarias 

select nombre, estado from maquinaria ;

-- 7 consultar el estado de las maquinarias que esten operando

select nombre, estado from maquinaria where estado = 'Operativo';

-- 8 consultar el estado de las maquinarias que esten en mantenimiento

select nombre, estado from maquinaria where estado = 'En Mantenimiento';

-- 9 consultar numero de insumos por proveedor 

select id_proveedores, count(*) as num_insumos from insumos group by id_proveedores;

-- 10 consultar detalles de un pedido especifico 

select * from productos where id_pedido = 1;

-- 11 listar empleados por cargo

select nombre1,apellido1,cargo from empleado order by cargo;

-- 11 consultar nombre y apellido de empleados que tengan cargo de contadora

select nombre1,apellido1,cargo from empleado where cargo = 'Contadora';

-- 12 ver clientes que han realizado un pedido sin repetir cliente

select distinct c.nombre, c.apellido,p.id_pedido from clientes c join pedidos p on c.id_cliente = p.id_cliente;

-- 13consultar total de pagos por metodo de pago

select metodo_pago, count(*) as total_pagos from pagos group by metodo_pago;

-- 14 obtener productos con su cantidad y precio

select nombre,cantidad,precio from insumos;

-- 15 obtener horario de los departamentos

select nombre,horario from departamento;

-- 16 obtener detalle de loguins de los empleados

select l.rol, e.nombre1, e.apellido1 from loguin l join empleado e on l.id_empleado = e.id_empleado;

-- 17 obetener pedidos junto con el nombre del cliente 

select p.*,c.nombre,c.apellido from pedidos p join clientes c on  p.id_cliente = c.id_cliente ;

-- 18 obtener todos los insumos de un proveedor 

select * from insumos where id_proveedores = 1;

-- 19 consulta total de horas por cada empleado

select e.nombre1,e.apellido1, sum(s.horas) as total_horas from empleado e join salario s on e.id_empleado = s.id_empleado group by e.id_empleado;

-- 20 consultar numero de pedidos en total 

select count(*) as total_pedidos from pedidos;

-- 21. Obtener todos los empleados y sus respectivos departamentos
   SELECT e.nombre1, e.apellido1, d.nombre FROM empleado e INNER JOIN departamento d ON e.id_departamento = d.id_departamento;
   

-- 22. Obtener todos los productos y la cantidad de pedidos asociados
   SELECT p.nombre, COUNT(pp.id_pedido) AS Total_Pedidos FROM productos p LEFT JOIN pedidos pp ON p.id_pedido = pp.id_pedido GROUP BY p.id_producto;
   

-- 23. Obtener todos los clientes y sus pagos
   SELECT c.nombre, c.apellido, pa.metodo_pago FROM clientes c LEFT JOIN pagos pa ON c.id_cliente = pa.id_cliente;
   

-- 24. Obtener información de mantenimiento y la maquinaria asociada.
   SELECT m.fecha_entrada, m.fecha_salida, ma.nombre FROM mantenimiento m INNER JOIN maquinaria ma ON m.id_mantenimiento = ma.id_mantenimiento;
   

-- 25. Obtener todos los pedidos y los productos asociados.
   SELECT p.id_pedido, pr.nombre FROM pedidos p INNER JOIN productos pr ON p.id_pedido = pr.id_pedido;
   

-- 26. Obtener el nombre y apellido de los empleados junto con su salario.
   SELECT e.nombre1, e.apellido1, s.horas FROM empleado e INNER JOIN salario s ON e.id_empleado = s.id_empleado;
   

-- 27. Obtener información de insumos y su proveedor
   SELECT i.nombre, p.nombre AS Proveedor FROM insumos i INNER JOIN proveedores p ON i.id_proveedores = p.id_proveedores;
   

-- 28. Obtener la lista de clientes y sus respectivos pedidos
   SELECT c.nombre, c.apellido, p.cantidad FROM clientes c LEFT JOIN pedidos p ON c.id_cliente = p.id_cliente;
   

-- 29. Obtener todos los productos y sus departamentos
   SELECT pr.nombre, d.nombre AS Departamento FROM productos pr INNER JOIN departamento d ON pr.id_departamento = d.id_departamento;
   

-- 30. Obtener el total de pagos por cada cliente
    SELECT c.nombre, c.apellido, SUM(p.total_a_pagar) AS Total_Pagos FROM clientes c LEFT JOIN pedidos p ON c.id_cliente = p.id_cliente GROUP BY c.id_cliente;
    

-- 31. Obtener la cantidad de insumos y su pedido correspondiente
    SELECT i.nombre, i.cantidad, pp.id_pedido_proveedores FROM insumos i INNER JOIN pedido_proveedores pp ON i.id_pedido_proveedores = pp.id_pedido_proveedores;
    
-- 32. Obtener la lista de empleados y sus roles de login
    SELECT e.nombre1, e.apellido1, l.rol FROM empleado e INNER JOIN loguin l ON e.id_registro = l.id_empleado;
    
-- 33. Obtener el horario de los departamentos y los empleados que pertenecen a cada uno
    SELECT d.nombre, d.horario, e.nombre1, e.apellido1 FROM departamento d LEFT JOIN empleado e ON d.id_departamento = e.id_departamento;
    
-- 34. Obtener productos y los pedidos que los contienen
    SELECT pr.nombre, p.id_pedido FROM productos pr LEFT JOIN pedidos p ON pr.id_pedido = p.id_pedido;
    
-- 35. Obtener el total de insumos por cada proveedor
    SELECT p.nombre, COUNT(i.id_insumos) AS Total_Insumos FROM proveedores p LEFT JOIN insumos i ON p.id_proveedores = i.id_proveedores GROUP BY p.id_proveedores;
    
-- 36. Obtener empleados y sus salarios junto con el departamento
    SELECT e.nombre1, e.apellido1, s.horas, d.nombre FROM empleado e INNER JOIN salario s ON e.id_empleado = s.id_empleado INNER JOIN departamento d ON e.id_departamento = d.id_departamento;
    
-- 37. Obtener los pagos realizados y el cliente que los hizo
    SELECT pa.metodo_pago, c.nombre, c.apellido FROM pagos pa INNER JOIN clientes c ON pa.id_cliente = c.id_cliente;
    
-- 38. Obtener el total de horas trabajadas por cada empleado
    SELECT e.nombre1, e.apellido1, SUM(s.horas) AS Total_Horas FROM empleado e INNER JOIN salario s ON e.id_empleado = s.id_empleado GROUP BY e.id_empleado;
    
-- 39. Obtener los pedidos y el cliente que los realizó
    SELECT p.id_pedido, c.nombre, c.apellido FROM pedidos p INNER JOIN clientes c ON p.id_cliente = c.id_cliente;
    
-- 40. Obtener el estado de las maquinarias y sus mantenimientos
    SELECT ma.nombre, ma.estado, m.fecha_entrada FROM maquinaria ma LEFT JOIN mantenimiento m ON ma.id_mantenimiento = m.id_mantenimiento;
    

-- 41. Obtener los insumos y su cantidad en stock
    SELECT i.nombre, i.cantidad FROM insumos i INNER JOIN pedido_proveedores pp ON i.id_pedido_proveedores = pp.id_pedido_proveedores;
    

-- 42. Obtener la lista de clientes y su dirección
    SELECT c.nombre, c.apellido, c.direccion FROM clientes c;
    
-- 43. Obtener los pedidos y el total a pagar por cada uno
    SELECT p.id_pedido, p.total_a_pagar FROM pedidos p;
    
-- 44. Obtener el detalle de los mantenimientos y la maquinaria asociada
    SELECT m.detalles, ma.nombre FROM mantenimiento m INNER JOIN maquinaria ma ON m.id_mantenimiento = ma.id_mantenimiento;
    
-- 45. Obtener el total de pedidos por cliente
    SELECT c.nombre, c.apellido, COUNT(p.id_pedido) AS Total_Pedidos FROM clientes c LEFT JOIN pedidos p ON c.id_cliente = p.id_cliente GROUP BY c.id_cliente;
    
-- 46. Obtener productos con su precio y cantidad
    SELECT p.nombre, p.cantidad, p.cantidad_stock FROM productos p;
    
-- 47. Obtener la lista de proveedores y los insumos que suministran
    SELECT pr.nombre, i.nombre AS Insumo FROM insumos i INNER JOIN proveedores pr ON i.id_proveedores = pr.id_proveedores  ;
    
-- 48. Obtener los registros de empleados y sus logins
    SELECT r.nombre1, r.apellido1, l.rol FROM registro r INNER JOIN loguin l ON r.id_loguin = l.id_loguin;
    
-- 49. Obtener todos los pedidos y sus respectivos métodos de pago
    SELECT p.id_pedido, pa.metodo_pago FROM pedidos p INNER JOIN pagos pa ON p.id_pedido = pa.id_pedido;
    
-- 50. Obtener información de los empleados y su cargo
    SELECT e.nombre1, e.apellido1, e.cargo FROM empleado e;
    
-- 51. Obtener todos los insumos y la cantidad que hay por proveedor
    SELECT i.nombre, i.cantidad, p.nombre AS Proveedor FROM insumos i INNER JOIN proveedores p ON i.id_proveedores = p.id_proveedores;
    
-- 52. Obtener los mantenimientos realizados y la maquinaria afectada
    SELECT m.fecha_entrada, m.fecha_salida, ma.nombre FROM mantenimiento m INNER JOIN maquinaria ma ON m.id_mantenimiento = ma.id_mantenimiento;
    
-- 53. Obtener los pedidos y los productos que contienen
    SELECT p.id_pedido, pr.nombre FROM pedidos p INNER JOIN productos pr ON p.id_pedido = pr.id_pedido;
    
-- 54. Obtener la lista de roles y sus empleados asociados
    SELECT l.rol, e.nombre1, e.apellido1 FROM loguin l INNER JOIN empleado e ON l.id_empleado = e.id_empleado;
    
-- 55. Obtener información de los salarios y departamentos de los empleados
    SELECT e.nombre1, e.apellido1, s.horas, d.nombre FROM empleado e INNER JOIN salario s ON e.id_empleado = s.id_empleado INNER JOIN departamento d ON e.id_departamento = d.id_departamento;
    
-- 56. Obtener productos que han sido pedidos y su cantidad
    SELECT pr.nombre, p.cantidad FROM productos pr INNER JOIN pedidos p ON pr.id_pedido = p.id_pedido;
    
-- 57. Obtener información de insumos y el pedido de proveedores
    SELECT i.nombre, pp.id_pedido_proveedores FROM insumos i INNER JOIN pedido_proveedores pp ON i.id_pedido_proveedores = pp.id_pedido_proveedores;
    
-- 58. Obtener el nombre de los empleados y sus logins
    SELECT e.nombre1, e.apellido1, l.rol FROM empleado e LEFT JOIN loguin l ON e.id_registro = l.id_empleado;
    
-- 59. Obtener los insumos por tipo y su cantidad
    SELECT i.nombre, i.cantidad FROM insumos i;
    
-- 60. Obtener la lista de todos los empleados y sus departamentos
    SELECT e.nombre1, e.apellido1, d.nombre FROM empleado e LEFT JOIN departamento d ON e.id_departamento = d.id_departamento;
    
-- 61. Obtener la cantidad de horas trabajadas por empleado
    SELECT e.nombre1, e.apellido1, SUM(s.horas) AS Total_Horas FROM empleado e LEFT JOIN salario s ON e.id_empleado = s.id_empleado GROUP BY e.id_empleado;
    
-- 62. Obtener información de los mantenimientos y la maquinaria afectada
    SELECT m.fecha_entrada, m.fecha_salida, ma.nombre FROM mantenimiento m LEFT JOIN maquinaria ma ON m.id_mantenimiento = ma.id_mantenimiento;
    
-- 63. Obtener pedidos y el total a pagar para cada uno
    SELECT p.id_pedido, p.total_a_pagar FROM pedidos p;
    
-- 64. Obtener la lista de todos los insumos y su precio
    SELECT i.nombre, i.precio FROM insumos i;
    
-- 65. Obtener todos los empleados y sus salarios
    SELECT e.nombre1, e.apellido1, s.horas FROM empleado e INNER JOIN salario s ON e.id_empleado = s.id_empleado;
    
-- 66. Obtener la cantidad de productos por cliente
    SELECT c.nombre, c.apellido, SUM(pr.cantidad) AS Total_Productos FROM clientes c LEFT JOIN productos pr ON c.id_cliente = pr.id_cliente GROUP BY c.id_cliente;

-- 67. Obtener la lista de mantenimientos y maquinaria asociada
    SELECT m.detalles, ma.nombre FROM mantenimiento m LEFT JOIN maquinaria ma ON m.id_mantenimiento = ma.id_mantenimiento;
    
-- 68. Obtener todos los pedidos y el cliente que los realizó
    SELECT p.id_pedido, c.nombre, c.apellido FROM pedidos p INNER JOIN clientes c ON p.id_cliente = c.id_cliente;
    
-- 69. Obtener productos y sus respectivos pedidos
    SELECT pr.nombre, p.id_pedido FROM productos pr LEFT JOIN pedidos p ON pr.id_pedido = p.id_pedido;
    
-- 70. Obtener todos los empleados y sus roles
    SELECT e.nombre1, e.apellido1, l.rol FROM empleado e LEFT JOIN loguin l ON e.id_registro = l.id_empleado;
    
-- 71. Obtener los insumos por proveedor
    SELECT p.nombre, i.nombre AS Insumo FROM proveedores p LEFT JOIN insumos i ON p.id_proveedores = i.id_proveedores;
    
-- 72. Obtener los pedidos y los productos que tienen
    SELECT p.id_pedido, pr.nombre FROM pedidos p LEFT JOIN productos pr ON p.id_pedido = pr.id_pedido;
    
-- 73. Obtener todos los mantenimientos y la maquinaria asociada
    SELECT m.detalles, ma.nombre FROM mantenimiento m LEFT JOIN maquinaria ma ON m.id_mantenimiento = ma.id_mantenimiento;
    
-- 74. Obtener los clientes y sus pedidos
    SELECT c.nombre, c.apellido, p.cantidad FROM clientes c LEFT JOIN pedidos p ON c.id_cliente = p.id_cliente;
    
-- 75. Obtener todos los productos en stock y sus departamentos
    SELECT pr.nombre, pr.cantidad_stock, d.nombre AS Departamento FROM productos pr LEFT JOIN departamento d ON pr.id_departamento = d.id_departamento WHERE pr.cantidad_stock > 0;
    
-- 76. Obtener la cantidad de horas trabajadas por cada empleado por departamento
    SELECT e.nombre1, e.apellido1, d.nombre, SUM(s.horas) AS Total_Horas FROM empleado e INNER JOIN salario s ON e.id_empleado = s.id_empleado INNER JOIN departamento d ON e.id_departamento = d.id_departamento GROUP BY e.id_empleado, d.id_departamento;
    
-- 77. Obtener todos los proveedores y los insumos que proporcionan
    SELECT p.nombre, i.nombre AS Insumo FROM proveedores p INNER JOIN insumos i ON p.id_proveedores = i.id_proveedores;
    
-- 78. Obtener todos los empleados y su salario agrupándolos por departamento
    SELECT d.nombre AS Departamento, e.nombre1, e.apellido1, s.horas FROM empleado e INNER JOIN salario s ON e.id_empleado = s.id_empleado INNER JOIN departamento d ON e.id_departamento = d.id_departamento;
    
-- 79. Obtener el total de productos por departamento
SELECT d.nombre AS Departamento, SUM(pr.cantidad) AS Total_Productos FROM departamento d LEFT JOIN productos pr ON d.id_departamento = pr.id_departamento GROUP BY d.id_departamento;

-- 80. Obtener el nombre y apellido de los clientes que han realizado pagos
SELECT DISTINCT c.nombre, c.apellido FROM clientes c INNER JOIN pagos p ON c.id_cliente = p.id_cliente;

-- 82 Obtener el detalle de los logins fallidos por empleado
SELECT e.nombre1, e.apellido1, l.rol FROM empleado e LEFT JOIN loguin l ON e.id_registro = l.id_loguin WHERE l.rol = 'Empleado';

-- 83 Obtener la cantidad total de horas trabajadas en cada departamento
SELECT d.nombre AS Departamento, SUM(s.horas) AS Total_Horas FROM departamento d LEFT JOIN empleado e ON d.id_departamento = e.id_departamento LEFT JOIN salario s ON e.id_empleado = s.id_empleado GROUP BY d.id_departamento;

-- 84 Obtener el total de pedidos y su estado por cada cliente.
SELECT c.nombre, c.apellido, COUNT(p.id_pedido) AS Total_Pedidos FROM clientes c LEFT JOIN pedidos p ON c.id_cliente = p.id_cliente GROUP BY c.id_cliente;

-- 85 Obtener la lista de maquinaria y su estado en mantenimiento
SELECT ma.nombre, ma.estado, m.detalles FROM maquinaria ma LEFT JOIN mantenimiento m ON ma.id_mantenimiento = m.id_mantenimiento;

-- 86 Obtener todos los insumos que tienen un precio superior a un valor específico
SELECT i.nombre, i.precio FROM insumos i WHERE i.precio > 20.00;

-- 87 Obtener todos los clientes y la cantidad de productos que han comprado
SELECT c.nombre, c.apellido, SUM(pr.cantidad) AS Total_Productos FROM clientes c LEFT JOIN productos pr ON c.id_cliente = pr.id_cliente GROUP BY c.id_cliente;

-- 88 Obtener la lista de todos los empleados y sus respectivos cargos
SELECT e.nombre1, e.apellido1, e.cargo FROM empleado e;

-- 89 Obtener todos los pedidos y sus fechas de creación
SELECT p.id_pedido, p.cantidad, p.total_a_pagar FROM pedidos p;

-- 90 Obtener la cantidad de insumos que se han pedido a cada proveedor
SELECT p.nombre, SUM(i.cantidad) AS Total_Insumos FROM proveedores p LEFT JOIN insumos i ON p.id_proveedores = i.id_proveedores GROUP BY p.id_proveedores;

-- 91 Obtener la lista de departamentos y la cantidad de empleados en cada uno
SELECT d.nombre AS Departamento, COUNT(e.id_empleado) AS Total_Empleados FROM departamento d LEFT JOIN empleado e ON d.id_departamento = e.id_departamento GROUP BY d.id_departamento;

-- 93 Obtener el detalle de los productos que tienen bajo stock
SELECT p.nombre, p.cantidad_stock FROM productos p WHERE p.cantidad_stock < 10;

-- 94 mostrar datos de empleado y departamneto donde trabaja
SELECT DISTINCT id_empleado , nombre1, apellido1 , horario  from empleado em inner join departamento de on em.id_departamento = de.id_departamento;

-- 95 Obtener la lista de empleados y sus correos electrónicos
SELECT e.nombre1, e.apellido1, e.correo FROM empleado e;

-- 96 Obtener el total de pagos realizados por cada método de pago
SELECT p.metodo_pago, COUNT(*) AS Total_Pagos FROM pagos p GROUP BY p.metodo_pago;

-- 97 Obtener todos los productos que han sido pedidos y no están en stock
SELECT p.nombre FROM productos p LEFT JOIN pedidos pd ON p.id_pedido = pd.id_pedido WHERE p.cantidad_stock = 0;

-- 98 Obtener la lista de insumos con su precio y cantidad.
SELECT i.nombre, i.precio, i.cantidad FROM insumos i;

-- 99 mostrar salario total de un empleado , su nombre , apellido y cargo 
SELECT salario_total,nombre1,apellido1,cargo from salario sa inner join empleado em on sa.id_empleado = em.id_empleado ;

-- 100 Obtener todos los mantenimientos realizados y su fecha
SELECT m.fecha_entrada, m.fecha_salida, m.detalles FROM mantenimiento m;


-- FUNCIONES 

-- 1. esta funcion retorna la cantidad de pedidos realizados por clientes 

delimiter //
create function pedidos_totales (id_client int )
returns int deterministic
begin
declare pedido_total int ;
select count(id_cliente)into pedido_total from pedidos where id_cliente = id_client ;


return pedido_total ;
end// 
delimiter ;

select pedidos_totales(1);

-- 2. esta funcion retorna el horario del empleado segun su id
delimiter //
create function horario_empleados(id_empleado_r int)
returns varchar (50) deterministic
begin

declare horario_r varchar(50);
select horario into horario_r from empleado em inner join departamento dep on em.id_departamento  = dep.id_departamento
where id_empleado = id_empleado_r;



return horario_r;

end// 
delimiter ;

select horario_empleados(7);

-- 3.


DELIMITER //

CREATE FUNCTION pago_por_hora(id_salario_r INT) 
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE pago_hora INT;
    DECLARE salario_total INT;
    DECLARE horas INT;
	SELECT salario_total, horas INTO salario_total, horas
    FROM salario
    WHERE id_salario = id_salario_r;
	IF horas > 0 THEN
        SET pago_hora = salario_total / horas;
    ELSE
        SET pago_hora = 0;  
    END IF;

    RETURN pago_hora;
END //

DELIMITER ;


select pago_por_hora(1);


-- 4

 DELIMITER //
CREATE FUNCTION total_stock_disponible()
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total INT;
    SELECT SUM(cantidad_stock) INTO total FROM productos;
    RETURN IFNULL(total, 0);
END;
//
DELIMITER ;

-- 5
 DELIMITER //
CREATE FUNCTION calcular_salario_total(idEmpleado INT, tarifaPorHora DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE horasTrabajadas INT;
    SELECT horas INTO horasTrabajadas FROM salario WHERE id_empleado = idEmpleado;
    RETURN horasTrabajadas * tarifaPorHora;
END;
//
DELIMITER ;

-- 6
 DELIMITER //
CREATE FUNCTION cliente_existe(cedulaCliente VARCHAR(80))
RETURNS BOOLEAN
DETERMINISTIC
BEGIN
    DECLARE existe BOOLEAN;
    SELECT COUNT(*) > 0 INTO existe FROM clientes WHERE cedula = cedulaCliente;
    RETURN existe;
END;
//
DELIMITER ;

-- 7
 DELIMITER //
CREATE FUNCTION obtener_nombre_cliente(idCliente INT)
RETURNS VARCHAR(160)
DETERMINISTIC
BEGIN
    DECLARE nombreCompleto VARCHAR(160);
    SELECT CONCAT(nombre, ' ', apellido) INTO nombreCompleto FROM clientes WHERE id_cliente = idCliente;
    RETURN nombreCompleto;
END;
//
DELIMITER ;
-- 8
DELIMITER //
CREATE FUNCTION total_pagos_cliente(idCliente INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE totalPagado DECIMAL(10,2);
    SELECT SUM(total_a_pagar) INTO totalPagado FROM pedidos WHERE id_cliente = idCliente;
    RETURN IFNULL(totalPagado, 0);
END;
//
DELIMITER ;


-- procedimientos

-- 1. insertar_cliente
 DELIMITER //
CREATE PROCEDURE insertar_cliente(
    IN p_nombre VARCHAR(80),
    IN p_apellido VARCHAR(80),
    IN p_cedula VARCHAR(80),
    IN p_correo VARCHAR(80),
    IN p_direccion VARCHAR(80)
)
BEGIN
    INSERT INTO clientes (nombre, apellido, cedula, correo, direccion) 
    VALUES (p_nombre, p_apellido, p_cedula, p_correo, p_direccion);
END;
//
DELIMITER ;

-- 2. actualizar_direccion_cliente
 DELIMITER //
CREATE PROCEDURE actualizar_direccion_cliente(
    IN p_id_cliente INT,
    IN p_nueva_direccion VARCHAR(80)
)
BEGIN
    UPDATE clientes
    SET direccion = p_nueva_direccion
    WHERE id_cliente = p_id_cliente;
END;
//
DELIMITER ;

-- 3. eliminar_cliente
 DELIMITER //
CREATE PROCEDURE eliminar_cliente(
    IN p_id_cliente INT
)
BEGIN
    DELETE FROM clientes WHERE id_cliente = p_id_cliente;
END;
//
DELIMITER ;

-- 4. insertar_producto
 DELIMITER //
CREATE PROCEDURE insertar_producto(
    IN p_nombre VARCHAR(80),
    IN p_cantidad INT,
    IN p_cantidad_stock INT,
    IN p_id_departamento INT
)
BEGIN
    INSERT INTO productos (nombre, cantidad, cantidad_stock, id_departamento) 
    VALUES (p_nombre, p_cantidad, p_cantidad_stock, p_id_departamento);
END;
//
DELIMITER ;

-- 5. actualizar_stock_producto
 DELIMITER //
CREATE PROCEDURE actualizar_stock_producto(
    IN p_id_producto INT,
    IN p_nueva_cantidad_stock INT
)
BEGIN
    UPDATE productos
    SET cantidad_stock = p_nueva_cantidad_stock
    WHERE id_producto = p_id_producto;
END;
//
DELIMITER ;

-- 6. insertar_pedido
 DELIMITER //
CREATE PROCEDURE insertar_pedido(
    IN p_cantidad INT,
    IN p_total_a_pagar INT,
    IN p_id_cliente INT
)
BEGIN
    INSERT INTO pedidos (cantidad, total_a_pagar, id_cliente) 
    VALUES (p_cantidad, p_total_a_pagar, p_id_cliente);
END;
//
DELIMITER ;

-- 7. actualizar_estado_pedido
 DELIMITER //
CREATE PROCEDURE actualizar_estado_pedido(
    IN p_id_pedido INT,
    IN p_nuevo_estado VARCHAR(80)
)
BEGIN
    UPDATE pedidos
    SET estado = p_nuevo_estado
    WHERE id_pedido = p_id_pedido;
END;
//
DELIMITER ;

-- 8. calcular_total_pedido
 DELIMITER //
CREATE PROCEDURE calcular_total_pedido(
    IN p_id_pedido INT
)
BEGIN
    DECLARE total INT;
    SELECT SUM(cantidad * precio) INTO total
    FROM productos
    WHERE id_pedido = p_id_pedido;
    
    UPDATE pedidos
    SET total_a_pagar = total
    WHERE id_pedido = p_id_pedido;
END;
//
DELIMITER ;

-- 9. insertar_proveedor
 DELIMITER //
CREATE PROCEDURE insertar_proveedor(
    IN p_nombre VARCHAR(80),
    IN p_apellido VARCHAR(80),
    IN p_cedula VARCHAR(80),
    IN p_correo VARCHAR(80),
    IN p_direccion VARCHAR(80)
)
BEGIN
    INSERT INTO proveedores (nombre, apellido, cedula, correo, direccion) 
    VALUES (p_nombre, p_apellido, p_cedula, p_correo, p_direccion);
END;
//
DELIMITER ;

-- 10. eliminar_proveedor
DELIMITER //
CREATE PROCEDURE eliminar_proveedor(
    IN p_id_proveedor INT
)
BEGIN
    DELETE FROM proveedores WHERE id_proveedores = p_id_proveedor;
END;
//
DELIMITER ;

-- 11

 DELIMITER //
CREATE FUNCTION obtener_nombre_departamento(idDepartamento INT)
RETURNS VARCHAR(80)
DETERMINISTIC
BEGIN
    DECLARE nombreDepto VARCHAR(80);
    SELECT nombre INTO nombreDepto FROM departamento WHERE id_departamento = idDepartamento;
    RETURN nombreDepto;
END;
//
DELIMITER ;

-- 12

 DELIMITER //
CREATE FUNCTION maquinaria_disponible(idMaquinaria INT)
RETURNS BOOLEAN
DETERMINISTIC
BEGIN
    DECLARE disponible BOOLEAN;
    SELECT estado = 'Disponible' INTO disponible FROM maquinaria WHERE id_maquinaria = idMaquinaria;
    RETURN disponible;
END;
//
DELIMITER ;

-- 13

 DELIMITER //
CREATE FUNCTION total_insumos_proveedor(idProveedor INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE totalCosto DECIMAL(10,2);
    SELECT SUM(precio * cantidad) INTO totalCosto FROM insumos WHERE id_proveedores = idProveedor;
    RETURN IFNULL(totalCosto, 0);
END;
//
DELIMITER ;

-- 14

 DELIMITER //
CREATE FUNCTION pedidos_pendientes_cliente(idCliente INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE pendientes INT;
    SELECT COUNT(*) INTO pendientes FROM pedidos p
    LEFT JOIN pagos pg ON p.id_pedido = pg.id_pedido
    WHERE p.id_cliente = idCliente AND pg.id_pago IS NULL;
    RETURN pendientes;
END;
//
DELIMITER ;


-- 15

 DELIMITER //
CREATE FUNCTION obtener_correo_empleado(idEmpleado INT)
RETURNS VARCHAR(80)
DETERMINISTIC
BEGIN
    DECLARE correo VARCHAR(80);
    SELECT correo INTO correo FROM empleado WHERE id_empleado = idEmpleado;
    RETURN correo;
END;
//
DELIMITER ;

-- TRIGGERS 

-- Cambiar el delimitador para trabajar con triggers
DELIMITER $$

-- Trigger 1: Antes de insertar en "clientes", asegura que el campo "nombre" no esté vacío
CREATE TRIGGER verificar_nombre_cliente
BEFORE INSERT ON clientes
FOR EACH ROW
BEGIN
    IF NEW.nombre IS NULL OR NEW.nombre = '' THEN
        SET NEW.nombre = 'Nombre no proporcionado'; -- Asignar valor por defecto
    END IF;
END$$

-- Trigger 2: Después de insertar en "empleado", establece "cargo" como 'No asignado' si está vacío
CREATE TRIGGER asignar_cargo_default
AFTER INSERT ON empleado
FOR EACH ROW
BEGIN
    IF NEW.cargo IS NULL OR NEW.cargo = '' THEN
        UPDATE empleado SET cargo = 'No asignado' WHERE id_empleado = NEW.id_empleado;
    END IF;
END$$

-- Trigger 3: Antes de insertar en "productos", verifica que la cantidad no sea negativa
CREATE TRIGGER validar_cantidad_producto
BEFORE INSERT ON productos
FOR EACH ROW
BEGIN
    IF NEW.cantidad < 0 THEN
        SET NEW.cantidad = 0; -- Asignar 0 en lugar de cantidad negativa
    END IF;
END$$

-- Trigger 4: Después de insertar en "pagos", registra el método de pago usado en un log
CREATE TRIGGER registrar_metodo_pago
AFTER INSERT ON pagos
FOR EACH ROW
BEGIN
    INSERT INTO logs (descripcion, fecha) 
    VALUES (CONCAT('Se usó el método de pago: ', NEW.metodo_pago), NOW());
END$$

-- Trigger 5: Antes de eliminar un registro de "clientes", guarda una copia en "respaldo_clientes"
CREATE TRIGGER respaldo_cliente
BEFORE DELETE ON clientes
FOR EACH ROW
BEGIN
    INSERT INTO respaldo_clientes (id_cliente, nombre, apellido, cedula, correo, direccion)
    VALUES (OLD.id_cliente, OLD.nombre, OLD.apellido, OLD.cedula, OLD.correo, OLD.direccion);
END$$

-- Trigger 6: Después de insertar en "mantenimiento", marca como "En mantenimiento" la maquinaria asociada
CREATE TRIGGER actualizar_estado_maquinaria
AFTER INSERT ON mantenimiento
FOR EACH ROW
BEGIN
    UPDATE maquinaria SET estado = 'En mantenimiento' WHERE id_maquinaria = NEW.id_mantenimiento;
END$$

-- Trigger 7: Antes de insertar en "loguin", convierte la contraseña a minúsculas
CREATE TRIGGER convertir_contrasena_minusculas
BEFORE INSERT ON loguin
FOR EACH ROW
BEGIN
    SET NEW.contraseña = LOWER(NEW.contraseña);
END$$

-- Trigger 8: Después de insertar en "registro", envía un mensaje al log
CREATE TRIGGER log_registro
AFTER INSERT ON registro
FOR EACH ROW
BEGIN
    INSERT INTO logs (descripcion, fecha)
    VALUES (CONCAT('Se registró un nuevo usuario: ', NEW.nombre1, ' ', NEW.apellido1), NOW());
END$$

-- Trigger 9: Antes de insertar en "insumos", verifica que el precio no sea menor a 0
CREATE TRIGGER validar_precio_insumos
BEFORE INSERT ON insumos
FOR EACH ROW
BEGIN
    IF NEW.precio < 0 THEN
        SET NEW.precio = 0.00; -- Asignar precio 0 si es menor a 0
    END IF;
END$$

-- Trigger 10: Después de eliminar un registro en "productos", registra la eliminación en "logs"
CREATE TRIGGER log_eliminacion_producto
AFTER DELETE ON productos
FOR EACH ROW
BEGIN
    INSERT INTO logs (descripcion, fecha)
    VALUES (CONCAT('Se eliminó el producto: ', OLD.nombre), NOW());
END$$

-- Restaurar el delimitador a ';'
DELIMITER ;


-- eventos

-- Evento 1: Borra mantenimientos antiguos
CREATE EVENT borrar_mantenimientos
ON SCHEDULE EVERY 1 MONTH
DO
    DELETE FROM mantenimiento WHERE fecha_salida < DATE_SUB(NOW(), INTERVAL 1 YEAR);

-- Evento 2: Cambia maquinaria sin mantenimiento a "pendiente"
CREATE EVENT maquinaria_pendiente
ON SCHEDULE EVERY 1 WEEK
DO
    UPDATE maquinaria SET estado = 'pendiente' WHERE id_mantenimiento IS NULL;

-- Evento 3: Marca pagos como "vencidos" después de un mes
CREATE EVENT vencer_pagos
ON SCHEDULE EVERY 1 MONTH
DO
    UPDATE pagos SET metodo_pago = 'vencido' WHERE metodo_pago = 'pendiente';

-- Evento 4: Borra insumos con cantidad en 0
CREATE EVENT borrar_insumos_sin_stock
ON SCHEDULE EVERY 1 MONTH
DO
    DELETE FROM insumos WHERE cantidad = 0;

-- Evento 5: Aumenta en 5 el stock de productos con menos de 10 unidades
CREATE EVENT aumentar_stock
ON SCHEDULE EVERY 1 WEEK
DO
    UPDATE productos SET cantidad_stock = cantidad_stock + 5 WHERE cantidad_stock < 10;

-- Evento 6: Borra clientes sin pedidos en el último año
CREATE EVENT borrar_clientes_inactivos
ON SCHEDULE EVERY 6 MONTH
DO
    DELETE FROM clientes WHERE id_cliente NOT IN (SELECT id_cliente FROM pedidos WHERE fecha_pedido > DATE_SUB(NOW(), INTERVAL 1 YEAR));

-- Evento 7: Borra registros de login antiguos
CREATE EVENT borrar_registros_login
ON SCHEDULE EVERY 1 MONTH
DO
    DELETE FROM loguin WHERE id_loguin NOT IN (SELECT id_loguin FROM registro);

-- Evento 8: Aumenta los salarios de empleados en 5%
CREATE EVENT aumentar_salarios
ON SCHEDULE EVERY 6 MONTH
DO
    UPDATE salario SET salario_total = salario_total * 1.05;

-- Evento 9: Limpia pedidos no pagados después de 30 días
CREATE EVENT borrar_pedidos_sin_pago
ON SCHEDULE EVERY 1 MONTH
DO
    DELETE FROM pedidos WHERE id_pedido NOT IN (SELECT id_pedido FROM pagos) AND fecha_pedido < DATE_SUB(NOW(), INTERVAL 30 DAY);

-- Evento 10: Agrega 10 horas a los empleados cada semana
CREATE EVENT sumar_horas
ON SCHEDULE EVERY 1 WEEK
DO
    UPDATE salario SET horas = horas + 10 WHERE id_empleado IS NOT NULL;

-- Evento 11: Marca maquinaria como "inactiva" si no se usa por un mes
CREATE EVENT marcar_maquinaria_inactiva
ON SCHEDULE EVERY 1 MONTH
DO
    UPDATE maquinaria SET estado = 'inactiva' WHERE id_departamento IS NULL;

-- Evento 12: Borra proveedores sin insumos registrados
CREATE EVENT borrar_proveedores_sin_insumos
ON SCHEDULE EVERY 1 MONTH
DO
    DELETE FROM proveedores WHERE id_proveedores NOT IN (SELECT id_proveedores FROM insumos);

-- Evento 13: Aumenta en 1 los puntos a clientes cada mes
CREATE EVENT sumar_puntos_clientes
ON SCHEDULE EVERY 1 MONTH
DO
    UPDATE clientes SET direccion = 'actualizado' WHERE direccion IS NOT NULL;
