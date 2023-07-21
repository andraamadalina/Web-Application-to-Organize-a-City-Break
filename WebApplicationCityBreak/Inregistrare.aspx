<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Inregistrare.aspx.cs" Inherits="WebApplicationCityBreak.Inregistrare" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <div class="row">
            <div class="col-md-8 mx-auto">
                <br>
                <br>
                <div class="card" style="font-family: Light 300;box-shadow: #e97013 5px 5px, #ef8b3e 10px 10px, #f3a66b 15px 15px, #f6c199 20px 20px, #faddc6 25px 25px;">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="100" src="img/utilizator.png" />
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4><b>Înregistrare</b></h4>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <label>Nume</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Nume"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label>Prenume</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Prenume"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <label>Data Nașterii</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Data Nașterii" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <label>Telefon</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Telefon" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <label>Email</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox10" runat="server" placeholder="Email" TextMode="Email"></asp:TextBox>
                                </div>
                            </div>

                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <label>Țară</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="TextBox11" runat="server" placeholder="Țară"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <label>Oraș</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="TextBox7" runat="server" placeholder="Oraș"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <label>Cod Poștal</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="TextBox6" runat="server" placeholder="Cod Poștal" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <label>Adresa Completă</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="TextBox5" runat="server" placeholder="Adresa Completă" TextMode="MultiLine" Rows="2"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <label>Parolă</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="TextBox8" runat="server" placeholder="Parolă" TextMode="Password"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label>Verificare Parolă</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="TextBox9" runat="server" placeholder="Verificare Parolă" TextMode="Password"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <br>
                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <asp:Button class="btn btn-success btn-block btn-lg" ID="Button1" runat="server" Text="Înregistrare" OnClick="Button1_Click" />
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
