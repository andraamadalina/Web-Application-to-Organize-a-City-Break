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
    public partial class Zboruri : System.Web.UI.Page
    {
        //string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            //string taraplecare = Request.Form["tarap"];
            //string taradestinatie = Request.Form["tarad"];
            //string dataplecare = Request.Form["datap"];
            //string datadestinatie = Request.Form["datad"];

            //string cod_taraplecare = taraplecare.Substring(taraplecare.IndexOf("(") + 1, 3);
            //string cod_taradestinatie = taradestinatie.Substring(0, taradestinatie.IndexOf("(")).Trim();


            /*try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                }
                SqlCommand cmd = new SqlCommand("SELECT aeroport_plecare_cod, aeroport_sosire_cod, data_plecare, data_sosire FROM ZBor", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if(cod_taraplecare == "aeroport_plecare_cod" && cod_taradestinatie == "aeroport_sosire_cod" && dataplecare == "data_plecare" && datadestinatie == "data_sosire")
                {

                }

                

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }*/


        }

        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            string taraplecare = Request.Form["tarap"];
            string taraplecareCode = taraplecare.Substring(taraplecare.LastIndexOf("(") + 1, taraplecare.Length - taraplecare.LastIndexOf("(") - 2);

            string taradestinatie = Request.Form["tarad"];
            string taradestinatieCode = taradestinatie.Substring(taradestinatie.LastIndexOf("(") + 1, taradestinatie.Length - taradestinatie.LastIndexOf("(") - 2);

            string dataplecare = Request.Form["datap"];
            string adulti = Request.Form["nradulti"];
            string copii = Request.Form["nrcopii"];
            string clasa = Request.Form["clasaz"];

            Response.Redirect("CautareZboruri.aspx?taraplecareCode=" + taraplecareCode + "&taradestinatieCode=" + taradestinatieCode + "&dataplecare=" + dataplecare +
                  "&adulti=" + adulti + "&copii=" + copii  + "&clasa=" + clasa);

        }
    }
}