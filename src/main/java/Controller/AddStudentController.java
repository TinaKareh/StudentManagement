/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.Student;
import Service.CourseFacade;
import Service.InstitutionCourseFacade;
import Service.InstitutionFacade;
import Service.StudentFacade;
import java.io.IOException;
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
    private InstitutionCourseFacade institutionFacade;
    @EJB
    private InstitutionFacade facade;
    @EJB
    private CourseFacade courseFacade;

    


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
       try{ 
        Student student = new Student();
        String inst = request.getParameter("institution");
        String course = request.getParameter("course");
        student.setFirstName(request.getParameter("fname"));
        student.setMiddleName(request.getParameter("lname"));
        student.setSurname(request.getParameter("uname"));
        student.setStudentIndentification(request.getParameter("email"));
        student.setInstitution(facade.find(Long.parseLong(inst)));
        student.setCourse(courseFacade.find(Long.parseLong(course)));
        studentFacade.create(student);
        response.sendRedirect(request.getContextPath() + "/view/students?success=1");
    } catch (Exception x) {
        }
    }
}
