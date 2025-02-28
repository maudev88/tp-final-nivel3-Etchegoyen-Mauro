<%@ Page Title="" Language="C#" MasterPageFile="~/MasterMind.Master" AutoEventWireup="true" CodeBehind="Favoritos.aspx.cs" Inherits="TPNivel3.Favoritos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager runat="server" />
    <asp:UpdatePanel runat="server">
        <ContentTemplate>

            <h1 style="margin-bottom: 40px;">Favoritos</h1>

            <asp:GridView runat="server" ID="dgvArticulos" DataKeyNames="Id" CssClass="table" AutoGenerateColumns="false"
                OnSelectedIndexChanged="dgvArticulos_SelectedIndexChanged" EmptyDataText="No hay Artículos agregados">

                <Columns>
                    <asp:BoundField HeaderText="Id" DataField="Id" HeaderStyle-CssClass="oculto" ItemStyle-CssClass="oculto" />
                    <asp:BoundField HeaderText="Codigo" DataField="CodigoArticulo" />
                    <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                    <asp:BoundField HeaderText="Categoria" DataField="Categorias.Descripcion" />
                    <asp:BoundField HeaderText="Marcas" DataField="Marcas.Descripcion" />
                    <asp:BoundField HeaderText="Precio" DataField="Precio" />
                    <asp:CommandField HeaderText="Accion" ShowSelectButton="true" SelectText="Eliminar de Favoritos" />
                </Columns>

            </asp:GridView>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
