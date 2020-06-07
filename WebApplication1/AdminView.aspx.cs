using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Web.UI.HtmlControls;

namespace WebApplication1
{
    public partial class AdminView : System.Web.UI.Page
    {
        static string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        SqlConnection con = new SqlConnection(cs);
        
        protected void Load_DropDownList()
        {
            SqlCommand cmd = new SqlCommand("SELECT table_name FROM information_schema.tables WHERE table_type = 'base table'", con);
            try
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    select_table.Items.Clear();
                    select_table.Items.Insert(0, new ListItem("-- Select any Table --", "0"));
                    while (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            select_table.Items.Add(new ListItem(dr.GetString(0), dr.GetString(0)));
                        }
                        dr.NextResult();
                    }


                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Some error occured while dispaying the content. Error Message: " + ex.Message + "')</script >");
            }
            finally
            {
                con.Close();
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["user"] != null && Session["privilege"].ToString() == "admin")
                {
                    //everyting works fine
                    Load_DropDownList();
                }

                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Please Login as an Admin to access this page.');window.location ='Login.aspx';", true);
                }
                
            }
        }

     
        protected void select_table_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (select_table.SelectedValue == "0")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Please select any table from the given options!');", true);
                
            }
            else
            {
                string table_name = select_table.SelectedValue;
                if (table_name == "Users")
                {
                    Content.Visible = false;
                    Subjects.Visible = false;
                    Users.Visible = true;
                }
                else if (table_name == "Content")
                {
                    Subjects.Visible = false;
                    Users.Visible = false;
                    Content.Visible = true;
                }
                else if (table_name == "Subjects")
                {
                    Users.Visible = false;
                    Content.Visible = false;
                    Subjects.Visible = true;
                }

            }
        }
    }
}