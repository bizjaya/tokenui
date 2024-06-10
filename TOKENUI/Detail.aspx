<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Detail.aspx.cs" Inherits="_Detail" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
        <div class="container mt-5">
            <h2>Token Details</h2>
            <table class="table table-bordered">
                <tr>
                    <th>Contract Address</th>
                    <td><asp:Label ID="ContractAddressLabel" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <th>Price</th>
                    <td><asp:Label ID="PriceLabel" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <th>Total Supply</th>
                    <td><asp:Label ID="TotalSupplyLabel" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <th>Total Holders</th>
                    <td><asp:Label ID="TotalHoldersLabel" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <th>Name</th>
                    <td><asp:Label ID="NameLabel" runat="server"></asp:Label></td>
                </tr>
            </table>
        </div>
</asp:Content>
