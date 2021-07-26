using Eforaxis.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Eforaxis.Admin.Panel
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            string cards = @"";
            cards += @"<thead>
                        <tr>
                            <th>ID Venta</th>
                            <th>Estado</th>
                            <th>Productos</th>
                            <th>Total</th>
                            <th>Usuario</th>
                            <th>Metodo</th>
                        </tr>
                    </thead>
                    <tbody>";

            using (EforaxisEntities2 efo = new EforaxisEntities2())
            {
                IQueryable<ventas> vn = from v in efo.ventas
                                        select v;

                List<ventas> lista = vn.ToList();
                for (int i = 0; i < lista.Count(); i++)
                {
                    string contenido = @"
                        <tr>
                            <td>" + lista[i].id_venta + @"</td>
                            <td>
                                <p>" + lista[i].estado + @"</p>

                                <button class='btn btn--modificar'>Modificar</button>
                                <div class='estado__pedido'>
                                    <div class='opcion hidden'>
                                        <div class='op opcion__transito'>
                                        En Tránsito
                                        </div>
                                        <div class='op opcion__entregado'>
                                        Entregado
                                        </div>
                                        <div class='op opcion__almacen'>
                                        En Almacén
                                        </div>
                                        <button class='btn btn--confirmar hidden'>Confirmar</button>
                                    </div>
                                </div>
                            </td>
                            <td> IDS: " + lista[i].productos.ToString().Replace(",", " - ") + @"<br></td>
                            <td> "+lista[i].total.ToString().Replace(".000", "") + @"</td>
                            <td>" + lista[i].id_usuario + @"</td>
                            <td>" + lista[i].metodo + @"</td>
                        </tr>";
                    cards = cards + contenido;
                }
                cards = cards + @"</tbody>";
                Response.Write("<script> function ventas() { return `" + cards + "`;} </script>");
            }
        }
        protected void btnSubmit_agregar_click(object sender, EventArgs e)
        {

            string nombreImagen = imagen_agregar.FileName;
            string carpeta = Server.MapPath("~/Recursos/Images/Productos");

            string rutaFinal = Path.Combine(carpeta, nombreImagen);
            imagen_agregar.PostedFile.SaveAs(rutaFinal);
            try
            {
                using (EforaxisEntities2 efo = new EforaxisEntities2())
                {

                    producto pro = new producto
                    {
                        nombre = nombre_agregar.Text,
                        stock = Int32.Parse(cantidad_agregar.Text),
                        categoria = categoria_agregar.Text,
                        precio = Convert.ToDecimal(precio_agregar.Text),
                        descuento = Int32.Parse(descuento_agregar.Text),
                        img = nombreImagen
                    };
                    efo.producto.Add(pro);
                    efo.SaveChanges();
                }
            }
            catch
            {
                Console.WriteLine("Error al guardar producto.");
            }
        }
    }
}