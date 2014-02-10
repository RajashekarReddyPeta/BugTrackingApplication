using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Web.Configuration.Common;

public partial class search : System.Web.UI.Page
{
    int a = 0;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            rbnor.Checked = true;
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (ddlbid.SelectedItem.Text =="select")
            ddlbid.SelectedValue = Convert.ToString(a);
        if (ddlpid.SelectedItem.Text == "select")
            ddlpid.SelectedValue = Convert.ToString(a);
        if(ddlp.SelectedItem.Text=="select")
            ddlp.SelectedValue = Convert.ToString(a);
        if (ddlstatus.SelectedItem.Text == "select")
            ddlstatus.SelectedValue = Convert.ToString(a);
        
        if (rbnor.Checked == true)
        {
            GridView2.Visible = true;
            GridView1.Visible = false;
        }
        else if (rbnand.Checked == true)
        {
            GridView2.Visible = false;
            GridView1.Visible = true;
        }
    }
    protected void btnBasicSearch_Click(object sender, EventArgs e)
    {
        GridView3.Visible = true;
    }
}
