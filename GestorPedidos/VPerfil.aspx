<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VPerfil.aspx.cs" Inherits="Gestor_Pedidos.VPerfil" %>
<%@ Register Src="NavigationBar.ascx" TagPrefix="uc" TagName="NavigationBar" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat:wght@400;700&display=swap"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet" integrity="sha384-jLKHWMzPUFXFLFk8aq7AoxQf37egT0V9VC2l7MZgI4Bfjv9Ip8VbbF7g1pD4uE4U" crossorigin="anonymous" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <link href="Recursos/CSS/Estilos.css" rel="stylesheet" />
    <link rel="icon" href="Recursos/img/logo_dolcepiu.png" type="image/x-icon"/>
    <title>Mi Perfil</title>s" />
</head>
<body>
    <nav class="navbar nav-color">
        <div class="container-x">
        <a class="navbar-brand" href="Index.html">
            <img src="Recursos/img/dolce_piu_name.png" alt="dolce piu" width="65" height="30"/>
        </a>
            <img src="Recursos/img/avatar.png" alt="avatar" width="25" height="25" /> 
        </div>
    </nav>
  <div class="wrapper">
   <form class="perfil formulario" id="form1" runat="server">
    <div class="navengador">
            <uc:NavigationBar ID="NavigationBar" runat="server" />
           <div class="prueba">
               <div class="img-perfil">
                   <img src="Recursos/img/Remove-bg.ai_1719786109469.png" width="250" height="250"/>
               </div>
            <div class="perfil control-pedido">
                <asp:Label ID="lblmiperfil" class="titulo" runat="server" Text="Mi perfil"></asp:Label>
                <div class="row">
                    <div class="col-md-12">
                        <asp:Label ID="lblNombreYApellido" runat="server" class="inputs" Text="Nombre y Apellido:"></asp:Label>
                    </div>
                    <div class="col-md-12">
                        <asp:Label ID="lblDni" runat="server" class="inputs" Text="DNI:"></asp:Label>
                    </div>
                    <div class="col-md-12">
                        <asp:Label ID="lblDireccion" runat="server" class="inputs" Text="Dirección:"></asp:Label>
                    </div>
                    <div class="col-md-12">
                        <asp:Label ID="lblTelefono" runat="server" class="inputs" Text="Teléfono:"></asp:Label>
                    </div>
                        <div class="col-md-12">
                            <asp:Label ID="lblEmail" runat="server" class="inputs" Text="Correo Electrónico:"></asp:Label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    </div>
</body>
</html>
