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

        //int id_credencialUsuario;
        protected void BtnRegistrar_Click(object sender, EventArgs e)
        {
            string conectar = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
            int id_credencialUsuario = 0;
            // Insertar credencial cliente
            using (SqlConnection sqlConectar = new SqlConnection(conectar))

            {
                SqlCommand cmmd = new SqlCommand("SP_CredencialUsuario", sqlConectar);
                cmmd.CommandType = CommandType.StoredProcedure;
                cmmd.Parameters.Add("@Mail", SqlDbType.VarChar, 50).Value = tbEmail.Text;
                cmmd.Parameters.Add("@Contrasenia", SqlDbType.VarChar, 50).Value = tbContrasenia.Text;
                cmmd.Parameters.Add("@Patron", SqlDbType.VarChar, 50).Value = patron;

                SqlParameter outputParameter = new SqlParameter();
                outputParameter.ParameterName = "@id_credencialUsuario";
                outputParameter.SqlDbType = SqlDbType.Int;
                outputParameter.Direction = ParameterDirection.Output;
                cmmd.Parameters.Add(outputParameter); //Esto también lo incluye el stored procedure 

                sqlConectar.Open();
                cmmd.ExecuteReader();
                if (outputParameter.Value != DBNull.Value)
                {
                    id_credencialUsuario = Convert.ToInt32(outputParameter.Value);
                }
            }



            if (ListBox1.SelectedItem != null)
            {
                if (int.TryParse(ListBox1.SelectedItem.Value, out int id_zona))
                {
                    string con = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;

                    using (SqlConnection sqlConectar = new SqlConnection(con))
                    {
                        //string sql = "INSERT INTO usuario (nombre, apellido, telefono, direccion, dni, id_zona, id_rol, id_credencialUsuario) " +
                        //"VALUES (@Nombre, @Apellido', @Telefono, @Direccion, @Dni, @Id_zona, @Id_rol, @Id_credencialUsuario)";

                        SqlCommand comm = new SqlCommand("Sp_AgregarUsuario", sqlConectar);
                        comm.CommandType = CommandType.StoredProcedure;

                        // Resto de los parámetros del stored procedure
                        comm.Parameters.Add("@Nombre", SqlDbType.VarChar, 50).Value = tbUsuario.Text;
                        comm.Parameters.Add("@Apellido", SqlDbType.VarChar, 50).Value = tbApellido.Text;
                        comm.Parameters.Add("@Telefono", SqlDbType.VarChar, 10).Value = tbTelefono.Text;
                        comm.Parameters.Add("@Direccion", SqlDbType.VarChar, 50).Value = tbDireccion.Text;
                        comm.Parameters.Add("@Dni", SqlDbType.VarChar, 8).Value = tbDocumento.Text;
                        comm.Parameters.Add("@Id_zona", SqlDbType.Int).Value = id_zona; // Asignar el valor de id_zona
                        comm.Parameters.Add("@Id_rol", SqlDbType.Int).Value = 3;
                        comm.Parameters.Add("@Id_credencialUsuario", SqlDbType.Int).Value = id_credencialUsuario;


                        sqlConectar.Open();
                        comm.ExecuteNonQuery();
                    }


                    Response.Redirect("Login.aspx"); // Redirigir a la página de inicio de sesión después del registro
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
