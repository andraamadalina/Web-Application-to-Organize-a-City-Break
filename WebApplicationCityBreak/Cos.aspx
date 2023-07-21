<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Cos.aspx.cs" Inherits="WebApplicationCityBreak.Cos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div style="margin-left: 124px; margin-right: 124px; margin-top: 20px; margin-bottom: 30px; font-family: Light 300">
        <h1 style="color: #FF8800; font-weight: bold;">Coșul tău</h1>
        <hr />
        <br />

        <% if (!string.IsNullOrEmpty(Session["pretOferta"] as string))
            { %>
        <h3 style="color:#2C99A0">Oferta zbor Barcelona, Spania</h3>
        Pretul pentru oferta de zbor selectata:
    <asp:Label ID="pretOferta" runat="server" Text=""></asp:Label><br />

        <% } %>

        <% if (!string.IsNullOrEmpty(Session["pretOferta2"] as string))
            { %>
        <h3 style="color:#2C99A0">Oferta zbor Bruxelles, Belgia</h3>
        Pretul pentru oferta de zbor selectata:
    <asp:Label ID="pretOferta2" runat="server" Text=""></asp:Label><br />

        <% } %>

        <% if (!string.IsNullOrEmpty(Session["pretOferta3"] as string))
            { %>
        <h3 style="color:#2C99A0">Oferta zbor Roma, Italia</h3>
        Pretul pentru oferta de zbor selectata:
    <asp:Label ID="pretOferta3" runat="server" Text=""></asp:Label><br />

        <% } %>
        <% if (!string.IsNullOrEmpty(Session["pretOferta4"] as string))
            { %>
        <h3 style="color:#2C99A0">Oferta zbor München, Germania</h3>
        Pretul pentru oferta de zbor selectata:
    <asp:Label ID="pretOferta4" runat="server" Text=""></asp:Label><br />

        <% } %>



        <% if (!string.IsNullOrEmpty(lblSelectedPrice.Text))
            { %>
        <h3 style="color:#2C99A0">Zbor</h3>
        Pret selectat:
        <asp:Label ID="lblSelectedPrice" runat="server" Text=""></asp:Label><br />
        Aeroport plecare:
        <asp:Label ID="LabelPlecare" runat="server" Text=""></asp:Label><br />
        Aeroport sosire:
        <asp:Label ID="LabelSosire" runat="server" Text=""></asp:Label><br />
        Data plecare:
        <asp:Label ID="LabelData" runat="server" Text=""></asp:Label><br />
        <% } %>

        <script>
            window.addEventListener('DOMContentLoaded', function () {
                // Retrieve the flight details from session storage
                var selectedPrice = sessionStorage.getItem('selectedPrice');
                var plecare = sessionStorage.getItem('plecare');
                var sosire = sessionStorage.getItem('sosire');
                var data = sessionStorage.getItem('data');

                // Display the flight details on the page
                if (selectedPrice && plecare && sosire && data) {
                    document.getElementById('lblSelectedPrice').textContent = selectedPrice;
                    document.getElementById('LabelPlecare').textContent = plecare;
                    document.getElementById('LabelSosire').textContent = sosire;
                    document.getElementById('LabelData').textContent = data;

                    // Clear the stored values from session storage
                    sessionStorage.removeItem('selectedPrice');
                    sessionStorage.removeItem('plecare');
                    sessionStorage.removeItem('sosire');
                    sessionStorage.removeItem('data');
                }
            });
        </script>


        <br />
        <h3 id="hotelTitle" style="display: none; color:#2C99A0">Rezervare hotel</h3>

        <div id="hotelName" style="display: none;"></div>

        <h6 id="selectedPrices" style="display: none;">Prețurile camerelor selectate: </h6>
        <div id="selectedRooms" style="display: none;"></div>

        <h6 style="display: none;">Preț total hotel: </h6>
        <div id="totalPrice" style="display: none;"></div>

        <script>
            window.onload = function () {
                // Retrieve the hotel name from the URL
                const urlParams = new URLSearchParams(window.location.search);
                const encodedHotelName = urlParams.get('hotel');
                const hotelName = decodeURIComponent(encodedHotelName);

                // Check if the hotel name is already stored in sessionStorage
                const storedHotelName = sessionStorage.getItem('hotelName');

                // Display the hotel name on the page if available and not null
                if (hotelName && hotelName !== 'null') {
                    document.getElementById('hotelTitle').style.display = 'block';
                    document.getElementById('hotelName').textContent = hotelName;
                    document.getElementById('hotelName').style.display = 'block';
                    sessionStorage.setItem('hotelName', hotelName); // Storing the hotel name in sessionStorage
                } else if (storedHotelName && storedHotelName !== 'null') {
                    document.getElementById('hotelTitle').style.display = 'block';
                    document.getElementById('hotelName').textContent = storedHotelName;
                    document.getElementById('hotelName').style.display = 'block';
                } else {
                    document.getElementById('hotelTitle').style.display = 'none';
                    document.getElementById('hotelName').style.display = 'none';
                }


                var selectedPrices = [];
                var selectedRooms = [];
                var totalPrice = 0;

                var i = 1;

                while (sessionStorage.getItem('selectedPrice' + i)) {
                    var selectedPrice = parseFloat(sessionStorage.getItem('selectedPrice' + i));
                    var selectedRoom = sessionStorage.getItem('selectedRoom' + i);
                    var quantity = sessionStorage.getItem('quantity' + i);

                    if (!isNaN(selectedPrice) && selectedPrice > 0) {
                        selectedPrices.push(selectedPrice);
                        selectedRooms.push(quantity + 'x' + selectedRoom);
                        totalPrice += selectedPrice;
                    }

                    i++;
                }

                var selectedPricesElement = document.getElementById('selectedPrices');
                var selectedRoomsElement = document.getElementById('selectedRooms');

                if (selectedPrices.length > 0) {
                    for (var j = 0; j < selectedPrices.length; j++) {
                        var priceElement = document.createElement('div');
                        priceElement.innerHTML = 'Prețul camerei selectate ' + (j + 1) + ': ' + selectedPrices[j];
                        selectedPricesElement.appendChild(priceElement);

                        var roomElement = document.createElement('div');
                        roomElement.innerHTML = 'Camera selectată ' + (j + 1) + ': ' + selectedRooms[j];
                        selectedRoomsElement.appendChild(roomElement);
                    }

                    document.getElementById('selectedPrices').style.display = 'block';
                    document.getElementById('selectedRooms').style.display = 'block';
                    document.getElementById('totalPrice').style.display = 'block';

                    var totalPriceElement = document.getElementById('totalPrice');
                    totalPriceElement.innerHTML = 'Pret total hotel: ' + totalPrice;
                }
            };
        </script>





        <br />

        <!--<h3>Restaurant</h3>
        <div id="restaurantName"></div>
        <script>
            function displayRestaurantName() {
                const urlParams = new URLSearchParams(window.location.search);
                const encodedRestaurantName = urlParams.get('restaurant');
                const restaurantName = decodeURIComponent(encodedRestaurantName);
                const restaurantNameDiv = document.getElementById('restaurantName');
                restaurantNameDiv.textContent = restaurantName;
                const storedRestaurantName = sessionStorage.getItem('restaurantName');

                if (storedRestaurantName) {
                    restaurantNameDiv.textContent = storedRestaurantName;
                } else {
                    sessionStorage.setItem('restaurantName', restaurantName);
                    restaurantNameDiv.textContent = restaurantName;
                }
            }
            window.addEventListener('DOMContentLoaded', displayRestaurantName);
        </script>

        Data:
        <div id="restaurantData"></div>
        Ora:
        <div id="restaurantOra"></div>
        Persoane:
        <div id="restaurantPers"></div>

        <script>
            function displayRestaurantData() {
                const urlParams = new URLSearchParams(window.location.search);
                const encodedRestaurantData = urlParams.get('data');
                const restaurantData = decodeURIComponent(encodedRestaurantData);
                const restaurantDataSpan = document.getElementById('restaurantData');
                restaurantDataSpan.textContent = restaurantData;
                const storedRestaurantData = sessionStorage.getItem('restaurantData');
                if (storedRestaurantData) {
                    restaurantDataSpan.textContent = storedRestaurantData;
                } else {
                    sessionStorage.setItem('restaurantData', restaurantData);
                    restaurantDataSpan.textContent = restaurantData;
                }
            }
            window.addEventListener('DOMContentLoaded', displayRestaurantData);

            function displayRestaurantOra() {
                const urlParams = new URLSearchParams(window.location.search);
                const encodedRestaurantOra = urlParams.get('ora');
                const restaurantOra = decodeURIComponent(encodedRestaurantOra);
                const restaurantOraSpan = document.getElementById('restaurantOra');
                restaurantOraSpan.textContent = restaurantOra;
                const storedRestaurantOra = sessionStorage.getItem('restaurantOra');
                if (storedRestaurantOra) {
                    restaurantOraSpan.textContent = storedRestaurantOra;
                } else {
                    sessionStorage.setItem('restaurantOra', restaurantOra);
                    restaurantOraSpan.textContent = restaurantOra;
                }
            }
            window.addEventListener('DOMContentLoaded', displayRestaurantOra);

            function displayRestaurantPers() {
                const urlParams = new URLSearchParams(window.location.search);
                const encodedRestaurantPers = urlParams.get('pers');
                const restaurantPers = decodeURIComponent(encodedRestaurantPers);
                const restaurantPersSpan = document.getElementById('restaurantPers');
                restaurantPersSpan.textContent = restaurantPers;
                const storedRestaurantPers = sessionStorage.getItem('restaurantPers');
                if (storedRestaurantPers) {
                    restaurantPersSpan.textContent = storedRestaurantPers;
                } else {
                    sessionStorage.setItem('restaurantPers', restaurantPers);
                    restaurantPersSpan.textContent = restaurantPers;
                }
            }
            window.addEventListener('DOMContentLoaded', displayRestaurantPers);
        </script>


        <h3>Atractie</h3>
        <div id="atractieName"></div>
        <script>
            function displayAtractieName() {
                // Get the value of the "hotel" query parameter from the URL
                const urlParams = new URLSearchParams(window.location.search);
                const encodedAtractieName = urlParams.get('atractie');

                // Decode the hotel name to handle URL encoding
                const atractieName = decodeURIComponent(encodedAtractieName);

                // Display the hotel name in the <div> element
                const atractieNameDiv = document.getElementById('atractieName');

                atractieNameDiv.textContent = atractieName;

                const storedAtractieName = sessionStorage.getItem('atractieName');

                if (storedAtractieName) {
                    // If the hotel name is already stored, display it
                    atractieNameDiv.textContent = storedAtractieName;
                } else {
                    // If the hotel name is not stored, store it in sessionStorage and display it
                    sessionStorage.setItem('atractieName', atractieName);
                    atractieNameDiv.textContent = atractieName;
                }
            }
            window.addEventListener('DOMContentLoaded', displayAtractieName);
        </script>
        Data:
        <div id="atractieData"></div>
        Ora:
        <div id="atractieOra"></div>
        Persoane:
        <div id="atractiePers"></div>

        <script>
            function displayAtractieData() {
                const urlParams = new URLSearchParams(window.location.search);
                const encodedAtractieData = urlParams.get('dataa');
                const atractieData = decodeURIComponent(encodedAtractieData);
                //const dataValue = urlParams.get('data');
                const atractieDataSpan = document.getElementById('atractieData');
                atractieDataSpan.textContent = atractieData;
                const storedAtractieData = sessionStorage.getItem('atractieData');
                if (storedAtractieData) {
                    // If the hotel name is already stored, display it
                    atractieDataSpan.textContent = storedAtractieData;
                } else {
                    // If the hotel name is not stored, store it in sessionStorage and display it
                    sessionStorage.setItem('atractieData', atractieData);
                    atractieDataSpan.textContent = atractieData;
                }
            }
            window.addEventListener('DOMContentLoaded', displayAtractieData);

            function displayAtractieOra() {
                const urlParams = new URLSearchParams(window.location.search);
                const encodedAtractieOra = urlParams.get('oraa');
                const atractieOra = decodeURIComponent(encodedAtractieOra);
                //const dataValue = urlParams.get('data');
                const atractieOraSpan = document.getElementById('atractieOra');
                atractieOraSpan.textContent = atractieOra;
                const storedAtractieOra = sessionStorage.getItem('atractieOra');
                if (storedAtractieOra) {
                    // If the hotel name is already stored, display it
                    atractieOraSpan.textContent = storedAtractieOra;
                } else {
                    // If the hotel name is not stored, store it in sessionStorage and display it
                    sessionStorage.setItem('atractieOra', atractieOra);
                    atractieOraSpan.textContent = atractieOra;
                }
            }
            window.addEventListener('DOMContentLoaded', displayAtractieOra);

            function displayAtractiePers() {
                const urlParams = new URLSearchParams(window.location.search);
                const encodedAtractiePers = urlParams.get('persa');
                const atractiePers = decodeURIComponent(encodedAtractiePers);
                //const dataValue = urlParams.get('data');
                const atractiePersSpan = document.getElementById('atractiePers');
                atractiePersSpan.textContent = atractiePers;
                const storedAtractiePers = sessionStorage.getItem('atractiePers');
                if (storedAtractiePers) {
                    // If the hotel name is already stored, display it
                    atractiePersSpan.textContent = storedAtractiePers;
                } else {
                    // If the hotel name is not stored, store it in sessionStorage and display it
                    sessionStorage.setItem('atractiePers', atractiePers);
                    atractiePersSpan.textContent = atractiePers;
                }
            }
            window.addEventListener('DOMContentLoaded', displayAtractiePers);
        </script>-->


        <br />
        <link href="css_pages/StyleSheetPopup.css" rel="stylesheet" />
        <button id="payButton" class="open-button" onclick="openForm()" style="display: block; width: 100%; border: none; background-color: #FF8800; color: white; padding: 14px 28px; cursor: pointer; text-align: center; font-size: 20px;">Plătiți</button>

        <div class="form-popup" id="myForm" style="display: none;">
            <div class="form-container">
                <div class="needs-validation">
                    <h1>Detalii Plată</h1>

                    <div class="form-group">
                        <label for="cardHolder">Nume titular</label>
                        <input type="text" class="form-control" id="cardHolder" placeholder="Introduceți numele titularului" required>
                    </div>

                    <div class="form-group">
                        <label for="cardNumber">Număr Card</label>
                        <input type="text" class="form-control" id="cardNumber" placeholder="Introduceți numărul cardului" required>
                    </div>

                    <div class="form-group">
                        <label for="cardExpiry">Dată Expirare Card</label>
                        <input type="text" class="form-control" id="cardExpiry" placeholder="MM/YY" required>
                    </div>

                    <div class="form-group">
                        <label for="cardCVC">CVV</label>
                        <input type="text" class="form-control" id="cardCVC" placeholder="CVV" required>
                    </div>

                    <button type="submit" class="btn btn-primary">Plătiți acum</button>
                    <button type="button" class="btn btn-secondary" onclick="closeForm()" style="background-color: red">Închide</button>
                </div>
            </div>
        </div>

        <script>
            function openForm() {
                document.getElementById("myForm").style.display = "block";
            }

            function closeForm() {
                document.getElementById("myForm").style.display = "none";
            }

        </script>


        <hr />
        <a href="Destinatie.aspx"><< Continuați rezervările</a>
    </div>



</asp:Content>
