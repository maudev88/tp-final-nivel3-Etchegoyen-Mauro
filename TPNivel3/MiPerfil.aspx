<%@ Page Title="" Language="C#" MasterPageFile="~/MasterMind.Master" AutoEventWireup="true" CodeBehind="MiPerfil.aspx.cs" Inherits="TPNivel3.MiPerfil" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
         @media screen and (max-width: 991px)
         {
              .ache2 {
                font-size: 43px;
            }
              .lab {
                font-size: 31px;
            }
              .tclass {
                width: 40vw!important;
                height: 47px;
                font-size: 29px!important;
                margin-top: 5px;
            }
              .margLeft {
                  margin-left: 152px;
              }
              .margBoton {
                  margin-bottom: 17px!important;
              }
              .inputImg {
                  width: 44vw!important;
              }
            .botonn {
                font-size: 31px !important;
                margin-right: 14px;
            }
             .botonn2 {
                position: relative;
                top: 4px;
            }
         }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h3 class="ache2 margBoton" style="margin-bottom: 20px;">Mi Perfil</h3>

    <div class="row">   
        <div class="col-md-4">
            <div class="margBoton " style="margin-bottom: 17px;"  >
                <asp:Label Text="Email" CssClass="form-label lab" runat="server" />
                <asp:TextBox runat="server" CssClass="form-control tclass" ID="txtMail" />
            </div>
            <div class=" margBoton" style="margin-bottom: 17px;">
                <asp:Label Text="Nombre" runat="server" CssClass="lab" />
                <asp:TextBox runat="server" CssClass="form-control tclass" ID="txtNombre" />
            </div>
            <div class=" margBoton" style="margin-bottom: 17px;">
                <asp:Label Text="Apellido" CssClass="form-label lab" runat="server" />
                <asp:TextBox runat="server" CssClass="form-control tclass" ID="txtApellido" />
            </div>
        </div>
        <div class="col-md-4 margLeft">
            <div class="mb-3">
                <asp:Label Text="Imagen de Perfil" CssClass="form-label lab " runat="server" />
                <input type="file" id="txtImagen" runat="server" class="form-control tclass inputImg " />
            </div>
            <asp:Image ImageUrl="https://www.palomacornejo.com/wp-content/uploads/2021/08/no-image.jpg" ID="imgNuevoPerfil" runat="server" CssClass="img-fluid mb-3 " />

        </div>
    </div>

    <div class="row">
        <div class="col-md-4">
            <asp:Button Text="Guardar" OnClick="btnGuardar_Click" CssClass="btn btn-primary botonn" ID="btnGuardar" runat="server" />
            <a href="/" class="botonn2 lab">Regresar</a>
        </div>
    </div>


</asp:Content>
