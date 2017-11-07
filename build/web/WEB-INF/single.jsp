<%-- 
    Document   : Single : affiche un film selectionné
    Created on : 2017-10-29, 19:01:15
    Author     : Dris & Francis
                                            !!!!!!!!!!!!!!!!!!! cette page n'a pas encore été traité !!!!!!!!!!!!!!!!!!!!!!
--%>


<%@include file="header.jsp" %>
<%-- tests
<c:if test="${!empty requestScope.leFilm}">
        <p>${requestScope.leFilm}<p>
</c:if>
<c:if test="${!empty requestScope.lesProjections}">
    <c:forEach items="${requestScope.lesProjections}" var="item">
        <p>${item.codeCinema}<p>
    </c:forEach>
</c:if>
--%>

<main class="main-content">
    <div class="container">
        <div class="page">
            <div class="breadcrumbs">
                <a href="index.jsp">Home</a>
                <span>${requestScope.leFilm.getTitre()}</span>
            </div>

            <div class="content">
                <div class="row">
                    <div class="col-md-6">
                        <figure class="movie-poster"><img src="./assets/dummy/${requestScope.leFilm.getAffiche()}" alt="#"></figure>
                    </div>
                    <div class="col-md-6">
                        <h2 class="movie-title">${requestScope.leFilm.getTitre()}</h2>
                        <div class="movie-summary">
                            <p>S${requestScope.leFilm.getDescription()}</p>
                        </div>
                        <ul class="movie-meta">
                            <li><strong> Note : </strong> 
                                <div class="star-rating" title="Rated 4.00 out of 5"><span style="width:80%"><strong class="rating">4.00</strong> out of 5</span></div>
                            </li>
                            <li><strong>Genre : </strong> ${requestScope.leFilm.getGenre()}</li>
                        </ul>

                        <ul class="starring">
                            <li><strong>Réalisateur : </strong> ${requestScope.leFilm.getRealisateur()}</li>
                            <li><strong>Acteurs : </strong> ${requestScope.leFilm.getActeurs()}</li>
                        </ul>
                    </div>
                </div> <!-- .row -->

                <div class="row">
                        <div class="panel panel-success">
                            <div class="panel-heading">Liste des salles de cinémas projettant ce film</div>
                            <div class="panel-body">
                                <table id="listeCinema" class="table table-hover" style="font-size:20px;">
                                    <thead>
                                        <tr class="bg-info">
                                            <th>Cinéma</th>
                                            <th>Séance</th>
                                            <th>Salle</th>
                                            <th>Projeté du : </th>
                                            <th> Au : </th>
                                        </tr>
                                    </thead>
                                    <c:forEach items="${requestScope.lesProjections}" var="item">
                                        <tr>
                                            <td>${item.getCodeCinema()}</td>
                                            <td>${item.getSeance()}</td>
                                            <td>${item.getNumSalle()}</td>
                                            <td>${item.getDu()}</td>
                                            <td>${item.getAu()}</td>
                                        </tr>
                                    </c:forEach>       
                                </table>
                            </div>
                        </div>
                    </div>	
                </div>

      
 
            </div>
        </div>
    </div> <!-- .container -->
</main>
<%@include file="footer.jsp" %>