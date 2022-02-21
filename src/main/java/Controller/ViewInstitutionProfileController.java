/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.AuthUser;
import Model.Institution;
import Model.InstitutionCourse;
import Model.Student;
import Service.InstitutionCourseFacade;
import Service.InstitutionFacade;
import Service.StudentFacade;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
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
@WebServlet(name = "ViewInstitutionProfileController", urlPatterns = {"/view/institution/profile"})
public class ViewInstitutionProfileController extends HttpServlet {

   @EJB
   private InstitutionFacade institutionFacade;
   @EJB
   private InstitutionCourseFacade facade;
   @EJB
   private StudentFacade studentFacade;

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
        HttpServletRequest httpReq = (HttpServletRequest) request;
        HttpSession session = httpReq.getSession();
        
        AuthUser user = (AuthUser) session.getAttribute("user");
        request.setAttribute("user", user);
        
        Institution institution = institutionFacade.find(Long.parseLong(request.getParameter("institutionId")));
        List<InstitutionCourse> inst = facade.institutionCourses(institution);
        List<Student> student = studentFacade.institutionStudents(institution);
        request.setAttribute("institution", institution);
        request.setAttribute("addedCourses", inst);
        request.setAttribute("students", student);
        getServletContext()
                .getRequestDispatcher("/WEB-INF/institution/view_profile.jsp")
                .forward(request, response);
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
    }

  

}
