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
            //Code for changing class of selected page to "current" (To change color of the current page label in menu)
            HtmlGenericControl li = (HtmlGenericControl)this.Master.FindControl("login");
            li.Attributes.Add("class", "current");

            //Storing previous page url to get redirected to it after successfull login.
            if (!IsPostBack)
            {
                prevPage = Request.UrlReferrer.ToString();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string u_name = this.uname.Text;
            string passwd = password.Text;

            //Creating connection and verifying details
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\USERS\USER\DOCUMENTS\VISUAL STUDIO 2015\WEBAPPLICATION1\WEBAPPLICATION1\APP_DATA\DB.MDF;Integrated Security=True");
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT First_name,Last_name FROM able WHERE user_name = '" + u_name + "' AND passwords = '" + passwd + "'", con);

                SqlDataReader dr = cmd.ExecuteReader();

                //Checking for valid entries and storing details in session.
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        Session["user"] = dr.GetString(0) + " " + dr.GetString(1);
                    }
                    Response.Redirect(prevPage);
                }
                else
                {
                    Label1.Visible = true;
                    uname.Focus();
                }
            }
            catch (SqlException ex_msg)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + ex_msg.Message + "')", true);
                uname.Focus();
            }
            finally
            {
                con.Close();
            }
        }
    }
}