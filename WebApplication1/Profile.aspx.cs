using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace WebApplication1
{
    public partial class Profile : System.Web.UI.Page
    {
        String img_link;
        SqlConnection con = new SqlConnection(@"Data Source = (LocalDB)\MSSQLLocalDB; AttachDbFilename=C:\USERS\USER\DOCUMENTS\VISUAL STUDIO 2015\PROJECTS\WEBAPPLICATION1\WEBAPPLICATION1\APP_DATA\DB.MDF;Integrated Security = True");
        protected void Page_Load(object sender, EventArgs e)
        {
            //Code for changing class of selected page to "current" (To change color of the current page label in menu)
            HtmlGenericControl li = (HtmlGenericControl)this.Master.FindControl("profiles");
            li.Attributes.Add("class", "current");

            if (Session["name"] != null)
            {
                name_label.Text += "\n" + Session["name"];

                //query for displaying data
                SqlCommand view_cmd = new SqlCommand("SELECT [user_name], [dob], [roll_no], [First_name], [Last_name], [profile_pic] FROM [able] WHERE ([user_name] = @user_name)", con);
                view_cmd.Parameters.AddWithValue("@user_name", Session["user"].ToString());
                try
                {
                    con.Open();
                    SqlDataReader dr = view_cmd.ExecuteReader();
                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            uname.Text = dr.GetString(0);
                            dob.Text = DateTime.ParseExact(dr.GetDateTime(1).Date.ToShortDateString(), "dd-MM-yyyy", null).ToString("yyyy-MM-dd");
                            roll_no.Text = dr.GetInt32(2).ToString();
                            fname.Text = dr.GetString(3);
                            lname.Text = dr.GetString(4);
                            if (dr.GetString(4) != null)
                            {
                                img_link = dr.GetString(5);
                            }
                        }
                    }
                }
                catch(Exception ex)
                {
                    Response.Write("<script>alert('Some error occured while dispaying data.\n" + ex.ToString() + "')</script>");
                }
                finally
                {
                    con.Close();
                }
            }


        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }
    }
}