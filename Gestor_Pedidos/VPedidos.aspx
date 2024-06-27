<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VPedidos.aspx.cs" Inherits="Gestor_Pedidos.VPedidos" %>
<%@ Register Src="NavigationBar.ascx" TagPrefix="uc" TagName="NavigationBar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Mis pedidos</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <uc:NavigationBar ID="NavigationBar" runat="server" />
            <div>
                <strong><asp:Label ID="lblPedidos" runat="server" Text="Pedidos realizados"></asp:Label></strong>
                <div class="row">
                    <asp:Label runat="server" CssClass="alert-danger" ID="lblNoHayPedidos" Visible="false"></asp:Label>
                </div>
                <asp:GridView ID="gvMostrarPedidos" runat="server" AutoGenerateColumns="False" Visible="false">
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="Numero Pedido" ItemStyle-CssClass="grid-spacing" HeaderStyle-CssClass="grid-spacing"/>
                        <asp:BoundField DataField="fecha" HeaderText="Fecha" ItemStyle-CssClass="grid-spacing" HeaderStyle-CssClass="grid-spacing"/>
                        <asp:BoundField DataField="estado" HeaderText="Estado" ItemStyle-CssClass="grid-spacing" HeaderStyle-CssClass="grid-spacing"/>
                        <asp:TemplateField HeaderText="Factura Pedido">
                            <ItemTemplate>
                                <asp:Button ID="btnVerFactura" runat="server" Text="Ver Factura" CommandName="VerFactura" CommandArgument='<%# Eval("id") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>

    </form>
</body>
</html>

<style>
.grid-spacing {
    padding: 10px; /* Ajusta el valor para el espaciado deseado */
}
</style>
