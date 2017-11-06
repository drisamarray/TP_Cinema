/* 
    Servlet    : AjoutFilmProjection
    Created on : 2017-10-29, 18:58:03
    Author     : Dris & Francis
 */
package com.cinema.servlets.traitements;

import com.cinema.classes.Film;
import com.cinema.classes.Projection;
import com.cinema.jdbc.Connexion;
import com.cinema.jdbc.dao.implementation.FilmDao;
import com.cinema.jdbc.dao.implementation.ProjectionDao;
import com.cinema.services.Encodage;
import java.io.IOException;
import java.text.DateFormat;
import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
//import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@MultipartConfig
public class AjoutFilmProjection extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        if (session == null) {
            RequestDispatcher r = this.getServletContext().getRequestDispatcher("/WEB-INF/connexion.jsp");
            r.forward(request, response);
            return;
        }
        String newLine = System.getProperty("line.separator");
        String msg;
        //Les paramètres du formulaire
        String identifiant = (String) session.getAttribute("connecte"),
                cinema = request.getParameter("cinema"),
                titre = (String) request.getAttribute("titreFilm"),
                affiche = (String) request.getAttribute("affiche"),
                codeFilm = (String) request.getAttribute("codeFilm"),
                //affiche = titre + substring;
                realisateur = (String) request.getAttribute("realisateur"),
                acteurs = (String) request.getAttribute("acteurs"),
                description = request.getParameter("description"),
                numSalle = request.getParameter("numsalle"),
                lesgenres = "", lesseances = "";
        DateFormat dformat = new SimpleDateFormat("yyyy-mm-dd");
        Date dateDebut = new Date();
        Date dateFin = new Date();
        try {
            dateDebut = dformat.parse(request.getParameter("datedebut"));
            dateFin = dformat.parse(request.getParameter("datefin"));
        } catch (ParseException ex) {
            Logger.getLogger(AjoutFilmProjection.class.getName()).log(Level.SEVERE, null, ex);
            msg = "Format de date incorrect! Entrer une date au format AAAA-MM-JJ.";
            request.setAttribute("messageErrorFrmFilmProjection", msg);
            RequestDispatcher r = this.getServletContext().getRequestDispatcher("/WEB-INF/gestionnaireInfos.jsp");
            r.forward(request, response);
            return;
        }
        String du = dformat.format(dateDebut);
        String au = dformat.format(dateFin);
        //codefilm = titre+"-"+realisateur+"-"
        String[] genres = request.getParameterValues("genres");
        String[] seances = request.getParameterValues("seances");
        /*Random rand = new Random();
        int valeurAl = 1 + rand.nextInt(99);
        String codeFilm = titre+"-"+realisateur+"-"+acteurs+valeurAl;*/
        String codeProjection = codeFilm + "-" + numSalle + "-" + du + "-" + au;
        for (String genre : genres) {
            lesgenres += genre + " ";
        }
        for (String seance : seances) {
            lesseances += seance + " ";
        }

        //Validation formulaire au cas où il y aurait un probplème avec la validation faite côté client
        if (!(Encodage.isInteger(numSalle) && Integer.parseInt(numSalle) <= 100 && Integer.parseInt(numSalle) > 0)) {
            msg = "Le numéro de salles doit être un entier inclus entre 1 et 100";
            request.setAttribute("messageErrorFrmFilmProjection", msg);
            RequestDispatcher r = this.getServletContext().getRequestDispatcher("/WEB-INF/gestionnaireInfos.jsp");
            r.forward(request, response);
            return;
        }

        try {
            Class.forName(this.getServletContext().getInitParameter("piloteJdbc"));
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        }
        Connexion.setUrl(this.getServletContext().getInitParameter("urlBd"));
        FilmDao daoF = new FilmDao(Connexion.getInstance());
        ProjectionDao daoP = new ProjectionDao(Connexion.getInstance());
        Film film = daoF.read(codeFilm);
        if (film != null) {
            //Film existant
            msg = "Film avec le code \"" + codeFilm + "\" déja existant dans la base de données";
            request.setAttribute("messageErrorFrmFilmProjection", msg);
            RequestDispatcher r = this.getServletContext().getRequestDispatcher("/WEB-INF/gestionnaireInfos.jsp");
            r.forward(request, response);
            return;
        }
        Projection projection = daoP.read(codeProjection);
        if (projection != null) {
            //Film existant
            msg = "Projection avec le code \"" + codeProjection + "\" déja existante dans la base de données";
            request.setAttribute("messageErrorFrmFilmProjection", msg);
            RequestDispatcher r = this.getServletContext().getRequestDispatcher("/WEB-INF/gestionnaireInfos.jsp");
            r.forward(request, response);
            return;
        }

        film = new Film(codeFilm, lesgenres, titre, realisateur, acteurs, description, affiche);
        daoF.create(film);
        projection = new Projection(codeProjection, codeFilm, cinema, lesseances, Integer.parseInt(numSalle), du, au);
        daoP.create(projection);
        RequestDispatcher r = this.getServletContext().getRequestDispatcher("/WEB-INF/gestionnaireInfos.jsp");
        msg = "Nouveau Film créé" + newLine + "Nouvelle projection du " + du + "au" + au;
        request.setAttribute("messageConfirm", msg);
        r.forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
