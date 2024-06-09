<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>



<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">


        <div style="width: 45%; float: left;">
            <h2>Manage ERC Tokens</h2>
            <asp:Label ID="Label1" runat="server" Text="Name"></asp:Label>
            <asp:TextBox ID="NameTextBox" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label2" runat="server" Text="Symbol"></asp:Label>
            <asp:TextBox ID="SymbolTextBox" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label3" runat="server" Text="Contract Address"></asp:Label>
            <asp:TextBox ID="ContractAddressTextBox" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label4" runat="server" Text="Total Supply"></asp:Label>
            <asp:TextBox ID="TotalSupplyTextBox" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label5" runat="server" Text="Total Holders"></asp:Label>
            <asp:TextBox ID="TotalHoldersTextBox" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="SaveButton" runat="server" Text="Save" OnClick="SaveButton_Click" />
            <asp:Button ID="ResetButton" runat="server" Text="Reset" OnClick="ResetButton_Click" />
        </div>
        <div style="width: 45%; float: right;">
            <h2>Total Supply by Token</h2>
            <canvas id="tokenPieChart" width="400" height="400"></canvas>
        </div>
        <div style="clear: both; padding-top: 20px;">
            <h2>Token List</h2>
            <asp:Button ID="ExportButton" runat="server" Text="Export to CSV" OnClick="ExportButton_Click" />
<asp:GridView ID="TokenGridView" runat="server" AutoGenerateColumns="False" PageSize="10" AllowPaging="True"
    OnPageIndexChanging="TokenGridView_PageIndexChanging"
    OnRowEditing="TokenGridView_RowEditing"
    OnRowUpdating="TokenGridView_RowUpdating"
    OnRowCancelingEdit="TokenGridView_RowCancelingEdit"
    DataKeyNames="Id">
    <Columns>
        <asp:BoundField DataField="Name" HeaderText="Name" />
        <asp:TemplateField HeaderText="Symbol">
            <ItemTemplate>
                <asp:Label ID="SymbolLabel" runat="server" Text='<%# Bind("Symbol") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="SymbolTextBox" runat="server" Text='<%# Bind("Symbol") %>'></asp:TextBox>
            </EditItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Contract Address">
            <ItemTemplate>
                <asp:Label ID="ContractAddressLabel" runat="server" Text='<%# Bind("ContractAddress") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="ContractAddressTextBox" runat="server" Text='<%# Bind("ContractAddress") %>'></asp:TextBox>
            </EditItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Total Supply">
            <ItemTemplate>
                <asp:Label ID="TotalSupplyLabel" runat="server" Text='<%# Bind("TotalSupply") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="TotalSupplyTextBox" runat="server" Text='<%# Bind("TotalSupply") %>'></asp:TextBox>
            </EditItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Total Holders">
            <ItemTemplate>
                <asp:Label ID="TotalHoldersLabel" runat="server" Text='<%# Bind("TotalHolders") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="TotalHoldersTextBox" runat="server" Text='<%# Bind("TotalHolders") %>'></asp:TextBox>
            </EditItemTemplate>
        </asp:TemplateField>
        <asp:CommandField ShowEditButton="True" />
    </Columns>
</asp:GridView>


        </div>

    <script>
        function updateChart(data) {
            var ctx = document.getElementById('tokenPieChart').getContext('2d');
            new Chart(ctx, {
                type: 'pie',
                data: {
                    labels: data.labels,
                    datasets: [{
                        data: data.values,
                        backgroundColor: ['#FF6384', '#36A2EB', '#FFCE56', '#FF6384', '#36A2EB']
                    }]
                }
            });
        }
    </script>

    </asp:Content>

