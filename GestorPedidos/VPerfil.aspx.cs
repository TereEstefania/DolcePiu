using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Gestor_Pedidos
{
    public partial class VPerfil : System.Web.UI.Page
    {
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
                VisualizarPerfil();
            }
        }

        public class DatosPerfilUsuario
        {
            public string nombreApellido { get; set; }
            public string dni { get; set; }
            public string direccion { get; set; }
            public string telefono { get; set; }
            public string email { get; set; }
        }

        protected void VisualizarPerfil()
        {
            string conectar = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
            using (SqlConnection sqlConectar = new SqlConnection(conectar))
            {
                SqlCommand cmd1 = new SqlCommand("SELECT c.nombre, c.apellido, c.dni, c.direccion, c.telefono, cu.mail FROM dbo.usuario c JOIN dbo.credencialUsuario cu on c.id_credencialUsuario = cu.id_credencialUsuario WHERE c.id_usuario = @id_usuario;", sqlConectar);
                cmd1.Parameters.AddWithValue("@id_usuario", usuarioLogueado.Id);
                sqlConectar.Open();
                SqlDataReader sdr1 = cmd1.ExecuteReader();

                if (sdr1.Read())
                {
                    DatosPerfilUsuario datosPerfilUsuario = new DatosPerfilUsuario
                    {
                        nombreApellido = $"{sdr1["nombre"]} {sdr1["apellido"]}",
                        dni = sdr1["dni"].ToString(),
                        direccion = sdr1["direccion"].ToString(),
                        telefono = sdr1["telefono"].ToString(),
                        email = sdr1["mail"].ToString()
                    };
                    MostrarDatos(datosPerfilUsuario);
                }
                sqlConectar.Close();
            }
        }
        protected void MostrarDatos(DatosPerfilUsuario datosPerfilUsuario)
        {
            lblNombreYApellido.Text = "Nombre y Apellido: " + datosPerfilUsuario.nombreApellido;
            lblDni.Text = "DNI: " + datosPerfilUsuario.dni;
            lblDireccion.Text = "Dirección: " + datosPerfilUsuario.direccion;
            lblTelefono.Text = "Teléfono: " + datosPerfilUsuario.telefono;
            lblEmail.Text = "Correo Electrónico: " + datosPerfilUsuario.email;
        }
    }
}