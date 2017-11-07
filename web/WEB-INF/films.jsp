<%-- 
    Document   : films affiche liste de films
    Created on : 2017-10-29, 18:58:03
    Author     : Dris & Francis
--%>

<%@include file="header.jsp" %>
<%-- tests
<c:if test="${!empty sessionScope.lesFilms}">
    <c:forEach items="${sessionScope.lesFilms}" var="item">
        <p>${item.codeFilm}<p>
    </c:forEach>
</c:if>
--%>

<main class="main-content">
    <div class="container">
        <div class="page">
            <div class="breadcrumbs">
                <a href="index.jsp">Home</a>
                <span>Liste des films à l'affiche</span>
            </div>
<!-- a trairer plus tard : remplir les balises avec des req ajax et implémenter filtre par cinéma, genre et ville
            <div class="filters">
                <select name="#" id="#" placeholder="Choose Category">
                    <option value="#">Action</option>
                    <option value="#">Drama</option>
                    <option value="#">Fantasy</option>
                    <option value="#">Horror</option>
                    <option value="#">Adventure</option>
                </select>
                <select name="#" id="#">
                    <option value="#">2012</option>
                    <option value="#">2013</option>
                    <option value="#">2014</option>
                </select>
            </div>
Fin a trairer plus tard -->

            <div class="movie-list">
                <c:forEach items="${sessionScope.lesFilms}" var="item">
                    <div class="movie">
                        <figure class="movie-poster"><img src="./assets/dummy/${item.getAffiche()}" alt="#"></figure>
                        <div class="movie-title"><a href="afficherUnFilm.do?action=detailsFilm&codeFilm=${item.getCodeFilm()}">${item.getTitre()}</a></div>
                        <p>${item.getDescription()}</p>
                    </div>
               </c:forEach> 
          
            </div> <!-- .movie-list -->
            
<!-- a trairer plus tard : pagination
            <div class="pagination">
                <a href="#" class="page-number prev"><i class="fa fa-angle-left"></i></a>
                <span class="page-number current">1</span>
                <a href="#" class="page-number">2</a>
                <a href="#" class="page-number">3</a>
                <a href="#" class="page-number">4</a>
                <a href="#" class="page-number">5</a>
                <a href="#" class="page-number next"><i class="fa fa-angle-right"></i></a>
            </div>
Fin a trairer plus tard -->

        </div>
    </div> <!-- .container -->
</main>

<%@include file="footer.jsp" %>