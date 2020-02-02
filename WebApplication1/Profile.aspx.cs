using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace WebApplication1
{
    public partial class Profile : System.Web.UI.Page
    {
        static string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

        SqlConnection con = new SqlConnection(cs);

        protected void Page_Load(object sender, EventArgs e)
        {
            //Code for changing class of selected page to "current" (To change color of the current page label in menu)
            HtmlGenericControl li = (HtmlGenericControl)this.Master.FindControl("profiles");
            li.Attributes.Add("class", "current");

            if (!IsPostBack)
            {
                if (Session["user"] != null)
                {
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
                                Label1.Text = dr.GetString(5);
                                if (Label1.Text == "nothing.jpg")
                                {
                                    dp.Src = "/img/minion.jpg";
                                }
                                else
                                {
                                    dp.Src = "/UserDetails/" + uname.Text + "/profile_pics/" + dr.GetString(5);
                                }
                            }

                        }
                    }
                    catch (Exception ex)
                    {
                        Response.Write("<script>alert('Some error occured while dispaying data.\n" + ex.ToString() + "')</script >");
                    }
                    finally
                    {
                        con.Close();
                    }
                }
            }
            Session["name"] = fname.Text + " " + lname.Text;
            name_label.Text = "Welcome!!\n" + Session["name"];
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (chng_button.Text == "Edit Profile")
            {
                dob.ReadOnly = false;
                roll_no.ReadOnly = false;
                fname.ReadOnly = false;
                lname.ReadOnly = false;
                upload_img.Attributes.Remove("hidden");

                rfv1.Visible = true;
                rfv2.Visible = true;
                rfv3.Visible = true;
                rfv4.Visible = true;

                chng_button.Text = "Update";
            }
            else if (chng_button.Text == "Update")
            {
                //Code for updating data
                try
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("UPDATE able SET dob=@bday, roll_no=@roll, First_name=@f_name, Last_name = @l_name where user_name = @u_name", con);
                    cmd.Parameters.AddWithValue("@u_name", uname.Text);
                    cmd.Parameters.AddWithValue("@bday", dob.Text);
                    cmd.Parameters.AddWithValue("@roll", Convert.ToInt32(roll_no.Text));
                    cmd.Parameters.AddWithValue("@f_name", fname.Text);
                    cmd.Parameters.AddWithValue("@l_name", lname.Text);
                    if (cmd.ExecuteNonQuery() > 0)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Profile updated successfully.');window.location ='Profile.aspx';", true);
                    }
                }
                catch (SqlException ex_message)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Error updating data. (Something related to query) " + ex_message.Message + "');", true);
                }
                finally
                {
                    con.Close();
                }
                //Response.Redirect("Profile.aspx");
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Sorry!\nSomething went wrong!.');window.location ='Profile.aspx';", true);
            }
        }

        protected void upload_btn_Click(object sender, EventArgs e)
        {
            string pp_name = "nothing";
            if (FileUpload1.HasFile)
            {
                try
                {
                    con.Open();
                    pp_name = FileUpload1.FileName;
                    SqlCommand cmd = new SqlCommand("UPDATE able SET profile_pic = @path where user_name = @u_name", con);
                    cmd.Parameters.AddWithValue("@path", pp_name);
                    cmd.Parameters.AddWithValue("@u_name", uname.Text);

                    if (cmd.ExecuteNonQuery() > 0)
                    {
                        FileUpload1.SaveAs(Server.MapPath("~/UserDetails/" + uname.Text + "/profile_pics/") + pp_name);
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Profile pic uploaded successfully.');", true);
                    }
                }
                catch (SqlException ex_message)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Problem occured. (Something related to query) " + ex_message.Message + "');", true);
                }
                finally
                {
                    con.Close();
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('NO file uploaded!.');", true);
            }
        }
    }
}