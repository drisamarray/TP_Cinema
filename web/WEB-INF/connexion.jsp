<%-- 
    JSP        : Formulaires Connexion et Inscription
    Created on : 2017-10-29, 19:01:15
    Author     : Dris & Francis
--%>

<%-- <jsp:include page="header.jsp" flush="false" /> --%>
<%@include file="header.jsp" %>
<main class="main-content">
    <div class="container">
        <div class="page">
            <div class="breadcrumbs">
                <a href="index.jsp">Home</a>
                <span>Connexion/Inscription</span>
            </div>
            <div class="form">
                <c:if test="${!empty requestScope.messageError || !empty requestScope.messageErrorCnx}">
                    <div class="alert alert-danger alert-dismissable">
                        <a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
                        <p class="panel-body">Les informations renseignées sur le formulaire sont erronées</p>
                        <c:if test="${!empty requestScope.messageError}">
                            <p class="panel-body">${requestScope.messageError}</p>
                            <!--<ul class="tab-group"><li class="tab"><a href="#signup">Réessayer</a></ul>-->
                        </c:if>
                        <c:if test="${!empty requestScope.messageErrorCnx}">
                            <p class="panel-body">${requestScope.messageErrorCnx}</p>
                        </c:if>
                    </div>
                </c:if>
                <ul class="tab-group">
                    <li class="tab active"><a href="#login">Connexion</a></li>
                    <li class="tab"><a href="#signup">Inscription</a></li>
                </ul>

                <div class="tab-content">
                    <div id="login">   
                        <h1 class = "titre">Bienvenu!</h1>

                        <form action="login.do" method="post">

                            <div class="field-wrap">
                                <label>
                                    Identifiant<span class="req">*</span>
                                </label>
                                <input type="text" required name="identifiant" autocomplete="off"/>
                            </div>

                            <div class="field-wrap">
                                <label>
                                    Password<span class="req">*</span>
                                </label>
                                <input type="password" name="motdepasse" required autocomplete="off"/>
                            </div>
                            <input type="hidden" name="action" value="login" /><br />
                            <!--<p class="forgot"><a href="#">Mot de passe oublié?</a></p>-->

                            <button class="button button-block"/>Se connecter</button>

                        </form>

                    </div>
                    <div id="signup">   
                        <h1>Inscrivez-vous gratuitement</h1>

                        <form action="signup.do" method="post">

                            <div class="top-row">
                                <div class="field-wrap">
                                    <label>
                                        Nom<span class="req">*</span>
                                    </label>
                                    <input type="text" name = "nom" required autocomplete="off" />
                                </div>

                                <div class="field-wrap">
                                    <label>
                                        Prénom<span class="req">*</span>
                                    </label>
                                    <input type="text" name = "prenom"  required autocomplete="off"/>
                                </div>
                            </div>

                            <div class="field-wrap">
                                <label>
                                    Identifiant<span class="req">*</span>
                                </label>
                                <input type="text" name = "identifiant" required autocomplete="off"/>
                            </div>

                            <div class="field-wrap">
                                <label>
                                    Mot de passe<span class="req">*</span>
                                </label>
                                <input type="password" name = "motdepasse" required autocomplete="off"/>
                            </div>    
                            <div class="top-row">
                                <div class="field-wrap">
                                    <label>
                                        Courriel<span class="req">*</span>
                                    </label>
                                    <input type="email" name = "courriel" required autocomplete="off" />
                                </div>

                                <div class="field-wrap">
                                    <label>
                                        Téléphone<span class="req"></span>
                                    </label>
                                    <input type="text" name = "courriel"/>
                                </div>
                            </div>

                            <div class="field-wrap">
                                <label>
                                    Type de compte : visiteur ou gestionnaire?<span class="req">*</span>
                                </label> 
                                <input type="text" name = "type" required autocomplete="off"/>
                            </div>

                            <input type="hidden" name="action" value="signup" />

                            <button type="submit" class="button button-block"/>Commencer</button>

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