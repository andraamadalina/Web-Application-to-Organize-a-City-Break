<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Atractii.aspx.cs" Inherits="WebApplicationCityBreak.Atractii" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="css_pages/StyleSheetRestaurante.css" rel="stylesheet" />
     <section>
        <div class="flex-container">
            <div class="booking-form-box" style="height:240px">
                <div class="booking-form" id="booking-form">                 
                    <div class="input-grp">
                        <label>Data</label>
                        <input type="date" id="dataa" name="dataa" class="form-control custom-select-date" required/>
                    </div>
                    <div class="input-grp">
                        <label>Ora</label>
                        <input type="time" id="oraa" name="oraa" min="09:00" class="form-control" max="19:00" required/>
                    </div>
                    <div class="input-grp">
                        <label>Persoane</label>
                        <input id="persa" type="number" name="persa" class="form-control" value="1" min="1" required/>
                    </div>
                    <br />
                    <div class="input-grp">
                        <asp:LinkButton type="submit" runat="server" class="btn btn-info flight" Style="width: 350px; font-weight: bold;" OnClick="Unnamed1_Click">Căutare atracții</asp:LinkButton>
                    </div>

                </div>
            </div>
            <div style="margin-left:50px"><img src="img/fundal_atractii.jpg" width="500"/></div> 
        </div>

    </section>
</asp:Content>
