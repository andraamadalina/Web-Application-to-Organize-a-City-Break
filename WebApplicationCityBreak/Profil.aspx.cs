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
    public partial class Profil : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["email"] == null || Session["email"].ToString() == "")
                {
                    Response.Write("<script>alert('Sesiunea a expirat. Vă rugăm să vă autentificați din nou.');</script>");
                    Response.Redirect("Autentificare.aspx");
                }
                else
                {
                    if (!Page.IsPostBack)
                    {
                        DetaliiClient();
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Sesiunea a expirat. Vă rugăm să vă autentificați din nou.');</script>");
                Response.Redirect("Autentificare.aspx");
            }
        }

        // update detalii

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Session["email"].ToString() == "" || Session["email"] == null)
            {
                Response.Write("<script>alert('Sesiunea a expirat. Vă rugăm să vă autentificați din nou.');</script>");
                Response.Redirect("Autentificare.aspx");
            }
            else
            {
                SchimbareDetaliiClient();

            }

        }

        void SchimbareDetaliiClient()
        {
            string parola = "";
            if (TextBox10.Text.Trim() == "")
            {
                parola = TextBox9.Text.Trim();
            }
            else
            {
                parola = TextBox10.Text.Trim();
            }
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }


                SqlCommand cmd = new SqlCommand("UPDATE Client SET tara=@tara, oras=@oras, cod_postal=@cod_postal, adresa=@adresa, parola=@parola " +
                    "WHERE email='" + Session["email"].ToString().Trim() + "'", con);

                cmd.Parameters.AddWithValue("@tara", TextBox11.Text.Trim());
                cmd.Parameters.AddWithValue("@oras", TextBox7.Text.Trim());
                cmd.Parameters.AddWithValue("@cod_postal", TextBox6.Text.Trim());
                cmd.Parameters.AddWithValue("@adresa", TextBox5.Text.Trim());
                cmd.Parameters.AddWithValue("@parola", parola);

                int result = cmd.ExecuteNonQuery();
                con.Close();
                if (result > 0)
                {

                    Response.Write("<script>alert('Datele au fost schimbate cu succes.');</script>");
                    DetaliiClient();
                }
                else
                {
                    Response.Write("<script>alert('Date invalide.');</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void DetaliiClient()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM Client WHERE email='" + Session["email"].ToString() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                TextBox1.Text = dt.Rows[0]["nume"].ToString();
                TextBox3.Text = dt.Rows[0]["prenume"].ToString();
                TextBox2.Text = dt.Rows[0]["data_nasterii"].ToString();
                TextBox4.Text = dt.Rows[0]["telefon"].ToString();
                TextBox5.Text = dt.Rows[0]["email"].ToString();
                TextBox11.Text = dt.Rows[0]["tara"].ToString();
                TextBox7.Text = dt.Rows[0]["oras"].ToString();
                TextBox6.Text = dt.Rows[0]["cod_postal"].ToString();
                TextBox12.Text = dt.Rows[0]["adresa"].ToString();
                TextBox9.Text = dt.Rows[0]["parola"].ToString();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}