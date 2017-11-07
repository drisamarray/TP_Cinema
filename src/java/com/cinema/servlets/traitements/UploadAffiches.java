/* 
    Servlet    : Signup inscription des users
    Created on : 2017-10-29, 18:58:03
    Author     : Dris & Francis
 */

package com.cinema.servlets.traitements;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
//import java.util.Random;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig
public class UploadAffiches extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String titre = request.getParameter("titreFilm"),
                realisateur = request.getParameter("realisateur"),
                acteurs = request.getParameter("acteurs");
        //Random rand = new Random();
        //int valeurAl = 1 + rand.nextInt(99);
        String codeFilm = titre.trim() + "-" + realisateur.trim() + "-" + acteurs.trim();// + valeurAl;

        final PrintWriter writer = response.getWriter();
        final Part filePart = request.getPart("imageaffiche");
        String path = this.getServletContext().getRealPath("") + "/assets/dummy";
        final String fileName = getFileName(filePart, codeFilm);

        OutputStream out = null;
        InputStream filecontent = null;

        try {
            out = new FileOutputStream(new File(path + File.separator + fileName));

            filecontent = filePart.getInputStream();

            int nbOctetsLus = 0;
            final byte[] bytes = new byte[1024];

            while ((nbOctetsLus = filecontent.read(bytes)) != -1) {
                out.write(bytes, 0, nbOctetsLus);
            }
            request.setAttribute("affiche", fileName);
            request.setAttribute("codeFilm", codeFilm);
            request.setAttribute("titreFilm", titre);
            request.setAttribute("realisateur", realisateur);
            request.setAttribute("acteurs", acteurs);
            RequestDispatcher r = this.getServletContext().getRequestDispatcher("/ajoutFilmProjection");
            r.forward(request, response);
            //writer.println("Nouveau fichier " + fileName + " dans " + path);

        } catch (FileNotFoundException fne) {
            writer.println("<br/> ERREUR: " + fne.getMessage());

        } finally {
            if (out != null) {
                out.close();
            }
            if (filecontent != null) {
                filecontent.close();
            }
            if (writer != null) {
                writer.close();
            }

        }
    }

    private String getFileName(final Part part, String p_codeFilm) {
        System.out.println(part.getHeader("content-disposition"));
        String[] t = part.getHeader("content-disposition").split(";");
        for (String content : t) {
            if (content.trim().startsWith("filename")) {
                String s = content.substring(content.indexOf('=') + 1).trim();
                s = s.substring(s.lastIndexOf(File.separator) + 1).replace("\"", "");
                s = p_codeFilm + s.substring(s.lastIndexOf("."));
                return s;
            }
        }
        return null;
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
