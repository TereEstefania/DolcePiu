<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VPerfil.aspx.cs" Inherits="Gestor_Pedidos.VPerfil" %>
<%@ Register Src="NavigationBar.ascx" TagPrefix="uc" TagName="NavigationBar" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Mi Perfil</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet" integrity="sha384-jLKHWMzPUFXFLFk8aq7AoxQf37egT0V9VC2l7MZgI4Bfjv9Ip8VbbF7g1pD4uE4U" crossorigin="anonymous" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <uc:NavigationBar ID="NavigationBar" runat="server" />
            <div class="container mt-4">
                <h2>Mi Perfil</h2>
                <div class="row mb-4">
                    <div class="col-md-12 text-center">
                        <i class="fas fa-user-circle fa-5x"></i>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <asp:Label ID="lblNombreYApellido" runat="server" CssClass="form-label" Text="Nombre y Apellido:"></asp:Label>
                    </div>
                    <div class="col-md-12">
                        <asp:Label ID="lblDni" runat="server" CssClass="form-label" Text="DNI:"></asp:Label>
                    </div>
                    <div class="col-md-12">
                        <asp:Label ID="lblDireccion" runat="server" CssClass="form-label" Text="Dirección:"></asp:Label>
                    </div>
                    <div class="col-md-12">
                        <asp:Label ID="lblTelefono" runat="server" CssClass="form-label" Text="Teléfono:"></asp:Label>
                    </div>
                    <div class="col-md-12">
                        <asp:Label ID="lblEmail" runat="server" CssClass="form-label" Text="Correo Electrónico:"></asp:Label>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>

<style>
    .form-label {
        font-weight: bold;
        margin-bottom: 15px;
    }
    .fa-user-circle {
        color: #6c757d;
    }
</style>
