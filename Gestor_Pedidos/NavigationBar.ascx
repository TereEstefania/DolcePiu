<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NavigationBar.ascx.cs" Inherits="Gestor_Pedidos.NavigationBar" %>
<div class="navbar">
    <asp:LinkButton ID="lnkRealizarPedido" runat="server" OnClick="lnkRealizarPedido_Click">Realizar Pedido</asp:LinkButton>
    <asp:LinkButton ID="lnkMisPedidos" runat="server" OnClick="lnkMisPedidos_Click">Mis Pedidos</asp:LinkButton>
    <asp:LinkButton ID="lnkMiPerfil" runat="server" OnClick="lnkMiPerfil_Click">Mi Perfil</asp:LinkButton>
</div>

<style>
    /* Estilos para la barra de navegación */
.navigation-bar {
    background-color: #f8f9fa;
    border-bottom: 1px solid #ddd;
    padding: 10px 0;
    text-align: center;
    margin-bottom: 20px;
}

.nav-button {
    background-color: #007bff;
    border: none;
    color: white;
    padding: 10px 20px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    margin: 4px 2px;
    cursor: pointer;
    border-radius: 5px;
    font-size: 16px;
}

.nav-button:hover {
    background-color: #0056b3;
}

</style>