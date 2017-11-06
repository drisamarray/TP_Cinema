<%-- 
    JSP        : gestionnaireInfos : page avec formulaire pour ajout de films et affciher infos
    Created on : 2017-11-04, 01:26:59
    Author     : Dris & francis
                    !!!!!! vue incomplète : manque la partie des détails !!!!!!!!!!!!!!!!!!!!!!!!!1
--%>
<%@include file="header.jsp" %>

<main class="main-content">
    <div class="container">
        <div class="page">
            <div class="breadcrumbs">
                <a href="index.jsp">Home</a>
                <span>Espace gestionnaire : Ajout de films, de projections et détails sur le compte</span>
            </div>
            <div class="form">
                <c:if test="${empty sessionScope.connecte}">
                    <jsp:forward page="/WEB-INF/connexion.jsp" />
                </c:if>  
                <c:if test="${!empty requestScope.messageErrorFrmFilmProjection}">
                    <div class="alert alert-danger alert-dismissable">
                        <a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
                        <p class="panel-body">Les informations renseignées sur le formulaire sont erronées</p>
                        <p class="panel-body">${requestScope.messageErrorFrmFilmProjection}</p>
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
                    <li><a href="gestionnaire.do?action=formulaireGestion">Mettre à jour</a></li>
                    <li><a href="gestionnaire.do?action=formulaireGestion">Ajouter un cinéma</a></li>
                    <li  class="tab active"><a href="#ajoutFilm">Ajouter un film</a></li>
                    <li><a href="#details">Afficher les détails</a></li>
                </ul>

                <div class="tab-content">
                    <div id="ajoutFilm">   
                        <h1>Ajouter un film</h1>
                    </div>
                    <!--<div class="fb-button form-group field-btnconfrimajoutfilm">
                        <button type="submit" class="btn btn-danger" name="btnconfrimajoutfilm" value="Ajouter le film" style="danger" id="btnconfrimajoutfilm" onclick="select()">Ajouter le film</button>
                    </div>-->   

                    <form id="rendered-form" action="ajoutDeFilmProjection.do" method="post" enctype="multipart/form-data">
                        <div class="rendered-form">                           
                            <div class="fb-text form-group field-identifiant">
                                <input class="form-control" name="identifiant" value="${sessionScope.connecte}" maxlength="25" id="identifiant" title="Identifiant du gestionnaire" readonly type="text">
                            </div>
                            <div class="fb-select form-group field-cinema">
                                <select class="form-control" name="cinema" id="cinemaAjax" required="required" aria-required="true">
                                </select>
                            </div>
                            <div class="fb-text form-group field-text-1509776673021">
                                <input placeholder="Saisissez le titre du film" class="form-control" name="titreFilm" id="titreFilm" title="Saisissez le titre du film" required="required" aria-required="true" type="text">
                            </div>

                            <div class="fb-select form-group field-seance">

                                <select class="form-control" name="genres" multiple="true" id="genres" required="required" aria-required="true">
                                    <option disabled="null" selected="null">Genres du film</option>
                                    <option value="Action" id="action">Action</option>
                                    <option value="Drame" id="drame">Drame/Romance</option>
                                    <option value="Aventure" id="aventure">Aventure</option>
                                    <option value="Comédie" id="aventure">Aventure</option>
                                    <option value="Musicla" id="aventure">Aventure</option>
                                    <option value="Thriller" id="thriller">Thriller</option>
                                    <option value="Animation/Famille" id="anime">Animation - Famille</option>
                                    <option value="Horreur/Épouvante" id="horreur">Horreur/Épouvante</option>
                                </select>
                            </div>
                            <div class="fb-text form-group field-realisateur">

                                <input placeholder="Réalisateur" class="form-control" name="realisateur" id="realisateur" title="Qui est le réalisateur" required="required" aria-required="true" type="text">
                            </div>
                            <div class="fb-text form-group field-acteurs">

                                <input placeholder="Acteurs principaux" class="form-control" name="acteurs" id="acteurs" title="Les acteurs pricipaux du film" type="text">
                            </div>
                            <div class="fb-textarea form-group field-description">

                                <textarea type="textarea" placeholder="Sysnopsis" class="form-control" name="description" maxlength="254" rows="5" id="description" title="Synopsis concis du film" required="required" aria-required="true"></textarea>
                            </div>

                            <div class="fb-file form-group field-imageaffiche">
                                <input placeholder="Charger une affiche" class="form-control" name="imageaffiche" id="imageaffiche" title="Charger une affiche pour le film" required="required" aria-required="true" type="file">
                            </div>
                            <div class="fb-select form-group field-numsalle">

                                <select class="form-control" name="numsalle" id="numsalle" required="required" aria-required="true">
                                </select>
                            </div>
                            <div class="fb-date form-group field-datedebut">
                                <input placeholder="Projeté à partir du : " class="form-control" name="datedebut" id="datedebut" title="Période de projection" required="required" aria-required="true" type="date">
                            </div>
                            <div class="fb-date form-group field-datefin">                               
                                <input placeholder="Jusqu'au :" class="form-control" name="datefin" id="datefin" title="Période de projection" required="required" aria-required="true" type="date">
                            </div>

                            <div class="fb-select form-group field-seance">                                
                                <select class="form-control" name="seances" multiple="true" id="seance" required="required" aria-required="true">
                                    <option disabled="null" selected="null">Séance de projection</option>
                                    <option value="S1" id="S1">14h-17h Semaine</option>
                                    <option value="S2" id="S2">16h-19h Semaine</option>
                                    <option value="S3" id="S3">18h-21h Semaine</option>
                                    <option value="S4" id="S4">20h-23h Semaine</option>
                                    <option value="S5" id="S5">22h-01h Semaine</option>
                                    <option value="W1" id="W1">10h-13h Weekend</option>
                                    <option value="W2" id="W2">12h-15h Weekend</option>
                                </select>
                            </div>

                            <input type="hidden" name="action" value="ajoutDeFilmProjection" /><br />
                            <button class="button button-block"/>Projeter</button>
                        </div>
                    </form>




                </div><!-- tab-content -->

                <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
                <script  src="assets/js/index.js"></script>
                <script  src="assets/js/requetesAjax.js"></script>


            </div>
        </div>
    </div> <!-- .container -->
</main>

<%@include file="footer.jsp" %>



