<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Drivers.aspx.cs" Inherits="CLVD6211_POE_ST10144453_AnnemeHolzhausen_FINAL.Drivers" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Drivers</h2>
    <style>
    .back-button {
        background-color: transparent;
        padding: 10px;
        border: none;
        text-decoration: none;
        margin-top: 20px;
    }

    .back-button img {
        margin-right: 5px;
        width: 49.75px;
        height: 26.24px;
        vertical-align: middle;
    }

    .input-container {
        margin-top: 20px;
        display: flex;
        align-items: center;
    }

    .input-container label {
        width: 120px;
        margin-right: 10px;
    }

    .input-container input[type="text"] {
        flex: 1;
    }

    .save-button {
        background-color: #30A043;
        color: white;
        padding: 10px 20px;
        border: none;
        text-decoration: none;
        margin-top: 20px;
        border-radius: 20px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.5);
        margin-left: 10px;
        margin-top: 5px;
    }

    .save-button:hover,
    .save-button:active {
        background-color: #1e7e34;
        box-shadow: 0 1px 2px rgba(0, 0, 0, 0.5);
        transform: translateY(1px);
    }

    .button-gap {
        margin-top: 10px;
    }

    .grid-container {
        margin-top: 30px;
        display: none;
    }

    table {
        width: 100%;
        border-collapse: collapse;
    }

    th, td {
        padding: 8px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }

    th {
        background-color: #f2f2f2;
    }
</style>

    <asp:Label ID="lblDriverInfo" runat="server"></asp:Label>
<asp:Label ID="lblMessage" runat="server"></asp:Label>

<div>
    <a href="Contents.aspx" class="back-button">
        <img src="backIcon.png" alt="Back" /> 
    </a>
</div>

<!-- Search Input -->
<div class="input-container">
    <label for="txtDriverID">Driver ID:</label>
    <input type="text" id="txtDriverID" runat="server" />
    <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" CssClass="save-button" />
</div>

<!-- Driver Information -->
<div id="divDriverInfo" runat="server" class="grid-container">
    <table>
        <tr>
            <th>Driver ID</th>
            <th>Driver Name</th>
            <th>Driver Address</th>
            <th>Email</th>
            <th>Mobile</th>
        </tr>
        <asp:Repeater ID="rptDriverInfo" runat="server">
            <ItemTemplate>
                <tr>
                    <td><%# Eval("DriverID") %></td>
                    <td><%# Eval("DriverName") %></td>
                    <td><%# Eval("DriverAddress") %></td>
                    <td><%# Eval("Email") %></td>
                    <td><%# Eval("Mobile") %></td>
                </tr>
            </ItemTemplate>
        </asp:Repeater>
    </table>
</div>

<div class="grid-container">
    <asp:GridView ID="gridCars" runat="server" AutoGenerateColumns="False" CssClass="grid-view">
        <Columns>
            <asp:BoundField DataField="DriverID" HeaderText="Driver ID" />
            <asp:BoundField DataField="DriverName" HeaderText="Driver Name" />
            <asp:BoundField DataField="DriverAddress" HeaderText="Driver Address" />
            <asp:BoundField DataField="DriverEmail" HeaderText="Driver Email" />
            <asp:BoundField DataField="DriverMobile" HeaderText="Driver Mobile" />
            <asp:TemplateField HeaderText="Actions">
                <ItemTemplate>
                    <asp:LinkButton ID="btnEdit" runat="server" CommandName="EditDriver" CommandArgument='<%# Container.DataItemIndex %>' CssClass="save-button">Edit</asp:LinkButton>
                    <asp:LinkButton ID="btnDelete" runat="server" CommandName="DeleteDriver" CommandArgument='<%# Container.DataItemIndex %>' CssClass="back-button">Delete</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:Label ID="lblNoResults" runat="server" Text="No results found." Visible="false"></asp:Label>
</div>

<div class="button-gap"></div>

<h2>Add New Driver</h2>

<div class="input-container">
    <label for="txtNewDriverID">Driver ID:</label>
    <asp:TextBox ID="txtNewDriverID" runat="server"></asp:TextBox>
</div>

<div class="input-container">
    <label for="txtNewDriverName">Driver Name:</label>
    <asp:TextBox ID="txtNewDriverName" runat="server"></asp:TextBox>
</div>

<div class="input-container">
    <label for="txtNewDriverAddress">Driver Address:</label>
    <asp:TextBox ID="txtNewDriverAddress" runat="server"></asp:TextBox>
</div>

<div class="input-container">
    <label for="txtNewDriverEmail">Driver Email:</label>
    <asp:TextBox ID="txtNewDriverEmail" runat="server"></asp:TextBox>
</div>

<div class="input-container">
    <label for="txtNewDriverMobile">Driver Mobile:</label>
    <asp:TextBox ID="txtNewDriverMobile" runat="server"></asp:TextBox>
</div>

<div class="button-container">
    <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" CssClass="save-button" />
    <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" CssClass="save-button" Visible="false" />
    <asp:Button ID="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click" CssClass="back-button" Visible="false" />
</div>
</asp:Content>


