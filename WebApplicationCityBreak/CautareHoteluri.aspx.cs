using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplicationCityBreak
{
    public partial class CautareHoteluri : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            /*HttpCookie singlePriceCookie = Request.Cookies["singlePrice"];
            string singlePrice = singlePriceCookie?.Value;
            Session["sp"] = singlePrice;

            HttpCookie doublePriceCookie = Request.Cookies["doublePrice"];
            string doublePrice = doublePriceCookie?.Value;
            Session["dp"] = doublePrice;

            HttpCookie twinPriceCookie = Request.Cookies["twinPrice"];
            string twinPrice = twinPriceCookie?.Value;
            Session["twp"] = twinPrice;

            HttpCookie triplePriceCookie = Request.Cookies["triplePrice"];
            string triplePrice = triplePriceCookie?.Value;
            Session["tp"] = triplePrice;

            HttpCookie apartmentPriceCookie = Request.Cookies["apartmentPrice"];
            string apartmentPrice = apartmentPriceCookie?.Value;
            Session["ap"] = apartmentPrice;


            HttpCookie hotelNameCookie = Request.Cookies["hotelName"];
            string hotelName = hotelNameCookie?.Value;
            Session["hn"] = hotelName;*/


            Response.Redirect("Cos.aspx");
        }
    }
}