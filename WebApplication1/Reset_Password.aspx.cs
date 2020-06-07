using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace WebApplication1
{
    public partial class Reset_Password : System.Web.UI.Page
    {
        //Creating connection
        static string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

        SqlConnection con = new SqlConnection(cs);

        protected void Page_Load(object sender, EventArgs e)
        {
            u_name.Focus();
            if (!IsPostBack && Session["user"] != null)
            {
                u_name.Text = Session["user"].ToString();
            }
        }

        protected void cp_Click(object sender, EventArgs e)
        {
            string uname = this.u_name.Text;

            //Verifying details
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT First_name FROM Users WHERE user_name = @uname", con);
                cmd.Parameters.AddWithValue("@uname", uname);
                SqlDataReader dr = cmd.ExecuteReader();

                //Checking for valid entries and sending otp via e-mail.
                if (dr.HasRows)
                {
                    // Generate a new 8-character password with at least 1 non-alphanumeric character.

                    String name = "";
                    while (dr.Read())
                    {
                        name += dr.GetString(0);
                    }
                    String button_id = ((Button)sender).ID;

                    if (button_id == "get_otp")
                    {
                        dr.Close();
                        SqlCommand otpcmd = new SqlCommand("SELECT passwords FROM Users WHERE user_name = @uname",con);
                        otpcmd.Parameters.AddWithValue("@uname", "tyelearnit@gmail.com");
                        SqlDataReader sdr = otpcmd.ExecuteReader();
                        string pass=null;
                        if (sdr.HasRows)
                        {
                            while (sdr.Read())
                            {
                                pass = sdr.GetString(0);
                            }
                        }
                        //Creating OTP
                        String otp = Membership.GeneratePassword(8, 2);
                        Session["otp"] = otp;

                        //Code for sending mail
                        String message = "Hey " + name + "!\n Your otp is: " + otp;
                        SmtpClient smtpClient = new System.Net.Mail.SmtpClient("smtp.gmail.com", 587);
                        smtpClient.UseDefaultCredentials = false;
                        smtpClient.Credentials = new System.Net.NetworkCredential("tyelearnit@gmail.com", pass);
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

                            //Enabling the div element
                            change_pass.Visible=true;
                            otp_box.Visible = true;
                            OtpRequiredValidator.Visible = true;
                            OPRequiredValidator.Visible = false;
                            pass_box.Visible = false;
                            pass_label.Text = "Enter OTP:";
                        }
                        catch (Exception ex)
                        {
                            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + ex.Message + "')", true);
                            msg.Text = "Some error occured while processing mail!!";
                        }
                    }
                    else if (button_id == "use_pass")
                    {
                        change_pass.Visible=true;
                        pass_box.Visible = true;
                        OPRequiredValidator.Visible = true;
                        pass_label.Text = "Old Password:";

                        //disabling controls related otp
                        otp_box.Visible = false;
                        OtpRequiredValidator.Visible = false;
                        msg.Visible = false;
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
            if (otp_box.Visible)
            {
                if (otp_box.Text == Convert.ToString(Session["otp"]))
                {
                    try
                    {
                        con.Open();
                        SqlCommand cmd = new SqlCommand("UPDATE Users SET passwords = @passwrd where user_name = @uname", con);
                        cmd.Parameters.AddWithValue("@uname", u_name.Text);
                        //Using ComputeHash method to encrypt password
                        string ePass = Helper.ComputeHash(c_passwd.Text, "SHA512", null);
                        cmd.Parameters.AddWithValue("@passwrd", ePass);
                        if (cmd.ExecuteNonQuery() > 0)
                        {
                            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Password updated successfully.');window.location ='LogIn.aspx';", true);
                        }

                    }
                    catch (SqlException ex_msg)
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + ex_msg.Message + "');", true);
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

            }
            else if (pass_box.Visible)
            {
                try
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("SELECT passwords FROM Users WHERE user_name = @username", con);
                    cmd.Parameters.AddWithValue("@username", u_name.Text);
                    SqlDataReader dr = cmd.ExecuteReader();

                    //Validating password for given username
                    if (dr.HasRows)
                    {
                        String passwd = "";

                        while (dr.Read())
                        {
                            passwd = dr.GetString(0);

                        }
                        
                        if (Helper.VerifyHash(pass_box.Text, "SHA512", passwd))
                        {
                            dr.Close();
                            //Code to update password if above condition is true
                            SqlCommand update_cmd = new SqlCommand("UPDATE Users SET passwords = @n_passwrd where user_name = @uname", con);
                            update_cmd.Parameters.AddWithValue("@uname", u_name.Text);

                            //Using ComputeHash method to encrypt password
                            string n_ePass = Helper.ComputeHash(c_passwd.Text, "SHA512", null);
                            update_cmd.Parameters.AddWithValue("@n_passwrd", n_ePass);

                            if (update_cmd.ExecuteNonQuery() > 0)
                            {
                                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Password updated successfully.');window.location ='LogIn.aspx';", true);
                            }
                            else
                            {
                                display_msg.Text = "Unable to update password! Please try again";
                                display_msg.Visible = true;
                                pass_box.Focus();
                            }
                        }
                        else
                        {
                            display_msg.Text = "Incorrect Password! Please try again";
                            display_msg.Visible = true;
                            pass_box.Focus();
                        }
                    }
                    else
                    {
                        display_msg.Text = "Unrecognized username! Please try again";
                        display_msg.Visible = true;
                        pass_box.Focus();
                    }
                }
                catch (SqlException ex_msg)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Some error occured while updating password: " + ex_msg.Message + "');", true);
                    u_name.Focus();
                }
                finally
                {
                    con.Close();
                }
                
            }
            //clearing session for new password recovery
            Session.Clear();
            Session.Abandon();
        }
    }
}