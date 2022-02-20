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
@WebServlet(name = "AddCourseController", urlPatterns = {"/add/course"})
public class AddCourseController extends HttpServlet {

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
        Course course = new Course();
        String co = request.getParameter("name");
        course =courseFacade.addCourse(co);
        
        if(course == null){
            Course newCourse = new Course();
            newCourse.setCourseName(co);
            courseFacade.create(newCourse);
            response.sendRedirect(request.getContextPath() + "/view/course");
        }else{
            response.sendRedirect(request.getContextPath() + "/view/course");
        }
       
    }

  

}
