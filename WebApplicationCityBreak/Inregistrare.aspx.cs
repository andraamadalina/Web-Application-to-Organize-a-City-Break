using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplicationCityBreak
{
    public partial class Inregistrare : System.Web.UI.Page
    {
        // string conexiune
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (VerificareExistentaClient())
            {
                Response.Write("<script>alert('Există deja un utilizatorul cu acest e-mail.');</script>)");
            }
            else
            {
                InregistrareClientNou();
            }


            
        }
        
        void InregistrareClientNou()
        {
            //Verificare conexiune baza de date
            try
            {
                // crearea unui obiect(con) care cere un parametru care este strcon
                SqlConnection con = new SqlConnection(strcon);
                // verificare daca este conectat la baza de date
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                // adaugare date in tabelele din baza de date din frontend
                Guid clientID = Guid.NewGuid();
                //Guid rezervariID = Guid.NewGuid();

                SqlCommand cmd = new SqlCommand("INSERT INTO Client (client_ID, nume, prenume, email, telefon, tara, oras, cod_postal, adresa, data_nasterii, parola)" +
                    "VALUES (@client_ID, @nume, @prenume, @email, @telefon, @tara, @oras, @cod_postal, @adresa, @data_nasterii, @parola)", con);
                cmd.Parameters.AddWithValue("@client_ID", clientID.ToString());
                cmd.Parameters.AddWithValue("@nume", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@prenume", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@email", TextBox10.Text.Trim());
                cmd.Parameters.AddWithValue("@telefon", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@tara", TextBox11.Text.Trim());
                cmd.Parameters.AddWithValue("@oras", TextBox7.Text.Trim());
                cmd.Parameters.AddWithValue("@cod_postal", TextBox6.Text.Trim());
                cmd.Parameters.AddWithValue("@adresa", TextBox5.Text.Trim());
                cmd.Parameters.AddWithValue("@data_nasterii", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@parola", TextBox8.Text.Trim());
                //cmd.Parameters.AddWithValue("@rezervari_ID", rezervariID.ToString());

                // Verificare daca parola este introdusa corect
                string textbox8Val = TextBox8.Text;
                string textbox9Val = TextBox9.Text;
                if (textbox8Val == textbox9Val)
                {
                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Înregistrarea a fost făcută cu succes. Acum vă puteți autentifica.');</script>");
                }
                else
                {
                    Response.Write("<script>alert('Parola a fost introdusă greșit. Încercați din nou.');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        bool VerificareExistentaClient()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from Client where email='" + TextBox10.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }
    }
}