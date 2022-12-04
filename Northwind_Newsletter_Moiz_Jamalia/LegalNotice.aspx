<%@ Page Title="Legal Notice" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LegalNotice.aspx.cs" Inherits="Northwind_Newsletter_Moiz_Jamalia.LegalNotice" %>

<asp:Content ID="Content1" ContentPlaceHolderID="navigation" runat="server">Legal Notice</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <link href="LegalNotice-styles.css" rel="stylesheet" runat="server" />
    <div class="BigCenter">
        <p>
            This is a project by:
        </p>
        <p>
            Moiz Jamalia
        </p>
        <p>
            Tonhallestrasse 52
        </p>
        <p>
            CH 9500 Wil SG
        </p>
        <p>
            <a id="emailAnchor" href="mailto:moiz.jamalia@ksb-sg.ch">moiz.jamalia@ksb-sg.ch</a>
        </p>
    </div>
</asp:Content>
