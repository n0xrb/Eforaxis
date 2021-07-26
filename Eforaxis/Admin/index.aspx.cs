using Eforaxis.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Eforaxis.Admin
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (correo.Text.Length > 1 && contrasena.Text.Length > 1)
            {

                using (EforaxisEntities2 efo = new EforaxisEntities2())
                {
                    var administradores = from adm in efo.administradores
                                  where adm.nombre == correo.Text &&
                                  adm.pass == contrasena.Text
                                  select adm;
                    if (administradores != null)
                    {
                        Response.Redirect("./Panel/index.aspx");
                    }
                    else
                    {
                        Response.Write("No existe el usuario");
                    }
                }
            }
            else
            {
                Response.Write("COMPLETAR FORMULARIO");
            }
        }
    }
}