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
    public partial class Autentificare : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("Inregistrare.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM Client WHERE email='" + TextBox1.Text.Trim() + "' AND parola='" + TextBox2.Text.Trim() + "'", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        Response.Write("<script>alert('V-ați autentificat cu succes.');</script>");
                        Session["email"] = dr.GetValue(3).ToString();
                        Session["nume"] = dr.GetValue(1).ToString() + " " + dr.GetValue(2).ToString();
                        Session["rol"] = "client";
                    }
                    Response.Redirect("Acasa.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Credențiale invalide.');</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}