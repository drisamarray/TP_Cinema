<%-- 
    JSP        : header
    Created on : 2017-10-29, 19:01:15
    Author     : Dris & Francis
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1">
        <title>Cinéma</title>

        <!-- Loading third party fonts -->
        <link href="http://fonts.googleapis.com/css?family=Roboto:300,400,700|" rel="stylesheet" type="text/css">
        <link href="assets/fonts/font-awesome.min.css" rel="stylesheet" type="text/css">

        <link href='https://fonts.googleapis.com/css?family=Titillium+Web:400,300,600' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">

        <!--Bootsrap-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="http://getbootstrap.com/2.3.2/assets/css/bootstrap-responsive.css">
        <link rel="stylesheet" href="http://eternicode.github.io/bootstrap-datepicker/bootstrap-datepicker/css/datepicker.css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>       
        <script rel="stylesheet" href="http://eternicode.github.io/bootstrap-datepicker/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>




        <!-- Loading main css file -->
        <link rel="stylesheet" href="assets/css/style.css">

    </head>

<!-- Partie À retirer : pour les tests -->
    <body>
        <%
            if (request.getAttribute("mdpBD") != null) {
                out.println("<p> mdpBD : " + request.getAttribute("mdpBD") + "</a></p>");
                out.println("<p> mdpLoc : " + request.getAttribute("mdpLoc") + "</a></p>");

            }

            if (session.getAttribute("connecte") != null) //déjà connecté
            {
                out.println("<p> Bienvenu  : " + session.getAttribute("connecte") + "</a></p>");
                out.println("<p> Vous êtes de type  : " + session.getAttribute("typeUser") + "</a></p>");
            }
        %>
<!-- Fin retirer -->


        <div id="site-content">
            <header class="site-header">
                <div class="container">
                    <a href="index.jsp" id="branding">
                        <img src="images/logo.png" alt="" class="logo">
                        <div class="logo-copy">
                            <h1 class="site-title">CINEMA</h1>
                            <small class="site-description">Slogan à trouver</small>
                        </div>
                    </a> <!-- #branding -->

                    <div class="main-navigation">
                        <button type="button" class="menu-toggle"><i class="fa fa-bars"></i></button>
                        <ul class="menu">
                            <li class="menu-item current-menu-item"><a href="index.jsp">Home</a></li>
                                <c:if test="${empty sessionScope.connecte}">
                                <li class="menu-item"><a href="connexion.do?action=formulairesCnx">Connexion</a></li>
                                </c:if>
                                <c:if test="${!empty sessionScope.connecte}">
                                <li class="menu-item"><a href="deconnexion.do?action=logout">Déconnexion</a></li>
                                </c:if>
                            <li class="menu-item"><a href="lesaffcihes.do?action=afficherlesfilms">Les affiches</a></li>
                                <c:if test="${!empty sessionScope.connecte && !empty sessionScope.typeUser && sessionScope.typeUser == 'gestionnaire'}">
                                <li class="menu-item"><a href="gestionnaire.do?action=formulaireGestion">Gestionnaire</a></li>
                                </c:if>
                            <li class="menu-item"><a href="contact.do?action=contacter">Contact</a></li>
                        </ul> <!-- .menu -->
                        <!--
                                                <form action="#" class="search-form">
                                                    <input type="text" placeholder="Search...">
                                                    <button><i class="fa fa-search"></i></button>
                                                </form>
                        -->
                    </div> <!-- .main-navigation -->

                    <div class="mobile-navigation"></div>
                </div>
            </header>
