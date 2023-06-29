<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Returns.aspx.cs" Inherits="CLVD6211_POE_ST10144453_AnnemeHolzhausen_FINAL.Returns" MasterPageFile="~/Site.Master" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Returns</h1>
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

        .input-field input[type="text"],
        .input-field input[type="date"] {
            flex: 1;
        }

        .save-button {
            background-color: #38C140;
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

        .calendar-icon {
            width: 20px;
            height: 20px;
            vertical-align: middle;
            margin-right: 5px;
        }
    </style>

    <div class="input-field">
        <label for="txtSearchReturnID">Search Return ID:</label>
        <asp:TextBox ID="txtSearchReturnID" runat="server"></asp:TextBox>
        <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" CssClass="save-button search-button" />
    </div>

    <div>
        <a href="Contents.aspx" class="back-button">
            <img src="backIcon.png" alt="Back" />
        </a>
    </div>

    <div class="input-field">
        <label for="txtReturnID">Return ID:</label>
        <asp:TextBox ID="txtReturnID" runat="server"></asp:TextBox>
    </div>

    <div class="input-field">
        <label for="txtCarNo">Car No:</label>
        <asp:TextBox ID="txtCarNo" runat="server"></asp:TextBox>
    </div>

    <div class="input-field">
        <label for="txtInspector">Inspector:</label>
        <asp:TextBox ID="txtInspector" runat="server"></asp:TextBox>
    </div>

    <div class="input-field">
        <label for="txtDriver">Driver:</label>
        <asp:TextBox ID="txtDriver" runat="server"></asp:TextBox>
    </div>

    <div class="input-field">
        <label for="txtReturnDate">Return Date:</label>
        <asp:TextBox ID="txtReturnDate" runat="server"></asp:TextBox>
        <asp:Calendar ID="calReturnDate" runat="server" OnSelectionChanged="calReturnDate_SelectionChanged" Visible="false"></asp:Calendar>
        <asp:ImageButton ID="imgReturnDate" runat="server" ImageUrl="calendar_icon.png" CssClass="calendar-icon" OnClientClick="return showCalendar('txtReturnDate');" />
    </div>

    <div class="button-gap">
        <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="save-button" OnClick="btnSave_Click" />
    </div>
    <asp:Button ID="btnViewAllReturns" runat="server" Text="View All Returns" CssClass="save-button" OnClick="btnViewAllReturns_Click" />

    <div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="true"></asp:GridView>
    </div>

    <div>
        <asp:Label ID="ReturnIDLabel" runat="server"></asp:Label>
        <asp:Label ID="CarNoLabel" runat="server"></asp:Label>
        <asp:Label ID="InspectorLabel" runat="server"></asp:Label>
        <asp:Label ID="DriverLabel" runat="server"></asp:Label>
        <asp:Label ID="ReturnDateLabel" runat="server"></asp:Label>
        <asp:Label ID="StatusLabel" runat="server"></asp:Label>
    </div>
</asp:Content>

