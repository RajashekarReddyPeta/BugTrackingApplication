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
using System.Data.SqlClient;

public partial class Administrator_Status : System.Web.UI.Page
{
    SqlConnection con;
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnCreate_Click(object sender, EventArgs e)
    {
        con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["bugtracConnectionString1"].ToString();


        string StatusInsert = "insert into statuses values('" + txtStatusName.Text + "')";
        SqlCommand insert = new SqlCommand(StatusInsert, con);

        con.Open();
        insert.ExecuteNonQuery();
        con.Close();
        GridView1.DataBind();

    }
    protected void btnNewStatus_Click(object sender, EventArgs e)
    {
        lblStatusName.Visible = true;
        txtStatusName.Visible = true;
        btnCreate.Visible = true;
    }
}
