/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.AuthUser;
import Model.Institution;
import Service.CourseFacade;
import Service.InstitutionCourseFacade;
import Service.InstitutionFacade;
import java.io.IOException;
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
@WebServlet(name = "EditInstitutionController", urlPatterns = {"/edit/institution"})
public class EditInstitutionController extends HttpServlet {

    @EJB
    private CourseFacade courseFacade;
    @EJB
    private InstitutionFacade institutionFacade;
    @EJB
    private InstitutionCourseFacade facade;

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

            Institution institution = institutionFacade.find(Long.parseLong(request.getParameter("institutionId")));
            request.setAttribute("institution", institution);
            getServletContext()
                    .getRequestDispatcher("/WEB-INF/institution/edit_institution.jsp")
                    .forward(request, response);
        } catch (Exception x) {
        }
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
        try {
            Institution inst = new Institution();
            String institution = request.getParameter("institution");
            inst = institutionFacade.addInstitution(institution);
            if (inst == null) {
                Institution stitution = institutionFacade.find(Long.parseLong(request.getParameter("instId")));
                stitution.setInstitutionName(institution);
                institutionFacade.edit(stitution);
                response.sendRedirect(request.getContextPath() + "/view/institution?edited=1");
            } else {
                response.sendRedirect(request.getContextPath() + "/view/institution?edited=0");
            }
        } catch (Exception x) {
        }
    }

}
