<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="CautareAtractii.aspx.cs" Inherits="WebApplicationCityBreak.CautareAtractii" %>
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
                    zoom: 12
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
                            query: 'attractions in ' + location,
                            //type: 'lodging',
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
                    content += '<p>Evaluările clienților: ' + place.rating + '</p>';

                    if (place.photos && place.photos.length > 0) {
                        /*content += '<div><h4>Photos:</h4><ul>';*/
                        for (var i = 0; i < Math.min(place.photos.length, 5); i++) {
                            content += '<img src="' + place.photos[i].getUrl({ maxWidth: 500, maxHeight: 500 }) + '">';
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

                dataa = '<%= Request.QueryString["dataa"] %>';
                oraa = '<%= Request.QueryString["oraa"] %>';
                persa = '<%= Request.QueryString["persa"] %>';

                for (var i = 0; i < results.length; i++) {
                    var resultItem = document.createElement('li');
                    resultItem.innerHTML = '<h3>' + results[i].name + '</h3>';
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

                    resultItem.innerHTML += '<p><b>Evaluările clienților:</b> ' + results[i].rating + '<i class="fa-solid fa-star" style="color: #ffa200;"></i></p>';

                    //resultItem.innerHTML += '<div><button type="button" style="background:#FF8800; border-color:#FF8800;color: white; border-radius: 5px; border-style: none; font-size: 20px;" >Rezervați acum</button></div>';
                    resultItem.innerHTML += '<br><div><a href="#container?atractie=' + encodeURIComponent(results[i].name) + '&dataa= ' + dataa + '&oraa= ' + oraa + '&persa= ' + persa + '" data-target="#loginmodal4" data-toggle="modal" style="padding: 10px;background:#FF8800; border-color:#FF8800;color: white; border-radius: 5px; border-style: none; font-size: 20px;">Rezervați acum</a></div>';

                    resultItem.innerHTML += '<hr>';

                    resultsList.appendChild(resultItem);
                }

                document.getElementById('results').appendChild(resultsList);

                var rezervaBtns = document.querySelectorAll('a[data-target="#loginmodal4"]');
                for (var i = 0; i < rezervaBtns.length; i++) {
                    rezervaBtns[i].addEventListener('click', function (event) {
                        event.preventDefault();

                        var atractieName = decodeURIComponent(this.getAttribute('href').split('atractie=')[1].split('&')[0]);
                        var atractieNamePopup = document.getElementById('atractieNamePopup');
                        atractieNamePopup.innerHTML = '<h6>Detaliile programării:</h6>';
                        atractieNamePopup.innerHTML += 'Atractie: ' + atractieName + '<br>';
                        atractieNamePopup.innerHTML += 'Data: ' + dataa + '<br>';
                        atractieNamePopup.innerHTML += 'Ora: ' + oraa + '<br>';
                        atractieNamePopup.innerHTML += 'Persoane: ' + persa;
                    });
                }
            }
        </script>


        <div onload="initMap()" style="margin-left: 124px; margin-right: 124px; font-family: Light 300;">
            <h1 style="color: #FF8800; margin-bottom: 20px; margin-top: 20px;">Rezultatele căutării pentru <span style="color: black;"><%= Request.QueryString["dataa"] %></span> la <span style="color: black;"><%= Request.QueryString["oraa"] %></span> pentru <span style="color: black;"><%= Request.QueryString["persa"] %></span> persoane</h1>
            <div id="map" style="height: 400px; margin-bottom: 30px"></div>
            <br>
            <div id="results"></div>

            <div class="container" id="container">
                        <div class="row">
                            <div class="col col-sm-12">
                                <div class="modal" data-keyboard="false" data-backdrop="static" id="loginmodal4" tabindex="-1">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h4 class="modal-title" style="color:#FF8800">Rezervarea a fost făcută cu succes!</h4>
                                                <button class="close" data-dismiss="modal">&times;</button>
                                            </div>
                                            <div class="modal-body">
                                                <div>
                                                    <p style="text-align: justify;" id="atractieNamePopup"></p>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>

                    </div>

        </div>

    </section>
</asp:Content>
