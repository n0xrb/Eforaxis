using Eforaxis.Models;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Eforaxis
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            using (EforaxisEntities2 efo = new EforaxisEntities2())
            {
                try
                {


                    string catRequest = Request.QueryString["categoria"];
                    if (catRequest != null)
                    {
                        var products = from p in efo.producto where p.categoria == catRequest select p;
                        products.ToList();
                        string cards = @"";
                        foreach (var product in products)
                        {
                            if (product.descuento > 1)
                            {
                                string contenido = @"<div class='card'>
                                    <div class='card__badge'>
                                        <div class='card__badge--text'>
                                            Descuento
                                        </div>
                                    </div>
                                    <img id='producto__img' src='./Recursos/Images/Productos/" + product.img + @"'>
                                    <input type='hidden' class='producto__id' value='" + product.id_producto + @"'>
                                    <h1 class='card__title'>" + product.nombre + @"</h1>
                                    <div class='card__info'>
                                        <h2 class='card__category'>" + product.categoria + @"</h2>
                                        <p class='card__price'>$" + product.precio + @" CLP</p>
                                        <label class='card__discount'>Descuento " + product.descuento + @"%</label>
                                        <input type='hidden' id='descuento' value='" + product.descuento + @"'>
                                        <label class='card__stock'>Stock " + product.stock + @"</label>
                                    </div>
                                    <div class='card__item'>
                                        <div class='card__input'>
                                            <a class='resta bx bx-down-arrow'></a>
                                            <input class='precio' type='number' min='1' name='precio' step='1' value='1' disabled>
                                            <a class='suma bx bx-up-arrow'></a>
                                        </div>
                                        <div class='card__addCart'>
                                            <span class='bx bx-cart-alt'></span><span> Agregar</span>
                                        </div>
                                    </div>
                                </div>";
                                cards = cards + contenido;
                            }
                            else
                            {
                                string contenido = @"<div class='card'>
                                    <img id='producto__img' src='./Recursos/Images/Productos/" + product.img + @"'>
                                    <input type='hidden' class='producto__id' value='" + product.id_producto + @"'>
                                    <h1 class='card__title'>" + product.nombre + @"</h1>
                                    <div class='card__info'>
                                        <h2 class='card__category'>" + product.categoria + @"</h2>
                                        <p class='card__price'>$" + product.precio + @" CLP</p>
                                        <input type='hidden' id='descuento' value='" + product.descuento + @"'>
                                        <label class='card__stock'>Stock " + product.stock + @"</label>
                                    </div>
                                    <div class='card__item'>
                                        <div class='card__input'>
                                            <a class='resta bx bx-down-arrow'></a>
                                            <input class='precio' type='number' min='1' name='precio' step='1' value='1' disabled>
                                            <a class='suma bx bx-up-arrow'></a>
                                        </div>
                                        <div class='card__addCart'>
                                            <span class='bx bx-cart-alt'></span><span> Agregar</span>
                                        </div>
                                    </div>
                                    </div>";
                                cards = cards + contenido;
                            }
                        }
                        contenedor.InnerHtml = cards;
                    }
                    else
                    {
                        IOrderedQueryable<producto> products = from p in efo.producto
                                                        orderby p.id_producto descending
                                                        select p;
                        List<producto> lista = products.ToList();
                        string cards = @"";
                        for (int i = 0; i < lista.Count; i++)
                        {
                            if (lista[i].descuento > 1)
                            {
                                string contenido = @"<div class='card'>
                                    <div class='card__badge'>
                                        <div class='card__badge--text'>
                                            Descuento
                                        </div>
                                    </div>
                                    <img id='producto__img' src='./Recursos/Images/Productos/" + lista[i].img + @"'>
                                    <input type='hidden' class='producto__id' value='" + lista[i].id_producto + @"'>
                                    <h1 class='card__title'>" + lista[i].nombre + @"</h1>
                                    <div class='card__info'>
                                        <h2 class='card__category'>" + lista[i].categoria + @"</h2>
                                        <p class='card__price'>$" + lista[i].precio + @" CLP</p>
                                        <label class='card__discount'>Descuento " + lista[i].descuento + @"%</label>
                                        <input type='hidden' id='descuento' value='" + lista[i].descuento + @"'>
                                        <label class='card__stock'>Stock " + lista[i].stock + @"</label>
                                    </div>
                                    <div class='card__item'>
                                        <div class='card__input'>
                                            <a class='resta bx bx-down-arrow'></a>
                                            <input class='precio' type='number' min='1' name='precio' step='1' value='1' disabled>
                                            <a class='suma bx bx-up-arrow'></a>
                                        </div>
                                        <div class='card__addCart'>
                                            <span class='bx bx-cart-alt'></span><span> Agregar</span>
                                        </div>
                                    </div>
                                </div>";
                                cards = cards + contenido;
                            }
                            else
                            {
                                string contenido = @"<div class='card'>
                                <img id='producto__img' src='./Recursos/Images/Productos/" + lista[i].img + @"'>
                                <input type='hidden' class='producto__id' value='" + lista[i].id_producto + @"'>
                                <h1 class='card__title'>" + lista[i].nombre + @"</h1>
                                <div class='card__info'>
                                    <h2 class='card__category'>" + lista[i].categoria + @"</h2>
                                    <p class='card__price'>$" + lista[i].precio + @" CLP</p>
                                    <input type='hidden' id='descuento' value='" + lista[i].descuento + @"'>
                                    <label class='card__stock'>Stock " + lista[i].stock + @"</label>
                                </div>
                                <div class='card__item'>
                                    <div class='card__input'>
                                        <a class='resta bx bx-down-arrow'></a>
                                        <input class='precio' type='number' min='1' name='precio' step='1' value='1' disabled>
                                        <a class='suma bx bx-up-arrow'></a>
                                    </div>
                                    <div class='card__addCart'>
                                        <span class='bx bx-cart-alt'></span><span> Agregar</span>
                                    </div>
                                </div>
                            </div>";
                                cards = cards + contenido;
                            }
                        }
                        contenedor.InnerHtml = cards;
                    }
                }
                catch
                {
                    Console.WriteLine("Ha ocurrido un error.");
                }
            }
        }  
    }
}