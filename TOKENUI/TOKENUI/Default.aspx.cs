using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    private TokenDbContext _context = new TokenDbContext();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindGrid();
            BindChart();
        }
    }

    protected void SaveButton_Click(object sender, EventArgs e)
    {
        var token = new Token
        {
            Name = NameTextBox.Text,
            Symbol = SymbolTextBox.Text,
            ContractAddress = ContractAddressTextBox.Text,
            TotalSupply = long.Parse(TotalSupplyTextBox.Text),
            TotalHolders = int.Parse(TotalHoldersTextBox.Text)
        };

        _context.Tokens.Add(token);
        _context.SaveChanges();

        BindGrid();
        BindChart();
    }

    protected void ResetButton_Click(object sender, EventArgs e)
    {
        NameTextBox.Text = string.Empty;
        SymbolTextBox.Text = string.Empty;
        ContractAddressTextBox.Text = string.Empty;
        TotalSupplyTextBox.Text = string.Empty;
        TotalHoldersTextBox.Text = string.Empty;
    }

    protected void ExportButton_Click(object sender, EventArgs e)
    {
        var tokens = _context.Tokens.ToList();
        var csv = "Name,Symbol,ContractAddress,TotalSupply,TotalHolders\n";

        foreach (var token in tokens)
        {
            csv += $"{token.Name},{token.Symbol},{token.ContractAddress},{token.TotalSupply},{token.TotalHolders}\n";
        }

        File.WriteAllText(Server.MapPath("~/tokens.csv"), csv);
    }

    protected void TokenGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        TokenGridView.PageIndex = e.NewPageIndex;
        BindGrid();
    }

    protected void TokenGridView_RowEditing(object sender, GridViewEditEventArgs e)
    {
        TokenGridView.EditIndex = e.NewEditIndex;
        BindGrid();
    }

    protected void TokenGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        // Get the row being updated
        GridViewRow row = TokenGridView.Rows[e.RowIndex];

        // Get the data key value for the row being updated
        int id = Convert.ToInt32(TokenGridView.DataKeys[e.RowIndex].Value);

        // Find the controls in the row
      //  TextBox nameTextBox = (TextBox)row.FindControl("NameTextBox");
        TextBox symbolTextBox = (TextBox)row.FindControl("SymbolTextBox");
        TextBox contractAddressTextBox = (TextBox)row.FindControl("ContractAddressTextBox");
        TextBox totalSupplyTextBox = (TextBox)row.FindControl("TotalSupplyTextBox");
        TextBox totalHoldersTextBox = (TextBox)row.FindControl("TotalHoldersTextBox");

        // Find the token in the context
        var token = _context.Tokens.Find(id);
        if (token != null)
        {
            // Update the token properties
          //  token.Name = nameTextBox.Text;
            token.Symbol = symbolTextBox.Text;
            token.ContractAddress = contractAddressTextBox.Text;
            token.TotalSupply = long.Parse(totalSupplyTextBox.Text);
            token.TotalHolders = int.Parse(totalHoldersTextBox.Text);

            // Save changes
            _context.SaveChanges();
        }

        // Exit edit mode
        TokenGridView.EditIndex = -1;
        BindGrid();
        BindChart();
    }

    protected void TokenGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        TokenGridView.EditIndex = -1;
        BindGrid();
    }


    private void BindGrid()
    {
        TokenGridView.DataSource = _context.Tokens.ToList();
        TokenGridView.DataBind();
    }

    private void BindChart()
    {
        var tokens = _context.Tokens.ToList();
        var data = new
        {
            labels = tokens.Select(t => t.Name).ToArray(),
            values = tokens.Select(t => t.TotalSupply).ToArray()
        };

        var jsonData = JsonConvert.SerializeObject(data);
        ClientScript.RegisterStartupScript(GetType(), "updateChart", $"updateChart({jsonData});", true);
    }
}
