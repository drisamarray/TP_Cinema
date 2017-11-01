/* 
    Servlet    : AjoutCinema
    Created on : 2017-10-29, 18:58:03
    Author     : Dris & Francis
 */

package com.cinema.servlets.traitements;

import com.cinema.entites. Cinema;
import com.cinema.jdbc.Connexion;
import com.cinema.jdbc.dao.implementation. CinemaDao;
import com.cinema.services.Encodage;
import java.io.IOException;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AjoutCinema extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        if (session == null)
        {
            RequestDispatcher r = this.getServletContext().getRequestDispatcher("/connexion.jsp");
            r.forward(request, response);
            return;  
        }
        String msg;
        boolean valide = true;
        //Les paramètres du formulaire
        String  identifiant = (String)session.getAttribute("connecte"),
                nomCinema = request.getParameter("nomCinema"),
                ville = request.getParameter("ville"),
                nbrSalles = request.getParameter("nbrSalles");
        Random rand = new Random();
        int valeurAl = 1 + rand.nextInt(99);
        String idcinema = identifiant+"-"+nomCinema+"-"+valeurAl;

        //Validation formulaire au cas où il y aurait un probplème avec la validation faite côté client
        if (identifiant == null || nomCinema.trim().equalsIgnoreCase("")
            || ville.trim().equalsIgnoreCase("")
            || nbrSalles.trim().equalsIgnoreCase("")) {
            msg = "Un ou plusieurs champs n'ont pas été ou ont été mal rensignés";
            request.setAttribute("messageErrorFrmCine", msg);
            valide = false;
        }
        
        if (!(Encodage.isInteger(nbrSalles) && Integer.parseInt(nbrSalles) <= 100 && Integer.parseInt(nbrSalles) >0 ))
        {
            msg = "Le nombre de salles doit être un entier inclus entre 1 et 100";
            request.setAttribute("messageErrorFrmCine", msg);
            valide = false;
        }

        if (!valide) {
            RequestDispatcher r = this.getServletContext().getRequestDispatcher("/gestionnaire.jsp");
            r.forward(request, response);
            return;
        }

        try {
            Class.forName(this.getServletContext().getInitParameter("piloteJdbc"));
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        }
        Connexion.setUrl(this.getServletContext().getInitParameter("urlBd"));
        CinemaDao dao = new  CinemaDao(Connexion.getInstance());
        Cinema cinema = dao.read(idcinema);
        if (cinema != null) {
            //Utilisateur inexistant
            msg = "Cinema avec le code \"" + idcinema + "\" déja existant dans la base de données";
            request.setAttribute("messageErrorFrmCine", msg );
            RequestDispatcher r = this.getServletContext().getRequestDispatcher("/gestionnaire.jsp");
            r.forward(request, response);
            return;
        }
        //connexion OK Integer.parseInt(nbrSalles
        cinema = new  Cinema(idcinema, identifiant, nomCinema, ville, Integer.parseInt(nbrSalles));
        dao.create(cinema);
        RequestDispatcher r = this.getServletContext().getRequestDispatcher("/gestionnaire.jsp");
        msg = "Nouveau Cinéma créé avec le code : " + idcinema;
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
