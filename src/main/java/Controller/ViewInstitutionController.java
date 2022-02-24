/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.AuthUser;
import Service.AuthUserFacade;
import Service.InstitutionFacade;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Futuristic Ltd
 */
@WebServlet(name = "ViewInstitutionController", urlPatterns = {"/view/institution"})
public class ViewInstitutionController extends HttpServlet {

    @EJB
    private InstitutionFacade institutionFacade;
    @EJB
    private AuthUserFacade authFacade;

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
        try {
            HttpServletRequest httpReq = (HttpServletRequest) request;
            HttpSession session = httpReq.getSession();

            AuthUser user = (AuthUser) session.getAttribute("user");
            request.setAttribute("user", user);

            LOG.log(Level.INFO, String.valueOf(institutionFacade.findAll().size()));
            request.setAttribute("institutions", institutionFacade.findAll());

            getServletContext()
                    .getRequestDispatcher("/WEB-INF/institution/view_institutions.jsp")
                    .forward(request, response);
        } catch (Exception x) {
        }
    }
    private static final Logger LOG = Logger.getLogger(ViewInstitutionController.class.getName());

}
