using Eforaxis.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Eforaxis.Carro.Checkout
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSubmit_click(object sender, EventArgs e)
        {
            try
            {
                using (EforaxisEntities2 efo = new EforaxisEntities2())
                {
                    ventas vn = new ventas
                    {
                        estado = "En Almacén",
                        productos = idProductos.Value,
                        total = Convert.ToDecimal(total.Value),
                        id_usuario = Int32.Parse(idUsuario.Value),
                        metodo = metodo.Value
                    };
                    efo.ventas.Add(vn);
                    efo.SaveChanges();
                }
                Response.Redirect("recibo.aspx");
            }
            catch
            {
                Console.WriteLine("Error al guardar venta.");
            }
        }
    }
}