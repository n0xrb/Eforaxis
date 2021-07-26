using Eforaxis.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Eforaxis.Admin.Panel.Metodos
{
    public partial class modificar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void btnSubmit_modificar_click(object sender, EventArgs e)
        {
            try
            {
                if (nombre_modificar.Text != null && cantidad_modificar.Text != null && categoria_modificar.Text != null
                    && precio_modificar.Text != null && descuento_modificar.Text != null && imagen_agregar.FileName != null && id_modificar.Text != null)
                {
                    string nombreImagen = imagen_agregar.FileName;
                    string carpeta = Server.MapPath("~/Recursos/Images/Productos");

                    string rutaFinal = Path.Combine(carpeta, nombreImagen);
                    imagen_agregar.PostedFile.SaveAs(rutaFinal);

                    int idMod = Int32.Parse(id_modificar.Text);
                    using (EforaxisEntities2 efo = new EforaxisEntities2())
                    {
                        var query = (from d in efo.producto
                                     where d.id_producto == idMod
                                     select d).FirstOrDefault();

                        query.nombre = nombre_modificar.Text;
                        query.stock = Int32.Parse(cantidad_modificar.Text);
                        query.categoria = categoria_modificar.Text;
                        query.precio = Convert.ToDecimal(precio_modificar.Text);
                        query.descuento = Int32.Parse(descuento_modificar.Text);
                        query.img = nombreImagen;

                        efo.SaveChanges();
                    }
                }
                else
                {
                    Response.Write("COMPLETAR FORMULARIO");
                }
            }
            catch
            {
                Console.WriteLine("Error al modificar producto.");
            }

        }
    }
}