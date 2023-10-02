using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TP3HugoEmanuelOviedo
{
    public partial class Cuentas : System.Web.UI.Page
    {
        // hice las cosas con el gridview porque me resulta mas comodo, no toqué mucho el tema del grid solo la parte de mostrar datos
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        public void actualizar()
        {
            GridView1.DataBind();
            DropDownList1.DataBind();
        }
    protected void Button1_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(TextBox1.Text))
            {
                try
                {
                    int insert = Crud.Insert();
                    if (insert > 0)
                        info.Text = "Se insertó un dato correctamente";
                    actualizar();
                } catch (Exception ex)
                {
                    info.Text = ex.Message;
                }

            } else
            {
                info.Text = "No se pueden ingresar datos en blanco";
            }

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            try
            {
     
            if (DropDownList1.SelectedIndex != -1)
            {
                    // si se intenta borrar y hay un registro contable con el dato asignado que se quiere borrar no se va a poder borrar
                int valor = Crud.Delete();
            if (valor > 0)  info.Text = "se elimino un dato";  
            else  
                info.Text = "No se elimino ningun dato";
            actualizar();
            }
            else
            {
                info.Text = "Tenes que seleccionar un dato para eliminar";
            }
            }
            catch (Exception ex)
            {
                info.Text = ex.Message;
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(TextBox1.Text))
            {
                int valor = Crud.Update();
                if (valor > 0) info.Text = "Se actualizó correctamente";
                else
                    info.Text = "No se actualizó ningun dato";
                actualizar();
            }
            else
            {
                info.Text = "No se pueden actualizar datos en blanco";
            }
        }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            TextBox1.Text = DropDownList1.SelectedItem.Text;
        }
    }
}