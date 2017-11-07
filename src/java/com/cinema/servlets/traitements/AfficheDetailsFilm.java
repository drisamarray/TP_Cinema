/* 
    Servlet    : Affiche les détails d'un seul film
    Created on : 2017-10-29, 19:01:15
    Author     : Dris & Francis
 */
package com.cinema.servlets.traitements;

import com.cinema.classes.Film;
import com.cinema.classes.Projection;
import com.cinema.jdbc.Connexion;
import com.cinema.jdbc.dao.implementation.FilmDao;
import com.cinema.jdbc.dao.implementation.ProjectionDao;
import java.io.IOException;
import java.io.PrintWriter;
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

public class AfficheDetailsFilm extends HttpServlet {

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
            
            //récupérer le film
            String codeFilm = request.getParameter("codeFilm");           
            FilmDao daoF = new FilmDao(Connexion.getInstance());
            Film filmSectionne = daoF.read(codeFilm);
            request.setAttribute("leFilm", filmSectionne);
            
            //récupérer les projections du films          
            ProjectionDao daoP = new ProjectionDao(Connexion.getInstance());        
            List<Projection> lesProjections = new LinkedList<>();
            lesProjections = daoP.findByCodeFilm(codeFilm);
            request.setAttribute("lesProjections", lesProjections);
            RequestDispatcher r = this.getServletContext().getRequestDispatcher("/WEB-INF/single.jsp");
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
