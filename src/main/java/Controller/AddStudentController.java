/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.Student;
import Model.Course;
import Model.Institution;
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
@WebServlet(name = "AddStudentController", urlPatterns = {"/add/student"})
public class AddStudentController extends HttpServlet {

    @EJB
    private StudentFacade studentFacade;
    @EJB
    private InstitutionFacade institutionFacade;

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
        List institutions = institutionFacade.findAll();
        request.setAttribute("institution", institutions);
        request.getRequestDispatcher("/WEB-INF/student/add_student.jsp").forward(request, response);
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
        Course course = (Course) request.getAttribute("");
        Institution inst = (Institution) request.getAttribute("institution");
        Student student = new Student();
        student.setFirstName(request.getParameter(""));
        student.setMiddleName(request.getParameter(""));
        student.setSurname(request.getParameter(""));
        student.setStudentIndentification(request.getParameter(""));
        student.setInstitution(inst);
        student.setCourse(course);

        studentFacade.create(student);
         response.sendRedirect("/view/students");
    }

}
