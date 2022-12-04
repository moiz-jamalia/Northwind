<%@ Page Title="Region Management" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RegionsManagement.aspx.cs" Inherits="Northwind_Newsletter_Moiz_Jamalia.RegionsManagement" %>

<asp:Content ID="NavigationContent" ContentPlaceHolderID="navigation" runat="server">Regions</asp:Content>
<asp:Content ID="ContentControl" ContentPlaceHolderID="content" runat="server">
    <link href="RegionsManagement-styles.css" rel="stylesheet" runat="server" />
    <div class="input">
        <asp:TextBox ID="tbRegion" runat="server" CssClass="tbRegionManagement" />
        <asp:Button ID="btnAdd" Text="ADD" OnClick="OnBtnAdd_Click" runat="server" CssClass="btnRegionManagement" />
        <asp:Button ID="btnDelete" Text="DELETE" OnClick="OnBtnDelete_Click" runat="server" CssClass="btnRegionManagement" />
        <asp:Button ID="btnBigSmall" Text="BIG/SMALL" OnClick="OnBtnBigSmall_Click" runat="server" CssClass="btnRegionManagement" />
    </div>
    <br />
    <asp:Label ID="lbIfNotExist" runat="server" CssClass="validator" />
    <br />
    <br />
    <asp:GridView ID="gvRegion" runat="server" CssClass="tableDesign" OnRowDataBound="GvRegion_RowDataBound" />
</asp:Content>
