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
    public partial class AdminView : System.Web.UI.Page
    {
        static string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        SqlConnection con = new SqlConnection(cs);
        protected void Page_Load(object sender, EventArgs e)
        {
            //Command for reseeding the identity of contents table

            /*string command=" DECLARE @maxVal INT
             SELECT @maxVal = ISNULL(max(ID), 0) + 1 from Content
                DBCC CHECKIDENT('mytable', RESEED, @maxVal)"
                 */
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string file_name = "";
            string location = "";
            string type = "";
            string subject = "";
            string sem = "";
            string year = "";

            try
            {
                if (FileUpload1.HasFile | content_name.Text != "")
                {
                    if (FileUpload1.HasFile)
                    {
                        file_name = FileUpload1.FileName;
                    }
                    else if (content_name.Text != "")
                    {
                        file_name = content_name.Text;
                    }

                    location = select_location.SelectedValue;
                    type = select_content_type.SelectedValue;

                    if (select_sem.SelectedValue != "")
                    {
                        sem = select_sem.SelectedValue;
                    }
                    else if (sem == "")
                    {
                        sem = "No_Sem";
                    }
                    if (select_year.SelectedValue != "")
                    {
                        year = select_year.SelectedValue;
                    }
                    if (select_sub.SelectedValue.Length > 0)
                    {
                        subject = select_sub.SelectedValue;
                    }
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
                            if (FileUpload1.Visible == true && FileUpload1.HasFile)
                            {
                                if (location == "Others")
                                {
                                    FileUpload1.SaveAs(Server.MapPath("~/Contents/Others/") + file_name);
                                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Content uploaded successfully.');window.location ='AdminView.aspx';", true);
                                }

                                else if (location == "Curriculum(Local)")
                                {

                                    FileUpload1.SaveAs(Server.MapPath("~/Contents/Curriculum/" + sem + "/Local_Files/") + file_name);
                                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Content uploaded successfully.');window.location ='AdminView.aspx';", true);
                                }

                                else if (location == "Syllabus")
                                {
                                    FileUpload1.SaveAs(Server.MapPath("~/Contents/Curriculum/Syllabus/" + year + "/") + file_name);
                                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Content uploaded successfully.');window.location ='AdminView.aspx';", true);
                                }
                            }
                            else
                            {
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Saved content is an external link. If not, then please check the database.');window.location ='AdminView.aspx';", true);
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
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('NO content saved!.');window.location ='AdminView.aspx';", true);
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
                    FileUpload1.Visible = true;
                }
                else if (add_content.SelectedValue == "Add Link")
                {
                    FileUpload1.Visible = false;
                    content_name.Visible = true;
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
            SqlCommand cmd = new SqlCommand("SELECT[Sub1], [Sub2], [Sub4], [Sub3], [Sub5] FROM[Subjects] WHERE([Sem] = @Sem)", con);
            cmd.Parameters.AddWithValue("@Sem", sem);
            try
            {
                con.Open();
                /* 
                 SqlDataAdapter sda = new SqlDataAdapter(cmd);
                 DataSet ds = new DataSet();
                 sda.Fill(ds);
                 select_sub.DataSource = ds;
                 select_sub.DataBind();
                 */
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
                SqlCommand cmd = new SqlCommand("SELECT[Sub1], [Sub2], [Sub4], [Sub3], [Sub5] FROM[Subjects] WHERE([Sem] = @Sem)", con);
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