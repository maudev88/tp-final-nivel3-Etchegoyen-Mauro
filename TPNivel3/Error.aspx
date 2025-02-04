<%@ Page Title="" Language="C#" MasterPageFile="~/MasterMind.Master" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="TPNivel3.Error" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="mb-4">Error</h1>
    <div class="d-flex flex-column gap-3">
         <asp:Label Text="text" ID="lblError" runat="server" />
    <a href="Default.aspx">Inicio</a>
    </div>

</asp:Content>
