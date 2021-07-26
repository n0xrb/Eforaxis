try {
    const tabla = document.querySelector('#tabla');
    tabla.innerHTML = ventas();
}
catch {
}

/**
 * Función que permite añadir alerta en el DOM
 * @function alerta             Inserta en el DOM una alerta con las propiedades deseadas
 * @param {string} mensaje      Mensaje personalizado de acuerdo a lo establecido por parametro
 * @param {string} tipo         Tipo de mensaje, este puede ser "correcto", quiere decir fondo verde
 *                                 o "error" con fondo rojo
 * @return {void}     Oculta el contenedor despues de 3 segundos al final.
 */

function alerta(mensaje = "No definido", tipo = "Error") {
    /**
     * Contenedor principal que almacena a los mensajes de alerta
     * @type {HTMLElement} contenedor
     */
    const contenedor = document.querySelector(`.card__${tipo}`);

    /**
     * Alertas dentro del contenedor, por defecto con display none
     * @type {HTMLElement} alertError
     * 
     */
    const alertError = document.querySelector(`.card__mensaje--${tipo}`);
    contenedor.classList.toggle("none");
    alertError.innerHTML = mensaje;
    setTimeout(() => contenedor.classList.toggle("none"), 3000);
}


/** 
 * Hace referencia al boton derecho sumar, que esta al mismo nivel del input number
 * @type {NodeList} suma
 */
const suma = document.querySelectorAll('.suma');

/** 
 * Hace referencia al boton izquierdo restar, que esta al mismo nivel del input number
 * @type {NodeList} suma
 */
const resta = document.querySelectorAll('.resta');


for (let i = 0; i < resta.length; i++) {
    resta[i].addEventListener('click', function() {
        /* dependiendo de si el valor es mayor a 1, decrementa */
        if (this.nextElementSibling.value > 1) {
            this.nextElementSibling.value--
        }
    });
};
for (let i = 0; i < suma.length; i++) {
    suma[i].addEventListener('click', function() {
        /* dependiendo de si el valor es mayor a 1, incrementa */
        if (this.previousElementSibling.value >= 1) {
            this.previousElementSibling.value++
        }
    });
};


const modEstado = document.querySelectorAll('.btn--modificar');
const opcion = document.querySelectorAll('.opcion');
const ids = document.querySelectorAll('.sorting_1');

for (let i = 0; i < modEstado.length; i++) {
    const id = modEstado[i].parentElement.previousElementSibling.textContent;
    modEstado[i].addEventListener('click', () => {
        opcion[i].classList.toggle('hidden');
        const op = opcion[i].querySelectorAll('.op');
        const estado = modEstado[i].previousElementSibling;
        const confirmar = opcion[i].querySelector('.btn--confirmar');
        let respuesta = ""
        for (let i = 0; i < op.length; i++) {
            op[i].addEventListener('click', () => {
                respuesta = op[i].textContent.trim();
                confirmar.classList.toggle('hidden');
            })
        }
        confirmar.addEventListener('click', async () => {
            estado.innerHTML = respuesta;
            fetch(`../../Controlador/cambiarestado.aspx?id=${id}&estado=${respuesta}`, {
                method: 'post'
            })
        });
    })
}

const cerrarSesion = document.querySelector('.cerrar');
cerrarSesion.addEventListener('click', async() => {
    localStorage.clear()
    sessionStorage.clear();
    location.reload();
})