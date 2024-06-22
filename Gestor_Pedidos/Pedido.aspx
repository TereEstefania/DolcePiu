<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Pedido.aspx.cs" Inherits="Gestor_Pedidos.Pedido" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link href="/Recursos/CSS/EstilosPedido.css" rel="stylesheet" type="text/css" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="background-div">
                <strong><asp:Label ID="lblSeleccionarProductos" runat="server" Text="Seleccionar productos:"></asp:Label></strong>
                <br />
                <asp:Label ID="lblSabor" runat="server" Text="Sabor"></asp:Label>
                <asp:ListBox ID="ltsBoxProducto" runat="server" Rows="1"></asp:ListBox>
                <br />
                <asp:Label ID="lblCantidad" runat="server" Text="Cantidad"></asp:Label>
                <asp:TextBox ID="txtBoxCantidad" runat="server"></asp:TextBox>
                <br />
                <div class="row">
                  <asp:Button ID="BtnAgregarProducto" CssClass="btn btn-primary btn-dark" runat="server" Text="Agregar Producto" OnClick="BtnAgregarProducto_Click" />
                </div>
                <br />
                <asp:GridView ID="gvMostrarProductos" runat="server"></asp:GridView>
                <asp:Label ID="lblTotal" runat="server" Text="Total: $0.00" Font-Bold="True" />
            </div>
            <asp:Label ID="lblZona" runat="server" Text="Zona"></asp:Label>
            <asp:ListBox ID="ltsBoxZona" runat="server" Rows="1"></asp:ListBox>
            <br />
            <asp:Label ID="lblMetodoPago" runat="server" Text="Metodo de Pago"></asp:Label>
            <asp:RadioButtonList ID="rbListFormaPago" runat="server"></asp:RadioButtonList>
            <div class="row">
              <asp:Label runat="server" CssClass="alert-danger" ID="lblRegistrado"></asp:Label>
            </div>
            <div class="row">
              <asp:Button ID="BtnRegistrar" CssClass="btn btn-primary btn-dark" runat="server" Text="Registrar Pedido" OnClick="BtnRegistrar_Click" />
            </div>
        </div>
    </form>
</body>
</html>
