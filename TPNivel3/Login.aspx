<%@ Page Title="" Language="C#" MasterPageFile="~/MasterMind.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="TPNivel3.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
        .validacion {
            color: red;
            font-size: 12px;
        }

        @media screen and (max-width: 991px) {
            .ache2 {
                font-size: 43px;
            }
            .lab {
                font-size: 31px;
            }
            .botonn {
                font-size: 31px!important;
                margin-right: 14px;
            }
            .botonn2 {
                position: relative;
                top: 4px;
            }
            .tclass {
                width: 40vw!important;
                height: 47px;
                font-size: 29px!important;
            }
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row">
        <div class="col-4">
            <h2 class="ache2">Login</h2>
            <div >
                <label class="form-label lab">Email</label>
                <asp:TextBox runat="server" CssClass="form-control tclass" style="width: 400px;" ID="txtEmail" TextMode="Email" />
                <asp:RequiredFieldValidator ErrorMessage="Se requiere Email" CssClass="validacion" ControlToValidate="txtEmail" runat="server" />
            </div>
            <div class="mb-3">
                <label class="form-label lab">Password</label>
                <asp:TextBox runat="server" CssClass="form-control tclass" ID="txtPassword" style="width: 400px;" TextMode="Password" />
                <asp:RequiredFieldValidator ErrorMessage="Se requiere Password" CssClass="validacion" ControlToValidate="txtPassword" runat="server" />
            </div>
            <asp:Button Text="Ingresar" CssClass="btn btn-primary botonn" ID="btnLogin" OnClick="btnLogin_Click" runat="server" />
            <a href="/" class="lab botonn2">Cancelar</a>
        </div>
    </div>

</asp:Content>
