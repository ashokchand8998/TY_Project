using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

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
                    string p = Session["privilege"].ToString();
                    if (p == "admin")
                    {
                        blink_privilege.Visible = true;
                        show_privilege.Text = "!!Admin!!";
                        admin_content_div.Visible = true;
                    }
                    else
                    {
                        blink_privilege.Visible = false;
                        admin_content_div.Visible = false;
                    }
                    //query for displaying data
                    SqlCommand view_cmd = new SqlCommand("SELECT [user_name], [dob], [roll_no], [First_name], [Last_name], [profile_pic] FROM [Users] WHERE ([user_name] = @user_name)", con);
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
                                String Label1 = "";
                                Label1 = dr.GetString(5);
                                if (Label1 == "nothing.jpg")
                                {
                                    dp.Src = "/img/minion.jpg";
                                }
                                else
                                {
                                    dp.Src = dr.GetString(5);
                                }
                            }

                        }
                    }
                    catch (Exception ex)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Some error occured while dispaying data. " + ex.ToString() + "');", true);
                    }
                    finally
                    {
                        con.Close();
                    }
                }

                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Please Login first to access our complete site.');window.location ='Login.aspx';", true);
                }


            }
            Session["name"] = fname.Text + " " + lname.Text;
            name_label.Text = "Welcome!!\n" + Session["name"];
        }

        protected void Edit_Click(object sender, EventArgs e)
        {
            if (uname.Text.Length > 0)
            {
                if (chng_button.Text == "Edit Profile")
                {
                    dob.ReadOnly = false;
                    roll_no.ReadOnly = false;
                    fname.ReadOnly = false;
                    lname.ReadOnly = false;
                    upload_img.Visible = true;

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
                        SqlCommand cmd = new SqlCommand("UPDATE Users SET dob=@bday, roll_no=@roll, First_name=@f_name, Last_name = @l_name where user_name = @u_name", con);
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

                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Sorry!\nSomething went wrong!.');window.location ='Profile.aspx';", true);
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Please Login first!.');", true);
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
                    pp_name = "UserDetails/" + uname.Text + "/profile_pics/" + FileUpload1.FileName;

                    SqlCommand cmd = new SqlCommand("UPDATE Users SET profile_pic = @path where user_name = @u_name", con);
                    cmd.Parameters.AddWithValue("@path", pp_name);
                    cmd.Parameters.AddWithValue("@u_name", uname.Text);

                    if (cmd.ExecuteNonQuery() > 0)
                    {
                        //Emptying directory before updating new profile pic
                        System.IO.DirectoryInfo di = new DirectoryInfo(Server.MapPath("~/UserDetails/" + uname.Text + "/profile_pics"));
                        foreach (FileInfo file in di.GetFiles())
                        {
                            file.Delete();
                        }
                        dp.Src = "/img/minion.jpg";
                        //Adding updated profile pic
                        FileUpload1.SaveAs(Server.MapPath("~/UserDetails/" + uname.Text + "/profile_pics/") + FileUpload1.FileName);
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Profile pic uploaded successfully. Click update button to view changes/updates applied.');", true);
                    }
                }
                catch (SqlException ex_message)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Problem occured. (Something related to query) " + ex_message.Message + "');", true);
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Problem occured. (Regarding Profile picture updation) " + ex.Message + "');", true);
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


        protected void Timer1_Tick1(object sender, EventArgs e)
        {
            Random rand = new Random();
            int one = rand.Next(0, 255);
            int two = rand.Next(0, 255);
            int three = rand.Next(0, 255);
            int four = rand.Next(0, 255);

            show_privilege.ForeColor = System.Drawing.Color.FromArgb(one, two, three, four);
        }

        protected void lo_account_Click1(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Thankyou for viewing our site!!');window.location ='Login.aspx';", true);
        }

        protected void Confirm_Click(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            SqlConnection con = new SqlConnection(cs);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT passwords FROM Users WHERE user_name = @username", con);
                cmd.Parameters.AddWithValue("@username", uname.Text);
                SqlDataReader dr = cmd.ExecuteReader();

                //Validating password for given username
                if (dr.HasRows)
                {
                    String passwd = "";

                    while (dr.Read())
                    {
                        passwd = dr.GetString(0);

                    }

                    if (Helper.VerifyHash(verify_pass.Text, "SHA512", passwd))
                    {
                        dr.Close();
                        SqlCommand delcmd = new SqlCommand("DELETE FROM Users WHERE user_name = @username", con);
                        delcmd.Parameters.AddWithValue("@username", uname.Text);
                        if (delcmd.ExecuteNonQuery() > 0)
                        {
                            try
                            {
                                if (Directory.Exists(Server.MapPath("~/UserDetails/" + uname.Text)))
                                {
                                    Directory.Delete(Server.MapPath("~/UserDetails/" + uname.Text), true);
                                }
                            }
                            catch (IOException ex)
                            {
                                {
                                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + ex.Message + "');", true);
                                }
                            }
                            Session.Clear();
                            Session.Abandon();
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Your account has been deleted');window.location ='index.aspx';", true);
                        }
                    }
                    else
                    {
                        error_label.Text = "Unable to delete your account. Please try again and make sure to insert correct password.";
                        error_label.Visible = true;
                        verify_pass.Focus();
                    }
                }
                error_label.Text = "Unable to recognize your account. Please try again!!";
                error_label.Visible = true;
                verify_pass.Focus();

            }
            catch (SqlException exc)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + exc.Message + "');", true);
            }
            finally
            {
                con.Close();
            }
        }

        protected void da_account_Click1(object sender, EventArgs e)
        {
            delete_div.Visible = true;
            verify_pass.Focus();
            rmv_account.Visible = false;
        }

        protected void Cancel_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Process canceled!!.');window.location ='Profile.aspx';", true);
        }
    }
}