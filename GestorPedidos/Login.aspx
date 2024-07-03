<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Gestor_Pedidos.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" ></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat:wght@400;700&display=swap"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <link href="Recursos/CSS/Estilos.css" rel="stylesheet" />
    <link rel="icon" href="Recursos/img/logo_dolcepiu.png" type="image/x-icon"/>

    <title>Login</title>
</head>
<body class="bg-imag">
    <div class="contenedor-imagen">
       <a class="navbar-brand" href="Index.html">
        <img src="Recursos/img/logo_dolcepiu.png" alt="dolce piu" width="120" height="120" />
      </a>
     </div>
    <div class="wrapper">
        <div class="formcontent">
           <form id="formulario_login" runat="server">
                <div class="control">
                    <div class="titulo">
                        <asp:Label class="h2" ID="Bienvenida" runat="server" Text="Iniciar sesion"></asp:Label>
                    </div>
                    <div class="inputs">
                        <asp:Label ID="lblUsuario" runat="server" Text="Usuario"></asp:Label>
                        <asp:TextBox ID="tbUsuario" CssClass="form-control" runat="server" placeholder="Nombre de usuario"></asp:TextBox>
                    </div>
                    <div class="inputs">
                        <asp:Label ID="lblPassword" runat="server" Text="Password"></asp:Label>
                        <asp:TextBox ID="tbPassword" CssClass="form-control" TextMode="Password" runat="server" placeholder="Password"></asp:TextBox>
                    </div>
                    <hr />    
                    <div class ="error">
                        <asp:Label runat="server" CssClass="alert-danger" ID="lblError"></asp:Label> 
                    </div>
                    <div class="grids">
                        <div class="pop">
                             <asp:Button class="rec-cont" runat="server" Text="Recuperar contraseña"/>
                         </div>
                         <div class="l-btn">
                             <asp:Button ID="BtnIngresar" CssClass="btn btn-primary btn-dark" runat="server" Text="Ingresar" OnClick="BtnIngresar_Click"/>
                         </div>
                         <div class="pop">
                             <asp:Button ID="BtnRegistrar"  class="rec-cont" runat="server" Text="Registrarse" OnClick="BtnRegistrar_Click" />
                         </div>
                    </div>
                 </div>
           </form>
        </div>
    </div>
    
</body>
</html>
