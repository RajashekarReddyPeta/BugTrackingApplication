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

public partial class Default3 : System.Web.UI.Page
{
    SqlConnection con;
    int id;
    protected void Page_Load(object sender, EventArgs e)
    {
        con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["bugtracConnectionString1"].ToString();
        txtDate.Text = DateTime.Now.Date.ToString();// assigning current date to the textbox
        id = Convert.ToInt32(Request.QueryString["bug_id"]);
       
        
        //postback checking is required... otherwise old values will come........
        if (!IsPostBack) 
        {
          if (id > 0)
            {
                string bugdesc = "select * from bugs where bug_id=" + id;
                SqlCommand edit = new SqlCommand(bugdesc, con);
                con.Open();
                SqlDataReader dr = edit.ExecuteReader();
                while (dr.Read())
                {
                    txtBugName.Text = dr["bug_name"].ToString();
                    txtBugdesc.Text = dr["bug_desc"].ToString();
                    ddlPriority.SelectedValue = dr["priority_id"].ToString();
                    ddlProject.SelectedValue = dr["project_id"].ToString();
                    ddlStatus.SelectedValue = dr["status_id"].ToString();
                    ddlAssgto.SelectedValue = dr["assigned_to"].ToString();
                }
                con.Close();

                btnUpdate.Visible = true;

                if (Roles.IsUserInRole("Administrator"))
                {
                    btnDelete.Visible = true;
                }
            }
            else
                btnCreate.Visible = true;
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }

    protected void btnCreate_Click(object sender, EventArgs e)
    {
        string sql = "insert into bugs values('" + ddlProject.SelectedValue + "','" + ddlPriority.SelectedValue + "','" + ddlStatus.SelectedValue + "','" + txtBugName.Text + "','" + txtBugdesc.Text + "','" + "','" + "','" + ddlAssgto.SelectedValue + "','" +txtDate.Text+ "','" + "')";
        SqlCommand cmdinsert = new SqlCommand(sql, con);
        con.Open();
        cmdinsert.ExecuteNonQuery();
        con.Close();
        Response.Redirect("~/Default.aspx");
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        string sql = "update bugs set project_id=@projectid,priority_id=@priorityid,status_id=@statusid,bug_name='"+txtBugName.Text+"',bug_desc='"+txtBugdesc.Text+"',assigned_to=@assignedto where bug_id=" + id;
        SqlCommand cmdupdate = new SqlCommand(sql, con);
       
        cmdupdate.Parameters.Add(new SqlParameter("@projectid", ddlProject.SelectedItem.Value));
        cmdupdate.Parameters.Add(new SqlParameter("@priorityid", ddlPriority.SelectedItem.Value));
        cmdupdate.Parameters.Add(new SqlParameter("@statusid", ddlStatus.SelectedItem.Value));
         cmdupdate.Parameters.Add(new SqlParameter("@assignedto", ddlAssgto.SelectedItem.Value));
        con.Open();
      
        int i= cmdupdate.ExecuteNonQuery();
       
        con.Close();
        Response.Redirect("~/Default.aspx");

    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        string del = "delete from bugs where bug_id=" + id;
        SqlCommand cmdDelete = new SqlCommand(del, con);
        con.Open();
        cmdDelete.ExecuteNonQuery();
        con.Close();
        Response.Redirect("~/Default.aspx");
    }
}
