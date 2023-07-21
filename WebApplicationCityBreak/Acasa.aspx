<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Acasa.aspx.cs" Inherits="WebApplicationCityBreak.Acasa" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="css_pages/StyleSheetAcasa.css" rel="stylesheet" />
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- Google Maps JavaScript library -->
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&libraries=places&key=AIzaSyBc6ussvjWGa-rtQrCZjtaqX3LP98vsADU"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>


    <!--FRAME 1-->
    <section>
        <div class="row">
            <div id="av" class="col-md-4">
                <h1 style="font-family: Light 300">Începe-ți</h1>
                <h2>AVENTURA</h2>
                <p class="text" style="font-family: Light 300; color: #373743;">Împreună putem organiza vacanța visurilor tale!</p>
                <br>

                <div class="search_box" id="search_box">
                    <input type="text" class="input_search" id="input_search" name="input_search" style="font-family: Light 300" placeholder="Către?">
                    <!--<button class="search_btn" id="search_button">
                        <i class="w3-xlarge fas fa-search"></i>
                    </button>-->
                    <a href="Destinatie.aspx" class="search_btn" id="search_button">
                        <i class="w3-xlarge fas fa-search search_icon"></i>
                        <style>
                            .search_icon {
                                font-size: 20px;
                                position: relative;
                                top: 50%;
                                left: 50%;
                                transform: translate(-50%, -50%);
                            }
                        </style>
                    </a>

                    <script>
                        document.getElementById("search_button").onclick = function () {
                            location.href = "Destinatie.aspx";
                        };

                        var searchInput = 'input_search';

                        $(document).ready(function () {
                            var autocomplete;
                            autocomplete = new google.maps.places.Autocomplete((document.getElementById(searchInput)), {
                                types: ['geocode'],
                            });
                            google.maps.event.addListener(autocomplete, 'place_changed', function () {
                                var near_place = autocomplete.getPlace();
                                var place = near_place.formatted_address;
                                localStorage.setItem('myPlace', place);
                                /*Session["place"] = placeValue;*/
                            });
                        });

                    </script>
                </div>


                <script>
                    const search_box = document.getElementById('search_box');
                    const input_search = document.getElementById('input_search');

                    search_box.addEventListener('submit', function (e) {
                        e.preventDefault();
                        const input_searchValue = input_search.value;
                        localStorage.setItem('input-search', input_searchValue);
                        //return false;
                    });

                </script>


            </div>
            <div class="col-md-7">
                <center>
                    <img src="img/acasa.jpg" class="home" style="width: 720px; height: auto; margin-top: 80px; margin-right: 100px" />
                </center>
            </div>
        </div>
    </section>

    <!--FRAME 2-->
    <section>
        <div class="flex-container" style="display: flex">
            <div class="grid-container">
                <div class="item1"><i class="fa-solid fa-building-columns" style="font-size: 40px"></i></div>
                <div class="item2" style="white-space: nowrap"><b>&ensp; PLANIFICĂ UN WEEKEND PRELUNGIT</b></div>
                <div class="item3" style="white-space: nowrap">&ensp; <a href="#oferte">Oferte Vacanțe</a></div>
            </div>

            <div class="grid-container">
                <div class="item1"><i class="fa-solid fa-bell-concierge" style="font-size: 40px"></i></div>
                <div class="item2" style="white-space: nowrap"><b>&ensp; VACANȚE ÎN ROMÂNIA</b></div>
                <div class="item3" style="white-space: nowrap">&ensp; <a href="#romania">Vacanțe România</a></div>
            </div>

            <div class="grid-container">
                <div class="item1"><i class="fa-solid fa-mountain-sun" style="font-size: 40px"></i></div>
                <div class="item2" style="white-space: nowrap"><b>&ensp; VACANȚE CU NOI</b></div>
                <div class="item3" style="white-space: nowrap">&ensp; <a href="#despre_noi">Vacanțe planificate cu noi</a></div>
            </div>
        </div>
    </section>
    <br>
    <br>

    <!--FRAME 3-->
    <section>
        <div class="grid-container2">
            <div class="item4">
                <img src="img/avion1.jpg" style="width: 280px; height: auto; margin-left: 124px" />
            </div>
            <div class="item5" style="white-space: nowrap">
                <h3 style="font-family: Light 300; margin-left: 80px">Unde să mergi, chiar acum</h3>
                <p style="font-family: Light 300; margin-left: 80px">Locuri în fruntea listelor obligatorii ale călătorilor</p>
            </div>
        </div>
    </section>

    <section class="container" id="oferte">
        <div class="card">
            <div class="card-image o1"></div>
            <h5>Barcelona, Spania</h5>
            <div class="linie">
                <div class="detalii" style="display: inline-block;"><a href="Oferta1.aspx" style="color: white">Detalii</a></div>
                <div class="pret" style="display: inline-block; color: #FF8800; margin-left: 50px; font-size: 20px; font-family: Light 300;">
                    <p><b>595 lei</b></p>
                </div>
            </div>

        </div>

        <div class="card">
            <div class="card-image o2"></div>
            <h5>Bruxelles, Belgia</h5>
            <div class="linie" style="white-space: nowrap;">
                <div class="detalii" style="display: inline-block;"><a href="Oferta2.aspx" style="color: white">Detalii</a></div>
                <div class="pret" style="display: inline-block; color: #FF8800; margin-left: 50px; font-size: 20px; font-family: Light 300;">
                    <p><b>830 lei</b></p>
                </div>
            </div>
        </div>

        <div class="card">
            <div class="card-image o3"></div>
            <h5>Roma, Italia</h5>
            <div class="linie">
                <div class="detalii" style="display: inline-block;"><a href="Oferta3.aspx" style="color: white">Detalii</a></div>
                <div class="pret" style="display: inline-block; color: #FF8800; margin-left: 50px; font-size: 20px; font-family: Light 300;">
                    <p><b>325 lei</b></p>
                </div>
            </div>
        </div>

        <div class="card">
            <div class="card-image o5"></div>
            <h5>München, Germania</h5>
            <div class="linie">
                <div class="detalii" style="display: inline-block;"><a href="Oferta4.aspx" style="color: white">Detalii</a></div>
                <div class="pret" style="display: inline-block; color: #FF8800; margin-left: 50px; font-size: 20px; font-family: Light 300;">
                    <p><b>765 lei</b></p>
                </div>
            </div>
            <style>
                .o5 {
                    background-image: url('../img/munchen.jpg');
                }
            </style>
        </div>
    </section>
    <center>
        <img src="img/avion2.jpg" style="width: 350px; height: auto" />
    </center>
    <br>


    <!--FRAME 4-->
    <section class="romania" id="romania">
        <br>
        <center>
            <h3 style="font-family: Light 300; margin-left: 80px;">Descoperă locuri minunate în țara ta
                <img style="height: 50px; width: auto" src="img/roloc.png" /></h3>
        </center>
        <br>
        <br>
        <div class="box-container">
            <div class="box">
                <img class="imgro" src="img/Arad.jpg" />
                <div class="linie">
                    <h3 style="display: inline-block;">Arad</h3>
                    <span style="display: inline-block; margin-left: 50px; font-size: 20px;">
                        <a href="#" data-target="#loginmodal1" data-toggle="modal">Citește mai mult</a>
                    </span>
                    <style>
                        .romania .box-container .box .linie a {
                            border-style: solid;
                            border-color: #2C99A0;
                            background-color: transparent;
                            color: #2C99A0;
                            display: block;
                            text-align: center;
                            margin: 7px 20px;
                            border-radius: 40px;
                            height: 32px;
                            width: 163px;
                            font-family: Light 300;
                        }

                            .romania .box-container .box .linie a:hover {
                                border-style: solid;
                                border-color: #2C99A0;
                                background-color: #2C99A0;
                                color: white;
                            }
                    </style>
                    <!--POP UP Arad-->
                    <div class="container">
                        <div class="row">
                            <div class="col col-sm-12">
                                <div class="modal" data-keyboard="false" data-backdrop="static" id="loginmodal1" tabindex="-1">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h4 class="modal-title">Arad</h4>
                                                <button class="close" data-dismiss="modal">&times;</button>

                                            </div>
                                            <div class="modal-body">
                                                <div>
                                                    <p style="text-align: justify;">Orașul-reședință al județului se întinde de-a lungul râului Mureș și este renumit pentru arhitectura austro-ungară de secol XIX și XX. Dacă te afli în Arad, trebuie să vizitezi centrul istoric, să faci o plimbare pe Bulevardul Revoluției și să admiri clădirile emblematice. În acest sens îți recomandăm <b>Palatul Administrativ (primăria)</b>, <b>Piața Avram Iancu</b>, <b>Biserica Roșie</b>, <b>Teatrul Național Ioan Slavici</b>, <b>Palatul Neumann</b> și <b>Turnul de Apă</b>, care găzduiește o galerie de artă. Clădirile istorice au fost recent renovate, recăpătându-și culoarea de altădată, așa că te vei simți cu siguranță ca în „mica Vienă” și vei avea ocazia de a face fotografii splendide pentru momente de neuitat. Iar dacă faci o plimbare pe malul Mureșului, te poți bucura de o băutură răcoroasă la una dintre terasele boeme.</p>
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
            </div>

            <div class="box">
                <img class="imgro" src="img/suceava.jpg" />
                <div class="linie">
                    <h3 style="display: inline-block;">Suceava</h3>
                    <span style="display: inline-block; margin-left: 50px; font-size: 20px;">
                        <a href="#" data-target="#loginmodal2" data-toggle="modal">Citește mai mult</a>
                    </span>

                    <!--POP UP Suceava-->
                    <div class="container">
                        <div class="row">
                            <div class="col col-sm-12">
                                <div class="modal" data-keyboard="false" data-backdrop="static" id="loginmodal2" tabindex="-1">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h4 class="modal-title">Suceava</h4>
                                                <button class="close" data-dismiss="modal">&times;</button>

                                            </div>
                                            <div class="modal-body">
                                                <div>
                                                    <p style="text-align: justify;">Suceava este situat în partea de nord-est a României, în regiunea Bucovina. Această urbe se număra printre cele mai vechi şi mai importante aşezări ale ţării. Interesant de menționat este că timp de două secole, Suceava a fost reşedinţa principală a statului Moldova, pentru ca ulterior, între 1775-1918 să devină parte a Imperiului Austriac. Începând cu domnia lui Petru I al Moldovei, Cetatea Sucevei a devenit principala cetate de scaun a Ţării Moldovei şi a îndeplinit această funcţie până în timpul domniei lui Alexandru Lapusneanu, când reşedinţa domnească s-a mutat la Iaşi. Cât eşti în Suceava poţi vizita mai multe obiective turistice, precum <b>Curtea Domnească din Suceava</b>, <b>Muzeul de Istorie</b>, <b>Muzeul Etnografic (Hanul Domnesc)</b>, <b>Muzeul de Ştiinţe ale Naturii</b>, <b>Muzeul Satului Bucovinean şi Planetariul</b>.</p>
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
            </div>

            <div class="box">
                <img class="imgro" src="img/constanta.jpg" />
                <div class="linie">
                    <h3 style="display: inline-block;">Constanța</h3>
                    <span style="display: inline-block; margin-left: 50px; font-size: 20px;">
                        <a href="#" data-target="#loginmodal3" data-toggle="modal">Citește mai mult</a>
                    </span>

                    <!--POP UP Constanta-->
                    <div class="container">
                        <div class="row">
                            <div class="col col-sm-12">
                                <div class="modal" data-keyboard="false" data-backdrop="static" id="loginmodal3" tabindex="-1">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h4 class="modal-title">Constanța</h4>
                                                <button class="close" data-dismiss="modal">&times;</button>

                                            </div>
                                            <div class="modal-body">
                                                <div>
                                                    <p style="text-align: justify;">Constanța se dezvăluie în față călătorilor exploratori precum o poveste citită vara la răsărit de soare. Dacă vrei să te bucuri de topul obiectivelor turistice din Constanța și tot ce are de oferit, acordă-ți timp să descoperi centrul vechi, portul, arhitectură clădirilor cu poveștile lor, plajă nou amenajată Neversea, mănăstirile și vestigiile române și nu în ultimul rând acordă-ți timp să faci o plimbare pe faleză și să fotografiezi Cazinoul. Nu pleca înainte de a gustă din plăcintă dobrogeană, din saramură de peste și din celelalte specialități culinare din bucătăria dobrogeană. Dacă ajungi aici, plănuiește-ți și un tur pietonal al orașului și nu rată cele mai cunoscute obiective turistice: <b>Muzeul de Artă Populară</b>, <b>Biserica Greacă Ortodoxă</b>, cea mai îngustă stradă: <b>Stradă Vântului</b>, <b>Moscheea Hunchiar</b>, <b>Sinagogă</b>, <b>Biserica Armenească</b>, <b>Statuia poetului Ovidiu</b>, <b>Muzeul de Istorie și Arheologie</b>, <b>Mozaicul Român</b>, <b>Moscheea Carol</b>, <b>Biserica Româno-Catolică</b>, <b>Basilica creștină din secolul VI d.H</b>, <b>Catedrala Ortodoxă</b>, <b>Cazinoul și Farul Genovez</b>. În cele ce urmează îți vom prezența succint câteva dintre cele mai importante obiective turistice din Constanța, pe care le poți vizită pe cont propriu.  </p>
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
            </div>

            <div class="box">
                <img class="imgro" src="img/iasi.jpg" />
                <div class="linie">
                    <h3 style="display: inline-block;">Iași</h3>
                    <span style="display: inline-block; margin-left: 50px; font-size: 20px;">
                        <a href="#" data-target="#loginmodal4" data-toggle="modal">Citește mai mult</a>
                    </span>

                    <!--POP UP Iasi-->
                    <div class="container">
                        <div class="row">
                            <div class="col col-sm-12">
                                <div class="modal" data-keyboard="false" data-backdrop="static" id="loginmodal4" tabindex="-1">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h4 class="modal-title">Iași</h4>
                                                <button class="close" data-dismiss="modal">&times;</button>

                                            </div>
                                            <div class="modal-body">
                                                <div>
                                                    <p style="text-align: justify;">Iași, unul dintre cele mai vechi orașe din România este cel mai important oraș din Moldova din punct de vedere economic, cultural și politic. A fost capitala Moldovei în perioada 1564-1859, una dintre cele două capitale ale Principatelor Unite între 1859 și 1862 și capitala Regatului României între 1916 și 1918. Orașul este învăluit de frumusețe și de farmec, fiind un veritabil muzeu național, prin comorile de istorie și de artă pe care le are. Iași, este, totodată, locul de naștere și locul care a ajutat la formarea unor personalități ca Mihai Eminescu, Ion Creanga, Mihail Sadoveanu sau Mihail Kogalniceanu. Îți propunem locuri de vizitat în orașul Iași și împrejurimi care te vor cuceri prin simplitate și eleganță: <b>Palatul Culturii</b>, <b>Grădina Botanică "Anastasie Fătu"</b>, <b>Catedrala Romană-Catolică</b>, <b>Teatrul National "Vasile Alecsandri"</b>, <b>Râpa Galbenă</b>, <b>Bojeduca lui Ion Creangă</b>.</p>
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
            </div>

            <div class="box">
                <img class="imgro" src="img/maramures.jpg" />
                <div class="linie">
                    <h3 style="display: inline-block;">Maramureș</h3>
                    <span style="display: inline-block; margin-left: 50px; font-size: 20px;">
                        <a href="#" data-target="#loginmodal5" data-toggle="modal">Citește mai mult</a>
                    </span>

                    <!--POP UP Maramures-->
                    <div class="container">
                        <div class="row">
                            <div class="col col-sm-12">
                                <div class="modal" data-keyboard="false" data-backdrop="static" id="loginmodal5" tabindex="-1">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h4 class="modal-title">Maramureș</h4>
                                                <button class="close" data-dismiss="modal">&times;</button>

                                            </div>
                                            <div class="modal-body">
                                                <div>
                                                    <p style="text-align: justify;">Anual, peste 200.000 de turiști sosesc pe aceste meleaguri pentru a vedea cele mai frumoase obiective turistice din Maramureș, fiind unul dintre cele mai vizitate locuri din România datorită numeroaselor puncte de atracție turistice. Considerată una dintre cele mai tradiționale regiuni ale României, Maramureșul este un loc încărcat de istorie, tradiție și gastronomie, încadrându-se într-un top al locurilor unde merită să mergi în orice moment al anului. Denumit și “pământul lemnului”, Maramureșul este situat în nordul țării, la granița cu Ucraina. Obiective turistice din Maramureș: <b>Cimitirul Vesel din Săpânța</b>, <b>Lacul Albastru din Baia Sprie</b>, <b>Mocănița de pe Valea Vaserului</b>, <b>Mănăstirea Bârsana</b>, <b>Memorialul Durerii din Sighet</b>, <b>Muzeul Satului Maramureșean</b>.</p>
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
            </div>

            <div class="box">
                <img class="imgro" src="img/oradea.jpg" />
                <div class="linie">
                    <h3 style="display: inline-block;">Oradea</h3>
                    <span style="display: inline-block; margin-left: 50px; font-size: 20px;">
                        <a href="#" data-target="#loginmodal6" data-toggle="modal">Citește mai mult</a>
                    </span>

                    <!--POP UP Oradea-->
                    <div class="container">
                        <div class="row">
                            <div class="col col-sm-12">
                                <div class="modal" data-keyboard="false" data-backdrop="static" id="loginmodal6" tabindex="-1">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h4 class="modal-title">Oradea</h4>
                                                <button class="close" data-dismiss="modal">&times;</button>

                                            </div>
                                            <div class="modal-body">
                                                <div>
                                                    <p style="text-align: justify;">Situat în partea de vest a României, orașul Oradea este adesea numit “Micul Paris” al României. Este un oraș de o mare frumusețe, cu o arhitectură uimitoare, o cultură vie și o atmosferă vibrantă.Orașul Oradea este plin de arhitectură uimitoare, de la clădirile sale maiestuoase în stil baroc până la fațadele sale unice în stil Art Nouveau. Orașul vechi se mândrește cu un număr impresionant de stiluri arhitecturale, de la clădirile în stil renascentist din centrul vechi al orașului până la clădirile în stil secesionist din cartierul evreiesc. Dacă nu ai ajuns încă să vizitezi această destinație, îți propunem locuri de văzut în Oradea și împrejurimi, obiective turistice care să fie pe placul tuturor iubitorilor de istorie, cultură și natură: <b>Piața Unirii și Palatul Vulturul Negru</b>, <b>Complexul Baroc</b>, <b>Cetatea Medievală Oradea</b>, <b>Palatul Moskovits Adolf și Fii</b>, <b>Dealul Ciuperca</b>, <b>Muzeul Art Nouveau - Casa Darvas - La Roche</b>. </p>
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
            </div>

            <div class="box">
                <img class="imgro" src="img/sibiu.jpg" />
                <div class="linie">
                    <h3 style="display: inline-block;">Sibiu</h3>
                    <span style="display: inline-block; margin-left: 50px; font-size: 20px;">
                        <a href="#" data-target="#loginmodal7" data-toggle="modal">Citește mai mult</a>
                    </span>

                    <!--POP UP Sibiu-->
                    <div class="container">
                        <div class="row">
                            <div class="col col-sm-12">
                                <div class="modal" data-keyboard="false" data-backdrop="static" id="loginmodal7" tabindex="-1">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h4 class="modal-title">Sibiu</h4>
                                                <button class="close" data-dismiss="modal">&times;</button>

                                            </div>
                                            <div class="modal-body">
                                                <div>
                                                    <p style="text-align: justify;">O vacanță în orașul medieval este cadrul perfect pentru a vizita cele mai frumoase obiective turistice din Sibiu și împrejurimi.Orașul Sibiu, denumit Hermannstadt în limba germană, este reședința județului cu același nume și totodată cel mai mare oraș din județul Sibiu, fiind unul dintre cele mai înfloritoare orașe din Transilvania.Cunoscut drept centrul coloniștilor sași stabiliți pe aceste meleaguri, Sibiu este unul dintre cele șapte cetăți medievale săsești („sieben Bürgen“) care au dat numele german al Transilvaniei „Siebenbürgen“.În 2017, Sibiu a devenit Capitală Culturală Europeană, iar începând cu această perioadă, turismul s-a poziționat pe un trend ascendent. Astfel, obiectivele turistice din Sibiu au propulsat acest oraș într-o destinație turistică de top de pe continentul European. Acest frumos oraș mediaval abundă în obiective turistice, reușind să ilustreze aspecte și elemente specifici epocii medievale întrucât cândva a fost cea mai importantă cetate germană din Transilvania, cum ar fi: <b>Podul Minciunilor</b>, <b>Turnul Sfatului</b>, <b>Piața Mare</b>, <b>Parcul Natural Dumbrava Sibiului</b>, <b>Muzeul ASTRA</b>.</p>
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
            </div>

            <div class="box">
                <img class="imgro" src="img/bucursti.jpg" />
                <div class="linie">
                    <h3 style="display: inline-block;">București</h3>
                    <span style="display: inline-block; margin-left: 50px; font-size: 20px;">
                        <a href="#" data-target="#loginmodal8" data-toggle="modal">Citește mai mult</a>
                    </span>

                    <!--POP UP Bucuresti-->
                    <div class="container">
                        <div class="row">
                            <div class="col col-sm-12">
                                <div class="modal" data-keyboard="false" data-backdrop="static" id="loginmodal8" tabindex="-1">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h4 class="modal-title">București</h4>
                                                <button class="close" data-dismiss="modal">&times;</button>

                                            </div>
                                            <div class="modal-body">
                                                <div>
                                                    <p style="text-align: justify;">Capitala României este un loc plin de istorie și povești captivante, cu un trecut deosebit, o atmosferă plină de viață și numeroase atracții turistice. Este un o destinație ideală pentru turiștii pasionați de arhitectură și istorie. De asemenea, anumite obiective turistice din București și împrejurimi sunt repere de liniște, relaxare sau chiar distracție.București este una dintre cele mai sigure și mai accesibile destinații din Europa. Aici există numeroase locuri speciale pe care trebuie să le vizitezi și experiențe unice pe care trebuie să le trăiești. Fiecare obiectiv vizitat vă va duce mai aproape de povești minunate și interesante: <b>Grădina Botanică</b>, <b>Muzeul Cotroceni</b>, <b>Palatul Parlamentului</b>, <b>Ateneul Român</b>, <b>Muzeul Satului</b>, <b>Palatul Primăverii sau ”Casa Ceaușescu”</b>. </p>
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
            </div>

            <div class="box">
                <img class="imgro" src="img/Timisoara.jpg" />
                <div class="linie">
                    <h3 style="display: inline-block;">Timișoara</h3>
                    <span style="display: inline-block; margin-left: 50px; font-size: 20px;">
                        <a href="#" data-target="#loginmodal9" data-toggle="modal">Citește mai mult</a>
                    </span>

                    <!--POP UP Timisoara-->
                    <div class="container">
                        <div class="row">
                            <div class="col col-sm-12">
                                <div class="modal" data-keyboard="false" data-backdrop="static" id="loginmodal9" tabindex="-1">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h4 class="modal-title">Timișoara</h4>
                                                <button class="close" data-dismiss="modal">&times;</button>

                                            </div>
                                            <div class="modal-body">
                                                <div>
                                                    <p style="text-align: justify;">Timișoara este unul dintre cele mai vechi şi frumoase oraşe din ţara noastră, cu o istorie impresionantă ilustrată prin intermediul obiectivelor turistice. Numit și Mica Vienă, Orașul Florilor sau Orașul de pe Bega, Timișoara este departe de a fi un oraș tipic, deoarece oferă o varietate de obiective turistice și are un bogat patrimoniu arhitectural și cultural.Pentru a descoperi Timişoara ai de ales între plimbări prin vechea cetate, admirând detaliile fascinante ale clădirilor, relaxare în pieţe şi în parcurile pline de verdeaţă sau vizite la muzee. Îți vom prezenta cele mai frumoase locuri de vizitat în Timișoara: <b>Piața Unirii</b>, <b>Piața Victoriei</b>, <b>Castelul Huniade</b>, <b>Bastionul Maria Theresia</b>, <b>Biserica romano-catolică Millenium</b> , <b>Parcul Rozelor</b>.</p>
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
            </div>

        </div>
        <br>
    </section>

    <!--FRAME 5-->
    <section class="despre_noi" id="despre_noi">
        <center>
            <br>
            <h3 style="font-family: Light 300;">De ce noi?</h3>

            <br>

            <div class="slider-container">
                <div class="slider">
                    <div class="slides">
                        <div id="slides__1" class="slide">
                            <div class="slide__text">
                                <img src="img/desprenoi1.jpg" height="300" id="hp1" style="float: left" />
                                <h4 style="text-align: left;"><b>HAI SĂ NE CUNOAȘTEM!</b></h4>
                                <br>
                                <h6 style="margin-right: 80px; text-align: justify; line-height: 1.5;">Ia o pauză de câteva zile de la rutina de zi cu zi! Avem pentru tine 
                                    oferte de city break-uri relaxante. Ne dorim să fim alături de tine atunci când explorezi destinații noi sau revizitezi 
                                    locuri dragi. Așa că hai să te ajutăm să organizezi vacanța dorită în orice stat din Uniunea Europeană.</h6>
                            </div>
                            <a class="slide__prev" href="#slides__3" title="Next"></a>
                            <a class="slide__next" href="#slides__2" title="Next"></a>
                        </div>
                        <div id="slides__2" class="slide">
                            <div class="slide__text">
                                <img src="img/desprenoi2.jpg" height="300" id="hp2" style="float: left" />
                                <h4 style="text-align: left;"><b>MERGI ÎNTR-UN CITY BREAK!</b></h4>
                                <br>
                                <h6 style="margin-right: 80px; text-align: justify; line-height: 1.5;">City break-urile noastre sunt o modalitate de a economisi atât bani, 
                                    cât și timp pe care l-ai petrece căutând separat biletele de avion și cazarea. Cu pachetele noatre ai totul într-o 
                                    singură rezervare, la un preț avantajos! De asemenea, poti face și rezervări din timp la atracțiile minunate 
                                    din fiecare oraș, dar și la restaurantele preferate.
                                </h6>
                            </div>
                            <a class="slide__prev" href="#slides__1" title="Prev"></a>
                            <a class="slide__next" href="#slides__3" title="Next"></a>
                        </div>
                        <div id="slides__3" class="slide">
                            <div class="slide__text">
                                <img src="img/desprenoi3.jpg" height="300" id="hp3" style="float: left" />
                                <h4 style="text-align: left;"><b>BUCURĂ-TE</b></h4>
                                <br>
                                <h6 style="margin-right: 80px; text-align: justify; line-height: 1.5;">Acum, după ce ți-ai ales destinația și am organizat împreună o 
                                vacanța de neuitat trebuie doar sa te bucuri de orașul ales alături de cei dragi.
                                </h6>
                            </div>
                            <a class="slide__prev" href="#slides__2" title="Prev"></a>
                            <a class="slide__next" href="#slides__1" title="Next"></a>
                        </div>
                    </div>
                    <div class="slider__nav">
                        <a class="slider__navlink" href="#slides__1"></a>
                        <a class="slider__navlink" href="#slides__2"></a>
                        <a class="slider__navlink" href="#slides__3"></a>
                    </div>
                </div>
            </div>
        </center>


    </section>
    <br>

    <!--FRAME 6-->
    <section class="contact" id="contact" style="padding: 40px 15%">


        <div class="contact-form" font-family="Light 300">
            <container>
                <h3>Contactează-ne</h3>
                <br>
                <input placeholder="Nume complet" />
                <input type="email" name="email" id="" placeholder="Email" />
                <input placeholder="Subiect" />
                <textarea cols="30" rows="10" placeholder="Mesajul tău"></textarea>
                <input type="submit" name="" value="Submit" class="btn" />
            </container>
        </div>

        <div class="contact-img">
            <img src="img/contact.png" />
        </div>
    </section>


</asp:Content>
