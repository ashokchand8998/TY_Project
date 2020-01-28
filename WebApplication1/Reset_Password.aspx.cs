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

                    String name = "";
                    while (dr.Read())
                    {
                        name += dr.GetString(0);
                    }
                    String button_id = ((Button)sender).ID;
                    if (button_id == "get_otp")
                    {
                        //Creating OTP
                        String otp = Membership.GeneratePassword(8, 2);
                        Session["otp"] = otp;

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
                            //Enabling the div element
                            change_pass.Attributes.Remove("style");
                            otp_box.Visible = true;
                            pass_box.Visible = false;
                            pass_label.Text = "Enter OTP:";
                        }
                        catch (Exception ex)
                        {
                            msg.Text = ex.ToString();
                        }
                    }
                    else if (button_id == "use_pass")
                    {
                        change_pass.Attributes.Remove("style");
                        pass_box.Visible = true;
                        pass_label.Text = "Old Password:";
                        //disabling controls related otp
                        otp_box.Visible = false;
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
                        SqlCommand cmd = new SqlCommand("UPDATE able SET passwords = @passwrd where user_name = @uname", con);
                        cmd.Parameters.AddWithValue("@uname", u_name.Text);
                        cmd.Parameters.AddWithValue("@passwrd", c_passwd.Text);
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
                    SqlCommand update_cmd = new SqlCommand("UPDATE able SET passwords = @n_passwrd where user_name = @uname AND passwords = @passwd", con);
                    update_cmd.Parameters.AddWithValue("@uname", u_name.Text);
                    update_cmd.Parameters.AddWithValue("@n_passwrd", c_passwd.Text);
                    update_cmd.Parameters.AddWithValue("@passwd", pass_box.Text);
                    if (update_cmd.ExecuteNonQuery() > 0)
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Password updated successfully.');window.location ='LogIn.aspx';", true);
                    }
                    else
                    {
                        display_msg.Text = "Incorrect Password! Please try again";
                        display_msg.Visible = true;
                        pass_box.Focus();
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
            //clearing session for new password recovery
            Session.Clear();
            Session.Abandon();
        }
    }
}