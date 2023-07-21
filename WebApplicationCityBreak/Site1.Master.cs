using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplicationCityBreak
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["rol"] == null)
                {
                    // cand doar ce intram pe pagina trebuie sa fie vizibile doar cele , deoarece nu este nimeni logat
                    LinkButton1.Visible = true; // autentificare link buton
                    LinkButton2.Visible = true; // inregistrare link buton
                    LinkButton4.Visible = false; // deconectare link buton
                    LinkButton3.Visible = false; // profil link buton
                    LinkButton5.Visible = false; // favorite link buton
                    LinkButton6.Visible = false; // cos link buton
                }
                else if (Session["rol"].Equals("client"))
                {
                    // cand ne vom loga ca user 
                    LinkButton1.Visible = false; // autentificare link buton
                    LinkButton2.Visible = false; // inregistrare link buton
                    LinkButton4.Visible = true; // deconectare link buton
                    LinkButton3.Visible = true; // profil link buton
                    LinkButton5.Visible = true; // favorite link buton
                    LinkButton6.Visible = true; // cos link buton
                    LinkButton3.Text = Session["nume"].ToString();
                }
            }
            catch (Exception)
            {

            }


        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Autentificare.aspx");
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Inregistrare.aspx");
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Response.Redirect("Profil.aspx");
        }

        protected void LinkButton5_Click(object sender, EventArgs e)
        {
            Response.Redirect("Favorite.aspx");
        }

        protected void LinkButton6_Click(object sender, EventArgs e)
        {
            Response.Redirect("Cos.aspx");
        }

        // deconectare buton
        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            Session["email"] = "";
            Session["nume"] = "";
            Session["rol"] = "";

            LinkButton1.Visible = true; // autentificare link buton
            LinkButton2.Visible = true; // inregistrare link buton
            LinkButton4.Visible = false; // deconectare link buton
            LinkButton3.Visible = false; // profil link buton
            LinkButton5.Visible = false; // favorite link buton
            LinkButton6.Visible = false; // cos link buton

            Response.Redirect("Acasa.aspx");
        }
    }
}