using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplicationCityBreak
{
    public partial class Cos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Retrieve the selected price from the session variable
                string selectedPrice = Session["SelectedPrice"] as string;

                // Display the selected price in a label or any other element
                lblSelectedPrice.Text = selectedPrice; // Replace "lblSelectedPrice" with the ID of your label element

                string apc = Session["aeroportp"] as string;
                LabelPlecare.Text = apc;

                string asc = Session["aeroports"] as string;
                LabelSosire.Text = asc;

                string dp = Session["datap"] as string;
                LabelData.Text = dp;

                /*string singlePrice = Session["sp"] as string;
                Label1.Text = singlePrice;

                
                string hotelName = Session["hn"] as string;
                Label6.Text = hotelName;*/

                if (Session["pretOferta"] != null)
                {
                    pretOferta.Text = Session["pretOferta"].ToString();
                }

                if (Session["pretOferta2"] != null)
                {
                    pretOferta2.Text = Session["pretOferta2"].ToString();
                }

                if (Session["pretOferta3"] != null)
                {
                    pretOferta3.Text = Session["pretOferta3"].ToString();
                }
                if (Session["pretOferta4"] != null)
                {
                    pretOferta4.Text = Session["pretOferta4"].ToString();
                }

            }


        }
    }
}