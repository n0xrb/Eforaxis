<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Eforaxis.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css" integrity="sha512-NhSC1YmyruXifcj/KFRWoC561YpHpc5Jtzgvbuzx5VozKpWvQ+4nXhPdFgmx8xqexRcpAglTj9sIBWINXa8x5w==" crossorigin="anonymous" referrerpolicy="no-referrer"
    />
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'/>
    <link href='./Recursos/CSS/inicio.css' rel='stylesheet'/>
    <title>Inicio - Eforaxis</title>
</head>
<body>
     <header>
        <nav class="nav">
            <div class="nav__img">
                <a href="#"><img class="nav__logo" src="./Recursos/Images/Page/logo.png"/></a>
            </div>
            <ul class="nav__menu hidden">
                <li><a href="index.aspx">Inicio</a></li>
                <li><a href="./cliente/home/index.aspx">Mis Pedidos</a></li>
                <li class="nav__logout">
                    Cerrar Sesión
                </li>
                <li class="nav__carrito">
                    <input id="carrito" type="number" min="0" step="1" value="0" runat="server"/>
                    <a class='bx bx-cart-alt'></a> Carrito
                </li>
            </ul>
            <span id="toggle" class="bx bx-menu"></span>
        </nav>
    </header>
    <main>
        <div class="filtros">
        </div>
        <div class="productos">
            <div class="indice" id="paginacion"></div>
            <span class="indice__sub">Inicio / Pagina 1</span>
            <div id="contenedor" class="contenedor" runat="server">
            </div>
        </div>
    </main>
    <script src='./Recursos/JS/inicio.js'></script>
</body>
</html>