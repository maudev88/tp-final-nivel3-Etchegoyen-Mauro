<%@ Page Title="" Language="C#" MasterPageFile="~/MasterMind.Master" AutoEventWireup="true" CodeBehind="Detalle.aspx.cs" Inherits="TPNivel3.Detalle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        // Función para cambiar la imagen si no es válida
        function setDefaultImage(img) {
            img.onerror = null; // Evitar que la función se llame repetidamente
            img.src = 'https://www.generationsforpeace.org/wp-content/uploads/2018/03/empty-300x240.jpg'; // Imagen por defecto
        }
  </script>
    <style>
        h4 {
            color: red !important;
        }

        body {
            background-color: #efefef !important;
        }

        @media screen and (max-width: 1399px) {
            .blanco {
                 margin: 60px 0px !important;
                 padding: 15px;
             }
        }

         @media screen and (max-width: 991px) {
             
             .botonn {
                font-size: 32px!important;
            }
             .acheuno {
                 font-size: 41px;
             }
         }

    </style>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="text-center acheuno mb-xxl-5">Detalle del Producto</h1>


    <h2 id="txtId" class="d-none" runat="server"></h2>

    <div class="d-flex justify-content-around  p-xxl-5 blanco"  style="margin: 200px; margin-bottom: 62px; margin-top: 50px; background-color: white;">
        <div>
            <img src="" id="txtImg" runat="server" onerror="setDefaultImage(this)" alt="Alternate Text" style="max-height: 484px; max-width: 540px; padding-top: 31px; padding-bottom: 31px;" />
        </div>
        <div class="d-flex flex-column gap-3">
            <div>
                <h4>Código:</h4>
                <h5 id="txtCodigo" runat="server"></h5>
            </div>
            <div>
                <h4>Nombre:</h4>
                <h5 id="txtNombre" runat="server"></h5>
            </div>
            <div>
                <h4>Marca:</h4>
                <h5 id="txtMarca" runat="server"></h5>
            </div>
            <div>
                <h4>Categoría:</h4>
                <h5 id="txtCategoria" runat="server"></h5>
            </div>
            <div>
                <h4>Precio:</h4>
                <h5 id="txtPrecio" runat="server"></h5>
            </div>
            <div>
                <h4>Descripción:</h4>
                <h5 id="txtDescripcion" runat="server"></h5>
            </div>
        </div>

    </div>

    <asp:Button Text="Volver al Catálogo" ID="btnVolver" CssClass="btn btn-primary botonn d-block mx-auto mt-xxl-5" OnClick="btnVolver_Click" runat="server" />

</asp:Content>
