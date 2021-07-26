<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Eforaxis.Cliente.Home.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css" integrity="sha512-NhSC1YmyruXifcj/KFRWoC561YpHpc5Jtzgvbuzx5VozKpWvQ+4nXhPdFgmx8xqexRcpAglTj9sIBWINXa8x5w==" crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'/>
    <link rel="stylesheet" type='text/css' href="../../Recursos/CSS/carro.css"/>
    <link rel="stylesheet" type='text/css' href="../../Recursos/CSS/pedidos.css"/>
    <title>Pedidos</title>
</head>

<body>
    <header>
        <nav class="nav">
            <div class="nav__img">
                <a href="#"><img class="nav__logo" src="../../Recursos/Images/Page/logo.png"/></a>
            </div>

            <ul class="nav__menu hidden">
                <li><a href="../../index.aspx">Inicio</a></li>
                <li><a href="../../Cliente/Home/index.aspx">Mis Pedidos</a></li>
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
        <form id="formulario" runat="server">
            <asp:HiddenField  ID="idUsuario" runat="server" />
        </form>
        <div id="contenedor2" class="contenedor2" runat="server">
         
        </div>
    </main>
    <script src="../../Recursos/JS/home.js"></script>
</body>
</html>