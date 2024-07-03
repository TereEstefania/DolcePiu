<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Pedido.aspx.cs" Inherits="Gestor_Pedidos.Pedido" %>
<%@ Register Src="NavigationBar.ascx" TagPrefix="uc" TagName="NavigationBar" %>
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
     <title>Pedidos</title>
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
    <form id="form1" class="formulario" runat="server">
        <div class="navegador">
            <uc:NavigationBar ID="NavigationBar" runat="server" />
        </div>
            <div class="prueba">
                <div class="control-pedido">
                    <asp:Label ID="lblSeleccionarProductos" class="titulo" runat="server" Text="Seleccionar productos:"></asp:Label>
                 <div class="selec-sabor">                
                    <asp:Label ID="lblSabor" runat="server" Text="Sabor"></asp:Label>
                    <asp:ListBox ID="ltsBoxProducto" runat="server" Rows="1"></asp:ListBox>
                    <asp:Label ID="lblCantidad" runat="server" Text="Cantidad"></asp:Label>
                    <asp:TextBox ID="txtBoxCantidad" runat="server"></asp:TextBox>
                 </div>
                <div class="btn-prod">
                    <button class="btn btn-primary">Quitar</button>
                    <asp:Button ID="BtnAgregarProducto" CssClass="btn btn-primary btn-dark" runat="server" Text="Agregar Producto" OnClick="BtnAgregarProducto_Click" />
                </div>
                <div class="selec-sabor">
                    <asp:Label ID="lblZona" runat="server" Text="Zona"></asp:Label>
                    <asp:ListBox ID="ltsBoxZona" runat="server" Rows="1"></asp:ListBox>
                    <asp:Label ID="lblMetodoPago" runat="server" Text="Metodo de Pago"></asp:Label>
                    <asp:RadioButtonList ID="rbListFormaPago" runat="server"></asp:RadioButtonList>
                </div>
                <div class="error">
                  <asp:Label runat="server" CssClass="alert-danger" ID="lblRegistrado"></asp:Label>
                </div>
                <div class="lbtn">
                  <asp:Button ID="BtnRegistrar" CssClass="btn btn-primary btn-dark" runat="server" Text="Registrar Pedido" OnClick="BtnRegistrar_Click" />
                </div>
                <div class="grids-form">
                     <div  style="overflow: auto; height: 500px;">
                        <asp:GridView ID="gvMostrarProductos" runat="server"></asp:GridView>
                        <asp:Label ID="lblTotal" runat="server" Text="Total: $0.00" Font-Bold="True" />
                    </div>
                </div>
          </div>
        </div>
    </form>
</body>
</html>
