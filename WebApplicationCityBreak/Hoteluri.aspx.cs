using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplicationCityBreak
{
    public partial class Hoteluri : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            // Get the check-in date value from the input field
            string checkinDate = Request.Form["checkin"];
            string checkoutDate = Request.Form["checkout"];
            string adulti = Request.Form["adult"];
            string copii = Request.Form["copil"];
            string camere = Request.Form["camera"];

            // Redirect to CautareHoteluri.aspx with the check-in date value in the query string
            Response.Redirect("CautareHoteluri.aspx?checkinDate=" + checkinDate + "&checkoutDate=" + checkoutDate + "&adulti=" + adulti +
                "&copii=" + copii + "&camere=" + camere);
        }
    }
}