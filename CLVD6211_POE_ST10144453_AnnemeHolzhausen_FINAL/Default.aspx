<%@ Page Title="Login Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CLVD6211_POE_ST10144453_AnnemeHolzhausen_FINAL._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main>
        <section class="row" aria-labelledby="aspnetTitle">
            <h1 id="aspnetTitle">Login</h1>
        </section>

        <div class="row">
            <section class="col-md-4">
                <h2>Inspector Login</h2>
                <asp:Label ID="lblMessage" runat="server" Visible="false" CssClass="text-danger"></asp:Label>
                <asp:TextBox ID="txtInspectorEmail" runat="server" CssClass="form-control" placeholder="Inspector Email"></asp:TextBox>
                <br />
                <asp:TextBox ID="txtInspectorID" runat="server" CssClass="form-control" placeholder="Inspector ID"></asp:TextBox>
                <br />
                <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-primary" OnClick="btnLogin_Click" />
            </section>
        </div>
    </main>
</asp:Content>
