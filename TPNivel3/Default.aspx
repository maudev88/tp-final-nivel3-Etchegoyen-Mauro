<%@ Page Title="" Language="C#" MasterPageFile="~/MasterMind.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TPNivel3.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        // Función para cambiar la imagen si no es válida
        function setDefaultImage(img) {
            img.onerror = null; // Evitar que la función se llame repetidamente
            img.src = 'https://www.generationsforpeace.org/wp-content/uploads/2018/03/empty-300x240.jpg'; // Imagen por defecto
        }
  </script>
    <style>
        body {
            background-color: #efefef!important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:ScriptManager runat="server" ID="esUnId"></asp:ScriptManager>
    <asp:UpdatePanel runat="server">
        <ContentTemplate>

            <div class="col">
                <div class=" d-flex flex-column align-items-center">


                    <div class="d-flex gap-4  flex-wrap" style="margin-bottom: 50px;" >
                        <asp:DropDownList runat="server" CssClass="form-select" style="min-width: 160px; max-width: 160px;" ID="ddlCampo" AutoPostBack="true" OnSelectedIndexChanged="ddlCampo_SelectedIndexChanged">
                            <asp:ListItem Text="Categoria" />
                            <asp:ListItem Text="Marca" />
                            <asp:ListItem Text="Precio" />
                        </asp:DropDownList>

                        <asp:DropDownList runat="server" ID="ddlCriterio" style="min-width: 160px; max-width: 160px;" CssClass="form-select  dropdown-toggle">
                             <asp:ListItem Text=" " />
                        </asp:DropDownList>


                        <asp:TextBox runat="server" ID="txtFiltroAvanzado" style="min-width: 160px; max-width: 160px;" CssClass="form-control"   />
                        <asp:Button Text="Buscar" CssClass="btn btn-primary" ID="btnBuscar" OnClick="btnBuscar_Click" runat="server"  />
                        <asp:Button Text="Nueva Búsqueda" CssClass="btn btn-warning" id="btnNuevaBusqueda" OnClick="btnNuevaBusqueda_Click" runat="server" />
                    </div>
                    

                    <div class="row row-cols-1 row-cols-md-5 g-4 mt-0 " style="display:flex; justify-content:center;">

                        <asp:Repeater ID="repRepetidor" runat="server">
                            <ItemTemplate>
                                <div class="col d-flex  justify-content-center" style="min-width: 358px;" >
                                    <div style="width: 300px;" class="card mb-xxl-5  w-50px p-xl-1">
                                        <div  class="d-flex flex-wrap justify-content-center" style="padding: 12px; object-fit:cover">
                                            <img src="<%#Eval("Imagen")%>" <%--class="card-img-top"--%> style="max-height: 293px; max-width: 296px;"  onerror="setDefaultImage(this)" alt="..." />
                                        </div>
                                        <div class="card-body d-grid align-content-end" >
                                            <h5 class="card-title"><%#Eval("Nombre")%></h5>
                                            <p class="card-text"><%#Eval("Marcas.Descripcion")%></p>
                                            <p class="card-text"><%#Eval("Categorias.Descripcion")%></p>
                                            <p class="card-text"><%#Eval("Precio")%></p>
                                            <asp:Button Text="Ver Detalle" CssClass="btn btn-primary" ID="btnDetalle"
                                                CommandArgument='<%#Eval("Id")%>' CommandName="ArticuloId"
                                                OnClick="btnDetalle_Click" runat="server" />
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>

                    </div>
                </div>
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
