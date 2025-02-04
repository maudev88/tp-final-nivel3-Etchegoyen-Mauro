<%@ Page Title="" Language="C#" MasterPageFile="~/MasterMind.Master" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="TPNivel3.Registro" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row">
        <div class="col-4">
            <h2>Crea tu Perfil</h2>
            <div class="mb-4">
                <label class="form-label">Email</label>
                <asp:TextBox runat="server" CssClass="form-control"  ID="txtEmail" REQUIRED TextMode="Email" />
            </div>
            <div class="mb-3">
                <asp:Label Text="Password" CssClass="form-label" runat="server" />
                <asp:TextBox runat="server" CssClass="form-control mt-2" TextMode="Password" ID="txtPassword" style="margin-bottom: 40px;" REQUIRED />
            </div>
            <asp:Button Text="Registrarse" CssClass="btn btn-primary" OnClick="btnRegistrarse_Click" ID="btnRegistrarse" runat="server" />
            <a href="/">Cancelar</a>
        </div>
    </div>

</asp:Content>
