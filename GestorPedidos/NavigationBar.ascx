<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NavigationBar.ascx.cs" Inherits="Gestor_Pedidos.NavigationBar" %>
<div class="elNav">
    <div class="navbar">
        <asp:LinkButton ID="lnkRealizarPedido" runat="server" OnClick="lnkRealizarPedido_Click">Realizar Pedido</asp:LinkButton>
        <asp:LinkButton ID="lnkMisPedidos" runat="server" OnClick="lnkMisPedidos_Click">Mis Pedidos</asp:LinkButton>
        <asp:LinkButton ID="lnkMiPerfil" runat="server" OnClick="lnkMiPerfil_Click">Mi Perfil</asp:LinkButton>
    </div>
</div>
<style>
    /* Estilos para la barra de navegación */
.navbar {
    display: grid;
    justify-content: center;
    align-items: center;
    grid-template-columns: repeat(3, 1fr);
    gap: 3vw;
    padding: 10px;
}

.elNav {
    display: grid;
    justify-content: center;
    justify-items: start;
    align-items: center;
    grid-template-columns: repeat(2, 1fr);
    border-radius:10px 10px 0 0;
    background-color:#DB8569;  
}

.nav-button:hover {
    background-color: #0056b3;
}

</style>
