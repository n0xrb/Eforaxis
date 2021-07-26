<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="modificar.aspx.cs" Inherits="Eforaxis.Admin.Panel.Metodos.modificar" %>


<!DOCTYPE html>
<html lang="es-CL">

<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css" integrity="sha512-NhSC1YmyruXifcj/KFRWoC561YpHpc5Jtzgvbuzx5VozKpWvQ+4nXhPdFgmx8xqexRcpAglTj9sIBWINXa8x5w==" crossorigin="anonymous" referrerpolicy="no-referrer"
    />
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <link href='../../../Recursos/CSS/panelAdmin.css' rel='stylesheet'>
    <title>Panel - Administración</title>
</head>
<body>
   <header>
        <nav class="nav">
            <ul>
                <li>
                    <a href="../../../index.aspx">Inicio</a>
                </li>
                <li>
                    <a href="../index.aspx">Panel Admin</a>
                </li>
                <li>
                    <a href="eliminar.aspx">Eliminar</a>
                </li>
                <li>
                    <a href="modificar.aspx">Modificar</a>
                </li>
                <li class="cerrar">
                    Cerrar Sesión
                </li>
            </ul>
        </nav>
    </header>
    <div class="card__alerta">
        <div class="card__correcto none">
            <i class='bx bx-check-circle'></i><label class="card__mensaje--correcto"></label>
        </div>
        <div class="card__error none">
            <i class='bx bx-x-circle'></i><label class="card__mensaje--error"></label>
        </div>
    </div>
    <div class="container">
        <div class="card">
            <form class="card__form" id="modificar" runat="server">
                <input type="text" name="tipo" hidden value="updateOne">
                <h1 class="card__title">Modificar Producto </h1>
                <label>ID PRODUCTO </label>
                <div class="card__input">
                    <asp:TextBox ID="id_modificar" type="text" placeholder="Ingrese ID del producto" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server"
                      ControlToValidate="id_modificar"
                      ErrorMessage="Debes completar el formulario"
                      ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </div>
                <label>Nombre Producto</label>
                <asp:TextBox ID="nombre_modificar" placeholder="Ingrese nombre de producto" runat="server"></asp:TextBox> 
                <asp:RequiredFieldValidator id="RequiredFieldValidator2" runat="server"
                      ControlToValidate="nombre_modificar"
                      ErrorMessage="Debes completar el formulario"
                      ForeColor="Red">
                </asp:RequiredFieldValidator>
                <label>Stock Disponible</label>
                <div class="card__input">
                    <asp:TextBox ID="cantidad_modificar" type="number" min="1" step="1" value="1" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator id="RequiredFieldValidator3" runat="server"
                      ControlToValidate="cantidad_modificar"
                      ErrorMessage="Debes completar el formulario"
                      ForeColor="Red">
                </asp:RequiredFieldValidator>
                </div>
                <label>Categoria</label>
                <asp:TextBox ID="categoria_modificar" type="text" placeholder="Ingrese categoria" runat="server"></asp:TextBox> 
                <asp:RequiredFieldValidator id="RequiredFieldValidator4" runat="server"
                      ControlToValidate="categoria_modificar"
                      ErrorMessage="Debes completar el formulario"
                      ForeColor="Red">
                </asp:RequiredFieldValidator>
                <label>Precio Producto</label>
                <div class="card__input">
                    <asp:TextBox ID="precio_modificar" type="number" min="1" step="0.0010" value="1" runat="server"></asp:TextBox>    
                    <asp:RequiredFieldValidator id="RequiredFieldValidator5" runat="server"
                      ControlToValidate="precio_modificar"
                      ErrorMessage="Debes completar el formulario"
                      ForeColor="Red">
                    </asp:RequiredFieldValidator>                 
                </div>
                <label>Descuento</label>
                <div class="card__input">
                    <asp:TextBox ID="descuento_modificar" type="number" min="1" step="0.1" value="1.0" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator id="RequiredFieldValidator6" runat="server"
                      ControlToValidate="descuento_modificar"
                      ErrorMessage="Debes completar el formulario"
                      ForeColor="Red">
                    </asp:RequiredFieldValidator>    
                </div>
                <label>Imagen Producto</label><asp:FileUpload ID="imagen_agregar" runat="server" Text="Seleccionar Archivo"/>
                    <asp:RequiredFieldValidator id="RequiredFieldValidator7" runat="server"
                      ControlToValidate="imagen_agregar"
                      ErrorMessage="Debes completar el formulario"
                      ForeColor="Red">
                    </asp:RequiredFieldValidator> 
                <asp:Button ID="btnSubmit_modificar" type="submit" runat="server" Text="Agregar Producto" OnClick="btnSubmit_modificar_click" CssClass="btn--mod"/>
            </form>
        </div>
    </div>
    <script src="../../../Recursos/JS/panelAdmin.js"></script>
    <?php
    if (isset($_GET["mensaje"])) {
        if (strpos($_GET["mensaje"], "Error")) {
            echo '<script> alerta("'.$_GET["mensaje"].'", "error");</script>';
        }else {
            echo '<script> alerta("'.$_GET["mensaje"].'", "correcto");</script>';
        }
    }
    ?>
</body>
</html>