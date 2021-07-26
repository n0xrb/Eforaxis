document.addEventListener("DOMContentLoaded", () => {
    if (sessionStorage.getItem("logueado") == null) {
        window.location = "../index.aspx";
    } else {
        document.querySelector("#idUsuario").value = sessionStorage.getItem("id_usuario");
    }
})
/**
 * Declara e instancia el boton toggle ubicado en el header
 * @type {HTMLElement}  toggle boton
 */
const toggle = document.getElementById('toggle');

/**
 * Declara e instancia el menu nav que esta ubicado en el header
 * @type {HTMLElement}  menu    nav desplegable
 */
const menu = document.querySelector('.nav__menu');

toggle.addEventListener('click', () => {
    menu.classList.toggle('hidden');
});

const cerrarSesion = document.querySelector('.nav__logout');

cerrarSesion.addEventListener('click', async() => {
    localStorage.clear()
    sessionStorage.clear();
    location.reload();
})
const carro = document.querySelector('.nav__carrito');
carro.addEventListener('click', () => window.location = '../../carro/index.aspx');