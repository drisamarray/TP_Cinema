<%-- 
    Document   : films affiche liste de films
    Created on : 2017-10-29, 18:58:03
    Author     : Dris & Francis
                            !!!!!!!!!!!!!!!!!!! cette page n'a pas encore été traité !!!!!!!!!!!!!!!!!!!!!!
--%>

<%@include file="header.jsp" %>
<main class="main-content">
    <div class="container">
        <div class="page">
            <div class="breadcrumbs">
                <a href="index.jsp">Home</a>
                <span>Liste des films à l'affiche</span>
            </div>

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
            <div class="movie-list">
                <div class="movie">
                    <figure class="movie-poster"><img src="./assets/dummy/thumb-3.jpg" alt="#"></figure>
                    <div class="movie-title"><a href="afficherUnFilm.do?action=detailsFilm">Maleficient</a></div>
                    <p>Sed ut perspiciatis unde omnis iste natus error voluptatem doloremque.</p>
                </div>
                <div class="movie">
                    <figure class="movie-poster"><img src="./assets/dummy/thumb-4.jpg" alt="#"></figure>
                    <div class="movie-title"><a href="afficherUnFilm.do?action=detailsFilm">The adventure of Tintin</a></div>
                    <p>Sed ut perspiciatis unde omnis iste natus error voluptatem doloremque.</p>
                </div>
                <div class="movie">
                    <figure class="movie-poster"><img src="./assets/dummy/thumb-5.jpg" alt="#"></figure>
                    <div class="movie-title"><a href="afficherUnFilm.do?action=detailsFilm">Hobbit</a></div>
                    <p>Sed ut perspiciatis unde omnis iste natus error voluptatem doloremque.</p>
                </div>
                <div class="movie">
                    <figure class="movie-poster"><img src="./assets/dummy/thumb-6.jpg" alt="#"></figure>
                    <div class="movie-title"><a href="afficherUnFilm.do?action=detailsFilm">Exists</a></div>
                    <p>Sed ut perspiciatis unde omnis iste natus error voluptatem doloremque.</p>
                </div>
                <div class="movie">
                    <figure class="movie-poster"><img src="./assets/dummy/thumb-1.jpg" alt="#"></figure>
                    <div class="movie-title"><a href="afficherUnFilm.do?action=detailsFilm">Drive hard</a></div>
                    <p>Sed ut perspiciatis unde omnis iste natus error voluptatem doloremque.</p>
                </div>
                <div class="movie">
                    <figure class="movie-poster"><img src="./assets/dummy/thumb-2.jpg" alt="#"></figure>
                    <div class="movie-title"><a href="afficherUnFilm.do?action=detailsFilm">Robocop</a></div>
                    <p>Sed ut perspiciatis unde omnis iste natus error voluptatem doloremque.</p>
                </div>
                <div class="movie">
                    <figure class="movie-poster"><img src="./assets/dummy/thumb-7.jpg" alt="#"></figure>
                    <div class="movie-title"><a href="afficherUnFilm.do?action=detailsFilm">Life of Pi</a></div>
                    <p>Sed ut perspiciatis unde omnis iste natus error voluptatem doloremque.</p>
                </div>
                <div class="movie">
                    <figure class="movie-poster"><img src="./assets/dummy/thumb-8.jpg" alt="#"></figure>
                    <div class="movie-title"><a href="afficherUnFilm.do?action=detailsFilm">The Colony</a></div>
                    <p>Sed ut perspiciatis unde omnis iste natus error voluptatem doloremque.</p>
                </div>
            </div> <!-- .movie-list -->

            <div class="pagination">
                <a href="#" class="page-number prev"><i class="fa fa-angle-left"></i></a>
                <span class="page-number current">1</span>
                <a href="#" class="page-number">2</a>
                <a href="#" class="page-number">3</a>
                <a href="#" class="page-number">4</a>
                <a href="#" class="page-number">5</a>
                <a href="#" class="page-number next"><i class="fa fa-angle-right"></i></a>
            </div>
        </div>
    </div> <!-- .container -->
</main>

<%@include file="footer.jsp" %>