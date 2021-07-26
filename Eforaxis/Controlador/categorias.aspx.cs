using System;
using Eforaxis.Models;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Script.Serialization;

namespace Eforaxis
{
    public partial class categorias : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                using (EforaxisEntities2 efo = new EforaxisEntities2())
                {

                    List<string> Categorias = new List<string>();
                    var cats = from c in efo.categorias select c;
                    cats.ToList().ForEach(s => Categorias.Add(s.nombre));
                    JavaScriptSerializer js = new JavaScriptSerializer();
                    string mensaje = js.Serialize(Categorias);
                    Response.Write(mensaje);
                    Response.Flush();
                    Response.End();
                }
            }
            catch
            {
                Console.WriteLine("Error al generar categorias.");
            }
        }
    }
}