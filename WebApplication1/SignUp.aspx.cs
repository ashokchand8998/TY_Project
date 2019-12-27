﻿using System;
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

            uname.Focus();
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            //Creating connection and using query to insert details
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\USERS\USER\DOCUMENTS\VISUAL STUDIO 2015\PROJECTS\WEBAPPLICATION1\WEBAPPLICATION1\APP_DATA\DB.MDF;Integrated Security=True");
            try
            {
                con.Open();
                SqlCommand chk_cmd = new SqlCommand("SELECT First_name FROM able WHERE user_name = @uname", con);
                chk_cmd.Parameters.AddWithValue("@uname", uname.Text);
                SqlDataReader dr = chk_cmd.ExecuteReader();

                //Checking for unique/new user.
                if (dr.HasRows)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('User already present!!\nPlease provide new username/mail id.');window.location ='LogIn.aspx';", true);
                }
                else
                {
                    dr.Close();
                    SqlCommand cmd = new SqlCommand("insert into able values (@uname,@password,@dob,@roll,@fname,@lname,'nothing.jpg')", con);
                    cmd.Parameters.AddWithValue("@uname", uname.Text);
                    cmd.Parameters.AddWithValue("@password", passwd2.Text);
                    cmd.Parameters.AddWithValue("@dob", dob.Text);
                    cmd.Parameters.AddWithValue("@roll", Convert.ToInt32(roll_no.Text));
                    cmd.Parameters.AddWithValue("@fname", fname.Text);
                    cmd.Parameters.AddWithValue("@lname", lname.Text);
                    if (cmd.ExecuteNonQuery() > 0)
                    {
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
}