USE GestorPedidos;

CREATE PROCEDURE SP_ValidarCredencialUsuario
@Mail varchar(50),
@Contrasenia varchar(50),
@Patron varchar(50)
AS
BEGIN
	SELECT 
        c.id_usuario,
        c.nombre,
        c.direccion,
        c.id_zona,
        cu.mail
    FROM 
        credencialUsuario cu
    JOIN 
        usuario c ON cu.id_credencialUsuario = c.id_credencialUsuario
    
	WHERE cu.mail = @Mail 
	AND CONVERT(varchar(50), DECRYPTBYPASSPHRASE(@Patron, contrasenia))= @Contrasenia
END