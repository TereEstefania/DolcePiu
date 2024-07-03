CREATE DATABASE GestorPedidos;

USE GestorPedidos;

CREATE TABLE rol(
id_rol int primary key,
nombre varchar(50)
);

CREATE TABLE zona
( 
id_zona int primary key identity not null,
nombre varchar (100)not null
);

CREATE TABLE credencialUsuario(
  id_credencialUsuario int primary key identity not null,
  contrasenia varbinary(500) not null,
  mail varchar(50) not null,
  CONSTRAINT UC_credencialCliente UNIQUE (mail) --Se agregó la constraint unique a mail
 ); 

CREATE TABLE usuario(
  id_usuario int primary key identity not null,
 nombre varchar(50) not null,
 apellido varchar(50) not null,
 telefono varchar(10) not null,
 direccion varchar(50) not null,
 dni varchar(8) not null,
 id_credencialUsuario int foreign key references credencialUsuario(id_credencialUsuario),
 id_zona int foreign key references zona(id_zona),
 id_rol int foreign key references rol(id_rol)
 CONSTRAINT UC_Cliente UNIQUE (dni) --Se agregó la constraint unique a DNI 
 );

CREATE TABLE formaPago(
id_pago int primary key identity not null,
tipoPago varchar(50) not null
);

CREATE TABLE producto(
id_producto int primary key identity not null,
nombre varchar(50) not null,
precio float not null,
stock int not null
);

CREATE TABLE pedido 
( 
id_pedido int primary key identity not null,
estado varchar(20)not null,
id_usuario int foreign key references usuario(id_usuario)
);

CREATE TABLE pedido_producto 
( 
id_pedidoProducto int primary key identity not null,
id_pedido int foreign key references pedido (id_pedido),
id_producto int foreign key references producto(id_producto),
cantidad int not null
);

CREATE TABLE factura
(
id_factura int primary key identity(1,1) not null,
id_pedido int foreign key references pedido(id_pedido),
id_usuario int foreign key references usuario(id_usuario),
id_pago int foreign key references formaPago (id_pago),
totalCompra float not null,
fecha datetime not null,
);


CREATE TABLE modulo(
id_modulo int primary key,
nombre varchar(50),
icono varchar(50)
);

CREATE TABLE operacion(
id_operacion int primary key,
id_modulo int references modulo(id_modulo),
nombre varchar(50),
nombreFormulario varchar(50)
);

CREATE TABLE permiso(
id_permiso int primary key identity,
id_rol int references rol(id_rol),
id_operacion int references operacion(id_operacion),
activo bit
);