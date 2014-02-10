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

public partial class Administrator_Projects : System.Web.UI.Page
{
    SqlConnection con;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnNewProject_Click(object sender, EventArgs e)
    {
        lblProjectName.Visible = true;
        txtProjectName.Visible = true;
        btnCreate.Visible = true;
    }
    protected void btnCreate_Click(object sender, EventArgs e)
    {
        con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["bugtracConnectionString1"].ToString();


        string ProjectInsert = "insert into projects values('"+txtProjectName.Text+"','1')";
        SqlCommand insert = new SqlCommand(ProjectInsert , con);

        con.Open();
        insert.ExecuteNonQuery();
        con.Close();
        GridView1.DataBind();


    }
}
