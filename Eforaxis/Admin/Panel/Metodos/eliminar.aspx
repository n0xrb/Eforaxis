<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="eliminar.aspx.cs" Inherits="Eforaxis.Admin.Panel.Metodos.eliminar" %>

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
            <form id="delete" class="card__form" runat="server">
                <input type="text" name="tipo" hidden value="deleteOne">
                <h1 class="card__title">Eliminar Producto </h1>
                <label>ID PRODUCTO </label>
                <div class="card__input">
                    <asp:TextBox ID="id_borrar" type="text" placeholder="Ingrese el ID de producto" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server"
                      ControlToValidate="id_borrar"
                      ErrorMessage="Debes completar el formulario"
                      ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </div>
                <label>Desea eliminar el producto? (Si/No) </label>
                <select id="confirmacion">
                    <option value="no">NO</option>
                    <option value="si">SI</option>
                </select>
                
                <asp:Button ID="btnSubmit_borrar" runat="server" type="submit" Text="Eliminar producto" OnClick="btnSubmit_borrar_click" CssClass="btn--del"/>
            </form>
        </div>
    </div>
    <script src="../../../Recursos/JS/panelAdmin.js"></script>
</body>
</html>