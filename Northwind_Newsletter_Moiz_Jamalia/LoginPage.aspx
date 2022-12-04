<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="Northwind_Newsletter_Moiz_Jamalia.LoginPage" %>

<asp:Content ID="NavigationConent" ContentPlaceHolderID="navigation" runat="server">Login</asp:Content>
<asp:Content ID="contentControl" ContentPlaceHolderID="content" runat="server">
    <link href="login-styles.css" rel="stylesheet" runat="server" />
    <p>
        <asp:Literal ID="literalInfo" runat="server" />
    </p>
    <br />
    <asp:Label Text="firstName" runat="server">First Name</asp:Label>
    <br />
    <asp:TextBox ID="tbFirstName" runat="server" />
    <asp:RequiredFieldValidator ID="reqFieldVal1" ErrorMessage="Please fill in this field" ControlToValidate="tbFirstName" runat="server" CssClass="validator" Display="Dynamic" />
    <asp:RegularExpressionValidator ID="regexVal1" ErrorMessage="Please enter a valid first name" ControlToValidate="tbFirstName" runat="server" ValidationExpression="[a-zA-ZäÄöÖüÜ]+[a-zA-ZäÄöÖüÜ]+" CssClass="validator" Display="Dynamic" />
    <br />
    <br />
    <asp:Label Text="lastName" runat="server">Last Name</asp:Label>
    <br />
    <asp:TextBox ID="tbLastName" runat="server" />
    <asp:RequiredFieldValidator ID="reqFieldVal2" ErrorMessage="Please fill in this field" ControlToValidate="tbLastName" runat="server" CssClass="validator" Display="Dynamic" />
    <asp:RegularExpressionValidator ID="regexVal2" ErrorMessage="Please enter a valid last name" ControlToValidate="tbLastName" runat="server" ValidationExpression="[a-zA-ZäÄöÖüÜ]+[a-zA-ZäÄöÖüÜ]+" CssClass="validator" Display="Dynamic" />
    <br />
    <br />
    <asp:Label Text="email" runat="server">E-Mail</asp:Label>
    <br />
    <asp:TextBox ID="tbEmail" runat="server" />
    <asp:RequiredFieldValidator ID="reqFieldVal3" ErrorMessage="Please fill in this field" ControlToValidate="tbEmail" runat="server" CssClass="validator" Display="Dynamic" />
    <asp:RegularExpressionValidator ID="regexVal3" ErrorMessage="Please enter a valid email address" ControlToValidate="tbEmail" runat="server" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" CssClass="validator" Display="Dynamic" />
    <br />
    <br />
    <asp:Label runat="server" Text="Birthday">Birthday</asp:Label>
    <br />
    <asp:TextBox ID="tbBirthday" runat="server" CssClass="tbBirthday" />
    <asp:RequiredFieldValidator ID="reqFieldVal4" ErrorMessage="Please fill in this field" ControlToValidate="tbBirthday" runat="server" CssClass="validator" Display="Dynamic" />
    <asp:RangeValidator ID="rangeValBirthday" ErrorMessage="Please enter a valid date" ControlToValidate="tbBirthday" runat="server" Type="Date" MinimumValue="01.01.1900" CssClass="validator" Display="Dynamic" />
    <br />
    <br />
    <asp:CheckBox ID="checkAGB" runat="server" Text="I accept the terms and conditions" CssClass="checkBox" />
    <asp:CustomValidator ID="customVal1" OnServerValidate="CheckBoxValidator" ErrorMessage="You must accept the terms of use" runat="server" CssClass="validator" Display="Dynamic" />
    <br />
    <br />
    <asp:Button type="submit" ID="btnSubmit" runat="server" Text="Log In" OnClick="OnBtnSubmit" CssClass="btnSubmit" />
</asp:Content>
