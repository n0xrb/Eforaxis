<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Eforaxis.Carro.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css" integrity="sha512-NhSC1YmyruXifcj/KFRWoC561YpHpc5Jtzgvbuzx5VozKpWvQ+4nXhPdFgmx8xqexRcpAglTj9sIBWINXa8x5w==" crossorigin="anonymous" referrerpolicy="no-referrer"
/>
<link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
<link rel="stylesheet" type='text/css' href="../Recursos/CSS/carro.css">
<title>Carro de Compras</title>
</head>
<body>
    <header>
        <nav class="nav">
            <div class="nav__img">
                <a href="#"><img class="nav__logo" src="../Recursos/Images/Page/logo.png"></a>
            </div>
            <ul class="nav__menu hidden">
                <li><a href="../index.aspx">Inicio</a></li>
                <li><a href="../Cliente/Home/index.aspx">Mis Pedidos</a></li>
                <li class="nav__logout">
                    Cerrar Sesión
                </li>
                <li class="nav__carrito">
                    <input id="carrito" type="number" min="0" step="1" value="0" disabled>
                    <a class='bx bx-cart-alt'></a> Carrito
                </li>
            </ul>
            <span id="toggle" class="bx bx-menu"></span>
        </nav>
    </header>
    <main>
        <div class="contenedor">
            <div class="productos">
                <h1 class="productos__title">Productos - Carro de Compras</h1>
                <div class="productos__header">
                    <div class="productos__header--id">
                        ID
                    </div>
                    <div class="productos__header--nombre">
                        NOMBRE
                    </div>
                    <div class="productos__header--foto">
                        IMAGEN
                    </div>
                    <div class="productos__header--cantidad">
                        CANTIDAD
                    </div>
                    <div class="productos__header--precio">
                        PRECIO
                    </div>
                    <div class="productos__header--editar">
                        EDITAR
                    </div>
                </div>
                <div class="productos__body">
                    
                </div>
            </div>
            <div class="total">
                <div class="total__valor">
                    <h2>Subtotal: </h2> <span class="total__valor--cantidad"></span>
                </div>
                <button class="total__btn">Continuar con el pago</button>
            </div>
        </div>
    </main>
    <script src="../Recursos/JS/carro.js"></script>
</body>
</html>
