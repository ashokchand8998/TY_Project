using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace WebApplication1
{
    public partial class AdminView : System.Web.UI.Page
    {
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
            try
            {
                if (FileUpload1.HasFile | content_name.Text.Length > 0)
                {
                    string file_name = null;
                    string location = null;
                    string subject = null;
                    string sem = null;
                    string year = null;
                    if (FileUpload1.HasFile)
                    {
                        file_name = FileUpload1.FileName;
                        location = select_location.SelectedValue;
                    }
                    else if (content_name.Text!="")
                    {
                        file_name = content_name.Text;
                    }
                    string type = select_content_type.SelectedValue;

                    if (select_sem.SelectedValue != null)
                    {
                        sem = select_sem.SelectedValue;
                    }
                    if (select_year.SelectedValue != null)
                    {
                        year = select_year.SelectedValue;
                    }
                    if (select_sub.SelectedValue.Length > 0)
                    {
                        subject = select_sub.SelectedValue;
                    }
                    string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
                    SqlConnection con = new SqlConnection(cs);

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
                            if (FileUpload1.HasFile)
                            {
                                if (location == "Others")
                                {
                                    FileUpload1.SaveAs(Server.MapPath("~/Contents/Others/") + file_name);
                                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Content uploaded successfully.');", true);
                                }

                                else if (location == "Curriculum(Local)")
                                {

                                    FileUpload1.SaveAs(Server.MapPath("~/Contents/Curriculum/" + sem + "/Local_Files/") + file_name);
                                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Content uploaded successfully.');", true);
                                }

                                else if (location == "Syllabus")
                                {
                                    FileUpload1.SaveAs(Server.MapPath("~/Contents/Curriculum/Syllabus/" + year + "/") + file_name);
                                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Content uploaded successfully.');", true);
                                }
                                else
                                {
                                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Saved content is an external link. If not, then please check the database.');", true);
                                }
                            }
                        }
                    }
                    catch (SqlException ex_message)
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
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('NO content saved!.');", true);
                }
            }
            catch (Exception msg)
            {
               Response.Write("alert('"+msg.Message+"');");
            }
        }
    }
}