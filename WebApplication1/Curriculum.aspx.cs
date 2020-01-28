using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

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
                string s = Request.QueryString["page"];
                if (s == "SemV" | s == "SemVI")
                {
                    d1.InnerHtml = "<a href=\"Docs\\Curriculum\\4.49-Final-TYBSc-IT-Syllabus.pdf\">TYIT Syllabus</a>";
                }
            }
        }
    }
}