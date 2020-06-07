using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace WebApplication1.Properties
{
    public partial class Curriculum : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Code for changing class of selected page to "current" (To change color of the current page label in menu)
            HtmlGenericControl li = (HtmlGenericControl)this.Master.FindControl("curriculum");
            li.Attributes.Add("class", "current");

            if (!IsPostBack)
            {
                if (Session["user"] != null)
                {
                    string qs = Request.QueryString["sem"];
                    if (qs != null)
                    {
                        default_div.Visible = false;
                        Heading.Text = qs;
                    }
                    else
                    {
                        sem_page.Visible = false;
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Please Login first to access our complete site.');window.location ='Login.aspx';", true);
                }
            }
        }

    }
}