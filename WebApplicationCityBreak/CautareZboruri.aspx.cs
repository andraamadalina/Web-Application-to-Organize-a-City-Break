using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Reflection.Emit;

namespace WebApplicationCityBreak
{
    public partial class CautareZboruri : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            string script = "$('#mymodal').modal('show');";
            ClientScript.RegisterStartupScript(this.GetType(), "Popup", script, true);
        }

        protected void btnsave_Click(object sender, EventArgs e)
        {
            // Retrieve the selected price from the cookie
            HttpCookie selectedPriceCookie = Request.Cookies["selectedPrice"];
            string selectedPrice = selectedPriceCookie?.Value;

            // Store the selected price in a session variable
            Session["SelectedPrice"] = selectedPrice;

            HttpCookie apcCookie = Request.Cookies["apc"];
            string apc = apcCookie?.Value;
            HttpCookie ascCookie = Request.Cookies["asc"];
            string asc = ascCookie?.Value;

            Session["aeroportp"] = apc;
            Session["aeroports"] = asc;

            HttpCookie dpCookie = Request.Cookies["dp"];
            string dp = dpCookie?.Value;

            Session["datap"] = dp;

            Response.Redirect("Cos.aspx");
        }

    }
}