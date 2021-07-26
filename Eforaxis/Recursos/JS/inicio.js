function guardarCarro(producto) {
    if (localStorage.getItem("carro") == null) {
        let carro = new Array();
        carro.push(producto)
        localStorage.setItem("carro", JSON.stringify(carro));
    }
    else {
        let carro = JSON.parse(localStorage.getItem("carro"));
        carro.push(producto)
        localStorage.setItem("carro", JSON.stringify(carro));
    }
}

/**
 * Almacena el descuento de cada uno de los productos
 * @type {NodeList} descProducto
 */
;
const descProducto = document.querySelectorAll("#descuento");

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
const carrito = document.querySelector(".nav__carrito");
carrito.addEventListener('click', () => {
    window.location = "./Carro/index.aspx";
})

const cerrarSesion = document.querySelector('.nav__logout');
cerrarSesion.addEventListener('click', async () => {
    localStorage.clear()
    sessionStorage.clear();
    location.reload();
})

/** 
 * Nodolist que contiene todos los botones "suma"
 * para luego recorrer a cada uno de ellos
 * @type {NodeList} suma
 */
const suma = document.querySelectorAll('.suma');

/** 
 * Nodolist que contiene todos los botones "resta"
 * para luego recorrer a cada uno de ellos
 * @type {NodeList} resta
 */
const resta = document.querySelectorAll('.resta');

for (let i = 0; i < resta.length; i++) {
    resta[i].addEventListener('click', function () {
        /* dependiendo de si el valor es mayor a 1, decrementa */
        if (this.nextElementSibling.value > 1) {
            this.nextElementSibling.value--
        }
    });
};
for (let i = 0; i < suma.length; i++) {
    suma[i].addEventListener('click', function () {
        /* dependiendo de si el valor es mayor a 1, incrementa */
        if (this.previousElementSibling.value >= 1) {
            this.previousElementSibling.value++
        }
    });
};
/** 
 * Todos los botones "Agregar" en el card de productos
 * @type {NodeList} agregarCarro
 */
const agregarCarro = document.querySelectorAll('.card__addCart');

/** 
 * Almacena todos los nombres de los productos
 * @type {NodeList} tituloProducto
 */
const tituloProducto = document.querySelectorAll(".card__title");

/** 
 * Almacena la cantidad de cada producto
 * @type {NodeList} cantidadProducto
 */
const cantidadProducto = document.querySelectorAll(".precio");

/** 
 * Almacena el precio de cada uno de los productos
 * @type {NodeList} precioProducto
 */
const precioProducto = document.querySelectorAll(".card__price")


/** 
 * Almacena todas las imagenes de los productos
 * @type {NodeList} imgProducto
 */
const imgProducto = document.querySelectorAll("#producto__img");

/** 
 * Almacena todas los ids de los productos
 * @type {NodeList} idProducto
 */
const idProducto = document.querySelectorAll(".producto__id");

/** 
 * Valor total de los productos agregados al carro de compras
 * @type {HTMLElement | Object} totalCarro
 */
const totalCarro = document.getElementById('carrito');
document.addEventListener("DOMContentLoaded", async () => {
    if (sessionStorage.getItem("id_usuario") == null) {
        const misPedidos = document.querySelector(".nav__menu li:nth-of-type(2)");
        misPedidos.classList.toggle("oculto");
        const cerrar = document.querySelector(".nav__menu li:nth-of-type(3)");
        cerrar.classList.toggle("oculto");
    }
    if (localStorage.getItem("carro") == null) {
        totalCarro.value = 0;
    }
    else {
        totalCarro.value = JSON.parse(localStorage.getItem("carro")).length
    }

    const response2 = await fetch('./Controlador/categorias.aspx', {
        method: 'GET',
        headers: { 'Accept': 'application/json' },
    })
    if (response2.ok) {
        const resultado2 = await response2.json();
        const filtros = document.querySelector('.filtros');
        fragment = new DocumentFragment();
        resultado2.forEach(element => {
            const button = document.createElement('button');
            button.classList.add('filtros__categoria');
            button.innerText = element;
            fragment.appendChild(button);

            button.addEventListener('click', () => {
                window.location = `index.aspx?categoria=${button.textContent}`
            })
        });
        filtros.appendChild(fragment);
    }
});

for (let i = 0; i < agregarCarro.length; i++) {
    agregarCarro[i].addEventListener('click', async function () {

        const nombre = tituloProducto[i].textContent;
        const img = imgProducto[i].src;
        const id = idProducto[i].value;
        const cantidad = cantidadProducto[i].value;
        const precio = precioProducto[i].textContent.replace(" CLP", "").replace("$", "").replace(".", "");
        const descuento = descProducto[i].value;

        let producto = [nombre, [img, id, cantidad, precio, descuento]];
        guardarCarro(producto);
        totalCarro.value = JSON.parse(localStorage.getItem("carro")).length
    })
}
/**
 * @type {Array<HTMLElement>} productos
 */
const productos = Array.from(document.querySelectorAll('.card'));

/**
 * Establece la pagina inicial que tomara la paginacion
 * @type {number} paginaInicio
 */
let paginaInicio = 1;

/**
 * Establece cuantos productos seran mostrados en la pagina
 * @type {number} totalProductos
 */
const totalProductos = 20;

/**
 * Contenedor principal que almacenara todos los productos
 * a mostrar
 * @type {HTMLElement} contenedor
 */
const contenedor = document.getElementById('contenedor');

/**
 * Establece la pagionacion para posteriormente
 * agregar todas las paginas necesarias
 * @type {HTMLElement} paginacion
 */
const paginacion = document.getElementById('paginacion');


/**
 * En base a todos los datos entregados por parametro
 * automaticamente crea la paginacion, con sus
 * respectivas paginas
 * @function agregarPaginacion
 * @param {Array<HTMLElement>} productos    Productos totales extraidos desde la base de datos
 * @param {HTMLElement} contenedor          Contenedor que almacenara todos los productos a mostrar
 * @param {number} totalProductos           Cantidad de productos a mostrar por cada pagina en el contenedor
 */
function agregarPaginacion(productos, contenedor, totalProductos) {
    contenedor.innerHTML = "";
    const paginasTotales = Math.ceil(productos.length / totalProductos);
    const fragment = new DocumentFragment();
    for (let i = 1; i < paginasTotales + 1; i++) {
        let btn = botonesPaginacion(i, productos);
        fragment.appendChild(btn)
    }
    /**
     * Boton que 
     * @type {HTMLElement} btnSiguiente
     */
    const btnSiguiente = document.createElement('a');
    btnSiguiente.classList.add('btnSiguiente');
    btnSiguiente.innerText = "Siguiente";
    contenedor.appendChild(fragment);
    contenedor.appendChild(btnSiguiente);
    btnSiguiente.addEventListener('click', function () {
        // const cards = document.querySelectorAll('.card');
        // for (let i = 0; i < cards.length; i++) {
        //     cards[i].removeAttribute('style');
        // }
        /**
         * Boton que indica la posicion actual de pagina
         * @type {HTMLElement | object} button
         */
        const btnActual = document.querySelector('.indice button.active');
        btnActual.nextElementSibling.click();
    });
}

/**
 * Retonar un boton el cual será añadido en la paginación
 * además de activar un evento listener de tipo click 
 * con el fin de mostrar los productos correspondientes en el Contenedor
 * @function botonesPaginacion
 * @param {number} numeroPagina 
 * @param {Array<HTMLElement>} productos 
 * @return {button}
 */
function botonesPaginacion(numeroPagina, productos) {
    /**
     * Boton que indica en numero de pagina a navegar
     * @type {HTMLButtonElement | Object} button
     */
    const button = document.createElement('button');
    button.innerText = numeroPagina;

    if (paginaInicio == numeroPagina) button.classList.add('active');

    button.addEventListener('click', function () {
        paginaInicio = numeroPagina;
        mostrarPagina(productos, contenedor, totalProductos, paginaInicio);

        /**
         * Boton que indica la posicion actual de pagina
         * @type {HTMLElement | object} button
         */
        const btnActual = document.querySelector('.indice button.active');
        btnActual.classList.remove('active');
        button.classList.add('active');

        /**
         * Sub indice en la esquina superior izquierda
         * @type {HTMLElement | Object} indice
         */
        const indice = document.querySelector('.indice__sub');
        indice.innerText = `Inicio / Pagina ${paginaInicio}`;
    });

    return button;
}
/**
 * Calculando los productos mostrados respecto al limite total de Productos
 * en el contenedor este se va diviendo en sus respectivas páginas
 * @param {Array<HTMLElement>} productos 
 * @param {HTMLElement} contenedor 
 * @param {number} totalProductos 
 * @param {number} numeroPagina 
 */
function mostrarPagina(productos, contenedor, totalProductos, numeroPagina) {
    contenedor.innerHTML = "";
    numeroPagina--;
    const inicio = totalProductos * numeroPagina;
    const final = inicio + totalProductos;
    const mostrarProductos = productos.slice(inicio, final);

    const fragment = new DocumentFragment()
    for (let i = 0; i < mostrarProductos.length; i++) {
        fragment.appendChild(mostrarProductos[i]);
    }
    contenedor.appendChild(fragment);
}
agregarPaginacion(productos, paginacion, totalProductos);
mostrarPagina(productos, contenedor, totalProductos, paginaInicio);