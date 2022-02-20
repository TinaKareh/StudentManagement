/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

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
        Institution institution = facade.find(Long.parseLong(request.getParameter("institutionId")));
        List<InstitutionCourse> inst = institutionFacade.institutionCourses(institution);
        Student student = studentFacade.find(Long.parseLong(request.getParameter("studentId")));
        request.setAttribute("student", student);
        request.setAttribute("courses", inst);
        getServletContext()
                .getRequestDispatcher("/WEB-INF/student/edit_student.jsp")
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
        Student student = studentFacade.find(Long.parseLong(request.getParameter("student")));;
        String inst = request.getParameter("institution");
       // Course course = courseFacade.find(Long.parseLong(request.getParameter("course")));
        student.setFirstName(request.getParameter("fname"));
        student.setMiddleName(request.getParameter("lname"));
        student.setSurname(request.getParameter("uname"));
        student.setInstitution(facade.find(Long.parseLong(inst)));
        response.sendRedirect(request.getContextPath() + "/view/students");
        String text = "You have successfully edited the student details";
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(text);
        studentFacade.edit(student);
       

    }

}
