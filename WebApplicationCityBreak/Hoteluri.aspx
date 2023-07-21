<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Hoteluri.aspx.cs" Inherits="WebApplicationCityBreak.Hoteluri" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="css_pages/StyleSheetHoteluri.css" rel="stylesheet" />

    <section>
        <div class="flex-container">
            <div class="booking-form-box">
                <div class="booking-form" id="booking-form">                 
                    <div class="input-grp">
                        <label>Plecare</label>
                        <input type="date" id="checkin" name="checkin" class="form-control custom-select-date" required/>
                    </div>
                    <div class="input-grp">
                        <label>Întoarcere</label>
                        <input type="date" id="checkout" name="checkout" class="form-control custom-select-date" required/>
                    </div>

                    <div class="input-grp">
                        <label>Adulți</label>
                        <input id="adult" type="number" name="adult" class="form-control" value="1" required/>
                    </div>
                    <div class="input-grp">
                        <label>Copii</label>
                        <input id="copil" type="number" name="copil" class="form-control" value="0"/>
                    </div>

                    <div class="input-grp">
                        <label>Cameră</label>
                        <input id="camera" name="camera" type="number" class="form-control"  min="1" value="1">
                    </div>
                    <br>
                    <div class="input-grp">
                        <asp:LinkButton type="submit" runat="server" class="btn btn-info flight" Style="width: 350px; font-weight: bold;" OnClick="Unnamed1_Click">Căutare hoteluri</asp:LinkButton>
                    </div>

                </div>
            </div>
            <div><img src="img/fundal_hoteluri.jpg" width="750"/></div> 
            
        </div>

    </section>


</asp:Content>
