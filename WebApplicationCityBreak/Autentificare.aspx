<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Autentificare.aspx.cs" Inherits="WebApplicationCityBreak.Autentificare" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="css_pages/StyleSheetAutentificare.css" rel="stylesheet" />

     <div class="container" >
        <div class="row">
            <div class="col-md-12 mx-auto">
                <br>
                <br>
                <div class="card" style="width:500px; margin: 0 auto; font-family: Light 300;box-shadow: #e97013 5px 5px, #ef8b3e 10px 10px, #f3a66b 15px 15px, #f6c199 20px 20px, #faddc6 25px 25px;">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="150" src="img/utilizator.png"/>
                                </center>

                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h3><b>Conectare</b></h3>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <label>Email</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Email"></asp:TextBox>
                                </div>

                                <label>Parola</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Parola" TextMode="Password"></asp:TextBox>
                                </div>

                                <label>
                                    <input type="checkbox" checked="checked" name="remember"> Rămai conectat
                                </label>

                                <div class="form-group">
                                    <asp:Button CssClass="btn btn-success btn-block btn-lg" ID="Button1" runat="server" Text="Autentificare" OnClick="Button1_Click" />
                                </div>

                                <div class="form-group">
                                    <asp:Button CssClass="btn btn-info btn-block btn-lg" ID="Button3" runat="server" Text="Înregistrare" OnClick="Button3_Click" />
                                </div>

                                <div>Ați uitat <a class="parola" href="#popup1">parola?</a></div>
                                <div id="popup1" class="overlay1">
	                                <div class="popup1">
		                                <h2><b>Ați uitat parola</b></h2>
                                        <hr>
		                                <a class="close" href="#">&times;</a>
		                                <label>Email</label>
                                            <div class="form-group">
                                                <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Email"></asp:TextBox>
                                            </div>
                                        <p>Vă vom trimite un e-mail cu un link de resetare a parolei.</p>
                                        <a class="btn btn-outline-primary" href="#popup2" role="button">TRIMITEȚI EMAILUL DE RESETARE</a>
	                                </div>
                                </div>
                                <div id="popup2" class="overlay2">
	                                <div class="popup2">
		                                <h2><b>Resetați parola</b></h2>
                                        <hr>
		                                <a class="close" href="#">&times;</a>
                                        <p>Ați primit un e-mail!</p>
                                        <p>V-am trimis instrucțiunile privind modul de resetare a parolei și de recuperare a contului pe adresa dumneavoastră de e-mail.</p>
                                        <p>Dacă nu ați primit e-mailul, așteptați câteva minute și verificați din nou.</p>
                                        <a class="btn btn-outline-primary" href="Autentificare.aspx" role="button">AM ÎNȚELES</a>
	                                </div>
                                </div>




                            </div>
                        </div>

                    </div>
                </div>
                <br>
                <br>
                <br>
            </div>
        </div>
    </div>

</asp:Content>
