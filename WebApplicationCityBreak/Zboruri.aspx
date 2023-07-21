<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Zboruri.aspx.cs" Inherits="WebApplicationCityBreak.Zboruri" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="css_pages/StyleSheetZboruri.css" rel="stylesheet" />

    <section>
        <br />
        <div class="flex-container">
            <div class="booking-form-box">
                <div class="booking-form">
                    <label>Plecare</label>
                    <select name="tarap" id="tarap" class="form-control">
                        <option>Selectează orașul de plecare</option> 
                        <optgroup label="Austria">
                            <option>Viena (VIE)</option>
                            <option>Salzburg (SZG)</option>
                            <option>Graz (GRZ)</option>
                            <option>Linz (LNZ)</option>
                            <option>Klangenfurt (KLU)</option>
                            <option>Innsbruck (INN)</option>
                        </optgroup>
                        <optgroup label="Belgia">
                            <option>Bruxelles (BRU)</option>
                            <option>Chareloi (CRL)</option>
                            <option>Oostende (OST)</option>
                        </optgroup>
                        <optgroup label="Bulgaria">
                            <option>Sofia (SOF)</option>
                            <option>Burgas (BOJ)</option>
                            <option>Varna (VAR)</option>
                            <option>Plovdiv (PDV)</option>
                        </optgroup>
                        <optgroup label="Croația">
                            <option>Zagreb (ZAG)</option>
                            <option>Dubrovnik (DBV)</option>
                            <option>Split (SPU)</option>
                            <option>Zadar (ZAD)</option>
                            <option>Pula (PUY)</option>
                        </optgroup>
                        <optgroup label="Cipru">
                            <option>Larnaca (LCA)</option>
                            <option>Paphos (PFO)</option>
                        </optgroup>
                        <optgroup label="Cehia">
                            <option>Praga (PRG)</option>
                            <option>Brno-Tuřany (BRQ)</option>
                            <option>Ostrava (OSR)</option>
                            <option>Karlovy Vary (KLV)</option>
                        </optgroup>
                        <optgroup label="Danemarca">
                            <option>Copenhaga (CPH)</option>
                            <option>Billund (BLL)</option>
                            <option>Aalborg (AAL)</option>
                        </optgroup>
                        <optgroup label="Estonia">
                            <option>Tallinn (TLL)</option>
                        </optgroup>
                        <optgroup label="Finlanda">
                            <option>Helsinki (HEL)</option>
                        </optgroup>
                        <optgroup label="Franța">
                            <option>Paris (CDG)</option>
                            <option>Paris (ORY)</option>
                            <option>Lyon (LYS)</option>
                            <option>Marsilia (MRS)</option>
                            <option>Toulouse (TLS)</option>
                            <option>Bordeaux (BOD)</option>
                            <option>Nantes (NTE)</option>
                            <option>Strasbourg (SXB)</option>
                            <option>Montpellier (MPL)</option>
                        </optgroup>
                        <optgroup label="Germania">
                            <option>Frankfurt (FRA)</option>
                            <option>München (MUC)</option>
                            <option>Berlin (BER)</option>
                            <option>Düsseldorf (DUS)</option>
                            <option>Hamburg (HAM)</option>
                            <option>Stuttgart (STR)</option>
                            <option>Köln (CGN)</option>
                            <option>Hannover (HAJ)</option>
                            <option>Nürnberg (NUE)</option>
                            <option>Leipzig (LEJ)</option>
                        </optgroup>
                        <optgroup label="Grecia">
                            <option>Atena (ATH)</option>
                            <option>Salonic (SKG)</option>
                            <option>Heraklion (HER)</option>
                            <option>Rhodos (RHO)</option>
                            <option>Corfu (CFU)</option>
                            <option>Santorini (JTR)</option>
                            <option>Mykonos (JMK)</option>
                            <option>Zakynthos (ZTH)</option>
                        </optgroup>
                        <optgroup label="Ungaria">
                            <option>Budapesta (BUD)</option>
                            <option>Debrecen (DEB)</option>
                            <option>Sármellék (SOB)</option>
                        </optgroup>
                        <optgroup label="Irlanda">
                            <option>Dublin (DUB)</option>
                            <option>Shannon (SNN)</option>
                            <option>Cork (ORK)</option>
                            <option>Belfast (BHD)</option>
                        </optgroup>
                        <optgroup label="Italia">
                            <option>Roma (FCO)</option>
                            <option>Milano (MXP)</option>
                            <option>Venetia (VCE)</option>
                            <option>Napoli (NAP)</option>
                            <option>Palermo (PMO)</option>
                            <option>Bologna (BLQ)</option>
                            <option>Catania (CTA)</option>
                        </optgroup>
                        <optgroup label="Letonia">
                            <option>Riga (RIX)</option>
                            <option>Liepāja (LPX)</option>
                        </optgroup>
                        <optgroup label="Lituania">
                            <option>Vilnius (VNO)</option>
                            <option>Kaunas (KUN)</option>
                        </optgroup>
                        <optgroup label="Malta">
                            <option>Luqa (MLA)</option>
                        </optgroup>
                        <optgroup label="Olanda">
                            <option>Amsterdam (AMS)</option>
                            <option>Rotterdam (RTM)</option>
                            <option>Eindhoven (EIN)</option>
                        </optgroup>
                        <optgroup label="Polonia">
                            <option>Varsovia (WAW)</option>
                            <option>Cracovia (KRK)</option>
                            <option>Katowice (KTW)</option>
                            <option>Gdańsk (GDN)</option>
                            <option>Wrocław (WRO)</option>
                        </optgroup>
                        <optgroup label="Portugalia">
                            <option>Funchal (FNC)</option>
                            <option>Porto (OPO)</option>
                            <option>Lisabona (LIS)</option>
                            <option>Ponta Delgada (PDL)</option>
                            <option>Beja (BYJ)</option>
                        </optgroup>
                        <optgroup label="România">
                            <option>Bucuresti (OTP)</option>
                            <option>Cluj-Napoca (CLJ)</option>
                            <option>Cluj-Napoca (CJU)</option>
                            <option>Timisoara (TSR)</option>
                            <option>Iasi (IAS)</option>
                            <option>Constanta (CND)</option>
                            <option>Sibiu (SBZ)</option>
                            <option>Targu Mures (TGM)</option>
                            <option>Craiova (CRA)</option>
                        </optgroup>
                        <optgroup label="Slovacia">
                            <option>Bratislava (BTS)</option>
                            <option>Košice (KSC)</option>
                        </optgroup>
                        <optgroup label="Slovenia">
                            <option>Ljubljana (LJU)</option>
                        </optgroup>
                        <optgroup label="Slovenia">
                            <option>Madrid (MAD)</option>
                            <option>Barcelona (BCN)</option>
                            <option>Palma de Mallorca (PMI)</option>
                            <option>Málaga (AGP)</option>
                            <option>Alicante (ALC)</option>
                            <option>Valencia (VLC)</option>
                            <option>Ibiza (IBZ)</option>
                            <option>Tenerife (TFS)</option>
                            <option>Gran Canaria (LPA)</option>
                            <option>Bilbao (BIO)</option>
                        </optgroup>
                        <optgroup label="Suedia">
                            <option>Stockholm (ARN)</option>
                            <option>Göteborg (BCN)</option>
                            <option>Nyköping (NYO)</option>
                            <option>Stockholm (BMA)</option>
                            <option>Malmö (MMX)</option>
                            <option>Umeå (UME)</option>
                            <option>Luleå (LLA)</option>
                            <option>Östersund (OSD)</option>
                            <option>Växjö (VXO)</option>
                            <option>Sundsvall (SDL)</option>
                        </optgroup>
                    </select>

                    <label>Destinație</label>
                    <select name="tarad" id="tarad" class="form-control">
                        <option>Selectează orașul destinație</option> 
                        <optgroup label="Austria">
                            <option>Viena (VIE)</option>
                            <option>Salzburg (SZG)</option>
                            <option>Graz (GRZ)</option>
                            <option>Linz (LNZ)</option>
                            <option>Klangenfurt (KLU)</option>
                            <option>Innsbruck (INN)</option>
                        </optgroup>
                        <optgroup label="Belgia">
                            <option>Bruxelles (BRU)</option>
                            <option>Chareloi (CRL)</option>
                            <option>Oostende (OST)</option>
                        </optgroup>
                        <optgroup label="Bulgaria">
                            <option>Sofia (SOF)</option>
                            <option>Burgas (BOJ)</option>
                            <option>Varna (VAR)</option>
                            <option>Plovdiv (PDV)</option>
                        </optgroup>
                        <optgroup label="Croația">
                            <option>Zagreb (ZAG)</option>
                            <option>Dubrovnik (DBV)</option>
                            <option>Split (SPU)</option>
                            <option>Zadar (ZAD)</option>
                            <option>Pula (PUY)</option>
                        </optgroup>
                        <optgroup label="Cipru">
                            <option>Larnaca (LCA)</option>
                            <option>Paphos (PFO)</option>
                        </optgroup>
                        <optgroup label="Cehia">
                            <option>Praga (PRG)</option>
                            <option>Brno-Tuřany (BRQ)</option>
                            <option>Ostrava (OSR)</option>
                            <option>Karlovy Vary (KLV)</option>
                        </optgroup>
                        <optgroup label="Danemarca">
                            <option>Copenhaga (CPH)</option>
                            <option>Billund (BLL)</option>
                            <option>Aalborg (AAL)</option>
                        </optgroup>
                        <optgroup label="Estonia">
                            <option>Tallinn (TLL)</option>
                        </optgroup>
                        <optgroup label="Finlanda">
                            <option>Helsinki (HEL)</option>
                        </optgroup>
                        <optgroup label="Franța">
                            <option>Paris (CDG)</option>
                            <option>Paris (ORY)</option>
                            <option>Lyon (LYS)</option>
                            <option>Marsilia (MRS)</option>
                            <option>Toulouse (TLS)</option>
                            <option>Bordeaux (BOD)</option>
                            <option>Nantes (NTE)</option>
                            <option>Strasbourg (SXB)</option>
                            <option>Montpellier (MPL)</option>
                        </optgroup>
                        <optgroup label="Germania">
                            <option>Frankfurt (FRA)</option>
                            <option>München (MUC)</option>
                            <option>Berlin (BER)</option>
                            <option>Düsseldorf (DUS)</option>
                            <option>Hamburg (HAM)</option>
                            <option>Stuttgart (STR)</option>
                            <option>Köln (CGN)</option>
                            <option>Hannover (HAJ)</option>
                            <option>Nürnberg (NUE)</option>
                            <option>Leipzig (LEJ)</option>
                        </optgroup>
                        <optgroup label="Grecia">
                            <option>Atena (ATH)</option>
                            <option>Salonic (SKG)</option>
                            <option>Heraklion (HER)</option>
                            <option>Rhodos (RHO)</option>
                            <option>Corfu (CFU)</option>
                            <option>Santorini (JTR)</option>
                            <option>Mykonos (JMK)</option>
                            <option>Zakynthos (ZTH)</option>
                        </optgroup>
                        <optgroup label="Ungaria">
                            <option>Budapesta (BUD)</option>
                            <option>Debrecen (DEB)</option>
                            <option>Sármellék (SOB)</option>
                        </optgroup>
                        <optgroup label="Irlanda">
                            <option>Dublin (DUB)</option>
                            <option>Shannon (SNN)</option>
                            <option>Cork (ORK)</option>
                            <option>Belfast (BHD)</option>
                        </optgroup>
                        <optgroup label="Italia">
                            <option>Roma (FCO)</option>
                            <option>Milano (MXP)</option>
                            <option>Venetia (VCE)</option>
                            <option>Napoli (NAP)</option>
                            <option>Palermo (PMO)</option>
                            <option>Bologna (BLQ)</option>
                            <option>Catania (CTA)</option>
                        </optgroup>
                        <optgroup label="Letonia">
                            <option>Riga (RIX)</option>
                            <option>Liepāja (LPX)</option>
                        </optgroup>
                        <optgroup label="Lituania">
                            <option>Vilnius (VNO)</option>
                            <option>Kaunas (KUN)</option>
                        </optgroup>
                        <optgroup label="Malta">
                            <option>Luqa (MLA)</option>
                        </optgroup>
                        <optgroup label="Olanda">
                            <option>Amsterdam (AMS)</option>
                            <option>Rotterdam (RTM)</option>
                            <option>Eindhoven (EIN)</option>
                        </optgroup>
                        <optgroup label="Polonia">
                            <option>Varsovia (WAW)</option>
                            <option>Cracovia (KRK)</option>
                            <option>Katowice (KTW)</option>
                            <option>Gdańsk (GDN)</option>
                            <option>Wrocław (WRO)</option>
                        </optgroup>
                        <optgroup label="Portugalia">
                            <option>Funchal (FNC)</option>
                            <option>Porto (OPO)</option>
                            <option>Lisabona (LIS)</option>
                            <option>Ponta Delgada (PDL)</option>
                            <option>Beja (BYJ)</option>
                        </optgroup>
                        <optgroup label="România">
                            <option>Bucuresti (OTP)</option>
                            <option>Cluj-Napoca (CLJ)</option>
                            <option>Cluj-Napoca (CJU)</option>
                            <option>Timisoara (TSR)</option>
                            <option>Iasi (IAS)</option>
                            <option>Constanta (CND)</option>
                            <option>Sibiu (SBZ)</option>
                            <option>Targu Mures (TGM)</option>
                            <option>Craiova (CRA)</option>
                        </optgroup>
                        <optgroup label="Slovacia">
                            <option>Bratislava (BTS)</option>
                            <option>Košice (KSC)</option>
                        </optgroup>
                        <optgroup label="Slovenia">
                            <option>Ljubljana (LJU)</option>
                        </optgroup>
                        <optgroup label="Slovenia">
                            <option>Madrid (MAD)</option>
                            <option>Barcelona (BCN)</option>
                            <option>Palma de Mallorca (PMI)</option>
                            <option>Málaga (AGP)</option>
                            <option>Alicante (ALC)</option>
                            <option>Valencia (VLC)</option>
                            <option>Ibiza (IBZ)</option>
                            <option>Tenerife (TFS)</option>
                            <option>Gran Canaria (LPA)</option>
                            <option>Bilbao (BIO)</option>
                        </optgroup>
                        <optgroup label="Suedia">
                            <option>Stockholm (ARN)</option>
                            <option>Göteborg (BCN)</option>
                            <option>Nyköping (NYO)</option>
                            <option>Stockholm (BMA)</option>
                            <option>Malmö (MMX)</option>
                            <option>Umeå (UME)</option>
                            <option>Luleå (LLA)</option>
                            <option>Östersund (OSD)</option>
                            <option>Växjö (VXO)</option>
                            <option>Sundsvall (SDL)</option>
                        </optgroup>
                    </select>
                    
                    <div class="input-grp">
                        <label>Plecare</label>
                        <input type="date" id="datap" name="datap" class="form-control custom-select-date"/>
                    </div>

                    <div class="input-grp">
                        <label>Adulți</label>
                        <input type="number" id="nradulti" name="nradulti" class="form-control" value="1"/>
                    </div>
                    <div class="input-grp">
                        <label>Copii</label>
                        <input type="number" id="nrcopii" name="nrcopii" class="form-control" value="0"/>
                    </div>

                    <div class="input-grp">
                        <label>Clasa</label>
                        <select class="custom-select" id="clasaz" name="clasaz">
                            <option>Economică</option>
                            <option>Business</option>
                            <option>Clasa I</option>
                        </select>
                    </div>
                    <div class="input-grp">
                        <br />
                        <asp:LinkButton type="submit" runat="server" class="btn btn-info flight" Style="width: 350px; font-weight: bold;" OnClick="Unnamed1_Click">Căutare zboruri</asp:LinkButton>
                    </div>

                </div>
            </div>
            <div><img src="img/fundal_zboruri.png" width="775"/></div> 
            
            
            
        </div>
        <br />
    </section>


</asp:Content>
