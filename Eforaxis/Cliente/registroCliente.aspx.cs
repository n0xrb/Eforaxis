using Eforaxis.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Eforaxis.Cliente
{
    public partial class resgistroCliente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {


                if (nombre.Text.Length > 1 && correo.Text.Length > 1 && contrasena.Text.Length > 1)
                {
                    using (EforaxisEntities2 efo = new EforaxisEntities2())
                    {
                        usuario usr = new usuario
                        {
                            nombre = nombre.Text,
                            email = correo.Text,
                            pass = contrasena.Text,
                            telefono = Int32.Parse(telefono.Text)
                        };
                        efo.usuario.Add(usr);
                        efo.SaveChanges();
                    }
                    Response.Redirect("index.aspx");
                }
                else
                {
                    Response.Write("COMPLETAR FORMULARIO");
                }
            }
            catch
            {
                Console.WriteLine("Error al registrar.");
            }
        }
    }
}