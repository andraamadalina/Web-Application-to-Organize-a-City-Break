using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplicationCityBreak
{
    public partial class Restaurante : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            // Get the check-in date value from the input field
            string data = Request.Form["data"];
            string ora = Request.Form["ora"];
            string pers = Request.Form["pers"];


            // Redirect to CautareHoteluri.aspx with the check-in date value in the query string
            Response.Redirect("CautareRestaurante.aspx?data=" + data + "&ora=" + ora + "&pers=" + pers);
        }
    }
}