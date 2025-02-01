<%@ Page Title="" Language="C#" MasterPageFile="~/MasterMind.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TPNivel3.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        // Función para cambiar la imagen si no es válida
        function setDefaultImage(img) {
            img.onerror = null; // Evitar que la función se llame repetidamente
            img.src = 'data:image/jpeg;base64,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'; // Imagen por defecto
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


                    <div class="d-flex gap-4 mb-xxl-5 w-50">
                        <asp:DropDownList runat="server" CssClass="form-select" ID="ddlCampo" AutoPostBack="true" OnSelectedIndexChanged="ddlCategoria_SelectedIndexChanged">
                            <asp:ListItem Text="Categoria" />
                            <asp:ListItem Text="Marca" />
                            <asp:ListItem Text="Precio" />
                        </asp:DropDownList>

                        <asp:DropDownList runat="server" ID="ddlCriterio" CssClass="form-select  dropdown-toggle"></asp:DropDownList>


                        <asp:TextBox runat="server" ID="txtFiltroAvanzado" CssClass="form-control" />
                        <asp:Button Text="Buscar" CssClass="btn btn-primary" ID="btnBuscar" OnClick="btnBuscar_Click" runat="server" />
                    </div>
                    




                    <div class="row row-cols-1 row-cols-md-5 g-4 mt-0 ">
                        <asp:Repeater ID="repRepetidor" runat="server">
                            <ItemTemplate>
                                <div class="col d-flex  justify-content-center" style="min-width: 358px;" >
                                    <div style="width: 300px;" class="card mb-xxl-5  w-50px p-xl-1">
                                        <div  class="d-flex flex-wrap justify-content-center" style="/*width: 200px;*/ /*max-height: 300px;*/ object-fit:cover">
                                            <img src="<%#Eval("Imagen")%>" <%--class="card-img-top"--%> style="max-height: 300px; max-height: 293px;"  onerror="setDefaultImage(this)" alt="..." />
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
