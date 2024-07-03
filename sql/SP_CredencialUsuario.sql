USE GestorPedidos;

CREATE PROCEDURE SP_CredencialUsuario (
@Mail varchar(50),
@Contrasenia varchar(50),
@Patron varchar(50),
@id_credencialUsuario int OUT)
AS
BEGIN
  INSERT INTO credencialUsuario(mail,contrasenia) VALUES (@Mail,ENCRYPTBYPASSPHRASE(@Patron, @Contrasenia))
  SET @id_credencialUsuario = SCOPE_IDENTITY();
END