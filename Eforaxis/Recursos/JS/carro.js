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

cerrarSesion.addEventListener('click', async () => {
    localStorage.clear()
    sessionStorage.clear();
    location.reload();
});

async function totalPagar() {
    /**
     * Texto que indica el total a pagar
     * en la parte inferior izquierda
     * @type {HTMLElement} total
     */
    const total = document.querySelector('.total__valor--cantidad');

    /**
     *  Hace referencia a todos los productos
     * existentes en la tabla
     * @type {NodeListOf} productos
     */
    const productos = document.querySelectorAll('.productos__list')

    let auxiliar = 0;

    for (let i = 0; i < productos.length; i++) {
        /**
         * Almacena la cantidad de veces del producto,
         * esto relacionado al indice de acuerdo al bucle for
         * @type {NodeListOf} cantidad
         */
        const cantidad = document.querySelectorAll('#cantidad');

        /**
         * Almacena el precio de cada producto
         * para luego acceder a cada uno por indice,
         * este otorgado por el bucle for
         * @type {NodeListOf} precios
         */
        const precios = document.querySelectorAll('.productos__list--precio');
        console.log(parseInt(precios[i].textContent.replace("$", "")) * cantidad[i].value);
        auxiliar += cantidad[i].value * parseInt(precios[i].textContent.replace("$", ""))
    }
    total.innerText = `$${auxiliar} CLP`;
    if (total.innerText === "$0 CLP") {
        localStorage.setItem("carro", JSON.stringify([]))
        setTimeout(() => window.location = "../index.aspx", 4000);
    }

    /**
     *  Almacena cada uno de los IDS de los productos,
     * accediendo a cada uno por el indice otorgado
     * por el bucle for 
     * @type {NodeListOf} idsProductos
     */
    const idsProductos = document.querySelectorAll('.productos__list--id')
    const cantidadesProductos = document.querySelectorAll('#cantidad')

    /**
     * Almacena todos los ids que le van agregando
     * de acuerdo al indice que se le pasa al elemento
     * nodelist
     * @type {Array} arrayIDS
     */
    const arrayIDS = []
    for (let i = 0; i < idsProductos.length; i++) {
        arrayIDS.push(idsProductos[i].textContent)
    }

    const arrayCantidades = []
    for (let i = 0; i < cantidadesProductos.length; i++) {
        arrayCantidades.push(cantidadesProductos[i].value)
    }
    const pagar = total.textContent.replace("$", "").replace(' CLP', "");
    const ids = arrayIDS;
    const cantidades = arrayCantidades;

    sessionStorage.setItem("total_pagar", pagar);
    sessionStorage.setItem("ids_productos", ids);
    sessionStorage.setItem("cantidad_productos", cantidades);
}

/* Al cargar el DOM, hara la peticion
* para guardar el valor real a pagar, 
* cualquier diferencia entre el valor real a pagar
* y el valor declarado en el DOM, mostrara una alerta.
*/
document.addEventListener("DOMContentLoaded", () => {
    if (sessionStorage.getItem("logueado") == null) {
        window.location = "../Cliente/index.aspx";
    } else {
        const pCarro = JSON.parse(localStorage.getItem("carro"));
        const fragment = new DocumentFragment();
        pCarro.forEach(p => {
            const nombre = p[0];
            const img = p[1][0];
            const id = p[1][1];
            const cantidad = p[1][2];
            let precio = p[1][3];
            const descuento = p[1][4];
            if (descuento > 1) {
                precio = (precio - (precio * (descuento / 100)));
            }

            const producto = `
            <div class="productos__list--id">${id}</div>
            <div class="productos__list--nombre">${nombre}</div>
            <div class="productos__list--foto">
                <img id="producto__img" src="${img}">
            </div>
            <div class="productos__list--cantidad">
                <input id="cantidad" type="number" min="1" value="${cantidad}" inputmode="numeric" pattern="[0-9]*" disabled>
                    </div>
                <div class="productos__list--precio">$${precio} CLP</div>
                <div class="productos__list--editar">
                    <button class="btn btn--editar">Editar</button>
                    <button class="btn btn--eliminar">Eliminar</button>
                    <button class="btn btn--confimar hidden">Confirmar</button>
            </div>`
            const div = document.createElement('div');
            div.classList.add('productos__list');
            div.innerHTML = producto;
            fragment.appendChild(div);
        });
        const bodyList = document.querySelector('.productos__body');
        bodyList.appendChild(fragment);

        totalPagar()
        /**
         * Es un Nodelist que contiene todas las listas
         * de productos, para luego recorrerlas
         * @type {NodeListOf<Element>} listProductos
         */
        let listProductos = document.querySelectorAll('.productos__list');


        /**
         * Input number que almacena la cantidad de productos
         * que existen en el carro
         * @type {HTMLInputElement | Object} totalProductos
         */
        const totalProductos = document.getElementById('carrito');
        totalProductos.value = listProductos.length;

        for (let i = 0; i < listProductos.length; i++) {
            const tituloProducto = document.querySelectorAll('.productos__list--nombre');

            /**
             * Boton rojo relacionado a editar el input number (cantidad)
             * @type {HTMLElement} btnEditar
             */
            const btnEditar = listProductos[i].querySelector('.btn--editar');

            /**
             * Boton verde para confirmar los cambios en el input number (cantidad)
             * @type {HTMLElement} btnConfirmar
             */
            const btnConfirmar = listProductos[i].querySelector('.btn--confimar');

            /**
             * Boton boton rojo que elimina el producto del carro
             * @type {HTMLElement} btnConfirmar
             */
            const btnEliminar = listProductos[i].querySelector('.btn--eliminar');

            /**
             * Input que contiene la cantidad de 
             * veces que se quiere comprar el producto
             * @type {HTMLElement | Object} inputCantidad
             */
            const inputCantidad = listProductos[i].querySelector('input');

            let noAutorizado = false;
            inputCantidad.addEventListener('change', (e) => {
                const filtro = /[0-9]+/g;
                /* VALIDACION PARA EVITAR STRINGS*/
                const resultado = filtro.test(e.target.value);
                e.preventDefault();
                if (resultado != true) {
                    noAutorizado = true;
                    alert("No está permitido strings, ingresa números.")
                } else {
                    noAutorizado = false;
                }
            })

            btnEliminar.addEventListener('click', async () => {
                const pCarro = JSON.parse(localStorage.getItem("carro"));
                pCarro.forEach(p => {
                    if (p[0] == tituloProducto[i].textContent) {
                        pCarro.splice(i, 1);
                        localStorage.setItem("carro", JSON.stringify(pCarro));
                    }
                })
                listProductos[i].remove();
                totalPagar();
            })

            btnEditar.addEventListener('click', () => {
                btnEditar.style.display = 'none';
                btnEliminar.style.display = 'none';
                btnConfirmar.classList.toggle('hidden');
                inputCantidad.removeAttribute('disabled');
                inputCantidad.classList.add('editar');
            })

            btnConfirmar.addEventListener('click', async () => {
                if (noAutorizado === false) {
                    btnEliminar.classList.toggle("hidden");
                    btnConfirmar.classList.toggle('hidden');
                    btnEditar.style.display = 'block';
                    btnEliminar.style.display = 'block';
                    inputCantidad.setAttribute('disabled', '');
                    inputCantidad.classList.remove('editar');

                    /**
                     * Hace referencia al titulo del producto al mismo
                     * nivel del boton confirmar
                     * @type {NodeList} tituloProducto
                     */
                    const tituloProducto = document.querySelectorAll('.productos__list--nombre');

                    /**
                     * Cantidad de producto al mismo nivel
                     * que el boton confirmar
                     * @type {NodeListOf} cantidad
                     */
                    const cantidad = document.querySelectorAll('#cantidad');

                    const nombre = tituloProducto[i].textContent;
                    const cantidadCambiar = cantidad[i].value;

                    const pCarro = JSON.parse(localStorage.getItem("carro"));
                    pCarro.forEach(p => {
                        if (p[0] == nombre) {
                            p[1][2] = cantidadCambiar;
                            localStorage.setItem("carro", JSON.stringify(pCarro));
                        }
                    })
                    totalPagar();
                }
            });
        }
    }
});



/**
 * boton morado que invoca al formulario de pago
 * @type {HTMLElement} btnPagar
 */
const btnPagar = document.querySelector('.total__btn');
btnPagar.addEventListener('click', async() => {
    const total = document.querySelector('.total__valor--cantidad').textContent.replace("$", "").replace(' CLP', "");
    if (total == 0) {
        window.location = "../index.aspx";
    }
    else {
        if (total != sessionStorage.getItem("total_pagar")) {
           alert("Ingrese correctamente sus productos y vuelva a intentar.")
         } else {
            window.location = "./Checkout/index.aspx";
         }
    }
})