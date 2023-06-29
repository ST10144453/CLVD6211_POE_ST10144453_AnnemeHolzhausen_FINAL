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
    <h2>Search Inspector</h2>
    <div class="input-field">
        <label for="txtInspectorID">Inspector ID:</label>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    </div>
    <div class="button-gap">
        <asp:Button ID="Button1" runat="server" Text="Search" OnClick="btnSearch_Click" />
    </div>
</div>
<div id="pnlInspectorInfo" runat="server" visible="false">
    <h2>Inspector Information</h2>
    <div>
        <label>Inspector No:</label>
        <asp:Label ID="lblInspectorNo" runat="server"></asp:Label>
    </div>
    <div>
        <label>Inspector Name:</label>
        <asp:Label ID="lblInspectorName" runat="server"></asp:Label>
    </div>
    <div>
        <label>Email:</label>
        <asp:Label ID="lblEmail" runat="server"></asp:Label>
    </div>
    <div>
        <label>Mobile:</label>
        <asp:Label ID="lblMobile" runat="server"></asp:Label>
    </div>
</div>
<div>
    <asp:Label ID="lblMessage" runat="server"></asp:Label>
</div>

    <div>
        <a href="Contents.aspx" class="back-button">
            <img src="backIcon.png" alt="Back" /> 
        </a>
    </div>
    
  <div class="input-field">
    <label for="txtInspectorID">Inspector ID:</label>
    <asp:TextBox ID="txtInspectorID" runat="server"></asp:TextBox>
    <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" CssClass="save-button" />
</div>
<asp:GridView ID="gvInspectors" runat="server" AutoGenerateColumns="false">
    <Columns>
        <asp:BoundField DataField="InspectorNo" HeaderText="Inspector ID" />
        <asp:BoundField DataField="InspectorName" HeaderText="Inspector Name" />
        <asp:BoundField DataField="Email" HeaderText="Email" />
        <asp:BoundField DataField="Mobile" HeaderText="Mobile" />
    </Columns>
</asp:GridView>


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

    <!-- Search form -->
<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
<asp:Button ID="Button2" runat="server" Text="Search" OnClick="btnSearch_Click" />

<!-- Inspector information panel -->
<asp:Panel ID="Panel1" runat="server" Visible="false">
    <label>Inspector Number:</label>
    <asp:Label ID="Label1" runat="server"></asp:Label><br />

    <label>Inspector Name:</label>
    <asp:Label ID="Label2" runat="server"></asp:Label><br />

    <label>Email:</label>
    <asp:Label ID="Label3" runat="server"></asp:Label><br />

    <label>Mobile:</label>
    <asp:Label ID="Label4" runat="server"></asp:Label><br />

    <!-- Update button -->
    <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" Visible="false" />

    <!-- Delete button -->
    <asp:Button ID="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click" Visible="false" />
</asp:Panel>

<!-- Error message label -->
<asp:Label ID="Label5" runat="server"></asp:Label>


</asp:Content>
