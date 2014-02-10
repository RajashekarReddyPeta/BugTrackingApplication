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

public partial class Administrator_CreateUser : System.Web.UI.Page
{
    SqlConnection con;
    protected void Page_Load(object sender, EventArgs e)
    {
        con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["bugtracConnectionString1"].ToString();
   
    }
    protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
    {
        DropDownList Role=CreateUserWizard1.WizardSteps[0].Controls[0].FindControl("ddlRole") as DropDownList;
        Roles.AddUserToRole(CreateUserWizard1.UserName, Role.SelectedValue);
        string user = CreateUserWizard1.UserName.ToString();
        string insertemp = "insert into employees values('" + user +"','"+user + "')";
        SqlCommand cmdinsert = new SqlCommand(insertemp, con);
        con.Open();
        cmdinsert.ExecuteNonQuery();
        con.Close();

    }
}
