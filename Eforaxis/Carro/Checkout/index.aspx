<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Eforaxis.Carro.Checkout.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css" integrity="sha512-NhSC1YmyruXifcj/KFRWoC561YpHpc5Jtzgvbuzx5VozKpWvQ+4nXhPdFgmx8xqexRcpAglTj9sIBWINXa8x5w==" crossorigin="anonymous" referrerpolicy="no-referrer"
    />
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" type='text/css' href="../../Recursos/css/carro.css">
    <link rel="stylesheet" type='text/css' href="../../Recursos/css/checkout.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <title>Carro de Compras</title>
</head>

<body>
    <header>
        <nav class="nav">
            <div class="nav__img">
                <a href="#"><img class="nav__logo" src="../../Recursos/images/page/logo.png"></a>
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
                <h1>Checkout</h1>
            </div>
            <div class="contenedor__checkout">
                <h2>Seleccione método de pago:</h2>
                <div class="contenedor__opciones">
                    <button class="metodo btn btn--debito">Débito</button>
                    <button class="metodo btn btn--credito">Crédito</button>
                </div>
                <form id="formulario" runat="server" >
                    <asp:HiddenField  ID="idUsuario" runat="server" />
                    <asp:HiddenField  ID="idProductos" runat="server" />
                    <asp:HiddenField  ID="cantidades" runat="server" />
                    <asp:HiddenField  ID="metodo" runat="server" />
                    <asp:HiddenField  ID="total" runat="server" />
                    
                    <div class="contenedor__pago">
                        <p>Seleccionado:  <asp:Label ID="metodo_select" runat="server" Text="Ninguno" CssClass="metodo__selecionado"></asp:Label></p>
                        <label>Número de tarjeta: <asp:TextBox ID="cc" runat="server" placeholder="4111 1111 1111 1111"></asp:TextBox></label>
                        <div class="contenedor__data">
                            <label>Mes<asp:DropDownList ID="mes" runat="server">
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>
                                <asp:ListItem>6</asp:ListItem>
                                <asp:ListItem>7</asp:ListItem>
                                <asp:ListItem>8</asp:ListItem>
                                <asp:ListItem>9</asp:ListItem>
                                <asp:ListItem>10</asp:ListItem>
                                <asp:ListItem>11</asp:ListItem>
                                <asp:ListItem>12</asp:ListItem>
                            </asp:DropDownList>
                            : </label>
&nbsp;<label>Año: </label>
&nbsp;<asp:DropDownList ID="ano" runat="server">
                                <asp:ListItem>2021</asp:ListItem>
                                <asp:ListItem>2022</asp:ListItem>
                                <asp:ListItem>2023</asp:ListItem>
                                <asp:ListItem>2024</asp:ListItem>
                                <asp:ListItem>2025</asp:ListItem>
                                <asp:ListItem>2026</asp:ListItem>
                                <asp:ListItem>2027</asp:ListItem>
                                <asp:ListItem>2028</asp:ListItem>
                                <asp:ListItem>2029</asp:ListItem>
                                <asp:ListItem>2030</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <label>CVV2: <asp:TextBox ID="cvv" runat="server" placeholder="123"></asp:TextBox></label>
                    </div><br />
                    <asp:Button ID="btnPagar" runat="server" Text="Pagar" OnClick="btnSubmit_click" CssClass="total__btn" Width="100%"/>
                </form>
            </div>
            <div class="contenedor__total">
                <div class="contenedor__valor">
                    <h2>Subtotal: <span class="contenedor__valor--cantidad">$  CLP</span></h2> 
                </div>
            </div>
        </div>
    </main>
    <div class="contenedor--2">
        <div class="alerta">
            <div class="alerta__cerrar">
             <span class='bx bx-x-circle' ></span>
            </div>
            <div class="alerta__img">
                <img src="data:image/png;base64,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" alt="Imagen de alerta">
            </div>
            <div class="alerta__contenido">
                <h2>Debes completar el formulario.</h2>
            </div>
        </div>
    </div>
    <script src="../../Recursos/JS/checkout.js"></script>
</body>

</html>