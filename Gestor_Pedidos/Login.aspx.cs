using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Gestor_Pedidos
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        string patron = "PatronGestorPedidos";
        protected void BtnIngresar_Click(object sender, EventArgs e)
        {
            string conectar = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
            SqlConnection sqlConectar = new SqlConnection(conectar);
            SqlCommand cmd = new SqlCommand("SP_ValidarCredencialCliente", sqlConectar)
            {
                CommandType = CommandType.StoredProcedure
            };
            cmd.Connection.Open();
            cmd.Parameters.Add("@Mail", SqlDbType.VarChar, 50).Value = tbUsuario.Text;
            cmd.Parameters.Add("@Contrasenia", SqlDbType.VarChar, 50).Value = tbPassword.Text;
            cmd.Parameters.Add("@Patron", SqlDbType.VarChar, 50).Value = patron;
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                int idCliente = dr.IsDBNull(0) ? 0 : dr.GetInt32(0); 
                string nombre = dr.IsDBNull(1) ? string.Empty : dr.GetString(1);
                string direccion = dr.IsDBNull(2) ? string.Empty : dr.GetString(2);
                int idZona = dr.IsDBNull(3) ? 0 : dr.GetInt32(3); 
                string email = dr.IsDBNull(4) ? string.Empty : dr.GetString(4);

                // Almacenar los datos del usuario en la sesión
                Session["UsuarioLogueado"] = new Usuario
                {
                    Id = idCliente,
                    Nombre = nombre,
                    Direccion = direccion,
                    IdZona = idZona,
                    Email = email
                };

                Response.Redirect("Pedido.aspx");
            }
            else
            {
                lblError.Text = "Error de usuario o contaseña";
            }
            cmd.Connection.Close();
        }

        protected void BtnRegistrar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Registro.aspx");
        }
    }
}