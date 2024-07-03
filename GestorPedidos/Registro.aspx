<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="Gestor_Pedidos.Registro" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
       <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat:wght@400;700&display=swap"/>
       <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
       <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
       <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
       <link href="Recursos/CSS/Estilos.css" rel="stylesheet" />
       <link rel="icon" href="Recursos/img/logo_dolcepiu.png" type="image/x-icon"/>
  <title>Registrarse</title>
</head>
  <body class="light">
       <div class="contenedor-imagen">
           <a class="navbar-brand" href="Index.html">
             <img src="Recursos/img/logo_dolcepiu.png" alt="dolce piu" width="120" height="120" />
           </a>
       </div>
        <div class="wrapper">
        <div class="formcontent">
            <form id="formulario_login" runat="server">
                <div class="control">
                    <div class="row">
                        <asp:Label class="titulo" ID="lblRegistro" runat="server" Text="Registrarse en el Sistema"></asp:Label>
                    </div>
                    <div class="inputs">
                        <asp:Label ID="lblNombre" runat="server" Text="Nombre:"></asp:Label>
                        <asp:TextBox ID="tbUsuario" CssClass="form-control" runat="server" placeholder="Ingrese su nombre"></asp:TextBox>
                    </div>
                    <div class="inputs">
                        <asp:Label ID="lblApellido" runat="server" Text="Apellido:"></asp:Label>
                        <asp:TextBox ID="tbApellido" CssClass="form-control" runat="server" placeholder="Ingrese su apellido"></asp:TextBox>
                    </div>
                    <div class="inputs">
                        <asp:Label ID="lblDocumento" runat="server" Text="Documento:"></asp:Label>
                        <asp:TextBox ID="tbDocumento" CssClass="form-control" runat="server" placeholder="Ingrese su documento"></asp:TextBox>
                    </div>
                    <div class="inputs">
                        <asp:Label ID="lblTeleono" runat="server" Text="Telefono:"></asp:Label>
                        <asp:TextBox ID="tbTelefono" CssClass="form-control" runat="server" placeholder="Ingrese su telefono"></asp:TextBox>
                    </div>
                    <div class="inputs">
                        <asp:Label ID="lblEmail" runat="server" Text="Correo electronico:"></asp:Label>
                        <asp:TextBox ID="tbEmail" CssClass="form-control" runat="server" placeholder="Ingrese su correo electronico"></asp:TextBox>
                    </div>
                    <div class="inputs">
                        <asp:Label ID="lblDireccion" runat="server" Text="Direccion:"></asp:Label>
                        <asp:TextBox ID="tbDireccion" CssClass="form-control" runat="server" placeholder="Ingrese su direccion"></asp:TextBox>
                    </div>
                    <br />
                    <div class="inputs">
                        <asp:Label ID="lblZona" runat="server" Text="Zona"></asp:Label>
                        <asp:ListBox ID="ListBox1" runat="server" Rows="1"></asp:ListBox>
                    </div>
                    <div class="inputs">
                        <asp:Label ID="lblContrasenia" runat="server" Text="Contraseña:"></asp:Label>
                        <asp:TextBox ID="tbContrasenia" CssClass="form-control" TextMode="Password" runat="server" placeholder="Ingrese su contraseña"></asp:TextBox>
                    </div>
                    <hr />
                    <div class="error">
                        <asp:Label runat="server" CssClass="alert-danger" ID="lblError"></asp:Label>
                    </div>
                    <div class="error">
                        <asp:Label runat="server" CssClass="alert-danger" ID="lblRegistrado"></asp:Label>
                    </div>
                    <br />
                    <div class="row-btn">
                         <asp:Button ID="BtnCerrar"  CssClass="btn btn-primary btn-dark"  runat="server" Text="Cerrar" OnClick="BtnCerrar_Click"/>  
                         <asp:Button ID="BtnRegistrar" CssClass="btn btn-primary btn-dark" runat="server" Text="Registrar" OnClick="BtnRegistrar_Click" />
                    </div>
                </div>
            </form>
        </div>
    </div>
 </body>
</html>
