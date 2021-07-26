using Eforaxis.Models;
using System;
using System.Linq;
using System.Web.UI.WebControls;

namespace Eforaxis.Cliente.Home
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            using (EforaxisEntities2 efo = new EforaxisEntities2())
            {
                try
                {
                    var ventas = from v in efo.ventas
                                 where v.id_usuario == 1 
                                 orderby v.id_venta descending
                                 select v;
                    ventas.ToList();
                    string pedido = @"";
                    pedido += @"<h1>Últimos pedidos</h1>";
                    foreach (var venta in ventas)
                    {
                        string estadoFinal = @"";
                        if (venta.estado == "En Almacén") {
                            estadoFinal += @"<span class='span1'></span>
                              <div class='estado pedido__estado--almacen'> En Almacén</div>
                              <div class='pedido__estado--transito'> En Tránsito</div>
                              <div class='pedido__estado--entregado'> Entregado</div>";
                        } else if (venta.estado == "En Tránsito") {
                            estadoFinal += @"<span class='span2'></span>
                              <div class='estado pedido__estado--almacen'>En Almacén</div>
                              <div class='estado pedido__estado--transito'>En Tránsito</div>
                              <div class='pedido__estado--entregado'>Entregado</div>";
                        } else {
                            estadoFinal += @"<span class='span3'></span>
                              <div class='estado pedido__estado--almacen'>En Almacén</div>
                              <div class='estado pedido__estado--transito'>En Tránsito</div>
                              <div class='estado pedido__estado--entregado'>Entregado</div>";
                        }
                        string contenido = @"
                          <div class='pedido'>
                            <div class='pedido__estado'>
                              "+estadoFinal+@"
                            </div>
                            <div class='pedido__info'>
                              <div class='pedido__id'>
                                <h3>ID Pedido</h3>
                                <span>ID "  + venta.id_venta  + @"</span>
                              </div>
                              <div class='pedido__metodo'>
                                <h3>Método</h3>
                                <p>" + venta.metodo + @"</p>
                              </div>
                              <div class='pedido__productos'>
                                <h3>Productos</h3>
                                <span>IDS: " + venta.productos.ToString().Replace(","," - ") + @"</span>
                                <br>
                              </div>
                              <div class='pedido__total'>
                                <h3>Total</h3>
                                <span>$ " + venta.total.ToString().Replace(".000",  "") + @"</span>
                              </div>
                            </div>
                            <hr>
                          </div>";
                        pedido = pedido + contenido;
                    }
                    contenedor2.InnerHtml = pedido;
                }
                catch
                {
                    Console.WriteLine("Ha ocurrido un error.");
                }
             }
        }
    }
}