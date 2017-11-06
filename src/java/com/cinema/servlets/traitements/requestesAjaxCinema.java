/* 
    Servlet    : Traitement de la req ajax
    Created on : 2017-10-29, 18:58:03
    Author     : Dris & Francis
 */

package com.cinema.servlets.traitements;

import com.cinema.jdbc.Connexion;
import com.cinema.jdbc.dao.implementation.CinemaDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class requestesAjaxCinema extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
        String  critere = request.getParameter("critere");
        String  data = request.getParameter("data");
        
        List<String> listeCinemas;
        int nbrSalles;
        listeCinemas = new ArrayList<>();
        try {
            Class.forName(this.getServletContext().getInitParameter("piloteJdbc"));
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        }
        Connexion.setUrl(this.getServletContext().getInitParameter("urlBd"));
        CinemaDao dao = new  CinemaDao(Connexion.getInstance());
        if("idGestionnaire".equalsIgnoreCase(data)) {
            /*HttpSession session = request.getSession();
            critere = (String)session.getAttribute("connecte");*/
            listeCinemas = dao.findByIDgestionnaire(critere);
            String reponseAjax = "<option disabled=\"null\" selected=\"null\">Cinéma de projection du film</option>";
            for(int i = 0; i<listeCinemas.size();i++)               
                reponseAjax += "<option value=\"" + listeCinemas.get(i) + "\">" + listeCinemas.get(i) + "</option>";
            response.setContentType("text/plain");
            response.getWriter().write('a'+reponseAjax);
         }
         if("nomCinema".equalsIgnoreCase(data)) {
            nbrSalles = dao.findByNomCine(critere);
            String reponseAjax = "<option disabled=\"null\" selected=\"null\">Numéro de salle</option>";
            for(int i = 1; i<=nbrSalles;i++)               
                reponseAjax += "<option value=\"" + i + "\">" + i + "</option>";
            response.setContentType("text/plain");
            response.getWriter().write('b'+reponseAjax);
        }
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
