USE GestorPedidos;
--------------inserts para el desarrollo de la implementacion de roles ------------------

INSERT INTO rol VALUES 
(1, 'Admin'), 
(2, 'Empleado'), 
(3, 'Cliente'); 

INSERT INTO modulo (id_modulo,nombre)VALUES
 (1,'Realizar Pedido'),
 (2,'Clientes'),
 (3,'Empleados'),
 (4,'Productos'),
 (5,'Pedidos'),
 (6,'Salir');

INSERT INTO operacion (id_operacion, id_modulo, nombre, nombreFormulario)VALUES
 --Operaciones para realizar pedido. Solo Clientes pueden hacerlo
	(1,1,'Realizar Pedido','frmRealizarPedido'),
	(2,1,'Visualizar Pedido','frmVisualizarPedido'),
	(3,1,'Historial de pedidos','frmHistorialPedidos');

INSERT INTO operacion(id_operacion, id_modulo, nombre, nombreFormulario) VALUES --Operaciones para visualizar info de clientes. Solo Admin puede hacerlo
        (4,2,'Visualizar Cliente','frmVercliente'),
 	(5,2,'Crear Cliente','frmCrearCliente'),
	(6,2,'Editar Cliente','frmEditarCliente'),
	(7,2,'Eliminar Cliente','frmEliminarCliente');

INSERT INTO operacion(id_operacion, id_modulo, nombre, nombreFormulario) VALUES --Operaciones para visualizar info de empleados. Solo Admin puede hacerlo
        (8,3,'Visualizar Empleado','frmVerEmpleado'),
 	(9,3,'Crear Empleado','frmCrearEmpleado'),
	(10,3,'Editar Empleado','frmEditarEmpleado'),
	(11,3,'Eliminar Empleado','frmEliminarEmpleado');

INSERT INTO operacion(id_operacion, id_modulo, nombre, nombreFormulario) VALUES --Operaciones para ABM de productos. Solo Admin puede hacerlo
        (12,4,'Visualizar producto','frmVerProducto'),
 	(13,4,'Agregar producto','frmAgregarProducto'),
	(14,4,'Editar producto','frmEditarProducto'),
	(15,4,'Eliminar producto','frmEliminarProducto');

INSERT INTO operacion(id_operacion, id_modulo, nombre, nombreFormulario) VALUES --Operaciones para Pedidos. Admin y Empleados puede hacerlo
        (16,5,'Asignar Pedido','frmAsignarPedido'),
 	(17,5,'Ver Pedido Asignado','frmVerPedidoAsignado'),
	(18,5,'Actualizar estado de pedido','frmActualizarEstadoPedido'),
	(19,5,'Ver historico pedidos','frmVerHistorialPedidos');

INSERT INTO operacion(id_operacion, id_modulo, nombre, nombreFormulario) VALUES 
      (20,6,'Salir','frmSalir');


INSERT INTO permiso(id_rol, id_operacion, activo) VALUES
	(1, 1, 1),
	(1, 2, 1),
	(1, 3, 1),
	(1, 4, 1),
	(1, 5, 1),
	(1, 6, 1),
	(1, 7, 1),
	(1, 8, 1),
	(1, 9, 1),
	(1, 10, 1),
	(1, 11, 1),
	(1, 12, 1),
	(1, 13, 1),
	(1, 14, 1),
	(1, 15, 1),
	(1, 16, 1),
	(1, 17, 1),
	(1, 18, 1),
	(1, 19, 1),
    (1, 20, 1);

INSERT INTO permiso VALUES --Permisos con los que cuenta el rol Empleado
	(2, 1, 0),
	(2, 2, 0),
	(2, 3, 0),
	(2, 4, 0),
	(2, 5, 0),
	(2, 6, 0),
	(2, 7, 0),
	(2, 8, 0),
	(2, 9, 0),
	(2, 10,0),
	(2, 11, 0),
	(2, 12, 0),
	(2, 13, 0),
	(2, 14, 0),
	(2, 15, 0),
	(2, 16, 0),
	(2, 17, 1),
	(2, 18, 1),
	(2, 19, 0),
	(2, 20, 1);

INSERT INTO permiso VALUES --Permisos con los que cuenta el rol Cliente
	(3, 1, 1),
	(3, 2, 1),
	(3, 3, 1),
	(3, 4, 1),
	(3, 5, 0),
	(3, 6, 1),
	(3, 7, 0),
	(3, 8, 0),
	(3, 9, 0),
	(3, 10,0),
	(3, 11, 0),
	(3, 12, 0),
	(3, 13, 0),
	(3, 14, 0),
	(3, 15, 0),
	(3, 16, 0),
	(3, 17, 0),
	(3, 18, 0),
	(3, 19, 0),
    (3, 20, 1);

-----------------------------Insert de las zonas con las que se trabajara-----------------------------
INSERT INTO dbo.zona VALUES
('CABA'),
('Almirante Brown'),
('Avellaneda'),
('Berazategui'),
('Esteban Echeverria'),
('Ezeiza'),
('Florencio Varela'),
('General San Martin'),
('Hurlingham'),
('Ituzaingo'),
('Jose C. Paz'),
('La matanza'),
('Lanus'),
('Lomas de Zamora'),
('Malvinas Argentinas'),
('Merlo'),
('Moreno'),
('Moron'),
('Pilar'),
('Quilmes'),
('San Fernando'),
('San Isidro'),
('San Miguel'),
('Tigre'),
('Tres de Febrero'),
('Vicente Lopez');

----------------------------------Insert de los productos---------------------------------
INSERT INTO dbo.producto VALUES
('Chocolate', 17.500, 10),
('Dulce de leche', 17.500, 10),
('Frutilla a la crema', 17.500, 9),
('Vainilla', 17.500, 7),
('Crema del cielo', 17.500, 7),
('Americana', 17.500, 7),
('Limon granizado', 14.000, 7),
('Limon', 14.000, 12),
('Anana', 14.000, 12),
('Durazno', 14.000, 12),
('Frutilla al agua', 14.000, 12),
('Naranja', 14.000, 12),
('Manzana', 14.000, 12),
('Melon', 14.000, 12),
('Baileys', 22.500, 1),
('Chocolate blanco', 22.500, 1),
('Chocolate ferrero', 22.500, 1),
('Chocolate kinder', 22.500, 1),
('Chocolate marroc', 22.500, 1),
('Chocotorta', 22.500, 1),
('Crema rusa', 22.500, 1),
('Dulce de leche bombon', 22.500, 1),
('Dulce de leche brownie', 22.500, 1),
('Dulce de leche con nuez', 22.500, 1),
('Galletita limon', 22.500, 1),
('Mantecol', 22.500, 1),
('Tiramisu', 22.500, 1),
('Almendrado', 23.500, 2),
('Chocolate con almendras', 23.500, 2),
('Super sambayon', 23.500, 2),
('Sambayon con almendras', 23.500, 2),
('Sambayon con cerezas', 23.500, 2);

-----------------------------Insert en la tabla formas de pago-------------------------------
INSERT INTO dbo.formaPago VALUES
('Efectivo'),
('Tarjeta debito'),
('Transferencia/Deposito');