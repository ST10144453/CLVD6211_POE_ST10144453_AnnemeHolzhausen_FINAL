<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="CLVD6211_POE_ST10144453_AnnemeHolzhausen_FINAL.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>.content-wrapper {
    overflow: hidden; /* Clear the float and contain the floated elements */
}

.float-right {
    float: right; /* Float the image to the right */
    margin: 0 0 10px 10px; /* Adjust the margin as needed */
}

.image-description {
    margin-bottom: 10px; /* Adjust the margin as needed */
}

</style>
   <main aria-labelledby="title">
    <h2 id="title"><%: Title %>.</h2>
    <div class="content-wrapper">
        <img src="Sammy Sam.jpeg" alt="Image description" class="float-right" width="256" height="256" />
        <p><i>The Ride You Rent</i> is a new start-up that hopes to solve that issue by providing drivers with the ability to rent out a car for a specified amount of time to perform their regular e-hailing duties and once done they can return the vehicle and not have to worry about the maintenance. </p>
        <p>Sammy Sam, pictured on the right, started the planning process for this service in 2022 with nothing but a dream and a revolutionary idea to hopefully change the e-hailing service industry forever. Today, <i>The Ride You Rent</i> has over 9 different cars available for renting and with 4 talented inspectors added to the team, <i>The Ride You Rent</i> is now as unstoppable as ever. </p>
    </div>
</main>
</asp:Content>

