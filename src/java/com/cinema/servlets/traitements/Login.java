/* 
    Servlet    : Login
    Created on : 2017-10-29, 19:01:15
    Author     : Dris & Francis
 */
package com.cinema.servlets.traitements;

import com.cinema.classes.User;
import com.cinema.jdbc.Connexion;
import com.cinema.jdbc.dao.implementation.UserDao;
import static com.cinema.services.Encodage.testPassword;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Login extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String identifiant = request.getParameter("identifiant"),
                motdepasse = request.getParameter("motdepasse");
        if (identifiant == null || identifiant.trim().equalsIgnoreCase("")) {
            //Utilisateur inexistant
            request.setAttribute("messageError", "identifiant obligatoire");
            RequestDispatcher r = this.getServletContext().getRequestDispatcher("/WEB-INF/connexion.jsp");
            r.forward(request, response);
            return;
        }

        try {
            Class.forName(this.getServletContext().getInitParameter("piloteJdbc"));
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        }

        Connexion.setUrl(this.getServletContext().getInitParameter("urlBd"));
        UserDao dao = new UserDao(Connexion.getInstance());
        User user = dao.read(identifiant);

        if (user == null) {
            //Utilisateur inexistant
            request.setAttribute("messageErrorCnx", "Utilisateur avec identifiant \"" + identifiant + "\" inexistant.");
            //response.sendRedirect("login.jsp");Ne fonctionne pas correctement (ie. perd le message d'erreur).
            RequestDispatcher r = this.getServletContext().getRequestDispatcher("/WEB-INF/connexion.jsp");
            r.forward(request, response);
        } else if (!testPassword(motdepasse, user.getMotdepasse())) {
            //Mot de passe incorrect
            request.setAttribute("messageError", "Mot de passe incorrect.");
            RequestDispatcher r = this.getServletContext().getRequestDispatcher("/WEB-INF/connexion.jsp");
            r.forward(request, response);
        } else {
            //connexion OK
            HttpSession session = request.getSession(true);
            session.setAttribute("connecte", identifiant);
            //String pathAffiche = this.getServletContext().getRealPath("")+"/assets/dummy";
            //session.setAttribute("pathAffiche", pathAffiche);
            session.setAttribute("typeUser", user.getType());
            RequestDispatcher r = this.getServletContext().getRequestDispatcher("/index.jsp");
            r.forward(request, response);
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
