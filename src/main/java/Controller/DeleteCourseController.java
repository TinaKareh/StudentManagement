/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.Course;
import Model.Institution;
import Service.CourseFacade;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "DeleteCourseController", urlPatterns = {"/delete/course"})
public class DeleteCourseController extends HttpServlet {

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
          Course course = courseFacade.find(Long.parseLong(request.getParameter("institutionId")));
        courseFacade.remove(course);
        getServletContext()
                .getRequestDispatcher("/WEB-INF/institution/view_institutions.jsp")
                .forward(request, response);
    }

  

  

}
