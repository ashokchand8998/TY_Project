using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace WebApplication1
{
    public partial class AddContent : System.Web.UI.Page
    {
        static string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        SqlConnection con = new SqlConnection(cs);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["user"] != null && Session["privilege"].ToString() == "admin")
                {
                    //nothing here
                    //everyting works fine
                }

                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Please Login as an Admin to access this page.');window.location ='Login.aspx';", true);
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string file_name = "";
            string location = "";
            string type = "";
            string subject = "";
            string sem = "No_Sem";
            string year = "";

            try
            {
                //Assigning values if corresponding control has values

                if (select_sem.SelectedValue != "")
                {
                    sem = select_sem.SelectedValue;
                }

                type = select_content_type.SelectedValue;

                if (select_year.SelectedValue != "")
                {
                    year = select_year.SelectedValue;
                }
                if (select_sub.SelectedValue.Length > 0)
                {
                    subject = select_sub.SelectedValue;
                }

                if (upload_file.HasFile | content_name.Text != "")
                {
                    if (upload_file.HasFile)
                    {
                        file_name = upload_file.FileName;


                        if (select_location.SelectedValue == "Others")
                        {
                            location = "Contents/Others/" + file_name;
                        }

                        else if (select_location.SelectedValue == "Curriculum(Local)")
                        {

                            location = "Contents/Curriculum/" + sem + "/Local_Files/" + file_name;
                        }

                        else if (select_location.SelectedValue == "Syllabus")
                        {
                            location = "Contents/Curriculum/Syllabus/" + year + "/" + file_name;
                        }

                        else if (select_location.SelectedValue == "Curriculum(Link)")
                        {
                            location = "Curriculum(Link)";
                        }
                    }
                    else if (content_name.Text != "")
                    {
                        file_name = content_name.Text;
                        
                            location = file_name;
                        
                    }

                    //Adding data into table and uploading file to application if provided
                    try
                    {
                        con.Open();
                        SqlCommand cmd = new SqlCommand("insert into Content values (@filename,@filetype,@sem,@year,@locate,@sub)", con);
                        cmd.Parameters.AddWithValue("@filename", file_name);
                        cmd.Parameters.AddWithValue("@filetype", type);
                        cmd.Parameters.AddWithValue("@sem", sem);
                        cmd.Parameters.AddWithValue("@year", year);
                        cmd.Parameters.AddWithValue("@locate", location);
                        cmd.Parameters.AddWithValue("@sub", subject);

                        if (cmd.ExecuteNonQuery() > 0)
                        {
                            if (upload_file.Visible == true && upload_file.HasFile)
                            {
                                location = select_location.SelectedValue;
                                if (location == "Others")
                                {
                                    upload_file.SaveAs(Server.MapPath("~/Contents/Others/") + file_name);
                                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Content uploaded successfully.');window.location ='AddContent.aspx';", true);
                                }

                                else if (location == "Curriculum(Local)")
                                {

                                    upload_file.SaveAs(Server.MapPath("~/Contents/Curriculum/" + sem + "/Local_Files/") + file_name);
                                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Content uploaded successfully.');window.location ='AddContent.aspx';", true);
                                }

                                else if (location == "Syllabus")
                                {
                                    upload_file.SaveAs(Server.MapPath("~/Contents/Curriculum/Syllabus/" + year + "/") + file_name);
                                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Content uploaded successfully.');window.location ='AddContent.aspx';", true);
                                }
                            }
                            else
                            {
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Saved content is an external link. If not, then please check the database.');window.location ='AddContent.aspx';", true);
                            }

                        }

                    }
                    catch (SqlException ex_message)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Problem occured. (SqlException) " + ex_message.Message + "');", true);
                    }
                    catch (Exception ex_message)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Problem occured. (Something related to uploading) " + ex_message.Message + "');", true);
                    }
                    finally
                    {
                        con.Close();
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('NO content saved!.');window.location ='AddContent.aspx';", true);
                }
            }
            catch (Exception msg)
            {
                Response.Write("<script>alert('An Exception Occured. Error Message: " + msg.Message + "')</script >");
            }
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                if (add_content.SelectedValue == "Add File")
                {
                    content_name.Visible = false;
                    upload_file.Visible = true;
                    adding_title_div.Visible = true;
                }
                else if (add_content.SelectedValue == "Add Link")
                {
                    upload_file.Visible = false;
                    content_name.Visible = true;
                    adding_title_div.Visible = true;
                }
                else
                {
                    content_name.Visible = false;
                    upload_file.Visible = false;
                    adding_title_div.Visible = false;
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('An Exception Occured. Error Message: " + ex.Message + "')</script >");
            }
        }

        protected void select_sem_SelectedIndexChanged(object sender, EventArgs e)
        {
            select_sub.Items.Clear();
            string sem = select_sem.SelectedValue;
            SqlCommand cmd = new SqlCommand("SELECT[Sub1], [Sub2], [Sub4], [Sub3], [Sub5] FROM [Subjects] WHERE([Sem] = @Sem)", con);
            cmd.Parameters.AddWithValue("@Sem", sem);
            try
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    select_sub.Items.Clear();
                    while (dr.Read())
                    {
                        select_sub.Items.Insert(0, new ListItem("-- Select any Subject --", "0"));
                        select_sub.Items.Add(new ListItem(dr.GetString(0), dr.GetString(0)));
                        select_sub.Items.Add(new ListItem(dr.GetString(1), dr.GetString(1)));
                        select_sub.Items.Add(new ListItem(dr.GetString(2), dr.GetString(2)));
                        select_sub.Items.Add(new ListItem(dr.GetString(3), dr.GetString(3)));
                        select_sub.Items.Add(new ListItem(dr.GetString(4), dr.GetString(4)));
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Some error occured while dispaying the content. Error Message: " + ex.Message + "')</script >");
            }
            finally
            {
                con.Close();
            }
        }

        protected void select_location_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (select_location.SelectedValue == "Others" | select_location.SelectedValue == "Others(Link)")
            {
                //this is not working when dropdown is inside update panel:| Please seek help
                options_for_curriculum_upload.Visible = false;

                //query for retirval of subjects in the select_sub dropdown list which dosen't belong to curriculum and sem
                SqlCommand cmd = new SqlCommand("SELECT[Sub1], [Sub2], [Sub4], [Sub3], [Sub5] FROM [Subjects] WHERE([Sem] = @Sem)", con);
                cmd.Parameters.AddWithValue("@Sem", "No_Sem");
                try
                {
                    con.Open();
                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.HasRows)
                    {
                        select_sub.Items.Clear();
                        while (dr.Read())
                        {
                            select_sub.Items.Insert(0, new ListItem("-- Select any Subject --", "0"));
                            select_sub.Items.Add(new ListItem(dr.GetString(0), dr.GetString(0)));
                            select_sub.Items.Add(new ListItem(dr.GetString(1), dr.GetString(1)));
                            select_sub.Items.Add(new ListItem(dr.GetString(2), dr.GetString(2)));
                            select_sub.Items.Add(new ListItem(dr.GetString(3), dr.GetString(3)));
                            select_sub.Items.Add(new ListItem(dr.GetString(4), dr.GetString(4)));
                        }
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('Some error occured while dispaying the content. Error Message: " + ex.Message + "')</script >");
                }
                finally
                {
                    con.Close();
                }
            }
            else
            {
                options_for_curriculum_upload.Visible = true;
            }
        }
    }
}