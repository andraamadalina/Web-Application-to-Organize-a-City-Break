<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="CautareHoteluri.aspx.cs" Inherits="WebApplicationCityBreak.CautareHoteluri" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section style="font-family: Light 300;">
        <script
            src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBc6ussvjWGa-rtQrCZjtaqX3LP98vsADU&callback=initMap&libraries=places"
            async
            defer></script>
        <script>
            function initMap() {
                // preluarea locatiei din localStorage
                var location = localStorage.getItem('myPlace');

                // construirea unei harti centrate dupa locatie
                var map = new google.maps.Map(document.getElementById('map'), {
                    mapTypeId: google.maps.MapTypeId.ROADMAP,
                    zoom: 10
                });

                // obiect care converteste locatia in lat si long
                var geocoder = new google.maps.Geocoder();

                // convertire locatie in lat si long si centrarea hartii
                geocoder.geocode({ address: location }, function (results, status) {
                    if (status === 'OK') {
                        map.setCenter(results[0].geometry.location);

                        //crearea unui PlacesService pentru a trimite request-uri de search
                        var service = new google.maps.places.PlacesService(map);

                        //crearea unui obiect InfoWindow care afiseaza informatia despre rezultatul unui search
                        var infowindow = new google.maps.InfoWindow();

                        //constrcutia unui request de search pentru hotelurile din locatia precizata
                        var request = {
                            query: 'hotels in ' + location,
                            type: 'lodging',
                            fields: ['name', 'formatted_address', 'geometry', 'rating', 'photos', 'reviews'],
                        };

                        //trimiterea unui search request la obiectul PlacesService 
                        service.textSearch(request, callback);

                        //definirea unei functii callback pentru procesarea rezultatelor
                        function callback(results, status) {
                            if (status === google.maps.places.PlacesServiceStatus.OK) {
                                //afisarea rezultatelor de hoteluri pe harta
                                for (var i = 0; i < results.length; i++) {
                                    createMarker(results[i], map, infowindow);
                                }

                                displayResults(results);
                            } else {
                                document.getElementById('results').innerHTML =
                                    'Căutarea a eșuat cu eroarea: ' + status;
                            }
                        }
                    } else {
                        document.getElementById('results').innerHTML =
                            'Locația nu a putut fi găsit din cauza erorii: ' + status;
                    }
                });
            }

            function createMarker(place, map, infowindow) {
                var marker = new google.maps.Marker({
                    map: map,
                    position: place.geometry.location,
                });

                google.maps.event.addListener(marker, 'click', function () {
                    /*infowindow.setContent(place.name);
                    infowindow.open(map, this);*/

                    var content = '<h3>' + place.name + '</h3>';
                    content += '<p>' + place.formatted_address + '</p>';
                    content += '<p>Evaluările oaspeților: ' + place.rating + '</p>';

                    if (place.photos && place.photos.length > 0) {
                        /*content += '<div><h4>Photos:</h4><ul>';*/
                        for (var i = 0; i < Math.min(place.photos.length, 5); i++) {
                            content += '<img src="' + place.photos[i].getUrl({ maxWidth: 500, maxHeight: 500 }) + '">';
                        }
                        content += '</ul></div>';
                    }

                    if (place.reviews && place.reviews.length > 0) {
                        content += '<div><h4>Părerea oaspeților:</h4><ul>';
                        for (var i = 0; i < Math.min(place.reviews.length, 3); i++) {
                            content += '<li>' + place.reviews[i].text + '</li>';
                        }
                        content += '</ul></div>';
                    }

                    infowindow.setContent(content);
                    infowindow.open(map, this);
                });
            }


            function displayResults(results) {
                var resultsList = document.createElement('ul');
                resultsList.setAttribute('id', 'resultsList');

                var hotelNames = [];
                for (var i = 0; i < results.length; i++) {
                    var resultItem = document.createElement('li');
                    resultItem.innerHTML = '<h3>' + results[i].name + '</h3>';
                    ////////////////////
                    hotelNames.push(results[i].name);
                    //////////////////

                    resultItem.innerHTML += '<p><i class="fa-sharp fa-solid fa-location-dot" style="color: #dd2c2c;"></i> ' + results[i].formatted_address + '</p>';

                    //afisare poze
                    if (results[i].photos && results[i].photos.length > 0) {
                        for (var j = 0; j < Math.min(results[i].photos.length, 5); j++) {
                            resultItem.innerHTML += '<img src="' + results[i].photos[j].getUrl({ maxWidth: 500, maxHeight: 500 }) + '">';
                            resultItem.innerHTML += '<br>';
                        }
                        resultItem.innerHTML += '</ul></div>';
                        resultItem.innerHTML += '<br>';
                    }

                    resultItem.innerHTML += '<p><b>Evaluările oaspeților:</b> ' + results[i].rating + '<i class="fa-solid fa-star" style="color: #ffa200;"></i></p>';

                    //afisare review uri
                    if (results[i].reviews && results[i].reviews.length > 0) {
                        resultItem.innerHTML += '<div><p>Părerea oaspeților:</p><ul>';
                        for (var j = 0; j < results[i].reviews.length; j++) {
                            resultItem.innerHTML += '<li>' + results[i].reviews[j].text + '</li>';
                        }
                        resultItem.innerHTML += '</ul></div>';
                    } else {
                        resultItem.innerHTML += '<div><p><b>Părerea oaspeților:</b> Nu există nicio părere.</p></div>';
                    }

                    // prezentare preturi
                    function getRandomInt(min, max) {
                        return Math.floor(Math.random() * (max - min + 1)) + min;
                    }
                    var singlePrice = getRandomInt(100, 400);
                    var doublePrice = singlePrice + 50;
                    var twinPrice = singlePrice + 30;
                    var triplePrice = doublePrice + 50;
                    var apartmentPrice = triplePrice + 50;

                    resultItem.innerHTML += '<p><b>Listă de prețuri:</b></p>';
                    resultItem.innerHTML += singlePrice + ' lei/ noapte Cameră Single <br>';
                    resultItem.innerHTML += doublePrice + ' lei/ noapte Cameră Dublă <br>';
                    resultItem.innerHTML += twinPrice + ' lei/ noapte Cameră Twin <br>';
                    resultItem.innerHTML += triplePrice + ' lei/ noapte Cameră Triplă <br>';
                    resultItem.innerHTML += apartmentPrice + ' lei/ noapte Apartament <br>';
                    resultItem.innerHTML += '<br>';

                    // alegere camera
                    resultItem.innerHTML += '<p><b>Alegeți camere:</b></p> <div id="camere" style="display: inline-block"><div><select id="cam" name="cam" style="height: 28px;"><option>Cameră Single (1 persoană)</option><option>Cameră Dublă (2 persoane)</option><option>Cameră Twin (2 persoane)</option><option>Cameră Triplă (3 persoane)</option><option>Apartament (4 persoane)</option></select><input type="number" name="nr" value="0" min="0" max="5"></div></div><button type="button" onclick="addCam()">+</button><br>';
                    //resultItem.innerHTML += '<br><div><button type="button" style="background:#FF8800; border-color:#FF8800;color: white; border-radius: 5px; border-style: none; font-size: 20px;" >Rezervați acum</button></div>';
                    //resultItem.innerHTML += '<br><div><asp:Button class="btn btn-primary" ID="Button1" runat="server" Text="Rezervați acum" OnClick="Button1_Click" style="background:#FF8800; border-color:#FF8800;color: white; border-radius: 5px; border-style: none; font-size: 20px;"/></div>';

                    //resultItem.innerHTML += '<br><div><a href="Cos.aspx?hotel=' + encodeURIComponent(results[i].name) + '" style="padding: 10px;background:#FF8800; border-color:#FF8800;color: white; border-radius: 5px; border-style: none; font-size: 20px;">Rezervati acum</a></div>';

                    ///////////////////////////////////////////////////////////
                    var url = 'Cos.aspx?hotel=' + encodeURIComponent(results[i].name) +
                        '&singlePrice=' + singlePrice +
                        '&doublePrice=' + doublePrice +
                        '&twinPrice=' + twinPrice +
                        '&triplePrice=' + triplePrice +
                        '&apartmentPrice=' + apartmentPrice;

                    resultItem.innerHTML += '<br><div><a href="' + url + '" onclick="transmitPrice(' + singlePrice + ', ' + doublePrice + ', ' + twinPrice + ', ' + triplePrice + ', ' + apartmentPrice + ')" style="padding: 10px;background:#FF8800; border-color:#FF8800;color: white; border-radius: 5px; border-style: none; font-size: 20px;">Rezervați acum</a></div>';


                    ///////////////////////////////////////////////////////////

                    resultItem.innerHTML += '<hr>';

                    resultsList.appendChild(resultItem);
                }

                
                document.getElementById('results').appendChild(resultsList);
            }
            function transmitPrice(singlePrice, doublePrice, twinPrice, triplePrice, apartmentPrice) {
                var selectElements = document.getElementsByName("cam");

                for (var i = 0; i < selectElements.length; i++) {
                    var selectElement = selectElements[i];
                    var roomSelect = selectElement.value;
                    var price;
                    var quantity = selectElement.nextElementSibling.value;

                    if (roomSelect === 'Cameră Single (1 persoană)') {
                        price = singlePrice;
                    } else if (roomSelect === 'Cameră Dublă (2 persoane)') {
                        price = doublePrice;
                    } else if (roomSelect === 'Cameră Twin (2 persoane)') {
                        price = twinPrice;
                    } else if (roomSelect === 'Cameră Triplă (3 persoane)') {
                        price = triplePrice;
                    } else if (roomSelect === 'Apartament (4 persoane)') {
                        price = apartmentPrice;
                    }

                    var totalPrice = price * quantity;

                    // Store the selected price and room in sessionStorage
                    sessionStorage.setItem('selectedRoom' + (i + 1), roomSelect);
                    sessionStorage.setItem('selectedPrice' + (i + 1), totalPrice);
                    sessionStorage.setItem('quantity' + (i + 1), quantity);
                }

                // Navigate to the Cos.aspx page
                window.location.href = 'Cos.aspx';
            }


            
            function addCam() {
                var div = document.createElement("div");
                var select = document.createElement("select");
                select.name = "cam";
                select.style.height = "28px";
                var options = ["Cameră Single (1 persoană)", "Cameră Dublă (2 persoane)", "Cameră Twin (2 persoane)", "Cameră Triplă (3 persoane)", "Apartament (4 persoane)"];
                for (var i = 0; i < options.length; i++) {
                    var option = document.createElement("option");
                    option.text = options[i];
                    select.add(option);
                }
                var input = document.createElement("input");
                input.type = "number";
                input.name = "nr";
                input.value = "0";
                input.min = "1";
                input.max = "5";
                var deleteButton = document.createElement("button");
                deleteButton.innerHTML = "-";
                deleteButton.onclick = function () {
                    div.remove();
                };
                div.appendChild(select);
                div.appendChild(input);
                div.appendChild(deleteButton);
                document.getElementById("camere").appendChild(div);
            }


        </script>


        <div onload="initMap()" style="margin-left: 124px; margin-right: 124px; font-family: Light 300;">
            <h1 style="color: #FF8800; margin-bottom: 20px; margin-top: 20px;">Rezultatele căutării pentru perioada <span style="color: black;"><%= Request.QueryString["checkinDate"] %> - <%= Request.QueryString["checkoutDate"] %></span></h1>
            <div id="map" style="height: 400px; margin-bottom: 30px"></div>
            <h3>Hoteluri disponibile pentru: <span><%= Request.QueryString["adulti"] %></span> adulți și <span><%= Request.QueryString["copii"] %></span> copii, <span><%= Request.QueryString["camere"] %></span> cameră/e</h3>
            <br>
            <div id="results"></div>
            
        </div>

    </section>
</asp:Content>
