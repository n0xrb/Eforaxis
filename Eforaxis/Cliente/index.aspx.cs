using Eforaxis.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;

namespace Eforaxis.Cliente
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {


                if (correo.Text.Length > 1 && contrasena.Text.Length > 1)
                {

                    using (EforaxisEntities2 efo = new EforaxisEntities2())
                    {
                        IQueryable<usuario> query = from us in efo.usuario
                                                    where us.email == correo.Text
                                                    && us.pass == contrasena.Text
                                                    select us;

                        usuario[] usuariosArray = query.ToArray();
                        int id = 0;
                        string nombre = "";

                        if (usuariosArray.Count() > 0)
                        {
                            foreach (usuario usuario in usuariosArray)
                            {
                                id = usuario.id_usuario;
                                nombre = usuario.nombre;
                            }
                            Response.Write("<script> sessionStorage.setItem('logueado','True'); sessionStorage.setItem('id_usuario', '" + id + "');sessionStorage.setItem('nombre_usuario', '" + nombre + "'); location.href = './Home/index.aspx'; </script>");
                        }
                    }
                }
                else
                {
                    Response.Write("COMPLETAR FORMULARIO");
                }
            }
            catch
            {
                Console.WriteLine("Error al iniciar sesión.");
            }
        }
    }
}