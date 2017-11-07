/* 
    Servlet    : Charger des paramètres pour la première utilisation
    Created on : 2017-10-29, 18:58:03
    Author     : Dris & Francis
 */

package com.cinema.servlets.traitements;

import com.cinema.classes.Film;
import com.cinema.jdbc.Connexion;
import com.cinema.jdbc.dao.implementation.FilmDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Chargement extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            try {
            Class.forName(this.getServletContext().getInitParameter("piloteJdbc"));
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        }
        Connexion.setUrl(this.getServletContext().getInitParameter("urlBd"));
        
        //Récupérer les trois mois en cours : mois courant suivant et d'après        
      // DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
      // Date date = new Date();
       Calendar calendar = Calendar.getInstance();
       int moisCourant = calendar.get(Calendar.MONTH) + 1;
        List<String> lesTroisMoisEnCours = new LinkedList<>();
        String temp = "";
        for(int i =1; i <= 3; i++){
            switch (moisCourant){
                case 1 :
                case 13 :
                    temp = "Janvier";
                break;
                case 2 :
                case 14 :
                    temp = "Février";
                break;
                case 3 :
                    temp = "Mars";
                break;
                case 4 :
                    temp = "Avril";
                break;
                case 5 :
                    temp = "Mai";
                break;
                case 6 :
                    temp = "Juin";
                break;
                case 7 :
                    temp = "Juillet";
                break;
                case 8 :
                    temp = "Août";
                break;
                case 9 :
                    temp = "Septembre";
                break;
                case 10 :
                    temp = "Octobre";
                break;
                case 11 :
                    temp = "Novembre";
                break;
                case 12 :
                    temp = "Décembre";
                break;
            }
            lesTroisMoisEnCours.add(temp);
            moisCourant++;
        }  
       
        FilmDao dao = new FilmDao(Connexion.getInstance());
        List<Film> lesFilms = new LinkedList<>();
        lesFilms = dao.findFilmsProjetes();
        HttpSession session = request.getSession(true);
        session.setAttribute("lesFilms", lesFilms);
        request.setAttribute("lesTroisMoisEnCours",lesTroisMoisEnCours);
        RequestDispatcher r = this.getServletContext().getRequestDispatcher("/WEB-INF/accueil.jsp");
        r.forward(request, response);
        return;
        }
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
