<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Eforaxis.Admin.Panel.index" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css" integrity="sha512-NhSC1YmyruXifcj/KFRWoC561YpHpc5Jtzgvbuzx5VozKpWvQ+4nXhPdFgmx8xqexRcpAglTj9sIBWINXa8x5w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.25/css/dataTables.bootstrap5.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.0.1/css/bootstrap.min.css">
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <link href='../../Recursos/CSS/panelAdmin.css' rel='stylesheet'>
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.25/js/dataTables.bootstrap5.min.js"></script>
    <title>Panel - Administración</title>
</head>
<body>
    <header>
        <nav class="nav">
            <ul>
                <li>
                    <a href="../../index.aspx">Inicio</a>
                </li>
                <li>
                    <a href="index.aspx">Panel Admin</a>
                </li>
                <li>
                    <a href="./Metodos/eliminar.aspx">Eliminar</a>
                </li>
                <li>
                    <a href="./Metodos/modificar.aspx">Modificar</a>
                </li>
                <li class="cerrar"> Cerrar Sesión </li>
            </ul>
        </nav>
    </header>
    <div class="container">
        <form class="card__form" id="agregar" runat="server">
            <div class="card">
                <input type="text" name="tipo" hidden value="insertOne">
                <h1 class="card__title">Agregar Producto </h1>
                <label>Nombre Producto</label>
                <asp:TextBox ID="nombre_agregar" placeholder="Ingrese nombre de producto" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server" ControlToValidate="nombre_agregar" ErrorMessage="Debes completar el formulario" ForeColor="Red"></asp:RequiredFieldValidator>
                <label>Stock Disponible</label>
                <div class="card__input">
                    <asp:TextBox ID="cantidad_agregar" type="number" min="1" step="1" value="1" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator id="RequiredFieldValidator2" runat="server" ControlToValidate="cantidad_agregar" ErrorMessage="Debes completar el formulario" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <label>Categoria</label>
                <asp:TextBox ID="categoria_agregar" type="text" placeholder="Ingrese categoria" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator id="RequiredFieldValidator3" runat="server" ControlToValidate="categoria_agregar" ErrorMessage="Debes completar el formulario" ForeColor="Red"></asp:RequiredFieldValidator>
                <label>Precio Producto</label>
                <div class="card__input">
                    <asp:TextBox ID="precio_agregar" type="number" min="1" step="0.0010" value="1" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator id="RequiredFieldValidator4" runat="server" ControlToValidate="precio_agregar" ErrorMessage="Debes completar el formulario" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <label>Descuento</label>
                <div class="card__input">
                    <asp:TextBox ID="descuento_agregar" type="number" min="1" step="0.1" value="1.0" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator id="RequiredFieldValidator5" runat="server" ControlToValidate="descuento_agregar" ErrorMessage="Debes completar el formulario" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <label>Imagen Producto</label>
                <asp:FileUpload ID="imagen_agregar" runat="server" Text="Seleccionar Archivo" />
                <asp:RequiredFieldValidator id="RequiredFieldValidator6" runat="server" ControlToValidate="imagen_agregar" ErrorMessage="Debes completar el formulario" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:Button ID="btnSubmit_agregar" type="submit" runat="server" Text="Agregar Producto" OnClick="btnSubmit_agregar_click" CssClass="btn--add" />
            </div>
        </form>
            <div class="ventas">
                <h1 class="card__title">VENTAS TOTALES</h1>

                <table ID="tabla" class="table table-striped" style="width:100%" runat="server">

                </table>
            </div>
    </div>
    <script>
        $(document).ready(function () {
            $('#tabla').DataTable();
        });
    </script>
    <script src="../../Recursos/JS/panelAdmin.js"></script>
</body>
</html>