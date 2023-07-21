using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplicationCityBreak
{
    public partial class Oferta2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button4_Click(object sender, EventArgs e)
        {
            // Obțineți suma selectată
            string pretOferta2 = "830 lei"; // Puteți înlocui aceasta cu valoarea reală

            // Adăugați suma în sesiunea curentă
            Session["pretOferta2"] = pretOferta2;

            // Redirecționați utilizatorul către pagina de coș
            Response.Redirect("Cos.aspx");
        }
    }
}