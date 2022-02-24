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
@WebServlet(name = "RegisterUserController", urlPatterns = {"/register/user"})
public class RegisterUserController extends HttpServlet {

    @EJB
    private StudentFacade studentFacade;
    @EJB
    private InstitutionCourseFacade institutionFacade;
    @EJB
    private InstitutionFacade facade;

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
            try (PrintWriter out = response.getWriter()) {
                Institution inst = facade.find(Long.parseLong(request.getParameter("id")));
                List<InstitutionCourse> courses = institutionFacade.getCoursesByInstitution(inst);
                Gson json = new Gson();
                String courseList = json.toJson(courses);
                response.setContentType("text/html");
                response.getWriter().write(courseList);
            }
        } catch (Exception x) {
        }
    }

}
