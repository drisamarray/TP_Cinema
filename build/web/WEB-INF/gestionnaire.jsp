<%-- 
    JSP        : gestionnaire.jsp espace du gestionnaire (ajout de films, cinema, séances et projection de films)
    Created on : 2017-10-29, 18:58:03
    Author     : dris & Francis
--%>

<%-- <jsp:include page="header.jsp" flush="false" /> --%>
<%@include file="header.jsp" %>
<main class="main-content">
    <div class="container">
        <div class="page">
            <div class="breadcrumbs">
                <a href="index.jsp">Home</a>
                <span>Espace gestionnaire : Mise à jour et ajout de cinémas</span>
            </div>
            <div class="form">
                <c:if test="${empty sessionScope.connecte}">
                    <jsp:forward page="/WEB-INF/connexion.jsp" />
                </c:if>    
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
                    <li><a href="ajoutFilmForm.do?action=afficherResume">Ajouter un film</a></li>
                    <li><a href="ajoutFilmForm.do?action=ajoutFilmForm">Afficher les détails</a></li>
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

                </div><!-- tab-content -->

            </div> <!-- /form -->
            <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
            <script  src="assets/js/index.js"></script>
        </div>
    </div> <!-- .container -->
</main>
<%@include file="footer.jsp" %>