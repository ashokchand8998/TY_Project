using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace WebApplication1
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Code for changing class of selected page to "current" (To change color of the current page label in menu)
            HtmlGenericControl li = (HtmlGenericControl)this.Master.FindControl("signup");
            li.Attributes.Add("class", "current");
        }
        protected void Button1_Click(object sender, EventArgs e)
        {

            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\USERS\USER\DOCUMENTS\VISUAL STUDIO 2015\WEBAPPLICATION1\WEBAPPLICATION1\APP_DATA\DB.MDF;Integrated Security=True");
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("insert into able values (@uname,@password,@dob,@roll,@fname,@lname)", con);
                cmd.Parameters.AddWithValue("@uname", uname.Text);
                cmd.Parameters.AddWithValue("@password", passwd2.Text);
                cmd.Parameters.AddWithValue("@dob", dob.Text);
                cmd.Parameters.AddWithValue("@roll", Convert.ToInt32(roll_no.Text));
                cmd.Parameters.AddWithValue("@fname", fname.Text);
                cmd.Parameters.AddWithValue("@lname", lname.Text);

                if (cmd.ExecuteNonQuery() > 0)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(),"alert", "alert('User details saved sucessfully');window.location ='LogIn.aspx';", true);
                }
            }
            catch (System.Data.SqlClient.SqlException ex_msg)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + ex_msg.Message + "')", true);
                fname.Focus();
            }
            finally
            {
                con.Close();
            }
        }
    }
}