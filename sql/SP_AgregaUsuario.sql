USE GestorPedidos;

CREATE PROCEDURE SP_AgregaUsuario (
@Nombre varchar(50),
@Apellido varchar(50),
@Telefono varchar(10),
@Direccion varchar(50),
@Dni varchar(8),
@id_zona int,
@id_credencialUsuario int,
@id_rol int)
AS
BEGIN
	DECLARE @id_usuario INT;

    INSERT INTO usuario(nombre, apellido, telefono, direccion, dni, id_zona, id_credencialUsuario, id_rol)
    VALUES (@Nombre, @Apellido, @Telefono, @Direccion, @Dni, @id_zona, @id_credencialUsuario, @id_rol)

    -- Obtener el ID del cliente insertado
    SET @id_usuario = SCOPE_IDENTITY();
END