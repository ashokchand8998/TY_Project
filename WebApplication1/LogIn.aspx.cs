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

            if (!IsPostBack)
            {
                prevPage = Request.UrlReferrer.ToString();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string u_name = TextBox1.Text;
            string passwd = TextBox2.Text;

            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\USERS\USER\DOCUMENTS\VISUAL STUDIO 2015\WEBAPPLICATION1\WEBAPPLICATION1\APP_DATA\DB.MDF;Integrated Security=True");
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT First_name,Last_name FROM able WHERE user_name = '" + u_name + "' AND passwords = '" + passwd + "'", con);

            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    Session["name"] = dr.GetString(0) + " " + dr.GetString(1);
                }
                Response.Redirect(prevPage);
            }
            else
            {
                Label1.Visible = true;
            }
            con.Close();
        }
    }
}