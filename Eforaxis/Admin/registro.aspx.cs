using Eforaxis.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Eforaxis.Admin
{
    public partial class registro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            using (EforaxisEntities efo = new EforaxisEntities())
            {
                administradores adm = new administradores
                {
                    nombre = nombre.Text,
                    email = correo.Text,
                    pass = contrasena.Text
                }
                efo.adm.Add(adm);
                efo.SaveChange();
            }
        }
    }
}