/* 
    Servlet    : Signup inscription des users
    Created on : 2017-10-29, 18:58:03
    Author     : Dris & Francis
 */
package com.cinema.servlets.traitements;

import com.cinema.classes.User;
import com.cinema.jdbc.Connexion;
import com.cinema.jdbc.dao.implementation.UserDao;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Signup extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String msg;
        boolean valide = true;
        //Les paramètres du formulaire
        String identifiant = request.getParameter("identifiant"),
                motdepasse = request.getParameter("motdepasse"),
                nom = request.getParameter("nom"),
                prenom = request.getParameter("prenom"),
                courriel = request.getParameter("courriel"),
                tel = request.getParameter("tel"),
                type = request.getParameter("type");

        //Validation formulaire au cas où il y aurait un probplème avec la validation faite côté client
        if (identifiant == null || identifiant.trim().equalsIgnoreCase("")
                || motdepasse.trim().equalsIgnoreCase("")
                || nom.trim().equalsIgnoreCase("")
                || prenom.trim().equalsIgnoreCase("")
                || courriel.trim().equalsIgnoreCase("")
                || type.trim().equalsIgnoreCase("")) {
            msg = "Un ou plusieurs champs n'ont pas été rensignés";
            request.setAttribute("messageError", msg);
            valide = false;
        }
        if (!type.trim().equalsIgnoreCase("visiteur") && !type.trim().equalsIgnoreCase("gestionnaire")) {
            msg = "Renseignez le type de compte correctement : écrivez visiteur ou gestionnaire";
            request.setAttribute("messageError", msg);
            valide = false;
        }

        if (!valide) {
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
        if (user != null) {
            //Utilisateur inexistant
            msg = "Utilisateur avec identifiant \"" + identifiant + "\" déja existant. Choisir un autre identifiant";
            request.setAttribute("messageError", msg);
            RequestDispatcher r = this.getServletContext().getRequestDispatcher("/WEB-INF/connexion.jsp");
            r.forward(request, response);
            return;
        }
        //connexion OK
        user = new User(identifiant, motdepasse, nom, prenom, courriel, tel, type);
        dao.create(user);
        HttpSession session = request.getSession(true);
        session.setAttribute("connecte", identifiant);
        session.setAttribute("typeUser", type);
        RequestDispatcher r = this.getServletContext().getRequestDispatcher("/index.jsp");
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
