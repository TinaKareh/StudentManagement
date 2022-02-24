/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.AuthUser;
import Model.Course;
import Model.InstitutionCourse;
import Service.CourseFacade;
import Service.InstitutionCourseFacade;
import Service.InstitutionFacade;
import Service.StudentFacade;
import java.io.IOException;
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
@WebServlet(name = "ViewCourseProfileController", urlPatterns = {"/view/course/profile"})
public class ViewCourseProfileController extends HttpServlet {

    @EJB
    private CourseFacade courseFacade;
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
        try {
            HttpServletRequest httpReq = (HttpServletRequest) request;
            HttpSession session = httpReq.getSession();

            AuthUser user = (AuthUser) session.getAttribute("user");
            request.setAttribute("user", user);

            Course course = courseFacade.find(Long.parseLong(request.getParameter("institutionId")));
            List<InstitutionCourse> inst = facade.getInstitutionsByCourse(course);
            //List<Student> student = studentFacade.getStudentsByCourse(course);
            request.setAttribute("course", course);
            request.setAttribute("institutions", inst);
            //request.setAttribute("students", student);
            getServletContext()
                    .getRequestDispatcher("/WEB-INF/course/view_profile.jsp")
                    .forward(request, response);
        } catch (Exception x) {
        }
    }

}
