using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class Forgot_Password : System.Web.UI.Page
    {
        //Creating connection
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\USERS\USER\DOCUMENTS\VISUAL STUDIO 2015\PROJECTS\WEBAPPLICATION1\WEBAPPLICATION1\APP_DATA\DB.MDF;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
        }
        protected void get_otp_Click(object sender, EventArgs e)
        {
            string uname = this.u_name.Text;

            //Verifying details
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT First_name FROM able WHERE user_name = @uname", con);
                cmd.Parameters.AddWithValue("@uname", uname);
                SqlDataReader dr = cmd.ExecuteReader();

                //Checking for valid entries and sending otp via e-mail.
                if (dr.HasRows)
                {
                    // Generate a new 8-character password with at least 1 non-alphanumeric character.
                    String otp = Membership.GeneratePassword(8, 2);
                    String name = "";
                    while (dr.Read())
                    {
                        name += dr.GetString(0);
                        Session["otp"] = otp;
                    }

                    //Code for sending mail
                    String message = "Hey " + name + "!\n Your otp is: " + otp + ".";
                    SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);
                    smtpClient.UseDefaultCredentials = false;
                    smtpClient.Credentials = new System.Net.NetworkCredential("tyelearnit@gmail.com", "tyelearnit7396");
                    smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;

                    MailMessage mailMessage = new MailMessage("tyelearnit@gmail.com", uname);
                    mailMessage.Subject = "OTP for resetting password!";
                    mailMessage.Body = message;
                    try
                    {
                        smtpClient.EnableSsl = true;
                        smtpClient.Send(mailMessage);
                        msg.Text = "Message sent";
                        msg.Visible = true;
                        change_pass.Attributes.Remove("style");
                    }
                    catch (Exception ex)
                    {
                        msg.Text = ex.ToString();
                    }
                }
                else
                {
                    msg.Visible = true;
                    u_name.Focus();
                }
            }
            catch (SqlException ex_msg)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + ex_msg.Message + "')", true);
                u_name.Focus();
            }
            finally
            {
                con.Close();
            }
        }

        protected void submit_Click(object sender, EventArgs e)
        {
            Response.Write("TB:" + otp_box.Text + "\nmail: " + Convert.ToString(Session["otp"]));
            if (otp_box.Text == Convert.ToString(Session["otp"]))
            {
                try
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("UPDATE able SET passwords = @passwrd where user_name = @uname", con);
                    cmd.Parameters.AddWithValue("@uname",u_name.Text);
                    cmd.Parameters.AddWithValue("@passwrd",c_passwd.Text);
                    if (cmd.ExecuteNonQuery() > 0)
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Password updated successfully.');window.location ='LogIn.aspx';", true);
                    }
                    
                }
                catch (SqlException ex_msg)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + ex_msg.Message + "')", true);
                    u_name.Focus();
                }
                finally
                {
                    con.Close();
                }
            }
            else
            {
                display_msg.Text = "OTP dosen't match! Please try again";
                display_msg.Visible = true;
                otp_box.Focus();
            }
            //clearing session for new password recovery
            Session.Clear();
            Session.Abandon();
        }
    }
}