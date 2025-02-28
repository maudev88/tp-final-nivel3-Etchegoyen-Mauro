<%@ Page Title="" Language="C#" MasterPageFile="~/MasterMind.Master" AutoEventWireup="true" CodeBehind="Favoritos.aspx.cs" Inherits="TPNivel3.Favoritos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .oculto {
            display: none;
        }
        .box::before {
            content: "Eliminar de Favoritos";
        }
        @media screen and (max-width: 991px) {
            .ache2 {
                font-size: 43px;
            }
            .lab {
                font-size: 31px;
            }
            .box::before {
                content: "Eliminar";
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager runat="server" />
    <asp:UpdatePanel runat="server">
        <ContentTemplate>

            <h1 class="ache2" style="margin-bottom: 40px;">Favoritos</h1>

            <asp:GridView runat="server" ID="dgvArticulos" DataKeyNames="Id" CssClass="table lab"  AutoGenerateColumns="false"
                OnSelectedIndexChanged="dgvArticulos_SelectedIndexChanged" EmptyDataText="No hay Artículos agregados">

                <Columns>
                    <asp:BoundField HeaderText="Id" DataField="Id" HeaderStyle-CssClass="oculto" ItemStyle-CssClass="oculto" />
                    <asp:BoundField HeaderText="Codigo" DataField="CodigoArticulo" />
                    <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                    <asp:BoundField HeaderText="Categoria" DataField="Categorias.Descripcion" />
                    <asp:BoundField HeaderText="Marcas" DataField="Marcas.Descripcion" />
                    <asp:BoundField HeaderText="Precio" DataField="Precio" />
                    <asp:CommandField HeaderText="Acción" ShowSelectButton="true"  ControlStyle-CssClass="box" SelectText="" />
                </Columns>

            </asp:GridView>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
