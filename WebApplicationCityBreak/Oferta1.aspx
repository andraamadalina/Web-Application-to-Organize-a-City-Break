<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Oferta1.aspx.cs" Inherits="WebApplicationCityBreak.Oferta1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />

    <center style="font-family: Light 300; margin-top: 20px">
        <h1 style="color: #FF8800">OFERTA LUNII</h1>
        <h3>Din <span style="color: #FF8800">Aeroportul Internațional Henri Coandă</span> către <span style="color: #FF8800">Aeroportul Barcelona-El Prat</span></h3>
        <hr />
        <b>Alegeți data de plecare și data de sosire dorită pentru a rezerva zborul:</b>
        <input type="text" name="daterange" value="07/01/2023 - 07/31/2023"/>
        <br />
        Ofertă disponibilă doar pe parcursul lunii iulie.
        <br /><br />

        <div id="departure-date" style="font-weight: bold;"></div>
        <div id="arrival-date" style="font-weight: bold;"></div>
    </center>

    

    <script>
        $(function () {
            $('input[name="daterange"]').daterangepicker({
                opens: 'left'
            }, function (start, end, label) {
                var startDate = start.format('YYYY-MM-DD');
                var endDate = end.format('YYYY-MM-DD');

                // Actualizează conținutul div-urilor cu datele de plecare și sosire
                $('#departure-date').text("Data de plecare: " + startDate);
                $('#arrival-date').text("Data de sosire: " + endDate);
            });
        });
    </script>


    <!------------------------------------------------------------------------------------------------->
    <center>
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <div class="row">
                        <div class="col-sm-12 col-md-12">
                            <asp:Panel class="alert alert-success" role="alert" ID="Panel1" runat="server" Visible="False">
                                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                            </asp:Panel>
                        </div>
                    </div>
                    <br />

                    <div class="row" style="margin-left: 120px">
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
                                                    <center>
                                                        <div class="container-fluid" style="font-family: Light 300">
                                                            <div class="row">
                                                                <div class="col-lg-12">
                                                                    <div class="row">
                                                                        <div class="col-12" style="display: inline">
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
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </center>
                                                </ItemTemplate>

                                            </asp:TemplateField>

                                        </Columns>


                                    </asp:GridView>
                                    


                                    <asp:SqlDataSource runat="server" ID="ctl02" ConnectionString="<%$ ConnectionStrings:citybreakDBConnectionString3 %>"
                                        SelectCommand="SELECT [zbor_ID], [data_plecare], [ora_plecare], [ora_sosire], [aeroport_plecare_cod], [aeroport_sosire_cod] FROM [Zbor] WHERE ([aeroport_plecare_cod] = 'OTP' AND [aeroport_sosire_cod] = 'BCN') OR ([aeroport_plecare_cod] = 'BCN' AND [aeroport_sosire_cod] = 'OTP')"></asp:SqlDataSource>

                                </div>

                                <center>
                                    <asp:Button class="btn btn-info text-white" ID="Button4" runat="server" Text="Selectați" OnClick="Button4_Click" />

                                    <br /><br />
                                    <p>Pret dus-intors: </p>
                                    <div style="font-size: 26px; color: #FF8800;"> 595 lei</div>

                                </center>
                                <!--<div id="resultDiv" style="font-size: 26px; color: #FF8800;"></div>
                                <script>
                                    function generateRandomPrice() {
                                        // Generează un număr aleatoriu între 90 și 120
                                        var pret = Math.floor(Math.random() * (120 - 90 + 1)) + 90;

                                        var resultDiv = document.getElementById("resultDiv");
                                        if (resultDiv !== null) {
                                            resultDiv.innerText = pret + " €";
                                        } else {
                                            console.error("resultDiv nu a fost gasit.");
                                        }
                                    }
                                    generateRandomPrice();

                                </script>-->

                            </div>

                        </div>
                    </div>

                </div>

            </div>
        </div>

    </center>


</asp:Content>
