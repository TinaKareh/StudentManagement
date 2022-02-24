/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Service.InstitutionFacade;
import java.io.IOException;
import Model.Institution;
import static java.lang.System.out;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Futuristic Ltd
 */
@WebServlet(name = "AddInstitutionController", urlPatterns = {"/add/institution"})
public class AddInstitutionController extends HttpServlet {

    @EJB
    private InstitutionFacade institutionFacade;

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
                Institution stitution = new Institution();
                stitution.setInstitutionName(institution);
                institutionFacade.create(stitution);
                response.sendRedirect(request.getContextPath() + "/view/institution?success=1");
            } else {
                response.sendRedirect(request.getContextPath() + "/view/institution?success=0");
            }
        } catch (Exception x) {
        }
    }
}
