"""
# Gestión de Base de Datos AgroComercial

Este proyecto contiene el diseño, implementación y gestión de una base de datos para AgroComercial. 
Incluye la definición de tablas, inserciones de datos, triggers, procedimientos y funciones que garantizan 
la integridad y el funcionamiento óptimo del sistema.

---

## Estructura de la Base de Datos

### Tablas Principales

1. **AGROCAT**
   Contiene información sobre las sucursales o principales datos de la empresa.
   - **Campos:** `id_agrocat`, `nombre`, `ubicacion`, `telefono`, `correo`.

2. **departamento**
   Registra los departamentos de la empresa y sus horarios.
   - **Campos:** `id_departamento`, `nombre`, `horario`.

3. **clientes**
   Almacena información de los clientes.
   - **Campos:** `id_cliente`, `nombre`, `apellido`, `cedula`, `correo`, `direccion`.

4. **productos**
   Contiene datos de los productos ofertados.
   - **Campos:** `id_producto`, `nombre`, `cantidad`, `cantidad_stock`, `id_departamento`.

5. **pedidos**
   Registra los pedidos realizados por los clientes.
   - **Campos:** `id_pedido`, `cantidad`, `total_a_pagar`, `id_cliente`.

6. **proveedores**
   Almacena información sobre los proveedores.
   - **Campos:** `id_proveedores`, `nombre`, `apellido`, `cedula`, `correo`, `direccion`.

---

## Inserciones de Datos

Se han incluido datos iniciales para poblar las tablas.
- **AGROCAT:** Una sucursal registrada.
- **departamento:** 50 departamentos con sus respectivos horarios.
- **clientes:** 50 clientes con nombres, apellidos, cédulas, correos y direcciones.
- **productos:** Ejemplo de varios productos con cantidades y asignación a departamentos.
- **pedidos:** Registro inicial de pedidos relacionados a clientes.
- **proveedores:** Información básica de proveedores de la empresa.

---

## Triggers Implementados

1. **Validación de Stock en Pedidos:**
   Antes de insertar un pedido, verifica que la cantidad solicitada no exceda el stock disponible.
   - Lanza un error si no se cumple esta condición.

2. **Registro de Modificaciones:**
   Controla modificaciones realizadas en las tablas principales, registrando datos históricos o emitiendo alertas en caso de cambios relevantes.

3. **Actualización Automática:**
   Mantiene consistencia entre tablas relacionadas, como actualizar el stock tras registrar un pedido.

---

## Procedimientos Almacenados

1. **Gestión de Clientes:**
   - `insertar_cliente`: Agrega un cliente nuevo.
   - `actualizar_direccion_cliente`: Modifica la dirección de un cliente.
   - `eliminar_cliente`: Elimina un cliente por su ID.

2. **Gestión de Productos:**
   - `insertar_producto`: Registra un nuevo producto.
   - `actualizar_stock_producto`: Cambia el stock de un producto específico.

3. **Gestión de Pedidos:**
   - `insertar_pedido`: Añade un pedido con cantidad y cliente relacionado.
   - `actualizar_estado_pedido`: Cambia el estado de un pedido, como "enviado" o "entregado".

4. **Gestión de Proveedores:**
   - `insertar_proveedor`: Agrega un proveedor a la base de datos.
   - `eliminar_proveedor`: Elimina un proveedor.

5. **Cálculo del Total de un Pedido:**
   - Procedimiento que calcula el total basado en la cantidad y precio de los productos relacionados al pedido.

---

## Funciones

1. **Cálculo de Descuentos:** Calcula descuentos según promociones vigentes.
2. **Clientes Frecuentes:** Determina si un cliente es frecuente con base en sus pedidos.
3. **Productos Populares:** Identifica los productos más vendidos.
4. **Disponibilidad en Stock:** Verifica si hay suficiente stock de un producto.
5. **Total de Ventas Mensuales:** Suma las ventas en un mes específico.
6. **Ganancias Anuales:** Calcula las ganancias totales del año.
7. **Promedio de Pedidos por Cliente:** Devuelve el promedio de pedidos realizados por cliente.
8. **Productos en Stock Crítico:** Lista productos con menos del 10% de su stock.
9. **Pedidos Pendientes:** Cuenta los pedidos que aún no se han entregado.
10. **Información de Clientes por Pedido:** Devuelve información de clientes según un ID de pedido.

---

## Cómo Usar el Proyecto

1. **Carga de Datos Iniciales:**
   Inserta las tablas y datos proporcionados.
   ```sql
   source proyecto_filtro_SQL_FreilerOrtega_JhonatanOmaña.sql;
