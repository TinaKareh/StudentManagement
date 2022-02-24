/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.AuthUser;
import Model.Course;
import Model.Institution;
import Model.InstitutionCourse;
import Model.Student;
import Service.CourseFacade;
import Service.InstitutionCourseFacade;
import Service.InstitutionFacade;
import Service.StudentFacade;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
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
@WebServlet(name = "EditStudentController", urlPatterns = {"/edit/student"})
public class EditStudentController extends HttpServlet {

    @EJB
    private InstitutionFacade facade;
    @EJB
    private InstitutionCourseFacade institutionFacade;
    @EJB
    private StudentFacade studentFacade;
    @EJB
    private CourseFacade courseFacade;

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

            Institution institution = facade.find(Long.parseLong(request.getParameter("institutionId")));
            List<InstitutionCourse> inst = institutionFacade.getCoursesByInstitution(institution);

            Student student = studentFacade.find(Long.parseLong(request.getParameter("studentId")));

            request.setAttribute("student", student);
            request.setAttribute("courses", inst);
            request.setAttribute("institutions", facade.findAll());
            getServletContext()
                    .getRequestDispatcher("/WEB-INF/student/edit_student.jsp")
                    .forward(request, response);
        } catch (Exception x) {
        }
    }
    private static final Logger LOG = Logger.getLogger(EditStudentController.class.getName());

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
            Student student = studentFacade.find(Long.parseLong(request.getParameter("student")));
            Institution inst = facade.find(Long.parseLong(request.getParameter("inst")));
            Course course = courseFacade.find(Long.parseLong(request.getParameter("course")));

            student.setFirstName(request.getParameter("fname"));
            student.setMiddleName(request.getParameter("lname"));
            student.setSurname(request.getParameter("uname"));
            student.setInstitution(inst);
            student.setCourse(course);
            studentFacade.edit(student);

            response.sendRedirect(request.getContextPath() + "/view/students?edited=1");

        } catch (Exception x) {
        }
    }

}
