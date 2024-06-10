using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

public partial class _Detail : System.Web.UI.Page
{
    private TokenDbContext _context = new TokenDbContext();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string symbol = Request.QueryString["id"];
            if (!string.IsNullOrEmpty(symbol))
            {
                var token = _context.Tokens.FirstOrDefault(t => t.Symbol == symbol);
                if (token != null)
                {
                    ContractAddressLabel.Text = token.ContractAddress;
                    PriceLabel.Text = token.Price.ToString();
                    TotalSupplyLabel.Text = token.TotalSupply.ToString();
                    TotalHoldersLabel.Text = token.TotalHolders.ToString();
                    NameLabel.Text = token.Name;
                }
            }
        }
    }
}