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
using System.IO;

namespace WebApplication1
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Code for changing class of selected page to "current" (To change color of the current page label in menu)
            /*HtmlGenericControl li = (HtmlGenericControl)this.Master.FindControl("signup");
            li.Attributes.Add("class", "current");
        */
            if (!IsPostBack)
            {
                fname.Focus();
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                //Creating connection and using query to insert details
                string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
                SqlConnection con = new SqlConnection(cs);
                try
                {
                    con.Open();
                    SqlCommand chk_cmd = new SqlCommand("SELECT First_name FROM Users WHERE user_name = @uname", con);
                    chk_cmd.Parameters.AddWithValue("@uname", uname.Text);
                    SqlDataReader dr = chk_cmd.ExecuteReader();

                    //Checking for unique/new user.
                    if (dr.HasRows)
                    {
                        
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('User already present!! Please provide new username/mail id.');", true);
                    }
                    else
                    {
                        dr.Close();
                        
                        SqlCommand cmd = new SqlCommand("insert into Users values (@uname,@password,@dob,@roll,@fname,@lname,'nothing.jpg','user')", con);
                        cmd.Parameters.AddWithValue("@uname", uname.Text);

                        //Using ComputeHash method to encrypt password
                        string ePass = Helper.ComputeHash(passwd2.Text, "SHA512", null);

                        cmd.Parameters.AddWithValue("@password", ePass);
                        cmd.Parameters.AddWithValue("@dob", dob.Text);
                        cmd.Parameters.AddWithValue("@roll", Convert.ToInt32(roll_no.Text));
                        cmd.Parameters.AddWithValue("@fname", fname.Text);
                        cmd.Parameters.AddWithValue("@lname", lname.Text);
                        if (cmd.ExecuteNonQuery() > 0)
                        {
                           //Creating directory for storing user's profile image.
                            Directory.CreateDirectory(Server.MapPath("~/UserDetails/" + uname.Text + "/profile_pics/"));

                            //Alert for successfull signup and redirect to login page
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('User details saved sucessfully');window.location ='LogIn.aspx';", true);
                        }
                    }
                }
                catch (Exception ex_msg)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('" + ex_msg.Message + "')", true);
                    fname.Focus();
                }
                finally
                {
                    con.Close();
                }
            }
        }
        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (dob.Text.Length > 0)
            {
                try
                {
                    DateTime bday = DateTime.Parse(dob.Text);
                    DateTime today = DateTime.Now.Date;

                    if (bday > today)
                    {
                        args.IsValid = false;
                        CustomValidator1.ErrorMessage = "Sorry this site doesn't accept anyone born in future.";
                    }
                    else if (today.Year - bday.Year < 12)
                    {
                        args.IsValid = false;
                        CustomValidator1.ErrorMessage = "Age should should be more than 12 years.";
                    }
                    else if (today.Year - bday.Year > 124)
                    {
                        args.IsValid = false;
                        CustomValidator1.ErrorMessage = "Too Old.";
                    }
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('Some error occured while processing DOB" + ex.Message + "')", true);
                }
            }
        }
    }
}