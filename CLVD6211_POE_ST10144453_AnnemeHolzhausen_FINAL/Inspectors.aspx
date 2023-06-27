<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Inspectors.aspx.cs" Inherits="CLVD6211_POE_ST10144453_AnnemeHolzhausen_FINAL.Inspectors" MasterPageFile="~/Site.Master" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Inspectors</h1>
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

        .input-field {
            margin-top: 20px;
            display: flex;
            align-items: center;
        }

        .input-field label {
            width: 120px;
            margin-right: 10px;
        }

        .input-field input[type="text"] {
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
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.5); /* Add shadow style */
            margin-left: 10px; /* Example: Add a left margin of 10px */
            margin-top: 5px;
        }

        .save-button:hover,
        .save-button:active {
            background-color: #1e7e34; /* Darker background color */
            box-shadow: 0 1px 2px rgba(0, 0, 0, 0.5);
            transform: translateY(1px);
        }

        .button-gap {
            margin-top: 10px;
        }

        .table-container {
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

        .search-button {
            /* Adjust the placement of the search button */
            margin-left: 10px; /* Example: Add a left margin of 10px */
            margin-top: 5px; /* Example: Add a top margin of 5px */
        }
    </style>

    <div>
        <a href="Contents.aspx" class="back-button">
            <img src="backIcon.png" alt="Back" /> 
        </a>
    </div>
    
    <div class="input-field">
        <label for="txtInspectorCode">Inspector Code:</label>
        <asp:TextBox ID="txtInspectorCode" runat="server"></asp:TextBox>
        <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" CssClass="save-button search-button" />
    </div>

    <div class="table-container">
        <asp:GridView ID="gridInspectors" runat="server" AutoGenerateColumns="False" OnRowCommand="gridInspectors_RowCommand">
            <Columns>
                <asp:BoundField DataField="InspectorCode" HeaderText="Inspector Code" />
                <asp:BoundField DataField="InspectorName" HeaderText="Inspector Name" />
                <asp:BoundField DataField="InspectorEmail" HeaderText="Inspector Email" />
                <asp:BoundField DataField="InspectorMobile" HeaderText="Inspector Mobile" />
                <asp:TemplateField HeaderText="Actions">
                    <ItemTemplate>
                        <asp:Button ID="btnEdit" runat="server" Text="Edit" CommandName="EditInspector" CommandArgument='<%# Container.DataItemIndex %>' CssClass="save-button" />
                        <asp:Button ID="btnDelete" runat="server" Text="Delete" CommandName="DeleteInspector" CommandArgument='<%# Container.DataItemIndex %>' CssClass="back-button" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>

    <div class="button-gap"></div>

    <h2>Add New Inspector</h2>

    <div class="input-field">
        <label for="txtNewInspectorCode">Inspector Code:</label>
        <asp:TextBox ID="txtNewInspectorCode" runat="server"></asp:TextBox>
    </div>
    
    <div class="input-field">
        <label for="txtNewInspectorName">Inspector Name:</label>
        <asp:TextBox ID="txtNewInspectorName" runat="server"></asp:TextBox>
    </div>

    <div class="input-field">
        <label for="txtNewInspectorEmail">Inspector Email:</label>
        <asp:TextBox ID="txtNewInspectorEmail" runat="server"></asp:TextBox>
    </div>

    <div class="input-field">
        <label for="txtNewInspectorMobile">Inspector Mobile:</label>
        <asp:TextBox ID="txtNewInspectorMobile" runat="server"></asp:TextBox>
    </div>
    
    <asp:Button ID="btnSaveNewInspector" runat="server" Text="Save" CssClass="save-button" OnClick="btnSaveNewInspector_Click" />

    <div class="button-gap"></div>

    <asp:Button ID="btnViewAllInspectors" runat="server" Text="View All Inspectors" CssClass="save-button" OnClick="btnViewAllInspectors_Click" />
</asp:Content>
