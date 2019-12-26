using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace WebApplication1
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        static String prevPage = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            uname.Focus();
            //Code for changing class of selected page to "current" (To change color of the current page label in menu)
            HtmlGenericControl li = (HtmlGenericControl)this.Master.FindControl("login");
            li.Attributes.Add("class", "current");

            //Storing previous page url to get redirected to it after successfull login.
            if (!IsPostBack  && Request.UrlReferrer!=null)
            {
                prevPage = Request.UrlReferrer.ToString();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //Creating connection and verifying details
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\USERS\USER\DOCUMENTS\VISUAL STUDIO 2015\PROJECTS\WEBAPPLICATION1\WEBAPPLICATION1\APP_DATA\DB.MDF;Integrated Security=True");
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT First_name,Last_name FROM able WHERE user_name = @username AND passwords = @passwd", con);
                cmd.Parameters.AddWithValue("@username",uname.Text);
                cmd.Parameters.AddWithValue("@passwd", password.Text);
                SqlDataReader dr = cmd.ExecuteReader();

                //Checking for valid entries and storing details in session.
                if (dr.HasRows)
                {
                    String name="";
                    while (dr.Read())
                    {
                        name = dr.GetString(0) + " " + dr.GetString(1);
                    }
                    Session["user"] = uname.Text;
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Login sucessfull! Welcome "+name+"');window.location ='" + prevPage + "';", true);
                    Label1.Visible = false;
                }
                else
                {
                    Label1.Visible = true;
                    uname.Focus();
                }
            }
            catch (SqlException ex_msg)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + ex_msg.Message + "');", true);
                uname.Focus();
            }
            finally
            {
                con.Close();
            }
        }
    }
}