<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="CautareZboruri.aspx.cs" Inherits="WebApplicationCityBreak.CautareZboruri" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <center>
        <div class="container" style="font-family: Light 300">
            <div class="row">
                <div class="col-sm-12">
                    <center>
                        <h1 style="color: #FF8800; margin-bottom: 20px; margin-top: 20px;">Zboruri disponibile pentru <span style="color: black;"><%= Request.QueryString["taraplecareCode"] %> - <%= Request.QueryString["taradestinatieCode"] %></span></h1>
                        <h3><span><%= Request.QueryString["dataplecare"] %></span> pentru <span><%= Request.QueryString["adulti"] %></span> adulți și <span><%= Request.QueryString["copii"] %></span> copii</h3>
                        <h3>Clasa <span><%= Request.QueryString["clasa"] %></span></h3>
                    </center>
                    <div class="row">
                        <div class="col-sm-12 col-md-12">
                            <asp:Panel class="alert alert-success" role="alert" ID="Panel1" runat="server" Visible="False">
                                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                            </asp:Panel>
                        </div>
                    </div>
                    <br /><br />
                    <div class="row" style="margin-left:50px">
                        <div>
                            <div class="card-body">
                                <div class="row">
                                    <asp:GridView class="table table-striped table-bordered mx-auto" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="zbor_ID" DataSourceID="ctl02">

                                        <Columns>
                                            <asp:BoundField DataField="zbor_ID" ReadOnly="True" SortExpression="zbor_ID">
                                                <ControlStyle Font-Bold="True" />
                                                <ItemStyle Font-Bold="True" />
                                            </asp:BoundField>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <div class="container-fluid">
                                                        <div class="row">
                                                            <div class="col-lg-10">
                                                                <div class="row">
                                                                    <div class="col-12" style="display: inline">
                                                                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("durata") %>' Font-Bold="False" Font-Size="Large" Style="text-align: center; margin-left: 153px;"></asp:Label>
                                                                        <span>min</span>


                                                                    </div>
                                                                    <div class="col-12" style="display: inline">
                                                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("ora_plecare") %>' Font-Bold="True" Font-Size="X-Large"></asp:Label>
                                                                        <img src="img/Untitledpng.png" style="height: 30px;" />
                                                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("ora_sosire") %>' Font-Bold="True" Font-Size="X-Large"></asp:Label>

                                                                    </div>
                                                                    <div class="col-12" style="display: inline">
                                                                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("aeroport_plecare_cod") %>' Font-Bold="False" Font-Size="X-Large"></asp:Label>
                                                                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("aeroport_sosire_cod") %>' Font-Bold="False" Font-Size="X-Large" Style="margin-left: 270px"></asp:Label>
                                                                    </div>
                                                                    <script>
                                                                        apc = '<%= Request.QueryString["taraplecareCode"] %>';
                                                                        asc = '<%= Request.QueryString["taradestinatieCode"] %>';

                                                                        dp = '<%= Request.QueryString["dataplecare"] %>';

                                                                        document.cookie = "dp=" + dp;
                                                                        document.cookie = "apc=" + apc;
                                                                        document.cookie = "asc=" + asc;
                                                                    </script>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-2">
                                                                <b>
                                                                    <div id="resultDiv" style="font-size: 26px; color: #FF8800;"></div>
                                                                </b>

                                                                <script>
                                                                    // functie pentru pretul zborurilor
                                                                    function randomPret() {
                                                                        nr_adulti = <%= Request.QueryString["adulti"] %>;
                                                                        nr_copii = <%= Request.QueryString["copii"] %>;
                                                                        nr_persoane = nr_adulti + nr_copii;

                                                                        durata = <%# Eval("durata") %>;

                                                                        var clasazbor = decodeURIComponent("<%= Request.QueryString["clasa"] %>");
                                                                        var pretrand;

                                                                        if (clasazbor == "Economică") {
                                                                            if (durata > 100) {
                                                                                pretrand = Math.floor(Math.random() * 3) + 3;
                                                                                pret = pretrand * durata * nr_persoane;
                                                                            }
                                                                            else {
                                                                                pretrand = Math.floor(Math.random() * 7) + 8;
                                                                                pret = pretrand * durata * nr_persoane;
                                                                            }


                                                                        } else if (clasazbor == "Business") {
                                                                            if (durata > 100) {
                                                                                pretrand = Math.floor(Math.random() * 3) + 3;
                                                                                pret = pretrand * durata * 2;
                                                                            }
                                                                            else {
                                                                                pretrand = Math.floor(Math.random() * 7) + 8;
                                                                                pret = pretrand * durata * 2;
                                                                            }
                                                                        } else if (clasazbor == "Clasa I") {
                                                                            if (durata > 100) {
                                                                                pretrand = Math.floor(Math.random() * 3) + 3;
                                                                                pret = pretrand * durata * 2;
                                                                            }
                                                                            else {
                                                                                pretrand = Math.floor(Math.random() * 7) + 8;
                                                                                pret = pretrand * durata * 2;
                                                                            }
                                                                        }

                                                                        pretValue = pret;

                                                                        var resultDiv = document.getElementById("resultDiv");
                                                                        if (resultDiv !== null) {
                                                                            resultDiv.innerText = pret + " lei";
                                                                        } else {
                                                                            console.error("resultDiv nu a fost gasit.");
                                                                        }
                                                                    }
         
                                                                    window.onload = function () {
                                                                        randomPret();
                                                                        updatePrice3();
                                                                        updatePrice2();
                                                                        updatePrice1();
                                                                    };
                                                                </script>
                                                                
                                                                <asp:Button class="btn bg-secondary text-white" ID="Button4" runat="server" Text="Selectați" OnClick="Button4_Click" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                        </Columns>

                                    </asp:GridView>
                                    <asp:SqlDataSource runat="server" ConnectionString="<%$ ConnectionStrings:citybreakDBConnectionString2 %>" SelectCommand="SELECT [zbor_ID], [data_plecare], [data_sosire], [ora_plecare], [ora_sosire], [aeroport_plecare_cod], [aeroport_sosire_cod], [durata] FROM [Zbor] WHERE (aeroport_plecare_cod = @taraplecareCode) AND (aeroport_sosire_cod = @taradestinatieCode) AND (data_plecare = @dataplecare)" ID="ctl02">
                                        <SelectParameters>
                                            <asp:QueryStringParameter Name="taraplecareCode" QueryStringField="taraplecareCode" />
                                            <asp:QueryStringParameter Name="taradestinatieCode" QueryStringField="taradestinatieCode" />
                                            <asp:QueryStringParameter Name="dataplecare" QueryStringField="dataplecare" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>

                                </div>

                            </div>

                        </div>
                    </div>
                    <br /><br /><br />
                </div>
            </div>
        </div>

    </center>

    <!--POP UP buton Selectati-->
    <container>

        <div class="modal fade" id="mymodal" role="dialog">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Selectați pachetul dorit</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="mini-container">
                                        <center>
                                            <h5 class="modal-mini-container1" style="color: #6DBDC2;font-weight: bold;">Totul inclus</h5>
                                            <hr />
                                            <div><p><i class="fa-solid fa-cart-flatbed-suitcase"></i> Bagaj de cală de <span style="color: #FF8800;">20kg</span></p></div>
                                            <div><i class="fa-solid fa-circle-plus"></i></div>
                                            <div><p><i class="fa-solid fa-suitcase-rolling"></i> Bagaj de mână și troller la bord <span style="color: #FF8800;">gratuit</span></p></div>
                                            <div><i class="fa-solid fa-circle-plus"></i></div>
                                            <div><p><i class="fa-solid fa-hospitals"></i> Asigurare de călătorie</p></div>
                                            <div id="price1" style="color: #FF8800;font-weight: bold;"></div>
                                            <script>
                                                function updatePrice1() {
                                                    var price1Element = document.getElementById("price1");
                                                    if (price1Element !== null) {
                                                        pretValue1 = pretValue + 250;
                                                        price1Element.innerText = pretValue1 + " lei";
                                                    } else {
                                                        console.error("price1 nu a fost gasit.");
                                                    }
                                                }
                                            </script>
                                            <input type="radio" id="checkprice1" name="price" onclick="myFunction()">

                                        </center>

                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="mini-container">
                                        <center>
                                            <h5 class="modal-mini-container2" style="color: #6DBDC2;font-weight: bold;">Împachetați și economisiți</h5>
                                            <hr />
                                            <div><p><i class="fa-solid fa-suitcase-rolling"></i> Bagaj de mână și troller la bord <span style="color: #FF8800;">gratuit</span></p></div>
                                            <div><i class="fa-solid fa-circle-plus"></i></div>
                                            <div><p><i class="fa-solid fa-hospitals"></i> Asigurare de călătorie</p></div>
                                            <div id="price2" style="color: #FF8800;font-weight: bold;"></div>
                                            <script>
                                                function updatePrice2() {
                                                    var price2Element = document.getElementById("price2");
                                                    if (price2Element !== null) {
                                                        pretValue2 = pretValue + 150;
                                                        price2Element.innerText = pretValue2 + " lei";
                                                    } else {
                                                        console.error("price2 nu a fost gasit.");
                                                    }
                                                }
                                            </script>
                                            <input type="radio" id="checkprice2" name="price" onclick="myFunction()">
                                        </center>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="mini-container">
                                        <center>
                                            <h5 class="modal-mini-container3" style="color: #6DBDC2;font-weight: bold;">Călătoriți fără bagaje</h5>
                                            <hr />
                                            <div><p><i class="fa-duotone fa-backpack"></i> Bagaj de mână <span style="color: #FF8800;">gratuit</span></p></div>
                                            <div id="price3" style="color: #FF8800;font-weight: bold;"></div>
                                            <script>
                                                function updatePrice3() {
                                                    var price3Element = document.getElementById("price3");
                                                    if (price3Element !== null) {
                                                        price3Element.innerText = pretValue + " lei";
                                                    } else {
                                                        console.error("price3 nu a fost gasit.");
                                                    }
                                                }
                                            </script>
                                            <input type="radio" id="checkprice3" name="price" onclick="myFunction()">
                                        </center>
                                    </div>
                                </div>

                                <br />
                                <p id="text1" style="display:none"><b>Ați selectat pachetul "Totul inclus".</b></p>
                                <p id="text2" style="display:none"><b>Ați selectat pachetul "Împachetați și economisiți".</b></p>
                                <p id="text3" style="display:none"><b>Ați selectat pachetul "Călătoriți fără bagaje".</b></p>

                                <script>
                                    function myFunction() {
                                        var radio1 = document.getElementById("checkprice1");
                                        var radio2 = document.getElementById("checkprice2");
                                        var radio3 = document.getElementById("checkprice3");

                                        var text1 = document.getElementById("text1");
                                        var text2 = document.getElementById("text2");
                                        var text3 = document.getElementById("text3");

                                        var selectedPrice;

                                        if (radio1.checked) {
                                            text1.style.display = "block";
                                            text2.style.display = "none";
                                            text3.style.display = "none";

                                            selectedPrice = pretValue1;
                                        } else if (radio2.checked) {
                                            text2.style.display = "block";
                                            text1.style.display = "none";
                                            text3.style.display = "none";

                                            selectedPrice = pretValue2;
                                        } else if (radio3.checked) {
                                            text3.style.display = "block";
                                            text1.style.display = "none";
                                            text2.style.display = "none";

                                            selectedPrice = pretValue;
                                        } else {
                                            text1.style.display = "none";
                                            text2.style.display = "none";
                                            text3.style.display = "none";
                                        }

                                        document.cookie = "selectedPrice=" + selectedPrice;
                                    }
                                </script>
                            </div>
                        </div>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Închideți</button>
                        <asp:Button ID="btnsave" CssClass="btn btn-primary" Text="Rezervați" runat="server" OnClick="btnsave_Click"/>

                    </div>
                </div>

            </div>

        </div>

    </container>
</asp:Content>
