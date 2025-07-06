using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebBanHang
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["CurrentUser"] != null)
                {
                    var user = (WebBanHang.Models.User)Session["CurrentUser"];
                    var lblUserName = (Label)LoginView1.FindControl("lblUserName");
                    if (lblUserName != null)
                    {
                        lblUserName.Text = user.HoTen;
                    }
                }
            }
        }
        public string GetCartCount()
        {
            if (Session["CartCount"] != null)
                return Session["CartCount"].ToString();
            return "0";
        }
    }
}