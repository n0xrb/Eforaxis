using Eforaxis.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Eforaxis.Controlador
{
    public partial class cambiarEstado : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                int idVenta = Int32.Parse(Request.QueryString["id"]);
                string estado = Request.QueryString["estado"];
                using (EforaxisEntities2 efo = new EforaxisEntities2())
                {

                    var query = (from v in efo.ventas
                                 where v.id_venta == idVenta
                                 select v).FirstOrDefault();
                    query.estado = estado;
                    efo.SaveChanges();
                }
            }
            catch
            {
                Console.WriteLine("Error al cambiar estado.");
            }
        }
    }
}