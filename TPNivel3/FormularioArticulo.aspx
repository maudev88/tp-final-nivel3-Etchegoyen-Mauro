<%@ Page Title="" Language="C#" MasterPageFile="~/MasterMind.Master" AutoEventWireup="true" CodeBehind="FormularioArticulo.aspx.cs" Inherits="TPNivel3.FormularioArticulo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    
    <div style="margin-left: 100px;">
        <asp:ScriptManager runat="server" ID="ScriptManager1" />

    <h1 class="mb-xxl-4">Agregar Artículo</h1>

    <div class="row mb-xxl-5" style="max-width: 1200px;">
        <div class="col-6">
            <div class="mb-3">
                <label for="txtId" class="form-label">Id:</label>
                <asp:TextBox runat="server" ID="txtId" CssClass="form-control" />
            </div>
            <div class="mb-3">
                <label for="txtCodigo" class="form-label">Código:</label>
                <asp:TextBox runat="server" Id="txtCodigo" CssClass="form-control" />
            </div>
            <div class="mb-3">
                <label for="txtNombre" class="form-label">Nombre:</label>
                <asp:TextBox runat="server" ID="txtNombre" CssClass="form-control" />
            </div>
            <div class="mb-3">
                <label for="txtCategoria" class="form-label">Categoría:</label>
                <asp:DropDownList runat="server" ID="ddlCategoria" CssClass="form-select"></asp:DropDownList>
            </div>
            <div class="mb-3">
                <label for="txtMarca" class="form-label">Marca:</label>
                <asp:DropDownList runat="server" ID="ddlMarca" CssClass="form-select"></asp:DropDownList>
            </div>
            <div class="mb-3">
                <label for="txtPrecio" class="form-label">Precio:</label>
                <asp:TextBox runat="server" ID="txtPrecio" CssClass="form-control" />
            </div>
            <div class="mb-3">
                <label for="txtDescripcion" class="form-label">Descripción:</label>
                <asp:TextBox runat="server" ID="txtDescripcion" CssClass="form-control" />
            </div>

            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <div class="mb-3">
                        <label for="txtImagen" class="form-label">Imagen:</label>
                        <asp:TextBox runat="server" ID="txtImagen" CssClass="form-control"
                            AutoPostBack="true" OnTextChanged="txtImagen_TextChanged" />
                    </div>
                    <asp:Image ImageUrl="https://www.generationsforpeace.org/wp-content/uploads/2018/03/empty-300x240.jpg"
                        runat="server" ID="imgArticulos" CssClass="mb-xxl-4" style="max-height: 484px;" />
                </ContentTemplate>
            </asp:UpdatePanel>

            <div class="mb-3">
                <asp:Button Text="Agregar" ID="btnAgregar" CssClass="btn btn-primary" Style="margin-right: 127px; margin-top: 5px;"
                    OnClick="btnAgregar_Click" runat="server" />
                <asp:Button Text="Eliminar" ID="btnEliminar" CssClass="btn btn-danger" OnClick="btnEliminar_Click" runat="server" />
            </div>

        </div>

    </div>

    <div class="row">
        <div class="col-6">
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <div class="mb-5">
                        <a href="ArticulosLista.aspx">Cancelar</a>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>





    </div>

</asp:Content>
