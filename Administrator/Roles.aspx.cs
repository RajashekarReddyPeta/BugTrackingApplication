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

public partial class Administrator_Roles : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnNewRole_Click(object sender, EventArgs e)
    {

        lblRoleName.Visible = true;
        txtRoleName.Visible = true;
        btnCreate.Visible = true;
    }
    protected void btnCreate_Click(object sender, EventArgs e)
    {
        Roles.CreateRole(txtRoleName.Text);
        GridView1.DataBind();

    }
}
