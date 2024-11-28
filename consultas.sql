
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

-- 9 

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

-- 10

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

-- 11

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

-- 12

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


-- 13
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