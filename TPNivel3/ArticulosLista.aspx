<%@ Page Title="" Language="C#" MasterPageFile="~/MasterMind.Master" AutoEventWireup="true" CodeBehind="ArticulosLista.aspx.cs" Inherits="TPNivel3.ArticulosLista" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .oculto {
            display: none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel runat="server">
        <ContentTemplate>

            <h1>Lista de Artículos</h1>

            <div class="row">
                <div class="col-6">
                    <div class="mb-3">
                        <asp:Label Text="Filtrar:" runat="server" />
                        <asp:TextBox runat="server" ID="txtFiltro" CssClass="form-control" AutoPostBack="true" OnTextChanged="txtFiltro_TextChanged" />
                    </div>
                </div>
                <div class="col-6" style="display: flex; flex-direction: column; justify-content: flex-end;">
                    <div class="mb-3 d-flex gap-2">
                        <asp:CheckBox Text="Filtro Avanzado:" runat="server" ID="chkAvanzado" AutoPostBack="true" OnCheckedChanged="chkAvanzado_CheckedChanged" />
                    </div>
                </div>

                <% if (chkAvanzado.Checked)
                    { %>

                <div class="row">
                    <div class="col-3">
                        <div class="mb-3">

                            <asp:Label Text="Campo" ID="lblCampo" runat="server" />
                            <asp:DropDownList runat="server" AutoPostBack="true" CssClass="form-select  dropdown-toggle" required ID="ddlCampo" OnSelectedIndexChanged="ddlCampo_SelectedIndexChanged">
                                <asp:ListItem Text="Categoria" />
                                <asp:ListItem Text="Marca" />
                                <asp:ListItem Text="Precio" />
                            </asp:DropDownList>

                        </div>
                    </div>
                    <div class="col-3">
                        <div class="mb-3">
                            <asp:Label Text="Criterio" runat="server" />
                            <asp:DropDownList runat="server" ID="ddlCriterio" required CssClass="form-select dropdown-toggle"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-3">
                        <div class="mb-3">
                            <asp:Label Text="Filtro" runat="server" />
                            <asp:TextBox runat="server" ID="txtFiltroAvanzado" CssClass="form-control" required />
                        </div>
                    </div>
                    <div class="col-3 p-4">
                        <div class="mb-3 d-flex gap-4">
                            <asp:Button Text="Buscar" runat="server" CssClass="btn btn-primary" ID="btnBuscar" OnClick="btnBuscar_Click" />
                            <asp:Button Text="Nueva Búsqueda" CssClass="btn btn-warning" runat="server" ID="btnNuevaBusqueda" OnClick="btnNuevaBusqueda_Click" />

                        </div>
                    </div>
                </div>
                <div class="row">
                </div>
                <% } %>
            </div>

            <asp:GridView runat="server" ID="dgvArticulos" DataKeyNames="Id" CssClass="table" AutoGenerateColumns="false"
                OnSelectedIndexChanged="dgvArticulos_SelectedIndexChanged" OnPageIndexChanging="dgvArticulos_PageIndexChanging">

                <Columns>
                    <asp:BoundField HeaderText="Id" DataField="Id" HeaderStyle-CssClass="oculto" ItemStyle-CssClass="oculto" />
                    <asp:BoundField HeaderText="Codigo" DataField="CodigoArticulo" />
                    <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                    <asp:BoundField HeaderText="Categoria" DataField="Categorias.Descripcion" />
                    <asp:BoundField HeaderText="Marcas" DataField="Marcas.Descripcion" />
                    <asp:BoundField HeaderText="Precio" DataField="Precio" />
                    <asp:CommandField HeaderText="Accion" ShowSelectButton="true" SelectText="Seleccionar" />
                </Columns>

            </asp:GridView>

            <a href="FormularioArticulo.aspx" class="btn btn-primary">Agregar</a>

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
