﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Rentals.aspx.cs" Inherits="CLVD6211_POE_ST10144453_AnnemeHolzhausen_FINAL.Rentals" MasterPageFile="~/Site.Master" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <h1>Rentals</h1>
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
            margin-left: 10px;
            margin-top: 5px;
        }

        .btn-view-all {
            background-color: #2979FF;
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

        .btn-view-all:hover,
        .btn-view-all:active {
            background-color: #0D47A1;
            box-shadow: 0 1px 2px rgba(0, 0, 0, 0.5);
            transform: translateY(1px);
        }

        .btn-view-all:checked + .table-container {
            display: block;
        }
    </style>

    <div>
        <!-- Back button -->
        <a href="Contents.aspx" class="back-button">
            <img src="backIcon.png" alt="Back" /> 
        </a>
    </div>
    
    <div class="input-field">
        <!-- Rental ID search -->
        <label for="txtRentalID">Rental ID:</label>
        <asp:TextBox ID="txtRentalID" runat="server"></asp:TextBox>
        <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" CssClass="save-button search-button" />
    </div>

    <div class="table-container">
        <!-- Rentals grid view -->
     <asp:GridView ID="gvRentals" runat="server" AutoGenerateColumns="False">
    <Columns>
        <!-- Define columns for displaying rental data -->
        <asp:BoundField DataField="RentalID" HeaderText="Rental ID" />
        <asp:BoundField DataField="CarNumber" HeaderText="Car Number" />
        <asp:BoundField DataField="Inspector" HeaderText="Inspector" />
        <asp:BoundField DataField="Driver" HeaderText="Driver" />
        <asp:BoundField DataField="RentalFee" HeaderText="Rental Fee" />
        <asp:BoundField DataField="StartDate" HeaderText="Start Date" DataFormatString="{0:yyyy-MM-dd}" />
        <asp:BoundField DataField="EndDate" HeaderText="End Date" DataFormatString="{0:yyyy-MM-dd}" />
    </Columns>
</asp:GridView>

<!-- Add these labels to display rental details -->
<label>Rental ID:</label>
<asp:Label ID="lblRentalID" runat="server" Text=""></asp:Label>

<label>Car Number:</label>
<asp:Label ID="lblCarNumber" runat="server" Text=""></asp:Label>

<label>Inspector:</label>
<asp:Label ID="lblInspector" runat="server" Text=""></asp:Label>

<label>Driver:</label>
<asp:Label ID="lblDriver" runat="server" Text=""></asp:Label>

<label>Rental Fee:</label>
<asp:Label ID="lblRentalFee" runat="server" Text=""></asp:Label>

<label>Start Date:</label>
<asp:Label ID="lblStartDate" runat="server" Text=""></asp:Label>

<label>End Date:</label>
<asp:Label ID="lblEndDate" runat="server" Text=""></asp:Label>


    <div class="button-gap"></div>

    <!-- Add New Rental section -->
    <h2>Add New Rental</h2>

    <div class="input-field">
        <label for="txtCarNumber">Car Number:</label>
        <asp:TextBox ID="txtCarNumber" runat="server"></asp:TextBox>
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
        <label for="txtRentalFee">Rental Fee:</label>
        <asp:TextBox ID="txtRentalFee" runat="server"></asp:TextBox>
    </div>
    
    <div class="input-field">
        <label for="txtStartDate">Start Date:</label>
        <asp:TextBox ID="txtStartDate" runat="server"></asp:TextBox>
        <asp:ImageButton ID="imgStartDate" runat="server" ImageUrl="calendar_icon.png" OnClick="imgStartDate_Click" Width="25px" Height="25px" />
        <asp:Calendar ID="calStartDate" runat="server" OnSelectionChanged="calStartDate_SelectionChanged" Visible="False"></asp:Calendar>
    </div>

    <div class="input-field">
        <label for="txtEndDate">End Date:</label>
        <asp:TextBox ID="txtEndDate" runat="server"></asp:TextBox>
        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="calendar_icon.png" OnClick="imgStartDate_Click" Width="25px" Height="25px" />
        <asp:Calendar ID="calEndDate" runat="server" OnSelectionChanged="calEndDate_SelectionChanged" Visible="False"></asp:Calendar>
    </div>
    
    <!-- Save button for creating a new rental -->
    <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="save-button" OnClick="btnSave_Click" />

    <div class="button-gap"></div>

    <!-- View All Rentals button -->
    <asp:Button ID="btnViewAllRentals" runat="server" Text="View All Rentals" CssClass="btn-view-all" OnClick="btnViewAllRentals_Click" />

</asp:Content>
