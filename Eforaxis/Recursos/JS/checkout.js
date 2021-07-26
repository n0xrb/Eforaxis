document.addEventListener("DOMContentLoaded", () => {
    if (sessionStorage.getItem("logueado") == null) {
        window.location = "../../Cliente/index.aspx";
    } else {
        document.querySelector("#idUsuario").value = sessionStorage.getItem("id_usuario");
        document.querySelector("#idProductos").value = sessionStorage.getItem("ids_productos");
        document.querySelector("#cantidades").value = sessionStorage.getItem("cantidad_productos");
        document.querySelector("#total").value = sessionStorage.getItem("total_pagar");
        document.querySelector('.contenedor__valor--cantidad').textContent = `$${sessionStorage.getItem("total_pagar")} CLP`;
    }
})

/**
 * Boton hamburguesa
 * @type {HTMLElement}  toggle boton
 */
const toggle = document.getElementById('toggle');

/**
 * Almacena el menu del header
 * @type {HTMLElement}  menu    nav desplegable
 */
const menu = document.querySelector('.nav__menu');

toggle.addEventListener('click', () => {
    menu.classList.toggle('hidden');
});

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
 * Almacena las opciones de pago
 * @type {HTMLElement} tipoPago
 */
const tipoPago = document.querySelectorAll(".metodo");

/**
 * Almacena el tipo de pago 
 * al cambiar la opcion con los botones de tipo
 * @type {HTMLElement} metodoSelecionado
 */
const metodoSelecionado = document.querySelector('.metodo__selecionado');

for (let i = 0; i < tipoPago.length; i++) {
    tipoPago[i].addEventListener("click", () => {
        metodoSelecionado.innerText = tipoPago[i].textContent;
        const metodo = document.getElementById("metodo");
        metodo.value = tipoPago[i].textContent;

    });
}

///**
// * Alamacena el boton principal para enviar el pedido
// * realiza las validaciones pertinentes para evitar 
// * errores de tipeo
// * @type {HTMLElement} btnPagar
// */
//const btnPagar = document.querySelector('#btnPagar');

//btnPagar.addEventListener('click', async(e) => {
//    e.preventDefault();

//    const ids = document.getElementById('idProductos');
//    const cantidades = document.getElementById('cantidades');

//    /**
//     * @type {Array} result
//     */
//    let result = ids.value.toString().split(' ');
//    result.pop();
//    result = result.toString().replace(",", " ");

//    /**
//     * @type {Array} cantidades
//     */
//    let result2 = cantidades.value.toString().split(' ');
//    result2.pop();
//    result2 = result2.toString().replace(",", " ");



//    const metodoSelecionado = document.querySelector('.metodo__selecionado').textContent;
//    const alerta = document.querySelector('.contenedor--2');
//    const cc = document.getElementById('cc');
//    const cvv = document.getElementById('cvv');
//    let mes = document.getElementById('mes');
//    let ano = document.getElementById('ano');
//    mes = mes.options[mes.selectedIndex].text;
//    ano = ano.options[ano.selectedIndex].text;

//    if (cc.value.length < 1 || cvv.value.length < 1 || metodoSelecionado === "Ninguno") {
//        alerta.classList.toggle('mostrar');
//    } else {
//        document.getElementById('formulario').submit();
//        //const response = await fetch(`../../CTR/CTL/CProducto.php?tipo=updateStock&idsProductos=${result}&cantidades=${result2}`, {
//        //    method: 'GET'
//        //})
//        //if (response.ok) {
//        //    const resultado = await response.text();
//        //    document.getElementById('formulario').submit();
//        //}
//    }

//    const btnCerrar = document.querySelector('.alerta__cerrar');
//    btnCerrar.addEventListener('click', () => {
//        alerta.classList.remove('mostrar');
//    });
//});