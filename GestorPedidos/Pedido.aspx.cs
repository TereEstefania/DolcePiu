using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;

namespace Gestor_Pedidos
{
    public partial class Pedido : System.Web.UI.Page
    {
        private string sabor;
        private int cantidad;
        private List<ProductSelected> listaProductosSeleccionados = new List<ProductSelected>();

        TipoPago tipoPago = new TipoPago();
        Usuario usuarioLogueado;

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
                loadZones();
                loadFlavor();
                loadMethodPayment();

                // Inicializa la lista de productos en el estado de sesión si es la primera carga de la página
                Session["ListaProductosSeleccionados"] = new List<ProductSelected>();
            }
            else
            {
                // Recupera la lista de productos del estado de sesión en cada postback
                listaProductosSeleccionados = (List<ProductSelected>)Session["ListaProductosSeleccionados"];
            }
        }

        protected void BtnAgregarProducto_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(ltsBoxProducto.SelectedItem?.Text))
            {
                lblRegistrado.Text = "Debe seleccionar un sabor.";
                return;
            }
            if (string.IsNullOrEmpty(txtBoxCantidad.Text) || !int.TryParse(txtBoxCantidad.Text, out this.cantidad) || this.cantidad <= 0)
            {
                lblRegistrado.Text = "Debe ingresar una cantidad válida.";
                return;
            }

            this.sabor = ltsBoxProducto.SelectedItem.Text;
            float precioProducto = 0.0f;
            int stockDisponible;
            float totalCompraSeleccionada = 0.0f;

            string conectar = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
            SqlConnection sqlConectar = new SqlConnection(conectar);

            // Buscar informacion del producto
            SqlCommand cmd1 = new SqlCommand("SELECT precio, stock FROM dbo.producto WHERE nombre = @nombre", sqlConectar);
            cmd1.Parameters.AddWithValue("@nombre", this.sabor);
            sqlConectar.Open();
            SqlDataReader sdr1 = cmd1.ExecuteReader();

            if (sdr1.Read())
            {
                precioProducto = (float)sdr1.GetDouble(0);
                stockDisponible = sdr1.GetInt32(1);
            }
            else
            {
                // Manejar caso donde no se encuentra el producto
                lblRegistrado.Text = "Producto no encontrado";
                sqlConectar.Close();
                return;
            }

            sqlConectar.Close();

            if (stockDisponible < this.cantidad)
            {
                lblRegistrado.Text = "Stock insuficiente";
                return;
            }

            // Crear un nuevo producto seleccionado y agregarlo a la lista
            ProductSelected productoSeleccionado = new ProductSelected
            {
                nombre = this.sabor,
                cantidad = this.cantidad,
                precio = precioProducto,
            };

            totalCompraSeleccionada += productoSeleccionado.precio;

            listaProductosSeleccionados.Add(productoSeleccionado);

            // Actualizar la lista de productos en el estado de sesión
            Session["ListaProductosSeleccionados"] = listaProductosSeleccionados;

            // Opcional: Actualiza la interfaz de usuario para mostrar la lista actualizada de productos
            MostrarProductos();

        }

        private void MostrarProductos()
        {
            // Este método puede actualizar un control en la página, como un GridView o ListView, para mostrar los productos agregados
            gvMostrarProductos.DataSource = listaProductosSeleccionados;
            gvMostrarProductos.DataBind();

            decimal total = (decimal)listaProductosSeleccionados.Sum(p => p.precio * p.cantidad);
            lblTotal.Text = "Total: " + total.ToString("C");
        }

        protected void BtnRegistrar_Click(object sender, EventArgs e)
        {
            string zona = ltsBoxZona.SelectedItem?.Text;
            string formaPago = rbListFormaPago.SelectedItem?.Text;

            if (string.IsNullOrEmpty(zona))
            {
                lblRegistrado.Text = "Debe seleccionar una zona.";
                return;
            }
            if (string.IsNullOrEmpty(formaPago))
            {
                lblRegistrado.Text = "Debe seleccionar un método de pago.";
                return;
            }
            if (listaProductosSeleccionados.Count == 0)
            {
                lblRegistrado.Text = "Debe agregar al menos un producto al pedido.";
                return;
            }

            string conectar = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
            int idPago = 0;
            SqlConnection sqlConectar = new SqlConnection(conectar);

            // Insertar pedido inicial
            SqlCommand cmd = new SqlCommand("INSERT INTO dbo.pedido (estado) VALUES (@estado); SELECT SCOPE_IDENTITY();", sqlConectar);
            cmd.Parameters.AddWithValue("@estado", "Pendiente");
            sqlConectar.Open();
            int idPedido = Convert.ToInt32(cmd.ExecuteScalar());
            sqlConectar.Close();

            // Insertar productos del pedido
            foreach (var prod in listaProductosSeleccionados)
            {
                SqlCommand cmd2 = new SqlCommand("INSERT INTO dbo.pedido_producto (id_pedido, id_producto, cantidad) VALUES (@id_pedido, (SELECT id_producto FROM dbo.producto WHERE nombre = @nombre), @cantidad)", sqlConectar);
                cmd2.Parameters.AddWithValue("@id_pedido", idPedido);
                cmd2.Parameters.AddWithValue("@nombre", prod.nombre);
                cmd2.Parameters.AddWithValue("@cantidad", prod.cantidad);
                sqlConectar.Open();
                cmd2.ExecuteNonQuery();
                sqlConectar.Close();

                // Actualizar stock en base de datos
                SqlCommand cmd3 = new SqlCommand("UPDATE dbo.producto SET stock = stock - @cantidad WHERE nombre = @nombre", sqlConectar);
                cmd3.Parameters.AddWithValue("@cantidad", prod.cantidad);
                cmd3.Parameters.AddWithValue("@nombre", prod.nombre);
                sqlConectar.Open();
                cmd3.ExecuteNonQuery();
                sqlConectar.Close();
            }

            // Seleccionar el id del método de pago
            SqlCommand cmd4 = new SqlCommand("SELECT id_pago FROM dbo.formaPago where tipoPago = @tipoPago", sqlConectar);
            cmd4.Parameters.AddWithValue("@tipoPago", formaPago);
            sqlConectar.Open();
            SqlDataReader sdr = cmd4.ExecuteReader();
            if (sdr.Read())
            {
                idPago = sdr.GetInt32(0);
            }
            else
            {
                lblRegistrado.Text = "Forma de pago no encontrada";
                sqlConectar.Close();
                return;
            }

            sqlConectar.Close();

            // Insertar factura
            SqlCommand cmd5 = new SqlCommand("INSERT INTO dbo.factura (id_pedido, id_usuario, id_pago, totalCompra, fecha) VALUES (@id_pedido, @id_usuario, @id_pago, @totalCompra, @fecha);", sqlConectar);
            cmd5.Parameters.AddWithValue("@id_pedido", idPedido);
            cmd5.Parameters.AddWithValue("@id_usuario", usuarioLogueado.Id);
            cmd5.Parameters.AddWithValue("@id_pago", idPago);
            cmd5.Parameters.AddWithValue("@totalCompra", listaProductosSeleccionados.Sum(p => p.precio * p.cantidad));
            cmd5.Parameters.AddWithValue("@fecha", DateTime.Now);
            sqlConectar.Open();
            cmd5.ExecuteNonQuery();
            sqlConectar.Close();

            lblRegistrado.Text = "Pedido registrado exitosamente";
            gvMostrarProductos.DataSource = null;
            gvMostrarProductos.DataBind();
            listaProductosSeleccionados.Clear();
            Session["ListaProductosSeleccionados"] = listaProductosSeleccionados;
            lblTotal.Text = "Total: ";
        }

        private void loadZones()
        {
            string conectar = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
            SqlConnection sqlConectar = new SqlConnection(conectar);
            SqlCommand cmd = new SqlCommand("SELECT DISTINCT nombre FROM dbo.zona", sqlConectar);
            sqlConectar.Open();
            SqlDataReader sdr = cmd.ExecuteReader();

            while (sdr.Read())
            {
                string name = sdr.GetString(0);
                ltsBoxZona.Items.Add(name);
            }

            sqlConectar.Close();
        }

        private void loadFlavor()
        {
            string conectar = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
            SqlConnection sqlConectar = new SqlConnection(conectar);
            //SqlCommand cmd1 = new SqlCommand("SELECT nombre FROM dbo.producto", sqlConectar);
            SqlCommand cmd1 = new SqlCommand("SELECT nombre FROM dbo.producto WHERE stock > 0", sqlConectar);

            sqlConectar.Open();
            SqlDataReader sdr1 = cmd1.ExecuteReader();

            while (sdr1.Read())
            {
                string name = sdr1.GetString(0);
                ltsBoxProducto.Items.Add(name);
            }

            sqlConectar.Close();
        }

        private void loadMethodPayment()
        {
            string conectar = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
            SqlConnection sqlConectar = new SqlConnection(conectar);
            SqlCommand cmd2 = new SqlCommand("SELECT * FROM dbo.formaPago", sqlConectar);
            sqlConectar.Open();
            SqlDataReader sdr2 = cmd2.ExecuteReader();

            while (sdr2.Read())
            {
                this.tipoPago.tipoPago = sdr2.GetString(1);
                rbListFormaPago.Items.Add(tipoPago.tipoPago);
                this.tipoPago.id = sdr2.GetInt32(0);
            }

            sqlConectar.Close();
        }
    }

    class ProductSelected
    {
        public string nombre { get; set; }
        public float precio { get; set; }
        public int cantidad { get; set; }
    }

    public class TipoPago
    {
        public int id { get; set; }
        public string tipoPago { get; set; }
    }
}
