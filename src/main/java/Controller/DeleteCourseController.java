/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.Course;
import Model.Student;
import Service.CourseFacade;
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
@WebServlet(name = "DeleteCourseController", urlPatterns = {"/delete/course"})
public class DeleteCourseController extends HttpServlet {

 @EJB
 private CourseFacade courseFacade;
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
         Course course = courseFacade.find(Long.parseLong(request.getParameter("institutionId")));
       
       List<Student> student = studentFacade.getStudentsByCourse(course);
       if(student == null){
          courseFacade.remove(course);
          response.sendRedirect(request.getContextPath() + "/view/course?deleted=1");
       }else{
           response.sendRedirect(request.getContextPath() + "/view/course?deleted=0");
       }
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
