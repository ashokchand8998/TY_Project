using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Code for changing class of selected page to "current" (To change color of the current page label in menu)
            HtmlGenericControl li = (HtmlGenericControl)this.Master.FindControl("profiles");
            li.Attributes.Add("class", "current");

            if (Session["name"] != null)
            {
                String user = "Welcome! </br>" + Session["name"].ToString();
            }
        }
    }
}