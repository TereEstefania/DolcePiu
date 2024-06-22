<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Gestor_Pedidos.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat:wght@400;700&display=swap"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" ></script>
    <link href="\Recursos\CSS\Estilos.css" rel="stylesheet" />
    <link rel="icon" href="Recursos/img/logo_dolcepiu.png" type="image/x-icon"/>
    <title>Login</title>
</head>
<body class="bg-light">
    <div class="wrapper">
        <div class="formcontent">
           <form id="formulario_login" runat="server">
                <div class="form-control">
                    <div class="row">
                        <asp:Label class="h2" ID="Bienvenida" runat="server" Text="Bienvenida/o"></asp:Label>
                    </div>
                    <div>
                        <asp:Label ID="lblUsuario" runat="server" Text="Usuario"></asp:Label>
                        <asp:TextBox ID="tbUsuario" CssClass="form-control" runat="server" placeholder="Nombre de usuario"></asp:TextBox>
                    </div>
                    <div>
                        <asp:Label ID="lblPassword" runat="server" Text="Password"></asp:Label>
                        <asp:TextBox ID="tbPassword" CssClass="form-control" TextMode="Password" runat="server" placeholder="Password"></asp:TextBox>
                    </div>
                    <hr />    
                    <div class ="row">
                        <asp:Label runat="server" CssClass="alert-danger" ID="lblError"></asp:Label> 
                    </div>
                    <br />
                    <div class="row">
                        <asp:Button ID="BtnIngresar" CssClass="btn btn-primary btn-dark" runat="server" Text="Ingresar" OnClick="BtnIngresar_Click"/>
                    </div>
                    <br />
                    <div class="row">
                        <asp:Button ID="BtnRegistrar" CssClass="btn btn-primary btn-dark" runat="server" Text="Registrar" OnClick="BtnRegistrar_Click" />
                    </div>
                </div>
           </form>
        </div>
    </div>
    
</body>
</html>
