/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.Institution;
import Model.InstitutionCourse;
import Service.InstitutionCourseFacade;
import Service.InstitutionFacade;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "DeleteInstitutionController", urlPatterns = {"/delete/institution"})
public class DeleteInstitutionController extends HttpServlet {

    @EJB
    private InstitutionFacade institutionFacade;
    @EJB
    private InstitutionCourseFacade facade;

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
        Institution institution = institutionFacade.find(Long.parseLong(request.getParameter("institutionId")));
        List<InstitutionCourse> inst = facade.institutionCourses(institution);
        if (inst == null) {
            institutionFacade.remove(institution);
            response.sendRedirect(request.getContextPath() + "/view/institution");
        } else {
            request.getRequestDispatcher("/WEB-INF/institution/view_institutions.jsp").forward(request, response);
        }
    }

    

}


