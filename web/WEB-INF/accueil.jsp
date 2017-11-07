<%--
    Document   : Index
    Created on : 2017-10-29, 19:01:15
    Author     : Dris & Francis
--%>

<%@include file="header.jsp" %>
<%-- tests
<c:if test="${!empty sessionScope.lesFilms}">
    <c:forEach items="${sessionScope.lesFilms}" var="item">
        <p>${item.codeFilm}<p>
    </c:forEach>
</c:if>
 <c:if test="${!empty requestScope.lesTroisMoisEnCours}">
    <c:forEach items="${requestScope.lesTroisMoisEnCours}" var="item">
        <p>${item}<p>
    </c:forEach>
</c:if>
        <%
            if (request.getAttribute("lesFilms") != null) //déjà connecté
            {
                
                out.println("<p> Bienvenu  : " + request.getAttribute("lesFilms") + "</a></p>");
                //out.println("<p> Vous êtes de type  : " + session.getAttribute("typeUser") + "</a></p>");
                //foreach
            }
        %>
--%>

<main class="main-content">
    <div class="container">
        <div class="page">
            <div class="row">
                <div class="col-md-9">
                    <div class="slider">
                        <ul class="slides">
                            <li><a href="afficherUnFilm.do?action=detailsFilm&codeFilm=${sessionScope.lesFilms.get(0).getCodeFilm()}"><img src="./assets/dummy/${sessionScope.lesFilms.get(0).getAffiche()}" alt="Slide 1"></a></li>
                            <li><a href="afficherUnFilm.do?action=detailsFilm&codeFilm=${sessionScope.lesFilms.get(1).getCodeFilm()}"><img src="./assets/dummy/${sessionScope.lesFilms.get(1).getAffiche()}"></a></li>
                            <li><a href="afficherUnFilm.do?action=detailsFilm&codeFilm=${sessionScope.lesFilms.get(2).getCodeFilm()}"><img src="./assets/dummy/${sessionScope.lesFilms.get(2).getAffiche()}"></a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="row">
                        <div class="col-sm-4 col-md-12">
                            <div class="latest-movie">
                                <a href="afficherUnFilm.do?action=detailsFilm&codeFilm=${sessionScope.lesFilms.get(3).getCodeFilm()}"><img src="./assets/dummy/${sessionScope.lesFilms.get(3).getAffiche()}" alt="Movie 1"></a>
                            </div>
                        </div>
                        <div class="col-sm-4 col-md-12">
                            <div class="latest-movie">
                                <a href="afficherUnFilm.do?action=detailsFilm&codeFilm=${sessionScope.lesFilms.get(4).getCodeFilm()}"><img src="./assets/dummy/${sessionScope.lesFilms.get(4).getAffiche()}" alt="Movie 2"></a>
                            </div>
                        </div>
                        <div class="col-sm-4 col-md-12">
                            <div class="latest-movie">
                                <a href="afficherUnFilm.do?action=detailsFilm&codeFilm=${sessionScope.lesFilms.get(5).getCodeFilm()}"><img src="./assets/dummy/${sessionScope.lesFilms.get(5).getAffiche()}" alt="Movie 2"></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div> <!--.row -->
            <div class="row">
                <div class="col-sm-6 col-md-3">
                    <div class="latest-movie">
                        <!--<a href="#"><img src="assets/dummy/thumb-3.jpg" alt="Movie 3"></a>-->
                        <a href="afficherUnFilm.do?action=detailsFilm&codeFilm=${sessionScope.lesFilms.get(6).getCodeFilm()}"><img src="./assets/dummy/${sessionScope.lesFilms.get(6).getAffiche()}" alt="Movie 3"></a>
                    </div>
                </div>
                <div class="col-sm-6 col-md-3">
                    <div class="latest-movie">
                        <a href="afficherUnFilm.do?action=detailsFilm&codeFilm=${sessionScope.lesFilms.get(7).getCodeFilm()}"><img src="./assets/dummy/${sessionScope.lesFilms.get(7).getAffiche()}" alt="Movie 4"></a>
                    </div>
                </div>
                <div class="col-sm-6 col-md-3">
                    <div class="latest-movie">
                        <a href="afficherUnFilm.do?action=detailsFilm&codeFilm=${sessionScope.lesFilms.get(8).getCodeFilm()}"><img src="./assets/dummy/${sessionScope.lesFilms.get(8).getAffiche()}" alt="Movie 5"></a>
                    </div>
                </div>
                <div class="col-sm-6 col-md-3">
                    <div class="latest-movie">
                        <a href="afficherUnFilm.do?action=detailsFilm&codeFilm=${sessionScope.lesFilms.get(9).getCodeFilm()}"><img src="./assets/dummy/${sessionScope.lesFilms.get(9).getAffiche()}" alt="Movie 6"></a>
                    </div>
                </div>
            </div> <!-- .row -->

            <div class="row">
                <div class="col-md-4">
                    <h2 class="section-title">${requestScope.lesTroisMoisEnCours.get(0)} première</h2>
                    <p>Lorem ipsum dolor sit amet consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore.</p>
                    <ul class="movie-schedule">
                        <li>
                            <div class="date">${sessionScope.lesFilms.get(0).getGenre()}</div>
                            <h2 class="entry-title"><a href="afficherUnFilm.do?action=detailsFilm&codeFilm=${sessionScope.lesFilms.get(0).getCodeFilm()}">${sessionScope.lesFilms.get(0).getTitre()}</a></h2>
                        </li>
                        <li>
                            <div class="date">${sessionScope.lesFilms.get(1).getGenre()}</div>
                            <h2 class="entry-title"><a href="afficherUnFilm.do?action=detailsFilm&codeFilm=${sessionScope.lesFilms.get(1).getCodeFilm()}">${sessionScope.lesFilms.get(1).getTitre()}</a></h2>
                        </li>
                        <li>
                            <div class="date">${sessionScope.lesFilms.get(2).getGenre()}</div>
                            <h2 class="entry-title"><a href="afficherUnFilm.do?action=detailsFilm&codeFilm=${sessionScope.lesFilms.get(2).getCodeFilm()}">${sessionScope.lesFilms.get(2).getTitre()}</a></h2>
                        </li>
                    </ul> <!-- .movie-schedule -->
                </div>
                <div class="col-md-4">
                    <h2 class="section-title">${requestScope.lesTroisMoisEnCours.get(1)} première</h2>
                    <p>Lorem ipsum dolor sit amet consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore.</p>
                    <ul class="movie-schedule">
                        <li>
                            <div class="date">${sessionScope.lesFilms.get(3).getGenre()}</div>
                            <h2 class="entry-title"><a href="afficherUnFilm.do?action=detailsFilm&codeFilm=${sessionScope.lesFilms.get(3).getCodeFilm()}">${sessionScope.lesFilms.get(3).getTitre()}</a></h2>
                        </li>
                        <li>
                            <div class="date">${sessionScope.lesFilms.get(4).getGenre()}</div>
                            <h2 class="entry-title"><a href="afficherUnFilm.do?action=detailsFilm&codeFilm=${sessionScope.lesFilms.get(4).getCodeFilm()}">${sessionScope.lesFilms.get(4).getTitre()}</a></h2>
                        </li>
                        <li>
                            <div class="date">${sessionScope.lesFilms.get(5).getGenre()}</div>
                            <h2 class="entry-title"><a href="afficherUnFilm.do?action=detailsFilm&codeFilm=${sessionScope.lesFilms.get(5).getCodeFilm()}">${sessionScope.lesFilms.get(5).getTitre()}</a></h2>
                        </li>
                    </ul> <!-- .movie-schedule -->
                </div>
                <div class="col-md-4">
                    <h2 class="section-title">${requestScope.lesTroisMoisEnCours.get(2)} première</h2>
                    <p>Lorem ipsum dolor sit amet consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore.</p>
                    <ul class="movie-schedule">
                        <li>
                            <div class="date">${sessionScope.lesFilms.get(6).getGenre()}</div>
                            <h2 class="entry-title"><a href="afficherUnFilm.do?action=detailsFilm&codeFilm=${sessionScope.lesFilms.get(6).getCodeFilm()}">${sessionScope.lesFilms.get(6).getTitre()}</a></h2>
                        </li>
                        <li>
                            <div class="date">${sessionScope.lesFilms.get(7).getGenre()}</div>
                            <h2 class="entry-title"><a href="afficherUnFilm.do?action=detailsFilm&codeFilm=${sessionScope.lesFilms.get(7).getCodeFilm()}">${sessionScope.lesFilms.get(7).getTitre()}</a></h2>
                        </li>
                        <li>
                            <div class="date">${sessionScope.lesFilms.get(8).getGenre()}</div>
                            <h2 class="entry-title"><a href="afficherUnFilm.do?action=detailsFilm&codeFilm=${sessionScope.lesFilms.get(8).getCodeFilm()}">${sessionScope.lesFilms.get(8).getTitre()}</a></h2>
                        </li>
                    </ul> <!-- .movie-schedule -->
                </div>
            </div>
        </div>
    </div> <!-- .container -->
</main>
<%@include file="footer.jsp" %>
