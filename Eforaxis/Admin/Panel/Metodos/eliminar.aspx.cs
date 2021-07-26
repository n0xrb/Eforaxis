using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Eforaxis.Models;

namespace Eforaxis.Admin.Panel.Metodos
{
    public partial class eliminar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }
        protected void btnSubmit_borrar_click(object sender, EventArgs e)
        {
            try
            {
                int idMod = Int32.Parse(id_borrar.Text);
                using (EforaxisEntities2 efo = new EforaxisEntities2())
                {
                    producto borrar = efo.producto.Find(idMod);
                    efo.producto.Remove(borrar);
                    efo.SaveChanges();
                }
            }
            catch {
                Console.WriteLine("Error al eliminar.");
            }
            
        }
    }
}