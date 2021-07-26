<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="recibo.aspx.cs" Inherits="Eforaxis.Carro.Checkout.recibo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css" integrity="sha512-NhSC1YmyruXifcj/KFRWoC561YpHpc5Jtzgvbuzx5VozKpWvQ+4nXhPdFgmx8xqexRcpAglTj9sIBWINXa8x5w==" crossorigin="anonymous" referrerpolicy="no-referrer"
    />
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" type='text/css' href="../../recursos/css/carro.css">
    <link rel="stylesheet" type='text/css' href="../../recursos/css/checkout.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <title>Carro de Compras</title>
</head>

<body>
    <header>
        <nav class="nav">
            <div class="nav__img">
                <a href="#"><img class="nav__logo" src="../../recursos/images/page/logo.png"></a>
            </div>
            <ul class="nav__menu hidden">
                <li><a href="../../index.aspx">Inicio</a></li>
                <li><a href="../../cliente/home/index.aspx">Mis Pedidos</a></li>
                <li class="nav__logout">
                    Cerrar Sesión
                </li>
                <li class="nav__carrito">
                    <a class='bx bx-cart-alt'></a> Carrito
                </li>
            </ul>
            <span id="toggle" class="bx bx-menu"></span>
        </nav>
    </header>
    <main>
        <div class="contenedor">
            <div class="contendor__title">
                <h1>Compra realizada con éxito!</h1>
            </div>
            <div class="contenedor__checkout">
                <img src="../../recursos/images/page/success.png" alt="">
            </div>
            <div class="contenedor__total">
                <div class="contenedor__valor">
                    <h2>Subtotal: <span class="contenedor__valor--cantidad">$<?php echo($_SESSION[KEY_TOTAL_PAGAR]);?> CLP</span></h2> 
                </div>
                <button id="home" class="btn btn--home">Ver mis pedidos</button>
            </div>
        </div>
    </main>
    <script src="../../recursos/js/recibo.js"></script>
</body>

</html>