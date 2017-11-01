/* 
    Servlet    : Controlleur frontal
    Created on : 2017-10-29, 19:01:15
    Author     : Dris & Francis
*/

package com.cinema.servlets.controler;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ControleurFrontal extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action != null) {
            if ("signup".equals(action)) {
                RequestDispatcher r = this.getServletContext().getRequestDispatcher("/inscription");  //redirection vers la servlet Signup
                r.forward(request, response);
                return;
            }
            if ("login".equals(action)) {
                RequestDispatcher r = this.getServletContext().getRequestDispatcher("/connexion");  //redirection vers la servlet Login
                r.forward(request, response);
                return;
            }
            if ("logout".equals(action)) {
                RequestDispatcher r = this.getServletContext().getRequestDispatcher("/deconnexion");  //redirection vers la servlet Logout
                r.forward(request, response);
                return;
            }
            if ("update".equals(action)) {
                RequestDispatcher r = this.getServletContext().getRequestDispatcher("/modifierProfilGestionnaire");  //redirection vers la servlet AjoutCinema
                r.forward(request, response);
                return;
            }
            if ("formulairesCnx".equals(action)) {
                RequestDispatcher r = this.getServletContext().getRequestDispatcher("/connexion.jsp");
                r.forward(request, response);
            }
            if ("formulaireGestion".equals(action)) {
                RequestDispatcher r = this.getServletContext().getRequestDispatcher("/gestionnaire");
                r.forward(request, response);
            }
            if ("ajoutCinema".equals(action)) {
                RequestDispatcher r = this.getServletContext().getRequestDispatcher("/ajoutCinema");
                r.forward(request, response);
            }
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
