<%@ Page Title="" Language="C#" MasterPageFile="~/MasterMind.Master" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="TPNivel3.Registro" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
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
        <div class="col-5">
            <h2 class="ache2">Crea tu Perfil</h2>
            <div class="mb-4">
                <label class="form-label lab">Email</label>
                <asp:TextBox runat="server" CssClass="form-control tclass" style="width: 400px;" ID="txtEmail" REQUIRED TextMode="Email" />
            </div>
            <div class="mb-3">
                <asp:Label Text="Password" CssClass="form-label lab" runat="server" />
                <asp:TextBox runat="server" CssClass="form-control mt-2 tclass" TextMode="Password" ID="txtPassword" style="margin-bottom: 40px; width: 400px;" REQUIRED />
            </div>
            <asp:Button Text="Registrarse" CssClass="btn btn-primary botonn" OnClick="btnRegistrarse_Click" ID="btnRegistrarse" runat="server" />
            <a href="/" class="lab botonn2">Cancelar</a>
        </div>
    </div>

</asp:Content>
