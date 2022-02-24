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
import com.google.gson.Gson;
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
@WebServlet(name = "TransferStudentController", urlPatterns = {"/transfer/student"})
public class TransferStudentController extends HttpServlet {

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
        try {
            Student student = studentFacade.find(Long.parseLong(request.getParameter("student")));
            Institution inst = facade.find(Long.parseLong(request.getParameter("stitution")));
            Course course = courseFacade.find(Long.parseLong(request.getParameter("uni")));

            student.setInstitution(inst);
            student.setCourse(course);
            studentFacade.edit(student);

            response.sendRedirect(request.getContextPath() + "/view/students?transfer=1");
        } catch (Exception x) {
        }
    }

}
