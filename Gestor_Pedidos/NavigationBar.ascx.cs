using System;
using System.Web.UI;

namespace Gestor_Pedidos
{
    public partial class NavigationBar : UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void lnkRealizarPedido_Click(object sender, EventArgs e)
        {
            Response.Redirect("Pedido.aspx");
        }

        protected void lnkMisPedidos_Click(object sender, EventArgs e)
        {
            Response.Redirect("VPedidos.aspx");
        }

        protected void lnkMiPerfil_Click(object sender, EventArgs e)
        {
            Response.Redirect("VPerfil.aspx");
        }
    }
}