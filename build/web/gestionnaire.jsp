<%-- 
    JSP        : gestionnaire.jsp
    Created on : 2017-10-29, 18:58:03
    Author     : dris & Francis
--%>

<%-- <jsp:include page="header.jsp" flush="false" /> --%>
<%@include file="/header.jsp" %>

<main class="main-content">
    <div class="container">
        <div class="page">
            <div class="form">
                <c:if test="${!empty requestScope.messageErrorFrmCine}">
                    <div class="alert alert-danger alert-dismissable">
                        <a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
                        <p class="panel-body">Les informations renseignées sur le formulaire sont erronées</p>
                        <p class="panel-body">${requestScope.messageErrorFrmCine}</p>
                    </div>
                </c:if>
                <c:if test="${!empty requestScope.messageConfirm}">
                    <div class="alert alert-success alert-dismissable">
                        <a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
                        <p class="panel-body"> ${requestScope.messageConfirm}</p>
                    </div>
                </c:if>   
                <h1>Bienvenu ${sessionScope.proprio.getIdentifiant()}</h1>
                <ul class="tab-group">
                    <li class="tab active"><a href="#update">Mettre à jour</a></li>
                    <li class="tab"><a href="#ajoutCinema">Ajouter un cinéma</a></li>
                    <li class="tab"><a href="#ajoutFilm">Ajouter un film</a></li>
                    <li class="tab"><a href="#afficheDonnees">Afficher les données</a></li>
                </ul>

                <div class="tab-content">
                    <div id="update">   
                        <h1>Modifiez vos informations</h1>

                        <form action="update.do" method="post">
                            <div class="field-wrap">
                                <label></label>
                                <input type="text" name="identifiant"  readonly value = "${sessionScope.connecte}"/>
                            </div>
                            <div class="top-row">
                                <div class="field-wrap">
                                    <label></label>
                                    <input type="text" name = "nom" value = "${sessionScope.proprio.getNom()}" required autocomplete="off"/>
                                </div>

                                <div class="field-wrap">
                                    <label></label>
                                    <input type="text" name = "prenom"  value = "${sessionScope.proprio.getPrenom()}" required autocomplete="off"/>
                                </div>
                            </div>

                            <div class="field-wrap">
                                <label>
                                    Mot de passe<span class="req"></span>
                                </label>
                                <input type="password" name = "motdepasse" />
                            </div>    
                            <div class="top-row">
                                <div class="field-wrap">
                                    <label></label>
                                    <input type="email" name = "courriel" value = "${sessionScope.proprio.getCourriel()}" required autocomplete="off"/>
                                </div>
                                <div class="field-wrap">
                                    <label></label>
                                    <input type="text" name = "tel" value = "${sessionScope.proprio.getTelephone()}"/>
                                </div>
                            </div>
                            <input type="hidden" name="action" value="update" />

                            <button type="submit" class="button button-block"/>Mettre à jour</button>

                        </form>

                    </div>

                    <div id="ajoutCinema">   
                        <h1>Ajouter un cinéma</h1>

                        <form action="ajoutCinema.do" method="post">
                            <div class="field-wrap">
                                <div class="field-wrap">
                                    <label></label>
                                    <input type="text" name="identifiant"  readonly value = "${sessionScope.connecte}"/>
                                </div>
                            </div>
                            <div class="field-wrap">
                                <label>
                                    Nom du cinéma<span class="req">*</span>
                                </label>
                                <input type="text" required name="nomCinema" required autocomplete="off"/>
                            </div>

                            <div class="field-wrap">
                                <label>
                                    Ville<span class="req">*</span>
                                </label>
                                <input type="text" name="ville" required autocomplete="off"/>
                            </div>
                            <div class="field-wrap">
                                <label>
                                    Nombre de salles<span class="req">*</span>
                                </label>
                                <input type="text" name="nbrSalles" required autocomplete="off"/>
                            </div>
                            <input type="hidden" name="action" value="ajoutCinema" /><br />
                            <button class="button button-block"/>Ajouter</button>
                        </form>

                    </div>

                    <div id="ajoutFilm">   
                        <h1>Ajouter un film</h1>

                        <form action="ajoutFilm.do" method="post">
                            <div class="field-wrap">
                                <div class="field-wrap">
                                    <label></label>
                                    <input type="text" name="identifiant"  readonly value = "${sessionScope.connecte}"/>
                                </div>
                            </div>

                            <div class="field-wrap">
                                <label>code</label>
                                <input type="text" required name="codeCinema" required autocomplete="off"/>
                            </div>

                            <div class="field-wrap">
                                <label>
                                    Nom du cinéma<span class="req">*</span>
                                </label>
                                <input type="text" required name="nomCinema" required autocomplete="off"/>
                            </div>

                            <div class="field-wrap">
                                <label>
                                    Titre du film <span class="req">*</span>
                                </label>
                                <input type="text" name="titreFilm" required autocomplete="off"/>
                            </div>

                            <div class="field-wrap">
                                <label>
                                    Description <span class="req">*</span>
                                </label>
                                <textarea type="text" name="description" required autocomplete="off"></textarea>
                            </div>
                            <div class="field-wrap">
                                <label>
                                    Numéro de salle <span class="req">*</span>
                                </label>
                                <input type="text" name="numSalle" required autocomplete="off"/>
                            </div>
                            <div class="field-wrap">
                                <label>
                                    Code Periode <span class="req">*</span>
                                </label>
                                <input type="text" name="codePeriode" required autocomplete="off"/>
                            </div>
                            <div class="field-wrap">
                                <label>
                                    Code séance <span class="req">*</span>
                                </label>
                                <input type="text" name="codeSeance" required autocomplete="off"/>
                            </div>
                            <input type="hidden" name="action" value="ajoutFilm" /><br />
                            <button class="button button-block"/>Ajouter le film</button>
                        </form>

                    </div>

                </div><!-- tab-content -->

            </div> <!-- /form -->
            <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

            <script  src="js/index.js"></script>

        </div>
    </div> <!-- .container -->
</main>
<footer class="site-footer">
    <div class="container">
        <div class="row">
            <div class="col-md-2">
                <div class="widget">
                    <h3 class="widget-title">About Us</h3>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quia tempore vitae mollitia nesciunt saepe cupiditate</p>
                </div>
            </div>
            <div class="col-md-2">
                <div class="widget">
                    <h3 class="widget-title">Recent Review</h3>
                    <ul class="no-bullet">
                        <li>Lorem ipsum dolor</li>
                        <li>Sit amet consecture</li>
                        <li>Dolorem respequem</li>
                        <li>Invenore veritae</li>
                    </ul>
                </div>
            </div>
            <div class="col-md-2">
                <div class="widget">
                    <h3 class="widget-title">Help Center</h3>
                    <ul class="no-bullet">
                        <li>Lorem ipsum dolor</li>
                        <li>Sit amet consecture</li>
                        <li>Dolorem respequem</li>
                        <li>Invenore veritae</li>
                    </ul>
                </div>
            </div>
            <div class="col-md-2">
                <div class="widget">
                    <h3 class="widget-title">Join Us</h3>
                    <ul class="no-bullet">
                        <li>Lorem ipsum dolor</li>
                        <li>Sit amet consecture</li>
                        <li>Dolorem respequem</li>
                        <li>Invenore veritae</li>
                    </ul>
                </div>
            </div>
            <div class="col-md-2">
                <div class="widget">
                    <h3 class="widget-title">Social Media</h3>
                    <ul class="no-bullet">
                        <li>Facebook</li>
                        <li>Twitter</li>
                        <li>Google+</li>
                        <li>Pinterest</li>
                    </ul>
                </div>
            </div>
            <div class="col-md-2">
                <div class="widget">
                    <h3 class="widget-title">Newsletter</h3>
                    <form action="#" class="subscribe-form">
                        <input type="text" placeholder="Email Address">
                    </form>
                </div>
            </div>
        </div> <!-- .row -->

        <div class="colophon">Copyright 2014 Company name, Designed by Themezy. All rights reserved</div>
    </div> <!-- .container -->

</footer>
</div>
<!-- Default snippet for navigation -->



<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/plugins.js"></script>
<script src="js/app.js"></script>

</body>

</html>
