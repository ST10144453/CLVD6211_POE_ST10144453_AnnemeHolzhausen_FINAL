<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contents.aspx.cs" Inherits="CLVD6211_POE_ST10144453_AnnemeHolzhausen_FINAL.WebForm1" MasterPageFile="~/Site.Master" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .image-container {
            display: flex;
        }
        .image-container figure {
            margin-right: 10px; /* Adjust the spacing between images if needed */
            text-align: center;
        }
        .image-container img {
            display: block;
            margin-bottom: 5px; /* Adjust the spacing between image and caption if needed */
        }
    </style>
    <text>Click on the image to take you to its corresponding table.</text>
    <div class="image-container">
        <figure>
            <a href="Cars.aspx">
                <img src="car_cars.jpg" alt="Image 1" style="width: 200px; height: 150px;" />
                <figcaption>Cars</figcaption>
            </a>
        </figure>
        <figure>
            <a href="Drivers.aspx">
                <img src="car_driver.jpg" alt="Image 2" style="width: 200px; height: 150px;" />
                <figcaption>Drivers</figcaption>
            </a>
        </figure>
        <figure>
            <a href="Inspectors.aspx">
                <img src="car_inspector.jpg" alt="Image 3" style="width: 200px; height: 150px;" />
                <figcaption>Inspectors</figcaption>
            </a>
        </figure>
        <figure>
            <a href="Rentals.aspx">
                <img src="car_rental.jpg" alt="Image 4" style="width: 200px; height: 150px;" />
                <figcaption>Rentals</figcaption>
            </a>
        </figure>
        <figure>
            <a href="Returns.aspx">
                <img src="car_return.jpg" alt="Image 5" style="width: 200px; height: 150px;" />
                <figcaption>Returns</figcaption>
            </a>
        </figure>
    </div>
    
</asp:Content>
