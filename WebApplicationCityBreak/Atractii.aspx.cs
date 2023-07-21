using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplicationCityBreak
{
    public partial class Atractii : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            // Get the check-in date value from the input field
            string dataa = Request.Form["dataa"];
            string oraa = Request.Form["oraa"];
            string persa = Request.Form["persa"];


            // Redirect to CautareHoteluri.aspx with the check-in date value in the query string
            Response.Redirect("CautareAtractii.aspx?dataa=" + dataa + "&oraa=" + oraa + "&persa=" + persa);
        }
    }
}