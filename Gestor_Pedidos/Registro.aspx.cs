using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace Gestor_Pedidos
{
    public partial class Registro : System.Web.UI.Page
    {
        string patron = "PatronGestorPedidos";


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string conectar = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
                using (SqlConnection sqlConectar = new SqlConnection(conectar))
                {
                    SqlCommand cmd = new SqlCommand("SELECT id_zona, nombre from dbo.zona", sqlConectar);
                    sqlConectar.Open();
                    SqlDataReader sdr = cmd.ExecuteReader();

                    while (sdr.Read())
                    {
                        int id_zona = sdr.GetInt32(0); // Obtener el id_zona (primer campo)
                        string nombre = sdr.GetString(1); // Obtener el nombre de la zona (segundo campo)

                        ListItem item = new ListItem(nombre, id_zona.ToString()); // Crear un ListItem con nombre y valor (id_zona)
                        ListBox1.Items.Add(item); // Agregar el ListItem al ListBox
                    }
                }
            }
        }

        protected void BtnRegistrar_Click(object sender, EventArgs e)
        {
            string conectar = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
            int id_credencialCliente = 0;
            // Insertar credencial cliente
            using (SqlConnection sqlConectar = new SqlConnection(conectar))

            {
                SqlCommand cmd = new SqlCommand("SP_CredencialCliente", sqlConectar);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@Mail", SqlDbType.VarChar, 50).Value = tbEmail.Text;
                cmd.Parameters.Add("@Contrasenia", SqlDbType.VarChar, 50).Value = tbContrasenia.Text;
                cmd.Parameters.Add("@Patron", SqlDbType.VarChar, 50).Value = patron;

                SqlParameter outputParameter = new SqlParameter();
                outputParameter.ParameterName = "@id_credencialCliente";
                outputParameter.SqlDbType = SqlDbType.Int;
                outputParameter.Direction = ParameterDirection.Output;
                cmd.Parameters.Add(outputParameter);

                sqlConectar.Open();
                cmd.ExecuteNonQuery(); // Ejecutar sin devolver datos

                if (outputParameter.Value != DBNull.Value)
                {
                    id_credencialCliente = Convert.ToInt32(outputParameter.Value);
                }
            }

            // Agregar cliente
            if (ListBox1.SelectedItem != null)
            {
                if (int.TryParse(ListBox1.SelectedItem.Value, out int id_zona))
                {
                    using (SqlConnection sqlConectar = new SqlConnection(conectar))
                    {
                        SqlCommand comm = new SqlCommand("Sp_AgregarCliente", sqlConectar);
                        comm.CommandType = CommandType.StoredProcedure;

                        // Resto de los parámetros del stored procedure
                        comm.Parameters.Add("@Nombre", SqlDbType.VarChar, 50).Value = tbUsuario.Text;
                        comm.Parameters.Add("@Apellido", SqlDbType.VarChar, 50).Value = tbApellido.Text;
                        comm.Parameters.Add("@Dni", SqlDbType.VarChar, 8).Value = tbDocumento.Text;
                        comm.Parameters.Add("@Telefono", SqlDbType.VarChar, 10).Value = tbTelefono.Text;
                        comm.Parameters.Add("@Direccion", SqlDbType.VarChar, 50).Value = tbDireccion.Text;
                        comm.Parameters.Add("@id_zona", SqlDbType.Int).Value = id_zona; // Asignar el valor de id_zona
                        comm.Parameters.Add("@id_credencialCliente", SqlDbType.Int).Value = id_credencialCliente;
                        sqlConectar.Open();
                        comm.ExecuteNonQuery(); // Ejecutar el stored procedure
                    }

                    lblRegistrado.Text = "Usuario registrado exitosamente";
                    Response.Redirect("LogIn.aspx");
                }
                else
                {
                    // Manejar el caso en que la conversión no sea exitosa
                    lblError.Text = "El valor de id_zona no es válido.";
                }
            }
            else
            {
                // Manejar el caso en que no se haya seleccionado ningún elemento en ListBox1
                lblError.Text = "Por favor, selecciona una zona.";
            }
        }
    }
}