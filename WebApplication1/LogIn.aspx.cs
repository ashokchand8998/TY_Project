﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
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
            if (!IsPostBack && Request.UrlReferrer != null)
            {
                prevPage = Request.UrlReferrer.ToString();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //Creating connection and verifying details
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            SqlConnection con = new SqlConnection(cs);

            if (Session["user"] != null)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('An account is already logged in. Please first signout/logout from that account.');window.location ='Profile.aspx';", true);
            }

            else
            {
                try
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("SELECT First_name,Last_name,privilege,passwords FROM Users WHERE user_name = @username", con);
                    cmd.Parameters.AddWithValue("@username", uname.Text);
                    SqlDataReader dr = cmd.ExecuteReader();

                    //Checking for valid entries and storing details in session.
                    if (dr.HasRows)
                    {
                        String name = "";
                        String privilege = "";
                        String passwd = "";

                        while (dr.Read())
                        {
                            name = dr.GetString(0) + " " + dr.GetString(1);
                            privilege = dr.GetString(2);
                            passwd = dr.GetString(3);

                        }

                        if (Helper.VerifyHash(password.Text, "SHA512", passwd))
                        {
                            Session["user"] = uname.Text;
                            Session["privilege"] = privilege.Trim();
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Login sucessfull! Welcome " + name + "');window.location ='" + prevPage + "';", true);
                            Label1.Visible = false;
                        }
                        else
                        {
                            Label1.Visible = true;
                            uname.Focus();
                        }
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
}