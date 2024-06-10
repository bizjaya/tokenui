<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-5">
        <div class="row">
            <div class="col-md-6">
                <h2>Manage ERC Tokens</h2>
                <div class="form-group">
                    <asp:Label ID="Label1" runat="server" Text="Name"></asp:Label>
                    <asp:TextBox ID="NameTextBox" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label2" runat="server" Text="Symbol"></asp:Label>
                    <asp:TextBox ID="SymbolTextBox" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label3" runat="server" Text="Contract Address"></asp:Label>
                    <asp:TextBox ID="ContractAddressTextBox" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label4" runat="server" Text="Total Supply"></asp:Label>
                    <asp:TextBox ID="TotalSupplyTextBox" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label5" runat="server" Text="Total Holders"></asp:Label>
                    <asp:TextBox ID="TotalHoldersTextBox" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Button ID="SaveButton" runat="server" Text="Save" OnClick="SaveButton_Click" CssClass="btn btn-primary" />
                    <asp:Button ID="ResetButton" runat="server" Text="Reset" OnClick="ResetButton_Click" CssClass="btn btn-secondary" />
                </div>
            </div>
            <div class="col-md-6">
                <h2>Total Supply by Token</h2>
                <canvas id="tokenPieChart" width="400" height="400"></canvas>
            </div>
        </div>
        <div class="row mt-5">
            <div class="col-md-12">
                <h2>Token List</h2>
                <asp:Button ID="ExportButton" runat="server" Text="Export to CSV" OnClick="ExportButton_Click" CssClass="btn btn-success mb-3" />
                <asp:GridView ID="TokenGridView" runat="server" AutoGenerateColumns="False" PageSize="10" AllowPaging="True" CssClass="table table-striped"
                    OnPageIndexChanging="TokenGridView_PageIndexChanging" OnRowEditing="TokenGridView_RowEditing"
                    OnRowUpdating="TokenGridView_RowUpdating" OnRowCancelingEdit="TokenGridView_RowCancelingEdit"
                    DataKeyNames="Id">
                    <Columns>
                        <asp:TemplateField HeaderText="Rank">
                            <ItemTemplate>
                                <%# Container.DataItemIndex + 1 %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Name" HeaderText="Name" />
                        <asp:TemplateField HeaderText="Symbol">
                            <ItemTemplate>
                                <asp:HyperLink ID="SymbolLink" runat="server" NavigateUrl='<%# "detail.aspx?id=" + Eval("Symbol") %>' Text='<%# Eval("Symbol") %>'></asp:HyperLink>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="SymbolTextBox" runat="server" Text='<%# Bind("Symbol") %>' CssClass="form-control"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Contract Address">
                            <ItemTemplate>
                                <asp:Label ID="ContractAddressLabel" runat="server" Text='<%# Bind("ContractAddress") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="ContractAddressTextBox" runat="server" Text='<%# Bind("ContractAddress") %>' CssClass="form-control"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Total Supply">
                            <ItemTemplate>
                                <asp:Label ID="TotalSupplyLabel" runat="server" Text='<%# Bind("TotalSupply") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TotalSupplyTextBox" runat="server" Text='<%# Bind("TotalSupply") %>' CssClass="form-control"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Total Holders">
                            <ItemTemplate>
                                <asp:Label ID="TotalHoldersLabel" runat="server" Text='<%# Bind("TotalHolders") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TotalHoldersTextBox" runat="server" Text='<%# Bind("TotalHolders") %>' CssClass="form-control"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowEditButton="True" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
    <script>
        function updateChart(data) {
            var ctx = document.getElementById('tokenPieChart').getContext('2d');
            var colors = [
                '#FF6384', '#36A2EB', '#FFCE56', '#4BC0C0', '#9966FF',
                '#FF9F40', '#FFCD56', '#4BC0C0', '#FF6384', '#36A2EB'
            ];
            while (data.labels.length > colors.length) {
                colors = colors.concat(colors);
            }
            new Chart(ctx, {
                type: 'pie',
                data: {
                    labels: data.labels,
                    datasets: [{
                        data: data.values,
                        backgroundColor: colors.slice(0, data.labels.length)
                    }]
                }
            });
        }
    </script>
</asp:Content>
