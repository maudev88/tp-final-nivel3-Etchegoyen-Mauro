<%@ Page Title="" Language="C#" MasterPageFile="~/MasterMind.Master" AutoEventWireup="true" CodeBehind="MiPerfil.aspx.cs" Inherits="TPNivel3.MiPerfil" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h3>Mi Perfil</h3>

    <div class="row">   
        <div class="col-md-4">
            <div class="mb-3">
                <asp:Label Text="Email" CssClass="form-label" runat="server" />
                <asp:TextBox runat="server" CssClass="form-control" ID="txtMail" />
            </div>
            <div class="mb-3">
                <asp:Label Text="Nombre" runat="server" />
                <asp:TextBox runat="server" CssClass="form-control" ID="txtNombre" />
            </div>
            <div class="mb-3">
                <asp:Label Text="Apellido" CssClass="form-label" runat="server" />
                <asp:TextBox runat="server" CssClass="form-control" ID="txtApellido" />
            </div>
        </div>
        <div class="col-md-4">
            <div class="mb-3">
                <asp:Label Text="Imagen de Perfil" CssClass="form-label" runat="server" />
                <input type="file" id="txtImagen" runat="server" class="form-control" />
            </div>
            <asp:Image ImageUrl="https://www.palomacornejo.com/wp-content/uploads/2021/08/no-image.jpg" ID="imgNuevoPerfil" runat="server" CssClass="img-fluid mb-3" />

        </div>
    </div>

    <div class="row">
        <div class="col-md-4">
            <asp:Button Text="Guardar" OnClick="btnGuardar_Click" CssClass="btn btn-primary" ID="btnGuardar" runat="server" />
            <a href="/">Regresar</a>
        </div>
    </div>


</asp:Content>
