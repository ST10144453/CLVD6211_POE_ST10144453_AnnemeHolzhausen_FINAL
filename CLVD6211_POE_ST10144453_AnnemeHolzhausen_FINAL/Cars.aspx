<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cars.aspx.cs" Inherits="CLVD6211_POE_ST10144453_AnnemeHolzhausen_FINAL.Cars" MasterPageFile="~/Site.Master" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Cars</h1>
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

        .save-button{
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
        <label for="txtCarID">Car ID:</label>
        <asp:TextBox ID="txtCarID" runat="server"></asp:TextBox>
        <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" CssClass="save-button search-button" />
    </div>

    <div class="table-container">
        <asp:GridView ID="gridCars" runat="server" AutoGenerateColumns="False" OnRowCommand="gridCars_RowCommand">
            <Columns>
                <asp:BoundField DataField="CarID" HeaderText="Car ID" />
                <asp:BoundField DataField="CarMake" HeaderText="Car Make" />
                <asp:BoundField DataField="CarModel" HeaderText="Car Model" />
                <asp:TemplateField HeaderText="Actions">
                    <ItemTemplate>
                        <asp:Button ID="btnEdit" runat="server" Text="Edit" CommandName="EditCar" CommandArgument='<%# Container.DataItemIndex %>' CssClass="save-button" />
                        <asp:Button ID="btnDelete" runat="server" Text="Delete" CommandName="DeleteCar" CommandArgument='<%# Container.DataItemIndex %>' CssClass="back-button" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>

    <div class="button-gap"></div>

    <h2>Add New Car</h2>

    <div class="input-field">
        <label for="txtNewCarMake">Car Make:</label>
        <asp:TextBox ID="txtNewCarMake" runat="server"></asp:TextBox>
    </div>
    
    <div class="input-field">
        <label for="txtNewCarModel">Car Model:</label>
        <asp:TextBox ID="txtNewCarModel" runat="server"></asp:TextBox>
    </div>

    <div class="input-field">
        <label for="txtNewCarID">Car ID:</label>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    </div>
    
    <asp:Button ID="btnSaveNewCar" runat="server" Text="Save" CssClass="save-button" OnClick="btnSaveNewCar_Click" />

    <div class="button-gap"></div>

    <asp:Button ID="btnViewAllCars" runat="server" Text="View All Cars" CssClass="save-button" OnClick="btnViewAllCars_Click" />
</asp:Content>
