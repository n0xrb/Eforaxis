<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="registro.aspx.cs" Inherits="Eforaxis.Admin.registro" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css" integrity="sha512-NhSC1YmyruXifcj/KFRWoC561YpHpc5Jtzgvbuzx5VozKpWvQ+4nXhPdFgmx8xqexRcpAglTj9sIBWINXa8x5w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css" rel="stylesheet"/>
<link rel="stylesheet" href="../Recursos/CSS/cliente.css"/>
<title>E-Foraxis - Login</title>
</head>
<body>
    <div class="container">
        <div class="card">
            <h1 class="card__title">E-FORA<span>X</span>IS</h1>
            <h2 class="card__subtitle">Admin panel</h2>
            <form id="registroAdmin" class="card__form" runat="server">
                <i class='bx bxs-user-detail'></i>
                <asp:TextBox  runat="server" ID="nombre" name="nombre" type="text" placeholder="Ingrese Nombre"></asp:TextBox>
                <i class='bx bxs-user-detail'></i><asp:TextBox  runat="server" ID="correo" name="correo" type="text" placeholder="Ingrese Correo"></asp:TextBox>
                <i class='bx bxs-key'></i><asp:TextBox  runat="server"  ID="contrasena" name="contrasena" type="password" placeholder="Contraseña"></asp:TextBox>
                <asp:Button class="card__button btn--register" ID="btnSubmit" runat="server"/>
            </form>
        </div>
    </div>
</body>
</html>
