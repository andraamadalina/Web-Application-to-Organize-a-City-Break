<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Restaurante.aspx.cs" Inherits="WebApplicationCityBreak.Restaurante" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="css_pages/StyleSheetRestaurante.css" rel="stylesheet" />
    <section>
        <div class="flex-container">
            <div class="booking-form-box" style="height:240px">
                <div class="booking-form" id="booking-form">                 
                    <div class="input-grp">
                        <label>Data rezervării</label>
                        <input type="date" id="data" name="data" class="form-control custom-select-date" required/>
                    </div>
                    <div class="input-grp">
                        <label>Ora rezervării</label>
                        <input type="time" id="ora" name="ora" min="09:00" class="form-control" max="21:00" required/>
                    </div>
                    <div class="input-grp">
                        <label>Persoane</label>
                        <input id="pers" type="number" name="pers" class="form-control" value="1" min="1" required/>
                    </div>
                    <br />
                    <div class="input-grp">
                        <asp:LinkButton type="submit" runat="server" class="btn btn-info flight" Style="width: 350px; font-weight: bold;" OnClick="Unnamed1_Click">Căutare restaurant</asp:LinkButton>
                    </div>

                </div>
            </div>
            <div style="margin-left:50px"><img src="img/funsal_restaurante.jpg" width="609"/></div> 
        </div>

    </section>

</asp:Content>
