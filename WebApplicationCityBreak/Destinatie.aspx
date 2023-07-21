<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Destinatie.aspx.cs" Inherits="WebApplicationCityBreak.Destinatie" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="css_pages/StyleSheetDestinatie.css" rel="stylesheet" />
      <section>
        <h1><b>EXPLOREAZĂ <span id="myPlace">  </span></b></h1>
        <script>
            document.getElementById('myPlace').textContent = localStorage.getItem('myPlace');
            //var location = localStorage.getItem('myPlace');
        </script>

        <div class="flex-container">
            <div>
                <asp:LinkButton class="btn btn-outline-info" ID="LinkButton6" runat="server" Style="font-size: 25px; border-radius: 10px; border: solid;" OnClick="LinkButton6_Click"> Hoteluri &emsp;<i class="fa-solid fa-bed"></i> </asp:LinkButton>
            </div>
            <div>
                <asp:LinkButton class="btn btn-outline-info" ID="LinkButton1" runat="server" Style="font-size: 25px; border-radius: 10px; border: solid;" OnClick="LinkButton1_Click"> Zboruri &emsp;<i class="fa-sharp fa-solid fa-plane-departure"></i> </asp:LinkButton>
            </div>
            <div>
                <asp:LinkButton class="btn btn-outline-info" ID="LinkButton2" runat="server" Style="font-size: 25px; border-radius: 10px; border: solid;" OnClick="LinkButton2_Click"> Restaurante &nbsp;<i class="fa-solid fa-utensils"></i> </asp:LinkButton>
            </div>
            <div>
                <asp:LinkButton class="btn btn-outline-info" ID="LinkButton3" runat="server" Style="font-size: 25px; border-radius: 10px; border: solid;" OnClick="LinkButton3_Click"> Atracții &emsp;<i class="fa-solid fa-ticket"></i> </asp:LinkButton>
            </div>
        </div>

        <!-- HARTA ORAS/TARA API -->
          <br>
          <div id="googleMap" style="width: auto; height: 362px; margin-right: 100px"></div>
          <br>

          <script>
              function initMap() {
                  var mapProp = {
                      zoom: 6,
                      center: new google.maps.LatLng(51.508742, -0.120850),
                      mapTypeId: google.maps.MapTypeId.ROADMAP
                  };
                  var map = new google.maps.Map(document.getElementById("googleMap"), mapProp);

                  var placeName = localStorage.getItem("myPlace");
                  var geocoder = new google.maps.Geocoder();

                  geocoder.geocode({ address: placeName }, function (results, status) {
                      if (status === google.maps.GeocoderStatus.OK) {
                          map.setCenter(results[0].geometry.location);

                          var marker = new google.maps.Marker({
                              map: map,
                              position: results[0].geometry.location
                          });
                      } else {
                          alert("Geocode was not successful for the following reason: " + status);
                      }
                  });
              }
          </script>

          <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBc6ussvjWGa-rtQrCZjtaqX3LP98vsADU&callback=initMap" async defer"></script>

        <!--<h4>Cazare</h4>
            + API-->

        <!--<h4>Mancare</h4>
            + API-->

        <!--<h4>De facut</h4>
            + API-->

    </section>


</asp:Content>
