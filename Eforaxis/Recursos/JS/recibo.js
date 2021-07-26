document.addEventListener("DOMContentLoaded", () => {
    if (sessionStorage.getItem("logueado") == null) {
        window.location = "../../Cliente/index.aspx";
    }
    else {
        document.querySelector('.contenedor__valor--cantidad').textContent = `$${sessionStorage.getItem("total_pagar")} CLP`;
        localStorage.setItem("carro", JSON.stringify([]))
    }
})

/**
 * Almacena el menu del header
 * @type {HTMLElement}  menu    nav desplegable
 */
const menu = document.querySelector('.nav__menu');

/**
 * Boton hamburguesa
 * @type {HTMLElement}  toggle 
 */
const toggle = document.getElementById('toggle');
toggle.addEventListener('click', () => {
    menu.classList.toggle('hidden');
})

/**
 * Boton Cerrar session mediante peticion
 * @type {HTMLElement}  cerrarSesion 
 */
const cerrarSesion = document.querySelector('.nav__logout');
cerrarSesion.addEventListener('click', async() => {
    localStorage.clear()
    sessionStorage.clear();
    location.reload();
})

/**
 * Boton que redirige al carro de compras
 * @type {HTMLElement} carro
 */
const carro = document.querySelector('.nav__carrito');
carro.addEventListener('click', () => window.location = '../index.aspx');

/**
 * Boton que redirige a los pedidos del usuario
 * @type {HTMLElement} btnHome
 */
const btnHome = document.getElementById('home');
btnHome.addEventListener('click', () => window.location = '../../cliente/home/index.aspx')