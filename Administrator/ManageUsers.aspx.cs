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

public partial class Administrator_ManageUsers : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection();
    //con.ConnectionString = ConfigurationManager.ConnectionStrings["bugtracConnectionString1"].ToString();

    SqlCommand cmd = new SqlCommand();
    SqlDataAdapter ad;
    DataSet dSet = new DataSet();
    DataTable dt;
    


    protected void Page_Load(object sender, EventArgs e)
    {
        con.ConnectionString = ConfigurationManager.ConnectionStrings["bugtracConnectionString1"].ToString();
        cmd.Connection = con;
        cmd.CommandType = CommandType.Text;
        

        cmd.CommandText = "select * from employees";
        ad = new SqlDataAdapter(cmd.CommandText, con);
        ad.Fill(dSet,"employees");
        SqlCommandBuilder cb = new SqlCommandBuilder(ad);
        dt = dSet.Tables["employees"];
        GridView1.DataSource = dSet;
        
        GridView1.DataBind();
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int n = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
        DataRow[] drs = dt.Select("employee_id=" + n); 
        DataRow dr = drs[0];
        string name = dr["employee_name"].ToString();
        dr.Delete();
        ad.Update(dSet,"employees");
        GridView1.DataBind();

        Membership.DeleteUser(name);
       
    }
}
