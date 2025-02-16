<%@ Page Title="" Language="C#" MasterPageFile="~/MasterMind.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="TPNivel3.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
        .validacion {
            color: red;
            font-size: 12px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row">
        <div class="col-4">
            <h2>Login</h2>
            <div >
                <label class="form-label">Email</label>
                <asp:TextBox runat="server" CssClass="form-control" ID="txtEmail" TextMode="Email" />
                <asp:RequiredFieldValidator ErrorMessage="Se requiere Email" CssClass="validacion" ControlToValidate="txtEmail" runat="server" />
            </div>
            <div class="mb-3">
                <label class="form-label">Password</label>
                <asp:TextBox runat="server" CssClass="form-control" ID="txtPassword" TextMode="Password" />
                <asp:RequiredFieldValidator ErrorMessage="Se requiere Password" CssClass="validacion" ControlToValidate="txtPassword" runat="server" />
            </div>
            <asp:Button Text="Ingresar" CssClass="btn btn-primary" ID="btnLogin" OnClick="btnLogin_Click" runat="server" />
            <a href="/">Cancelar</a>
        </div>
    </div>

</asp:Content>
