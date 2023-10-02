using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TP3HugoEmanuelOviedo
{
    public partial class RegistrosContables : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                // lo hice de esta forma 1 o 0 y agrego los items al dropdown con un listitem
                DropDownList2.Items.Add(new ListItem("1", "true"));
                DropDownList2.Items.Add(new ListItem("0", "false"));
            }
            
        }

        public void actualizar()
        {
            DropDownList3.DataBind();
            GridView1.DataBind();
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            if(!string.IsNullOrEmpty(TextBox1.Text) && DropDownList1.SelectedIndex != -1 && DropDownList2.SelectedIndex != -1)
            {
                try
                {
                    Crud.Insert();
                    actualizar();
                } catch (Exception ex)
                { 
                    info.Text = ex.Message; 
                }
         
            } else
            {
                info.Text = "Todos los campos tienen que estar completos";
            }

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if(DropDownList3.SelectedIndex != -1)
            {
            int insert = Crud.Delete();
            if (insert > 0)
            {
                info.Text = "El dato se eliminó correctamente";
                    actualizar();
            } else
            {
                info.Text = "El dato no se eliminó correctamente";
            }
            } else
            {
                info.Text = "Tenes que seleccionar una cuenta para eliminar";
            }

        }

        protected void Button3_Click(object sender, EventArgs e)
        {

         if(DropDownList3.SelectedIndex != -1)
            {
                if (!string.IsNullOrEmpty(TextBox1.Text) && DropDownList1.SelectedIndex != -1 && DropDownList2.SelectedIndex != -1)
                {
                    try
                    {
                        Crud.Update();
                        actualizar();
                    }
                    catch (Exception ex)
                    {
                        info.Text = ex.Message;
                    }

                }
                else
                {
                    info.Text = "Todos los campos tienen que estar completos";
                }
            } else
            {
                info.Text = "Tenes que seleccioanr un dato para modificar";
            }
       
        }

      } 

    }
