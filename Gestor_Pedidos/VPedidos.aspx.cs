using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace Gestor_Pedidos
{
    public partial class VPedidos : System.Web.UI.Page
    {
        Usuario usuarioLogueado;
        private List<DetallesPedido> detallesPedidosList = new List<DetallesPedido>();

        protected void Page_Load(object sender, EventArgs e)
        {
            usuarioLogueado = (Usuario)Session["UsuarioLogueado"];

            if (usuarioLogueado == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                VisualizarPedidos();
            }
        }

        public class DetallesPedido
        {
            public int id { get; set; }
            public DateTime fecha { get; set; }
            public string estado { get; set; }
        }

        protected void VisualizarPedidos()
        {
            string conectar = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
            using (SqlConnection sqlConectar = new SqlConnection(conectar))
            {
                SqlCommand cmd1 = new SqlCommand("SELECT p.id_pedido, p.estado, f.fecha FROM dbo.pedido p JOIN dbo.factura f ON p.id_pedido = f.id_pedido WHERE f.id_cliente = @id_cliente;", sqlConectar);
                cmd1.Parameters.AddWithValue("@id_cliente", usuarioLogueado.Id);
                sqlConectar.Open();
                SqlDataReader sdr1 = cmd1.ExecuteReader();

                if (sdr1.HasRows)
                {
                    while (sdr1.Read())
                    {
                        DetallesPedido detallePedido = new DetallesPedido
                        {
                            id = sdr1.GetInt32(0),
                            estado = sdr1.GetString(1),
                            fecha = sdr1.GetDateTime(2),
                        };

                        detallesPedidosList.Add(detallePedido);
                    }

                    gvMostrarPedidos.DataSource = detallesPedidosList;
                    gvMostrarPedidos.DataBind();
                    gvMostrarPedidos.Visible = true;
                    lblNoHayPedidos.Visible = false;
                }
                else
                {
                    gvMostrarPedidos.Visible = false;
                    lblNoHayPedidos.Visible = true;
                    lblNoHayPedidos.Text = "No tiene pedidos registrados";
                }

                sqlConectar.Close();
            }
        }

        public class ProductSelected
        {
            public string nombreProducto { get; set; }
            public int cantidad { get; set; }
            public float precioUnitario { get; set; }
            public float subtotal { get; set; }
        }
    }
}
