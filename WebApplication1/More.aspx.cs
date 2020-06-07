using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class More : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Code for changing class of selected page to "current" (To change color of the current page label in menu)
            HtmlGenericControl li = (HtmlGenericControl)this.Master.FindControl("more");
            li.Attributes.Add("class", "current");


            if (!IsPostBack)
            {
                if (Session["user"] != null)
                {
                    string qs = Request.QueryString["topic"];
                    if (qs != null)
                    {
                        main_icons.Visible = false;
                        content_div.Visible = true;
                        if (qs == "Others")
                        {
                            main_table.Visible = false;
                        }
                        else
                        {
                            Label1.Text = qs;
                        }
                    }
                    else
                    {
                        content_div.Visible = false;
                        main_icons.Visible = true;
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